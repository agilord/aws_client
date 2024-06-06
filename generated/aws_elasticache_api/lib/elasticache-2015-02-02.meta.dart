// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AZMode": {"type": "string", "flattened": false},
  "AccessString": {"type": "string", "flattened": false},
  "AddTagsToResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "AllowedNodeGroupId": {"type": "string", "flattened": false},
  "AllowedNodeTypeModificationsMessage": {
    "type": "structure",
    "members": {
      "ScaleUpModifications": {"shape": "NodeTypeList", "flattened": false},
      "ScaleDownModifications": {"shape": "NodeTypeList", "flattened": false}
    },
    "flattened": false
  },
  "AuthTokenUpdateStatus": {"type": "string", "flattened": false},
  "AuthTokenUpdateStrategyType": {"type": "string", "flattened": false},
  "Authentication": {
    "type": "structure",
    "members": {
      "Type": {"shape": "AuthenticationType", "flattened": false},
      "PasswordCount": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "AuthenticationMode": {
    "type": "structure",
    "members": {
      "Type": {"shape": "InputAuthenticationType", "flattened": false},
      "Passwords": {"shape": "PasswordListInput", "flattened": false}
    },
    "flattened": false
  },
  "AuthenticationType": {"type": "string", "flattened": false},
  "AuthorizeCacheSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeCacheSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "CacheSecurityGroup": {"shape": "CacheSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "AutomaticFailoverStatus": {"type": "string", "flattened": false},
  "AvailabilityZone": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AvailabilityZonesList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AvailabilityZone"},
    "flattened": false
  },
  "BatchApplyUpdateActionMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupIds": {
        "shape": "ReplicationGroupIdList",
        "flattened": false
      },
      "CacheClusterIds": {"shape": "CacheClusterIdList", "flattened": false},
      "ServiceUpdateName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "BatchStopUpdateActionMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupIds": {
        "shape": "ReplicationGroupIdList",
        "flattened": false
      },
      "CacheClusterIds": {"shape": "CacheClusterIdList", "flattened": false},
      "ServiceUpdateName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "BooleanOptional": {"type": "boolean", "flattened": false},
  "CacheCluster": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ConfigurationEndpoint": {"shape": "Endpoint", "flattened": false},
      "ClientDownloadLandingPage": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheClusterStatus": {"shape": "String", "flattened": false},
      "NumCacheNodes": {"shape": "IntegerOptional", "flattened": false},
      "PreferredAvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredOutpostArn": {"shape": "String", "flattened": false},
      "CacheClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "PendingModifiedValues": {
        "shape": "PendingModifiedValues",
        "flattened": false
      },
      "NotificationConfiguration": {
        "shape": "NotificationConfiguration",
        "flattened": false
      },
      "CacheSecurityGroups": {
        "shape": "CacheSecurityGroupMembershipList",
        "flattened": false
      },
      "CacheParameterGroup": {
        "shape": "CacheParameterGroupStatus",
        "flattened": false
      },
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheNodes": {"shape": "CacheNodeList", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "SecurityGroups": {
        "shape": "SecurityGroupMembershipList",
        "flattened": false
      },
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "AuthTokenEnabled": {"shape": "BooleanOptional", "flattened": false},
      "AuthTokenLastModifiedDate": {"shape": "TStamp", "flattened": false},
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AtRestEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ARN": {"shape": "String", "flattened": false},
      "ReplicationGroupLogDeliveryEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationList",
        "flattened": false
      },
      "NetworkType": {"shape": "NetworkType", "flattened": false},
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false},
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CacheClusterIdList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "CacheClusterList": {
    "type": "list",
    "member": {"shape": "CacheCluster", "locationName": "CacheCluster"},
    "flattened": false
  },
  "CacheClusterMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "CacheClusters": {"shape": "CacheClusterList", "flattened": false}
    },
    "flattened": false
  },
  "CacheEngineVersion": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "CacheEngineDescription": {"shape": "String", "flattened": false},
      "CacheEngineVersionDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheEngineVersionList": {
    "type": "list",
    "member": {
      "shape": "CacheEngineVersion",
      "locationName": "CacheEngineVersion"
    },
    "flattened": false
  },
  "CacheEngineVersionMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "CacheEngineVersions": {
        "shape": "CacheEngineVersionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CacheNode": {
    "type": "structure",
    "members": {
      "CacheNodeId": {"shape": "String", "flattened": false},
      "CacheNodeStatus": {"shape": "String", "flattened": false},
      "CacheNodeCreateTime": {"shape": "TStamp", "flattened": false},
      "Endpoint": {"shape": "Endpoint", "flattened": false},
      "ParameterGroupStatus": {"shape": "String", "flattened": false},
      "SourceCacheNodeId": {"shape": "String", "flattened": false},
      "CustomerAvailabilityZone": {"shape": "String", "flattened": false},
      "CustomerOutpostArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheNodeIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "CacheNodeId"},
    "flattened": false
  },
  "CacheNodeList": {
    "type": "list",
    "member": {"shape": "CacheNode", "locationName": "CacheNode"},
    "flattened": false
  },
  "CacheNodeTypeSpecificParameter": {
    "type": "structure",
    "members": {
      "ParameterName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "DataType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false},
      "CacheNodeTypeSpecificValues": {
        "shape": "CacheNodeTypeSpecificValueList",
        "flattened": false
      },
      "ChangeType": {"shape": "ChangeType", "flattened": false}
    },
    "flattened": false
  },
  "CacheNodeTypeSpecificParametersList": {
    "type": "list",
    "member": {
      "shape": "CacheNodeTypeSpecificParameter",
      "locationName": "CacheNodeTypeSpecificParameter"
    },
    "flattened": false
  },
  "CacheNodeTypeSpecificValue": {
    "type": "structure",
    "members": {
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheNodeTypeSpecificValueList": {
    "type": "list",
    "member": {
      "shape": "CacheNodeTypeSpecificValue",
      "locationName": "CacheNodeTypeSpecificValue"
    },
    "flattened": false
  },
  "CacheNodeUpdateStatus": {
    "type": "structure",
    "members": {
      "CacheNodeId": {"shape": "String", "flattened": false},
      "NodeUpdateStatus": {"shape": "NodeUpdateStatus", "flattened": false},
      "NodeDeletionDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateStartDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateEndDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateInitiatedBy": {
        "shape": "NodeUpdateInitiatedBy",
        "flattened": false
      },
      "NodeUpdateInitiatedDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateStatusModifiedDate": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "CacheNodeUpdateStatusList": {
    "type": "list",
    "member": {
      "shape": "CacheNodeUpdateStatus",
      "locationName": "CacheNodeUpdateStatus"
    },
    "flattened": false
  },
  "CacheParameterGroup": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "IsGlobal": {"shape": "Boolean", "flattened": false},
      "ARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheParameterGroupDetails": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false},
      "CacheNodeTypeSpecificParameters": {
        "shape": "CacheNodeTypeSpecificParametersList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CacheParameterGroupList": {
    "type": "list",
    "member": {
      "shape": "CacheParameterGroup",
      "locationName": "CacheParameterGroup"
    },
    "flattened": false
  },
  "CacheParameterGroupNameMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheParameterGroupStatus": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterApplyStatus": {"shape": "String", "flattened": false},
      "CacheNodeIdsToReboot": {"shape": "CacheNodeIdsList", "flattened": false}
    },
    "flattened": false
  },
  "CacheParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "CacheParameterGroups": {
        "shape": "CacheParameterGroupList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CacheSecurityGroup": {
    "type": "structure",
    "members": {
      "OwnerId": {"shape": "String", "flattened": false},
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "EC2SecurityGroups": {
        "shape": "EC2SecurityGroupList",
        "flattened": false
      },
      "ARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheSecurityGroupMembership": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CacheSecurityGroupMembershipList": {
    "type": "list",
    "member": {
      "shape": "CacheSecurityGroupMembership",
      "locationName": "CacheSecurityGroup"
    },
    "flattened": false
  },
  "CacheSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "CacheSecurityGroups": {
        "shape": "CacheSecurityGroups",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CacheSecurityGroupNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "CacheSecurityGroupName"},
    "flattened": false
  },
  "CacheSecurityGroups": {
    "type": "list",
    "member": {
      "shape": "CacheSecurityGroup",
      "locationName": "CacheSecurityGroup"
    },
    "flattened": false
  },
  "CacheSubnetGroup": {
    "type": "structure",
    "members": {
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupDescription": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "Subnets": {"shape": "SubnetList", "flattened": false},
      "ARN": {"shape": "String", "flattened": false},
      "SupportedNetworkTypes": {"shape": "NetworkTypeList", "flattened": false}
    },
    "flattened": false
  },
  "CacheSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "CacheSubnetGroups": {"shape": "CacheSubnetGroups", "flattened": false}
    },
    "flattened": false
  },
  "CacheSubnetGroups": {
    "type": "list",
    "member": {"shape": "CacheSubnetGroup", "locationName": "CacheSubnetGroup"},
    "flattened": false
  },
  "CacheUsageLimits": {
    "type": "structure",
    "members": {
      "DataStorage": {"shape": "DataStorage", "flattened": false},
      "ECPUPerSecond": {"shape": "ECPUPerSecond", "flattened": false}
    },
    "flattened": false
  },
  "ChangeType": {"type": "string", "flattened": false},
  "CloudWatchLogsDestinationDetails": {
    "type": "structure",
    "members": {
      "LogGroup": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterIdList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ClusterId"},
    "flattened": false
  },
  "ClusterMode": {"type": "string", "flattened": false},
  "CompleteMigrationMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "Force": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "CompleteMigrationResponse": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "ConfigureShard": {
    "type": "structure",
    "members": {
      "NodeGroupId": {"shape": "AllowedNodeGroupId", "flattened": false},
      "NewReplicaCount": {"shape": "Integer", "flattened": false},
      "PreferredAvailabilityZones": {
        "shape": "PreferredAvailabilityZoneList",
        "flattened": false
      },
      "PreferredOutpostArns": {
        "shape": "PreferredOutpostArnList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CopyServerlessCacheSnapshotRequest": {
    "type": "structure",
    "members": {
      "SourceServerlessCacheSnapshotName": {
        "shape": "String",
        "flattened": false
      },
      "TargetServerlessCacheSnapshotName": {
        "shape": "String",
        "flattened": false
      },
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopyServerlessCacheSnapshotResponse": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshot": {
        "shape": "ServerlessCacheSnapshot",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CopySnapshotMessage": {
    "type": "structure",
    "members": {
      "SourceSnapshotName": {"shape": "String", "flattened": false},
      "TargetSnapshotName": {"shape": "String", "flattened": false},
      "TargetBucket": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopySnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheClusterMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "AZMode": {"shape": "AZMode", "flattened": false},
      "PreferredAvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredAvailabilityZones": {
        "shape": "PreferredAvailabilityZoneList",
        "flattened": false
      },
      "NumCacheNodes": {"shape": "IntegerOptional", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheSecurityGroupNames": {
        "shape": "CacheSecurityGroupNameList",
        "flattened": false
      },
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "SnapshotArns": {"shape": "SnapshotArnsList", "flattened": false},
      "SnapshotName": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "NotificationTopicArn": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "AuthToken": {"shape": "String", "flattened": false},
      "OutpostMode": {"shape": "OutpostMode", "flattened": false},
      "PreferredOutpostArn": {"shape": "String", "flattened": false},
      "PreferredOutpostArns": {
        "shape": "PreferredOutpostArnList",
        "flattened": false
      },
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationRequestList",
        "flattened": false
      },
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "NetworkType": {"shape": "NetworkType", "flattened": false},
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheClusterResult": {
    "type": "structure",
    "members": {
      "CacheCluster": {"shape": "CacheCluster", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheParameterGroupMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheParameterGroupResult": {
    "type": "structure",
    "members": {
      "CacheParameterGroup": {
        "shape": "CacheParameterGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateCacheSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheSecurityGroupResult": {
    "type": "structure",
    "members": {
      "CacheSecurityGroup": {"shape": "CacheSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupDescription": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateCacheSubnetGroupResult": {
    "type": "structure",
    "members": {
      "CacheSubnetGroup": {"shape": "CacheSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupIdSuffix": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupDescription": {
        "shape": "String",
        "flattened": false
      },
      "PrimaryReplicationGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupDescription": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "PrimaryClusterId": {"shape": "String", "flattened": false},
      "AutomaticFailoverEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MultiAZEnabled": {"shape": "BooleanOptional", "flattened": false},
      "NumCacheClusters": {"shape": "IntegerOptional", "flattened": false},
      "PreferredCacheClusterAZs": {
        "shape": "AvailabilityZonesList",
        "flattened": false
      },
      "NumNodeGroups": {"shape": "IntegerOptional", "flattened": false},
      "ReplicasPerNodeGroup": {"shape": "IntegerOptional", "flattened": false},
      "NodeGroupConfiguration": {
        "shape": "NodeGroupConfigurationList",
        "flattened": false
      },
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheSecurityGroupNames": {
        "shape": "CacheSecurityGroupNameList",
        "flattened": false
      },
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "SnapshotArns": {"shape": "SnapshotArnsList", "flattened": false},
      "SnapshotName": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "NotificationTopicArn": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "AuthToken": {"shape": "String", "flattened": false},
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AtRestEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "KmsKeyId": {"shape": "String", "flattened": false},
      "UserGroupIds": {"shape": "UserGroupIdListInput", "flattened": false},
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationRequestList",
        "flattened": false
      },
      "DataTieringEnabled": {"shape": "BooleanOptional", "flattened": false},
      "NetworkType": {"shape": "NetworkType", "flattened": false},
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false},
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      },
      "ClusterMode": {"shape": "ClusterMode", "flattened": false},
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateReplicationGroupResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateServerlessCacheRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "CacheUsageLimits": {"shape": "CacheUsageLimits", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "SnapshotArnsToRestore": {
        "shape": "SnapshotArnsList",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "UserGroupId": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdsList", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "DailySnapshotTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateServerlessCacheResponse": {
    "type": "structure",
    "members": {
      "ServerlessCache": {"shape": "ServerlessCache", "flattened": false}
    },
    "flattened": false
  },
  "CreateServerlessCacheSnapshotRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false},
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateServerlessCacheSnapshotResponse": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshot": {
        "shape": "ServerlessCacheSnapshot",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateSnapshotMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "SnapshotName": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateUserGroupMessage": {
    "type": "structure",
    "members": {
      "UserGroupId": {"shape": "String", "flattened": false},
      "Engine": {"shape": "EngineType", "flattened": false},
      "UserIds": {"shape": "UserIdListInput", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateUserMessage": {
    "type": "structure",
    "members": {
      "UserId": {"shape": "UserId", "flattened": false},
      "UserName": {"shape": "UserName", "flattened": false},
      "Engine": {"shape": "EngineType", "flattened": false},
      "Passwords": {"shape": "PasswordListInput", "flattened": false},
      "AccessString": {"shape": "AccessString", "flattened": false},
      "NoPasswordRequired": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "AuthenticationMode": {"shape": "AuthenticationMode", "flattened": false}
    },
    "flattened": false
  },
  "CustomerNodeEndpoint": {
    "type": "structure",
    "members": {
      "Address": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "CustomerNodeEndpointList": {
    "type": "list",
    "member": {"shape": "CustomerNodeEndpoint"},
    "flattened": false
  },
  "DataStorage": {
    "type": "structure",
    "members": {
      "Maximum": {"shape": "IntegerOptional", "flattened": false},
      "Minimum": {"shape": "IntegerOptional", "flattened": false},
      "Unit": {"shape": "DataStorageUnit", "flattened": false}
    },
    "flattened": false
  },
  "DataStorageUnit": {"type": "string", "flattened": false},
  "DataTieringStatus": {"type": "string", "flattened": false},
  "DecreaseNodeGroupsInGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "NodeGroupCount": {"shape": "Integer", "flattened": false},
      "GlobalNodeGroupsToRemove": {
        "shape": "GlobalNodeGroupIdList",
        "flattened": false
      },
      "GlobalNodeGroupsToRetain": {
        "shape": "GlobalNodeGroupIdList",
        "flattened": false
      },
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DecreaseNodeGroupsInGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DecreaseReplicaCountMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "NewReplicaCount": {"shape": "IntegerOptional", "flattened": false},
      "ReplicaConfiguration": {
        "shape": "ReplicaConfigurationList",
        "flattened": false
      },
      "ReplicasToRemove": {"shape": "RemoveReplicasList", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DecreaseReplicaCountResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCacheClusterMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "FinalSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCacheClusterResult": {
    "type": "structure",
    "members": {
      "CacheCluster": {"shape": "CacheCluster", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCacheParameterGroupMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCacheSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCacheSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "CacheSubnetGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "RetainPrimaryReplicationGroup": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DeleteGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "RetainPrimaryCluster": {"shape": "BooleanOptional", "flattened": false},
      "FinalSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteReplicationGroupResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServerlessCacheRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "FinalSnapshotName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServerlessCacheResponse": {
    "type": "structure",
    "members": {
      "ServerlessCache": {"shape": "ServerlessCache", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServerlessCacheSnapshotRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServerlessCacheSnapshotResponse": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshot": {
        "shape": "ServerlessCacheSnapshot",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteSnapshotMessage": {
    "type": "structure",
    "members": {
      "SnapshotName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUserGroupMessage": {
    "type": "structure",
    "members": {
      "UserGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUserMessage": {
    "type": "structure",
    "members": {
      "UserId": {"shape": "UserId", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCacheClustersMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "ShowCacheNodeInfo": {"shape": "BooleanOptional", "flattened": false},
      "ShowCacheClustersNotInReplicationGroups": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeCacheEngineVersionsMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "DefaultOnly": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCacheParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCacheParametersMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCacheSecurityGroupsMessage": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCacheSubnetGroupsMessage": {
    "type": "structure",
    "members": {
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultParametersMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultParametersResult": {
    "type": "structure",
    "members": {
      "EngineDefaults": {"shape": "EngineDefaults", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEventsMessage": {
    "type": "structure",
    "members": {
      "SourceIdentifier": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "SourceType", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "Duration": {"shape": "IntegerOptional", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeGlobalReplicationGroupsMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "ShowMemberInfo": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeGlobalReplicationGroupsResult": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "GlobalReplicationGroups": {
        "shape": "GlobalReplicationGroupList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeReplicationGroupsMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedCacheNodesMessage": {
    "type": "structure",
    "members": {
      "ReservedCacheNodeId": {"shape": "String", "flattened": false},
      "ReservedCacheNodesOfferingId": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Duration": {"shape": "String", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedCacheNodesOfferingsMessage": {
    "type": "structure",
    "members": {
      "ReservedCacheNodesOfferingId": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Duration": {"shape": "String", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeServerlessCacheSnapshotsRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false},
      "MaxResults": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeServerlessCacheSnapshotsResponse": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "String", "flattened": false},
      "ServerlessCacheSnapshots": {
        "shape": "ServerlessCacheSnapshotList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeServerlessCachesRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "MaxResults": {"shape": "IntegerOptional", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeServerlessCachesResponse": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "String", "flattened": false},
      "ServerlessCaches": {"shape": "ServerlessCacheList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeServiceUpdatesMessage": {
    "type": "structure",
    "members": {
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "ServiceUpdateStatus": {
        "shape": "ServiceUpdateStatusList",
        "flattened": false
      },
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSnapshotsListMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Snapshots": {"shape": "SnapshotList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSnapshotsMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "SnapshotName": {"shape": "String", "flattened": false},
      "SnapshotSource": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "ShowNodeGroupConfig": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUpdateActionsMessage": {
    "type": "structure",
    "members": {
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "ReplicationGroupIds": {
        "shape": "ReplicationGroupIdList",
        "flattened": false
      },
      "CacheClusterIds": {"shape": "CacheClusterIdList", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "ServiceUpdateStatus": {
        "shape": "ServiceUpdateStatusList",
        "flattened": false
      },
      "ServiceUpdateTimeRange": {
        "shape": "TimeRangeFilter",
        "flattened": false
      },
      "UpdateActionStatus": {
        "shape": "UpdateActionStatusList",
        "flattened": false
      },
      "ShowNodeLevelUpdateStatus": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUserGroupsMessage": {
    "type": "structure",
    "members": {
      "UserGroupId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUserGroupsResult": {
    "type": "structure",
    "members": {
      "UserGroups": {"shape": "UserGroupList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUsersMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "EngineType", "flattened": false},
      "UserId": {"shape": "UserId", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUsersResult": {
    "type": "structure",
    "members": {
      "Users": {"shape": "UserList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DestinationDetails": {
    "type": "structure",
    "members": {
      "CloudWatchLogsDetails": {
        "shape": "CloudWatchLogsDestinationDetails",
        "flattened": false
      },
      "KinesisFirehoseDetails": {
        "shape": "KinesisFirehoseDestinationDetails",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DestinationType": {"type": "string", "flattened": false},
  "DisassociateGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupRegion": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DisassociateGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Double": {"type": "double", "flattened": false},
  "EC2SecurityGroup": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EC2SecurityGroupList": {
    "type": "list",
    "member": {"shape": "EC2SecurityGroup", "locationName": "EC2SecurityGroup"},
    "flattened": false
  },
  "ECPUPerSecond": {
    "type": "structure",
    "members": {
      "Maximum": {"shape": "IntegerOptional", "flattened": false},
      "Minimum": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "Endpoint": {
    "type": "structure",
    "members": {
      "Address": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "EngineDefaults": {
    "type": "structure",
    "members": {
      "CacheParameterGroupFamily": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false},
      "CacheNodeTypeSpecificParameters": {
        "shape": "CacheNodeTypeSpecificParametersList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EngineType": {"type": "string", "flattened": false},
  "Event": {
    "type": "structure",
    "members": {
      "SourceIdentifier": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "SourceType", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "Date": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "EventList": {
    "type": "list",
    "member": {"shape": "Event", "locationName": "Event"},
    "flattened": false
  },
  "EventsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Events": {"shape": "EventList", "flattened": false}
    },
    "flattened": false
  },
  "ExportServerlessCacheSnapshotRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false},
      "S3BucketName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ExportServerlessCacheSnapshotResponse": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshot": {
        "shape": "ServerlessCacheSnapshot",
        "flattened": false
      }
    },
    "flattened": false
  },
  "FailoverGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "PrimaryRegion": {"shape": "String", "flattened": false},
      "PrimaryReplicationGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "FailoverGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Filter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "FilterName", "flattened": false},
      "Values": {"shape": "FilterValueList", "flattened": false}
    },
    "flattened": false
  },
  "FilterList": {
    "type": "list",
    "member": {"shape": "Filter"},
    "flattened": false
  },
  "FilterName": {"type": "string", "flattened": false},
  "FilterValue": {"type": "string", "flattened": false},
  "FilterValueList": {
    "type": "list",
    "member": {"shape": "FilterValue"},
    "flattened": false
  },
  "GlobalNodeGroup": {
    "type": "structure",
    "members": {
      "GlobalNodeGroupId": {"shape": "String", "flattened": false},
      "Slots": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GlobalNodeGroupIdList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "GlobalNodeGroupId"},
    "flattened": false
  },
  "GlobalNodeGroupList": {
    "type": "list",
    "member": {"shape": "GlobalNodeGroup", "locationName": "GlobalNodeGroup"},
    "flattened": false
  },
  "GlobalReplicationGroup": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupDescription": {
        "shape": "String",
        "flattened": false
      },
      "Status": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "Members": {
        "shape": "GlobalReplicationGroupMemberList",
        "flattened": false
      },
      "ClusterEnabled": {"shape": "BooleanOptional", "flattened": false},
      "GlobalNodeGroups": {"shape": "GlobalNodeGroupList", "flattened": false},
      "AuthTokenEnabled": {"shape": "BooleanOptional", "flattened": false},
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AtRestEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GlobalReplicationGroupInfo": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupMemberRole": {
        "shape": "String",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GlobalReplicationGroupList": {
    "type": "list",
    "member": {
      "shape": "GlobalReplicationGroup",
      "locationName": "GlobalReplicationGroup"
    },
    "flattened": false
  },
  "GlobalReplicationGroupMember": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupRegion": {"shape": "String", "flattened": false},
      "Role": {"shape": "String", "flattened": false},
      "AutomaticFailover": {
        "shape": "AutomaticFailoverStatus",
        "flattened": false
      },
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GlobalReplicationGroupMemberList": {
    "type": "list",
    "member": {
      "shape": "GlobalReplicationGroupMember",
      "locationName": "GlobalReplicationGroupMember"
    },
    "flattened": false
  },
  "IncreaseNodeGroupsInGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "NodeGroupCount": {"shape": "Integer", "flattened": false},
      "RegionalConfigurations": {
        "shape": "RegionalConfigurationList",
        "flattened": false
      },
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "IncreaseNodeGroupsInGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "IncreaseReplicaCountMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "NewReplicaCount": {"shape": "IntegerOptional", "flattened": false},
      "ReplicaConfiguration": {
        "shape": "ReplicaConfigurationList",
        "flattened": false
      },
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "IncreaseReplicaCountResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "InputAuthenticationType": {"type": "string", "flattened": false},
  "Integer": {"type": "integer", "flattened": false},
  "IntegerOptional": {"type": "integer", "flattened": false},
  "IpDiscovery": {"type": "string", "flattened": false},
  "KeyList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "KinesisFirehoseDestinationDetails": {
    "type": "structure",
    "members": {
      "DeliveryStream": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListAllowedNodeTypeModificationsMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ReplicationGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "LogDeliveryConfiguration": {
    "type": "structure",
    "members": {
      "LogType": {"shape": "LogType", "flattened": false},
      "DestinationType": {"shape": "DestinationType", "flattened": false},
      "DestinationDetails": {"shape": "DestinationDetails", "flattened": false},
      "LogFormat": {"shape": "LogFormat", "flattened": false},
      "Status": {"shape": "LogDeliveryConfigurationStatus", "flattened": false},
      "Message": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "LogDeliveryConfigurationList": {
    "type": "list",
    "member": {
      "shape": "LogDeliveryConfiguration",
      "locationName": "LogDeliveryConfiguration"
    },
    "flattened": false
  },
  "LogDeliveryConfigurationRequest": {
    "type": "structure",
    "members": {
      "LogType": {"shape": "LogType", "flattened": false},
      "DestinationType": {"shape": "DestinationType", "flattened": false},
      "DestinationDetails": {"shape": "DestinationDetails", "flattened": false},
      "LogFormat": {"shape": "LogFormat", "flattened": false},
      "Enabled": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "LogDeliveryConfigurationRequestList": {
    "type": "list",
    "member": {
      "shape": "LogDeliveryConfigurationRequest",
      "locationName": "LogDeliveryConfigurationRequest"
    },
    "flattened": false
  },
  "LogDeliveryConfigurationStatus": {"type": "string", "flattened": false},
  "LogFormat": {"type": "string", "flattened": false},
  "LogType": {"type": "string", "flattened": false},
  "ModifyCacheClusterMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "NumCacheNodes": {"shape": "IntegerOptional", "flattened": false},
      "CacheNodeIdsToRemove": {"shape": "CacheNodeIdsList", "flattened": false},
      "AZMode": {"shape": "AZMode", "flattened": false},
      "NewAvailabilityZones": {
        "shape": "PreferredAvailabilityZoneList",
        "flattened": false
      },
      "CacheSecurityGroupNames": {
        "shape": "CacheSecurityGroupNameList",
        "flattened": false
      },
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "NotificationTopicArn": {"shape": "String", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "NotificationTopicStatus": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "AuthToken": {"shape": "String", "flattened": false},
      "AuthTokenUpdateStrategy": {
        "shape": "AuthTokenUpdateStrategyType",
        "flattened": false
      },
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationRequestList",
        "flattened": false
      },
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCacheClusterResult": {
    "type": "structure",
    "members": {
      "CacheCluster": {"shape": "CacheCluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCacheParameterGroupMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterNameValues": {
        "shape": "ParameterNameValueList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyCacheSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupDescription": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCacheSubnetGroupResult": {
    "type": "structure",
    "members": {
      "CacheSubnetGroup": {"shape": "CacheSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupDescription": {
        "shape": "String",
        "flattened": false
      },
      "AutomaticFailoverEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupDescription": {"shape": "String", "flattened": false},
      "PrimaryClusterId": {"shape": "String", "flattened": false},
      "SnapshottingClusterId": {"shape": "String", "flattened": false},
      "AutomaticFailoverEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MultiAZEnabled": {"shape": "BooleanOptional", "flattened": false},
      "NodeGroupId": {"shape": "String", "flattened": false},
      "CacheSecurityGroupNames": {
        "shape": "CacheSecurityGroupNameList",
        "flattened": false
      },
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "NotificationTopicArn": {"shape": "String", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "NotificationTopicStatus": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "AuthToken": {"shape": "String", "flattened": false},
      "AuthTokenUpdateStrategy": {
        "shape": "AuthTokenUpdateStrategyType",
        "flattened": false
      },
      "UserGroupIdsToAdd": {"shape": "UserGroupIdList", "flattened": false},
      "UserGroupIdsToRemove": {"shape": "UserGroupIdList", "flattened": false},
      "RemoveUserGroups": {"shape": "BooleanOptional", "flattened": false},
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationRequestList",
        "flattened": false
      },
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false},
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      },
      "ClusterMode": {"shape": "ClusterMode", "flattened": false}
    },
    "flattened": false
  },
  "ModifyReplicationGroupResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyReplicationGroupShardConfigurationMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "NodeGroupCount": {"shape": "Integer", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "ReshardingConfiguration": {
        "shape": "ReshardingConfigurationList",
        "flattened": false
      },
      "NodeGroupsToRemove": {
        "shape": "NodeGroupsToRemoveList",
        "flattened": false
      },
      "NodeGroupsToRetain": {
        "shape": "NodeGroupsToRetainList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyReplicationGroupShardConfigurationResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyServerlessCacheRequest": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "CacheUsageLimits": {"shape": "CacheUsageLimits", "flattened": false},
      "RemoveUserGroup": {"shape": "BooleanOptional", "flattened": false},
      "UserGroupId": {"shape": "String", "flattened": false},
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "DailySnapshotTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyServerlessCacheResponse": {
    "type": "structure",
    "members": {
      "ServerlessCache": {"shape": "ServerlessCache", "flattened": false}
    },
    "flattened": false
  },
  "ModifyUserGroupMessage": {
    "type": "structure",
    "members": {
      "UserGroupId": {"shape": "String", "flattened": false},
      "UserIdsToAdd": {"shape": "UserIdListInput", "flattened": false},
      "UserIdsToRemove": {"shape": "UserIdListInput", "flattened": false}
    },
    "flattened": false
  },
  "ModifyUserMessage": {
    "type": "structure",
    "members": {
      "UserId": {"shape": "UserId", "flattened": false},
      "AccessString": {"shape": "AccessString", "flattened": false},
      "AppendAccessString": {"shape": "AccessString", "flattened": false},
      "Passwords": {"shape": "PasswordListInput", "flattened": false},
      "NoPasswordRequired": {"shape": "BooleanOptional", "flattened": false},
      "AuthenticationMode": {"shape": "AuthenticationMode", "flattened": false}
    },
    "flattened": false
  },
  "MultiAZStatus": {"type": "string", "flattened": false},
  "NetworkType": {"type": "string", "flattened": false},
  "NetworkTypeList": {
    "type": "list",
    "member": {"shape": "NetworkType"},
    "flattened": false
  },
  "NodeGroup": {
    "type": "structure",
    "members": {
      "NodeGroupId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "PrimaryEndpoint": {"shape": "Endpoint", "flattened": false},
      "ReaderEndpoint": {"shape": "Endpoint", "flattened": false},
      "Slots": {"shape": "String", "flattened": false},
      "NodeGroupMembers": {"shape": "NodeGroupMemberList", "flattened": false}
    },
    "flattened": false
  },
  "NodeGroupConfiguration": {
    "type": "structure",
    "members": {
      "NodeGroupId": {"shape": "AllowedNodeGroupId", "flattened": false},
      "Slots": {"shape": "String", "flattened": false},
      "ReplicaCount": {"shape": "IntegerOptional", "flattened": false},
      "PrimaryAvailabilityZone": {"shape": "String", "flattened": false},
      "ReplicaAvailabilityZones": {
        "shape": "AvailabilityZonesList",
        "flattened": false
      },
      "PrimaryOutpostArn": {"shape": "String", "flattened": false},
      "ReplicaOutpostArns": {"shape": "OutpostArnsList", "flattened": false}
    },
    "flattened": false
  },
  "NodeGroupConfigurationList": {
    "type": "list",
    "member": {
      "shape": "NodeGroupConfiguration",
      "locationName": "NodeGroupConfiguration"
    },
    "flattened": false
  },
  "NodeGroupList": {
    "type": "list",
    "member": {"shape": "NodeGroup", "locationName": "NodeGroup"},
    "flattened": false
  },
  "NodeGroupMember": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "CacheNodeId": {"shape": "String", "flattened": false},
      "ReadEndpoint": {"shape": "Endpoint", "flattened": false},
      "PreferredAvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredOutpostArn": {"shape": "String", "flattened": false},
      "CurrentRole": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "NodeGroupMemberList": {
    "type": "list",
    "member": {"shape": "NodeGroupMember", "locationName": "NodeGroupMember"},
    "flattened": false
  },
  "NodeGroupMemberUpdateStatus": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "CacheNodeId": {"shape": "String", "flattened": false},
      "NodeUpdateStatus": {"shape": "NodeUpdateStatus", "flattened": false},
      "NodeDeletionDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateStartDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateEndDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateInitiatedBy": {
        "shape": "NodeUpdateInitiatedBy",
        "flattened": false
      },
      "NodeUpdateInitiatedDate": {"shape": "TStamp", "flattened": false},
      "NodeUpdateStatusModifiedDate": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "NodeGroupMemberUpdateStatusList": {
    "type": "list",
    "member": {
      "shape": "NodeGroupMemberUpdateStatus",
      "locationName": "NodeGroupMemberUpdateStatus"
    },
    "flattened": false
  },
  "NodeGroupUpdateStatus": {
    "type": "structure",
    "members": {
      "NodeGroupId": {"shape": "String", "flattened": false},
      "NodeGroupMemberUpdateStatus": {
        "shape": "NodeGroupMemberUpdateStatusList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "NodeGroupUpdateStatusList": {
    "type": "list",
    "member": {
      "shape": "NodeGroupUpdateStatus",
      "locationName": "NodeGroupUpdateStatus"
    },
    "flattened": false
  },
  "NodeGroupsToRemoveList": {
    "type": "list",
    "member": {
      "shape": "AllowedNodeGroupId",
      "locationName": "NodeGroupToRemove"
    },
    "flattened": false
  },
  "NodeGroupsToRetainList": {
    "type": "list",
    "member": {
      "shape": "AllowedNodeGroupId",
      "locationName": "NodeGroupToRetain"
    },
    "flattened": false
  },
  "NodeSnapshot": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "NodeGroupId": {"shape": "String", "flattened": false},
      "CacheNodeId": {"shape": "String", "flattened": false},
      "NodeGroupConfiguration": {
        "shape": "NodeGroupConfiguration",
        "flattened": false
      },
      "CacheSize": {"shape": "String", "flattened": false},
      "CacheNodeCreateTime": {"shape": "TStamp", "flattened": false},
      "SnapshotCreateTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "NodeSnapshotList": {
    "type": "list",
    "member": {"shape": "NodeSnapshot", "locationName": "NodeSnapshot"},
    "flattened": false
  },
  "NodeTypeList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "NodeUpdateInitiatedBy": {"type": "string", "flattened": false},
  "NodeUpdateStatus": {"type": "string", "flattened": false},
  "NotificationConfiguration": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "String", "flattened": false},
      "TopicStatus": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "OutpostArnsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "OutpostArn"},
    "flattened": false
  },
  "OutpostMode": {"type": "string", "flattened": false},
  "Parameter": {
    "type": "structure",
    "members": {
      "ParameterName": {"shape": "String", "flattened": false},
      "ParameterValue": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "DataType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false},
      "ChangeType": {"shape": "ChangeType", "flattened": false}
    },
    "flattened": false
  },
  "ParameterNameValue": {
    "type": "structure",
    "members": {
      "ParameterName": {"shape": "String", "flattened": false},
      "ParameterValue": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ParameterNameValueList": {
    "type": "list",
    "member": {
      "shape": "ParameterNameValue",
      "locationName": "ParameterNameValue"
    },
    "flattened": false
  },
  "ParametersList": {
    "type": "list",
    "member": {"shape": "Parameter", "locationName": "Parameter"},
    "flattened": false
  },
  "PasswordListInput": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "PendingAutomaticFailoverStatus": {"type": "string", "flattened": false},
  "PendingLogDeliveryConfiguration": {
    "type": "structure",
    "members": {
      "LogType": {"shape": "LogType", "flattened": false},
      "DestinationType": {"shape": "DestinationType", "flattened": false},
      "DestinationDetails": {"shape": "DestinationDetails", "flattened": false},
      "LogFormat": {"shape": "LogFormat", "flattened": false}
    },
    "flattened": false
  },
  "PendingLogDeliveryConfigurationList": {
    "type": "list",
    "member": {"shape": "PendingLogDeliveryConfiguration"},
    "locationName": "PendingLogDeliveryConfiguration",
    "flattened": false
  },
  "PendingModifiedValues": {
    "type": "structure",
    "members": {
      "NumCacheNodes": {"shape": "IntegerOptional", "flattened": false},
      "CacheNodeIdsToRemove": {"shape": "CacheNodeIdsList", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "AuthTokenStatus": {"shape": "AuthTokenUpdateStatus", "flattened": false},
      "LogDeliveryConfigurations": {
        "shape": "PendingLogDeliveryConfigurationList",
        "flattened": false
      },
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PreferredAvailabilityZoneList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "PreferredAvailabilityZone"},
    "flattened": false
  },
  "PreferredOutpostArnList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "PreferredOutpostArn"},
    "flattened": false
  },
  "ProcessedUpdateAction": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "UpdateActionStatus": {"shape": "UpdateActionStatus", "flattened": false}
    },
    "flattened": false
  },
  "ProcessedUpdateActionList": {
    "type": "list",
    "member": {
      "shape": "ProcessedUpdateAction",
      "locationName": "ProcessedUpdateAction"
    },
    "flattened": false
  },
  "PurchaseReservedCacheNodesOfferingMessage": {
    "type": "structure",
    "members": {
      "ReservedCacheNodesOfferingId": {"shape": "String", "flattened": false},
      "ReservedCacheNodeId": {"shape": "String", "flattened": false},
      "CacheNodeCount": {"shape": "IntegerOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "PurchaseReservedCacheNodesOfferingResult": {
    "type": "structure",
    "members": {
      "ReservedCacheNode": {"shape": "ReservedCacheNode", "flattened": false}
    },
    "flattened": false
  },
  "RebalanceSlotsInGlobalReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroupId": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "RebalanceSlotsInGlobalReplicationGroupResult": {
    "type": "structure",
    "members": {
      "GlobalReplicationGroup": {
        "shape": "GlobalReplicationGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RebootCacheClusterMessage": {
    "type": "structure",
    "members": {
      "CacheClusterId": {"shape": "String", "flattened": false},
      "CacheNodeIdsToReboot": {"shape": "CacheNodeIdsList", "flattened": false}
    },
    "flattened": false
  },
  "RebootCacheClusterResult": {
    "type": "structure",
    "members": {
      "CacheCluster": {"shape": "CacheCluster", "flattened": false}
    },
    "flattened": false
  },
  "RecurringCharge": {
    "type": "structure",
    "members": {
      "RecurringChargeAmount": {"shape": "Double", "flattened": false},
      "RecurringChargeFrequency": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RecurringChargeList": {
    "type": "list",
    "member": {"shape": "RecurringCharge", "locationName": "RecurringCharge"},
    "flattened": false
  },
  "RegionalConfiguration": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupRegion": {"shape": "String", "flattened": false},
      "ReshardingConfiguration": {
        "shape": "ReshardingConfigurationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RegionalConfigurationList": {
    "type": "list",
    "member": {
      "shape": "RegionalConfiguration",
      "locationName": "RegionalConfiguration"
    },
    "flattened": false
  },
  "RemoveReplicasList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "RemoveTagsFromResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "KeyList", "flattened": false}
    },
    "flattened": false
  },
  "ReplicaConfigurationList": {
    "type": "list",
    "member": {"shape": "ConfigureShard", "locationName": "ConfigureShard"},
    "flattened": false
  },
  "ReplicationGroup": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "GlobalReplicationGroupInfo": {
        "shape": "GlobalReplicationGroupInfo",
        "flattened": false
      },
      "Status": {"shape": "String", "flattened": false},
      "PendingModifiedValues": {
        "shape": "ReplicationGroupPendingModifiedValues",
        "flattened": false
      },
      "MemberClusters": {"shape": "ClusterIdList", "flattened": false},
      "NodeGroups": {"shape": "NodeGroupList", "flattened": false},
      "SnapshottingClusterId": {"shape": "String", "flattened": false},
      "AutomaticFailover": {
        "shape": "AutomaticFailoverStatus",
        "flattened": false
      },
      "MultiAZ": {"shape": "MultiAZStatus", "flattened": false},
      "ConfigurationEndpoint": {"shape": "Endpoint", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "ClusterEnabled": {"shape": "BooleanOptional", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "AuthTokenEnabled": {"shape": "BooleanOptional", "flattened": false},
      "AuthTokenLastModifiedDate": {"shape": "TStamp", "flattened": false},
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AtRestEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MemberClustersOutpostArns": {
        "shape": "ReplicationGroupOutpostArnList",
        "flattened": false
      },
      "KmsKeyId": {"shape": "String", "flattened": false},
      "ARN": {"shape": "String", "flattened": false},
      "UserGroupIds": {"shape": "UserGroupIdList", "flattened": false},
      "LogDeliveryConfigurations": {
        "shape": "LogDeliveryConfigurationList",
        "flattened": false
      },
      "ReplicationGroupCreateTime": {"shape": "TStamp", "flattened": false},
      "DataTiering": {"shape": "DataTieringStatus", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "NetworkType": {"shape": "NetworkType", "flattened": false},
      "IpDiscovery": {"shape": "IpDiscovery", "flattened": false},
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      },
      "ClusterMode": {"shape": "ClusterMode", "flattened": false}
    },
    "flattened": false
  },
  "ReplicationGroupIdList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ReplicationGroupList": {
    "type": "list",
    "member": {"shape": "ReplicationGroup", "locationName": "ReplicationGroup"},
    "flattened": false
  },
  "ReplicationGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReplicationGroups": {"shape": "ReplicationGroupList", "flattened": false}
    },
    "flattened": false
  },
  "ReplicationGroupOutpostArnList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ReplicationGroupOutpostArn"},
    "flattened": false
  },
  "ReplicationGroupPendingModifiedValues": {
    "type": "structure",
    "members": {
      "PrimaryClusterId": {"shape": "String", "flattened": false},
      "AutomaticFailoverStatus": {
        "shape": "PendingAutomaticFailoverStatus",
        "flattened": false
      },
      "Resharding": {"shape": "ReshardingStatus", "flattened": false},
      "AuthTokenStatus": {"shape": "AuthTokenUpdateStatus", "flattened": false},
      "UserGroups": {"shape": "UserGroupsUpdateStatus", "flattened": false},
      "LogDeliveryConfigurations": {
        "shape": "PendingLogDeliveryConfigurationList",
        "flattened": false
      },
      "TransitEncryptionEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "TransitEncryptionMode": {
        "shape": "TransitEncryptionMode",
        "flattened": false
      },
      "ClusterMode": {"shape": "ClusterMode", "flattened": false}
    },
    "flattened": false
  },
  "ReservedCacheNode": {
    "type": "structure",
    "members": {
      "ReservedCacheNodeId": {"shape": "String", "flattened": false},
      "ReservedCacheNodesOfferingId": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "CacheNodeCount": {"shape": "Integer", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "State": {"shape": "String", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false},
      "ReservationARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ReservedCacheNodeList": {
    "type": "list",
    "member": {
      "shape": "ReservedCacheNode",
      "locationName": "ReservedCacheNode"
    },
    "flattened": false
  },
  "ReservedCacheNodeMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedCacheNodes": {
        "shape": "ReservedCacheNodeList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedCacheNodesOffering": {
    "type": "structure",
    "members": {
      "ReservedCacheNodesOfferingId": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false}
    },
    "flattened": false
  },
  "ReservedCacheNodesOfferingList": {
    "type": "list",
    "member": {
      "shape": "ReservedCacheNodesOffering",
      "locationName": "ReservedCacheNodesOffering"
    },
    "flattened": false
  },
  "ReservedCacheNodesOfferingMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedCacheNodesOfferings": {
        "shape": "ReservedCacheNodesOfferingList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ResetCacheParameterGroupMessage": {
    "type": "structure",
    "members": {
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "ResetAllParameters": {"shape": "Boolean", "flattened": false},
      "ParameterNameValues": {
        "shape": "ParameterNameValueList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReshardingConfiguration": {
    "type": "structure",
    "members": {
      "NodeGroupId": {"shape": "AllowedNodeGroupId", "flattened": false},
      "PreferredAvailabilityZones": {
        "shape": "AvailabilityZonesList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReshardingConfigurationList": {
    "type": "list",
    "member": {
      "shape": "ReshardingConfiguration",
      "locationName": "ReshardingConfiguration"
    },
    "flattened": false
  },
  "ReshardingStatus": {
    "type": "structure",
    "members": {
      "SlotMigration": {"shape": "SlotMigration", "flattened": false}
    },
    "flattened": false
  },
  "RevokeCacheSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "CacheSecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RevokeCacheSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "CacheSecurityGroup": {"shape": "CacheSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "SecurityGroupIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SecurityGroupId"},
    "flattened": false
  },
  "SecurityGroupMembership": {
    "type": "structure",
    "members": {
      "SecurityGroupId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SecurityGroupMembershipList": {
    "type": "list",
    "member": {"shape": "SecurityGroupMembership"},
    "flattened": false
  },
  "ServerlessCache": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "CreateTime": {"shape": "TStamp", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "FullEngineVersion": {"shape": "String", "flattened": false},
      "CacheUsageLimits": {"shape": "CacheUsageLimits", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "SecurityGroupIds": {"shape": "SecurityGroupIdsList", "flattened": false},
      "Endpoint": {"shape": "Endpoint", "flattened": false},
      "ReaderEndpoint": {"shape": "Endpoint", "flattened": false},
      "ARN": {"shape": "String", "flattened": false},
      "UserGroupId": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdsList", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "DailySnapshotTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ServerlessCacheConfiguration": {
    "type": "structure",
    "members": {
      "ServerlessCacheName": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ServerlessCacheList": {
    "type": "list",
    "member": {"shape": "ServerlessCache"},
    "flattened": false
  },
  "ServerlessCacheSnapshot": {
    "type": "structure",
    "members": {
      "ServerlessCacheSnapshotName": {"shape": "String", "flattened": false},
      "ARN": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "CreateTime": {"shape": "TStamp", "flattened": false},
      "ExpiryTime": {"shape": "TStamp", "flattened": false},
      "BytesUsedForCache": {"shape": "String", "flattened": false},
      "ServerlessCacheConfiguration": {
        "shape": "ServerlessCacheConfiguration",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ServerlessCacheSnapshotList": {
    "type": "list",
    "member": {
      "shape": "ServerlessCacheSnapshot",
      "locationName": "ServerlessCacheSnapshot"
    },
    "flattened": false
  },
  "ServiceUpdate": {
    "type": "structure",
    "members": {
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "ServiceUpdateReleaseDate": {"shape": "TStamp", "flattened": false},
      "ServiceUpdateEndDate": {"shape": "TStamp", "flattened": false},
      "ServiceUpdateSeverity": {
        "shape": "ServiceUpdateSeverity",
        "flattened": false
      },
      "ServiceUpdateRecommendedApplyByDate": {
        "shape": "TStamp",
        "flattened": false
      },
      "ServiceUpdateStatus": {
        "shape": "ServiceUpdateStatus",
        "flattened": false
      },
      "ServiceUpdateDescription": {"shape": "String", "flattened": false},
      "ServiceUpdateType": {"shape": "ServiceUpdateType", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoUpdateAfterRecommendedApplyByDate": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EstimatedUpdateTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ServiceUpdateList": {
    "type": "list",
    "member": {"shape": "ServiceUpdate", "locationName": "ServiceUpdate"},
    "flattened": false
  },
  "ServiceUpdateSeverity": {"type": "string", "flattened": false},
  "ServiceUpdateStatus": {"type": "string", "flattened": false},
  "ServiceUpdateStatusList": {
    "type": "list",
    "member": {"shape": "ServiceUpdateStatus"},
    "flattened": false
  },
  "ServiceUpdateType": {"type": "string", "flattened": false},
  "ServiceUpdatesMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ServiceUpdates": {"shape": "ServiceUpdateList", "flattened": false}
    },
    "flattened": false
  },
  "SlaMet": {"type": "string", "flattened": false},
  "SlotMigration": {
    "type": "structure",
    "members": {
      "ProgressPercentage": {"shape": "Double", "flattened": false}
    },
    "flattened": false
  },
  "Snapshot": {
    "type": "structure",
    "members": {
      "SnapshotName": {"shape": "String", "flattened": false},
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "ReplicationGroupDescription": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "SnapshotStatus": {"shape": "String", "flattened": false},
      "SnapshotSource": {"shape": "String", "flattened": false},
      "CacheNodeType": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "NumCacheNodes": {"shape": "IntegerOptional", "flattened": false},
      "PreferredAvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredOutpostArn": {"shape": "String", "flattened": false},
      "CacheClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "TopicArn": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "CacheParameterGroupName": {"shape": "String", "flattened": false},
      "CacheSubnetGroupName": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "SnapshotRetentionLimit": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotWindow": {"shape": "String", "flattened": false},
      "NumNodeGroups": {"shape": "IntegerOptional", "flattened": false},
      "AutomaticFailover": {
        "shape": "AutomaticFailoverStatus",
        "flattened": false
      },
      "NodeSnapshots": {"shape": "NodeSnapshotList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "ARN": {"shape": "String", "flattened": false},
      "DataTiering": {"shape": "DataTieringStatus", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotArnsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SnapshotArn"},
    "flattened": false
  },
  "SnapshotList": {
    "type": "list",
    "member": {"shape": "Snapshot", "locationName": "Snapshot"},
    "flattened": false
  },
  "SourceType": {"type": "string", "flattened": false},
  "StartMigrationMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CustomerNodeEndpointList": {
        "shape": "CustomerNodeEndpointList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "StartMigrationResponse": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "Subnet": {
    "type": "structure",
    "members": {
      "SubnetIdentifier": {"shape": "String", "flattened": false},
      "SubnetAvailabilityZone": {
        "shape": "AvailabilityZone",
        "flattened": false
      },
      "SubnetOutpost": {"shape": "SubnetOutpost", "flattened": false},
      "SupportedNetworkTypes": {"shape": "NetworkTypeList", "flattened": false}
    },
    "flattened": false
  },
  "SubnetIdentifierList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SubnetIdentifier"},
    "flattened": false
  },
  "SubnetIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SubnetId"},
    "flattened": false
  },
  "SubnetList": {
    "type": "list",
    "member": {"shape": "Subnet", "locationName": "Subnet"},
    "flattened": false
  },
  "SubnetOutpost": {
    "type": "structure",
    "members": {
      "SubnetOutpostArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TStamp": {"type": "timestamp", "flattened": false},
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TagList": {
    "type": "list",
    "member": {"shape": "Tag", "locationName": "Tag"},
    "flattened": false
  },
  "TagListMessage": {
    "type": "structure",
    "members": {
      "TagList": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "TestFailoverMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "NodeGroupId": {"shape": "AllowedNodeGroupId", "flattened": false}
    },
    "flattened": false
  },
  "TestFailoverResult": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "TestMigrationMessage": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CustomerNodeEndpointList": {
        "shape": "CustomerNodeEndpointList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TestMigrationResponse": {
    "type": "structure",
    "members": {
      "ReplicationGroup": {"shape": "ReplicationGroup", "flattened": false}
    },
    "flattened": false
  },
  "TimeRangeFilter": {
    "type": "structure",
    "members": {
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "TransitEncryptionMode": {"type": "string", "flattened": false},
  "UGReplicationGroupIdList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "UGServerlessCacheIdList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "UnprocessedUpdateAction": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "ErrorType": {"shape": "String", "flattened": false},
      "ErrorMessage": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UnprocessedUpdateActionList": {
    "type": "list",
    "member": {
      "shape": "UnprocessedUpdateAction",
      "locationName": "UnprocessedUpdateAction"
    },
    "flattened": false
  },
  "UpdateAction": {
    "type": "structure",
    "members": {
      "ReplicationGroupId": {"shape": "String", "flattened": false},
      "CacheClusterId": {"shape": "String", "flattened": false},
      "ServiceUpdateName": {"shape": "String", "flattened": false},
      "ServiceUpdateReleaseDate": {"shape": "TStamp", "flattened": false},
      "ServiceUpdateSeverity": {
        "shape": "ServiceUpdateSeverity",
        "flattened": false
      },
      "ServiceUpdateStatus": {
        "shape": "ServiceUpdateStatus",
        "flattened": false
      },
      "ServiceUpdateRecommendedApplyByDate": {
        "shape": "TStamp",
        "flattened": false
      },
      "ServiceUpdateType": {"shape": "ServiceUpdateType", "flattened": false},
      "UpdateActionAvailableDate": {"shape": "TStamp", "flattened": false},
      "UpdateActionStatus": {"shape": "UpdateActionStatus", "flattened": false},
      "NodesUpdated": {"shape": "String", "flattened": false},
      "UpdateActionStatusModifiedDate": {"shape": "TStamp", "flattened": false},
      "SlaMet": {"shape": "SlaMet", "flattened": false},
      "NodeGroupUpdateStatus": {
        "shape": "NodeGroupUpdateStatusList",
        "flattened": false
      },
      "CacheNodeUpdateStatus": {
        "shape": "CacheNodeUpdateStatusList",
        "flattened": false
      },
      "EstimatedUpdateTime": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UpdateActionList": {
    "type": "list",
    "member": {"shape": "UpdateAction", "locationName": "UpdateAction"},
    "flattened": false
  },
  "UpdateActionResultsMessage": {
    "type": "structure",
    "members": {
      "ProcessedUpdateActions": {
        "shape": "ProcessedUpdateActionList",
        "flattened": false
      },
      "UnprocessedUpdateActions": {
        "shape": "UnprocessedUpdateActionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateActionStatus": {"type": "string", "flattened": false},
  "UpdateActionStatusList": {
    "type": "list",
    "member": {"shape": "UpdateActionStatus"},
    "flattened": false
  },
  "UpdateActionsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "UpdateActions": {"shape": "UpdateActionList", "flattened": false}
    },
    "flattened": false
  },
  "User": {
    "type": "structure",
    "members": {
      "UserId": {"shape": "String", "flattened": false},
      "UserName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Engine": {"shape": "EngineType", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false},
      "AccessString": {"shape": "String", "flattened": false},
      "UserGroupIds": {"shape": "UserGroupIdList", "flattened": false},
      "Authentication": {"shape": "Authentication", "flattened": false},
      "ARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UserGroup": {
    "type": "structure",
    "members": {
      "UserGroupId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Engine": {"shape": "EngineType", "flattened": false},
      "UserIds": {"shape": "UserIdList", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false},
      "PendingChanges": {
        "shape": "UserGroupPendingChanges",
        "flattened": false
      },
      "ReplicationGroups": {
        "shape": "UGReplicationGroupIdList",
        "flattened": false
      },
      "ServerlessCaches": {
        "shape": "UGServerlessCacheIdList",
        "flattened": false
      },
      "ARN": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UserGroupId": {"type": "string", "flattened": false},
  "UserGroupIdList": {
    "type": "list",
    "member": {"shape": "UserGroupId"},
    "flattened": false
  },
  "UserGroupIdListInput": {
    "type": "list",
    "member": {"shape": "UserGroupId"},
    "flattened": false
  },
  "UserGroupList": {
    "type": "list",
    "member": {"shape": "UserGroup"},
    "flattened": false
  },
  "UserGroupPendingChanges": {
    "type": "structure",
    "members": {
      "UserIdsToRemove": {"shape": "UserIdList", "flattened": false},
      "UserIdsToAdd": {"shape": "UserIdList", "flattened": false}
    },
    "flattened": false
  },
  "UserGroupsUpdateStatus": {
    "type": "structure",
    "members": {
      "UserGroupIdsToAdd": {"shape": "UserGroupIdList", "flattened": false},
      "UserGroupIdsToRemove": {"shape": "UserGroupIdList", "flattened": false}
    },
    "flattened": false
  },
  "UserId": {"type": "string", "flattened": false},
  "UserIdList": {
    "type": "list",
    "member": {"shape": "UserId"},
    "flattened": false
  },
  "UserIdListInput": {
    "type": "list",
    "member": {"shape": "UserId"},
    "flattened": false
  },
  "UserList": {
    "type": "list",
    "member": {"shape": "User"},
    "flattened": false
  },
  "UserName": {"type": "string", "flattened": false}
};
