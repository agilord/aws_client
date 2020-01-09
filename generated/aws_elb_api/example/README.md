```dart
import 'package:aws_elb_api/elasticloadbalancing-2012-06-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ElasticLoadBalancing(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ElasticLoadBalancing
}
```
