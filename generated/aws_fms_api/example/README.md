```dart
import 'package:aws_fms_api/fms-2018-01-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = FMS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use FMS
}
```
