// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-01-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelJournalKinesisStreamResponse _$CancelJournalKinesisStreamResponseFromJson(
    Map<String, dynamic> json) {
  return CancelJournalKinesisStreamResponse(
    streamId: json['StreamId'] as String,
  );
}

CreateLedgerResponse _$CreateLedgerResponseFromJson(Map<String, dynamic> json) {
  return CreateLedgerResponse(
    arn: json['Arn'] as String,
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    deletionProtection: json['DeletionProtection'] as bool,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$LedgerStateEnumMap, json['State']),
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

const _$LedgerStateEnumMap = {
  LedgerState.creating: 'CREATING',
  LedgerState.active: 'ACTIVE',
  LedgerState.deleting: 'DELETING',
  LedgerState.deleted: 'DELETED',
};

DescribeJournalKinesisStreamResponse
    _$DescribeJournalKinesisStreamResponseFromJson(Map<String, dynamic> json) {
  return DescribeJournalKinesisStreamResponse(
    stream: json['Stream'] == null
        ? null
        : JournalKinesisStreamDescription.fromJson(
            json['Stream'] as Map<String, dynamic>),
  );
}

DescribeJournalS3ExportResponse _$DescribeJournalS3ExportResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJournalS3ExportResponse(
    exportDescription: json['ExportDescription'] == null
        ? null
        : JournalS3ExportDescription.fromJson(
            json['ExportDescription'] as Map<String, dynamic>),
  );
}

DescribeLedgerResponse _$DescribeLedgerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLedgerResponse(
    arn: json['Arn'] as String,
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    deletionProtection: json['DeletionProtection'] as bool,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$LedgerStateEnumMap, json['State']),
  );
}

ExportJournalToS3Response _$ExportJournalToS3ResponseFromJson(
    Map<String, dynamic> json) {
  return ExportJournalToS3Response(
    exportId: json['ExportId'] as String,
  );
}

GetBlockResponse _$GetBlockResponseFromJson(Map<String, dynamic> json) {
  return GetBlockResponse(
    block: json['Block'] == null
        ? null
        : ValueHolder.fromJson(json['Block'] as Map<String, dynamic>),
    proof: json['Proof'] == null
        ? null
        : ValueHolder.fromJson(json['Proof'] as Map<String, dynamic>),
  );
}

GetDigestResponse _$GetDigestResponseFromJson(Map<String, dynamic> json) {
  return GetDigestResponse(
    digest: const Uint8ListConverter().fromJson(json['Digest'] as String),
    digestTipAddress: json['DigestTipAddress'] == null
        ? null
        : ValueHolder.fromJson(
            json['DigestTipAddress'] as Map<String, dynamic>),
  );
}

GetRevisionResponse _$GetRevisionResponseFromJson(Map<String, dynamic> json) {
  return GetRevisionResponse(
    revision: json['Revision'] == null
        ? null
        : ValueHolder.fromJson(json['Revision'] as Map<String, dynamic>),
    proof: json['Proof'] == null
        ? null
        : ValueHolder.fromJson(json['Proof'] as Map<String, dynamic>),
  );
}

JournalKinesisStreamDescription _$JournalKinesisStreamDescriptionFromJson(
    Map<String, dynamic> json) {
  return JournalKinesisStreamDescription(
    kinesisConfiguration: json['KinesisConfiguration'] == null
        ? null
        : KinesisConfiguration.fromJson(
            json['KinesisConfiguration'] as Map<String, dynamic>),
    ledgerName: json['LedgerName'] as String,
    roleArn: json['RoleArn'] as String,
    status: _$enumDecodeNullable(_$StreamStatusEnumMap, json['Status']),
    streamId: json['StreamId'] as String,
    streamName: json['StreamName'] as String,
    arn: json['Arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    errorCause: _$enumDecodeNullable(_$ErrorCauseEnumMap, json['ErrorCause']),
    exclusiveEndTime:
        const UnixDateTimeConverter().fromJson(json['ExclusiveEndTime']),
    inclusiveStartTime:
        const UnixDateTimeConverter().fromJson(json['InclusiveStartTime']),
  );
}

const _$StreamStatusEnumMap = {
  StreamStatus.active: 'ACTIVE',
  StreamStatus.completed: 'COMPLETED',
  StreamStatus.canceled: 'CANCELED',
  StreamStatus.failed: 'FAILED',
  StreamStatus.impaired: 'IMPAIRED',
};

const _$ErrorCauseEnumMap = {
  ErrorCause.kinesisStreamNotFound: 'KINESIS_STREAM_NOT_FOUND',
  ErrorCause.iamPermissionRevoked: 'IAM_PERMISSION_REVOKED',
};

JournalS3ExportDescription _$JournalS3ExportDescriptionFromJson(
    Map<String, dynamic> json) {
  return JournalS3ExportDescription(
    exclusiveEndTime:
        const UnixDateTimeConverter().fromJson(json['ExclusiveEndTime']),
    exportCreationTime:
        const UnixDateTimeConverter().fromJson(json['ExportCreationTime']),
    exportId: json['ExportId'] as String,
    inclusiveStartTime:
        const UnixDateTimeConverter().fromJson(json['InclusiveStartTime']),
    ledgerName: json['LedgerName'] as String,
    roleArn: json['RoleArn'] as String,
    s3ExportConfiguration: json['S3ExportConfiguration'] == null
        ? null
        : S3ExportConfiguration.fromJson(
            json['S3ExportConfiguration'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ExportStatusEnumMap, json['Status']),
  );
}

const _$ExportStatusEnumMap = {
  ExportStatus.inProgress: 'IN_PROGRESS',
  ExportStatus.completed: 'COMPLETED',
  ExportStatus.cancelled: 'CANCELLED',
};

KinesisConfiguration _$KinesisConfigurationFromJson(Map<String, dynamic> json) {
  return KinesisConfiguration(
    streamArn: json['StreamArn'] as String,
    aggregationEnabled: json['AggregationEnabled'] as bool,
  );
}

Map<String, dynamic> _$KinesisConfigurationToJson(
    KinesisConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamArn', instance.streamArn);
  writeNotNull('AggregationEnabled', instance.aggregationEnabled);
  return val;
}

LedgerSummary _$LedgerSummaryFromJson(Map<String, dynamic> json) {
  return LedgerSummary(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$LedgerStateEnumMap, json['State']),
  );
}

ListJournalKinesisStreamsForLedgerResponse
    _$ListJournalKinesisStreamsForLedgerResponseFromJson(
        Map<String, dynamic> json) {
  return ListJournalKinesisStreamsForLedgerResponse(
    nextToken: json['NextToken'] as String,
    streams: (json['Streams'] as List)
        ?.map((e) => e == null
            ? null
            : JournalKinesisStreamDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListJournalS3ExportsForLedgerResponse
    _$ListJournalS3ExportsForLedgerResponseFromJson(Map<String, dynamic> json) {
  return ListJournalS3ExportsForLedgerResponse(
    journalS3Exports: (json['JournalS3Exports'] as List)
        ?.map((e) => e == null
            ? null
            : JournalS3ExportDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJournalS3ExportsResponse _$ListJournalS3ExportsResponseFromJson(
    Map<String, dynamic> json) {
  return ListJournalS3ExportsResponse(
    journalS3Exports: (json['JournalS3Exports'] as List)
        ?.map((e) => e == null
            ? null
            : JournalS3ExportDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLedgersResponse _$ListLedgersResponseFromJson(Map<String, dynamic> json) {
  return ListLedgersResponse(
    ledgers: (json['Ledgers'] as List)
        ?.map((e) => e == null
            ? null
            : LedgerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

S3EncryptionConfiguration _$S3EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return S3EncryptionConfiguration(
    objectEncryptionType: _$enumDecodeNullable(
        _$S3ObjectEncryptionTypeEnumMap, json['ObjectEncryptionType']),
    kmsKeyArn: json['KmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$S3EncryptionConfigurationToJson(
    S3EncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectEncryptionType',
      _$S3ObjectEncryptionTypeEnumMap[instance.objectEncryptionType]);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$S3ObjectEncryptionTypeEnumMap = {
  S3ObjectEncryptionType.sseKms: 'SSE_KMS',
  S3ObjectEncryptionType.sseS3: 'SSE_S3',
  S3ObjectEncryptionType.noEncryption: 'NO_ENCRYPTION',
};

S3ExportConfiguration _$S3ExportConfigurationFromJson(
    Map<String, dynamic> json) {
  return S3ExportConfiguration(
    bucket: json['Bucket'] as String,
    encryptionConfiguration: json['EncryptionConfiguration'] == null
        ? null
        : S3EncryptionConfiguration.fromJson(
            json['EncryptionConfiguration'] as Map<String, dynamic>),
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$S3ExportConfigurationToJson(
    S3ExportConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('Prefix', instance.prefix);
  return val;
}

StreamJournalToKinesisResponse _$StreamJournalToKinesisResponseFromJson(
    Map<String, dynamic> json) {
  return StreamJournalToKinesisResponse(
    streamId: json['StreamId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateLedgerResponse _$UpdateLedgerResponseFromJson(Map<String, dynamic> json) {
  return UpdateLedgerResponse(
    arn: json['Arn'] as String,
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    deletionProtection: json['DeletionProtection'] as bool,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$LedgerStateEnumMap, json['State']),
  );
}

ValueHolder _$ValueHolderFromJson(Map<String, dynamic> json) {
  return ValueHolder(
    ionText: json['IonText'] as String,
  );
}

Map<String, dynamic> _$ValueHolderToJson(ValueHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IonText', instance.ionText);
  return val;
}
