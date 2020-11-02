import 'package:aws_sagemaker_runtime_api/runtime.sagemaker-2017-05-13.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    SageMakerRuntime(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
