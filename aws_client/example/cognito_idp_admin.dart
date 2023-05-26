import 'package:aws_client/cognito_identity_provider_2016_04_18.dart';

void main() async {
  final api = CognitoIdentityProvider(region: 'us-east-1');

  final cognitoPool = 'us-east-1_abc';
  final user = 'email@email.com';

  try {
    await api.adminDeleteUser(userPoolId: cognitoPool, username: user);
  } on ResourceNotFoundException catch (_) {
    // ok
  }

  await api.adminCreateUser(
    userPoolId: cognitoPool,
    username: user,
    temporaryPassword: r'Pass123$$',
    userAttributes: [AttributeType(name: 'email', value: user)],
    clientMetadata: {
      'language': 'fr',
    },
  );

  await api.adminSetUserPassword(
      password: 'newpassword', userPoolId: cognitoPool, username: user);

  api.close();
}
