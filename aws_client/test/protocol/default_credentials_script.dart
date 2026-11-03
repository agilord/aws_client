// Driven by default_credentials_test.dart in a child process: the default
// chain reads Platform.environment and the user's home directory, so each
// scenario needs an environment of its own.
//
// Builds a protocol with neither `credentials` nor `credentialsProvider`,
// sends one request through a MockClient that also stands in for IMDS and STS,
// and prints what it saw, one `key value` per line.
import 'dart:async';
import 'dart:convert';

import 'package:aws_client/src/shared/shared.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

const _imdsCredentials = {
  'AccessKeyId': 'AKIAIMDS',
  'SecretAccessKey': 'secret',
  'Token': 'imds-session',
  'Expiration': '2030-01-01T00:00:00Z',
};

const _stsResponse = '''
<AssumeRoleWithWebIdentityResponse>
  <AssumeRoleWithWebIdentityResult>
    <Credentials>
      <AccessKeyId>AKIAWEB</AccessKeyId>
      <SecretAccessKey>secret</SecretAccessKey>
      <SessionToken>web-session</SessionToken>
      <Expiration>2030-01-01T00:00:00Z</Expiration>
    </Credentials>
  </AssumeRoleWithWebIdentityResult>
</AssumeRoleWithWebIdentityResponse>''';

Future<void> main(List<String> args) async {
  final imdsReachable = args.single == 'imds';

  final client = MockClient((rq) async {
    final host = rq.url.host;
    if (host == '169.254.169.254') {
      print('imds ${rq.method} ${rq.url.path}');
      if (!imdsReachable) {
        return Completer<Response>().future;
      }
      if (rq.method == 'PUT') return Response('the-token', 200);
      if (rq.url.path.endsWith('/')) return Response('my-role', 200);
      return Response(jsonEncode(_imdsCredentials), 200);
    }
    if (host.startsWith('sts.')) {
      print('sts ${rq.url}');
      return Response(_stsResponse, 200);
    }
    print('authorization ${rq.headers['Authorization']}');
    print('session-token ${rq.headers['X-Amz-Security-Token']}');
    return Response('{}', 200);
  });

  final protocol = JsonProtocol(
    client: client,
    service: const ServiceMetadata(endpointPrefix: 'demo'),
    region: 'us-east-1',
  );

  final stopwatch = Stopwatch()..start();
  try {
    await protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: {},
      payload: {},
    );
  } catch (e) {
    print('error $e');
  }
  print('elapsed-ms ${stopwatch.elapsedMilliseconds}');
}
