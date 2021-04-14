// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iotanalytics-2017-11-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAttributesActivity _$AddAttributesActivityFromJson(
    Map<String, dynamic> json) {
  return AddAttributesActivity(
    attributes: Map<String, String>.from(json['attributes'] as Map),
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$AddAttributesActivityToJson(
    AddAttributesActivity instance) {
  final val = <String, dynamic>{
    'attributes': instance.attributes,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

BatchPutMessageErrorEntry _$BatchPutMessageErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPutMessageErrorEntry(
    errorCode: json['errorCode'] as String?,
    errorMessage: json['errorMessage'] as String?,
    messageId: json['messageId'] as String?,
  );
}

BatchPutMessageResponse _$BatchPutMessageResponseFromJson(
    Map<String, dynamic> json) {
  return BatchPutMessageResponse(
    batchPutMessageErrorEntries:
        (json['batchPutMessageErrorEntries'] as List<dynamic>?)
            ?.map((e) =>
                BatchPutMessageErrorEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

CancelPipelineReprocessingResponse _$CancelPipelineReprocessingResponseFromJson(
    Map<String, dynamic> json) {
  return CancelPipelineReprocessingResponse();
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    arn: json['arn'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastMessageArrivalTime:
        const UnixDateTimeConverter().fromJson(json['lastMessageArrivalTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
    storage: json['storage'] == null
        ? null
        : ChannelStorage.fromJson(json['storage'] as Map<String, dynamic>),
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
  ChannelStatus.creating: 'CREATING',
  ChannelStatus.active: 'ACTIVE',
  ChannelStatus.deleting: 'DELETING',
};

ChannelActivity _$ChannelActivityFromJson(Map<String, dynamic> json) {
  return ChannelActivity(
    channelName: json['channelName'] as String,
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$ChannelActivityToJson(ChannelActivity instance) {
  final val = <String, dynamic>{
    'channelName': instance.channelName,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

Map<String, dynamic> _$ChannelMessagesToJson(ChannelMessages instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Paths', instance.s3Paths);
  return val;
}

ChannelStatistics _$ChannelStatisticsFromJson(Map<String, dynamic> json) {
  return ChannelStatistics(
    size: json['size'] == null
        ? null
        : EstimatedResourceSize.fromJson(json['size'] as Map<String, dynamic>),
  );
}

ChannelStorage _$ChannelStorageFromJson(Map<String, dynamic> json) {
  return ChannelStorage(
    customerManagedS3: json['customerManagedS3'] == null
        ? null
        : CustomerManagedChannelS3Storage.fromJson(
            json['customerManagedS3'] as Map<String, dynamic>),
    serviceManagedS3: json['serviceManagedS3'] == null
        ? null
        : ServiceManagedChannelS3Storage.fromJson(
            json['serviceManagedS3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChannelStorageToJson(ChannelStorage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerManagedS3', instance.customerManagedS3?.toJson());
  writeNotNull('serviceManagedS3', instance.serviceManagedS3?.toJson());
  return val;
}

ChannelStorageSummary _$ChannelStorageSummaryFromJson(
    Map<String, dynamic> json) {
  return ChannelStorageSummary(
    customerManagedS3: json['customerManagedS3'] == null
        ? null
        : CustomerManagedChannelS3StorageSummary.fromJson(
            json['customerManagedS3'] as Map<String, dynamic>),
    serviceManagedS3: json['serviceManagedS3'] == null
        ? null
        : ServiceManagedChannelS3StorageSummary.fromJson(
            json['serviceManagedS3'] as Map<String, dynamic>),
  );
}

ChannelSummary _$ChannelSummaryFromJson(Map<String, dynamic> json) {
  return ChannelSummary(
    channelName: json['channelName'] as String?,
    channelStorage: json['channelStorage'] == null
        ? null
        : ChannelStorageSummary.fromJson(
            json['channelStorage'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastMessageArrivalTime:
        const UnixDateTimeConverter().fromJson(json['lastMessageArrivalTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    status: _$enumDecodeNullable(_$ChannelStatusEnumMap, json['status']),
  );
}

Column _$ColumnFromJson(Map<String, dynamic> json) {
  return Column(
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ColumnToJson(Column instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };

ContainerDatasetAction _$ContainerDatasetActionFromJson(
    Map<String, dynamic> json) {
  return ContainerDatasetAction(
    executionRoleArn: json['executionRoleArn'] as String,
    image: json['image'] as String,
    resourceConfiguration: ResourceConfiguration.fromJson(
        json['resourceConfiguration'] as Map<String, dynamic>),
    variables: (json['variables'] as List<dynamic>?)
        ?.map((e) => Variable.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContainerDatasetActionToJson(
    ContainerDatasetAction instance) {
  final val = <String, dynamic>{
    'executionRoleArn': instance.executionRoleArn,
    'image': instance.image,
    'resourceConfiguration': instance.resourceConfiguration.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'variables', instance.variables?.map((e) => e.toJson()).toList());
  return val;
}

CreateChannelResponse _$CreateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelResponse(
    channelArn: json['channelArn'] as String?,
    channelName: json['channelName'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
  );
}

CreateDatasetContentResponse _$CreateDatasetContentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetContentResponse(
    versionId: json['versionId'] as String?,
  );
}

CreateDatasetResponse _$CreateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetResponse(
    datasetArn: json['datasetArn'] as String?,
    datasetName: json['datasetName'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
  );
}

CreateDatastoreResponse _$CreateDatastoreResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatastoreResponse(
    datastoreArn: json['datastoreArn'] as String?,
    datastoreName: json['datastoreName'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
  );
}

CreatePipelineResponse _$CreatePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePipelineResponse(
    pipelineArn: json['pipelineArn'] as String?,
    pipelineName: json['pipelineName'] as String?,
  );
}

CustomerManagedChannelS3Storage _$CustomerManagedChannelS3StorageFromJson(
    Map<String, dynamic> json) {
  return CustomerManagedChannelS3Storage(
    bucket: json['bucket'] as String,
    roleArn: json['roleArn'] as String,
    keyPrefix: json['keyPrefix'] as String?,
  );
}

Map<String, dynamic> _$CustomerManagedChannelS3StorageToJson(
    CustomerManagedChannelS3Storage instance) {
  final val = <String, dynamic>{
    'bucket': instance.bucket,
    'roleArn': instance.roleArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyPrefix', instance.keyPrefix);
  return val;
}

CustomerManagedChannelS3StorageSummary
    _$CustomerManagedChannelS3StorageSummaryFromJson(
        Map<String, dynamic> json) {
  return CustomerManagedChannelS3StorageSummary(
    bucket: json['bucket'] as String?,
    keyPrefix: json['keyPrefix'] as String?,
    roleArn: json['roleArn'] as String?,
  );
}

CustomerManagedDatastoreS3Storage _$CustomerManagedDatastoreS3StorageFromJson(
    Map<String, dynamic> json) {
  return CustomerManagedDatastoreS3Storage(
    bucket: json['bucket'] as String,
    roleArn: json['roleArn'] as String,
    keyPrefix: json['keyPrefix'] as String?,
  );
}

Map<String, dynamic> _$CustomerManagedDatastoreS3StorageToJson(
    CustomerManagedDatastoreS3Storage instance) {
  final val = <String, dynamic>{
    'bucket': instance.bucket,
    'roleArn': instance.roleArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyPrefix', instance.keyPrefix);
  return val;
}

CustomerManagedDatastoreS3StorageSummary
    _$CustomerManagedDatastoreS3StorageSummaryFromJson(
        Map<String, dynamic> json) {
  return CustomerManagedDatastoreS3StorageSummary(
    bucket: json['bucket'] as String?,
    keyPrefix: json['keyPrefix'] as String?,
    roleArn: json['roleArn'] as String?,
  );
}

Dataset _$DatasetFromJson(Map<String, dynamic> json) {
  return Dataset(
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => DatasetAction.fromJson(e as Map<String, dynamic>))
        .toList(),
    arn: json['arn'] as String?,
    contentDeliveryRules: (json['contentDeliveryRules'] as List<dynamic>?)
        ?.map((e) =>
            DatasetContentDeliveryRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    lateDataRules: (json['lateDataRules'] as List<dynamic>?)
        ?.map((e) => LateDataRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$DatasetStatusEnumMap, json['status']),
    triggers: (json['triggers'] as List<dynamic>?)
        ?.map((e) => DatasetTrigger.fromJson(e as Map<String, dynamic>))
        .toList(),
    versioningConfiguration: json['versioningConfiguration'] == null
        ? null
        : VersioningConfiguration.fromJson(
            json['versioningConfiguration'] as Map<String, dynamic>),
  );
}

const _$DatasetStatusEnumMap = {
  DatasetStatus.creating: 'CREATING',
  DatasetStatus.active: 'ACTIVE',
  DatasetStatus.deleting: 'DELETING',
};

DatasetAction _$DatasetActionFromJson(Map<String, dynamic> json) {
  return DatasetAction(
    actionName: json['actionName'] as String?,
    containerAction: json['containerAction'] == null
        ? null
        : ContainerDatasetAction.fromJson(
            json['containerAction'] as Map<String, dynamic>),
    queryAction: json['queryAction'] == null
        ? null
        : SqlQueryDatasetAction.fromJson(
            json['queryAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatasetActionToJson(DatasetAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actionName', instance.actionName);
  writeNotNull('containerAction', instance.containerAction?.toJson());
  writeNotNull('queryAction', instance.queryAction?.toJson());
  return val;
}

DatasetActionSummary _$DatasetActionSummaryFromJson(Map<String, dynamic> json) {
  return DatasetActionSummary(
    actionName: json['actionName'] as String?,
    actionType:
        _$enumDecodeNullable(_$DatasetActionTypeEnumMap, json['actionType']),
  );
}

const _$DatasetActionTypeEnumMap = {
  DatasetActionType.query: 'QUERY',
  DatasetActionType.container: 'CONTAINER',
};

DatasetContentDeliveryDestination _$DatasetContentDeliveryDestinationFromJson(
    Map<String, dynamic> json) {
  return DatasetContentDeliveryDestination(
    iotEventsDestinationConfiguration:
        json['iotEventsDestinationConfiguration'] == null
            ? null
            : IotEventsDestinationConfiguration.fromJson(
                json['iotEventsDestinationConfiguration']
                    as Map<String, dynamic>),
    s3DestinationConfiguration: json['s3DestinationConfiguration'] == null
        ? null
        : S3DestinationConfiguration.fromJson(
            json['s3DestinationConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatasetContentDeliveryDestinationToJson(
    DatasetContentDeliveryDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('iotEventsDestinationConfiguration',
      instance.iotEventsDestinationConfiguration?.toJson());
  writeNotNull('s3DestinationConfiguration',
      instance.s3DestinationConfiguration?.toJson());
  return val;
}

DatasetContentDeliveryRule _$DatasetContentDeliveryRuleFromJson(
    Map<String, dynamic> json) {
  return DatasetContentDeliveryRule(
    destination: DatasetContentDeliveryDestination.fromJson(
        json['destination'] as Map<String, dynamic>),
    entryName: json['entryName'] as String?,
  );
}

Map<String, dynamic> _$DatasetContentDeliveryRuleToJson(
    DatasetContentDeliveryRule instance) {
  final val = <String, dynamic>{
    'destination': instance.destination.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('entryName', instance.entryName);
  return val;
}

DatasetContentStatus _$DatasetContentStatusFromJson(Map<String, dynamic> json) {
  return DatasetContentStatus(
    reason: json['reason'] as String?,
    state: _$enumDecodeNullable(_$DatasetContentStateEnumMap, json['state']),
  );
}

const _$DatasetContentStateEnumMap = {
  DatasetContentState.creating: 'CREATING',
  DatasetContentState.succeeded: 'SUCCEEDED',
  DatasetContentState.failed: 'FAILED',
};

DatasetContentSummary _$DatasetContentSummaryFromJson(
    Map<String, dynamic> json) {
  return DatasetContentSummary(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['completionTime']),
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    scheduleTime: const UnixDateTimeConverter().fromJson(json['scheduleTime']),
    status: json['status'] == null
        ? null
        : DatasetContentStatus.fromJson(json['status'] as Map<String, dynamic>),
    version: json['version'] as String?,
  );
}

DatasetContentVersionValue _$DatasetContentVersionValueFromJson(
    Map<String, dynamic> json) {
  return DatasetContentVersionValue(
    datasetName: json['datasetName'] as String,
  );
}

Map<String, dynamic> _$DatasetContentVersionValueToJson(
        DatasetContentVersionValue instance) =>
    <String, dynamic>{
      'datasetName': instance.datasetName,
    };

DatasetEntry _$DatasetEntryFromJson(Map<String, dynamic> json) {
  return DatasetEntry(
    dataURI: json['dataURI'] as String?,
    entryName: json['entryName'] as String?,
  );
}

DatasetSummary _$DatasetSummaryFromJson(Map<String, dynamic> json) {
  return DatasetSummary(
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => DatasetActionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    datasetName: json['datasetName'] as String?,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    status: _$enumDecodeNullable(_$DatasetStatusEnumMap, json['status']),
    triggers: (json['triggers'] as List<dynamic>?)
        ?.map((e) => DatasetTrigger.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DatasetTrigger _$DatasetTriggerFromJson(Map<String, dynamic> json) {
  return DatasetTrigger(
    dataset: json['dataset'] == null
        ? null
        : TriggeringDataset.fromJson(json['dataset'] as Map<String, dynamic>),
    schedule: json['schedule'] == null
        ? null
        : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatasetTriggerToJson(DatasetTrigger instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataset', instance.dataset?.toJson());
  writeNotNull('schedule', instance.schedule?.toJson());
  return val;
}

Datastore _$DatastoreFromJson(Map<String, dynamic> json) {
  return Datastore(
    arn: json['arn'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    fileFormatConfiguration: json['fileFormatConfiguration'] == null
        ? null
        : FileFormatConfiguration.fromJson(
            json['fileFormatConfiguration'] as Map<String, dynamic>),
    lastMessageArrivalTime:
        const UnixDateTimeConverter().fromJson(json['lastMessageArrivalTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String?,
    retentionPeriod: json['retentionPeriod'] == null
        ? null
        : RetentionPeriod.fromJson(
            json['retentionPeriod'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$DatastoreStatusEnumMap, json['status']),
    storage: json['storage'] == null
        ? null
        : DatastoreStorage.fromJson(json['storage'] as Map<String, dynamic>),
  );
}

const _$DatastoreStatusEnumMap = {
  DatastoreStatus.creating: 'CREATING',
  DatastoreStatus.active: 'ACTIVE',
  DatastoreStatus.deleting: 'DELETING',
};

DatastoreActivity _$DatastoreActivityFromJson(Map<String, dynamic> json) {
  return DatastoreActivity(
    datastoreName: json['datastoreName'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$DatastoreActivityToJson(DatastoreActivity instance) =>
    <String, dynamic>{
      'datastoreName': instance.datastoreName,
      'name': instance.name,
    };

DatastoreStatistics _$DatastoreStatisticsFromJson(Map<String, dynamic> json) {
  return DatastoreStatistics(
    size: json['size'] == null
        ? null
        : EstimatedResourceSize.fromJson(json['size'] as Map<String, dynamic>),
  );
}

DatastoreStorage _$DatastoreStorageFromJson(Map<String, dynamic> json) {
  return DatastoreStorage(
    customerManagedS3: json['customerManagedS3'] == null
        ? null
        : CustomerManagedDatastoreS3Storage.fromJson(
            json['customerManagedS3'] as Map<String, dynamic>),
    serviceManagedS3: json['serviceManagedS3'] == null
        ? null
        : ServiceManagedDatastoreS3Storage.fromJson(
            json['serviceManagedS3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatastoreStorageToJson(DatastoreStorage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerManagedS3', instance.customerManagedS3?.toJson());
  writeNotNull('serviceManagedS3', instance.serviceManagedS3?.toJson());
  return val;
}

DatastoreStorageSummary _$DatastoreStorageSummaryFromJson(
    Map<String, dynamic> json) {
  return DatastoreStorageSummary(
    customerManagedS3: json['customerManagedS3'] == null
        ? null
        : CustomerManagedDatastoreS3StorageSummary.fromJson(
            json['customerManagedS3'] as Map<String, dynamic>),
    serviceManagedS3: json['serviceManagedS3'] == null
        ? null
        : ServiceManagedDatastoreS3StorageSummary.fromJson(
            json['serviceManagedS3'] as Map<String, dynamic>),
  );
}

DatastoreSummary _$DatastoreSummaryFromJson(Map<String, dynamic> json) {
  return DatastoreSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    datastoreName: json['datastoreName'] as String?,
    datastoreStorage: json['datastoreStorage'] == null
        ? null
        : DatastoreStorageSummary.fromJson(
            json['datastoreStorage'] as Map<String, dynamic>),
    fileFormatType:
        _$enumDecodeNullable(_$FileFormatTypeEnumMap, json['fileFormatType']),
    lastMessageArrivalTime:
        const UnixDateTimeConverter().fromJson(json['lastMessageArrivalTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    status: _$enumDecodeNullable(_$DatastoreStatusEnumMap, json['status']),
  );
}

const _$FileFormatTypeEnumMap = {
  FileFormatType.json: 'JSON',
  FileFormatType.parquet: 'PARQUET',
};

DeltaTime _$DeltaTimeFromJson(Map<String, dynamic> json) {
  return DeltaTime(
    offsetSeconds: json['offsetSeconds'] as int,
    timeExpression: json['timeExpression'] as String,
  );
}

Map<String, dynamic> _$DeltaTimeToJson(DeltaTime instance) => <String, dynamic>{
      'offsetSeconds': instance.offsetSeconds,
      'timeExpression': instance.timeExpression,
    };

DeltaTimeSessionWindowConfiguration
    _$DeltaTimeSessionWindowConfigurationFromJson(Map<String, dynamic> json) {
  return DeltaTimeSessionWindowConfiguration(
    timeoutInMinutes: json['timeoutInMinutes'] as int,
  );
}

Map<String, dynamic> _$DeltaTimeSessionWindowConfigurationToJson(
        DeltaTimeSessionWindowConfiguration instance) =>
    <String, dynamic>{
      'timeoutInMinutes': instance.timeoutInMinutes,
    };

DescribeChannelResponse _$DescribeChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    statistics: json['statistics'] == null
        ? null
        : ChannelStatistics.fromJson(
            json['statistics'] as Map<String, dynamic>),
  );
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    dataset: json['dataset'] == null
        ? null
        : Dataset.fromJson(json['dataset'] as Map<String, dynamic>),
  );
}

DescribeDatastoreResponse _$DescribeDatastoreResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatastoreResponse(
    datastore: json['datastore'] == null
        ? null
        : Datastore.fromJson(json['datastore'] as Map<String, dynamic>),
    statistics: json['statistics'] == null
        ? null
        : DatastoreStatistics.fromJson(
            json['statistics'] as Map<String, dynamic>),
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

DescribePipelineResponse _$DescribePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePipelineResponse(
    pipeline: json['pipeline'] == null
        ? null
        : Pipeline.fromJson(json['pipeline'] as Map<String, dynamic>),
  );
}

DeviceRegistryEnrichActivity _$DeviceRegistryEnrichActivityFromJson(
    Map<String, dynamic> json) {
  return DeviceRegistryEnrichActivity(
    attribute: json['attribute'] as String,
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    thingName: json['thingName'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$DeviceRegistryEnrichActivityToJson(
    DeviceRegistryEnrichActivity instance) {
  final val = <String, dynamic>{
    'attribute': instance.attribute,
    'name': instance.name,
    'roleArn': instance.roleArn,
    'thingName': instance.thingName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

DeviceShadowEnrichActivity _$DeviceShadowEnrichActivityFromJson(
    Map<String, dynamic> json) {
  return DeviceShadowEnrichActivity(
    attribute: json['attribute'] as String,
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    thingName: json['thingName'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$DeviceShadowEnrichActivityToJson(
    DeviceShadowEnrichActivity instance) {
  final val = <String, dynamic>{
    'attribute': instance.attribute,
    'name': instance.name,
    'roleArn': instance.roleArn,
    'thingName': instance.thingName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

EstimatedResourceSize _$EstimatedResourceSizeFromJson(
    Map<String, dynamic> json) {
  return EstimatedResourceSize(
    estimatedOn: const UnixDateTimeConverter().fromJson(json['estimatedOn']),
    estimatedSizeInBytes: (json['estimatedSizeInBytes'] as num?)?.toDouble(),
  );
}

FileFormatConfiguration _$FileFormatConfigurationFromJson(
    Map<String, dynamic> json) {
  return FileFormatConfiguration(
    jsonConfiguration: json['jsonConfiguration'] == null
        ? null
        : JsonConfiguration.fromJson(
            json['jsonConfiguration'] as Map<String, dynamic>),
    parquetConfiguration: json['parquetConfiguration'] == null
        ? null
        : ParquetConfiguration.fromJson(
            json['parquetConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FileFormatConfigurationToJson(
    FileFormatConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jsonConfiguration', instance.jsonConfiguration?.toJson());
  writeNotNull('parquetConfiguration', instance.parquetConfiguration?.toJson());
  return val;
}

FilterActivity _$FilterActivityFromJson(Map<String, dynamic> json) {
  return FilterActivity(
    filter: json['filter'] as String,
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$FilterActivityToJson(FilterActivity instance) {
  final val = <String, dynamic>{
    'filter': instance.filter,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

GetDatasetContentResponse _$GetDatasetContentResponseFromJson(
    Map<String, dynamic> json) {
  return GetDatasetContentResponse(
    entries: (json['entries'] as List<dynamic>?)
        ?.map((e) => DatasetEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] == null
        ? null
        : DatasetContentStatus.fromJson(json['status'] as Map<String, dynamic>),
    timestamp: const UnixDateTimeConverter().fromJson(json['timestamp']),
  );
}

GlueConfiguration _$GlueConfigurationFromJson(Map<String, dynamic> json) {
  return GlueConfiguration(
    databaseName: json['databaseName'] as String,
    tableName: json['tableName'] as String,
  );
}

Map<String, dynamic> _$GlueConfigurationToJson(GlueConfiguration instance) =>
    <String, dynamic>{
      'databaseName': instance.databaseName,
      'tableName': instance.tableName,
    };

IotEventsDestinationConfiguration _$IotEventsDestinationConfigurationFromJson(
    Map<String, dynamic> json) {
  return IotEventsDestinationConfiguration(
    inputName: json['inputName'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$IotEventsDestinationConfigurationToJson(
        IotEventsDestinationConfiguration instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'roleArn': instance.roleArn,
    };

JsonConfiguration _$JsonConfigurationFromJson(Map<String, dynamic> json) {
  return JsonConfiguration();
}

Map<String, dynamic> _$JsonConfigurationToJson(JsonConfiguration instance) =>
    <String, dynamic>{};

LambdaActivity _$LambdaActivityFromJson(Map<String, dynamic> json) {
  return LambdaActivity(
    batchSize: json['batchSize'] as int,
    lambdaName: json['lambdaName'] as String,
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$LambdaActivityToJson(LambdaActivity instance) {
  final val = <String, dynamic>{
    'batchSize': instance.batchSize,
    'lambdaName': instance.lambdaName,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

LateDataRule _$LateDataRuleFromJson(Map<String, dynamic> json) {
  return LateDataRule(
    ruleConfiguration: LateDataRuleConfiguration.fromJson(
        json['ruleConfiguration'] as Map<String, dynamic>),
    ruleName: json['ruleName'] as String?,
  );
}

Map<String, dynamic> _$LateDataRuleToJson(LateDataRule instance) {
  final val = <String, dynamic>{
    'ruleConfiguration': instance.ruleConfiguration.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ruleName', instance.ruleName);
  return val;
}

LateDataRuleConfiguration _$LateDataRuleConfigurationFromJson(
    Map<String, dynamic> json) {
  return LateDataRuleConfiguration(
    deltaTimeSessionWindowConfiguration:
        json['deltaTimeSessionWindowConfiguration'] == null
            ? null
            : DeltaTimeSessionWindowConfiguration.fromJson(
                json['deltaTimeSessionWindowConfiguration']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LateDataRuleConfigurationToJson(
    LateDataRuleConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deltaTimeSessionWindowConfiguration',
      instance.deltaTimeSessionWindowConfiguration?.toJson());
  return val;
}

ListChannelsResponse _$ListChannelsResponseFromJson(Map<String, dynamic> json) {
  return ListChannelsResponse(
    channelSummaries: (json['channelSummaries'] as List<dynamic>?)
        ?.map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListDatasetContentsResponse _$ListDatasetContentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetContentsResponse(
    datasetContentSummaries: (json['datasetContentSummaries'] as List<dynamic>?)
        ?.map((e) => DatasetContentSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListDatasetsResponse _$ListDatasetsResponseFromJson(Map<String, dynamic> json) {
  return ListDatasetsResponse(
    datasetSummaries: (json['datasetSummaries'] as List<dynamic>?)
        ?.map((e) => DatasetSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListDatastoresResponse _$ListDatastoresResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatastoresResponse(
    datastoreSummaries: (json['datastoreSummaries'] as List<dynamic>?)
        ?.map((e) => DatastoreSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListPipelinesResponse _$ListPipelinesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPipelinesResponse(
    nextToken: json['nextToken'] as String?,
    pipelineSummaries: (json['pipelineSummaries'] as List<dynamic>?)
        ?.map((e) => PipelineSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

LoggingOptions _$LoggingOptionsFromJson(Map<String, dynamic> json) {
  return LoggingOptions(
    enabled: json['enabled'] as bool,
    level: _$enumDecode(_$LoggingLevelEnumMap, json['level']),
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$LoggingOptionsToJson(LoggingOptions instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'level': _$LoggingLevelEnumMap[instance.level],
      'roleArn': instance.roleArn,
    };

const _$LoggingLevelEnumMap = {
  LoggingLevel.error: 'ERROR',
};

MathActivity _$MathActivityFromJson(Map<String, dynamic> json) {
  return MathActivity(
    attribute: json['attribute'] as String,
    math: json['math'] as String,
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$MathActivityToJson(MathActivity instance) {
  final val = <String, dynamic>{
    'attribute': instance.attribute,
    'math': instance.math,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'messageId': instance.messageId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payload', const Uint8ListConverter().toJson(instance.payload));
  return val;
}

OutputFileUriValue _$OutputFileUriValueFromJson(Map<String, dynamic> json) {
  return OutputFileUriValue(
    fileName: json['fileName'] as String,
  );
}

Map<String, dynamic> _$OutputFileUriValueToJson(OutputFileUriValue instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
    };

ParquetConfiguration _$ParquetConfigurationFromJson(Map<String, dynamic> json) {
  return ParquetConfiguration(
    schemaDefinition: json['schemaDefinition'] == null
        ? null
        : SchemaDefinition.fromJson(
            json['schemaDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ParquetConfigurationToJson(
    ParquetConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schemaDefinition', instance.schemaDefinition?.toJson());
  return val;
}

Pipeline _$PipelineFromJson(Map<String, dynamic> json) {
  return Pipeline(
    activities: (json['activities'] as List<dynamic>?)
        ?.map((e) => PipelineActivity.fromJson(e as Map<String, dynamic>))
        .toList(),
    arn: json['arn'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String?,
    reprocessingSummaries: (json['reprocessingSummaries'] as List<dynamic>?)
        ?.map((e) => ReprocessingSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

PipelineActivity _$PipelineActivityFromJson(Map<String, dynamic> json) {
  return PipelineActivity(
    addAttributes: json['addAttributes'] == null
        ? null
        : AddAttributesActivity.fromJson(
            json['addAttributes'] as Map<String, dynamic>),
    channel: json['channel'] == null
        ? null
        : ChannelActivity.fromJson(json['channel'] as Map<String, dynamic>),
    datastore: json['datastore'] == null
        ? null
        : DatastoreActivity.fromJson(json['datastore'] as Map<String, dynamic>),
    deviceRegistryEnrich: json['deviceRegistryEnrich'] == null
        ? null
        : DeviceRegistryEnrichActivity.fromJson(
            json['deviceRegistryEnrich'] as Map<String, dynamic>),
    deviceShadowEnrich: json['deviceShadowEnrich'] == null
        ? null
        : DeviceShadowEnrichActivity.fromJson(
            json['deviceShadowEnrich'] as Map<String, dynamic>),
    filter: json['filter'] == null
        ? null
        : FilterActivity.fromJson(json['filter'] as Map<String, dynamic>),
    lambda: json['lambda'] == null
        ? null
        : LambdaActivity.fromJson(json['lambda'] as Map<String, dynamic>),
    math: json['math'] == null
        ? null
        : MathActivity.fromJson(json['math'] as Map<String, dynamic>),
    removeAttributes: json['removeAttributes'] == null
        ? null
        : RemoveAttributesActivity.fromJson(
            json['removeAttributes'] as Map<String, dynamic>),
    selectAttributes: json['selectAttributes'] == null
        ? null
        : SelectAttributesActivity.fromJson(
            json['selectAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PipelineActivityToJson(PipelineActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addAttributes', instance.addAttributes?.toJson());
  writeNotNull('channel', instance.channel?.toJson());
  writeNotNull('datastore', instance.datastore?.toJson());
  writeNotNull('deviceRegistryEnrich', instance.deviceRegistryEnrich?.toJson());
  writeNotNull('deviceShadowEnrich', instance.deviceShadowEnrich?.toJson());
  writeNotNull('filter', instance.filter?.toJson());
  writeNotNull('lambda', instance.lambda?.toJson());
  writeNotNull('math', instance.math?.toJson());
  writeNotNull('removeAttributes', instance.removeAttributes?.toJson());
  writeNotNull('selectAttributes', instance.selectAttributes?.toJson());
  return val;
}

PipelineSummary _$PipelineSummaryFromJson(Map<String, dynamic> json) {
  return PipelineSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    pipelineName: json['pipelineName'] as String?,
    reprocessingSummaries: (json['reprocessingSummaries'] as List<dynamic>?)
        ?.map((e) => ReprocessingSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

QueryFilter _$QueryFilterFromJson(Map<String, dynamic> json) {
  return QueryFilter(
    deltaTime: json['deltaTime'] == null
        ? null
        : DeltaTime.fromJson(json['deltaTime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QueryFilterToJson(QueryFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deltaTime', instance.deltaTime?.toJson());
  return val;
}

RemoveAttributesActivity _$RemoveAttributesActivityFromJson(
    Map<String, dynamic> json) {
  return RemoveAttributesActivity(
    attributes:
        (json['attributes'] as List<dynamic>).map((e) => e as String).toList(),
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$RemoveAttributesActivityToJson(
    RemoveAttributesActivity instance) {
  final val = <String, dynamic>{
    'attributes': instance.attributes,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

ReprocessingSummary _$ReprocessingSummaryFromJson(Map<String, dynamic> json) {
  return ReprocessingSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    id: json['id'] as String?,
    status: _$enumDecodeNullable(_$ReprocessingStatusEnumMap, json['status']),
  );
}

const _$ReprocessingStatusEnumMap = {
  ReprocessingStatus.running: 'RUNNING',
  ReprocessingStatus.succeeded: 'SUCCEEDED',
  ReprocessingStatus.cancelled: 'CANCELLED',
  ReprocessingStatus.failed: 'FAILED',
};

ResourceConfiguration _$ResourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return ResourceConfiguration(
    computeType: _$enumDecode(_$ComputeTypeEnumMap, json['computeType']),
    volumeSizeInGB: json['volumeSizeInGB'] as int,
  );
}

Map<String, dynamic> _$ResourceConfigurationToJson(
        ResourceConfiguration instance) =>
    <String, dynamic>{
      'computeType': _$ComputeTypeEnumMap[instance.computeType],
      'volumeSizeInGB': instance.volumeSizeInGB,
    };

const _$ComputeTypeEnumMap = {
  ComputeType.acu_1: 'ACU_1',
  ComputeType.acu_2: 'ACU_2',
};

RetentionPeriod _$RetentionPeriodFromJson(Map<String, dynamic> json) {
  return RetentionPeriod(
    numberOfDays: json['numberOfDays'] as int?,
    unlimited: json['unlimited'] as bool?,
  );
}

Map<String, dynamic> _$RetentionPeriodToJson(RetentionPeriod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('numberOfDays', instance.numberOfDays);
  writeNotNull('unlimited', instance.unlimited);
  return val;
}

RunPipelineActivityResponse _$RunPipelineActivityResponseFromJson(
    Map<String, dynamic> json) {
  return RunPipelineActivityResponse(
    logResult: json['logResult'] as String?,
    payloads: (json['payloads'] as List<dynamic>?)
        ?.map((e) => const Uint8ListConverter().fromJson(e as String))
        .toList(),
  );
}

S3DestinationConfiguration _$S3DestinationConfigurationFromJson(
    Map<String, dynamic> json) {
  return S3DestinationConfiguration(
    bucket: json['bucket'] as String,
    key: json['key'] as String,
    roleArn: json['roleArn'] as String,
    glueConfiguration: json['glueConfiguration'] == null
        ? null
        : GlueConfiguration.fromJson(
            json['glueConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3DestinationConfigurationToJson(
    S3DestinationConfiguration instance) {
  final val = <String, dynamic>{
    'bucket': instance.bucket,
    'key': instance.key,
    'roleArn': instance.roleArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('glueConfiguration', instance.glueConfiguration?.toJson());
  return val;
}

SampleChannelDataResponse _$SampleChannelDataResponseFromJson(
    Map<String, dynamic> json) {
  return SampleChannelDataResponse(
    payloads: (json['payloads'] as List<dynamic>?)
        ?.map((e) => const Uint8ListConverter().fromJson(e as String))
        .toList(),
  );
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    expression: json['expression'] as String?,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  return val;
}

SchemaDefinition _$SchemaDefinitionFromJson(Map<String, dynamic> json) {
  return SchemaDefinition(
    columns: (json['columns'] as List<dynamic>?)
        ?.map((e) => Column.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SchemaDefinitionToJson(SchemaDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('columns', instance.columns?.map((e) => e.toJson()).toList());
  return val;
}

SelectAttributesActivity _$SelectAttributesActivityFromJson(
    Map<String, dynamic> json) {
  return SelectAttributesActivity(
    attributes:
        (json['attributes'] as List<dynamic>).map((e) => e as String).toList(),
    name: json['name'] as String,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$SelectAttributesActivityToJson(
    SelectAttributesActivity instance) {
  final val = <String, dynamic>{
    'attributes': instance.attributes,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  return val;
}

ServiceManagedChannelS3Storage _$ServiceManagedChannelS3StorageFromJson(
    Map<String, dynamic> json) {
  return ServiceManagedChannelS3Storage();
}

Map<String, dynamic> _$ServiceManagedChannelS3StorageToJson(
        ServiceManagedChannelS3Storage instance) =>
    <String, dynamic>{};

ServiceManagedChannelS3StorageSummary
    _$ServiceManagedChannelS3StorageSummaryFromJson(Map<String, dynamic> json) {
  return ServiceManagedChannelS3StorageSummary();
}

ServiceManagedDatastoreS3Storage _$ServiceManagedDatastoreS3StorageFromJson(
    Map<String, dynamic> json) {
  return ServiceManagedDatastoreS3Storage();
}

Map<String, dynamic> _$ServiceManagedDatastoreS3StorageToJson(
        ServiceManagedDatastoreS3Storage instance) =>
    <String, dynamic>{};

ServiceManagedDatastoreS3StorageSummary
    _$ServiceManagedDatastoreS3StorageSummaryFromJson(
        Map<String, dynamic> json) {
  return ServiceManagedDatastoreS3StorageSummary();
}

SqlQueryDatasetAction _$SqlQueryDatasetActionFromJson(
    Map<String, dynamic> json) {
  return SqlQueryDatasetAction(
    sqlQuery: json['sqlQuery'] as String,
    filters: (json['filters'] as List<dynamic>?)
        ?.map((e) => QueryFilter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SqlQueryDatasetActionToJson(
    SqlQueryDatasetAction instance) {
  final val = <String, dynamic>{
    'sqlQuery': instance.sqlQuery,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filters', instance.filters?.map((e) => e.toJson()).toList());
  return val;
}

StartPipelineReprocessingResponse _$StartPipelineReprocessingResponseFromJson(
    Map<String, dynamic> json) {
  return StartPipelineReprocessingResponse(
    reprocessingId: json['reprocessingId'] as String?,
  );
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

TriggeringDataset _$TriggeringDatasetFromJson(Map<String, dynamic> json) {
  return TriggeringDataset(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TriggeringDatasetToJson(TriggeringDataset instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return Variable(
    name: json['name'] as String,
    datasetContentVersionValue: json['datasetContentVersionValue'] == null
        ? null
        : DatasetContentVersionValue.fromJson(
            json['datasetContentVersionValue'] as Map<String, dynamic>),
    doubleValue: (json['doubleValue'] as num?)?.toDouble(),
    outputFileUriValue: json['outputFileUriValue'] == null
        ? null
        : OutputFileUriValue.fromJson(
            json['outputFileUriValue'] as Map<String, dynamic>),
    stringValue: json['stringValue'] as String?,
  );
}

Map<String, dynamic> _$VariableToJson(Variable instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetContentVersionValue',
      instance.datasetContentVersionValue?.toJson());
  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('outputFileUriValue', instance.outputFileUriValue?.toJson());
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

VersioningConfiguration _$VersioningConfigurationFromJson(
    Map<String, dynamic> json) {
  return VersioningConfiguration(
    maxVersions: json['maxVersions'] as int?,
    unlimited: json['unlimited'] as bool?,
  );
}

Map<String, dynamic> _$VersioningConfigurationToJson(
    VersioningConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxVersions', instance.maxVersions);
  writeNotNull('unlimited', instance.unlimited);
  return val;
}
