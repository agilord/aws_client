@Tags(['presubmit-only'])
import 'package:aws_meteringmarketplace_api/meteringmarketplace-2016-01-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_meteringmarketplace_api'));

  test('ensure_compilation', () {
    MarketplaceMetering(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
