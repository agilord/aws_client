```dart
import 'package:aws_comprehend_api/comprehend-2017-11-27.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Comprehend(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Comprehend
}
```
