```dart
import 'package:aws_ec2_api/ec2-2016-11-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = EC2(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use EC2
}
```
