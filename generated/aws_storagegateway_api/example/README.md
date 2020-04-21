```dart
import 'package:aws_storagegateway_api/storagegateway-2013-06-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = StorageGateway(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use StorageGateway
}
```
