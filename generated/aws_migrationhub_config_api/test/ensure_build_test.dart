@Tags(['presubmit-only'])
import 'package:aws_migrationhub_config_api/migrationhub-config-2019-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_migrationhub_config_api'));

  test('ensure_compilation', () {
    MigrationHubConfig(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
