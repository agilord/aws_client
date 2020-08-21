@Tags(['presubmit-only'])
import 'package:aws_marketplacecommerceanalytics_api/marketplacecommerceanalytics-2015-07-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_marketplacecommerceanalytics_api'));

  test('ensure_compilation', () {
    MarketplaceCommerceAnalytics(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
