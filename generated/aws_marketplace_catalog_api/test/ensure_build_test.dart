@Tags(['presubmit-only'])
import 'package:aws_marketplace_catalog_api/marketplace-catalog-2018-09-17.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_marketplace_catalog_api'));

  test('ensure_compilation', () {
    MarketplaceCatalog(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
