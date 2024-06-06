// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "Action": {
    "type": "structure",
    "members": {
      "Type": {"shape": "ActionTypeEnum", "flattened": false},
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "AuthenticateOidcConfig": {
        "shape": "AuthenticateOidcActionConfig",
        "flattened": false
      },
      "AuthenticateCognitoConfig": {
        "shape": "AuthenticateCognitoActionConfig",
        "flattened": false
      },
      "Order": {"shape": "ActionOrder", "flattened": false},
      "RedirectConfig": {"shape": "RedirectActionConfig", "flattened": false},
      "FixedResponseConfig": {
        "shape": "FixedResponseActionConfig",
        "flattened": false
      },
      "ForwardConfig": {"shape": "ForwardActionConfig", "flattened": false}
    },
    "flattened": false
  },
  "ActionOrder": {"type": "integer", "flattened": false},
  "ActionTypeEnum": {"type": "string", "flattened": false},
  "Actions": {
    "type": "list",
    "member": {"shape": "Action"},
    "flattened": false
  },
  "AddListenerCertificatesInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "Certificates": {"shape": "CertificateList", "flattened": false}
    },
    "flattened": false
  },
  "AddListenerCertificatesOutput": {
    "type": "structure",
    "members": {
      "Certificates": {"shape": "CertificateList", "flattened": false}
    },
    "flattened": false
  },
  "AddTagsInput": {
    "type": "structure",
    "members": {
      "ResourceArns": {"shape": "ResourceArns", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "AddTagsOutput": {"type": "structure", "members": {}, "flattened": false},
  "AddTrustStoreRevocationsInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationContents": {"shape": "RevocationContents", "flattened": false}
    },
    "flattened": false
  },
  "AddTrustStoreRevocationsOutput": {
    "type": "structure",
    "members": {
      "TrustStoreRevocations": {
        "shape": "TrustStoreRevocations",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AllocationId": {"type": "string", "flattened": false},
  "AlpnPolicyName": {
    "type": "list",
    "member": {"shape": "AlpnPolicyValue"},
    "flattened": false
  },
  "AlpnPolicyValue": {"type": "string", "flattened": false},
  "AnomalyDetection": {
    "type": "structure",
    "members": {
      "Result": {"shape": "AnomalyResultEnum", "flattened": false},
      "MitigationInEffect": {
        "shape": "MitigationInEffectEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AnomalyResultEnum": {"type": "string", "flattened": false},
  "AuthenticateCognitoActionAuthenticationRequestExtraParams": {
    "type": "map",
    "key": {"shape": "AuthenticateCognitoActionAuthenticationRequestParamName"},
    "value": {
      "shape": "AuthenticateCognitoActionAuthenticationRequestParamValue"
    },
    "flattened": false
  },
  "AuthenticateCognitoActionAuthenticationRequestParamName": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionAuthenticationRequestParamValue": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionConditionalBehaviorEnum": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionConfig": {
    "type": "structure",
    "members": {
      "UserPoolArn": {
        "shape": "AuthenticateCognitoActionUserPoolArn",
        "flattened": false
      },
      "UserPoolClientId": {
        "shape": "AuthenticateCognitoActionUserPoolClientId",
        "flattened": false
      },
      "UserPoolDomain": {
        "shape": "AuthenticateCognitoActionUserPoolDomain",
        "flattened": false
      },
      "SessionCookieName": {
        "shape": "AuthenticateCognitoActionSessionCookieName",
        "flattened": false
      },
      "Scope": {"shape": "AuthenticateCognitoActionScope", "flattened": false},
      "SessionTimeout": {
        "shape": "AuthenticateCognitoActionSessionTimeout",
        "flattened": false
      },
      "AuthenticationRequestExtraParams": {
        "shape": "AuthenticateCognitoActionAuthenticationRequestExtraParams",
        "flattened": false
      },
      "OnUnauthenticatedRequest": {
        "shape": "AuthenticateCognitoActionConditionalBehaviorEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AuthenticateCognitoActionScope": {"type": "string", "flattened": false},
  "AuthenticateCognitoActionSessionCookieName": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionSessionTimeout": {
    "type": "long",
    "flattened": false
  },
  "AuthenticateCognitoActionUserPoolArn": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionUserPoolClientId": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateCognitoActionUserPoolDomain": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionAuthenticationRequestExtraParams": {
    "type": "map",
    "key": {"shape": "AuthenticateOidcActionAuthenticationRequestParamName"},
    "value": {"shape": "AuthenticateOidcActionAuthenticationRequestParamValue"},
    "flattened": false
  },
  "AuthenticateOidcActionAuthenticationRequestParamName": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionAuthenticationRequestParamValue": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionAuthorizationEndpoint": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionClientId": {"type": "string", "flattened": false},
  "AuthenticateOidcActionClientSecret": {"type": "string", "flattened": false},
  "AuthenticateOidcActionConditionalBehaviorEnum": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionConfig": {
    "type": "structure",
    "members": {
      "Issuer": {"shape": "AuthenticateOidcActionIssuer", "flattened": false},
      "AuthorizationEndpoint": {
        "shape": "AuthenticateOidcActionAuthorizationEndpoint",
        "flattened": false
      },
      "TokenEndpoint": {
        "shape": "AuthenticateOidcActionTokenEndpoint",
        "flattened": false
      },
      "UserInfoEndpoint": {
        "shape": "AuthenticateOidcActionUserInfoEndpoint",
        "flattened": false
      },
      "ClientId": {
        "shape": "AuthenticateOidcActionClientId",
        "flattened": false
      },
      "ClientSecret": {
        "shape": "AuthenticateOidcActionClientSecret",
        "flattened": false
      },
      "SessionCookieName": {
        "shape": "AuthenticateOidcActionSessionCookieName",
        "flattened": false
      },
      "Scope": {"shape": "AuthenticateOidcActionScope", "flattened": false},
      "SessionTimeout": {
        "shape": "AuthenticateOidcActionSessionTimeout",
        "flattened": false
      },
      "AuthenticationRequestExtraParams": {
        "shape": "AuthenticateOidcActionAuthenticationRequestExtraParams",
        "flattened": false
      },
      "OnUnauthenticatedRequest": {
        "shape": "AuthenticateOidcActionConditionalBehaviorEnum",
        "flattened": false
      },
      "UseExistingClientSecret": {
        "shape": "AuthenticateOidcActionUseExistingClientSecret",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AuthenticateOidcActionIssuer": {"type": "string", "flattened": false},
  "AuthenticateOidcActionScope": {"type": "string", "flattened": false},
  "AuthenticateOidcActionSessionCookieName": {
    "type": "string",
    "flattened": false
  },
  "AuthenticateOidcActionSessionTimeout": {"type": "long", "flattened": false},
  "AuthenticateOidcActionTokenEndpoint": {"type": "string", "flattened": false},
  "AuthenticateOidcActionUseExistingClientSecret": {
    "type": "boolean",
    "flattened": false
  },
  "AuthenticateOidcActionUserInfoEndpoint": {
    "type": "string",
    "flattened": false
  },
  "AvailabilityZone": {
    "type": "structure",
    "members": {
      "ZoneName": {"shape": "ZoneName", "flattened": false},
      "SubnetId": {"shape": "SubnetId", "flattened": false},
      "OutpostId": {"shape": "OutpostId", "flattened": false},
      "LoadBalancerAddresses": {
        "shape": "LoadBalancerAddresses",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AvailabilityZones": {
    "type": "list",
    "member": {"shape": "AvailabilityZone"},
    "flattened": false
  },
  "CanonicalHostedZoneId": {"type": "string", "flattened": false},
  "Certificate": {
    "type": "structure",
    "members": {
      "CertificateArn": {"shape": "CertificateArn", "flattened": false},
      "IsDefault": {"shape": "Default", "flattened": false}
    },
    "flattened": false
  },
  "CertificateArn": {"type": "string", "flattened": false},
  "CertificateList": {
    "type": "list",
    "member": {"shape": "Certificate"},
    "flattened": false
  },
  "Cipher": {
    "type": "structure",
    "members": {
      "Name": {"shape": "CipherName", "flattened": false},
      "Priority": {"shape": "CipherPriority", "flattened": false}
    },
    "flattened": false
  },
  "CipherName": {"type": "string", "flattened": false},
  "CipherPriority": {"type": "integer", "flattened": false},
  "Ciphers": {
    "type": "list",
    "member": {"shape": "Cipher"},
    "flattened": false
  },
  "ConditionFieldName": {"type": "string", "flattened": false},
  "CreateListenerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "Protocol": {"shape": "ProtocolEnum", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "SslPolicy": {"shape": "SslPolicyName", "flattened": false},
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "DefaultActions": {"shape": "Actions", "flattened": false},
      "AlpnPolicy": {"shape": "AlpnPolicyName", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "MutualAuthentication": {
        "shape": "MutualAuthenticationAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateListenerOutput": {
    "type": "structure",
    "members": {
      "Listeners": {"shape": "Listeners", "flattened": false}
    },
    "flattened": false
  },
  "CreateLoadBalancerInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "LoadBalancerName", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false},
      "SubnetMappings": {"shape": "SubnetMappings", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "Scheme": {"shape": "LoadBalancerSchemeEnum", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "Type": {"shape": "LoadBalancerTypeEnum", "flattened": false},
      "IpAddressType": {"shape": "IpAddressType", "flattened": false},
      "CustomerOwnedIpv4Pool": {
        "shape": "CustomerOwnedIpv4Pool",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateLoadBalancerOutput": {
    "type": "structure",
    "members": {
      "LoadBalancers": {"shape": "LoadBalancers", "flattened": false}
    },
    "flattened": false
  },
  "CreateRuleInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "Conditions": {"shape": "RuleConditionList", "flattened": false},
      "Priority": {"shape": "RulePriority", "flattened": false},
      "Actions": {"shape": "Actions", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateRuleOutput": {
    "type": "structure",
    "members": {
      "Rules": {"shape": "Rules", "flattened": false}
    },
    "flattened": false
  },
  "CreateTargetGroupInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "TargetGroupName", "flattened": false},
      "Protocol": {"shape": "ProtocolEnum", "flattened": false},
      "ProtocolVersion": {"shape": "ProtocolVersion", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "VpcId": {"shape": "VpcId", "flattened": false},
      "HealthCheckProtocol": {"shape": "ProtocolEnum", "flattened": false},
      "HealthCheckPort": {"shape": "HealthCheckPort", "flattened": false},
      "HealthCheckEnabled": {"shape": "HealthCheckEnabled", "flattened": false},
      "HealthCheckPath": {"shape": "Path", "flattened": false},
      "HealthCheckIntervalSeconds": {
        "shape": "HealthCheckIntervalSeconds",
        "flattened": false
      },
      "HealthCheckTimeoutSeconds": {
        "shape": "HealthCheckTimeoutSeconds",
        "flattened": false
      },
      "HealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "UnhealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "Matcher": {"shape": "Matcher", "flattened": false},
      "TargetType": {"shape": "TargetTypeEnum", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "IpAddressType": {
        "shape": "TargetGroupIpAddressTypeEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateTargetGroupOutput": {
    "type": "structure",
    "members": {
      "TargetGroups": {"shape": "TargetGroups", "flattened": false}
    },
    "flattened": false
  },
  "CreateTrustStoreInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "TrustStoreName", "flattened": false},
      "CaCertificatesBundleS3Bucket": {"shape": "S3Bucket", "flattened": false},
      "CaCertificatesBundleS3Key": {"shape": "S3Key", "flattened": false},
      "CaCertificatesBundleS3ObjectVersion": {
        "shape": "S3ObjectVersion",
        "flattened": false
      },
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "CreateTrustStoreOutput": {
    "type": "structure",
    "members": {
      "TrustStores": {"shape": "TrustStores", "flattened": false}
    },
    "flattened": false
  },
  "CreatedTime": {"type": "timestamp", "flattened": false},
  "CustomerOwnedIpv4Pool": {"type": "string", "flattened": false},
  "DNSName": {"type": "string", "flattened": false},
  "Default": {"type": "boolean", "flattened": false},
  "DeleteListenerInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false}
    },
    "flattened": false
  },
  "DeleteListenerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteLoadBalancerInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false}
    },
    "flattened": false
  },
  "DeleteLoadBalancerOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteRuleInput": {
    "type": "structure",
    "members": {
      "RuleArn": {"shape": "RuleArn", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRuleOutput": {"type": "structure", "members": {}, "flattened": false},
  "DeleteTargetGroupInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTargetGroupOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteTrustStoreInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTrustStoreOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeregisterTargetsInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "Targets": {"shape": "TargetDescriptions", "flattened": false}
    },
    "flattened": false
  },
  "DeregisterTargetsOutput": {
    "type": "structure",
    "members": {},
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
  "DescribeListenerCertificatesInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeListenerCertificatesOutput": {
    "type": "structure",
    "members": {
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeListenersInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "ListenerArns": {"shape": "ListenerArns", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeListenersOutput": {
    "type": "structure",
    "members": {
      "Listeners": {"shape": "Listeners", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerAttributesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancerAttributesOutput": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "LoadBalancerAttributes", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancersInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArns": {"shape": "LoadBalancerArns", "flattened": false},
      "Names": {"shape": "LoadBalancerNames", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeLoadBalancersOutput": {
    "type": "structure",
    "members": {
      "LoadBalancers": {"shape": "LoadBalancers", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeRulesInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "RuleArns": {"shape": "RuleArns", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeRulesOutput": {
    "type": "structure",
    "members": {
      "Rules": {"shape": "Rules", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSSLPoliciesInput": {
    "type": "structure",
    "members": {
      "Names": {"shape": "SslPolicyNames", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false},
      "LoadBalancerType": {"shape": "LoadBalancerTypeEnum", "flattened": false}
    },
    "flattened": false
  },
  "DescribeSSLPoliciesOutput": {
    "type": "structure",
    "members": {
      "SslPolicies": {"shape": "SslPolicies", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTagsInput": {
    "type": "structure",
    "members": {
      "ResourceArns": {"shape": "ResourceArns", "flattened": false}
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
  "DescribeTargetGroupAttributesInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTargetGroupAttributesOutput": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "TargetGroupAttributes", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTargetGroupsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "TargetGroupArns": {"shape": "TargetGroupArns", "flattened": false},
      "Names": {"shape": "TargetGroupNames", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTargetGroupsOutput": {
    "type": "structure",
    "members": {
      "TargetGroups": {"shape": "TargetGroups", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTargetHealthInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "Targets": {"shape": "TargetDescriptions", "flattened": false},
      "Include": {
        "shape": "ListOfDescribeTargetHealthIncludeOptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeTargetHealthInputIncludeEnum": {
    "type": "string",
    "flattened": false
  },
  "DescribeTargetHealthOutput": {
    "type": "structure",
    "members": {
      "TargetHealthDescriptions": {
        "shape": "TargetHealthDescriptions",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeTrustStoreAssociationsInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTrustStoreAssociationsOutput": {
    "type": "structure",
    "members": {
      "TrustStoreAssociations": {
        "shape": "TrustStoreAssociations",
        "flattened": false
      },
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTrustStoreRevocation": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationId": {"shape": "RevocationId", "flattened": false},
      "RevocationType": {"shape": "RevocationType", "flattened": false},
      "NumberOfRevokedEntries": {
        "shape": "NumberOfRevokedEntries",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeTrustStoreRevocationResponse": {
    "type": "list",
    "member": {"shape": "DescribeTrustStoreRevocation"},
    "flattened": false
  },
  "DescribeTrustStoreRevocationsInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationIds": {"shape": "RevocationIds", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTrustStoreRevocationsOutput": {
    "type": "structure",
    "members": {
      "TrustStoreRevocations": {
        "shape": "DescribeTrustStoreRevocationResponse",
        "flattened": false
      },
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTrustStoresInput": {
    "type": "structure",
    "members": {
      "TrustStoreArns": {"shape": "TrustStoreArns", "flattened": false},
      "Names": {"shape": "TrustStoreNames", "flattened": false},
      "Marker": {"shape": "Marker", "flattened": false},
      "PageSize": {"shape": "PageSize", "flattened": false}
    },
    "flattened": false
  },
  "DescribeTrustStoresOutput": {
    "type": "structure",
    "members": {
      "TrustStores": {"shape": "TrustStores", "flattened": false},
      "NextMarker": {"shape": "Marker", "flattened": false}
    },
    "flattened": false
  },
  "Description": {"type": "string", "flattened": false},
  "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic": {
    "type": "string",
    "flattened": false
  },
  "EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum": {
    "type": "string",
    "flattened": false
  },
  "FixedResponseActionConfig": {
    "type": "structure",
    "members": {
      "MessageBody": {
        "shape": "FixedResponseActionMessage",
        "flattened": false
      },
      "StatusCode": {
        "shape": "FixedResponseActionStatusCode",
        "flattened": false
      },
      "ContentType": {
        "shape": "FixedResponseActionContentType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "FixedResponseActionContentType": {"type": "string", "flattened": false},
  "FixedResponseActionMessage": {"type": "string", "flattened": false},
  "FixedResponseActionStatusCode": {"type": "string", "flattened": false},
  "ForwardActionConfig": {
    "type": "structure",
    "members": {
      "TargetGroups": {"shape": "TargetGroupList", "flattened": false},
      "TargetGroupStickinessConfig": {
        "shape": "TargetGroupStickinessConfig",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetTrustStoreCaCertificatesBundleInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false}
    },
    "flattened": false
  },
  "GetTrustStoreCaCertificatesBundleOutput": {
    "type": "structure",
    "members": {
      "Location": {"shape": "Location", "flattened": false}
    },
    "flattened": false
  },
  "GetTrustStoreRevocationContentInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationId": {"shape": "RevocationId", "flattened": false}
    },
    "flattened": false
  },
  "GetTrustStoreRevocationContentOutput": {
    "type": "structure",
    "members": {
      "Location": {"shape": "Location", "flattened": false}
    },
    "flattened": false
  },
  "GrpcCode": {"type": "string", "flattened": false},
  "HealthCheckEnabled": {"type": "boolean", "flattened": false},
  "HealthCheckIntervalSeconds": {"type": "integer", "flattened": false},
  "HealthCheckPort": {"type": "string", "flattened": false},
  "HealthCheckThresholdCount": {"type": "integer", "flattened": false},
  "HealthCheckTimeoutSeconds": {"type": "integer", "flattened": false},
  "HostHeaderConditionConfig": {
    "type": "structure",
    "members": {
      "Values": {"shape": "ListOfString", "flattened": false}
    },
    "flattened": false
  },
  "HttpCode": {"type": "string", "flattened": false},
  "HttpHeaderConditionConfig": {
    "type": "structure",
    "members": {
      "HttpHeaderName": {
        "shape": "HttpHeaderConditionName",
        "flattened": false
      },
      "Values": {"shape": "ListOfString", "flattened": false}
    },
    "flattened": false
  },
  "HttpHeaderConditionName": {"type": "string", "flattened": false},
  "HttpRequestMethodConditionConfig": {
    "type": "structure",
    "members": {
      "Values": {"shape": "ListOfString", "flattened": false}
    },
    "flattened": false
  },
  "IPv6Address": {"type": "string", "flattened": false},
  "IgnoreClientCertificateExpiry": {"type": "boolean", "flattened": false},
  "IpAddress": {"type": "string", "flattened": false},
  "IpAddressType": {"type": "string", "flattened": false},
  "IsDefault": {"type": "boolean", "flattened": false},
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
  "ListOfDescribeTargetHealthIncludeOptions": {
    "type": "list",
    "member": {"shape": "DescribeTargetHealthInputIncludeEnum"},
    "flattened": false
  },
  "ListOfString": {
    "type": "list",
    "member": {"shape": "StringValue"},
    "flattened": false
  },
  "Listener": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "Protocol": {"shape": "ProtocolEnum", "flattened": false},
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "SslPolicy": {"shape": "SslPolicyName", "flattened": false},
      "DefaultActions": {"shape": "Actions", "flattened": false},
      "AlpnPolicy": {"shape": "AlpnPolicyName", "flattened": false},
      "MutualAuthentication": {
        "shape": "MutualAuthenticationAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListenerArn": {"type": "string", "flattened": false},
  "ListenerArns": {
    "type": "list",
    "member": {"shape": "ListenerArn"},
    "flattened": false
  },
  "Listeners": {
    "type": "list",
    "member": {"shape": "Listener"},
    "flattened": false
  },
  "LoadBalancer": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "DNSName": {"shape": "DNSName", "flattened": false},
      "CanonicalHostedZoneId": {
        "shape": "CanonicalHostedZoneId",
        "flattened": false
      },
      "CreatedTime": {"shape": "CreatedTime", "flattened": false},
      "LoadBalancerName": {"shape": "LoadBalancerName", "flattened": false},
      "Scheme": {"shape": "LoadBalancerSchemeEnum", "flattened": false},
      "VpcId": {"shape": "VpcId", "flattened": false},
      "State": {"shape": "LoadBalancerState", "flattened": false},
      "Type": {"shape": "LoadBalancerTypeEnum", "flattened": false},
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "IpAddressType": {"shape": "IpAddressType", "flattened": false},
      "CustomerOwnedIpv4Pool": {
        "shape": "CustomerOwnedIpv4Pool",
        "flattened": false
      },
      "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic": {
        "shape": "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic",
        "flattened": false
      }
    },
    "flattened": false
  },
  "LoadBalancerAddress": {
    "type": "structure",
    "members": {
      "IpAddress": {"shape": "IpAddress", "flattened": false},
      "AllocationId": {"shape": "AllocationId", "flattened": false},
      "PrivateIPv4Address": {"shape": "PrivateIPv4Address", "flattened": false},
      "IPv6Address": {"shape": "IPv6Address", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerAddresses": {
    "type": "list",
    "member": {"shape": "LoadBalancerAddress"},
    "flattened": false
  },
  "LoadBalancerArn": {"type": "string", "flattened": false},
  "LoadBalancerArns": {
    "type": "list",
    "member": {"shape": "LoadBalancerArn"},
    "flattened": false
  },
  "LoadBalancerAttribute": {
    "type": "structure",
    "members": {
      "Key": {"shape": "LoadBalancerAttributeKey", "flattened": false},
      "Value": {"shape": "LoadBalancerAttributeValue", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerAttributeKey": {"type": "string", "flattened": false},
  "LoadBalancerAttributeValue": {"type": "string", "flattened": false},
  "LoadBalancerAttributes": {
    "type": "list",
    "member": {"shape": "LoadBalancerAttribute"},
    "flattened": false
  },
  "LoadBalancerName": {"type": "string", "flattened": false},
  "LoadBalancerNames": {
    "type": "list",
    "member": {"shape": "LoadBalancerName"},
    "flattened": false
  },
  "LoadBalancerSchemeEnum": {"type": "string", "flattened": false},
  "LoadBalancerState": {
    "type": "structure",
    "members": {
      "Code": {"shape": "LoadBalancerStateEnum", "flattened": false},
      "Reason": {"shape": "StateReason", "flattened": false}
    },
    "flattened": false
  },
  "LoadBalancerStateEnum": {"type": "string", "flattened": false},
  "LoadBalancerTypeEnum": {"type": "string", "flattened": false},
  "LoadBalancers": {
    "type": "list",
    "member": {"shape": "LoadBalancer"},
    "flattened": false
  },
  "Location": {"type": "string", "flattened": false},
  "Marker": {"type": "string", "flattened": false},
  "Matcher": {
    "type": "structure",
    "members": {
      "HttpCode": {"shape": "HttpCode", "flattened": false},
      "GrpcCode": {"shape": "GrpcCode", "flattened": false}
    },
    "flattened": false
  },
  "Max": {"type": "string", "flattened": false},
  "MitigationInEffectEnum": {"type": "string", "flattened": false},
  "Mode": {"type": "string", "flattened": false},
  "ModifyListenerInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "Protocol": {"shape": "ProtocolEnum", "flattened": false},
      "SslPolicy": {"shape": "SslPolicyName", "flattened": false},
      "Certificates": {"shape": "CertificateList", "flattened": false},
      "DefaultActions": {"shape": "Actions", "flattened": false},
      "AlpnPolicy": {"shape": "AlpnPolicyName", "flattened": false},
      "MutualAuthentication": {
        "shape": "MutualAuthenticationAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyListenerOutput": {
    "type": "structure",
    "members": {
      "Listeners": {"shape": "Listeners", "flattened": false}
    },
    "flattened": false
  },
  "ModifyLoadBalancerAttributesInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "Attributes": {"shape": "LoadBalancerAttributes", "flattened": false}
    },
    "flattened": false
  },
  "ModifyLoadBalancerAttributesOutput": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "LoadBalancerAttributes", "flattened": false}
    },
    "flattened": false
  },
  "ModifyRuleInput": {
    "type": "structure",
    "members": {
      "RuleArn": {"shape": "RuleArn", "flattened": false},
      "Conditions": {"shape": "RuleConditionList", "flattened": false},
      "Actions": {"shape": "Actions", "flattened": false}
    },
    "flattened": false
  },
  "ModifyRuleOutput": {
    "type": "structure",
    "members": {
      "Rules": {"shape": "Rules", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTargetGroupAttributesInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "Attributes": {"shape": "TargetGroupAttributes", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTargetGroupAttributesOutput": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "TargetGroupAttributes", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTargetGroupInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "HealthCheckProtocol": {"shape": "ProtocolEnum", "flattened": false},
      "HealthCheckPort": {"shape": "HealthCheckPort", "flattened": false},
      "HealthCheckPath": {"shape": "Path", "flattened": false},
      "HealthCheckEnabled": {"shape": "HealthCheckEnabled", "flattened": false},
      "HealthCheckIntervalSeconds": {
        "shape": "HealthCheckIntervalSeconds",
        "flattened": false
      },
      "HealthCheckTimeoutSeconds": {
        "shape": "HealthCheckTimeoutSeconds",
        "flattened": false
      },
      "HealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "UnhealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "Matcher": {"shape": "Matcher", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTargetGroupOutput": {
    "type": "structure",
    "members": {
      "TargetGroups": {"shape": "TargetGroups", "flattened": false}
    },
    "flattened": false
  },
  "ModifyTrustStoreInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "CaCertificatesBundleS3Bucket": {"shape": "S3Bucket", "flattened": false},
      "CaCertificatesBundleS3Key": {"shape": "S3Key", "flattened": false},
      "CaCertificatesBundleS3ObjectVersion": {
        "shape": "S3ObjectVersion",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ModifyTrustStoreOutput": {
    "type": "structure",
    "members": {
      "TrustStores": {"shape": "TrustStores", "flattened": false}
    },
    "flattened": false
  },
  "MutualAuthenticationAttributes": {
    "type": "structure",
    "members": {
      "Mode": {"shape": "Mode", "flattened": false},
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "IgnoreClientCertificateExpiry": {
        "shape": "IgnoreClientCertificateExpiry",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Name": {"type": "string", "flattened": false},
  "NumberOfCaCertificates": {"type": "integer", "flattened": false},
  "NumberOfRevokedEntries": {"type": "long", "flattened": false},
  "OutpostId": {"type": "string", "flattened": false},
  "PageSize": {"type": "integer", "flattened": false},
  "Path": {"type": "string", "flattened": false},
  "PathPatternConditionConfig": {
    "type": "structure",
    "members": {
      "Values": {"shape": "ListOfString", "flattened": false}
    },
    "flattened": false
  },
  "Port": {"type": "integer", "flattened": false},
  "PrivateIPv4Address": {"type": "string", "flattened": false},
  "ProtocolEnum": {"type": "string", "flattened": false},
  "ProtocolVersion": {"type": "string", "flattened": false},
  "QueryStringConditionConfig": {
    "type": "structure",
    "members": {
      "Values": {"shape": "QueryStringKeyValuePairList", "flattened": false}
    },
    "flattened": false
  },
  "QueryStringKeyValuePair": {
    "type": "structure",
    "members": {
      "Key": {"shape": "StringValue", "flattened": false},
      "Value": {"shape": "StringValue", "flattened": false}
    },
    "flattened": false
  },
  "QueryStringKeyValuePairList": {
    "type": "list",
    "member": {"shape": "QueryStringKeyValuePair"},
    "flattened": false
  },
  "RedirectActionConfig": {
    "type": "structure",
    "members": {
      "Protocol": {"shape": "RedirectActionProtocol", "flattened": false},
      "Port": {"shape": "RedirectActionPort", "flattened": false},
      "Host": {"shape": "RedirectActionHost", "flattened": false},
      "Path": {"shape": "RedirectActionPath", "flattened": false},
      "Query": {"shape": "RedirectActionQuery", "flattened": false},
      "StatusCode": {
        "shape": "RedirectActionStatusCodeEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "RedirectActionHost": {"type": "string", "flattened": false},
  "RedirectActionPath": {"type": "string", "flattened": false},
  "RedirectActionPort": {"type": "string", "flattened": false},
  "RedirectActionProtocol": {"type": "string", "flattened": false},
  "RedirectActionQuery": {"type": "string", "flattened": false},
  "RedirectActionStatusCodeEnum": {"type": "string", "flattened": false},
  "RegisterTargetsInput": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "Targets": {"shape": "TargetDescriptions", "flattened": false}
    },
    "flattened": false
  },
  "RegisterTargetsOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "RemoveListenerCertificatesInput": {
    "type": "structure",
    "members": {
      "ListenerArn": {"shape": "ListenerArn", "flattened": false},
      "Certificates": {"shape": "CertificateList", "flattened": false}
    },
    "flattened": false
  },
  "RemoveListenerCertificatesOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "RemoveTagsInput": {
    "type": "structure",
    "members": {
      "ResourceArns": {"shape": "ResourceArns", "flattened": false},
      "TagKeys": {"shape": "TagKeys", "flattened": false}
    },
    "flattened": false
  },
  "RemoveTagsOutput": {"type": "structure", "members": {}, "flattened": false},
  "RemoveTrustStoreRevocationsInput": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationIds": {"shape": "RevocationIds", "flattened": false}
    },
    "flattened": false
  },
  "RemoveTrustStoreRevocationsOutput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "ResourceArn": {"type": "string", "flattened": false},
  "ResourceArns": {
    "type": "list",
    "member": {"shape": "ResourceArn"},
    "flattened": false
  },
  "RevocationContent": {
    "type": "structure",
    "members": {
      "S3Bucket": {"shape": "S3Bucket", "flattened": false},
      "S3Key": {"shape": "S3Key", "flattened": false},
      "S3ObjectVersion": {"shape": "S3ObjectVersion", "flattened": false},
      "RevocationType": {"shape": "RevocationType", "flattened": false}
    },
    "flattened": false
  },
  "RevocationContents": {
    "type": "list",
    "member": {"shape": "RevocationContent"},
    "flattened": false
  },
  "RevocationId": {"type": "long", "flattened": false},
  "RevocationIds": {
    "type": "list",
    "member": {"shape": "RevocationId"},
    "flattened": false
  },
  "RevocationType": {"type": "string", "flattened": false},
  "Rule": {
    "type": "structure",
    "members": {
      "RuleArn": {"shape": "RuleArn", "flattened": false},
      "Priority": {"shape": "String", "flattened": false},
      "Conditions": {"shape": "RuleConditionList", "flattened": false},
      "Actions": {"shape": "Actions", "flattened": false},
      "IsDefault": {"shape": "IsDefault", "flattened": false}
    },
    "flattened": false
  },
  "RuleArn": {"type": "string", "flattened": false},
  "RuleArns": {
    "type": "list",
    "member": {"shape": "RuleArn"},
    "flattened": false
  },
  "RuleCondition": {
    "type": "structure",
    "members": {
      "Field": {"shape": "ConditionFieldName", "flattened": false},
      "Values": {"shape": "ListOfString", "flattened": false},
      "HostHeaderConfig": {
        "shape": "HostHeaderConditionConfig",
        "flattened": false
      },
      "PathPatternConfig": {
        "shape": "PathPatternConditionConfig",
        "flattened": false
      },
      "HttpHeaderConfig": {
        "shape": "HttpHeaderConditionConfig",
        "flattened": false
      },
      "QueryStringConfig": {
        "shape": "QueryStringConditionConfig",
        "flattened": false
      },
      "HttpRequestMethodConfig": {
        "shape": "HttpRequestMethodConditionConfig",
        "flattened": false
      },
      "SourceIpConfig": {"shape": "SourceIpConditionConfig", "flattened": false}
    },
    "flattened": false
  },
  "RuleConditionList": {
    "type": "list",
    "member": {"shape": "RuleCondition"},
    "flattened": false
  },
  "RulePriority": {"type": "integer", "flattened": false},
  "RulePriorityList": {
    "type": "list",
    "member": {"shape": "RulePriorityPair"},
    "flattened": false
  },
  "RulePriorityPair": {
    "type": "structure",
    "members": {
      "RuleArn": {"shape": "RuleArn", "flattened": false},
      "Priority": {"shape": "RulePriority", "flattened": false}
    },
    "flattened": false
  },
  "Rules": {
    "type": "list",
    "member": {"shape": "Rule"},
    "flattened": false
  },
  "S3Bucket": {"type": "string", "flattened": false},
  "S3Key": {"type": "string", "flattened": false},
  "S3ObjectVersion": {"type": "string", "flattened": false},
  "SecurityGroupId": {"type": "string", "flattened": false},
  "SecurityGroups": {
    "type": "list",
    "member": {"shape": "SecurityGroupId"},
    "flattened": false
  },
  "SetIpAddressTypeInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "IpAddressType": {"shape": "IpAddressType", "flattened": false}
    },
    "flattened": false
  },
  "SetIpAddressTypeOutput": {
    "type": "structure",
    "members": {
      "IpAddressType": {"shape": "IpAddressType", "flattened": false}
    },
    "flattened": false
  },
  "SetRulePrioritiesInput": {
    "type": "structure",
    "members": {
      "RulePriorities": {"shape": "RulePriorityList", "flattened": false}
    },
    "flattened": false
  },
  "SetRulePrioritiesOutput": {
    "type": "structure",
    "members": {
      "Rules": {"shape": "Rules", "flattened": false}
    },
    "flattened": false
  },
  "SetSecurityGroupsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "SecurityGroups": {"shape": "SecurityGroups", "flattened": false},
      "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic": {
        "shape": "EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SetSecurityGroupsOutput": {
    "type": "structure",
    "members": {
      "SecurityGroupIds": {"shape": "SecurityGroups", "flattened": false},
      "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic": {
        "shape": "EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SetSubnetsInput": {
    "type": "structure",
    "members": {
      "LoadBalancerArn": {"shape": "LoadBalancerArn", "flattened": false},
      "Subnets": {"shape": "Subnets", "flattened": false},
      "SubnetMappings": {"shape": "SubnetMappings", "flattened": false},
      "IpAddressType": {"shape": "IpAddressType", "flattened": false}
    },
    "flattened": false
  },
  "SetSubnetsOutput": {
    "type": "structure",
    "members": {
      "AvailabilityZones": {"shape": "AvailabilityZones", "flattened": false},
      "IpAddressType": {"shape": "IpAddressType", "flattened": false}
    },
    "flattened": false
  },
  "SourceIpConditionConfig": {
    "type": "structure",
    "members": {
      "Values": {"shape": "ListOfString", "flattened": false}
    },
    "flattened": false
  },
  "SslPolicies": {
    "type": "list",
    "member": {"shape": "SslPolicy"},
    "flattened": false
  },
  "SslPolicy": {
    "type": "structure",
    "members": {
      "SslProtocols": {"shape": "SslProtocols", "flattened": false},
      "Ciphers": {"shape": "Ciphers", "flattened": false},
      "Name": {"shape": "SslPolicyName", "flattened": false},
      "SupportedLoadBalancerTypes": {
        "shape": "ListOfString",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SslPolicyName": {"type": "string", "flattened": false},
  "SslPolicyNames": {
    "type": "list",
    "member": {"shape": "SslPolicyName"},
    "flattened": false
  },
  "SslProtocol": {"type": "string", "flattened": false},
  "SslProtocols": {
    "type": "list",
    "member": {"shape": "SslProtocol"},
    "flattened": false
  },
  "StateReason": {"type": "string", "flattened": false},
  "String": {"type": "string", "flattened": false},
  "StringValue": {"type": "string", "flattened": false},
  "SubnetId": {"type": "string", "flattened": false},
  "SubnetMapping": {
    "type": "structure",
    "members": {
      "SubnetId": {"shape": "SubnetId", "flattened": false},
      "AllocationId": {"shape": "AllocationId", "flattened": false},
      "PrivateIPv4Address": {"shape": "PrivateIPv4Address", "flattened": false},
      "IPv6Address": {"shape": "IPv6Address", "flattened": false}
    },
    "flattened": false
  },
  "SubnetMappings": {
    "type": "list",
    "member": {"shape": "SubnetMapping"},
    "flattened": false
  },
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
      "ResourceArn": {"shape": "ResourceArn", "flattened": false},
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
  "TagKeys": {
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
  "TargetDescription": {
    "type": "structure",
    "members": {
      "Id": {"shape": "TargetId", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "AvailabilityZone": {"shape": "ZoneName", "flattened": false}
    },
    "flattened": false
  },
  "TargetDescriptions": {
    "type": "list",
    "member": {"shape": "TargetDescription"},
    "flattened": false
  },
  "TargetGroup": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "TargetGroupName": {"shape": "TargetGroupName", "flattened": false},
      "Protocol": {"shape": "ProtocolEnum", "flattened": false},
      "Port": {"shape": "Port", "flattened": false},
      "VpcId": {"shape": "VpcId", "flattened": false},
      "HealthCheckProtocol": {"shape": "ProtocolEnum", "flattened": false},
      "HealthCheckPort": {"shape": "HealthCheckPort", "flattened": false},
      "HealthCheckEnabled": {"shape": "HealthCheckEnabled", "flattened": false},
      "HealthCheckIntervalSeconds": {
        "shape": "HealthCheckIntervalSeconds",
        "flattened": false
      },
      "HealthCheckTimeoutSeconds": {
        "shape": "HealthCheckTimeoutSeconds",
        "flattened": false
      },
      "HealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "UnhealthyThresholdCount": {
        "shape": "HealthCheckThresholdCount",
        "flattened": false
      },
      "HealthCheckPath": {"shape": "Path", "flattened": false},
      "Matcher": {"shape": "Matcher", "flattened": false},
      "LoadBalancerArns": {"shape": "LoadBalancerArns", "flattened": false},
      "TargetType": {"shape": "TargetTypeEnum", "flattened": false},
      "ProtocolVersion": {"shape": "ProtocolVersion", "flattened": false},
      "IpAddressType": {
        "shape": "TargetGroupIpAddressTypeEnum",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TargetGroupArn": {"type": "string", "flattened": false},
  "TargetGroupArns": {
    "type": "list",
    "member": {"shape": "TargetGroupArn"},
    "flattened": false
  },
  "TargetGroupAttribute": {
    "type": "structure",
    "members": {
      "Key": {"shape": "TargetGroupAttributeKey", "flattened": false},
      "Value": {"shape": "TargetGroupAttributeValue", "flattened": false}
    },
    "flattened": false
  },
  "TargetGroupAttributeKey": {"type": "string", "flattened": false},
  "TargetGroupAttributeValue": {"type": "string", "flattened": false},
  "TargetGroupAttributes": {
    "type": "list",
    "member": {"shape": "TargetGroupAttribute"},
    "flattened": false
  },
  "TargetGroupIpAddressTypeEnum": {"type": "string", "flattened": false},
  "TargetGroupList": {
    "type": "list",
    "member": {"shape": "TargetGroupTuple"},
    "flattened": false
  },
  "TargetGroupName": {"type": "string", "flattened": false},
  "TargetGroupNames": {
    "type": "list",
    "member": {"shape": "TargetGroupName"},
    "flattened": false
  },
  "TargetGroupStickinessConfig": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "TargetGroupStickinessEnabled", "flattened": false},
      "DurationSeconds": {
        "shape": "TargetGroupStickinessDurationSeconds",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TargetGroupStickinessDurationSeconds": {
    "type": "integer",
    "flattened": false
  },
  "TargetGroupStickinessEnabled": {"type": "boolean", "flattened": false},
  "TargetGroupTuple": {
    "type": "structure",
    "members": {
      "TargetGroupArn": {"shape": "TargetGroupArn", "flattened": false},
      "Weight": {"shape": "TargetGroupWeight", "flattened": false}
    },
    "flattened": false
  },
  "TargetGroupWeight": {"type": "integer", "flattened": false},
  "TargetGroups": {
    "type": "list",
    "member": {"shape": "TargetGroup"},
    "flattened": false
  },
  "TargetHealth": {
    "type": "structure",
    "members": {
      "State": {"shape": "TargetHealthStateEnum", "flattened": false},
      "Reason": {"shape": "TargetHealthReasonEnum", "flattened": false},
      "Description": {"shape": "Description", "flattened": false}
    },
    "flattened": false
  },
  "TargetHealthDescription": {
    "type": "structure",
    "members": {
      "Target": {"shape": "TargetDescription", "flattened": false},
      "HealthCheckPort": {"shape": "HealthCheckPort", "flattened": false},
      "TargetHealth": {"shape": "TargetHealth", "flattened": false},
      "AnomalyDetection": {"shape": "AnomalyDetection", "flattened": false}
    },
    "flattened": false
  },
  "TargetHealthDescriptions": {
    "type": "list",
    "member": {"shape": "TargetHealthDescription"},
    "flattened": false
  },
  "TargetHealthReasonEnum": {"type": "string", "flattened": false},
  "TargetHealthStateEnum": {"type": "string", "flattened": false},
  "TargetId": {"type": "string", "flattened": false},
  "TargetTypeEnum": {"type": "string", "flattened": false},
  "TotalRevokedEntries": {"type": "long", "flattened": false},
  "TrustStore": {
    "type": "structure",
    "members": {
      "Name": {"shape": "TrustStoreName", "flattened": false},
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "Status": {"shape": "TrustStoreStatus", "flattened": false},
      "NumberOfCaCertificates": {
        "shape": "NumberOfCaCertificates",
        "flattened": false
      },
      "TotalRevokedEntries": {
        "shape": "TotalRevokedEntries",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TrustStoreArn": {"type": "string", "flattened": false},
  "TrustStoreArns": {
    "type": "list",
    "member": {"shape": "TrustStoreArn"},
    "flattened": false
  },
  "TrustStoreAssociation": {
    "type": "structure",
    "members": {
      "ResourceArn": {
        "shape": "TrustStoreAssociationResourceArn",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TrustStoreAssociationResourceArn": {"type": "string", "flattened": false},
  "TrustStoreAssociations": {
    "type": "list",
    "member": {"shape": "TrustStoreAssociation"},
    "flattened": false
  },
  "TrustStoreName": {"type": "string", "flattened": false},
  "TrustStoreNames": {
    "type": "list",
    "member": {"shape": "TrustStoreName"},
    "flattened": false
  },
  "TrustStoreRevocation": {
    "type": "structure",
    "members": {
      "TrustStoreArn": {"shape": "TrustStoreArn", "flattened": false},
      "RevocationId": {"shape": "RevocationId", "flattened": false},
      "RevocationType": {"shape": "RevocationType", "flattened": false},
      "NumberOfRevokedEntries": {
        "shape": "NumberOfRevokedEntries",
        "flattened": false
      }
    },
    "flattened": false
  },
  "TrustStoreRevocations": {
    "type": "list",
    "member": {"shape": "TrustStoreRevocation"},
    "flattened": false
  },
  "TrustStoreStatus": {"type": "string", "flattened": false},
  "TrustStores": {
    "type": "list",
    "member": {"shape": "TrustStore"},
    "flattened": false
  },
  "VpcId": {"type": "string", "flattened": false},
  "ZoneName": {"type": "string", "flattened": false}
};
