```dart
import 'package:aws_iam_api/iam-2010-05-08.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = IAM(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use IAM
}
```
