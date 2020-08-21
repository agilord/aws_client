@Tags(['presubmit-only'])
import 'package:aws_resourcegroupstaggingapi_api/resourcegroupstaggingapi-2017-01-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_resourcegroupstaggingapi_api'));

  test('ensure_compilation', () {
    ResourceGroupsTaggingAPI(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
