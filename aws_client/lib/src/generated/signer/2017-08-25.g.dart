// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-08-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProfilePermissionResponse _$AddProfilePermissionResponseFromJson(
    Map<String, dynamic> json) {
  return AddProfilePermissionResponse(
    revisionId: json['revisionId'] as String,
  );
}

DescribeSigningJobResponse _$DescribeSigningJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSigningJobResponse(
    completedAt: const UnixDateTimeConverter().fromJson(json['completedAt']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    jobId: json['jobId'] as String,
    jobInvoker: json['jobInvoker'] as String,
    jobOwner: json['jobOwner'] as String,
    overrides: json['overrides'] == null
        ? null
        : SigningPlatformOverrides.fromJson(
            json['overrides'] as Map<String, dynamic>),
    platformDisplayName: json['platformDisplayName'] as String,
    platformId: json['platformId'] as String,
    profileName: json['profileName'] as String,
    profileVersion: json['profileVersion'] as String,
    requestedBy: json['requestedBy'] as String,
    revocationRecord: json['revocationRecord'] == null
        ? null
        : SigningJobRevocationRecord.fromJson(
            json['revocationRecord'] as Map<String, dynamic>),
    signatureExpiresAt:
        const UnixDateTimeConverter().fromJson(json['signatureExpiresAt']),
    signedObject: json['signedObject'] == null
        ? null
        : SignedObject.fromJson(json['signedObject'] as Map<String, dynamic>),
    signingMaterial: json['signingMaterial'] == null
        ? null
        : SigningMaterial.fromJson(
            json['signingMaterial'] as Map<String, dynamic>),
    signingParameters: (json['signingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$SigningStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
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

const _$SigningStatusEnumMap = {
  SigningStatus.inProgress: 'InProgress',
  SigningStatus.failed: 'Failed',
  SigningStatus.succeeded: 'Succeeded',
};

Map<String, dynamic> _$DestinationToJson(Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3', instance.s3?.toJson());
  return val;
}

EncryptionAlgorithmOptions _$EncryptionAlgorithmOptionsFromJson(
    Map<String, dynamic> json) {
  return EncryptionAlgorithmOptions(
    allowedValues: (json['allowedValues'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EncryptionAlgorithmEnumMap, e))
        ?.toList(),
    defaultValue: _$enumDecodeNullable(
        _$EncryptionAlgorithmEnumMap, json['defaultValue']),
  );
}

const _$EncryptionAlgorithmEnumMap = {
  EncryptionAlgorithm.rsa: 'RSA',
  EncryptionAlgorithm.ecdsa: 'ECDSA',
};

GetSigningPlatformResponse _$GetSigningPlatformResponseFromJson(
    Map<String, dynamic> json) {
  return GetSigningPlatformResponse(
    category: _$enumDecodeNullable(_$CategoryEnumMap, json['category']),
    displayName: json['displayName'] as String,
    maxSizeInMB: json['maxSizeInMB'] as int,
    partner: json['partner'] as String,
    platformId: json['platformId'] as String,
    revocationSupported: json['revocationSupported'] as bool,
    signingConfiguration: json['signingConfiguration'] == null
        ? null
        : SigningConfiguration.fromJson(
            json['signingConfiguration'] as Map<String, dynamic>),
    signingImageFormat: json['signingImageFormat'] == null
        ? null
        : SigningImageFormat.fromJson(
            json['signingImageFormat'] as Map<String, dynamic>),
    target: json['target'] as String,
  );
}

const _$CategoryEnumMap = {
  Category.awsIoT: 'AWSIoT',
};

GetSigningProfileResponse _$GetSigningProfileResponseFromJson(
    Map<String, dynamic> json) {
  return GetSigningProfileResponse(
    arn: json['arn'] as String,
    overrides: json['overrides'] == null
        ? null
        : SigningPlatformOverrides.fromJson(
            json['overrides'] as Map<String, dynamic>),
    platformDisplayName: json['platformDisplayName'] as String,
    platformId: json['platformId'] as String,
    profileName: json['profileName'] as String,
    profileVersion: json['profileVersion'] as String,
    profileVersionArn: json['profileVersionArn'] as String,
    revocationRecord: json['revocationRecord'] == null
        ? null
        : SigningProfileRevocationRecord.fromJson(
            json['revocationRecord'] as Map<String, dynamic>),
    signatureValidityPeriod: json['signatureValidityPeriod'] == null
        ? null
        : SignatureValidityPeriod.fromJson(
            json['signatureValidityPeriod'] as Map<String, dynamic>),
    signingMaterial: json['signingMaterial'] == null
        ? null
        : SigningMaterial.fromJson(
            json['signingMaterial'] as Map<String, dynamic>),
    signingParameters: (json['signingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    status: _$enumDecodeNullable(_$SigningProfileStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$SigningProfileStatusEnumMap = {
  SigningProfileStatus.active: 'Active',
  SigningProfileStatus.canceled: 'Canceled',
  SigningProfileStatus.revoked: 'Revoked',
};

HashAlgorithmOptions _$HashAlgorithmOptionsFromJson(Map<String, dynamic> json) {
  return HashAlgorithmOptions(
    allowedValues: (json['allowedValues'] as List)
        ?.map((e) => _$enumDecodeNullable(_$HashAlgorithmEnumMap, e))
        ?.toList(),
    defaultValue:
        _$enumDecodeNullable(_$HashAlgorithmEnumMap, json['defaultValue']),
  );
}

const _$HashAlgorithmEnumMap = {
  HashAlgorithm.sha1: 'SHA1',
  HashAlgorithm.sha256: 'SHA256',
};

ListProfilePermissionsResponse _$ListProfilePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfilePermissionsResponse(
    nextToken: json['nextToken'] as String,
    permissions: (json['permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    policySizeBytes: json['policySizeBytes'] as int,
    revisionId: json['revisionId'] as String,
  );
}

ListSigningJobsResponse _$ListSigningJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSigningJobsResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) =>
            e == null ? null : SigningJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListSigningPlatformsResponse _$ListSigningPlatformsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSigningPlatformsResponse(
    nextToken: json['nextToken'] as String,
    platforms: (json['platforms'] as List)
        ?.map((e) => e == null
            ? null
            : SigningPlatform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSigningProfilesResponse _$ListSigningProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSigningProfilesResponse(
    nextToken: json['nextToken'] as String,
    profiles: (json['profiles'] as List)
        ?.map((e) => e == null
            ? null
            : SigningProfile.fromJson(e as Map<String, dynamic>))
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

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    action: json['action'] as String,
    principal: json['principal'] as String,
    profileVersion: json['profileVersion'] as String,
    statementId: json['statementId'] as String,
  );
}

PutSigningProfileResponse _$PutSigningProfileResponseFromJson(
    Map<String, dynamic> json) {
  return PutSigningProfileResponse(
    arn: json['arn'] as String,
    profileVersion: json['profileVersion'] as String,
    profileVersionArn: json['profileVersionArn'] as String,
  );
}

RemoveProfilePermissionResponse _$RemoveProfilePermissionResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveProfilePermissionResponse(
    revisionId: json['revisionId'] as String,
  );
}

Map<String, dynamic> _$S3DestinationToJson(S3Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('prefix', instance.prefix);
  return val;
}

S3SignedObject _$S3SignedObjectFromJson(Map<String, dynamic> json) {
  return S3SignedObject(
    bucketName: json['bucketName'] as String,
    key: json['key'] as String,
  );
}

S3Source _$S3SourceFromJson(Map<String, dynamic> json) {
  return S3Source(
    bucketName: json['bucketName'] as String,
    key: json['key'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$S3SourceToJson(S3Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('key', instance.key);
  writeNotNull('version', instance.version);
  return val;
}

SignatureValidityPeriod _$SignatureValidityPeriodFromJson(
    Map<String, dynamic> json) {
  return SignatureValidityPeriod(
    type: _$enumDecodeNullable(_$ValidityTypeEnumMap, json['type']),
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$SignatureValidityPeriodToJson(
    SignatureValidityPeriod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$ValidityTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  return val;
}

const _$ValidityTypeEnumMap = {
  ValidityType.days: 'DAYS',
  ValidityType.months: 'MONTHS',
  ValidityType.years: 'YEARS',
};

SignedObject _$SignedObjectFromJson(Map<String, dynamic> json) {
  return SignedObject(
    s3: json['s3'] == null
        ? null
        : S3SignedObject.fromJson(json['s3'] as Map<String, dynamic>),
  );
}

SigningConfiguration _$SigningConfigurationFromJson(Map<String, dynamic> json) {
  return SigningConfiguration(
    encryptionAlgorithmOptions: json['encryptionAlgorithmOptions'] == null
        ? null
        : EncryptionAlgorithmOptions.fromJson(
            json['encryptionAlgorithmOptions'] as Map<String, dynamic>),
    hashAlgorithmOptions: json['hashAlgorithmOptions'] == null
        ? null
        : HashAlgorithmOptions.fromJson(
            json['hashAlgorithmOptions'] as Map<String, dynamic>),
  );
}

SigningConfigurationOverrides _$SigningConfigurationOverridesFromJson(
    Map<String, dynamic> json) {
  return SigningConfigurationOverrides(
    encryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmEnumMap, json['encryptionAlgorithm']),
    hashAlgorithm:
        _$enumDecodeNullable(_$HashAlgorithmEnumMap, json['hashAlgorithm']),
  );
}

Map<String, dynamic> _$SigningConfigurationOverridesToJson(
    SigningConfigurationOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('encryptionAlgorithm',
      _$EncryptionAlgorithmEnumMap[instance.encryptionAlgorithm]);
  writeNotNull('hashAlgorithm', _$HashAlgorithmEnumMap[instance.hashAlgorithm]);
  return val;
}

SigningImageFormat _$SigningImageFormatFromJson(Map<String, dynamic> json) {
  return SigningImageFormat(
    defaultFormat:
        _$enumDecodeNullable(_$ImageFormatEnumMap, json['defaultFormat']),
    supportedFormats: (json['supportedFormats'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ImageFormatEnumMap, e))
        ?.toList(),
  );
}

const _$ImageFormatEnumMap = {
  ImageFormat.json: 'JSON',
  ImageFormat.jSONEmbedded: 'JSONEmbedded',
  ImageFormat.jSONDetached: 'JSONDetached',
};

SigningJob _$SigningJobFromJson(Map<String, dynamic> json) {
  return SigningJob(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    isRevoked: json['isRevoked'] as bool,
    jobId: json['jobId'] as String,
    jobInvoker: json['jobInvoker'] as String,
    jobOwner: json['jobOwner'] as String,
    platformDisplayName: json['platformDisplayName'] as String,
    platformId: json['platformId'] as String,
    profileName: json['profileName'] as String,
    profileVersion: json['profileVersion'] as String,
    signatureExpiresAt:
        const UnixDateTimeConverter().fromJson(json['signatureExpiresAt']),
    signedObject: json['signedObject'] == null
        ? null
        : SignedObject.fromJson(json['signedObject'] as Map<String, dynamic>),
    signingMaterial: json['signingMaterial'] == null
        ? null
        : SigningMaterial.fromJson(
            json['signingMaterial'] as Map<String, dynamic>),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$SigningStatusEnumMap, json['status']),
  );
}

SigningJobRevocationRecord _$SigningJobRevocationRecordFromJson(
    Map<String, dynamic> json) {
  return SigningJobRevocationRecord(
    reason: json['reason'] as String,
    revokedAt: const UnixDateTimeConverter().fromJson(json['revokedAt']),
    revokedBy: json['revokedBy'] as String,
  );
}

SigningMaterial _$SigningMaterialFromJson(Map<String, dynamic> json) {
  return SigningMaterial(
    certificateArn: json['certificateArn'] as String,
  );
}

Map<String, dynamic> _$SigningMaterialToJson(SigningMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  return val;
}

SigningPlatform _$SigningPlatformFromJson(Map<String, dynamic> json) {
  return SigningPlatform(
    category: _$enumDecodeNullable(_$CategoryEnumMap, json['category']),
    displayName: json['displayName'] as String,
    maxSizeInMB: json['maxSizeInMB'] as int,
    partner: json['partner'] as String,
    platformId: json['platformId'] as String,
    revocationSupported: json['revocationSupported'] as bool,
    signingConfiguration: json['signingConfiguration'] == null
        ? null
        : SigningConfiguration.fromJson(
            json['signingConfiguration'] as Map<String, dynamic>),
    signingImageFormat: json['signingImageFormat'] == null
        ? null
        : SigningImageFormat.fromJson(
            json['signingImageFormat'] as Map<String, dynamic>),
    target: json['target'] as String,
  );
}

SigningPlatformOverrides _$SigningPlatformOverridesFromJson(
    Map<String, dynamic> json) {
  return SigningPlatformOverrides(
    signingConfiguration: json['signingConfiguration'] == null
        ? null
        : SigningConfigurationOverrides.fromJson(
            json['signingConfiguration'] as Map<String, dynamic>),
    signingImageFormat:
        _$enumDecodeNullable(_$ImageFormatEnumMap, json['signingImageFormat']),
  );
}

Map<String, dynamic> _$SigningPlatformOverridesToJson(
    SigningPlatformOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signingConfiguration', instance.signingConfiguration?.toJson());
  writeNotNull(
      'signingImageFormat', _$ImageFormatEnumMap[instance.signingImageFormat]);
  return val;
}

SigningProfile _$SigningProfileFromJson(Map<String, dynamic> json) {
  return SigningProfile(
    arn: json['arn'] as String,
    platformDisplayName: json['platformDisplayName'] as String,
    platformId: json['platformId'] as String,
    profileName: json['profileName'] as String,
    profileVersion: json['profileVersion'] as String,
    profileVersionArn: json['profileVersionArn'] as String,
    signatureValidityPeriod: json['signatureValidityPeriod'] == null
        ? null
        : SignatureValidityPeriod.fromJson(
            json['signatureValidityPeriod'] as Map<String, dynamic>),
    signingMaterial: json['signingMaterial'] == null
        ? null
        : SigningMaterial.fromJson(
            json['signingMaterial'] as Map<String, dynamic>),
    signingParameters: (json['signingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    status: _$enumDecodeNullable(_$SigningProfileStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

SigningProfileRevocationRecord _$SigningProfileRevocationRecordFromJson(
    Map<String, dynamic> json) {
  return SigningProfileRevocationRecord(
    revocationEffectiveFrom:
        const UnixDateTimeConverter().fromJson(json['revocationEffectiveFrom']),
    revokedAt: const UnixDateTimeConverter().fromJson(json['revokedAt']),
    revokedBy: json['revokedBy'] as String,
  );
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    s3: json['s3'] == null
        ? null
        : S3Source.fromJson(json['s3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3', instance.s3?.toJson());
  return val;
}

StartSigningJobResponse _$StartSigningJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartSigningJobResponse(
    jobId: json['jobId'] as String,
    jobOwner: json['jobOwner'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
