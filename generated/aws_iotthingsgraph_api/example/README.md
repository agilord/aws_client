```dart
import 'package:aws_iotthingsgraph_api/iotthingsgraph-2018-09-06.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = IoTThingsGraph(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use IoTThingsGraph
}
```
