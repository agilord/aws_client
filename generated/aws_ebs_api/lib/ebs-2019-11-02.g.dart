// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebs-2019-11-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) {
  return Block(
    blockIndex: json['BlockIndex'] as int?,
    blockToken: json['BlockToken'] as String?,
  );
}

ChangedBlock _$ChangedBlockFromJson(Map<String, dynamic> json) {
  return ChangedBlock(
    blockIndex: json['BlockIndex'] as int?,
    firstBlockToken: json['FirstBlockToken'] as String?,
    secondBlockToken: json['SecondBlockToken'] as String?,
  );
}

CompleteSnapshotResponse _$CompleteSnapshotResponseFromJson(
    Map<String, dynamic> json) {
  return CompleteSnapshotResponse(
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
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

const _$StatusEnumMap = {
  Status.completed: 'completed',
  Status.pending: 'pending',
  Status.error: 'error',
};

GetSnapshotBlockResponse _$GetSnapshotBlockResponseFromJson(
    Map<String, dynamic> json) {
  return GetSnapshotBlockResponse(
    blockData: const Uint8ListNullableConverter()
        .fromJson(json['BlockData'] as String?),
    checksum: json['x-amz-Checksum'] as String?,
    checksumAlgorithm: _$enumDecodeNullable(
        _$ChecksumAlgorithmEnumMap, json['x-amz-Checksum-Algorithm']),
    dataLength: json['x-amz-Data-Length'] as int?,
  );
}

const _$ChecksumAlgorithmEnumMap = {
  ChecksumAlgorithm.sha256: 'SHA256',
};

ListChangedBlocksResponse _$ListChangedBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListChangedBlocksResponse(
    blockSize: json['BlockSize'] as int?,
    changedBlocks: (json['ChangedBlocks'] as List<dynamic>?)
        ?.map((e) => ChangedBlock.fromJson(e as Map<String, dynamic>))
        .toList(),
    expiryTime: const UnixDateTimeConverter().fromJson(json['ExpiryTime']),
    nextToken: json['NextToken'] as String?,
    volumeSize: json['VolumeSize'] as int?,
  );
}

ListSnapshotBlocksResponse _$ListSnapshotBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListSnapshotBlocksResponse(
    blockSize: json['BlockSize'] as int?,
    blocks: (json['Blocks'] as List<dynamic>?)
        ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
        .toList(),
    expiryTime: const UnixDateTimeConverter().fromJson(json['ExpiryTime']),
    nextToken: json['NextToken'] as String?,
    volumeSize: json['VolumeSize'] as int?,
  );
}

PutSnapshotBlockResponse _$PutSnapshotBlockResponseFromJson(
    Map<String, dynamic> json) {
  return PutSnapshotBlockResponse(
    checksum: json['x-amz-Checksum'] as String?,
    checksumAlgorithm: _$enumDecodeNullable(
        _$ChecksumAlgorithmEnumMap, json['x-amz-Checksum-Algorithm']),
  );
}

StartSnapshotResponse _$StartSnapshotResponseFromJson(
    Map<String, dynamic> json) {
  return StartSnapshotResponse(
    blockSize: json['BlockSize'] as int?,
    description: json['Description'] as String?,
    kmsKeyArn: json['KmsKeyArn'] as String?,
    ownerId: json['OwnerId'] as String?,
    parentSnapshotId: json['ParentSnapshotId'] as String?,
    snapshotId: json['SnapshotId'] as String?,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    volumeSize: json['VolumeSize'] as int?,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}
