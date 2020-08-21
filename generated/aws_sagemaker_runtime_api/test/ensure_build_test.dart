@Tags(['presubmit-only'])
import 'package:aws_sagemaker_runtime_api/runtime.sagemaker-2017-05-13.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_sagemaker_runtime_api'));

  test('ensure_compilation', () {
    SageMakerRuntime(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
