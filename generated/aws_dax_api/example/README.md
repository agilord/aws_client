```dart
import 'package:aws_dax_api/dax-2017-04-19.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DAX(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DAX
}
```
