```dart
import 'package:aws_kinesisanalytics_api/kinesisanalytics-2015-08-14.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = KinesisAnalytics(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use KinesisAnalytics
}
```
