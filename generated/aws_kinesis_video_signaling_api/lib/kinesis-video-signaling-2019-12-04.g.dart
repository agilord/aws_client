// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-video-signaling-2019-12-04.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIceServerConfigResponse _$GetIceServerConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetIceServerConfigResponse(
    iceServerList: (json['IceServerList'] as List<dynamic>?)
        ?.map((e) => IceServer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

IceServer _$IceServerFromJson(Map<String, dynamic> json) {
  return IceServer(
    password: json['Password'] as String?,
    ttl: json['Ttl'] as int?,
    uris: (json['Uris'] as List<dynamic>?)?.map((e) => e as String).toList(),
    username: json['Username'] as String?,
  );
}

SendAlexaOfferToMasterResponse _$SendAlexaOfferToMasterResponseFromJson(
    Map<String, dynamic> json) {
  return SendAlexaOfferToMasterResponse(
    answer: json['Answer'] as String?,
  );
}
