// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-10-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationData _$AuthorizationDataFromJson(Map<String, dynamic> json) {
  return AuthorizationData(
    authorizationToken: json['authorizationToken'] as String,
    expiresAt: const UnixDateTimeConverter().fromJson(json['expiresAt']),
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
    catalogData: json['catalogData'] == null
        ? null
        : RepositoryCatalogData.fromJson(
            json['catalogData'] as Map<String, dynamic>),
    repository: json['repository'] == null
        ? null
        : Repository.fromJson(json['repository'] as Map<String, dynamic>),
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

DescribeImageTagsResponse _$DescribeImageTagsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImageTagsResponse(
    imageTagDetails: (json['imageTagDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ImageTagDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
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

DescribeRegistriesResponse _$DescribeRegistriesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRegistriesResponse(
    registries: (json['registries'] as List)
        ?.map((e) =>
            e == null ? null : Registry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

GetAuthorizationTokenResponse _$GetAuthorizationTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetAuthorizationTokenResponse(
    authorizationData: json['authorizationData'] == null
        ? null
        : AuthorizationData.fromJson(
            json['authorizationData'] as Map<String, dynamic>),
  );
}

GetRegistryCatalogDataResponse _$GetRegistryCatalogDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegistryCatalogDataResponse(
    registryCatalogData: json['registryCatalogData'] == null
        ? null
        : RegistryCatalogData.fromJson(
            json['registryCatalogData'] as Map<String, dynamic>),
  );
}

GetRepositoryCatalogDataResponse _$GetRepositoryCatalogDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetRepositoryCatalogDataResponse(
    catalogData: json['catalogData'] == null
        ? null
        : RepositoryCatalogData.fromJson(
            json['catalogData'] as Map<String, dynamic>),
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

ImageTagDetail _$ImageTagDetailFromJson(Map<String, dynamic> json) {
  return ImageTagDetail(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    imageDetail: json['imageDetail'] == null
        ? null
        : ReferencedImageDetail.fromJson(
            json['imageDetail'] as Map<String, dynamic>),
    imageTag: json['imageTag'] as String,
  );
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

PutImageResponse _$PutImageResponseFromJson(Map<String, dynamic> json) {
  return PutImageResponse(
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

PutRegistryCatalogDataResponse _$PutRegistryCatalogDataResponseFromJson(
    Map<String, dynamic> json) {
  return PutRegistryCatalogDataResponse(
    registryCatalogData: json['registryCatalogData'] == null
        ? null
        : RegistryCatalogData.fromJson(
            json['registryCatalogData'] as Map<String, dynamic>),
  );
}

PutRepositoryCatalogDataResponse _$PutRepositoryCatalogDataResponseFromJson(
    Map<String, dynamic> json) {
  return PutRepositoryCatalogDataResponse(
    catalogData: json['catalogData'] == null
        ? null
        : RepositoryCatalogData.fromJson(
            json['catalogData'] as Map<String, dynamic>),
  );
}

ReferencedImageDetail _$ReferencedImageDetailFromJson(
    Map<String, dynamic> json) {
  return ReferencedImageDetail(
    artifactMediaType: json['artifactMediaType'] as String,
    imageDigest: json['imageDigest'] as String,
    imageManifestMediaType: json['imageManifestMediaType'] as String,
    imagePushedAt:
        const UnixDateTimeConverter().fromJson(json['imagePushedAt']),
    imageSizeInBytes: json['imageSizeInBytes'] as int,
  );
}

Registry _$RegistryFromJson(Map<String, dynamic> json) {
  return Registry(
    aliases: (json['aliases'] as List)
        ?.map((e) => e == null
            ? null
            : RegistryAlias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    registryArn: json['registryArn'] as String,
    registryId: json['registryId'] as String,
    registryUri: json['registryUri'] as String,
    verified: json['verified'] as bool,
  );
}

RegistryAlias _$RegistryAliasFromJson(Map<String, dynamic> json) {
  return RegistryAlias(
    defaultRegistryAlias: json['defaultRegistryAlias'] as bool,
    name: json['name'] as String,
    primaryRegistryAlias: json['primaryRegistryAlias'] as bool,
    status: _$enumDecodeNullable(_$RegistryAliasStatusEnumMap, json['status']),
  );
}

const _$RegistryAliasStatusEnumMap = {
  RegistryAliasStatus.active: 'ACTIVE',
  RegistryAliasStatus.pending: 'PENDING',
  RegistryAliasStatus.rejected: 'REJECTED',
};

RegistryCatalogData _$RegistryCatalogDataFromJson(Map<String, dynamic> json) {
  return RegistryCatalogData(
    displayName: json['displayName'] as String,
  );
}

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    registryId: json['registryId'] as String,
    repositoryArn: json['repositoryArn'] as String,
    repositoryName: json['repositoryName'] as String,
    repositoryUri: json['repositoryUri'] as String,
  );
}

RepositoryCatalogData _$RepositoryCatalogDataFromJson(
    Map<String, dynamic> json) {
  return RepositoryCatalogData(
    aboutText: json['aboutText'] as String,
    architectures:
        (json['architectures'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
    logoUrl: json['logoUrl'] as String,
    marketplaceCertified: json['marketplaceCertified'] as bool,
    operatingSystems:
        (json['operatingSystems'] as List)?.map((e) => e as String)?.toList(),
    usageText: json['usageText'] as String,
  );
}

Map<String, dynamic> _$RepositoryCatalogDataInputToJson(
    RepositoryCatalogDataInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aboutText', instance.aboutText);
  writeNotNull('architectures', instance.architectures);
  writeNotNull('description', instance.description);
  writeNotNull('logoImageBlob',
      const Uint8ListConverter().toJson(instance.logoImageBlob));
  writeNotNull('operatingSystems', instance.operatingSystems);
  writeNotNull('usageText', instance.usageText);
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

UploadLayerPartResponse _$UploadLayerPartResponseFromJson(
    Map<String, dynamic> json) {
  return UploadLayerPartResponse(
    lastByteReceived: json['lastByteReceived'] as int,
    registryId: json['registryId'] as String,
    repositoryName: json['repositoryName'] as String,
    uploadId: json['uploadId'] as String,
  );
}
