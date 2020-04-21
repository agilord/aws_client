```dart
import 'package:aws_workspaces_api/workspaces-2015-04-08.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = WorkSpaces(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use WorkSpaces
}
```
