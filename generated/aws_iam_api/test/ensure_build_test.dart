@Tags(['presubmit-only'])
import 'package:aws_iam_api/iam-2010-05-08.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_iam_api'));

  test('ensure_compilation', () {
    IAM(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
