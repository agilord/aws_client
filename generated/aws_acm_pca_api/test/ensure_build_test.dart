@Tags(['presubmit-only'])
import 'package:aws_acm_pca_api/acm-pca-2017-08-22.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_acm_pca_api'));

  test('ensure_compilation', () {
    ACMPCA(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
