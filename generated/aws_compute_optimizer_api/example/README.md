```dart
import 'package:aws_compute_optimizer_api/compute-optimizer-2019-11-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ComputeOptimizer(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ComputeOptimizer
}
```
