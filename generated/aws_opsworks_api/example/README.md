```dart
import 'package:aws_opsworks_api/opsworks-2013-02-18.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = OpsWorks(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use OpsWorks
}
```
