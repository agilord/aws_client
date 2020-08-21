@Tags(['presubmit-only'])
import 'package:aws_dlm_api/dlm-2018-01-12.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_dlm_api'));

  test('ensure_compilation', () {
    DLM(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
