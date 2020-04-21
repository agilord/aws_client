```dart
import 'package:aws_transcribe_api/transcribe-2017-10-26.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = TranscribeService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use TranscribeService
}
```
