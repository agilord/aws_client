```dart
import 'package:aws_lightsail_api/lightsail-2016-11-28.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Lightsail(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Lightsail
}
```
