```dart
import 'package:aws_comprehendmedical_api/comprehendmedical-2018-10-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ComprehendMedical(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ComprehendMedical
}
```
