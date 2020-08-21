@Tags(['presubmit-only'])
import 'package:aws_elb_api/elasticloadbalancing-2012-06-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_elb_api'));

  test('ensure_compilation', () {
    ElasticLoadBalancing(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
