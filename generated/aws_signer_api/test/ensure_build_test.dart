@Tags(['presubmit-only'])
import 'package:aws_signer_api/signer-2017-08-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_signer_api'));

  test('ensure_compilation', () {
    Signer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
