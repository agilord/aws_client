// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentItem _$AttachmentItemFromJson(Map<String, dynamic> json) {
  return AttachmentItem(
    attachmentId: json['AttachmentId'] as String,
    attachmentName: json['AttachmentName'] as String,
    contentType: json['ContentType'] as String,
    status: _$enumDecodeNullable(_$ArtifactStatusEnumMap, json['Status']),
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

const _$ArtifactStatusEnumMap = {
  ArtifactStatus.approved: 'APPROVED',
  ArtifactStatus.rejected: 'REJECTED',
  ArtifactStatus.inProgress: 'IN_PROGRESS',
};

CompleteAttachmentUploadResponse _$CompleteAttachmentUploadResponseFromJson(
    Map<String, dynamic> json) {
  return CompleteAttachmentUploadResponse();
}

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

GetAttachmentResponse _$GetAttachmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetAttachmentResponse(
    url: json['Url'] as String,
    urlExpiry: json['UrlExpiry'] as String,
  );
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
    attachments: (json['Attachments'] as List)
        ?.map((e) => e == null
            ? null
            : AttachmentItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

const _$ParticipantRoleEnumMap = {
  ParticipantRole.agent: 'AGENT',
  ParticipantRole.customer: 'CUSTOMER',
  ParticipantRole.system: 'SYSTEM',
};

const _$ChatItemTypeEnumMap = {
  ChatItemType.typing: 'TYPING',
  ChatItemType.participantJoined: 'PARTICIPANT_JOINED',
  ChatItemType.participantLeft: 'PARTICIPANT_LEFT',
  ChatItemType.chatEnded: 'CHAT_ENDED',
  ChatItemType.transferSucceeded: 'TRANSFER_SUCCEEDED',
  ChatItemType.transferFailed: 'TRANSFER_FAILED',
  ChatItemType.message: 'MESSAGE',
  ChatItemType.event: 'EVENT',
  ChatItemType.attachment: 'ATTACHMENT',
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

StartAttachmentUploadResponse _$StartAttachmentUploadResponseFromJson(
    Map<String, dynamic> json) {
  return StartAttachmentUploadResponse(
    attachmentId: json['AttachmentId'] as String,
    uploadMetadata: json['UploadMetadata'] == null
        ? null
        : UploadMetadata.fromJson(
            json['UploadMetadata'] as Map<String, dynamic>),
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

UploadMetadata _$UploadMetadataFromJson(Map<String, dynamic> json) {
  return UploadMetadata(
    headersToInclude: (json['HeadersToInclude'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    url: json['Url'] as String,
    urlExpiry: json['UrlExpiry'] as String,
  );
}

Websocket _$WebsocketFromJson(Map<String, dynamic> json) {
  return Websocket(
    connectionExpiry: json['ConnectionExpiry'] as String,
    url: json['Url'] as String,
  );
}
