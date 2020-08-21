@Tags(['presubmit-only'])
import 'package:aws_mediaconvert_api/mediaconvert-2017-08-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mediaconvert_api'));

  test('ensure_compilation', () {
    MediaConvert(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
