```dart
import 'package:aws_logs_api/logs-2014-03-28.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudWatchLogs(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudWatchLogs
}
```
