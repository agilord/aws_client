```dart
import 'package:aws_machinelearning_api/machinelearning-2014-12-12.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = MachineLearning(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use MachineLearning
}
```
