// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinpoint-sms-voice-2018-09-05.dart';

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

Map<String, dynamic> _$CreateConfigurationSetEventDestinationRequestToJson(
    CreateConfigurationSetEventDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventDestination', instance.eventDestination?.toJson());
  writeNotNull('EventDestinationName', instance.eventDestinationName);
  return val;
}

CreateConfigurationSetEventDestinationResponse
    _$CreateConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateConfigurationSetEventDestinationResponse();
}

Map<String, dynamic> _$CreateConfigurationSetRequestToJson(
    CreateConfigurationSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationSetName', instance.configurationSetName);
  return val;
}

CreateConfigurationSetResponse _$CreateConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationSetResponse();
}

Map<String, dynamic> _$DeleteConfigurationSetEventDestinationRequestToJson(
        DeleteConfigurationSetEventDestinationRequest instance) =>
    <String, dynamic>{};

DeleteConfigurationSetEventDestinationResponse
    _$DeleteConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteConfigurationSetEventDestinationResponse();
}

Map<String, dynamic> _$DeleteConfigurationSetRequestToJson(
        DeleteConfigurationSetRequest instance) =>
    <String, dynamic>{};

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
    matchingEventTypes:
        (json['MatchingEventTypes'] as List)?.map((e) => e as String)?.toList(),
    name: json['Name'] as String,
    snsDestination: json['SnsDestination'] == null
        ? null
        : SnsDestination.fromJson(
            json['SnsDestination'] as Map<String, dynamic>),
  );
}

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
  writeNotNull('MatchingEventTypes', instance.matchingEventTypes);
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

Map<String, dynamic> _$SendVoiceMessageRequestToJson(
    SendVoiceMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CallerId', instance.callerId);
  writeNotNull('ConfigurationSetName', instance.configurationSetName);
  writeNotNull('Content', instance.content?.toJson());
  writeNotNull('DestinationPhoneNumber', instance.destinationPhoneNumber);
  writeNotNull('OriginationPhoneNumber', instance.originationPhoneNumber);
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

Map<String, dynamic> _$UpdateConfigurationSetEventDestinationRequestToJson(
    UpdateConfigurationSetEventDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventDestination', instance.eventDestination?.toJson());
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
