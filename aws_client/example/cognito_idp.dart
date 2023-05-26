import 'dart:convert';

import 'package:aws_client/cognito_identity_provider_2016_04_18.dart';
import 'package:crypto/crypto.dart';

void main() async {
  final email = 'email@user.com';
  final password = 'abc';

  final config = CognitoConfig(clientId: 'abc', region: 'us-east-2');
  final api = CognitoIdentityProvider(
    region: config.region,
  );
  final secret = config.secretHash(email);
  final response = await api.initiateAuth(
    authFlow: AuthFlowType.userPasswordAuth,
    clientId: config.clientId,
    authParameters: {
      'USERNAME': email,
      'PASSWORD': password,
      if (secret != null) 'SECRET_HASH': secret,
    },
    clientMetadata: {
      'source': 'app',
    },
  );

  final challenge = response.challengeName;
  final parameters = response.challengeParameters ?? const {};
  if (challenge != null) {
    if (challenge == ChallengeNameType.newPasswordRequired) {
      // Show change password screen
    } else if (challenge == ChallengeNameType.smsMfa) {
      var userId = parameters['USER_ID_FOR_SRP'];
      final phoneNumber = parameters['CODE_DELIVERY_DESTINATION'];
      final medium = parameters['CODE_DELIVERY_DELIVERY_MEDIUM'];
      // Show "enter code" screen
      print('$userId $phoneNumber $medium');

      // Respond to challenge
      userId ??= email;
      final challengeResponse = await api.respondToAuthChallenge(
        challengeName: ChallengeNameType.smsMfa,
        challengeResponses: {
          'USERNAME': userId,
          'SMS_MFA_CODE': '1234',
          if (secret != null) 'SECRET_HASH': secret,
        },
        clientId: config.clientId,
        session: response.session,
      );
      print(challengeResponse.authenticationResult?.accessToken);
    } else {
      throw Exception('Challenge $challenge not supported');
    }
  }
}

class CognitoConfig {
  final String clientId;
  final String? appSecret;
  final String region;

  CognitoConfig({
    required this.clientId,
    this.appSecret,
    required this.region,
  });

  String? secretHash(String username) {
    final appSecret = this.appSecret;
    if (appSecret != null) {
      final hmacSha256 = Hmac(sha256, utf8.encode(appSecret));
      return base64Encode(
          hmacSha256.convert(utf8.encode('$username$clientId')).bytes);
    }
    return null;
  }
}
