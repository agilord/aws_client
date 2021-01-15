// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-06-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTokenResponse _$CreateTokenResponseFromJson(Map<String, dynamic> json) {
  return CreateTokenResponse(
    accessToken: json['accessToken'] as String,
    expiresIn: json['expiresIn'] as int,
    idToken: json['idToken'] as String,
    refreshToken: json['refreshToken'] as String,
    tokenType: json['tokenType'] as String,
  );
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
