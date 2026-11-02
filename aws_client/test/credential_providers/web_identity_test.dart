import 'dart:io';

import 'package:aws_client/src/credential_providers/src/web_identity/web_identity_io.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

const _stsResponse = '''
<AssumeRoleWithWebIdentityResponse>
  <AssumeRoleWithWebIdentityResult>
    <Credentials>
      <AccessKeyId>AKIA</AccessKeyId>
      <SecretAccessKey>secret</SecretAccessKey>
      <SessionToken>token</SessionToken>
      <Expiration>2030-01-01T00:00:00Z</Expiration>
    </Credentials>
  </AssumeRoleWithWebIdentityResult>
</AssumeRoleWithWebIdentityResponse>''';

void main() {
  test('returns null without a token file and role arn', () async {
    final client = MockClient((_) async => Response('', 200));
    expect(await fromWebIdentity(client: client, environment: {}), isNull);
  });

  test('exchanges the token via STS AssumeRoleWithWebIdentity', () async {
    final tokenFile = File(
        '${Directory.systemTemp.path}/web_identity_${DateTime.now().microsecondsSinceEpoch}');
    await tokenFile.writeAsString('the-oidc-token');
    addTearDown(tokenFile.deleteSync);

    late Request seen;
    final client = MockClient((rq) async {
      seen = rq;
      return Response(_stsResponse, 200);
    });

    final creds = await fromWebIdentity(client: client, environment: {
      'AWS_WEB_IDENTITY_TOKEN_FILE': tokenFile.path,
      'AWS_ROLE_ARN': 'arn:aws:iam::123456789012:role/demo',
      'AWS_REGION': 'us-east-1',
    });

    expect(seen.body, contains('Action=AssumeRoleWithWebIdentity'));
    expect(seen.body, contains('WebIdentityToken=the-oidc-token'));
    expect(creds!.accessKey, 'AKIA');
    expect(creds.secretKey, 'secret');
    expect(creds.sessionToken, 'token');
    expect(creds.expiration, DateTime.utc(2030));
  });
}
