// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addon _$AddonFromJson(Map<String, dynamic> json) {
  return Addon(
    addonArn: json['addonArn'] as String,
    addonName: json['addonName'] as String,
    addonVersion: json['addonVersion'] as String,
    clusterName: json['clusterName'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    health: json['health'] == null
        ? null
        : AddonHealth.fromJson(json['health'] as Map<String, dynamic>),
    modifiedAt: const UnixDateTimeConverter().fromJson(json['modifiedAt']),
    serviceAccountRoleArn: json['serviceAccountRoleArn'] as String,
    status: _$enumDecodeNullable(_$AddonStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

const _$AddonStatusEnumMap = {
  AddonStatus.creating: 'CREATING',
  AddonStatus.active: 'ACTIVE',
  AddonStatus.createFailed: 'CREATE_FAILED',
  AddonStatus.updating: 'UPDATING',
  AddonStatus.deleting: 'DELETING',
  AddonStatus.deleteFailed: 'DELETE_FAILED',
  AddonStatus.degraded: 'DEGRADED',
};

AddonHealth _$AddonHealthFromJson(Map<String, dynamic> json) {
  return AddonHealth(
    issues: (json['issues'] as List)
        ?.map((e) =>
            e == null ? null : AddonIssue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddonInfo _$AddonInfoFromJson(Map<String, dynamic> json) {
  return AddonInfo(
    addonName: json['addonName'] as String,
    addonVersions: (json['addonVersions'] as List)
        ?.map((e) => e == null
            ? null
            : AddonVersionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['type'] as String,
  );
}

AddonIssue _$AddonIssueFromJson(Map<String, dynamic> json) {
  return AddonIssue(
    code: _$enumDecodeNullable(_$AddonIssueCodeEnumMap, json['code']),
    message: json['message'] as String,
    resourceIds:
        (json['resourceIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$AddonIssueCodeEnumMap = {
  AddonIssueCode.accessDenied: 'AccessDenied',
  AddonIssueCode.internalFailure: 'InternalFailure',
  AddonIssueCode.clusterUnreachable: 'ClusterUnreachable',
  AddonIssueCode.insufficientNumberOfReplicas: 'InsufficientNumberOfReplicas',
  AddonIssueCode.configurationConflict: 'ConfigurationConflict',
};

AddonVersionInfo _$AddonVersionInfoFromJson(Map<String, dynamic> json) {
  return AddonVersionInfo(
    addonVersion: json['addonVersion'] as String,
    architecture:
        (json['architecture'] as List)?.map((e) => e as String)?.toList(),
    compatibilities: (json['compatibilities'] as List)
        ?.map((e) => e == null
            ? null
            : Compatibility.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AutoScalingGroup _$AutoScalingGroupFromJson(Map<String, dynamic> json) {
  return AutoScalingGroup(
    name: json['name'] as String,
  );
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    data: json['data'] as String,
  );
}

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return Cluster(
    arn: json['arn'] as String,
    certificateAuthority: json['certificateAuthority'] == null
        ? null
        : Certificate.fromJson(
            json['certificateAuthority'] as Map<String, dynamic>),
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    encryptionConfig: (json['encryptionConfig'] as List)
        ?.map((e) => e == null
            ? null
            : EncryptionConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endpoint: json['endpoint'] as String,
    identity: json['identity'] == null
        ? null
        : Identity.fromJson(json['identity'] as Map<String, dynamic>),
    kubernetesNetworkConfig: json['kubernetesNetworkConfig'] == null
        ? null
        : KubernetesNetworkConfigResponse.fromJson(
            json['kubernetesNetworkConfig'] as Map<String, dynamic>),
    logging: json['logging'] == null
        ? null
        : Logging.fromJson(json['logging'] as Map<String, dynamic>),
    name: json['name'] as String,
    platformVersion: json['platformVersion'] as String,
    resourcesVpcConfig: json['resourcesVpcConfig'] == null
        ? null
        : VpcConfigResponse.fromJson(
            json['resourcesVpcConfig'] as Map<String, dynamic>),
    roleArn: json['roleArn'] as String,
    status: _$enumDecodeNullable(_$ClusterStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

const _$ClusterStatusEnumMap = {
  ClusterStatus.creating: 'CREATING',
  ClusterStatus.active: 'ACTIVE',
  ClusterStatus.deleting: 'DELETING',
  ClusterStatus.failed: 'FAILED',
  ClusterStatus.updating: 'UPDATING',
};

Compatibility _$CompatibilityFromJson(Map<String, dynamic> json) {
  return Compatibility(
    clusterVersion: json['clusterVersion'] as String,
    defaultVersion: json['defaultVersion'] as bool,
    platformVersions:
        (json['platformVersions'] as List)?.map((e) => e as String)?.toList(),
  );
}

CreateAddonResponse _$CreateAddonResponseFromJson(Map<String, dynamic> json) {
  return CreateAddonResponse(
    addon: json['addon'] == null
        ? null
        : Addon.fromJson(json['addon'] as Map<String, dynamic>),
  );
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

CreateFargateProfileResponse _$CreateFargateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFargateProfileResponse(
    fargateProfile: json['fargateProfile'] == null
        ? null
        : FargateProfile.fromJson(
            json['fargateProfile'] as Map<String, dynamic>),
  );
}

CreateNodegroupResponse _$CreateNodegroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateNodegroupResponse(
    nodegroup: json['nodegroup'] == null
        ? null
        : Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>),
  );
}

DeleteAddonResponse _$DeleteAddonResponseFromJson(Map<String, dynamic> json) {
  return DeleteAddonResponse(
    addon: json['addon'] == null
        ? null
        : Addon.fromJson(json['addon'] as Map<String, dynamic>),
  );
}

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

DeleteFargateProfileResponse _$DeleteFargateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFargateProfileResponse(
    fargateProfile: json['fargateProfile'] == null
        ? null
        : FargateProfile.fromJson(
            json['fargateProfile'] as Map<String, dynamic>),
  );
}

DeleteNodegroupResponse _$DeleteNodegroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNodegroupResponse(
    nodegroup: json['nodegroup'] == null
        ? null
        : Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>),
  );
}

DescribeAddonResponse _$DescribeAddonResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAddonResponse(
    addon: json['addon'] == null
        ? null
        : Addon.fromJson(json['addon'] as Map<String, dynamic>),
  );
}

DescribeAddonVersionsResponse _$DescribeAddonVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAddonVersionsResponse(
    addons: (json['addons'] as List)
        ?.map((e) =>
            e == null ? null : AddonInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeClusterResponse _$DescribeClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

DescribeFargateProfileResponse _$DescribeFargateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFargateProfileResponse(
    fargateProfile: json['fargateProfile'] == null
        ? null
        : FargateProfile.fromJson(
            json['fargateProfile'] as Map<String, dynamic>),
  );
}

DescribeNodegroupResponse _$DescribeNodegroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeNodegroupResponse(
    nodegroup: json['nodegroup'] == null
        ? null
        : Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>),
  );
}

DescribeUpdateResponse _$DescribeUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUpdateResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

EncryptionConfig _$EncryptionConfigFromJson(Map<String, dynamic> json) {
  return EncryptionConfig(
    provider: json['provider'] == null
        ? null
        : Provider.fromJson(json['provider'] as Map<String, dynamic>),
    resources: (json['resources'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$EncryptionConfigToJson(EncryptionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('provider', instance.provider?.toJson());
  writeNotNull('resources', instance.resources);
  return val;
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
    resourceIds:
        (json['resourceIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.subnetNotFound: 'SubnetNotFound',
  ErrorCode.securityGroupNotFound: 'SecurityGroupNotFound',
  ErrorCode.eniLimitReached: 'EniLimitReached',
  ErrorCode.ipNotAvailable: 'IpNotAvailable',
  ErrorCode.accessDenied: 'AccessDenied',
  ErrorCode.operationNotPermitted: 'OperationNotPermitted',
  ErrorCode.vpcIdNotFound: 'VpcIdNotFound',
  ErrorCode.unknown: 'Unknown',
  ErrorCode.nodeCreationFailure: 'NodeCreationFailure',
  ErrorCode.podEvictionFailure: 'PodEvictionFailure',
  ErrorCode.insufficientFreeAddresses: 'InsufficientFreeAddresses',
  ErrorCode.clusterUnreachable: 'ClusterUnreachable',
  ErrorCode.insufficientNumberOfReplicas: 'InsufficientNumberOfReplicas',
  ErrorCode.configurationConflict: 'ConfigurationConflict',
};

FargateProfile _$FargateProfileFromJson(Map<String, dynamic> json) {
  return FargateProfile(
    clusterName: json['clusterName'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    fargateProfileArn: json['fargateProfileArn'] as String,
    fargateProfileName: json['fargateProfileName'] as String,
    podExecutionRoleArn: json['podExecutionRoleArn'] as String,
    selectors: (json['selectors'] as List)
        ?.map((e) => e == null
            ? null
            : FargateProfileSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$FargateProfileStatusEnumMap, json['status']),
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$FargateProfileStatusEnumMap = {
  FargateProfileStatus.creating: 'CREATING',
  FargateProfileStatus.active: 'ACTIVE',
  FargateProfileStatus.deleting: 'DELETING',
  FargateProfileStatus.createFailed: 'CREATE_FAILED',
  FargateProfileStatus.deleteFailed: 'DELETE_FAILED',
};

FargateProfileSelector _$FargateProfileSelectorFromJson(
    Map<String, dynamic> json) {
  return FargateProfileSelector(
    labels: (json['labels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    namespace: json['namespace'] as String,
  );
}

Map<String, dynamic> _$FargateProfileSelectorToJson(
    FargateProfileSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('labels', instance.labels);
  writeNotNull('namespace', instance.namespace);
  return val;
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    oidc: json['oidc'] == null
        ? null
        : OIDC.fromJson(json['oidc'] as Map<String, dynamic>),
  );
}

Issue _$IssueFromJson(Map<String, dynamic> json) {
  return Issue(
    code: _$enumDecodeNullable(_$NodegroupIssueCodeEnumMap, json['code']),
    message: json['message'] as String,
    resourceIds:
        (json['resourceIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$NodegroupIssueCodeEnumMap = {
  NodegroupIssueCode.autoScalingGroupNotFound: 'AutoScalingGroupNotFound',
  NodegroupIssueCode.autoScalingGroupInvalidConfiguration:
      'AutoScalingGroupInvalidConfiguration',
  NodegroupIssueCode.ec2SecurityGroupNotFound: 'Ec2SecurityGroupNotFound',
  NodegroupIssueCode.ec2SecurityGroupDeletionFailure:
      'Ec2SecurityGroupDeletionFailure',
  NodegroupIssueCode.ec2LaunchTemplateNotFound: 'Ec2LaunchTemplateNotFound',
  NodegroupIssueCode.ec2LaunchTemplateVersionMismatch:
      'Ec2LaunchTemplateVersionMismatch',
  NodegroupIssueCode.ec2SubnetNotFound: 'Ec2SubnetNotFound',
  NodegroupIssueCode.ec2SubnetInvalidConfiguration:
      'Ec2SubnetInvalidConfiguration',
  NodegroupIssueCode.iamInstanceProfileNotFound: 'IamInstanceProfileNotFound',
  NodegroupIssueCode.iamLimitExceeded: 'IamLimitExceeded',
  NodegroupIssueCode.iamNodeRoleNotFound: 'IamNodeRoleNotFound',
  NodegroupIssueCode.nodeCreationFailure: 'NodeCreationFailure',
  NodegroupIssueCode.asgInstanceLaunchFailures: 'AsgInstanceLaunchFailures',
  NodegroupIssueCode.instanceLimitExceeded: 'InstanceLimitExceeded',
  NodegroupIssueCode.insufficientFreeAddresses: 'InsufficientFreeAddresses',
  NodegroupIssueCode.accessDenied: 'AccessDenied',
  NodegroupIssueCode.internalFailure: 'InternalFailure',
  NodegroupIssueCode.clusterUnreachable: 'ClusterUnreachable',
};

Map<String, dynamic> _$KubernetesNetworkConfigRequestToJson(
    KubernetesNetworkConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serviceIpv4Cidr', instance.serviceIpv4Cidr);
  return val;
}

KubernetesNetworkConfigResponse _$KubernetesNetworkConfigResponseFromJson(
    Map<String, dynamic> json) {
  return KubernetesNetworkConfigResponse(
    serviceIpv4Cidr: json['serviceIpv4Cidr'] as String,
  );
}

LaunchTemplateSpecification _$LaunchTemplateSpecificationFromJson(
    Map<String, dynamic> json) {
  return LaunchTemplateSpecification(
    id: json['id'] as String,
    name: json['name'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$LaunchTemplateSpecificationToJson(
    LaunchTemplateSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  return val;
}

ListAddonsResponse _$ListAddonsResponseFromJson(Map<String, dynamic> json) {
  return ListAddonsResponse(
    addons: (json['addons'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListClustersResponse _$ListClustersResponseFromJson(Map<String, dynamic> json) {
  return ListClustersResponse(
    clusters: (json['clusters'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFargateProfilesResponse _$ListFargateProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListFargateProfilesResponse(
    fargateProfileNames: (json['fargateProfileNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListNodegroupsResponse _$ListNodegroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListNodegroupsResponse(
    nextToken: json['nextToken'] as String,
    nodegroups: (json['nodegroups'] as List)?.map((e) => e as String)?.toList(),
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

ListUpdatesResponse _$ListUpdatesResponseFromJson(Map<String, dynamic> json) {
  return ListUpdatesResponse(
    nextToken: json['nextToken'] as String,
    updateIds: (json['updateIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

LogSetup _$LogSetupFromJson(Map<String, dynamic> json) {
  return LogSetup(
    enabled: json['enabled'] as bool,
    types: (json['types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$LogTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$LogSetupToJson(LogSetup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull(
      'types', instance.types?.map((e) => _$LogTypeEnumMap[e])?.toList());
  return val;
}

const _$LogTypeEnumMap = {
  LogType.api: 'api',
  LogType.audit: 'audit',
  LogType.authenticator: 'authenticator',
  LogType.controllerManager: 'controllerManager',
  LogType.scheduler: 'scheduler',
};

Logging _$LoggingFromJson(Map<String, dynamic> json) {
  return Logging(
    clusterLogging: (json['clusterLogging'] as List)
        ?.map((e) =>
            e == null ? null : LogSetup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoggingToJson(Logging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clusterLogging',
      instance.clusterLogging?.map((e) => e?.toJson())?.toList());
  return val;
}

Nodegroup _$NodegroupFromJson(Map<String, dynamic> json) {
  return Nodegroup(
    amiType: _$enumDecodeNullable(_$AMITypesEnumMap, json['amiType']),
    capacityType:
        _$enumDecodeNullable(_$CapacityTypesEnumMap, json['capacityType']),
    clusterName: json['clusterName'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    diskSize: json['diskSize'] as int,
    health: json['health'] == null
        ? null
        : NodegroupHealth.fromJson(json['health'] as Map<String, dynamic>),
    instanceTypes:
        (json['instanceTypes'] as List)?.map((e) => e as String)?.toList(),
    labels: (json['labels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    launchTemplate: json['launchTemplate'] == null
        ? null
        : LaunchTemplateSpecification.fromJson(
            json['launchTemplate'] as Map<String, dynamic>),
    modifiedAt: const UnixDateTimeConverter().fromJson(json['modifiedAt']),
    nodeRole: json['nodeRole'] as String,
    nodegroupArn: json['nodegroupArn'] as String,
    nodegroupName: json['nodegroupName'] as String,
    releaseVersion: json['releaseVersion'] as String,
    remoteAccess: json['remoteAccess'] == null
        ? null
        : RemoteAccessConfig.fromJson(
            json['remoteAccess'] as Map<String, dynamic>),
    resources: json['resources'] == null
        ? null
        : NodegroupResources.fromJson(
            json['resources'] as Map<String, dynamic>),
    scalingConfig: json['scalingConfig'] == null
        ? null
        : NodegroupScalingConfig.fromJson(
            json['scalingConfig'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$NodegroupStatusEnumMap, json['status']),
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

const _$AMITypesEnumMap = {
  AMITypes.al2X86_64: 'AL2_x86_64',
  AMITypes.al2X86_64Gpu: 'AL2_x86_64_GPU',
  AMITypes.al2Arm_64: 'AL2_ARM_64',
};

const _$CapacityTypesEnumMap = {
  CapacityTypes.onDemand: 'ON_DEMAND',
  CapacityTypes.spot: 'SPOT',
};

const _$NodegroupStatusEnumMap = {
  NodegroupStatus.creating: 'CREATING',
  NodegroupStatus.active: 'ACTIVE',
  NodegroupStatus.updating: 'UPDATING',
  NodegroupStatus.deleting: 'DELETING',
  NodegroupStatus.createFailed: 'CREATE_FAILED',
  NodegroupStatus.deleteFailed: 'DELETE_FAILED',
  NodegroupStatus.degraded: 'DEGRADED',
};

NodegroupHealth _$NodegroupHealthFromJson(Map<String, dynamic> json) {
  return NodegroupHealth(
    issues: (json['issues'] as List)
        ?.map(
            (e) => e == null ? null : Issue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NodegroupResources _$NodegroupResourcesFromJson(Map<String, dynamic> json) {
  return NodegroupResources(
    autoScalingGroups: (json['autoScalingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remoteAccessSecurityGroup: json['remoteAccessSecurityGroup'] as String,
  );
}

NodegroupScalingConfig _$NodegroupScalingConfigFromJson(
    Map<String, dynamic> json) {
  return NodegroupScalingConfig(
    desiredSize: json['desiredSize'] as int,
    maxSize: json['maxSize'] as int,
    minSize: json['minSize'] as int,
  );
}

Map<String, dynamic> _$NodegroupScalingConfigToJson(
    NodegroupScalingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('desiredSize', instance.desiredSize);
  writeNotNull('maxSize', instance.maxSize);
  writeNotNull('minSize', instance.minSize);
  return val;
}

OIDC _$OIDCFromJson(Map<String, dynamic> json) {
  return OIDC(
    issuer: json['issuer'] as String,
  );
}

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return Provider(
    keyArn: json['keyArn'] as String,
  );
}

Map<String, dynamic> _$ProviderToJson(Provider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyArn', instance.keyArn);
  return val;
}

RemoteAccessConfig _$RemoteAccessConfigFromJson(Map<String, dynamic> json) {
  return RemoteAccessConfig(
    ec2SshKey: json['ec2SshKey'] as String,
    sourceSecurityGroups: (json['sourceSecurityGroups'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$RemoteAccessConfigToJson(RemoteAccessConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ec2SshKey', instance.ec2SshKey);
  writeNotNull('sourceSecurityGroups', instance.sourceSecurityGroups);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    errors: (json['errors'] as List)
        ?.map((e) =>
            e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    params: (json['params'] as List)
        ?.map((e) =>
            e == null ? null : UpdateParam.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$UpdateStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$UpdateTypeEnumMap, json['type']),
  );
}

const _$UpdateStatusEnumMap = {
  UpdateStatus.inProgress: 'InProgress',
  UpdateStatus.failed: 'Failed',
  UpdateStatus.cancelled: 'Cancelled',
  UpdateStatus.successful: 'Successful',
};

const _$UpdateTypeEnumMap = {
  UpdateType.versionUpdate: 'VersionUpdate',
  UpdateType.endpointAccessUpdate: 'EndpointAccessUpdate',
  UpdateType.loggingUpdate: 'LoggingUpdate',
  UpdateType.configUpdate: 'ConfigUpdate',
  UpdateType.addonUpdate: 'AddonUpdate',
};

UpdateAddonResponse _$UpdateAddonResponseFromJson(Map<String, dynamic> json) {
  return UpdateAddonResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

UpdateClusterConfigResponse _$UpdateClusterConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterConfigResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

UpdateClusterVersionResponse _$UpdateClusterVersionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterVersionResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateLabelsPayloadToJson(UpdateLabelsPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addOrUpdateLabels', instance.addOrUpdateLabels);
  writeNotNull('removeLabels', instance.removeLabels);
  return val;
}

UpdateNodegroupConfigResponse _$UpdateNodegroupConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNodegroupConfigResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

UpdateNodegroupVersionResponse _$UpdateNodegroupVersionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNodegroupVersionResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

UpdateParam _$UpdateParamFromJson(Map<String, dynamic> json) {
  return UpdateParam(
    type: _$enumDecodeNullable(_$UpdateParamTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

const _$UpdateParamTypeEnumMap = {
  UpdateParamType.version: 'Version',
  UpdateParamType.platformVersion: 'PlatformVersion',
  UpdateParamType.endpointPrivateAccess: 'EndpointPrivateAccess',
  UpdateParamType.endpointPublicAccess: 'EndpointPublicAccess',
  UpdateParamType.clusterLogging: 'ClusterLogging',
  UpdateParamType.desiredSize: 'DesiredSize',
  UpdateParamType.labelsToAdd: 'LabelsToAdd',
  UpdateParamType.labelsToRemove: 'LabelsToRemove',
  UpdateParamType.maxSize: 'MaxSize',
  UpdateParamType.minSize: 'MinSize',
  UpdateParamType.releaseVersion: 'ReleaseVersion',
  UpdateParamType.publicAccessCidrs: 'PublicAccessCidrs',
  UpdateParamType.addonVersion: 'AddonVersion',
  UpdateParamType.serviceAccountRoleArn: 'ServiceAccountRoleArn',
  UpdateParamType.resolveConflicts: 'ResolveConflicts',
};

Map<String, dynamic> _$VpcConfigRequestToJson(VpcConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endpointPrivateAccess', instance.endpointPrivateAccess);
  writeNotNull('endpointPublicAccess', instance.endpointPublicAccess);
  writeNotNull('publicAccessCidrs', instance.publicAccessCidrs);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('subnetIds', instance.subnetIds);
  return val;
}

VpcConfigResponse _$VpcConfigResponseFromJson(Map<String, dynamic> json) {
  return VpcConfigResponse(
    clusterSecurityGroupId: json['clusterSecurityGroupId'] as String,
    endpointPrivateAccess: json['endpointPrivateAccess'] as bool,
    endpointPublicAccess: json['endpointPublicAccess'] as bool,
    publicAccessCidrs:
        (json['publicAccessCidrs'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['vpcId'] as String,
  );
}
