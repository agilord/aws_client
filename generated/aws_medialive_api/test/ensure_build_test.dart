@Tags(['presubmit-only'])
import 'package:aws_medialive_api/medialive-2017-10-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_medialive_api'));

  test('ensure_compilation', () {
    MediaLive(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
