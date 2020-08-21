@Tags(['presubmit-only'])
import 'package:aws_rds_data_api/rds-data-2018-08-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_rds_data_api'));

  test('ensure_compilation', () {
    RDSDataService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
