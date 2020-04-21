```dart
import 'package:aws_migrationhub_config_api/migrationhub-config-2019-06-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = MigrationHubConfig(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use MigrationHubConfig
}
```
