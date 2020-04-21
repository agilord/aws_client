```dart
import 'package:aws_pi_api/pi-2018-02-27.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = PI(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use PI
}
```
