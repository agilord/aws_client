```dart
import 'package:aws_wafv2_api/wafv2-2019-07-29.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = WAFV2(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use WAFV2
}
```
