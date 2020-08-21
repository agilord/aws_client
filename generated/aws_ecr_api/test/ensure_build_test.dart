@Tags(['presubmit-only'])
import 'package:aws_ecr_api/ecr-2015-09-21.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ecr_api'));

  test('ensure_compilation', () {
    ECR(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
