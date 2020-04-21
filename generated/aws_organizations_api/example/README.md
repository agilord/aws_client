```dart
import 'package:aws_organizations_api/organizations-2016-11-28.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Organizations(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Organizations
}
```
