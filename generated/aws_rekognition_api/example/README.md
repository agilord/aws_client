```dart
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Rekognition(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Rekognition
}
```
