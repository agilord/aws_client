// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
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
  "CACertificateIdentifiersList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "Certificate": {
    "type": "structure",
    "members": {
      "CertificateIdentifier": {"shape": "String", "flattened": false},
      "CertificateType": {"shape": "String", "flattened": false},
      "Thumbprint": {"shape": "String", "flattened": false},
      "ValidFrom": {"shape": "TStamp", "flattened": false},
      "ValidTill": {"shape": "TStamp", "flattened": false},
      "CertificateArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CertificateDetails": {
    "type": "structure",
    "members": {
      "CAIdentifier": {"shape": "String", "flattened": false},
      "ValidTill": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "CertificateList": {
    "type": "list",
    "member": {"shape": "Certificate", "locationName": "Certificate"},
    "flattened": false
  },
  "CertificateMessage": {
    "type": "structure",
    "members": {
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
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
  "CreateDBClusterMessage": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
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
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
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
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false}
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
      "DatabaseName": {"shape": "String", "flattened": false},
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
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
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
      "CloneGroupId": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "Boolean", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false}
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
      "Status": {"shape": "String", "flattened": false}
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
      "Status": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "PercentProgress": {"shape": "Integer", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DBClusterSnapshotArn": {"shape": "String", "flattened": false},
      "SourceDBClusterSnapshotArn": {"shape": "String", "flattened": false},
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
      "ValidUpgradeTarget": {
        "shape": "ValidUpgradeTargetList",
        "flattened": false
      },
      "ExportableLogTypes": {"shape": "LogTypeList", "flattened": false},
      "SupportsLogExportsToCloudwatchLogs": {
        "shape": "Boolean",
        "flattened": false
      },
      "SupportedCACertificateIdentifiers": {
        "shape": "CACertificateIdentifiersList",
        "flattened": false
      },
      "SupportsCertificateRotationWithoutRestart": {
        "shape": "BooleanOptional",
        "flattened": false
      }
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
      "Endpoint": {"shape": "Endpoint", "flattened": false},
      "InstanceCreateTime": {"shape": "TStamp", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "Integer", "flattened": false},
      "VpcSecurityGroups": {
        "shape": "VpcSecurityGroupMembershipList",
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
      "EngineVersion": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "PubliclyAccessible": {"shape": "Boolean", "flattened": false},
      "StatusInfos": {"shape": "DBInstanceStatusInfoList", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceArn": {"shape": "String", "flattened": false},
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "CertificateDetails": {"shape": "CertificateDetails", "flattened": false},
      "PerformanceInsightsEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false}
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
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
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
  "DescribeCertificatesMessage": {
    "type": "structure",
    "members": {
      "CertificateIdentifier": {"shape": "String", "flattened": false},
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
      "Filters": {"shape": "FilterList", "flattened": false},
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
      "DatabaseName": {"shape": "String", "flattened": false},
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
      "PreferredBackupWindow": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "CloudwatchLogsExportConfiguration": {
        "shape": "CloudwatchLogsExportConfiguration",
        "flattened": false
      },
      "EngineVersion": {"shape": "String", "flattened": false},
      "AllowMajorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
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
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "NewDBInstanceIdentifier": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "PromotionTier": {"shape": "IntegerOptional", "flattened": false},
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "CertificateRotationRestart": {
        "shape": "BooleanOptional",
        "flattened": false
      }
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
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false}
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
      "Vpc": {"shape": "Boolean", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false}
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
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
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
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
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
  "SwitchoverGlobalClusterMessage": {
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
  "SwitchoverGlobalClusterResult": {
    "type": "structure",
    "members": {
      "GlobalCluster": {"shape": "GlobalCluster", "flattened": false}
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
  "UpgradeTarget": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "AutoUpgrade": {"shape": "Boolean", "flattened": false},
      "IsMajorVersionUpgrade": {"shape": "Boolean", "flattened": false}
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
