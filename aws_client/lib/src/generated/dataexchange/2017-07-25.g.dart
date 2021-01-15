// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetDestinationEntry _$AssetDestinationEntryFromJson(
    Map<String, dynamic> json) {
  return AssetDestinationEntry(
    assetId: json['AssetId'] as String,
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$AssetDestinationEntryToJson(
    AssetDestinationEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssetId', instance.assetId);
  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  return val;
}

AssetDetails _$AssetDetailsFromJson(Map<String, dynamic> json) {
  return AssetDetails(
    s3SnapshotAsset: json['S3SnapshotAsset'] == null
        ? null
        : S3SnapshotAsset.fromJson(
            json['S3SnapshotAsset'] as Map<String, dynamic>),
  );
}

AssetEntry _$AssetEntryFromJson(Map<String, dynamic> json) {
  return AssetEntry(
    arn: json['Arn'] as String,
    assetDetails: json['AssetDetails'] == null
        ? null
        : AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>),
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    revisionId: json['RevisionId'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
    sourceId: json['SourceId'] as String,
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

const _$AssetTypeEnumMap = {
  AssetType.s3Snapshot: 'S3_SNAPSHOT',
};

AssetSourceEntry _$AssetSourceEntryFromJson(Map<String, dynamic> json) {
  return AssetSourceEntry(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$AssetSourceEntryToJson(AssetSourceEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  return val;
}

CreateDataSetResponse _$CreateDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDataSetResponse(
    arn: json['Arn'] as String,
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    origin: _$enumDecodeNullable(_$OriginEnumMap, json['Origin']),
    originDetails: json['OriginDetails'] == null
        ? null
        : OriginDetails.fromJson(json['OriginDetails'] as Map<String, dynamic>),
    sourceId: json['SourceId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

const _$OriginEnumMap = {
  Origin.owned: 'OWNED',
  Origin.entitled: 'ENTITLED',
};

CreateJobResponse _$CreateJobResponseFromJson(Map<String, dynamic> json) {
  return CreateJobResponse(
    arn: json['Arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    details: json['Details'] == null
        ? null
        : ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>),
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : JobError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

const _$StateEnumMap = {
  State.waiting: 'WAITING',
  State.inProgress: 'IN_PROGRESS',
  State.error: 'ERROR',
  State.completed: 'COMPLETED',
  State.cancelled: 'CANCELLED',
  State.timedOut: 'TIMED_OUT',
};

const _$TypeEnumMap = {
  Type.importAssetsFromS3: 'IMPORT_ASSETS_FROM_S3',
  Type.importAssetFromSignedUrl: 'IMPORT_ASSET_FROM_SIGNED_URL',
  Type.exportAssetsToS3: 'EXPORT_ASSETS_TO_S3',
  Type.exportAssetToSignedUrl: 'EXPORT_ASSET_TO_SIGNED_URL',
};

CreateRevisionResponse _$CreateRevisionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRevisionResponse(
    arn: json['Arn'] as String,
    comment: json['Comment'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    finalized: json['Finalized'] as bool,
    id: json['Id'] as String,
    sourceId: json['SourceId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

DataSetEntry _$DataSetEntryFromJson(Map<String, dynamic> json) {
  return DataSetEntry(
    arn: json['Arn'] as String,
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    origin: _$enumDecodeNullable(_$OriginEnumMap, json['Origin']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
    originDetails: json['OriginDetails'] == null
        ? null
        : OriginDetails.fromJson(json['OriginDetails'] as Map<String, dynamic>),
    sourceId: json['SourceId'] as String,
  );
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details(
    importAssetFromSignedUrlJobErrorDetails:
        json['ImportAssetFromSignedUrlJobErrorDetails'] == null
            ? null
            : ImportAssetFromSignedUrlJobErrorDetails.fromJson(
                json['ImportAssetFromSignedUrlJobErrorDetails']
                    as Map<String, dynamic>),
    importAssetsFromS3JobErrorDetails:
        (json['ImportAssetsFromS3JobErrorDetails'] as List)
            ?.map((e) => e == null
                ? null
                : AssetSourceEntry.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$ExportAssetToSignedUrlRequestDetailsToJson(
    ExportAssetToSignedUrlRequestDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssetId', instance.assetId);
  writeNotNull('DataSetId', instance.dataSetId);
  writeNotNull('RevisionId', instance.revisionId);
  return val;
}

ExportAssetToSignedUrlResponseDetails
    _$ExportAssetToSignedUrlResponseDetailsFromJson(Map<String, dynamic> json) {
  return ExportAssetToSignedUrlResponseDetails(
    assetId: json['AssetId'] as String,
    dataSetId: json['DataSetId'] as String,
    revisionId: json['RevisionId'] as String,
    signedUrl: json['SignedUrl'] as String,
    signedUrlExpiresAt:
        const IsoDateTimeConverter().fromJson(json['SignedUrlExpiresAt']),
  );
}

Map<String, dynamic> _$ExportAssetsToS3RequestDetailsToJson(
    ExportAssetsToS3RequestDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssetDestinations',
      instance.assetDestinations?.map((e) => e?.toJson())?.toList());
  writeNotNull('DataSetId', instance.dataSetId);
  writeNotNull('RevisionId', instance.revisionId);
  writeNotNull('Encryption', instance.encryption?.toJson());
  return val;
}

ExportAssetsToS3ResponseDetails _$ExportAssetsToS3ResponseDetailsFromJson(
    Map<String, dynamic> json) {
  return ExportAssetsToS3ResponseDetails(
    assetDestinations: (json['AssetDestinations'] as List)
        ?.map((e) => e == null
            ? null
            : AssetDestinationEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataSetId: json['DataSetId'] as String,
    revisionId: json['RevisionId'] as String,
    encryption: json['Encryption'] == null
        ? null
        : ExportServerSideEncryption.fromJson(
            json['Encryption'] as Map<String, dynamic>),
  );
}

ExportServerSideEncryption _$ExportServerSideEncryptionFromJson(
    Map<String, dynamic> json) {
  return ExportServerSideEncryption(
    type:
        _$enumDecodeNullable(_$ServerSideEncryptionTypesEnumMap, json['Type']),
    kmsKeyArn: json['KmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$ExportServerSideEncryptionToJson(
    ExportServerSideEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ServerSideEncryptionTypesEnumMap[instance.type]);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$ServerSideEncryptionTypesEnumMap = {
  ServerSideEncryptionTypes.awsKms: 'aws:kms',
  ServerSideEncryptionTypes.aes256: 'AES256',
};

GetAssetResponse _$GetAssetResponseFromJson(Map<String, dynamic> json) {
  return GetAssetResponse(
    arn: json['Arn'] as String,
    assetDetails: json['AssetDetails'] == null
        ? null
        : AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>),
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    revisionId: json['RevisionId'] as String,
    sourceId: json['SourceId'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

GetDataSetResponse _$GetDataSetResponseFromJson(Map<String, dynamic> json) {
  return GetDataSetResponse(
    arn: json['Arn'] as String,
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    origin: _$enumDecodeNullable(_$OriginEnumMap, json['Origin']),
    originDetails: json['OriginDetails'] == null
        ? null
        : OriginDetails.fromJson(json['OriginDetails'] as Map<String, dynamic>),
    sourceId: json['SourceId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

GetJobResponse _$GetJobResponseFromJson(Map<String, dynamic> json) {
  return GetJobResponse(
    arn: json['Arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    details: json['Details'] == null
        ? null
        : ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>),
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : JobError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

GetRevisionResponse _$GetRevisionResponseFromJson(Map<String, dynamic> json) {
  return GetRevisionResponse(
    arn: json['Arn'] as String,
    comment: json['Comment'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    finalized: json['Finalized'] as bool,
    id: json['Id'] as String,
    sourceId: json['SourceId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

ImportAssetFromSignedUrlJobErrorDetails
    _$ImportAssetFromSignedUrlJobErrorDetailsFromJson(
        Map<String, dynamic> json) {
  return ImportAssetFromSignedUrlJobErrorDetails(
    assetName: json['AssetName'] as String,
  );
}

Map<String, dynamic> _$ImportAssetFromSignedUrlRequestDetailsToJson(
    ImportAssetFromSignedUrlRequestDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssetName', instance.assetName);
  writeNotNull('DataSetId', instance.dataSetId);
  writeNotNull('Md5Hash', instance.md5Hash);
  writeNotNull('RevisionId', instance.revisionId);
  return val;
}

ImportAssetFromSignedUrlResponseDetails
    _$ImportAssetFromSignedUrlResponseDetailsFromJson(
        Map<String, dynamic> json) {
  return ImportAssetFromSignedUrlResponseDetails(
    assetName: json['AssetName'] as String,
    dataSetId: json['DataSetId'] as String,
    revisionId: json['RevisionId'] as String,
    md5Hash: json['Md5Hash'] as String,
    signedUrl: json['SignedUrl'] as String,
    signedUrlExpiresAt:
        const IsoDateTimeConverter().fromJson(json['SignedUrlExpiresAt']),
  );
}

Map<String, dynamic> _$ImportAssetsFromS3RequestDetailsToJson(
    ImportAssetsFromS3RequestDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AssetSources', instance.assetSources?.map((e) => e?.toJson())?.toList());
  writeNotNull('DataSetId', instance.dataSetId);
  writeNotNull('RevisionId', instance.revisionId);
  return val;
}

ImportAssetsFromS3ResponseDetails _$ImportAssetsFromS3ResponseDetailsFromJson(
    Map<String, dynamic> json) {
  return ImportAssetsFromS3ResponseDetails(
    assetSources: (json['AssetSources'] as List)
        ?.map((e) => e == null
            ? null
            : AssetSourceEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataSetId: json['DataSetId'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

JobEntry _$JobEntryFromJson(Map<String, dynamic> json) {
  return JobEntry(
    arn: json['Arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    details: json['Details'] == null
        ? null
        : ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>),
    id: json['Id'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : JobError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

JobError _$JobErrorFromJson(Map<String, dynamic> json) {
  return JobError(
    code: _$enumDecodeNullable(_$CodeEnumMap, json['Code']),
    message: json['Message'] as String,
    details: json['Details'] == null
        ? null
        : Details.fromJson(json['Details'] as Map<String, dynamic>),
    limitName:
        _$enumDecodeNullable(_$JobErrorLimitNameEnumMap, json['LimitName']),
    limitValue: (json['LimitValue'] as num)?.toDouble(),
    resourceId: json['ResourceId'] as String,
    resourceType: _$enumDecodeNullable(
        _$JobErrorResourceTypesEnumMap, json['ResourceType']),
  );
}

const _$CodeEnumMap = {
  Code.accessDeniedException: 'ACCESS_DENIED_EXCEPTION',
  Code.internalServerException: 'INTERNAL_SERVER_EXCEPTION',
  Code.malwareDetected: 'MALWARE_DETECTED',
  Code.resourceNotFoundException: 'RESOURCE_NOT_FOUND_EXCEPTION',
  Code.serviceQuotaExceededException: 'SERVICE_QUOTA_EXCEEDED_EXCEPTION',
  Code.validationException: 'VALIDATION_EXCEPTION',
  Code.malwareScanEncryptedFile: 'MALWARE_SCAN_ENCRYPTED_FILE',
};

const _$JobErrorLimitNameEnumMap = {
  JobErrorLimitName.assetsPerRevision: 'Assets per revision',
  JobErrorLimitName.assetSizeInGb: 'Asset size in GB',
};

const _$JobErrorResourceTypesEnumMap = {
  JobErrorResourceTypes.revision: 'REVISION',
  JobErrorResourceTypes.asset: 'ASSET',
};

ListDataSetRevisionsResponse _$ListDataSetRevisionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataSetRevisionsResponse(
    nextToken: json['NextToken'] as String,
    revisions: (json['Revisions'] as List)
        ?.map((e) => e == null
            ? null
            : RevisionEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDataSetsResponse _$ListDataSetsResponseFromJson(Map<String, dynamic> json) {
  return ListDataSetsResponse(
    dataSets: (json['DataSets'] as List)
        ?.map((e) =>
            e == null ? null : DataSetEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) =>
            e == null ? null : JobEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRevisionAssetsResponse _$ListRevisionAssetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRevisionAssetsResponse(
    assets: (json['Assets'] as List)
        ?.map((e) =>
            e == null ? null : AssetEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
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

OriginDetails _$OriginDetailsFromJson(Map<String, dynamic> json) {
  return OriginDetails(
    productId: json['ProductId'] as String,
  );
}

Map<String, dynamic> _$RequestDetailsToJson(RequestDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ExportAssetToSignedUrl', instance.exportAssetToSignedUrl?.toJson());
  writeNotNull('ExportAssetsToS3', instance.exportAssetsToS3?.toJson());
  writeNotNull(
      'ImportAssetFromSignedUrl', instance.importAssetFromSignedUrl?.toJson());
  writeNotNull('ImportAssetsFromS3', instance.importAssetsFromS3?.toJson());
  return val;
}

ResponseDetails _$ResponseDetailsFromJson(Map<String, dynamic> json) {
  return ResponseDetails(
    exportAssetToSignedUrl: json['ExportAssetToSignedUrl'] == null
        ? null
        : ExportAssetToSignedUrlResponseDetails.fromJson(
            json['ExportAssetToSignedUrl'] as Map<String, dynamic>),
    exportAssetsToS3: json['ExportAssetsToS3'] == null
        ? null
        : ExportAssetsToS3ResponseDetails.fromJson(
            json['ExportAssetsToS3'] as Map<String, dynamic>),
    importAssetFromSignedUrl: json['ImportAssetFromSignedUrl'] == null
        ? null
        : ImportAssetFromSignedUrlResponseDetails.fromJson(
            json['ImportAssetFromSignedUrl'] as Map<String, dynamic>),
    importAssetsFromS3: json['ImportAssetsFromS3'] == null
        ? null
        : ImportAssetsFromS3ResponseDetails.fromJson(
            json['ImportAssetsFromS3'] as Map<String, dynamic>),
  );
}

RevisionEntry _$RevisionEntryFromJson(Map<String, dynamic> json) {
  return RevisionEntry(
    arn: json['Arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    id: json['Id'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
    comment: json['Comment'] as String,
    finalized: json['Finalized'] as bool,
    sourceId: json['SourceId'] as String,
  );
}

S3SnapshotAsset _$S3SnapshotAssetFromJson(Map<String, dynamic> json) {
  return S3SnapshotAsset(
    size: (json['Size'] as num)?.toDouble(),
  );
}

StartJobResponse _$StartJobResponseFromJson(Map<String, dynamic> json) {
  return StartJobResponse();
}

UpdateAssetResponse _$UpdateAssetResponseFromJson(Map<String, dynamic> json) {
  return UpdateAssetResponse(
    arn: json['Arn'] as String,
    assetDetails: json['AssetDetails'] == null
        ? null
        : AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>),
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    revisionId: json['RevisionId'] as String,
    sourceId: json['SourceId'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

UpdateDataSetResponse _$UpdateDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSetResponse(
    arn: json['Arn'] as String,
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['AssetType']),
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    origin: _$enumDecodeNullable(_$OriginEnumMap, json['Origin']),
    originDetails: json['OriginDetails'] == null
        ? null
        : OriginDetails.fromJson(json['OriginDetails'] as Map<String, dynamic>),
    sourceId: json['SourceId'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

UpdateRevisionResponse _$UpdateRevisionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRevisionResponse(
    arn: json['Arn'] as String,
    comment: json['Comment'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['CreatedAt']),
    dataSetId: json['DataSetId'] as String,
    finalized: json['Finalized'] as bool,
    id: json['Id'] as String,
    sourceId: json['SourceId'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}
