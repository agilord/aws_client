// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AccessLog": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "AccessLogEnabled", "flattened": false},
      "S3BucketName": {"shape": "S3BucketName", "flattened": false},
      "EmitInterval": {"shape": "AccessLogInterval", "flattened": false},
      "S3BucketPrefix": {"shape": "AccessLogPrefix", "flattened": false}
    },
    "flattened": false
  },
  "AccessLogEnabled": {"type": "boolean", "flattened": false},
  "AccessLogInterval": {"type": "integer", "flattened": false},
  "AccessLogPrefix": {"type": "string", "flattened": false},
  "AccessPointName": {"type": "string", "flattened": false},
  "AccessPointPort": {"type": "integer", "flattened": false},
  "AddAvailabilityZonesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false}
    },
    "flattened": false
  },
  "AddAvailabilityZonesOutput": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false}
    },
    "flattened": false
  },
  "AddTagsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "AddTagsOutput": {"type": "structure", "members": {}, "flattened": false},
  "AdditionalAttribute": {
    "type": "structure",
    "members": {
      "Key": {"shape": "AdditionalAttributeKey", "flattened": false},
      "Value": {"shape": "AdditionalAttributeValue", "flattened": false}
    },
    "flattened": false
  },
  "AdditionalAttributeKey": {"type": "string", "flattened": false},
  "AdditionalAttributeValue": {"type": "string", "flattened": false},
  "AdditionalAttributes": {
    "type": "list",
    "member": {"shape": "AdditionalAttribute"},
    "flattened": false
  },
  "AppCookieStickinessPolicies": {
    "type": "list",
    "member": {"shape": "AppCookieStickinessPolicy"},
    "flattened": false
  },
  "AppCookieStickinessPolicy": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "CookieName": {"shape": "CookieName", "flattened": false}
    },
    "flattened": false
  },
  "ApplySecurityGroupsToLoadBalancerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false}
    },
    "flattened": false
  },
  "ApplySecurityGroupsToLoadBalancerOutput": {
    "type": "structure",
    "members": {
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false}
    },
    "flattened": false
  },
  "AttachLoadBalancerToSubnetsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false}
    },
    "flattened": false
  },
  "AttachLoadBalancerToSubnetsOutput": {
    "type": "structure",
    "members": {
      "Subnets": {"shape": "Subnets", "flattened": false}
    },
    "flattened": false
  },
  "AttributeName": {"type": "string", "flattened": false},
  "AttributeType": {"type": "string", "flattened": false},
  "AttributeValue": {"type": "string", "flattened": false},
  "AvailabilityZone": {"type": "string", "flattened": false},
  "AvailabilityZones": {
    "type": "list",
    "member": {"shape": "AvailabilityZone"},
    "flattened": false
  },
  "BackendServerDescription": {
    "type": "structure",
    "members": {
      "InstancePort": {"shape": "InstancePort", "flattened": false},
      "PolicyNames": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "BackendServerDescriptions": {
    "type": "list",
    "member": {"shape": "BackendServerDescription"},
    "flattened": false
  },
  "Cardinality": {"type": "string", "flattened": false},
  "ConfigureHealthCheckInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "HealthCheck": {"shape": "HealthCheck", "flattened": false}
    },
    "flattened": false
  },
  "ConfigureHealthCheckOutput": {
    "type": "structure",
    "members": {
      "HealthCheck": {"shape": "HealthCheck", "flattened": false}
    },
    "flattened": false
  },
  "ConnectionDraining": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "ConnectionDrainingEnabled", "flattened": false},
      "Timeout": {"shape": "ConnectionDrainingTimeout", "flattened": false}
    },
    "flattened": false
  },
  "ConnectionDrainingEnabled": {"type": "boolean", "flattened": false},
  "ConnectionDrainingTimeout": {"type": "integer", "flattened": false},
  "ConnectionSettings": {
    "type": "structure",
    "members": {
      "IdleTimeout": {"shape": "IdleTimeout", "flattened": false}
    },
    "flattened": false
  },
  "CookieExpirationPeriod": {"type": "long", "flattened": false},
  "CookieName": {"type": "string", "flattened": false},
  "CreateAccessPointInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Listeners": {"shape": "Listeners", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "Scheme": {"shape": "LoadBalancerScheme", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateAccessPointOutput": {
    "type": "structure",
    "members": {
      "DNSName": {"shape": "DNSName", "flattened": false}
    },
    "flattened": false
  },
  "CreateAppCookieStickinessPolicyInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "CookieName": {"shape": "CookieName", "flattened": false}
    },
    "flattened": false
  },
  "CreateAppCookieStickinessPolicyOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateLBCookieStickinessPolicyInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "CookieExpirationPeriod": {
        "shape": "CookieExpirationPeriod",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateLBCookieStickinessPolicyOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateLoadBalancerListenerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Listeners": {"shape": "Listeners", "flattened": false}
    },
    "flattened": false
  },
  "CreateLoadBalancerListenerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateLoadBalancerPolicyInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "PolicyTypeName": {"shape": "PolicyTypeName", "flattened": false},
      "PolicyAttributes": {"shape": "PolicyAttributes", "flattened": false}
    },
    "flattened": false
  },
  "CreateLoadBalancerPolicyOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreatedTime": {"type": "timestamp", "flattened": false},
  "CrossZoneLoadBalancing": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "CrossZoneLoadBalancingEnabled", "flattened": false}
    },
    "flattened": false
  },
  "CrossZoneLoadBalancingEnabled": {"type": "boolean", "flattened": false},
  "DNSName": {"type": "string", "flattened": false},
  "DefaultValue": {"type": "string", "flattened": false},
  "DeleteAccessPointInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAccessPointOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteLoadBalancerListenerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "LoadBalancerPorts": {"shape": "Ports", "flattened": false}
    },
    "flattened": false
  },
  "DeleteLoadBalancerListenerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteLoadBalancerPolicyInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteLoadBalancerPolicyOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeregisterEndPointsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Instances": {"shape": "Instances", "flattened": false}
    },
    "flattened": false
  },
  "DeregisterEndPointsOutput": {
    "type": "structure",
    "members": {
      "Instances": {"shape": "Instances", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccessPointsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccessPointsOutput": {
    "type": "structure",
    "members": {
      "LoadBalancerDescriptions": {
        "shape": "LoadBalancerDescriptions",
        "flattened": false
      },
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccountLimitsInput": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeAccountLimitsOutput": {
    "type": "structure",
    "members": {
      "Limits": {"shape": "Limits", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEndPointStateInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Instances": {"shape": "Instances", "flattened": false}
    },
    "flattened": false
  },
  "DescribeEndPointStateOutput": {
    "type": "structure",
    "members": {
      "InstanceStates": {"shape": "InstanceStates", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerAttributesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerAttributesOutput": {
    "type": "structure",
    "members": {
      "LoadBalancerAttributes": {
        "shape": "LoadBalancerAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeLoadBalancerPoliciesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "PolicyNames": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerPoliciesOutput": {
    "type": "structure",
    "members": {
      "PolicyDescriptions": {"shape": "PolicyDescriptions", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerPolicyTypesInput": {
    "type": "structure",
    "members": {
      "PolicyTypeNames": {"shape": "PolicyTypeNames", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerPolicyTypesOutput": {
    "type": "structure",
    "members": {
      "PolicyTypeDescriptions": {
        "shape": "PolicyTypeDescriptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeTagsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerNames": {
        "shape": "LoadBalancerNamesMax20",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeTagsOutput": {
    "type": "structure",
    "members": {
      "TagDescriptions": {"shape": "TagDescriptions", "flattened": false}
    },
    "flattened": false
  },
  "Description": {"type": "string", "flattened": false},
  "DetachLoadBalancerFromSubnetsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false}
    },
    "flattened": false
  },
  "DetachLoadBalancerFromSubnetsOutput": {
    "type": "structure",
    "members": {
      "Subnets": {"shape": "Subnets", "flattened": false}
    },
    "flattened": false
  },
  "EndPointPort": {"type": "integer", "flattened": false},
  "HealthCheck": {
    "type": "structure",
    "members": {
      "Target": {"shape": "HealthCheckTarget", "flattened": false},
      "Interval": {"shape": "HealthCheckInterval", "flattened": false},
      "Timeout": {"shape": "HealthCheckTimeout", "flattened": false},
      "UnhealthyThreshold": {"shape": "UnhealthyThreshold", "flattened": false},
      "HealthyThreshold": {"shape": "HealthyThreshold", "flattened": false}
    },
    "flattened": false
  },
  "HealthCheckInterval": {"type": "integer", "flattened": false},
  "HealthCheckTarget": {"type": "string", "flattened": false},
  "HealthCheckTimeout": {"type": "integer", "flattened": false},
  "HealthyThreshold": {"type": "integer", "flattened": false},
  "IdleTimeout": {"type": "integer", "flattened": false},
  "Instance": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "InstanceId", "flattened": false}
    },
    "flattened": false
  },
  "InstanceId": {"type": "string", "flattened": false},
  "InstancePort": {"type": "integer", "flattened": false},
  "InstanceState": {
    "type": "structure",
    "members": {
      "InstanceId": {"shape": "InstanceId", "flattened": false},
      "State": {"shape": "State", "flattened": false},
      "ReasonCode": {"shape": "ReasonCode", "flattened": false},
      "Description": {"shape": "Description", "flattened": false}
    },
    "flattened": false
  },
  "InstanceStates": {
    "type": "list",
    "member": {"shape": "InstanceState"},
    "flattened": false
  },
  "Instances": {
    "type": "list",
    "member": {"shape": "Instance"},
    "flattened": false
  },
  "LBCookieStickinessPolicies": {
    "type": "list",
    "member": {"shape": "LBCookieStickinessPolicy"},
    "flattened": false
  },
  "LBCookieStickinessPolicy": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "CookieExpirationPeriod": {
        "shape": "CookieExpirationPeriod",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Limit": {
    "type": "structure",
    "members": {
      "Name": {"shape": "Name", "flattened": false},
      "Max": {"shape": "Max", "flattened": false}
    },
    "flattened": false
  },
  "Limits": {
    "type": "list",
    "member": {"shape": "Limit"},
    "flattened": false
  },
  "Listener": {
    "type": "structure",
    "members": {
      "Protocol": {"shape": "Protocol", "flattened": false},
      "LoadBalancerPort": {"shape": "AccessPointPort", "flattened": false},
      "InstanceProtocol": {"shape": "Protocol", "flattened": false},
      "InstancePort": {"shape": "InstancePort", "flattened": false},
      "SSLCertificateId": {"shape": "SSLCertificateId", "flattened": false}
    },
    "flattened": false
  },
  "ListenerDescription": {
    "type": "structure",
    "members": {
      "Listener": {"shape": "Listener", "flattened": false},
      "PolicyNames": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "ListenerDescriptions": {
    "type": "list",
    "member": {"shape": "ListenerDescription"},
    "flattened": false
  },
  "Listeners": {
    "type": "list",
    "member": {"shape": "Listener"},
    "flattened": false
  },
  "LoadBalancerAttributes": {
    "type": "structure",
    "members": {
      "CrossZoneLoadBalancing": {
        "shape": "CrossZoneLoadBalancing",
        "flattened": false
      },
      "AccessLog": {"shape": "AccessLog", "flattened": false},
      "ConnectionDraining": {"shape": "ConnectionDraining", "flattened": false},
      "ConnectionSettings": {"shape": "ConnectionSettings", "flattened": false},
      "AdditionalAttributes": {
        "shape": "AdditionalAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LoadBalancerDescription": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "DNSName": {"shape": "DNSName", "flattened": false},
      "CanonicalHostedZoneName": {"shape": "DNSName", "flattened": false},
      "CanonicalHostedZoneNameID": {"shape": "DNSName", "flattened": false},
      "ListenerDescriptions": {
        "shape": "ListenerDescriptions",
        "flattened": false
      },
      "Policies": {"shape": "Policies", "flattened": false},
      "BackendServerDescriptions": {
        "shape": "BackendServerDescriptions",
        "flattened": false
      },
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false},
      "VPCId": {"shape": "VPCId", "flattened": false},
      "Instances": {"shape": "Instances", "flattened": false},
      "HealthCheck": {"shape": "HealthCheck", "flattened": false},
      "SourceSecurityGroup": {
        "shape": "SourceSecurityGroup",
        "flattened": false
      },
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "CreatedTime": {"shape": "CreatedTime", "flattened": false},
      "Scheme": {"shape": "LoadBalancerScheme", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerDescriptions": {
    "type": "list",
    "member": {"shape": "LoadBalancerDescription"},
    "flattened": false
  },
  "LoadBalancerNames": {
    "type": "list",
    "member": {"shape": "AccessPointName"},
    "flattened": false
  },
  "LoadBalancerNamesMax20": {
    "type": "list",
    "member": {"shape": "AccessPointName"},
    "flattened": false
  },
  "LoadBalancerScheme": {"type": "string", "flattened": false},
  "Marker": {"type": "string", "flattened": false},
  "Max": {"type": "string", "flattened": false},
  "ModifyLoadBalancerAttributesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "LoadBalancerAttributes": {
        "shape": "LoadBalancerAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyLoadBalancerAttributesOutput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "LoadBalancerAttributes": {
        "shape": "LoadBalancerAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Name": {"type": "string", "flattened": false},
  "PageSize": {"type": "integer", "flattened": false},
  "Policies": {
    "type": "structure",
    "members": {
      "AppCookieStickinessPolicies": {
        "shape": "AppCookieStickinessPolicies",
        "flattened": false
      },
      "LBCookieStickinessPolicies": {
        "shape": "LBCookieStickinessPolicies",
        "flattened": false
      },
      "OtherPolicies": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "PolicyAttribute": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "AttributeName", "flattened": false},
      "AttributeValue": {"shape": "AttributeValue", "flattened": false}
    },
    "flattened": false
  },
  "PolicyAttributeDescription": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "AttributeName", "flattened": false},
      "AttributeValue": {"shape": "AttributeValue", "flattened": false}
    },
    "flattened": false
  },
  "PolicyAttributeDescriptions": {
    "type": "list",
    "member": {"shape": "PolicyAttributeDescription"},
    "flattened": false
  },
  "PolicyAttributeTypeDescription": {
    "type": "structure",
    "members": {
      "AttributeName": {"shape": "AttributeName", "flattened": false},
      "AttributeType": {"shape": "AttributeType", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "DefaultValue": {"shape": "DefaultValue", "flattened": false},
      "Cardinality": {"shape": "Cardinality", "flattened": false}
    },
    "flattened": false
  },
  "PolicyAttributeTypeDescriptions": {
    "type": "list",
    "member": {"shape": "PolicyAttributeTypeDescription"},
    "flattened": false
  },
  "PolicyAttributes": {
    "type": "list",
    "member": {"shape": "PolicyAttribute"},
    "flattened": false
  },
  "PolicyDescription": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "PolicyTypeName": {"shape": "PolicyTypeName", "flattened": false},
      "PolicyAttributeDescriptions": {
        "shape": "PolicyAttributeDescriptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PolicyDescriptions": {
    "type": "list",
    "member": {"shape": "PolicyDescription"},
    "flattened": false
  },
  "PolicyName": {"type": "string", "flattened": false},
  "PolicyNames": {
    "type": "list",
    "member": {"shape": "PolicyName"},
    "flattened": false
  },
  "PolicyTypeDescription": {
    "type": "structure",
    "members": {
      "PolicyTypeName": {"shape": "PolicyTypeName", "flattened": false},
      "Description": {"shape": "Description", "flattened": false},
      "PolicyAttributeTypeDescriptions": {
        "shape": "PolicyAttributeTypeDescriptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PolicyTypeDescriptions": {
    "type": "list",
    "member": {"shape": "PolicyTypeDescription"},
    "flattened": false
  },
  "PolicyTypeName": {"type": "string", "flattened": false},
  "PolicyTypeNames": {
    "type": "list",
    "member": {"shape": "PolicyTypeName"},
    "flattened": false
  },
  "Ports": {
    "type": "list",
    "member": {"shape": "AccessPointPort"},
    "flattened": false
  },
  "Protocol": {"type": "string", "flattened": false},
  "ReasonCode": {"type": "string", "flattened": false},
  "RegisterEndPointsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Instances": {"shape": "Instances", "flattened": false}
    },
    "flattened": false
  },
  "RegisterEndPointsOutput": {
    "type": "structure",
    "members": {
      "Instances": {"shape": "Instances", "flattened": false}
    },
    "flattened": false
  },
  "RemoveAvailabilityZonesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false}
    },
    "flattened": false
  },
  "RemoveAvailabilityZonesOutput": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false}
    },
    "flattened": false
  },
  "RemoveTagsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerNames": {"shape": "LoadBalancerNames", "flattened": false},
      "Tags": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  },
  "RemoveTagsOutput": {"type": "structure", "members": {}, "flattened": false},
  "S3BucketName": {"type": "string", "flattened": false},
  "SSLCertificateId": {"type": "string", "flattened": false},
  "SecurityGroupId": {"type": "string", "flattened": false},
  "SecurityGroupName": {"type": "string", "flattened": false},
  "SecurityGroupOwnerAlias": {"type": "string", "flattened": false},
  "SecurityGroups": {
    "type": "list",
    "member": {"shape": "SecurityGroupId"},
    "flattened": false
  },
  "SetLoadBalancerListenerSSLCertificateInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "LoadBalancerPort": {"shape": "AccessPointPort", "flattened": false},
      "SSLCertificateId": {"shape": "SSLCertificateId", "flattened": false}
    },
    "flattened": false
  },
  "SetLoadBalancerListenerSSLCertificateOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetLoadBalancerPoliciesForBackendServerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "InstancePort": {"shape": "EndPointPort", "flattened": false},
      "PolicyNames": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "SetLoadBalancerPoliciesForBackendServerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetLoadBalancerPoliciesOfListenerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "LoadBalancerPort": {"shape": "AccessPointPort", "flattened": false},
      "PolicyNames": {"shape": "PolicyNames", "flattened": false}
    },
    "flattened": false
  },
  "SetLoadBalancerPoliciesOfListenerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SourceSecurityGroup": {
    "type": "structure",
    "members": {
      "OwnerAlias": {"shape": "SecurityGroupOwnerAlias", "flattened": false},
      "GroupName": {"shape": "SecurityGroupName", "flattened": false}
    },
    "flattened": false
  },
  "State": {"type": "string", "flattened": false},
  "SubnetId": {"type": "string", "flattened": false},
  "Subnets": {
    "type": "list",
    "member": {"shape": "SubnetId"},
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
  "TagDescription": {
    "type": "structure",
    "members": {
      "LoadBalancerName": {"shape": "AccessPointName", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "TagDescriptions": {
    "type": "list",
    "member": {"shape": "TagDescription"},
    "flattened": false
  },
  "TagKey": {"type": "string", "flattened": false},
  "TagKeyList": {
    "type": "list",
    "member": {"shape": "TagKeyOnly"},
    "flattened": false
  },
  "TagKeyOnly": {
    "type": "structure",
    "members": {
      "Key": {"shape": "TagKey", "flattened": false}
    },
    "flattened": false
  },
  "TagList": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "TagValue": {"type": "string", "flattened": false},
  "UnhealthyThreshold": {"type": "integer", "flattened": false},
  "VPCId": {"type": "string", "flattened": false}
};
