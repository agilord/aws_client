import 'dart:math';

import 'package:aws_client/src/shared/src/credentials.dart';
import 'package:aws_client/src/shared/src/protocol/endpoint.dart';
import 'package:aws_client/src/shared/src/protocol/json.dart';
import 'package:aws_client/src/shared/src/protocol/query.dart';
import 'package:aws_client/src/shared/src/protocol/retry.dart';
import 'package:aws_client/src/shared/src/protocol/shared.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

RetryOptions _noSleep({
  int maxAttempts = 3,
  List<Duration>? delays,
}) =>
    RetryOptions(
      maxAttempts: maxAttempts,
      sleeper: (d) async => delays?.add(d),
    );

GenericAwsException _awsError({
  String code = 'ServerError',
  int? statusCode,
  Duration? retryAfter,
}) =>
    GenericAwsException(code: code)
      ..statusCode = statusCode
      ..retryAfter = retryAfter;

void main() {
  group('sendWithRetry', () {
    test('returns immediately on success', () async {
      var attempts = 0;
      final rs = await sendWithRetry(
        options: _noSleep(),
        attempt: () async {
          attempts++;
          return 'ok';
        },
      );

      expect(attempts, 1);
      expect(rs, 'ok');
    });

    test('retries a retryable status then succeeds', () async {
      var attempts = 0;
      final delays = <Duration>[];
      final rs = await sendWithRetry(
        options: _noSleep(delays: delays),
        attempt: () async {
          attempts++;
          if (attempts == 1) throw _awsError(statusCode: 500);
          return 'ok';
        },
      );

      expect(attempts, 2);
      expect(delays, hasLength(1));
      expect(rs, 'ok');
    });

    test('retries a throttling error code then succeeds', () async {
      var attempts = 0;
      final rs = await sendWithRetry(
        options: _noSleep(),
        attempt: () async {
          attempts++;
          if (attempts == 1) {
            throw _awsError(code: 'ThrottlingException', statusCode: 400);
          }
          return 'ok';
        },
      );

      expect(attempts, 2);
      expect(rs, 'ok');
    });

    test('does not retry a non-retryable AWS error', () async {
      var attempts = 0;

      await expectLater(
        sendWithRetry(
          options: _noSleep(),
          attempt: () async {
            attempts++;
            throw _awsError(code: 'ValidationException', statusCode: 400);
          },
        ),
        throwsA(isA<GenericAwsException>()),
      );
      expect(attempts, 1, reason: 'validation errors are terminal');
    });

    test('gives up after maxAttempts and rethrows the last error', () async {
      var attempts = 0;
      final delays = <Duration>[];

      await expectLater(
        sendWithRetry(
          options: _noSleep(maxAttempts: 3, delays: delays),
          attempt: () async {
            attempts++;
            throw _awsError(statusCode: 503);
          },
        ),
        throwsA(isA<GenericAwsException>()),
      );

      expect(attempts, 3);
      expect(delays, hasLength(2), reason: 'one delay between each attempt');
    });

    test('retries a transport error then succeeds', () async {
      var attempts = 0;
      final rs = await sendWithRetry(
        options: _noSleep(),
        attempt: () async {
          attempts++;
          if (attempts == 1) throw ClientException('connection reset');
          return 'ok';
        },
      );

      expect(attempts, 2);
      expect(rs, 'ok');
    });

    test('rethrows a transport error on the last attempt', () async {
      var attempts = 0;

      await expectLater(
        sendWithRetry(
          options: _noSleep(maxAttempts: 2),
          attempt: () async {
            attempts++;
            throw ClientException('connection reset');
          },
        ),
        throwsA(isA<ClientException>()),
      );
      expect(attempts, 2);
    });

    test('maxAttempts: 1 disables retrying', () async {
      var attempts = 0;

      await expectLater(
        sendWithRetry(
          options: RetryOptions.disabled(),
          attempt: () async {
            attempts++;
            throw _awsError(statusCode: 500);
          },
        ),
        throwsA(isA<GenericAwsException>()),
      );
      expect(attempts, 1);
    });

    test('does not retry an unrelated error', () async {
      var attempts = 0;

      await expectLater(
        sendWithRetry(
          options: _noSleep(),
          attempt: () async {
            attempts++;
            throw StateError('no credentials');
          },
        ),
        throwsA(isA<StateError>()),
      );
      expect(attempts, 1, reason: 'only AWS and transport errors are retried');
    });

    test('honors a Retry-After on the exception', () async {
      var attempts = 0;
      final delays = <Duration>[];

      await sendWithRetry(
        options: _noSleep(delays: delays),
        attempt: () async {
          attempts++;
          if (attempts == 1) {
            throw _awsError(
                statusCode: 503, retryAfter: const Duration(seconds: 2));
          }
          return 'ok';
        },
      );

      expect(delays.single, const Duration(seconds: 2));
    });
  });

  group('RetryOptions.backoffFor', () {
    test('full-jitter delay stays within the exponential cap', () {
      final options = RetryOptions(
        baseDelay: const Duration(milliseconds: 100),
        random: Random(1),
      );
      for (var attempt = 0; attempt < 5; attempt++) {
        final cap = 100 * pow(2, attempt);
        for (var i = 0; i < 50; i++) {
          final delay = options.backoffFor(attempt);
          expect(delay.inMilliseconds, inInclusiveRange(0, cap));
        }
      }
    });

    test('backoff is capped by maxBackoff', () {
      final options = RetryOptions(
        baseDelay: const Duration(seconds: 1),
        maxBackoff: const Duration(seconds: 5),
        random: Random(1),
      );
      for (var i = 0; i < 100; i++) {
        expect(options.backoffFor(20).inMilliseconds, lessThanOrEqualTo(5000));
      }
    });

    test('a Retry-After is clamped to maxBackoff', () {
      final options = RetryOptions(maxBackoff: const Duration(seconds: 5));
      expect(options.backoffFor(0, retryAfter: const Duration(seconds: 30)),
          const Duration(seconds: 5));
    });
  });

  group('protocol integration', () {
    test('JsonProtocol retries a 500 and returns the parsed body', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response('{}', 500)
            : Response('{"value":"ok"}', 200);
      });

      final protocol = JsonProtocol(
        client: client,
        service: ServiceMetadata(endpointPrefix: 'test'),
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: 'ak', secretKey: 'sk'),
        retryOptions: _noSleep(),
      );

      final rs = await protocol.send(
        method: 'POST',
        requestUri: '/',
        exceptionFnMap: const {},
        payload: const {},
      );

      expect(attempts, 2);
      expect(rs.body['value'], 'ok');
    });

    test('JsonProtocol retries throttling reported via JSON __type', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response('{"__type":"ThrottlingException"}', 400)
            : Response('{"value":"ok"}', 200);
      });

      final protocol = JsonProtocol(
        client: client,
        service: ServiceMetadata(endpointPrefix: 'test'),
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: 'ak', secretKey: 'sk'),
        retryOptions: _noSleep(),
      );

      final rs = await protocol.send(
        method: 'POST',
        requestUri: '/',
        exceptionFnMap: const {},
        payload: const {},
      );

      expect(attempts, 2);
      expect(rs.body['value'], 'ok');
    });

    test('QueryProtocol retries throttling reported via XML <Code>', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response(
                '<ErrorResponse><Error><Code>Throttling</Code></Error></ErrorResponse>',
                400)
            : Response('<DoResponse/>', 200);
      });

      final protocol = QueryProtocol(
        client: client,
        service: ServiceMetadata(endpointPrefix: 'test'),
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: 'ak', secretKey: 'sk'),
        retryOptions: _noSleep(),
      );

      final elem = await protocol.send(
        const {},
        method: 'POST',
        requestUri: '/',
        exceptionFnMap: const {},
        version: '2011-01-01',
        action: 'Do',
      );

      expect(attempts, 2);
      expect(elem.name.local, 'DoResponse');
    });
  });
}
