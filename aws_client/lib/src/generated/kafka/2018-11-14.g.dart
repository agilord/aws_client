// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchAssociateScramSecretResponse _$BatchAssociateScramSecretResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAssociateScramSecretResponse(
    clusterArn: json['clusterArn'] as String,
    unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BrokerEBSVolumeInfo _$BrokerEBSVolumeInfoFromJson(Map<String, dynamic> json) {
  return BrokerEBSVolumeInfo(
    kafkaBrokerNodeId: json['kafkaBrokerNodeId'] as String,
    volumeSizeGB: json['volumeSizeGB'] as int,
  );
}

Map<String, dynamic> _$BrokerEBSVolumeInfoToJson(BrokerEBSVolumeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kafkaBrokerNodeId', instance.kafkaBrokerNodeId);
  writeNotNull('volumeSizeGB', instance.volumeSizeGB);
  return val;
}

BrokerLogs _$BrokerLogsFromJson(Map<String, dynamic> json) {
  return BrokerLogs(
    cloudWatchLogs: json['cloudWatchLogs'] == null
        ? null
        : CloudWatchLogs.fromJson(
            json['cloudWatchLogs'] as Map<String, dynamic>),
    firehose: json['firehose'] == null
        ? null
        : Firehose.fromJson(json['firehose'] as Map<String, dynamic>),
    s3: json['s3'] == null
        ? null
        : S3.fromJson(json['s3'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BrokerLogsToJson(BrokerLogs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudWatchLogs', instance.cloudWatchLogs?.toJson());
  writeNotNull('firehose', instance.firehose?.toJson());
  writeNotNull('s3', instance.s3?.toJson());
  return val;
}

BrokerNodeGroupInfo _$BrokerNodeGroupInfoFromJson(Map<String, dynamic> json) {
  return BrokerNodeGroupInfo(
    clientSubnets:
        (json['clientSubnets'] as List)?.map((e) => e as String)?.toList(),
    instanceType: json['instanceType'] as String,
    brokerAZDistribution: _$enumDecodeNullable(
        _$BrokerAZDistributionEnumMap, json['brokerAZDistribution']),
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    storageInfo: json['storageInfo'] == null
        ? null
        : StorageInfo.fromJson(json['storageInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BrokerNodeGroupInfoToJson(BrokerNodeGroupInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientSubnets', instance.clientSubnets);
  writeNotNull('instanceType', instance.instanceType);
  writeNotNull('brokerAZDistribution',
      _$BrokerAZDistributionEnumMap[instance.brokerAZDistribution]);
  writeNotNull('securityGroups', instance.securityGroups);
  writeNotNull('storageInfo', instance.storageInfo?.toJson());
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

const _$BrokerAZDistributionEnumMap = {
  BrokerAZDistribution.$default: 'DEFAULT',
};

BrokerNodeInfo _$BrokerNodeInfoFromJson(Map<String, dynamic> json) {
  return BrokerNodeInfo(
    attachedENIId: json['attachedENIId'] as String,
    brokerId: (json['brokerId'] as num)?.toDouble(),
    clientSubnet: json['clientSubnet'] as String,
    clientVpcIpAddress: json['clientVpcIpAddress'] as String,
    currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] == null
        ? null
        : BrokerSoftwareInfo.fromJson(
            json['currentBrokerSoftwareInfo'] as Map<String, dynamic>),
    endpoints: (json['endpoints'] as List)?.map((e) => e as String)?.toList(),
  );
}

BrokerSoftwareInfo _$BrokerSoftwareInfoFromJson(Map<String, dynamic> json) {
  return BrokerSoftwareInfo(
    configurationArn: json['configurationArn'] as String,
    configurationRevision: json['configurationRevision'] as int,
    kafkaVersion: json['kafkaVersion'] as String,
  );
}

ClientAuthentication _$ClientAuthenticationFromJson(Map<String, dynamic> json) {
  return ClientAuthentication(
    sasl: json['sasl'] == null
        ? null
        : Sasl.fromJson(json['sasl'] as Map<String, dynamic>),
    tls: json['tls'] == null
        ? null
        : Tls.fromJson(json['tls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClientAuthenticationToJson(
    ClientAuthentication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sasl', instance.sasl?.toJson());
  writeNotNull('tls', instance.tls?.toJson());
  return val;
}

CloudWatchLogs _$CloudWatchLogsFromJson(Map<String, dynamic> json) {
  return CloudWatchLogs(
    enabled: json['enabled'] as bool,
    logGroup: json['logGroup'] as String,
  );
}

Map<String, dynamic> _$CloudWatchLogsToJson(CloudWatchLogs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('logGroup', instance.logGroup);
  return val;
}

ClusterInfo _$ClusterInfoFromJson(Map<String, dynamic> json) {
  return ClusterInfo(
    activeOperationArn: json['activeOperationArn'] as String,
    brokerNodeGroupInfo: json['brokerNodeGroupInfo'] == null
        ? null
        : BrokerNodeGroupInfo.fromJson(
            json['brokerNodeGroupInfo'] as Map<String, dynamic>),
    clientAuthentication: json['clientAuthentication'] == null
        ? null
        : ClientAuthentication.fromJson(
            json['clientAuthentication'] as Map<String, dynamic>),
    clusterArn: json['clusterArn'] as String,
    clusterName: json['clusterName'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] == null
        ? null
        : BrokerSoftwareInfo.fromJson(
            json['currentBrokerSoftwareInfo'] as Map<String, dynamic>),
    currentVersion: json['currentVersion'] as String,
    encryptionInfo: json['encryptionInfo'] == null
        ? null
        : EncryptionInfo.fromJson(
            json['encryptionInfo'] as Map<String, dynamic>),
    enhancedMonitoring: _$enumDecodeNullable(
        _$EnhancedMonitoringEnumMap, json['enhancedMonitoring']),
    loggingInfo: json['loggingInfo'] == null
        ? null
        : LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>),
    numberOfBrokerNodes: json['numberOfBrokerNodes'] as int,
    openMonitoring: json['openMonitoring'] == null
        ? null
        : OpenMonitoring.fromJson(
            json['openMonitoring'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['state']),
    stateInfo: json['stateInfo'] == null
        ? null
        : StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    zookeeperConnectString: json['zookeeperConnectString'] as String,
    zookeeperConnectStringTls: json['zookeeperConnectStringTls'] as String,
  );
}

const _$EnhancedMonitoringEnumMap = {
  EnhancedMonitoring.$default: 'DEFAULT',
  EnhancedMonitoring.perBroker: 'PER_BROKER',
  EnhancedMonitoring.perTopicPerBroker: 'PER_TOPIC_PER_BROKER',
  EnhancedMonitoring.perTopicPerPartition: 'PER_TOPIC_PER_PARTITION',
};

const _$ClusterStateEnumMap = {
  ClusterState.active: 'ACTIVE',
  ClusterState.creating: 'CREATING',
  ClusterState.deleting: 'DELETING',
  ClusterState.failed: 'FAILED',
  ClusterState.healing: 'HEALING',
  ClusterState.maintenance: 'MAINTENANCE',
  ClusterState.rebootingBroker: 'REBOOTING_BROKER',
  ClusterState.updating: 'UPDATING',
};

ClusterOperationInfo _$ClusterOperationInfoFromJson(Map<String, dynamic> json) {
  return ClusterOperationInfo(
    clientRequestId: json['clientRequestId'] as String,
    clusterArn: json['clusterArn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    endTime: const IsoDateTimeConverter().fromJson(json['endTime']),
    errorInfo: json['errorInfo'] == null
        ? null
        : ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>),
    operationArn: json['operationArn'] as String,
    operationState: json['operationState'] as String,
    operationSteps: (json['operationSteps'] as List)
        ?.map((e) => e == null
            ? null
            : ClusterOperationStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    operationType: json['operationType'] as String,
    sourceClusterInfo: json['sourceClusterInfo'] == null
        ? null
        : MutableClusterInfo.fromJson(
            json['sourceClusterInfo'] as Map<String, dynamic>),
    targetClusterInfo: json['targetClusterInfo'] == null
        ? null
        : MutableClusterInfo.fromJson(
            json['targetClusterInfo'] as Map<String, dynamic>),
  );
}

ClusterOperationStep _$ClusterOperationStepFromJson(Map<String, dynamic> json) {
  return ClusterOperationStep(
    stepInfo: json['stepInfo'] == null
        ? null
        : ClusterOperationStepInfo.fromJson(
            json['stepInfo'] as Map<String, dynamic>),
    stepName: json['stepName'] as String,
  );
}

ClusterOperationStepInfo _$ClusterOperationStepInfoFromJson(
    Map<String, dynamic> json) {
  return ClusterOperationStepInfo(
    stepStatus: json['stepStatus'] as String,
  );
}

CompatibleKafkaVersion _$CompatibleKafkaVersionFromJson(
    Map<String, dynamic> json) {
  return CompatibleKafkaVersion(
    sourceVersion: json['sourceVersion'] as String,
    targetVersions:
        (json['targetVersions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    kafkaVersions:
        (json['kafkaVersions'] as List)?.map((e) => e as String)?.toList(),
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    state: _$enumDecodeNullable(_$ConfigurationStateEnumMap, json['state']),
  );
}

const _$ConfigurationStateEnumMap = {
  ConfigurationState.active: 'ACTIVE',
  ConfigurationState.deleting: 'DELETING',
  ConfigurationState.deleteFailed: 'DELETE_FAILED',
};

ConfigurationInfo _$ConfigurationInfoFromJson(Map<String, dynamic> json) {
  return ConfigurationInfo(
    arn: json['arn'] as String,
    revision: json['revision'] as int,
  );
}

Map<String, dynamic> _$ConfigurationInfoToJson(ConfigurationInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arn', instance.arn);
  writeNotNull('revision', instance.revision);
  return val;
}

ConfigurationRevision _$ConfigurationRevisionFromJson(
    Map<String, dynamic> json) {
  return ConfigurationRevision(
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    revision: json['revision'] as int,
    description: json['description'] as String,
  );
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    clusterArn: json['clusterArn'] as String,
    clusterName: json['clusterName'] as String,
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['state']),
  );
}

CreateConfigurationResponse _$CreateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationResponse(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    state: _$enumDecodeNullable(_$ConfigurationStateEnumMap, json['state']),
  );
}

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    clusterArn: json['clusterArn'] as String,
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['state']),
  );
}

DeleteConfigurationResponse _$DeleteConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConfigurationResponse(
    arn: json['arn'] as String,
    state: _$enumDecodeNullable(_$ConfigurationStateEnumMap, json['state']),
  );
}

DescribeClusterOperationResponse _$DescribeClusterOperationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClusterOperationResponse(
    clusterOperationInfo: json['clusterOperationInfo'] == null
        ? null
        : ClusterOperationInfo.fromJson(
            json['clusterOperationInfo'] as Map<String, dynamic>),
  );
}

DescribeClusterResponse _$DescribeClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClusterResponse(
    clusterInfo: json['clusterInfo'] == null
        ? null
        : ClusterInfo.fromJson(json['clusterInfo'] as Map<String, dynamic>),
  );
}

DescribeConfigurationResponse _$DescribeConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConfigurationResponse(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    kafkaVersions:
        (json['kafkaVersions'] as List)?.map((e) => e as String)?.toList(),
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    state: _$enumDecodeNullable(_$ConfigurationStateEnumMap, json['state']),
  );
}

DescribeConfigurationRevisionResponse
    _$DescribeConfigurationRevisionResponseFromJson(Map<String, dynamic> json) {
  return DescribeConfigurationRevisionResponse(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    revision: json['revision'] as int,
    serverProperties:
        const Uint8ListConverter().fromJson(json['serverProperties'] as String),
  );
}

BatchDisassociateScramSecretResponse
    _$BatchDisassociateScramSecretResponseFromJson(Map<String, dynamic> json) {
  return BatchDisassociateScramSecretResponse(
    clusterArn: json['clusterArn'] as String,
    unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

EBSStorageInfo _$EBSStorageInfoFromJson(Map<String, dynamic> json) {
  return EBSStorageInfo(
    volumeSize: json['volumeSize'] as int,
  );
}

Map<String, dynamic> _$EBSStorageInfoToJson(EBSStorageInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('volumeSize', instance.volumeSize);
  return val;
}

EncryptionAtRest _$EncryptionAtRestFromJson(Map<String, dynamic> json) {
  return EncryptionAtRest(
    dataVolumeKMSKeyId: json['dataVolumeKMSKeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionAtRestToJson(EncryptionAtRest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataVolumeKMSKeyId', instance.dataVolumeKMSKeyId);
  return val;
}

EncryptionInTransit _$EncryptionInTransitFromJson(Map<String, dynamic> json) {
  return EncryptionInTransit(
    clientBroker:
        _$enumDecodeNullable(_$ClientBrokerEnumMap, json['clientBroker']),
    inCluster: json['inCluster'] as bool,
  );
}

Map<String, dynamic> _$EncryptionInTransitToJson(EncryptionInTransit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientBroker', _$ClientBrokerEnumMap[instance.clientBroker]);
  writeNotNull('inCluster', instance.inCluster);
  return val;
}

const _$ClientBrokerEnumMap = {
  ClientBroker.tls: 'TLS',
  ClientBroker.tlsPlaintext: 'TLS_PLAINTEXT',
  ClientBroker.plaintext: 'PLAINTEXT',
};

EncryptionInfo _$EncryptionInfoFromJson(Map<String, dynamic> json) {
  return EncryptionInfo(
    encryptionAtRest: json['encryptionAtRest'] == null
        ? null
        : EncryptionAtRest.fromJson(
            json['encryptionAtRest'] as Map<String, dynamic>),
    encryptionInTransit: json['encryptionInTransit'] == null
        ? null
        : EncryptionInTransit.fromJson(
            json['encryptionInTransit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EncryptionInfoToJson(EncryptionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('encryptionAtRest', instance.encryptionAtRest?.toJson());
  writeNotNull('encryptionInTransit', instance.encryptionInTransit?.toJson());
  return val;
}

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  return ErrorInfo(
    errorCode: json['errorCode'] as String,
    errorString: json['errorString'] as String,
  );
}

Firehose _$FirehoseFromJson(Map<String, dynamic> json) {
  return Firehose(
    enabled: json['enabled'] as bool,
    deliveryStream: json['deliveryStream'] as String,
  );
}

Map<String, dynamic> _$FirehoseToJson(Firehose instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('deliveryStream', instance.deliveryStream);
  return val;
}

GetBootstrapBrokersResponse _$GetBootstrapBrokersResponseFromJson(
    Map<String, dynamic> json) {
  return GetBootstrapBrokersResponse(
    bootstrapBrokerString: json['bootstrapBrokerString'] as String,
    bootstrapBrokerStringSaslScram:
        json['bootstrapBrokerStringSaslScram'] as String,
    bootstrapBrokerStringTls: json['bootstrapBrokerStringTls'] as String,
  );
}

GetCompatibleKafkaVersionsResponse _$GetCompatibleKafkaVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetCompatibleKafkaVersionsResponse(
    compatibleKafkaVersions: (json['compatibleKafkaVersions'] as List)
        ?.map((e) => e == null
            ? null
            : CompatibleKafkaVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

KafkaVersion _$KafkaVersionFromJson(Map<String, dynamic> json) {
  return KafkaVersion(
    status: _$enumDecodeNullable(_$KafkaVersionStatusEnumMap, json['status']),
    version: json['version'] as String,
  );
}

const _$KafkaVersionStatusEnumMap = {
  KafkaVersionStatus.active: 'ACTIVE',
  KafkaVersionStatus.deprecated: 'DEPRECATED',
};

ListClusterOperationsResponse _$ListClusterOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListClusterOperationsResponse(
    clusterOperationInfoList: (json['clusterOperationInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : ClusterOperationInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListClustersResponse _$ListClustersResponseFromJson(Map<String, dynamic> json) {
  return ListClustersResponse(
    clusterInfoList: (json['clusterInfoList'] as List)
        ?.map((e) =>
            e == null ? null : ClusterInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListConfigurationRevisionsResponse _$ListConfigurationRevisionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationRevisionsResponse(
    nextToken: json['nextToken'] as String,
    revisions: (json['revisions'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationRevision.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListConfigurationsResponse _$ListConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationsResponse(
    configurations: (json['configurations'] as List)
        ?.map((e) => e == null
            ? null
            : Configuration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListKafkaVersionsResponse _$ListKafkaVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListKafkaVersionsResponse(
    kafkaVersions: (json['kafkaVersions'] as List)
        ?.map((e) =>
            e == null ? null : KafkaVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListNodesResponse _$ListNodesResponseFromJson(Map<String, dynamic> json) {
  return ListNodesResponse(
    nextToken: json['nextToken'] as String,
    nodeInfoList: (json['nodeInfoList'] as List)
        ?.map((e) =>
            e == null ? null : NodeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListScramSecretsResponse _$ListScramSecretsResponseFromJson(
    Map<String, dynamic> json) {
  return ListScramSecretsResponse(
    nextToken: json['nextToken'] as String,
    secretArnList:
        (json['secretArnList'] as List)?.map((e) => e as String)?.toList(),
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

LoggingInfo _$LoggingInfoFromJson(Map<String, dynamic> json) {
  return LoggingInfo(
    brokerLogs: json['brokerLogs'] == null
        ? null
        : BrokerLogs.fromJson(json['brokerLogs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggingInfoToJson(LoggingInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brokerLogs', instance.brokerLogs?.toJson());
  return val;
}

MutableClusterInfo _$MutableClusterInfoFromJson(Map<String, dynamic> json) {
  return MutableClusterInfo(
    brokerEBSVolumeInfo: (json['brokerEBSVolumeInfo'] as List)
        ?.map((e) => e == null
            ? null
            : BrokerEBSVolumeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    configurationInfo: json['configurationInfo'] == null
        ? null
        : ConfigurationInfo.fromJson(
            json['configurationInfo'] as Map<String, dynamic>),
    enhancedMonitoring: _$enumDecodeNullable(
        _$EnhancedMonitoringEnumMap, json['enhancedMonitoring']),
    kafkaVersion: json['kafkaVersion'] as String,
    loggingInfo: json['loggingInfo'] == null
        ? null
        : LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>),
    numberOfBrokerNodes: json['numberOfBrokerNodes'] as int,
    openMonitoring: json['openMonitoring'] == null
        ? null
        : OpenMonitoring.fromJson(
            json['openMonitoring'] as Map<String, dynamic>),
  );
}

NodeExporter _$NodeExporterFromJson(Map<String, dynamic> json) {
  return NodeExporter(
    enabledInBroker: json['enabledInBroker'] as bool,
  );
}

Map<String, dynamic> _$NodeExporterInfoToJson(NodeExporterInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabledInBroker', instance.enabledInBroker);
  return val;
}

JmxExporter _$JmxExporterFromJson(Map<String, dynamic> json) {
  return JmxExporter(
    enabledInBroker: json['enabledInBroker'] as bool,
  );
}

Map<String, dynamic> _$JmxExporterInfoToJson(JmxExporterInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabledInBroker', instance.enabledInBroker);
  return val;
}

OpenMonitoring _$OpenMonitoringFromJson(Map<String, dynamic> json) {
  return OpenMonitoring(
    prometheus: json['prometheus'] == null
        ? null
        : Prometheus.fromJson(json['prometheus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpenMonitoringInfoToJson(OpenMonitoringInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prometheus', instance.prometheus?.toJson());
  return val;
}

Prometheus _$PrometheusFromJson(Map<String, dynamic> json) {
  return Prometheus(
    jmxExporter: json['jmxExporter'] == null
        ? null
        : JmxExporter.fromJson(json['jmxExporter'] as Map<String, dynamic>),
    nodeExporter: json['nodeExporter'] == null
        ? null
        : NodeExporter.fromJson(json['nodeExporter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrometheusInfoToJson(PrometheusInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jmxExporter', instance.jmxExporter?.toJson());
  writeNotNull('nodeExporter', instance.nodeExporter?.toJson());
  return val;
}

RebootBrokerResponse _$RebootBrokerResponseFromJson(Map<String, dynamic> json) {
  return RebootBrokerResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

S3 _$S3FromJson(Map<String, dynamic> json) {
  return S3(
    enabled: json['enabled'] as bool,
    bucket: json['bucket'] as String,
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$S3ToJson(S3 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('bucket', instance.bucket);
  writeNotNull('prefix', instance.prefix);
  return val;
}

Sasl _$SaslFromJson(Map<String, dynamic> json) {
  return Sasl(
    scram: json['scram'] == null
        ? null
        : Scram.fromJson(json['scram'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaslToJson(Sasl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scram', instance.scram?.toJson());
  return val;
}

Scram _$ScramFromJson(Map<String, dynamic> json) {
  return Scram(
    enabled: json['enabled'] as bool,
  );
}

Map<String, dynamic> _$ScramToJson(Scram instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  return val;
}

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) {
  return NodeInfo(
    addedToClusterTime: json['addedToClusterTime'] as String,
    brokerNodeInfo: json['brokerNodeInfo'] == null
        ? null
        : BrokerNodeInfo.fromJson(
            json['brokerNodeInfo'] as Map<String, dynamic>),
    instanceType: json['instanceType'] as String,
    nodeARN: json['nodeARN'] as String,
    nodeType: _$enumDecodeNullable(_$NodeTypeEnumMap, json['nodeType']),
    zookeeperNodeInfo: json['zookeeperNodeInfo'] == null
        ? null
        : ZookeeperNodeInfo.fromJson(
            json['zookeeperNodeInfo'] as Map<String, dynamic>),
  );
}

const _$NodeTypeEnumMap = {
  NodeType.broker: 'BROKER',
};

StateInfo _$StateInfoFromJson(Map<String, dynamic> json) {
  return StateInfo(
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

StorageInfo _$StorageInfoFromJson(Map<String, dynamic> json) {
  return StorageInfo(
    ebsStorageInfo: json['ebsStorageInfo'] == null
        ? null
        : EBSStorageInfo.fromJson(
            json['ebsStorageInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StorageInfoToJson(StorageInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ebsStorageInfo', instance.ebsStorageInfo?.toJson());
  return val;
}

Tls _$TlsFromJson(Map<String, dynamic> json) {
  return Tls(
    certificateAuthorityArnList: (json['certificateAuthorityArnList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$TlsToJson(Tls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'certificateAuthorityArnList', instance.certificateAuthorityArnList);
  return val;
}

UnprocessedScramSecret _$UnprocessedScramSecretFromJson(
    Map<String, dynamic> json) {
  return UnprocessedScramSecret(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    secretArn: json['secretArn'] as String,
  );
}

UpdateBrokerCountResponse _$UpdateBrokerCountResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBrokerCountResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

UpdateBrokerStorageResponse _$UpdateBrokerStorageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBrokerStorageResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

UpdateClusterConfigurationResponse _$UpdateClusterConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterConfigurationResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

UpdateClusterKafkaVersionResponse _$UpdateClusterKafkaVersionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterKafkaVersionResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

UpdateMonitoringResponse _$UpdateMonitoringResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMonitoringResponse(
    clusterArn: json['clusterArn'] as String,
    clusterOperationArn: json['clusterOperationArn'] as String,
  );
}

UpdateConfigurationResponse _$UpdateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConfigurationResponse(
    arn: json['arn'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
  );
}

ZookeeperNodeInfo _$ZookeeperNodeInfoFromJson(Map<String, dynamic> json) {
  return ZookeeperNodeInfo(
    attachedENIId: json['attachedENIId'] as String,
    clientVpcIpAddress: json['clientVpcIpAddress'] as String,
    endpoints: (json['endpoints'] as List)?.map((e) => e as String)?.toList(),
    zookeeperId: (json['zookeeperId'] as num)?.toDouble(),
    zookeeperVersion: json['zookeeperVersion'] as String,
  );
}
