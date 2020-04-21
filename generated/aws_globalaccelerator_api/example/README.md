```dart
import 'package:aws_globalaccelerator_api/globalaccelerator-2018-08-08.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = GlobalAccelerator(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use GlobalAccelerator
}
```
