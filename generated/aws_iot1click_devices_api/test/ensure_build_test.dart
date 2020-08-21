@Tags(['presubmit-only'])
import 'package:aws_iot1click_devices_api/devices-2018-05-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iot1click_devices_api'));

  test('ensure_compilation', () {
    IoT1ClickDevicesService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
