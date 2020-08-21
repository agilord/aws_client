@Tags(['presubmit-only'])
import 'package:aws_iotevents_api/iotevents-2018-07-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotevents_api'));

  test('ensure_compilation', () {
    IoTEvents(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
