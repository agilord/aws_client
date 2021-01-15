// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-07-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    clearTimer: json['clearTimer'] == null
        ? null
        : ClearTimerAction.fromJson(json['clearTimer'] as Map<String, dynamic>),
    dynamoDB: json['dynamoDB'] == null
        ? null
        : DynamoDBAction.fromJson(json['dynamoDB'] as Map<String, dynamic>),
    dynamoDBv2: json['dynamoDBv2'] == null
        ? null
        : DynamoDBv2Action.fromJson(json['dynamoDBv2'] as Map<String, dynamic>),
    firehose: json['firehose'] == null
        ? null
        : FirehoseAction.fromJson(json['firehose'] as Map<String, dynamic>),
    iotEvents: json['iotEvents'] == null
        ? null
        : IotEventsAction.fromJson(json['iotEvents'] as Map<String, dynamic>),
    iotSiteWise: json['iotSiteWise'] == null
        ? null
        : IotSiteWiseAction.fromJson(
            json['iotSiteWise'] as Map<String, dynamic>),
    iotTopicPublish: json['iotTopicPublish'] == null
        ? null
        : IotTopicPublishAction.fromJson(
            json['iotTopicPublish'] as Map<String, dynamic>),
    lambda: json['lambda'] == null
        ? null
        : LambdaAction.fromJson(json['lambda'] as Map<String, dynamic>),
    resetTimer: json['resetTimer'] == null
        ? null
        : ResetTimerAction.fromJson(json['resetTimer'] as Map<String, dynamic>),
    setTimer: json['setTimer'] == null
        ? null
        : SetTimerAction.fromJson(json['setTimer'] as Map<String, dynamic>),
    setVariable: json['setVariable'] == null
        ? null
        : SetVariableAction.fromJson(
            json['setVariable'] as Map<String, dynamic>),
    sns: json['sns'] == null
        ? null
        : SNSTopicPublishAction.fromJson(json['sns'] as Map<String, dynamic>),
    sqs: json['sqs'] == null
        ? null
        : SqsAction.fromJson(json['sqs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clearTimer', instance.clearTimer?.toJson());
  writeNotNull('dynamoDB', instance.dynamoDB?.toJson());
  writeNotNull('dynamoDBv2', instance.dynamoDBv2?.toJson());
  writeNotNull('firehose', instance.firehose?.toJson());
  writeNotNull('iotEvents', instance.iotEvents?.toJson());
  writeNotNull('iotSiteWise', instance.iotSiteWise?.toJson());
  writeNotNull('iotTopicPublish', instance.iotTopicPublish?.toJson());
  writeNotNull('lambda', instance.lambda?.toJson());
  writeNotNull('resetTimer', instance.resetTimer?.toJson());
  writeNotNull('setTimer', instance.setTimer?.toJson());
  writeNotNull('setVariable', instance.setVariable?.toJson());
  writeNotNull('sns', instance.sns?.toJson());
  writeNotNull('sqs', instance.sqs?.toJson());
  return val;
}

AssetPropertyTimestamp _$AssetPropertyTimestampFromJson(
    Map<String, dynamic> json) {
  return AssetPropertyTimestamp(
    timeInSeconds: json['timeInSeconds'] as String,
    offsetInNanos: json['offsetInNanos'] as String,
  );
}

Map<String, dynamic> _$AssetPropertyTimestampToJson(
    AssetPropertyTimestamp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeInSeconds', instance.timeInSeconds);
  writeNotNull('offsetInNanos', instance.offsetInNanos);
  return val;
}

AssetPropertyValue _$AssetPropertyValueFromJson(Map<String, dynamic> json) {
  return AssetPropertyValue(
    value: json['value'] == null
        ? null
        : AssetPropertyVariant.fromJson(json['value'] as Map<String, dynamic>),
    quality: json['quality'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : AssetPropertyTimestamp.fromJson(
            json['timestamp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssetPropertyValueToJson(AssetPropertyValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value?.toJson());
  writeNotNull('quality', instance.quality);
  writeNotNull('timestamp', instance.timestamp?.toJson());
  return val;
}

AssetPropertyVariant _$AssetPropertyVariantFromJson(Map<String, dynamic> json) {
  return AssetPropertyVariant(
    booleanValue: json['booleanValue'] as String,
    doubleValue: json['doubleValue'] as String,
    integerValue: json['integerValue'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$AssetPropertyVariantToJson(
    AssetPropertyVariant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('booleanValue', instance.booleanValue);
  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('integerValue', instance.integerValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    jsonPath: json['jsonPath'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jsonPath', instance.jsonPath);
  return val;
}

ClearTimerAction _$ClearTimerActionFromJson(Map<String, dynamic> json) {
  return ClearTimerAction(
    timerName: json['timerName'] as String,
  );
}

Map<String, dynamic> _$ClearTimerActionToJson(ClearTimerAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timerName', instance.timerName);
  return val;
}

CreateDetectorModelResponse _$CreateDetectorModelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDetectorModelResponse(
    detectorModelConfiguration: json['detectorModelConfiguration'] == null
        ? null
        : DetectorModelConfiguration.fromJson(
            json['detectorModelConfiguration'] as Map<String, dynamic>),
  );
}

CreateInputResponse _$CreateInputResponseFromJson(Map<String, dynamic> json) {
  return CreateInputResponse(
    inputConfiguration: json['inputConfiguration'] == null
        ? null
        : InputConfiguration.fromJson(
            json['inputConfiguration'] as Map<String, dynamic>),
  );
}

DeleteDetectorModelResponse _$DeleteDetectorModelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDetectorModelResponse();
}

DeleteInputResponse _$DeleteInputResponseFromJson(Map<String, dynamic> json) {
  return DeleteInputResponse();
}

DescribeDetectorModelResponse _$DescribeDetectorModelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDetectorModelResponse(
    detectorModel: json['detectorModel'] == null
        ? null
        : DetectorModel.fromJson(json['detectorModel'] as Map<String, dynamic>),
  );
}

DescribeInputResponse _$DescribeInputResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInputResponse(
    input: json['input'] == null
        ? null
        : Input.fromJson(json['input'] as Map<String, dynamic>),
  );
}

DescribeLoggingOptionsResponse _$DescribeLoggingOptionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLoggingOptionsResponse(
    loggingOptions: json['loggingOptions'] == null
        ? null
        : LoggingOptions.fromJson(
            json['loggingOptions'] as Map<String, dynamic>),
  );
}

DetectorDebugOption _$DetectorDebugOptionFromJson(Map<String, dynamic> json) {
  return DetectorDebugOption(
    detectorModelName: json['detectorModelName'] as String,
    keyValue: json['keyValue'] as String,
  );
}

Map<String, dynamic> _$DetectorDebugOptionToJson(DetectorDebugOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorModelName', instance.detectorModelName);
  writeNotNull('keyValue', instance.keyValue);
  return val;
}

DetectorModel _$DetectorModelFromJson(Map<String, dynamic> json) {
  return DetectorModel(
    detectorModelConfiguration: json['detectorModelConfiguration'] == null
        ? null
        : DetectorModelConfiguration.fromJson(
            json['detectorModelConfiguration'] as Map<String, dynamic>),
    detectorModelDefinition: json['detectorModelDefinition'] == null
        ? null
        : DetectorModelDefinition.fromJson(
            json['detectorModelDefinition'] as Map<String, dynamic>),
  );
}

DetectorModelConfiguration _$DetectorModelConfigurationFromJson(
    Map<String, dynamic> json) {
  return DetectorModelConfiguration(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelArn: json['detectorModelArn'] as String,
    detectorModelDescription: json['detectorModelDescription'] as String,
    detectorModelName: json['detectorModelName'] as String,
    detectorModelVersion: json['detectorModelVersion'] as String,
    evaluationMethod: _$enumDecodeNullable(
        _$EvaluationMethodEnumMap, json['evaluationMethod']),
    key: json['key'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    roleArn: json['roleArn'] as String,
    status: _$enumDecodeNullable(
        _$DetectorModelVersionStatusEnumMap, json['status']),
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

const _$EvaluationMethodEnumMap = {
  EvaluationMethod.batch: 'BATCH',
  EvaluationMethod.serial: 'SERIAL',
};

const _$DetectorModelVersionStatusEnumMap = {
  DetectorModelVersionStatus.active: 'ACTIVE',
  DetectorModelVersionStatus.activating: 'ACTIVATING',
  DetectorModelVersionStatus.inactive: 'INACTIVE',
  DetectorModelVersionStatus.deprecated: 'DEPRECATED',
  DetectorModelVersionStatus.draft: 'DRAFT',
  DetectorModelVersionStatus.paused: 'PAUSED',
  DetectorModelVersionStatus.failed: 'FAILED',
};

DetectorModelDefinition _$DetectorModelDefinitionFromJson(
    Map<String, dynamic> json) {
  return DetectorModelDefinition(
    initialStateName: json['initialStateName'] as String,
    states: (json['states'] as List)
        ?.map(
            (e) => e == null ? null : State.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetectorModelDefinitionToJson(
    DetectorModelDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('initialStateName', instance.initialStateName);
  writeNotNull('states', instance.states?.map((e) => e?.toJson())?.toList());
  return val;
}

DetectorModelSummary _$DetectorModelSummaryFromJson(Map<String, dynamic> json) {
  return DetectorModelSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelDescription: json['detectorModelDescription'] as String,
    detectorModelName: json['detectorModelName'] as String,
  );
}

DetectorModelVersionSummary _$DetectorModelVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return DetectorModelVersionSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelArn: json['detectorModelArn'] as String,
    detectorModelName: json['detectorModelName'] as String,
    detectorModelVersion: json['detectorModelVersion'] as String,
    evaluationMethod: _$enumDecodeNullable(
        _$EvaluationMethodEnumMap, json['evaluationMethod']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    roleArn: json['roleArn'] as String,
    status: _$enumDecodeNullable(
        _$DetectorModelVersionStatusEnumMap, json['status']),
  );
}

DynamoDBAction _$DynamoDBActionFromJson(Map<String, dynamic> json) {
  return DynamoDBAction(
    hashKeyField: json['hashKeyField'] as String,
    hashKeyValue: json['hashKeyValue'] as String,
    tableName: json['tableName'] as String,
    hashKeyType: json['hashKeyType'] as String,
    operation: json['operation'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    payloadField: json['payloadField'] as String,
    rangeKeyField: json['rangeKeyField'] as String,
    rangeKeyType: json['rangeKeyType'] as String,
    rangeKeyValue: json['rangeKeyValue'] as String,
  );
}

Map<String, dynamic> _$DynamoDBActionToJson(DynamoDBAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hashKeyField', instance.hashKeyField);
  writeNotNull('hashKeyValue', instance.hashKeyValue);
  writeNotNull('tableName', instance.tableName);
  writeNotNull('hashKeyType', instance.hashKeyType);
  writeNotNull('operation', instance.operation);
  writeNotNull('payload', instance.payload?.toJson());
  writeNotNull('payloadField', instance.payloadField);
  writeNotNull('rangeKeyField', instance.rangeKeyField);
  writeNotNull('rangeKeyType', instance.rangeKeyType);
  writeNotNull('rangeKeyValue', instance.rangeKeyValue);
  return val;
}

DynamoDBv2Action _$DynamoDBv2ActionFromJson(Map<String, dynamic> json) {
  return DynamoDBv2Action(
    tableName: json['tableName'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DynamoDBv2ActionToJson(DynamoDBv2Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tableName', instance.tableName);
  writeNotNull('payload', instance.payload?.toJson());
  return val;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventName: json['eventName'] as String,
    actions: (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventName', instance.eventName);
  writeNotNull('actions', instance.actions?.map((e) => e?.toJson())?.toList());
  writeNotNull('condition', instance.condition);
  return val;
}

FirehoseAction _$FirehoseActionFromJson(Map<String, dynamic> json) {
  return FirehoseAction(
    deliveryStreamName: json['deliveryStreamName'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    separator: json['separator'] as String,
  );
}

Map<String, dynamic> _$FirehoseActionToJson(FirehoseAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveryStreamName', instance.deliveryStreamName);
  writeNotNull('payload', instance.payload?.toJson());
  writeNotNull('separator', instance.separator);
  return val;
}

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    inputConfiguration: json['inputConfiguration'] == null
        ? null
        : InputConfiguration.fromJson(
            json['inputConfiguration'] as Map<String, dynamic>),
    inputDefinition: json['inputDefinition'] == null
        ? null
        : InputDefinition.fromJson(
            json['inputDefinition'] as Map<String, dynamic>),
  );
}

InputConfiguration _$InputConfigurationFromJson(Map<String, dynamic> json) {
  return InputConfiguration(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    inputArn: json['inputArn'] as String,
    inputName: json['inputName'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    status: _$enumDecodeNullable(_$InputStatusEnumMap, json['status']),
    inputDescription: json['inputDescription'] as String,
  );
}

const _$InputStatusEnumMap = {
  InputStatus.creating: 'CREATING',
  InputStatus.updating: 'UPDATING',
  InputStatus.active: 'ACTIVE',
  InputStatus.deleting: 'DELETING',
};

InputDefinition _$InputDefinitionFromJson(Map<String, dynamic> json) {
  return InputDefinition(
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InputDefinitionToJson(InputDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  return val;
}

InputSummary _$InputSummaryFromJson(Map<String, dynamic> json) {
  return InputSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    inputArn: json['inputArn'] as String,
    inputDescription: json['inputDescription'] as String,
    inputName: json['inputName'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    status: _$enumDecodeNullable(_$InputStatusEnumMap, json['status']),
  );
}

IotEventsAction _$IotEventsActionFromJson(Map<String, dynamic> json) {
  return IotEventsAction(
    inputName: json['inputName'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IotEventsActionToJson(IotEventsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputName', instance.inputName);
  writeNotNull('payload', instance.payload?.toJson());
  return val;
}

IotSiteWiseAction _$IotSiteWiseActionFromJson(Map<String, dynamic> json) {
  return IotSiteWiseAction(
    propertyValue: json['propertyValue'] == null
        ? null
        : AssetPropertyValue.fromJson(
            json['propertyValue'] as Map<String, dynamic>),
    assetId: json['assetId'] as String,
    entryId: json['entryId'] as String,
    propertyAlias: json['propertyAlias'] as String,
    propertyId: json['propertyId'] as String,
  );
}

Map<String, dynamic> _$IotSiteWiseActionToJson(IotSiteWiseAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('propertyValue', instance.propertyValue?.toJson());
  writeNotNull('assetId', instance.assetId);
  writeNotNull('entryId', instance.entryId);
  writeNotNull('propertyAlias', instance.propertyAlias);
  writeNotNull('propertyId', instance.propertyId);
  return val;
}

IotTopicPublishAction _$IotTopicPublishActionFromJson(
    Map<String, dynamic> json) {
  return IotTopicPublishAction(
    mqttTopic: json['mqttTopic'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IotTopicPublishActionToJson(
    IotTopicPublishAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mqttTopic', instance.mqttTopic);
  writeNotNull('payload', instance.payload?.toJson());
  return val;
}

LambdaAction _$LambdaActionFromJson(Map<String, dynamic> json) {
  return LambdaAction(
    functionArn: json['functionArn'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LambdaActionToJson(LambdaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('functionArn', instance.functionArn);
  writeNotNull('payload', instance.payload?.toJson());
  return val;
}

ListDetectorModelVersionsResponse _$ListDetectorModelVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDetectorModelVersionsResponse(
    detectorModelVersionSummaries: (json['detectorModelVersionSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : DetectorModelVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDetectorModelsResponse _$ListDetectorModelsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDetectorModelsResponse(
    detectorModelSummaries: (json['detectorModelSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : DetectorModelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInputsResponse _$ListInputsResponseFromJson(Map<String, dynamic> json) {
  return ListInputsResponse(
    inputSummaries: (json['inputSummaries'] as List)
        ?.map((e) =>
            e == null ? null : InputSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

LoggingOptions _$LoggingOptionsFromJson(Map<String, dynamic> json) {
  return LoggingOptions(
    enabled: json['enabled'] as bool,
    level: _$enumDecodeNullable(_$LoggingLevelEnumMap, json['level']),
    roleArn: json['roleArn'] as String,
    detectorDebugOptions: (json['detectorDebugOptions'] as List)
        ?.map((e) => e == null
            ? null
            : DetectorDebugOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoggingOptionsToJson(LoggingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('level', _$LoggingLevelEnumMap[instance.level]);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('detectorDebugOptions',
      instance.detectorDebugOptions?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$LoggingLevelEnumMap = {
  LoggingLevel.error: 'ERROR',
  LoggingLevel.info: 'INFO',
  LoggingLevel.debug: 'DEBUG',
};

OnEnterLifecycle _$OnEnterLifecycleFromJson(Map<String, dynamic> json) {
  return OnEnterLifecycle(
    events: (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OnEnterLifecycleToJson(OnEnterLifecycle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('events', instance.events?.map((e) => e?.toJson())?.toList());
  return val;
}

OnExitLifecycle _$OnExitLifecycleFromJson(Map<String, dynamic> json) {
  return OnExitLifecycle(
    events: (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OnExitLifecycleToJson(OnExitLifecycle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('events', instance.events?.map((e) => e?.toJson())?.toList());
  return val;
}

OnInputLifecycle _$OnInputLifecycleFromJson(Map<String, dynamic> json) {
  return OnInputLifecycle(
    events: (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    transitionEvents: (json['transitionEvents'] as List)
        ?.map((e) => e == null
            ? null
            : TransitionEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OnInputLifecycleToJson(OnInputLifecycle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('events', instance.events?.map((e) => e?.toJson())?.toList());
  writeNotNull('transitionEvents',
      instance.transitionEvents?.map((e) => e?.toJson())?.toList());
  return val;
}

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload(
    contentExpression: json['contentExpression'] as String,
    type: _$enumDecodeNullable(_$PayloadTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$PayloadToJson(Payload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contentExpression', instance.contentExpression);
  writeNotNull('type', _$PayloadTypeEnumMap[instance.type]);
  return val;
}

const _$PayloadTypeEnumMap = {
  PayloadType.string: 'STRING',
  PayloadType.json: 'JSON',
};

ResetTimerAction _$ResetTimerActionFromJson(Map<String, dynamic> json) {
  return ResetTimerAction(
    timerName: json['timerName'] as String,
  );
}

Map<String, dynamic> _$ResetTimerActionToJson(ResetTimerAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timerName', instance.timerName);
  return val;
}

SNSTopicPublishAction _$SNSTopicPublishActionFromJson(
    Map<String, dynamic> json) {
  return SNSTopicPublishAction(
    targetArn: json['targetArn'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SNSTopicPublishActionToJson(
    SNSTopicPublishAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetArn', instance.targetArn);
  writeNotNull('payload', instance.payload?.toJson());
  return val;
}

SetTimerAction _$SetTimerActionFromJson(Map<String, dynamic> json) {
  return SetTimerAction(
    timerName: json['timerName'] as String,
    durationExpression: json['durationExpression'] as String,
    seconds: json['seconds'] as int,
  );
}

Map<String, dynamic> _$SetTimerActionToJson(SetTimerAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timerName', instance.timerName);
  writeNotNull('durationExpression', instance.durationExpression);
  writeNotNull('seconds', instance.seconds);
  return val;
}

SetVariableAction _$SetVariableActionFromJson(Map<String, dynamic> json) {
  return SetVariableAction(
    value: json['value'] as String,
    variableName: json['variableName'] as String,
  );
}

Map<String, dynamic> _$SetVariableActionToJson(SetVariableAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('variableName', instance.variableName);
  return val;
}

SqsAction _$SqsActionFromJson(Map<String, dynamic> json) {
  return SqsAction(
    queueUrl: json['queueUrl'] as String,
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    useBase64: json['useBase64'] as bool,
  );
}

Map<String, dynamic> _$SqsActionToJson(SqsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('queueUrl', instance.queueUrl);
  writeNotNull('payload', instance.payload?.toJson());
  writeNotNull('useBase64', instance.useBase64);
  return val;
}

State _$StateFromJson(Map<String, dynamic> json) {
  return State(
    stateName: json['stateName'] as String,
    onEnter: json['onEnter'] == null
        ? null
        : OnEnterLifecycle.fromJson(json['onEnter'] as Map<String, dynamic>),
    onExit: json['onExit'] == null
        ? null
        : OnExitLifecycle.fromJson(json['onExit'] as Map<String, dynamic>),
    onInput: json['onInput'] == null
        ? null
        : OnInputLifecycle.fromJson(json['onInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StateToJson(State instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stateName', instance.stateName);
  writeNotNull('onEnter', instance.onEnter?.toJson());
  writeNotNull('onExit', instance.onExit?.toJson());
  writeNotNull('onInput', instance.onInput?.toJson());
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TransitionEvent _$TransitionEventFromJson(Map<String, dynamic> json) {
  return TransitionEvent(
    condition: json['condition'] as String,
    eventName: json['eventName'] as String,
    nextState: json['nextState'] as String,
    actions: (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransitionEventToJson(TransitionEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('condition', instance.condition);
  writeNotNull('eventName', instance.eventName);
  writeNotNull('nextState', instance.nextState);
  writeNotNull('actions', instance.actions?.map((e) => e?.toJson())?.toList());
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDetectorModelResponse _$UpdateDetectorModelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorModelResponse(
    detectorModelConfiguration: json['detectorModelConfiguration'] == null
        ? null
        : DetectorModelConfiguration.fromJson(
            json['detectorModelConfiguration'] as Map<String, dynamic>),
  );
}

UpdateInputResponse _$UpdateInputResponseFromJson(Map<String, dynamic> json) {
  return UpdateInputResponse(
    inputConfiguration: json['inputConfiguration'] == null
        ? null
        : InputConfiguration.fromJson(
            json['inputConfiguration'] as Map<String, dynamic>),
  );
}
