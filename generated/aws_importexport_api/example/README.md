```dart
import 'package:aws_importexport_api/importexport-2010-06-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ImportExport(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ImportExport
}
```
