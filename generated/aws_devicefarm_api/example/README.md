```dart
import 'package:aws_devicefarm_api/devicefarm-2015-06-23.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DeviceFarm(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DeviceFarm
}
```
