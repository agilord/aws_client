```dart
import 'package:aws_s3control_api/s3control-2018-08-20.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = S3Control(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use S3Control
}
```
