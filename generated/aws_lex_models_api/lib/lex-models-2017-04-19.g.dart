// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lex-models-2017-04-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotAliasMetadata _$BotAliasMetadataFromJson(Map<String, dynamic> json) {
  return BotAliasMetadata(
    botName: json['botName'] as String,
    botVersion: json['botVersion'] as String,
    checksum: json['checksum'] as String,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
  );
}

BotChannelAssociation _$BotChannelAssociationFromJson(
    Map<String, dynamic> json) {
  return BotChannelAssociation(
    botAlias: json['botAlias'] as String,
    botConfiguration: (json['botConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    botName: json['botName'] as String,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    failureReason: json['failureReason'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
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

const _$ChannelStatusEnumMap = {
  ChannelStatus.inProgress: 'IN_PROGRESS',
  ChannelStatus.created: 'CREATED',
  ChannelStatus.failed: 'FAILED',
};

const _$ChannelTypeEnumMap = {
  ChannelType.facebook: 'Facebook',
  ChannelType.slack: 'Slack',
  ChannelType.twilioSms: 'Twilio-Sms',
  ChannelType.kik: 'Kik',
};

BotMetadata _$BotMetadataFromJson(Map<String, dynamic> json) {
  return BotMetadata(
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String,
  );
}

const _$StatusEnumMap = {
  Status.building: 'BUILDING',
  Status.ready: 'READY',
  Status.readyBasicTesting: 'READY_BASIC_TESTING',
  Status.failed: 'FAILED',
  Status.notBuilt: 'NOT_BUILT',
};

BuiltinIntentMetadata _$BuiltinIntentMetadataFromJson(
    Map<String, dynamic> json) {
  return BuiltinIntentMetadata(
    signature: json['signature'] as String,
    supportedLocales:
        (json['supportedLocales'] as List)?.map((e) => e as String)?.toList(),
  );
}

BuiltinIntentSlot _$BuiltinIntentSlotFromJson(Map<String, dynamic> json) {
  return BuiltinIntentSlot(
    name: json['name'] as String,
  );
}

BuiltinSlotTypeMetadata _$BuiltinSlotTypeMetadataFromJson(
    Map<String, dynamic> json) {
  return BuiltinSlotTypeMetadata(
    signature: json['signature'] as String,
    supportedLocales:
        (json['supportedLocales'] as List)?.map((e) => e as String)?.toList(),
  );
}

CodeHook _$CodeHookFromJson(Map<String, dynamic> json) {
  return CodeHook(
    messageVersion: json['messageVersion'] as String,
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$CodeHookToJson(CodeHook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('messageVersion', instance.messageVersion);
  writeNotNull('uri', instance.uri);
  return val;
}

Map<String, dynamic> _$ConversationLogsRequestToJson(
    ConversationLogsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('iamRoleArn', instance.iamRoleArn);
  writeNotNull(
      'logSettings', instance.logSettings?.map((e) => e?.toJson())?.toList());
  return val;
}

ConversationLogsResponse _$ConversationLogsResponseFromJson(
    Map<String, dynamic> json) {
  return ConversationLogsResponse(
    iamRoleArn: json['iamRoleArn'] as String,
    logSettings: (json['logSettings'] as List)
        ?.map((e) => e == null
            ? null
            : LogSettingsResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateBotVersionRequestToJson(
    CreateBotVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checksum', instance.checksum);
  return val;
}

CreateBotVersionResponse _$CreateBotVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBotVersionResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String,
    childDirected: json['childDirected'] as bool,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    detectSentiment: json['detectSentiment'] as bool,
    failureReason: json['failureReason'] as String,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
    intents: (json['intents'] as List)
        ?.map((e) =>
            e == null ? null : Intent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String,
    voiceId: json['voiceId'] as String,
  );
}

const _$LocaleEnumMap = {
  Locale.enUs: 'en-US',
  Locale.enGb: 'en-GB',
  Locale.deDe: 'de-DE',
};

Map<String, dynamic> _$CreateIntentVersionRequestToJson(
    CreateIntentVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checksum', instance.checksum);
  return val;
}

CreateIntentVersionResponse _$CreateIntentVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIntentVersionResponse(
    checksum: json['checksum'] as String,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    dialogCodeHook: json['dialogCodeHook'] == null
        ? null
        : CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>),
    followUpPrompt: json['followUpPrompt'] == null
        ? null
        : FollowUpPrompt.fromJson(
            json['followUpPrompt'] as Map<String, dynamic>),
    fulfillmentActivity: json['fulfillmentActivity'] == null
        ? null
        : FulfillmentActivity.fromJson(
            json['fulfillmentActivity'] as Map<String, dynamic>),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentIntentSignature: json['parentIntentSignature'] as String,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances:
        (json['sampleUtterances'] as List)?.map((e) => e as String)?.toList(),
    slots: (json['slots'] as List)
        ?.map(
            (e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$CreateSlotTypeVersionRequestToJson(
    CreateSlotTypeVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checksum', instance.checksum);
  return val;
}

CreateSlotTypeVersionResponse _$CreateSlotTypeVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSlotTypeVersionResponse(
    checksum: json['checksum'] as String,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    enumerationValues: (json['enumerationValues'] as List)
        ?.map((e) => e == null
            ? null
            : EnumerationValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String,
  );
}

const _$SlotValueSelectionStrategyEnumMap = {
  SlotValueSelectionStrategy.originalValue: 'ORIGINAL_VALUE',
  SlotValueSelectionStrategy.topResolution: 'TOP_RESOLUTION',
};

Map<String, dynamic> _$DeleteBotAliasRequestToJson(
        DeleteBotAliasRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBotChannelAssociationRequestToJson(
        DeleteBotChannelAssociationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBotRequestToJson(DeleteBotRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBotVersionRequestToJson(
        DeleteBotVersionRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteIntentRequestToJson(
        DeleteIntentRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteIntentVersionRequestToJson(
        DeleteIntentVersionRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteSlotTypeRequestToJson(
        DeleteSlotTypeRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteSlotTypeVersionRequestToJson(
        DeleteSlotTypeVersionRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteUtterancesRequestToJson(
        DeleteUtterancesRequest instance) =>
    <String, dynamic>{};

EnumerationValue _$EnumerationValueFromJson(Map<String, dynamic> json) {
  return EnumerationValue(
    value: json['value'] as String,
    synonyms: (json['synonyms'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$EnumerationValueToJson(EnumerationValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('synonyms', instance.synonyms);
  return val;
}

FollowUpPrompt _$FollowUpPromptFromJson(Map<String, dynamic> json) {
  return FollowUpPrompt(
    prompt: json['prompt'] == null
        ? null
        : Prompt.fromJson(json['prompt'] as Map<String, dynamic>),
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FollowUpPromptToJson(FollowUpPrompt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prompt', instance.prompt?.toJson());
  writeNotNull('rejectionStatement', instance.rejectionStatement?.toJson());
  return val;
}

FulfillmentActivity _$FulfillmentActivityFromJson(Map<String, dynamic> json) {
  return FulfillmentActivity(
    type: _$enumDecodeNullable(_$FulfillmentActivityTypeEnumMap, json['type']),
    codeHook: json['codeHook'] == null
        ? null
        : CodeHook.fromJson(json['codeHook'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FulfillmentActivityToJson(FulfillmentActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$FulfillmentActivityTypeEnumMap[instance.type]);
  writeNotNull('codeHook', instance.codeHook?.toJson());
  return val;
}

const _$FulfillmentActivityTypeEnumMap = {
  FulfillmentActivityType.returnIntent: 'ReturnIntent',
  FulfillmentActivityType.codeHook: 'CodeHook',
};

GetBotAliasResponse _$GetBotAliasResponseFromJson(Map<String, dynamic> json) {
  return GetBotAliasResponse(
    botName: json['botName'] as String,
    botVersion: json['botVersion'] as String,
    checksum: json['checksum'] as String,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
  );
}

GetBotAliasesResponse _$GetBotAliasesResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotAliasesResponse(
    botAliases: (json['BotAliases'] as List)
        ?.map((e) => e == null
            ? null
            : BotAliasMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetBotChannelAssociationResponse _$GetBotChannelAssociationResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotChannelAssociationResponse(
    botAlias: json['botAlias'] as String,
    botConfiguration: (json['botConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    botName: json['botName'] as String,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    failureReason: json['failureReason'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
  );
}

GetBotChannelAssociationsResponse _$GetBotChannelAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotChannelAssociationsResponse(
    botChannelAssociations: (json['botChannelAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : BotChannelAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetBotResponse _$GetBotResponseFromJson(Map<String, dynamic> json) {
  return GetBotResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String,
    childDirected: json['childDirected'] as bool,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    detectSentiment: json['detectSentiment'] as bool,
    failureReason: json['failureReason'] as String,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
    intents: (json['intents'] as List)
        ?.map((e) =>
            e == null ? null : Intent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String,
    voiceId: json['voiceId'] as String,
  );
}

GetBotVersionsResponse _$GetBotVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotVersionsResponse(
    bots: (json['bots'] as List)
        ?.map((e) =>
            e == null ? null : BotMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetBotsResponse _$GetBotsResponseFromJson(Map<String, dynamic> json) {
  return GetBotsResponse(
    bots: (json['bots'] as List)
        ?.map((e) =>
            e == null ? null : BotMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetBuiltinIntentResponse _$GetBuiltinIntentResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinIntentResponse(
    signature: json['signature'] as String,
    slots: (json['slots'] as List)
        ?.map((e) => e == null
            ? null
            : BuiltinIntentSlot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supportedLocales:
        (json['supportedLocales'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetBuiltinIntentsResponse _$GetBuiltinIntentsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinIntentsResponse(
    intents: (json['intents'] as List)
        ?.map((e) => e == null
            ? null
            : BuiltinIntentMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetBuiltinSlotTypesResponse _$GetBuiltinSlotTypesResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinSlotTypesResponse(
    nextToken: json['nextToken'] as String,
    slotTypes: (json['slotTypes'] as List)
        ?.map((e) => e == null
            ? null
            : BuiltinSlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetExportResponse _$GetExportResponseFromJson(Map<String, dynamic> json) {
  return GetExportResponse(
    exportStatus:
        _$enumDecodeNullable(_$ExportStatusEnumMap, json['exportStatus']),
    exportType: _$enumDecodeNullable(_$ExportTypeEnumMap, json['exportType']),
    failureReason: json['failureReason'] as String,
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    url: json['url'] as String,
    version: json['version'] as String,
  );
}

const _$ExportStatusEnumMap = {
  ExportStatus.inProgress: 'IN_PROGRESS',
  ExportStatus.ready: 'READY',
  ExportStatus.failed: 'FAILED',
};

const _$ExportTypeEnumMap = {
  ExportType.alexaSkillsKit: 'ALEXA_SKILLS_KIT',
  ExportType.lex: 'LEX',
};

const _$ResourceTypeEnumMap = {
  ResourceType.bot: 'BOT',
  ResourceType.intent: 'INTENT',
  ResourceType.slotType: 'SLOT_TYPE',
};

GetImportResponse _$GetImportResponseFromJson(Map<String, dynamic> json) {
  return GetImportResponse(
    createdDate: unixTimestampFromJson(json['createdDate']),
    failureReason:
        (json['failureReason'] as List)?.map((e) => e as String)?.toList(),
    importId: json['importId'] as String,
    importStatus:
        _$enumDecodeNullable(_$ImportStatusEnumMap, json['importStatus']),
    mergeStrategy:
        _$enumDecodeNullable(_$MergeStrategyEnumMap, json['mergeStrategy']),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

const _$ImportStatusEnumMap = {
  ImportStatus.inProgress: 'IN_PROGRESS',
  ImportStatus.complete: 'COMPLETE',
  ImportStatus.failed: 'FAILED',
};

const _$MergeStrategyEnumMap = {
  MergeStrategy.overwriteLatest: 'OVERWRITE_LATEST',
  MergeStrategy.failOnConflict: 'FAIL_ON_CONFLICT',
};

GetIntentResponse _$GetIntentResponseFromJson(Map<String, dynamic> json) {
  return GetIntentResponse(
    checksum: json['checksum'] as String,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    dialogCodeHook: json['dialogCodeHook'] == null
        ? null
        : CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>),
    followUpPrompt: json['followUpPrompt'] == null
        ? null
        : FollowUpPrompt.fromJson(
            json['followUpPrompt'] as Map<String, dynamic>),
    fulfillmentActivity: json['fulfillmentActivity'] == null
        ? null
        : FulfillmentActivity.fromJson(
            json['fulfillmentActivity'] as Map<String, dynamic>),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentIntentSignature: json['parentIntentSignature'] as String,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances:
        (json['sampleUtterances'] as List)?.map((e) => e as String)?.toList(),
    slots: (json['slots'] as List)
        ?.map(
            (e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

GetIntentVersionsResponse _$GetIntentVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntentVersionsResponse(
    intents: (json['intents'] as List)
        ?.map((e) => e == null
            ? null
            : IntentMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetIntentsResponse _$GetIntentsResponseFromJson(Map<String, dynamic> json) {
  return GetIntentsResponse(
    intents: (json['intents'] as List)
        ?.map((e) => e == null
            ? null
            : IntentMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetSlotTypeResponse _$GetSlotTypeResponseFromJson(Map<String, dynamic> json) {
  return GetSlotTypeResponse(
    checksum: json['checksum'] as String,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    enumerationValues: (json['enumerationValues'] as List)
        ?.map((e) => e == null
            ? null
            : EnumerationValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String,
  );
}

GetSlotTypeVersionsResponse _$GetSlotTypeVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSlotTypeVersionsResponse(
    nextToken: json['nextToken'] as String,
    slotTypes: (json['slotTypes'] as List)
        ?.map((e) => e == null
            ? null
            : SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetSlotTypesResponse _$GetSlotTypesResponseFromJson(Map<String, dynamic> json) {
  return GetSlotTypesResponse(
    nextToken: json['nextToken'] as String,
    slotTypes: (json['slotTypes'] as List)
        ?.map((e) => e == null
            ? null
            : SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUtterancesViewResponse _$GetUtterancesViewResponseFromJson(
    Map<String, dynamic> json) {
  return GetUtterancesViewResponse(
    botName: json['botName'] as String,
    utterances: (json['utterances'] as List)
        ?.map((e) => e == null
            ? null
            : UtteranceList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Intent _$IntentFromJson(Map<String, dynamic> json) {
  return Intent(
    intentName: json['intentName'] as String,
    intentVersion: json['intentVersion'] as String,
  );
}

Map<String, dynamic> _$IntentToJson(Intent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('intentName', instance.intentName);
  writeNotNull('intentVersion', instance.intentVersion);
  return val;
}

IntentMetadata _$IntentMetadataFromJson(Map<String, dynamic> json) {
  return IntentMetadata(
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    version: json['version'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LogSettingsRequestToJson(LogSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', _$DestinationEnumMap[instance.destination]);
  writeNotNull('logType', _$LogTypeEnumMap[instance.logType]);
  writeNotNull('resourceArn', instance.resourceArn);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$DestinationEnumMap = {
  Destination.cloudwatchLogs: 'CLOUDWATCH_LOGS',
  Destination.s3: 'S3',
};

const _$LogTypeEnumMap = {
  LogType.audio: 'AUDIO',
  LogType.text: 'TEXT',
};

LogSettingsResponse _$LogSettingsResponseFromJson(Map<String, dynamic> json) {
  return LogSettingsResponse(
    destination:
        _$enumDecodeNullable(_$DestinationEnumMap, json['destination']),
    kmsKeyArn: json['kmsKeyArn'] as String,
    logType: _$enumDecodeNullable(_$LogTypeEnumMap, json['logType']),
    resourceArn: json['resourceArn'] as String,
    resourcePrefix: json['resourcePrefix'] as String,
  );
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    content: json['content'] as String,
    contentType:
        _$enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']),
    groupNumber: json['groupNumber'] as int,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('contentType', _$ContentTypeEnumMap[instance.contentType]);
  writeNotNull('groupNumber', instance.groupNumber);
  return val;
}

const _$ContentTypeEnumMap = {
  ContentType.plainText: 'PlainText',
  ContentType.ssml: 'SSML',
  ContentType.customPayload: 'CustomPayload',
};

Prompt _$PromptFromJson(Map<String, dynamic> json) {
  return Prompt(
    maxAttempts: json['maxAttempts'] as int,
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    responseCard: json['responseCard'] as String,
  );
}

Map<String, dynamic> _$PromptToJson(Prompt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxAttempts', instance.maxAttempts);
  writeNotNull(
      'messages', instance.messages?.map((e) => e?.toJson())?.toList());
  writeNotNull('responseCard', instance.responseCard);
  return val;
}

Map<String, dynamic> _$PutBotAliasRequestToJson(PutBotAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('botVersion', instance.botVersion);
  writeNotNull('checksum', instance.checksum);
  writeNotNull('conversationLogs', instance.conversationLogs?.toJson());
  writeNotNull('description', instance.description);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

PutBotAliasResponse _$PutBotAliasResponseFromJson(Map<String, dynamic> json) {
  return PutBotAliasResponse(
    botName: json['botName'] as String,
    botVersion: json['botVersion'] as String,
    checksum: json['checksum'] as String,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PutBotRequestToJson(PutBotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('childDirected', instance.childDirected);
  writeNotNull('locale', _$LocaleEnumMap[instance.locale]);
  writeNotNull('abortStatement', instance.abortStatement?.toJson());
  writeNotNull('checksum', instance.checksum);
  writeNotNull('clarificationPrompt', instance.clarificationPrompt?.toJson());
  writeNotNull('createVersion', instance.createVersion);
  writeNotNull('description', instance.description);
  writeNotNull('detectSentiment', instance.detectSentiment);
  writeNotNull('idleSessionTTLInSeconds', instance.idleSessionTTLInSeconds);
  writeNotNull('intents', instance.intents?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'processBehavior', _$ProcessBehaviorEnumMap[instance.processBehavior]);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('voiceId', instance.voiceId);
  return val;
}

const _$ProcessBehaviorEnumMap = {
  ProcessBehavior.save: 'SAVE',
  ProcessBehavior.build: 'BUILD',
};

PutBotResponse _$PutBotResponseFromJson(Map<String, dynamic> json) {
  return PutBotResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String,
    childDirected: json['childDirected'] as bool,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createVersion: json['createVersion'] as bool,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    detectSentiment: json['detectSentiment'] as bool,
    failureReason: json['failureReason'] as String,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
    intents: (json['intents'] as List)
        ?.map((e) =>
            e == null ? null : Intent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
    voiceId: json['voiceId'] as String,
  );
}

Map<String, dynamic> _$PutIntentRequestToJson(PutIntentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checksum', instance.checksum);
  writeNotNull('conclusionStatement', instance.conclusionStatement?.toJson());
  writeNotNull('confirmationPrompt', instance.confirmationPrompt?.toJson());
  writeNotNull('createVersion', instance.createVersion);
  writeNotNull('description', instance.description);
  writeNotNull('dialogCodeHook', instance.dialogCodeHook?.toJson());
  writeNotNull('followUpPrompt', instance.followUpPrompt?.toJson());
  writeNotNull('fulfillmentActivity', instance.fulfillmentActivity?.toJson());
  writeNotNull('parentIntentSignature', instance.parentIntentSignature);
  writeNotNull('rejectionStatement', instance.rejectionStatement?.toJson());
  writeNotNull('sampleUtterances', instance.sampleUtterances);
  writeNotNull('slots', instance.slots?.map((e) => e?.toJson())?.toList());
  return val;
}

PutIntentResponse _$PutIntentResponseFromJson(Map<String, dynamic> json) {
  return PutIntentResponse(
    checksum: json['checksum'] as String,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createVersion: json['createVersion'] as bool,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    dialogCodeHook: json['dialogCodeHook'] == null
        ? null
        : CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>),
    followUpPrompt: json['followUpPrompt'] == null
        ? null
        : FollowUpPrompt.fromJson(
            json['followUpPrompt'] as Map<String, dynamic>),
    fulfillmentActivity: json['fulfillmentActivity'] == null
        ? null
        : FulfillmentActivity.fromJson(
            json['fulfillmentActivity'] as Map<String, dynamic>),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentIntentSignature: json['parentIntentSignature'] as String,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances:
        (json['sampleUtterances'] as List)?.map((e) => e as String)?.toList(),
    slots: (json['slots'] as List)
        ?.map(
            (e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$PutSlotTypeRequestToJson(PutSlotTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checksum', instance.checksum);
  writeNotNull('createVersion', instance.createVersion);
  writeNotNull('description', instance.description);
  writeNotNull('enumerationValues',
      instance.enumerationValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('parentSlotTypeSignature', instance.parentSlotTypeSignature);
  writeNotNull('slotTypeConfigurations',
      instance.slotTypeConfigurations?.map((e) => e?.toJson())?.toList());
  writeNotNull('valueSelectionStrategy',
      _$SlotValueSelectionStrategyEnumMap[instance.valueSelectionStrategy]);
  return val;
}

PutSlotTypeResponse _$PutSlotTypeResponseFromJson(Map<String, dynamic> json) {
  return PutSlotTypeResponse(
    checksum: json['checksum'] as String,
    createVersion: json['createVersion'] as bool,
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    enumerationValues: (json['enumerationValues'] as List)
        ?.map((e) => e == null
            ? null
            : EnumerationValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String,
  );
}

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    name: json['name'] as String,
    slotConstraint:
        _$enumDecodeNullable(_$SlotConstraintEnumMap, json['slotConstraint']),
    description: json['description'] as String,
    obfuscationSetting: _$enumDecodeNullable(
        _$ObfuscationSettingEnumMap, json['obfuscationSetting']),
    priority: json['priority'] as int,
    responseCard: json['responseCard'] as String,
    sampleUtterances:
        (json['sampleUtterances'] as List)?.map((e) => e as String)?.toList(),
    slotType: json['slotType'] as String,
    slotTypeVersion: json['slotTypeVersion'] as String,
    valueElicitationPrompt: json['valueElicitationPrompt'] == null
        ? null
        : Prompt.fromJson(
            json['valueElicitationPrompt'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SlotToJson(Slot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull(
      'slotConstraint', _$SlotConstraintEnumMap[instance.slotConstraint]);
  writeNotNull('description', instance.description);
  writeNotNull('obfuscationSetting',
      _$ObfuscationSettingEnumMap[instance.obfuscationSetting]);
  writeNotNull('priority', instance.priority);
  writeNotNull('responseCard', instance.responseCard);
  writeNotNull('sampleUtterances', instance.sampleUtterances);
  writeNotNull('slotType', instance.slotType);
  writeNotNull('slotTypeVersion', instance.slotTypeVersion);
  writeNotNull(
      'valueElicitationPrompt', instance.valueElicitationPrompt?.toJson());
  return val;
}

const _$SlotConstraintEnumMap = {
  SlotConstraint.required: 'Required',
  SlotConstraint.optional: 'Optional',
};

const _$ObfuscationSettingEnumMap = {
  ObfuscationSetting.none: 'NONE',
  ObfuscationSetting.defaultObfuscation: 'DEFAULT_OBFUSCATION',
};

SlotTypeConfiguration _$SlotTypeConfigurationFromJson(
    Map<String, dynamic> json) {
  return SlotTypeConfiguration(
    regexConfiguration: json['regexConfiguration'] == null
        ? null
        : SlotTypeRegexConfiguration.fromJson(
            json['regexConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SlotTypeConfigurationToJson(
    SlotTypeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('regexConfiguration', instance.regexConfiguration?.toJson());
  return val;
}

SlotTypeMetadata _$SlotTypeMetadataFromJson(Map<String, dynamic> json) {
  return SlotTypeMetadata(
    createdDate: unixTimestampFromJson(json['createdDate']),
    description: json['description'] as String,
    lastUpdatedDate: unixTimestampFromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    version: json['version'] as String,
  );
}

SlotTypeRegexConfiguration _$SlotTypeRegexConfigurationFromJson(
    Map<String, dynamic> json) {
  return SlotTypeRegexConfiguration(
    pattern: json['pattern'] as String,
  );
}

Map<String, dynamic> _$SlotTypeRegexConfigurationToJson(
    SlotTypeRegexConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pattern', instance.pattern);
  return val;
}

Map<String, dynamic> _$StartImportRequestToJson(StartImportRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mergeStrategy', _$MergeStrategyEnumMap[instance.mergeStrategy]);
  writeNotNull('payload', const Uint8ListConverter().toJson(instance.payload));
  writeNotNull('resourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

StartImportResponse _$StartImportResponseFromJson(Map<String, dynamic> json) {
  return StartImportResponse(
    createdDate: unixTimestampFromJson(json['createdDate']),
    importId: json['importId'] as String,
    importStatus:
        _$enumDecodeNullable(_$ImportStatusEnumMap, json['importStatus']),
    mergeStrategy:
        _$enumDecodeNullable(_$MergeStrategyEnumMap, json['mergeStrategy']),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    responseCard: json['responseCard'] as String,
  );
}

Map<String, dynamic> _$StatementToJson(Statement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'messages', instance.messages?.map((e) => e?.toJson())?.toList());
  writeNotNull('responseCard', instance.responseCard);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UtteranceData _$UtteranceDataFromJson(Map<String, dynamic> json) {
  return UtteranceData(
    count: json['count'] as int,
    distinctUsers: json['distinctUsers'] as int,
    firstUtteredDate: unixTimestampFromJson(json['firstUtteredDate']),
    lastUtteredDate: unixTimestampFromJson(json['lastUtteredDate']),
    utteranceString: json['utteranceString'] as String,
  );
}

UtteranceList _$UtteranceListFromJson(Map<String, dynamic> json) {
  return UtteranceList(
    botVersion: json['botVersion'] as String,
    utterances: (json['utterances'] as List)
        ?.map((e) => e == null
            ? null
            : UtteranceData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
