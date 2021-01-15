// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetSummary _$AssetSummaryFromJson(Map<String, dynamic> json) {
  return AssetSummary(
    name: json['name'] as String,
    hashes: (json['hashes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$HashAlgorithmEnumMap, k), e as String),
    ),
    size: json['size'] as int,
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

const _$HashAlgorithmEnumMap = {
  HashAlgorithm.md5: 'MD5',
  HashAlgorithm.sha_1: 'SHA-1',
  HashAlgorithm.sha_256: 'SHA-256',
  HashAlgorithm.sha_512: 'SHA-512',
};

AssociateExternalConnectionResult _$AssociateExternalConnectionResultFromJson(
    Map<String, dynamic> json) {
  return AssociateExternalConnectionResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

CopyPackageVersionsResult _$CopyPackageVersionsResultFromJson(
    Map<String, dynamic> json) {
  return CopyPackageVersionsResult(
    failedVersions: (json['failedVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PackageVersionError.fromJson(e as Map<String, dynamic>)),
    ),
    successfulVersions:
        (json['successfulVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>)),
    ),
  );
}

CreateDomainResult _$CreateDomainResultFromJson(Map<String, dynamic> json) {
  return CreateDomainResult(
    domain: json['domain'] == null
        ? null
        : DomainDescription.fromJson(json['domain'] as Map<String, dynamic>),
  );
}

CreateRepositoryResult _$CreateRepositoryResultFromJson(
    Map<String, dynamic> json) {
  return CreateRepositoryResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

DeleteDomainPermissionsPolicyResult
    _$DeleteDomainPermissionsPolicyResultFromJson(Map<String, dynamic> json) {
  return DeleteDomainPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

DeleteDomainResult _$DeleteDomainResultFromJson(Map<String, dynamic> json) {
  return DeleteDomainResult(
    domain: json['domain'] == null
        ? null
        : DomainDescription.fromJson(json['domain'] as Map<String, dynamic>),
  );
}

DeletePackageVersionsResult _$DeletePackageVersionsResultFromJson(
    Map<String, dynamic> json) {
  return DeletePackageVersionsResult(
    failedVersions: (json['failedVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PackageVersionError.fromJson(e as Map<String, dynamic>)),
    ),
    successfulVersions:
        (json['successfulVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>)),
    ),
  );
}

DeleteRepositoryPermissionsPolicyResult
    _$DeleteRepositoryPermissionsPolicyResultFromJson(
        Map<String, dynamic> json) {
  return DeleteRepositoryPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

DeleteRepositoryResult _$DeleteRepositoryResultFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

DescribeDomainResult _$DescribeDomainResultFromJson(Map<String, dynamic> json) {
  return DescribeDomainResult(
    domain: json['domain'] == null
        ? null
        : DomainDescription.fromJson(json['domain'] as Map<String, dynamic>),
  );
}

DescribePackageVersionResult _$DescribePackageVersionResultFromJson(
    Map<String, dynamic> json) {
  return DescribePackageVersionResult(
    packageVersion: json['packageVersion'] == null
        ? null
        : PackageVersionDescription.fromJson(
            json['packageVersion'] as Map<String, dynamic>),
  );
}

DescribeRepositoryResult _$DescribeRepositoryResultFromJson(
    Map<String, dynamic> json) {
  return DescribeRepositoryResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

DisassociateExternalConnectionResult
    _$DisassociateExternalConnectionResultFromJson(Map<String, dynamic> json) {
  return DisassociateExternalConnectionResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

DisposePackageVersionsResult _$DisposePackageVersionsResultFromJson(
    Map<String, dynamic> json) {
  return DisposePackageVersionsResult(
    failedVersions: (json['failedVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PackageVersionError.fromJson(e as Map<String, dynamic>)),
    ),
    successfulVersions:
        (json['successfulVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>)),
    ),
  );
}

DomainDescription _$DomainDescriptionFromJson(Map<String, dynamic> json) {
  return DomainDescription(
    arn: json['arn'] as String,
    assetSizeBytes: json['assetSizeBytes'] as int,
    createdTime: const UnixDateTimeConverter().fromJson(json['createdTime']),
    encryptionKey: json['encryptionKey'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    repositoryCount: json['repositoryCount'] as int,
    s3BucketArn: json['s3BucketArn'] as String,
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['status']),
  );
}

const _$DomainStatusEnumMap = {
  DomainStatus.active: 'Active',
  DomainStatus.deleted: 'Deleted',
};

DomainSummary _$DomainSummaryFromJson(Map<String, dynamic> json) {
  return DomainSummary(
    arn: json['arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['createdTime']),
    encryptionKey: json['encryptionKey'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['status']),
  );
}

GetAuthorizationTokenResult _$GetAuthorizationTokenResultFromJson(
    Map<String, dynamic> json) {
  return GetAuthorizationTokenResult(
    authorizationToken: json['authorizationToken'] as String,
    expiration: const UnixDateTimeConverter().fromJson(json['expiration']),
  );
}

GetDomainPermissionsPolicyResult _$GetDomainPermissionsPolicyResultFromJson(
    Map<String, dynamic> json) {
  return GetDomainPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

GetPackageVersionAssetResult _$GetPackageVersionAssetResultFromJson(
    Map<String, dynamic> json) {
  return GetPackageVersionAssetResult(
    asset: const Uint8ListConverter().fromJson(json['asset'] as String),
    assetName: json['X-AssetName'] as String,
    packageVersion: json['X-PackageVersion'] as String,
    packageVersionRevision: json['X-PackageVersionRevision'] as String,
  );
}

GetPackageVersionReadmeResult _$GetPackageVersionReadmeResultFromJson(
    Map<String, dynamic> json) {
  return GetPackageVersionReadmeResult(
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    namespace: json['namespace'] as String,
    package: json['package'] as String,
    readme: json['readme'] as String,
    version: json['version'] as String,
    versionRevision: json['versionRevision'] as String,
  );
}

const _$PackageFormatEnumMap = {
  PackageFormat.npm: 'npm',
  PackageFormat.pypi: 'pypi',
  PackageFormat.maven: 'maven',
  PackageFormat.nuget: 'nuget',
};

GetRepositoryEndpointResult _$GetRepositoryEndpointResultFromJson(
    Map<String, dynamic> json) {
  return GetRepositoryEndpointResult(
    repositoryEndpoint: json['repositoryEndpoint'] as String,
  );
}

GetRepositoryPermissionsPolicyResult
    _$GetRepositoryPermissionsPolicyResultFromJson(Map<String, dynamic> json) {
  return GetRepositoryPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

LicenseInfo _$LicenseInfoFromJson(Map<String, dynamic> json) {
  return LicenseInfo(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

ListDomainsResult _$ListDomainsResultFromJson(Map<String, dynamic> json) {
  return ListDomainsResult(
    domains: (json['domains'] as List)
        ?.map((e) => e == null
            ? null
            : DomainSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPackageVersionAssetsResult _$ListPackageVersionAssetsResultFromJson(
    Map<String, dynamic> json) {
  return ListPackageVersionAssetsResult(
    assets: (json['assets'] as List)
        ?.map((e) =>
            e == null ? null : AssetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    namespace: json['namespace'] as String,
    nextToken: json['nextToken'] as String,
    package: json['package'] as String,
    version: json['version'] as String,
    versionRevision: json['versionRevision'] as String,
  );
}

ListPackageVersionDependenciesResult
    _$ListPackageVersionDependenciesResultFromJson(Map<String, dynamic> json) {
  return ListPackageVersionDependenciesResult(
    dependencies: (json['dependencies'] as List)
        ?.map((e) => e == null
            ? null
            : PackageDependency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    namespace: json['namespace'] as String,
    nextToken: json['nextToken'] as String,
    package: json['package'] as String,
    version: json['version'] as String,
    versionRevision: json['versionRevision'] as String,
  );
}

ListPackageVersionsResult _$ListPackageVersionsResultFromJson(
    Map<String, dynamic> json) {
  return ListPackageVersionsResult(
    defaultDisplayVersion: json['defaultDisplayVersion'] as String,
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    namespace: json['namespace'] as String,
    nextToken: json['nextToken'] as String,
    package: json['package'] as String,
    versions: (json['versions'] as List)
        ?.map((e) => e == null
            ? null
            : PackageVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPackagesResult _$ListPackagesResultFromJson(Map<String, dynamic> json) {
  return ListPackagesResult(
    nextToken: json['nextToken'] as String,
    packages: (json['packages'] as List)
        ?.map((e) => e == null
            ? null
            : PackageSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRepositoriesInDomainResult _$ListRepositoriesInDomainResultFromJson(
    Map<String, dynamic> json) {
  return ListRepositoriesInDomainResult(
    nextToken: json['nextToken'] as String,
    repositories: (json['repositories'] as List)
        ?.map((e) => e == null
            ? null
            : RepositorySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRepositoriesResult _$ListRepositoriesResultFromJson(
    Map<String, dynamic> json) {
  return ListRepositoriesResult(
    nextToken: json['nextToken'] as String,
    repositories: (json['repositories'] as List)
        ?.map((e) => e == null
            ? null
            : RepositorySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PackageDependency _$PackageDependencyFromJson(Map<String, dynamic> json) {
  return PackageDependency(
    dependencyType: json['dependencyType'] as String,
    namespace: json['namespace'] as String,
    package: json['package'] as String,
    versionRequirement: json['versionRequirement'] as String,
  );
}

PackageSummary _$PackageSummaryFromJson(Map<String, dynamic> json) {
  return PackageSummary(
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    namespace: json['namespace'] as String,
    package: json['package'] as String,
  );
}

PackageVersionDescription _$PackageVersionDescriptionFromJson(
    Map<String, dynamic> json) {
  return PackageVersionDescription(
    displayName: json['displayName'] as String,
    format: _$enumDecodeNullable(_$PackageFormatEnumMap, json['format']),
    homePage: json['homePage'] as String,
    licenses: (json['licenses'] as List)
        ?.map((e) =>
            e == null ? null : LicenseInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    namespace: json['namespace'] as String,
    packageName: json['packageName'] as String,
    publishedTime:
        const UnixDateTimeConverter().fromJson(json['publishedTime']),
    revision: json['revision'] as String,
    sourceCodeRepository: json['sourceCodeRepository'] as String,
    status: _$enumDecodeNullable(_$PackageVersionStatusEnumMap, json['status']),
    summary: json['summary'] as String,
    version: json['version'] as String,
  );
}

const _$PackageVersionStatusEnumMap = {
  PackageVersionStatus.published: 'Published',
  PackageVersionStatus.unfinished: 'Unfinished',
  PackageVersionStatus.unlisted: 'Unlisted',
  PackageVersionStatus.archived: 'Archived',
  PackageVersionStatus.disposed: 'Disposed',
  PackageVersionStatus.deleted: 'Deleted',
};

PackageVersionError _$PackageVersionErrorFromJson(Map<String, dynamic> json) {
  return PackageVersionError(
    errorCode: _$enumDecodeNullable(
        _$PackageVersionErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
  );
}

const _$PackageVersionErrorCodeEnumMap = {
  PackageVersionErrorCode.alreadyExists: 'ALREADY_EXISTS',
  PackageVersionErrorCode.mismatchedRevision: 'MISMATCHED_REVISION',
  PackageVersionErrorCode.mismatchedStatus: 'MISMATCHED_STATUS',
  PackageVersionErrorCode.notAllowed: 'NOT_ALLOWED',
  PackageVersionErrorCode.notFound: 'NOT_FOUND',
  PackageVersionErrorCode.skipped: 'SKIPPED',
};

PackageVersionSummary _$PackageVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return PackageVersionSummary(
    status: _$enumDecodeNullable(_$PackageVersionStatusEnumMap, json['status']),
    version: json['version'] as String,
    revision: json['revision'] as String,
  );
}

PutDomainPermissionsPolicyResult _$PutDomainPermissionsPolicyResultFromJson(
    Map<String, dynamic> json) {
  return PutDomainPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

PutRepositoryPermissionsPolicyResult
    _$PutRepositoryPermissionsPolicyResultFromJson(Map<String, dynamic> json) {
  return PutRepositoryPermissionsPolicyResult(
    policy: json['policy'] == null
        ? null
        : ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>),
  );
}

RepositoryDescription _$RepositoryDescriptionFromJson(
    Map<String, dynamic> json) {
  return RepositoryDescription(
    administratorAccount: json['administratorAccount'] as String,
    arn: json['arn'] as String,
    description: json['description'] as String,
    domainName: json['domainName'] as String,
    domainOwner: json['domainOwner'] as String,
    externalConnections: (json['externalConnections'] as List)
        ?.map((e) => e == null
            ? null
            : RepositoryExternalConnectionInfo.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    upstreams: (json['upstreams'] as List)
        ?.map((e) => e == null
            ? null
            : UpstreamRepositoryInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RepositoryExternalConnectionInfo _$RepositoryExternalConnectionInfoFromJson(
    Map<String, dynamic> json) {
  return RepositoryExternalConnectionInfo(
    externalConnectionName: json['externalConnectionName'] as String,
    packageFormat:
        _$enumDecodeNullable(_$PackageFormatEnumMap, json['packageFormat']),
    status:
        _$enumDecodeNullable(_$ExternalConnectionStatusEnumMap, json['status']),
  );
}

const _$ExternalConnectionStatusEnumMap = {
  ExternalConnectionStatus.available: 'Available',
};

RepositorySummary _$RepositorySummaryFromJson(Map<String, dynamic> json) {
  return RepositorySummary(
    administratorAccount: json['administratorAccount'] as String,
    arn: json['arn'] as String,
    description: json['description'] as String,
    domainName: json['domainName'] as String,
    domainOwner: json['domainOwner'] as String,
    name: json['name'] as String,
  );
}

ResourcePolicy _$ResourcePolicyFromJson(Map<String, dynamic> json) {
  return ResourcePolicy(
    document: json['document'] as String,
    resourceArn: json['resourceArn'] as String,
    revision: json['revision'] as String,
  );
}

SuccessfulPackageVersionInfo _$SuccessfulPackageVersionInfoFromJson(
    Map<String, dynamic> json) {
  return SuccessfulPackageVersionInfo(
    revision: json['revision'] as String,
    status: _$enumDecodeNullable(_$PackageVersionStatusEnumMap, json['status']),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TagResourceResult _$TagResourceResultFromJson(Map<String, dynamic> json) {
  return TagResourceResult();
}

UntagResourceResult _$UntagResourceResultFromJson(Map<String, dynamic> json) {
  return UntagResourceResult();
}

UpdatePackageVersionsStatusResult _$UpdatePackageVersionsStatusResultFromJson(
    Map<String, dynamic> json) {
  return UpdatePackageVersionsStatusResult(
    failedVersions: (json['failedVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PackageVersionError.fromJson(e as Map<String, dynamic>)),
    ),
    successfulVersions:
        (json['successfulVersions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>)),
    ),
  );
}

UpdateRepositoryResult _$UpdateRepositoryResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRepositoryResult(
    repository: json['repository'] == null
        ? null
        : RepositoryDescription.fromJson(
            json['repository'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpstreamRepositoryToJson(UpstreamRepository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  return val;
}

UpstreamRepositoryInfo _$UpstreamRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return UpstreamRepositoryInfo(
    repositoryName: json['repositoryName'] as String,
  );
}
