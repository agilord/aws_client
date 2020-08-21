@Tags(['presubmit-only'])
import 'package:aws_mediapackage_api/mediapackage-2017-10-12.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mediapackage_api'));

  test('ensure_compilation', () {
    MediaPackage(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
