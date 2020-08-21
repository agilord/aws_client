@Tags(['presubmit-only'])
import 'package:aws_securityhub_api/securityhub-2018-10-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_securityhub_api'));

  test('ensure_compilation', () {
    SecurityHub(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
