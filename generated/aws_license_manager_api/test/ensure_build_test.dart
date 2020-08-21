@Tags(['presubmit-only'])
import 'package:aws_license_manager_api/license-manager-2018-08-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_license_manager_api'));

  test('ensure_compilation', () {
    LicenseManager(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
