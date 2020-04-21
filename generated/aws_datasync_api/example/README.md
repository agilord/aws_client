```dart
import 'package:aws_datasync_api/datasync-2018-11-09.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DataSync(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DataSync
}
```
