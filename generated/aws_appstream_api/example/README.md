```dart
import 'package:aws_appstream_api/appstream-2016-12-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = AppStream(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use AppStream
}
```
