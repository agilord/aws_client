```dart
import 'package:aws_personalize_api/personalize-2018-05-22.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Personalize(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Personalize
}
```
