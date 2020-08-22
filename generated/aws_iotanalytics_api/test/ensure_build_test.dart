import 'package:aws_iotanalytics_api/iotanalytics-2017-11-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotanalytics_api'));

  t.test('ensure_compilation', () {
    IoTAnalytics(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
