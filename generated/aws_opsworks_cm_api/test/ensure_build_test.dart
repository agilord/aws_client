@Tags(['presubmit-only'])
import 'package:aws_opsworks_cm_api/opsworkscm-2016-11-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_opsworks_cm_api'));

  test('ensure_compilation', () {
    OpsWorksCM(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
