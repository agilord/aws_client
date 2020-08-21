@Tags(['presubmit-only'])
import 'package:aws_elbv2_api/elasticloadbalancingv2-2015-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_elbv2_api'));

  test('ensure_compilation', () {
    ElasticLoadBalancingv2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
