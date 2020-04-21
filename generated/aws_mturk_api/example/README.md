```dart
import 'package:aws_mturk_api/mturk-requester-2017-01-17.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = MTurk(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use MTurk
}
```
