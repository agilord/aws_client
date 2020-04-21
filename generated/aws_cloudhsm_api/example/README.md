```dart
import 'package:aws_cloudhsm_api/cloudhsm-2014-05-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudHSM(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudHSM
}
```
