@Tags(['presubmit-only'])
import 'package:aws_waf_regional_api/waf-regional-2016-11-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_waf_regional_api'));

  test('ensure_compilation', () {
    WAFRegional(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
