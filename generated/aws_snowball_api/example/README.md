```dart
import 'package:aws_snowball_api/snowball-2016-06-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Snowball(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Snowball
}
```
