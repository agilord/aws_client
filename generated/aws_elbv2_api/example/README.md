```dart
import 'package:aws_elbv2_api/elasticloadbalancingv2-2015-12-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ElasticLoadBalancingv2(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ElasticLoadBalancingv2
}
```
