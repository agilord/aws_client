@Tags(['presubmit-only'])
import 'package:aws_route53_api/route53-2013-04-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_route53_api'));

  test('ensure_compilation', () {
    Route53(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
