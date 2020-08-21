@Tags(['presubmit-only'])
import 'package:aws_efs_api/elasticfilesystem-2015-02-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_efs_api'));

  test('ensure_compilation', () {
    EFS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
