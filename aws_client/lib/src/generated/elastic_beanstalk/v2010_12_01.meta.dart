// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "ARN": {"type": "string", "flattened": false},
  "AbortEnvironmentUpdateMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "AbortableOperationInProgress": {"type": "boolean", "flattened": false},
  "ActionHistoryStatus": {"type": "string", "flattened": false},
  "ActionStatus": {"type": "string", "flattened": false},
  "ActionType": {"type": "string", "flattened": false},
  "ApplicationArn": {"type": "string", "flattened": false},
  "ApplicationDescription": {
    "type": "structure",
    "members": {
      "ApplicationArn": {"shape": "ApplicationArn", "flattened": false},
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "DateCreated": {"shape": "CreationDate", "flattened": false},
      "DateUpdated": {"shape": "UpdateDate", "flattened": false},
      "Versions": {"shape": "VersionLabelsList", "flattened": false},
      "ConfigurationTemplates": {
        "shape": "ConfigurationTemplateNamesList",
        "flattened": false
      },
      "ResourceLifecycleConfig": {
        "shape": "ApplicationResourceLifecycleConfig",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ApplicationDescriptionList": {
    "type": "list",
    "member": {"shape": "ApplicationDescription"},
    "flattened": false
  },
  "ApplicationDescriptionMessage": {
    "type": "structure",
    "members": {
      "Application": {"shape": "ApplicationDescription", "flattened": false}
    },
    "flattened": false
  },
  "ApplicationDescriptionsMessage": {
    "type": "structure",
    "members": {
      "Applications": {
        "shape": "ApplicationDescriptionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ApplicationMetrics": {
    "type": "structure",
    "members": {
      "Duration": {"shape": "NullableInteger", "flattened": false},
      "RequestCount": {"shape": "RequestCount", "flattened": false},
      "StatusCodes": {"shape": "StatusCodes", "flattened": false},
      "Latency": {"shape": "Latency", "flattened": false}
    },
    "flattened": false
  },
  "ApplicationName": {"type": "string", "flattened": false},
  "ApplicationNamesList": {
    "type": "list",
    "member": {"shape": "ApplicationName"},
    "flattened": false
  },
  "ApplicationResourceLifecycleConfig": {
    "type": "structure",
    "members": {
      "ServiceRole": {"shape": "String", "flattened": false},
      "VersionLifecycleConfig": {
        "shape": "ApplicationVersionLifecycleConfig",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ApplicationResourceLifecycleDescriptionMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "ResourceLifecycleConfig": {
        "shape": "ApplicationResourceLifecycleConfig",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ApplicationVersionArn": {"type": "string", "flattened": false},
  "ApplicationVersionDescription": {
    "type": "structure",
    "members": {
      "ApplicationVersionArn": {
        "shape": "ApplicationVersionArn",
        "flattened": false
      },
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "SourceBuildInformation": {
        "shape": "SourceBuildInformation",
        "flattened": false
      },
      "BuildArn": {"shape": "String", "flattened": false},
      "SourceBundle": {"shape": "S3Location", "flattened": false},
      "DateCreated": {"shape": "CreationDate", "flattened": false},
      "DateUpdated": {"shape": "UpdateDate", "flattened": false},
      "Status": {"shape": "ApplicationVersionStatus", "flattened": false}
    },
    "flattened": false
  },
  "ApplicationVersionDescriptionList": {
    "type": "list",
    "member": {"shape": "ApplicationVersionDescription"},
    "flattened": false
  },
  "ApplicationVersionDescriptionMessage": {
    "type": "structure",
    "members": {
      "ApplicationVersion": {
        "shape": "ApplicationVersionDescription",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ApplicationVersionDescriptionsMessage": {
    "type": "structure",
    "members": {
      "ApplicationVersions": {
        "shape": "ApplicationVersionDescriptionList",
        "flattened": false
      },
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ApplicationVersionLifecycleConfig": {
    "type": "structure",
    "members": {
      "MaxCountRule": {"shape": "MaxCountRule", "flattened": false},
      "MaxAgeRule": {"shape": "MaxAgeRule", "flattened": false}
    },
    "flattened": false
  },
  "ApplicationVersionProccess": {"type": "boolean", "flattened": false},
  "ApplicationVersionStatus": {"type": "string", "flattened": false},
  "ApplyEnvironmentManagedActionRequest": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "String", "flattened": false},
      "EnvironmentId": {"shape": "String", "flattened": false},
      "ActionId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ApplyEnvironmentManagedActionResult": {
    "type": "structure",
    "members": {
      "ActionId": {"shape": "String", "flattened": false},
      "ActionDescription": {"shape": "String", "flattened": false},
      "ActionType": {"shape": "ActionType", "flattened": false},
      "Status": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "AssociateEnvironmentOperationsRoleMessage": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "OperationsRole": {"shape": "OperationsRole", "flattened": false}
    },
    "flattened": false
  },
  "AutoCreateApplication": {"type": "boolean", "flattened": false},
  "AutoScalingGroup": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingGroupList": {
    "type": "list",
    "member": {"shape": "AutoScalingGroup"},
    "flattened": false
  },
  "AvailableSolutionStackDetailsList": {
    "type": "list",
    "member": {"shape": "SolutionStackDescription"},
    "flattened": false
  },
  "AvailableSolutionStackNamesList": {
    "type": "list",
    "member": {"shape": "SolutionStackName"},
    "flattened": false
  },
  "BoxedBoolean": {"type": "boolean", "flattened": false},
  "BoxedInt": {"type": "integer", "flattened": false},
  "BranchName": {"type": "string", "flattened": false},
  "BranchOrder": {"type": "integer", "flattened": false},
  "BuildConfiguration": {
    "type": "structure",
    "members": {
      "ArtifactName": {"shape": "String", "flattened": false},
      "CodeBuildServiceRole": {"shape": "NonEmptyString", "flattened": false},
      "ComputeType": {"shape": "ComputeType", "flattened": false},
      "Image": {"shape": "NonEmptyString", "flattened": false},
      "TimeoutInMinutes": {"shape": "BoxedInt", "flattened": false}
    },
    "flattened": false
  },
  "Builder": {
    "type": "structure",
    "members": {
      "ARN": {"shape": "ARN", "flattened": false}
    },
    "flattened": false
  },
  "CPUUtilization": {
    "type": "structure",
    "members": {
      "User": {"shape": "NullableDouble", "flattened": false},
      "Nice": {"shape": "NullableDouble", "flattened": false},
      "System": {"shape": "NullableDouble", "flattened": false},
      "Idle": {"shape": "NullableDouble", "flattened": false},
      "IOWait": {"shape": "NullableDouble", "flattened": false},
      "IRQ": {"shape": "NullableDouble", "flattened": false},
      "SoftIRQ": {"shape": "NullableDouble", "flattened": false},
      "Privileged": {"shape": "NullableDouble", "flattened": false}
    },
    "flattened": false
  },
  "Cause": {"type": "string", "flattened": false},
  "Causes": {
    "type": "list",
    "member": {"shape": "Cause"},
    "flattened": false
  },
  "CheckDNSAvailabilityMessage": {
    "type": "structure",
    "members": {
      "CNAMEPrefix": {"shape": "DNSCnamePrefix", "flattened": false}
    },
    "flattened": false
  },
  "CheckDNSAvailabilityResultMessage": {
    "type": "structure",
    "members": {
      "Available": {"shape": "CnameAvailability", "flattened": false},
      "FullyQualifiedCNAME": {"shape": "DNSCname", "flattened": false}
    },
    "flattened": false
  },
  "CnameAvailability": {"type": "boolean", "flattened": false},
  "ComposeEnvironmentsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "GroupName": {"shape": "GroupName", "flattened": false},
      "VersionLabels": {"shape": "VersionLabels", "flattened": false}
    },
    "flattened": false
  },
  "ComputeType": {"type": "string", "flattened": false},
  "ConfigurationDeploymentStatus": {"type": "string", "flattened": false},
  "ConfigurationOptionDefaultValue": {"type": "string", "flattened": false},
  "ConfigurationOptionDescription": {
    "type": "structure",
    "members": {
      "Namespace": {"shape": "OptionNamespace", "flattened": false},
      "Name": {"shape": "ConfigurationOptionName", "flattened": false},
      "DefaultValue": {
        "shape": "ConfigurationOptionDefaultValue",
        "flattened": false
      },
      "ChangeSeverity": {
        "shape": "ConfigurationOptionSeverity",
        "flattened": false
      },
      "UserDefined": {"shape": "UserDefinedOption", "flattened": false},
      "ValueType": {
        "shape": "ConfigurationOptionValueType",
        "flattened": false
      },
      "ValueOptions": {
        "shape": "ConfigurationOptionPossibleValues",
        "flattened": false
      },
      "MinValue": {"shape": "OptionRestrictionMinValue", "flattened": false},
      "MaxValue": {"shape": "OptionRestrictionMaxValue", "flattened": false},
      "MaxLength": {"shape": "OptionRestrictionMaxLength", "flattened": false},
      "Regex": {"shape": "OptionRestrictionRegex", "flattened": false}
    },
    "flattened": false
  },
  "ConfigurationOptionDescriptionsList": {
    "type": "list",
    "member": {"shape": "ConfigurationOptionDescription"},
    "flattened": false
  },
  "ConfigurationOptionName": {"type": "string", "flattened": false},
  "ConfigurationOptionPossibleValue": {"type": "string", "flattened": false},
  "ConfigurationOptionPossibleValues": {
    "type": "list",
    "member": {"shape": "ConfigurationOptionPossibleValue"},
    "flattened": false
  },
  "ConfigurationOptionSetting": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "ResourceName", "flattened": false},
      "Namespace": {"shape": "OptionNamespace", "flattened": false},
      "OptionName": {"shape": "ConfigurationOptionName", "flattened": false},
      "Value": {"shape": "ConfigurationOptionValue", "flattened": false}
    },
    "flattened": false
  },
  "ConfigurationOptionSettingsList": {
    "type": "list",
    "member": {"shape": "ConfigurationOptionSetting"},
    "flattened": false
  },
  "ConfigurationOptionSeverity": {"type": "string", "flattened": false},
  "ConfigurationOptionValue": {"type": "string", "flattened": false},
  "ConfigurationOptionValueType": {"type": "string", "flattened": false},
  "ConfigurationOptionsDescription": {
    "type": "structure",
    "members": {
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "Options": {
        "shape": "ConfigurationOptionDescriptionsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ConfigurationSettingsDescription": {
    "type": "structure",
    "members": {
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "Description": {"shape": "Description", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "DeploymentStatus": {
        "shape": "ConfigurationDeploymentStatus",
        "flattened": false
      },
      "DateCreated": {"shape": "CreationDate", "flattened": false},
      "DateUpdated": {"shape": "UpdateDate", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ConfigurationSettingsDescriptionList": {
    "type": "list",
    "member": {"shape": "ConfigurationSettingsDescription"},
    "flattened": false
  },
  "ConfigurationSettingsDescriptions": {
    "type": "structure",
    "members": {
      "ConfigurationSettings": {
        "shape": "ConfigurationSettingsDescriptionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ConfigurationSettingsValidationMessages": {
    "type": "structure",
    "members": {
      "Messages": {"shape": "ValidationMessagesList", "flattened": false}
    },
    "flattened": false
  },
  "ConfigurationTemplateName": {"type": "string", "flattened": false},
  "ConfigurationTemplateNamesList": {
    "type": "list",
    "member": {"shape": "ConfigurationTemplateName"},
    "flattened": false
  },
  "CreateApplicationMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "ResourceLifecycleConfig": {
        "shape": "ApplicationResourceLifecycleConfig",
        "flattened": false
      },
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "CreateApplicationVersionMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "SourceBuildInformation": {
        "shape": "SourceBuildInformation",
        "flattened": false
      },
      "SourceBundle": {"shape": "S3Location", "flattened": false},
      "BuildConfiguration": {"shape": "BuildConfiguration", "flattened": false},
      "AutoCreateApplication": {
        "shape": "AutoCreateApplication",
        "flattened": false
      },
      "Process": {"shape": "ApplicationVersionProccess", "flattened": false},
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "CreateConfigurationTemplateMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "SourceConfiguration": {
        "shape": "SourceConfiguration",
        "flattened": false
      },
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      },
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "CreateEnvironmentMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "GroupName": {"shape": "GroupName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "CNAMEPrefix": {"shape": "DNSCnamePrefix", "flattened": false},
      "Tier": {"shape": "EnvironmentTier", "flattened": false},
      "Tags": {"shape": "Tags", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      },
      "OptionsToRemove": {"shape": "OptionsSpecifierList", "flattened": false},
      "OperationsRole": {"shape": "OperationsRole", "flattened": false}
    },
    "flattened": false
  },
  "CreatePlatformVersionRequest": {
    "type": "structure",
    "members": {
      "PlatformName": {"shape": "PlatformName", "flattened": false},
      "PlatformVersion": {"shape": "PlatformVersion", "flattened": false},
      "PlatformDefinitionBundle": {"shape": "S3Location", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      },
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "CreatePlatformVersionResult": {
    "type": "structure",
    "members": {
      "PlatformSummary": {"shape": "PlatformSummary", "flattened": false},
      "Builder": {"shape": "Builder", "flattened": false}
    },
    "flattened": false
  },
  "CreateStorageLocationResultMessage": {
    "type": "structure",
    "members": {
      "S3Bucket": {"shape": "S3Bucket", "flattened": false}
    },
    "flattened": false
  },
  "CreationDate": {"type": "timestamp", "flattened": false},
  "CustomAmi": {
    "type": "structure",
    "members": {
      "VirtualizationType": {"shape": "VirtualizationType", "flattened": false},
      "ImageId": {"shape": "ImageId", "flattened": false}
    },
    "flattened": false
  },
  "CustomAmiList": {
    "type": "list",
    "member": {"shape": "CustomAmi"},
    "flattened": false
  },
  "DNSCname": {"type": "string", "flattened": false},
  "DNSCnamePrefix": {"type": "string", "flattened": false},
  "DeleteApplicationMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TerminateEnvByForce": {"shape": "TerminateEnvForce", "flattened": false}
    },
    "flattened": false
  },
  "DeleteApplicationVersionMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "DeleteSourceBundle": {"shape": "DeleteSourceBundle", "flattened": false}
    },
    "flattened": false
  },
  "DeleteConfigurationTemplateMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {"shape": "ConfigurationTemplateName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteEnvironmentConfigurationMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "DeletePlatformVersionRequest": {
    "type": "structure",
    "members": {
      "PlatformArn": {"shape": "PlatformArn", "flattened": false}
    },
    "flattened": false
  },
  "DeletePlatformVersionResult": {
    "type": "structure",
    "members": {
      "PlatformSummary": {"shape": "PlatformSummary", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSourceBundle": {"type": "boolean", "flattened": false},
  "Deployment": {
    "type": "structure",
    "members": {
      "VersionLabel": {"shape": "String", "flattened": false},
      "DeploymentId": {"shape": "NullableLong", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "DeploymentTime": {"shape": "DeploymentTimestamp", "flattened": false}
    },
    "flattened": false
  },
  "DeploymentTimestamp": {"type": "timestamp", "flattened": false},
  "DescribeAccountAttributesResult": {
    "type": "structure",
    "members": {
      "ResourceQuotas": {"shape": "ResourceQuotas", "flattened": false}
    },
    "flattened": false
  },
  "DescribeApplicationVersionsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabels": {"shape": "VersionLabelsList", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "DescribeApplicationsMessage": {
    "type": "structure",
    "members": {
      "ApplicationNames": {"shape": "ApplicationNamesList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeConfigurationOptionsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "Options": {"shape": "OptionsSpecifierList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeConfigurationSettingsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentHealthRequest": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "AttributeNames": {
        "shape": "EnvironmentHealthAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeEnvironmentHealthResult": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "HealthStatus": {"shape": "String", "flattened": false},
      "Status": {"shape": "EnvironmentHealth", "flattened": false},
      "Color": {"shape": "String", "flattened": false},
      "Causes": {"shape": "Causes", "flattened": false},
      "ApplicationMetrics": {"shape": "ApplicationMetrics", "flattened": false},
      "InstancesHealth": {"shape": "InstanceHealthSummary", "flattened": false},
      "RefreshedAt": {"shape": "RefreshedAt", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentManagedActionHistoryRequest": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false},
      "MaxItems": {"shape": "ManagedActionHistoryMaxItems", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentManagedActionHistoryResult": {
    "type": "structure",
    "members": {
      "ManagedActionHistoryItems": {
        "shape": "ManagedActionHistoryItems",
        "flattened": false
      },
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentManagedActionsRequest": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "String", "flattened": false},
      "EnvironmentId": {"shape": "String", "flattened": false},
      "Status": {"shape": "ActionStatus", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentManagedActionsResult": {
    "type": "structure",
    "members": {
      "ManagedActions": {"shape": "ManagedActions", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentResourcesMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEnvironmentsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "EnvironmentIds": {"shape": "EnvironmentIdList", "flattened": false},
      "EnvironmentNames": {"shape": "EnvironmentNamesList", "flattened": false},
      "IncludeDeleted": {"shape": "IncludeDeleted", "flattened": false},
      "IncludedDeletedBackTo": {
        "shape": "IncludeDeletedBackTo",
        "flattened": false
      },
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEventsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "RequestId": {"shape": "RequestId", "flattened": false},
      "Severity": {"shape": "EventSeverity", "flattened": false},
      "StartTime": {"shape": "TimeFilterStart", "flattened": false},
      "EndTime": {"shape": "TimeFilterEnd", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInstancesHealthRequest": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "AttributeNames": {
        "shape": "InstancesHealthAttributes",
        "flattened": false
      },
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInstancesHealthResult": {
    "type": "structure",
    "members": {
      "InstanceHealthList": {"shape": "InstanceHealthList", "flattened": false},
      "RefreshedAt": {"shape": "RefreshedAt", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "DescribePlatformVersionRequest": {
    "type": "structure",
    "members": {
      "PlatformArn": {"shape": "PlatformArn", "flattened": false}
    },
    "flattened": false
  },
  "DescribePlatformVersionResult": {
    "type": "structure",
    "members": {
      "PlatformDescription": {
        "shape": "PlatformDescription",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Description": {"type": "string", "flattened": false},
  "DisassociateEnvironmentOperationsRoleMessage": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "Ec2InstanceId": {"type": "string", "flattened": false},
  "EndpointURL": {"type": "string", "flattened": false},
  "EnvironmentArn": {"type": "string", "flattened": false},
  "EnvironmentDescription": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "Description": {"shape": "Description", "flattened": false},
      "EndpointURL": {"shape": "EndpointURL", "flattened": false},
      "CNAME": {"shape": "DNSCname", "flattened": false},
      "DateCreated": {"shape": "CreationDate", "flattened": false},
      "DateUpdated": {"shape": "UpdateDate", "flattened": false},
      "Status": {"shape": "EnvironmentStatus", "flattened": false},
      "AbortableOperationInProgress": {
        "shape": "AbortableOperationInProgress",
        "flattened": false
      },
      "Health": {"shape": "EnvironmentHealth", "flattened": false},
      "HealthStatus": {"shape": "EnvironmentHealthStatus", "flattened": false},
      "Resources": {
        "shape": "EnvironmentResourcesDescription",
        "flattened": false
      },
      "Tier": {"shape": "EnvironmentTier", "flattened": false},
      "EnvironmentLinks": {"shape": "EnvironmentLinks", "flattened": false},
      "EnvironmentArn": {"shape": "EnvironmentArn", "flattened": false},
      "OperationsRole": {"shape": "OperationsRole", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentDescriptionsList": {
    "type": "list",
    "member": {"shape": "EnvironmentDescription"},
    "flattened": false
  },
  "EnvironmentDescriptionsMessage": {
    "type": "structure",
    "members": {
      "Environments": {
        "shape": "EnvironmentDescriptionsList",
        "flattened": false
      },
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentHealth": {"type": "string", "flattened": false},
  "EnvironmentHealthAttribute": {"type": "string", "flattened": false},
  "EnvironmentHealthAttributes": {
    "type": "list",
    "member": {"shape": "EnvironmentHealthAttribute"},
    "flattened": false
  },
  "EnvironmentHealthStatus": {"type": "string", "flattened": false},
  "EnvironmentId": {"type": "string", "flattened": false},
  "EnvironmentIdList": {
    "type": "list",
    "member": {"shape": "EnvironmentId"},
    "flattened": false
  },
  "EnvironmentInfoDescription": {
    "type": "structure",
    "members": {
      "InfoType": {"shape": "EnvironmentInfoType", "flattened": false},
      "Ec2InstanceId": {"shape": "Ec2InstanceId", "flattened": false},
      "SampleTimestamp": {"shape": "SampleTimestamp", "flattened": false},
      "Message": {"shape": "Message", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentInfoDescriptionList": {
    "type": "list",
    "member": {"shape": "EnvironmentInfoDescription"},
    "flattened": false
  },
  "EnvironmentInfoType": {"type": "string", "flattened": false},
  "EnvironmentLink": {
    "type": "structure",
    "members": {
      "LinkName": {"shape": "String", "flattened": false},
      "EnvironmentName": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentLinks": {
    "type": "list",
    "member": {"shape": "EnvironmentLink"},
    "flattened": false
  },
  "EnvironmentName": {"type": "string", "flattened": false},
  "EnvironmentNamesList": {
    "type": "list",
    "member": {"shape": "EnvironmentName"},
    "flattened": false
  },
  "EnvironmentResourceDescription": {
    "type": "structure",
    "members": {
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "AutoScalingGroups": {
        "shape": "AutoScalingGroupList",
        "flattened": false
      },
      "Instances": {"shape": "InstanceList", "flattened": false},
      "LaunchConfigurations": {
        "shape": "LaunchConfigurationList",
        "flattened": false
      },
      "LaunchTemplates": {"shape": "LaunchTemplateList", "flattened": false},
      "LoadBalancers": {"shape": "LoadBalancerList", "flattened": false},
      "Triggers": {"shape": "TriggerList", "flattened": false},
      "Queues": {"shape": "QueueList", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentResourceDescriptionsMessage": {
    "type": "structure",
    "members": {
      "EnvironmentResources": {
        "shape": "EnvironmentResourceDescription",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EnvironmentResourcesDescription": {
    "type": "structure",
    "members": {
      "LoadBalancer": {"shape": "LoadBalancerDescription", "flattened": false}
    },
    "flattened": false
  },
  "EnvironmentStatus": {"type": "string", "flattened": false},
  "EnvironmentTier": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Type": {"shape": "String", "flattened": false},
      "Version": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "EventDate": {"type": "timestamp", "flattened": false},
  "EventDescription": {
    "type": "structure",
    "members": {
      "EventDate": {"shape": "EventDate", "flattened": false},
      "Message": {"shape": "EventMessage", "flattened": false},
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "RequestId": {"shape": "RequestId", "flattened": false},
      "Severity": {"shape": "EventSeverity", "flattened": false}
    },
    "flattened": false
  },
  "EventDescriptionList": {
    "type": "list",
    "member": {"shape": "EventDescription"},
    "flattened": false
  },
  "EventDescriptionsMessage": {
    "type": "structure",
    "members": {
      "Events": {"shape": "EventDescriptionList", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "EventMessage": {"type": "string", "flattened": false},
  "EventSeverity": {"type": "string", "flattened": false},
  "FailureType": {"type": "string", "flattened": false},
  "FileTypeExtension": {"type": "string", "flattened": false},
  "ForceTerminate": {"type": "boolean", "flattened": false},
  "GroupName": {"type": "string", "flattened": false},
  "ImageId": {"type": "string", "flattened": false},
  "IncludeDeleted": {"type": "boolean", "flattened": false},
  "IncludeDeletedBackTo": {"type": "timestamp", "flattened": false},
  "Instance": {
    "type": "structure",
    "members": {
      "Id": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "InstanceHealthList": {
    "type": "list",
    "member": {"shape": "SingleInstanceHealth"},
    "flattened": false
  },
  "InstanceHealthSummary": {
    "type": "structure",
    "members": {
      "NoData": {"shape": "NullableInteger", "flattened": false},
      "Unknown": {"shape": "NullableInteger", "flattened": false},
      "Pending": {"shape": "NullableInteger", "flattened": false},
      "Ok": {"shape": "NullableInteger", "flattened": false},
      "Info": {"shape": "NullableInteger", "flattened": false},
      "Warning": {"shape": "NullableInteger", "flattened": false},
      "Degraded": {"shape": "NullableInteger", "flattened": false},
      "Severe": {"shape": "NullableInteger", "flattened": false}
    },
    "flattened": false
  },
  "InstanceId": {"type": "string", "flattened": false},
  "InstanceList": {
    "type": "list",
    "member": {"shape": "Instance"},
    "flattened": false
  },
  "InstancesHealthAttribute": {"type": "string", "flattened": false},
  "InstancesHealthAttributes": {
    "type": "list",
    "member": {"shape": "InstancesHealthAttribute"},
    "flattened": false
  },
  "Integer": {"type": "integer", "flattened": false},
  "Latency": {
    "type": "structure",
    "members": {
      "P999": {"shape": "NullableDouble", "flattened": false},
      "P99": {"shape": "NullableDouble", "flattened": false},
      "P95": {"shape": "NullableDouble", "flattened": false},
      "P90": {"shape": "NullableDouble", "flattened": false},
      "P85": {"shape": "NullableDouble", "flattened": false},
      "P75": {"shape": "NullableDouble", "flattened": false},
      "P50": {"shape": "NullableDouble", "flattened": false},
      "P10": {"shape": "NullableDouble", "flattened": false}
    },
    "flattened": false
  },
  "LaunchConfiguration": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "LaunchConfigurationList": {
    "type": "list",
    "member": {"shape": "LaunchConfiguration"},
    "flattened": false
  },
  "LaunchTemplate": {
    "type": "structure",
    "members": {
      "Id": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "LaunchTemplateList": {
    "type": "list",
    "member": {"shape": "LaunchTemplate"},
    "flattened": false
  },
  "LaunchedAt": {"type": "timestamp", "flattened": false},
  "ListAvailableSolutionStacksResultMessage": {
    "type": "structure",
    "members": {
      "SolutionStacks": {
        "shape": "AvailableSolutionStackNamesList",
        "flattened": false
      },
      "SolutionStackDetails": {
        "shape": "AvailableSolutionStackDetailsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListPlatformBranchesRequest": {
    "type": "structure",
    "members": {
      "Filters": {"shape": "SearchFilters", "flattened": false},
      "MaxRecords": {"shape": "PlatformBranchMaxRecords", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ListPlatformBranchesResult": {
    "type": "structure",
    "members": {
      "PlatformBranchSummaryList": {
        "shape": "PlatformBranchSummaryList",
        "flattened": false
      },
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ListPlatformVersionsRequest": {
    "type": "structure",
    "members": {
      "Filters": {"shape": "PlatformFilters", "flattened": false},
      "MaxRecords": {"shape": "PlatformMaxRecords", "flattened": false},
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ListPlatformVersionsResult": {
    "type": "structure",
    "members": {
      "PlatformSummaryList": {
        "shape": "PlatformSummaryList",
        "flattened": false
      },
      "NextToken": {"shape": "Token", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "ResourceArn", "flattened": false}
    },
    "flattened": false
  },
  "Listener": {
    "type": "structure",
    "members": {
      "Protocol": {"shape": "String", "flattened": false},
      "Port": {"shape": "Integer", "flattened": false}
    },
    "flattened": false
  },
  "LoadAverage": {
    "type": "list",
    "member": {"shape": "LoadAverageValue"},
    "flattened": false
  },
  "LoadAverageValue": {"type": "double", "flattened": false},
  "LoadBalancer": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerDescription": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "String", "flattened": false},
      "Domain": {"shape": "String", "flattened": false},
      "Listeners": {
        "shape": "LoadBalancerListenersDescription",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LoadBalancerList": {
    "type": "list",
    "member": {"shape": "LoadBalancer"},
    "flattened": false
  },
  "LoadBalancerListenersDescription": {
    "type": "list",
    "member": {"shape": "Listener"},
    "flattened": false
  },
  "Maintainer": {"type": "string", "flattened": false},
  "ManagedAction": {
    "type": "structure",
    "members": {
      "ActionId": {"shape": "String", "flattened": false},
      "ActionDescription": {"shape": "String", "flattened": false},
      "ActionType": {"shape": "ActionType", "flattened": false},
      "Status": {"shape": "ActionStatus", "flattened": false},
      "WindowStartTime": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "ManagedActionHistoryItem": {
    "type": "structure",
    "members": {
      "ActionId": {"shape": "String", "flattened": false},
      "ActionType": {"shape": "ActionType", "flattened": false},
      "ActionDescription": {"shape": "String", "flattened": false},
      "FailureType": {"shape": "FailureType", "flattened": false},
      "Status": {"shape": "ActionHistoryStatus", "flattened": false},
      "FailureDescription": {"shape": "String", "flattened": false},
      "ExecutedTime": {"shape": "Timestamp", "flattened": false},
      "FinishedTime": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "ManagedActionHistoryItems": {
    "type": "list",
    "member": {"shape": "ManagedActionHistoryItem"},
    "flattened": false
  },
  "ManagedActionHistoryMaxItems": {"type": "integer", "flattened": false},
  "ManagedActions": {
    "type": "list",
    "member": {"shape": "ManagedAction"},
    "flattened": false
  },
  "MaxAgeRule": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "BoxedBoolean", "flattened": false},
      "MaxAgeInDays": {"shape": "BoxedInt", "flattened": false},
      "DeleteSourceFromS3": {"shape": "BoxedBoolean", "flattened": false}
    },
    "flattened": false
  },
  "MaxCountRule": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "BoxedBoolean", "flattened": false},
      "MaxCount": {"shape": "BoxedInt", "flattened": false},
      "DeleteSourceFromS3": {"shape": "BoxedBoolean", "flattened": false}
    },
    "flattened": false
  },
  "MaxRecords": {"type": "integer", "flattened": false},
  "Message": {"type": "string", "flattened": false},
  "NextToken": {"type": "string", "flattened": false},
  "NonEmptyString": {"type": "string", "flattened": false},
  "NullableDouble": {"type": "double", "flattened": false},
  "NullableInteger": {"type": "integer", "flattened": false},
  "NullableLong": {"type": "long", "flattened": false},
  "OperatingSystemName": {"type": "string", "flattened": false},
  "OperatingSystemVersion": {"type": "string", "flattened": false},
  "OperationsRole": {"type": "string", "flattened": false},
  "OptionNamespace": {"type": "string", "flattened": false},
  "OptionRestrictionMaxLength": {"type": "integer", "flattened": false},
  "OptionRestrictionMaxValue": {"type": "integer", "flattened": false},
  "OptionRestrictionMinValue": {"type": "integer", "flattened": false},
  "OptionRestrictionRegex": {
    "type": "structure",
    "members": {
      "Pattern": {"shape": "RegexPattern", "flattened": false},
      "Label": {"shape": "RegexLabel", "flattened": false}
    },
    "flattened": false
  },
  "OptionSpecification": {
    "type": "structure",
    "members": {
      "ResourceName": {"shape": "ResourceName", "flattened": false},
      "Namespace": {"shape": "OptionNamespace", "flattened": false},
      "OptionName": {"shape": "ConfigurationOptionName", "flattened": false}
    },
    "flattened": false
  },
  "OptionsSpecifierList": {
    "type": "list",
    "member": {"shape": "OptionSpecification"},
    "flattened": false
  },
  "PlatformArn": {"type": "string", "flattened": false},
  "PlatformBranchLifecycleState": {"type": "string", "flattened": false},
  "PlatformBranchMaxRecords": {"type": "integer", "flattened": false},
  "PlatformBranchSummary": {
    "type": "structure",
    "members": {
      "PlatformName": {"shape": "PlatformName", "flattened": false},
      "BranchName": {"shape": "BranchName", "flattened": false},
      "LifecycleState": {
        "shape": "PlatformBranchLifecycleState",
        "flattened": false
      },
      "BranchOrder": {"shape": "BranchOrder", "flattened": false},
      "SupportedTierList": {"shape": "SupportedTierList", "flattened": false}
    },
    "flattened": false
  },
  "PlatformBranchSummaryList": {
    "type": "list",
    "member": {"shape": "PlatformBranchSummary"},
    "flattened": false
  },
  "PlatformCategory": {"type": "string", "flattened": false},
  "PlatformDescription": {
    "type": "structure",
    "members": {
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "PlatformOwner": {"shape": "PlatformOwner", "flattened": false},
      "PlatformName": {"shape": "PlatformName", "flattened": false},
      "PlatformVersion": {"shape": "PlatformVersion", "flattened": false},
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformStatus": {"shape": "PlatformStatus", "flattened": false},
      "DateCreated": {"shape": "CreationDate", "flattened": false},
      "DateUpdated": {"shape": "UpdateDate", "flattened": false},
      "PlatformCategory": {"shape": "PlatformCategory", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "Maintainer": {"shape": "Maintainer", "flattened": false},
      "OperatingSystemName": {
        "shape": "OperatingSystemName",
        "flattened": false
      },
      "OperatingSystemVersion": {
        "shape": "OperatingSystemVersion",
        "flattened": false
      },
      "ProgrammingLanguages": {
        "shape": "PlatformProgrammingLanguages",
        "flattened": false
      },
      "Frameworks": {"shape": "PlatformFrameworks", "flattened": false},
      "CustomAmiList": {"shape": "CustomAmiList", "flattened": false},
      "SupportedTierList": {"shape": "SupportedTierList", "flattened": false},
      "SupportedAddonList": {"shape": "SupportedAddonList", "flattened": false},
      "PlatformLifecycleState": {
        "shape": "PlatformLifecycleState",
        "flattened": false
      },
      "PlatformBranchName": {"shape": "BranchName", "flattened": false},
      "PlatformBranchLifecycleState": {
        "shape": "PlatformBranchLifecycleState",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PlatformFilter": {
    "type": "structure",
    "members": {
      "Type": {"shape": "PlatformFilterType", "flattened": false},
      "Operator": {"shape": "PlatformFilterOperator", "flattened": false},
      "Values": {"shape": "PlatformFilterValueList", "flattened": false}
    },
    "flattened": false
  },
  "PlatformFilterOperator": {"type": "string", "flattened": false},
  "PlatformFilterType": {"type": "string", "flattened": false},
  "PlatformFilterValue": {"type": "string", "flattened": false},
  "PlatformFilterValueList": {
    "type": "list",
    "member": {"shape": "PlatformFilterValue"},
    "flattened": false
  },
  "PlatformFilters": {
    "type": "list",
    "member": {"shape": "PlatformFilter"},
    "flattened": false
  },
  "PlatformFramework": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Version": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PlatformFrameworks": {
    "type": "list",
    "member": {"shape": "PlatformFramework"},
    "flattened": false
  },
  "PlatformLifecycleState": {"type": "string", "flattened": false},
  "PlatformMaxRecords": {"type": "integer", "flattened": false},
  "PlatformName": {"type": "string", "flattened": false},
  "PlatformOwner": {"type": "string", "flattened": false},
  "PlatformProgrammingLanguage": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Version": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PlatformProgrammingLanguages": {
    "type": "list",
    "member": {"shape": "PlatformProgrammingLanguage"},
    "flattened": false
  },
  "PlatformStatus": {"type": "string", "flattened": false},
  "PlatformSummary": {
    "type": "structure",
    "members": {
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "PlatformOwner": {"shape": "PlatformOwner", "flattened": false},
      "PlatformStatus": {"shape": "PlatformStatus", "flattened": false},
      "PlatformCategory": {"shape": "PlatformCategory", "flattened": false},
      "OperatingSystemName": {
        "shape": "OperatingSystemName",
        "flattened": false
      },
      "OperatingSystemVersion": {
        "shape": "OperatingSystemVersion",
        "flattened": false
      },
      "SupportedTierList": {"shape": "SupportedTierList", "flattened": false},
      "SupportedAddonList": {"shape": "SupportedAddonList", "flattened": false},
      "PlatformLifecycleState": {
        "shape": "PlatformLifecycleState",
        "flattened": false
      },
      "PlatformVersion": {"shape": "PlatformVersion", "flattened": false},
      "PlatformBranchName": {"shape": "BranchName", "flattened": false},
      "PlatformBranchLifecycleState": {
        "shape": "PlatformBranchLifecycleState",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PlatformSummaryList": {
    "type": "list",
    "member": {"shape": "PlatformSummary"},
    "flattened": false
  },
  "PlatformVersion": {"type": "string", "flattened": false},
  "Queue": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "URL": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "QueueList": {
    "type": "list",
    "member": {"shape": "Queue"},
    "flattened": false
  },
  "RebuildEnvironmentMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "RefreshedAt": {"type": "timestamp", "flattened": false},
  "RegexLabel": {"type": "string", "flattened": false},
  "RegexPattern": {"type": "string", "flattened": false},
  "RequestCount": {"type": "integer", "flattened": false},
  "RequestEnvironmentInfoMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "InfoType": {"shape": "EnvironmentInfoType", "flattened": false}
    },
    "flattened": false
  },
  "RequestId": {"type": "string", "flattened": false},
  "ResourceArn": {"type": "string", "flattened": false},
  "ResourceId": {"type": "string", "flattened": false},
  "ResourceName": {"type": "string", "flattened": false},
  "ResourceQuota": {
    "type": "structure",
    "members": {
      "Maximum": {"shape": "BoxedInt", "flattened": false}
    },
    "flattened": false
  },
  "ResourceQuotas": {
    "type": "structure",
    "members": {
      "ApplicationQuota": {"shape": "ResourceQuota", "flattened": false},
      "ApplicationVersionQuota": {"shape": "ResourceQuota", "flattened": false},
      "EnvironmentQuota": {"shape": "ResourceQuota", "flattened": false},
      "ConfigurationTemplateQuota": {
        "shape": "ResourceQuota",
        "flattened": false
      },
      "CustomPlatformQuota": {"shape": "ResourceQuota", "flattened": false}
    },
    "flattened": false
  },
  "ResourceTagsDescriptionMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "ResourceArn", "flattened": false},
      "ResourceTags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "RestartAppServerMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false}
    },
    "flattened": false
  },
  "RetrieveEnvironmentInfoMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "InfoType": {"shape": "EnvironmentInfoType", "flattened": false}
    },
    "flattened": false
  },
  "RetrieveEnvironmentInfoResultMessage": {
    "type": "structure",
    "members": {
      "EnvironmentInfo": {
        "shape": "EnvironmentInfoDescriptionList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "S3Bucket": {"type": "string", "flattened": false},
  "S3Key": {"type": "string", "flattened": false},
  "S3Location": {
    "type": "structure",
    "members": {
      "S3Bucket": {"shape": "S3Bucket", "flattened": false},
      "S3Key": {"shape": "S3Key", "flattened": false}
    },
    "flattened": false
  },
  "SampleTimestamp": {"type": "timestamp", "flattened": false},
  "SearchFilter": {
    "type": "structure",
    "members": {
      "Attribute": {"shape": "SearchFilterAttribute", "flattened": false},
      "Operator": {"shape": "SearchFilterOperator", "flattened": false},
      "Values": {"shape": "SearchFilterValues", "flattened": false}
    },
    "flattened": false
  },
  "SearchFilterAttribute": {"type": "string", "flattened": false},
  "SearchFilterOperator": {"type": "string", "flattened": false},
  "SearchFilterValue": {"type": "string", "flattened": false},
  "SearchFilterValues": {
    "type": "list",
    "member": {"shape": "SearchFilterValue"},
    "flattened": false
  },
  "SearchFilters": {
    "type": "list",
    "member": {"shape": "SearchFilter"},
    "flattened": false
  },
  "SingleInstanceHealth": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "InstanceId", "flattened": false},
      "HealthStatus": {"shape": "String", "flattened": false},
      "Color": {"shape": "String", "flattened": false},
      "Causes": {"shape": "Causes", "flattened": false},
      "LaunchedAt": {"shape": "LaunchedAt", "flattened": false},
      "ApplicationMetrics": {"shape": "ApplicationMetrics", "flattened": false},
      "System": {"shape": "SystemStatus", "flattened": false},
      "Deployment": {"shape": "Deployment", "flattened": false},
      "AvailabilityZone": {"shape": "String", "flattened": false},
      "InstanceType": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "SolutionStackDescription": {
    "type": "structure",
    "members": {
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PermittedFileTypes": {
        "shape": "SolutionStackFileTypeList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SolutionStackFileTypeList": {
    "type": "list",
    "member": {"shape": "FileTypeExtension"},
    "flattened": false
  },
  "SolutionStackName": {"type": "string", "flattened": false},
  "SourceBuildInformation": {
    "type": "structure",
    "members": {
      "SourceType": {"shape": "SourceType", "flattened": false},
      "SourceRepository": {"shape": "SourceRepository", "flattened": false},
      "SourceLocation": {"shape": "SourceLocation", "flattened": false}
    },
    "flattened": false
  },
  "SourceConfiguration": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {"shape": "ConfigurationTemplateName", "flattened": false}
    },
    "flattened": false
  },
  "SourceLocation": {"type": "string", "flattened": false},
  "SourceRepository": {"type": "string", "flattened": false},
  "SourceType": {"type": "string", "flattened": false},
  "StatusCodes": {
    "type": "structure",
    "members": {
      "Status2xx": {"shape": "NullableInteger", "flattened": false},
      "Status3xx": {"shape": "NullableInteger", "flattened": false},
      "Status4xx": {"shape": "NullableInteger", "flattened": false},
      "Status5xx": {"shape": "NullableInteger", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "SupportedAddon": {"type": "string", "flattened": false},
  "SupportedAddonList": {
    "type": "list",
    "member": {"shape": "SupportedAddon"},
    "flattened": false
  },
  "SupportedTier": {"type": "string", "flattened": false},
  "SupportedTierList": {
    "type": "list",
    "member": {"shape": "SupportedTier"},
    "flattened": false
  },
  "SwapEnvironmentCNAMEsMessage": {
    "type": "structure",
    "members": {
      "SourceEnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "SourceEnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "DestinationEnvironmentId": {
        "shape": "EnvironmentId",
        "flattened": false
      },
      "DestinationEnvironmentName": {
        "shape": "EnvironmentName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SystemStatus": {
    "type": "structure",
    "members": {
      "CPUUtilization": {"shape": "CPUUtilization", "flattened": false},
      "LoadAverage": {"shape": "LoadAverage", "flattened": false}
    },
    "flattened": false
  },
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "TagKey", "flattened": false},
      "Value": {"shape": "TagValue", "flattened": false}
    },
    "flattened": false
  },
  "TagKey": {"type": "string", "flattened": false},
  "TagKeyList": {
    "type": "list",
    "member": {"shape": "TagKey"},
    "flattened": false
  },
  "TagList": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "TagValue": {"type": "string", "flattened": false},
  "Tags": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "TerminateEnvForce": {"type": "boolean", "flattened": false},
  "TerminateEnvironmentMessage": {
    "type": "structure",
    "members": {
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "TerminateResources": {
        "shape": "TerminateEnvironmentResources",
        "flattened": false
      },
      "ForceTerminate": {"shape": "ForceTerminate", "flattened": false}
    },
    "flattened": false
  },
  "TerminateEnvironmentResources": {"type": "boolean", "flattened": false},
  "TimeFilterEnd": {"type": "timestamp", "flattened": false},
  "TimeFilterStart": {"type": "timestamp", "flattened": false},
  "Timestamp": {"type": "timestamp", "flattened": false},
  "Token": {"type": "string", "flattened": false},
  "Trigger": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ResourceId", "flattened": false}
    },
    "flattened": false
  },
  "TriggerList": {
    "type": "list",
    "member": {"shape": "Trigger"},
    "flattened": false
  },
  "UpdateApplicationMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false}
    },
    "flattened": false
  },
  "UpdateApplicationResourceLifecycleMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "ResourceLifecycleConfig": {
        "shape": "ApplicationResourceLifecycleConfig",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateApplicationVersionMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "Description": {"shape": "Description", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationTemplateMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "Description": {"shape": "Description", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      },
      "OptionsToRemove": {"shape": "OptionsSpecifierList", "flattened": false}
    },
    "flattened": false
  },
  "UpdateDate": {"type": "timestamp", "flattened": false},
  "UpdateEnvironmentMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "EnvironmentId": {"shape": "EnvironmentId", "flattened": false},
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "GroupName": {"shape": "GroupName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "Tier": {"shape": "EnvironmentTier", "flattened": false},
      "VersionLabel": {"shape": "VersionLabel", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "SolutionStackName": {"shape": "SolutionStackName", "flattened": false},
      "PlatformArn": {"shape": "PlatformArn", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      },
      "OptionsToRemove": {"shape": "OptionsSpecifierList", "flattened": false}
    },
    "flattened": false
  },
  "UpdateTagsForResourceMessage": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "ResourceArn", "flattened": false},
      "TagsToAdd": {"shape": "TagList", "flattened": false},
      "TagsToRemove": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  },
  "UserDefinedOption": {"type": "boolean", "flattened": false},
  "ValidateConfigurationSettingsMessage": {
    "type": "structure",
    "members": {
      "ApplicationName": {"shape": "ApplicationName", "flattened": false},
      "TemplateName": {
        "shape": "ConfigurationTemplateName",
        "flattened": false
      },
      "EnvironmentName": {"shape": "EnvironmentName", "flattened": false},
      "OptionSettings": {
        "shape": "ConfigurationOptionSettingsList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ValidationMessage": {
    "type": "structure",
    "members": {
      "Message": {"shape": "ValidationMessageString", "flattened": false},
      "Severity": {"shape": "ValidationSeverity", "flattened": false},
      "Namespace": {"shape": "OptionNamespace", "flattened": false},
      "OptionName": {"shape": "ConfigurationOptionName", "flattened": false}
    },
    "flattened": false
  },
  "ValidationMessageString": {"type": "string", "flattened": false},
  "ValidationMessagesList": {
    "type": "list",
    "member": {"shape": "ValidationMessage"},
    "flattened": false
  },
  "ValidationSeverity": {"type": "string", "flattened": false},
  "VersionLabel": {"type": "string", "flattened": false},
  "VersionLabels": {
    "type": "list",
    "member": {"shape": "VersionLabel"},
    "flattened": false
  },
  "VersionLabelsList": {
    "type": "list",
    "member": {"shape": "VersionLabel"},
    "flattened": false
  },
  "VirtualizationType": {"type": "string", "flattened": false}
};
