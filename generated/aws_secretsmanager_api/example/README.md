```dart
import 'package:aws_secretsmanager_api/secretsmanager-2017-10-17.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = SecretsManager(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use SecretsManager
}
```
