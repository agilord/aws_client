```dart
import 'package:aws_service_quotas_api/service-quotas-2019-06-24.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ServiceQuotas(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ServiceQuotas
}
```
