```dart
import 'package:aws_firehose_api/firehose-2015-08-04.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Firehose(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Firehose
}
```
