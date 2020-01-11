```dart
import 'package:aws_s3_api/s3-2006-03-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = S3(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use S3
}
```
