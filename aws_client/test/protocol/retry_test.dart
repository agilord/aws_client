import 'dart:math';

import 'package:aws_client/src/shared/src/credentials.dart';
import 'package:aws_client/src/shared/src/protocol/endpoint.dart';
import 'package:aws_client/src/shared/src/protocol/json.dart';
import 'package:aws_client/src/shared/src/protocol/retry.dart';
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

Future<Request> Function() _counting(List<Request> built,
        {Request Function()? build}) =>
    () async {
      final rq = (build ?? () => Request('POST', Uri.parse('https://x/')))();
      built.add(rq);
      return rq;
    };

void main() {
  group('sendWithRetry', () {
    test('returns immediately on success', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return Response('ok', 200);
      });
      final built = <Request>[];

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(built),
      );

      expect(attempts, 1);
      expect(built, hasLength(1));
      expect(rs.statusCode, 200);
      expect(await rs.stream.bytesToString(), 'ok');
    });

    test('retries a 500 then succeeds, rebuilding the request each attempt',
        () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1 ? Response('boom', 500) : Response('ok', 200);
      });
      final built = <Request>[];
      final delays = <Duration>[];

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(delays: delays),
        buildRequest: _counting(built),
      );

      expect(attempts, 2);
      expect(built, hasLength(2),
          reason: 'request is rebuilt/re-signed per attempt');
      expect(delays, hasLength(1));
      expect(rs.statusCode, 200);
      expect(await rs.stream.bytesToString(), 'ok');
    });

    test('retries throttling reported via JSON __type', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response('{"__type":"ThrottlingException"}', 400)
            : Response('{}', 200);
      });

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 2);
      expect(rs.statusCode, 200);
    });

    test('retries throttling reported via x-amzn-errortype header', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response('', 400,
                headers: {'x-amzn-errortype': 'TooManyRequestsException:foo'})
            : Response('{}', 200);
      });

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 2);
      expect(rs.statusCode, 200);
    });

    test('retries throttling reported via XML <Code>', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response(
                '<ErrorResponse><Error><Code>Throttling</Code></Error></ErrorResponse>',
                400)
            : Response('<ok/>', 200);
      });

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 2);
      expect(rs.statusCode, 200);
    });

    test('does not retry a non-retryable 4xx', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return Response('{"__type":"ValidationException"}', 400);
      });

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 1, reason: 'validation errors are terminal');
      expect(rs.statusCode, 400);
    });

    test('gives up after maxAttempts and returns the last response', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return Response('still bad', 503);
      });
      final delays = <Duration>[];

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(maxAttempts: 3, delays: delays),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 3);
      expect(delays, hasLength(2), reason: 'one delay between each attempt');
      expect(rs.statusCode, 503);
    });

    test('retries a transport error then succeeds', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        if (attempts == 1) throw ClientException('connection reset');
        return Response('ok', 200);
      });

      final rs = await sendWithRetry(
        client: client,
        options: _noSleep(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 2);
      expect(rs.statusCode, 200);
    });

    test('rethrows a transport error on the last attempt', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        throw ClientException('connection reset');
      });

      await expectLater(
        sendWithRetry(
          client: client,
          options: _noSleep(maxAttempts: 2),
          buildRequest: _counting(<Request>[]),
        ),
        throwsA(isA<ClientException>()),
      );
      expect(attempts, 2);
    });

    test('maxAttempts: 1 disables retrying', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return Response('boom', 500);
      });

      final rs = await sendWithRetry(
        client: client,
        options: RetryOptions.disabled(),
        buildRequest: _counting(<Request>[]),
      );

      expect(attempts, 1);
      expect(rs.statusCode, 500);
    });

    test('does not retry a builder error', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return Response('ok', 200);
      });

      await expectLater(
        sendWithRetry(
          client: client,
          options: _noSleep(),
          buildRequest: () async => throw StateError('no credentials'),
        ),
        throwsA(isA<StateError>()),
      );
      expect(attempts, 0, reason: 'the request was never sent');
    });

    test('honors a Retry-After header in seconds', () async {
      var attempts = 0;
      final client = MockClient((rq) async {
        attempts++;
        return attempts == 1
            ? Response('', 503, headers: {'retry-after': '2'})
            : Response('ok', 200);
      });
      final delays = <Duration>[];

      await sendWithRetry(
        client: client,
        options: _noSleep(delays: delays),
        buildRequest: _counting(<Request>[]),
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
        credentials:
            AwsClientCredentials(accessKey: 'ak', secretKey: 'sk'),
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
  });
}
