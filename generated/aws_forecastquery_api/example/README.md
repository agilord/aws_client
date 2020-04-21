```dart
import 'package:aws_forecastquery_api/forecastquery-2018-06-26.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ForecastQueryService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ForecastQueryService
}
```
