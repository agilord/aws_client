```dart
import 'package:aws_lambda_api/lambda-2015-03-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Lambda(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Lambda
}
```
