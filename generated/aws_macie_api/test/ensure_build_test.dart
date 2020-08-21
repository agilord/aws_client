@Tags(['presubmit-only'])
import 'package:aws_macie_api/macie-2017-12-19.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_macie_api'));

  test('ensure_compilation', () {
    Macie(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
