```dart
import 'package:aws_cloudhsmv2_api/cloudhsmv2-2017-04-28.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudHSMV2(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudHSMV2
}
```
