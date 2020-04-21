```dart
import 'package:aws_dynamodbstreams_api/streams-dynamodb-2012-08-10.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DynamoDBStreams(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DynamoDBStreams
}
```
