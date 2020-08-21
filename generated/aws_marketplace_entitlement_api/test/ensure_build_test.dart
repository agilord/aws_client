@Tags(['presubmit-only'])
import 'package:aws_marketplace_entitlement_api/entitlement.marketplace-2017-01-11.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_marketplace_entitlement_api'));

  test('ensure_compilation', () {
    MarketplaceEntitlementService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
