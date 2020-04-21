```dart
import 'package:aws_ds_api/ds-2015-04-16.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DirectoryService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DirectoryService
}
```
