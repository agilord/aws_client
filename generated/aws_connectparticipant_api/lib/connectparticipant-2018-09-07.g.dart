// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectparticipant-2018-09-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionCredentials _$ConnectionCredentialsFromJson(
    Map<String, dynamic> json) {
  return ConnectionCredentials(
    connectionToken: json['ConnectionToken'] as String,
    expiry: json['Expiry'] as String,
  );
}

CreateParticipantConnectionResponse
    _$CreateParticipantConnectionResponseFromJson(Map<String, dynamic> json) {
  return CreateParticipantConnectionResponse(
    connectionCredentials: json['ConnectionCredentials'] == null
        ? null
        : ConnectionCredentials.fromJson(
            json['ConnectionCredentials'] as Map<String, dynamic>),
    websocket: json['Websocket'] == null
        ? null
        : Websocket.fromJson(json['Websocket'] as Map<String, dynamic>),
  );
}

DisconnectParticipantResponse _$DisconnectParticipantResponseFromJson(
    Map<String, dynamic> json) {
  return DisconnectParticipantResponse();
}

GetTranscriptResponse _$GetTranscriptResponseFromJson(
    Map<String, dynamic> json) {
  return GetTranscriptResponse(
    initialContactId: json['InitialContactId'] as String,
    nextToken: json['NextToken'] as String,
    transcript: (json['Transcript'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    absoluteTime: json['AbsoluteTime'] as String,
    content: json['Content'] as String,
    contentType: json['ContentType'] as String,
    displayName: json['DisplayName'] as String,
    id: json['Id'] as String,
    participantId: json['ParticipantId'] as String,
    participantRole:
        _$enumDecodeNullable(_$ParticipantRoleEnumMap, json['ParticipantRole']),
    type: _$enumDecodeNullable(_$ChatItemTypeEnumMap, json['Type']),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ParticipantRoleEnumMap = {
  ParticipantRole.agent: 'AGENT',
  ParticipantRole.customer: 'CUSTOMER',
  ParticipantRole.system: 'SYSTEM',
};

const _$ChatItemTypeEnumMap = {
  ChatItemType.message: 'MESSAGE',
  ChatItemType.event: 'EVENT',
  ChatItemType.connectionAck: 'CONNECTION_ACK',
};

SendEventResponse _$SendEventResponseFromJson(Map<String, dynamic> json) {
  return SendEventResponse(
    absoluteTime: json['AbsoluteTime'] as String,
    id: json['Id'] as String,
  );
}

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) {
  return SendMessageResponse(
    absoluteTime: json['AbsoluteTime'] as String,
    id: json['Id'] as String,
  );
}

Map<String, dynamic> _$StartPositionToJson(StartPosition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AbsoluteTime', instance.absoluteTime);
  writeNotNull('Id', instance.id);
  writeNotNull('MostRecent', instance.mostRecent);
  return val;
}

Websocket _$WebsocketFromJson(Map<String, dynamic> json) {
  return Websocket(
    connectionExpiry: json['ConnectionExpiry'] as String,
    url: json['Url'] as String,
  );
}
