```dart
import 'package:aws_codestar_api/codestar-2017-04-19.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodeStar(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodeStar
}
```
