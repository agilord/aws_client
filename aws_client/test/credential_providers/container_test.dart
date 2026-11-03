import 'dart:convert';
import 'dart:io';

import 'package:aws_client/src/credential_providers/src/container/container_io.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

const _credsBody = {
  'AccessKeyId': 'AKIA',
  'SecretAccessKey': 'secret',
  'Token': 'token',
  'Expiration': '2030-01-01T00:00:00Z',
};

void main() {
  test('returns null when no container env vars are set', () async {
    final client = MockClient((_) async => Response('', 200));
    expect(await fromContainer(client: client, environment: {}), isNull);
  });

  test('fetches from the relative URI with the auth token', () async {
    late Request seen;
    final client = MockClient((rq) async {
      seen = rq;
      return Response(jsonEncode(_credsBody), 200);
    });

    final creds = await fromContainer(client: client, environment: {
      'AWS_CONTAINER_CREDENTIALS_RELATIVE_URI': '/v2/creds',
      'AWS_CONTAINER_AUTHORIZATION_TOKEN': 'Bearer xyz',
    });

    expect(seen.url.toString(), 'http://169.254.170.2/v2/creds');
    expect(seen.headers['Authorization'], 'Bearer xyz');
    expect(creds!.accessKey, 'AKIA');
    expect(creds.secretKey, 'secret');
    expect(creds.sessionToken, 'token');
    expect(creds.expiration, DateTime.utc(2030));
  });

  test('reads the auth token from a file', () async {
    final tokenFile = File(
        '${Directory.systemTemp.path}/container_${DateTime.now().microsecondsSinceEpoch}');
    await tokenFile.writeAsString('Bearer from-file\n');
    addTearDown(tokenFile.deleteSync);

    late Request seen;
    final client = MockClient((rq) async {
      seen = rq;
      return Response(jsonEncode(_credsBody), 200);
    });

    await fromContainer(client: client, environment: {
      'AWS_CONTAINER_CREDENTIALS_RELATIVE_URI': '/v2/creds',
      'AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE': tokenFile.path,
    });

    expect(seen.headers['Authorization'], 'Bearer from-file');
  });

  test('returns null when the endpoint answers with an error', () async {
    final client = MockClient((_) async => Response('nope', 500));
    final creds = await fromContainer(client: client, environment: {
      'AWS_CONTAINER_CREDENTIALS_RELATIVE_URI': '/v2/creds',
    });
    expect(creds, isNull);
  });

  test('allows any https full URI', () async {
    final client =
        MockClient((_) async => Response(jsonEncode(_credsBody), 200));
    final creds = await fromContainer(client: client, environment: {
      'AWS_CONTAINER_CREDENTIALS_FULL_URI': 'https://creds.example.com/v1',
    });
    expect(creds!.accessKey, 'AKIA');
  });

  test('allows a loopback full URI', () async {
    final client =
        MockClient((_) async => Response(jsonEncode(_credsBody), 200));
    final creds = await fromContainer(client: client, environment: {
      'AWS_CONTAINER_CREDENTIALS_FULL_URI': 'http://127.0.0.1:8080/creds',
    });
    expect(creds!.accessKey, 'AKIA');
  });

  test('rejects a full URI pointing at a non-local host', () async {
    final client = MockClient((_) async => Response('', 200));
    await expectLater(
      fromContainer(client: client, environment: {
        'AWS_CONTAINER_CREDENTIALS_FULL_URI': 'http://evil.example.com/creds',
      }),
      throwsA(isA<ArgumentError>()),
    );
  });
}
