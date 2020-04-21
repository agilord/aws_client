```dart
import 'package:aws_emr_api/elasticmapreduce-2009-03-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = EMR(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use EMR
}
```
