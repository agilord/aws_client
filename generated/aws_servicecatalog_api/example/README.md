```dart
import 'package:aws_servicecatalog_api/servicecatalog-2015-12-10.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ServiceCatalog(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ServiceCatalog
}
```
