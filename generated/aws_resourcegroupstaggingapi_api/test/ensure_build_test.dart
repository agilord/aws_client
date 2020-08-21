import 'package:aws_resourcegroupstaggingapi_api/resourcegroupstaggingapi-2017-01-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_resourcegroupstaggingapi_api'));

  t.test('ensure_compilation', () {
    ResourceGroupsTaggingAPI(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
