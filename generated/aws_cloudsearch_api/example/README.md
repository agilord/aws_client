```dart
import 'package:aws_cloudsearch_api/cloudsearch-2013-01-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudSearch(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudSearch
}
```
