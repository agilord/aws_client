```dart
import 'package:aws_datapipeline_api/datapipeline-2012-10-29.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = DataPipeline(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use DataPipeline
}
```
