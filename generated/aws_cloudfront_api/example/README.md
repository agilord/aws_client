```dart
import 'package:aws_cloudfront_api/cloudfront-2019-03-26.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CloudFront(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CloudFront
}
```
