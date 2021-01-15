// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-10-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelJobRunResponse _$CancelJobRunResponseFromJson(Map<String, dynamic> json) {
  return CancelJobRunResponse(
    id: json['id'] as String,
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

CloudWatchMonitoringConfiguration _$CloudWatchMonitoringConfigurationFromJson(
    Map<String, dynamic> json) {
  return CloudWatchMonitoringConfiguration(
    logGroupName: json['logGroupName'] as String,
    logStreamNamePrefix: json['logStreamNamePrefix'] as String,
  );
}

Map<String, dynamic> _$CloudWatchMonitoringConfigurationToJson(
    CloudWatchMonitoringConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logStreamNamePrefix', instance.logStreamNamePrefix);
  return val;
}

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    classification: json['classification'] as String,
    configurations: (json['configurations'] as List)
        ?.map((e) => e == null
            ? null
            : Configuration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    properties: (json['properties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('classification', instance.classification);
  writeNotNull('configurations',
      instance.configurations?.map((e) => e?.toJson())?.toList());
  writeNotNull('properties', instance.properties);
  return val;
}

ConfigurationOverrides _$ConfigurationOverridesFromJson(
    Map<String, dynamic> json) {
  return ConfigurationOverrides(
    applicationConfiguration: (json['applicationConfiguration'] as List)
        ?.map((e) => e == null
            ? null
            : Configuration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    monitoringConfiguration: json['monitoringConfiguration'] == null
        ? null
        : MonitoringConfiguration.fromJson(
            json['monitoringConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfigurationOverridesToJson(
    ConfigurationOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('applicationConfiguration',
      instance.applicationConfiguration?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'monitoringConfiguration', instance.monitoringConfiguration?.toJson());
  return val;
}

ContainerInfo _$ContainerInfoFromJson(Map<String, dynamic> json) {
  return ContainerInfo(
    eksInfo: json['eksInfo'] == null
        ? null
        : EksInfo.fromJson(json['eksInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContainerInfoToJson(ContainerInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eksInfo', instance.eksInfo?.toJson());
  return val;
}

ContainerProvider _$ContainerProviderFromJson(Map<String, dynamic> json) {
  return ContainerProvider(
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$ContainerProviderTypeEnumMap, json['type']),
    info: json['info'] == null
        ? null
        : ContainerInfo.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContainerProviderToJson(ContainerProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$ContainerProviderTypeEnumMap[instance.type]);
  writeNotNull('info', instance.info?.toJson());
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

const _$ContainerProviderTypeEnumMap = {
  ContainerProviderType.eks: 'EKS',
};

CreateManagedEndpointResponse _$CreateManagedEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateManagedEndpointResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

CreateVirtualClusterResponse _$CreateVirtualClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVirtualClusterResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

DeleteManagedEndpointResponse _$DeleteManagedEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteManagedEndpointResponse(
    id: json['id'] as String,
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

DeleteVirtualClusterResponse _$DeleteVirtualClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualClusterResponse(
    id: json['id'] as String,
  );
}

DescribeJobRunResponse _$DescribeJobRunResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJobRunResponse(
    jobRun: json['jobRun'] == null
        ? null
        : JobRun.fromJson(json['jobRun'] as Map<String, dynamic>),
  );
}

DescribeManagedEndpointResponse _$DescribeManagedEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeManagedEndpointResponse(
    endpoint: json['endpoint'] == null
        ? null
        : Endpoint.fromJson(json['endpoint'] as Map<String, dynamic>),
  );
}

DescribeVirtualClusterResponse _$DescribeVirtualClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeVirtualClusterResponse(
    virtualCluster: json['virtualCluster'] == null
        ? null
        : VirtualCluster.fromJson(
            json['virtualCluster'] as Map<String, dynamic>),
  );
}

EksInfo _$EksInfoFromJson(Map<String, dynamic> json) {
  return EksInfo(
    namespace: json['namespace'] as String,
  );
}

Map<String, dynamic> _$EksInfoToJson(EksInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('namespace', instance.namespace);
  return val;
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    arn: json['arn'] as String,
    certificateArn: json['certificateArn'] as String,
    configurationOverrides: json['configurationOverrides'] == null
        ? null
        : ConfigurationOverrides.fromJson(
            json['configurationOverrides'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    executionRoleArn: json['executionRoleArn'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    releaseLabel: json['releaseLabel'] as String,
    securityGroup: json['securityGroup'] as String,
    serverUrl: json['serverUrl'] as String,
    state: _$enumDecodeNullable(_$EndpointStateEnumMap, json['state']),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: json['type'] as String,
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

const _$EndpointStateEnumMap = {
  EndpointState.creating: 'CREATING',
  EndpointState.active: 'ACTIVE',
  EndpointState.terminating: 'TERMINATING',
  EndpointState.terminated: 'TERMINATED',
  EndpointState.terminatedWithErrors: 'TERMINATED_WITH_ERRORS',
};

JobDriver _$JobDriverFromJson(Map<String, dynamic> json) {
  return JobDriver(
    sparkSubmitJobDriver: json['sparkSubmitJobDriver'] == null
        ? null
        : SparkSubmitJobDriver.fromJson(
            json['sparkSubmitJobDriver'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobDriverToJson(JobDriver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sparkSubmitJobDriver', instance.sparkSubmitJobDriver?.toJson());
  return val;
}

JobRun _$JobRunFromJson(Map<String, dynamic> json) {
  return JobRun(
    arn: json['arn'] as String,
    clientToken: json['clientToken'] as String,
    configurationOverrides: json['configurationOverrides'] == null
        ? null
        : ConfigurationOverrides.fromJson(
            json['configurationOverrides'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    executionRoleArn: json['executionRoleArn'] as String,
    failureReason:
        _$enumDecodeNullable(_$FailureReasonEnumMap, json['failureReason']),
    finishedAt: const UnixDateTimeConverter().fromJson(json['finishedAt']),
    id: json['id'] as String,
    jobDriver: json['jobDriver'] == null
        ? null
        : JobDriver.fromJson(json['jobDriver'] as Map<String, dynamic>),
    name: json['name'] as String,
    releaseLabel: json['releaseLabel'] as String,
    state: _$enumDecodeNullable(_$JobRunStateEnumMap, json['state']),
    stateDetails: json['stateDetails'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

const _$FailureReasonEnumMap = {
  FailureReason.internalError: 'INTERNAL_ERROR',
  FailureReason.userError: 'USER_ERROR',
  FailureReason.validationError: 'VALIDATION_ERROR',
  FailureReason.clusterUnavailable: 'CLUSTER_UNAVAILABLE',
};

const _$JobRunStateEnumMap = {
  JobRunState.pending: 'PENDING',
  JobRunState.submitted: 'SUBMITTED',
  JobRunState.running: 'RUNNING',
  JobRunState.failed: 'FAILED',
  JobRunState.cancelled: 'CANCELLED',
  JobRunState.cancelPending: 'CANCEL_PENDING',
  JobRunState.completed: 'COMPLETED',
};

ListJobRunsResponse _$ListJobRunsResponseFromJson(Map<String, dynamic> json) {
  return ListJobRunsResponse(
    jobRuns: (json['jobRuns'] as List)
        ?.map((e) =>
            e == null ? null : JobRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListManagedEndpointsResponse _$ListManagedEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return ListManagedEndpointsResponse(
    endpoints: (json['endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

ListVirtualClustersResponse _$ListVirtualClustersResponseFromJson(
    Map<String, dynamic> json) {
  return ListVirtualClustersResponse(
    nextToken: json['nextToken'] as String,
    virtualClusters: (json['virtualClusters'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualCluster.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MonitoringConfiguration _$MonitoringConfigurationFromJson(
    Map<String, dynamic> json) {
  return MonitoringConfiguration(
    cloudWatchMonitoringConfiguration:
        json['cloudWatchMonitoringConfiguration'] == null
            ? null
            : CloudWatchMonitoringConfiguration.fromJson(
                json['cloudWatchMonitoringConfiguration']
                    as Map<String, dynamic>),
    persistentAppUI:
        _$enumDecodeNullable(_$PersistentAppUIEnumMap, json['persistentAppUI']),
    s3MonitoringConfiguration: json['s3MonitoringConfiguration'] == null
        ? null
        : S3MonitoringConfiguration.fromJson(
            json['s3MonitoringConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringConfigurationToJson(
    MonitoringConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudWatchMonitoringConfiguration',
      instance.cloudWatchMonitoringConfiguration?.toJson());
  writeNotNull(
      'persistentAppUI', _$PersistentAppUIEnumMap[instance.persistentAppUI]);
  writeNotNull('s3MonitoringConfiguration',
      instance.s3MonitoringConfiguration?.toJson());
  return val;
}

const _$PersistentAppUIEnumMap = {
  PersistentAppUI.enabled: 'ENABLED',
  PersistentAppUI.disabled: 'DISABLED',
};

S3MonitoringConfiguration _$S3MonitoringConfigurationFromJson(
    Map<String, dynamic> json) {
  return S3MonitoringConfiguration(
    logUri: json['logUri'] as String,
  );
}

Map<String, dynamic> _$S3MonitoringConfigurationToJson(
    S3MonitoringConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logUri', instance.logUri);
  return val;
}

SparkSubmitJobDriver _$SparkSubmitJobDriverFromJson(Map<String, dynamic> json) {
  return SparkSubmitJobDriver(
    entryPoint: json['entryPoint'] as String,
    entryPointArguments: (json['entryPointArguments'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    sparkSubmitParameters: json['sparkSubmitParameters'] as String,
  );
}

Map<String, dynamic> _$SparkSubmitJobDriverToJson(
    SparkSubmitJobDriver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('entryPoint', instance.entryPoint);
  writeNotNull('entryPointArguments', instance.entryPointArguments);
  writeNotNull('sparkSubmitParameters', instance.sparkSubmitParameters);
  return val;
}

StartJobRunResponse _$StartJobRunResponseFromJson(Map<String, dynamic> json) {
  return StartJobRunResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    virtualClusterId: json['virtualClusterId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

VirtualCluster _$VirtualClusterFromJson(Map<String, dynamic> json) {
  return VirtualCluster(
    arn: json['arn'] as String,
    containerProvider: json['containerProvider'] == null
        ? null
        : ContainerProvider.fromJson(
            json['containerProvider'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    name: json['name'] as String,
    state: _$enumDecodeNullable(_$VirtualClusterStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$VirtualClusterStateEnumMap = {
  VirtualClusterState.running: 'RUNNING',
  VirtualClusterState.terminating: 'TERMINATING',
  VirtualClusterState.terminated: 'TERMINATED',
  VirtualClusterState.arrested: 'ARRESTED',
};
