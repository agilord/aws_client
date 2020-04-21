```dart
import 'package:aws_fsx_api/fsx-2018-03-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = FSx(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use FSx
}
```
