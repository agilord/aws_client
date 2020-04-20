```dart
import 'package:aws_docdb_api/docdb-2014-10-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DocDB(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DocDB
}
```
