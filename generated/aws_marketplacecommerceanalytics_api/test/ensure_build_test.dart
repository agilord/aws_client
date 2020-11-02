import 'package:aws_marketplacecommerceanalytics_api/marketplacecommerceanalytics-2015-07-01.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    MarketplaceCommerceAnalytics(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
