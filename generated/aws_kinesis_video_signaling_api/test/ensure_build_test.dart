@Tags(['presubmit-only'])
import 'package:aws_kinesis_video_signaling_api/kinesis-video-signaling-2019-12-04.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_kinesis_video_signaling_api'));

  test('ensure_compilation', () {
    KinesisVideoSignalingChannels(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
