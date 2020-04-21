```dart
import 'package:aws_frauddetector_api/frauddetector-2019-11-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = FraudDetector(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use FraudDetector
}
```
