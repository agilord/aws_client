```dart
import 'package:aws_route53domains_api/route53domains-2014-05-15.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Route53Domains(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Route53Domains
}
```
