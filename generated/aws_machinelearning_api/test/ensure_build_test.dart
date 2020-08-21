@Tags(['presubmit-only'])
import 'package:aws_machinelearning_api/machinelearning-2014-12-12.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_machinelearning_api'));

  test('ensure_compilation', () {
    MachineLearning(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
