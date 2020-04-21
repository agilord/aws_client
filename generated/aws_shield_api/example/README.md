```dart
import 'package:aws_shield_api/shield-2016-06-02.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Shield(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Shield
}
```
