// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AcceptReservedNodeExchangeInputMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "TargetReservedNodeOfferingId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AcceptReservedNodeExchangeOutputMessage": {
    "type": "structure",
    "members": {
      "ExchangedReservedNode": {"shape": "ReservedNode", "flattened": false}
    },
    "flattened": false
  },
  "AccountAttribute": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "String", "flattened": false},
      "AttributeValues": {"shape": "AttributeValueList", "flattened": false}
    },
    "flattened": false
  },
  "AccountAttributeList": {
    "type": "structure",
    "members": {
      "AccountAttributes": {"shape": "AttributeList", "flattened": false}
    },
    "flattened": false
  },
  "AccountWithRestoreAccess": {
    "type": "structure",
    "members": {
      "AccountId": {"shape": "String", "flattened": false},
      "AccountAlias": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AccountsWithRestoreAccessList": {
    "type": "list",
    "member": {
      "shape": "AccountWithRestoreAccess",
      "locationName": "AccountWithRestoreAccess"
    },
    "flattened": false
  },
  "ActionType": {"type": "string", "flattened": false},
  "AquaConfiguration": {
    "type": "structure",
    "members": {
      "AquaStatus": {"shape": "AquaStatus", "flattened": false},
      "AquaConfigurationStatus": {
        "shape": "AquaConfigurationStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AquaConfigurationStatus": {"type": "string", "flattened": false},
  "AquaStatus": {"type": "string", "flattened": false},
  "AssociateDataShareConsumerMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "AssociateEntireAccount": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ConsumerArn": {"shape": "String", "flattened": false},
      "ConsumerRegion": {"shape": "String", "flattened": false},
      "AllowWrites": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "AssociatedClusterList": {
    "type": "list",
    "member": {
      "shape": "ClusterAssociatedToSchedule",
      "locationName": "ClusterAssociatedToSchedule"
    },
    "flattened": false
  },
  "Association": {
    "type": "structure",
    "members": {
      "CustomDomainCertificateArn": {"shape": "String", "flattened": false},
      "CustomDomainCertificateExpiryDate": {
        "shape": "TStamp",
        "flattened": false
      },
      "CertificateAssociations": {
        "shape": "CertificateAssociationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AssociationList": {
    "type": "list",
    "member": {"shape": "Association", "locationName": "Association"},
    "flattened": false
  },
  "AttributeList": {
    "type": "list",
    "member": {"shape": "AccountAttribute", "locationName": "AccountAttribute"},
    "flattened": false
  },
  "AttributeNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "AttributeName"},
    "flattened": false
  },
  "AttributeValueList": {
    "type": "list",
    "member": {
      "shape": "AttributeValueTarget",
      "locationName": "AttributeValueTarget"
    },
    "flattened": false
  },
  "AttributeValueTarget": {
    "type": "structure",
    "members": {
      "AttributeValue": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthenticationProfile": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      },
      "AuthenticationProfileContent": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthenticationProfileList": {
    "type": "list",
    "member": {"shape": "AuthenticationProfile"},
    "flattened": false
  },
  "AuthenticationProfileNameString": {"type": "string", "flattened": false},
  "AuthorizationStatus": {"type": "string", "flattened": false},
  "AuthorizeClusterSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeClusterSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroup": {
        "shape": "ClusterSecurityGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AuthorizeDataShareMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "ConsumerIdentifier": {"shape": "String", "flattened": false},
      "AllowWrites": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "Account": {"shape": "String", "flattened": false},
      "VpcIds": {"shape": "VpcIdentifierList", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeSnapshotAccessMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false},
      "SnapshotClusterIdentifier": {"shape": "String", "flattened": false},
      "AccountWithRestoreAccess": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizeSnapshotAccessResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "AuthorizedAudienceList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "AuthorizedTokenIssuer": {
    "type": "structure",
    "members": {
      "TrustedTokenIssuerArn": {"shape": "String", "flattened": false},
      "AuthorizedAudiencesList": {
        "shape": "AuthorizedAudienceList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AuthorizedTokenIssuerList": {
    "type": "list",
    "member": {"shape": "AuthorizedTokenIssuer"},
    "flattened": false
  },
  "AvailabilityZone": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "SupportedPlatforms": {
        "shape": "SupportedPlatformsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AvailabilityZoneList": {
    "type": "list",
    "member": {"shape": "AvailabilityZone", "locationName": "AvailabilityZone"},
    "flattened": false
  },
  "BatchDeleteClusterSnapshotsRequest": {
    "type": "structure",
    "members": {
      "Identifiers": {
        "shape": "DeleteClusterSnapshotMessageList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BatchDeleteClusterSnapshotsResult": {
    "type": "structure",
    "members": {
      "Resources": {"shape": "SnapshotIdentifierList", "flattened": false},
      "Errors": {"shape": "BatchSnapshotOperationErrorList", "flattened": false}
    },
    "flattened": false
  },
  "BatchModifyClusterSnapshotsMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifierList": {
        "shape": "SnapshotIdentifierList",
        "flattened": false
      },
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "Force": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "BatchModifyClusterSnapshotsOutputMessage": {
    "type": "structure",
    "members": {
      "Resources": {"shape": "SnapshotIdentifierList", "flattened": false},
      "Errors": {"shape": "BatchSnapshotOperationErrors", "flattened": false}
    },
    "flattened": false
  },
  "BatchSnapshotOperationErrorList": {
    "type": "list",
    "member": {
      "shape": "SnapshotErrorMessage",
      "locationName": "SnapshotErrorMessage"
    },
    "flattened": false
  },
  "BatchSnapshotOperationErrors": {
    "type": "list",
    "member": {
      "shape": "SnapshotErrorMessage",
      "locationName": "SnapshotErrorMessage"
    },
    "flattened": false
  },
  "Boolean": {"type": "boolean", "flattened": false},
  "BooleanOptional": {"type": "boolean", "flattened": false},
  "CancelResizeMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CertificateAssociation": {
    "type": "structure",
    "members": {
      "CustomDomainName": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CertificateAssociationList": {
    "type": "list",
    "member": {
      "shape": "CertificateAssociation",
      "locationName": "CertificateAssociation"
    },
    "flattened": false
  },
  "Cluster": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "ClusterStatus": {"shape": "String", "flattened": false},
      "ClusterAvailabilityStatus": {"shape": "String", "flattened": false},
      "ModifyStatus": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "DBName": {"shape": "String", "flattened": false},
      "Endpoint": {"shape": "Endpoint", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "AutomatedSnapshotRetentionPeriod": {
        "shape": "Integer",
        "flattened": false
      },
      "ManualSnapshotRetentionPeriod": {"shape": "Integer", "flattened": false},
      "ClusterSecurityGroups": {
        "shape": "ClusterSecurityGroupMembershipList",
        "flattened": false
      },
      "VpcSecurityGroups": {
        "shape": "VpcSecurityGroupMembershipList",
        "flattened": false
      },
      "ClusterParameterGroups": {
        "shape": "ClusterParameterGroupStatusList",
        "flattened": false
      },
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "PendingModifiedValues": {
        "shape": "PendingModifiedValues",
        "flattened": false
      },
      "ClusterVersion": {"shape": "String", "flattened": false},
      "AllowVersionUpgrade": {"shape": "Boolean", "flattened": false},
      "NumberOfNodes": {"shape": "Integer", "flattened": false},
      "PubliclyAccessible": {"shape": "Boolean", "flattened": false},
      "Encrypted": {"shape": "Boolean", "flattened": false},
      "RestoreStatus": {"shape": "RestoreStatus", "flattened": false},
      "DataTransferProgress": {
        "shape": "DataTransferProgress",
        "flattened": false
      },
      "HsmStatus": {"shape": "HsmStatus", "flattened": false},
      "ClusterSnapshotCopyStatus": {
        "shape": "ClusterSnapshotCopyStatus",
        "flattened": false
      },
      "ClusterPublicKey": {"shape": "String", "flattened": false},
      "ClusterNodes": {"shape": "ClusterNodesList", "flattened": false},
      "ElasticIpStatus": {"shape": "ElasticIpStatus", "flattened": false},
      "ClusterRevisionNumber": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnhancedVpcRouting": {"shape": "Boolean", "flattened": false},
      "IamRoles": {"shape": "ClusterIamRoleList", "flattened": false},
      "PendingActions": {"shape": "PendingActionsList", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "ElasticResizeNumberOfNodeOptions": {
        "shape": "String",
        "flattened": false
      },
      "DeferredMaintenanceWindows": {
        "shape": "DeferredMaintenanceWindowsList",
        "flattened": false
      },
      "SnapshotScheduleIdentifier": {"shape": "String", "flattened": false},
      "SnapshotScheduleState": {"shape": "ScheduleState", "flattened": false},
      "ExpectedNextSnapshotScheduleTime": {
        "shape": "TStamp",
        "flattened": false
      },
      "ExpectedNextSnapshotScheduleTimeStatus": {
        "shape": "String",
        "flattened": false
      },
      "NextMaintenanceWindowStartTime": {"shape": "TStamp", "flattened": false},
      "ResizeInfo": {"shape": "ResizeInfo", "flattened": false},
      "AvailabilityZoneRelocationStatus": {
        "shape": "String",
        "flattened": false
      },
      "ClusterNamespaceArn": {"shape": "String", "flattened": false},
      "TotalStorageCapacityInMegaBytes": {
        "shape": "LongOptional",
        "flattened": false
      },
      "AquaConfiguration": {"shape": "AquaConfiguration", "flattened": false},
      "DefaultIamRoleArn": {"shape": "String", "flattened": false},
      "ReservedNodeExchangeStatus": {
        "shape": "ReservedNodeExchangeStatus",
        "flattened": false
      },
      "CustomDomainName": {"shape": "String", "flattened": false},
      "CustomDomainCertificateArn": {"shape": "String", "flattened": false},
      "CustomDomainCertificateExpiryDate": {
        "shape": "TStamp",
        "flattened": false
      },
      "MasterPasswordSecretArn": {"shape": "String", "flattened": false},
      "MasterPasswordSecretKmsKeyId": {"shape": "String", "flattened": false},
      "IpAddressType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "String", "flattened": false},
      "MultiAZSecondary": {"shape": "SecondaryClusterInfo", "flattened": false}
    },
    "flattened": false
  },
  "ClusterAssociatedToSchedule": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ScheduleAssociationState": {"shape": "ScheduleState", "flattened": false}
    },
    "flattened": false
  },
  "ClusterCredentials": {
    "type": "structure",
    "members": {
      "DbUser": {"shape": "String", "flattened": false},
      "DbPassword": {"shape": "SensitiveString", "flattened": false},
      "Expiration": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "ClusterDbRevision": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "CurrentDatabaseRevision": {"shape": "String", "flattened": false},
      "DatabaseRevisionReleaseDate": {"shape": "TStamp", "flattened": false},
      "RevisionTargets": {"shape": "RevisionTargetsList", "flattened": false}
    },
    "flattened": false
  },
  "ClusterDbRevisionsList": {
    "type": "list",
    "member": {
      "shape": "ClusterDbRevision",
      "locationName": "ClusterDbRevision"
    },
    "flattened": false
  },
  "ClusterDbRevisionsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ClusterDbRevisions": {
        "shape": "ClusterDbRevisionsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ClusterExtendedCredentials": {
    "type": "structure",
    "members": {
      "DbUser": {"shape": "String", "flattened": false},
      "DbPassword": {"shape": "SensitiveString", "flattened": false},
      "Expiration": {"shape": "TStamp", "flattened": false},
      "NextRefreshTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "ClusterIamRole": {
    "type": "structure",
    "members": {
      "IamRoleArn": {"shape": "String", "flattened": false},
      "ApplyStatus": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterIamRoleList": {
    "type": "list",
    "member": {"shape": "ClusterIamRole", "locationName": "ClusterIamRole"},
    "flattened": false
  },
  "ClusterList": {
    "type": "list",
    "member": {"shape": "Cluster", "locationName": "Cluster"},
    "flattened": false
  },
  "ClusterNode": {
    "type": "structure",
    "members": {
      "NodeRole": {"shape": "String", "flattened": false},
      "PrivateIPAddress": {"shape": "String", "flattened": false},
      "PublicIPAddress": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterNodesList": {
    "type": "list",
    "member": {"shape": "ClusterNode"},
    "flattened": false
  },
  "ClusterParameterGroup": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ClusterParameterGroupDetails": {
    "type": "structure",
    "members": {
      "Parameters": {"shape": "ParametersList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterParameterGroupNameMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterGroupStatus": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterParameterGroupStatus": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterApplyStatus": {"shape": "String", "flattened": false},
      "ClusterParameterStatusList": {
        "shape": "ClusterParameterStatusList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ClusterParameterGroupStatusList": {
    "type": "list",
    "member": {
      "shape": "ClusterParameterGroupStatus",
      "locationName": "ClusterParameterGroup"
    },
    "flattened": false
  },
  "ClusterParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ParameterGroups": {"shape": "ParameterGroupList", "flattened": false}
    },
    "flattened": false
  },
  "ClusterParameterStatus": {
    "type": "structure",
    "members": {
      "ParameterName": {"shape": "String", "flattened": false},
      "ParameterApplyStatus": {"shape": "String", "flattened": false},
      "ParameterApplyErrorDescription": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterParameterStatusList": {
    "type": "list",
    "member": {"shape": "ClusterParameterStatus"},
    "flattened": false
  },
  "ClusterSecurityGroup": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "EC2SecurityGroups": {
        "shape": "EC2SecurityGroupList",
        "flattened": false
      },
      "IPRanges": {"shape": "IPRangeList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ClusterSecurityGroupMembership": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterSecurityGroupMembershipList": {
    "type": "list",
    "member": {
      "shape": "ClusterSecurityGroupMembership",
      "locationName": "ClusterSecurityGroup"
    },
    "flattened": false
  },
  "ClusterSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ClusterSecurityGroups": {
        "shape": "ClusterSecurityGroups",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ClusterSecurityGroupNameList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ClusterSecurityGroupName"},
    "flattened": false
  },
  "ClusterSecurityGroups": {
    "type": "list",
    "member": {
      "shape": "ClusterSecurityGroup",
      "locationName": "ClusterSecurityGroup"
    },
    "flattened": false
  },
  "ClusterSnapshotCopyStatus": {
    "type": "structure",
    "members": {
      "DestinationRegion": {"shape": "String", "flattened": false},
      "RetentionPeriod": {"shape": "Long", "flattened": false},
      "ManualSnapshotRetentionPeriod": {"shape": "Integer", "flattened": false},
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterSubnetGroup": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "SubnetGroupStatus": {"shape": "String", "flattened": false},
      "Subnets": {"shape": "SubnetList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "SupportedClusterIpAddressTypes": {
        "shape": "ValueStringList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ClusterSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ClusterSubnetGroups": {
        "shape": "ClusterSubnetGroups",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ClusterSubnetGroups": {
    "type": "list",
    "member": {
      "shape": "ClusterSubnetGroup",
      "locationName": "ClusterSubnetGroup"
    },
    "flattened": false
  },
  "ClusterVersion": {
    "type": "structure",
    "members": {
      "ClusterVersion": {"shape": "String", "flattened": false},
      "ClusterParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ClusterVersionList": {
    "type": "list",
    "member": {"shape": "ClusterVersion", "locationName": "ClusterVersion"},
    "flattened": false
  },
  "ClusterVersionsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ClusterVersions": {"shape": "ClusterVersionList", "flattened": false}
    },
    "flattened": false
  },
  "ClustersMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Clusters": {"shape": "ClusterList", "flattened": false}
    },
    "flattened": false
  },
  "CopyClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "SourceSnapshotIdentifier": {"shape": "String", "flattened": false},
      "SourceSnapshotClusterIdentifier": {
        "shape": "String",
        "flattened": false
      },
      "TargetSnapshotIdentifier": {"shape": "String", "flattened": false},
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CopyClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateAuthenticationProfileMessage": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      },
      "AuthenticationProfileContent": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateAuthenticationProfileResult": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      },
      "AuthenticationProfileContent": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterMessage": {
    "type": "structure",
    "members": {
      "DBName": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ClusterType": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "ClusterSecurityGroups": {
        "shape": "ClusterSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "ClusterParameterGroupName": {"shape": "String", "flattened": false},
      "AutomatedSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "ClusterVersion": {"shape": "String", "flattened": false},
      "AllowVersionUpgrade": {"shape": "BooleanOptional", "flattened": false},
      "NumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "Encrypted": {"shape": "BooleanOptional", "flattened": false},
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "ElasticIp": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EnhancedVpcRouting": {"shape": "BooleanOptional", "flattened": false},
      "AdditionalInfo": {"shape": "String", "flattened": false},
      "IamRoles": {"shape": "IamRoleArnList", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "SnapshotScheduleIdentifier": {"shape": "String", "flattened": false},
      "AvailabilityZoneRelocation": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AquaConfigurationStatus": {
        "shape": "AquaConfigurationStatus",
        "flattened": false
      },
      "DefaultIamRoleArn": {"shape": "String", "flattened": false},
      "LoadSampleData": {"shape": "String", "flattened": false},
      "ManageMasterPassword": {"shape": "BooleanOptional", "flattened": false},
      "MasterPasswordSecretKmsKeyId": {"shape": "String", "flattened": false},
      "IpAddressType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false},
      "RedshiftIdcApplicationArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "ParameterGroupFamily": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterParameterGroupResult": {
    "type": "structure",
    "members": {
      "ClusterParameterGroup": {
        "shape": "ClusterParameterGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterSecurityGroupResult": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroup": {
        "shape": "ClusterSecurityGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateClusterSubnetGroupResult": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroup": {"shape": "ClusterSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "CreateCustomDomainAssociationMessage": {
    "type": "structure",
    "members": {
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      },
      "CustomDomainCertificateArn": {
        "shape": "CustomDomainCertificateArnString",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateCustomDomainAssociationResult": {
    "type": "structure",
    "members": {
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      },
      "CustomDomainCertificateArn": {
        "shape": "CustomDomainCertificateArnString",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "CustomDomainCertExpiryTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreateEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ResourceOwner": {"shape": "String", "flattened": false},
      "EndpointName": {"shape": "String", "flattened": false},
      "SubnetGroupName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateEventSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SnsTopicArn": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "SourceIds": {"shape": "SourceIdsList", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Severity": {"shape": "String", "flattened": false},
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
  "CreateHsmClientCertificateMessage": {
    "type": "structure",
    "members": {
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateHsmClientCertificateResult": {
    "type": "structure",
    "members": {
      "HsmClientCertificate": {
        "shape": "HsmClientCertificate",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateHsmConfigurationMessage": {
    "type": "structure",
    "members": {
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "HsmIpAddress": {"shape": "String", "flattened": false},
      "HsmPartitionName": {"shape": "String", "flattened": false},
      "HsmPartitionPassword": {"shape": "String", "flattened": false},
      "HsmServerPublicCertificate": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateHsmConfigurationResult": {
    "type": "structure",
    "members": {
      "HsmConfiguration": {"shape": "HsmConfiguration", "flattened": false}
    },
    "flattened": false
  },
  "CreateRedshiftIdcApplicationMessage": {
    "type": "structure",
    "members": {
      "IdcInstanceArn": {"shape": "String", "flattened": false},
      "RedshiftIdcApplicationName": {
        "shape": "RedshiftIdcApplicationName",
        "flattened": false
      },
      "IdentityNamespace": {
        "shape": "IdentityNamespaceString",
        "flattened": false
      },
      "IdcDisplayName": {"shape": "IdcDisplayNameString", "flattened": false},
      "IamRoleArn": {"shape": "String", "flattened": false},
      "AuthorizedTokenIssuerList": {
        "shape": "AuthorizedTokenIssuerList",
        "flattened": false
      },
      "ServiceIntegrations": {
        "shape": "ServiceIntegrationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateRedshiftIdcApplicationResult": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplication": {
        "shape": "RedshiftIdcApplication",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateScheduledActionMessage": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {"shape": "String", "flattened": false},
      "TargetAction": {"shape": "ScheduledActionType", "flattened": false},
      "Schedule": {"shape": "String", "flattened": false},
      "IamRole": {"shape": "String", "flattened": false},
      "ScheduledActionDescription": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "Enable": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateSnapshotCopyGrantMessage": {
    "type": "structure",
    "members": {
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateSnapshotCopyGrantResult": {
    "type": "structure",
    "members": {
      "SnapshotCopyGrant": {"shape": "SnapshotCopyGrant", "flattened": false}
    },
    "flattened": false
  },
  "CreateSnapshotScheduleMessage": {
    "type": "structure",
    "members": {
      "ScheduleDefinitions": {
        "shape": "ScheduleDefinitionList",
        "flattened": false
      },
      "ScheduleIdentifier": {"shape": "String", "flattened": false},
      "ScheduleDescription": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "DryRun": {"shape": "BooleanOptional", "flattened": false},
      "NextInvocations": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "CreateTagsMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateUsageLimitMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "FeatureType": {"shape": "UsageLimitFeatureType", "flattened": false},
      "LimitType": {"shape": "UsageLimitLimitType", "flattened": false},
      "Amount": {"shape": "Long", "flattened": false},
      "Period": {"shape": "UsageLimitPeriod", "flattened": false},
      "BreachAction": {"shape": "UsageLimitBreachAction", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CustomDomainAssociationsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Associations": {"shape": "AssociationList", "flattened": false}
    },
    "flattened": false
  },
  "CustomDomainCertificateArnString": {"type": "string", "flattened": false},
  "CustomDomainNameString": {"type": "string", "flattened": false},
  "CustomerStorageMessage": {
    "type": "structure",
    "members": {
      "TotalBackupSizeInMegaBytes": {"shape": "Double", "flattened": false},
      "TotalProvisionedStorageInMegaBytes": {
        "shape": "Double",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DataShare": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "ProducerArn": {"shape": "String", "flattened": false},
      "AllowPubliclyAccessibleConsumers": {
        "shape": "Boolean",
        "flattened": false
      },
      "DataShareAssociations": {
        "shape": "DataShareAssociationList",
        "flattened": false
      },
      "ManagedBy": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DataShareAssociation": {
    "type": "structure",
    "members": {
      "ConsumerIdentifier": {"shape": "String", "flattened": false},
      "Status": {"shape": "DataShareStatus", "flattened": false},
      "ConsumerRegion": {"shape": "String", "flattened": false},
      "CreatedDate": {"shape": "TStamp", "flattened": false},
      "StatusChangeDate": {"shape": "TStamp", "flattened": false},
      "ProducerAllowedWrites": {"shape": "BooleanOptional", "flattened": false},
      "ConsumerAcceptedWrites": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "DataShareAssociationList": {
    "type": "list",
    "member": {"shape": "DataShareAssociation"},
    "flattened": false
  },
  "DataShareList": {
    "type": "list",
    "member": {"shape": "DataShare"},
    "flattened": false
  },
  "DataShareStatus": {"type": "string", "flattened": false},
  "DataShareStatusForConsumer": {"type": "string", "flattened": false},
  "DataShareStatusForProducer": {"type": "string", "flattened": false},
  "DataTransferProgress": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "CurrentRateInMegaBytesPerSecond": {
        "shape": "DoubleOptional",
        "flattened": false
      },
      "TotalDataInMegaBytes": {"shape": "Long", "flattened": false},
      "DataTransferredInMegaBytes": {"shape": "Long", "flattened": false},
      "EstimatedTimeToCompletionInSeconds": {
        "shape": "LongOptional",
        "flattened": false
      },
      "ElapsedTimeInSeconds": {"shape": "LongOptional", "flattened": false}
    },
    "flattened": false
  },
  "DbGroupList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "DbGroup"},
    "flattened": false
  },
  "DeauthorizeDataShareMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "ConsumerIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DefaultClusterParameters": {
    "type": "structure",
    "members": {
      "ParameterGroupFamily": {"shape": "String", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "DeferredMaintenanceWindow": {
    "type": "structure",
    "members": {
      "DeferMaintenanceIdentifier": {"shape": "String", "flattened": false},
      "DeferMaintenanceStartTime": {"shape": "TStamp", "flattened": false},
      "DeferMaintenanceEndTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "DeferredMaintenanceWindowsList": {
    "type": "list",
    "member": {
      "shape": "DeferredMaintenanceWindow",
      "locationName": "DeferredMaintenanceWindow"
    },
    "flattened": false
  },
  "DeleteAuthenticationProfileMessage": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteAuthenticationProfileResult": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SkipFinalClusterSnapshot": {"shape": "Boolean", "flattened": false},
      "FinalClusterSnapshotIdentifier": {"shape": "String", "flattened": false},
      "FinalClusterSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "DeleteClusterSecurityGroupMessage": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteClusterSnapshotMessageList": {
    "type": "list",
    "member": {
      "shape": "DeleteClusterSnapshotMessage",
      "locationName": "DeleteClusterSnapshotMessage"
    },
    "flattened": false
  },
  "DeleteClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "DeleteClusterSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteCustomDomainAssociationMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "EndpointName": {"shape": "String", "flattened": false}
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
  "DeleteHsmClientCertificateMessage": {
    "type": "structure",
    "members": {
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteHsmConfigurationMessage": {
    "type": "structure",
    "members": {
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRedshiftIdcApplicationMessage": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplicationArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteResourcePolicyMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteScheduledActionMessage": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSnapshotCopyGrantMessage": {
    "type": "structure",
    "members": {
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSnapshotScheduleMessage": {
    "type": "structure",
    "members": {
      "ScheduleIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTagsMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUsageLimitMessage": {
    "type": "structure",
    "members": {
      "UsageLimitId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccountAttributesMessage": {
    "type": "structure",
    "members": {
      "AttributeNames": {"shape": "AttributeNameList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAuthenticationProfilesMessage": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeAuthenticationProfilesResult": {
    "type": "structure",
    "members": {
      "AuthenticationProfiles": {
        "shape": "AuthenticationProfileList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeClusterDbRevisionsMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterParameterGroupsMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterParametersMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "Source": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterSecurityGroupsMessage": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterSnapshotsMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "OwnerAccount": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false},
      "ClusterExists": {"shape": "BooleanOptional", "flattened": false},
      "SortingEntities": {
        "shape": "SnapshotSortingEntityList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeClusterSubnetGroupsMessage": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterTracksMessage": {
    "type": "structure",
    "members": {
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClusterVersionsMessage": {
    "type": "structure",
    "members": {
      "ClusterVersion": {"shape": "String", "flattened": false},
      "ClusterParameterGroupFamily": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeClustersMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeCustomDomainAssociationsMessage": {
    "type": "structure",
    "members": {
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      },
      "CustomDomainCertificateArn": {
        "shape": "CustomDomainCertificateArnString",
        "flattened": false
      },
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesForConsumerMessage": {
    "type": "structure",
    "members": {
      "ConsumerArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "DataShareStatusForConsumer", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesForConsumerResult": {
    "type": "structure",
    "members": {
      "DataShares": {"shape": "DataShareList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesForProducerMessage": {
    "type": "structure",
    "members": {
      "ProducerArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "DataShareStatusForProducer", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesForProducerResult": {
    "type": "structure",
    "members": {
      "DataShares": {"shape": "DataShareList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDataSharesResult": {
    "type": "structure",
    "members": {
      "DataShares": {"shape": "DataShareList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDefaultClusterParametersMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupFamily": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeDefaultClusterParametersResult": {
    "type": "structure",
    "members": {
      "DefaultClusterParameters": {
        "shape": "DefaultClusterParameters",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ResourceOwner": {"shape": "String", "flattened": false},
      "EndpointName": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEndpointAuthorizationMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "Account": {"shape": "String", "flattened": false},
      "Grantee": {"shape": "BooleanOptional", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
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
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
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
  "DescribeHsmClientCertificatesMessage": {
    "type": "structure",
    "members": {
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeHsmConfigurationsMessage": {
    "type": "structure",
    "members": {
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInboundIntegrationsMessage": {
    "type": "structure",
    "members": {
      "IntegrationArn": {"shape": "String", "flattened": false},
      "TargetArn": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoggingStatusMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeNodeConfigurationOptionsMessage": {
    "type": "structure",
    "members": {
      "ActionType": {"shape": "ActionType", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false},
      "OwnerAccount": {"shape": "String", "flattened": false},
      "Filters": {
        "shape": "NodeConfigurationOptionsFilterList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeOrderableClusterOptionsMessage": {
    "type": "structure",
    "members": {
      "ClusterVersion": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribePartnersInputMessage": {
    "type": "structure",
    "members": {
      "AccountId": {"shape": "PartnerIntegrationAccountId", "flattened": false},
      "ClusterIdentifier": {
        "shape": "PartnerIntegrationClusterIdentifier",
        "flattened": false
      },
      "DatabaseName": {
        "shape": "PartnerIntegrationDatabaseName",
        "flattened": false
      },
      "PartnerName": {
        "shape": "PartnerIntegrationPartnerName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribePartnersOutputMessage": {
    "type": "structure",
    "members": {
      "PartnerIntegrationInfoList": {
        "shape": "PartnerIntegrationInfoList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeRedshiftIdcApplicationsMessage": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplicationArn": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeRedshiftIdcApplicationsResult": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplications": {
        "shape": "RedshiftIdcApplicationList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedNodeExchangeStatusInputMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "ReservedNodeExchangeRequestId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedNodeExchangeStatusOutputMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeExchangeStatusDetails": {
        "shape": "ReservedNodeExchangeStatusList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedNodeOfferingsMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReservedNodesMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeResizeMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeScheduledActionsMessage": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {"shape": "String", "flattened": false},
      "TargetActionType": {
        "shape": "ScheduledActionTypeValues",
        "flattened": false
      },
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "Active": {"shape": "BooleanOptional", "flattened": false},
      "Filters": {"shape": "ScheduledActionFilterList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSnapshotCopyGrantsMessage": {
    "type": "structure",
    "members": {
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSnapshotSchedulesMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ScheduleIdentifier": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSnapshotSchedulesOutputMessage": {
    "type": "structure",
    "members": {
      "SnapshotSchedules": {
        "shape": "SnapshotScheduleList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTableRestoreStatusMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "TableRestoreRequestId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTagsMessage": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "String", "flattened": false},
      "ResourceType": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeUsageLimitsMessage": {
    "type": "structure",
    "members": {
      "UsageLimitId": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "FeatureType": {"shape": "UsageLimitFeatureType", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false},
      "TagValues": {"shape": "TagValueList", "flattened": false}
    },
    "flattened": false
  },
  "DisableLoggingMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DisableSnapshotCopyMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DisableSnapshotCopyResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "DisassociateDataShareConsumerMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false},
      "DisassociateEntireAccount": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "ConsumerArn": {"shape": "String", "flattened": false},
      "ConsumerRegion": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "Double": {"type": "double", "flattened": false},
  "DoubleOptional": {"type": "double", "flattened": false},
  "EC2SecurityGroup": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "EC2SecurityGroupList": {
    "type": "list",
    "member": {"shape": "EC2SecurityGroup", "locationName": "EC2SecurityGroup"},
    "flattened": false
  },
  "ElasticIpStatus": {
    "type": "structure",
    "members": {
      "ElasticIp": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EligibleTracksToUpdateList": {
    "type": "list",
    "member": {"shape": "UpdateTarget", "locationName": "UpdateTarget"},
    "flattened": false
  },
  "EnableLoggingMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "BucketName": {"shape": "String", "flattened": false},
      "S3KeyPrefix": {"shape": "String", "flattened": false},
      "LogDestinationType": {"shape": "LogDestinationType", "flattened": false},
      "LogExports": {"shape": "LogTypeList", "flattened": false}
    },
    "flattened": false
  },
  "EnableSnapshotCopyMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "DestinationRegion": {"shape": "String", "flattened": false},
      "RetentionPeriod": {"shape": "IntegerOptional", "flattened": false},
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false},
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EnableSnapshotCopyResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "Endpoint": {
    "type": "structure",
    "members": {
      "Address": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "VpcEndpoints": {"shape": "VpcEndpointsList", "flattened": false}
    },
    "flattened": false
  },
  "EndpointAccess": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ResourceOwner": {"shape": "String", "flattened": false},
      "SubnetGroupName": {"shape": "String", "flattened": false},
      "EndpointStatus": {"shape": "String", "flattened": false},
      "EndpointName": {"shape": "String", "flattened": false},
      "EndpointCreateTime": {"shape": "TStamp", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "Address": {"shape": "String", "flattened": false},
      "VpcSecurityGroups": {
        "shape": "VpcSecurityGroupMembershipList",
        "flattened": false
      },
      "VpcEndpoint": {"shape": "VpcEndpoint", "flattened": false}
    },
    "flattened": false
  },
  "EndpointAccessList": {
    "type": "structure",
    "members": {
      "EndpointAccessList": {"shape": "EndpointAccesses", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EndpointAccesses": {
    "type": "list",
    "member": {"shape": "EndpointAccess"},
    "flattened": false
  },
  "EndpointAuthorization": {
    "type": "structure",
    "members": {
      "Grantor": {"shape": "String", "flattened": false},
      "Grantee": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "AuthorizeTime": {"shape": "TStamp", "flattened": false},
      "ClusterStatus": {"shape": "String", "flattened": false},
      "Status": {"shape": "AuthorizationStatus", "flattened": false},
      "AllowedAllVPCs": {"shape": "Boolean", "flattened": false},
      "AllowedVPCs": {"shape": "VpcIdentifierList", "flattened": false},
      "EndpointCount": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "EndpointAuthorizationList": {
    "type": "structure",
    "members": {
      "EndpointAuthorizationList": {
        "shape": "EndpointAuthorizations",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EndpointAuthorizations": {
    "type": "list",
    "member": {"shape": "EndpointAuthorization"},
    "flattened": false
  },
  "Event": {
    "type": "structure",
    "members": {
      "SourceIdentifier": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "SourceType", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Severity": {"shape": "String", "flattened": false},
      "Date": {"shape": "TStamp", "flattened": false},
      "EventId": {"shape": "String", "flattened": false}
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
      "Events": {"shape": "EventInfoMapList", "flattened": false}
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
  "EventInfoMap": {
    "type": "structure",
    "members": {
      "EventId": {"shape": "String", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "EventDescription": {"shape": "String", "flattened": false},
      "Severity": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EventInfoMapList": {
    "type": "list",
    "member": {"shape": "EventInfoMap", "locationName": "EventInfoMap"},
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
      "SubscriptionCreationTime": {"shape": "TStamp", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "SourceIdsList": {"shape": "SourceIdsList", "flattened": false},
      "EventCategoriesList": {
        "shape": "EventCategoriesList",
        "flattened": false
      },
      "Severity": {"shape": "String", "flattened": false},
      "Enabled": {"shape": "Boolean", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
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
  "FailoverPrimaryComputeInputMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "FailoverPrimaryComputeResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "GetClusterCredentialsMessage": {
    "type": "structure",
    "members": {
      "DbUser": {"shape": "String", "flattened": false},
      "DbName": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "DurationSeconds": {"shape": "IntegerOptional", "flattened": false},
      "AutoCreate": {"shape": "BooleanOptional", "flattened": false},
      "DbGroups": {"shape": "DbGroupList", "flattened": false},
      "CustomDomainName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetClusterCredentialsWithIAMMessage": {
    "type": "structure",
    "members": {
      "DbName": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "DurationSeconds": {"shape": "IntegerOptional", "flattened": false},
      "CustomDomainName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetReservedNodeExchangeConfigurationOptionsInputMessage": {
    "type": "structure",
    "members": {
      "ActionType": {
        "shape": "ReservedNodeExchangeActionType",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetReservedNodeExchangeConfigurationOptionsOutputMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedNodeConfigurationOptionList": {
        "shape": "ReservedNodeConfigurationOptionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetReservedNodeExchangeOfferingsInputMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetReservedNodeExchangeOfferingsOutputMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedNodeOfferings": {
        "shape": "ReservedNodeOfferingList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetResourcePolicyMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetResourcePolicyResult": {
    "type": "structure",
    "members": {
      "ResourcePolicy": {"shape": "ResourcePolicy", "flattened": false}
    },
    "flattened": false
  },
  "HsmClientCertificate": {
    "type": "structure",
    "members": {
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "HsmClientCertificatePublicKey": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "HsmClientCertificateList": {
    "type": "list",
    "member": {
      "shape": "HsmClientCertificate",
      "locationName": "HsmClientCertificate"
    },
    "flattened": false
  },
  "HsmClientCertificateMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "HsmClientCertificates": {
        "shape": "HsmClientCertificateList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "HsmConfiguration": {
    "type": "structure",
    "members": {
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "HsmIpAddress": {"shape": "String", "flattened": false},
      "HsmPartitionName": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "HsmConfigurationList": {
    "type": "list",
    "member": {"shape": "HsmConfiguration", "locationName": "HsmConfiguration"},
    "flattened": false
  },
  "HsmConfigurationMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "HsmConfigurations": {"shape": "HsmConfigurationList", "flattened": false}
    },
    "flattened": false
  },
  "HsmStatus": {
    "type": "structure",
    "members": {
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "IPRange": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "IPRangeList": {
    "type": "list",
    "member": {"shape": "IPRange", "locationName": "IPRange"},
    "flattened": false
  },
  "IamRoleArnList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "IamRoleArn"},
    "flattened": false
  },
  "IdcDisplayNameString": {"type": "string", "flattened": false},
  "IdentityNamespaceString": {"type": "string", "flattened": false},
  "ImpactRankingType": {"type": "string", "flattened": false},
  "ImportTablesCompleted": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ImportTablesInProgress": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ImportTablesNotStarted": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "InboundIntegration": {
    "type": "structure",
    "members": {
      "IntegrationArn": {"shape": "String", "flattened": false},
      "SourceArn": {"shape": "String", "flattened": false},
      "TargetArn": {"shape": "String", "flattened": false},
      "Status": {"shape": "ZeroETLIntegrationStatus", "flattened": false},
      "Errors": {"shape": "IntegrationErrorList", "flattened": false},
      "CreateTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "InboundIntegrationList": {
    "type": "list",
    "member": {
      "shape": "InboundIntegration",
      "locationName": "InboundIntegration"
    },
    "flattened": false
  },
  "InboundIntegrationsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "InboundIntegrations": {
        "shape": "InboundIntegrationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Integer": {"type": "integer", "flattened": false},
  "IntegerOptional": {"type": "integer", "flattened": false},
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
  "LakeFormationQuery": {
    "type": "structure",
    "members": {
      "Authorization": {"shape": "ServiceAuthorization", "flattened": false}
    },
    "flattened": false
  },
  "LakeFormationScopeUnion": {
    "type": "structure",
    "members": {
      "LakeFormationQuery": {"shape": "LakeFormationQuery", "flattened": false}
    },
    "flattened": false
  },
  "LakeFormationServiceIntegrations": {
    "type": "list",
    "member": {"shape": "LakeFormationScopeUnion"},
    "flattened": false
  },
  "ListRecommendationsMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "NamespaceArn": {"shape": "String", "flattened": false},
      "MaxRecords": {"shape": "IntegerOptional", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListRecommendationsResult": {
    "type": "structure",
    "members": {
      "Recommendations": {"shape": "RecommendationList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "LogDestinationType": {"type": "string", "flattened": false},
  "LogTypeList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "LoggingStatus": {
    "type": "structure",
    "members": {
      "LoggingEnabled": {"shape": "Boolean", "flattened": false},
      "BucketName": {"shape": "String", "flattened": false},
      "S3KeyPrefix": {"shape": "String", "flattened": false},
      "LastSuccessfulDeliveryTime": {"shape": "TStamp", "flattened": false},
      "LastFailureTime": {"shape": "TStamp", "flattened": false},
      "LastFailureMessage": {"shape": "String", "flattened": false},
      "LogDestinationType": {"shape": "LogDestinationType", "flattened": false},
      "LogExports": {"shape": "LogTypeList", "flattened": false}
    },
    "flattened": false
  },
  "Long": {"type": "long", "flattened": false},
  "LongOptional": {"type": "long", "flattened": false},
  "MaintenanceTrack": {
    "type": "structure",
    "members": {
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "DatabaseVersion": {"shape": "String", "flattened": false},
      "UpdateTargets": {
        "shape": "EligibleTracksToUpdateList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Mode": {"type": "string", "flattened": false},
  "ModifyAquaInputMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "AquaConfigurationStatus": {
        "shape": "AquaConfigurationStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyAquaOutputMessage": {
    "type": "structure",
    "members": {
      "AquaConfiguration": {"shape": "AquaConfiguration", "flattened": false}
    },
    "flattened": false
  },
  "ModifyAuthenticationProfileMessage": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      },
      "AuthenticationProfileContent": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyAuthenticationProfileResult": {
    "type": "structure",
    "members": {
      "AuthenticationProfileName": {
        "shape": "AuthenticationProfileNameString",
        "flattened": false
      },
      "AuthenticationProfileContent": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterDbRevisionMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "RevisionTarget": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterDbRevisionResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterIamRolesMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "AddIamRoles": {"shape": "IamRoleArnList", "flattened": false},
      "RemoveIamRoles": {"shape": "IamRoleArnList", "flattened": false},
      "DefaultIamRoleArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterIamRolesResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterMaintenanceMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "DeferMaintenance": {"shape": "BooleanOptional", "flattened": false},
      "DeferMaintenanceIdentifier": {"shape": "String", "flattened": false},
      "DeferMaintenanceStartTime": {"shape": "TStamp", "flattened": false},
      "DeferMaintenanceEndTime": {"shape": "TStamp", "flattened": false},
      "DeferMaintenanceDuration": {
        "shape": "IntegerOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyClusterMaintenanceResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ClusterType": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "ClusterSecurityGroups": {
        "shape": "ClusterSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "ClusterParameterGroupName": {"shape": "String", "flattened": false},
      "AutomatedSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "ClusterVersion": {"shape": "String", "flattened": false},
      "AllowVersionUpgrade": {"shape": "BooleanOptional", "flattened": false},
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "NewClusterIdentifier": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "ElasticIp": {"shape": "String", "flattened": false},
      "EnhancedVpcRouting": {"shape": "BooleanOptional", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "Encrypted": {"shape": "BooleanOptional", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "AvailabilityZoneRelocation": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "ManageMasterPassword": {"shape": "BooleanOptional", "flattened": false},
      "MasterPasswordSecretKmsKeyId": {"shape": "String", "flattened": false},
      "IpAddressType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "Force": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterSnapshotScheduleMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ScheduleIdentifier": {"shape": "String", "flattened": false},
      "DisassociateSchedule": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterSubnetGroupMessage": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "SubnetIds": {"shape": "SubnetIdentifierList", "flattened": false}
    },
    "flattened": false
  },
  "ModifyClusterSubnetGroupResult": {
    "type": "structure",
    "members": {
      "ClusterSubnetGroup": {"shape": "ClusterSubnetGroup", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCustomDomainAssociationMessage": {
    "type": "structure",
    "members": {
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      },
      "CustomDomainCertificateArn": {
        "shape": "CustomDomainCertificateArnString",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyCustomDomainAssociationResult": {
    "type": "structure",
    "members": {
      "CustomDomainName": {
        "shape": "CustomDomainNameString",
        "flattened": false
      },
      "CustomDomainCertificateArn": {
        "shape": "CustomDomainCertificateArnString",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "CustomDomainCertExpiryTime": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ModifyEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "EndpointName": {"shape": "String", "flattened": false},
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyEventSubscriptionMessage": {
    "type": "structure",
    "members": {
      "SubscriptionName": {"shape": "String", "flattened": false},
      "SnsTopicArn": {"shape": "String", "flattened": false},
      "SourceType": {"shape": "String", "flattened": false},
      "SourceIds": {"shape": "SourceIdsList", "flattened": false},
      "EventCategories": {"shape": "EventCategoriesList", "flattened": false},
      "Severity": {"shape": "String", "flattened": false},
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
  "ModifyRedshiftIdcApplicationMessage": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplicationArn": {"shape": "String", "flattened": false},
      "IdentityNamespace": {
        "shape": "IdentityNamespaceString",
        "flattened": false
      },
      "IamRoleArn": {"shape": "String", "flattened": false},
      "IdcDisplayName": {"shape": "IdcDisplayNameString", "flattened": false},
      "AuthorizedTokenIssuerList": {
        "shape": "AuthorizedTokenIssuerList",
        "flattened": false
      },
      "ServiceIntegrations": {
        "shape": "ServiceIntegrationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyRedshiftIdcApplicationResult": {
    "type": "structure",
    "members": {
      "RedshiftIdcApplication": {
        "shape": "RedshiftIdcApplication",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyScheduledActionMessage": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {"shape": "String", "flattened": false},
      "TargetAction": {"shape": "ScheduledActionType", "flattened": false},
      "Schedule": {"shape": "String", "flattened": false},
      "IamRole": {"shape": "String", "flattened": false},
      "ScheduledActionDescription": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false},
      "Enable": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "ModifySnapshotCopyRetentionPeriodMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "RetentionPeriod": {"shape": "Integer", "flattened": false},
      "Manual": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ModifySnapshotCopyRetentionPeriodResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ModifySnapshotScheduleMessage": {
    "type": "structure",
    "members": {
      "ScheduleIdentifier": {"shape": "String", "flattened": false},
      "ScheduleDefinitions": {
        "shape": "ScheduleDefinitionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyUsageLimitMessage": {
    "type": "structure",
    "members": {
      "UsageLimitId": {"shape": "String", "flattened": false},
      "Amount": {"shape": "LongOptional", "flattened": false},
      "BreachAction": {"shape": "UsageLimitBreachAction", "flattened": false}
    },
    "flattened": false
  },
  "NetworkInterface": {
    "type": "structure",
    "members": {
      "NetworkInterfaceId": {"shape": "String", "flattened": false},
      "SubnetId": {"shape": "String", "flattened": false},
      "PrivateIpAddress": {"shape": "String", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "Ipv6Address": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "NetworkInterfaceList": {
    "type": "list",
    "member": {"shape": "NetworkInterface", "locationName": "NetworkInterface"},
    "flattened": false
  },
  "NodeConfigurationOption": {
    "type": "structure",
    "members": {
      "NodeType": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "Integer", "flattened": false},
      "EstimatedDiskUtilizationPercent": {
        "shape": "DoubleOptional",
        "flattened": false
      },
      "Mode": {"shape": "Mode", "flattened": false}
    },
    "flattened": false
  },
  "NodeConfigurationOptionList": {
    "type": "list",
    "member": {
      "shape": "NodeConfigurationOption",
      "locationName": "NodeConfigurationOption"
    },
    "flattened": false
  },
  "NodeConfigurationOptionsFilter": {
    "type": "structure",
    "members": {
      "Name": {
        "shape": "NodeConfigurationOptionsFilterName",
        "flattened": false
      },
      "Operator": {"shape": "OperatorType", "flattened": false},
      "Values": {"shape": "ValueStringList", "flattened": false}
    },
    "flattened": false
  },
  "NodeConfigurationOptionsFilterList": {
    "type": "list",
    "member": {
      "shape": "NodeConfigurationOptionsFilter",
      "locationName": "NodeConfigurationOptionsFilter"
    },
    "flattened": false
  },
  "NodeConfigurationOptionsFilterName": {"type": "string", "flattened": false},
  "NodeConfigurationOptionsMessage": {
    "type": "structure",
    "members": {
      "NodeConfigurationOptionList": {
        "shape": "NodeConfigurationOptionList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "OperatorType": {"type": "string", "flattened": false},
  "OrderableClusterOption": {
    "type": "structure",
    "members": {
      "ClusterVersion": {"shape": "String", "flattened": false},
      "ClusterType": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZoneList", "flattened": false}
    },
    "flattened": false
  },
  "OrderableClusterOptionsList": {
    "type": "list",
    "member": {
      "shape": "OrderableClusterOption",
      "locationName": "OrderableClusterOption"
    },
    "flattened": false
  },
  "OrderableClusterOptionsMessage": {
    "type": "structure",
    "members": {
      "OrderableClusterOptions": {
        "shape": "OrderableClusterOptionsList",
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
      "DataType": {"shape": "String", "flattened": false},
      "AllowedValues": {"shape": "String", "flattened": false},
      "ApplyType": {"shape": "ParameterApplyType", "flattened": false},
      "IsModifiable": {"shape": "Boolean", "flattened": false},
      "MinimumEngineVersion": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ParameterApplyType": {"type": "string", "flattened": false},
  "ParameterGroupList": {
    "type": "list",
    "member": {
      "shape": "ClusterParameterGroup",
      "locationName": "ClusterParameterGroup"
    },
    "flattened": false
  },
  "ParametersList": {
    "type": "list",
    "member": {"shape": "Parameter", "locationName": "Parameter"},
    "flattened": false
  },
  "PartnerIntegrationAccountId": {"type": "string", "flattened": false},
  "PartnerIntegrationClusterIdentifier": {"type": "string", "flattened": false},
  "PartnerIntegrationDatabaseName": {"type": "string", "flattened": false},
  "PartnerIntegrationInfo": {
    "type": "structure",
    "members": {
      "DatabaseName": {
        "shape": "PartnerIntegrationDatabaseName",
        "flattened": false
      },
      "PartnerName": {
        "shape": "PartnerIntegrationPartnerName",
        "flattened": false
      },
      "Status": {"shape": "PartnerIntegrationStatus", "flattened": false},
      "StatusMessage": {
        "shape": "PartnerIntegrationStatusMessage",
        "flattened": false
      },
      "CreatedAt": {"shape": "TStamp", "flattened": false},
      "UpdatedAt": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "PartnerIntegrationInfoList": {
    "type": "list",
    "member": {
      "shape": "PartnerIntegrationInfo",
      "locationName": "PartnerIntegrationInfo"
    },
    "flattened": false
  },
  "PartnerIntegrationInputMessage": {
    "type": "structure",
    "members": {
      "AccountId": {"shape": "PartnerIntegrationAccountId", "flattened": false},
      "ClusterIdentifier": {
        "shape": "PartnerIntegrationClusterIdentifier",
        "flattened": false
      },
      "DatabaseName": {
        "shape": "PartnerIntegrationDatabaseName",
        "flattened": false
      },
      "PartnerName": {
        "shape": "PartnerIntegrationPartnerName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PartnerIntegrationOutputMessage": {
    "type": "structure",
    "members": {
      "DatabaseName": {
        "shape": "PartnerIntegrationDatabaseName",
        "flattened": false
      },
      "PartnerName": {
        "shape": "PartnerIntegrationPartnerName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PartnerIntegrationPartnerName": {"type": "string", "flattened": false},
  "PartnerIntegrationStatus": {"type": "string", "flattened": false},
  "PartnerIntegrationStatusMessage": {"type": "string", "flattened": false},
  "PauseClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PauseClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "PendingActionsList": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "PendingModifiedValues": {
    "type": "structure",
    "members": {
      "MasterUserPassword": {"shape": "SensitiveString", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "ClusterType": {"shape": "String", "flattened": false},
      "ClusterVersion": {"shape": "String", "flattened": false},
      "AutomatedSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "EnhancedVpcRouting": {"shape": "BooleanOptional", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "EncryptionType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PurchaseReservedNodeOfferingMessage": {
    "type": "structure",
    "members": {
      "ReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "NodeCount": {"shape": "IntegerOptional", "flattened": false}
    },
    "flattened": false
  },
  "PurchaseReservedNodeOfferingResult": {
    "type": "structure",
    "members": {
      "ReservedNode": {"shape": "ReservedNode", "flattened": false}
    },
    "flattened": false
  },
  "PutResourcePolicyMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "Policy": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PutResourcePolicyResult": {
    "type": "structure",
    "members": {
      "ResourcePolicy": {"shape": "ResourcePolicy", "flattened": false}
    },
    "flattened": false
  },
  "RebootClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RebootClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "Recommendation": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "NamespaceArn": {"shape": "String", "flattened": false},
      "CreatedAt": {"shape": "TStamp", "flattened": false},
      "RecommendationType": {"shape": "String", "flattened": false},
      "Title": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "Observation": {"shape": "String", "flattened": false},
      "ImpactRanking": {"shape": "ImpactRankingType", "flattened": false},
      "RecommendationText": {"shape": "String", "flattened": false},
      "RecommendedActions": {
        "shape": "RecommendedActionList",
        "flattened": false
      },
      "ReferenceLinks": {"shape": "ReferenceLinkList", "flattened": false}
    },
    "flattened": false
  },
  "RecommendationList": {
    "type": "list",
    "member": {"shape": "Recommendation", "locationName": "Recommendation"},
    "flattened": false
  },
  "RecommendedAction": {
    "type": "structure",
    "members": {
      "Text": {"shape": "String", "flattened": false},
      "Database": {"shape": "String", "flattened": false},
      "Command": {"shape": "String", "flattened": false},
      "Type": {"shape": "RecommendedActionType", "flattened": false}
    },
    "flattened": false
  },
  "RecommendedActionList": {
    "type": "list",
    "member": {
      "shape": "RecommendedAction",
      "locationName": "RecommendedAction"
    },
    "flattened": false
  },
  "RecommendedActionType": {"type": "string", "flattened": false},
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
  "RedshiftIdcApplication": {
    "type": "structure",
    "members": {
      "IdcInstanceArn": {"shape": "String", "flattened": false},
      "RedshiftIdcApplicationName": {
        "shape": "RedshiftIdcApplicationName",
        "flattened": false
      },
      "RedshiftIdcApplicationArn": {"shape": "String", "flattened": false},
      "IdentityNamespace": {
        "shape": "IdentityNamespaceString",
        "flattened": false
      },
      "IdcDisplayName": {"shape": "IdcDisplayNameString", "flattened": false},
      "IamRoleArn": {"shape": "String", "flattened": false},
      "IdcManagedApplicationArn": {"shape": "String", "flattened": false},
      "IdcOnboardStatus": {"shape": "String", "flattened": false},
      "AuthorizedTokenIssuerList": {
        "shape": "AuthorizedTokenIssuerList",
        "flattened": false
      },
      "ServiceIntegrations": {
        "shape": "ServiceIntegrationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RedshiftIdcApplicationList": {
    "type": "list",
    "member": {"shape": "RedshiftIdcApplication"},
    "flattened": false
  },
  "RedshiftIdcApplicationName": {"type": "string", "flattened": false},
  "ReferenceLink": {
    "type": "structure",
    "members": {
      "Text": {"shape": "String", "flattened": false},
      "Link": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ReferenceLinkList": {
    "type": "list",
    "member": {"shape": "ReferenceLink", "locationName": "ReferenceLink"},
    "flattened": false
  },
  "RejectDataShareMessage": {
    "type": "structure",
    "members": {
      "DataShareArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ReservedNode": {
    "type": "structure",
    "members": {
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "ReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "StartTime": {"shape": "TStamp", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "CurrencyCode": {"shape": "String", "flattened": false},
      "NodeCount": {"shape": "Integer", "flattened": false},
      "State": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false},
      "ReservedNodeOfferingType": {
        "shape": "ReservedNodeOfferingType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedNodeConfigurationOption": {
    "type": "structure",
    "members": {
      "SourceReservedNode": {"shape": "ReservedNode", "flattened": false},
      "TargetReservedNodeCount": {"shape": "Integer", "flattened": false},
      "TargetReservedNodeOffering": {
        "shape": "ReservedNodeOffering",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedNodeConfigurationOptionList": {
    "type": "list",
    "member": {
      "shape": "ReservedNodeConfigurationOption",
      "locationName": "ReservedNodeConfigurationOption"
    },
    "flattened": false
  },
  "ReservedNodeExchangeActionType": {"type": "string", "flattened": false},
  "ReservedNodeExchangeStatus": {
    "type": "structure",
    "members": {
      "ReservedNodeExchangeRequestId": {"shape": "String", "flattened": false},
      "Status": {"shape": "ReservedNodeExchangeStatusType", "flattened": false},
      "RequestTime": {"shape": "TStamp", "flattened": false},
      "SourceReservedNodeId": {"shape": "String", "flattened": false},
      "SourceReservedNodeType": {"shape": "String", "flattened": false},
      "SourceReservedNodeCount": {"shape": "Integer", "flattened": false},
      "TargetReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "TargetReservedNodeType": {"shape": "String", "flattened": false},
      "TargetReservedNodeCount": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "ReservedNodeExchangeStatusList": {
    "type": "list",
    "member": {
      "shape": "ReservedNodeExchangeStatus",
      "locationName": "ReservedNodeExchangeStatus"
    },
    "flattened": false
  },
  "ReservedNodeExchangeStatusType": {"type": "string", "flattened": false},
  "ReservedNodeList": {
    "type": "list",
    "member": {"shape": "ReservedNode", "locationName": "ReservedNode"},
    "flattened": false
  },
  "ReservedNodeOffering": {
    "type": "structure",
    "members": {
      "ReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "Duration": {"shape": "Integer", "flattened": false},
      "FixedPrice": {"shape": "Double", "flattened": false},
      "UsagePrice": {"shape": "Double", "flattened": false},
      "CurrencyCode": {"shape": "String", "flattened": false},
      "OfferingType": {"shape": "String", "flattened": false},
      "RecurringCharges": {"shape": "RecurringChargeList", "flattened": false},
      "ReservedNodeOfferingType": {
        "shape": "ReservedNodeOfferingType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedNodeOfferingList": {
    "type": "list",
    "member": {
      "shape": "ReservedNodeOffering",
      "locationName": "ReservedNodeOffering"
    },
    "flattened": false
  },
  "ReservedNodeOfferingType": {"type": "string", "flattened": false},
  "ReservedNodeOfferingsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedNodeOfferings": {
        "shape": "ReservedNodeOfferingList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ReservedNodesMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ReservedNodes": {"shape": "ReservedNodeList", "flattened": false}
    },
    "flattened": false
  },
  "ResetClusterParameterGroupMessage": {
    "type": "structure",
    "members": {
      "ParameterGroupName": {"shape": "String", "flattened": false},
      "ResetAllParameters": {"shape": "Boolean", "flattened": false},
      "Parameters": {"shape": "ParametersList", "flattened": false}
    },
    "flattened": false
  },
  "ResizeClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "ClusterType": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "Classic": {"shape": "BooleanOptional", "flattened": false},
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "TargetReservedNodeOfferingId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ResizeClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ResizeInfo": {
    "type": "structure",
    "members": {
      "ResizeType": {"shape": "String", "flattened": false},
      "AllowCancelResize": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "ResizeProgressMessage": {
    "type": "structure",
    "members": {
      "TargetNodeType": {"shape": "String", "flattened": false},
      "TargetNumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "TargetClusterType": {"shape": "String", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "ImportTablesCompleted": {
        "shape": "ImportTablesCompleted",
        "flattened": false
      },
      "ImportTablesInProgress": {
        "shape": "ImportTablesInProgress",
        "flattened": false
      },
      "ImportTablesNotStarted": {
        "shape": "ImportTablesNotStarted",
        "flattened": false
      },
      "AvgResizeRateInMegaBytesPerSecond": {
        "shape": "DoubleOptional",
        "flattened": false
      },
      "TotalResizeDataInMegaBytes": {
        "shape": "LongOptional",
        "flattened": false
      },
      "ProgressInMegaBytes": {"shape": "LongOptional", "flattened": false},
      "ElapsedTimeInSeconds": {"shape": "LongOptional", "flattened": false},
      "EstimatedTimeToCompletionInSeconds": {
        "shape": "LongOptional",
        "flattened": false
      },
      "ResizeType": {"shape": "String", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "TargetEncryptionType": {"shape": "String", "flattened": false},
      "DataTransferProgressPercent": {
        "shape": "DoubleOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ResourcePolicy": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "String", "flattened": false},
      "Policy": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RestorableNodeTypeList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "NodeType"},
    "flattened": false
  },
  "RestoreFromClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false},
      "SnapshotClusterIdentifier": {"shape": "String", "flattened": false},
      "Port": {"shape": "IntegerOptional", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "AllowVersionUpgrade": {"shape": "BooleanOptional", "flattened": false},
      "ClusterSubnetGroupName": {"shape": "String", "flattened": false},
      "PubliclyAccessible": {"shape": "BooleanOptional", "flattened": false},
      "OwnerAccount": {"shape": "String", "flattened": false},
      "HsmClientCertificateIdentifier": {"shape": "String", "flattened": false},
      "HsmConfigurationIdentifier": {"shape": "String", "flattened": false},
      "ElasticIp": {"shape": "String", "flattened": false},
      "ClusterParameterGroupName": {"shape": "String", "flattened": false},
      "ClusterSecurityGroups": {
        "shape": "ClusterSecurityGroupNameList",
        "flattened": false
      },
      "VpcSecurityGroupIds": {
        "shape": "VpcSecurityGroupIdList",
        "flattened": false
      },
      "PreferredMaintenanceWindow": {"shape": "String", "flattened": false},
      "AutomatedSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "KmsKeyId": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "EnhancedVpcRouting": {"shape": "BooleanOptional", "flattened": false},
      "AdditionalInfo": {"shape": "String", "flattened": false},
      "IamRoles": {"shape": "IamRoleArnList", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "SnapshotScheduleIdentifier": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "IntegerOptional", "flattened": false},
      "AvailabilityZoneRelocation": {
        "shape": "BooleanOptional",
        "flattened": false
      },
      "AquaConfigurationStatus": {
        "shape": "AquaConfigurationStatus",
        "flattened": false
      },
      "DefaultIamRoleArn": {"shape": "String", "flattened": false},
      "ReservedNodeId": {"shape": "String", "flattened": false},
      "TargetReservedNodeOfferingId": {"shape": "String", "flattened": false},
      "Encrypted": {"shape": "BooleanOptional", "flattened": false},
      "ManageMasterPassword": {"shape": "BooleanOptional", "flattened": false},
      "MasterPasswordSecretKmsKeyId": {"shape": "String", "flattened": false},
      "IpAddressType": {"shape": "String", "flattened": false},
      "MultiAZ": {"shape": "BooleanOptional", "flattened": false}
    },
    "flattened": false
  },
  "RestoreFromClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "RestoreStatus": {
    "type": "structure",
    "members": {
      "Status": {"shape": "String", "flattened": false},
      "CurrentRestoreRateInMegaBytesPerSecond": {
        "shape": "Double",
        "flattened": false
      },
      "SnapshotSizeInMegaBytes": {"shape": "Long", "flattened": false},
      "ProgressInMegaBytes": {"shape": "Long", "flattened": false},
      "ElapsedTimeInSeconds": {"shape": "Long", "flattened": false},
      "EstimatedTimeToCompletionInSeconds": {
        "shape": "Long",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RestoreTableFromClusterSnapshotMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SourceDatabaseName": {"shape": "String", "flattened": false},
      "SourceSchemaName": {"shape": "String", "flattened": false},
      "SourceTableName": {"shape": "String", "flattened": false},
      "TargetDatabaseName": {"shape": "String", "flattened": false},
      "TargetSchemaName": {"shape": "String", "flattened": false},
      "NewTableName": {"shape": "String", "flattened": false},
      "EnableCaseSensitiveIdentifier": {
        "shape": "BooleanOptional",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RestoreTableFromClusterSnapshotResult": {
    "type": "structure",
    "members": {
      "TableRestoreStatus": {"shape": "TableRestoreStatus", "flattened": false}
    },
    "flattened": false
  },
  "ResumeClusterMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ResumeClusterResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "RevisionTarget": {
    "type": "structure",
    "members": {
      "DatabaseRevision": {"shape": "String", "flattened": false},
      "Description": {"shape": "String", "flattened": false},
      "DatabaseRevisionReleaseDate": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "RevisionTargetsList": {
    "type": "list",
    "member": {"shape": "RevisionTarget", "locationName": "RevisionTarget"},
    "flattened": false
  },
  "RevokeClusterSecurityGroupIngressMessage": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroupName": {"shape": "String", "flattened": false},
      "CIDRIP": {"shape": "String", "flattened": false},
      "EC2SecurityGroupName": {"shape": "String", "flattened": false},
      "EC2SecurityGroupOwnerId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RevokeClusterSecurityGroupIngressResult": {
    "type": "structure",
    "members": {
      "ClusterSecurityGroup": {
        "shape": "ClusterSecurityGroup",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RevokeEndpointAccessMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "Account": {"shape": "String", "flattened": false},
      "VpcIds": {"shape": "VpcIdentifierList", "flattened": false},
      "Force": {"shape": "Boolean", "flattened": false}
    },
    "flattened": false
  },
  "RevokeSnapshotAccessMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false},
      "SnapshotClusterIdentifier": {"shape": "String", "flattened": false},
      "AccountWithRestoreAccess": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RevokeSnapshotAccessResult": {
    "type": "structure",
    "members": {
      "Snapshot": {"shape": "Snapshot", "flattened": false}
    },
    "flattened": false
  },
  "RotateEncryptionKeyMessage": {
    "type": "structure",
    "members": {
      "ClusterIdentifier": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "RotateEncryptionKeyResult": {
    "type": "structure",
    "members": {
      "Cluster": {"shape": "Cluster", "flattened": false}
    },
    "flattened": false
  },
  "ScheduleDefinitionList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "ScheduleDefinition"},
    "flattened": false
  },
  "ScheduleState": {"type": "string", "flattened": false},
  "ScheduledAction": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {"shape": "String", "flattened": false},
      "TargetAction": {"shape": "ScheduledActionType", "flattened": false},
      "Schedule": {"shape": "String", "flattened": false},
      "IamRole": {"shape": "String", "flattened": false},
      "ScheduledActionDescription": {"shape": "String", "flattened": false},
      "State": {"shape": "ScheduledActionState", "flattened": false},
      "NextInvocations": {
        "shape": "ScheduledActionTimeList",
        "flattened": false
      },
      "StartTime": {"shape": "TStamp", "flattened": false},
      "EndTime": {"shape": "TStamp", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledActionFilter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ScheduledActionFilterName", "flattened": false},
      "Values": {"shape": "ValueStringList", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledActionFilterList": {
    "type": "list",
    "member": {
      "shape": "ScheduledActionFilter",
      "locationName": "ScheduledActionFilter"
    },
    "flattened": false
  },
  "ScheduledActionFilterName": {"type": "string", "flattened": false},
  "ScheduledActionList": {
    "type": "list",
    "member": {"shape": "ScheduledAction", "locationName": "ScheduledAction"},
    "flattened": false
  },
  "ScheduledActionState": {"type": "string", "flattened": false},
  "ScheduledActionTimeList": {
    "type": "list",
    "member": {"shape": "TStamp", "locationName": "ScheduledActionTime"},
    "flattened": false
  },
  "ScheduledActionType": {
    "type": "structure",
    "members": {
      "ResizeCluster": {"shape": "ResizeClusterMessage", "flattened": false},
      "PauseCluster": {"shape": "PauseClusterMessage", "flattened": false},
      "ResumeCluster": {"shape": "ResumeClusterMessage", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledActionTypeValues": {"type": "string", "flattened": false},
  "ScheduledActionsMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "ScheduledActions": {"shape": "ScheduledActionList", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledSnapshotTimeList": {
    "type": "list",
    "member": {"shape": "TStamp", "locationName": "SnapshotTime"},
    "flattened": false
  },
  "SecondaryClusterInfo": {
    "type": "structure",
    "members": {
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "ClusterNodes": {"shape": "ClusterNodesList", "flattened": false}
    },
    "flattened": false
  },
  "SensitiveString": {"type": "string", "flattened": false},
  "ServiceAuthorization": {"type": "string", "flattened": false},
  "ServiceIntegrationList": {
    "type": "list",
    "member": {"shape": "ServiceIntegrationsUnion"},
    "flattened": false
  },
  "ServiceIntegrationsUnion": {
    "type": "structure",
    "members": {
      "LakeFormation": {
        "shape": "LakeFormationServiceIntegrations",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Snapshot": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotCreateTime": {"shape": "TStamp", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "ClusterCreateTime": {"shape": "TStamp", "flattened": false},
      "MasterUsername": {"shape": "String", "flattened": false},
      "ClusterVersion": {"shape": "String", "flattened": false},
      "EngineFullVersion": {"shape": "String", "flattened": false},
      "SnapshotType": {"shape": "String", "flattened": false},
      "NodeType": {"shape": "String", "flattened": false},
      "NumberOfNodes": {"shape": "Integer", "flattened": false},
      "DBName": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "Encrypted": {"shape": "Boolean", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "EncryptedWithHSM": {"shape": "Boolean", "flattened": false},
      "AccountsWithRestoreAccess": {
        "shape": "AccountsWithRestoreAccessList",
        "flattened": false
      },
      "OwnerAccount": {"shape": "String", "flattened": false},
      "TotalBackupSizeInMegaBytes": {"shape": "Double", "flattened": false},
      "ActualIncrementalBackupSizeInMegaBytes": {
        "shape": "Double",
        "flattened": false
      },
      "BackupProgressInMegaBytes": {"shape": "Double", "flattened": false},
      "CurrentBackupRateInMegaBytesPerSecond": {
        "shape": "Double",
        "flattened": false
      },
      "EstimatedSecondsToCompletion": {"shape": "Long", "flattened": false},
      "ElapsedTimeInSeconds": {"shape": "Long", "flattened": false},
      "SourceRegion": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "RestorableNodeTypes": {
        "shape": "RestorableNodeTypeList",
        "flattened": false
      },
      "EnhancedVpcRouting": {"shape": "Boolean", "flattened": false},
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "ManualSnapshotRetentionPeriod": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "ManualSnapshotRemainingDays": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "SnapshotRetentionStartTime": {"shape": "TStamp", "flattened": false},
      "MasterPasswordSecretArn": {"shape": "String", "flattened": false},
      "MasterPasswordSecretKmsKeyId": {"shape": "String", "flattened": false},
      "SnapshotArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotAttributeToSortBy": {"type": "string", "flattened": false},
  "SnapshotCopyGrant": {
    "type": "structure",
    "members": {
      "SnapshotCopyGrantName": {"shape": "String", "flattened": false},
      "KmsKeyId": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotCopyGrantList": {
    "type": "list",
    "member": {
      "shape": "SnapshotCopyGrant",
      "locationName": "SnapshotCopyGrant"
    },
    "flattened": false
  },
  "SnapshotCopyGrantMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "SnapshotCopyGrants": {
        "shape": "SnapshotCopyGrantList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SnapshotErrorMessage": {
    "type": "structure",
    "members": {
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SnapshotClusterIdentifier": {"shape": "String", "flattened": false},
      "FailureCode": {"shape": "String", "flattened": false},
      "FailureReason": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotIdentifierList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "String"},
    "flattened": false
  },
  "SnapshotList": {
    "type": "list",
    "member": {"shape": "Snapshot", "locationName": "Snapshot"},
    "flattened": false
  },
  "SnapshotMessage": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "String", "flattened": false},
      "Snapshots": {"shape": "SnapshotList", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotSchedule": {
    "type": "structure",
    "members": {
      "ScheduleDefinitions": {
        "shape": "ScheduleDefinitionList",
        "flattened": false
      },
      "ScheduleIdentifier": {"shape": "String", "flattened": false},
      "ScheduleDescription": {"shape": "String", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "NextInvocations": {
        "shape": "ScheduledSnapshotTimeList",
        "flattened": false
      },
      "AssociatedClusterCount": {
        "shape": "IntegerOptional",
        "flattened": false
      },
      "AssociatedClusters": {
        "shape": "AssociatedClusterList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SnapshotScheduleList": {
    "type": "list",
    "member": {"shape": "SnapshotSchedule", "locationName": "SnapshotSchedule"},
    "flattened": false
  },
  "SnapshotSortingEntity": {
    "type": "structure",
    "members": {
      "Attribute": {"shape": "SnapshotAttributeToSortBy", "flattened": false},
      "SortOrder": {"shape": "SortByOrder", "flattened": false}
    },
    "flattened": false
  },
  "SnapshotSortingEntityList": {
    "type": "list",
    "member": {
      "shape": "SnapshotSortingEntity",
      "locationName": "SnapshotSortingEntity"
    },
    "flattened": false
  },
  "SortByOrder": {"type": "string", "flattened": false},
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
  "SupportedOperation": {
    "type": "structure",
    "members": {
      "OperationName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SupportedOperationList": {
    "type": "list",
    "member": {
      "shape": "SupportedOperation",
      "locationName": "SupportedOperation"
    },
    "flattened": false
  },
  "SupportedPlatform": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SupportedPlatformsList": {
    "type": "list",
    "member": {
      "shape": "SupportedPlatform",
      "locationName": "SupportedPlatform"
    },
    "flattened": false
  },
  "TStamp": {"type": "timestamp", "flattened": false},
  "TableRestoreStatus": {
    "type": "structure",
    "members": {
      "TableRestoreRequestId": {"shape": "String", "flattened": false},
      "Status": {"shape": "TableRestoreStatusType", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "RequestTime": {"shape": "TStamp", "flattened": false},
      "ProgressInMegaBytes": {"shape": "LongOptional", "flattened": false},
      "TotalDataInMegaBytes": {"shape": "LongOptional", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "SnapshotIdentifier": {"shape": "String", "flattened": false},
      "SourceDatabaseName": {"shape": "String", "flattened": false},
      "SourceSchemaName": {"shape": "String", "flattened": false},
      "SourceTableName": {"shape": "String", "flattened": false},
      "TargetDatabaseName": {"shape": "String", "flattened": false},
      "TargetSchemaName": {"shape": "String", "flattened": false},
      "NewTableName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TableRestoreStatusList": {
    "type": "list",
    "member": {
      "shape": "TableRestoreStatus",
      "locationName": "TableRestoreStatus"
    },
    "flattened": false
  },
  "TableRestoreStatusMessage": {
    "type": "structure",
    "members": {
      "TableRestoreStatusDetails": {
        "shape": "TableRestoreStatusList",
        "flattened": false
      },
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TableRestoreStatusType": {"type": "string", "flattened": false},
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "String", "flattened": false},
      "Value": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TagKeyList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "TagKey"},
    "flattened": false
  },
  "TagList": {
    "type": "list",
    "member": {"shape": "Tag", "locationName": "Tag"},
    "flattened": false
  },
  "TagValueList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "TagValue"},
    "flattened": false
  },
  "TaggedResource": {
    "type": "structure",
    "members": {
      "Tag": {"shape": "Tag", "flattened": false},
      "ResourceName": {"shape": "String", "flattened": false},
      "ResourceType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TaggedResourceList": {
    "type": "list",
    "member": {"shape": "TaggedResource", "locationName": "TaggedResource"},
    "flattened": false
  },
  "TaggedResourceListMessage": {
    "type": "structure",
    "members": {
      "TaggedResources": {"shape": "TaggedResourceList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "TrackList": {
    "type": "list",
    "member": {"shape": "MaintenanceTrack", "locationName": "MaintenanceTrack"},
    "flattened": false
  },
  "TrackListMessage": {
    "type": "structure",
    "members": {
      "MaintenanceTracks": {"shape": "TrackList", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UpdatePartnerStatusInputMessage": {
    "type": "structure",
    "members": {
      "AccountId": {"shape": "PartnerIntegrationAccountId", "flattened": false},
      "ClusterIdentifier": {
        "shape": "PartnerIntegrationClusterIdentifier",
        "flattened": false
      },
      "DatabaseName": {
        "shape": "PartnerIntegrationDatabaseName",
        "flattened": false
      },
      "PartnerName": {
        "shape": "PartnerIntegrationPartnerName",
        "flattened": false
      },
      "Status": {"shape": "PartnerIntegrationStatus", "flattened": false},
      "StatusMessage": {
        "shape": "PartnerIntegrationStatusMessage",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateTarget": {
    "type": "structure",
    "members": {
      "MaintenanceTrackName": {"shape": "String", "flattened": false},
      "DatabaseVersion": {"shape": "String", "flattened": false},
      "SupportedOperations": {
        "shape": "SupportedOperationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UsageLimit": {
    "type": "structure",
    "members": {
      "UsageLimitId": {"shape": "String", "flattened": false},
      "ClusterIdentifier": {"shape": "String", "flattened": false},
      "FeatureType": {"shape": "UsageLimitFeatureType", "flattened": false},
      "LimitType": {"shape": "UsageLimitLimitType", "flattened": false},
      "Amount": {"shape": "Long", "flattened": false},
      "Period": {"shape": "UsageLimitPeriod", "flattened": false},
      "BreachAction": {"shape": "UsageLimitBreachAction", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "UsageLimitBreachAction": {"type": "string", "flattened": false},
  "UsageLimitFeatureType": {"type": "string", "flattened": false},
  "UsageLimitLimitType": {"type": "string", "flattened": false},
  "UsageLimitList": {
    "type": "structure",
    "members": {
      "UsageLimits": {"shape": "UsageLimits", "flattened": false},
      "Marker": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "UsageLimitPeriod": {"type": "string", "flattened": false},
  "UsageLimits": {
    "type": "list",
    "member": {"shape": "UsageLimit"},
    "flattened": false
  },
  "ValueStringList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "item"},
    "flattened": false
  },
  "VpcEndpoint": {
    "type": "structure",
    "members": {
      "VpcEndpointId": {"shape": "String", "flattened": false},
      "VpcId": {"shape": "String", "flattened": false},
      "NetworkInterfaces": {"shape": "NetworkInterfaceList", "flattened": false}
    },
    "flattened": false
  },
  "VpcEndpointsList": {
    "type": "list",
    "member": {"shape": "VpcEndpoint", "locationName": "VpcEndpoint"},
    "flattened": false
  },
  "VpcIdentifierList": {
    "type": "list",
    "member": {"shape": "String", "locationName": "VpcIdentifier"},
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
      "locationName": "VpcSecurityGroup"
    },
    "flattened": false
  },
  "ZeroETLIntegrationStatus": {"type": "string", "flattened": false}
};
