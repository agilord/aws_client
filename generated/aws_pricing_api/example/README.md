```dart
import 'package:aws_pricing_api/pricing-2017-10-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Pricing(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Pricing
}
```
