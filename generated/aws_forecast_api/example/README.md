```dart
import 'package:aws_forecast_api/forecast-2018-06-26.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ForecastService(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ForecastService
}
```
