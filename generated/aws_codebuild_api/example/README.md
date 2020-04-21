```dart
import 'package:aws_codebuild_api/codebuild-2016-10-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CodeBuild(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CodeBuild
}
```
