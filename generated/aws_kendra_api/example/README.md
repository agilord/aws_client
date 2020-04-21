```dart
import 'package:aws_kendra_api/kendra-2019-02-03.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Kendra(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Kendra
}
```
