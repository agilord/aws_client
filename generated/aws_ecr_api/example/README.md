```dart
import 'package:aws_ecr_api/ecr-2015-09-21.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ECR(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ECR
}
```
