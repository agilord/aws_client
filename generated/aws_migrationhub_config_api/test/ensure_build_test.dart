import 'package:aws_migrationhub_config_api/migrationhub-config-2019-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_migrationhub_config_api'));

  t.test('ensure_compilation', () {
    MigrationHubConfig(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
