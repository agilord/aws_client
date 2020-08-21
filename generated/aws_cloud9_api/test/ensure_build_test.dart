@Tags(['presubmit-only'])
import 'package:aws_cloud9_api/cloud9-2017-09-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloud9_api'));

  test('ensure_compilation', () {
    Cloud9(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
