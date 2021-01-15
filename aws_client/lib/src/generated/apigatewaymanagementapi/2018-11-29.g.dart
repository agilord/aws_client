// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConnectionResponse _$GetConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionResponse(
    connectedAt: const IsoDateTimeConverter().fromJson(json['connectedAt']),
    identity: json['identity'] == null
        ? null
        : Identity.fromJson(json['identity'] as Map<String, dynamic>),
    lastActiveAt: const IsoDateTimeConverter().fromJson(json['lastActiveAt']),
  );
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    sourceIp: json['sourceIp'] as String,
    userAgent: json['userAgent'] as String,
  );
}
