@Tags(['presubmit-only'])
import 'package:aws_waf_api/waf-2015-08-24.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_waf_api'));

  test('ensure_compilation', () {
    WAF(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
