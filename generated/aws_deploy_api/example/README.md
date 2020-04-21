```dart
import 'package:aws_deploy_api/codedeploy-2014-10-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodeDeploy(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodeDeploy
}
```
