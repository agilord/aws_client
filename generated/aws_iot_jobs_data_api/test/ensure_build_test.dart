import 'package:aws_iot_jobs_data_api/iot-jobs-data-2017-09-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iot_jobs_data_api'));

  t.test('ensure_compilation', () {
    IoTJobsDataPlane(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
