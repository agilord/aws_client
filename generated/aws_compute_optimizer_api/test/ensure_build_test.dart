@Tags(['presubmit-only'])
import 'package:aws_compute_optimizer_api/compute-optimizer-2019-11-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_compute_optimizer_api'));

  test('ensure_compilation', () {
    ComputeOptimizer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
