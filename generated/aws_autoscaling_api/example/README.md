```dart
import 'package:aws_autoscaling_api/autoscaling-2011-01-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = AutoScaling(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use AutoScaling
}
```
