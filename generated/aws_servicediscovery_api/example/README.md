```dart
import 'package:aws_servicediscovery_api/servicediscovery-2017-03-14.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ServiceDiscovery(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ServiceDiscovery
}
```
