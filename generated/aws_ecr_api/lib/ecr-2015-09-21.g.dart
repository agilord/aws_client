// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecr-2015-09-21.dart';

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
    expiresAt: unixTimestampFromJson(json['expiresAt']),
    proxyEndpoint: json['proxyEndpoint'] as String,
  );
}

Map<String, dynamic> _$BatchCheckLayerAvailabilityRequestToJson(
    BatchCheckLayerAvailabilityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('layerDigests', instance.layerDigests);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$BatchDeleteImageRequestToJson(
    BatchDeleteImageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'imageIds', instance.imageIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$BatchGetImageRequestToJson(
    BatchGetImageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'imageIds', instance.imageIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('acceptedMediaTypes', instance.acceptedMediaTypes);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$CompleteLayerUploadRequestToJson(
    CompleteLayerUploadRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('layerDigests', instance.layerDigests);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('uploadId', instance.uploadId);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$CreateRepositoryRequestToJson(
    CreateRepositoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('imageScanningConfiguration',
      instance.imageScanningConfiguration?.toJson());
  writeNotNull('imageTagMutability',
      _$ImageTagMutabilityEnumMap[instance.imageTagMutability]);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ImageTagMutabilityEnumMap = {
  ImageTagMutability.mutable: 'MUTABLE',
  ImageTagMutability.immutable: 'IMMUTABLE',
};

CreateRepositoryResponse _$CreateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRepositoryResponse(
    repository: json['repository'] == null
        ? null
        : Repository.fromJson(json['repository'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteLifecyclePolicyRequestToJson(
    DeleteLifecyclePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
}

DeleteLifecyclePolicyResponse _$DeleteLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyResponse(
    lastEvaluatedAt: unixTimestampFromJson(json['lastEvaluatedAt']),
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Map<String, dynamic> _$DeleteRepositoryPolicyRequestToJson(
    DeleteRepositoryPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
}

DeleteRepositoryPolicyResponse _$DeleteRepositoryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Map<String, dynamic> _$DeleteRepositoryRequestToJson(
    DeleteRepositoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('force', instance.force);
  writeNotNull('registryId', instance.registryId);
  return val;
}

DeleteRepositoryResponse _$DeleteRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryResponse(
    repository: json['repository'] == null
        ? null
        : Repository.fromJson(json['repository'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeImageScanFindingsRequestToJson(
    DescribeImageScanFindingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$DescribeImagesRequestToJson(
    DescribeImagesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('filter', instance.filter?.toJson());
  writeNotNull(
      'imageIds', instance.imageIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('registryId', instance.registryId);
  return val;
}

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

Map<String, dynamic> _$DescribeRepositoriesRequestToJson(
    DescribeRepositoriesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('registryId', instance.registryId);
  writeNotNull('repositoryNames', instance.repositoryNames);
  return val;
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

Map<String, dynamic> _$GetAuthorizationTokenRequestToJson(
    GetAuthorizationTokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('registryIds', instance.registryIds);
  return val;
}

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

Map<String, dynamic> _$GetDownloadUrlForLayerRequestToJson(
    GetDownloadUrlForLayerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('layerDigest', instance.layerDigest);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
}

GetDownloadUrlForLayerResponse _$GetDownloadUrlForLayerResponseFromJson(
    Map<String, dynamic> json) {
  return GetDownloadUrlForLayerResponse(
    downloadUrl: json['downloadUrl'] as String,
    layerDigest: json['layerDigest'] as String,
  );
}

Map<String, dynamic> _$GetLifecyclePolicyPreviewRequestToJson(
    GetLifecyclePolicyPreviewRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('filter', instance.filter?.toJson());
  writeNotNull(
      'imageIds', instance.imageIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('registryId', instance.registryId);
  return val;
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

const _$LifecyclePolicyPreviewStatusEnumMap = {
  LifecyclePolicyPreviewStatus.inProgress: 'IN_PROGRESS',
  LifecyclePolicyPreviewStatus.complete: 'COMPLETE',
  LifecyclePolicyPreviewStatus.expired: 'EXPIRED',
  LifecyclePolicyPreviewStatus.failed: 'FAILED',
};

Map<String, dynamic> _$GetLifecyclePolicyRequestToJson(
    GetLifecyclePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
}

GetLifecyclePolicyResponse _$GetLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyResponse(
    lastEvaluatedAt: unixTimestampFromJson(json['lastEvaluatedAt']),
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Map<String, dynamic> _$GetRepositoryPolicyRequestToJson(
    GetRepositoryPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

ImageDetail _$ImageDetailFromJson(Map<String, dynamic> json) {
  return ImageDetail(
    imageDigest: json['imageDigest'] as String,
    imagePushedAt: unixTimestampFromJson(json['imagePushedAt']),
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
      (k, e) => MapEntry(k, e as int),
    ),
    findings: (json['findings'] as List)
        ?.map((e) => e == null
            ? null
            : ImageScanFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageScanCompletedAt: unixTimestampFromJson(json['imageScanCompletedAt']),
    vulnerabilitySourceUpdatedAt:
        unixTimestampFromJson(json['vulnerabilitySourceUpdatedAt']),
  );
}

ImageScanFindingsSummary _$ImageScanFindingsSummaryFromJson(
    Map<String, dynamic> json) {
  return ImageScanFindingsSummary(
    findingSeverityCounts:
        (json['findingSeverityCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    imageScanCompletedAt: unixTimestampFromJson(json['imageScanCompletedAt']),
    vulnerabilitySourceUpdatedAt:
        unixTimestampFromJson(json['vulnerabilitySourceUpdatedAt']),
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

Map<String, dynamic> _$InitiateLayerUploadRequestToJson(
    InitiateLayerUploadRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
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
    imagePushedAt: unixTimestampFromJson(json['imagePushedAt']),
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

Map<String, dynamic> _$ListImagesRequestToJson(ListImagesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('filter', instance.filter?.toJson());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('registryId', instance.registryId);
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

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceArn', instance.resourceArn);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PutImageRequestToJson(PutImageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageManifest', instance.imageManifest);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('imageTag', instance.imageTag);
  writeNotNull('registryId', instance.registryId);
  return val;
}

PutImageResponse _$PutImageResponseFromJson(Map<String, dynamic> json) {
  return PutImageResponse(
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutImageScanningConfigurationRequestToJson(
    PutImageScanningConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageScanningConfiguration',
      instance.imageScanningConfiguration?.toJson());
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$PutImageTagMutabilityRequestToJson(
    PutImageTagMutabilityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageTagMutability',
      _$ImageTagMutabilityEnumMap[instance.imageTagMutability]);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$PutLifecyclePolicyRequestToJson(
    PutLifecyclePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lifecyclePolicyText', instance.lifecyclePolicyText);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
}

PutLifecyclePolicyResponse _$PutLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutLifecyclePolicyResponse(
    lifecyclePolicyText: json['lifecyclePolicyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    createdAt: unixTimestampFromJson(json['createdAt']),
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

Map<String, dynamic> _$SetRepositoryPolicyRequestToJson(
    SetRepositoryPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('policyText', instance.policyText);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('force', instance.force);
  writeNotNull('registryId', instance.registryId);
  return val;
}

SetRepositoryPolicyResponse _$SetRepositoryPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return SetRepositoryPolicyResponse(
    policyText: json['policyText'] as String,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Map<String, dynamic> _$StartImageScanRequestToJson(
    StartImageScanRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$StartLifecyclePolicyPreviewRequestToJson(
    StartLifecyclePolicyPreviewRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('lifecyclePolicyText', instance.lifecyclePolicyText);
  writeNotNull('registryId', instance.registryId);
  return val;
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceArn', instance.resourceArn);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceArn', instance.resourceArn);
  writeNotNull('tagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UploadLayerPartRequestToJson(
    UploadLayerPartRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('layerPartBlob',
      const Uint8ListConverter().toJson(instance.layerPartBlob));
  writeNotNull('partFirstByte', instance.partFirstByte);
  writeNotNull('partLastByte', instance.partLastByte);
  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('uploadId', instance.uploadId);
  writeNotNull('registryId', instance.registryId);
  return val;
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
