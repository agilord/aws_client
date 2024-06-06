// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "ActionsList": {
    "type": "list",
    "member": {"shape": "action"},
    "flattened": false
  },
  "AddPermissionInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "Label": {"shape": "label", "flattened": false},
      "AWSAccountId": {"shape": "DelegatesList", "flattened": false},
      "ActionName": {"shape": "ActionsList", "flattened": false}
    },
    "flattened": false
  },
  "AmazonResourceName": {"type": "string", "flattened": false},
  "BatchResultErrorEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "Code": {"shape": "String", "flattened": false},
      "Message": {"shape": "String", "flattened": false},
      "SenderFault": {"shape": "boolean", "flattened": false}
    },
    "flattened": false
  },
  "BatchResultErrorEntryList": {
    "type": "list",
    "member": {"shape": "BatchResultErrorEntry"},
    "flattened": false
  },
  "Binary": {"type": "blob", "flattened": false},
  "CheckIfPhoneNumberIsOptedOutInput": {
    "type": "structure",
    "members": {
      "phoneNumber": {"shape": "PhoneNumber", "flattened": false}
    },
    "flattened": false
  },
  "CheckIfPhoneNumberIsOptedOutResponse": {
    "type": "structure",
    "members": {
      "isOptedOut": {"shape": "boolean", "flattened": false}
    },
    "flattened": false
  },
  "ConfirmSubscriptionInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "Token": {"shape": "token", "flattened": false},
      "AuthenticateOnUnsubscribe": {
        "shape": "authenticateOnUnsubscribe",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ConfirmSubscriptionResponse": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false}
    },
    "flattened": false
  },
  "CreateEndpointResponse": {
    "type": "structure",
    "members": {
      "EndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreatePlatformApplicationInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "String", "flattened": false},
      "Platform": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "CreatePlatformApplicationResponse": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "CreatePlatformEndpointInput": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false},
      "Token": {"shape": "String", "flattened": false},
      "CustomUserData": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "CreateSMSSandboxPhoneNumberInput": {
    "type": "structure",
    "members": {
      "PhoneNumber": {"shape": "PhoneNumberString", "flattened": false},
      "LanguageCode": {"shape": "LanguageCodeString", "flattened": false}
    },
    "flattened": false
  },
  "CreateSMSSandboxPhoneNumberResult": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateTopicInput": {
    "type": "structure",
    "members": {
      "Name": {"shape": "topicName", "flattened": false},
      "Attributes": {"shape": "TopicAttributesMap", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false},
      "DataProtectionPolicy": {"shape": "attributeValue", "flattened": false}
    },
    "flattened": false
  },
  "CreateTopicResponse": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "DelegatesList": {
    "type": "list",
    "member": {"shape": "delegate"},
    "flattened": false
  },
  "DeleteEndpointInput": {
    "type": "structure",
    "members": {
      "EndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeletePlatformApplicationInput": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSMSSandboxPhoneNumberInput": {
    "type": "structure",
    "members": {
      "PhoneNumber": {"shape": "PhoneNumberString", "flattened": false}
    },
    "flattened": false
  },
  "DeleteSMSSandboxPhoneNumberResult": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteTopicInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "Endpoint": {
    "type": "structure",
    "members": {
      "EndpointArn": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "GetDataProtectionPolicyInput": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "GetDataProtectionPolicyResponse": {
    "type": "structure",
    "members": {
      "DataProtectionPolicy": {"shape": "attributeValue", "flattened": false}
    },
    "flattened": false
  },
  "GetEndpointAttributesInput": {
    "type": "structure",
    "members": {
      "EndpointArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetEndpointAttributesResponse": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "GetPlatformApplicationAttributesInput": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "GetPlatformApplicationAttributesResponse": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "GetSMSAttributesInput": {
    "type": "structure",
    "members": {
      "attributes": {"shape": "ListString", "flattened": false}
    },
    "flattened": false
  },
  "GetSMSAttributesResponse": {
    "type": "structure",
    "members": {
      "attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "GetSMSSandboxAccountStatusInput": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "GetSMSSandboxAccountStatusResult": {
    "type": "structure",
    "members": {
      "IsInSandbox": {"shape": "boolean", "flattened": false}
    },
    "flattened": false
  },
  "GetSubscriptionAttributesInput": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false}
    },
    "flattened": false
  },
  "GetSubscriptionAttributesResponse": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "SubscriptionAttributesMap", "flattened": false}
    },
    "flattened": false
  },
  "GetTopicAttributesInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "GetTopicAttributesResponse": {
    "type": "structure",
    "members": {
      "Attributes": {"shape": "TopicAttributesMap", "flattened": false}
    },
    "flattened": false
  },
  "Iso2CountryCode": {"type": "string", "flattened": false},
  "LanguageCodeString": {"type": "string", "flattened": false},
  "ListEndpointsByPlatformApplicationInput": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListEndpointsByPlatformApplicationResponse": {
    "type": "structure",
    "members": {
      "Endpoints": {"shape": "ListOfEndpoints", "flattened": false},
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListOfEndpoints": {
    "type": "list",
    "member": {"shape": "Endpoint"},
    "flattened": false
  },
  "ListOfPlatformApplications": {
    "type": "list",
    "member": {"shape": "PlatformApplication"},
    "flattened": false
  },
  "ListOriginationNumbersRequest": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "nextToken", "flattened": false},
      "MaxResults": {
        "shape": "MaxItemsListOriginationNumbers",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListOriginationNumbersResult": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "nextToken", "flattened": false},
      "PhoneNumbers": {
        "shape": "PhoneNumberInformationList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "ListPhoneNumbersOptedOutInput": {
    "type": "structure",
    "members": {
      "nextToken": {"shape": "string", "flattened": false}
    },
    "flattened": false
  },
  "ListPhoneNumbersOptedOutResponse": {
    "type": "structure",
    "members": {
      "phoneNumbers": {"shape": "PhoneNumberList", "flattened": false},
      "nextToken": {"shape": "string", "flattened": false}
    },
    "flattened": false
  },
  "ListPlatformApplicationsInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListPlatformApplicationsResponse": {
    "type": "structure",
    "members": {
      "PlatformApplications": {
        "shape": "ListOfPlatformApplications",
        "flattened": false
      },
      "NextToken": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "ListSMSSandboxPhoneNumbersInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "nextToken", "flattened": false},
      "MaxResults": {"shape": "MaxItems", "flattened": false}
    },
    "flattened": false
  },
  "ListSMSSandboxPhoneNumbersResult": {
    "type": "structure",
    "members": {
      "PhoneNumbers": {
        "shape": "SMSSandboxPhoneNumberList",
        "flattened": false
      },
      "NextToken": {"shape": "string", "flattened": false}
    },
    "flattened": false
  },
  "ListString": {
    "type": "list",
    "member": {"shape": "String"},
    "flattened": false
  },
  "ListSubscriptionsByTopicInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListSubscriptionsByTopicResponse": {
    "type": "structure",
    "members": {
      "Subscriptions": {"shape": "SubscriptionsList", "flattened": false},
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListSubscriptionsInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListSubscriptionsResponse": {
    "type": "structure",
    "members": {
      "Subscriptions": {"shape": "SubscriptionsList", "flattened": false},
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "ListTagsForResourceResponse": {
    "type": "structure",
    "members": {
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "ListTopicsInput": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListTopicsResponse": {
    "type": "structure",
    "members": {
      "Topics": {"shape": "TopicsList", "flattened": false},
      "NextToken": {"shape": "nextToken", "flattened": false}
    },
    "flattened": false
  },
  "MapStringToString": {
    "type": "map",
    "key": {"shape": "String"},
    "value": {"shape": "String"},
    "flattened": false
  },
  "MaxItems": {"type": "integer", "flattened": false},
  "MaxItemsListOriginationNumbers": {"type": "integer", "flattened": false},
  "MessageAttributeMap": {
    "type": "map",
    "key": {"shape": "String", "locationName": "Name"},
    "value": {"shape": "MessageAttributeValue", "locationName": "Value"},
    "flattened": false
  },
  "MessageAttributeValue": {
    "type": "structure",
    "members": {
      "DataType": {"shape": "String", "flattened": false},
      "StringValue": {"shape": "String", "flattened": false},
      "BinaryValue": {"shape": "Binary", "flattened": false}
    },
    "flattened": false
  },
  "NumberCapability": {"type": "string", "flattened": false},
  "NumberCapabilityList": {
    "type": "list",
    "member": {"shape": "NumberCapability"},
    "flattened": false
  },
  "OTPCode": {"type": "string", "flattened": false},
  "OptInPhoneNumberInput": {
    "type": "structure",
    "members": {
      "phoneNumber": {"shape": "PhoneNumber", "flattened": false}
    },
    "flattened": false
  },
  "OptInPhoneNumberResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "PhoneNumber": {"type": "string", "flattened": false},
  "PhoneNumberInformation": {
    "type": "structure",
    "members": {
      "CreatedAt": {"shape": "Timestamp", "flattened": false},
      "PhoneNumber": {"shape": "PhoneNumber", "flattened": false},
      "Status": {"shape": "String", "flattened": false},
      "Iso2CountryCode": {"shape": "Iso2CountryCode", "flattened": false},
      "RouteType": {"shape": "RouteType", "flattened": false},
      "NumberCapabilities": {
        "shape": "NumberCapabilityList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PhoneNumberInformationList": {
    "type": "list",
    "member": {"shape": "PhoneNumberInformation"},
    "flattened": false
  },
  "PhoneNumberList": {
    "type": "list",
    "member": {"shape": "PhoneNumber"},
    "flattened": false
  },
  "PhoneNumberString": {"type": "string", "flattened": false},
  "PlatformApplication": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "PublishBatchInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "PublishBatchRequestEntries": {
        "shape": "PublishBatchRequestEntryList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "PublishBatchRequestEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "Message": {"shape": "message", "flattened": false},
      "Subject": {"shape": "subject", "flattened": false},
      "MessageStructure": {"shape": "messageStructure", "flattened": false},
      "MessageAttributes": {"shape": "MessageAttributeMap", "flattened": false},
      "MessageDeduplicationId": {"shape": "String", "flattened": false},
      "MessageGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PublishBatchRequestEntryList": {
    "type": "list",
    "member": {"shape": "PublishBatchRequestEntry"},
    "flattened": false
  },
  "PublishBatchResponse": {
    "type": "structure",
    "members": {
      "Successful": {
        "shape": "PublishBatchResultEntryList",
        "flattened": false
      },
      "Failed": {"shape": "BatchResultErrorEntryList", "flattened": false}
    },
    "flattened": false
  },
  "PublishBatchResultEntry": {
    "type": "structure",
    "members": {
      "Id": {"shape": "String", "flattened": false},
      "MessageId": {"shape": "messageId", "flattened": false},
      "SequenceNumber": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PublishBatchResultEntryList": {
    "type": "list",
    "member": {"shape": "PublishBatchResultEntry"},
    "flattened": false
  },
  "PublishInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "TargetArn": {"shape": "String", "flattened": false},
      "PhoneNumber": {"shape": "PhoneNumber", "flattened": false},
      "Message": {"shape": "message", "flattened": false},
      "Subject": {"shape": "subject", "flattened": false},
      "MessageStructure": {"shape": "messageStructure", "flattened": false},
      "MessageAttributes": {"shape": "MessageAttributeMap", "flattened": false},
      "MessageDeduplicationId": {"shape": "String", "flattened": false},
      "MessageGroupId": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PublishResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "messageId", "flattened": false},
      "SequenceNumber": {"shape": "String", "flattened": false}
    },
    "flattened": false
  },
  "PutDataProtectionPolicyInput": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "topicARN", "flattened": false},
      "DataProtectionPolicy": {"shape": "attributeValue", "flattened": false}
    },
    "flattened": false
  },
  "RemovePermissionInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "Label": {"shape": "label", "flattened": false}
    },
    "flattened": false
  },
  "RouteType": {"type": "string", "flattened": false},
  "SMSSandboxPhoneNumber": {
    "type": "structure",
    "members": {
      "PhoneNumber": {"shape": "PhoneNumberString", "flattened": false},
      "Status": {
        "shape": "SMSSandboxPhoneNumberVerificationStatus",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SMSSandboxPhoneNumberList": {
    "type": "list",
    "member": {"shape": "SMSSandboxPhoneNumber"},
    "flattened": false
  },
  "SMSSandboxPhoneNumberVerificationStatus": {
    "type": "string",
    "flattened": false
  },
  "SetEndpointAttributesInput": {
    "type": "structure",
    "members": {
      "EndpointArn": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "SetPlatformApplicationAttributesInput": {
    "type": "structure",
    "members": {
      "PlatformApplicationArn": {"shape": "String", "flattened": false},
      "Attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "SetSMSAttributesInput": {
    "type": "structure",
    "members": {
      "attributes": {"shape": "MapStringToString", "flattened": false}
    },
    "flattened": false
  },
  "SetSMSAttributesResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetSubscriptionAttributesInput": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false},
      "AttributeName": {"shape": "attributeName", "flattened": false},
      "AttributeValue": {"shape": "attributeValue", "flattened": false}
    },
    "flattened": false
  },
  "SetTopicAttributesInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "AttributeName": {"shape": "attributeName", "flattened": false},
      "AttributeValue": {"shape": "attributeValue", "flattened": false}
    },
    "flattened": false
  },
  "String": {"type": "string", "flattened": false},
  "SubscribeInput": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false},
      "Protocol": {"shape": "protocol", "flattened": false},
      "Endpoint": {"shape": "endpoint", "flattened": false},
      "Attributes": {"shape": "SubscriptionAttributesMap", "flattened": false},
      "ReturnSubscriptionArn": {"shape": "boolean", "flattened": false}
    },
    "flattened": false
  },
  "SubscribeResponse": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false}
    },
    "flattened": false
  },
  "Subscription": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false},
      "Owner": {"shape": "account", "flattened": false},
      "Protocol": {"shape": "protocol", "flattened": false},
      "Endpoint": {"shape": "endpoint", "flattened": false},
      "TopicArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "SubscriptionAttributesMap": {
    "type": "map",
    "key": {"shape": "attributeName"},
    "value": {"shape": "attributeValue"},
    "flattened": false
  },
  "SubscriptionsList": {
    "type": "list",
    "member": {"shape": "Subscription"},
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
  "TagResourceRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "TagList", "flattened": false}
    },
    "flattened": false
  },
  "TagResourceResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "TagValue": {"type": "string", "flattened": false},
  "Timestamp": {"type": "timestamp", "flattened": false},
  "Topic": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "topicARN", "flattened": false}
    },
    "flattened": false
  },
  "TopicAttributesMap": {
    "type": "map",
    "key": {"shape": "attributeName"},
    "value": {"shape": "attributeValue"},
    "flattened": false
  },
  "TopicsList": {
    "type": "list",
    "member": {"shape": "Topic"},
    "flattened": false
  },
  "UnsubscribeInput": {
    "type": "structure",
    "members": {
      "SubscriptionArn": {"shape": "subscriptionARN", "flattened": false}
    },
    "flattened": false
  },
  "UntagResourceRequest": {
    "type": "structure",
    "members": {
      "ResourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "TagKeys": {"shape": "TagKeyList", "flattened": false}
    },
    "flattened": false
  },
  "UntagResourceResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "VerifySMSSandboxPhoneNumberInput": {
    "type": "structure",
    "members": {
      "PhoneNumber": {"shape": "PhoneNumberString", "flattened": false},
      "OneTimePassword": {"shape": "OTPCode", "flattened": false}
    },
    "flattened": false
  },
  "VerifySMSSandboxPhoneNumberResult": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "account": {"type": "string", "flattened": false},
  "action": {"type": "string", "flattened": false},
  "attributeName": {"type": "string", "flattened": false},
  "attributeValue": {"type": "string", "flattened": false},
  "authenticateOnUnsubscribe": {"type": "string", "flattened": false},
  "boolean": {"type": "boolean", "flattened": false},
  "delegate": {"type": "string", "flattened": false},
  "endpoint": {"type": "string", "flattened": false},
  "label": {"type": "string", "flattened": false},
  "message": {"type": "string", "flattened": false},
  "messageId": {"type": "string", "flattened": false},
  "messageStructure": {"type": "string", "flattened": false},
  "nextToken": {"type": "string", "flattened": false},
  "protocol": {"type": "string", "flattened": false},
  "string": {"type": "string", "flattened": false},
  "subject": {"type": "string", "flattened": false},
  "subscriptionARN": {"type": "string", "flattened": false},
  "token": {"type": "string", "flattened": false},
  "topicARN": {"type": "string", "flattened": false},
  "topicName": {"type": "string", "flattened": false}
};
