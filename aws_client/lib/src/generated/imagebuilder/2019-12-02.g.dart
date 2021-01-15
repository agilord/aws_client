// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-12-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ami _$AmiFromJson(Map<String, dynamic> json) {
  return Ami(
    accountId: json['accountId'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
    name: json['name'] as String,
    region: json['region'] as String,
    state: json['state'] == null
        ? null
        : ImageState.fromJson(json['state'] as Map<String, dynamic>),
  );
}

AmiDistributionConfiguration _$AmiDistributionConfigurationFromJson(
    Map<String, dynamic> json) {
  return AmiDistributionConfiguration(
    amiTags: (json['amiTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['description'] as String,
    kmsKeyId: json['kmsKeyId'] as String,
    launchPermission: json['launchPermission'] == null
        ? null
        : LaunchPermissionConfiguration.fromJson(
            json['launchPermission'] as Map<String, dynamic>),
    name: json['name'] as String,
    targetAccountIds:
        (json['targetAccountIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AmiDistributionConfigurationToJson(
    AmiDistributionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amiTags', instance.amiTags);
  writeNotNull('description', instance.description);
  writeNotNull('kmsKeyId', instance.kmsKeyId);
  writeNotNull('launchPermission', instance.launchPermission?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('targetAccountIds', instance.targetAccountIds);
  return val;
}

CancelImageCreationResponse _$CancelImageCreationResponseFromJson(
    Map<String, dynamic> json) {
  return CancelImageCreationResponse(
    clientToken: json['clientToken'] as String,
    imageBuildVersionArn: json['imageBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
    arn: json['arn'] as String,
    changeDescription: json['changeDescription'] as String,
    data: json['data'] as String,
    dateCreated: json['dateCreated'] as String,
    description: json['description'] as String,
    encrypted: json['encrypted'] as bool,
    kmsKeyId: json['kmsKeyId'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    supportedOsVersions: (json['supportedOsVersions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ComponentTypeEnumMap, json['type']),
    version: json['version'] as String,
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

const _$PlatformEnumMap = {
  Platform.windows: 'Windows',
  Platform.linux: 'Linux',
};

const _$ComponentTypeEnumMap = {
  ComponentType.build: 'BUILD',
  ComponentType.test: 'TEST',
};

ComponentConfiguration _$ComponentConfigurationFromJson(
    Map<String, dynamic> json) {
  return ComponentConfiguration(
    componentArn: json['componentArn'] as String,
  );
}

Map<String, dynamic> _$ComponentConfigurationToJson(
    ComponentConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('componentArn', instance.componentArn);
  return val;
}

ComponentSummary _$ComponentSummaryFromJson(Map<String, dynamic> json) {
  return ComponentSummary(
    arn: json['arn'] as String,
    changeDescription: json['changeDescription'] as String,
    dateCreated: json['dateCreated'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    supportedOsVersions: (json['supportedOsVersions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ComponentTypeEnumMap, json['type']),
    version: json['version'] as String,
  );
}

ComponentVersion _$ComponentVersionFromJson(Map<String, dynamic> json) {
  return ComponentVersion(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    supportedOsVersions: (json['supportedOsVersions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    type: _$enumDecodeNullable(_$ComponentTypeEnumMap, json['type']),
    version: json['version'] as String,
  );
}

Container _$ContainerFromJson(Map<String, dynamic> json) {
  return Container(
    imageUris: (json['imageUris'] as List)?.map((e) => e as String)?.toList(),
    region: json['region'] as String,
  );
}

ContainerDistributionConfiguration _$ContainerDistributionConfigurationFromJson(
    Map<String, dynamic> json) {
  return ContainerDistributionConfiguration(
    targetRepository: json['targetRepository'] == null
        ? null
        : TargetContainerRepository.fromJson(
            json['targetRepository'] as Map<String, dynamic>),
    containerTags:
        (json['containerTags'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ContainerDistributionConfigurationToJson(
    ContainerDistributionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetRepository', instance.targetRepository?.toJson());
  writeNotNull('containerTags', instance.containerTags);
  writeNotNull('description', instance.description);
  return val;
}

ContainerRecipe _$ContainerRecipeFromJson(Map<String, dynamic> json) {
  return ContainerRecipe(
    arn: json['arn'] as String,
    components: (json['components'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    containerType:
        _$enumDecodeNullable(_$ContainerTypeEnumMap, json['containerType']),
    dateCreated: json['dateCreated'] as String,
    description: json['description'] as String,
    dockerfileTemplateData: json['dockerfileTemplateData'] as String,
    encrypted: json['encrypted'] as bool,
    kmsKeyId: json['kmsKeyId'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    parentImage: json['parentImage'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    targetRepository: json['targetRepository'] == null
        ? null
        : TargetContainerRepository.fromJson(
            json['targetRepository'] as Map<String, dynamic>),
    version: json['version'] as String,
    workingDirectory: json['workingDirectory'] as String,
  );
}

const _$ContainerTypeEnumMap = {
  ContainerType.docker: 'DOCKER',
};

ContainerRecipeSummary _$ContainerRecipeSummaryFromJson(
    Map<String, dynamic> json) {
  return ContainerRecipeSummary(
    arn: json['arn'] as String,
    containerType:
        _$enumDecodeNullable(_$ContainerTypeEnumMap, json['containerType']),
    dateCreated: json['dateCreated'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    parentImage: json['parentImage'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateComponentResponse _$CreateComponentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateComponentResponse(
    clientToken: json['clientToken'] as String,
    componentBuildVersionArn: json['componentBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateContainerRecipeResponse _$CreateContainerRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContainerRecipeResponse(
    clientToken: json['clientToken'] as String,
    containerRecipeArn: json['containerRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateDistributionConfigurationResponse
    _$CreateDistributionConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateDistributionConfigurationResponse(
    clientToken: json['clientToken'] as String,
    distributionConfigurationArn:
        json['distributionConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateImagePipelineResponse _$CreateImagePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return CreateImagePipelineResponse(
    clientToken: json['clientToken'] as String,
    imagePipelineArn: json['imagePipelineArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateImageRecipeResponse _$CreateImageRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateImageRecipeResponse(
    clientToken: json['clientToken'] as String,
    imageRecipeArn: json['imageRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateImageResponse _$CreateImageResponseFromJson(Map<String, dynamic> json) {
  return CreateImageResponse(
    clientToken: json['clientToken'] as String,
    imageBuildVersionArn: json['imageBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

CreateInfrastructureConfigurationResponse
    _$CreateInfrastructureConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateInfrastructureConfigurationResponse(
    clientToken: json['clientToken'] as String,
    infrastructureConfigurationArn:
        json['infrastructureConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteComponentResponse _$DeleteComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteComponentResponse(
    componentBuildVersionArn: json['componentBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteContainerRecipeResponse _$DeleteContainerRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteContainerRecipeResponse(
    containerRecipeArn: json['containerRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteDistributionConfigurationResponse
    _$DeleteDistributionConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteDistributionConfigurationResponse(
    distributionConfigurationArn:
        json['distributionConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteImagePipelineResponse _$DeleteImagePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteImagePipelineResponse(
    imagePipelineArn: json['imagePipelineArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteImageRecipeResponse _$DeleteImageRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteImageRecipeResponse(
    imageRecipeArn: json['imageRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteImageResponse _$DeleteImageResponseFromJson(Map<String, dynamic> json) {
  return DeleteImageResponse(
    imageBuildVersionArn: json['imageBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

DeleteInfrastructureConfigurationResponse
    _$DeleteInfrastructureConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteInfrastructureConfigurationResponse(
    infrastructureConfigurationArn:
        json['infrastructureConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}

Distribution _$DistributionFromJson(Map<String, dynamic> json) {
  return Distribution(
    region: json['region'] as String,
    amiDistributionConfiguration: json['amiDistributionConfiguration'] == null
        ? null
        : AmiDistributionConfiguration.fromJson(
            json['amiDistributionConfiguration'] as Map<String, dynamic>),
    containerDistributionConfiguration:
        json['containerDistributionConfiguration'] == null
            ? null
            : ContainerDistributionConfiguration.fromJson(
                json['containerDistributionConfiguration']
                    as Map<String, dynamic>),
    licenseConfigurationArns: (json['licenseConfigurationArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$DistributionToJson(Distribution instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('region', instance.region);
  writeNotNull('amiDistributionConfiguration',
      instance.amiDistributionConfiguration?.toJson());
  writeNotNull('containerDistributionConfiguration',
      instance.containerDistributionConfiguration?.toJson());
  writeNotNull('licenseConfigurationArns', instance.licenseConfigurationArns);
  return val;
}

DistributionConfiguration _$DistributionConfigurationFromJson(
    Map<String, dynamic> json) {
  return DistributionConfiguration(
    timeoutMinutes: json['timeoutMinutes'] as int,
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    dateUpdated: json['dateUpdated'] as String,
    description: json['description'] as String,
    distributions: (json['distributions'] as List)
        ?.map((e) =>
            e == null ? null : Distribution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DistributionConfigurationSummary _$DistributionConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return DistributionConfigurationSummary(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    dateUpdated: json['dateUpdated'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    regions: (json['regions'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EbsInstanceBlockDeviceSpecification
    _$EbsInstanceBlockDeviceSpecificationFromJson(Map<String, dynamic> json) {
  return EbsInstanceBlockDeviceSpecification(
    deleteOnTermination: json['deleteOnTermination'] as bool,
    encrypted: json['encrypted'] as bool,
    iops: json['iops'] as int,
    kmsKeyId: json['kmsKeyId'] as String,
    snapshotId: json['snapshotId'] as String,
    volumeSize: json['volumeSize'] as int,
    volumeType:
        _$enumDecodeNullable(_$EbsVolumeTypeEnumMap, json['volumeType']),
  );
}

Map<String, dynamic> _$EbsInstanceBlockDeviceSpecificationToJson(
    EbsInstanceBlockDeviceSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deleteOnTermination', instance.deleteOnTermination);
  writeNotNull('encrypted', instance.encrypted);
  writeNotNull('iops', instance.iops);
  writeNotNull('kmsKeyId', instance.kmsKeyId);
  writeNotNull('snapshotId', instance.snapshotId);
  writeNotNull('volumeSize', instance.volumeSize);
  writeNotNull('volumeType', _$EbsVolumeTypeEnumMap[instance.volumeType]);
  return val;
}

const _$EbsVolumeTypeEnumMap = {
  EbsVolumeType.standard: 'standard',
  EbsVolumeType.io1: 'io1',
  EbsVolumeType.io2: 'io2',
  EbsVolumeType.gp2: 'gp2',
  EbsVolumeType.sc1: 'sc1',
  EbsVolumeType.st1: 'st1',
};

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

GetComponentPolicyResponse _$GetComponentPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetComponentPolicyResponse(
    policy: json['policy'] as String,
    requestId: json['requestId'] as String,
  );
}

GetComponentResponse _$GetComponentResponseFromJson(Map<String, dynamic> json) {
  return GetComponentResponse(
    component: json['component'] == null
        ? null
        : Component.fromJson(json['component'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetContainerRecipePolicyResponse _$GetContainerRecipePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetContainerRecipePolicyResponse(
    policy: json['policy'] as String,
    requestId: json['requestId'] as String,
  );
}

GetContainerRecipeResponse _$GetContainerRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return GetContainerRecipeResponse(
    containerRecipe: json['containerRecipe'] == null
        ? null
        : ContainerRecipe.fromJson(
            json['containerRecipe'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetDistributionConfigurationResponse
    _$GetDistributionConfigurationResponseFromJson(Map<String, dynamic> json) {
  return GetDistributionConfigurationResponse(
    distributionConfiguration: json['distributionConfiguration'] == null
        ? null
        : DistributionConfiguration.fromJson(
            json['distributionConfiguration'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetImagePipelineResponse _$GetImagePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return GetImagePipelineResponse(
    imagePipeline: json['imagePipeline'] == null
        ? null
        : ImagePipeline.fromJson(json['imagePipeline'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetImagePolicyResponse _$GetImagePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetImagePolicyResponse(
    policy: json['policy'] as String,
    requestId: json['requestId'] as String,
  );
}

GetImageRecipePolicyResponse _$GetImageRecipePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetImageRecipePolicyResponse(
    policy: json['policy'] as String,
    requestId: json['requestId'] as String,
  );
}

GetImageRecipeResponse _$GetImageRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return GetImageRecipeResponse(
    imageRecipe: json['imageRecipe'] == null
        ? null
        : ImageRecipe.fromJson(json['imageRecipe'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetImageResponse _$GetImageResponseFromJson(Map<String, dynamic> json) {
  return GetImageResponse(
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

GetInfrastructureConfigurationResponse
    _$GetInfrastructureConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetInfrastructureConfigurationResponse(
    infrastructureConfiguration: json['infrastructureConfiguration'] == null
        ? null
        : InfrastructureConfiguration.fromJson(
            json['infrastructureConfiguration'] as Map<String, dynamic>),
    requestId: json['requestId'] as String,
  );
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    arn: json['arn'] as String,
    containerRecipe: json['containerRecipe'] == null
        ? null
        : ContainerRecipe.fromJson(
            json['containerRecipe'] as Map<String, dynamic>),
    dateCreated: json['dateCreated'] as String,
    distributionConfiguration: json['distributionConfiguration'] == null
        ? null
        : DistributionConfiguration.fromJson(
            json['distributionConfiguration'] as Map<String, dynamic>),
    enhancedImageMetadataEnabled: json['enhancedImageMetadataEnabled'] as bool,
    imageRecipe: json['imageRecipe'] == null
        ? null
        : ImageRecipe.fromJson(json['imageRecipe'] as Map<String, dynamic>),
    imageTestsConfiguration: json['imageTestsConfiguration'] == null
        ? null
        : ImageTestsConfiguration.fromJson(
            json['imageTestsConfiguration'] as Map<String, dynamic>),
    infrastructureConfiguration: json['infrastructureConfiguration'] == null
        ? null
        : InfrastructureConfiguration.fromJson(
            json['infrastructureConfiguration'] as Map<String, dynamic>),
    name: json['name'] as String,
    osVersion: json['osVersion'] as String,
    outputResources: json['outputResources'] == null
        ? null
        : OutputResources.fromJson(
            json['outputResources'] as Map<String, dynamic>),
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    sourcePipelineArn: json['sourcePipelineArn'] as String,
    sourcePipelineName: json['sourcePipelineName'] as String,
    state: json['state'] == null
        ? null
        : ImageState.fromJson(json['state'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ImageTypeEnumMap, json['type']),
    version: json['version'] as String,
  );
}

const _$ImageTypeEnumMap = {
  ImageType.ami: 'AMI',
  ImageType.docker: 'DOCKER',
};

ImagePipeline _$ImagePipelineFromJson(Map<String, dynamic> json) {
  return ImagePipeline(
    arn: json['arn'] as String,
    containerRecipeArn: json['containerRecipeArn'] as String,
    dateCreated: json['dateCreated'] as String,
    dateLastRun: json['dateLastRun'] as String,
    dateNextRun: json['dateNextRun'] as String,
    dateUpdated: json['dateUpdated'] as String,
    description: json['description'] as String,
    distributionConfigurationArn:
        json['distributionConfigurationArn'] as String,
    enhancedImageMetadataEnabled: json['enhancedImageMetadataEnabled'] as bool,
    imageRecipeArn: json['imageRecipeArn'] as String,
    imageTestsConfiguration: json['imageTestsConfiguration'] == null
        ? null
        : ImageTestsConfiguration.fromJson(
            json['imageTestsConfiguration'] as Map<String, dynamic>),
    infrastructureConfigurationArn:
        json['infrastructureConfigurationArn'] as String,
    name: json['name'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    schedule: json['schedule'] == null
        ? null
        : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$PipelineStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$PipelineStatusEnumMap = {
  PipelineStatus.disabled: 'DISABLED',
  PipelineStatus.enabled: 'ENABLED',
};

ImageRecipe _$ImageRecipeFromJson(Map<String, dynamic> json) {
  return ImageRecipe(
    arn: json['arn'] as String,
    blockDeviceMappings: (json['blockDeviceMappings'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceBlockDeviceMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    components: (json['components'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dateCreated: json['dateCreated'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    parentImage: json['parentImage'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ImageTypeEnumMap, json['type']),
    version: json['version'] as String,
    workingDirectory: json['workingDirectory'] as String,
  );
}

ImageRecipeSummary _$ImageRecipeSummaryFromJson(Map<String, dynamic> json) {
  return ImageRecipeSummary(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    name: json['name'] as String,
    owner: json['owner'] as String,
    parentImage: json['parentImage'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ImageState _$ImageStateFromJson(Map<String, dynamic> json) {
  return ImageState(
    reason: json['reason'] as String,
    status: _$enumDecodeNullable(_$ImageStatusEnumMap, json['status']),
  );
}

const _$ImageStatusEnumMap = {
  ImageStatus.pending: 'PENDING',
  ImageStatus.creating: 'CREATING',
  ImageStatus.building: 'BUILDING',
  ImageStatus.testing: 'TESTING',
  ImageStatus.distributing: 'DISTRIBUTING',
  ImageStatus.integrating: 'INTEGRATING',
  ImageStatus.available: 'AVAILABLE',
  ImageStatus.cancelled: 'CANCELLED',
  ImageStatus.failed: 'FAILED',
  ImageStatus.deprecated: 'DEPRECATED',
  ImageStatus.deleted: 'DELETED',
};

ImageSummary _$ImageSummaryFromJson(Map<String, dynamic> json) {
  return ImageSummary(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    name: json['name'] as String,
    osVersion: json['osVersion'] as String,
    outputResources: json['outputResources'] == null
        ? null
        : OutputResources.fromJson(
            json['outputResources'] as Map<String, dynamic>),
    owner: json['owner'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    state: json['state'] == null
        ? null
        : ImageState.fromJson(json['state'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ImageTypeEnumMap, json['type']),
    version: json['version'] as String,
  );
}

ImageTestsConfiguration _$ImageTestsConfigurationFromJson(
    Map<String, dynamic> json) {
  return ImageTestsConfiguration(
    imageTestsEnabled: json['imageTestsEnabled'] as bool,
    timeoutMinutes: json['timeoutMinutes'] as int,
  );
}

Map<String, dynamic> _$ImageTestsConfigurationToJson(
    ImageTestsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageTestsEnabled', instance.imageTestsEnabled);
  writeNotNull('timeoutMinutes', instance.timeoutMinutes);
  return val;
}

ImageVersion _$ImageVersionFromJson(Map<String, dynamic> json) {
  return ImageVersion(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    name: json['name'] as String,
    osVersion: json['osVersion'] as String,
    owner: json['owner'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    type: _$enumDecodeNullable(_$ImageTypeEnumMap, json['type']),
    version: json['version'] as String,
  );
}

ImportComponentResponse _$ImportComponentResponseFromJson(
    Map<String, dynamic> json) {
  return ImportComponentResponse(
    clientToken: json['clientToken'] as String,
    componentBuildVersionArn: json['componentBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

InfrastructureConfiguration _$InfrastructureConfigurationFromJson(
    Map<String, dynamic> json) {
  return InfrastructureConfiguration(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    dateUpdated: json['dateUpdated'] as String,
    description: json['description'] as String,
    instanceProfileName: json['instanceProfileName'] as String,
    instanceTypes:
        (json['instanceTypes'] as List)?.map((e) => e as String)?.toList(),
    keyPair: json['keyPair'] as String,
    logging: json['logging'] == null
        ? null
        : Logging.fromJson(json['logging'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceTags: (json['resourceTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    snsTopicArn: json['snsTopicArn'] as String,
    subnetId: json['subnetId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    terminateInstanceOnFailure: json['terminateInstanceOnFailure'] as bool,
  );
}

InfrastructureConfigurationSummary _$InfrastructureConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return InfrastructureConfigurationSummary(
    arn: json['arn'] as String,
    dateCreated: json['dateCreated'] as String,
    dateUpdated: json['dateUpdated'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    resourceTags: (json['resourceTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

InstanceBlockDeviceMapping _$InstanceBlockDeviceMappingFromJson(
    Map<String, dynamic> json) {
  return InstanceBlockDeviceMapping(
    deviceName: json['deviceName'] as String,
    ebs: json['ebs'] == null
        ? null
        : EbsInstanceBlockDeviceSpecification.fromJson(
            json['ebs'] as Map<String, dynamic>),
    noDevice: json['noDevice'] as String,
    virtualName: json['virtualName'] as String,
  );
}

Map<String, dynamic> _$InstanceBlockDeviceMappingToJson(
    InstanceBlockDeviceMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceName', instance.deviceName);
  writeNotNull('ebs', instance.ebs?.toJson());
  writeNotNull('noDevice', instance.noDevice);
  writeNotNull('virtualName', instance.virtualName);
  return val;
}

LaunchPermissionConfiguration _$LaunchPermissionConfigurationFromJson(
    Map<String, dynamic> json) {
  return LaunchPermissionConfiguration(
    userGroups: (json['userGroups'] as List)?.map((e) => e as String)?.toList(),
    userIds: (json['userIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LaunchPermissionConfigurationToJson(
    LaunchPermissionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userGroups', instance.userGroups);
  writeNotNull('userIds', instance.userIds);
  return val;
}

ListComponentBuildVersionsResponse _$ListComponentBuildVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListComponentBuildVersionsResponse(
    componentSummaryList: (json['componentSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListComponentsResponse _$ListComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListComponentsResponse(
    componentVersionList: (json['componentVersionList'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListContainerRecipesResponse _$ListContainerRecipesResponseFromJson(
    Map<String, dynamic> json) {
  return ListContainerRecipesResponse(
    containerRecipeSummaryList: (json['containerRecipeSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerRecipeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListDistributionConfigurationsResponse
    _$ListDistributionConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return ListDistributionConfigurationsResponse(
    distributionConfigurationSummaryList:
        (json['distributionConfigurationSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : DistributionConfigurationSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListImageBuildVersionsResponse _$ListImageBuildVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListImageBuildVersionsResponse(
    imageSummaryList: (json['imageSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : ImageSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListImagePipelineImagesResponse _$ListImagePipelineImagesResponseFromJson(
    Map<String, dynamic> json) {
  return ListImagePipelineImagesResponse(
    imageSummaryList: (json['imageSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : ImageSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListImagePipelinesResponse _$ListImagePipelinesResponseFromJson(
    Map<String, dynamic> json) {
  return ListImagePipelinesResponse(
    imagePipelineList: (json['imagePipelineList'] as List)
        ?.map((e) => e == null
            ? null
            : ImagePipeline.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListImageRecipesResponse _$ListImageRecipesResponseFromJson(
    Map<String, dynamic> json) {
  return ListImageRecipesResponse(
    imageRecipeSummaryList: (json['imageRecipeSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ImageRecipeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListImagesResponse _$ListImagesResponseFromJson(Map<String, dynamic> json) {
  return ListImagesResponse(
    imageVersionList: (json['imageVersionList'] as List)
        ?.map((e) =>
            e == null ? null : ImageVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
  );
}

ListInfrastructureConfigurationsResponse
    _$ListInfrastructureConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return ListInfrastructureConfigurationsResponse(
    infrastructureConfigurationSummaryList:
        (json['infrastructureConfigurationSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : InfrastructureConfigurationSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
    requestId: json['requestId'] as String,
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

Logging _$LoggingFromJson(Map<String, dynamic> json) {
  return Logging(
    s3Logs: json['s3Logs'] == null
        ? null
        : S3Logs.fromJson(json['s3Logs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggingToJson(Logging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Logs', instance.s3Logs?.toJson());
  return val;
}

OutputResources _$OutputResourcesFromJson(Map<String, dynamic> json) {
  return OutputResources(
    amis: (json['amis'] as List)
        ?.map((e) => e == null ? null : Ami.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    containers: (json['containers'] as List)
        ?.map((e) =>
            e == null ? null : Container.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutComponentPolicyResponse _$PutComponentPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutComponentPolicyResponse(
    componentArn: json['componentArn'] as String,
    requestId: json['requestId'] as String,
  );
}

PutContainerRecipePolicyResponse _$PutContainerRecipePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutContainerRecipePolicyResponse(
    containerRecipeArn: json['containerRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

PutImagePolicyResponse _$PutImagePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutImagePolicyResponse(
    imageArn: json['imageArn'] as String,
    requestId: json['requestId'] as String,
  );
}

PutImageRecipePolicyResponse _$PutImageRecipePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutImageRecipePolicyResponse(
    imageRecipeArn: json['imageRecipeArn'] as String,
    requestId: json['requestId'] as String,
  );
}

S3Logs _$S3LogsFromJson(Map<String, dynamic> json) {
  return S3Logs(
    s3BucketName: json['s3BucketName'] as String,
    s3KeyPrefix: json['s3KeyPrefix'] as String,
  );
}

Map<String, dynamic> _$S3LogsToJson(S3Logs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3BucketName', instance.s3BucketName);
  writeNotNull('s3KeyPrefix', instance.s3KeyPrefix);
  return val;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    pipelineExecutionStartCondition: _$enumDecodeNullable(
        _$PipelineExecutionStartConditionEnumMap,
        json['pipelineExecutionStartCondition']),
    scheduleExpression: json['scheduleExpression'] as String,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'pipelineExecutionStartCondition',
      _$PipelineExecutionStartConditionEnumMap[
          instance.pipelineExecutionStartCondition]);
  writeNotNull('scheduleExpression', instance.scheduleExpression);
  return val;
}

const _$PipelineExecutionStartConditionEnumMap = {
  PipelineExecutionStartCondition.expressionMatchOnly: 'EXPRESSION_MATCH_ONLY',
  PipelineExecutionStartCondition.expressionMatchAndDependencyUpdatesAvailable:
      'EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE',
};

StartImagePipelineExecutionResponse
    _$StartImagePipelineExecutionResponseFromJson(Map<String, dynamic> json) {
  return StartImagePipelineExecutionResponse(
    clientToken: json['clientToken'] as String,
    imageBuildVersionArn: json['imageBuildVersionArn'] as String,
    requestId: json['requestId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TargetContainerRepository _$TargetContainerRepositoryFromJson(
    Map<String, dynamic> json) {
  return TargetContainerRepository(
    repositoryName: json['repositoryName'] as String,
    service: _$enumDecodeNullable(
        _$ContainerRepositoryServiceEnumMap, json['service']),
  );
}

Map<String, dynamic> _$TargetContainerRepositoryToJson(
    TargetContainerRepository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull(
      'service', _$ContainerRepositoryServiceEnumMap[instance.service]);
  return val;
}

const _$ContainerRepositoryServiceEnumMap = {
  ContainerRepositoryService.ecr: 'ECR',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDistributionConfigurationResponse
    _$UpdateDistributionConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateDistributionConfigurationResponse(
    clientToken: json['clientToken'] as String,
    distributionConfigurationArn:
        json['distributionConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}

UpdateImagePipelineResponse _$UpdateImagePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateImagePipelineResponse(
    clientToken: json['clientToken'] as String,
    imagePipelineArn: json['imagePipelineArn'] as String,
    requestId: json['requestId'] as String,
  );
}

UpdateInfrastructureConfigurationResponse
    _$UpdateInfrastructureConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateInfrastructureConfigurationResponse(
    clientToken: json['clientToken'] as String,
    infrastructureConfigurationArn:
        json['infrastructureConfigurationArn'] as String,
    requestId: json['requestId'] as String,
  );
}
