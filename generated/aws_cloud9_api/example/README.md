```dart
import 'package:aws_cloud9_api/cloud9-2017-09-23.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Cloud9(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Cloud9
}
```
