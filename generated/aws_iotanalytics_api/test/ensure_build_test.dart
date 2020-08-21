@Tags(['presubmit-only'])
import 'package:aws_iotanalytics_api/iotanalytics-2017-11-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotanalytics_api'));

  test('ensure_compilation', () {
    IoTAnalytics(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
