@Tags(['presubmit-only'])
import 'package:aws_snowball_api/snowball-2016-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_snowball_api'));

  test('ensure_compilation', () {
    Snowball(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
