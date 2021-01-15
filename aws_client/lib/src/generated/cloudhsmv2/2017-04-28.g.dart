// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-04-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backup _$BackupFromJson(Map<String, dynamic> json) {
  return Backup(
    backupId: json['BackupId'] as String,
    backupState:
        _$enumDecodeNullable(_$BackupStateEnumMap, json['BackupState']),
    clusterId: json['ClusterId'] as String,
    copyTimestamp:
        const UnixDateTimeConverter().fromJson(json['CopyTimestamp']),
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    deleteTimestamp:
        const UnixDateTimeConverter().fromJson(json['DeleteTimestamp']),
    neverExpires: json['NeverExpires'] as bool,
    sourceBackup: json['SourceBackup'] as String,
    sourceCluster: json['SourceCluster'] as String,
    sourceRegion: json['SourceRegion'] as String,
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

const _$BackupStateEnumMap = {
  BackupState.createInProgress: 'CREATE_IN_PROGRESS',
  BackupState.ready: 'READY',
  BackupState.deleted: 'DELETED',
  BackupState.pendingDeletion: 'PENDING_DELETION',
};

BackupRetentionPolicy _$BackupRetentionPolicyFromJson(
    Map<String, dynamic> json) {
  return BackupRetentionPolicy(
    type: _$enumDecodeNullable(_$BackupRetentionTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$BackupRetentionPolicyToJson(
    BackupRetentionPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$BackupRetentionTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$BackupRetentionTypeEnumMap = {
  BackupRetentionType.days: 'DAYS',
};

Certificates _$CertificatesFromJson(Map<String, dynamic> json) {
  return Certificates(
    awsHardwareCertificate: json['AwsHardwareCertificate'] as String,
    clusterCertificate: json['ClusterCertificate'] as String,
    clusterCsr: json['ClusterCsr'] as String,
    hsmCertificate: json['HsmCertificate'] as String,
    manufacturerHardwareCertificate:
        json['ManufacturerHardwareCertificate'] as String,
  );
}

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return Cluster(
    backupPolicy:
        _$enumDecodeNullable(_$BackupPolicyEnumMap, json['BackupPolicy']),
    backupRetentionPolicy: json['BackupRetentionPolicy'] == null
        ? null
        : BackupRetentionPolicy.fromJson(
            json['BackupRetentionPolicy'] as Map<String, dynamic>),
    certificates: json['Certificates'] == null
        ? null
        : Certificates.fromJson(json['Certificates'] as Map<String, dynamic>),
    clusterId: json['ClusterId'] as String,
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    hsmType: json['HsmType'] as String,
    hsms: (json['Hsms'] as List)
        ?.map((e) => e == null ? null : Hsm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    preCoPassword: json['PreCoPassword'] as String,
    securityGroup: json['SecurityGroup'] as String,
    sourceBackupId: json['SourceBackupId'] as String,
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['State']),
    stateMessage: json['StateMessage'] as String,
    subnetMapping: (json['SubnetMapping'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

const _$BackupPolicyEnumMap = {
  BackupPolicy.$default: 'DEFAULT',
};

const _$ClusterStateEnumMap = {
  ClusterState.createInProgress: 'CREATE_IN_PROGRESS',
  ClusterState.uninitialized: 'UNINITIALIZED',
  ClusterState.initializeInProgress: 'INITIALIZE_IN_PROGRESS',
  ClusterState.initialized: 'INITIALIZED',
  ClusterState.active: 'ACTIVE',
  ClusterState.updateInProgress: 'UPDATE_IN_PROGRESS',
  ClusterState.deleteInProgress: 'DELETE_IN_PROGRESS',
  ClusterState.deleted: 'DELETED',
  ClusterState.degraded: 'DEGRADED',
};

CopyBackupToRegionResponse _$CopyBackupToRegionResponseFromJson(
    Map<String, dynamic> json) {
  return CopyBackupToRegionResponse(
    destinationBackup: json['DestinationBackup'] == null
        ? null
        : DestinationBackup.fromJson(
            json['DestinationBackup'] as Map<String, dynamic>),
  );
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

CreateHsmResponse _$CreateHsmResponseFromJson(Map<String, dynamic> json) {
  return CreateHsmResponse(
    hsm: json['Hsm'] == null
        ? null
        : Hsm.fromJson(json['Hsm'] as Map<String, dynamic>),
  );
}

DeleteBackupResponse _$DeleteBackupResponseFromJson(Map<String, dynamic> json) {
  return DeleteBackupResponse(
    backup: json['Backup'] == null
        ? null
        : Backup.fromJson(json['Backup'] as Map<String, dynamic>),
  );
}

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

DeleteHsmResponse _$DeleteHsmResponseFromJson(Map<String, dynamic> json) {
  return DeleteHsmResponse(
    hsmId: json['HsmId'] as String,
  );
}

DescribeBackupsResponse _$DescribeBackupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBackupsResponse(
    backups: (json['Backups'] as List)
        ?.map((e) =>
            e == null ? null : Backup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeClustersResponse _$DescribeClustersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClustersResponse(
    clusters: (json['Clusters'] as List)
        ?.map((e) =>
            e == null ? null : Cluster.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DestinationBackup _$DestinationBackupFromJson(Map<String, dynamic> json) {
  return DestinationBackup(
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    sourceBackup: json['SourceBackup'] as String,
    sourceCluster: json['SourceCluster'] as String,
    sourceRegion: json['SourceRegion'] as String,
  );
}

Hsm _$HsmFromJson(Map<String, dynamic> json) {
  return Hsm(
    hsmId: json['HsmId'] as String,
    availabilityZone: json['AvailabilityZone'] as String,
    clusterId: json['ClusterId'] as String,
    eniId: json['EniId'] as String,
    eniIp: json['EniIp'] as String,
    state: _$enumDecodeNullable(_$HsmStateEnumMap, json['State']),
    stateMessage: json['StateMessage'] as String,
    subnetId: json['SubnetId'] as String,
  );
}

const _$HsmStateEnumMap = {
  HsmState.createInProgress: 'CREATE_IN_PROGRESS',
  HsmState.active: 'ACTIVE',
  HsmState.degraded: 'DEGRADED',
  HsmState.deleteInProgress: 'DELETE_IN_PROGRESS',
  HsmState.deleted: 'DELETED',
};

InitializeClusterResponse _$InitializeClusterResponseFromJson(
    Map<String, dynamic> json) {
  return InitializeClusterResponse(
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['State']),
    stateMessage: json['StateMessage'] as String,
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ModifyBackupAttributesResponse _$ModifyBackupAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyBackupAttributesResponse(
    backup: json['Backup'] == null
        ? null
        : Backup.fromJson(json['Backup'] as Map<String, dynamic>),
  );
}

ModifyClusterResponse _$ModifyClusterResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

RestoreBackupResponse _$RestoreBackupResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreBackupResponse(
    backup: json['Backup'] == null
        ? null
        : Backup.fromJson(json['Backup'] as Map<String, dynamic>),
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
