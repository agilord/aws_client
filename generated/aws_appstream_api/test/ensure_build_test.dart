@Tags(['presubmit-only'])
import 'package:aws_appstream_api/appstream-2016-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_appstream_api'));

  test('ensure_compilation', () {
    AppStream(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
