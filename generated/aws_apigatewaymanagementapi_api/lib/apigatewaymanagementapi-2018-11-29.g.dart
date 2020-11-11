// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apigatewaymanagementapi-2018-11-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeleteConnectionRequestToJson(
        DeleteConnectionRequest instance) =>
    <String, dynamic>{};

GetConnectionResponse _$GetConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionResponse(
    connectedAt: iso8601FromJson(json['connectedAt'] as String),
    identity: json['identity'] == null
        ? null
        : Identity.fromJson(json['identity'] as Map<String, dynamic>),
    lastActiveAt: iso8601FromJson(json['lastActiveAt'] as String),
  );
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    sourceIp: json['sourceIp'] as String,
    userAgent: json['userAgent'] as String,
  );
}
