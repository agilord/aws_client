// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AssumeRoleRequest": {
    "type": "structure",
    "members": {
      "RoleArn": {"shape": "arnType", "flattened": false},
      "RoleSessionName": {"shape": "roleSessionNameType", "flattened": false},
      "PolicyArns": {"shape": "policyDescriptorListType", "flattened": false},
      "Policy": {
        "shape": "unrestrictedSessionPolicyDocumentType",
        "flattened": false
      },
      "DurationSeconds": {
        "shape": "roleDurationSecondsType",
        "flattened": false
      },
      "Tags": {"shape": "tagListType", "flattened": false},
      "TransitiveTagKeys": {"shape": "tagKeyListType", "flattened": false},
      "ExternalId": {"shape": "externalIdType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "TokenCode": {"shape": "tokenCodeType", "flattened": false},
      "SourceIdentity": {"shape": "sourceIdentityType", "flattened": false},
      "ProvidedContexts": {
        "shape": "ProvidedContextsListType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AssumeRoleResponse": {
    "type": "structure",
    "members": {
      "Credentials": {"shape": "Credentials", "flattened": false},
      "AssumedRoleUser": {"shape": "AssumedRoleUser", "flattened": false},
      "PackedPolicySize": {
        "shape": "nonNegativeIntegerType",
        "flattened": false
      },
      "SourceIdentity": {"shape": "sourceIdentityType", "flattened": false}
    },
    "flattened": false
  },
  "AssumeRoleWithSAMLRequest": {
    "type": "structure",
    "members": {
      "RoleArn": {"shape": "arnType", "flattened": false},
      "PrincipalArn": {"shape": "arnType", "flattened": false},
      "SAMLAssertion": {"shape": "SAMLAssertionType", "flattened": false},
      "PolicyArns": {"shape": "policyDescriptorListType", "flattened": false},
      "Policy": {"shape": "sessionPolicyDocumentType", "flattened": false},
      "DurationSeconds": {
        "shape": "roleDurationSecondsType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AssumeRoleWithSAMLResponse": {
    "type": "structure",
    "members": {
      "Credentials": {"shape": "Credentials", "flattened": false},
      "AssumedRoleUser": {"shape": "AssumedRoleUser", "flattened": false},
      "PackedPolicySize": {
        "shape": "nonNegativeIntegerType",
        "flattened": false
      },
      "Subject": {"shape": "Subject", "flattened": false},
      "SubjectType": {"shape": "SubjectType", "flattened": false},
      "Issuer": {"shape": "Issuer", "flattened": false},
      "Audience": {"shape": "Audience", "flattened": false},
      "NameQualifier": {"shape": "NameQualifier", "flattened": false},
      "SourceIdentity": {"shape": "sourceIdentityType", "flattened": false}
    },
    "flattened": false
  },
  "AssumeRoleWithWebIdentityRequest": {
    "type": "structure",
    "members": {
      "RoleArn": {"shape": "arnType", "flattened": false},
      "RoleSessionName": {"shape": "roleSessionNameType", "flattened": false},
      "WebIdentityToken": {"shape": "clientTokenType", "flattened": false},
      "ProviderId": {"shape": "urlType", "flattened": false},
      "PolicyArns": {"shape": "policyDescriptorListType", "flattened": false},
      "Policy": {"shape": "sessionPolicyDocumentType", "flattened": false},
      "DurationSeconds": {
        "shape": "roleDurationSecondsType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "AssumeRoleWithWebIdentityResponse": {
    "type": "structure",
    "members": {
      "Credentials": {"shape": "Credentials", "flattened": false},
      "SubjectFromWebIdentityToken": {
        "shape": "webIdentitySubjectType",
        "flattened": false
      },
      "AssumedRoleUser": {"shape": "AssumedRoleUser", "flattened": false},
      "PackedPolicySize": {
        "shape": "nonNegativeIntegerType",
        "flattened": false
      },
      "Provider": {"shape": "Issuer", "flattened": false},
      "Audience": {"shape": "Audience", "flattened": false},
      "SourceIdentity": {"shape": "sourceIdentityType", "flattened": false}
    },
    "flattened": false
  },
  "AssumedRoleUser": {
    "type": "structure",
    "members": {
      "AssumedRoleId": {"shape": "assumedRoleIdType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "Audience": {"type": "string", "flattened": false},
  "Credentials": {
    "type": "structure",
    "members": {
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false},
      "SecretAccessKey": {"shape": "accessKeySecretType", "flattened": false},
      "SessionToken": {"shape": "tokenType", "flattened": false},
      "Expiration": {"shape": "dateType", "flattened": false}
    },
    "flattened": false
  },
  "DecodeAuthorizationMessageRequest": {
    "type": "structure",
    "members": {
      "EncodedMessage": {"shape": "encodedMessageType", "flattened": false}
    },
    "flattened": false
  },
  "DecodeAuthorizationMessageResponse": {
    "type": "structure",
    "members": {
      "DecodedMessage": {"shape": "decodedMessageType", "flattened": false}
    },
    "flattened": false
  },
  "FederatedUser": {
    "type": "structure",
    "members": {
      "FederatedUserId": {"shape": "federatedIdType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccessKeyInfoRequest": {
    "type": "structure",
    "members": {
      "AccessKeyId": {"shape": "accessKeyIdType", "flattened": false}
    },
    "flattened": false
  },
  "GetAccessKeyInfoResponse": {
    "type": "structure",
    "members": {
      "Account": {"shape": "accountType", "flattened": false}
    },
    "flattened": false
  },
  "GetCallerIdentityRequest": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "GetCallerIdentityResponse": {
    "type": "structure",
    "members": {
      "UserId": {"shape": "userIdType", "flattened": false},
      "Account": {"shape": "accountType", "flattened": false},
      "Arn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "GetFederationTokenRequest": {
    "type": "structure",
    "members": {
      "Name": {"shape": "userNameType", "flattened": false},
      "Policy": {"shape": "sessionPolicyDocumentType", "flattened": false},
      "PolicyArns": {"shape": "policyDescriptorListType", "flattened": false},
      "DurationSeconds": {"shape": "durationSecondsType", "flattened": false},
      "Tags": {"shape": "tagListType", "flattened": false}
    },
    "flattened": false
  },
  "GetFederationTokenResponse": {
    "type": "structure",
    "members": {
      "Credentials": {"shape": "Credentials", "flattened": false},
      "FederatedUser": {"shape": "FederatedUser", "flattened": false},
      "PackedPolicySize": {
        "shape": "nonNegativeIntegerType",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetSessionTokenRequest": {
    "type": "structure",
    "members": {
      "DurationSeconds": {"shape": "durationSecondsType", "flattened": false},
      "SerialNumber": {"shape": "serialNumberType", "flattened": false},
      "TokenCode": {"shape": "tokenCodeType", "flattened": false}
    },
    "flattened": false
  },
  "GetSessionTokenResponse": {
    "type": "structure",
    "members": {
      "Credentials": {"shape": "Credentials", "flattened": false}
    },
    "flattened": false
  },
  "Issuer": {"type": "string", "flattened": false},
  "NameQualifier": {"type": "string", "flattened": false},
  "PolicyDescriptorType": {
    "type": "structure",
    "members": {
      "arn": {"shape": "arnType", "flattened": false}
    },
    "flattened": false
  },
  "ProvidedContext": {
    "type": "structure",
    "members": {
      "ProviderArn": {"shape": "arnType", "flattened": false},
      "ContextAssertion": {"shape": "contextAssertionType", "flattened": false}
    },
    "flattened": false
  },
  "ProvidedContextsListType": {
    "type": "list",
    "member": {"shape": "ProvidedContext"},
    "flattened": false
  },
  "SAMLAssertionType": {"type": "string", "flattened": false},
  "Subject": {"type": "string", "flattened": false},
  "SubjectType": {"type": "string", "flattened": false},
  "Tag": {
    "type": "structure",
    "members": {
      "Key": {"shape": "tagKeyType", "flattened": false},
      "Value": {"shape": "tagValueType", "flattened": false}
    },
    "flattened": false
  },
  "accessKeyIdType": {"type": "string", "flattened": false},
  "accessKeySecretType": {"type": "string", "flattened": false},
  "accountType": {"type": "string", "flattened": false},
  "arnType": {"type": "string", "flattened": false},
  "assumedRoleIdType": {"type": "string", "flattened": false},
  "clientTokenType": {"type": "string", "flattened": false},
  "contextAssertionType": {"type": "string", "flattened": false},
  "dateType": {"type": "timestamp", "flattened": false},
  "decodedMessageType": {"type": "string", "flattened": false},
  "durationSecondsType": {"type": "integer", "flattened": false},
  "encodedMessageType": {"type": "string", "flattened": false},
  "externalIdType": {"type": "string", "flattened": false},
  "federatedIdType": {"type": "string", "flattened": false},
  "nonNegativeIntegerType": {"type": "integer", "flattened": false},
  "policyDescriptorListType": {
    "type": "list",
    "member": {"shape": "PolicyDescriptorType"},
    "flattened": false
  },
  "roleDurationSecondsType": {"type": "integer", "flattened": false},
  "roleSessionNameType": {"type": "string", "flattened": false},
  "serialNumberType": {"type": "string", "flattened": false},
  "sessionPolicyDocumentType": {"type": "string", "flattened": false},
  "sourceIdentityType": {"type": "string", "flattened": false},
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
  "tokenCodeType": {"type": "string", "flattened": false},
  "tokenType": {"type": "string", "flattened": false},
  "unrestrictedSessionPolicyDocumentType": {
    "type": "string",
    "flattened": false
  },
  "urlType": {"type": "string", "flattened": false},
  "userIdType": {"type": "string", "flattened": false},
  "userNameType": {"type": "string", "flattened": false},
  "webIdentitySubjectType": {"type": "string", "flattened": false}
};
