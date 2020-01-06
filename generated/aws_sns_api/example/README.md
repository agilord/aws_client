```dart
import 'package:aws_sns_api/sns-2010-03-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SNS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SNS
}
```
