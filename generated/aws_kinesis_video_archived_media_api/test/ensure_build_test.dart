import 'package:aws_kinesis_video_archived_media_api/kinesis-video-archived-media-2017-09-30.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    KinesisVideoArchivedMedia(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
