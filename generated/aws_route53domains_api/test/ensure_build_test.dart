@Tags(['presubmit-only'])
import 'package:aws_route53domains_api/route53domains-2014-05-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_route53domains_api'));

  test('ensure_compilation', () {
    Route53Domains(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
