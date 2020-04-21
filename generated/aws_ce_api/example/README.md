```dart
import 'package:aws_ce_api/ce-2017-10-25.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CostExplorer(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CostExplorer
}
```
