```dart
import 'package:aws_cloudwatch_api/monitoring-2010-08-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudWatch(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudWatch
}
```
