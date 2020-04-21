```dart
import 'package:aws_alexaforbusiness_api/alexaforbusiness-2017-11-09.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = AlexaForBusiness(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use AlexaForBusiness
}
```
