// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-2013-12-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumer _$ConsumerFromJson(Map<String, dynamic> json) {
  return Consumer(
    consumerARN: json['ConsumerARN'] as String,
    consumerCreationTimestamp: unixFromJson(json['ConsumerCreationTimestamp']),
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
    consumerCreationTimestamp: unixFromJson(json['ConsumerCreationTimestamp']),
    consumerName: json['ConsumerName'] as String,
    consumerStatus:
        _$enumDecodeNullable(_$ConsumerStatusEnumMap, json['ConsumerStatus']),
    streamARN: json['StreamARN'] as String,
  );
}

DescribeLimitsOutput _$DescribeLimitsOutputFromJson(Map<String, dynamic> json) {
  return DescribeLimitsOutput(
    openShardCount: json['OpenShardCount'] as int,
    shardLimit: json['ShardLimit'] as int,
  );
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

DescribeStreamOutput _$DescribeStreamOutputFromJson(Map<String, dynamic> json) {
  return DescribeStreamOutput(
    streamDescription: json['StreamDescription'] == null
        ? null
        : StreamDescription.fromJson(
            json['StreamDescription'] as Map<String, dynamic>),
  );
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

ListShardsOutput _$ListShardsOutputFromJson(Map<String, dynamic> json) {
  return ListShardsOutput(
    nextToken: json['NextToken'] as String,
    shards: (json['Shards'] as List)
        ?.map(
            (e) => e == null ? null : Shard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

ListStreamsOutput _$ListStreamsOutputFromJson(Map<String, dynamic> json) {
  return ListStreamsOutput(
    hasMoreStreams: json['HasMoreStreams'] as bool,
    streamNames:
        (json['StreamNames'] as List)?.map((e) => e as String)?.toList(),
  );
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

ProvisionedThroughputExceededException
    _$ProvisionedThroughputExceededExceptionFromJson(
        Map<String, dynamic> json) {
  return ProvisionedThroughputExceededException(
    message: json['message'] as String,
  );
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
        unixFromJson(json['ApproximateArrivalTimestamp']),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
  );
}

RegisterStreamConsumerOutput _$RegisterStreamConsumerOutputFromJson(
    Map<String, dynamic> json) {
  return RegisterStreamConsumerOutput(
    consumer: json['Consumer'] == null
        ? null
        : Consumer.fromJson(json['Consumer'] as Map<String, dynamic>),
  );
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
    streamCreationTimestamp: unixFromJson(json['StreamCreationTimestamp']),
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
    streamCreationTimestamp: unixFromJson(json['StreamCreationTimestamp']),
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

UpdateShardCountOutput _$UpdateShardCountOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateShardCountOutput(
    currentShardCount: json['CurrentShardCount'] as int,
    streamName: json['StreamName'] as String,
    targetShardCount: json['TargetShardCount'] as int,
  );
}
