```dart
import 'package:aws_cognito_idp_api/cognito-idp-2016-04-18.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = CognitoIdentityProvider(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use CognitoIdentityProvider
}
```
