```dart
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DynamoDB(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DynamoDB
}
```
