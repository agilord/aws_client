```dart
import 'package:aws_codepipeline_api/codepipeline-2015-07-09.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodePipeline(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodePipeline
}
```
