```dart
import 'package:aws_lakeformation_api/lakeformation-2017-03-31.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = LakeFormation(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use LakeFormation
}
```
