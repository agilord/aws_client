// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-video-signaling-2019-12-04.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetIceServerConfigRequestToJson(
    GetIceServerConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('ClientId', instance.clientId);
  writeNotNull('Service', _$ServiceEnumMap[instance.service]);
  writeNotNull('Username', instance.username);
  return val;
}

const _$ServiceEnumMap = {
  Service.turn: 'TURN',
};

GetIceServerConfigResponse _$GetIceServerConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetIceServerConfigResponse(
    iceServerList: (json['IceServerList'] as List)
        ?.map((e) =>
            e == null ? null : IceServer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

IceServer _$IceServerFromJson(Map<String, dynamic> json) {
  return IceServer(
    password: json['Password'] as String,
    ttl: json['Ttl'] as int,
    uris: (json['Uris'] as List)?.map((e) => e as String)?.toList(),
    username: json['Username'] as String,
  );
}

Map<String, dynamic> _$SendAlexaOfferToMasterRequestToJson(
    SendAlexaOfferToMasterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('MessagePayload', instance.messagePayload);
  writeNotNull('SenderClientId', instance.senderClientId);
  return val;
}

SendAlexaOfferToMasterResponse _$SendAlexaOfferToMasterResponseFromJson(
    Map<String, dynamic> json) {
  return SendAlexaOfferToMasterResponse(
    answer: json['Answer'] as String,
  );
}
