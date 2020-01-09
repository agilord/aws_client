```dart
import 'package:aws_rds_api/rds-2014-10-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = RDS(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use RDS
}
```
