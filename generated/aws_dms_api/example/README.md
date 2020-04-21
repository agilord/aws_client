```dart
import 'package:aws_dms_api/dms-2016-01-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DatabaseMigrationService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DatabaseMigrationService
}
```
