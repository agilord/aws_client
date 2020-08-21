@Tags(['presubmit-only'])
import 'package:aws_emr_api/elasticmapreduce-2009-03-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_emr_api'));

  test('ensure_compilation', () {
    EMR(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
