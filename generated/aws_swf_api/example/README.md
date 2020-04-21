```dart
import 'package:aws_swf_api/swf-2012-01-25.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SWF(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SWF
}
```
