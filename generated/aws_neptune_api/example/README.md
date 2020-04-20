```dart
import 'package:aws_neptune_api/neptune-2014-10-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Neptune(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Neptune
}
```
