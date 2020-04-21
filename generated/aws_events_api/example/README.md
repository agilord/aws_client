```dart
import 'package:aws_events_api/events-2015-10-07.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudWatchEvents(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudWatchEvents
}
```
