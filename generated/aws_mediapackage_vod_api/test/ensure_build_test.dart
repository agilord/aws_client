import 'package:aws_mediapackage_vod_api/mediapackage-vod-2018-11-07.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mediapackage_vod_api'));

  t.test('ensure_compilation', () {
    MediaPackageVod(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
