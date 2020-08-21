@Tags(['presubmit-only'])
import 'package:aws_sesv2_api/sesv2-2019-09-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_sesv2_api'));

  test('ensure_compilation', () {
    SESV2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
