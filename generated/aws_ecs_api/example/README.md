```dart
import 'package:aws_ecs_api/ecs-2014-11-13.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ECS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ECS
}
```
