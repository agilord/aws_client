import 'package:aws_sagemaker_a2i_runtime_api/sagemaker-a2i-runtime-2019-11-07.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    AugmentedAIRuntime(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
