@Tags(['presubmit-only'])
import 'package:aws_sagemaker_api/sagemaker-2017-07-24.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_sagemaker_api'));

  test('ensure_compilation', () {
    SageMaker(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
