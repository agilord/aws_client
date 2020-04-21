```dart
import 'package:aws_ssm_api/ssm-2014-11-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SSM(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SSM
}
```
