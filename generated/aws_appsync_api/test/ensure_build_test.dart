@Tags(['presubmit-only'])
import 'package:aws_appsync_api/appsync-2017-07-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_appsync_api'));

  test('ensure_compilation', () {
    AppSync(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
