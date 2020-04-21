```dart
import 'package:aws_route53resolver_api/route53resolver-2018-04-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Route53Resolver(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Route53Resolver
}
```
