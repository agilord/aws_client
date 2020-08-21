@Tags(['presubmit-only'])
import 'package:aws_redshift_api/redshift-2012-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_redshift_api'));

  test('ensure_compilation', () {
    Redshift(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
