@Tags(['presubmit-only'])
import 'package:aws_mediastore_api/mediastore-2017-09-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mediastore_api'));

  test('ensure_compilation', () {
    MediaStore(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
