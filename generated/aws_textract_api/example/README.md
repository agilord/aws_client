```dart
import 'package:aws_textract_api/textract-2018-06-27.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Textract(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Textract
}
```
