```dart
import 'package:aws_budgets_api/budgets-2016-10-20.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Budgets(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Budgets
}
```
