import 'package:aws_kinesis_video_signaling_api/kinesis-video-signaling-2019-12-04.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    KinesisVideoSignalingChannels(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
