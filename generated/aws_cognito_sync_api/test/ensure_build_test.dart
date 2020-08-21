@Tags(['presubmit-only'])
import 'package:aws_cognito_sync_api/cognito-sync-2014-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cognito_sync_api'));

  test('ensure_compilation', () {
    CognitoSync(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
