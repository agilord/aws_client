@Tags(['presubmit-only'])
import 'package:aws_iotthingsgraph_api/iotthingsgraph-2018-09-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotthingsgraph_api'));

  test('ensure_compilation', () {
    IoTThingsGraph(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
