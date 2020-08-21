@Tags(['presubmit-only'])
import 'package:aws_cloudformation_api/cloudformation-2010-05-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloudformation_api'));

  test('ensure_compilation', () {
    CloudFormation(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
