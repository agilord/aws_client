import 'package:aws_cognito_idp_api/cognito-idp-2016-04-18.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cognito_idp_api'));

  t.test('ensure_compilation', () {
    CognitoIdentityProvider(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
