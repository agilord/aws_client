```dart
import 'package:aws_configservice_api/config-2014-11-12.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ConfigService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ConfigService
}
```
