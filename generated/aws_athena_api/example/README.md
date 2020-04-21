```dart
import 'package:aws_athena_api/athena-2017-05-18.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Athena(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Athena
}
```
