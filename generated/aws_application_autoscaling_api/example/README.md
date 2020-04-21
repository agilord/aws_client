```dart
import 'package:aws_application_autoscaling_api/application-autoscaling-2016-02-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ApplicationAutoScaling(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ApplicationAutoScaling
}
```
