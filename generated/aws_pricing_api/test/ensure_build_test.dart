@Tags(['presubmit-only'])
import 'package:aws_pricing_api/pricing-2017-10-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_pricing_api'));

  test('ensure_compilation', () {
    Pricing(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
