@Tags(['presubmit-only'])
import 'package:aws_devicefarm_api/devicefarm-2015-06-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_devicefarm_api'));

  test('ensure_compilation', () {
    DeviceFarm(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
