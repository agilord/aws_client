// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso-oidc-2019-06-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateTokenRequestToJson(CreateTokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('deviceCode', instance.deviceCode);
  writeNotNull('grantType', instance.grantType);
  writeNotNull('code', instance.code);
  writeNotNull('redirectUri', instance.redirectUri);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('scope', instance.scope);
  return val;
}

CreateTokenResponse _$CreateTokenResponseFromJson(Map<String, dynamic> json) {
  return CreateTokenResponse(
    accessToken: json['accessToken'] as String,
    expiresIn: json['expiresIn'] as int,
    idToken: json['idToken'] as String,
    refreshToken: json['refreshToken'] as String,
    tokenType: json['tokenType'] as String,
  );
}

Map<String, dynamic> _$RegisterClientRequestToJson(
    RegisterClientRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientName', instance.clientName);
  writeNotNull('clientType', instance.clientType);
  writeNotNull('scopes', instance.scopes);
  return val;
}

RegisterClientResponse _$RegisterClientResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterClientResponse(
    authorizationEndpoint: json['authorizationEndpoint'] as String,
    clientId: json['clientId'] as String,
    clientIdIssuedAt: json['clientIdIssuedAt'] as int,
    clientSecret: json['clientSecret'] as String,
    clientSecretExpiresAt: json['clientSecretExpiresAt'] as int,
    tokenEndpoint: json['tokenEndpoint'] as String,
  );
}

Map<String, dynamic> _$StartDeviceAuthorizationRequestToJson(
    StartDeviceAuthorizationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('startUrl', instance.startUrl);
  return val;
}

StartDeviceAuthorizationResponse _$StartDeviceAuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return StartDeviceAuthorizationResponse(
    deviceCode: json['deviceCode'] as String,
    expiresIn: json['expiresIn'] as int,
    interval: json['interval'] as int,
    userCode: json['userCode'] as String,
    verificationUri: json['verificationUri'] as String,
    verificationUriComplete: json['verificationUriComplete'] as String,
  );
}
