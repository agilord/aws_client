```dart
import 'package:aws_waf_api/waf-2015-08-24.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = WAF(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use WAF
}
```
