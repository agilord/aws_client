```dart
import 'package:aws_application_insights_api/application-insights-2018-11-25.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ApplicationInsights(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ApplicationInsights
}
```
