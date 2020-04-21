```dart
import 'package:aws_support_api/support-2013-04-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Support(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Support
}
```
