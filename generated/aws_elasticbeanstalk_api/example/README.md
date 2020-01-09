```dart
import 'package:aws_elasticbeanstalk_api/elasticbeanstalk-2010-12-01.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = ElasticBeanstalk(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use ElasticBeanstalk
}
```
