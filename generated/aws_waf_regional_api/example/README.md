```dart
import 'package:aws_waf_regional_api/waf-regional-2016-11-28.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = WAFRegional(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use WAFRegional
}
```
