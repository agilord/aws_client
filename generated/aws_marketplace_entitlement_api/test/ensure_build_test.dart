import 'package:aws_marketplace_entitlement_api/entitlement.marketplace-2017-01-11.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    MarketplaceEntitlementService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
