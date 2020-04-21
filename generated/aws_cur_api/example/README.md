```dart
import 'package:aws_cur_api/cur-2017-01-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CostandUsageReportService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CostandUsageReportService
}
```
