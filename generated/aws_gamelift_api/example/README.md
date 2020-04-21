```dart
import 'package:aws_gamelift_api/gamelift-2015-10-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = GameLift(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use GameLift
}
```
