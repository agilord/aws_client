```dart
import 'package:aws_qldb_session_api/qldb-session-2019-07-11.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = QLDBSession(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use QLDBSession
}
```
