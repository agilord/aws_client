@Tags(['presubmit-only'])
import 'package:aws_ssm_api/ssm-2014-11-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ssm_api'));

  test('ensure_compilation', () {
    SSM(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
