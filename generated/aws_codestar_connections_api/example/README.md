```dart
import 'package:aws_codestar_connections_api/codestar-connections-2019-12-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodeStarconnections(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodeStarconnections
}
```
