// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AccessAdvisorUsageGranularityType": {"type": "string", "flattened": false},
  "AccessDetail": {
    "type": "structure",
    "members": {
      "ServiceName": {"shape": "serviceNameType", "flattened": false},
      "ServiceNamespace": {"shape": "serviceNamespaceType", "flattened": false},
      "Region": {"shape": "stringType", "flattened": false},
      "EntityPath": {
        "shape": "organizationsEntityPathType",
        "flattened": false
      },
      "LastAuthenticatedTime": {"shape": "dateType", "flattened": false},
      "TotalAuthenticatedEntities": {"shape": "integerType", "flattened": false}
    },
    "flattened": false
  },
  "AccessDetails": {
    "type": "list",
    "member": {"shape": "AccessDetail"},
    "flattened": false
  },
  "AccessKey": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false},
      "SecretAccessKey": {"shape": "accessKeySecretType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "AccessKeyLastUsed": {
    "type": "structure",
    "members": {
      "LastUsedDate": {"shape": "dateType", "flattened": false},
      "ServiceName": {"shape": "stringType", "flattened": false},
      "Region": {"shape": "stringType", "flattened": false}
    },
    "flattened": false
  },
  "AccessKeyMetadata": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "ActionNameListType": {
    "type": "list",
    "member": {"shape": "ActionNameType"},
    "flattened": false
  },
  "ActionNameType": {"type": "string", "flattened": false},
  "AddClientIDToOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "ClientID": {"shape": "clientIDType", "flattened": false}
    },
    "flattened": false
  },
  "AddRoleToInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "AddUserToGroupRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "UserName": {"shape": "existingUserNameType", "flattened": false}
    },
    "flattened": false
  },
  "ArnListType": {
    "type": "list",
    "member": {"shape": "arnType"},
    "flattened": false
  },
  "AttachGroupPolicyRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "AttachRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "AttachUserPolicyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "AttachedPermissionsBoundary": {
    "type": "structure",
    "members": {
      "PermissionsBoundaryType": {
        "shape": "PermissionsBoundaryAttachmentType",
        "flattened": false
      },
      "PermissionsBoundaryArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "AttachedPolicy": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "BootstrapDatum": {"type": "blob", "flattened": false},
  "CertificationKeyType": {"type": "string", "flattened": false},
  "CertificationMapType": {
    "type": "map",
    "key": {"shape": "CertificationKeyType"},
    "value": {"shape": "CertificationValueType"},
    "flattened": false
  },
  "CertificationValueType": {"type": "string", "flattened": false},
  "ChangePasswordRequest": {
    "type": "structure",
    "members": {
      "OldPassword": {"shape": "passwordType", "flattened": false},
      "NewPassword": {"shape": "passwordType", "flattened": false}
    },
    "flattened": false
  },
  "ColumnNumber": {"type": "integer", "flattened": false},
  "ContextEntry": {
    "type": "structure",
    "members": {
      "ContextKeyName": {"shape": "ContextKeyNameType", "flattened": false},
      "ContextKeyValues": {
        "shape": "ContextKeyValueListType",
        "flattened": false
      },
      "ContextKeyType": {"shape": "ContextKeyTypeEnum", "flattened": false}
    },
    "flattened": false
  },
  "ContextEntryListType": {
    "type": "list",
    "member": {"shape": "ContextEntry"},
    "flattened": false
  },
  "ContextKeyNameType": {"type": "string", "flattened": false},
  "ContextKeyNamesResultListType": {
    "type": "list",
    "member": {"shape": "ContextKeyNameType"},
    "flattened": false
  },
  "ContextKeyTypeEnum": {"type": "string", "flattened": false},
  "ContextKeyValueListType": {
    "type": "list",
    "member": {"shape": "ContextKeyValueType"},
    "flattened": false
  },
  "ContextKeyValueType": {"type": "string", "flattened": false},
  "CreateAccessKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false}
    },
    "flattened": false
  },
  "CreateAccessKeyResponse": {
    "type": "structure",
    "members": {
      "AccessKey": {"shape": "AccessKey", "flattened": false}
    },
    "flattened": false
  },
  "CreateAccountAliasRequest": {
    "type": "structure",
    "members": {
      "AccountAlias": {"shape": "accountAliasType", "flattened": false}
    },
    "flattened": false
  },
  "CreateGroupRequest": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "GroupName": {"shape": "groupNameType", "flattened": false}
    },
    "flattened": false
  },
  "CreateGroupResponse": {
    "type": "structure",
    "members": {
      "Group": {"shape": "Group", "flattened": false}
    },
    "flattened": false
  },
  "CreateInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "Path": {"shape": "pathType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateInstanceProfileResponse": {
    "type": "structure",
    "members": {
      "InstanceProfile": {"shape": "InstanceProfile", "flattened": false}
    },
    "flattened": false
  },
  "CreateLoginProfileRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "Password": {"shape": "passwordType", "flattened": false},
      "PasswordResetRequired": {"shape": "booleanType", "flattened": false}
    },
    "flattened": false
  },
  "CreateLoginProfileResponse": {
    "type": "structure",
    "members": {
      "LoginProfile": {"shape": "LoginProfile", "flattened": false}
    },
    "flattened": false
  },
  "CreateOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "Url": {"shape": "OpenIDConnectProviderUrlType", "flattened": false},
      "ClientIDList": {"shape": "clientIDListType", "flattened": false},
      "ThumbprintList": {"shape": "thumbprintListType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateOpenIDConnectProviderResponse": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreatePolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "Path": {"shape": "policyPathType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false},
      "Description": {"shape": "policyDescriptionType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreatePolicyResponse": {
    "type": "structure",
    "members": {
      "Policy": {"shape": "Policy", "flattened": false}
    },
    "flattened": false
  },
  "CreatePolicyVersionRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false},
      "SetAsDefault": {"shape": "booleanType", "flattened": false}
    },
    "flattened": false
  },
  "CreatePolicyVersionResponse": {
    "type": "structure",
    "members": {
      "PolicyVersion": {"shape": "PolicyVersion", "flattened": false}
    },
    "flattened": false
  },
  "CreateRoleRequest": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "AssumeRolePolicyDocument": {
        "shape": "policyDocumentType",
        "flattened": false
      },
      "Description": {"shape": "roleDescriptionType", "flattened": false},
      "MaxSessionDuration": {
        "shape": "roleMaxSessionDurationType",
        "flattened": false
      },
      "PermissionsBoundary": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateRoleResponse": {
    "type": "structure",
    "members": {
      "Role": {"shape": "Role", "flattened": false}
    },
    "flattened": false
  },
  "CreateSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLMetadataDocument": {
        "shape": "SAMLMetadataDocumentType",
        "flattened": false
      },
      "Name": {"shape": "SAMLProviderNameType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateSAMLProviderResponse": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateServiceLinkedRoleRequest": {
    "type": "structure",
    "members": {
      "AWSServiceName": {"shape": "groupNameType", "flattened": false},
      "Description": {"shape": "roleDescriptionType", "flattened": false},
      "CustomSuffix": {"shape": "customSuffixType", "flattened": false}
    },
    "flattened": false
  },
  "CreateServiceLinkedRoleResponse": {
    "type": "structure",
    "members": {
      "Role": {"shape": "Role", "flattened": false}
    },
    "flattened": false
  },
  "CreateServiceSpecificCredentialRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "ServiceName": {"shape": "serviceName", "flattened": false}
    },
    "flattened": false
  },
  "CreateServiceSpecificCredentialResponse": {
    "type": "structure",
    "members": {
      "ServiceSpecificCredential": {
        "shape": "ServiceSpecificCredential",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateUserRequest": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "UserName": {"shape": "userNameType", "flattened": false},
      "PermissionsBoundary": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateUserResponse": {
    "type": "structure",
    "members": {
      "User": {"shape": "User", "flattened": false}
    },
    "flattened": false
  },
  "CreateVirtualMFADeviceRequest": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "VirtualMFADeviceName": {
        "shape": "virtualMFADeviceName",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "CreateVirtualMFADeviceResponse": {
    "type": "structure",
    "members": {
      "VirtualMFADevice": {"shape": "VirtualMFADevice", "flattened": false}
    },
    "flattened": false
  },
  "DeactivateMFADeviceRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAccessKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteAccountAliasRequest": {
    "type": "structure",
    "members": {
      "AccountAlias": {"shape": "accountAliasType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteGroupPolicyRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteGroupRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteLoginProfileRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "DeletePolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "DeletePolicyVersionRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "VersionId": {"shape": "policyVersionIdType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRolePermissionsBoundaryRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSSHPublicKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyId": {"shape": "publicKeyIdType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServerCertificateRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteServiceLinkedRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServiceLinkedRoleResponse": {
    "type": "structure",
    "members": {
      "DeletionTaskId": {"shape": "DeletionTaskIdType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteServiceSpecificCredentialRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "ServiceSpecificCredentialId": {
        "shape": "serviceSpecificCredentialId",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteSigningCertificateRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "CertificateId": {"shape": "certificateIdType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUserPermissionsBoundaryRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUserPolicyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false}
    },
    "flattened": false
  },
  "DeleteVirtualMFADeviceRequest": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false}
    },
    "flattened": false
  },
  "DeletionTaskFailureReasonType": {
    "type": "structure",
    "members": {
      "Reason": {"shape": "ReasonType", "flattened": false},
      "RoleUsageList": {"shape": "RoleUsageListType", "flattened": false}
    },
    "flattened": false
  },
  "DeletionTaskIdType": {"type": "string", "flattened": false},
  "DeletionTaskStatusType": {"type": "string", "flattened": false},
  "DetachGroupPolicyRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "DetachRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "DetachUserPolicyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "EnableMFADeviceRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "AuthenticationCode1": {
        "shape": "authenticationCodeType",
        "flattened": false
      },
      "AuthenticationCode2": {
        "shape": "authenticationCodeType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EntityDetails": {
    "type": "structure",
    "members": {
      "EntityInfo": {"shape": "EntityInfo", "flattened": false},
      "LastAuthenticated": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "EntityInfo": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "arnType", "flattened": false},
      "Name": {"shape": "userNameType", "flattened": false},
      "Type": {"shape": "policyOwnerEntityType", "flattened": false},
      "Id": {"shape": "idType", "flattened": false},
      "Path": {"shape": "pathType", "flattened": false}
    },
    "flattened": false
  },
  "EntityType": {"type": "string", "flattened": false},
  "ErrorDetails": {
    "type": "structure",
    "members": {
      "Message": {"shape": "stringType", "flattened": false},
      "Code": {"shape": "stringType", "flattened": false}
    },
    "flattened": false
  },
  "EvalDecisionDetailsType": {
    "type": "map",
    "key": {"shape": "EvalDecisionSourceType"},
    "value": {"shape": "PolicyEvaluationDecisionType"},
    "flattened": false
  },
  "EvalDecisionSourceType": {"type": "string", "flattened": false},
  "EvaluationResult": {
    "type": "structure",
    "members": {
      "EvalActionName": {"shape": "ActionNameType", "flattened": false},
      "EvalResourceName": {"shape": "ResourceNameType", "flattened": false},
      "EvalDecision": {
        "shape": "PolicyEvaluationDecisionType",
        "flattened": false
      },
      "MatchedStatements": {"shape": "StatementListType", "flattened": false},
      "MissingContextValues": {
        "shape": "ContextKeyNamesResultListType",
        "flattened": false
      },
      "OrganizationsDecisionDetail": {
        "shape": "OrganizationsDecisionDetail",
        "flattened": false
      },
      "PermissionsBoundaryDecisionDetail": {
        "shape": "PermissionsBoundaryDecisionDetail",
        "flattened": false
      },
      "EvalDecisionDetails": {
        "shape": "EvalDecisionDetailsType",
        "flattened": false
      },
      "ResourceSpecificResults": {
        "shape": "ResourceSpecificResultListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "EvaluationResultsListType": {
    "type": "list",
    "member": {"shape": "EvaluationResult"},
    "flattened": false
  },
  "GenerateCredentialReportResponse": {
    "type": "structure",
    "members": {
      "State": {"shape": "ReportStateType", "flattened": false},
      "Description": {"shape": "ReportStateDescriptionType", "flattened": false}
    },
    "flattened": false
  },
  "GenerateOrganizationsAccessReportRequest": {
    "type": "structure",
    "members": {
      "EntityPath": {
        "shape": "organizationsEntityPathType",
        "flattened": false
      },
      "OrganizationsPolicyId": {
        "shape": "organizationsPolicyIdType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GenerateOrganizationsAccessReportResponse": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "jobIDType", "flattened": false}
    },
    "flattened": false
  },
  "GenerateServiceLastAccessedDetailsRequest": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "arnType", "flattened": false},
      "Granularity": {
        "shape": "AccessAdvisorUsageGranularityType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GenerateServiceLastAccessedDetailsResponse": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "jobIDType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccessKeyLastUsedRequest": {
    "type": "structure",
    "members": {
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccessKeyLastUsedResponse": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "AccessKeyLastUsed": {"shape": "AccessKeyLastUsed", "flattened": false}
    },
    "flattened": false
  },
  "GetAccountAuthorizationDetailsRequest": {
    "type": "structure",
    "members": {
      "Filter": {"shape": "entityListType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccountAuthorizationDetailsResponse": {
    "type": "structure",
    "members": {
      "UserDetailList": {"shape": "userDetailListType", "flattened": false},
      "GroupDetailList": {"shape": "groupDetailListType", "flattened": false},
      "RoleDetailList": {"shape": "roleDetailListType", "flattened": false},
      "Policies": {"shape": "ManagedPolicyDetailListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccountPasswordPolicyResponse": {
    "type": "structure",
    "members": {
      "PasswordPolicy": {"shape": "PasswordPolicy", "flattened": false}
    },
    "flattened": false
  },
  "GetAccountSummaryResponse": {
    "type": "structure",
    "members": {
      "SummaryMap": {"shape": "summaryMapType", "flattened": false}
    },
    "flattened": false
  },
  "GetContextKeysForCustomPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetContextKeysForPolicyResponse": {
    "type": "structure",
    "members": {
      "ContextKeyNames": {
        "shape": "ContextKeyNamesResultListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetContextKeysForPrincipalPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicySourceArn": {"shape": "arnType", "flattened": false},
      "PolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetCredentialReportResponse": {
    "type": "structure",
    "members": {
      "Content": {"shape": "ReportContentType", "flattened": false},
      "ReportFormat": {"shape": "ReportFormatType", "flattened": false},
      "GeneratedTime": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "GetGroupPolicyRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetGroupPolicyResponse": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "GetGroupRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "GetGroupResponse": {
    "type": "structure",
    "members": {
      "Group": {"shape": "Group", "flattened": false},
      "Users": {"shape": "userListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "GetInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetInstanceProfileResponse": {
    "type": "structure",
    "members": {
      "InstanceProfile": {"shape": "InstanceProfile", "flattened": false}
    },
    "flattened": false
  },
  "GetLoginProfileRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetLoginProfileResponse": {
    "type": "structure",
    "members": {
      "LoginProfile": {"shape": "LoginProfile", "flattened": false}
    },
    "flattened": false
  },
  "GetMFADeviceRequest": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "UserName": {"shape": "userNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetMFADeviceResponse": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "EnableDate": {"shape": "dateType", "flattened": false},
      "Certifications": {"shape": "CertificationMapType", "flattened": false}
    },
    "flattened": false
  },
  "GetOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "GetOpenIDConnectProviderResponse": {
    "type": "structure",
    "members": {
      "Url": {"shape": "OpenIDConnectProviderUrlType", "flattened": false},
      "ClientIDList": {"shape": "clientIDListType", "flattened": false},
      "ThumbprintList": {"shape": "thumbprintListType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "GetOrganizationsAccessReportRequest": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "jobIDType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "SortKey": {"shape": "sortKeyType", "flattened": false}
    },
    "flattened": false
  },
  "GetOrganizationsAccessReportResponse": {
    "type": "structure",
    "members": {
      "JobStatus": {"shape": "jobStatusType", "flattened": false},
      "JobCreationDate": {"shape": "dateType", "flattened": false},
      "JobCompletionDate": {"shape": "dateType", "flattened": false},
      "NumberOfServicesAccessible": {
        "shape": "integerType",
        "flattened": false
      },
      "NumberOfServicesNotAccessed": {
        "shape": "integerType",
        "flattened": false
      },
      "AccessDetails": {"shape": "AccessDetails", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "ErrorDetails": {"shape": "ErrorDetails", "flattened": false}
    },
    "flattened": false
  },
  "GetPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "GetPolicyResponse": {
    "type": "structure",
    "members": {
      "Policy": {"shape": "Policy", "flattened": false}
    },
    "flattened": false
  },
  "GetPolicyVersionRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "VersionId": {"shape": "policyVersionIdType", "flattened": false}
    },
    "flattened": false
  },
  "GetPolicyVersionResponse": {
    "type": "structure",
    "members": {
      "PolicyVersion": {"shape": "PolicyVersion", "flattened": false}
    },
    "flattened": false
  },
  "GetRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetRolePolicyResponse": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "GetRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetRoleResponse": {
    "type": "structure",
    "members": {
      "Role": {"shape": "Role", "flattened": false}
    },
    "flattened": false
  },
  "GetSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "GetSAMLProviderResponse": {
    "type": "structure",
    "members": {
      "SAMLMetadataDocument": {
        "shape": "SAMLMetadataDocumentType",
        "flattened": false
      },
      "CreateDate": {"shape": "dateType", "flattened": false},
      "ValidUntil": {"shape": "dateType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "GetSSHPublicKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyId": {"shape": "publicKeyIdType", "flattened": false},
      "Encoding": {"shape": "encodingType", "flattened": false}
    },
    "flattened": false
  },
  "GetSSHPublicKeyResponse": {
    "type": "structure",
    "members": {
      "SSHPublicKey": {"shape": "SSHPublicKey", "flattened": false}
    },
    "flattened": false
  },
  "GetServerCertificateRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetServerCertificateResponse": {
    "type": "structure",
    "members": {
      "ServerCertificate": {"shape": "ServerCertificate", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLastAccessedDetailsRequest": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "jobIDType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLastAccessedDetailsResponse": {
    "type": "structure",
    "members": {
      "JobStatus": {"shape": "jobStatusType", "flattened": false},
      "JobType": {
        "shape": "AccessAdvisorUsageGranularityType",
        "flattened": false
      },
      "JobCreationDate": {"shape": "dateType", "flattened": false},
      "ServicesLastAccessed": {
        "shape": "ServicesLastAccessed",
        "flattened": false
      },
      "JobCompletionDate": {"shape": "dateType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false},
      "Error": {"shape": "ErrorDetails", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLastAccessedDetailsWithEntitiesRequest": {
    "type": "structure",
    "members": {
      "JobId": {"shape": "jobIDType", "flattened": false},
      "ServiceNamespace": {"shape": "serviceNamespaceType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLastAccessedDetailsWithEntitiesResponse": {
    "type": "structure",
    "members": {
      "JobStatus": {"shape": "jobStatusType", "flattened": false},
      "JobCreationDate": {"shape": "dateType", "flattened": false},
      "JobCompletionDate": {"shape": "dateType", "flattened": false},
      "EntityDetailsList": {
        "shape": "entityDetailsListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false},
      "Error": {"shape": "ErrorDetails", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLinkedRoleDeletionStatusRequest": {
    "type": "structure",
    "members": {
      "DeletionTaskId": {"shape": "DeletionTaskIdType", "flattened": false}
    },
    "flattened": false
  },
  "GetServiceLinkedRoleDeletionStatusResponse": {
    "type": "structure",
    "members": {
      "Status": {"shape": "DeletionTaskStatusType", "flattened": false},
      "Reason": {"shape": "DeletionTaskFailureReasonType", "flattened": false}
    },
    "flattened": false
  },
  "GetUserPolicyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetUserPolicyResponse": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "GetUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false}
    },
    "flattened": false
  },
  "GetUserResponse": {
    "type": "structure",
    "members": {
      "User": {"shape": "User", "flattened": false}
    },
    "flattened": false
  },
  "Group": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "GroupId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "GroupDetail": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "GroupId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "GroupPolicyList": {"shape": "policyDetailListType", "flattened": false},
      "AttachedManagedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "InstanceProfile": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "InstanceProfileId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "Roles": {"shape": "roleListType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "LineNumber": {"type": "integer", "flattened": false},
  "ListAccessKeysRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListAccessKeysResponse": {
    "type": "structure",
    "members": {
      "AccessKeyMetadata": {
        "shape": "accessKeyMetadataListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListAccountAliasesRequest": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListAccountAliasesResponse": {
    "type": "structure",
    "members": {
      "AccountAliases": {"shape": "accountAliasListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedGroupPoliciesRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PathPrefix": {"shape": "policyPathType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedGroupPoliciesResponse": {
    "type": "structure",
    "members": {
      "AttachedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedRolePoliciesRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PathPrefix": {"shape": "policyPathType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedRolePoliciesResponse": {
    "type": "structure",
    "members": {
      "AttachedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedUserPoliciesRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "PathPrefix": {"shape": "policyPathType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListAttachedUserPoliciesResponse": {
    "type": "structure",
    "members": {
      "AttachedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListEntitiesForPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "EntityFilter": {"shape": "EntityType", "flattened": false},
      "PathPrefix": {"shape": "pathType", "flattened": false},
      "PolicyUsageFilter": {"shape": "PolicyUsageType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListEntitiesForPolicyResponse": {
    "type": "structure",
    "members": {
      "PolicyGroups": {"shape": "PolicyGroupListType", "flattened": false},
      "PolicyUsers": {"shape": "PolicyUserListType", "flattened": false},
      "PolicyRoles": {"shape": "PolicyRoleListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupPoliciesRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupPoliciesResponse": {
    "type": "structure",
    "members": {
      "PolicyNames": {"shape": "policyNameListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupsForUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupsForUserResponse": {
    "type": "structure",
    "members": {
      "Groups": {"shape": "groupListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupsRequest": {
    "type": "structure",
    "members": {
      "PathPrefix": {"shape": "pathPrefixType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListGroupsResponse": {
    "type": "structure",
    "members": {
      "Groups": {"shape": "groupListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfileTagsRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfileTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfilesForRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfilesForRoleResponse": {
    "type": "structure",
    "members": {
      "InstanceProfiles": {
        "shape": "instanceProfileListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfilesRequest": {
    "type": "structure",
    "members": {
      "PathPrefix": {"shape": "pathPrefixType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListInstanceProfilesResponse": {
    "type": "structure",
    "members": {
      "InstanceProfiles": {
        "shape": "instanceProfileListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListMFADeviceTagsRequest": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListMFADeviceTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListMFADevicesRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListMFADevicesResponse": {
    "type": "structure",
    "members": {
      "MFADevices": {"shape": "mfaDeviceListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListOpenIDConnectProviderTagsRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListOpenIDConnectProviderTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListOpenIDConnectProvidersRequest": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "ListOpenIDConnectProvidersResponse": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderList": {
        "shape": "OpenIDConnectProviderListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListPoliciesGrantingServiceAccessEntry": {
    "type": "structure",
    "members": {
      "ServiceNamespace": {"shape": "serviceNamespaceType", "flattened": false},
      "Policies": {
        "shape": "policyGrantingServiceAccessListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListPoliciesGrantingServiceAccessRequest": {
    "type": "structure",
    "members": {
      "Marker": {"shape": "markerType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "ServiceNamespaces": {
        "shape": "serviceNamespaceListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListPoliciesGrantingServiceAccessResponse": {
    "type": "structure",
    "members": {
      "PoliciesGrantingServiceAccess": {
        "shape": "listPolicyGrantingServiceAccessResponseListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListPoliciesRequest": {
    "type": "structure",
    "members": {
      "Scope": {"shape": "policyScopeType", "flattened": false},
      "OnlyAttached": {"shape": "booleanType", "flattened": false},
      "PathPrefix": {"shape": "policyPathType", "flattened": false},
      "PolicyUsageFilter": {"shape": "PolicyUsageType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListPoliciesResponse": {
    "type": "structure",
    "members": {
      "Policies": {"shape": "policyListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListPolicyTagsRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListPolicyTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListPolicyVersionsRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListPolicyVersionsResponse": {
    "type": "structure",
    "members": {
      "Versions": {
        "shape": "policyDocumentVersionListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListRolePoliciesRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListRolePoliciesResponse": {
    "type": "structure",
    "members": {
      "PolicyNames": {"shape": "policyNameListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListRoleTagsRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListRoleTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListRolesRequest": {
    "type": "structure",
    "members": {
      "PathPrefix": {"shape": "pathPrefixType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListRolesResponse": {
    "type": "structure",
    "members": {
      "Roles": {"shape": "roleListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListSAMLProviderTagsRequest": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListSAMLProviderTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListSAMLProvidersRequest": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "ListSAMLProvidersResponse": {
    "type": "structure",
    "members": {
      "SAMLProviderList": {"shape": "SAMLProviderListType", "flattened": false}
    },
    "flattened": false
  },
  "ListSSHPublicKeysRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListSSHPublicKeysResponse": {
    "type": "structure",
    "members": {
      "SSHPublicKeys": {"shape": "SSHPublicKeyListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListServerCertificateTagsRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListServerCertificateTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListServerCertificatesRequest": {
    "type": "structure",
    "members": {
      "PathPrefix": {"shape": "pathPrefixType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListServerCertificatesResponse": {
    "type": "structure",
    "members": {
      "ServerCertificateMetadataList": {
        "shape": "serverCertificateMetadataListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListServiceSpecificCredentialsRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "ServiceName": {"shape": "serviceName", "flattened": false}
    },
    "flattened": false
  },
  "ListServiceSpecificCredentialsResponse": {
    "type": "structure",
    "members": {
      "ServiceSpecificCredentials": {
        "shape": "ServiceSpecificCredentialsListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListSigningCertificatesRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListSigningCertificatesResponse": {
    "type": "structure",
    "members": {
      "Certificates": {"shape": "certificateListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListUserPoliciesRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListUserPoliciesResponse": {
    "type": "structure",
    "members": {
      "PolicyNames": {"shape": "policyNameListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListUserTagsRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListUserTagsResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "tagListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListUsersRequest": {
    "type": "structure",
    "members": {
      "PathPrefix": {"shape": "pathPrefixType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListUsersResponse": {
    "type": "structure",
    "members": {
      "Users": {"shape": "userListType", "flattened": false},
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "ListVirtualMFADevicesRequest": {
    "type": "structure",
    "members": {
      "AssignmentStatus": {"shape": "assignmentStatusType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false},
      "MaxItems": {"shape": "maxItemsType", "flattened": false}
    },
    "flattened": false
  },
  "ListVirtualMFADevicesResponse": {
    "type": "structure",
    "members": {
      "VirtualMFADevices": {
        "shape": "virtualMFADeviceListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "LoginProfile": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "PasswordResetRequired": {"shape": "booleanType", "flattened": false}
    },
    "flattened": false
  },
  "MFADevice": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "EnableDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "ManagedPolicyDetail": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "Path": {"shape": "policyPathType", "flattened": false},
      "DefaultVersionId": {"shape": "policyVersionIdType", "flattened": false},
      "AttachmentCount": {"shape": "attachmentCountType", "flattened": false},
      "PermissionsBoundaryUsageCount": {
        "shape": "attachmentCountType",
        "flattened": false
      },
      "IsAttachable": {"shape": "booleanType", "flattened": false},
      "Description": {"shape": "policyDescriptionType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "UpdateDate": {"shape": "dateType", "flattened": false},
      "PolicyVersionList": {
        "shape": "policyDocumentVersionListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ManagedPolicyDetailListType": {
    "type": "list",
    "member": {"shape": "ManagedPolicyDetail"},
    "flattened": false
  },
  "OpenIDConnectProviderListEntry": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "OpenIDConnectProviderListType": {
    "type": "list",
    "member": {"shape": "OpenIDConnectProviderListEntry"},
    "flattened": false
  },
  "OpenIDConnectProviderUrlType": {"type": "string", "flattened": false},
  "OrganizationsDecisionDetail": {
    "type": "structure",
    "members": {
      "AllowedByOrganizations": {"shape": "booleanType", "flattened": false}
    },
    "flattened": false
  },
  "PasswordPolicy": {
    "type": "structure",
    "members": {
      "MinimumPasswordLength": {
        "shape": "minimumPasswordLengthType",
        "flattened": false
      },
      "RequireSymbols": {"shape": "booleanType", "flattened": false},
      "RequireNumbers": {"shape": "booleanType", "flattened": false},
      "RequireUppercaseCharacters": {
        "shape": "booleanType",
        "flattened": false
      },
      "RequireLowercaseCharacters": {
        "shape": "booleanType",
        "flattened": false
      },
      "AllowUsersToChangePassword": {
        "shape": "booleanType",
        "flattened": false
      },
      "ExpirePasswords": {"shape": "booleanType", "flattened": false},
      "MaxPasswordAge": {"shape": "maxPasswordAgeType", "flattened": false},
      "PasswordReusePrevention": {
        "shape": "passwordReusePreventionType",
        "flattened": false
      },
      "HardExpiry": {"shape": "booleanObjectType", "flattened": false}
    },
    "flattened": false
  },
  "PermissionsBoundaryAttachmentType": {"type": "string", "flattened": false},
  "PermissionsBoundaryDecisionDetail": {
    "type": "structure",
    "members": {
      "AllowedByPermissionsBoundary": {
        "shape": "booleanType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Policy": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "Path": {"shape": "policyPathType", "flattened": false},
      "DefaultVersionId": {"shape": "policyVersionIdType", "flattened": false},
      "AttachmentCount": {"shape": "attachmentCountType", "flattened": false},
      "PermissionsBoundaryUsageCount": {
        "shape": "attachmentCountType",
        "flattened": false
      },
      "IsAttachable": {"shape": "booleanType", "flattened": false},
      "Description": {"shape": "policyDescriptionType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "UpdateDate": {"shape": "dateType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyDetail": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyEvaluationDecisionType": {"type": "string", "flattened": false},
  "PolicyGrantingServiceAccess": {
    "type": "structure",
    "members": {
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyType": {"shape": "policyType", "flattened": false},
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "EntityType": {"shape": "policyOwnerEntityType", "flattened": false},
      "EntityName": {"shape": "entityNameType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyGroup": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "GroupId": {"shape": "idType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyGroupListType": {
    "type": "list",
    "member": {"shape": "PolicyGroup"},
    "flattened": false
  },
  "PolicyIdentifierType": {"type": "string", "flattened": false},
  "PolicyRole": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "RoleId": {"shape": "idType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyRoleListType": {
    "type": "list",
    "member": {"shape": "PolicyRole"},
    "flattened": false
  },
  "PolicySourceType": {"type": "string", "flattened": false},
  "PolicyUsageType": {"type": "string", "flattened": false},
  "PolicyUser": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "UserId": {"shape": "idType", "flattened": false}
    },
    "flattened": false
  },
  "PolicyUserListType": {
    "type": "list",
    "member": {"shape": "PolicyUser"},
    "flattened": false
  },
  "PolicyVersion": {
    "type": "structure",
    "members": {
      "Document": {"shape": "policyDocumentType", "flattened": false},
      "VersionId": {"shape": "policyVersionIdType", "flattened": false},
      "IsDefaultVersion": {"shape": "booleanType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "Position": {
    "type": "structure",
    "members": {
      "Line": {"shape": "LineNumber", "flattened": false},
      "Column": {"shape": "ColumnNumber", "flattened": false}
    },
    "flattened": false
  },
  "PutGroupPolicyRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "PutRolePermissionsBoundaryRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PermissionsBoundary": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "PutRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "PutUserPermissionsBoundaryRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "PermissionsBoundary": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "PutUserPolicyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "PolicyName": {"shape": "policyNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "ReasonType": {"type": "string", "flattened": false},
  "RegionNameType": {"type": "string", "flattened": false},
  "RemoveClientIDFromOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "ClientID": {"shape": "clientIDType", "flattened": false}
    },
    "flattened": false
  },
  "RemoveRoleFromInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "RoleName": {"shape": "roleNameType", "flattened": false}
    },
    "flattened": false
  },
  "RemoveUserFromGroupRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "UserName": {"shape": "existingUserNameType", "flattened": false}
    },
    "flattened": false
  },
  "ReportContentType": {"type": "blob", "flattened": false},
  "ReportFormatType": {"type": "string", "flattened": false},
  "ReportStateDescriptionType": {"type": "string", "flattened": false},
  "ReportStateType": {"type": "string", "flattened": false},
  "ResetServiceSpecificCredentialRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "ServiceSpecificCredentialId": {
        "shape": "serviceSpecificCredentialId",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ResetServiceSpecificCredentialResponse": {
    "type": "structure",
    "members": {
      "ServiceSpecificCredential": {
        "shape": "ServiceSpecificCredential",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ResourceHandlingOptionType": {"type": "string", "flattened": false},
  "ResourceNameListType": {
    "type": "list",
    "member": {"shape": "ResourceNameType"},
    "flattened": false
  },
  "ResourceNameType": {"type": "string", "flattened": false},
  "ResourceSpecificResult": {
    "type": "structure",
    "members": {
      "EvalResourceName": {"shape": "ResourceNameType", "flattened": false},
      "EvalResourceDecision": {
        "shape": "PolicyEvaluationDecisionType",
        "flattened": false
      },
      "MatchedStatements": {"shape": "StatementListType", "flattened": false},
      "MissingContextValues": {
        "shape": "ContextKeyNamesResultListType",
        "flattened": false
      },
      "EvalDecisionDetails": {
        "shape": "EvalDecisionDetailsType",
        "flattened": false
      },
      "PermissionsBoundaryDecisionDetail": {
        "shape": "PermissionsBoundaryDecisionDetail",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ResourceSpecificResultListType": {
    "type": "list",
    "member": {"shape": "ResourceSpecificResult"},
    "flattened": false
  },
  "ResyncMFADeviceRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "AuthenticationCode1": {
        "shape": "authenticationCodeType",
        "flattened": false
      },
      "AuthenticationCode2": {
        "shape": "authenticationCodeType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "Role": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "RoleId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "AssumeRolePolicyDocument": {
        "shape": "policyDocumentType",
        "flattened": false
      },
      "Description": {"shape": "roleDescriptionType", "flattened": false},
      "MaxSessionDuration": {
        "shape": "roleMaxSessionDurationType",
        "flattened": false
      },
      "PermissionsBoundary": {
        "shape": "AttachedPermissionsBoundary",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false},
      "RoleLastUsed": {"shape": "RoleLastUsed", "flattened": false}
    },
    "flattened": false
  },
  "RoleDetail": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "RoleId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "AssumeRolePolicyDocument": {
        "shape": "policyDocumentType",
        "flattened": false
      },
      "InstanceProfileList": {
        "shape": "instanceProfileListType",
        "flattened": false
      },
      "RolePolicyList": {"shape": "policyDetailListType", "flattened": false},
      "AttachedManagedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      },
      "PermissionsBoundary": {
        "shape": "AttachedPermissionsBoundary",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false},
      "RoleLastUsed": {"shape": "RoleLastUsed", "flattened": false}
    },
    "flattened": false
  },
  "RoleLastUsed": {
    "type": "structure",
    "members": {
      "LastUsedDate": {"shape": "dateType", "flattened": false},
      "Region": {"shape": "stringType", "flattened": false}
    },
    "flattened": false
  },
  "RoleUsageListType": {
    "type": "list",
    "member": {"shape": "RoleUsageType"},
    "flattened": false
  },
  "RoleUsageType": {
    "type": "structure",
    "members": {
      "Region": {"shape": "RegionNameType", "flattened": false},
      "Resources": {"shape": "ArnListType", "flattened": false}
    },
    "flattened": false
  },
  "SAMLMetadataDocumentType": {"type": "string", "flattened": false},
  "SAMLProviderListEntry": {
    "type": "structure",
    "members": {
      "Arn": {"shape": "arnType", "flattened": false},
      "ValidUntil": {"shape": "dateType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "SAMLProviderListType": {
    "type": "list",
    "member": {"shape": "SAMLProviderListEntry"},
    "flattened": false
  },
  "SAMLProviderNameType": {"type": "string", "flattened": false},
  "SSHPublicKey": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyId": {"shape": "publicKeyIdType", "flattened": false},
      "Fingerprint": {"shape": "publicKeyFingerprintType", "flattened": false},
      "SSHPublicKeyBody": {
        "shape": "publicKeyMaterialType",
        "flattened": false
      },
      "Status": {"shape": "statusType", "flattened": false},
      "UploadDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "SSHPublicKeyListType": {
    "type": "list",
    "member": {"shape": "SSHPublicKeyMetadata"},
    "flattened": false
  },
  "SSHPublicKeyMetadata": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyId": {"shape": "publicKeyIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false},
      "UploadDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "ServerCertificate": {
    "type": "structure",
    "members": {
      "ServerCertificateMetadata": {
        "shape": "ServerCertificateMetadata",
        "flattened": false
      },
      "CertificateBody": {"shape": "certificateBodyType", "flattened": false},
      "CertificateChain": {"shape": "certificateChainType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "ServerCertificateMetadata": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "ServerCertificateId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "UploadDate": {"shape": "dateType", "flattened": false},
      "Expiration": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "ServiceLastAccessed": {
    "type": "structure",
    "members": {
      "ServiceName": {"shape": "serviceNameType", "flattened": false},
      "LastAuthenticated": {"shape": "dateType", "flattened": false},
      "ServiceNamespace": {"shape": "serviceNamespaceType", "flattened": false},
      "LastAuthenticatedEntity": {"shape": "arnType", "flattened": false},
      "LastAuthenticatedRegion": {"shape": "stringType", "flattened": false},
      "TotalAuthenticatedEntities": {
        "shape": "integerType",
        "flattened": false
      },
      "TrackedActionsLastAccessed": {
        "shape": "TrackedActionsLastAccessed",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ServiceSpecificCredential": {
    "type": "structure",
    "members": {
      "CreateDate": {"shape": "dateType", "flattened": false},
      "ServiceName": {"shape": "serviceName", "flattened": false},
      "ServiceUserName": {"shape": "serviceUserName", "flattened": false},
      "ServicePassword": {"shape": "servicePassword", "flattened": false},
      "ServiceSpecificCredentialId": {
        "shape": "serviceSpecificCredentialId",
        "flattened": false
      },
      "UserName": {"shape": "userNameType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false}
    },
    "flattened": false
  },
  "ServiceSpecificCredentialMetadata": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false},
      "ServiceUserName": {"shape": "serviceUserName", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "ServiceSpecificCredentialId": {
        "shape": "serviceSpecificCredentialId",
        "flattened": false
      },
      "ServiceName": {"shape": "serviceName", "flattened": false}
    },
    "flattened": false
  },
  "ServiceSpecificCredentialsListType": {
    "type": "list",
    "member": {"shape": "ServiceSpecificCredentialMetadata"},
    "flattened": false
  },
  "ServicesLastAccessed": {
    "type": "list",
    "member": {"shape": "ServiceLastAccessed"},
    "flattened": false
  },
  "SetDefaultPolicyVersionRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "VersionId": {"shape": "policyVersionIdType", "flattened": false}
    },
    "flattened": false
  },
  "SetSecurityTokenServicePreferencesRequest": {
    "type": "structure",
    "members": {
      "GlobalEndpointTokenVersion": {
        "shape": "globalEndpointTokenVersion",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SigningCertificate": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "CertificateId": {"shape": "certificateIdType", "flattened": false},
      "CertificateBody": {"shape": "certificateBodyType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false},
      "UploadDate": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "SimulateCustomPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      },
      "PermissionsBoundaryPolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      },
      "ActionNames": {"shape": "ActionNameListType", "flattened": false},
      "ResourceArns": {"shape": "ResourceNameListType", "flattened": false},
      "ResourcePolicy": {"shape": "policyDocumentType", "flattened": false},
      "ResourceOwner": {"shape": "ResourceNameType", "flattened": false},
      "CallerArn": {"shape": "ResourceNameType", "flattened": false},
      "ContextEntries": {"shape": "ContextEntryListType", "flattened": false},
      "ResourceHandlingOption": {
        "shape": "ResourceHandlingOptionType",
        "flattened": false
      },
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false}
    },
    "flattened": false
  },
  "SimulatePolicyResponse": {
    "type": "structure",
    "members": {
      "EvaluationResults": {
        "shape": "EvaluationResultsListType",
        "flattened": false
      },
      "IsTruncated": {"shape": "booleanType", "flattened": false},
      "Marker": {"shape": "responseMarkerType", "flattened": false}
    },
    "flattened": false
  },
  "SimulatePrincipalPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicySourceArn": {"shape": "arnType", "flattened": false},
      "PolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      },
      "PermissionsBoundaryPolicyInputList": {
        "shape": "SimulationPolicyListType",
        "flattened": false
      },
      "ActionNames": {"shape": "ActionNameListType", "flattened": false},
      "ResourceArns": {"shape": "ResourceNameListType", "flattened": false},
      "ResourcePolicy": {"shape": "policyDocumentType", "flattened": false},
      "ResourceOwner": {"shape": "ResourceNameType", "flattened": false},
      "CallerArn": {"shape": "ResourceNameType", "flattened": false},
      "ContextEntries": {"shape": "ContextEntryListType", "flattened": false},
      "ResourceHandlingOption": {
        "shape": "ResourceHandlingOptionType",
        "flattened": false
      },
      "MaxItems": {"shape": "maxItemsType", "flattened": false},
      "Marker": {"shape": "markerType", "flattened": false}
    },
    "flattened": false
  },
  "SimulationPolicyListType": {
    "type": "list",
    "member": {"shape": "policyDocumentType"},
    "flattened": false
  },
  "Statement": {
    "type": "structure",
    "members": {
      "SourcePolicyId": {"shape": "PolicyIdentifierType", "flattened": false},
      "SourcePolicyType": {"shape": "PolicySourceType", "flattened": false},
      "StartPosition": {"shape": "Position", "flattened": false},
      "EndPosition": {"shape": "Position", "flattened": false}
    },
    "flattened": false
  },
  "StatementListType": {
    "type": "list",
    "member": {"shape": "Statement"},
    "flattened": false
  },
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "tagKeyType", "flattened": false},
      "Value": {"shape": "tagValueType", "flattened": false}
    },
    "flattened": false
  },
  "TagInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagMFADeviceRequest": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagServerCertificateRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TagUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "TrackedActionLastAccessed": {
    "type": "structure",
    "members": {
      "ActionName": {"shape": "stringType", "flattened": false},
      "LastAccessedEntity": {"shape": "arnType", "flattened": false},
      "LastAccessedTime": {"shape": "dateType", "flattened": false},
      "LastAccessedRegion": {"shape": "stringType", "flattened": false}
    },
    "flattened": false
  },
  "TrackedActionsLastAccessed": {
    "type": "list",
    "member": {"shape": "TrackedActionLastAccessed"},
    "flattened": false
  },
  "UntagInstanceProfileRequest": {
    "type": "structure",
    "members": {
      "InstanceProfileName": {
        "shape": "instanceProfileNameType",
        "flattened": false
      },
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagMFADeviceRequest": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagOpenIDConnectProviderRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagPolicyRequest": {
    "type": "structure",
    "members": {
      "PolicyArn": {"shape": "arnType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagServerCertificateRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UntagUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "TagKeys": {"shape": "tagKeyListType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateAccessKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateAccountPasswordPolicyRequest": {
    "type": "structure",
    "members": {
      "MinimumPasswordLength": {
        "shape": "minimumPasswordLengthType",
        "flattened": false
      },
      "RequireSymbols": {"shape": "booleanType", "flattened": false},
      "RequireNumbers": {"shape": "booleanType", "flattened": false},
      "RequireUppercaseCharacters": {
        "shape": "booleanType",
        "flattened": false
      },
      "RequireLowercaseCharacters": {
        "shape": "booleanType",
        "flattened": false
      },
      "AllowUsersToChangePassword": {
        "shape": "booleanType",
        "flattened": false
      },
      "MaxPasswordAge": {"shape": "maxPasswordAgeType", "flattened": false},
      "PasswordReusePrevention": {
        "shape": "passwordReusePreventionType",
        "flattened": false
      },
      "HardExpiry": {"shape": "booleanObjectType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateAssumeRolePolicyRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "PolicyDocument": {"shape": "policyDocumentType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateGroupRequest": {
    "type": "structure",
    "members": {
      "GroupName": {"shape": "groupNameType", "flattened": false},
      "NewPath": {"shape": "pathType", "flattened": false},
      "NewGroupName": {"shape": "groupNameType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateLoginProfileRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "Password": {"shape": "passwordType", "flattened": false},
      "PasswordResetRequired": {
        "shape": "booleanObjectType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateOpenIDConnectProviderThumbprintRequest": {
    "type": "structure",
    "members": {
      "OpenIDConnectProviderArn": {"shape": "arnType", "flattened": false},
      "ThumbprintList": {"shape": "thumbprintListType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateRoleDescriptionRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Description": {"shape": "roleDescriptionType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateRoleDescriptionResponse": {
    "type": "structure",
    "members": {
      "Role": {"shape": "Role", "flattened": false}
    },
    "flattened": false
  },
  "UpdateRoleRequest": {
    "type": "structure",
    "members": {
      "RoleName": {"shape": "roleNameType", "flattened": false},
      "Description": {"shape": "roleDescriptionType", "flattened": false},
      "MaxSessionDuration": {
        "shape": "roleMaxSessionDurationType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateRoleResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "UpdateSAMLProviderRequest": {
    "type": "structure",
    "members": {
      "SAMLMetadataDocument": {
        "shape": "SAMLMetadataDocumentType",
        "flattened": false
      },
      "SAMLProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateSAMLProviderResponse": {
    "type": "structure",
    "members": {
      "SAMLProviderArn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateSSHPublicKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyId": {"shape": "publicKeyIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateServerCertificateRequest": {
    "type": "structure",
    "members": {
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "NewPath": {"shape": "pathType", "flattened": false},
      "NewServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateServiceSpecificCredentialRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "ServiceSpecificCredentialId": {
        "shape": "serviceSpecificCredentialId",
        "flattened": false
      },
      "Status": {"shape": "statusType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateSigningCertificateRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "CertificateId": {"shape": "certificateIdType", "flattened": false},
      "Status": {"shape": "statusType", "flattened": false}
    },
    "flattened": false
  },
  "UpdateUserRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "NewPath": {"shape": "pathType", "flattened": false},
      "NewUserName": {"shape": "userNameType", "flattened": false}
    },
    "flattened": false
  },
  "UploadSSHPublicKeyRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "userNameType", "flattened": false},
      "SSHPublicKeyBody": {"shape": "publicKeyMaterialType", "flattened": false}
    },
    "flattened": false
  },
  "UploadSSHPublicKeyResponse": {
    "type": "structure",
    "members": {
      "SSHPublicKey": {"shape": "SSHPublicKey", "flattened": false}
    },
    "flattened": false
  },
  "UploadServerCertificateRequest": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "ServerCertificateName": {
        "shape": "serverCertificateNameType",
        "flattened": false
      },
      "CertificateBody": {"shape": "certificateBodyType", "flattened": false},
      "PrivateKey": {"shape": "privateKeyType", "flattened": false},
      "CertificateChain": {"shape": "certificateChainType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "UploadServerCertificateResponse": {
    "type": "structure",
    "members": {
      "ServerCertificateMetadata": {
        "shape": "ServerCertificateMetadata",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "UploadSigningCertificateRequest": {
    "type": "structure",
    "members": {
      "UserName": {"shape": "existingUserNameType", "flattened": false},
      "CertificateBody": {"shape": "certificateBodyType", "flattened": false}
    },
    "flattened": false
  },
  "UploadSigningCertificateResponse": {
    "type": "structure",
    "members": {
      "Certificate": {"shape": "SigningCertificate", "flattened": false}
    },
    "flattened": false
  },
  "User": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "UserName": {"shape": "userNameType", "flattened": false},
      "UserId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "PasswordLastUsed": {"shape": "dateType", "flattened": false},
      "PermissionsBoundary": {
        "shape": "AttachedPermissionsBoundary",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "UserDetail": {
    "type": "structure",
    "members": {
      "Path": {"shape": "pathType", "flattened": false},
      "UserName": {"shape": "userNameType", "flattened": false},
      "UserId": {"shape": "idType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false},
      "CreateDate": {"shape": "dateType", "flattened": false},
      "UserPolicyList": {"shape": "policyDetailListType", "flattened": false},
      "GroupList": {"shape": "groupNameListType", "flattened": false},
      "AttachedManagedPolicies": {
        "shape": "attachedPoliciesListType",
        "flattened": false
      },
      "PermissionsBoundary": {
        "shape": "AttachedPermissionsBoundary",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "VirtualMFADevice": {
    "type": "structure",
    "members": {
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "Base32StringSeed": {"shape": "BootstrapDatum", "flattened": false},
      "QRCodePNG": {"shape": "BootstrapDatum", "flattened": false},
      "User": {"shape": "User", "flattened": false},
      "EnableDate": {"shape": "dateType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "accessKeyIdType": {"type": "string", "flattened": false},
  "accessKeyMetadataListType": {
    "type": "list",
    "member": {"shape": "AccessKeyMetadata"},
    "flattened": false
  },
  "accessKeySecretType": {"type": "string", "flattened": false},
  "accountAliasListType": {
    "type": "list",
    "member": {"shape": "accountAliasType"},
    "flattened": false
  },
  "accountAliasType": {"type": "string", "flattened": false},
  "arnType": {"type": "string", "flattened": false},
  "assignmentStatusType": {"type": "string", "flattened": false},
  "attachedPoliciesListType": {
    "type": "list",
    "member": {"shape": "AttachedPolicy"},
    "flattened": false
  },
  "attachmentCountType": {"type": "integer", "flattened": false},
  "authenticationCodeType": {"type": "string", "flattened": false},
  "booleanObjectType": {"type": "boolean", "flattened": false},
  "booleanType": {"type": "boolean", "flattened": false},
  "certificateBodyType": {"type": "string", "flattened": false},
  "certificateChainType": {"type": "string", "flattened": false},
  "certificateIdType": {"type": "string", "flattened": false},
  "certificateListType": {
    "type": "list",
    "member": {"shape": "SigningCertificate"},
    "flattened": false
  },
  "clientIDListType": {
    "type": "list",
    "member": {"shape": "clientIDType"},
    "flattened": false
  },
  "clientIDType": {"type": "string", "flattened": false},
  "customSuffixType": {"type": "string", "flattened": false},
  "dateType": {"type": "timestamp", "flattened": false},
  "encodingType": {"type": "string", "flattened": false},
  "entityDetailsListType": {
    "type": "list",
    "member": {"shape": "EntityDetails"},
    "flattened": false
  },
  "entityListType": {
    "type": "list",
    "member": {"shape": "EntityType"},
    "flattened": false
  },
  "entityNameType": {"type": "string", "flattened": false},
  "existingUserNameType": {"type": "string", "flattened": false},
  "globalEndpointTokenVersion": {"type": "string", "flattened": false},
  "groupDetailListType": {
    "type": "list",
    "member": {"shape": "GroupDetail"},
    "flattened": false
  },
  "groupListType": {
    "type": "list",
    "member": {"shape": "Group"},
    "flattened": false
  },
  "groupNameListType": {
    "type": "list",
    "member": {"shape": "groupNameType"},
    "flattened": false
  },
  "groupNameType": {"type": "string", "flattened": false},
  "idType": {"type": "string", "flattened": false},
  "instanceProfileListType": {
    "type": "list",
    "member": {"shape": "InstanceProfile"},
    "flattened": false
  },
  "instanceProfileNameType": {"type": "string", "flattened": false},
  "integerType": {"type": "integer", "flattened": false},
  "jobIDType": {"type": "string", "flattened": false},
  "jobStatusType": {"type": "string", "flattened": false},
  "listPolicyGrantingServiceAccessResponseListType": {
    "type": "list",
    "member": {"shape": "ListPoliciesGrantingServiceAccessEntry"},
    "flattened": false
  },
  "markerType": {"type": "string", "flattened": false},
  "maxItemsType": {"type": "integer", "flattened": false},
  "maxPasswordAgeType": {"type": "integer", "flattened": false},
  "mfaDeviceListType": {
    "type": "list",
    "member": {"shape": "MFADevice"},
    "flattened": false
  },
  "minimumPasswordLengthType": {"type": "integer", "flattened": false},
  "organizationsEntityPathType": {"type": "string", "flattened": false},
  "organizationsPolicyIdType": {"type": "string", "flattened": false},
  "passwordReusePreventionType": {"type": "integer", "flattened": false},
  "passwordType": {"type": "string", "flattened": false},
  "pathPrefixType": {"type": "string", "flattened": false},
  "pathType": {"type": "string", "flattened": false},
  "policyDescriptionType": {"type": "string", "flattened": false},
  "policyDetailListType": {
    "type": "list",
    "member": {"shape": "PolicyDetail"},
    "flattened": false
  },
  "policyDocumentType": {"type": "string", "flattened": false},
  "policyDocumentVersionListType": {
    "type": "list",
    "member": {"shape": "PolicyVersion"},
    "flattened": false
  },
  "policyGrantingServiceAccessListType": {
    "type": "list",
    "member": {"shape": "PolicyGrantingServiceAccess"},
    "flattened": false
  },
  "policyListType": {
    "type": "list",
    "member": {"shape": "Policy"},
    "flattened": false
  },
  "policyNameListType": {
    "type": "list",
    "member": {"shape": "policyNameType"},
    "flattened": false
  },
  "policyNameType": {"type": "string", "flattened": false},
  "policyOwnerEntityType": {"type": "string", "flattened": false},
  "policyPathType": {"type": "string", "flattened": false},
  "policyScopeType": {"type": "string", "flattened": false},
  "policyType": {"type": "string", "flattened": false},
  "policyVersionIdType": {"type": "string", "flattened": false},
  "privateKeyType": {"type": "string", "flattened": false},
  "publicKeyFingerprintType": {"type": "string", "flattened": false},
  "publicKeyIdType": {"type": "string", "flattened": false},
  "publicKeyMaterialType": {"type": "string", "flattened": false},
  "responseMarkerType": {"type": "string", "flattened": false},
  "roleDescriptionType": {"type": "string", "flattened": false},
  "roleDetailListType": {
    "type": "list",
    "member": {"shape": "RoleDetail"},
    "flattened": false
  },
  "roleListType": {
    "type": "list",
    "member": {"shape": "Role"},
    "flattened": false
  },
  "roleMaxSessionDurationType": {"type": "integer", "flattened": false},
  "roleNameType": {"type": "string", "flattened": false},
  "serialNumberType": {"type": "string", "flattened": false},
  "serverCertificateMetadataListType": {
    "type": "list",
    "member": {"shape": "ServerCertificateMetadata"},
    "flattened": false
  },
  "serverCertificateNameType": {"type": "string", "flattened": false},
  "serviceName": {"type": "string", "flattened": false},
  "serviceNameType": {"type": "string", "flattened": false},
  "serviceNamespaceListType": {
    "type": "list",
    "member": {"shape": "serviceNamespaceType"},
    "flattened": false
  },
  "serviceNamespaceType": {"type": "string", "flattened": false},
  "servicePassword": {"type": "string", "flattened": false},
  "serviceSpecificCredentialId": {"type": "string", "flattened": false},
  "serviceUserName": {"type": "string", "flattened": false},
  "sortKeyType": {"type": "string", "flattened": false},
  "statusType": {"type": "string", "flattened": false},
  "stringType": {"type": "string", "flattened": false},
  "summaryKeyType": {"type": "string", "flattened": false},
  "summaryMapType": {
    "type": "map",
    "key": {"shape": "summaryKeyType"},
    "value": {"shape": "summaryValueType"},
    "flattened": false
  },
  "summaryValueType": {"type": "integer", "flattened": false},
  "tagKeyListType": {
    "type": "list",
    "member": {"shape": "tagKeyType"},
    "flattened": false
  },
  "tagKeyType": {"type": "string", "flattened": false},
  "tagListType": {
    "type": "list",
    "member": {"shape": "Tag"},
    "flattened": false
  },
  "tagValueType": {"type": "string", "flattened": false},
  "thumbprintListType": {
    "type": "list",
    "member": {"shape": "thumbprintType"},
    "flattened": false
  },
  "thumbprintType": {"type": "string", "flattened": false},
  "userDetailListType": {
    "type": "list",
    "member": {"shape": "UserDetail"},
    "flattened": false
  },
  "userListType": {
    "type": "list",
    "member": {"shape": "User"},
    "flattened": false
  },
  "userNameType": {"type": "string", "flattened": false},
  "virtualMFADeviceListType": {
    "type": "list",
    "member": {"shape": "VirtualMFADevice"},
    "flattened": false
  },
  "virtualMFADeviceName": {"type": "string", "flattened": false}
};
