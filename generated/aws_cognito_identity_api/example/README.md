```dart
import 'package:aws_cognito_identity_api/cognito-identity-2014-06-30.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CognitoIdentity(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CognitoIdentity
}
```
