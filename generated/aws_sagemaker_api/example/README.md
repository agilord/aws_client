```dart
import 'package:aws_sagemaker_api/sagemaker-2017-07-24.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SageMaker(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SageMaker
}
```
