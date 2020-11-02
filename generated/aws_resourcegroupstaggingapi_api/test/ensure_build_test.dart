import 'package:aws_resourcegroupstaggingapi_api/resourcegroupstaggingapi-2017-01-26.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    ResourceGroupsTaggingAPI(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
