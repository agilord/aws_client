@Tags(['presubmit-only'])
import 'package:aws_robomaker_api/robomaker-2018-06-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_robomaker_api'));

  test('ensure_compilation', () {
    RoboMaker(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
