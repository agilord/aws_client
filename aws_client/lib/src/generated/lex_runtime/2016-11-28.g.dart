// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-11-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveContext _$ActiveContextFromJson(Map<String, dynamic> json) {
  return ActiveContext(
    name: json['name'] as String,
    parameters: (json['parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeToLive: json['timeToLive'] == null
        ? null
        : ActiveContextTimeToLive.fromJson(
            json['timeToLive'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActiveContextToJson(ActiveContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('timeToLive', instance.timeToLive?.toJson());
  return val;
}

ActiveContextTimeToLive _$ActiveContextTimeToLiveFromJson(
    Map<String, dynamic> json) {
  return ActiveContextTimeToLive(
    timeToLiveInSeconds: json['timeToLiveInSeconds'] as int,
    turnsToLive: json['turnsToLive'] as int,
  );
}

Map<String, dynamic> _$ActiveContextTimeToLiveToJson(
    ActiveContextTimeToLive instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeToLiveInSeconds', instance.timeToLiveInSeconds);
  writeNotNull('turnsToLive', instance.turnsToLive);
  return val;
}

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return Button(
    text: json['text'] as String,
    value: json['value'] as String,
  );
}

DeleteSessionResponse _$DeleteSessionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSessionResponse(
    botAlias: json['botAlias'] as String,
    botName: json['botName'] as String,
    sessionId: json['sessionId'] as String,
    userId: json['userId'] as String,
  );
}

DialogAction _$DialogActionFromJson(Map<String, dynamic> json) {
  return DialogAction(
    type: _$enumDecodeNullable(_$DialogActionTypeEnumMap, json['type']),
    fulfillmentState: _$enumDecodeNullable(
        _$FulfillmentStateEnumMap, json['fulfillmentState']),
    intentName: json['intentName'] as String,
    message: json['message'] as String,
    messageFormat:
        _$enumDecodeNullable(_$MessageFormatTypeEnumMap, json['messageFormat']),
    slotToElicit: json['slotToElicit'] as String,
    slots: (json['slots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DialogActionToJson(DialogAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DialogActionTypeEnumMap[instance.type]);
  writeNotNull(
      'fulfillmentState', _$FulfillmentStateEnumMap[instance.fulfillmentState]);
  writeNotNull('intentName', instance.intentName);
  writeNotNull('message', instance.message);
  writeNotNull(
      'messageFormat', _$MessageFormatTypeEnumMap[instance.messageFormat]);
  writeNotNull('slotToElicit', instance.slotToElicit);
  writeNotNull('slots', instance.slots);
  return val;
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

const _$DialogActionTypeEnumMap = {
  DialogActionType.elicitIntent: 'ElicitIntent',
  DialogActionType.confirmIntent: 'ConfirmIntent',
  DialogActionType.elicitSlot: 'ElicitSlot',
  DialogActionType.close: 'Close',
  DialogActionType.delegate: 'Delegate',
};

const _$FulfillmentStateEnumMap = {
  FulfillmentState.fulfilled: 'Fulfilled',
  FulfillmentState.failed: 'Failed',
  FulfillmentState.readyForFulfillment: 'ReadyForFulfillment',
};

const _$MessageFormatTypeEnumMap = {
  MessageFormatType.plainText: 'PlainText',
  MessageFormatType.customPayload: 'CustomPayload',
  MessageFormatType.ssml: 'SSML',
  MessageFormatType.composite: 'Composite',
};

GenericAttachment _$GenericAttachmentFromJson(Map<String, dynamic> json) {
  return GenericAttachment(
    attachmentLinkUrl: json['attachmentLinkUrl'] as String,
    buttons: (json['buttons'] as List)
        ?.map((e) =>
            e == null ? null : Button.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageUrl: json['imageUrl'] as String,
    subTitle: json['subTitle'] as String,
    title: json['title'] as String,
  );
}

GetSessionResponse _$GetSessionResponseFromJson(Map<String, dynamic> json) {
  return GetSessionResponse(
    activeContexts: (json['activeContexts'] as List)
        ?.map((e) => e == null
            ? null
            : ActiveContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dialogAction: json['dialogAction'] == null
        ? null
        : DialogAction.fromJson(json['dialogAction'] as Map<String, dynamic>),
    recentIntentSummaryView: (json['recentIntentSummaryView'] as List)
        ?.map((e) => e == null
            ? null
            : IntentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    sessionId: json['sessionId'] as String,
  );
}

IntentConfidence _$IntentConfidenceFromJson(Map<String, dynamic> json) {
  return IntentConfidence(
    score: (json['score'] as num)?.toDouble(),
  );
}

IntentSummary _$IntentSummaryFromJson(Map<String, dynamic> json) {
  return IntentSummary(
    dialogActionType: _$enumDecodeNullable(
        _$DialogActionTypeEnumMap, json['dialogActionType']),
    checkpointLabel: json['checkpointLabel'] as String,
    confirmationStatus: _$enumDecodeNullable(
        _$ConfirmationStatusEnumMap, json['confirmationStatus']),
    fulfillmentState: _$enumDecodeNullable(
        _$FulfillmentStateEnumMap, json['fulfillmentState']),
    intentName: json['intentName'] as String,
    slotToElicit: json['slotToElicit'] as String,
    slots: (json['slots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$IntentSummaryToJson(IntentSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'dialogActionType', _$DialogActionTypeEnumMap[instance.dialogActionType]);
  writeNotNull('checkpointLabel', instance.checkpointLabel);
  writeNotNull('confirmationStatus',
      _$ConfirmationStatusEnumMap[instance.confirmationStatus]);
  writeNotNull(
      'fulfillmentState', _$FulfillmentStateEnumMap[instance.fulfillmentState]);
  writeNotNull('intentName', instance.intentName);
  writeNotNull('slotToElicit', instance.slotToElicit);
  writeNotNull('slots', instance.slots);
  return val;
}

const _$ConfirmationStatusEnumMap = {
  ConfirmationStatus.none: 'None',
  ConfirmationStatus.confirmed: 'Confirmed',
  ConfirmationStatus.denied: 'Denied',
};

PostContentResponse _$PostContentResponseFromJson(Map<String, dynamic> json) {
  return PostContentResponse(
    activeContexts: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-active-contexts'] as String),
    alternativeIntents: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-alternative-intents'] as String),
    audioStream:
        const Uint8ListConverter().fromJson(json['audioStream'] as String),
    botVersion: json['x-amz-lex-bot-version'] as String,
    contentType: json['Content-Type'] as String,
    dialogState: _$enumDecodeNullable(
        _$DialogStateEnumMap, json['x-amz-lex-dialog-state']),
    inputTranscript: json['x-amz-lex-input-transcript'] as String,
    intentName: json['x-amz-lex-intent-name'] as String,
    message: json['x-amz-lex-message'] as String,
    messageFormat: _$enumDecodeNullable(
        _$MessageFormatTypeEnumMap, json['x-amz-lex-message-format']),
    nluIntentConfidence: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-nlu-intent-confidence'] as String),
    sentimentResponse: json['x-amz-lex-sentiment'] as String,
    sessionAttributes: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-session-attributes'] as String),
    sessionId: json['x-amz-lex-session-id'] as String,
    slotToElicit: json['x-amz-lex-slot-to-elicit'] as String,
    slots:
        const Base64JsonConverter().fromJson(json['x-amz-lex-slots'] as String),
  );
}

const _$DialogStateEnumMap = {
  DialogState.elicitIntent: 'ElicitIntent',
  DialogState.confirmIntent: 'ConfirmIntent',
  DialogState.elicitSlot: 'ElicitSlot',
  DialogState.fulfilled: 'Fulfilled',
  DialogState.readyForFulfillment: 'ReadyForFulfillment',
  DialogState.failed: 'Failed',
};

PostTextResponse _$PostTextResponseFromJson(Map<String, dynamic> json) {
  return PostTextResponse(
    activeContexts: (json['activeContexts'] as List)
        ?.map((e) => e == null
            ? null
            : ActiveContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    alternativeIntents: (json['alternativeIntents'] as List)
        ?.map((e) => e == null
            ? null
            : PredictedIntent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    botVersion: json['botVersion'] as String,
    dialogState:
        _$enumDecodeNullable(_$DialogStateEnumMap, json['dialogState']),
    intentName: json['intentName'] as String,
    message: json['message'] as String,
    messageFormat:
        _$enumDecodeNullable(_$MessageFormatTypeEnumMap, json['messageFormat']),
    nluIntentConfidence: json['nluIntentConfidence'] == null
        ? null
        : IntentConfidence.fromJson(
            json['nluIntentConfidence'] as Map<String, dynamic>),
    responseCard: json['responseCard'] == null
        ? null
        : ResponseCard.fromJson(json['responseCard'] as Map<String, dynamic>),
    sentimentResponse: json['sentimentResponse'] == null
        ? null
        : SentimentResponse.fromJson(
            json['sentimentResponse'] as Map<String, dynamic>),
    sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    sessionId: json['sessionId'] as String,
    slotToElicit: json['slotToElicit'] as String,
    slots: (json['slots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PredictedIntent _$PredictedIntentFromJson(Map<String, dynamic> json) {
  return PredictedIntent(
    intentName: json['intentName'] as String,
    nluIntentConfidence: json['nluIntentConfidence'] == null
        ? null
        : IntentConfidence.fromJson(
            json['nluIntentConfidence'] as Map<String, dynamic>),
    slots: (json['slots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PutSessionResponse _$PutSessionResponseFromJson(Map<String, dynamic> json) {
  return PutSessionResponse(
    activeContexts: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-active-contexts'] as String),
    audioStream:
        const Uint8ListConverter().fromJson(json['audioStream'] as String),
    contentType: json['Content-Type'] as String,
    dialogState: _$enumDecodeNullable(
        _$DialogStateEnumMap, json['x-amz-lex-dialog-state']),
    intentName: json['x-amz-lex-intent-name'] as String,
    message: json['x-amz-lex-message'] as String,
    messageFormat: _$enumDecodeNullable(
        _$MessageFormatTypeEnumMap, json['x-amz-lex-message-format']),
    sessionAttributes: const Base64JsonConverter()
        .fromJson(json['x-amz-lex-session-attributes'] as String),
    sessionId: json['x-amz-lex-session-id'] as String,
    slotToElicit: json['x-amz-lex-slot-to-elicit'] as String,
    slots:
        const Base64JsonConverter().fromJson(json['x-amz-lex-slots'] as String),
  );
}

ResponseCard _$ResponseCardFromJson(Map<String, dynamic> json) {
  return ResponseCard(
    contentType:
        _$enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']),
    genericAttachments: (json['genericAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : GenericAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

const _$ContentTypeEnumMap = {
  ContentType.applicationVndAmazonawsCardGeneric:
      'application/vnd.amazonaws.card.generic',
};

SentimentResponse _$SentimentResponseFromJson(Map<String, dynamic> json) {
  return SentimentResponse(
    sentimentLabel: json['sentimentLabel'] as String,
    sentimentScore: json['sentimentScore'] as String,
  );
}
