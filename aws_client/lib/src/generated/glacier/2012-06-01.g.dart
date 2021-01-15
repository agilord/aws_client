// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-06-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchiveCreationOutput _$ArchiveCreationOutputFromJson(
    Map<String, dynamic> json) {
  return ArchiveCreationOutput(
    archiveId: json['x-amz-archive-id'] as String,
    checksum: json['x-amz-sha256-tree-hash'] as String,
    location: json['Location'] as String,
  );
}

CSVInput _$CSVInputFromJson(Map<String, dynamic> json) {
  return CSVInput(
    comments: json['Comments'] as String,
    fieldDelimiter: json['FieldDelimiter'] as String,
    fileHeaderInfo:
        _$enumDecodeNullable(_$FileHeaderInfoEnumMap, json['FileHeaderInfo']),
    quoteCharacter: json['QuoteCharacter'] as String,
    quoteEscapeCharacter: json['QuoteEscapeCharacter'] as String,
    recordDelimiter: json['RecordDelimiter'] as String,
  );
}

Map<String, dynamic> _$CSVInputToJson(CSVInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comments', instance.comments);
  writeNotNull('FieldDelimiter', instance.fieldDelimiter);
  writeNotNull(
      'FileHeaderInfo', _$FileHeaderInfoEnumMap[instance.fileHeaderInfo]);
  writeNotNull('QuoteCharacter', instance.quoteCharacter);
  writeNotNull('QuoteEscapeCharacter', instance.quoteEscapeCharacter);
  writeNotNull('RecordDelimiter', instance.recordDelimiter);
  return val;
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

const _$FileHeaderInfoEnumMap = {
  FileHeaderInfo.use: 'USE',
  FileHeaderInfo.ignore: 'IGNORE',
  FileHeaderInfo.none: 'NONE',
};

CSVOutput _$CSVOutputFromJson(Map<String, dynamic> json) {
  return CSVOutput(
    fieldDelimiter: json['FieldDelimiter'] as String,
    quoteCharacter: json['QuoteCharacter'] as String,
    quoteEscapeCharacter: json['QuoteEscapeCharacter'] as String,
    quoteFields:
        _$enumDecodeNullable(_$QuoteFieldsEnumMap, json['QuoteFields']),
    recordDelimiter: json['RecordDelimiter'] as String,
  );
}

Map<String, dynamic> _$CSVOutputToJson(CSVOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldDelimiter', instance.fieldDelimiter);
  writeNotNull('QuoteCharacter', instance.quoteCharacter);
  writeNotNull('QuoteEscapeCharacter', instance.quoteEscapeCharacter);
  writeNotNull('QuoteFields', _$QuoteFieldsEnumMap[instance.quoteFields]);
  writeNotNull('RecordDelimiter', instance.recordDelimiter);
  return val;
}

const _$QuoteFieldsEnumMap = {
  QuoteFields.always: 'ALWAYS',
  QuoteFields.asneeded: 'ASNEEDED',
};

CreateVaultOutput _$CreateVaultOutputFromJson(Map<String, dynamic> json) {
  return CreateVaultOutput(
    location: json['Location'] as String,
  );
}

DataRetrievalPolicy _$DataRetrievalPolicyFromJson(Map<String, dynamic> json) {
  return DataRetrievalPolicy(
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : DataRetrievalRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataRetrievalPolicyToJson(DataRetrievalPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

DataRetrievalRule _$DataRetrievalRuleFromJson(Map<String, dynamic> json) {
  return DataRetrievalRule(
    bytesPerHour: json['BytesPerHour'] as int,
    strategy: json['Strategy'] as String,
  );
}

Map<String, dynamic> _$DataRetrievalRuleToJson(DataRetrievalRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BytesPerHour', instance.bytesPerHour);
  writeNotNull('Strategy', instance.strategy);
  return val;
}

DescribeVaultOutput _$DescribeVaultOutputFromJson(Map<String, dynamic> json) {
  return DescribeVaultOutput(
    creationDate: json['CreationDate'] as String,
    lastInventoryDate: json['LastInventoryDate'] as String,
    numberOfArchives: json['NumberOfArchives'] as int,
    sizeInBytes: json['SizeInBytes'] as int,
    vaultARN: json['VaultARN'] as String,
    vaultName: json['VaultName'] as String,
  );
}

Encryption _$EncryptionFromJson(Map<String, dynamic> json) {
  return Encryption(
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['EncryptionType']),
    kMSContext: json['KMSContext'] as String,
    kMSKeyId: json['KMSKeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionToJson(Encryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionType', _$EncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('KMSContext', instance.kMSContext);
  writeNotNull('KMSKeyId', instance.kMSKeyId);
  return val;
}

const _$EncryptionTypeEnumMap = {
  EncryptionType.awsKms: 'aws:kms',
  EncryptionType.aes256: 'AES256',
};

GetDataRetrievalPolicyOutput _$GetDataRetrievalPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetDataRetrievalPolicyOutput(
    policy: json['Policy'] == null
        ? null
        : DataRetrievalPolicy.fromJson(json['Policy'] as Map<String, dynamic>),
  );
}

GetJobOutputOutput _$GetJobOutputOutputFromJson(Map<String, dynamic> json) {
  return GetJobOutputOutput(
    acceptRanges: json['Accept-Ranges'] as String,
    archiveDescription: json['x-amz-archive-description'] as String,
    body: const Uint8ListConverter().fromJson(json['body'] as String),
    checksum: json['x-amz-sha256-tree-hash'] as String,
    contentRange: json['Content-Range'] as String,
    contentType: json['Content-Type'] as String,
    status: json['status'] as int,
  );
}

GetVaultAccessPolicyOutput _$GetVaultAccessPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetVaultAccessPolicyOutput(
    policy: json['policy'] == null
        ? null
        : VaultAccessPolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

GetVaultLockOutput _$GetVaultLockOutputFromJson(Map<String, dynamic> json) {
  return GetVaultLockOutput(
    creationDate: json['CreationDate'] as String,
    expirationDate: json['ExpirationDate'] as String,
    policy: json['Policy'] as String,
    state: json['State'] as String,
  );
}

GetVaultNotificationsOutput _$GetVaultNotificationsOutputFromJson(
    Map<String, dynamic> json) {
  return GetVaultNotificationsOutput(
    vaultNotificationConfig: json['vaultNotificationConfig'] == null
        ? null
        : VaultNotificationConfig.fromJson(
            json['vaultNotificationConfig'] as Map<String, dynamic>),
  );
}

GlacierJobDescription _$GlacierJobDescriptionFromJson(
    Map<String, dynamic> json) {
  return GlacierJobDescription(
    action: _$enumDecodeNullable(_$ActionCodeEnumMap, json['Action']),
    archiveId: json['ArchiveId'] as String,
    archiveSHA256TreeHash: json['ArchiveSHA256TreeHash'] as String,
    archiveSizeInBytes: json['ArchiveSizeInBytes'] as int,
    completed: json['Completed'] as bool,
    completionDate: json['CompletionDate'] as String,
    creationDate: json['CreationDate'] as String,
    inventoryRetrievalParameters: json['InventoryRetrievalParameters'] == null
        ? null
        : InventoryRetrievalJobDescription.fromJson(
            json['InventoryRetrievalParameters'] as Map<String, dynamic>),
    inventorySizeInBytes: json['InventorySizeInBytes'] as int,
    jobDescription: json['JobDescription'] as String,
    jobId: json['JobId'] as String,
    jobOutputPath: json['JobOutputPath'] as String,
    outputLocation: json['OutputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['OutputLocation'] as Map<String, dynamic>),
    retrievalByteRange: json['RetrievalByteRange'] as String,
    sHA256TreeHash: json['SHA256TreeHash'] as String,
    sNSTopic: json['SNSTopic'] as String,
    selectParameters: json['SelectParameters'] == null
        ? null
        : SelectParameters.fromJson(
            json['SelectParameters'] as Map<String, dynamic>),
    statusCode: _$enumDecodeNullable(_$StatusCodeEnumMap, json['StatusCode']),
    statusMessage: json['StatusMessage'] as String,
    tier: json['Tier'] as String,
    vaultARN: json['VaultARN'] as String,
  );
}

const _$ActionCodeEnumMap = {
  ActionCode.archiveRetrieval: 'ArchiveRetrieval',
  ActionCode.inventoryRetrieval: 'InventoryRetrieval',
  ActionCode.select: 'Select',
};

const _$StatusCodeEnumMap = {
  StatusCode.inProgress: 'InProgress',
  StatusCode.succeeded: 'Succeeded',
  StatusCode.failed: 'Failed',
};

Grant _$GrantFromJson(Map<String, dynamic> json) {
  return Grant(
    grantee: json['Grantee'] == null
        ? null
        : Grantee.fromJson(json['Grantee'] as Map<String, dynamic>),
    permission: _$enumDecodeNullable(_$PermissionEnumMap, json['Permission']),
  );
}

Map<String, dynamic> _$GrantToJson(Grant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Grantee', instance.grantee?.toJson());
  writeNotNull('Permission', _$PermissionEnumMap[instance.permission]);
  return val;
}

const _$PermissionEnumMap = {
  Permission.fullControl: 'FULL_CONTROL',
  Permission.write: 'WRITE',
  Permission.writeAcp: 'WRITE_ACP',
  Permission.read: 'READ',
  Permission.readAcp: 'READ_ACP',
};

Grantee _$GranteeFromJson(Map<String, dynamic> json) {
  return Grantee(
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
    displayName: json['DisplayName'] as String,
    emailAddress: json['EmailAddress'] as String,
    id: json['ID'] as String,
    uri: json['URI'] as String,
  );
}

Map<String, dynamic> _$GranteeToJson(Grantee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$TypeEnumMap[instance.type]);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('EmailAddress', instance.emailAddress);
  writeNotNull('ID', instance.id);
  writeNotNull('URI', instance.uri);
  return val;
}

const _$TypeEnumMap = {
  Type.amazonCustomerByEmail: 'AmazonCustomerByEmail',
  Type.canonicalUser: 'CanonicalUser',
  Type.group: 'Group',
};

InitiateJobOutput _$InitiateJobOutputFromJson(Map<String, dynamic> json) {
  return InitiateJobOutput(
    jobId: json['x-amz-job-id'] as String,
    jobOutputPath: json['x-amz-job-output-path'] as String,
    location: json['Location'] as String,
  );
}

InitiateMultipartUploadOutput _$InitiateMultipartUploadOutputFromJson(
    Map<String, dynamic> json) {
  return InitiateMultipartUploadOutput(
    location: json['Location'] as String,
    uploadId: json['x-amz-multipart-upload-id'] as String,
  );
}

InitiateVaultLockOutput _$InitiateVaultLockOutputFromJson(
    Map<String, dynamic> json) {
  return InitiateVaultLockOutput(
    lockId: json['x-amz-lock-id'] as String,
  );
}

InputSerialization _$InputSerializationFromJson(Map<String, dynamic> json) {
  return InputSerialization(
    csv: json['csv'] == null
        ? null
        : CSVInput.fromJson(json['csv'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputSerializationToJson(InputSerialization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('csv', instance.csv?.toJson());
  return val;
}

InventoryRetrievalJobDescription _$InventoryRetrievalJobDescriptionFromJson(
    Map<String, dynamic> json) {
  return InventoryRetrievalJobDescription(
    endDate: json['EndDate'] as String,
    format: json['Format'] as String,
    limit: json['Limit'] as String,
    marker: json['Marker'] as String,
    startDate: json['StartDate'] as String,
  );
}

Map<String, dynamic> _$InventoryRetrievalJobInputToJson(
    InventoryRetrievalJobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndDate', instance.endDate);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  writeNotNull('StartDate', instance.startDate);
  return val;
}

Map<String, dynamic> _$JobParametersToJson(JobParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ArchiveId', instance.archiveId);
  writeNotNull('Description', instance.description);
  writeNotNull('Format', instance.format);
  writeNotNull('InventoryRetrievalParameters',
      instance.inventoryRetrievalParameters?.toJson());
  writeNotNull('OutputLocation', instance.outputLocation?.toJson());
  writeNotNull('RetrievalByteRange', instance.retrievalByteRange);
  writeNotNull('SNSTopic', instance.sNSTopic);
  writeNotNull('SelectParameters', instance.selectParameters?.toJson());
  writeNotNull('Tier', instance.tier);
  writeNotNull('Type', instance.type);
  return val;
}

ListJobsOutput _$ListJobsOutputFromJson(Map<String, dynamic> json) {
  return ListJobsOutput(
    jobList: (json['JobList'] as List)
        ?.map((e) => e == null
            ? null
            : GlacierJobDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

ListMultipartUploadsOutput _$ListMultipartUploadsOutputFromJson(
    Map<String, dynamic> json) {
  return ListMultipartUploadsOutput(
    marker: json['Marker'] as String,
    uploadsList: (json['UploadsList'] as List)
        ?.map((e) => e == null
            ? null
            : UploadListElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPartsOutput _$ListPartsOutputFromJson(Map<String, dynamic> json) {
  return ListPartsOutput(
    archiveDescription: json['ArchiveDescription'] as String,
    creationDate: json['CreationDate'] as String,
    marker: json['Marker'] as String,
    multipartUploadId: json['MultipartUploadId'] as String,
    partSizeInBytes: json['PartSizeInBytes'] as int,
    parts: (json['Parts'] as List)
        ?.map((e) => e == null
            ? null
            : PartListElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vaultARN: json['VaultARN'] as String,
  );
}

ListProvisionedCapacityOutput _$ListProvisionedCapacityOutputFromJson(
    Map<String, dynamic> json) {
  return ListProvisionedCapacityOutput(
    provisionedCapacityList: (json['ProvisionedCapacityList'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisionedCapacityDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForVaultOutput _$ListTagsForVaultOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForVaultOutput(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListVaultsOutput _$ListVaultsOutputFromJson(Map<String, dynamic> json) {
  return ListVaultsOutput(
    marker: json['Marker'] as String,
    vaultList: (json['VaultList'] as List)
        ?.map((e) => e == null
            ? null
            : DescribeVaultOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OutputLocation _$OutputLocationFromJson(Map<String, dynamic> json) {
  return OutputLocation(
    s3: json['S3'] == null
        ? null
        : S3Location.fromJson(json['S3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputLocationToJson(OutputLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3', instance.s3?.toJson());
  return val;
}

OutputSerialization _$OutputSerializationFromJson(Map<String, dynamic> json) {
  return OutputSerialization(
    csv: json['csv'] == null
        ? null
        : CSVOutput.fromJson(json['csv'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputSerializationToJson(OutputSerialization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('csv', instance.csv?.toJson());
  return val;
}

PartListElement _$PartListElementFromJson(Map<String, dynamic> json) {
  return PartListElement(
    rangeInBytes: json['RangeInBytes'] as String,
    sHA256TreeHash: json['SHA256TreeHash'] as String,
  );
}

ProvisionedCapacityDescription _$ProvisionedCapacityDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProvisionedCapacityDescription(
    capacityId: json['CapacityId'] as String,
    expirationDate: json['ExpirationDate'] as String,
    startDate: json['StartDate'] as String,
  );
}

PurchaseProvisionedCapacityOutput _$PurchaseProvisionedCapacityOutputFromJson(
    Map<String, dynamic> json) {
  return PurchaseProvisionedCapacityOutput(
    capacityId: json['x-amz-capacity-id'] as String,
  );
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    accessControlList: (json['AccessControlList'] as List)
        ?.map(
            (e) => e == null ? null : Grant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bucketName: json['BucketName'] as String,
    cannedACL: _$enumDecodeNullable(_$CannedACLEnumMap, json['CannedACL']),
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    prefix: json['Prefix'] as String,
    storageClass:
        _$enumDecodeNullable(_$StorageClassEnumMap, json['StorageClass']),
    tagging: (json['Tagging'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    userMetadata: (json['UserMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessControlList',
      instance.accessControlList?.map((e) => e?.toJson())?.toList());
  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('CannedACL', _$CannedACLEnumMap[instance.cannedACL]);
  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('StorageClass', _$StorageClassEnumMap[instance.storageClass]);
  writeNotNull('Tagging', instance.tagging);
  writeNotNull('UserMetadata', instance.userMetadata);
  return val;
}

const _$CannedACLEnumMap = {
  CannedACL.private: 'private',
  CannedACL.publicRead: 'public-read',
  CannedACL.publicReadWrite: 'public-read-write',
  CannedACL.awsExecRead: 'aws-exec-read',
  CannedACL.authenticatedRead: 'authenticated-read',
  CannedACL.bucketOwnerRead: 'bucket-owner-read',
  CannedACL.bucketOwnerFullControl: 'bucket-owner-full-control',
};

const _$StorageClassEnumMap = {
  StorageClass.standard: 'STANDARD',
  StorageClass.reducedRedundancy: 'REDUCED_REDUNDANCY',
  StorageClass.standardIa: 'STANDARD_IA',
};

SelectParameters _$SelectParametersFromJson(Map<String, dynamic> json) {
  return SelectParameters(
    expression: json['Expression'] as String,
    expressionType:
        _$enumDecodeNullable(_$ExpressionTypeEnumMap, json['ExpressionType']),
    inputSerialization: json['InputSerialization'] == null
        ? null
        : InputSerialization.fromJson(
            json['InputSerialization'] as Map<String, dynamic>),
    outputSerialization: json['OutputSerialization'] == null
        ? null
        : OutputSerialization.fromJson(
            json['OutputSerialization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SelectParametersToJson(SelectParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Expression', instance.expression);
  writeNotNull(
      'ExpressionType', _$ExpressionTypeEnumMap[instance.expressionType]);
  writeNotNull('InputSerialization', instance.inputSerialization?.toJson());
  writeNotNull('OutputSerialization', instance.outputSerialization?.toJson());
  return val;
}

const _$ExpressionTypeEnumMap = {
  ExpressionType.sql: 'SQL',
};

UploadListElement _$UploadListElementFromJson(Map<String, dynamic> json) {
  return UploadListElement(
    archiveDescription: json['ArchiveDescription'] as String,
    creationDate: json['CreationDate'] as String,
    multipartUploadId: json['MultipartUploadId'] as String,
    partSizeInBytes: json['PartSizeInBytes'] as int,
    vaultARN: json['VaultARN'] as String,
  );
}

UploadMultipartPartOutput _$UploadMultipartPartOutputFromJson(
    Map<String, dynamic> json) {
  return UploadMultipartPartOutput(
    checksum: json['x-amz-sha256-tree-hash'] as String,
  );
}

VaultAccessPolicy _$VaultAccessPolicyFromJson(Map<String, dynamic> json) {
  return VaultAccessPolicy(
    policy: json['Policy'] as String,
  );
}

Map<String, dynamic> _$VaultAccessPolicyToJson(VaultAccessPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Policy', instance.policy);
  return val;
}

Map<String, dynamic> _$VaultLockPolicyToJson(VaultLockPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Policy', instance.policy);
  return val;
}

VaultNotificationConfig _$VaultNotificationConfigFromJson(
    Map<String, dynamic> json) {
  return VaultNotificationConfig(
    events: (json['Events'] as List)?.map((e) => e as String)?.toList(),
    sNSTopic: json['SNSTopic'] as String,
  );
}

Map<String, dynamic> _$VaultNotificationConfigToJson(
    VaultNotificationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Events', instance.events);
  writeNotNull('SNSTopic', instance.sNSTopic);
  return val;
}
