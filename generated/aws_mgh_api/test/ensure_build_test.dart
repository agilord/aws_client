import 'package:aws_mgh_api/AWSMigrationHub-2017-05-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_mgh_api'));

  t.test('ensure_compilation', () {
    MigrationHub(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
