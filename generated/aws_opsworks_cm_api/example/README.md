```dart
import 'package:aws_opsworks_cm_api/opsworkscm-2016-11-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = OpsWorksCM(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use OpsWorksCM
}
```
