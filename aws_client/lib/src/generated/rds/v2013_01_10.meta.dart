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
  "AuthorizeDBSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupId": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeDBSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "DBSecurityGroup": {"shape": "DBSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "AvailabilityZone": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "ProvisionedIopsCapable": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "AvailabilityZoneList": {
    "type": "list",
    "member": {"shape": "AvailabilityZone", "locationName": "AvailabilityZone"},
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
  "CopyDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "SourceDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "TargetDBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CopyDBSnapshotResult": {
    "type": "structure",
    "members": {
      "DBSnapshot": {"shape": "DBSnapshot", "flattened": false}
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
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBInstanceReadReplicaMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "SourceDBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBInstanceReadReplicaResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
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
      "Description": {"shape": "String", "flattened": false}
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
  "CreateDBSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "DBSecurityGroupDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSecurityGroupResult": {
    "type": "structure",
    "members": {
      "DBSecurityGroup": {"shape": "DBSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSnapshotResult": {
    "type": "structure",
    "members": {
      "DBSnapshot": {"shape": "DBSnapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "DBSubnetGroupDescription": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false}
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
      "Enabled": {"shape": "BooleanOptional", "flattened": false}
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
  "CreateOptionGroupMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "OptionGroupDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateOptionGroupResult": {
    "type": "structure",
    "members": {
      "OptionGroup": {"shape": "OptionGroup", "flattened": false}
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
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupMembership": {
        "shape": "OptionGroupMembership",
        "flattened": false
      },
      "CharacterSetName": {"shape": "String", "flattened": false},
      "SecondaryAvailabilityZone": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "Boolean", "flattened": false}
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
  "DBParameterGroup": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false}
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
  "DBSecurityGroup": {
    "type": "structure",
    "members": {
      "OwnerId": {"shape": "String", "flattened": false},
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "DBSecurityGroupDescription": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "EC2SecurityGroups": {
        "shape": "EC2SecurityGroupList",
        "flattened": false
      },
      "IPRanges": {"shape": "IPRangeList", "flattened": false}
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
  "DBSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBSecurityGroups": {"shape": "DBSecurityGroups", "flattened": false}
    },
    "flattened": false
  },
  "DBSecurityGroupNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "DBSecurityGroupName"},
    "flattened": false
  },
  "DBSecurityGroups": {
    "type": "list",
    "member": {"shape": "DBSecurityGroup", "locationName": "DBSecurityGroup"},
    "flattened": false
  },
  "DBSnapshot": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "SnapshotCreateTime": {"shape": "TStamp", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "Integer", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "InstanceCreateTime": {"shape": "TStamp", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBSnapshotList": {
    "type": "list",
    "member": {"shape": "DBSnapshot", "locationName": "DBSnapshot"},
    "flattened": false
  },
  "DBSnapshotMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBSnapshots": {"shape": "DBSnapshotList", "flattened": false}
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
      "Subnets": {"shape": "SubnetList", "flattened": false}
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
  "DeleteDBSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBSnapshotResult": {
    "type": "structure",
    "members": {
      "DBSnapshot": {"shape": "DBSnapshot", "flattened": false}
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
  "DeleteOptionGroupMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBEngineVersionsMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "DefaultOnly": {"shape": "Boolean", "flattened": false},
      "ListSupportedCharacterSets": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeDBInstancesMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupName": {"shape": "String", "flattened": false},
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
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSecurityGroupsMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSnapshotsMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSubnetGroupsMessage": {
    "type": "structure",
    "members": {
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEngineDefaultParametersMessage": {
    "type": "structure",
    "members": {
      "DBParameterGroupFamily": {"shape": "String", "flattened": false},
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
      "SourceType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEventSubscriptionsMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
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
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOptionGroupOptionsMessage": {
    "type": "structure",
    "members": {
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOptionGroupsMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false}
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
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedDBInstancesMessage": {
    "type": "structure",
    "members": {
      "ReservedDBInstanceId": {"shape": "String", "flattened": false},
      "ReservedDBInstancesOfferingId": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Duration": {"shape": "String", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedDBInstancesOfferingsMessage": {
    "type": "structure",
    "members": {
      "ReservedDBInstancesOfferingId": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Duration": {"shape": "String", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Double": {"type": "double", "flattened": false},
  "EC2SecurityGroup": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupId": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EC2SecurityGroupList": {
    "type": "list",
    "member": {"shape": "EC2SecurityGroup", "locationName": "EC2SecurityGroup"},
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
      "Date": {"shape": "TStamp", "flattened": false}
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
      "Id": {"shape": "String", "flattened": false},
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
      "Enabled": {"shape": "Boolean", "flattened": false}
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
  "IPRange": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "IPRangeList": {
    "type": "list",
    "member": {"shape": "IPRange", "locationName": "IPRange"},
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
      "ResourceName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
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
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "NewDBInstanceIdentifier": {"shape": "String", "flattened": false}
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
  "ModifyOptionGroupMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "OptionsToInclude": {
        "shape": "OptionConfigurationList",
        "flattened": false
      },
      "OptionsToRemove": {"shape": "OptionNamesList", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ModifyOptionGroupResult": {
    "type": "structure",
    "members": {
      "OptionGroup": {"shape": "OptionGroup", "flattened": false}
    },
    "flattened": false
  },
  "Option": {
    "type": "structure",
    "members": {
      "OptionName": {"shape": "String", "flattened": false},
      "OptionDescription": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "DBSecurityGroupMemberships": {
        "shape": "DBSecurityGroupMembershipList",
        "flattened": false
      },
      "VpcSecurityGroupMemberships": {
        "shape": "VpcSecurityGroupMembershipList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "OptionConfiguration": {
    "type": "structure",
    "members": {
      "OptionName": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "DBSecurityGroupMemberships": {
        "shape": "DBSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupMemberships": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "OptionConfigurationList": {
    "type": "list",
    "member": {
      "shape": "OptionConfiguration",
      "locationName": "OptionConfiguration"
    },
    "flattened": false
  },
  "OptionGroup": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "OptionGroupDescription": {"shape": "String", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "Options": {"shape": "OptionsList", "flattened": false},
      "AllowsVpcAndNonVpcInstanceMemberships": {
        "shape": "Boolean",
        "flattened": false
      },
      "VpcId": {"shape": "String", "flattened": false}
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
  "OptionGroupOption": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "MinimumRequiredMinorEngineVersion": {
        "shape": "String",
        "flattened": false
      },
      "PortRequired": {"shape": "Boolean", "flattened": false},
      "DefaultPort": {"shape": "IntegerOptional", "flattened": false},
      "OptionsDependedOn": {"shape": "OptionsDependedOn", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroupOptionsList": {
    "type": "list",
    "member": {
      "shape": "OptionGroupOption",
      "locationName": "OptionGroupOption"
    },
    "flattened": false
  },
  "OptionGroupOptionsMessage": {
    "type": "structure",
    "members": {
      "OptionGroupOptions": {
        "shape": "OptionGroupOptionsList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroups": {
    "type": "structure",
    "members": {
      "OptionGroupsList": {"shape": "OptionGroupsList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroupsList": {
    "type": "list",
    "member": {"shape": "OptionGroup", "locationName": "OptionGroup"},
    "flattened": false
  },
  "OptionNamesList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "OptionsDependedOn": {
    "type": "list",
    "member": {"shape": "String", "locationName": "OptionName"},
    "flattened": false
  },
  "OptionsList": {
    "type": "list",
    "member": {"shape": "Option", "locationName": "Option"},
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
      "Vpc": {"shape": "Boolean", "flattened": false}
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
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PromoteReadReplicaMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "PreferredBackupWindow": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PromoteReadReplicaResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "PurchaseReservedDBInstancesOfferingMessage": {
    "type": "structure",
    "members": {
      "ReservedDBInstancesOfferingId": {"shape": "String", "flattened": false},
      "ReservedDBInstanceId": {"shape": "String", "flattened": false},
      "DBInstanceCount": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "PurchaseReservedDBInstancesOfferingResult": {
    "type": "structure",
    "members": {
      "ReservedDBInstance": {"shape": "ReservedDBInstance", "flattened": false}
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
  "ReservedDBInstance": {
    "type": "structure",
    "members": {
      "ReservedDBInstanceId": {"shape": "String", "flattened": false},
      "ReservedDBInstancesOfferingId": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "CurrencyCode": {"shape": "String", "flattened": false},
      "DBInstanceCount": {"shape": "Integer", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "Boolean", "flattened": false},
      "State": {"shape": "String", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false}
    },
    "flattened": false
  },
  "ReservedDBInstanceList": {
    "type": "list",
    "member": {
      "shape": "ReservedDBInstance",
      "locationName": "ReservedDBInstance"
    },
    "flattened": false
  },
  "ReservedDBInstanceMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedDBInstances": {
        "shape": "ReservedDBInstanceList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedDBInstancesOffering": {
    "type": "structure",
    "members": {
      "ReservedDBInstancesOfferingId": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "CurrencyCode": {"shape": "String", "flattened": false},
      "ProductDescription": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "Boolean", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false}
    },
    "flattened": false
  },
  "ReservedDBInstancesOfferingList": {
    "type": "list",
    "member": {
      "shape": "ReservedDBInstancesOffering",
      "locationName": "ReservedDBInstancesOffering"
    },
    "flattened": false
  },
  "ReservedDBInstancesOfferingMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedDBInstancesOfferings": {
        "shape": "ReservedDBInstancesOfferingList",
        "flattened": false
      }
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
  "RestoreDBInstanceFromDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "LicenseModel": {"shape": "String", "flattened": false},
      "DBName": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBInstanceFromDBSnapshotResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBInstanceToPointInTimeMessage": {
    "type": "structure",
    "members": {
      "SourceDBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TargetDBInstanceIdentifier": {"shape": "String", "flattened": false},
      "RestoreTime": {"shape": "TStamp", "flattened": false},
      "UseLatestRestorableTime": {"shape": "Boolean", "flattened": false},
      "DBInstanceClass": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "LicenseModel": {"shape": "String", "flattened": false},
      "DBName": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBInstanceToPointInTimeResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "RevokeDBSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupId": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RevokeDBSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "DBSecurityGroup": {"shape": "DBSecurityGroup", "flattened": false}
    },
    "flattened": false
  },
  "SourceIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SourceId"},
    "flattened": false
  },
  "SourceType": {"type": "string", "flattened": false},
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
  "SupportedCharacterSetsList": {
    "type": "list",
    "member": {"shape": "CharacterSet", "locationName": "CharacterSet"},
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
