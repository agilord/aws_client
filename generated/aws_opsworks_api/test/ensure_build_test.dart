@Tags(['presubmit-only'])
import 'package:aws_opsworks_api/opsworks-2013-02-18.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_opsworks_api'));

  test('ensure_compilation', () {
    OpsWorks(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
