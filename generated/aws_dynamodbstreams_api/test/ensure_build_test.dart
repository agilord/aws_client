import 'package:aws_dynamodbstreams_api/streams-dynamodb-2012-08-10.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    DynamoDBStreams(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
