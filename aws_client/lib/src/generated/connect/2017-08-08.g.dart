// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-08-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateInstanceStorageConfigResponse
    _$AssociateInstanceStorageConfigResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateInstanceStorageConfigResponse(
    associationId: json['AssociationId'] as String,
  );
}

AssociateSecurityKeyResponse _$AssociateSecurityKeyResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateSecurityKeyResponse(
    associationId: json['AssociationId'] as String,
  );
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    attributeType: _$enumDecodeNullable(
        _$InstanceAttributeTypeEnumMap, json['AttributeType']),
    value: json['Value'] as String,
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

const _$InstanceAttributeTypeEnumMap = {
  InstanceAttributeType.inboundCalls: 'INBOUND_CALLS',
  InstanceAttributeType.outboundCalls: 'OUTBOUND_CALLS',
  InstanceAttributeType.contactflowLogs: 'CONTACTFLOW_LOGS',
  InstanceAttributeType.contactLens: 'CONTACT_LENS',
  InstanceAttributeType.autoResolveBestVoices: 'AUTO_RESOLVE_BEST_VOICES',
  InstanceAttributeType.useCustomTtsVoices: 'USE_CUSTOM_TTS_VOICES',
  InstanceAttributeType.earlyMedia: 'EARLY_MEDIA',
};

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  writeNotNull('ContentType', instance.contentType);
  return val;
}

ContactFlow _$ContactFlowFromJson(Map<String, dynamic> json) {
  return ContactFlow(
    arn: json['Arn'] as String,
    content: json['Content'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ContactFlowTypeEnumMap, json['Type']),
  );
}

const _$ContactFlowTypeEnumMap = {
  ContactFlowType.contactFlow: 'CONTACT_FLOW',
  ContactFlowType.customerQueue: 'CUSTOMER_QUEUE',
  ContactFlowType.customerHold: 'CUSTOMER_HOLD',
  ContactFlowType.customerWhisper: 'CUSTOMER_WHISPER',
  ContactFlowType.agentHold: 'AGENT_HOLD',
  ContactFlowType.agentWhisper: 'AGENT_WHISPER',
  ContactFlowType.outboundWhisper: 'OUTBOUND_WHISPER',
  ContactFlowType.agentTransfer: 'AGENT_TRANSFER',
  ContactFlowType.queueTransfer: 'QUEUE_TRANSFER',
};

ContactFlowSummary _$ContactFlowSummaryFromJson(Map<String, dynamic> json) {
  return ContactFlowSummary(
    arn: json['Arn'] as String,
    contactFlowType:
        _$enumDecodeNullable(_$ContactFlowTypeEnumMap, json['ContactFlowType']),
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

CreateContactFlowResponse _$CreateContactFlowResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContactFlowResponse(
    contactFlowArn: json['ContactFlowArn'] as String,
    contactFlowId: json['ContactFlowId'] as String,
  );
}

CreateInstanceResponse _$CreateInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInstanceResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

CreateIntegrationAssociationResponse
    _$CreateIntegrationAssociationResponseFromJson(Map<String, dynamic> json) {
  return CreateIntegrationAssociationResponse(
    integrationAssociationArn: json['IntegrationAssociationArn'] as String,
    integrationAssociationId: json['IntegrationAssociationId'] as String,
  );
}

CreateQuickConnectResponse _$CreateQuickConnectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateQuickConnectResponse(
    quickConnectARN: json['QuickConnectARN'] as String,
    quickConnectId: json['QuickConnectId'] as String,
  );
}

CreateRoutingProfileResponse _$CreateRoutingProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRoutingProfileResponse(
    routingProfileArn: json['RoutingProfileArn'] as String,
    routingProfileId: json['RoutingProfileId'] as String,
  );
}

CreateUseCaseResponse _$CreateUseCaseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUseCaseResponse(
    useCaseArn: json['UseCaseArn'] as String,
    useCaseId: json['UseCaseId'] as String,
  );
}

CreateUserHierarchyGroupResponse _$CreateUserHierarchyGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserHierarchyGroupResponse(
    hierarchyGroupArn: json['HierarchyGroupArn'] as String,
    hierarchyGroupId: json['HierarchyGroupId'] as String,
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    userArn: json['UserArn'] as String,
    userId: json['UserId'] as String,
  );
}

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return Credentials(
    accessToken: json['AccessToken'] as String,
    accessTokenExpiration:
        const UnixDateTimeConverter().fromJson(json['AccessTokenExpiration']),
    refreshToken: json['RefreshToken'] as String,
    refreshTokenExpiration:
        const UnixDateTimeConverter().fromJson(json['RefreshTokenExpiration']),
  );
}

CurrentMetric _$CurrentMetricFromJson(Map<String, dynamic> json) {
  return CurrentMetric(
    name: _$enumDecodeNullable(_$CurrentMetricNameEnumMap, json['Name']),
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
  );
}

Map<String, dynamic> _$CurrentMetricToJson(CurrentMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$CurrentMetricNameEnumMap[instance.name]);
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  return val;
}

const _$CurrentMetricNameEnumMap = {
  CurrentMetricName.agentsOnline: 'AGENTS_ONLINE',
  CurrentMetricName.agentsAvailable: 'AGENTS_AVAILABLE',
  CurrentMetricName.agentsOnCall: 'AGENTS_ON_CALL',
  CurrentMetricName.agentsNonProductive: 'AGENTS_NON_PRODUCTIVE',
  CurrentMetricName.agentsAfterContactWork: 'AGENTS_AFTER_CONTACT_WORK',
  CurrentMetricName.agentsError: 'AGENTS_ERROR',
  CurrentMetricName.agentsStaffed: 'AGENTS_STAFFED',
  CurrentMetricName.contactsInQueue: 'CONTACTS_IN_QUEUE',
  CurrentMetricName.oldestContactAge: 'OLDEST_CONTACT_AGE',
  CurrentMetricName.contactsScheduled: 'CONTACTS_SCHEDULED',
  CurrentMetricName.agentsOnContact: 'AGENTS_ON_CONTACT',
  CurrentMetricName.slotsActive: 'SLOTS_ACTIVE',
  CurrentMetricName.slotsAvailable: 'SLOTS_AVAILABLE',
};

const _$UnitEnumMap = {
  Unit.seconds: 'SECONDS',
  Unit.count: 'COUNT',
  Unit.percent: 'PERCENT',
};

CurrentMetricData _$CurrentMetricDataFromJson(Map<String, dynamic> json) {
  return CurrentMetricData(
    metric: json['Metric'] == null
        ? null
        : CurrentMetric.fromJson(json['Metric'] as Map<String, dynamic>),
    value: (json['Value'] as num)?.toDouble(),
  );
}

CurrentMetricResult _$CurrentMetricResultFromJson(Map<String, dynamic> json) {
  return CurrentMetricResult(
    collections: (json['Collections'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentMetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dimensions: json['Dimensions'] == null
        ? null
        : Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
  );
}

DescribeContactFlowResponse _$DescribeContactFlowResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeContactFlowResponse(
    contactFlow: json['ContactFlow'] == null
        ? null
        : ContactFlow.fromJson(json['ContactFlow'] as Map<String, dynamic>),
  );
}

DescribeInstanceAttributeResponse _$DescribeInstanceAttributeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInstanceAttributeResponse(
    attribute: json['Attribute'] == null
        ? null
        : Attribute.fromJson(json['Attribute'] as Map<String, dynamic>),
  );
}

DescribeInstanceResponse _$DescribeInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInstanceResponse(
    instance: json['Instance'] == null
        ? null
        : Instance.fromJson(json['Instance'] as Map<String, dynamic>),
  );
}

DescribeInstanceStorageConfigResponse
    _$DescribeInstanceStorageConfigResponseFromJson(Map<String, dynamic> json) {
  return DescribeInstanceStorageConfigResponse(
    storageConfig: json['StorageConfig'] == null
        ? null
        : InstanceStorageConfig.fromJson(
            json['StorageConfig'] as Map<String, dynamic>),
  );
}

DescribeQuickConnectResponse _$DescribeQuickConnectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeQuickConnectResponse(
    quickConnect: json['QuickConnect'] == null
        ? null
        : QuickConnect.fromJson(json['QuickConnect'] as Map<String, dynamic>),
  );
}

DescribeRoutingProfileResponse _$DescribeRoutingProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRoutingProfileResponse(
    routingProfile: json['RoutingProfile'] == null
        ? null
        : RoutingProfile.fromJson(
            json['RoutingProfile'] as Map<String, dynamic>),
  );
}

DescribeUserHierarchyGroupResponse _$DescribeUserHierarchyGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserHierarchyGroupResponse(
    hierarchyGroup: json['HierarchyGroup'] == null
        ? null
        : HierarchyGroup.fromJson(
            json['HierarchyGroup'] as Map<String, dynamic>),
  );
}

DescribeUserHierarchyStructureResponse
    _$DescribeUserHierarchyStructureResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeUserHierarchyStructureResponse(
    hierarchyStructure: json['HierarchyStructure'] == null
        ? null
        : HierarchyStructure.fromJson(
            json['HierarchyStructure'] as Map<String, dynamic>),
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) {
  return Dimensions(
    channel: _$enumDecodeNullable(_$ChannelEnumMap, json['Channel']),
    queue: json['Queue'] == null
        ? null
        : QueueReference.fromJson(json['Queue'] as Map<String, dynamic>),
  );
}

const _$ChannelEnumMap = {
  Channel.voice: 'VOICE',
  Channel.chat: 'CHAT',
  Channel.task: 'TASK',
};

EncryptionConfig _$EncryptionConfigFromJson(Map<String, dynamic> json) {
  return EncryptionConfig(
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
    keyId: json['KeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionConfigToJson(EncryptionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionType', _$EncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('KeyId', instance.keyId);
  return val;
}

const _$EncryptionTypeEnumMap = {
  EncryptionType.kms: 'KMS',
};

Map<String, dynamic> _$FiltersToJson(Filters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Channels', instance.channels?.map((e) => _$ChannelEnumMap[e])?.toList());
  writeNotNull('Queues', instance.queues);
  return val;
}

GetContactAttributesResponse _$GetContactAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return GetContactAttributesResponse(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetCurrentMetricDataResponse _$GetCurrentMetricDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetCurrentMetricDataResponse(
    dataSnapshotTime:
        const UnixDateTimeConverter().fromJson(json['DataSnapshotTime']),
    metricResults: (json['MetricResults'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentMetricResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetFederationTokenResponse _$GetFederationTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetFederationTokenResponse(
    credentials: json['Credentials'] == null
        ? null
        : Credentials.fromJson(json['Credentials'] as Map<String, dynamic>),
  );
}

GetMetricDataResponse _$GetMetricDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetMetricDataResponse(
    metricResults: (json['MetricResults'] as List)
        ?.map((e) => e == null
            ? null
            : HistoricalMetricResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

HierarchyGroup _$HierarchyGroupFromJson(Map<String, dynamic> json) {
  return HierarchyGroup(
    arn: json['Arn'] as String,
    hierarchyPath: json['HierarchyPath'] == null
        ? null
        : HierarchyPath.fromJson(json['HierarchyPath'] as Map<String, dynamic>),
    id: json['Id'] as String,
    levelId: json['LevelId'] as String,
    name: json['Name'] as String,
  );
}

HierarchyGroupSummary _$HierarchyGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return HierarchyGroupSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

HierarchyLevel _$HierarchyLevelFromJson(Map<String, dynamic> json) {
  return HierarchyLevel(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$HierarchyLevelUpdateToJson(
    HierarchyLevelUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

HierarchyPath _$HierarchyPathFromJson(Map<String, dynamic> json) {
  return HierarchyPath(
    levelFive: json['LevelFive'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelFive'] as Map<String, dynamic>),
    levelFour: json['LevelFour'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelFour'] as Map<String, dynamic>),
    levelOne: json['LevelOne'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelOne'] as Map<String, dynamic>),
    levelThree: json['LevelThree'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelThree'] as Map<String, dynamic>),
    levelTwo: json['LevelTwo'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelTwo'] as Map<String, dynamic>),
  );
}

HierarchyStructure _$HierarchyStructureFromJson(Map<String, dynamic> json) {
  return HierarchyStructure(
    levelFive: json['LevelFive'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelFive'] as Map<String, dynamic>),
    levelFour: json['LevelFour'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelFour'] as Map<String, dynamic>),
    levelOne: json['LevelOne'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelOne'] as Map<String, dynamic>),
    levelThree: json['LevelThree'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelThree'] as Map<String, dynamic>),
    levelTwo: json['LevelTwo'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelTwo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HierarchyStructureUpdateToJson(
    HierarchyStructureUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LevelFive', instance.levelFive?.toJson());
  writeNotNull('LevelFour', instance.levelFour?.toJson());
  writeNotNull('LevelOne', instance.levelOne?.toJson());
  writeNotNull('LevelThree', instance.levelThree?.toJson());
  writeNotNull('LevelTwo', instance.levelTwo?.toJson());
  return val;
}

HistoricalMetric _$HistoricalMetricFromJson(Map<String, dynamic> json) {
  return HistoricalMetric(
    name: _$enumDecodeNullable(_$HistoricalMetricNameEnumMap, json['Name']),
    statistic: _$enumDecodeNullable(_$StatisticEnumMap, json['Statistic']),
    threshold: json['Threshold'] == null
        ? null
        : Threshold.fromJson(json['Threshold'] as Map<String, dynamic>),
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
  );
}

Map<String, dynamic> _$HistoricalMetricToJson(HistoricalMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$HistoricalMetricNameEnumMap[instance.name]);
  writeNotNull('Statistic', _$StatisticEnumMap[instance.statistic]);
  writeNotNull('Threshold', instance.threshold?.toJson());
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  return val;
}

const _$HistoricalMetricNameEnumMap = {
  HistoricalMetricName.contactsQueued: 'CONTACTS_QUEUED',
  HistoricalMetricName.contactsHandled: 'CONTACTS_HANDLED',
  HistoricalMetricName.contactsAbandoned: 'CONTACTS_ABANDONED',
  HistoricalMetricName.contactsConsulted: 'CONTACTS_CONSULTED',
  HistoricalMetricName.contactsAgentHungUpFirst: 'CONTACTS_AGENT_HUNG_UP_FIRST',
  HistoricalMetricName.contactsHandledIncoming: 'CONTACTS_HANDLED_INCOMING',
  HistoricalMetricName.contactsHandledOutbound: 'CONTACTS_HANDLED_OUTBOUND',
  HistoricalMetricName.contactsHoldAbandons: 'CONTACTS_HOLD_ABANDONS',
  HistoricalMetricName.contactsTransferredIn: 'CONTACTS_TRANSFERRED_IN',
  HistoricalMetricName.contactsTransferredOut: 'CONTACTS_TRANSFERRED_OUT',
  HistoricalMetricName.contactsTransferredInFromQueue:
      'CONTACTS_TRANSFERRED_IN_FROM_QUEUE',
  HistoricalMetricName.contactsTransferredOutFromQueue:
      'CONTACTS_TRANSFERRED_OUT_FROM_QUEUE',
  HistoricalMetricName.contactsMissed: 'CONTACTS_MISSED',
  HistoricalMetricName.callbackContactsHandled: 'CALLBACK_CONTACTS_HANDLED',
  HistoricalMetricName.apiContactsHandled: 'API_CONTACTS_HANDLED',
  HistoricalMetricName.occupancy: 'OCCUPANCY',
  HistoricalMetricName.handleTime: 'HANDLE_TIME',
  HistoricalMetricName.afterContactWorkTime: 'AFTER_CONTACT_WORK_TIME',
  HistoricalMetricName.queuedTime: 'QUEUED_TIME',
  HistoricalMetricName.abandonTime: 'ABANDON_TIME',
  HistoricalMetricName.queueAnswerTime: 'QUEUE_ANSWER_TIME',
  HistoricalMetricName.holdTime: 'HOLD_TIME',
  HistoricalMetricName.interactionTime: 'INTERACTION_TIME',
  HistoricalMetricName.interactionAndHoldTime: 'INTERACTION_AND_HOLD_TIME',
  HistoricalMetricName.serviceLevel: 'SERVICE_LEVEL',
};

const _$StatisticEnumMap = {
  Statistic.sum: 'SUM',
  Statistic.max: 'MAX',
  Statistic.avg: 'AVG',
};

HistoricalMetricData _$HistoricalMetricDataFromJson(Map<String, dynamic> json) {
  return HistoricalMetricData(
    metric: json['Metric'] == null
        ? null
        : HistoricalMetric.fromJson(json['Metric'] as Map<String, dynamic>),
    value: (json['Value'] as num)?.toDouble(),
  );
}

HistoricalMetricResult _$HistoricalMetricResultFromJson(
    Map<String, dynamic> json) {
  return HistoricalMetricResult(
    collections: (json['Collections'] as List)
        ?.map((e) => e == null
            ? null
            : HistoricalMetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dimensions: json['Dimensions'] == null
        ? null
        : Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
  );
}

HoursOfOperationSummary _$HoursOfOperationSummaryFromJson(
    Map<String, dynamic> json) {
  return HoursOfOperationSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    id: json['Id'] as String,
    identityManagementType: _$enumDecodeNullable(
        _$DirectoryTypeEnumMap, json['IdentityManagementType']),
    inboundCallsEnabled: json['InboundCallsEnabled'] as bool,
    instanceAlias: json['InstanceAlias'] as String,
    instanceStatus:
        _$enumDecodeNullable(_$InstanceStatusEnumMap, json['InstanceStatus']),
    outboundCallsEnabled: json['OutboundCallsEnabled'] as bool,
    serviceRole: json['ServiceRole'] as String,
    statusReason: json['StatusReason'] == null
        ? null
        : InstanceStatusReason.fromJson(
            json['StatusReason'] as Map<String, dynamic>),
  );
}

const _$DirectoryTypeEnumMap = {
  DirectoryType.saml: 'SAML',
  DirectoryType.connectManaged: 'CONNECT_MANAGED',
  DirectoryType.existingDirectory: 'EXISTING_DIRECTORY',
};

const _$InstanceStatusEnumMap = {
  InstanceStatus.creationInProgress: 'CREATION_IN_PROGRESS',
  InstanceStatus.active: 'ACTIVE',
  InstanceStatus.creationFailed: 'CREATION_FAILED',
};

InstanceStatusReason _$InstanceStatusReasonFromJson(Map<String, dynamic> json) {
  return InstanceStatusReason(
    message: json['Message'] as String,
  );
}

InstanceStorageConfig _$InstanceStorageConfigFromJson(
    Map<String, dynamic> json) {
  return InstanceStorageConfig(
    storageType:
        _$enumDecodeNullable(_$StorageTypeEnumMap, json['StorageType']),
    associationId: json['AssociationId'] as String,
    kinesisFirehoseConfig: json['KinesisFirehoseConfig'] == null
        ? null
        : KinesisFirehoseConfig.fromJson(
            json['KinesisFirehoseConfig'] as Map<String, dynamic>),
    kinesisStreamConfig: json['KinesisStreamConfig'] == null
        ? null
        : KinesisStreamConfig.fromJson(
            json['KinesisStreamConfig'] as Map<String, dynamic>),
    kinesisVideoStreamConfig: json['KinesisVideoStreamConfig'] == null
        ? null
        : KinesisVideoStreamConfig.fromJson(
            json['KinesisVideoStreamConfig'] as Map<String, dynamic>),
    s3Config: json['S3Config'] == null
        ? null
        : S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InstanceStorageConfigToJson(
    InstanceStorageConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StorageType', _$StorageTypeEnumMap[instance.storageType]);
  writeNotNull('AssociationId', instance.associationId);
  writeNotNull(
      'KinesisFirehoseConfig', instance.kinesisFirehoseConfig?.toJson());
  writeNotNull('KinesisStreamConfig', instance.kinesisStreamConfig?.toJson());
  writeNotNull(
      'KinesisVideoStreamConfig', instance.kinesisVideoStreamConfig?.toJson());
  writeNotNull('S3Config', instance.s3Config?.toJson());
  return val;
}

const _$StorageTypeEnumMap = {
  StorageType.s3: 'S3',
  StorageType.kinesisVideoStream: 'KINESIS_VIDEO_STREAM',
  StorageType.kinesisStream: 'KINESIS_STREAM',
  StorageType.kinesisFirehose: 'KINESIS_FIREHOSE',
};

InstanceSummary _$InstanceSummaryFromJson(Map<String, dynamic> json) {
  return InstanceSummary(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    id: json['Id'] as String,
    identityManagementType: _$enumDecodeNullable(
        _$DirectoryTypeEnumMap, json['IdentityManagementType']),
    inboundCallsEnabled: json['InboundCallsEnabled'] as bool,
    instanceAlias: json['InstanceAlias'] as String,
    instanceStatus:
        _$enumDecodeNullable(_$InstanceStatusEnumMap, json['InstanceStatus']),
    outboundCallsEnabled: json['OutboundCallsEnabled'] as bool,
    serviceRole: json['ServiceRole'] as String,
  );
}

IntegrationAssociationSummary _$IntegrationAssociationSummaryFromJson(
    Map<String, dynamic> json) {
  return IntegrationAssociationSummary(
    instanceId: json['InstanceId'] as String,
    integrationArn: json['IntegrationArn'] as String,
    integrationAssociationArn: json['IntegrationAssociationArn'] as String,
    integrationAssociationId: json['IntegrationAssociationId'] as String,
    integrationType:
        _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['IntegrationType']),
    sourceApplicationName: json['SourceApplicationName'] as String,
    sourceApplicationUrl: json['SourceApplicationUrl'] as String,
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['SourceType']),
  );
}

const _$IntegrationTypeEnumMap = {
  IntegrationType.event: 'EVENT',
};

const _$SourceTypeEnumMap = {
  SourceType.salesforce: 'SALESFORCE',
  SourceType.zendesk: 'ZENDESK',
};

KinesisFirehoseConfig _$KinesisFirehoseConfigFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseConfig(
    firehoseArn: json['FirehoseArn'] as String,
  );
}

Map<String, dynamic> _$KinesisFirehoseConfigToJson(
    KinesisFirehoseConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FirehoseArn', instance.firehoseArn);
  return val;
}

KinesisStreamConfig _$KinesisStreamConfigFromJson(Map<String, dynamic> json) {
  return KinesisStreamConfig(
    streamArn: json['StreamArn'] as String,
  );
}

Map<String, dynamic> _$KinesisStreamConfigToJson(KinesisStreamConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamArn', instance.streamArn);
  return val;
}

KinesisVideoStreamConfig _$KinesisVideoStreamConfigFromJson(
    Map<String, dynamic> json) {
  return KinesisVideoStreamConfig(
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
    prefix: json['Prefix'] as String,
    retentionPeriodHours: json['RetentionPeriodHours'] as int,
  );
}

Map<String, dynamic> _$KinesisVideoStreamConfigToJson(
    KinesisVideoStreamConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncryptionConfig', instance.encryptionConfig?.toJson());
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('RetentionPeriodHours', instance.retentionPeriodHours);
  return val;
}

LexBot _$LexBotFromJson(Map<String, dynamic> json) {
  return LexBot(
    lexRegion: json['LexRegion'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$LexBotToJson(LexBot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LexRegion', instance.lexRegion);
  writeNotNull('Name', instance.name);
  return val;
}

ListApprovedOriginsResponse _$ListApprovedOriginsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApprovedOriginsResponse(
    nextToken: json['NextToken'] as String,
    origins: (json['Origins'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListContactFlowsResponse _$ListContactFlowsResponseFromJson(
    Map<String, dynamic> json) {
  return ListContactFlowsResponse(
    contactFlowSummaryList: (json['ContactFlowSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ContactFlowSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListHoursOfOperationsResponse _$ListHoursOfOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListHoursOfOperationsResponse(
    hoursOfOperationSummaryList: (json['HoursOfOperationSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : HoursOfOperationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListInstanceAttributesResponse _$ListInstanceAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstanceAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListInstanceStorageConfigsResponse _$ListInstanceStorageConfigsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstanceStorageConfigsResponse(
    nextToken: json['NextToken'] as String,
    storageConfigs: (json['StorageConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceStorageConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListInstancesResponse _$ListInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstancesResponse(
    instanceSummaryList: (json['InstanceSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIntegrationAssociationsResponse
    _$ListIntegrationAssociationsResponseFromJson(Map<String, dynamic> json) {
  return ListIntegrationAssociationsResponse(
    integrationAssociationSummaryList:
        (json['IntegrationAssociationSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : IntegrationAssociationSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLambdaFunctionsResponse _$ListLambdaFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLambdaFunctionsResponse(
    lambdaFunctions:
        (json['LambdaFunctions'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLexBotsResponse _$ListLexBotsResponseFromJson(Map<String, dynamic> json) {
  return ListLexBotsResponse(
    lexBots: (json['LexBots'] as List)
        ?.map((e) =>
            e == null ? null : LexBot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPhoneNumbersResponse _$ListPhoneNumbersResponseFromJson(
    Map<String, dynamic> json) {
  return ListPhoneNumbersResponse(
    nextToken: json['NextToken'] as String,
    phoneNumberSummaryList: (json['PhoneNumberSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPromptsResponse _$ListPromptsResponseFromJson(Map<String, dynamic> json) {
  return ListPromptsResponse(
    nextToken: json['NextToken'] as String,
    promptSummaryList: (json['PromptSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : PromptSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListQueuesResponse _$ListQueuesResponseFromJson(Map<String, dynamic> json) {
  return ListQueuesResponse(
    nextToken: json['NextToken'] as String,
    queueSummaryList: (json['QueueSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : QueueSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListQuickConnectsResponse _$ListQuickConnectsResponseFromJson(
    Map<String, dynamic> json) {
  return ListQuickConnectsResponse(
    nextToken: json['NextToken'] as String,
    quickConnectSummaryList: (json['QuickConnectSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : QuickConnectSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRoutingProfileQueuesResponse _$ListRoutingProfileQueuesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRoutingProfileQueuesResponse(
    nextToken: json['NextToken'] as String,
    routingProfileQueueConfigSummaryList:
        (json['RoutingProfileQueueConfigSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : RoutingProfileQueueConfigSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListRoutingProfilesResponse _$ListRoutingProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRoutingProfilesResponse(
    nextToken: json['NextToken'] as String,
    routingProfileSummaryList: (json['RoutingProfileSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : RoutingProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecurityKeysResponse _$ListSecurityKeysResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecurityKeysResponse(
    nextToken: json['NextToken'] as String,
    securityKeys: (json['SecurityKeys'] as List)
        ?.map((e) =>
            e == null ? null : SecurityKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecurityProfilesResponse _$ListSecurityProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecurityProfilesResponse(
    nextToken: json['NextToken'] as String,
    securityProfileSummaryList: (json['SecurityProfileSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListUseCasesResponse _$ListUseCasesResponseFromJson(Map<String, dynamic> json) {
  return ListUseCasesResponse(
    nextToken: json['NextToken'] as String,
    useCaseSummaryList: (json['UseCaseSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : UseCase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUserHierarchyGroupsResponse _$ListUserHierarchyGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserHierarchyGroupsResponse(
    nextToken: json['NextToken'] as String,
    userHierarchyGroupSummaryList:
        (json['UserHierarchyGroupSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : HierarchyGroupSummary.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    nextToken: json['NextToken'] as String,
    userSummaryList: (json['UserSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : UserSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MediaConcurrency _$MediaConcurrencyFromJson(Map<String, dynamic> json) {
  return MediaConcurrency(
    channel: _$enumDecodeNullable(_$ChannelEnumMap, json['Channel']),
    concurrency: json['Concurrency'] as int,
  );
}

Map<String, dynamic> _$MediaConcurrencyToJson(MediaConcurrency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Channel', _$ChannelEnumMap[instance.channel]);
  writeNotNull('Concurrency', instance.concurrency);
  return val;
}

Map<String, dynamic> _$ParticipantDetailsToJson(ParticipantDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  return val;
}

PhoneNumberQuickConnectConfig _$PhoneNumberQuickConnectConfigFromJson(
    Map<String, dynamic> json) {
  return PhoneNumberQuickConnectConfig(
    phoneNumber: json['PhoneNumber'] as String,
  );
}

Map<String, dynamic> _$PhoneNumberQuickConnectConfigToJson(
    PhoneNumberQuickConnectConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneNumber', instance.phoneNumber);
  return val;
}

PhoneNumberSummary _$PhoneNumberSummaryFromJson(Map<String, dynamic> json) {
  return PhoneNumberSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    phoneNumberCountryCode: _$enumDecodeNullable(
        _$PhoneNumberCountryCodeEnumMap, json['PhoneNumberCountryCode']),
    phoneNumberType:
        _$enumDecodeNullable(_$PhoneNumberTypeEnumMap, json['PhoneNumberType']),
  );
}

const _$PhoneNumberCountryCodeEnumMap = {
  PhoneNumberCountryCode.af: 'AF',
  PhoneNumberCountryCode.al: 'AL',
  PhoneNumberCountryCode.dz: 'DZ',
  PhoneNumberCountryCode.as: 'AS',
  PhoneNumberCountryCode.ad: 'AD',
  PhoneNumberCountryCode.ao: 'AO',
  PhoneNumberCountryCode.ai: 'AI',
  PhoneNumberCountryCode.aq: 'AQ',
  PhoneNumberCountryCode.ag: 'AG',
  PhoneNumberCountryCode.ar: 'AR',
  PhoneNumberCountryCode.am: 'AM',
  PhoneNumberCountryCode.aw: 'AW',
  PhoneNumberCountryCode.au: 'AU',
  PhoneNumberCountryCode.at: 'AT',
  PhoneNumberCountryCode.az: 'AZ',
  PhoneNumberCountryCode.bs: 'BS',
  PhoneNumberCountryCode.bh: 'BH',
  PhoneNumberCountryCode.bd: 'BD',
  PhoneNumberCountryCode.bb: 'BB',
  PhoneNumberCountryCode.by: 'BY',
  PhoneNumberCountryCode.be: 'BE',
  PhoneNumberCountryCode.bz: 'BZ',
  PhoneNumberCountryCode.bj: 'BJ',
  PhoneNumberCountryCode.bm: 'BM',
  PhoneNumberCountryCode.bt: 'BT',
  PhoneNumberCountryCode.bo: 'BO',
  PhoneNumberCountryCode.ba: 'BA',
  PhoneNumberCountryCode.bw: 'BW',
  PhoneNumberCountryCode.br: 'BR',
  PhoneNumberCountryCode.io: 'IO',
  PhoneNumberCountryCode.vg: 'VG',
  PhoneNumberCountryCode.bn: 'BN',
  PhoneNumberCountryCode.bg: 'BG',
  PhoneNumberCountryCode.bf: 'BF',
  PhoneNumberCountryCode.bi: 'BI',
  PhoneNumberCountryCode.kh: 'KH',
  PhoneNumberCountryCode.cm: 'CM',
  PhoneNumberCountryCode.ca: 'CA',
  PhoneNumberCountryCode.cv: 'CV',
  PhoneNumberCountryCode.ky: 'KY',
  PhoneNumberCountryCode.cf: 'CF',
  PhoneNumberCountryCode.td: 'TD',
  PhoneNumberCountryCode.cl: 'CL',
  PhoneNumberCountryCode.cn: 'CN',
  PhoneNumberCountryCode.cx: 'CX',
  PhoneNumberCountryCode.cc: 'CC',
  PhoneNumberCountryCode.co: 'CO',
  PhoneNumberCountryCode.km: 'KM',
  PhoneNumberCountryCode.ck: 'CK',
  PhoneNumberCountryCode.cr: 'CR',
  PhoneNumberCountryCode.hr: 'HR',
  PhoneNumberCountryCode.cu: 'CU',
  PhoneNumberCountryCode.cw: 'CW',
  PhoneNumberCountryCode.cy: 'CY',
  PhoneNumberCountryCode.cz: 'CZ',
  PhoneNumberCountryCode.cd: 'CD',
  PhoneNumberCountryCode.dk: 'DK',
  PhoneNumberCountryCode.dj: 'DJ',
  PhoneNumberCountryCode.dm: 'DM',
  PhoneNumberCountryCode.$do: 'DO',
  PhoneNumberCountryCode.tl: 'TL',
  PhoneNumberCountryCode.ec: 'EC',
  PhoneNumberCountryCode.eg: 'EG',
  PhoneNumberCountryCode.sv: 'SV',
  PhoneNumberCountryCode.gq: 'GQ',
  PhoneNumberCountryCode.er: 'ER',
  PhoneNumberCountryCode.ee: 'EE',
  PhoneNumberCountryCode.et: 'ET',
  PhoneNumberCountryCode.fk: 'FK',
  PhoneNumberCountryCode.fo: 'FO',
  PhoneNumberCountryCode.fj: 'FJ',
  PhoneNumberCountryCode.fi: 'FI',
  PhoneNumberCountryCode.fr: 'FR',
  PhoneNumberCountryCode.pf: 'PF',
  PhoneNumberCountryCode.ga: 'GA',
  PhoneNumberCountryCode.gm: 'GM',
  PhoneNumberCountryCode.ge: 'GE',
  PhoneNumberCountryCode.de: 'DE',
  PhoneNumberCountryCode.gh: 'GH',
  PhoneNumberCountryCode.gi: 'GI',
  PhoneNumberCountryCode.gr: 'GR',
  PhoneNumberCountryCode.gl: 'GL',
  PhoneNumberCountryCode.gd: 'GD',
  PhoneNumberCountryCode.gu: 'GU',
  PhoneNumberCountryCode.gt: 'GT',
  PhoneNumberCountryCode.gg: 'GG',
  PhoneNumberCountryCode.gn: 'GN',
  PhoneNumberCountryCode.gw: 'GW',
  PhoneNumberCountryCode.gy: 'GY',
  PhoneNumberCountryCode.ht: 'HT',
  PhoneNumberCountryCode.hn: 'HN',
  PhoneNumberCountryCode.hk: 'HK',
  PhoneNumberCountryCode.hu: 'HU',
  PhoneNumberCountryCode.$is: 'IS',
  PhoneNumberCountryCode.$in: 'IN',
  PhoneNumberCountryCode.id: 'ID',
  PhoneNumberCountryCode.ir: 'IR',
  PhoneNumberCountryCode.iq: 'IQ',
  PhoneNumberCountryCode.ie: 'IE',
  PhoneNumberCountryCode.im: 'IM',
  PhoneNumberCountryCode.il: 'IL',
  PhoneNumberCountryCode.it: 'IT',
  PhoneNumberCountryCode.ci: 'CI',
  PhoneNumberCountryCode.jm: 'JM',
  PhoneNumberCountryCode.jp: 'JP',
  PhoneNumberCountryCode.je: 'JE',
  PhoneNumberCountryCode.jo: 'JO',
  PhoneNumberCountryCode.kz: 'KZ',
  PhoneNumberCountryCode.ke: 'KE',
  PhoneNumberCountryCode.ki: 'KI',
  PhoneNumberCountryCode.kw: 'KW',
  PhoneNumberCountryCode.kg: 'KG',
  PhoneNumberCountryCode.la: 'LA',
  PhoneNumberCountryCode.lv: 'LV',
  PhoneNumberCountryCode.lb: 'LB',
  PhoneNumberCountryCode.ls: 'LS',
  PhoneNumberCountryCode.lr: 'LR',
  PhoneNumberCountryCode.ly: 'LY',
  PhoneNumberCountryCode.li: 'LI',
  PhoneNumberCountryCode.lt: 'LT',
  PhoneNumberCountryCode.lu: 'LU',
  PhoneNumberCountryCode.mo: 'MO',
  PhoneNumberCountryCode.mk: 'MK',
  PhoneNumberCountryCode.mg: 'MG',
  PhoneNumberCountryCode.mw: 'MW',
  PhoneNumberCountryCode.my: 'MY',
  PhoneNumberCountryCode.mv: 'MV',
  PhoneNumberCountryCode.ml: 'ML',
  PhoneNumberCountryCode.mt: 'MT',
  PhoneNumberCountryCode.mh: 'MH',
  PhoneNumberCountryCode.mr: 'MR',
  PhoneNumberCountryCode.mu: 'MU',
  PhoneNumberCountryCode.yt: 'YT',
  PhoneNumberCountryCode.mx: 'MX',
  PhoneNumberCountryCode.fm: 'FM',
  PhoneNumberCountryCode.md: 'MD',
  PhoneNumberCountryCode.mc: 'MC',
  PhoneNumberCountryCode.mn: 'MN',
  PhoneNumberCountryCode.me: 'ME',
  PhoneNumberCountryCode.ms: 'MS',
  PhoneNumberCountryCode.ma: 'MA',
  PhoneNumberCountryCode.mz: 'MZ',
  PhoneNumberCountryCode.mm: 'MM',
  PhoneNumberCountryCode.na: 'NA',
  PhoneNumberCountryCode.nr: 'NR',
  PhoneNumberCountryCode.np: 'NP',
  PhoneNumberCountryCode.nl: 'NL',
  PhoneNumberCountryCode.an: 'AN',
  PhoneNumberCountryCode.nc: 'NC',
  PhoneNumberCountryCode.nz: 'NZ',
  PhoneNumberCountryCode.ni: 'NI',
  PhoneNumberCountryCode.ne: 'NE',
  PhoneNumberCountryCode.ng: 'NG',
  PhoneNumberCountryCode.nu: 'NU',
  PhoneNumberCountryCode.kp: 'KP',
  PhoneNumberCountryCode.mp: 'MP',
  PhoneNumberCountryCode.no: 'NO',
  PhoneNumberCountryCode.om: 'OM',
  PhoneNumberCountryCode.pk: 'PK',
  PhoneNumberCountryCode.pw: 'PW',
  PhoneNumberCountryCode.pa: 'PA',
  PhoneNumberCountryCode.pg: 'PG',
  PhoneNumberCountryCode.py: 'PY',
  PhoneNumberCountryCode.pe: 'PE',
  PhoneNumberCountryCode.ph: 'PH',
  PhoneNumberCountryCode.pn: 'PN',
  PhoneNumberCountryCode.pl: 'PL',
  PhoneNumberCountryCode.pt: 'PT',
  PhoneNumberCountryCode.pr: 'PR',
  PhoneNumberCountryCode.qa: 'QA',
  PhoneNumberCountryCode.cg: 'CG',
  PhoneNumberCountryCode.re: 'RE',
  PhoneNumberCountryCode.ro: 'RO',
  PhoneNumberCountryCode.ru: 'RU',
  PhoneNumberCountryCode.rw: 'RW',
  PhoneNumberCountryCode.bl: 'BL',
  PhoneNumberCountryCode.sh: 'SH',
  PhoneNumberCountryCode.kn: 'KN',
  PhoneNumberCountryCode.lc: 'LC',
  PhoneNumberCountryCode.mf: 'MF',
  PhoneNumberCountryCode.pm: 'PM',
  PhoneNumberCountryCode.vc: 'VC',
  PhoneNumberCountryCode.ws: 'WS',
  PhoneNumberCountryCode.sm: 'SM',
  PhoneNumberCountryCode.st: 'ST',
  PhoneNumberCountryCode.sa: 'SA',
  PhoneNumberCountryCode.sn: 'SN',
  PhoneNumberCountryCode.rs: 'RS',
  PhoneNumberCountryCode.sc: 'SC',
  PhoneNumberCountryCode.sl: 'SL',
  PhoneNumberCountryCode.sg: 'SG',
  PhoneNumberCountryCode.sx: 'SX',
  PhoneNumberCountryCode.sk: 'SK',
  PhoneNumberCountryCode.si: 'SI',
  PhoneNumberCountryCode.sb: 'SB',
  PhoneNumberCountryCode.so: 'SO',
  PhoneNumberCountryCode.za: 'ZA',
  PhoneNumberCountryCode.kr: 'KR',
  PhoneNumberCountryCode.es: 'ES',
  PhoneNumberCountryCode.lk: 'LK',
  PhoneNumberCountryCode.sd: 'SD',
  PhoneNumberCountryCode.sr: 'SR',
  PhoneNumberCountryCode.sj: 'SJ',
  PhoneNumberCountryCode.sz: 'SZ',
  PhoneNumberCountryCode.se: 'SE',
  PhoneNumberCountryCode.ch: 'CH',
  PhoneNumberCountryCode.sy: 'SY',
  PhoneNumberCountryCode.tw: 'TW',
  PhoneNumberCountryCode.tj: 'TJ',
  PhoneNumberCountryCode.tz: 'TZ',
  PhoneNumberCountryCode.th: 'TH',
  PhoneNumberCountryCode.tg: 'TG',
  PhoneNumberCountryCode.tk: 'TK',
  PhoneNumberCountryCode.to: 'TO',
  PhoneNumberCountryCode.tt: 'TT',
  PhoneNumberCountryCode.tn: 'TN',
  PhoneNumberCountryCode.tr: 'TR',
  PhoneNumberCountryCode.tm: 'TM',
  PhoneNumberCountryCode.tc: 'TC',
  PhoneNumberCountryCode.tv: 'TV',
  PhoneNumberCountryCode.vi: 'VI',
  PhoneNumberCountryCode.ug: 'UG',
  PhoneNumberCountryCode.ua: 'UA',
  PhoneNumberCountryCode.ae: 'AE',
  PhoneNumberCountryCode.gb: 'GB',
  PhoneNumberCountryCode.us: 'US',
  PhoneNumberCountryCode.uy: 'UY',
  PhoneNumberCountryCode.uz: 'UZ',
  PhoneNumberCountryCode.vu: 'VU',
  PhoneNumberCountryCode.va: 'VA',
  PhoneNumberCountryCode.ve: 'VE',
  PhoneNumberCountryCode.vn: 'VN',
  PhoneNumberCountryCode.wf: 'WF',
  PhoneNumberCountryCode.eh: 'EH',
  PhoneNumberCountryCode.ye: 'YE',
  PhoneNumberCountryCode.zm: 'ZM',
  PhoneNumberCountryCode.zw: 'ZW',
};

const _$PhoneNumberTypeEnumMap = {
  PhoneNumberType.tollFree: 'TOLL_FREE',
  PhoneNumberType.did: 'DID',
};

PromptSummary _$PromptSummaryFromJson(Map<String, dynamic> json) {
  return PromptSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

QueueQuickConnectConfig _$QueueQuickConnectConfigFromJson(
    Map<String, dynamic> json) {
  return QueueQuickConnectConfig(
    contactFlowId: json['ContactFlowId'] as String,
    queueId: json['QueueId'] as String,
  );
}

Map<String, dynamic> _$QueueQuickConnectConfigToJson(
    QueueQuickConnectConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContactFlowId', instance.contactFlowId);
  writeNotNull('QueueId', instance.queueId);
  return val;
}

QueueReference _$QueueReferenceFromJson(Map<String, dynamic> json) {
  return QueueReference(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

QueueSummary _$QueueSummaryFromJson(Map<String, dynamic> json) {
  return QueueSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    queueType: _$enumDecodeNullable(_$QueueTypeEnumMap, json['QueueType']),
  );
}

const _$QueueTypeEnumMap = {
  QueueType.standard: 'STANDARD',
  QueueType.agent: 'AGENT',
};

QuickConnect _$QuickConnectFromJson(Map<String, dynamic> json) {
  return QuickConnect(
    description: json['Description'] as String,
    name: json['Name'] as String,
    quickConnectARN: json['QuickConnectARN'] as String,
    quickConnectConfig: json['QuickConnectConfig'] == null
        ? null
        : QuickConnectConfig.fromJson(
            json['QuickConnectConfig'] as Map<String, dynamic>),
    quickConnectId: json['QuickConnectId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

QuickConnectConfig _$QuickConnectConfigFromJson(Map<String, dynamic> json) {
  return QuickConnectConfig(
    quickConnectType: _$enumDecodeNullable(
        _$QuickConnectTypeEnumMap, json['QuickConnectType']),
    phoneConfig: json['PhoneConfig'] == null
        ? null
        : PhoneNumberQuickConnectConfig.fromJson(
            json['PhoneConfig'] as Map<String, dynamic>),
    queueConfig: json['QueueConfig'] == null
        ? null
        : QueueQuickConnectConfig.fromJson(
            json['QueueConfig'] as Map<String, dynamic>),
    userConfig: json['UserConfig'] == null
        ? null
        : UserQuickConnectConfig.fromJson(
            json['UserConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuickConnectConfigToJson(QuickConnectConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'QuickConnectType', _$QuickConnectTypeEnumMap[instance.quickConnectType]);
  writeNotNull('PhoneConfig', instance.phoneConfig?.toJson());
  writeNotNull('QueueConfig', instance.queueConfig?.toJson());
  writeNotNull('UserConfig', instance.userConfig?.toJson());
  return val;
}

const _$QuickConnectTypeEnumMap = {
  QuickConnectType.user: 'USER',
  QuickConnectType.queue: 'QUEUE',
  QuickConnectType.phoneNumber: 'PHONE_NUMBER',
};

QuickConnectSummary _$QuickConnectSummaryFromJson(Map<String, dynamic> json) {
  return QuickConnectSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    quickConnectType: _$enumDecodeNullable(
        _$QuickConnectTypeEnumMap, json['QuickConnectType']),
  );
}

Map<String, dynamic> _$ReferenceToJson(Reference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ReferenceTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ReferenceTypeEnumMap = {
  ReferenceType.url: 'URL',
};

ResumeContactRecordingResponse _$ResumeContactRecordingResponseFromJson(
    Map<String, dynamic> json) {
  return ResumeContactRecordingResponse();
}

RoutingProfile _$RoutingProfileFromJson(Map<String, dynamic> json) {
  return RoutingProfile(
    defaultOutboundQueueId: json['DefaultOutboundQueueId'] as String,
    description: json['Description'] as String,
    instanceId: json['InstanceId'] as String,
    mediaConcurrencies: (json['MediaConcurrencies'] as List)
        ?.map((e) => e == null
            ? null
            : MediaConcurrency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    routingProfileArn: json['RoutingProfileArn'] as String,
    routingProfileId: json['RoutingProfileId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$RoutingProfileQueueConfigToJson(
    RoutingProfileQueueConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Delay', instance.delay);
  writeNotNull('Priority', instance.priority);
  writeNotNull('QueueReference', instance.queueReference?.toJson());
  return val;
}

RoutingProfileQueueConfigSummary _$RoutingProfileQueueConfigSummaryFromJson(
    Map<String, dynamic> json) {
  return RoutingProfileQueueConfigSummary(
    channel: _$enumDecodeNullable(_$ChannelEnumMap, json['Channel']),
    delay: json['Delay'] as int,
    priority: json['Priority'] as int,
    queueArn: json['QueueArn'] as String,
    queueId: json['QueueId'] as String,
    queueName: json['QueueName'] as String,
  );
}

Map<String, dynamic> _$RoutingProfileQueueReferenceToJson(
    RoutingProfileQueueReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Channel', _$ChannelEnumMap[instance.channel]);
  writeNotNull('QueueId', instance.queueId);
  return val;
}

RoutingProfileSummary _$RoutingProfileSummaryFromJson(
    Map<String, dynamic> json) {
  return RoutingProfileSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

S3Config _$S3ConfigFromJson(Map<String, dynamic> json) {
  return S3Config(
    bucketName: json['BucketName'] as String,
    bucketPrefix: json['BucketPrefix'] as String,
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3ConfigToJson(S3Config instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('BucketPrefix', instance.bucketPrefix);
  writeNotNull('EncryptionConfig', instance.encryptionConfig?.toJson());
  return val;
}

SecurityKey _$SecurityKeyFromJson(Map<String, dynamic> json) {
  return SecurityKey(
    associationId: json['AssociationId'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    key: json['Key'] as String,
  );
}

SecurityProfileSummary _$SecurityProfileSummaryFromJson(
    Map<String, dynamic> json) {
  return SecurityProfileSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

StartChatContactResponse _$StartChatContactResponseFromJson(
    Map<String, dynamic> json) {
  return StartChatContactResponse(
    contactId: json['ContactId'] as String,
    participantId: json['ParticipantId'] as String,
    participantToken: json['ParticipantToken'] as String,
  );
}

StartContactRecordingResponse _$StartContactRecordingResponseFromJson(
    Map<String, dynamic> json) {
  return StartContactRecordingResponse();
}

StartOutboundVoiceContactResponse _$StartOutboundVoiceContactResponseFromJson(
    Map<String, dynamic> json) {
  return StartOutboundVoiceContactResponse(
    contactId: json['ContactId'] as String,
  );
}

StartTaskContactResponse _$StartTaskContactResponseFromJson(
    Map<String, dynamic> json) {
  return StartTaskContactResponse(
    contactId: json['ContactId'] as String,
  );
}

StopContactRecordingResponse _$StopContactRecordingResponseFromJson(
    Map<String, dynamic> json) {
  return StopContactRecordingResponse();
}

StopContactResponse _$StopContactResponseFromJson(Map<String, dynamic> json) {
  return StopContactResponse();
}

SuspendContactRecordingResponse _$SuspendContactRecordingResponseFromJson(
    Map<String, dynamic> json) {
  return SuspendContactRecordingResponse();
}

Threshold _$ThresholdFromJson(Map<String, dynamic> json) {
  return Threshold(
    comparison: _$enumDecodeNullable(_$ComparisonEnumMap, json['Comparison']),
    thresholdValue: (json['ThresholdValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ThresholdToJson(Threshold instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparison', _$ComparisonEnumMap[instance.comparison]);
  writeNotNull('ThresholdValue', instance.thresholdValue);
  return val;
}

const _$ComparisonEnumMap = {
  Comparison.lt: 'LT',
};

UpdateContactAttributesResponse _$UpdateContactAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContactAttributesResponse();
}

UseCase _$UseCaseFromJson(Map<String, dynamic> json) {
  return UseCase(
    useCaseArn: json['UseCaseArn'] as String,
    useCaseId: json['UseCaseId'] as String,
    useCaseType:
        _$enumDecodeNullable(_$UseCaseTypeEnumMap, json['UseCaseType']),
  );
}

const _$UseCaseTypeEnumMap = {
  UseCaseType.rulesEvaluation: 'RULES_EVALUATION',
};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    arn: json['Arn'] as String,
    directoryUserId: json['DirectoryUserId'] as String,
    hierarchyGroupId: json['HierarchyGroupId'] as String,
    id: json['Id'] as String,
    identityInfo: json['IdentityInfo'] == null
        ? null
        : UserIdentityInfo.fromJson(
            json['IdentityInfo'] as Map<String, dynamic>),
    phoneConfig: json['PhoneConfig'] == null
        ? null
        : UserPhoneConfig.fromJson(json['PhoneConfig'] as Map<String, dynamic>),
    routingProfileId: json['RoutingProfileId'] as String,
    securityProfileIds:
        (json['SecurityProfileIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    username: json['Username'] as String,
  );
}

UserIdentityInfo _$UserIdentityInfoFromJson(Map<String, dynamic> json) {
  return UserIdentityInfo(
    email: json['Email'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
  );
}

Map<String, dynamic> _$UserIdentityInfoToJson(UserIdentityInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('LastName', instance.lastName);
  return val;
}

UserPhoneConfig _$UserPhoneConfigFromJson(Map<String, dynamic> json) {
  return UserPhoneConfig(
    phoneType: _$enumDecodeNullable(_$PhoneTypeEnumMap, json['PhoneType']),
    afterContactWorkTimeLimit: json['AfterContactWorkTimeLimit'] as int,
    autoAccept: json['AutoAccept'] as bool,
    deskPhoneNumber: json['DeskPhoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserPhoneConfigToJson(UserPhoneConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneType', _$PhoneTypeEnumMap[instance.phoneType]);
  writeNotNull('AfterContactWorkTimeLimit', instance.afterContactWorkTimeLimit);
  writeNotNull('AutoAccept', instance.autoAccept);
  writeNotNull('DeskPhoneNumber', instance.deskPhoneNumber);
  return val;
}

const _$PhoneTypeEnumMap = {
  PhoneType.softPhone: 'SOFT_PHONE',
  PhoneType.deskPhone: 'DESK_PHONE',
};

UserQuickConnectConfig _$UserQuickConnectConfigFromJson(
    Map<String, dynamic> json) {
  return UserQuickConnectConfig(
    contactFlowId: json['ContactFlowId'] as String,
    userId: json['UserId'] as String,
  );
}

Map<String, dynamic> _$UserQuickConnectConfigToJson(
    UserQuickConnectConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContactFlowId', instance.contactFlowId);
  writeNotNull('UserId', instance.userId);
  return val;
}

UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) {
  return UserSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    username: json['Username'] as String,
  );
}

Map<String, dynamic> _$VoiceRecordingConfigurationToJson(
    VoiceRecordingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VoiceRecordingTrack',
      _$VoiceRecordingTrackEnumMap[instance.voiceRecordingTrack]);
  return val;
}

const _$VoiceRecordingTrackEnumMap = {
  VoiceRecordingTrack.fromAgent: 'FROM_AGENT',
  VoiceRecordingTrack.toAgent: 'TO_AGENT',
  VoiceRecordingTrack.all: 'ALL',
};
