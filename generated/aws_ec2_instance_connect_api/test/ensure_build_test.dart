import 'package:aws_ec2_instance_connect_api/ec2-instance-connect-2018-04-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_ec2_instance_connect_api'));

  t.test('ensure_compilation', () {
    EC2InstanceConnect(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
