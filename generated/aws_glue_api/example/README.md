```dart
import 'package:aws_glue_api/glue-2017-03-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Glue(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Glue
}
```
