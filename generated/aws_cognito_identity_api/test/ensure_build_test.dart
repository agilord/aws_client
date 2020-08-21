@Tags(['presubmit-only'])
import 'package:aws_cognito_identity_api/cognito-identity-2014-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cognito_identity_api'));

  test('ensure_compilation', () {
    CognitoIdentity(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
