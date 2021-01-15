// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-08-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    b: const Uint8ListConverter().fromJson(json['B'] as String),
    boolValue: json['BOOL'] as bool,
    bs: const Uint8ListListConverter().fromJson(json['BS'] as List),
    l: (json['L'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    m: (json['M'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    n: json['N'] as String,
    ns: (json['NS'] as List)?.map((e) => e as String)?.toList(),
    nullValue: json['NULL'] as bool,
    s: json['S'] as String,
    ss: (json['SS'] as List)?.map((e) => e as String)?.toList(),
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

GetRecordsOutput _$GetRecordsOutputFromJson(Map<String, dynamic> json) {
  return GetRecordsOutput(
    nextShardIterator: json['NextShardIterator'] as String,
    records: (json['Records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetShardIteratorOutput _$GetShardIteratorOutputFromJson(
    Map<String, dynamic> json) {
  return GetShardIteratorOutput(
    shardIterator: json['ShardIterator'] as String,
  );
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    principalId: json['PrincipalId'] as String,
    type: json['Type'] as String,
  );
}

KeySchemaElement _$KeySchemaElementFromJson(Map<String, dynamic> json) {
  return KeySchemaElement(
    attributeName: json['AttributeName'] as String,
    keyType: _$enumDecodeNullable(_$KeyTypeEnumMap, json['KeyType']),
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

const _$KeyTypeEnumMap = {
  KeyType.hash: 'HASH',
  KeyType.range: 'RANGE',
};

ListStreamsOutput _$ListStreamsOutputFromJson(Map<String, dynamic> json) {
  return ListStreamsOutput(
    lastEvaluatedStreamArn: json['LastEvaluatedStreamArn'] as String,
    streams: (json['Streams'] as List)
        ?.map((e) =>
            e == null ? null : Stream.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    awsRegion: json['awsRegion'] as String,
    dynamodb: json['dynamodb'] == null
        ? null
        : StreamRecord.fromJson(json['dynamodb'] as Map<String, dynamic>),
    eventID: json['eventID'] as String,
    eventName: _$enumDecodeNullable(_$OperationTypeEnumMap, json['eventName']),
    eventSource: json['eventSource'] as String,
    eventVersion: json['eventVersion'] as String,
    userIdentity: json['userIdentity'] == null
        ? null
        : Identity.fromJson(json['userIdentity'] as Map<String, dynamic>),
  );
}

const _$OperationTypeEnumMap = {
  OperationType.insert: 'INSERT',
  OperationType.modify: 'MODIFY',
  OperationType.remove: 'REMOVE',
};

SequenceNumberRange _$SequenceNumberRangeFromJson(Map<String, dynamic> json) {
  return SequenceNumberRange(
    endingSequenceNumber: json['EndingSequenceNumber'] as String,
    startingSequenceNumber: json['StartingSequenceNumber'] as String,
  );
}

Shard _$ShardFromJson(Map<String, dynamic> json) {
  return Shard(
    parentShardId: json['ParentShardId'] as String,
    sequenceNumberRange: json['SequenceNumberRange'] == null
        ? null
        : SequenceNumberRange.fromJson(
            json['SequenceNumberRange'] as Map<String, dynamic>),
    shardId: json['ShardId'] as String,
  );
}

Stream _$StreamFromJson(Map<String, dynamic> json) {
  return Stream(
    streamArn: json['StreamArn'] as String,
    streamLabel: json['StreamLabel'] as String,
    tableName: json['TableName'] as String,
  );
}

StreamDescription _$StreamDescriptionFromJson(Map<String, dynamic> json) {
  return StreamDescription(
    creationRequestDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationRequestDateTime']),
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastEvaluatedShardId: json['LastEvaluatedShardId'] as String,
    shards: (json['Shards'] as List)
        ?.map(
            (e) => e == null ? null : Shard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    streamArn: json['StreamArn'] as String,
    streamLabel: json['StreamLabel'] as String,
    streamStatus:
        _$enumDecodeNullable(_$StreamStatusEnumMap, json['StreamStatus']),
    streamViewType:
        _$enumDecodeNullable(_$StreamViewTypeEnumMap, json['StreamViewType']),
    tableName: json['TableName'] as String,
  );
}

const _$StreamStatusEnumMap = {
  StreamStatus.enabling: 'ENABLING',
  StreamStatus.enabled: 'ENABLED',
  StreamStatus.disabling: 'DISABLING',
  StreamStatus.disabled: 'DISABLED',
};

const _$StreamViewTypeEnumMap = {
  StreamViewType.newImage: 'NEW_IMAGE',
  StreamViewType.oldImage: 'OLD_IMAGE',
  StreamViewType.newAndOldImages: 'NEW_AND_OLD_IMAGES',
  StreamViewType.keysOnly: 'KEYS_ONLY',
};

StreamRecord _$StreamRecordFromJson(Map<String, dynamic> json) {
  return StreamRecord(
    approximateCreationDateTime: const UnixDateTimeConverter()
        .fromJson(json['ApproximateCreationDateTime']),
    keys: (json['Keys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    newImage: (json['NewImage'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    oldImage: (json['OldImage'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    sequenceNumber: json['SequenceNumber'] as String,
    sizeBytes: json['SizeBytes'] as int,
    streamViewType:
        _$enumDecodeNullable(_$StreamViewTypeEnumMap, json['StreamViewType']),
  );
}
