@Tags(['presubmit-only'])
import 'package:aws_autoscaling_plans_api/autoscaling-plans-2018-01-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_autoscaling_plans_api'));

  test('ensure_compilation', () {
    AutoScalingPlans(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
