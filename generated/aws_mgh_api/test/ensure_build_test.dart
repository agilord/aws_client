@Tags(['presubmit-only'])
import 'package:aws_mgh_api/AWSMigrationHub-2017-05-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_mgh_api'));

  test('ensure_compilation', () {
    MigrationHub(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
