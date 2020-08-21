@Tags(['presubmit-only'])
import 'package:aws_iotevents_data_api/iotevents-data-2018-10-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotevents_data_api'));

  test('ensure_compilation', () {
    IoTEventsData(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
