```dart
import 'package:aws_route53_api/route53-2013-04-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Route53(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Route53
}
```
