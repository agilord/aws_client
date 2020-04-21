```dart
import 'package:aws_directconnect_api/directconnect-2012-10-25.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DirectConnect(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DirectConnect
}
```
