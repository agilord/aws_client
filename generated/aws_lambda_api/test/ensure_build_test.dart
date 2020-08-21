@Tags(['presubmit-only'])
import 'package:aws_lambda_api/lambda-2014-11-11.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_lambda_api'));

  test('ensure_compilation', () {
    Lambda(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
