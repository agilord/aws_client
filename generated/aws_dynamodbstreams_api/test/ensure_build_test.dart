@Tags(['presubmit-only'])
import 'package:aws_dynamodbstreams_api/streams-dynamodb-2012-08-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_dynamodbstreams_api'));

  test('ensure_compilation', () {
    DynamoDBStreams(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
