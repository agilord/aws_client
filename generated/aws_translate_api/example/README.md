```dart
import 'package:aws_translate_api/translate-2017-07-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Translate(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Translate
}
```
