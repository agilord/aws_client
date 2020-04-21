```dart
import 'package:aws_ec2_instance_connect_api/ec2-instance-connect-2018-04-02.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = EC2InstanceConnect(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use EC2InstanceConnect
}
```
