@Tags(['presubmit-only'])
import 'package:aws_comprehend_api/comprehend-2017-11-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_comprehend_api'));

  test('ensure_compilation', () {
    Comprehend(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
