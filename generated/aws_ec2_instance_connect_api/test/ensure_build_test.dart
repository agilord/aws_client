@Tags(['presubmit-only'])
import 'package:aws_ec2_instance_connect_api/ec2-instance-connect-2018-04-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_ec2_instance_connect_api'));

  test('ensure_compilation', () {
    EC2InstanceConnect(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
