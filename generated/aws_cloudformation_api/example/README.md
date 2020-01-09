```dart
import 'package:aws_cloudformation_api/cloudformation-2010-05-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudFormation(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudFormation
}
```
