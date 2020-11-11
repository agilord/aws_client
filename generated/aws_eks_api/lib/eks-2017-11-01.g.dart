// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eks-2017-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
    createdAt: unixTimestampFromJson(json['createdAt']),
    encryptionConfig: (json['encryptionConfig'] as List)
        ?.map((e) => e == null
            ? null
            : EncryptionConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endpoint: json['endpoint'] as String,
    identity: json['identity'] == null
        ? null
        : Identity.fromJson(json['identity'] as Map<String, dynamic>),
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

const _$ClusterStatusEnumMap = {
  ClusterStatus.creating: 'CREATING',
  ClusterStatus.active: 'ACTIVE',
  ClusterStatus.deleting: 'DELETING',
  ClusterStatus.failed: 'FAILED',
  ClusterStatus.updating: 'UPDATING',
};

Map<String, dynamic> _$CreateClusterRequestToJson(
    CreateClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('resourcesVpcConfig', instance.resourcesVpcConfig?.toJson());
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull('encryptionConfig',
      instance.encryptionConfig?.map((e) => e?.toJson())?.toList());
  writeNotNull('logging', instance.logging?.toJson());
  writeNotNull('tags', instance.tags);
  writeNotNull('version', instance.version);
  return val;
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateFargateProfileRequestToJson(
    CreateFargateProfileRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fargateProfileName', instance.fargateProfileName);
  writeNotNull('podExecutionRoleArn', instance.podExecutionRoleArn);
  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull(
      'selectors', instance.selectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('subnets', instance.subnets);
  writeNotNull('tags', instance.tags);
  return val;
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

Map<String, dynamic> _$CreateNodegroupRequestToJson(
    CreateNodegroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nodeRole', instance.nodeRole);
  writeNotNull('nodegroupName', instance.nodegroupName);
  writeNotNull('subnets', instance.subnets);
  writeNotNull('amiType', _$AMITypesEnumMap[instance.amiType]);
  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull('diskSize', instance.diskSize);
  writeNotNull('instanceTypes', instance.instanceTypes);
  writeNotNull('labels', instance.labels);
  writeNotNull('releaseVersion', instance.releaseVersion);
  writeNotNull('remoteAccess', instance.remoteAccess?.toJson());
  writeNotNull('scalingConfig', instance.scalingConfig?.toJson());
  writeNotNull('tags', instance.tags);
  writeNotNull('version', instance.version);
  return val;
}

const _$AMITypesEnumMap = {
  AMITypes.al2X86_64: 'AL2_x86_64',
  AMITypes.al2X86_64Gpu: 'AL2_x86_64_GPU',
};

CreateNodegroupResponse _$CreateNodegroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateNodegroupResponse(
    nodegroup: json['nodegroup'] == null
        ? null
        : Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteClusterRequestToJson(
        DeleteClusterRequest instance) =>
    <String, dynamic>{};

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteFargateProfileRequestToJson(
        DeleteFargateProfileRequest instance) =>
    <String, dynamic>{};

DeleteFargateProfileResponse _$DeleteFargateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFargateProfileResponse(
    fargateProfile: json['fargateProfile'] == null
        ? null
        : FargateProfile.fromJson(
            json['fargateProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteNodegroupRequestToJson(
        DeleteNodegroupRequest instance) =>
    <String, dynamic>{};

DeleteNodegroupResponse _$DeleteNodegroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNodegroupResponse(
    nodegroup: json['nodegroup'] == null
        ? null
        : Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>),
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
};

FargateProfile _$FargateProfileFromJson(Map<String, dynamic> json) {
  return FargateProfile(
    clusterName: json['clusterName'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
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
};

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
    types: (json['types'] as List)?.map((e) => e as String)?.toList(),
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
  writeNotNull('types', instance.types);
  return val;
}

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
    clusterName: json['clusterName'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    diskSize: json['diskSize'] as int,
    health: json['health'] == null
        ? null
        : NodegroupHealth.fromJson(json['health'] as Map<String, dynamic>),
    instanceTypes:
        (json['instanceTypes'] as List)?.map((e) => e as String)?.toList(),
    labels: (json['labels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    modifiedAt: unixTimestampFromJson(json['modifiedAt']),
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    createdAt: unixTimestampFromJson(json['createdAt']),
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
};

Map<String, dynamic> _$UpdateClusterConfigRequestToJson(
    UpdateClusterConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull('logging', instance.logging?.toJson());
  writeNotNull('resourcesVpcConfig', instance.resourcesVpcConfig?.toJson());
  return val;
}

UpdateClusterConfigResponse _$UpdateClusterConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterConfigResponse(
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateClusterVersionRequestToJson(
    UpdateClusterVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('clientRequestToken', instance.clientRequestToken);
  return val;
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

Map<String, dynamic> _$UpdateNodegroupConfigRequestToJson(
    UpdateNodegroupConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull('labels', instance.labels?.toJson());
  writeNotNull('scalingConfig', instance.scalingConfig?.toJson());
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

Map<String, dynamic> _$UpdateNodegroupVersionRequestToJson(
    UpdateNodegroupVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientRequestToken', instance.clientRequestToken);
  writeNotNull('force', instance.force);
  writeNotNull('releaseVersion', instance.releaseVersion);
  writeNotNull('version', instance.version);
  return val;
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
