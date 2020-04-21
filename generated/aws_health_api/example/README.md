```dart
import 'package:aws_health_api/health-2016-08-04.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Health(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Health
}
```
