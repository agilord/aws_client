// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AddRoleToDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "FeatureName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AddSourceIdentifierToSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SourceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AddSourceIdentifierToSubscriptionResult": {
    "type": "structure",
    "members": {
      "EventSubscription": {"shape": "EventSubscription", "flattened": false}
    },
    "flattened": false
  },
  "AddTagsToResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ApplyMethod": {"type": "string", "flattened": false},
  "ApplyPendingMaintenanceActionMessage": {
    "type": "structure",
    "members": {
      "ResourceIdentifier": {"shape": "String", "flattened": false},
      "ApplyAction": {"shape": "String", "flattened": false},
      "OptInType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ApplyPendingMaintenanceActionResult": {
    "type": "structure",
    "members": {
      "ResourcePendingMaintenanceActions": {
        "shape": "ResourcePendingMaintenanceActions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AttributeValueList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AttributeValue"},
    "flattened": false
  },
  "AvailabilityZone": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AvailabilityZoneList": {
    "type": "list",
    "member": {"shape": "AvailabilityZone", "locationName": "AvailabilityZone"},
    "flattened": false
  },
  "AvailabilityZones": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AvailabilityZone"},
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "BooleanOptional": {"type": "boolean", "flattened": false},
  "CharacterSet": {
    "type": "structure",
    "members": {
      "CharacterSetName": {"shape": "String", "flattened": false},
      "CharacterSetDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CloudwatchLogsExportConfiguration": {
    "type": "structure",
    "members": {
      "EnableLogTypes": {"shape": "LogTypeList", "flattened": false},
      "DisableLogTypes": {"shape": "LogTypeList", "flattened": false}
    },
    "flattened": false
  },
  "ClusterPendingModifiedValues": {
    "type": "structure",
    "members": {
      "PendingCloudwatchLogsExports": {
        "shape": "PendingCloudwatchLogsExports",
        "flattened": false
      },
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EngineVersion": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "SourceDBClusterParameterGroupIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetDBClusterParameterGroupIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetDBClusterParameterGroupDescription": {
        "shape": "String",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBClusterParameterGroupResult": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroup": {
        "shape": "DBClusterParameterGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CopyDBClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "SourceDBClusterSnapshotIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetDBClusterSnapshotIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "KmsKeyId": {"shape": "String", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false},
      "CopyTags": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshot": {"shape": "DBClusterSnapshot", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBParameterGroupMessage": {
    "type": "structure",
    "members": {
      "SourceDBParameterGroupIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetDBParameterGroupIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetDBParameterGroupDescription": {
        "shape": "String",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBParameterGroupResult": {
    "type": "structure",
    "members": {
      "DBParameterGroup": {"shape": "DBParameterGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterEndpointMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterEndpointOutput": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointResourceIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "Endpoint": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "CustomEndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false},
      "DBClusterEndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterMessage": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "DatabaseName": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "ReplicationSourceIdentifier": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterParameterGroupResult": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroup": {
        "shape": "DBClusterParameterGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshot": {"shape": "DBClusterSnapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBName": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "DBSecurityGroups": {
        "shape": "DBSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "TdeCredentialPassword": {"shape": "SensitiveString", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "Timezone": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBParameterGroupResult": {
    "type": "structure",
    "members": {
      "DBParameterGroup": {"shape": "DBParameterGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DBSubnetGroupDescription": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSubnetGroupResult": {
    "type": "structure",
    "members": {
      "DBSubnetGroup": {"shape": "DBSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateEventSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SnsTopicArn": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "SourceIds": {"shape": "SourceIdsList", "flattened": false},
      "Enabled": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateEventSubscriptionResult": {
    "type": "structure",
    "members": {
      "EventSubscription": {"shape": "EventSubscription", "flattened": false}
    },
    "flattened": false
  },
  "CreateGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "SourceDBClusterIdentifier": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
    },
    "flattened": false
  },
  "DBCluster": {
    "type": "structure",
    "members": {
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "DatabaseName": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterParameterGroup": {"shape": "String", "flattened": false},
      "DBSubnetGroup": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "PercentProgress": {"shape": "String", "flattened": false},
      "EarliestRestorableTime": {"shape": "TStamp", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "ReaderEndpoint": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "Boolean", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "LatestRestorableTime": {"shape": "TStamp", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "DBClusterOptionGroupMemberships": {
        "shape": "DBClusterOptionGroupMemberships",
        "flattened": false
      },
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "ReplicationSourceIdentifier": {"shape": "String", "flattened": false},
      "ReadReplicaIdentifiers": {
        "shape": "ReadReplicaIdentifierList",
        "flattened": false
      },
      "DBClusterMembers": {"shape": "DBClusterMemberList", "flattened": false},
      "VpcSecurityGroups": {
        "shape": "VpcSecurityGroupMembershipList",
        "flattened": false
      },
      "HostedZoneId": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DbClusterResourceId": {"shape": "String", "flattened": false},
      "DBClusterArn": {"shape": "String", "flattened": false},
      "AssociatedRoles": {"shape": "DBClusterRoles", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "CloneGroupId": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "PendingModifiedValues": {
        "shape": "ClusterPendingModifiedValues",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CrossAccountClone": {"shape": "BooleanOptional", "flattened": false},
      "AutomaticRestartTime": {"shape": "TStamp", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfigurationInfo",
        "flattened": false
      },
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "IOOptimizedNextAllowedModificationTime": {
        "shape": "TStamp",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterEndpoint": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointResourceIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "Endpoint": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "CustomEndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false},
      "DBClusterEndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterEndpointList": {
    "type": "list",
    "member": {
      "shape": "DBClusterEndpoint",
      "locationName": "DBClusterEndpointList"
    },
    "flattened": false
  },
  "DBClusterEndpointMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusterEndpoints": {
        "shape": "DBClusterEndpointList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBClusterList": {
    "type": "list",
    "member": {"shape": "DBCluster", "locationName": "DBCluster"},
    "flattened": false
  },
  "DBClusterMember": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "IsClusterWriter": {"shape": "Boolean", "flattened": false},
      "DBClusterParameterGroupStatus": {"shape": "String", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterMemberList": {
    "type": "list",
    "member": {"shape": "DBClusterMember", "locationName": "DBClusterMember"},
    "flattened": false
  },
  "DBClusterMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusters": {"shape": "DBClusterList", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterOptionGroupMemberships": {
    "type": "list",
    "member": {
      "shape": "DBClusterOptionGroupStatus",
      "locationName": "DBClusterOptionGroup"
    },
    "flattened": false
  },
  "DBClusterOptionGroupStatus": {
    "type": "structure",
    "members": {
      "DBClusterOptionGroupName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterParameterGroup": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "DBClusterParameterGroupArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterParameterGroupDetails": {
    "type": "structure",
    "members": {
      "Parameters": {"shape": "ParametersList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterParameterGroupList": {
    "type": "list",
    "member": {
      "shape": "DBClusterParameterGroup",
      "locationName": "DBClusterParameterGroup"
    },
    "flattened": false
  },
  "DBClusterParameterGroupNameMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusterParameterGroups": {
        "shape": "DBClusterParameterGroupList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBClusterRole": {
    "type": "structure",
    "members": {
      "RoleArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "FeatureName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterRoles": {
    "type": "list",
    "member": {"shape": "DBClusterRole", "locationName": "DBClusterRole"},
    "flattened": false
  },
  "DBClusterSnapshot": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotCreateTime": {"shape": "TStamp", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "Integer", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "PercentProgress": {"shape": "Integer", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DBClusterSnapshotArn": {"shape": "String", "flattened": false},
      "SourceDBClusterSnapshotArn": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterSnapshotAttribute": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "String", "flattened": false},
      "AttributeValues": {"shape": "AttributeValueList", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterSnapshotAttributeList": {
    "type": "list",
    "member": {
      "shape": "DBClusterSnapshotAttribute",
      "locationName": "DBClusterSnapshotAttribute"
    },
    "flattened": false
  },
  "DBClusterSnapshotAttributesResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBClusterSnapshotAttributes": {
        "shape": "DBClusterSnapshotAttributeList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBClusterSnapshotList": {
    "type": "list",
    "member": {
      "shape": "DBClusterSnapshot",
      "locationName": "DBClusterSnapshot"
    },
    "flattened": false
  },
  "DBClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusterSnapshots": {
        "shape": "DBClusterSnapshotList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBEngineVersion": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "DBEngineDescription": {"shape": "String", "flattened": false},
      "DBEngineVersionDescription": {"shape": "String", "flattened": false},
      "DefaultCharacterSet": {"shape": "CharacterSet", "flattened": false},
      "SupportedCharacterSets": {
        "shape": "SupportedCharacterSetsList",
        "flattened": false
      },
      "ValidUpgradeTarget": {
        "shape": "ValidUpgradeTargetList",
        "flattened": false
      },
      "SupportedTimezones": {
        "shape": "SupportedTimezonesList",
        "flattened": false
      },
      "ExportableLogTypes": {"shape": "LogTypeList", "flattened": false},
      "SupportsLogExportsToCloudwatchLogs": {
        "shape": "Boolean",
        "flattened": false
      },
      "SupportsReadReplica": {"shape": "Boolean", "flattened": false},
      "SupportsGlobalDatabases": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DBEngineVersionList": {
    "type": "list",
    "member": {"shape": "DBEngineVersion", "locationName": "DBEngineVersion"},
    "flattened": false
  },
  "DBEngineVersionMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBEngineVersions": {"shape": "DBEngineVersionList", "flattened": false}
    },
    "flattened": false
  },
  "DBInstance": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "DBInstanceStatus": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "DBName": {"shape": "String", "flattened": false},
      "Endpoint": {"shape": "Endpoint", "flattened": false},
      "AllocatedStorage": {"shape": "Integer", "flattened": false},
      "InstanceCreateTime": {"shape": "TStamp", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "Integer", "flattened": false},
      "DBSecurityGroups": {
        "shape": "DBSecurityGroupMembershipList",
        "flattened": false
      },
      "VpcSecurityGroups": {
        "shape": "VpcSecurityGroupMembershipList",
        "flattened": false
      },
      "DBParameterGroups": {
        "shape": "DBParameterGroupStatusList",
        "flattened": false
      },
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "DBSubnetGroup": {"shape": "DBSubnetGroup", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "PendingModifiedValues": {
        "shape": "PendingModifiedValues",
        "flattened": false
      },
      "LatestRestorableTime": {"shape": "TStamp", "flattened": false},
      "MultiAZ": {"shape": "Boolean", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "ReadReplicaSourceDBInstanceIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "ReadReplicaDBInstanceIdentifiers": {
        "shape": "ReadReplicaDBInstanceIdentifierList",
        "flattened": false
      },
      "ReadReplicaDBClusterIdentifiers": {
        "shape": "ReadReplicaDBClusterIdentifierList",
        "flattened": false
      },
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupMemberships": {
        "shape": "OptionGroupMembershipList",
        "flattened": false
      },
      "CharacterSetName": {"shape": "String", "flattened": false},
      "SecondaryAvailabilityZone": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "Boolean", "flattened": false},
      "StatusInfos": {"shape": "DBInstanceStatusInfoList", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "DbInstancePort": {"shape": "Integer", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "DomainMemberships": {
        "shape": "DomainMembershipList",
        "flattened": false
      },
      "CopyTagsToSnapshot": {"shape": "Boolean", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "EnhancedMonitoringResourceArn": {"shape": "String", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceArn": {"shape": "String", "flattened": false},
      "Timezone": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "PerformanceInsightsEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceList": {
    "type": "list",
    "member": {"shape": "DBInstance", "locationName": "DBInstance"},
    "flattened": false
  },
  "DBInstanceMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBInstances": {"shape": "DBInstanceList", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceStatusInfo": {
    "type": "structure",
    "members": {
      "StatusType": {"shape": "String", "flattened": false},
      "Normal": {"shape": "Boolean", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Message": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceStatusInfoList": {
    "type": "list",
    "member": {
      "shape": "DBInstanceStatusInfo",
      "locationName": "DBInstanceStatusInfo"
    },
    "flattened": false
  },
  "DBParameterGroup": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "DBParameterGroupArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBParameterGroupDetails": {
    "type": "structure",
    "members": {
      "Parameters": {"shape": "ParametersList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBParameterGroupList": {
    "type": "list",
    "member": {"shape": "DBParameterGroup", "locationName": "DBParameterGroup"},
    "flattened": false
  },
  "DBParameterGroupNameMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBParameterGroupStatus": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterApplyStatus": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBParameterGroupStatusList": {
    "type": "list",
    "member": {
      "shape": "DBParameterGroupStatus",
      "locationName": "DBParameterGroup"
    },
    "flattened": false
  },
  "DBParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBParameterGroups": {"shape": "DBParameterGroupList", "flattened": false}
    },
    "flattened": false
  },
  "DBSecurityGroupMembership": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBSecurityGroupMembershipList": {
    "type": "list",
    "member": {
      "shape": "DBSecurityGroupMembership",
      "locationName": "DBSecurityGroup"
    },
    "flattened": false
  },
  "DBSecurityGroupNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "DBSecurityGroupName"},
    "flattened": false
  },
  "DBSubnetGroup": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DBSubnetGroupDescription": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "SubnetGroupStatus": {"shape": "String", "flattened": false},
      "Subnets": {"shape": "SubnetList", "flattened": false},
      "DBSubnetGroupArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBSubnetGroups": {"shape": "DBSubnetGroups", "flattened": false}
    },
    "flattened": false
  },
  "DBSubnetGroups": {
    "type": "list",
    "member": {"shape": "DBSubnetGroup", "locationName": "DBSubnetGroup"},
    "flattened": false
  },
  "DeleteDBClusterEndpointMessage": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterEndpointOutput": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointResourceIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "Endpoint": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "CustomEndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false},
      "DBClusterEndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "SkipFinalSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalDBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshot": {"shape": "DBClusterSnapshot", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "SkipFinalSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalDBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteEventSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteEventSubscriptionResult": {
    "type": "structure",
    "members": {
      "EventSubscription": {"shape": "EventSubscription", "flattened": false}
    },
    "flattened": false
  },
  "DeleteGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterEndpointsMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterParametersMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterSnapshotAttributesMessage": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterSnapshotAttributesResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotAttributesResult": {
        "shape": "DBClusterSnapshotAttributesResult",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeDBClusterSnapshotsMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "IncludeShared": {"shape": "Boolean", "flattened": false},
      "IncludePublic": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClustersMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBEngineVersionsMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "DefaultOnly": {"shape": "Boolean", "flattened": false},
      "ListSupportedCharacterSets": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ListSupportedTimezones": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBInstancesMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBParametersMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSubnetGroupsMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultClusterParametersMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultClusterParametersResult": {
    "type": "structure",
    "members": {
      "EngineDefaults": {"shape": "EngineDefaults", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultParametersMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
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
  "DescribeEventCategoriesMessage": {
    "type": "structure",
    "members": {
      "SourceType": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEventSubscriptionsMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
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
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeGlobalClustersMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOrderableDBInstanceOptionsMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "Vpc": {"shape": "BooleanOptional", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribePendingMaintenanceActionsMessage": {
    "type": "structure",
    "members": {
      "ResourceIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeValidDBInstanceModificationsMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeValidDBInstanceModificationsResult": {
    "type": "structure",
    "members": {
      "ValidDBInstanceModificationsMessage": {
        "shape": "ValidDBInstanceModificationsMessage",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DomainMembership": {
    "type": "structure",
    "members": {
      "Domain": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "FQDN": {"shape": "String", "flattened": false},
      "IAMRoleName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DomainMembershipList": {
    "type": "list",
    "member": {"shape": "DomainMembership", "locationName": "DomainMembership"},
    "flattened": false
  },
  "Double": {"type": "double", "flattened": false},
  "DoubleOptional": {"type": "double", "flattened": false},
  "DoubleRange": {
    "type": "structure",
    "members": {
      "From": {"shape": "Double", "flattened": false},
      "To": {"shape": "Double", "flattened": false}
    },
    "flattened": false
  },
  "DoubleRangeList": {
    "type": "list",
    "member": {"shape": "DoubleRange", "locationName": "DoubleRange"},
    "flattened": false
  },
  "Endpoint": {
    "type": "structure",
    "members": {
      "Address": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "HostedZoneId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EngineDefaults": {
    "type": "structure",
    "members": {
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "Event": {
    "type": "structure",
    "members": {
      "SourceIdentifier": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "SourceType", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Date": {"shape": "TStamp", "flattened": false},
      "SourceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EventCategoriesList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "EventCategory"},
    "flattened": false
  },
  "EventCategoriesMap": {
    "type": "structure",
    "members": {
      "SourceType": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false}
    },
    "flattened": false
  },
  "EventCategoriesMapList": {
    "type": "list",
    "member": {
      "shape": "EventCategoriesMap",
      "locationName": "EventCategoriesMap"
    },
    "flattened": false
  },
  "EventCategoriesMessage": {
    "type": "structure",
    "members": {
      "EventCategoriesMapList": {
        "shape": "EventCategoriesMapList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EventList": {
    "type": "list",
    "member": {"shape": "Event", "locationName": "Event"},
    "flattened": false
  },
  "EventSubscription": {
    "type": "structure",
    "members": {
      "CustomerAwsId": {"shape": "String", "flattened": false},
      "CustSubscriptionId": {"shape": "String", "flattened": false},
      "SnsTopicArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "SubscriptionCreationTime": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "SourceIdsList": {"shape": "SourceIdsList", "flattened": false},
      "EventCategoriesList": {
        "shape": "EventCategoriesList",
        "flattened": false
      },
      "Enabled": {"shape": "Boolean", "flattened": false},
      "EventSubscriptionArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EventSubscriptionsList": {
    "type": "list",
    "member": {
      "shape": "EventSubscription",
      "locationName": "EventSubscription"
    },
    "flattened": false
  },
  "EventSubscriptionsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "EventSubscriptionsList": {
        "shape": "EventSubscriptionsList",
        "flattened": false
      }
    },
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
  "FailoverDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "TargetDBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "FailoverDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "FailoverGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "TargetDbClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "FailoverGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
    },
    "flattened": false
  },
  "Filter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Values": {"shape": "FilterValueList", "flattened": false}
    },
    "flattened": false
  },
  "FilterList": {
    "type": "list",
    "member": {"shape": "Filter", "locationName": "Filter"},
    "flattened": false
  },
  "FilterValueList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "Value"},
    "flattened": false
  },
  "GlobalCluster": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "GlobalClusterResourceId": {"shape": "String", "flattened": false},
      "GlobalClusterArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "GlobalClusterMembers": {
        "shape": "GlobalClusterMemberList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GlobalClusterIdentifier": {"type": "string", "flattened": false},
  "GlobalClusterList": {
    "type": "list",
    "member": {"shape": "GlobalCluster", "locationName": "GlobalClusterMember"},
    "flattened": false
  },
  "GlobalClusterMember": {
    "type": "structure",
    "members": {
      "DBClusterArn": {"shape": "String", "flattened": false},
      "Readers": {"shape": "ReadersArnList", "flattened": false},
      "IsWriter": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "GlobalClusterMemberList": {
    "type": "list",
    "member": {
      "shape": "GlobalClusterMember",
      "locationName": "GlobalClusterMember"
    },
    "flattened": false
  },
  "GlobalClustersMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "GlobalClusters": {"shape": "GlobalClusterList", "flattened": false}
    },
    "flattened": false
  },
  "Integer": {"type": "integer", "flattened": false},
  "IntegerOptional": {"type": "integer", "flattened": false},
  "KeyList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ListTagsForResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false}
    },
    "flattened": false
  },
  "LogTypeList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ModifyDBClusterEndpointMessage": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterEndpointOutput": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "DBClusterEndpointResourceIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "Endpoint": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "EndpointType": {"shape": "String", "flattened": false},
      "CustomEndpointType": {"shape": "String", "flattened": false},
      "StaticMembers": {"shape": "StringList", "flattened": false},
      "ExcludedMembers": {"shape": "StringList", "flattened": false},
      "DBClusterEndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "NewDBClusterIdentifier": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "CloudwatchLogsExportConfiguration": {
        "shape": "CloudwatchLogsExportConfiguration",
        "flattened": false
      },
      "EngineVersion": {"shape": "String", "flattened": false},
      "AllowMajorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "DBInstanceParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterSnapshotAttributeMessage": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "AttributeName": {"shape": "String", "flattened": false},
      "ValuesToAdd": {"shape": "AttributeValueList", "flattened": false},
      "ValuesToRemove": {"shape": "AttributeValueList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBClusterSnapshotAttributeResult": {
    "type": "structure",
    "members": {
      "DBClusterSnapshotAttributesResult": {
        "shape": "DBClusterSnapshotAttributesResult",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DBSecurityGroups": {
        "shape": "DBSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AllowMajorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "NewDBInstanceIdentifier": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "TdeCredentialPassword": {"shape": "SensitiveString", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "DBPortNumber": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "CloudwatchLogsExportConfiguration": {
        "shape": "CloudwatchLogsExportConfiguration",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DBSubnetGroupDescription": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBSubnetGroupResult": {
    "type": "structure",
    "members": {
      "DBSubnetGroup": {"shape": "DBSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyEventSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SnsTopicArn": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Enabled": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyEventSubscriptionResult": {
    "type": "structure",
    "members": {
      "EventSubscription": {"shape": "EventSubscription", "flattened": false}
    },
    "flattened": false
  },
  "ModifyGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "NewGlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "AllowMajorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroupMembership": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroupMembershipList": {
    "type": "list",
    "member": {
      "shape": "OptionGroupMembership",
      "locationName": "OptionGroupMembership"
    },
    "flattened": false
  },
  "OrderableDBInstanceOption": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "AvailabilityZones": {
        "shape": "AvailabilityZoneList",
        "flattened": false
      },
      "MultiAZCapable": {"shape": "Boolean", "flattened": false},
      "ReadReplicaCapable": {"shape": "Boolean", "flattened": false},
      "Vpc": {"shape": "Boolean", "flattened": false},
      "SupportsStorageEncryption": {"shape": "Boolean", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "SupportsIops": {"shape": "Boolean", "flattened": false},
      "SupportsEnhancedMonitoring": {"shape": "Boolean", "flattened": false},
      "SupportsIAMDatabaseAuthentication": {
        "shape": "Boolean",
        "flattened": false
      },
      "SupportsPerformanceInsights": {"shape": "Boolean", "flattened": false},
      "MinStorageSize": {"shape": "IntegerOptional", "flattened": false},
      "MaxStorageSize": {"shape": "IntegerOptional", "flattened": false},
      "MinIopsPerDbInstance": {"shape": "IntegerOptional", "flattened": false},
      "MaxIopsPerDbInstance": {"shape": "IntegerOptional", "flattened": false},
      "MinIopsPerGib": {"shape": "DoubleOptional", "flattened": false},
      "MaxIopsPerGib": {"shape": "DoubleOptional", "flattened": false},
      "SupportsGlobalDatabases": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "OrderableDBInstanceOptionsList": {
    "type": "list",
    "member": {
      "shape": "OrderableDBInstanceOption",
      "locationName": "OrderableDBInstanceOption"
    },
    "flattened": false
  },
  "OrderableDBInstanceOptionsMessage": {
    "type": "structure",
    "members": {
      "OrderableDBInstanceOptions": {
        "shape": "OrderableDBInstanceOptionsList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Parameter": {
    "type": "structure",
    "members": {
      "ParameterName": {"shape": "String", "flattened": false},
      "ParameterValue": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "ApplyType": {"shape": "String", "flattened": false},
      "DataType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false},
      "ApplyMethod": {"shape": "ApplyMethod", "flattened": false}
    },
    "flattened": false
  },
  "ParametersList": {
    "type": "list",
    "member": {"shape": "Parameter", "locationName": "Parameter"},
    "flattened": false
  },
  "PendingCloudwatchLogsExports": {
    "type": "structure",
    "members": {
      "LogTypesToEnable": {"shape": "LogTypeList", "flattened": false},
      "LogTypesToDisable": {"shape": "LogTypeList", "flattened": false}
    },
    "flattened": false
  },
  "PendingMaintenanceAction": {
    "type": "structure",
    "members": {
      "Action": {"shape": "String", "flattened": false},
      "AutoAppliedAfterDate": {"shape": "TStamp", "flattened": false},
      "ForcedApplyDate": {"shape": "TStamp", "flattened": false},
      "OptInStatus": {"shape": "String", "flattened": false},
      "CurrentApplyDate": {"shape": "TStamp", "flattened": false},
      "Description": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PendingMaintenanceActionDetails": {
    "type": "list",
    "member": {
      "shape": "PendingMaintenanceAction",
      "locationName": "PendingMaintenanceAction"
    },
    "flattened": false
  },
  "PendingMaintenanceActions": {
    "type": "list",
    "member": {
      "shape": "ResourcePendingMaintenanceActions",
      "locationName": "ResourcePendingMaintenanceActions"
    },
    "flattened": false
  },
  "PendingMaintenanceActionsMessage": {
    "type": "structure",
    "members": {
      "PendingMaintenanceActions": {
        "shape": "PendingMaintenanceActions",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PendingModifiedValues": {
    "type": "structure",
    "members": {
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "PendingCloudwatchLogsExports": {
        "shape": "PendingCloudwatchLogsExports",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PromoteReadReplicaDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PromoteReadReplicaDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "Range": {
    "type": "structure",
    "members": {
      "From": {"shape": "Integer", "flattened": false},
      "To": {"shape": "Integer", "flattened": false},
      "Step": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "RangeList": {
    "type": "list",
    "member": {"shape": "Range", "locationName": "Range"},
    "flattened": false
  },
  "ReadReplicaDBClusterIdentifierList": {
    "type": "list",
    "member": {
      "shape": "String",
      "locationName": "ReadReplicaDBClusterIdentifier"
    },
    "flattened": false
  },
  "ReadReplicaDBInstanceIdentifierList": {
    "type": "list",
    "member": {
      "shape": "String",
      "locationName": "ReadReplicaDBInstanceIdentifier"
    },
    "flattened": false
  },
  "ReadReplicaIdentifierList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ReadReplicaIdentifier"},
    "flattened": false
  },
  "ReadersArnList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "RebootDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "ForceFailover": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "RebootDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "RemoveFromGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "DbClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RemoveFromGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
    },
    "flattened": false
  },
  "RemoveRoleFromDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "FeatureName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RemoveSourceIdentifierFromSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SourceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RemoveSourceIdentifierFromSubscriptionResult": {
    "type": "structure",
    "members": {
      "EventSubscription": {"shape": "EventSubscription", "flattened": false}
    },
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
  "ResetDBClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "ResetAllParameters": {"shape": "Boolean", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ResetDBParameterGroupMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "ResetAllParameters": {"shape": "Boolean", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ResourcePendingMaintenanceActions": {
    "type": "structure",
    "members": {
      "ResourceIdentifier": {"shape": "String", "flattened": false},
      "PendingMaintenanceActionDetails": {
        "shape": "PendingMaintenanceActionDetails",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RestoreDBClusterFromSnapshotMessage": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DatabaseName": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBClusterFromSnapshotResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBClusterToPointInTimeMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "RestoreType": {"shape": "String", "flattened": false},
      "SourceDBClusterIdentifier": {"shape": "String", "flattened": false},
      "RestoreToTime": {"shape": "TStamp", "flattened": false},
      "UseLatestRestorableTime": {"shape": "Boolean", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBClusterToPointInTimeResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "SensitiveString": {"type": "string", "flattened": false},
  "ServerlessV2ScalingConfiguration": {
    "type": "structure",
    "members": {
      "MinCapacity": {"shape": "DoubleOptional", "flattened": false},
      "MaxCapacity": {"shape": "DoubleOptional", "flattened": false}
    },
    "flattened": false
  },
  "ServerlessV2ScalingConfigurationInfo": {
    "type": "structure",
    "members": {
      "MinCapacity": {"shape": "DoubleOptional", "flattened": false},
      "MaxCapacity": {"shape": "DoubleOptional", "flattened": false}
    },
    "flattened": false
  },
  "SourceIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SourceId"},
    "flattened": false
  },
  "SourceType": {"type": "string", "flattened": false},
  "StartDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StartDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "StopDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StopDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "StringList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "Subnet": {
    "type": "structure",
    "members": {
      "SubnetIdentifier": {"shape": "String", "flattened": false},
      "SubnetAvailabilityZone": {
        "shape": "AvailabilityZone",
        "flattened": false
      },
      "SubnetStatus": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SubnetIdentifierList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SubnetIdentifier"},
    "flattened": false
  },
  "SubnetList": {
    "type": "list",
    "member": {"shape": "Subnet", "locationName": "Subnet"},
    "flattened": false
  },
  "SupportedCharacterSetsList": {
    "type": "list",
    "member": {"shape": "CharacterSet", "locationName": "CharacterSet"},
    "flattened": false
  },
  "SupportedTimezonesList": {
    "type": "list",
    "member": {"shape": "Timezone", "locationName": "Timezone"},
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
  "Timezone": {
    "type": "structure",
    "members": {
      "TimezoneName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UpgradeTarget": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "AutoUpgrade": {"shape": "Boolean", "flattened": false},
      "IsMajorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "SupportsGlobalDatabases": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ValidDBInstanceModificationsMessage": {
    "type": "structure",
    "members": {
      "Storage": {"shape": "ValidStorageOptionsList", "flattened": false}
    },
    "flattened": false
  },
  "ValidStorageOptions": {
    "type": "structure",
    "members": {
      "StorageType": {"shape": "String", "flattened": false},
      "StorageSize": {"shape": "RangeList", "flattened": false},
      "ProvisionedIops": {"shape": "RangeList", "flattened": false},
      "IopsToStorageRatio": {"shape": "DoubleRangeList", "flattened": false}
    },
    "flattened": false
  },
  "ValidStorageOptionsList": {
    "type": "list",
    "member": {
      "shape": "ValidStorageOptions",
      "locationName": "ValidStorageOptions"
    },
    "flattened": false
  },
  "ValidUpgradeTargetList": {
    "type": "list",
    "member": {"shape": "UpgradeTarget", "locationName": "UpgradeTarget"},
    "flattened": false
  },
  "VpcSecurityGroupIdList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "VpcSecurityGroupId"},
    "flattened": false
  },
  "VpcSecurityGroupMembership": {
    "type": "structure",
    "members": {
      "VpcSecurityGroupId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "VpcSecurityGroupMembershipList": {
    "type": "list",
    "member": {
      "shape": "VpcSecurityGroupMembership",
      "locationName": "VpcSecurityGroupMembership"
    },
    "flattened": false
  }
};
