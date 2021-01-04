// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "Activities": {
    "type": "list",
    "member": {"shape": "Activity"},
    "flattened": false
  },
  "ActivitiesType": {
    "type": "structure",
    "members": {
      "Activities": {"shape": "Activities", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "Activity": {
    "type": "structure",
    "members": {
      "ActivityId": {"shape": "XmlString", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Description": {"shape": "XmlString", "flattened": false},
      "Cause": {"shape": "XmlStringMaxLen1023", "flattened": false},
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "StatusCode": {"shape": "ScalingActivityStatusCode", "flattened": false},
      "StatusMessage": {"shape": "XmlStringMaxLen255", "flattened": false},
      "Progress": {"shape": "Progress", "flattened": false},
      "Details": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "ActivityIds": {
    "type": "list",
    "member": {"shape": "XmlString"},
    "flattened": false
  },
  "ActivityType": {
    "type": "structure",
    "members": {
      "Activity": {"shape": "Activity", "flattened": false}
    },
    "flattened": false
  },
  "AdjustmentType": {
    "type": "structure",
    "members": {
      "AdjustmentType": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "AdjustmentTypes": {
    "type": "list",
    "member": {"shape": "AdjustmentType"},
    "flattened": false
  },
  "Alarm": {
    "type": "structure",
    "members": {
      "AlarmName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "AlarmARN": {"shape": "ResourceName", "flattened": false}
    },
    "flattened": false
  },
  "Alarms": {
    "type": "list",
    "member": {"shape": "Alarm"},
    "flattened": false
  },
  "AsciiStringMaxLen255": {"type": "string", "flattened": false},
  "AssociatePublicIpAddress": {"type": "boolean", "flattened": false},
  "AttachInstancesQuery": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AttachLoadBalancerTargetGroupsResultType": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "AttachLoadBalancerTargetGroupsType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "TargetGroupARNs": {"shape": "TargetGroupARNs", "flattened": false}
    },
    "flattened": false
  },
  "AttachLoadBalancersResultType": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "AttachLoadBalancersType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingGroup": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupARN": {"shape": "ResourceName", "flattened": false},
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchTemplate": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "MixedInstancesPolicy": {
        "shape": "MixedInstancesPolicy",
        "flattened": false
      },
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      },
      "DefaultCooldown": {"shape": "Cooldown", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false},
      "TargetGroupARNs": {"shape": "TargetGroupARNs", "flattened": false},
      "HealthCheckType": {"shape": "XmlStringMaxLen32", "flattened": false},
      "HealthCheckGracePeriod": {
        "shape": "HealthCheckGracePeriod",
        "flattened": false
      },
      "Instances": {"shape": "Instances", "flattened": false},
      "CreatedTime": {"shape": "TimestampType", "flattened": false},
      "SuspendedProcesses": {"shape": "SuspendedProcesses", "flattened": false},
      "PlacementGroup": {"shape": "XmlStringMaxLen255", "flattened": false},
      "VPCZoneIdentifier": {"shape": "XmlStringMaxLen2047", "flattened": false},
      "EnabledMetrics": {"shape": "EnabledMetrics", "flattened": false},
      "Status": {"shape": "XmlStringMaxLen255", "flattened": false},
      "Tags": {"shape": "TagDescriptionList", "flattened": false},
      "TerminationPolicies": {
        "shape": "TerminationPolicies",
        "flattened": false
      },
      "NewInstancesProtectedFromScaleIn": {
        "shape": "InstanceProtected",
        "flattened": false
      },
      "ServiceLinkedRoleARN": {"shape": "ResourceName", "flattened": false},
      "MaxInstanceLifetime": {
        "shape": "MaxInstanceLifetime",
        "flattened": false
      },
      "CapacityRebalance": {
        "shape": "CapacityRebalanceEnabled",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AutoScalingGroupDesiredCapacity": {"type": "integer", "flattened": false},
  "AutoScalingGroupMaxSize": {"type": "integer", "flattened": false},
  "AutoScalingGroupMinSize": {"type": "integer", "flattened": false},
  "AutoScalingGroupNames": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "AutoScalingGroupNamesType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupNames": {
        "shape": "AutoScalingGroupNames",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingGroups": {
    "type": "list",
    "member": {"shape": "AutoScalingGroup"},
    "flattened": false
  },
  "AutoScalingGroupsType": {
    "type": "structure",
    "members": {
      "AutoScalingGroups": {"shape": "AutoScalingGroups", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingInstanceDetails": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "InstanceType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "AvailabilityZone": {"shape": "XmlStringMaxLen255", "flattened": false},
      "LifecycleState": {"shape": "XmlStringMaxLen32", "flattened": false},
      "HealthStatus": {"shape": "XmlStringMaxLen32", "flattened": false},
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchTemplate": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "ProtectedFromScaleIn": {
        "shape": "InstanceProtected",
        "flattened": false
      },
      "WeightedCapacity": {"shape": "XmlStringMaxLen32", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingInstances": {
    "type": "list",
    "member": {"shape": "AutoScalingInstanceDetails"},
    "flattened": false
  },
  "AutoScalingInstancesType": {
    "type": "structure",
    "members": {
      "AutoScalingInstances": {
        "shape": "AutoScalingInstances",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "AutoScalingNotificationTypes": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "AvailabilityZones": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "BatchDeleteScheduledActionAnswer": {
    "type": "structure",
    "members": {
      "FailedScheduledActions": {
        "shape": "FailedScheduledUpdateGroupActionRequests",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BatchDeleteScheduledActionType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionNames": {
        "shape": "ScheduledActionNames",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BatchPutScheduledUpdateGroupActionAnswer": {
    "type": "structure",
    "members": {
      "FailedScheduledUpdateGroupActions": {
        "shape": "FailedScheduledUpdateGroupActionRequests",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BatchPutScheduledUpdateGroupActionType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledUpdateGroupActions": {
        "shape": "ScheduledUpdateGroupActionRequests",
        "flattened": false
      }
    },
    "flattened": false
  },
  "BlockDeviceEbsDeleteOnTermination": {"type": "boolean", "flattened": false},
  "BlockDeviceEbsEncrypted": {"type": "boolean", "flattened": false},
  "BlockDeviceEbsIops": {"type": "integer", "flattened": false},
  "BlockDeviceEbsVolumeSize": {"type": "integer", "flattened": false},
  "BlockDeviceEbsVolumeType": {"type": "string", "flattened": false},
  "BlockDeviceMapping": {
    "type": "structure",
    "members": {
      "VirtualName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "DeviceName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "Ebs": {"shape": "Ebs", "flattened": false},
      "NoDevice": {"shape": "NoDevice", "flattened": false}
    },
    "flattened": false
  },
  "BlockDeviceMappings": {
    "type": "list",
    "member": {"shape": "BlockDeviceMapping"},
    "flattened": false
  },
  "CancelInstanceRefreshAnswer": {
    "type": "structure",
    "members": {
      "InstanceRefreshId": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "CancelInstanceRefreshType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CapacityRebalanceEnabled": {"type": "boolean", "flattened": false},
  "ClassicLinkVPCSecurityGroups": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "CompleteLifecycleActionAnswer": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CompleteLifecycleActionType": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupName": {"shape": "ResourceName", "flattened": false},
      "LifecycleActionToken": {
        "shape": "LifecycleActionToken",
        "flattened": false
      },
      "LifecycleActionResult": {
        "shape": "LifecycleActionResult",
        "flattened": false
      },
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false}
    },
    "flattened": false
  },
  "Cooldown": {"type": "integer", "flattened": false},
  "CreateAutoScalingGroupType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchTemplate": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "MixedInstancesPolicy": {
        "shape": "MixedInstancesPolicy",
        "flattened": false
      },
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      },
      "DefaultCooldown": {"shape": "Cooldown", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false},
      "TargetGroupARNs": {"shape": "TargetGroupARNs", "flattened": false},
      "HealthCheckType": {"shape": "XmlStringMaxLen32", "flattened": false},
      "HealthCheckGracePeriod": {
        "shape": "HealthCheckGracePeriod",
        "flattened": false
      },
      "PlacementGroup": {"shape": "XmlStringMaxLen255", "flattened": false},
      "VPCZoneIdentifier": {"shape": "XmlStringMaxLen2047", "flattened": false},
      "TerminationPolicies": {
        "shape": "TerminationPolicies",
        "flattened": false
      },
      "NewInstancesProtectedFromScaleIn": {
        "shape": "InstanceProtected",
        "flattened": false
      },
      "CapacityRebalance": {
        "shape": "CapacityRebalanceEnabled",
        "flattened": false
      },
      "LifecycleHookSpecificationList": {
        "shape": "LifecycleHookSpecifications",
        "flattened": false
      },
      "Tags": {"shape": "Tags", "flattened": false},
      "ServiceLinkedRoleARN": {"shape": "ResourceName", "flattened": false},
      "MaxInstanceLifetime": {
        "shape": "MaxInstanceLifetime",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateLaunchConfigurationType": {
    "type": "structure",
    "members": {
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ImageId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "KeyName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "ClassicLinkVPCId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "ClassicLinkVPCSecurityGroups": {
        "shape": "ClassicLinkVPCSecurityGroups",
        "flattened": false
      },
      "UserData": {"shape": "XmlStringUserData", "flattened": false},
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "InstanceType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "KernelId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "RamdiskId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "BlockDeviceMappings": {
        "shape": "BlockDeviceMappings",
        "flattened": false
      },
      "InstanceMonitoring": {"shape": "InstanceMonitoring", "flattened": false},
      "SpotPrice": {"shape": "SpotPrice", "flattened": false},
      "IamInstanceProfile": {
        "shape": "XmlStringMaxLen1600",
        "flattened": false
      },
      "EbsOptimized": {"shape": "EbsOptimized", "flattened": false},
      "AssociatePublicIpAddress": {
        "shape": "AssociatePublicIpAddress",
        "flattened": false
      },
      "PlacementTenancy": {"shape": "XmlStringMaxLen64", "flattened": false},
      "MetadataOptions": {
        "shape": "InstanceMetadataOptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateOrUpdateTagsType": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "CustomizedMetricSpecification": {
    "type": "structure",
    "members": {
      "MetricName": {"shape": "MetricName", "flattened": false},
      "Namespace": {"shape": "MetricNamespace", "flattened": false},
      "Dimensions": {"shape": "MetricDimensions", "flattened": false},
      "Statistic": {"shape": "MetricStatistic", "flattened": false},
      "Unit": {"shape": "MetricUnit", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAutoScalingGroupType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ForceDelete": {"shape": "ForceDelete", "flattened": false}
    },
    "flattened": false
  },
  "DeleteLifecycleHookAnswer": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteLifecycleHookType": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteNotificationConfigurationType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "TopicARN": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "DeletePolicyType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "PolicyName": {"shape": "ResourceName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteScheduledActionType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionName": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTagsType": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "Tags", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccountLimitsAnswer": {
    "type": "structure",
    "members": {
      "MaxNumberOfAutoScalingGroups": {
        "shape": "MaxNumberOfAutoScalingGroups",
        "flattened": false
      },
      "MaxNumberOfLaunchConfigurations": {
        "shape": "MaxNumberOfLaunchConfigurations",
        "flattened": false
      },
      "NumberOfAutoScalingGroups": {
        "shape": "NumberOfAutoScalingGroups",
        "flattened": false
      },
      "NumberOfLaunchConfigurations": {
        "shape": "NumberOfLaunchConfigurations",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeAdjustmentTypesAnswer": {
    "type": "structure",
    "members": {
      "AdjustmentTypes": {"shape": "AdjustmentTypes", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAutoScalingInstancesType": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAutoScalingNotificationTypesAnswer": {
    "type": "structure",
    "members": {
      "AutoScalingNotificationTypes": {
        "shape": "AutoScalingNotificationTypes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeInstanceRefreshesAnswer": {
    "type": "structure",
    "members": {
      "InstanceRefreshes": {"shape": "InstanceRefreshes", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeInstanceRefreshesType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "InstanceRefreshIds": {"shape": "InstanceRefreshIds", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLifecycleHookTypesAnswer": {
    "type": "structure",
    "members": {
      "LifecycleHookTypes": {
        "shape": "AutoScalingNotificationTypes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeLifecycleHooksAnswer": {
    "type": "structure",
    "members": {
      "LifecycleHooks": {"shape": "LifecycleHooks", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLifecycleHooksType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LifecycleHookNames": {"shape": "LifecycleHookNames", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerTargetGroupsRequest": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerTargetGroupsResponse": {
    "type": "structure",
    "members": {
      "LoadBalancerTargetGroups": {
        "shape": "LoadBalancerTargetGroupStates",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancersRequest": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancersResponse": {
    "type": "structure",
    "members": {
      "LoadBalancers": {"shape": "LoadBalancerStates", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeMetricCollectionTypesAnswer": {
    "type": "structure",
    "members": {
      "Metrics": {"shape": "MetricCollectionTypes", "flattened": false},
      "Granularities": {"shape": "MetricGranularityTypes", "flattened": false}
    },
    "flattened": false
  },
  "DescribeNotificationConfigurationsAnswer": {
    "type": "structure",
    "members": {
      "NotificationConfigurations": {
        "shape": "NotificationConfigurations",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeNotificationConfigurationsType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupNames": {
        "shape": "AutoScalingGroupNames",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribePoliciesType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "PolicyNames": {"shape": "PolicyNames", "flattened": false},
      "PolicyTypes": {"shape": "PolicyTypes", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeScalingActivitiesType": {
    "type": "structure",
    "members": {
      "ActivityIds": {"shape": "ActivityIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "MaxRecords": {"shape": "MaxRecords", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "DescribeScheduledActionsType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionNames": {
        "shape": "ScheduledActionNames",
        "flattened": false
      },
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTagsType": {
    "type": "structure",
    "members": {
      "Filters": {"shape": "Filters", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTerminationPolicyTypesAnswer": {
    "type": "structure",
    "members": {
      "TerminationPolicyTypes": {
        "shape": "TerminationPolicies",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DetachInstancesAnswer": {
    "type": "structure",
    "members": {
      "Activities": {"shape": "Activities", "flattened": false}
    },
    "flattened": false
  },
  "DetachInstancesQuery": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ShouldDecrementDesiredCapacity": {
        "shape": "ShouldDecrementDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DetachLoadBalancerTargetGroupsResultType": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DetachLoadBalancerTargetGroupsType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "TargetGroupARNs": {"shape": "TargetGroupARNs", "flattened": false}
    },
    "flattened": false
  },
  "DetachLoadBalancersResultType": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DetachLoadBalancersType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false}
    },
    "flattened": false
  },
  "DisableMetricsCollectionQuery": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Metrics": {"shape": "Metrics", "flattened": false}
    },
    "flattened": false
  },
  "DisableScaleIn": {"type": "boolean", "flattened": false},
  "Ebs": {
    "type": "structure",
    "members": {
      "SnapshotId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "VolumeSize": {"shape": "BlockDeviceEbsVolumeSize", "flattened": false},
      "VolumeType": {"shape": "BlockDeviceEbsVolumeType", "flattened": false},
      "DeleteOnTermination": {
        "shape": "BlockDeviceEbsDeleteOnTermination",
        "flattened": false
      },
      "Iops": {"shape": "BlockDeviceEbsIops", "flattened": false},
      "Encrypted": {"shape": "BlockDeviceEbsEncrypted", "flattened": false}
    },
    "flattened": false
  },
  "EbsOptimized": {"type": "boolean", "flattened": false},
  "EnableMetricsCollectionQuery": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Metrics": {"shape": "Metrics", "flattened": false},
      "Granularity": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "EnabledMetric": {
    "type": "structure",
    "members": {
      "Metric": {"shape": "XmlStringMaxLen255", "flattened": false},
      "Granularity": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "EnabledMetrics": {
    "type": "list",
    "member": {"shape": "EnabledMetric"},
    "flattened": false
  },
  "EnterStandbyAnswer": {
    "type": "structure",
    "members": {
      "Activities": {"shape": "Activities", "flattened": false}
    },
    "flattened": false
  },
  "EnterStandbyQuery": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ShouldDecrementDesiredCapacity": {
        "shape": "ShouldDecrementDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EstimatedInstanceWarmup": {"type": "integer", "flattened": false},
  "ExecutePolicyType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "PolicyName": {"shape": "ResourceName", "flattened": false},
      "HonorCooldown": {"shape": "HonorCooldown", "flattened": false},
      "MetricValue": {"shape": "MetricScale", "flattened": false},
      "BreachThreshold": {"shape": "MetricScale", "flattened": false}
    },
    "flattened": false
  },
  "ExitStandbyAnswer": {
    "type": "structure",
    "members": {
      "Activities": {"shape": "Activities", "flattened": false}
    },
    "flattened": false
  },
  "ExitStandbyQuery": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      }
    },
    "flattened": false
  },
  "FailedScheduledUpdateGroupActionRequest": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ErrorCode": {"shape": "XmlStringMaxLen64", "flattened": false},
      "ErrorMessage": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "FailedScheduledUpdateGroupActionRequests": {
    "type": "list",
    "member": {"shape": "FailedScheduledUpdateGroupActionRequest"},
    "flattened": false
  },
  "Filter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "XmlString", "flattened": false},
      "Values": {"shape": "Values", "flattened": false}
    },
    "flattened": false
  },
  "Filters": {
    "type": "list",
    "member": {"shape": "Filter"},
    "flattened": false
  },
  "ForceDelete": {"type": "boolean", "flattened": false},
  "GlobalTimeout": {"type": "integer", "flattened": false},
  "HealthCheckGracePeriod": {"type": "integer", "flattened": false},
  "HeartbeatTimeout": {"type": "integer", "flattened": false},
  "HonorCooldown": {"type": "boolean", "flattened": false},
  "Instance": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "InstanceType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "AvailabilityZone": {"shape": "XmlStringMaxLen255", "flattened": false},
      "LifecycleState": {"shape": "LifecycleState", "flattened": false},
      "HealthStatus": {"shape": "XmlStringMaxLen32", "flattened": false},
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchTemplate": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "ProtectedFromScaleIn": {
        "shape": "InstanceProtected",
        "flattened": false
      },
      "WeightedCapacity": {"shape": "XmlStringMaxLen32", "flattened": false}
    },
    "flattened": false
  },
  "InstanceIds": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen19"},
    "flattened": false
  },
  "InstanceMetadataEndpointState": {"type": "string", "flattened": false},
  "InstanceMetadataHttpPutResponseHopLimit": {
    "type": "integer",
    "flattened": false
  },
  "InstanceMetadataHttpTokensState": {"type": "string", "flattened": false},
  "InstanceMetadataOptions": {
    "type": "structure",
    "members": {
      "HttpTokens": {
        "shape": "InstanceMetadataHttpTokensState",
        "flattened": false
      },
      "HttpPutResponseHopLimit": {
        "shape": "InstanceMetadataHttpPutResponseHopLimit",
        "flattened": false
      },
      "HttpEndpoint": {
        "shape": "InstanceMetadataEndpointState",
        "flattened": false
      }
    },
    "flattened": false
  },
  "InstanceMonitoring": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "MonitoringEnabled", "flattened": false}
    },
    "flattened": false
  },
  "InstanceProtected": {"type": "boolean", "flattened": false},
  "InstanceRefresh": {
    "type": "structure",
    "members": {
      "InstanceRefreshId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Status": {"shape": "InstanceRefreshStatus", "flattened": false},
      "StatusReason": {"shape": "XmlStringMaxLen1023", "flattened": false},
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "PercentageComplete": {"shape": "IntPercent", "flattened": false},
      "InstancesToUpdate": {"shape": "InstancesToUpdate", "flattened": false}
    },
    "flattened": false
  },
  "InstanceRefreshIds": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "InstanceRefreshStatus": {"type": "string", "flattened": false},
  "InstanceRefreshes": {
    "type": "list",
    "member": {"shape": "InstanceRefresh"},
    "flattened": false
  },
  "Instances": {
    "type": "list",
    "member": {"shape": "Instance"},
    "flattened": false
  },
  "InstancesDistribution": {
    "type": "structure",
    "members": {
      "OnDemandAllocationStrategy": {"shape": "XmlString", "flattened": false},
      "OnDemandBaseCapacity": {
        "shape": "OnDemandBaseCapacity",
        "flattened": false
      },
      "OnDemandPercentageAboveBaseCapacity": {
        "shape": "OnDemandPercentageAboveBaseCapacity",
        "flattened": false
      },
      "SpotAllocationStrategy": {"shape": "XmlString", "flattened": false},
      "SpotInstancePools": {"shape": "SpotInstancePools", "flattened": false},
      "SpotMaxPrice": {"shape": "MixedInstanceSpotPrice", "flattened": false}
    },
    "flattened": false
  },
  "InstancesToUpdate": {"type": "integer", "flattened": false},
  "IntPercent": {"type": "integer", "flattened": false},
  "LaunchConfiguration": {
    "type": "structure",
    "members": {
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchConfigurationARN": {"shape": "ResourceName", "flattened": false},
      "ImageId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "KeyName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "ClassicLinkVPCId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "ClassicLinkVPCSecurityGroups": {
        "shape": "ClassicLinkVPCSecurityGroups",
        "flattened": false
      },
      "UserData": {"shape": "XmlStringUserData", "flattened": false},
      "InstanceType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "KernelId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "RamdiskId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "BlockDeviceMappings": {
        "shape": "BlockDeviceMappings",
        "flattened": false
      },
      "InstanceMonitoring": {"shape": "InstanceMonitoring", "flattened": false},
      "SpotPrice": {"shape": "SpotPrice", "flattened": false},
      "IamInstanceProfile": {
        "shape": "XmlStringMaxLen1600",
        "flattened": false
      },
      "CreatedTime": {"shape": "TimestampType", "flattened": false},
      "EbsOptimized": {"shape": "EbsOptimized", "flattened": false},
      "AssociatePublicIpAddress": {
        "shape": "AssociatePublicIpAddress",
        "flattened": false
      },
      "PlacementTenancy": {"shape": "XmlStringMaxLen64", "flattened": false},
      "MetadataOptions": {
        "shape": "InstanceMetadataOptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LaunchConfigurationNameType": {
    "type": "structure",
    "members": {
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LaunchConfigurationNames": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "LaunchConfigurationNamesType": {
    "type": "structure",
    "members": {
      "LaunchConfigurationNames": {
        "shape": "LaunchConfigurationNames",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false},
      "MaxRecords": {"shape": "MaxRecords", "flattened": false}
    },
    "flattened": false
  },
  "LaunchConfigurations": {
    "type": "list",
    "member": {"shape": "LaunchConfiguration"},
    "flattened": false
  },
  "LaunchConfigurationsType": {
    "type": "structure",
    "members": {
      "LaunchConfigurations": {
        "shape": "LaunchConfigurations",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "LaunchTemplate": {
    "type": "structure",
    "members": {
      "LaunchTemplateSpecification": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "Overrides": {"shape": "Overrides", "flattened": false}
    },
    "flattened": false
  },
  "LaunchTemplateName": {"type": "string", "flattened": false},
  "LaunchTemplateOverrides": {
    "type": "structure",
    "members": {
      "InstanceType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "WeightedCapacity": {"shape": "XmlStringMaxLen32", "flattened": false},
      "LaunchTemplateSpecification": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LaunchTemplateSpecification": {
    "type": "structure",
    "members": {
      "LaunchTemplateId": {"shape": "XmlStringMaxLen255", "flattened": false},
      "LaunchTemplateName": {"shape": "LaunchTemplateName", "flattened": false},
      "Version": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "LifecycleActionResult": {"type": "string", "flattened": false},
  "LifecycleActionToken": {"type": "string", "flattened": false},
  "LifecycleHook": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LifecycleTransition": {
        "shape": "LifecycleTransition",
        "flattened": false
      },
      "NotificationTargetARN": {
        "shape": "NotificationTargetResourceName",
        "flattened": false
      },
      "RoleARN": {"shape": "XmlStringMaxLen255", "flattened": false},
      "NotificationMetadata": {
        "shape": "XmlStringMaxLen1023",
        "flattened": false
      },
      "HeartbeatTimeout": {"shape": "HeartbeatTimeout", "flattened": false},
      "GlobalTimeout": {"shape": "GlobalTimeout", "flattened": false},
      "DefaultResult": {"shape": "LifecycleActionResult", "flattened": false}
    },
    "flattened": false
  },
  "LifecycleHookNames": {
    "type": "list",
    "member": {"shape": "AsciiStringMaxLen255"},
    "flattened": false
  },
  "LifecycleHookSpecification": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "LifecycleTransition": {
        "shape": "LifecycleTransition",
        "flattened": false
      },
      "NotificationMetadata": {
        "shape": "XmlStringMaxLen1023",
        "flattened": false
      },
      "HeartbeatTimeout": {"shape": "HeartbeatTimeout", "flattened": false},
      "DefaultResult": {"shape": "LifecycleActionResult", "flattened": false},
      "NotificationTargetARN": {
        "shape": "NotificationTargetResourceName",
        "flattened": false
      },
      "RoleARN": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "LifecycleHookSpecifications": {
    "type": "list",
    "member": {"shape": "LifecycleHookSpecification"},
    "flattened": false
  },
  "LifecycleHooks": {
    "type": "list",
    "member": {"shape": "LifecycleHook"},
    "flattened": false
  },
  "LifecycleState": {"type": "string", "flattened": false},
  "LifecycleTransition": {"type": "string", "flattened": false},
  "LoadBalancerNames": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "LoadBalancerState": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "State": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerStates": {
    "type": "list",
    "member": {"shape": "LoadBalancerState"},
    "flattened": false
  },
  "LoadBalancerTargetGroupState": {
    "type": "structure",
    "members": {
      "LoadBalancerTargetGroupARN": {
        "shape": "XmlStringMaxLen511",
        "flattened": false
      },
      "State": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerTargetGroupStates": {
    "type": "list",
    "member": {"shape": "LoadBalancerTargetGroupState"},
    "flattened": false
  },
  "MaxInstanceLifetime": {"type": "integer", "flattened": false},
  "MaxNumberOfAutoScalingGroups": {"type": "integer", "flattened": false},
  "MaxNumberOfLaunchConfigurations": {"type": "integer", "flattened": false},
  "MaxRecords": {"type": "integer", "flattened": false},
  "MetricCollectionType": {
    "type": "structure",
    "members": {
      "Metric": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "MetricCollectionTypes": {
    "type": "list",
    "member": {"shape": "MetricCollectionType"},
    "flattened": false
  },
  "MetricDimension": {
    "type": "structure",
    "members": {
      "Name": {"shape": "MetricDimensionName", "flattened": false},
      "Value": {"shape": "MetricDimensionValue", "flattened": false}
    },
    "flattened": false
  },
  "MetricDimensionName": {"type": "string", "flattened": false},
  "MetricDimensionValue": {"type": "string", "flattened": false},
  "MetricDimensions": {
    "type": "list",
    "member": {"shape": "MetricDimension"},
    "flattened": false
  },
  "MetricGranularityType": {
    "type": "structure",
    "members": {
      "Granularity": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "MetricGranularityTypes": {
    "type": "list",
    "member": {"shape": "MetricGranularityType"},
    "flattened": false
  },
  "MetricName": {"type": "string", "flattened": false},
  "MetricNamespace": {"type": "string", "flattened": false},
  "MetricScale": {"type": "double", "flattened": false},
  "MetricStatistic": {"type": "string", "flattened": false},
  "MetricType": {"type": "string", "flattened": false},
  "MetricUnit": {"type": "string", "flattened": false},
  "Metrics": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "MinAdjustmentMagnitude": {"type": "integer", "flattened": false},
  "MinAdjustmentStep": {"type": "integer", "flattened": false},
  "MixedInstanceSpotPrice": {"type": "string", "flattened": false},
  "MixedInstancesPolicy": {
    "type": "structure",
    "members": {
      "LaunchTemplate": {"shape": "LaunchTemplate", "flattened": false},
      "InstancesDistribution": {
        "shape": "InstancesDistribution",
        "flattened": false
      }
    },
    "flattened": false
  },
  "MonitoringEnabled": {"type": "boolean", "flattened": false},
  "NoDevice": {"type": "boolean", "flattened": false},
  "NotificationConfiguration": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "TopicARN": {"shape": "XmlStringMaxLen255", "flattened": false},
      "NotificationType": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "NotificationConfigurations": {
    "type": "list",
    "member": {"shape": "NotificationConfiguration"},
    "flattened": false
  },
  "NotificationTargetResourceName": {"type": "string", "flattened": false},
  "NumberOfAutoScalingGroups": {"type": "integer", "flattened": false},
  "NumberOfLaunchConfigurations": {"type": "integer", "flattened": false},
  "OnDemandBaseCapacity": {"type": "integer", "flattened": false},
  "OnDemandPercentageAboveBaseCapacity": {
    "type": "integer",
    "flattened": false
  },
  "Overrides": {
    "type": "list",
    "member": {"shape": "LaunchTemplateOverrides"},
    "flattened": false
  },
  "PoliciesType": {
    "type": "structure",
    "members": {
      "ScalingPolicies": {"shape": "ScalingPolicies", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "PolicyARNType": {
    "type": "structure",
    "members": {
      "PolicyARN": {"shape": "ResourceName", "flattened": false},
      "Alarms": {"shape": "Alarms", "flattened": false}
    },
    "flattened": false
  },
  "PolicyIncrement": {"type": "integer", "flattened": false},
  "PolicyNames": {
    "type": "list",
    "member": {"shape": "ResourceName"},
    "flattened": false
  },
  "PolicyTypes": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen64"},
    "flattened": false
  },
  "PredefinedMetricSpecification": {
    "type": "structure",
    "members": {
      "PredefinedMetricType": {"shape": "MetricType", "flattened": false},
      "ResourceLabel": {"shape": "XmlStringMaxLen1023", "flattened": false}
    },
    "flattened": false
  },
  "ProcessNames": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "ProcessType": {
    "type": "structure",
    "members": {
      "ProcessName": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "Processes": {
    "type": "list",
    "member": {"shape": "ProcessType"},
    "flattened": false
  },
  "ProcessesType": {
    "type": "structure",
    "members": {
      "Processes": {"shape": "Processes", "flattened": false}
    },
    "flattened": false
  },
  "Progress": {"type": "integer", "flattened": false},
  "PropagateAtLaunch": {"type": "boolean", "flattened": false},
  "ProtectedFromScaleIn": {"type": "boolean", "flattened": false},
  "PutLifecycleHookAnswer": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "PutLifecycleHookType": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LifecycleTransition": {
        "shape": "LifecycleTransition",
        "flattened": false
      },
      "RoleARN": {"shape": "XmlStringMaxLen255", "flattened": false},
      "NotificationTargetARN": {
        "shape": "NotificationTargetResourceName",
        "flattened": false
      },
      "NotificationMetadata": {
        "shape": "XmlStringMaxLen1023",
        "flattened": false
      },
      "HeartbeatTimeout": {"shape": "HeartbeatTimeout", "flattened": false},
      "DefaultResult": {"shape": "LifecycleActionResult", "flattened": false}
    },
    "flattened": false
  },
  "PutNotificationConfigurationType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "TopicARN": {"shape": "XmlStringMaxLen255", "flattened": false},
      "NotificationTypes": {
        "shape": "AutoScalingNotificationTypes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PutScalingPolicyType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "PolicyName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "PolicyType": {"shape": "XmlStringMaxLen64", "flattened": false},
      "AdjustmentType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "MinAdjustmentStep": {"shape": "MinAdjustmentStep", "flattened": false},
      "MinAdjustmentMagnitude": {
        "shape": "MinAdjustmentMagnitude",
        "flattened": false
      },
      "ScalingAdjustment": {"shape": "PolicyIncrement", "flattened": false},
      "Cooldown": {"shape": "Cooldown", "flattened": false},
      "MetricAggregationType": {
        "shape": "XmlStringMaxLen32",
        "flattened": false
      },
      "StepAdjustments": {"shape": "StepAdjustments", "flattened": false},
      "EstimatedInstanceWarmup": {
        "shape": "EstimatedInstanceWarmup",
        "flattened": false
      },
      "TargetTrackingConfiguration": {
        "shape": "TargetTrackingConfiguration",
        "flattened": false
      },
      "Enabled": {"shape": "ScalingPolicyEnabled", "flattened": false}
    },
    "flattened": false
  },
  "PutScheduledUpdateGroupActionType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Time": {"shape": "TimestampType", "flattened": false},
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "Recurrence": {"shape": "XmlStringMaxLen255", "flattened": false},
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RecordLifecycleActionHeartbeatAnswer": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "RecordLifecycleActionHeartbeatType": {
    "type": "structure",
    "members": {
      "LifecycleHookName": {
        "shape": "AsciiStringMaxLen255",
        "flattened": false
      },
      "AutoScalingGroupName": {"shape": "ResourceName", "flattened": false},
      "LifecycleActionToken": {
        "shape": "LifecycleActionToken",
        "flattened": false
      },
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false}
    },
    "flattened": false
  },
  "RefreshInstanceWarmup": {"type": "integer", "flattened": false},
  "RefreshPreferences": {
    "type": "structure",
    "members": {
      "MinHealthyPercentage": {"shape": "IntPercent", "flattened": false},
      "InstanceWarmup": {"shape": "RefreshInstanceWarmup", "flattened": false}
    },
    "flattened": false
  },
  "RefreshStrategy": {"type": "string", "flattened": false},
  "ResourceName": {"type": "string", "flattened": false},
  "ScalingActivityStatusCode": {"type": "string", "flattened": false},
  "ScalingPolicies": {
    "type": "list",
    "member": {"shape": "ScalingPolicy"},
    "flattened": false
  },
  "ScalingPolicy": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "PolicyName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "PolicyARN": {"shape": "ResourceName", "flattened": false},
      "PolicyType": {"shape": "XmlStringMaxLen64", "flattened": false},
      "AdjustmentType": {"shape": "XmlStringMaxLen255", "flattened": false},
      "MinAdjustmentStep": {"shape": "MinAdjustmentStep", "flattened": false},
      "MinAdjustmentMagnitude": {
        "shape": "MinAdjustmentMagnitude",
        "flattened": false
      },
      "ScalingAdjustment": {"shape": "PolicyIncrement", "flattened": false},
      "Cooldown": {"shape": "Cooldown", "flattened": false},
      "StepAdjustments": {"shape": "StepAdjustments", "flattened": false},
      "MetricAggregationType": {
        "shape": "XmlStringMaxLen32",
        "flattened": false
      },
      "EstimatedInstanceWarmup": {
        "shape": "EstimatedInstanceWarmup",
        "flattened": false
      },
      "Alarms": {"shape": "Alarms", "flattened": false},
      "TargetTrackingConfiguration": {
        "shape": "TargetTrackingConfiguration",
        "flattened": false
      },
      "Enabled": {"shape": "ScalingPolicyEnabled", "flattened": false}
    },
    "flattened": false
  },
  "ScalingPolicyEnabled": {"type": "boolean", "flattened": false},
  "ScalingProcessQuery": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScalingProcesses": {"shape": "ProcessNames", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledActionNames": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen255"},
    "flattened": false
  },
  "ScheduledActionsType": {
    "type": "structure",
    "members": {
      "ScheduledUpdateGroupActions": {
        "shape": "ScheduledUpdateGroupActions",
        "flattened": false
      },
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "ScheduledUpdateGroupAction": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ScheduledActionARN": {"shape": "ResourceName", "flattened": false},
      "Time": {"shape": "TimestampType", "flattened": false},
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "Recurrence": {"shape": "XmlStringMaxLen255", "flattened": false},
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ScheduledUpdateGroupActionRequest": {
    "type": "structure",
    "members": {
      "ScheduledActionName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "StartTime": {"shape": "TimestampType", "flattened": false},
      "EndTime": {"shape": "TimestampType", "flattened": false},
      "Recurrence": {"shape": "XmlStringMaxLen255", "flattened": false},
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ScheduledUpdateGroupActionRequests": {
    "type": "list",
    "member": {"shape": "ScheduledUpdateGroupActionRequest"},
    "flattened": false
  },
  "ScheduledUpdateGroupActions": {
    "type": "list",
    "member": {"shape": "ScheduledUpdateGroupAction"},
    "flattened": false
  },
  "SecurityGroups": {
    "type": "list",
    "member": {"shape": "XmlString"},
    "flattened": false
  },
  "SetDesiredCapacityType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      },
      "HonorCooldown": {"shape": "HonorCooldown", "flattened": false}
    },
    "flattened": false
  },
  "SetInstanceHealthQuery": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "HealthStatus": {"shape": "XmlStringMaxLen32", "flattened": false},
      "ShouldRespectGracePeriod": {
        "shape": "ShouldRespectGracePeriod",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SetInstanceProtectionAnswer": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetInstanceProtectionQuery": {
    "type": "structure",
    "members": {
      "InstanceIds": {"shape": "InstanceIds", "flattened": false},
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "ProtectedFromScaleIn": {
        "shape": "ProtectedFromScaleIn",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ShouldDecrementDesiredCapacity": {"type": "boolean", "flattened": false},
  "ShouldRespectGracePeriod": {"type": "boolean", "flattened": false},
  "SpotInstancePools": {"type": "integer", "flattened": false},
  "SpotPrice": {"type": "string", "flattened": false},
  "StartInstanceRefreshAnswer": {
    "type": "structure",
    "members": {
      "InstanceRefreshId": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "StartInstanceRefreshType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "Strategy": {"shape": "RefreshStrategy", "flattened": false},
      "Preferences": {"shape": "RefreshPreferences", "flattened": false}
    },
    "flattened": false
  },
  "StepAdjustment": {
    "type": "structure",
    "members": {
      "MetricIntervalLowerBound": {"shape": "MetricScale", "flattened": false},
      "MetricIntervalUpperBound": {"shape": "MetricScale", "flattened": false},
      "ScalingAdjustment": {"shape": "PolicyIncrement", "flattened": false}
    },
    "flattened": false
  },
  "StepAdjustments": {
    "type": "list",
    "member": {"shape": "StepAdjustment"},
    "flattened": false
  },
  "SuspendedProcess": {
    "type": "structure",
    "members": {
      "ProcessName": {"shape": "XmlStringMaxLen255", "flattened": false},
      "SuspensionReason": {"shape": "XmlStringMaxLen255", "flattened": false}
    },
    "flattened": false
  },
  "SuspendedProcesses": {
    "type": "list",
    "member": {"shape": "SuspendedProcess"},
    "flattened": false
  },
  "Tag": {
    "type": "structure",
    "members": {
      "ResourceId": {"shape": "XmlString", "flattened": false},
      "ResourceType": {"shape": "XmlString", "flattened": false},
      "Key": {"shape": "TagKey", "flattened": false},
      "Value": {"shape": "TagValue", "flattened": false},
      "PropagateAtLaunch": {"shape": "PropagateAtLaunch", "flattened": false}
    },
    "flattened": false
  },
  "TagDescription": {
    "type": "structure",
    "members": {
      "ResourceId": {"shape": "XmlString", "flattened": false},
      "ResourceType": {"shape": "XmlString", "flattened": false},
      "Key": {"shape": "TagKey", "flattened": false},
      "Value": {"shape": "TagValue", "flattened": false},
      "PropagateAtLaunch": {"shape": "PropagateAtLaunch", "flattened": false}
    },
    "flattened": false
  },
  "TagDescriptionList": {
    "type": "list",
    "member": {"shape": "TagDescription"},
    "flattened": false
  },
  "TagKey": {"type": "string", "flattened": false},
  "TagValue": {"type": "string", "flattened": false},
  "Tags": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "TagsType": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "TagDescriptionList", "flattened": false},
      "NextToken": {"shape": "XmlString", "flattened": false}
    },
    "flattened": false
  },
  "TargetGroupARNs": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen511"},
    "flattened": false
  },
  "TargetTrackingConfiguration": {
    "type": "structure",
    "members": {
      "PredefinedMetricSpecification": {
        "shape": "PredefinedMetricSpecification",
        "flattened": false
      },
      "CustomizedMetricSpecification": {
        "shape": "CustomizedMetricSpecification",
        "flattened": false
      },
      "TargetValue": {"shape": "MetricScale", "flattened": false},
      "DisableScaleIn": {"shape": "DisableScaleIn", "flattened": false}
    },
    "flattened": false
  },
  "TerminateInstanceInAutoScalingGroupType": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "XmlStringMaxLen19", "flattened": false},
      "ShouldDecrementDesiredCapacity": {
        "shape": "ShouldDecrementDesiredCapacity",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TerminationPolicies": {
    "type": "list",
    "member": {"shape": "XmlStringMaxLen1600"},
    "flattened": false
  },
  "TimestampType": {"type": "timestamp", "flattened": false},
  "UpdateAutoScalingGroupType": {
    "type": "structure",
    "members": {
      "AutoScalingGroupName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchConfigurationName": {
        "shape": "XmlStringMaxLen255",
        "flattened": false
      },
      "LaunchTemplate": {
        "shape": "LaunchTemplateSpecification",
        "flattened": false
      },
      "MixedInstancesPolicy": {
        "shape": "MixedInstancesPolicy",
        "flattened": false
      },
      "MinSize": {"shape": "AutoScalingGroupMinSize", "flattened": false},
      "MaxSize": {"shape": "AutoScalingGroupMaxSize", "flattened": false},
      "DesiredCapacity": {
        "shape": "AutoScalingGroupDesiredCapacity",
        "flattened": false
      },
      "DefaultCooldown": {"shape": "Cooldown", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "HealthCheckType": {"shape": "XmlStringMaxLen32", "flattened": false},
      "HealthCheckGracePeriod": {
        "shape": "HealthCheckGracePeriod",
        "flattened": false
      },
      "PlacementGroup": {"shape": "XmlStringMaxLen255", "flattened": false},
      "VPCZoneIdentifier": {"shape": "XmlStringMaxLen2047", "flattened": false},
      "TerminationPolicies": {
        "shape": "TerminationPolicies",
        "flattened": false
      },
      "NewInstancesProtectedFromScaleIn": {
        "shape": "InstanceProtected",
        "flattened": false
      },
      "ServiceLinkedRoleARN": {"shape": "ResourceName", "flattened": false},
      "MaxInstanceLifetime": {
        "shape": "MaxInstanceLifetime",
        "flattened": false
      },
      "CapacityRebalance": {
        "shape": "CapacityRebalanceEnabled",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Values": {
    "type": "list",
    "member": {"shape": "XmlString"},
    "flattened": false
  },
  "XmlString": {"type": "string", "flattened": false},
  "XmlStringMaxLen1023": {"type": "string", "flattened": false},
  "XmlStringMaxLen1600": {"type": "string", "flattened": false},
  "XmlStringMaxLen19": {"type": "string", "flattened": false},
  "XmlStringMaxLen2047": {"type": "string", "flattened": false},
  "XmlStringMaxLen255": {"type": "string", "flattened": false},
  "XmlStringMaxLen32": {"type": "string", "flattened": false},
  "XmlStringMaxLen511": {"type": "string", "flattened": false},
  "XmlStringMaxLen64": {"type": "string", "flattened": false},
  "XmlStringUserData": {"type": "string", "flattened": false}
};
