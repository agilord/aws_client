```dart
import 'package:aws_marketplace_entitlement_api/entitlement.marketplace-2017-01-11.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = MarketplaceEntitlementService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use MarketplaceEntitlementService
}
```
