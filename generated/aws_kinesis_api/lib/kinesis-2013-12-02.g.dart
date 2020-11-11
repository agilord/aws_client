// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-2013-12-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddTagsToStreamInputToJson(
    AddTagsToStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('Tags', instance.tags);
  return val;
}

Consumer _$ConsumerFromJson(Map<String, dynamic> json) {
  return Consumer(
    consumerARN: json['ConsumerARN'] as String,
    consumerCreationTimestamp:
        unixTimestampFromJson(json['ConsumerCreationTimestamp']),
    consumerName: json['ConsumerName'] as String,
    consumerStatus:
        _$enumDecodeNullable(_$ConsumerStatusEnumMap, json['ConsumerStatus']),
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

const _$ConsumerStatusEnumMap = {
  ConsumerStatus.creating: 'CREATING',
  ConsumerStatus.deleting: 'DELETING',
  ConsumerStatus.active: 'ACTIVE',
};

ConsumerDescription _$ConsumerDescriptionFromJson(Map<String, dynamic> json) {
  return ConsumerDescription(
    consumerARN: json['ConsumerARN'] as String,
    consumerCreationTimestamp:
        unixTimestampFromJson(json['ConsumerCreationTimestamp']),
    consumerName: json['ConsumerName'] as String,
    consumerStatus:
        _$enumDecodeNullable(_$ConsumerStatusEnumMap, json['ConsumerStatus']),
    streamARN: json['StreamARN'] as String,
  );
}

Map<String, dynamic> _$CreateStreamInputToJson(CreateStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShardCount', instance.shardCount);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

Map<String, dynamic> _$DecreaseStreamRetentionPeriodInputToJson(
    DecreaseStreamRetentionPeriodInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetentionPeriodHours', instance.retentionPeriodHours);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

Map<String, dynamic> _$DeleteStreamInputToJson(DeleteStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('EnforceConsumerDeletion', instance.enforceConsumerDeletion);
  return val;
}

Map<String, dynamic> _$DeregisterStreamConsumerInputToJson(
    DeregisterStreamConsumerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConsumerARN', instance.consumerARN);
  writeNotNull('ConsumerName', instance.consumerName);
  writeNotNull('StreamARN', instance.streamARN);
  return val;
}

DescribeLimitsOutput _$DescribeLimitsOutputFromJson(Map<String, dynamic> json) {
  return DescribeLimitsOutput(
    openShardCount: json['OpenShardCount'] as int,
    shardLimit: json['ShardLimit'] as int,
  );
}

Map<String, dynamic> _$DescribeStreamConsumerInputToJson(
    DescribeStreamConsumerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConsumerARN', instance.consumerARN);
  writeNotNull('ConsumerName', instance.consumerName);
  writeNotNull('StreamARN', instance.streamARN);
  return val;
}

DescribeStreamConsumerOutput _$DescribeStreamConsumerOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeStreamConsumerOutput(
    consumerDescription: json['ConsumerDescription'] == null
        ? null
        : ConsumerDescription.fromJson(
            json['ConsumerDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeStreamInputToJson(DescribeStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('ExclusiveStartShardId', instance.exclusiveStartShardId);
  writeNotNull('Limit', instance.limit);
  return val;
}

DescribeStreamOutput _$DescribeStreamOutputFromJson(Map<String, dynamic> json) {
  return DescribeStreamOutput(
    streamDescription: json['StreamDescription'] == null
        ? null
        : StreamDescription.fromJson(
            json['StreamDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeStreamSummaryInputToJson(
    DescribeStreamSummaryInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  return val;
}

DescribeStreamSummaryOutput _$DescribeStreamSummaryOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeStreamSummaryOutput(
    streamDescriptionSummary: json['StreamDescriptionSummary'] == null
        ? null
        : StreamDescriptionSummary.fromJson(
            json['StreamDescriptionSummary'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisableEnhancedMonitoringInputToJson(
    DisableEnhancedMonitoringInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShardLevelMetrics', instance.shardLevelMetrics);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

Map<String, dynamic> _$EnableEnhancedMonitoringInputToJson(
    EnableEnhancedMonitoringInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShardLevelMetrics', instance.shardLevelMetrics);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

EnhancedMetrics _$EnhancedMetricsFromJson(Map<String, dynamic> json) {
  return EnhancedMetrics(
    shardLevelMetrics:
        (json['ShardLevelMetrics'] as List)?.map((e) => e as String)?.toList(),
  );
}

EnhancedMonitoringOutput _$EnhancedMonitoringOutputFromJson(
    Map<String, dynamic> json) {
  return EnhancedMonitoringOutput(
    currentShardLevelMetrics: (json['CurrentShardLevelMetrics'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    desiredShardLevelMetrics: (json['DesiredShardLevelMetrics'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    streamName: json['StreamName'] as String,
  );
}

ExpiredIteratorException _$ExpiredIteratorExceptionFromJson(
    Map<String, dynamic> json) {
  return ExpiredIteratorException(
    message: json['message'] as String,
  );
}

ExpiredNextTokenException _$ExpiredNextTokenExceptionFromJson(
    Map<String, dynamic> json) {
  return ExpiredNextTokenException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$GetRecordsInputToJson(GetRecordsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShardIterator', instance.shardIterator);
  writeNotNull('Limit', instance.limit);
  return val;
}

GetRecordsOutput _$GetRecordsOutputFromJson(Map<String, dynamic> json) {
  return GetRecordsOutput(
    records: (json['Records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    millisBehindLatest: json['MillisBehindLatest'] as int,
    nextShardIterator: json['NextShardIterator'] as String,
  );
}

Map<String, dynamic> _$GetShardIteratorInputToJson(
    GetShardIteratorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShardId', instance.shardId);
  writeNotNull('ShardIteratorType',
      _$ShardIteratorTypeEnumMap[instance.shardIteratorType]);
  writeNotNull('StreamName', instance.streamName);
  writeNotNull('StartingSequenceNumber', instance.startingSequenceNumber);
  writeNotNull('Timestamp', unixTimestampToJson(instance.timestamp));
  return val;
}

const _$ShardIteratorTypeEnumMap = {
  ShardIteratorType.atSequenceNumber: 'AT_SEQUENCE_NUMBER',
  ShardIteratorType.afterSequenceNumber: 'AFTER_SEQUENCE_NUMBER',
  ShardIteratorType.trimHorizon: 'TRIM_HORIZON',
  ShardIteratorType.latest: 'LATEST',
  ShardIteratorType.atTimestamp: 'AT_TIMESTAMP',
};

GetShardIteratorOutput _$GetShardIteratorOutputFromJson(
    Map<String, dynamic> json) {
  return GetShardIteratorOutput(
    shardIterator: json['ShardIterator'] as String,
  );
}

HashKeyRange _$HashKeyRangeFromJson(Map<String, dynamic> json) {
  return HashKeyRange(
    endingHashKey: json['EndingHashKey'] as String,
    startingHashKey: json['StartingHashKey'] as String,
  );
}

Map<String, dynamic> _$IncreaseStreamRetentionPeriodInputToJson(
    IncreaseStreamRetentionPeriodInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetentionPeriodHours', instance.retentionPeriodHours);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

InternalFailureException _$InternalFailureExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalFailureException(
    message: json['message'] as String,
  );
}

InvalidArgumentException _$InvalidArgumentExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidArgumentException(
    message: json['message'] as String,
  );
}

KMSAccessDeniedException _$KMSAccessDeniedExceptionFromJson(
    Map<String, dynamic> json) {
  return KMSAccessDeniedException(
    message: json['message'] as String,
  );
}

KMSDisabledException _$KMSDisabledExceptionFromJson(Map<String, dynamic> json) {
  return KMSDisabledException(
    message: json['message'] as String,
  );
}

KMSInvalidStateException _$KMSInvalidStateExceptionFromJson(
    Map<String, dynamic> json) {
  return KMSInvalidStateException(
    message: json['message'] as String,
  );
}

KMSNotFoundException _$KMSNotFoundExceptionFromJson(Map<String, dynamic> json) {
  return KMSNotFoundException(
    message: json['message'] as String,
  );
}

KMSOptInRequired _$KMSOptInRequiredFromJson(Map<String, dynamic> json) {
  return KMSOptInRequired(
    message: json['message'] as String,
  );
}

KMSThrottlingException _$KMSThrottlingExceptionFromJson(
    Map<String, dynamic> json) {
  return KMSThrottlingException(
    message: json['message'] as String,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ListShardsInputToJson(ListShardsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExclusiveStartShardId', instance.exclusiveStartShardId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StreamCreationTimestamp',
      unixTimestampToJson(instance.streamCreationTimestamp));
  writeNotNull('StreamName', instance.streamName);
  return val;
}

ListShardsOutput _$ListShardsOutputFromJson(Map<String, dynamic> json) {
  return ListShardsOutput(
    nextToken: json['NextToken'] as String,
    shards: (json['Shards'] as List)
        ?.map(
            (e) => e == null ? null : Shard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListStreamConsumersInputToJson(
    ListStreamConsumersInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StreamCreationTimestamp',
      unixTimestampToJson(instance.streamCreationTimestamp));
  return val;
}

ListStreamConsumersOutput _$ListStreamConsumersOutputFromJson(
    Map<String, dynamic> json) {
  return ListStreamConsumersOutput(
    consumers: (json['Consumers'] as List)
        ?.map((e) =>
            e == null ? null : Consumer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListStreamsInputToJson(ListStreamsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExclusiveStartStreamName', instance.exclusiveStartStreamName);
  writeNotNull('Limit', instance.limit);
  return val;
}

ListStreamsOutput _$ListStreamsOutputFromJson(Map<String, dynamic> json) {
  return ListStreamsOutput(
    hasMoreStreams: json['HasMoreStreams'] as bool,
    streamNames:
        (json['StreamNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListTagsForStreamInputToJson(
    ListTagsForStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('ExclusiveStartTagKey', instance.exclusiveStartTagKey);
  writeNotNull('Limit', instance.limit);
  return val;
}

ListTagsForStreamOutput _$ListTagsForStreamOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForStreamOutput(
    hasMoreTags: json['HasMoreTags'] as bool,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MergeShardsInputToJson(MergeShardsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdjacentShardToMerge', instance.adjacentShardToMerge);
  writeNotNull('ShardToMerge', instance.shardToMerge);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

ProvisionedThroughputExceededException
    _$ProvisionedThroughputExceededExceptionFromJson(
        Map<String, dynamic> json) {
  return ProvisionedThroughputExceededException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$PutRecordInputToJson(PutRecordInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', const Uint8ListConverter().toJson(instance.data));
  writeNotNull('PartitionKey', instance.partitionKey);
  writeNotNull('StreamName', instance.streamName);
  writeNotNull('ExplicitHashKey', instance.explicitHashKey);
  writeNotNull('SequenceNumberForOrdering', instance.sequenceNumberForOrdering);
  return val;
}

PutRecordOutput _$PutRecordOutputFromJson(Map<String, dynamic> json) {
  return PutRecordOutput(
    sequenceNumber: json['SequenceNumber'] as String,
    shardId: json['ShardId'] as String,
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
  );
}

const _$EncryptionTypeEnumMap = {
  EncryptionType.none: 'NONE',
  EncryptionType.kms: 'KMS',
};

Map<String, dynamic> _$PutRecordsInputToJson(PutRecordsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Records', instance.records?.map((e) => e?.toJson())?.toList());
  writeNotNull('StreamName', instance.streamName);
  return val;
}

PutRecordsOutput _$PutRecordsOutputFromJson(Map<String, dynamic> json) {
  return PutRecordsOutput(
    records: (json['Records'] as List)
        ?.map((e) => e == null
            ? null
            : PutRecordsResultEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
    failedRecordCount: json['FailedRecordCount'] as int,
  );
}

Map<String, dynamic> _$PutRecordsRequestEntryToJson(
    PutRecordsRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', const Uint8ListConverter().toJson(instance.data));
  writeNotNull('PartitionKey', instance.partitionKey);
  writeNotNull('ExplicitHashKey', instance.explicitHashKey);
  return val;
}

PutRecordsResultEntry _$PutRecordsResultEntryFromJson(
    Map<String, dynamic> json) {
  return PutRecordsResultEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    sequenceNumber: json['SequenceNumber'] as String,
    shardId: json['ShardId'] as String,
  );
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    data: const Uint8ListConverter().fromJson(json['Data'] as String),
    partitionKey: json['PartitionKey'] as String,
    sequenceNumber: json['SequenceNumber'] as String,
    approximateArrivalTimestamp:
        unixTimestampFromJson(json['ApproximateArrivalTimestamp']),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
  );
}

Map<String, dynamic> _$RegisterStreamConsumerInputToJson(
    RegisterStreamConsumerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConsumerName', instance.consumerName);
  writeNotNull('StreamARN', instance.streamARN);
  return val;
}

RegisterStreamConsumerOutput _$RegisterStreamConsumerOutputFromJson(
    Map<String, dynamic> json) {
  return RegisterStreamConsumerOutput(
    consumer: json['Consumer'] == null
        ? null
        : Consumer.fromJson(json['Consumer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RemoveTagsFromStreamInputToJson(
    RemoveTagsFromStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

ResourceInUseException _$ResourceInUseExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceInUseException(
    message: json['message'] as String,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    message: json['message'] as String,
  );
}

SequenceNumberRange _$SequenceNumberRangeFromJson(Map<String, dynamic> json) {
  return SequenceNumberRange(
    startingSequenceNumber: json['StartingSequenceNumber'] as String,
    endingSequenceNumber: json['EndingSequenceNumber'] as String,
  );
}

Shard _$ShardFromJson(Map<String, dynamic> json) {
  return Shard(
    hashKeyRange: json['HashKeyRange'] == null
        ? null
        : HashKeyRange.fromJson(json['HashKeyRange'] as Map<String, dynamic>),
    sequenceNumberRange: json['SequenceNumberRange'] == null
        ? null
        : SequenceNumberRange.fromJson(
            json['SequenceNumberRange'] as Map<String, dynamic>),
    shardId: json['ShardId'] as String,
    adjacentParentShardId: json['AdjacentParentShardId'] as String,
    parentShardId: json['ParentShardId'] as String,
  );
}

Map<String, dynamic> _$SplitShardInputToJson(SplitShardInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NewStartingHashKey', instance.newStartingHashKey);
  writeNotNull('ShardToSplit', instance.shardToSplit);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

Map<String, dynamic> _$StartStreamEncryptionInputToJson(
    StartStreamEncryptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionType', _$EncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

Map<String, dynamic> _$StopStreamEncryptionInputToJson(
    StopStreamEncryptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionType', _$EncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

StreamDescription _$StreamDescriptionFromJson(Map<String, dynamic> json) {
  return StreamDescription(
    enhancedMonitoring: (json['EnhancedMonitoring'] as List)
        ?.map((e) => e == null
            ? null
            : EnhancedMetrics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasMoreShards: json['HasMoreShards'] as bool,
    retentionPeriodHours: json['RetentionPeriodHours'] as int,
    shards: (json['Shards'] as List)
        ?.map(
            (e) => e == null ? null : Shard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    streamARN: json['StreamARN'] as String,
    streamCreationTimestamp:
        unixTimestampFromJson(json['StreamCreationTimestamp']),
    streamName: json['StreamName'] as String,
    streamStatus:
        _$enumDecodeNullable(_$StreamStatusEnumMap, json['StreamStatus']),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
    keyId: json['KeyId'] as String,
  );
}

const _$StreamStatusEnumMap = {
  StreamStatus.creating: 'CREATING',
  StreamStatus.deleting: 'DELETING',
  StreamStatus.active: 'ACTIVE',
  StreamStatus.updating: 'UPDATING',
};

StreamDescriptionSummary _$StreamDescriptionSummaryFromJson(
    Map<String, dynamic> json) {
  return StreamDescriptionSummary(
    enhancedMonitoring: (json['EnhancedMonitoring'] as List)
        ?.map((e) => e == null
            ? null
            : EnhancedMetrics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    openShardCount: json['OpenShardCount'] as int,
    retentionPeriodHours: json['RetentionPeriodHours'] as int,
    streamARN: json['StreamARN'] as String,
    streamCreationTimestamp:
        unixTimestampFromJson(json['StreamCreationTimestamp']),
    streamName: json['StreamName'] as String,
    streamStatus:
        _$enumDecodeNullable(_$StreamStatusEnumMap, json['StreamStatus']),
    consumerCount: json['ConsumerCount'] as int,
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
    keyId: json['KeyId'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$UpdateShardCountInputToJson(
    UpdateShardCountInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScalingType', _$ScalingTypeEnumMap[instance.scalingType]);
  writeNotNull('StreamName', instance.streamName);
  writeNotNull('TargetShardCount', instance.targetShardCount);
  return val;
}

const _$ScalingTypeEnumMap = {
  ScalingType.uniformScaling: 'UNIFORM_SCALING',
};

UpdateShardCountOutput _$UpdateShardCountOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateShardCountOutput(
    currentShardCount: json['CurrentShardCount'] as int,
    streamName: json['StreamName'] as String,
    targetShardCount: json['TargetShardCount'] as int,
  );
}
