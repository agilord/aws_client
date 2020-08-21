@Tags(['presubmit-only'])
import 'package:aws_ec2_api/ec2-2016-11-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ec2_api'));

  test('ensure_compilation', () {
    EC2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
