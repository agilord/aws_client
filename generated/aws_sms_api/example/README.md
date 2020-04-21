```dart
import 'package:aws_sms_api/sms-2016-10-24.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SMS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SMS
}
```
