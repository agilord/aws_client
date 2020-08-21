@Tags(['presubmit-only'])
import 'package:aws_kinesisvideo_api/kinesisvideo-2017-09-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_kinesisvideo_api'));

  test('ensure_compilation', () {
    KinesisVideo(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
