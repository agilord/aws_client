```dart
import 'package:aws_kms_api/kms-2014-11-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = KMS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use KMS
}
```
