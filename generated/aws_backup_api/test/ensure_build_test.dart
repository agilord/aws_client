@Tags(['presubmit-only'])
import 'package:aws_backup_api/backup-2018-11-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_backup_api'));

  test('ensure_compilation', () {
    Backup(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
