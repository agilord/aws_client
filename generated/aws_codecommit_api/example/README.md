```dart
import 'package:aws_codecommit_api/codecommit-2015-04-13.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodeCommit(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodeCommit
}
```
