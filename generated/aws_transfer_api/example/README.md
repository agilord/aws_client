```dart
import 'package:aws_transfer_api/transfer-2018-11-05.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Transfer(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Transfer
}
```
