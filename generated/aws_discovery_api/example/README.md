```dart
import 'package:aws_discovery_api/discovery-2015-11-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ApplicationDiscoveryService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ApplicationDiscoveryService
}
```
