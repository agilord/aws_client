```dart
import 'package:aws_redshift_api/redshift-2012-12-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Redshift(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Redshift
}
```
