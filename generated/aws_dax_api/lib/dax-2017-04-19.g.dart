// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dax-2017-04-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return Cluster(
    activeNodes: json['ActiveNodes'] as int,
    clusterArn: json['ClusterArn'] as String,
    clusterDiscoveryEndpoint: json['ClusterDiscoveryEndpoint'] == null
        ? null
        : Endpoint.fromJson(
            json['ClusterDiscoveryEndpoint'] as Map<String, dynamic>),
    clusterName: json['ClusterName'] as String,
    description: json['Description'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    nodeIdsToRemove:
        (json['NodeIdsToRemove'] as List)?.map((e) => e as String)?.toList(),
    nodeType: json['NodeType'] as String,
    nodes: (json['Nodes'] as List)
        ?.map(
            (e) => e == null ? null : Node.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    notificationConfiguration: json['NotificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['NotificationConfiguration'] as Map<String, dynamic>),
    parameterGroup: json['ParameterGroup'] == null
        ? null
        : ParameterGroupStatus.fromJson(
            json['ParameterGroup'] as Map<String, dynamic>),
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    sSEDescription: json['SSEDescription'] == null
        ? null
        : SSEDescription.fromJson(
            json['SSEDescription'] as Map<String, dynamic>),
    securityGroups: (json['SecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityGroupMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['Status'] as String,
    subnetGroup: json['SubnetGroup'] as String,
    totalNodes: json['TotalNodes'] as int,
  );
}

Map<String, dynamic> _$CreateClusterRequestToJson(
    CreateClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('NodeType', instance.nodeType);
  writeNotNull('ReplicationFactor', instance.replicationFactor);
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('Description', instance.description);
  writeNotNull('NotificationTopicArn', instance.notificationTopicArn);
  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('SSESpecification', instance.sSESpecification?.toJson());
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetGroupName', instance.subnetGroupName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateParameterGroupRequestToJson(
    CreateParameterGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  writeNotNull('Description', instance.description);
  return val;
}

CreateParameterGroupResponse _$CreateParameterGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateParameterGroupResponse(
    parameterGroup: json['ParameterGroup'] == null
        ? null
        : ParameterGroup.fromJson(
            json['ParameterGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateSubnetGroupRequestToJson(
    CreateSubnetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetGroupName', instance.subnetGroupName);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('Description', instance.description);
  return val;
}

CreateSubnetGroupResponse _$CreateSubnetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSubnetGroupResponse(
    subnetGroup: json['SubnetGroup'] == null
        ? null
        : SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DecreaseReplicationFactorRequestToJson(
    DecreaseReplicationFactorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  writeNotNull('NewReplicationFactor', instance.newReplicationFactor);
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('NodeIdsToRemove', instance.nodeIdsToRemove);
  return val;
}

DecreaseReplicationFactorResponse _$DecreaseReplicationFactorResponseFromJson(
    Map<String, dynamic> json) {
  return DecreaseReplicationFactorResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteClusterRequestToJson(
    DeleteClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  return val;
}

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteParameterGroupRequestToJson(
    DeleteParameterGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  return val;
}

DeleteParameterGroupResponse _$DeleteParameterGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteParameterGroupResponse(
    deletionMessage: json['DeletionMessage'] as String,
  );
}

Map<String, dynamic> _$DeleteSubnetGroupRequestToJson(
    DeleteSubnetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetGroupName', instance.subnetGroupName);
  return val;
}

DeleteSubnetGroupResponse _$DeleteSubnetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSubnetGroupResponse(
    deletionMessage: json['DeletionMessage'] as String,
  );
}

Map<String, dynamic> _$DescribeClustersRequestToJson(
    DescribeClustersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterNames', instance.clusterNames);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$DescribeDefaultParametersRequestToJson(
    DescribeDefaultParametersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeDefaultParametersResponse _$DescribeDefaultParametersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDefaultParametersResponse(
    nextToken: json['NextToken'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) =>
            e == null ? null : Parameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeEventsRequestToJson(
    DescribeEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Duration', instance.duration);
  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SourceName', instance.sourceName);
  writeNotNull('SourceType', _$SourceTypeEnumMap[instance.sourceType]);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}

const _$SourceTypeEnumMap = {
  SourceType.cluster: 'CLUSTER',
  SourceType.parameterGroup: 'PARAMETER_GROUP',
  SourceType.subnetGroup: 'SUBNET_GROUP',
};

DescribeEventsResponse _$DescribeEventsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventsResponse(
    events: (json['Events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeParameterGroupsRequestToJson(
    DescribeParameterGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ParameterGroupNames', instance.parameterGroupNames);
  return val;
}

DescribeParameterGroupsResponse _$DescribeParameterGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeParameterGroupsResponse(
    nextToken: json['NextToken'] as String,
    parameterGroups: (json['ParameterGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeParametersRequestToJson(
    DescribeParametersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Source', instance.source);
  return val;
}

DescribeParametersResponse _$DescribeParametersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeParametersResponse(
    nextToken: json['NextToken'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) =>
            e == null ? null : Parameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeSubnetGroupsRequestToJson(
    DescribeSubnetGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SubnetGroupNames', instance.subnetGroupNames);
  return val;
}

DescribeSubnetGroupsResponse _$DescribeSubnetGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSubnetGroupsResponse(
    nextToken: json['NextToken'] as String,
    subnetGroups: (json['SubnetGroups'] as List)
        ?.map((e) =>
            e == null ? null : SubnetGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    address: json['Address'] as String,
    port: json['Port'] as int,
  );
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    date: unixTimestampFromJson(json['Date']),
    message: json['Message'] as String,
    sourceName: json['SourceName'] as String,
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['SourceType']),
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

Map<String, dynamic> _$IncreaseReplicationFactorRequestToJson(
    IncreaseReplicationFactorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  writeNotNull('NewReplicationFactor', instance.newReplicationFactor);
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  return val;
}

IncreaseReplicationFactorResponse _$IncreaseReplicationFactorResponseFromJson(
    Map<String, dynamic> json) {
  return IncreaseReplicationFactorResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListTagsRequestToJson(ListTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceName', instance.resourceName);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Node _$NodeFromJson(Map<String, dynamic> json) {
  return Node(
    availabilityZone: json['AvailabilityZone'] as String,
    endpoint: json['Endpoint'] == null
        ? null
        : Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>),
    nodeCreateTime: unixTimestampFromJson(json['NodeCreateTime']),
    nodeId: json['NodeId'] as String,
    nodeStatus: json['NodeStatus'] as String,
    parameterGroupStatus: json['ParameterGroupStatus'] as String,
  );
}

NodeTypeSpecificValue _$NodeTypeSpecificValueFromJson(
    Map<String, dynamic> json) {
  return NodeTypeSpecificValue(
    nodeType: json['NodeType'] as String,
    value: json['Value'] as String,
  );
}

NotificationConfiguration _$NotificationConfigurationFromJson(
    Map<String, dynamic> json) {
  return NotificationConfiguration(
    topicArn: json['TopicArn'] as String,
    topicStatus: json['TopicStatus'] as String,
  );
}

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return Parameter(
    allowedValues: json['AllowedValues'] as String,
    changeType: _$enumDecodeNullable(_$ChangeTypeEnumMap, json['ChangeType']),
    dataType: json['DataType'] as String,
    description: json['Description'] as String,
    isModifiable:
        _$enumDecodeNullable(_$IsModifiableEnumMap, json['IsModifiable']),
    nodeTypeSpecificValues: (json['NodeTypeSpecificValues'] as List)
        ?.map((e) => e == null
            ? null
            : NodeTypeSpecificValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parameterName: json['ParameterName'] as String,
    parameterType:
        _$enumDecodeNullable(_$ParameterTypeEnumMap, json['ParameterType']),
    parameterValue: json['ParameterValue'] as String,
    source: json['Source'] as String,
  );
}

const _$ChangeTypeEnumMap = {
  ChangeType.immediate: 'IMMEDIATE',
  ChangeType.requiresReboot: 'REQUIRES_REBOOT',
};

const _$IsModifiableEnumMap = {
  IsModifiable.$true: 'TRUE',
  IsModifiable.$false: 'FALSE',
  IsModifiable.conditional: 'CONDITIONAL',
};

const _$ParameterTypeEnumMap = {
  ParameterType.$default: 'DEFAULT',
  ParameterType.nodeTypeSpecific: 'NODE_TYPE_SPECIFIC',
};

ParameterGroup _$ParameterGroupFromJson(Map<String, dynamic> json) {
  return ParameterGroup(
    description: json['Description'] as String,
    parameterGroupName: json['ParameterGroupName'] as String,
  );
}

ParameterGroupStatus _$ParameterGroupStatusFromJson(Map<String, dynamic> json) {
  return ParameterGroupStatus(
    nodeIdsToReboot:
        (json['NodeIdsToReboot'] as List)?.map((e) => e as String)?.toList(),
    parameterApplyStatus: json['ParameterApplyStatus'] as String,
    parameterGroupName: json['ParameterGroupName'] as String,
  );
}

Map<String, dynamic> _$ParameterNameValueToJson(ParameterNameValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterName', instance.parameterName);
  writeNotNull('ParameterValue', instance.parameterValue);
  return val;
}

Map<String, dynamic> _$RebootNodeRequestToJson(RebootNodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  writeNotNull('NodeId', instance.nodeId);
  return val;
}

RebootNodeResponse _$RebootNodeResponseFromJson(Map<String, dynamic> json) {
  return RebootNodeResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

SSEDescription _$SSEDescriptionFromJson(Map<String, dynamic> json) {
  return SSEDescription(
    status: _$enumDecodeNullable(_$SSEStatusEnumMap, json['Status']),
  );
}

const _$SSEStatusEnumMap = {
  SSEStatus.enabling: 'ENABLING',
  SSEStatus.enabled: 'ENABLED',
  SSEStatus.disabling: 'DISABLING',
  SSEStatus.disabled: 'DISABLED',
};

Map<String, dynamic> _$SSESpecificationToJson(SSESpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

SecurityGroupMembership _$SecurityGroupMembershipFromJson(
    Map<String, dynamic> json) {
  return SecurityGroupMembership(
    securityGroupIdentifier: json['SecurityGroupIdentifier'] as String,
    status: json['Status'] as String,
  );
}

Subnet _$SubnetFromJson(Map<String, dynamic> json) {
  return Subnet(
    subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String,
    subnetIdentifier: json['SubnetIdentifier'] as String,
  );
}

SubnetGroup _$SubnetGroupFromJson(Map<String, dynamic> json) {
  return SubnetGroup(
    description: json['Description'] as String,
    subnetGroupName: json['SubnetGroupName'] as String,
    subnets: (json['Subnets'] as List)
        ?.map((e) =>
            e == null ? null : Subnet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcId: json['VpcId'] as String,
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

  writeNotNull('ResourceName', instance.resourceName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceName', instance.resourceName);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateClusterRequestToJson(
    UpdateClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterName', instance.clusterName);
  writeNotNull('Description', instance.description);
  writeNotNull('NotificationTopicArn', instance.notificationTopicArn);
  writeNotNull('NotificationTopicStatus', instance.notificationTopicStatus);
  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  return val;
}

UpdateClusterResponse _$UpdateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterResponse(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateParameterGroupRequestToJson(
    UpdateParameterGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  writeNotNull('ParameterNameValues',
      instance.parameterNameValues?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateParameterGroupResponse _$UpdateParameterGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateParameterGroupResponse(
    parameterGroup: json['ParameterGroup'] == null
        ? null
        : ParameterGroup.fromJson(
            json['ParameterGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateSubnetGroupRequestToJson(
    UpdateSubnetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetGroupName', instance.subnetGroupName);
  writeNotNull('Description', instance.description);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

UpdateSubnetGroupResponse _$UpdateSubnetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSubnetGroupResponse(
    subnetGroup: json['SubnetGroup'] == null
        ? null
        : SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>),
  );
}
