// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-09-21.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

AuthorizationData _$AuthorizationDataFromJson(Map<String, dynamic> json) {
  return AuthorizationData(
    authorizationToken: json['authorizationToken'] as String,
    expiresAt: const UnixDateTimeConverter().fromJson(json['expiresAt']),
    proxyEndpoint: json['proxyEndpoint'] as String,
  );
}

BatchCheckLayerAvailabilityResponse
    _$BatchCheckLayerAvailabilityResponseFromJson(Map<String, dynamic> json) {
  return BatchCheckLayerAvailabilityResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : LayerFailure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    layers: (json['layers'] as List)
        ?.map(
            (e) => e == null ? null : Layer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteImageResponse _$BatchDeleteImageResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteImageResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : ImageFailure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageIds: (json['imageIds'] as List)
        ?.map((e) => e == null
            ? null
            : ImageIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetImageResponse _$BatchGetImageResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetImageResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : ImageFailure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CompleteLayerUploadResponse _$CompleteLayerUploadResponseFromJson(
    Map<String, dynamic> json) {
  return CompleteLayerUploadResponse(
    layerDigest: json['layerDigest'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
    uploadId: json['uploadId'] as String,
  );
}

CreateRepositoryResponse _$CreateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRepositoryResponse(
    repository: json['repository'] == null
        ? null
        : Repository.fromJson(json['repository'] as Map<String, dynamic>),
  );
}

DeleteLifecyclePolicyResponse _$DeleteLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyResponse(
    lastEvaluatedAt:
        const UnixDateTimeConverter().fromJson(json['lastEvaluatedAt']),
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

DeleteRegistryPolicyResponse _$DeleteRegistryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegistryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
  );
}

DeleteRepositoryPolicyResponse _$DeleteRepositoryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

DeleteRepositoryResponse _$DeleteRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryResponse(
    repository: json['repository'] == null
        ? null
        : Repository.fromJson(json['repository'] as Map<String, dynamic>),
  );
}

DescribeImageScanFindingsResponse _$DescribeImageScanFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImageScanFindingsResponse(
    imageId: json['imageId'] == null
        ? null
        : ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>),
    imageScanFindings: json['imageScanFindings'] == null
        ? null
        : ImageScanFindings.fromJson(
            json['imageScanFindings'] as Map<String, dynamic>),
    imageScanStatus: json['imageScanStatus'] == null
        ? null
        : ImageScanStatus.fromJson(
            json['imageScanStatus'] as Map<String, dynamic>),
    nextToken: json['nextToken'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Map<String, dynamic> _$DescribeImagesFilterToJson(
    DescribeImagesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagStatus', _$TagStatusEnumMap[instance.tagStatus]);
  return val;
}

const _$TagStatusEnumMap = {
  TagStatus.tagged: 'TAGGED',
  TagStatus.untagged: 'UNTAGGED',
  TagStatus.any: 'ANY',
};

DescribeImagesResponse _$DescribeImagesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImagesResponse(
    imageDetails: (json['imageDetails'] as List)
        ?.map((e) =>
            e == null ? null : ImageDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeRegistryResponse _$DescribeRegistryResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRegistryResponse(
    registryId: json['registryId'] as String,
    replicationConfiguration: json['replicationConfiguration'] == null
        ? null
        : ReplicationConfiguration.fromJson(
            json['replicationConfiguration'] as Map<String, dynamic>),
  );
}

DescribeRepositoriesResponse _$DescribeRepositoriesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRepositoriesResponse(
    nextToken: json['nextToken'] as String,
    repositories: (json['repositories'] as List)
        ?.map((e) =>
            e == null ? null : Repository.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

EncryptionConfiguration _$EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return EncryptionConfiguration(
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['encryptionType']),
    kmsKey: json['kmsKey'] as String,
  );
}

Map<String, dynamic> _$EncryptionConfigurationToJson(
    EncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'encryptionType', _$EncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('kmsKey', instance.kmsKey);
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

const _$EncryptionTypeEnumMap = {
  EncryptionType.aes256: 'AES256',
  EncryptionType.kms: 'KMS',
};

GetAuthorizationTokenResponse _$GetAuthorizationTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetAuthorizationTokenResponse(
    authorizationData: (json['authorizationData'] as List)
        ?.map((e) => e == null
            ? null
            : AuthorizationData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetDownloadUrlForLayerResponse _$GetDownloadUrlForLayerResponseFromJson(
    Map<String, dynamic> json) {
  return GetDownloadUrlForLayerResponse(
    downloadUrl: json['downloadUrl'] as String,
    layerDigest: json['layerDigest'] as String,
  );
}

GetLifecyclePolicyPreviewResponse _$GetLifecyclePolicyPreviewResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyPreviewResponse(
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    nextToken: json['nextToken'] as String,
    previewResults: (json['previewResults'] as List)
        ?.map((e) => e == null
            ? null
            : LifecyclePolicyPreviewResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
    status: _$enumDecodeNullable(
        _$LifecyclePolicyPreviewStatusEnumMap, json['status']),
    summary: json['summary'] == null
        ? null
        : LifecyclePolicyPreviewSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
  );
}

const _$LifecyclePolicyPreviewStatusEnumMap = {
  LifecyclePolicyPreviewStatus.inProgress: 'IN_PROGRESS',
  LifecyclePolicyPreviewStatus.complete: 'COMPLETE',
  LifecyclePolicyPreviewStatus.expired: 'EXPIRED',
  LifecyclePolicyPreviewStatus.failed: 'FAILED',
};

GetLifecyclePolicyResponse _$GetLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyResponse(
    lastEvaluatedAt:
        const UnixDateTimeConverter().fromJson(json['lastEvaluatedAt']),
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

GetRegistryPolicyResponse _$GetRegistryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegistryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
  );
}

GetRepositoryPolicyResponse _$GetRepositoryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetRepositoryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    imageId: json['imageId'] == null
        ? null
        : ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>),
    imageManifest: json['imageManifest'] as String,
    imageManifestMediaType: json['imageManifestMediaType'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

ImageDetail _$ImageDetailFromJson(Map<String, dynamic> json) {
  return ImageDetail(
    artifactMediaType: json['artifactMediaType'] as String,
    imageDigest: json['imageDigest'] as String,
    imageManifestMediaType: json['imageManifestMediaType'] as String,
    imagePushedAt:
        const UnixDateTimeConverter().fromJson(json['imagePushedAt']),
    imageScanFindingsSummary: json['imageScanFindingsSummary'] == null
        ? null
        : ImageScanFindingsSummary.fromJson(
            json['imageScanFindingsSummary'] as Map<String, dynamic>),
    imageScanStatus: json['imageScanStatus'] == null
        ? null
        : ImageScanStatus.fromJson(
            json['imageScanStatus'] as Map<String, dynamic>),
    imageSizeInBytes: json['imageSizeInBytes'] as int,
    imageTags: (json['imageTags'] as List)?.map((e) => e as String)?.toList(),
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

ImageFailure _$ImageFailureFromJson(Map<String, dynamic> json) {
  return ImageFailure(
    failureCode:
        _$enumDecodeNullable(_$ImageFailureCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    imageId: json['imageId'] == null
        ? null
        : ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>),
  );
}

const _$ImageFailureCodeEnumMap = {
  ImageFailureCode.invalidImageDigest: 'InvalidImageDigest',
  ImageFailureCode.invalidImageTag: 'InvalidImageTag',
  ImageFailureCode.imageTagDoesNotMatchDigest: 'ImageTagDoesNotMatchDigest',
  ImageFailureCode.imageNotFound: 'ImageNotFound',
  ImageFailureCode.missingDigestAndTag: 'MissingDigestAndTag',
  ImageFailureCode.imageReferencedByManifestList:
      'ImageReferencedByManifestList',
  ImageFailureCode.kmsError: 'KmsError',
};

ImageIdentifier _$ImageIdentifierFromJson(Map<String, dynamic> json) {
  return ImageIdentifier(
    imageDigest: json['imageDigest'] as String,
    imageTag: json['imageTag'] as String,
  );
}

Map<String, dynamic> _$ImageIdentifierToJson(ImageIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageDigest', instance.imageDigest);
  writeNotNull('imageTag', instance.imageTag);
  return val;
}

ImageScanFinding _$ImageScanFindingFromJson(Map<String, dynamic> json) {
  return ImageScanFinding(
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    name: json['name'] as String,
    severity: _$enumDecodeNullable(_$FindingSeverityEnumMap, json['severity']),
    uri: json['uri'] as String,
  );
}

const _$FindingSeverityEnumMap = {
  FindingSeverity.informational: 'INFORMATIONAL',
  FindingSeverity.low: 'LOW',
  FindingSeverity.medium: 'MEDIUM',
  FindingSeverity.high: 'HIGH',
  FindingSeverity.critical: 'CRITICAL',
  FindingSeverity.undefined: 'UNDEFINED',
};

ImageScanFindings _$ImageScanFindingsFromJson(Map<String, dynamic> json) {
  return ImageScanFindings(
    findingSeverityCounts:
        (json['findingSeverityCounts'] as Map<String, dynamic>)?.map(
      (k, e) =>
          MapEntry(_$enumDecodeNullable(_$FindingSeverityEnumMap, k), e as int),
    ),
    findings: (json['findings'] as List)
        ?.map((e) => e == null
            ? null
            : ImageScanFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageScanCompletedAt:
        const UnixDateTimeConverter().fromJson(json['imageScanCompletedAt']),
    vulnerabilitySourceUpdatedAt: const UnixDateTimeConverter()
        .fromJson(json['vulnerabilitySourceUpdatedAt']),
  );
}

ImageScanFindingsSummary _$ImageScanFindingsSummaryFromJson(
    Map<String, dynamic> json) {
  return ImageScanFindingsSummary(
    findingSeverityCounts:
        (json['findingSeverityCounts'] as Map<String, dynamic>)?.map(
      (k, e) =>
          MapEntry(_$enumDecodeNullable(_$FindingSeverityEnumMap, k), e as int),
    ),
    imageScanCompletedAt:
        const UnixDateTimeConverter().fromJson(json['imageScanCompletedAt']),
    vulnerabilitySourceUpdatedAt: const UnixDateTimeConverter()
        .fromJson(json['vulnerabilitySourceUpdatedAt']),
  );
}

ImageScanStatus _$ImageScanStatusFromJson(Map<String, dynamic> json) {
  return ImageScanStatus(
    description: json['description'] as String,
    status: _$enumDecodeNullable(_$ScanStatusEnumMap, json['status']),
  );
}

const _$ScanStatusEnumMap = {
  ScanStatus.inProgress: 'IN_PROGRESS',
  ScanStatus.complete: 'COMPLETE',
  ScanStatus.failed: 'FAILED',
};

ImageScanningConfiguration _$ImageScanningConfigurationFromJson(
    Map<String, dynamic> json) {
  return ImageScanningConfiguration(
    scanOnPush: json['scanOnPush'] as bool,
  );
}

Map<String, dynamic> _$ImageScanningConfigurationToJson(
    ImageScanningConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scanOnPush', instance.scanOnPush);
  return val;
}

InitiateLayerUploadResponse _$InitiateLayerUploadResponseFromJson(
    Map<String, dynamic> json) {
  return InitiateLayerUploadResponse(
    partSize: json['partSize'] as int,
    uploadId: json['uploadId'] as String,
  );
}

Layer _$LayerFromJson(Map<String, dynamic> json) {
  return Layer(
    layerAvailability: _$enumDecodeNullable(
        _$LayerAvailabilityEnumMap, json['layerAvailability']),
    layerDigest: json['layerDigest'] as String,
    layerSize: json['layerSize'] as int,
    mediaType: json['mediaType'] as String,
  );
}

const _$LayerAvailabilityEnumMap = {
  LayerAvailability.available: 'AVAILABLE',
  LayerAvailability.unavailable: 'UNAVAILABLE',
};

LayerFailure _$LayerFailureFromJson(Map<String, dynamic> json) {
  return LayerFailure(
    failureCode:
        _$enumDecodeNullable(_$LayerFailureCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    layerDigest: json['layerDigest'] as String,
  );
}

const _$LayerFailureCodeEnumMap = {
  LayerFailureCode.invalidLayerDigest: 'InvalidLayerDigest',
  LayerFailureCode.missingLayerDigest: 'MissingLayerDigest',
};

Map<String, dynamic> _$LifecyclePolicyPreviewFilterToJson(
    LifecyclePolicyPreviewFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagStatus', _$TagStatusEnumMap[instance.tagStatus]);
  return val;
}

LifecyclePolicyPreviewResult _$LifecyclePolicyPreviewResultFromJson(
    Map<String, dynamic> json) {
  return LifecyclePolicyPreviewResult(
    action: json['action'] == null
        ? null
        : LifecyclePolicyRuleAction.fromJson(
            json['action'] as Map<String, dynamic>),
    appliedRulePriority: json['appliedRulePriority'] as int,
    imageDigest: json['imageDigest'] as String,
    imagePushedAt:
        const UnixDateTimeConverter().fromJson(json['imagePushedAt']),
    imageTags: (json['imageTags'] as List)?.map((e) => e as String)?.toList(),
  );
}

LifecyclePolicyPreviewSummary _$LifecyclePolicyPreviewSummaryFromJson(
    Map<String, dynamic> json) {
  return LifecyclePolicyPreviewSummary(
    expiringImageTotalCount: json['expiringImageTotalCount'] as int,
  );
}

LifecyclePolicyRuleAction _$LifecyclePolicyRuleActionFromJson(
    Map<String, dynamic> json) {
  return LifecyclePolicyRuleAction(
    type: _$enumDecodeNullable(_$ImageActionTypeEnumMap, json['type']),
  );
}

const _$ImageActionTypeEnumMap = {
  ImageActionType.expire: 'EXPIRE',
};

Map<String, dynamic> _$ListImagesFilterToJson(ListImagesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagStatus', _$TagStatusEnumMap[instance.tagStatus]);
  return val;
}

ListImagesResponse _$ListImagesResponseFromJson(Map<String, dynamic> json) {
  return ListImagesResponse(
    imageIds: (json['imageIds'] as List)
        ?.map((e) => e == null
            ? null
            : ImageIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutImageResponse _$PutImageResponseFromJson(Map<String, dynamic> json) {
  return PutImageResponse(
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

PutImageScanningConfigurationResponse
    _$PutImageScanningConfigurationResponseFromJson(Map<String, dynamic> json) {
  return PutImageScanningConfigurationResponse(
    imageScanningConfiguration: json['imageScanningConfiguration'] == null
        ? null
        : ImageScanningConfiguration.fromJson(
            json['imageScanningConfiguration'] as Map<String, dynamic>),
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

PutImageTagMutabilityResponse _$PutImageTagMutabilityResponseFromJson(
    Map<String, dynamic> json) {
  return PutImageTagMutabilityResponse(
    imageTagMutability: _$enumDecodeNullable(
        _$ImageTagMutabilityEnumMap, json['imageTagMutability']),
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

const _$ImageTagMutabilityEnumMap = {
  ImageTagMutability.mutable: 'MUTABLE',
  ImageTagMutability.immutable: 'IMMUTABLE',
};

PutLifecyclePolicyResponse _$PutLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutLifecyclePolicyResponse(
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

PutRegistryPolicyResponse _$PutRegistryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutRegistryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
  );
}

PutReplicationConfigurationResponse
    _$PutReplicationConfigurationResponseFromJson(Map<String, dynamic> json) {
  return PutReplicationConfigurationResponse(
    replicationConfiguration: json['replicationConfiguration'] == null
        ? null
        : ReplicationConfiguration.fromJson(
            json['replicationConfiguration'] as Map<String, dynamic>),
  );
}

ReplicationConfiguration _$ReplicationConfigurationFromJson(
    Map<String, dynamic> json) {
  return ReplicationConfiguration(
    rules: (json['rules'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReplicationConfigurationToJson(
    ReplicationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

ReplicationDestination _$ReplicationDestinationFromJson(
    Map<String, dynamic> json) {
  return ReplicationDestination(
    region: json['region'] as String,
    registryId: json['registryId'] as String,
  );
}

Map<String, dynamic> _$ReplicationDestinationToJson(
    ReplicationDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('region', instance.region);
  writeNotNull('registryId', instance.registryId);
  return val;
}

ReplicationRule _$ReplicationRuleFromJson(Map<String, dynamic> json) {
  return ReplicationRule(
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReplicationRuleToJson(ReplicationRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'destinations', instance.destinations?.map((e) => e?.toJson())?.toList());
  return val;
}

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    encryptionConfiguration: json['encryptionConfiguration'] == null
        ? null
        : EncryptionConfiguration.fromJson(
            json['encryptionConfiguration'] as Map<String, dynamic>),
    imageScanningConfiguration: json['imageScanningConfiguration'] == null
        ? null
        : ImageScanningConfiguration.fromJson(
            json['imageScanningConfiguration'] as Map<String, dynamic>),
    imageTagMutability: _$enumDecodeNullable(
        _$ImageTagMutabilityEnumMap, json['imageTagMutability']),
    registryId: json['registryId'] as String,
    repositoryArn: json['repositoryArn'] as String,
    repositoryName: json['repositoryName'] as String,
    repositoryUri: json['repositoryUri'] as String,
  );
}

SetRepositoryPolicyResponse _$SetRepositoryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return SetRepositoryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

StartImageScanResponse _$StartImageScanResponseFromJson(
    Map<String, dynamic> json) {
  return StartImageScanResponse(
    imageId: json['imageId'] == null
        ? null
        : ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>),
    imageScanStatus: json['imageScanStatus'] == null
        ? null
        : ImageScanStatus.fromJson(
            json['imageScanStatus'] as Map<String, dynamic>),
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

StartLifecyclePolicyPreviewResponse
    _$StartLifecyclePolicyPreviewResponseFromJson(Map<String, dynamic> json) {
  return StartLifecyclePolicyPreviewResponse(
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
    status: _$enumDecodeNullable(
        _$LifecyclePolicyPreviewStatusEnumMap, json['status']),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UploadLayerPartResponse _$UploadLayerPartResponseFromJson(
    Map<String, dynamic> json) {
  return UploadLayerPartResponse(
    lastByteReceived: json['lastByteReceived'] as int,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
    uploadId: json['uploadId'] as String,
  );
}
