```dart
import 'package:aws_mgh_api/AWSMigrationHub-2017-05-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = MigrationHub(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use MigrationHub
}
```
