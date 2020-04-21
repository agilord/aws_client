```dart
import 'package:aws_macie_api/macie-2017-12-19.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Macie(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Macie
}
```
