```dart
import 'package:aws_cloudtrail_api/cloudtrail-2013-11-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudTrail(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudTrail
}
```
