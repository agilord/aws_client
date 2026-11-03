import 'dart:async';
import 'dart:convert';

import 'package:aws_client/src/credential_providers/src/imds/imds.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

const _credsBody = {
  'AccessKeyId': 'AKIA',
  'SecretAccessKey': 'secret',
  'Token': 'session',
  'Expiration': '2030-01-01T00:00:00Z',
};

void main() {
  test('returns null without a client', () async {
    expect(await fromInstanceMetaDataService(), isNull);
  });

  test('uses an IMDSv2 token on the metadata requests', () async {
    final tokenHeaders = <String?>[];
    final client = MockClient((rq) async {
      if (rq.method == 'PUT' && rq.url.path == '/latest/api/token') {
        return Response('the-token', 200);
      }
      tokenHeaders.add(rq.headers['x-aws-ec2-metadata-token']);
      return rq.url.path.endsWith('security-credentials/')
          ? Response('my-role', 200)
          : Response(jsonEncode(_credsBody), 200);
    });

    final creds = await fromInstanceMetaDataService(client: client);

    expect(creds!.accessKey, 'AKIA');
    expect(creds.sessionToken, 'session');
    expect(tokenHeaders, isNotEmpty);
    expect(tokenHeaders, everyElement('the-token'),
        reason: 'the v2 token is sent on every metadata GET');
  });

  test('falls back to IMDSv1 when the token endpoint fails', () async {
    final client = MockClient((rq) async {
      if (rq.method == 'PUT') return Response('', 403);
      expect(rq.headers.containsKey('x-aws-ec2-metadata-token'), isFalse);
      return rq.url.path.endsWith('security-credentials/')
          ? Response('my-role', 200)
          : Response(jsonEncode(_credsBody), 200);
    });

    final creds = await fromInstanceMetaDataService(client: client);
    expect(creds!.accessKey, 'AKIA');
  });

  test('falls back to IMDSv1 when the token request never completes', () async {
    final client = MockClient((rq) async {
      if (rq.method == 'PUT') return Completer<Response>().future;
      expect(rq.headers.containsKey('x-aws-ec2-metadata-token'), isFalse);
      return rq.url.path.endsWith('security-credentials/')
          ? Response('my-role', 200)
          : Response(jsonEncode(_credsBody), 200);
    });

    final creds = await fromInstanceMetaDataService(client: client);
    expect(creds!.accessKey, 'AKIA');
  });

  test('returns null when no role is attached', () async {
    final client = MockClient((rq) async => rq.method == 'PUT'
        ? Response('the-token', 200)
        : Response('not found', 404));

    expect(await fromInstanceMetaDataService(client: client), isNull);
  });
}
