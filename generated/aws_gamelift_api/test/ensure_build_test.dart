@Tags(['presubmit-only'])
import 'package:aws_gamelift_api/gamelift-2015-10-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_gamelift_api'));

  test('ensure_compilation', () {
    GameLift(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
