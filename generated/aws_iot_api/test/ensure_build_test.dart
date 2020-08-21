@Tags(['presubmit-only'])
import 'package:aws_iot_api/iot-2015-05-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_iot_api'));

  test('ensure_compilation', () {
    IoT(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
