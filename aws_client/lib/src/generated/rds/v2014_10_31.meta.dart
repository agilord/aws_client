// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AccountAttributesMessage": {
    "type": "structure",
    "members": {
      "AccountQuotas": {"shape": "AccountQuotaList", "flattened": false}
    },
    "flattened": false
  },
  "AccountQuota": {
    "type": "structure",
    "members": {
      "AccountQuotaName": {"shape": "String", "flattened": false},
      "Used": {"shape": "Long", "flattened": false},
      "Max": {"shape": "Long", "flattened": false}
    },
    "flattened": false
  },
  "AccountQuotaList": {
    "type": "list",
    "member": {"shape": "AccountQuota", "locationName": "AccountQuota"},
    "flattened": false
  },
  "ActivityStreamMode": {"type": "string", "flattened": false},
  "ActivityStreamModeList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ActivityStreamPolicyStatus": {"type": "string", "flattened": false},
  "ActivityStreamStatus": {"type": "string", "flattened": false},
  "AddRoleToDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "FeatureName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AddRoleToDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
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
  "Arn": {"type": "string", "flattened": false},
  "AttributeValueList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AttributeValue"},
    "flattened": false
  },
  "AuditPolicyState": {"type": "string", "flattened": false},
  "AuthScheme": {"type": "string", "flattened": false},
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
  "AutomationMode": {"type": "string", "flattened": false},
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
  "AvailableProcessorFeature": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "DefaultValue": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AvailableProcessorFeatureList": {
    "type": "list",
    "member": {
      "shape": "AvailableProcessorFeature",
      "locationName": "AvailableProcessorFeature"
    },
    "flattened": false
  },
  "AwsBackupRecoveryPointArn": {"type": "string", "flattened": false},
  "BacktrackDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "BacktrackTo": {"shape": "TStamp", "flattened": false},
      "Force": {"shape": "BooleanOptional", "flattened": false},
      "UseEarliestTimeOnPointInTimeUnavailable": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BlueGreenDeployment": {
    "type": "structure",
    "members": {
      "BlueGreenDeploymentIdentifier": {
        "shape": "BlueGreenDeploymentIdentifier",
        "flattened": false
      },
      "BlueGreenDeploymentName": {
        "shape": "BlueGreenDeploymentName",
        "flattened": false
      },
      "Source": {"shape": "DatabaseArn", "flattened": false},
      "Target": {"shape": "DatabaseArn", "flattened": false},
      "SwitchoverDetails": {
        "shape": "SwitchoverDetailList",
        "flattened": false
      },
      "Tasks": {"shape": "BlueGreenDeploymentTaskList", "flattened": false},
      "Status": {"shape": "BlueGreenDeploymentStatus", "flattened": false},
      "StatusDetails": {
        "shape": "BlueGreenDeploymentStatusDetails",
        "flattened": false
      },
      "CreateTime": {"shape": "TStamp", "flattened": false},
      "DeleteTime": {"shape": "TStamp", "flattened": false},
      "TagList": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "BlueGreenDeploymentIdentifier": {"type": "string", "flattened": false},
  "BlueGreenDeploymentList": {
    "type": "list",
    "member": {"shape": "BlueGreenDeployment"},
    "flattened": false
  },
  "BlueGreenDeploymentName": {"type": "string", "flattened": false},
  "BlueGreenDeploymentStatus": {"type": "string", "flattened": false},
  "BlueGreenDeploymentStatusDetails": {"type": "string", "flattened": false},
  "BlueGreenDeploymentTask": {
    "type": "structure",
    "members": {
      "Name": {"shape": "BlueGreenDeploymentTaskName", "flattened": false},
      "Status": {"shape": "BlueGreenDeploymentTaskStatus", "flattened": false}
    },
    "flattened": false
  },
  "BlueGreenDeploymentTaskList": {
    "type": "list",
    "member": {"shape": "BlueGreenDeploymentTask"},
    "flattened": false
  },
  "BlueGreenDeploymentTaskName": {"type": "string", "flattened": false},
  "BlueGreenDeploymentTaskStatus": {"type": "string", "flattened": false},
  "Boolean": {"type": "boolean", "flattened": false},
  "BooleanOptional": {"type": "boolean", "flattened": false},
  "BucketName": {"type": "string", "flattened": false},
  "CACertificateIdentifiersList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "CancelExportTaskMessage": {
    "type": "structure",
    "members": {
      "ExportTaskIdentifier": {"shape": "String", "flattened": false}
    },
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
      "CertificateArn": {"shape": "String", "flattened": false},
      "CustomerOverride": {"shape": "BooleanOptional", "flattened": false},
      "CustomerOverrideValidTill": {"shape": "TStamp", "flattened": false}
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
      "DefaultCertificateForNewLaunches": {
        "shape": "String",
        "flattened": false
      },
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CharacterSet": {
    "type": "structure",
    "members": {
      "CharacterSetName": {"shape": "String", "flattened": false},
      "CharacterSetDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClientPasswordAuthType": {"type": "string", "flattened": false},
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
      "MasterUserPassword": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EngineVersion": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "RdsCustomClusterConfiguration": {
        "shape": "RdsCustomClusterConfiguration",
        "flattened": false
      },
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "CertificateDetails": {"shape": "CertificateDetails", "flattened": false}
    },
    "flattened": false
  },
  "ConnectionPoolConfiguration": {
    "type": "structure",
    "members": {
      "MaxConnectionsPercent": {"shape": "IntegerOptional", "flattened": false},
      "MaxIdleConnectionsPercent": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ConnectionBorrowTimeout": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SessionPinningFilters": {"shape": "StringList", "flattened": false},
      "InitQuery": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ConnectionPoolConfigurationInfo": {
    "type": "structure",
    "members": {
      "MaxConnectionsPercent": {"shape": "Integer", "flattened": false},
      "MaxIdleConnectionsPercent": {"shape": "Integer", "flattened": false},
      "ConnectionBorrowTimeout": {"shape": "Integer", "flattened": false},
      "SessionPinningFilters": {"shape": "StringList", "flattened": false},
      "InitQuery": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ContextAttribute": {
    "type": "structure",
    "members": {
      "Key": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ContextAttributeList": {
    "type": "list",
    "member": {"shape": "ContextAttribute"},
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
      "Tags": {"shape": "TagList", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false}
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
  "CopyDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "SourceDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "TargetDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "CopyTags": {"shape": "BooleanOptional", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "TargetCustomAvailabilityZone": {"shape": "String", "flattened": false},
      "CopyOptionGroup": {"shape": "BooleanOptional", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false}
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
  "CopyOptionGroupMessage": {
    "type": "structure",
    "members": {
      "SourceOptionGroupIdentifier": {"shape": "String", "flattened": false},
      "TargetOptionGroupIdentifier": {"shape": "String", "flattened": false},
      "TargetOptionGroupDescription": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CopyOptionGroupResult": {
    "type": "structure",
    "members": {
      "OptionGroup": {"shape": "OptionGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateBlueGreenDeploymentRequest": {
    "type": "structure",
    "members": {
      "BlueGreenDeploymentName": {
        "shape": "BlueGreenDeploymentName",
        "flattened": false
      },
      "Source": {"shape": "DatabaseArn", "flattened": false},
      "TargetEngineVersion": {
        "shape": "TargetEngineVersion",
        "flattened": false
      },
      "TargetDBParameterGroupName": {
        "shape": "TargetDBParameterGroupName",
        "flattened": false
      },
      "TargetDBClusterParameterGroupName": {
        "shape": "TargetDBClusterParameterGroupName",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "TargetDBInstanceClass": {
        "shape": "TargetDBInstanceClass",
        "flattened": false
      },
      "UpgradeTargetStorageConfig": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateBlueGreenDeploymentResponse": {
    "type": "structure",
    "members": {
      "BlueGreenDeployment": {
        "shape": "BlueGreenDeployment",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateCustomDBEngineVersionMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "CustomEngineName", "flattened": false},
      "EngineVersion": {"shape": "CustomEngineVersion", "flattened": false},
      "DatabaseInstallationFilesS3BucketName": {
        "shape": "BucketName",
        "flattened": false
      },
      "DatabaseInstallationFilesS3Prefix": {
        "shape": "String255",
        "flattened": false
      },
      "ImageId": {"shape": "String255", "flattened": false},
      "KMSKeyId": {"shape": "KmsKeyIdOrArn", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "Manifest": {
        "shape": "CustomDBEngineVersionManifest",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "SourceCustomDbEngineVersionIdentifier": {
        "shape": "String255",
        "flattened": false
      },
      "UseAwsProvidedLatestImage": {
        "shape": "BooleanOptional",
        "flattened": false
      }
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
  "CreateDBClusterMessage": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
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
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "EngineMode": {"shape": "String", "flattened": false},
      "ScalingConfiguration": {
        "shape": "ScalingConfiguration",
        "flattened": false
      },
      "RdsCustomClusterConfiguration": {
        "shape": "RdsCustomClusterConfiguration",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
      "EnableHttpEndpoint": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "EnableGlobalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DBClusterInstanceClass": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "EnableLimitlessDatabase": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "EnableLocalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false}
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
      "NcharCharacterSetName": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "TdeCredentialPassword": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainFqdn": {"shape": "String", "flattened": false},
      "DomainOu": {"shape": "String", "flattened": false},
      "DomainAuthSecretArn": {"shape": "String", "flattened": false},
      "DomainDnsIps": {"shape": "StringList", "flattened": false},
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
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "EnableCustomerOwnedIp": {"shape": "BooleanOptional", "flattened": false},
      "CustomIamInstanceProfile": {"shape": "String", "flattened": false},
      "BackupTarget": {"shape": "String", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
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
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "DBSubnetGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "StorageType": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "UseDefaultProcessorFeatures": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "DomainFqdn": {"shape": "String", "flattened": false},
      "DomainOu": {"shape": "String", "flattened": false},
      "DomainAuthSecretArn": {"shape": "String", "flattened": false},
      "DomainDnsIps": {"shape": "StringList", "flattened": false},
      "ReplicaMode": {"shape": "ReplicaMode", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "CustomIamInstanceProfile": {"shape": "String", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "EnableCustomerOwnedIp": {"shape": "BooleanOptional", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "SourceDBClusterIdentifier": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "UpgradeStorageConfig": {"shape": "BooleanOptional", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false}
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
  "CreateDBProxyEndpointRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "DBProxyName", "flattened": false},
      "DBProxyEndpointName": {
        "shape": "DBProxyEndpointName",
        "flattened": false
      },
      "VpcSubnetIds": {"shape": "StringList", "flattened": false},
      "VpcSecurityGroupIds": {"shape": "StringList", "flattened": false},
      "TargetRole": {"shape": "DBProxyEndpointTargetRole", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBProxyEndpointResponse": {
    "type": "structure",
    "members": {
      "DBProxyEndpoint": {"shape": "DBProxyEndpoint", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBProxyRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "EngineFamily": {"shape": "EngineFamily", "flattened": false},
      "Auth": {"shape": "UserAuthConfigList", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "VpcSubnetIds": {"shape": "StringList", "flattened": false},
      "VpcSecurityGroupIds": {"shape": "StringList", "flattened": false},
      "RequireTLS": {"shape": "Boolean", "flattened": false},
      "IdleClientTimeout": {"shape": "IntegerOptional", "flattened": false},
      "DebugLogging": {"shape": "Boolean", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBProxyResponse": {
    "type": "structure",
    "members": {
      "DBProxy": {"shape": "DBProxy", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "DBSecurityGroupDescription": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
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
  "CreateDBShardGroupMessage": {
    "type": "structure",
    "members": {
      "DBShardGroupIdentifier": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "ComputeRedundancy": {"shape": "IntegerOptional", "flattened": false},
      "MaxACU": {"shape": "DoubleOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
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
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
      "SourceDBClusterIdentifier": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false},
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
  "CreateIntegrationMessage": {
    "type": "structure",
    "members": {
      "SourceArn": {"shape": "SourceArn", "flattened": false},
      "TargetArn": {"shape": "Arn", "flattened": false},
      "IntegrationName": {"shape": "IntegrationName", "flattened": false},
      "KMSKeyId": {"shape": "String", "flattened": false},
      "AdditionalEncryptionContext": {
        "shape": "EncryptionContextMap",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false},
      "DataFilter": {"shape": "DataFilter", "flattened": false},
      "Description": {"shape": "IntegrationDescription", "flattened": false}
    },
    "flattened": false
  },
  "CreateOptionGroupMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "OptionGroupDescription": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
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
  "CreateTenantDatabaseMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "NcharCharacterSetName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateTenantDatabaseResult": {
    "type": "structure",
    "members": {
      "TenantDatabase": {"shape": "TenantDatabase", "flattened": false}
    },
    "flattened": false
  },
  "CustomDBEngineVersionAMI": {
    "type": "structure",
    "members": {
      "ImageId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CustomDBEngineVersionManifest": {"type": "string", "flattened": false},
  "CustomEngineName": {"type": "string", "flattened": false},
  "CustomEngineVersion": {"type": "string", "flattened": false},
  "CustomEngineVersionStatus": {"type": "string", "flattened": false},
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
      "AutomaticRestartTime": {"shape": "TStamp", "flattened": false},
      "PercentProgress": {"shape": "String", "flattened": false},
      "EarliestRestorableTime": {"shape": "TStamp", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "ReaderEndpoint": {"shape": "String", "flattened": false},
      "CustomEndpoints": {"shape": "StringList", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
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
      "StatusInfos": {"shape": "DBClusterStatusInfoList", "flattened": false},
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
        "shape": "BooleanOptional",
        "flattened": false
      },
      "CloneGroupId": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "EarliestBacktrackTime": {"shape": "TStamp", "flattened": false},
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "BacktrackConsumedChangeRecords": {
        "shape": "LongOptional",
        "flattened": false
      },
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "Capacity": {"shape": "IntegerOptional", "flattened": false},
      "EngineMode": {"shape": "String", "flattened": false},
      "ScalingConfigurationInfo": {
        "shape": "ScalingConfigurationInfo",
        "flattened": false
      },
      "RdsCustomClusterConfiguration": {
        "shape": "RdsCustomClusterConfiguration",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "HttpEndpointEnabled": {"shape": "BooleanOptional", "flattened": false},
      "ActivityStreamMode": {"shape": "ActivityStreamMode", "flattened": false},
      "ActivityStreamStatus": {
        "shape": "ActivityStreamStatus",
        "flattened": false
      },
      "ActivityStreamKmsKeyId": {"shape": "String", "flattened": false},
      "ActivityStreamKinesisStreamName": {
        "shape": "String",
        "flattened": false
      },
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "CrossAccountClone": {"shape": "BooleanOptional", "flattened": false},
      "DomainMemberships": {
        "shape": "DomainMembershipList",
        "flattened": false
      },
      "TagList": {"shape": "TagList", "flattened": false},
      "GlobalWriteForwardingStatus": {
        "shape": "WriteForwardingStatus",
        "flattened": false
      },
      "GlobalWriteForwardingRequested": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PendingModifiedValues": {
        "shape": "ClusterPendingModifiedValues",
        "flattened": false
      },
      "DBClusterInstanceClass": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "PerformanceInsightsEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfigurationInfo",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "MasterUserSecret": {"shape": "MasterUserSecret", "flattened": false},
      "IOOptimizedNextAllowedModificationTime": {
        "shape": "TStamp",
        "flattened": false
      },
      "LocalWriteForwardingStatus": {
        "shape": "LocalWriteForwardingStatus",
        "flattened": false
      },
      "AwsBackupRecoveryPointArn": {"shape": "String", "flattened": false},
      "LimitlessDatabase": {"shape": "LimitlessDatabase", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "CertificateDetails": {"shape": "CertificateDetails", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterAutomatedBackup": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "DBClusterAutomatedBackupsArn": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "RestoreWindow": {"shape": "RestoreWindow", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "DbClusterResourceId": {"shape": "String", "flattened": false},
      "Region": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "StorageEncrypted": {"shape": "Boolean", "flattened": false},
      "AllocatedStorage": {"shape": "Integer", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "DBClusterArn": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "EngineMode": {"shape": "String", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "AwsBackupRecoveryPointArn": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterAutomatedBackupList": {
    "type": "list",
    "member": {
      "shape": "DBClusterAutomatedBackup",
      "locationName": "DBClusterAutomatedBackup"
    },
    "flattened": false
  },
  "DBClusterAutomatedBackupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusterAutomatedBackups": {
        "shape": "DBClusterAutomatedBackupList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBClusterBacktrack": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "BacktrackIdentifier": {"shape": "String", "flattened": false},
      "BacktrackTo": {"shape": "TStamp", "flattened": false},
      "BacktrackedFrom": {"shape": "TStamp", "flattened": false},
      "BacktrackRequestCreationTime": {"shape": "TStamp", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterBacktrackList": {
    "type": "list",
    "member": {
      "shape": "DBClusterBacktrack",
      "locationName": "DBClusterBacktrack"
    },
    "flattened": false
  },
  "DBClusterBacktrackMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBClusterBacktracks": {
        "shape": "DBClusterBacktrackList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBClusterCapacityInfo": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "PendingCapacity": {"shape": "IntegerOptional", "flattened": false},
      "CurrentCapacity": {"shape": "IntegerOptional", "flattened": false},
      "SecondsBeforeTimeout": {"shape": "IntegerOptional", "flattened": false},
      "TimeoutAction": {"shape": "String", "flattened": false}
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
  "DBClusterIdentifier": {"type": "string", "flattened": false},
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
      "EngineMode": {"shape": "String", "flattened": false},
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
      "TagList": {"shape": "TagList", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "DbClusterResourceId": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false}
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
  "DBClusterStatusInfo": {
    "type": "structure",
    "members": {
      "StatusType": {"shape": "String", "flattened": false},
      "Normal": {"shape": "Boolean", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Message": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBClusterStatusInfoList": {
    "type": "list",
    "member": {
      "shape": "DBClusterStatusInfo",
      "locationName": "DBClusterStatusInfo"
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
      "Image": {"shape": "CustomDBEngineVersionAMI", "flattened": false},
      "DBEngineMediaType": {"shape": "String", "flattened": false},
      "SupportedCharacterSets": {
        "shape": "SupportedCharacterSetsList",
        "flattened": false
      },
      "SupportedNcharCharacterSets": {
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
      "SupportedEngineModes": {"shape": "EngineModeList", "flattened": false},
      "SupportedFeatureNames": {"shape": "FeatureNameList", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "SupportsParallelQuery": {"shape": "Boolean", "flattened": false},
      "SupportsGlobalDatabases": {"shape": "Boolean", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "DatabaseInstallationFilesS3BucketName": {
        "shape": "String",
        "flattened": false
      },
      "DatabaseInstallationFilesS3Prefix": {
        "shape": "String",
        "flattened": false
      },
      "DBEngineVersionArn": {"shape": "String", "flattened": false},
      "KMSKeyId": {"shape": "String", "flattened": false},
      "CreateTime": {"shape": "TStamp", "flattened": false},
      "TagList": {"shape": "TagList", "flattened": false},
      "SupportsBabelfish": {"shape": "Boolean", "flattened": false},
      "CustomDBEngineVersionManifest": {
        "shape": "CustomDBEngineVersionManifest",
        "flattened": false
      },
      "SupportsLimitlessDatabase": {"shape": "Boolean", "flattened": false},
      "SupportsCertificateRotationWithoutRestart": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportedCACertificateIdentifiers": {
        "shape": "CACertificateIdentifiersList",
        "flattened": false
      },
      "SupportsLocalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportsIntegrations": {"shape": "Boolean", "flattened": false}
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
      "AutomaticRestartTime": {"shape": "TStamp", "flattened": false},
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
      "ReplicaMode": {"shape": "ReplicaMode", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupMemberships": {
        "shape": "OptionGroupMembershipList",
        "flattened": false
      },
      "CharacterSetName": {"shape": "String", "flattened": false},
      "NcharCharacterSetName": {"shape": "String", "flattened": false},
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
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "EnabledCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "Boolean", "flattened": false},
      "AssociatedRoles": {"shape": "DBInstanceRoles", "flattened": false},
      "ListenerEndpoint": {"shape": "Endpoint", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "TagList": {"shape": "TagList", "flattened": false},
      "DBInstanceAutomatedBackupsReplications": {
        "shape": "DBInstanceAutomatedBackupsReplicationList",
        "flattened": false
      },
      "CustomerOwnedIpEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AwsBackupRecoveryPointArn": {"shape": "String", "flattened": false},
      "ActivityStreamStatus": {
        "shape": "ActivityStreamStatus",
        "flattened": false
      },
      "ActivityStreamKmsKeyId": {"shape": "String", "flattened": false},
      "ActivityStreamKinesisStreamName": {
        "shape": "String",
        "flattened": false
      },
      "ActivityStreamMode": {"shape": "ActivityStreamMode", "flattened": false},
      "ActivityStreamEngineNativeAuditFieldsIncluded": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AutomationMode": {"shape": "AutomationMode", "flattened": false},
      "ResumeFullAutomationModeTime": {"shape": "TStamp", "flattened": false},
      "CustomIamInstanceProfile": {"shape": "String", "flattened": false},
      "BackupTarget": {"shape": "String", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "ActivityStreamPolicyStatus": {
        "shape": "ActivityStreamPolicyStatus",
        "flattened": false
      },
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "MasterUserSecret": {"shape": "MasterUserSecret", "flattened": false},
      "CertificateDetails": {"shape": "CertificateDetails", "flattened": false},
      "ReadReplicaSourceDBClusterIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "PercentProgress": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "Boolean", "flattened": false},
      "IsStorageConfigUpgradeAvailable": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceAutomatedBackup": {
    "type": "structure",
    "members": {
      "DBInstanceArn": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false},
      "Region": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "RestoreWindow": {"shape": "RestoreWindow", "flattened": false},
      "AllocatedStorage": {"shape": "Integer", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "InstanceCreateTime": {"shape": "TStamp", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "LicenseModel": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "Encrypted": {"shape": "Boolean", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Timezone": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "DBInstanceAutomatedBackupsArn": {"shape": "String", "flattened": false},
      "DBInstanceAutomatedBackupsReplications": {
        "shape": "DBInstanceAutomatedBackupsReplicationList",
        "flattened": false
      },
      "BackupTarget": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "AwsBackupRecoveryPointArn": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceAutomatedBackupList": {
    "type": "list",
    "member": {
      "shape": "DBInstanceAutomatedBackup",
      "locationName": "DBInstanceAutomatedBackup"
    },
    "flattened": false
  },
  "DBInstanceAutomatedBackupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBInstanceAutomatedBackups": {
        "shape": "DBInstanceAutomatedBackupList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DBInstanceAutomatedBackupsReplication": {
    "type": "structure",
    "members": {
      "DBInstanceAutomatedBackupsArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceAutomatedBackupsReplicationList": {
    "type": "list",
    "member": {
      "shape": "DBInstanceAutomatedBackupsReplication",
      "locationName": "DBInstanceAutomatedBackupsReplication"
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
  "DBInstanceRole": {
    "type": "structure",
    "members": {
      "RoleArn": {"shape": "String", "flattened": false},
      "FeatureName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBInstanceRoles": {
    "type": "list",
    "member": {"shape": "DBInstanceRole", "locationName": "DBInstanceRole"},
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
  "DBProxy": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "DBProxyArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "DBProxyStatus", "flattened": false},
      "EngineFamily": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {"shape": "StringList", "flattened": false},
      "VpcSubnetIds": {"shape": "StringList", "flattened": false},
      "Auth": {"shape": "UserAuthConfigInfoList", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "RequireTLS": {"shape": "Boolean", "flattened": false},
      "IdleClientTimeout": {"shape": "Integer", "flattened": false},
      "DebugLogging": {"shape": "Boolean", "flattened": false},
      "CreatedDate": {"shape": "TStamp", "flattened": false},
      "UpdatedDate": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "DBProxyEndpoint": {
    "type": "structure",
    "members": {
      "DBProxyEndpointName": {"shape": "String", "flattened": false},
      "DBProxyEndpointArn": {"shape": "String", "flattened": false},
      "DBProxyName": {"shape": "String", "flattened": false},
      "Status": {"shape": "DBProxyEndpointStatus", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {"shape": "StringList", "flattened": false},
      "VpcSubnetIds": {"shape": "StringList", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "CreatedDate": {"shape": "TStamp", "flattened": false},
      "TargetRole": {"shape": "DBProxyEndpointTargetRole", "flattened": false},
      "IsDefault": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DBProxyEndpointList": {
    "type": "list",
    "member": {"shape": "DBProxyEndpoint"},
    "flattened": false
  },
  "DBProxyEndpointName": {"type": "string", "flattened": false},
  "DBProxyEndpointStatus": {"type": "string", "flattened": false},
  "DBProxyEndpointTargetRole": {"type": "string", "flattened": false},
  "DBProxyList": {
    "type": "list",
    "member": {"shape": "DBProxy"},
    "flattened": false
  },
  "DBProxyName": {"type": "string", "flattened": false},
  "DBProxyStatus": {"type": "string", "flattened": false},
  "DBProxyTarget": {
    "type": "structure",
    "members": {
      "TargetArn": {"shape": "String", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "TrackedClusterId": {"shape": "String", "flattened": false},
      "RdsResourceId": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "Type": {"shape": "TargetType", "flattened": false},
      "Role": {"shape": "TargetRole", "flattened": false},
      "TargetHealth": {"shape": "TargetHealth", "flattened": false}
    },
    "flattened": false
  },
  "DBProxyTargetGroup": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "TargetGroupName": {"shape": "String", "flattened": false},
      "TargetGroupArn": {"shape": "String", "flattened": false},
      "IsDefault": {"shape": "Boolean", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "ConnectionPoolConfig": {
        "shape": "ConnectionPoolConfigurationInfo",
        "flattened": false
      },
      "CreatedDate": {"shape": "TStamp", "flattened": false},
      "UpdatedDate": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "DBRecommendation": {
    "type": "structure",
    "members": {
      "RecommendationId": {"shape": "String", "flattened": false},
      "TypeId": {"shape": "String", "flattened": false},
      "Severity": {"shape": "String", "flattened": false},
      "ResourceArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "CreatedTime": {"shape": "TStamp", "flattened": false},
      "UpdatedTime": {"shape": "TStamp", "flattened": false},
      "Detection": {"shape": "String", "flattened": false},
      "Recommendation": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Reason": {"shape": "String", "flattened": false},
      "RecommendedActions": {
        "shape": "RecommendedActionList",
        "flattened": false
      },
      "Category": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "TypeDetection": {"shape": "String", "flattened": false},
      "TypeRecommendation": {"shape": "String", "flattened": false},
      "Impact": {"shape": "String", "flattened": false},
      "AdditionalInfo": {"shape": "String", "flattened": false},
      "Links": {"shape": "DocLinkList", "flattened": false},
      "IssueDetails": {"shape": "IssueDetails", "flattened": false}
    },
    "flattened": false
  },
  "DBRecommendationList": {
    "type": "list",
    "member": {"shape": "DBRecommendation"},
    "flattened": false
  },
  "DBRecommendationMessage": {
    "type": "structure",
    "members": {
      "DBRecommendation": {"shape": "DBRecommendation", "flattened": false}
    },
    "flattened": false
  },
  "DBRecommendationsMessage": {
    "type": "structure",
    "members": {
      "DBRecommendations": {
        "shape": "DBRecommendationList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
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
      "IPRanges": {"shape": "IPRangeList", "flattened": false},
      "DBSecurityGroupArn": {"shape": "String", "flattened": false}
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
  "DBShardGroup": {
    "type": "structure",
    "members": {
      "DBShardGroupResourceId": {"shape": "String", "flattened": false},
      "DBShardGroupIdentifier": {
        "shape": "DBShardGroupIdentifier",
        "flattened": false
      },
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "MaxACU": {"shape": "DoubleOptional", "flattened": false},
      "ComputeRedundancy": {"shape": "IntegerOptional", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DBShardGroupIdentifier": {"type": "string", "flattened": false},
  "DBShardGroupsList": {
    "type": "list",
    "member": {"shape": "DBShardGroup", "locationName": "DBShardGroup"},
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
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false},
      "PercentProgress": {"shape": "Integer", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false},
      "SourceDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "Encrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "DBSnapshotArn": {"shape": "String", "flattened": false},
      "Timezone": {"shape": "String", "flattened": false},
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "Boolean",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "DbiResourceId": {"shape": "String", "flattened": false},
      "TagList": {"shape": "TagList", "flattened": false},
      "OriginalSnapshotCreateTime": {"shape": "TStamp", "flattened": false},
      "SnapshotDatabaseTime": {"shape": "TStamp", "flattened": false},
      "SnapshotTarget": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "DBSystemId": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "Boolean", "flattened": false},
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DBSnapshotAttribute": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "String", "flattened": false},
      "AttributeValues": {"shape": "AttributeValueList", "flattened": false}
    },
    "flattened": false
  },
  "DBSnapshotAttributeList": {
    "type": "list",
    "member": {
      "shape": "DBSnapshotAttribute",
      "locationName": "DBSnapshotAttribute"
    },
    "flattened": false
  },
  "DBSnapshotAttributesResult": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotAttributes": {
        "shape": "DBSnapshotAttributeList",
        "flattened": false
      }
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
  "DBSnapshotTenantDatabase": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false},
      "EngineName": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "TenantDatabaseCreateTime": {"shape": "TStamp", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "TenantDatabaseResourceId": {"shape": "String", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "DBSnapshotTenantDatabaseARN": {"shape": "String", "flattened": false},
      "NcharCharacterSetName": {"shape": "String", "flattened": false},
      "TagList": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "DBSnapshotTenantDatabasesList": {
    "type": "list",
    "member": {
      "shape": "DBSnapshotTenantDatabase",
      "locationName": "DBSnapshotTenantDatabase"
    },
    "flattened": false
  },
  "DBSnapshotTenantDatabasesMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "DBSnapshotTenantDatabases": {
        "shape": "DBSnapshotTenantDatabasesList",
        "flattened": false
      }
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
      "DBSubnetGroupArn": {"shape": "String", "flattened": false},
      "SupportedNetworkTypes": {"shape": "StringList", "flattened": false}
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
  "DataFilter": {"type": "string", "flattened": false},
  "DatabaseArn": {"type": "string", "flattened": false},
  "DeleteBlueGreenDeploymentRequest": {
    "type": "structure",
    "members": {
      "BlueGreenDeploymentIdentifier": {
        "shape": "BlueGreenDeploymentIdentifier",
        "flattened": false
      },
      "DeleteTarget": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DeleteBlueGreenDeploymentResponse": {
    "type": "structure",
    "members": {
      "BlueGreenDeployment": {
        "shape": "BlueGreenDeployment",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteCustomDBEngineVersionMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "CustomEngineName", "flattened": false},
      "EngineVersion": {"shape": "CustomEngineVersion", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterAutomatedBackupMessage": {
    "type": "structure",
    "members": {
      "DbClusterResourceId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterAutomatedBackupResult": {
    "type": "structure",
    "members": {
      "DBClusterAutomatedBackup": {
        "shape": "DBClusterAutomatedBackup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteDBClusterEndpointMessage": {
    "type": "structure",
    "members": {
      "DBClusterEndpointIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "SkipFinalSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DeleteAutomatedBackups": {"shape": "BooleanOptional", "flattened": false}
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
  "DeleteDBInstanceAutomatedBackupMessage": {
    "type": "structure",
    "members": {
      "DbiResourceId": {"shape": "String", "flattened": false},
      "DBInstanceAutomatedBackupsArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBInstanceAutomatedBackupResult": {
    "type": "structure",
    "members": {
      "DBInstanceAutomatedBackup": {
        "shape": "DBInstanceAutomatedBackup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "SkipFinalSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalDBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "DeleteAutomatedBackups": {"shape": "BooleanOptional", "flattened": false}
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
  "DeleteDBProxyEndpointRequest": {
    "type": "structure",
    "members": {
      "DBProxyEndpointName": {
        "shape": "DBProxyEndpointName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteDBProxyEndpointResponse": {
    "type": "structure",
    "members": {
      "DBProxyEndpoint": {"shape": "DBProxyEndpoint", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBProxyRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteDBProxyResponse": {
    "type": "structure",
    "members": {
      "DBProxy": {"shape": "DBProxy", "flattened": false}
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
  "DeleteDBShardGroupMessage": {
    "type": "structure",
    "members": {
      "DBShardGroupIdentifier": {
        "shape": "DBShardGroupIdentifier",
        "flattened": false
      }
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
  "DeleteGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false}
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
  "DeleteIntegrationMessage": {
    "type": "structure",
    "members": {
      "IntegrationIdentifier": {
        "shape": "IntegrationIdentifier",
        "flattened": false
      }
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
  "DeleteTenantDatabaseMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
      "SkipFinalSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalDBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTenantDatabaseResult": {
    "type": "structure",
    "members": {
      "TenantDatabase": {"shape": "TenantDatabase", "flattened": false}
    },
    "flattened": false
  },
  "DeregisterDBProxyTargetsRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "TargetGroupName": {"shape": "String", "flattened": false},
      "DBInstanceIdentifiers": {"shape": "StringList", "flattened": false},
      "DBClusterIdentifiers": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "DeregisterDBProxyTargetsResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DescribeAccountAttributesMessage": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DescribeBlueGreenDeploymentsRequest": {
    "type": "structure",
    "members": {
      "BlueGreenDeploymentIdentifier": {
        "shape": "BlueGreenDeploymentIdentifier",
        "flattened": false
      },
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeBlueGreenDeploymentsResponse": {
    "type": "structure",
    "members": {
      "BlueGreenDeployments": {
        "shape": "BlueGreenDeploymentList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
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
  "DescribeDBClusterAutomatedBackupsMessage": {
    "type": "structure",
    "members": {
      "DbClusterResourceId": {"shape": "String", "flattened": false},
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClusterBacktracksMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "BacktrackIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
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
      "IncludePublic": {"shape": "Boolean", "flattened": false},
      "DbClusterResourceId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBClustersMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "IncludeShared": {"shape": "Boolean", "flattened": false}
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
      "ListSupportedTimezones": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "IncludeAll": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBInstanceAutomatedBackupsMessage": {
    "type": "structure",
    "members": {
      "DbiResourceId": {"shape": "String", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "DBInstanceAutomatedBackupsArn": {"shape": "String", "flattened": false}
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
  "DescribeDBLogFilesDetails": {
    "type": "structure",
    "members": {
      "LogFileName": {"shape": "String", "flattened": false},
      "LastWritten": {"shape": "Long", "flattened": false},
      "Size": {"shape": "Long", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBLogFilesList": {
    "type": "list",
    "member": {
      "shape": "DescribeDBLogFilesDetails",
      "locationName": "DescribeDBLogFilesDetails"
    },
    "flattened": false
  },
  "DescribeDBLogFilesMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "FilenameContains": {"shape": "String", "flattened": false},
      "FileLastWritten": {"shape": "Long", "flattened": false},
      "FileSize": {"shape": "Long", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBLogFilesResponse": {
    "type": "structure",
    "members": {
      "DescribeDBLogFiles": {
        "shape": "DescribeDBLogFilesList",
        "flattened": false
      },
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
  "DescribeDBProxiesRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxiesResponse": {
    "type": "structure",
    "members": {
      "DBProxies": {"shape": "DBProxyList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyEndpointsRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "DBProxyName", "flattened": false},
      "DBProxyEndpointName": {
        "shape": "DBProxyEndpointName",
        "flattened": false
      },
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyEndpointsResponse": {
    "type": "structure",
    "members": {
      "DBProxyEndpoints": {"shape": "DBProxyEndpointList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyTargetGroupsRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "TargetGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyTargetGroupsResponse": {
    "type": "structure",
    "members": {
      "TargetGroups": {"shape": "TargetGroupList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyTargetsRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "TargetGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBProxyTargetsResponse": {
    "type": "structure",
    "members": {
      "Targets": {"shape": "TargetList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBRecommendationsMessage": {
    "type": "structure",
    "members": {
      "LastUpdatedAfter": {"shape": "TStamp", "flattened": false},
      "LastUpdatedBefore": {"shape": "TStamp", "flattened": false},
      "Locale": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSecurityGroupsMessage": {
    "type": "structure",
    "members": {
      "DBSecurityGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBShardGroupsMessage": {
    "type": "structure",
    "members": {
      "DBShardGroupIdentifier": {
        "shape": "DBShardGroupIdentifier",
        "flattened": false
      },
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBShardGroupsResponse": {
    "type": "structure",
    "members": {
      "DBShardGroups": {"shape": "DBShardGroupsList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSnapshotAttributesMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSnapshotAttributesResult": {
    "type": "structure",
    "members": {
      "DBSnapshotAttributesResult": {
        "shape": "DBSnapshotAttributesResult",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeDBSnapshotTenantDatabasesMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDBSnapshotsMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "IncludeShared": {"shape": "Boolean", "flattened": false},
      "IncludePublic": {"shape": "Boolean", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false}
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
  "DescribeExportTasksMessage": {
    "type": "structure",
    "members": {
      "ExportTaskIdentifier": {"shape": "String", "flattened": false},
      "SourceArn": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "SourceType": {"shape": "ExportSourceType", "flattened": false}
    },
    "flattened": false
  },
  "DescribeGlobalClustersMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeIntegrationsMessage": {
    "type": "structure",
    "members": {
      "IntegrationIdentifier": {
        "shape": "IntegrationIdentifier",
        "flattened": false
      },
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeIntegrationsResponse": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "Marker", "flattened": false},
      "Integrations": {"shape": "IntegrationList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOptionGroupOptionsMessage": {
    "type": "structure",
    "members": {
      "EngineName": {"shape": "String", "flattened": false},
      "MajorEngineVersion": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOptionGroupsMessage": {
    "type": "structure",
    "members": {
      "OptionGroupName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
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
      "AvailabilityZoneGroup": {"shape": "String", "flattened": false},
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
      "LeaseId": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false},
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
      "Filters": {"shape": "FilterList", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSourceRegionsMessage": {
    "type": "structure",
    "members": {
      "RegionName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTenantDatabasesMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
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
  "Description": {"type": "string", "flattened": false},
  "DisableHttpEndpointRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DisableHttpEndpointResponse": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "HttpEndpointEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DocLink": {
    "type": "structure",
    "members": {
      "Text": {"shape": "String", "flattened": false},
      "Url": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DocLinkList": {
    "type": "list",
    "member": {"shape": "DocLink"},
    "flattened": false
  },
  "DomainMembership": {
    "type": "structure",
    "members": {
      "Domain": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "FQDN": {"shape": "String", "flattened": false},
      "IAMRoleName": {"shape": "String", "flattened": false},
      "OU": {"shape": "String", "flattened": false},
      "AuthSecretArn": {"shape": "String", "flattened": false},
      "DnsIps": {"shape": "StringList", "flattened": false}
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
  "DownloadDBLogFilePortionDetails": {
    "type": "structure",
    "members": {
      "LogFileData": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "AdditionalDataPending": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "DownloadDBLogFilePortionMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "LogFileName": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "NumberOfLines": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
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
  "EnableHttpEndpointRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EnableHttpEndpointResponse": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "HttpEndpointEnabled": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "EncryptionContextMap": {
    "type": "map",
    "key": {"shape": "String"},
    "value": {"shape": "String"},
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
  "EngineFamily": {"type": "string", "flattened": false},
  "EngineModeList": {
    "type": "list",
    "member": {"shape": "String"},
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
  "ExportSourceType": {"type": "string", "flattened": false},
  "ExportTask": {
    "type": "structure",
    "members": {
      "ExportTaskIdentifier": {"shape": "String", "flattened": false},
      "SourceArn": {"shape": "String", "flattened": false},
      "ExportOnly": {"shape": "StringList", "flattened": false},
      "SnapshotTime": {"shape": "TStamp", "flattened": false},
      "TaskStartTime": {"shape": "TStamp", "flattened": false},
      "TaskEndTime": {"shape": "TStamp", "flattened": false},
      "S3Bucket": {"shape": "String", "flattened": false},
      "S3Prefix": {"shape": "String", "flattened": false},
      "IamRoleArn": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "PercentProgress": {"shape": "Integer", "flattened": false},
      "TotalExtractedDataInGB": {"shape": "Integer", "flattened": false},
      "FailureCause": {"shape": "String", "flattened": false},
      "WarningMessage": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "ExportSourceType", "flattened": false}
    },
    "flattened": false
  },
  "ExportTasksList": {
    "type": "list",
    "member": {"shape": "ExportTask", "locationName": "ExportTask"},
    "flattened": false
  },
  "ExportTasksMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ExportTasks": {"shape": "ExportTasksList", "flattened": false}
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
      "TargetDbClusterIdentifier": {
        "shape": "DBClusterIdentifier",
        "flattened": false
      },
      "AllowDataLoss": {"shape": "BooleanOptional", "flattened": false},
      "Switchover": {"shape": "BooleanOptional", "flattened": false}
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
  "FailoverState": {
    "type": "structure",
    "members": {
      "Status": {"shape": "FailoverStatus", "flattened": false},
      "FromDbClusterArn": {"shape": "String", "flattened": false},
      "ToDbClusterArn": {"shape": "String", "flattened": false},
      "IsDataLossAllowed": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "FailoverStatus": {"type": "string", "flattened": false},
  "FeatureNameList": {
    "type": "list",
    "member": {"shape": "String"},
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
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
      "GlobalClusterResourceId": {"shape": "String", "flattened": false},
      "GlobalClusterArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false},
      "DatabaseName": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "GlobalClusterMembers": {
        "shape": "GlobalClusterMemberList",
        "flattened": false
      },
      "FailoverState": {"shape": "FailoverState", "flattened": false}
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
      "IsWriter": {"shape": "Boolean", "flattened": false},
      "GlobalWriteForwardingStatus": {
        "shape": "WriteForwardingStatus",
        "flattened": false
      },
      "SynchronizationStatus": {
        "shape": "GlobalClusterMemberSynchronizationStatus",
        "flattened": false
      }
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
  "GlobalClusterMemberSynchronizationStatus": {
    "type": "string",
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
  "IAMAuthMode": {"type": "string", "flattened": false},
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
  "Integration": {
    "type": "structure",
    "members": {
      "SourceArn": {"shape": "SourceArn", "flattened": false},
      "TargetArn": {"shape": "Arn", "flattened": false},
      "IntegrationName": {"shape": "IntegrationName", "flattened": false},
      "IntegrationArn": {"shape": "IntegrationArn", "flattened": false},
      "KMSKeyId": {"shape": "String", "flattened": false},
      "AdditionalEncryptionContext": {
        "shape": "EncryptionContextMap",
        "flattened": false
      },
      "Status": {"shape": "IntegrationStatus", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "CreateTime": {"shape": "TStamp", "flattened": false},
      "Errors": {"shape": "IntegrationErrorList", "flattened": false},
      "DataFilter": {"shape": "DataFilter", "flattened": false},
      "Description": {"shape": "IntegrationDescription", "flattened": false}
    },
    "flattened": false
  },
  "IntegrationArn": {"type": "string", "flattened": false},
  "IntegrationDescription": {"type": "string", "flattened": false},
  "IntegrationError": {
    "type": "structure",
    "members": {
      "ErrorCode": {"shape": "String", "flattened": false},
      "ErrorMessage": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "IntegrationErrorList": {
    "type": "list",
    "member": {"shape": "IntegrationError", "locationName": "IntegrationError"},
    "flattened": false
  },
  "IntegrationIdentifier": {"type": "string", "flattened": false},
  "IntegrationList": {
    "type": "list",
    "member": {"shape": "Integration", "locationName": "Integration"},
    "flattened": false
  },
  "IntegrationName": {"type": "string", "flattened": false},
  "IntegrationStatus": {"type": "string", "flattened": false},
  "IssueDetails": {
    "type": "structure",
    "members": {
      "PerformanceIssueDetails": {
        "shape": "PerformanceIssueDetails",
        "flattened": false
      }
    },
    "flattened": false
  },
  "KeyList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "KmsKeyIdOrArn": {"type": "string", "flattened": false},
  "LimitlessDatabase": {
    "type": "structure",
    "members": {
      "Status": {"shape": "LimitlessDatabaseStatus", "flattened": false},
      "MinRequiredACU": {"shape": "DoubleOptional", "flattened": false}
    },
    "flattened": false
  },
  "LimitlessDatabaseStatus": {"type": "string", "flattened": false},
  "ListTagsForResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "Filters": {"shape": "FilterList", "flattened": false}
    },
    "flattened": false
  },
  "LocalWriteForwardingStatus": {"type": "string", "flattened": false},
  "LogTypeList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "Long": {"type": "long", "flattened": false},
  "LongOptional": {"type": "long", "flattened": false},
  "Marker": {"type": "string", "flattened": false},
  "MasterUserSecret": {
    "type": "structure",
    "members": {
      "SecretArn": {"shape": "String", "flattened": false},
      "SecretStatus": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "MaxRecords": {"type": "integer", "flattened": false},
  "Metric": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "References": {"shape": "MetricReferenceList", "flattened": false},
      "StatisticsDetails": {"shape": "String", "flattened": false},
      "MetricQuery": {"shape": "MetricQuery", "flattened": false}
    },
    "flattened": false
  },
  "MetricList": {
    "type": "list",
    "member": {"shape": "Metric"},
    "flattened": false
  },
  "MetricQuery": {
    "type": "structure",
    "members": {
      "PerformanceInsightsMetricQuery": {
        "shape": "PerformanceInsightsMetricQuery",
        "flattened": false
      }
    },
    "flattened": false
  },
  "MetricReference": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "ReferenceDetails": {"shape": "ReferenceDetails", "flattened": false}
    },
    "flattened": false
  },
  "MetricReferenceList": {
    "type": "list",
    "member": {"shape": "MetricReference"},
    "flattened": false
  },
  "MinimumEngineVersionPerAllowedValue": {
    "type": "structure",
    "members": {
      "AllowedValue": {"shape": "String", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "MinimumEngineVersionPerAllowedValueList": {
    "type": "list",
    "member": {
      "shape": "MinimumEngineVersionPerAllowedValue",
      "locationName": "MinimumEngineVersionPerAllowedValue"
    },
    "flattened": false
  },
  "ModifyActivityStreamRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "AuditPolicyState": {"shape": "AuditPolicyState", "flattened": false}
    },
    "flattened": false
  },
  "ModifyActivityStreamResponse": {
    "type": "structure",
    "members": {
      "KmsKeyId": {"shape": "String", "flattened": false},
      "KinesisStreamName": {"shape": "String", "flattened": false},
      "Status": {"shape": "ActivityStreamStatus", "flattened": false},
      "Mode": {"shape": "ActivityStreamMode", "flattened": false},
      "EngineNativeAuditFieldsIncluded": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PolicyStatus": {
        "shape": "ActivityStreamPolicyStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyCertificatesMessage": {
    "type": "structure",
    "members": {
      "CertificateIdentifier": {"shape": "String", "flattened": false},
      "RemoveCustomerOverride": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCertificatesResult": {
    "type": "structure",
    "members": {
      "Certificate": {"shape": "Certificate", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCurrentDBClusterCapacityMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false},
      "Capacity": {"shape": "IntegerOptional", "flattened": false},
      "SecondsBeforeTimeout": {"shape": "IntegerOptional", "flattened": false},
      "TimeoutAction": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCustomDBEngineVersionMessage": {
    "type": "structure",
    "members": {
      "Engine": {"shape": "CustomEngineName", "flattened": false},
      "EngineVersion": {"shape": "CustomEngineVersion", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "Status": {"shape": "CustomEngineVersionStatus", "flattened": false}
    },
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
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "CloudwatchLogsExportConfiguration": {
        "shape": "CloudwatchLogsExportConfiguration",
        "flattened": false
      },
      "EngineVersion": {"shape": "String", "flattened": false},
      "AllowMajorVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "DBInstanceParameterGroupName": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "ScalingConfiguration": {
        "shape": "ScalingConfiguration",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "EnableHttpEndpoint": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "EnableGlobalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DBClusterInstanceClass": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "AutoMinorVersionUpgrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "RotateMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "EngineMode": {"shape": "String", "flattened": false},
      "AllowEngineModeChange": {"shape": "Boolean", "flattened": false},
      "EnableLocalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AwsBackupRecoveryPointArn": {
        "shape": "AwsBackupRecoveryPointArn",
        "flattened": false
      },
      "EnableLimitlessDatabase": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "CACertificateIdentifier": {"shape": "String", "flattened": false}
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
      "TdeCredentialPassword": {"shape": "String", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainFqdn": {"shape": "String", "flattened": false},
      "DomainOu": {"shape": "String", "flattened": false},
      "DomainAuthSecretArn": {"shape": "String", "flattened": false},
      "DomainDnsIps": {"shape": "StringList", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "DBPortNumber": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "DisableDomain": {"shape": "BooleanOptional", "flattened": false},
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
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "CloudwatchLogsExportConfiguration": {
        "shape": "CloudwatchLogsExportConfiguration",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "UseDefaultProcessorFeatures": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "CertificateRotationRestart": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ReplicaMode": {"shape": "ReplicaMode", "flattened": false},
      "EnableCustomerOwnedIp": {"shape": "BooleanOptional", "flattened": false},
      "AwsBackupRecoveryPointArn": {
        "shape": "AwsBackupRecoveryPointArn",
        "flattened": false
      },
      "AutomationMode": {"shape": "AutomationMode", "flattened": false},
      "ResumeFullAutomationModeMinutes": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "RotateMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false}
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
  "ModifyDBProxyEndpointRequest": {
    "type": "structure",
    "members": {
      "DBProxyEndpointName": {
        "shape": "DBProxyEndpointName",
        "flattened": false
      },
      "NewDBProxyEndpointName": {
        "shape": "DBProxyEndpointName",
        "flattened": false
      },
      "VpcSecurityGroupIds": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBProxyEndpointResponse": {
    "type": "structure",
    "members": {
      "DBProxyEndpoint": {"shape": "DBProxyEndpoint", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBProxyRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "NewDBProxyName": {"shape": "String", "flattened": false},
      "Auth": {"shape": "UserAuthConfigList", "flattened": false},
      "RequireTLS": {"shape": "BooleanOptional", "flattened": false},
      "IdleClientTimeout": {"shape": "IntegerOptional", "flattened": false},
      "DebugLogging": {"shape": "BooleanOptional", "flattened": false},
      "RoleArn": {"shape": "String", "flattened": false},
      "SecurityGroups": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBProxyResponse": {
    "type": "structure",
    "members": {
      "DBProxy": {"shape": "DBProxy", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBProxyTargetGroupRequest": {
    "type": "structure",
    "members": {
      "TargetGroupName": {"shape": "String", "flattened": false},
      "DBProxyName": {"shape": "String", "flattened": false},
      "ConnectionPoolConfig": {
        "shape": "ConnectionPoolConfiguration",
        "flattened": false
      },
      "NewName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBProxyTargetGroupResponse": {
    "type": "structure",
    "members": {
      "DBProxyTargetGroup": {"shape": "DBProxyTargetGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBRecommendationMessage": {
    "type": "structure",
    "members": {
      "RecommendationId": {"shape": "String", "flattened": false},
      "Locale": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "RecommendedActionUpdates": {
        "shape": "RecommendedActionUpdateList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyDBShardGroupMessage": {
    "type": "structure",
    "members": {
      "DBShardGroupIdentifier": {
        "shape": "DBShardGroupIdentifier",
        "flattened": false
      },
      "MaxACU": {"shape": "DoubleOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBSnapshotAttributeMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "AttributeName": {"shape": "String", "flattened": false},
      "ValuesToAdd": {"shape": "AttributeValueList", "flattened": false},
      "ValuesToRemove": {"shape": "AttributeValueList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBSnapshotAttributeResult": {
    "type": "structure",
    "members": {
      "DBSnapshotAttributesResult": {
        "shape": "DBSnapshotAttributesResult",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyDBSnapshotMessage": {
    "type": "structure",
    "members": {
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false},
      "EngineVersion": {"shape": "String", "flattened": false},
      "OptionGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyDBSnapshotResult": {
    "type": "structure",
    "members": {
      "DBSnapshot": {"shape": "DBSnapshot", "flattened": false}
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
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
      "NewGlobalClusterIdentifier": {"shape": "String", "flattened": false},
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
  "ModifyIntegrationMessage": {
    "type": "structure",
    "members": {
      "IntegrationIdentifier": {
        "shape": "IntegrationIdentifier",
        "flattened": false
      },
      "IntegrationName": {"shape": "IntegrationName", "flattened": false},
      "DataFilter": {"shape": "DataFilter", "flattened": false},
      "Description": {"shape": "IntegrationDescription", "flattened": false}
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
  "ModifyTenantDatabaseMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "NewTenantDBName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTenantDatabaseResult": {
    "type": "structure",
    "members": {
      "TenantDatabase": {"shape": "TenantDatabase", "flattened": false}
    },
    "flattened": false
  },
  "Option": {
    "type": "structure",
    "members": {
      "OptionName": {"shape": "String", "flattened": false},
      "OptionDescription": {"shape": "String", "flattened": false},
      "Persistent": {"shape": "Boolean", "flattened": false},
      "Permanent": {"shape": "Boolean", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "OptionVersion": {"shape": "String", "flattened": false},
      "OptionSettings": {
        "shape": "OptionSettingConfigurationList",
        "flattened": false
      },
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
      "OptionVersion": {"shape": "String", "flattened": false},
      "DBSecurityGroupMemberships": {
        "shape": "DBSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupMemberships": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "OptionSettings": {"shape": "OptionSettingsList", "flattened": false}
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
      "VpcId": {"shape": "String", "flattened": false},
      "OptionGroupArn": {"shape": "String", "flattened": false},
      "SourceOptionGroup": {"shape": "String", "flattened": false},
      "SourceAccountId": {"shape": "String", "flattened": false},
      "CopyTimestamp": {"shape": "TStamp", "flattened": false}
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
      "OptionsDependedOn": {"shape": "OptionsDependedOn", "flattened": false},
      "OptionsConflictsWith": {
        "shape": "OptionsConflictsWith",
        "flattened": false
      },
      "Persistent": {"shape": "Boolean", "flattened": false},
      "Permanent": {"shape": "Boolean", "flattened": false},
      "RequiresAutoMinorEngineVersionUpgrade": {
        "shape": "Boolean",
        "flattened": false
      },
      "VpcOnly": {"shape": "Boolean", "flattened": false},
      "SupportsOptionVersionDowngrade": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "OptionGroupOptionSettings": {
        "shape": "OptionGroupOptionSettingsList",
        "flattened": false
      },
      "OptionGroupOptionVersions": {
        "shape": "OptionGroupOptionVersionsList",
        "flattened": false
      },
      "CopyableCrossAccount": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "OptionGroupOptionSetting": {
    "type": "structure",
    "members": {
      "SettingName": {"shape": "String", "flattened": false},
      "SettingDescription": {"shape": "String", "flattened": false},
      "DefaultValue": {"shape": "String", "flattened": false},
      "ApplyType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "IsRequired": {"shape": "Boolean", "flattened": false},
      "MinimumEngineVersionPerAllowedValue": {
        "shape": "MinimumEngineVersionPerAllowedValueList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "OptionGroupOptionSettingsList": {
    "type": "list",
    "member": {
      "shape": "OptionGroupOptionSetting",
      "locationName": "OptionGroupOptionSetting"
    },
    "flattened": false
  },
  "OptionGroupOptionVersionsList": {
    "type": "list",
    "member": {"shape": "OptionVersion", "locationName": "OptionVersion"},
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
  "OptionSetting": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false},
      "DefaultValue": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "ApplyType": {"shape": "String", "flattened": false},
      "DataType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "IsCollection": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "OptionSettingConfigurationList": {
    "type": "list",
    "member": {"shape": "OptionSetting", "locationName": "OptionSetting"},
    "flattened": false
  },
  "OptionSettingsList": {
    "type": "list",
    "member": {"shape": "OptionSetting", "locationName": "OptionSetting"},
    "flattened": false
  },
  "OptionVersion": {
    "type": "structure",
    "members": {
      "Version": {"shape": "String", "flattened": false},
      "IsDefault": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "OptionsConflictsWith": {
    "type": "list",
    "member": {"shape": "String", "locationName": "OptionConflictName"},
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
      "AvailabilityZoneGroup": {"shape": "String", "flattened": false},
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
      "AvailableProcessorFeatures": {
        "shape": "AvailableProcessorFeatureList",
        "flattened": false
      },
      "SupportedEngineModes": {"shape": "EngineModeList", "flattened": false},
      "SupportsStorageAutoscaling": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportsKerberosAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "OutpostCapable": {"shape": "Boolean", "flattened": false},
      "SupportedActivityStreamModes": {
        "shape": "ActivityStreamModeList",
        "flattened": false
      },
      "SupportsGlobalDatabases": {"shape": "Boolean", "flattened": false},
      "SupportsClusters": {"shape": "Boolean", "flattened": false},
      "SupportedNetworkTypes": {"shape": "StringList", "flattened": false},
      "SupportsStorageThroughput": {"shape": "Boolean", "flattened": false},
      "MinStorageThroughputPerDbInstance": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "MaxStorageThroughputPerDbInstance": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "MinStorageThroughputPerIops": {
        "shape": "DoubleOptional",
        "flattened": false
      },
      "MaxStorageThroughputPerIops": {
        "shape": "DoubleOptional",
        "flattened": false
      },
      "SupportsDedicatedLogVolume": {"shape": "Boolean", "flattened": false}
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
  "Outpost": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "String", "flattened": false}
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
      "ApplyMethod": {"shape": "ApplyMethod", "flattened": false},
      "SupportedEngineModes": {"shape": "EngineModeList", "flattened": false}
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
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "IAMDatabaseAuthenticationEnabled": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AutomationMode": {"shape": "AutomationMode", "flattened": false},
      "ResumeFullAutomationModeTime": {"shape": "TStamp", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "Engine": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "MultiTenant": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "PerformanceInsightsMetricDimensionGroup": {
    "type": "structure",
    "members": {
      "Dimensions": {"shape": "StringList", "flattened": false},
      "Group": {"shape": "String", "flattened": false},
      "Limit": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "PerformanceInsightsMetricQuery": {
    "type": "structure",
    "members": {
      "GroupBy": {
        "shape": "PerformanceInsightsMetricDimensionGroup",
        "flattened": false
      },
      "Metric": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PerformanceIssueDetails": {
    "type": "structure",
    "members": {
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "Metrics": {"shape": "MetricList", "flattened": false},
      "Analysis": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ProcessorFeature": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ProcessorFeatureList": {
    "type": "list",
    "member": {"shape": "ProcessorFeature", "locationName": "ProcessorFeature"},
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
      "DBInstanceCount": {"shape": "IntegerOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
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
  "RdsCustomClusterConfiguration": {
    "type": "structure",
    "members": {
      "InterconnectSubnetId": {"shape": "String", "flattened": false},
      "TransitGatewayMulticastDomainId": {
        "shape": "String",
        "flattened": false
      },
      "ReplicaMode": {"shape": "ReplicaMode", "flattened": false}
    },
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
  "RebootDBClusterMessage": {
    "type": "structure",
    "members": {
      "DBClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RebootDBClusterResult": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
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
  "RebootDBShardGroupMessage": {
    "type": "structure",
    "members": {
      "DBShardGroupIdentifier": {
        "shape": "DBShardGroupIdentifier",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RecommendedAction": {
    "type": "structure",
    "members": {
      "ActionId": {"shape": "String", "flattened": false},
      "Title": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Operation": {"shape": "String", "flattened": false},
      "Parameters": {
        "shape": "RecommendedActionParameterList",
        "flattened": false
      },
      "ApplyModes": {"shape": "StringList", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "IssueDetails": {"shape": "IssueDetails", "flattened": false},
      "ContextAttributes": {"shape": "ContextAttributeList", "flattened": false}
    },
    "flattened": false
  },
  "RecommendedActionList": {
    "type": "list",
    "member": {"shape": "RecommendedAction"},
    "flattened": false
  },
  "RecommendedActionParameter": {
    "type": "structure",
    "members": {
      "Key": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RecommendedActionParameterList": {
    "type": "list",
    "member": {"shape": "RecommendedActionParameter"},
    "flattened": false
  },
  "RecommendedActionUpdate": {
    "type": "structure",
    "members": {
      "ActionId": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RecommendedActionUpdateList": {
    "type": "list",
    "member": {"shape": "RecommendedActionUpdate"},
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
  "ReferenceDetails": {
    "type": "structure",
    "members": {
      "ScalarReferenceDetails": {
        "shape": "ScalarReferenceDetails",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RegisterDBProxyTargetsRequest": {
    "type": "structure",
    "members": {
      "DBProxyName": {"shape": "String", "flattened": false},
      "TargetGroupName": {"shape": "String", "flattened": false},
      "DBInstanceIdentifiers": {"shape": "StringList", "flattened": false},
      "DBClusterIdentifiers": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "RegisterDBProxyTargetsResponse": {
    "type": "structure",
    "members": {
      "DBProxyTargets": {"shape": "TargetList", "flattened": false}
    },
    "flattened": false
  },
  "RemoveFromGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {"shape": "String", "flattened": false},
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
  "RemoveRoleFromDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
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
  "ReplicaMode": {"type": "string", "flattened": false},
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
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false},
      "ReservedDBInstanceArn": {"shape": "String", "flattened": false},
      "LeaseId": {"shape": "String", "flattened": false}
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
  "RestoreDBClusterFromS3Message": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
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
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SourceEngine": {"shape": "String", "flattened": false},
      "SourceEngineVersion": {"shape": "String", "flattened": false},
      "S3BucketName": {"shape": "String", "flattened": false},
      "S3Prefix": {"shape": "String", "flattened": false},
      "S3IngestionRoleArn": {"shape": "String", "flattened": false},
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBClusterFromS3Result": {
    "type": "structure",
    "members": {
      "DBCluster": {"shape": "DBCluster", "flattened": false}
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
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "EngineMode": {"shape": "String", "flattened": false},
      "ScalingConfiguration": {
        "shape": "ScalingConfiguration",
        "flattened": false
      },
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "DBClusterInstanceClass": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "RdsCustomClusterConfiguration": {
        "shape": "RdsCustomClusterConfiguration",
        "flattened": false
      },
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
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
      "BacktrackWindow": {"shape": "LongOptional", "flattened": false},
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "DBClusterParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "ScalingConfiguration": {
        "shape": "ScalingConfiguration",
        "flattened": false
      },
      "EngineMode": {"shape": "String", "flattened": false},
      "DBClusterInstanceClass": {"shape": "String", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Iops": {"shape": "IntegerOptional", "flattened": false},
      "ServerlessV2ScalingConfiguration": {
        "shape": "ServerlessV2ScalingConfiguration",
        "flattened": false
      },
      "NetworkType": {"shape": "String", "flattened": false},
      "SourceDbClusterResourceId": {"shape": "String", "flattened": false},
      "RdsCustomClusterConfiguration": {
        "shape": "RdsCustomClusterConfiguration",
        "flattened": false
      },
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
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
      "OptionGroupName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "TdeCredentialPassword": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Domain": {"shape": "String", "flattened": false},
      "DomainFqdn": {"shape": "String", "flattened": false},
      "DomainOu": {"shape": "String", "flattened": false},
      "DomainAuthSecretArn": {"shape": "String", "flattened": false},
      "DomainDnsIps": {"shape": "StringList", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "UseDefaultProcessorFeatures": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "EnableCustomerOwnedIp": {"shape": "BooleanOptional", "flattened": false},
      "CustomIamInstanceProfile": {"shape": "String", "flattened": false},
      "BackupTarget": {"shape": "String", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "DBClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
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
  "RestoreDBInstanceFromS3Message": {
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
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "StorageEncrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "MonitoringInterval": {"shape": "IntegerOptional", "flattened": false},
      "MonitoringRoleArn": {"shape": "String", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SourceEngine": {"shape": "String", "flattened": false},
      "SourceEngineVersion": {"shape": "String", "flattened": false},
      "S3BucketName": {"shape": "String", "flattened": false},
      "S3Prefix": {"shape": "String", "flattened": false},
      "S3IngestionRoleArn": {"shape": "String", "flattened": false},
      "EnablePerformanceInsights": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "PerformanceInsightsKMSKeyId": {"shape": "String", "flattened": false},
      "PerformanceInsightsRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "UseDefaultProcessorFeatures": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "ManageMasterUserPassword": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "MasterUserSecretKmsKeyId": {"shape": "String", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestoreDBInstanceFromS3Result": {
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
      "OptionGroupName": {"shape": "String", "flattened": false},
      "CopyTagsToSnapshot": {"shape": "BooleanOptional", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "StorageType": {"shape": "String", "flattened": false},
      "TdeCredentialArn": {"shape": "String", "flattened": false},
      "TdeCredentialPassword": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "Domain": {"shape": "String", "flattened": false},
      "DomainIAMRoleName": {"shape": "String", "flattened": false},
      "DomainFqdn": {"shape": "String", "flattened": false},
      "DomainOu": {"shape": "String", "flattened": false},
      "DomainAuthSecretArn": {"shape": "String", "flattened": false},
      "DomainDnsIps": {"shape": "StringList", "flattened": false},
      "EnableIAMDatabaseAuthentication": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "EnableCloudwatchLogsExports": {
        "shape": "LogTypeList",
        "flattened": false
      },
      "ProcessorFeatures": {
        "shape": "ProcessorFeatureList",
        "flattened": false
      },
      "UseDefaultProcessorFeatures": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "DBParameterGroupName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "BooleanOptional", "flattened": false},
      "SourceDbiResourceId": {"shape": "String", "flattened": false},
      "MaxAllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "SourceDBInstanceAutomatedBackupsArn": {
        "shape": "String",
        "flattened": false
      },
      "EnableCustomerOwnedIp": {"shape": "BooleanOptional", "flattened": false},
      "CustomIamInstanceProfile": {"shape": "String", "flattened": false},
      "BackupTarget": {"shape": "String", "flattened": false},
      "NetworkType": {"shape": "String", "flattened": false},
      "StorageThroughput": {"shape": "IntegerOptional", "flattened": false},
      "AllocatedStorage": {"shape": "IntegerOptional", "flattened": false},
      "DedicatedLogVolume": {"shape": "BooleanOptional", "flattened": false},
      "CACertificateIdentifier": {"shape": "String", "flattened": false},
      "EngineLifecycleSupport": {"shape": "String", "flattened": false}
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
  "RestoreWindow": {
    "type": "structure",
    "members": {
      "EarliestTime": {"shape": "TStamp", "flattened": false},
      "LatestTime": {"shape": "TStamp", "flattened": false}
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
  "ScalarReferenceDetails": {
    "type": "structure",
    "members": {
      "Value": {"shape": "Double", "flattened": false}
    },
    "flattened": false
  },
  "ScalingConfiguration": {
    "type": "structure",
    "members": {
      "MinCapacity": {"shape": "IntegerOptional", "flattened": false},
      "MaxCapacity": {"shape": "IntegerOptional", "flattened": false},
      "AutoPause": {"shape": "BooleanOptional", "flattened": false},
      "SecondsUntilAutoPause": {"shape": "IntegerOptional", "flattened": false},
      "TimeoutAction": {"shape": "String", "flattened": false},
      "SecondsBeforeTimeout": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "ScalingConfigurationInfo": {
    "type": "structure",
    "members": {
      "MinCapacity": {"shape": "IntegerOptional", "flattened": false},
      "MaxCapacity": {"shape": "IntegerOptional", "flattened": false},
      "AutoPause": {"shape": "BooleanOptional", "flattened": false},
      "SecondsUntilAutoPause": {"shape": "IntegerOptional", "flattened": false},
      "TimeoutAction": {"shape": "String", "flattened": false},
      "SecondsBeforeTimeout": {"shape": "IntegerOptional", "flattened": false}
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
  "SourceArn": {"type": "string", "flattened": false},
  "SourceIdsList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "SourceId"},
    "flattened": false
  },
  "SourceRegion": {
    "type": "structure",
    "members": {
      "RegionName": {"shape": "String", "flattened": false},
      "Endpoint": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "SupportsDBInstanceAutomatedBackupsReplication": {
        "shape": "Boolean",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SourceRegionList": {
    "type": "list",
    "member": {"shape": "SourceRegion", "locationName": "SourceRegion"},
    "flattened": false
  },
  "SourceRegionMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "SourceRegions": {"shape": "SourceRegionList", "flattened": false}
    },
    "flattened": false
  },
  "SourceType": {"type": "string", "flattened": false},
  "StartActivityStreamRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "Mode": {"shape": "ActivityStreamMode", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "BooleanOptional", "flattened": false},
      "EngineNativeAuditFieldsIncluded": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "StartActivityStreamResponse": {
    "type": "structure",
    "members": {
      "KmsKeyId": {"shape": "String", "flattened": false},
      "KinesisStreamName": {"shape": "String", "flattened": false},
      "Status": {"shape": "ActivityStreamStatus", "flattened": false},
      "Mode": {"shape": "ActivityStreamMode", "flattened": false},
      "ApplyImmediately": {"shape": "Boolean", "flattened": false},
      "EngineNativeAuditFieldsIncluded": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
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
  "StartDBInstanceAutomatedBackupsReplicationMessage": {
    "type": "structure",
    "members": {
      "SourceDBInstanceArn": {"shape": "String", "flattened": false},
      "BackupRetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "PreSignedUrl": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StartDBInstanceAutomatedBackupsReplicationResult": {
    "type": "structure",
    "members": {
      "DBInstanceAutomatedBackup": {
        "shape": "DBInstanceAutomatedBackup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "StartDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StartDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "StartExportTaskMessage": {
    "type": "structure",
    "members": {
      "ExportTaskIdentifier": {"shape": "String", "flattened": false},
      "SourceArn": {"shape": "String", "flattened": false},
      "S3BucketName": {"shape": "String", "flattened": false},
      "IamRoleArn": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "S3Prefix": {"shape": "String", "flattened": false},
      "ExportOnly": {"shape": "StringList", "flattened": false}
    },
    "flattened": false
  },
  "StopActivityStreamRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "ApplyImmediately": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "StopActivityStreamResponse": {
    "type": "structure",
    "members": {
      "KmsKeyId": {"shape": "String", "flattened": false},
      "KinesisStreamName": {"shape": "String", "flattened": false},
      "Status": {"shape": "ActivityStreamStatus", "flattened": false}
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
  "StopDBInstanceAutomatedBackupsReplicationMessage": {
    "type": "structure",
    "members": {
      "SourceDBInstanceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StopDBInstanceAutomatedBackupsReplicationResult": {
    "type": "structure",
    "members": {
      "DBInstanceAutomatedBackup": {
        "shape": "DBInstanceAutomatedBackup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "StopDBInstanceMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "DBSnapshotIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "StopDBInstanceResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "String255": {"type": "string", "flattened": false},
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
      "SubnetOutpost": {"shape": "Outpost", "flattened": false},
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
  "SwitchoverBlueGreenDeploymentRequest": {
    "type": "structure",
    "members": {
      "BlueGreenDeploymentIdentifier": {
        "shape": "BlueGreenDeploymentIdentifier",
        "flattened": false
      },
      "SwitchoverTimeout": {"shape": "SwitchoverTimeout", "flattened": false}
    },
    "flattened": false
  },
  "SwitchoverBlueGreenDeploymentResponse": {
    "type": "structure",
    "members": {
      "BlueGreenDeployment": {
        "shape": "BlueGreenDeployment",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SwitchoverDetail": {
    "type": "structure",
    "members": {
      "SourceMember": {"shape": "DatabaseArn", "flattened": false},
      "TargetMember": {"shape": "DatabaseArn", "flattened": false},
      "Status": {"shape": "SwitchoverDetailStatus", "flattened": false}
    },
    "flattened": false
  },
  "SwitchoverDetailList": {
    "type": "list",
    "member": {"shape": "SwitchoverDetail"},
    "flattened": false
  },
  "SwitchoverDetailStatus": {"type": "string", "flattened": false},
  "SwitchoverGlobalClusterMessage": {
    "type": "structure",
    "members": {
      "GlobalClusterIdentifier": {
        "shape": "GlobalClusterIdentifier",
        "flattened": false
      },
      "TargetDbClusterIdentifier": {
        "shape": "DBClusterIdentifier",
        "flattened": false
      }
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
  "SwitchoverReadReplicaMessage": {
    "type": "structure",
    "members": {
      "DBInstanceIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SwitchoverReadReplicaResult": {
    "type": "structure",
    "members": {
      "DBInstance": {"shape": "DBInstance", "flattened": false}
    },
    "flattened": false
  },
  "SwitchoverTimeout": {"type": "integer", "flattened": false},
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
  "TargetDBClusterParameterGroupName": {"type": "string", "flattened": false},
  "TargetDBInstanceClass": {"type": "string", "flattened": false},
  "TargetDBParameterGroupName": {"type": "string", "flattened": false},
  "TargetEngineVersion": {"type": "string", "flattened": false},
  "TargetGroupList": {
    "type": "list",
    "member": {"shape": "DBProxyTargetGroup"},
    "flattened": false
  },
  "TargetHealth": {
    "type": "structure",
    "members": {
      "State": {"shape": "TargetState", "flattened": false},
      "Reason": {"shape": "TargetHealthReason", "flattened": false},
      "Description": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TargetHealthReason": {"type": "string", "flattened": false},
  "TargetList": {
    "type": "list",
    "member": {"shape": "DBProxyTarget"},
    "flattened": false
  },
  "TargetRole": {"type": "string", "flattened": false},
  "TargetState": {"type": "string", "flattened": false},
  "TargetType": {"type": "string", "flattened": false},
  "TenantDatabase": {
    "type": "structure",
    "members": {
      "TenantDatabaseCreateTime": {"shape": "TStamp", "flattened": false},
      "DBInstanceIdentifier": {"shape": "String", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "DbiResourceId": {"shape": "String", "flattened": false},
      "TenantDatabaseResourceId": {"shape": "String", "flattened": false},
      "TenantDatabaseARN": {"shape": "String", "flattened": false},
      "CharacterSetName": {"shape": "String", "flattened": false},
      "NcharCharacterSetName": {"shape": "String", "flattened": false},
      "DeletionProtection": {"shape": "Boolean", "flattened": false},
      "PendingModifiedValues": {
        "shape": "TenantDatabasePendingModifiedValues",
        "flattened": false
      },
      "TagList": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "TenantDatabasePendingModifiedValues": {
    "type": "structure",
    "members": {
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "TenantDBName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TenantDatabasesList": {
    "type": "list",
    "member": {"shape": "TenantDatabase", "locationName": "TenantDatabase"},
    "flattened": false
  },
  "TenantDatabasesMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "TenantDatabases": {"shape": "TenantDatabasesList", "flattened": false}
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
      "SupportedEngineModes": {"shape": "EngineModeList", "flattened": false},
      "SupportsParallelQuery": {"shape": "BooleanOptional", "flattened": false},
      "SupportsGlobalDatabases": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportsBabelfish": {"shape": "BooleanOptional", "flattened": false},
      "SupportsLimitlessDatabase": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportsLocalWriteForwarding": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "SupportsIntegrations": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "UserAuthConfig": {
    "type": "structure",
    "members": {
      "Description": {"shape": "String", "flattened": false},
      "UserName": {"shape": "String", "flattened": false},
      "AuthScheme": {"shape": "AuthScheme", "flattened": false},
      "SecretArn": {"shape": "String", "flattened": false},
      "IAMAuth": {"shape": "IAMAuthMode", "flattened": false},
      "ClientPasswordAuthType": {
        "shape": "ClientPasswordAuthType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UserAuthConfigInfo": {
    "type": "structure",
    "members": {
      "Description": {"shape": "String", "flattened": false},
      "UserName": {"shape": "String", "flattened": false},
      "AuthScheme": {"shape": "AuthScheme", "flattened": false},
      "SecretArn": {"shape": "String", "flattened": false},
      "IAMAuth": {"shape": "IAMAuthMode", "flattened": false},
      "ClientPasswordAuthType": {
        "shape": "ClientPasswordAuthType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UserAuthConfigInfoList": {
    "type": "list",
    "member": {"shape": "UserAuthConfigInfo"},
    "flattened": false
  },
  "UserAuthConfigList": {
    "type": "list",
    "member": {"shape": "UserAuthConfig"},
    "flattened": false
  },
  "ValidDBInstanceModificationsMessage": {
    "type": "structure",
    "members": {
      "Storage": {"shape": "ValidStorageOptionsList", "flattened": false},
      "ValidProcessorFeatures": {
        "shape": "AvailableProcessorFeatureList",
        "flattened": false
      },
      "SupportsDedicatedLogVolume": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ValidStorageOptions": {
    "type": "structure",
    "members": {
      "StorageType": {"shape": "String", "flattened": false},
      "StorageSize": {"shape": "RangeList", "flattened": false},
      "ProvisionedIops": {"shape": "RangeList", "flattened": false},
      "IopsToStorageRatio": {"shape": "DoubleRangeList", "flattened": false},
      "SupportsStorageAutoscaling": {"shape": "Boolean", "flattened": false},
      "ProvisionedStorageThroughput": {
        "shape": "RangeList",
        "flattened": false
      },
      "StorageThroughputToIopsRatio": {
        "shape": "DoubleRangeList",
        "flattened": false
      }
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
  },
  "WriteForwardingStatus": {"type": "string", "flattened": false}
};
