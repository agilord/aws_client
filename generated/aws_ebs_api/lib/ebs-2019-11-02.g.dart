// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebs-2019-11-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) {
  return Block(
    blockIndex: json['BlockIndex'] as int,
    blockToken: json['BlockToken'] as String,
  );
}

ChangedBlock _$ChangedBlockFromJson(Map<String, dynamic> json) {
  return ChangedBlock(
    blockIndex: json['BlockIndex'] as int,
    firstBlockToken: json['FirstBlockToken'] as String,
    secondBlockToken: json['SecondBlockToken'] as String,
  );
}

GetSnapshotBlockResponse _$GetSnapshotBlockResponseFromJson(
    Map<String, dynamic> json) {
  return GetSnapshotBlockResponse(
    blockData: const Uint8ListConverter().fromJson(json['BlockData'] as String),
    checksum: json['x-amz-Checksum'] as String,
    checksumAlgorithm: _$enumDecodeNullable(
        _$ChecksumAlgorithmEnumMap, json['x-amz-Checksum-Algorithm']),
    dataLength: json['x-amz-Data-Length'] as int,
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

const _$ChecksumAlgorithmEnumMap = {
  ChecksumAlgorithm.sha256: 'SHA256',
};

ListChangedBlocksResponse _$ListChangedBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListChangedBlocksResponse(
    blockSize: json['BlockSize'] as int,
    changedBlocks: (json['ChangedBlocks'] as List)
        ?.map((e) =>
            e == null ? null : ChangedBlock.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    expiryTime: unixTimestampFromJson(json['ExpiryTime']),
    nextToken: json['NextToken'] as String,
    volumeSize: json['VolumeSize'] as int,
  );
}

ListSnapshotBlocksResponse _$ListSnapshotBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListSnapshotBlocksResponse(
    blockSize: json['BlockSize'] as int,
    blocks: (json['Blocks'] as List)
        ?.map(
            (e) => e == null ? null : Block.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    expiryTime: unixTimestampFromJson(json['ExpiryTime']),
    nextToken: json['NextToken'] as String,
    volumeSize: json['VolumeSize'] as int,
  );
}
