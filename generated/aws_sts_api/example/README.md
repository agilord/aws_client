```dart
import 'package:aws_sts_api/sts-2011-06-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = STS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use STS
}
```
