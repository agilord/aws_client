@Tags(['presubmit-only'])
import 'package:aws_rds_api/rds-2014-10-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_rds_api'));

  test('ensure_compilation', () {
    RDS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
