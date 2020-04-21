```dart
import 'package:aws_kinesis_api/kinesis-2013-12-02.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Kinesis(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Kinesis
}
```
