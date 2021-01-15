// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CallInstructionsMessageTypeToJson(
    CallInstructionsMessageType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  return val;
}

CloudWatchLogsDestination _$CloudWatchLogsDestinationFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLogsDestination(
    iamRoleArn: json['IamRoleArn'] as String,
    logGroupArn: json['LogGroupArn'] as String,
  );
}

Map<String, dynamic> _$CloudWatchLogsDestinationToJson(
    CloudWatchLogsDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('LogGroupArn', instance.logGroupArn);
  return val;
}

CreateConfigurationSetEventDestinationResponse
    _$CreateConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateConfigurationSetEventDestinationResponse();
}

CreateConfigurationSetResponse _$CreateConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationSetResponse();
}

DeleteConfigurationSetEventDestinationResponse
    _$DeleteConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteConfigurationSetEventDestinationResponse();
}

DeleteConfigurationSetResponse _$DeleteConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConfigurationSetResponse();
}

EventDestination _$EventDestinationFromJson(Map<String, dynamic> json) {
  return EventDestination(
    cloudWatchLogsDestination: json['CloudWatchLogsDestination'] == null
        ? null
        : CloudWatchLogsDestination.fromJson(
            json['CloudWatchLogsDestination'] as Map<String, dynamic>),
    enabled: json['Enabled'] as bool,
    kinesisFirehoseDestination: json['KinesisFirehoseDestination'] == null
        ? null
        : KinesisFirehoseDestination.fromJson(
            json['KinesisFirehoseDestination'] as Map<String, dynamic>),
    matchingEventTypes: (json['MatchingEventTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EventTypeEnumMap, e))
        ?.toList(),
    name: json['Name'] as String,
    snsDestination: json['SnsDestination'] == null
        ? null
        : SnsDestination.fromJson(
            json['SnsDestination'] as Map<String, dynamic>),
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

const _$EventTypeEnumMap = {
  EventType.initiatedCall: 'INITIATED_CALL',
  EventType.ringing: 'RINGING',
  EventType.answered: 'ANSWERED',
  EventType.completedCall: 'COMPLETED_CALL',
  EventType.busy: 'BUSY',
  EventType.failed: 'FAILED',
  EventType.noAnswer: 'NO_ANSWER',
};

Map<String, dynamic> _$EventDestinationDefinitionToJson(
    EventDestinationDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchLogsDestination',
      instance.cloudWatchLogsDestination?.toJson());
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KinesisFirehoseDestination',
      instance.kinesisFirehoseDestination?.toJson());
  writeNotNull('MatchingEventTypes',
      instance.matchingEventTypes?.map((e) => _$EventTypeEnumMap[e])?.toList());
  writeNotNull('SnsDestination', instance.snsDestination?.toJson());
  return val;
}

GetConfigurationSetEventDestinationsResponse
    _$GetConfigurationSetEventDestinationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetConfigurationSetEventDestinationsResponse(
    eventDestinations: (json['EventDestinations'] as List)
        ?.map((e) => e == null
            ? null
            : EventDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

KinesisFirehoseDestination _$KinesisFirehoseDestinationFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseDestination(
    deliveryStreamArn: json['DeliveryStreamArn'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
  );
}

Map<String, dynamic> _$KinesisFirehoseDestinationToJson(
    KinesisFirehoseDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryStreamArn', instance.deliveryStreamArn);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  return val;
}

ListConfigurationSetsResponse _$ListConfigurationSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationSetsResponse(
    configurationSets:
        (json['ConfigurationSets'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$PlainTextMessageTypeToJson(
    PlainTextMessageType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('Text', instance.text);
  writeNotNull('VoiceId', instance.voiceId);
  return val;
}

Map<String, dynamic> _$SSMLMessageTypeToJson(SSMLMessageType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('Text', instance.text);
  writeNotNull('VoiceId', instance.voiceId);
  return val;
}

SendVoiceMessageResponse _$SendVoiceMessageResponseFromJson(
    Map<String, dynamic> json) {
  return SendVoiceMessageResponse(
    messageId: json['MessageId'] as String,
  );
}

SnsDestination _$SnsDestinationFromJson(Map<String, dynamic> json) {
  return SnsDestination(
    topicArn: json['TopicArn'] as String,
  );
}

Map<String, dynamic> _$SnsDestinationToJson(SnsDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

UpdateConfigurationSetEventDestinationResponse
    _$UpdateConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateConfigurationSetEventDestinationResponse();
}

Map<String, dynamic> _$VoiceMessageContentToJson(VoiceMessageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CallInstructionsMessage', instance.callInstructionsMessage?.toJson());
  writeNotNull('PlainTextMessage', instance.plainTextMessage?.toJson());
  writeNotNull('SSMLMessage', instance.sSMLMessage?.toJson());
  return val;
}
