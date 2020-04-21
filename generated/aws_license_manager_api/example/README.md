```dart
import 'package:aws_license_manager_api/license-manager-2018-08-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = LicenseManager(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use LicenseManager
}
```
