// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lex-models-2017-04-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotAliasMetadata _$BotAliasMetadataFromJson(Map<String, dynamic> json) {
  return BotAliasMetadata(
    botName: json['botName'] as String?,
    botVersion: json['botVersion'] as String?,
    checksum: json['checksum'] as String?,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
  );
}

BotChannelAssociation _$BotChannelAssociationFromJson(
    Map<String, dynamic> json) {
  return BotChannelAssociation(
    botAlias: json['botAlias'] as String?,
    botConfiguration: (json['botConfiguration'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    botName: json['botName'] as String?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    failureReason: json['failureReason'] as String?,
    name: json['name'] as String?,
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
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
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String?,
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
    signature: json['signature'] as String?,
    supportedLocales: (json['supportedLocales'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$LocaleEnumMap, e))
        .toList(),
  );
}

const _$LocaleEnumMap = {
  Locale.deDe: 'de-DE',
  Locale.enAu: 'en-AU',
  Locale.enGb: 'en-GB',
  Locale.enUs: 'en-US',
  Locale.es_419: 'es-419',
  Locale.esEs: 'es-ES',
  Locale.esUs: 'es-US',
  Locale.frFr: 'fr-FR',
  Locale.frCa: 'fr-CA',
  Locale.itIt: 'it-IT',
};

BuiltinIntentSlot _$BuiltinIntentSlotFromJson(Map<String, dynamic> json) {
  return BuiltinIntentSlot(
    name: json['name'] as String?,
  );
}

BuiltinSlotTypeMetadata _$BuiltinSlotTypeMetadataFromJson(
    Map<String, dynamic> json) {
  return BuiltinSlotTypeMetadata(
    signature: json['signature'] as String?,
    supportedLocales: (json['supportedLocales'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$LocaleEnumMap, e))
        .toList(),
  );
}

CodeHook _$CodeHookFromJson(Map<String, dynamic> json) {
  return CodeHook(
    messageVersion: json['messageVersion'] as String,
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$CodeHookToJson(CodeHook instance) => <String, dynamic>{
      'messageVersion': instance.messageVersion,
      'uri': instance.uri,
    };

Map<String, dynamic> _$ConversationLogsRequestToJson(
        ConversationLogsRequest instance) =>
    <String, dynamic>{
      'iamRoleArn': instance.iamRoleArn,
      'logSettings': instance.logSettings.map((e) => e.toJson()).toList(),
    };

ConversationLogsResponse _$ConversationLogsResponseFromJson(
    Map<String, dynamic> json) {
  return ConversationLogsResponse(
    iamRoleArn: json['iamRoleArn'] as String?,
    logSettings: (json['logSettings'] as List<dynamic>?)
        ?.map((e) => LogSettingsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

CreateBotVersionResponse _$CreateBotVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBotVersionResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String?,
    childDirected: json['childDirected'] as bool?,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    detectSentiment: json['detectSentiment'] as bool?,
    enableModelImprovements: json['enableModelImprovements'] as bool?,
    failureReason: json['failureReason'] as String?,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => Intent.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String?,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String?,
    voiceId: json['voiceId'] as String?,
  );
}

CreateIntentVersionResponse _$CreateIntentVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIntentVersionResponse(
    checksum: json['checksum'] as String?,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
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
    inputContexts: (json['inputContexts'] as List<dynamic>?)
        ?.map((e) => InputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    kendraConfiguration: json['kendraConfiguration'] == null
        ? null
        : KendraConfiguration.fromJson(
            json['kendraConfiguration'] as Map<String, dynamic>),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    outputContexts: (json['outputContexts'] as List<dynamic>?)
        ?.map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    parentIntentSignature: json['parentIntentSignature'] as String?,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances: (json['sampleUtterances'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    slots: (json['slots'] as List<dynamic>?)
        ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
        .toList(),
    version: json['version'] as String?,
  );
}

CreateSlotTypeVersionResponse _$CreateSlotTypeVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSlotTypeVersionResponse(
    checksum: json['checksum'] as String?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    enumerationValues: (json['enumerationValues'] as List<dynamic>?)
        ?.map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List<dynamic>?)
        ?.map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String?,
  );
}

const _$SlotValueSelectionStrategyEnumMap = {
  SlotValueSelectionStrategy.originalValue: 'ORIGINAL_VALUE',
  SlotValueSelectionStrategy.topResolution: 'TOP_RESOLUTION',
};

EnumerationValue _$EnumerationValueFromJson(Map<String, dynamic> json) {
  return EnumerationValue(
    value: json['value'] as String,
    synonyms:
        (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$EnumerationValueToJson(EnumerationValue instance) {
  final val = <String, dynamic>{
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('synonyms', instance.synonyms);
  return val;
}

FollowUpPrompt _$FollowUpPromptFromJson(Map<String, dynamic> json) {
  return FollowUpPrompt(
    prompt: Prompt.fromJson(json['prompt'] as Map<String, dynamic>),
    rejectionStatement:
        Statement.fromJson(json['rejectionStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FollowUpPromptToJson(FollowUpPrompt instance) =>
    <String, dynamic>{
      'prompt': instance.prompt.toJson(),
      'rejectionStatement': instance.rejectionStatement.toJson(),
    };

FulfillmentActivity _$FulfillmentActivityFromJson(Map<String, dynamic> json) {
  return FulfillmentActivity(
    type: _$enumDecode(_$FulfillmentActivityTypeEnumMap, json['type']),
    codeHook: json['codeHook'] == null
        ? null
        : CodeHook.fromJson(json['codeHook'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FulfillmentActivityToJson(FulfillmentActivity instance) {
  final val = <String, dynamic>{
    'type': _$FulfillmentActivityTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codeHook', instance.codeHook?.toJson());
  return val;
}

const _$FulfillmentActivityTypeEnumMap = {
  FulfillmentActivityType.returnIntent: 'ReturnIntent',
  FulfillmentActivityType.codeHook: 'CodeHook',
};

GetBotAliasResponse _$GetBotAliasResponseFromJson(Map<String, dynamic> json) {
  return GetBotAliasResponse(
    botName: json['botName'] as String?,
    botVersion: json['botVersion'] as String?,
    checksum: json['checksum'] as String?,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
  );
}

GetBotAliasesResponse _$GetBotAliasesResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotAliasesResponse(
    botAliases: (json['BotAliases'] as List<dynamic>?)
        ?.map((e) => BotAliasMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetBotChannelAssociationResponse _$GetBotChannelAssociationResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotChannelAssociationResponse(
    botAlias: json['botAlias'] as String?,
    botConfiguration: (json['botConfiguration'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    botName: json['botName'] as String?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    failureReason: json['failureReason'] as String?,
    name: json['name'] as String?,
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
  );
}

GetBotChannelAssociationsResponse _$GetBotChannelAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotChannelAssociationsResponse(
    botChannelAssociations: (json['botChannelAssociations'] as List<dynamic>?)
        ?.map((e) => BotChannelAssociation.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetBotResponse _$GetBotResponseFromJson(Map<String, dynamic> json) {
  return GetBotResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String?,
    childDirected: json['childDirected'] as bool?,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    detectSentiment: json['detectSentiment'] as bool?,
    enableModelImprovements: json['enableModelImprovements'] as bool?,
    failureReason: json['failureReason'] as String?,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => Intent.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String?,
    nluIntentConfidenceThreshold:
        (json['nluIntentConfidenceThreshold'] as num?)?.toDouble(),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    version: json['version'] as String?,
    voiceId: json['voiceId'] as String?,
  );
}

GetBotVersionsResponse _$GetBotVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBotVersionsResponse(
    bots: (json['bots'] as List<dynamic>?)
        ?.map((e) => BotMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetBotsResponse _$GetBotsResponseFromJson(Map<String, dynamic> json) {
  return GetBotsResponse(
    bots: (json['bots'] as List<dynamic>?)
        ?.map((e) => BotMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetBuiltinIntentResponse _$GetBuiltinIntentResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinIntentResponse(
    signature: json['signature'] as String?,
    slots: (json['slots'] as List<dynamic>?)
        ?.map((e) => BuiltinIntentSlot.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportedLocales: (json['supportedLocales'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$LocaleEnumMap, e))
        .toList(),
  );
}

GetBuiltinIntentsResponse _$GetBuiltinIntentsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinIntentsResponse(
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => BuiltinIntentMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetBuiltinSlotTypesResponse _$GetBuiltinSlotTypesResponseFromJson(
    Map<String, dynamic> json) {
  return GetBuiltinSlotTypesResponse(
    nextToken: json['nextToken'] as String?,
    slotTypes: (json['slotTypes'] as List<dynamic>?)
        ?.map(
            (e) => BuiltinSlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetExportResponse _$GetExportResponseFromJson(Map<String, dynamic> json) {
  return GetExportResponse(
    exportStatus:
        _$enumDecodeNullable(_$ExportStatusEnumMap, json['exportStatus']),
    exportType: _$enumDecodeNullable(_$ExportTypeEnumMap, json['exportType']),
    failureReason: json['failureReason'] as String?,
    name: json['name'] as String?,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    url: json['url'] as String?,
    version: json['version'] as String?,
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
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    failureReason: (json['failureReason'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    importId: json['importId'] as String?,
    importStatus:
        _$enumDecodeNullable(_$ImportStatusEnumMap, json['importStatus']),
    mergeStrategy:
        _$enumDecodeNullable(_$MergeStrategyEnumMap, json['mergeStrategy']),
    name: json['name'] as String?,
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
    checksum: json['checksum'] as String?,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
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
    inputContexts: (json['inputContexts'] as List<dynamic>?)
        ?.map((e) => InputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    kendraConfiguration: json['kendraConfiguration'] == null
        ? null
        : KendraConfiguration.fromJson(
            json['kendraConfiguration'] as Map<String, dynamic>),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    outputContexts: (json['outputContexts'] as List<dynamic>?)
        ?.map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    parentIntentSignature: json['parentIntentSignature'] as String?,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances: (json['sampleUtterances'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    slots: (json['slots'] as List<dynamic>?)
        ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
        .toList(),
    version: json['version'] as String?,
  );
}

GetIntentVersionsResponse _$GetIntentVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntentVersionsResponse(
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => IntentMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetIntentsResponse _$GetIntentsResponseFromJson(Map<String, dynamic> json) {
  return GetIntentsResponse(
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => IntentMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

GetSlotTypeResponse _$GetSlotTypeResponseFromJson(Map<String, dynamic> json) {
  return GetSlotTypeResponse(
    checksum: json['checksum'] as String?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    enumerationValues: (json['enumerationValues'] as List<dynamic>?)
        ?.map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List<dynamic>?)
        ?.map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String?,
  );
}

GetSlotTypeVersionsResponse _$GetSlotTypeVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSlotTypeVersionsResponse(
    nextToken: json['nextToken'] as String?,
    slotTypes: (json['slotTypes'] as List<dynamic>?)
        ?.map((e) => SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetSlotTypesResponse _$GetSlotTypesResponseFromJson(Map<String, dynamic> json) {
  return GetSlotTypesResponse(
    nextToken: json['nextToken'] as String?,
    slotTypes: (json['slotTypes'] as List<dynamic>?)
        ?.map((e) => SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetUtterancesViewResponse _$GetUtterancesViewResponseFromJson(
    Map<String, dynamic> json) {
  return GetUtterancesViewResponse(
    botName: json['botName'] as String?,
    utterances: (json['utterances'] as List<dynamic>?)
        ?.map((e) => UtteranceList.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

InputContext _$InputContextFromJson(Map<String, dynamic> json) {
  return InputContext(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$InputContextToJson(InputContext instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Intent _$IntentFromJson(Map<String, dynamic> json) {
  return Intent(
    intentName: json['intentName'] as String,
    intentVersion: json['intentVersion'] as String,
  );
}

Map<String, dynamic> _$IntentToJson(Intent instance) => <String, dynamic>{
      'intentName': instance.intentName,
      'intentVersion': instance.intentVersion,
    };

IntentMetadata _$IntentMetadataFromJson(Map<String, dynamic> json) {
  return IntentMetadata(
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    version: json['version'] as String?,
  );
}

KendraConfiguration _$KendraConfigurationFromJson(Map<String, dynamic> json) {
  return KendraConfiguration(
    kendraIndex: json['kendraIndex'] as String,
    role: json['role'] as String,
    queryFilterString: json['queryFilterString'] as String?,
  );
}

Map<String, dynamic> _$KendraConfigurationToJson(KendraConfiguration instance) {
  final val = <String, dynamic>{
    'kendraIndex': instance.kendraIndex,
    'role': instance.role,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('queryFilterString', instance.queryFilterString);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LogSettingsRequestToJson(LogSettingsRequest instance) {
  final val = <String, dynamic>{
    'destination': _$DestinationEnumMap[instance.destination],
    'logType': _$LogTypeEnumMap[instance.logType],
    'resourceArn': instance.resourceArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
    kmsKeyArn: json['kmsKeyArn'] as String?,
    logType: _$enumDecodeNullable(_$LogTypeEnumMap, json['logType']),
    resourceArn: json['resourceArn'] as String?,
    resourcePrefix: json['resourcePrefix'] as String?,
  );
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    content: json['content'] as String,
    contentType: _$enumDecode(_$ContentTypeEnumMap, json['contentType']),
    groupNumber: json['groupNumber'] as int?,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'content': instance.content,
    'contentType': _$ContentTypeEnumMap[instance.contentType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('groupNumber', instance.groupNumber);
  return val;
}

const _$ContentTypeEnumMap = {
  ContentType.plainText: 'PlainText',
  ContentType.ssml: 'SSML',
  ContentType.customPayload: 'CustomPayload',
};

OutputContext _$OutputContextFromJson(Map<String, dynamic> json) {
  return OutputContext(
    name: json['name'] as String,
    timeToLiveInSeconds: json['timeToLiveInSeconds'] as int,
    turnsToLive: json['turnsToLive'] as int,
  );
}

Map<String, dynamic> _$OutputContextToJson(OutputContext instance) =>
    <String, dynamic>{
      'name': instance.name,
      'timeToLiveInSeconds': instance.timeToLiveInSeconds,
      'turnsToLive': instance.turnsToLive,
    };

Prompt _$PromptFromJson(Map<String, dynamic> json) {
  return Prompt(
    maxAttempts: json['maxAttempts'] as int,
    messages: (json['messages'] as List<dynamic>)
        .map((e) => Message.fromJson(e as Map<String, dynamic>))
        .toList(),
    responseCard: json['responseCard'] as String?,
  );
}

Map<String, dynamic> _$PromptToJson(Prompt instance) {
  final val = <String, dynamic>{
    'maxAttempts': instance.maxAttempts,
    'messages': instance.messages.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('responseCard', instance.responseCard);
  return val;
}

PutBotAliasResponse _$PutBotAliasResponseFromJson(Map<String, dynamic> json) {
  return PutBotAliasResponse(
    botName: json['botName'] as String?,
    botVersion: json['botVersion'] as String?,
    checksum: json['checksum'] as String?,
    conversationLogs: json['conversationLogs'] == null
        ? null
        : ConversationLogsResponse.fromJson(
            json['conversationLogs'] as Map<String, dynamic>),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

PutBotResponse _$PutBotResponseFromJson(Map<String, dynamic> json) {
  return PutBotResponse(
    abortStatement: json['abortStatement'] == null
        ? null
        : Statement.fromJson(json['abortStatement'] as Map<String, dynamic>),
    checksum: json['checksum'] as String?,
    childDirected: json['childDirected'] as bool?,
    clarificationPrompt: json['clarificationPrompt'] == null
        ? null
        : Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>),
    createVersion: json['createVersion'] as bool?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    detectSentiment: json['detectSentiment'] as bool?,
    enableModelImprovements: json['enableModelImprovements'] as bool?,
    failureReason: json['failureReason'] as String?,
    idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
    intents: (json['intents'] as List<dynamic>?)
        ?.map((e) => Intent.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    locale: _$enumDecodeNullable(_$LocaleEnumMap, json['locale']),
    name: json['name'] as String?,
    nluIntentConfidenceThreshold:
        (json['nluIntentConfidenceThreshold'] as num?)?.toDouble(),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    version: json['version'] as String?,
    voiceId: json['voiceId'] as String?,
  );
}

PutIntentResponse _$PutIntentResponseFromJson(Map<String, dynamic> json) {
  return PutIntentResponse(
    checksum: json['checksum'] as String?,
    conclusionStatement: json['conclusionStatement'] == null
        ? null
        : Statement.fromJson(
            json['conclusionStatement'] as Map<String, dynamic>),
    confirmationPrompt: json['confirmationPrompt'] == null
        ? null
        : Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>),
    createVersion: json['createVersion'] as bool?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
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
    inputContexts: (json['inputContexts'] as List<dynamic>?)
        ?.map((e) => InputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    kendraConfiguration: json['kendraConfiguration'] == null
        ? null
        : KendraConfiguration.fromJson(
            json['kendraConfiguration'] as Map<String, dynamic>),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    outputContexts: (json['outputContexts'] as List<dynamic>?)
        ?.map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
        .toList(),
    parentIntentSignature: json['parentIntentSignature'] as String?,
    rejectionStatement: json['rejectionStatement'] == null
        ? null
        : Statement.fromJson(
            json['rejectionStatement'] as Map<String, dynamic>),
    sampleUtterances: (json['sampleUtterances'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    slots: (json['slots'] as List<dynamic>?)
        ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
        .toList(),
    version: json['version'] as String?,
  );
}

PutSlotTypeResponse _$PutSlotTypeResponseFromJson(Map<String, dynamic> json) {
  return PutSlotTypeResponse(
    checksum: json['checksum'] as String?,
    createVersion: json['createVersion'] as bool?,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    enumerationValues: (json['enumerationValues'] as List<dynamic>?)
        ?.map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
    slotTypeConfigurations: (json['slotTypeConfigurations'] as List<dynamic>?)
        ?.map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    valueSelectionStrategy: _$enumDecodeNullable(
        _$SlotValueSelectionStrategyEnumMap, json['valueSelectionStrategy']),
    version: json['version'] as String?,
  );
}

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    name: json['name'] as String,
    slotConstraint:
        _$enumDecode(_$SlotConstraintEnumMap, json['slotConstraint']),
    defaultValueSpec: json['defaultValueSpec'] == null
        ? null
        : SlotDefaultValueSpec.fromJson(
            json['defaultValueSpec'] as Map<String, dynamic>),
    description: json['description'] as String?,
    obfuscationSetting: _$enumDecodeNullable(
        _$ObfuscationSettingEnumMap, json['obfuscationSetting']),
    priority: json['priority'] as int?,
    responseCard: json['responseCard'] as String?,
    sampleUtterances: (json['sampleUtterances'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    slotType: json['slotType'] as String?,
    slotTypeVersion: json['slotTypeVersion'] as String?,
    valueElicitationPrompt: json['valueElicitationPrompt'] == null
        ? null
        : Prompt.fromJson(
            json['valueElicitationPrompt'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SlotToJson(Slot instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'slotConstraint': _$SlotConstraintEnumMap[instance.slotConstraint],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('defaultValueSpec', instance.defaultValueSpec?.toJson());
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

SlotDefaultValue _$SlotDefaultValueFromJson(Map<String, dynamic> json) {
  return SlotDefaultValue(
    defaultValue: json['defaultValue'] as String,
  );
}

Map<String, dynamic> _$SlotDefaultValueToJson(SlotDefaultValue instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
    };

SlotDefaultValueSpec _$SlotDefaultValueSpecFromJson(Map<String, dynamic> json) {
  return SlotDefaultValueSpec(
    defaultValueList: (json['defaultValueList'] as List<dynamic>)
        .map((e) => SlotDefaultValue.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SlotDefaultValueSpecToJson(
        SlotDefaultValueSpec instance) =>
    <String, dynamic>{
      'defaultValueList':
          instance.defaultValueList.map((e) => e.toJson()).toList(),
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
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String?,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String?,
    version: json['version'] as String?,
  );
}

SlotTypeRegexConfiguration _$SlotTypeRegexConfigurationFromJson(
    Map<String, dynamic> json) {
  return SlotTypeRegexConfiguration(
    pattern: json['pattern'] as String,
  );
}

Map<String, dynamic> _$SlotTypeRegexConfigurationToJson(
        SlotTypeRegexConfiguration instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
    };

StartImportResponse _$StartImportResponseFromJson(Map<String, dynamic> json) {
  return StartImportResponse(
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    importId: json['importId'] as String?,
    importStatus:
        _$enumDecodeNullable(_$ImportStatusEnumMap, json['importStatus']),
    mergeStrategy:
        _$enumDecodeNullable(_$MergeStrategyEnumMap, json['mergeStrategy']),
    name: json['name'] as String?,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    messages: (json['messages'] as List<dynamic>)
        .map((e) => Message.fromJson(e as Map<String, dynamic>))
        .toList(),
    responseCard: json['responseCard'] as String?,
  );
}

Map<String, dynamic> _$StatementToJson(Statement instance) {
  final val = <String, dynamic>{
    'messages': instance.messages.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('responseCard', instance.responseCard);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UtteranceData _$UtteranceDataFromJson(Map<String, dynamic> json) {
  return UtteranceData(
    count: json['count'] as int?,
    distinctUsers: json['distinctUsers'] as int?,
    firstUtteredDate:
        const UnixDateTimeConverter().fromJson(json['firstUtteredDate']),
    lastUtteredDate:
        const UnixDateTimeConverter().fromJson(json['lastUtteredDate']),
    utteranceString: json['utteranceString'] as String?,
  );
}

UtteranceList _$UtteranceListFromJson(Map<String, dynamic> json) {
  return UtteranceList(
    botVersion: json['botVersion'] as String?,
    utterances: (json['utterances'] as List<dynamic>?)
        ?.map((e) => UtteranceData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
