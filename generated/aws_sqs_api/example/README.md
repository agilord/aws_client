```dart
import 'package:aws_sqs_api/sqs-2012-11-05.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SQS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SQS
}
```
