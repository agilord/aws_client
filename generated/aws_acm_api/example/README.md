```dart
import 'package:aws_acm_api/acm-2015-12-08.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ACM(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ACM
}
```
