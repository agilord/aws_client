```dart
import 'package:aws_inspector_api/inspector-2016-02-16.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Inspector(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Inspector
}
```
