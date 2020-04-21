```dart
import 'package:aws_workmail_api/workmail-2017-10-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = WorkMail(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use WorkMail
}
```
