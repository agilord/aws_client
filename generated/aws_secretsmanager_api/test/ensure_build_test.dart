@Tags(['presubmit-only'])
import 'package:aws_secretsmanager_api/secretsmanager-2017-10-17.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_secretsmanager_api'));

  test('ensure_compilation', () {
    SecretsManager(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
