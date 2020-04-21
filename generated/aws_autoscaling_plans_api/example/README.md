```dart
import 'package:aws_autoscaling_plans_api/autoscaling-plans-2018-01-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = AutoScalingPlans(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use AutoScalingPlans
}
```
