@Tags(['presubmit-only'])
import 'package:aws_ebs_api/ebs-2019-11-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ebs_api'));

  test('ensure_compilation', () {
    EBS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
