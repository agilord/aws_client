// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redshift-2012-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeleteClusterSnapshotMessageToJson(
    DeleteClusterSnapshotMessage instance) {
  final val = <String, dynamic>{
    'SnapshotIdentifier': instance.snapshotIdentifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotClusterIdentifier', instance.snapshotClusterIdentifier);
  return val;
}

Map<String, dynamic> _$NodeConfigurationOptionsFilterToJson(
    NodeConfigurationOptionsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Name', _$NodeConfigurationOptionsFilterNameEnumMap[instance.name]);
  writeNotNull('Operator', _$OperatorTypeEnumMap[instance.operator]);
  writeNotNull('Value', instance.values);
  return val;
}

const _$NodeConfigurationOptionsFilterNameEnumMap = {
  NodeConfigurationOptionsFilterName.nodeType: 'NodeType',
  NodeConfigurationOptionsFilterName.numberOfNodes: 'NumberOfNodes',
  NodeConfigurationOptionsFilterName.estimatedDiskUtilizationPercent:
      'EstimatedDiskUtilizationPercent',
  NodeConfigurationOptionsFilterName.mode: 'Mode',
};

const _$OperatorTypeEnumMap = {
  OperatorType.eq: 'eq',
  OperatorType.lt: 'lt',
  OperatorType.gt: 'gt',
  OperatorType.le: 'le',
  OperatorType.ge: 'ge',
  OperatorType.$in: 'in',
  OperatorType.between: 'between',
};

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedValues', instance.allowedValues);
  writeNotNull('ApplyType', _$ParameterApplyTypeEnumMap[instance.applyType]);
  writeNotNull('DataType', instance.dataType);
  writeNotNull('Description', instance.description);
  writeNotNull('IsModifiable', instance.isModifiable);
  writeNotNull('MinimumEngineVersion', instance.minimumEngineVersion);
  writeNotNull('ParameterName', instance.parameterName);
  writeNotNull('ParameterValue', instance.parameterValue);
  writeNotNull('Source', instance.source);
  return val;
}

const _$ParameterApplyTypeEnumMap = {
  ParameterApplyType.static: 'static',
  ParameterApplyType.dynamic: 'dynamic',
};

Map<String, dynamic> _$PauseClusterMessageToJson(
        PauseClusterMessage instance) =>
    <String, dynamic>{
      'ClusterIdentifier': instance.clusterIdentifier,
    };

Map<String, dynamic> _$ResizeClusterMessageToJson(
    ResizeClusterMessage instance) {
  final val = <String, dynamic>{
    'ClusterIdentifier': instance.clusterIdentifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Classic', instance.classic);
  writeNotNull('ClusterType', instance.clusterType);
  writeNotNull('NodeType', instance.nodeType);
  writeNotNull('NumberOfNodes', instance.numberOfNodes);
  return val;
}

Map<String, dynamic> _$ResumeClusterMessageToJson(
        ResumeClusterMessage instance) =>
    <String, dynamic>{
      'ClusterIdentifier': instance.clusterIdentifier,
    };

Map<String, dynamic> _$ScheduledActionFilterToJson(
        ScheduledActionFilter instance) =>
    <String, dynamic>{
      'Name': _$ScheduledActionFilterNameEnumMap[instance.name],
      'Values': instance.values,
    };

const _$ScheduledActionFilterNameEnumMap = {
  ScheduledActionFilterName.clusterIdentifier: 'cluster-identifier',
  ScheduledActionFilterName.iamRole: 'iam-role',
};

Map<String, dynamic> _$ScheduledActionTypeToJson(ScheduledActionType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PauseCluster', instance.pauseCluster?.toJson());
  writeNotNull('ResizeCluster', instance.resizeCluster?.toJson());
  writeNotNull('ResumeCluster', instance.resumeCluster?.toJson());
  return val;
}

Map<String, dynamic> _$SnapshotSortingEntityToJson(
    SnapshotSortingEntity instance) {
  final val = <String, dynamic>{
    'Attribute': _$SnapshotAttributeToSortByEnumMap[instance.attribute],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SortOrder', _$SortByOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SnapshotAttributeToSortByEnumMap = {
  SnapshotAttributeToSortBy.sourceType: 'SOURCE_TYPE',
  SnapshotAttributeToSortBy.totalSize: 'TOTAL_SIZE',
  SnapshotAttributeToSortBy.createTime: 'CREATE_TIME',
};

const _$SortByOrderEnumMap = {
  SortByOrder.asc: 'ASC',
  SortByOrder.desc: 'DESC',
};

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
