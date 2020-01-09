```dart
import 'package:aws_sdb_api/sdb-2009-04-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SimpleDB(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SimpleDB
}
```
