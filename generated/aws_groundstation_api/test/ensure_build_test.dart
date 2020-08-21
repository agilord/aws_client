@Tags(['presubmit-only'])
import 'package:aws_groundstation_api/groundstation-2019-05-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_groundstation_api'));

  test('ensure_compilation', () {
    GroundStation(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
