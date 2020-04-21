```dart
import 'package:aws_iotsecuretunneling_api/iotsecuretunneling-2018-10-05.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = IoTSecureTunneling(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use IoTSecureTunneling
}
```
