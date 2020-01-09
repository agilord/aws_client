```dart
import 'package:aws_elasticache_api/elasticache-2015-02-02.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ElastiCache(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ElastiCache
}
```
