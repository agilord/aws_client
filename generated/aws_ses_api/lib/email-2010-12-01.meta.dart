// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = {
  "AddHeaderAction": {
    "type": "structure",
    "members": {
      "HeaderName": {"shape": "HeaderName", "flattened": false},
      "HeaderValue": {"shape": "HeaderValue", "flattened": false}
    },
    "flattened": false
  },
  "Address": {"type": "string", "flattened": false},
  "AddressList": {
    "type": "list",
    "member": {"shape": "Address"},
    "flattened": false
  },
  "AmazonResourceName": {"type": "string", "flattened": false},
  "ArrivalDate": {"type": "timestamp", "flattened": false},
  "BehaviorOnMXFailure": {"type": "string", "flattened": false},
  "Body": {
    "type": "structure",
    "members": {
      "Text": {"shape": "Content", "flattened": false},
      "Html": {"shape": "Content", "flattened": false}
    },
    "flattened": false
  },
  "BounceAction": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false},
      "SmtpReplyCode": {"shape": "BounceSmtpReplyCode", "flattened": false},
      "StatusCode": {"shape": "BounceStatusCode", "flattened": false},
      "Message": {"shape": "BounceMessage", "flattened": false},
      "Sender": {"shape": "Address", "flattened": false}
    },
    "flattened": false
  },
  "BounceMessage": {"type": "string", "flattened": false},
  "BounceSmtpReplyCode": {"type": "string", "flattened": false},
  "BounceStatusCode": {"type": "string", "flattened": false},
  "BounceType": {"type": "string", "flattened": false},
  "BouncedRecipientInfo": {
    "type": "structure",
    "members": {
      "Recipient": {"shape": "Address", "flattened": false},
      "RecipientArn": {"shape": "AmazonResourceName", "flattened": false},
      "BounceType": {"shape": "BounceType", "flattened": false},
      "RecipientDsnFields": {"shape": "RecipientDsnFields", "flattened": false}
    },
    "flattened": false
  },
  "BouncedRecipientInfoList": {
    "type": "list",
    "member": {"shape": "BouncedRecipientInfo"},
    "flattened": false
  },
  "BulkEmailDestination": {
    "type": "structure",
    "members": {
      "Destination": {"shape": "Destination", "flattened": false},
      "ReplacementTags": {"shape": "MessageTagList", "flattened": false},
      "ReplacementTemplateData": {"shape": "TemplateData", "flattened": false}
    },
    "flattened": false
  },
  "BulkEmailDestinationList": {
    "type": "list",
    "member": {"shape": "BulkEmailDestination"},
    "flattened": false
  },
  "BulkEmailDestinationStatus": {
    "type": "structure",
    "members": {
      "Status": {"shape": "BulkEmailStatus", "flattened": false},
      "Error": {"shape": "Error", "flattened": false},
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "BulkEmailDestinationStatusList": {
    "type": "list",
    "member": {"shape": "BulkEmailDestinationStatus"},
    "flattened": false
  },
  "BulkEmailStatus": {"type": "string", "flattened": false},
  "Charset": {"type": "string", "flattened": false},
  "Cidr": {"type": "string", "flattened": false},
  "CloneReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "OriginalRuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false}
    },
    "flattened": false
  },
  "CloneReceiptRuleSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CloudWatchDestination": {
    "type": "structure",
    "members": {
      "DimensionConfigurations": {
        "shape": "CloudWatchDimensionConfigurations",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CloudWatchDimensionConfiguration": {
    "type": "structure",
    "members": {
      "DimensionName": {"shape": "DimensionName", "flattened": false},
      "DimensionValueSource": {
        "shape": "DimensionValueSource",
        "flattened": false
      },
      "DefaultDimensionValue": {
        "shape": "DefaultDimensionValue",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CloudWatchDimensionConfigurations": {
    "type": "list",
    "member": {"shape": "CloudWatchDimensionConfiguration"},
    "flattened": false
  },
  "ConfigurationSet": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ConfigurationSetName", "flattened": false}
    },
    "flattened": false
  },
  "ConfigurationSetAttribute": {"type": "string", "flattened": false},
  "ConfigurationSetAttributeList": {
    "type": "list",
    "member": {"shape": "ConfigurationSetAttribute"},
    "flattened": false
  },
  "ConfigurationSetName": {"type": "string", "flattened": false},
  "ConfigurationSets": {
    "type": "list",
    "member": {"shape": "ConfigurationSet"},
    "flattened": false
  },
  "Content": {
    "type": "structure",
    "members": {
      "Data": {"shape": "MessageData", "flattened": false},
      "Charset": {"shape": "Charset", "flattened": false}
    },
    "flattened": false
  },
  "Counter": {"type": "long", "flattened": false},
  "CreateConfigurationSetEventDestinationRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "EventDestination": {"shape": "EventDestination", "flattened": false}
    },
    "flattened": false
  },
  "CreateConfigurationSetEventDestinationResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateConfigurationSetRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSet": {"shape": "ConfigurationSet", "flattened": false}
    },
    "flattened": false
  },
  "CreateConfigurationSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateConfigurationSetTrackingOptionsRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "TrackingOptions": {"shape": "TrackingOptions", "flattened": false}
    },
    "flattened": false
  },
  "CreateConfigurationSetTrackingOptionsResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateCustomVerificationEmailTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "FromEmailAddress": {"shape": "FromAddress", "flattened": false},
      "TemplateSubject": {"shape": "Subject", "flattened": false},
      "TemplateContent": {"shape": "TemplateContent", "flattened": false},
      "SuccessRedirectionURL": {
        "shape": "SuccessRedirectionURL",
        "flattened": false
      },
      "FailureRedirectionURL": {
        "shape": "FailureRedirectionURL",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CreateReceiptFilterRequest": {
    "type": "structure",
    "members": {
      "Filter": {"shape": "ReceiptFilter", "flattened": false}
    },
    "flattened": false
  },
  "CreateReceiptFilterResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateReceiptRuleRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "After": {"shape": "ReceiptRuleName", "flattened": false},
      "Rule": {"shape": "ReceiptRule", "flattened": false}
    },
    "flattened": false
  },
  "CreateReceiptRuleResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false}
    },
    "flattened": false
  },
  "CreateReceiptRuleSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CreateTemplateRequest": {
    "type": "structure",
    "members": {
      "Template": {"shape": "Template", "flattened": false}
    },
    "flattened": false
  },
  "CreateTemplateResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "CustomMailFromStatus": {"type": "string", "flattened": false},
  "CustomRedirectDomain": {"type": "string", "flattened": false},
  "CustomVerificationEmailTemplate": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "FromEmailAddress": {"shape": "FromAddress", "flattened": false},
      "TemplateSubject": {"shape": "Subject", "flattened": false},
      "SuccessRedirectionURL": {
        "shape": "SuccessRedirectionURL",
        "flattened": false
      },
      "FailureRedirectionURL": {
        "shape": "FailureRedirectionURL",
        "flattened": false
      }
    },
    "flattened": false
  },
  "CustomVerificationEmailTemplates": {
    "type": "list",
    "member": {"shape": "CustomVerificationEmailTemplate"},
    "flattened": false
  },
  "DefaultDimensionValue": {"type": "string", "flattened": false},
  "DeleteConfigurationSetEventDestinationRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "EventDestinationName": {
        "shape": "EventDestinationName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteConfigurationSetEventDestinationResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteConfigurationSetRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteConfigurationSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteConfigurationSetTrackingOptionsRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DeleteConfigurationSetTrackingOptionsResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteCustomVerificationEmailTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIdentityPolicyRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIdentityPolicyResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteIdentityRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false}
    },
    "flattened": false
  },
  "DeleteIdentityResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteReceiptFilterRequest": {
    "type": "structure",
    "members": {
      "FilterName": {"shape": "ReceiptFilterName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteReceiptFilterResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteReceiptRuleRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "RuleName": {"shape": "ReceiptRuleName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteReceiptRuleResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteReceiptRuleSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false}
    },
    "flattened": false
  },
  "DeleteTemplateResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DeleteVerifiedEmailAddressRequest": {
    "type": "structure",
    "members": {
      "EmailAddress": {"shape": "Address", "flattened": false}
    },
    "flattened": false
  },
  "DeliveryOptions": {
    "type": "structure",
    "members": {
      "TlsPolicy": {"shape": "TlsPolicy", "flattened": false}
    },
    "flattened": false
  },
  "DescribeActiveReceiptRuleSetRequest": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "DescribeActiveReceiptRuleSetResponse": {
    "type": "structure",
    "members": {
      "Metadata": {"shape": "ReceiptRuleSetMetadata", "flattened": false},
      "Rules": {"shape": "ReceiptRulesList", "flattened": false}
    },
    "flattened": false
  },
  "DescribeConfigurationSetRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "ConfigurationSetAttributeNames": {
        "shape": "ConfigurationSetAttributeList",
        "flattened": false
      }
    },
    "flattened": false
  },
  "DescribeConfigurationSetResponse": {
    "type": "structure",
    "members": {
      "ConfigurationSet": {"shape": "ConfigurationSet", "flattened": false},
      "EventDestinations": {"shape": "EventDestinations", "flattened": false},
      "TrackingOptions": {"shape": "TrackingOptions", "flattened": false},
      "DeliveryOptions": {"shape": "DeliveryOptions", "flattened": false},
      "ReputationOptions": {"shape": "ReputationOptions", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReceiptRuleRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "RuleName": {"shape": "ReceiptRuleName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReceiptRuleResponse": {
    "type": "structure",
    "members": {
      "Rule": {"shape": "ReceiptRule", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false}
    },
    "flattened": false
  },
  "DescribeReceiptRuleSetResponse": {
    "type": "structure",
    "members": {
      "Metadata": {"shape": "ReceiptRuleSetMetadata", "flattened": false},
      "Rules": {"shape": "ReceiptRulesList", "flattened": false}
    },
    "flattened": false
  },
  "Destination": {
    "type": "structure",
    "members": {
      "ToAddresses": {"shape": "AddressList", "flattened": false},
      "CcAddresses": {"shape": "AddressList", "flattened": false},
      "BccAddresses": {"shape": "AddressList", "flattened": false}
    },
    "flattened": false
  },
  "DiagnosticCode": {"type": "string", "flattened": false},
  "DimensionName": {"type": "string", "flattened": false},
  "DimensionValueSource": {"type": "string", "flattened": false},
  "DkimAttributes": {
    "type": "map",
    "key": {"shape": "Identity"},
    "value": {"shape": "IdentityDkimAttributes"},
    "flattened": false
  },
  "Domain": {"type": "string", "flattened": false},
  "DsnAction": {"type": "string", "flattened": false},
  "DsnStatus": {"type": "string", "flattened": false},
  "Enabled": {"type": "boolean", "flattened": false},
  "Error": {"type": "string", "flattened": false},
  "EventDestination": {
    "type": "structure",
    "members": {
      "Name": {"shape": "EventDestinationName", "flattened": false},
      "Enabled": {"shape": "Enabled", "flattened": false},
      "MatchingEventTypes": {"shape": "EventTypes", "flattened": false},
      "KinesisFirehoseDestination": {
        "shape": "KinesisFirehoseDestination",
        "flattened": false
      },
      "CloudWatchDestination": {
        "shape": "CloudWatchDestination",
        "flattened": false
      },
      "SNSDestination": {"shape": "SNSDestination", "flattened": false}
    },
    "flattened": false
  },
  "EventDestinationName": {"type": "string", "flattened": false},
  "EventDestinations": {
    "type": "list",
    "member": {"shape": "EventDestination"},
    "flattened": false
  },
  "EventType": {"type": "string", "flattened": false},
  "EventTypes": {
    "type": "list",
    "member": {"shape": "EventType"},
    "flattened": false
  },
  "Explanation": {"type": "string", "flattened": false},
  "ExtensionField": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ExtensionFieldName", "flattened": false},
      "Value": {"shape": "ExtensionFieldValue", "flattened": false}
    },
    "flattened": false
  },
  "ExtensionFieldList": {
    "type": "list",
    "member": {"shape": "ExtensionField"},
    "flattened": false
  },
  "ExtensionFieldName": {"type": "string", "flattened": false},
  "ExtensionFieldValue": {"type": "string", "flattened": false},
  "FailureRedirectionURL": {"type": "string", "flattened": false},
  "FromAddress": {"type": "string", "flattened": false},
  "GetAccountSendingEnabledResponse": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "GetCustomVerificationEmailTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false}
    },
    "flattened": false
  },
  "GetCustomVerificationEmailTemplateResponse": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "FromEmailAddress": {"shape": "FromAddress", "flattened": false},
      "TemplateSubject": {"shape": "Subject", "flattened": false},
      "TemplateContent": {"shape": "TemplateContent", "flattened": false},
      "SuccessRedirectionURL": {
        "shape": "SuccessRedirectionURL",
        "flattened": false
      },
      "FailureRedirectionURL": {
        "shape": "FailureRedirectionURL",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetIdentityDkimAttributesRequest": {
    "type": "structure",
    "members": {
      "Identities": {"shape": "IdentityList", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityDkimAttributesResponse": {
    "type": "structure",
    "members": {
      "DkimAttributes": {"shape": "DkimAttributes", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityMailFromDomainAttributesRequest": {
    "type": "structure",
    "members": {
      "Identities": {"shape": "IdentityList", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityMailFromDomainAttributesResponse": {
    "type": "structure",
    "members": {
      "MailFromDomainAttributes": {
        "shape": "MailFromDomainAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetIdentityNotificationAttributesRequest": {
    "type": "structure",
    "members": {
      "Identities": {"shape": "IdentityList", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityNotificationAttributesResponse": {
    "type": "structure",
    "members": {
      "NotificationAttributes": {
        "shape": "NotificationAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetIdentityPoliciesRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "PolicyNames": {"shape": "PolicyNameList", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityPoliciesResponse": {
    "type": "structure",
    "members": {
      "Policies": {"shape": "PolicyMap", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityVerificationAttributesRequest": {
    "type": "structure",
    "members": {
      "Identities": {"shape": "IdentityList", "flattened": false}
    },
    "flattened": false
  },
  "GetIdentityVerificationAttributesResponse": {
    "type": "structure",
    "members": {
      "VerificationAttributes": {
        "shape": "VerificationAttributes",
        "flattened": false
      }
    },
    "flattened": false
  },
  "GetSendQuotaResponse": {
    "type": "structure",
    "members": {
      "Max24HourSend": {"shape": "Max24HourSend", "flattened": false},
      "MaxSendRate": {"shape": "MaxSendRate", "flattened": false},
      "SentLast24Hours": {"shape": "SentLast24Hours", "flattened": false}
    },
    "flattened": false
  },
  "GetSendStatisticsResponse": {
    "type": "structure",
    "members": {
      "SendDataPoints": {"shape": "SendDataPointList", "flattened": false}
    },
    "flattened": false
  },
  "GetTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false}
    },
    "flattened": false
  },
  "GetTemplateResponse": {
    "type": "structure",
    "members": {
      "Template": {"shape": "Template", "flattened": false}
    },
    "flattened": false
  },
  "HeaderName": {"type": "string", "flattened": false},
  "HeaderValue": {"type": "string", "flattened": false},
  "HtmlPart": {"type": "string", "flattened": false},
  "Identity": {"type": "string", "flattened": false},
  "IdentityDkimAttributes": {
    "type": "structure",
    "members": {
      "DkimEnabled": {"shape": "Enabled", "flattened": false},
      "DkimVerificationStatus": {
        "shape": "VerificationStatus",
        "flattened": false
      },
      "DkimTokens": {"shape": "VerificationTokenList", "flattened": false}
    },
    "flattened": false
  },
  "IdentityList": {
    "type": "list",
    "member": {"shape": "Identity"},
    "flattened": false
  },
  "IdentityMailFromDomainAttributes": {
    "type": "structure",
    "members": {
      "MailFromDomain": {"shape": "MailFromDomainName", "flattened": false},
      "MailFromDomainStatus": {
        "shape": "CustomMailFromStatus",
        "flattened": false
      },
      "BehaviorOnMXFailure": {
        "shape": "BehaviorOnMXFailure",
        "flattened": false
      }
    },
    "flattened": false
  },
  "IdentityNotificationAttributes": {
    "type": "structure",
    "members": {
      "BounceTopic": {"shape": "NotificationTopic", "flattened": false},
      "ComplaintTopic": {"shape": "NotificationTopic", "flattened": false},
      "DeliveryTopic": {"shape": "NotificationTopic", "flattened": false},
      "ForwardingEnabled": {"shape": "Enabled", "flattened": false},
      "HeadersInBounceNotificationsEnabled": {
        "shape": "Enabled",
        "flattened": false
      },
      "HeadersInComplaintNotificationsEnabled": {
        "shape": "Enabled",
        "flattened": false
      },
      "HeadersInDeliveryNotificationsEnabled": {
        "shape": "Enabled",
        "flattened": false
      }
    },
    "flattened": false
  },
  "IdentityType": {"type": "string", "flattened": false},
  "IdentityVerificationAttributes": {
    "type": "structure",
    "members": {
      "VerificationStatus": {"shape": "VerificationStatus", "flattened": false},
      "VerificationToken": {"shape": "VerificationToken", "flattened": false}
    },
    "flattened": false
  },
  "InvocationType": {"type": "string", "flattened": false},
  "KinesisFirehoseDestination": {
    "type": "structure",
    "members": {
      "IAMRoleARN": {"shape": "AmazonResourceName", "flattened": false},
      "DeliveryStreamARN": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "LambdaAction": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false},
      "FunctionArn": {"shape": "AmazonResourceName", "flattened": false},
      "InvocationType": {"shape": "InvocationType", "flattened": false}
    },
    "flattened": false
  },
  "LastAttemptDate": {"type": "timestamp", "flattened": false},
  "LastFreshStart": {"type": "timestamp", "flattened": false},
  "ListConfigurationSetsRequest": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxItems": {"shape": "MaxItems", "flattened": false}
    },
    "flattened": false
  },
  "ListConfigurationSetsResponse": {
    "type": "structure",
    "members": {
      "ConfigurationSets": {"shape": "ConfigurationSets", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListCustomVerificationEmailTemplatesRequest": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxResults": {"shape": "MaxResults", "flattened": false}
    },
    "flattened": false
  },
  "ListCustomVerificationEmailTemplatesResponse": {
    "type": "structure",
    "members": {
      "CustomVerificationEmailTemplates": {
        "shape": "CustomVerificationEmailTemplates",
        "flattened": false
      },
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListIdentitiesRequest": {
    "type": "structure",
    "members": {
      "IdentityType": {"shape": "IdentityType", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxItems": {"shape": "MaxItems", "flattened": false}
    },
    "flattened": false
  },
  "ListIdentitiesResponse": {
    "type": "structure",
    "members": {
      "Identities": {"shape": "IdentityList", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListIdentityPoliciesRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false}
    },
    "flattened": false
  },
  "ListIdentityPoliciesResponse": {
    "type": "structure",
    "members": {
      "PolicyNames": {"shape": "PolicyNameList", "flattened": false}
    },
    "flattened": false
  },
  "ListReceiptFiltersRequest": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "ListReceiptFiltersResponse": {
    "type": "structure",
    "members": {
      "Filters": {"shape": "ReceiptFilterList", "flattened": false}
    },
    "flattened": false
  },
  "ListReceiptRuleSetsRequest": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListReceiptRuleSetsResponse": {
    "type": "structure",
    "members": {
      "RuleSets": {"shape": "ReceiptRuleSetsLists", "flattened": false},
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListTemplatesRequest": {
    "type": "structure",
    "members": {
      "NextToken": {"shape": "NextToken", "flattened": false},
      "MaxItems": {"shape": "MaxItems", "flattened": false}
    },
    "flattened": false
  },
  "ListTemplatesResponse": {
    "type": "structure",
    "members": {
      "TemplatesMetadata": {
        "shape": "TemplateMetadataList",
        "flattened": false
      },
      "NextToken": {"shape": "NextToken", "flattened": false}
    },
    "flattened": false
  },
  "ListVerifiedEmailAddressesResponse": {
    "type": "structure",
    "members": {
      "VerifiedEmailAddresses": {"shape": "AddressList", "flattened": false}
    },
    "flattened": false
  },
  "MailFromDomainAttributes": {
    "type": "map",
    "key": {"shape": "Identity"},
    "value": {"shape": "IdentityMailFromDomainAttributes"},
    "flattened": false
  },
  "MailFromDomainName": {"type": "string", "flattened": false},
  "Max24HourSend": {"type": "double", "flattened": false},
  "MaxItems": {"type": "integer", "flattened": false},
  "MaxResults": {"type": "integer", "flattened": false},
  "MaxSendRate": {"type": "double", "flattened": false},
  "Message": {
    "type": "structure",
    "members": {
      "Subject": {"shape": "Content", "flattened": false},
      "Body": {"shape": "Body", "flattened": false}
    },
    "flattened": false
  },
  "MessageData": {"type": "string", "flattened": false},
  "MessageDsn": {
    "type": "structure",
    "members": {
      "ReportingMta": {"shape": "ReportingMta", "flattened": false},
      "ArrivalDate": {"shape": "ArrivalDate", "flattened": false},
      "ExtensionFields": {"shape": "ExtensionFieldList", "flattened": false}
    },
    "flattened": false
  },
  "MessageId": {"type": "string", "flattened": false},
  "MessageTag": {
    "type": "structure",
    "members": {
      "Name": {"shape": "MessageTagName", "flattened": false},
      "Value": {"shape": "MessageTagValue", "flattened": false}
    },
    "flattened": false
  },
  "MessageTagList": {
    "type": "list",
    "member": {"shape": "MessageTag"},
    "flattened": false
  },
  "MessageTagName": {"type": "string", "flattened": false},
  "MessageTagValue": {"type": "string", "flattened": false},
  "NextToken": {"type": "string", "flattened": false},
  "NotificationAttributes": {
    "type": "map",
    "key": {"shape": "Identity"},
    "value": {"shape": "IdentityNotificationAttributes"},
    "flattened": false
  },
  "NotificationTopic": {"type": "string", "flattened": false},
  "NotificationType": {"type": "string", "flattened": false},
  "Policy": {"type": "string", "flattened": false},
  "PolicyMap": {
    "type": "map",
    "key": {"shape": "PolicyName"},
    "value": {"shape": "Policy"},
    "flattened": false
  },
  "PolicyName": {"type": "string", "flattened": false},
  "PolicyNameList": {
    "type": "list",
    "member": {"shape": "PolicyName"},
    "flattened": false
  },
  "PutConfigurationSetDeliveryOptionsRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "DeliveryOptions": {"shape": "DeliveryOptions", "flattened": false}
    },
    "flattened": false
  },
  "PutConfigurationSetDeliveryOptionsResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "PutIdentityPolicyRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "PolicyName": {"shape": "PolicyName", "flattened": false},
      "Policy": {"shape": "Policy", "flattened": false}
    },
    "flattened": false
  },
  "PutIdentityPolicyResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "RawMessage": {
    "type": "structure",
    "members": {
      "Data": {"shape": "RawMessageData", "flattened": false}
    },
    "flattened": false
  },
  "RawMessageData": {"type": "blob", "flattened": false},
  "ReceiptAction": {
    "type": "structure",
    "members": {
      "S3Action": {"shape": "S3Action", "flattened": false},
      "BounceAction": {"shape": "BounceAction", "flattened": false},
      "WorkmailAction": {"shape": "WorkmailAction", "flattened": false},
      "LambdaAction": {"shape": "LambdaAction", "flattened": false},
      "StopAction": {"shape": "StopAction", "flattened": false},
      "AddHeaderAction": {"shape": "AddHeaderAction", "flattened": false},
      "SNSAction": {"shape": "SNSAction", "flattened": false}
    },
    "flattened": false
  },
  "ReceiptActionsList": {
    "type": "list",
    "member": {"shape": "ReceiptAction"},
    "flattened": false
  },
  "ReceiptFilter": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ReceiptFilterName", "flattened": false},
      "IpFilter": {"shape": "ReceiptIpFilter", "flattened": false}
    },
    "flattened": false
  },
  "ReceiptFilterList": {
    "type": "list",
    "member": {"shape": "ReceiptFilter"},
    "flattened": false
  },
  "ReceiptFilterName": {"type": "string", "flattened": false},
  "ReceiptFilterPolicy": {"type": "string", "flattened": false},
  "ReceiptIpFilter": {
    "type": "structure",
    "members": {
      "Policy": {"shape": "ReceiptFilterPolicy", "flattened": false},
      "Cidr": {"shape": "Cidr", "flattened": false}
    },
    "flattened": false
  },
  "ReceiptRule": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ReceiptRuleName", "flattened": false},
      "Enabled": {"shape": "Enabled", "flattened": false},
      "TlsPolicy": {"shape": "TlsPolicy", "flattened": false},
      "Recipients": {"shape": "RecipientsList", "flattened": false},
      "Actions": {"shape": "ReceiptActionsList", "flattened": false},
      "ScanEnabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "ReceiptRuleName": {"type": "string", "flattened": false},
  "ReceiptRuleNamesList": {
    "type": "list",
    "member": {"shape": "ReceiptRuleName"},
    "flattened": false
  },
  "ReceiptRuleSetMetadata": {
    "type": "structure",
    "members": {
      "Name": {"shape": "ReceiptRuleSetName", "flattened": false},
      "CreatedTimestamp": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "ReceiptRuleSetName": {"type": "string", "flattened": false},
  "ReceiptRuleSetsLists": {
    "type": "list",
    "member": {"shape": "ReceiptRuleSetMetadata"},
    "flattened": false
  },
  "ReceiptRulesList": {
    "type": "list",
    "member": {"shape": "ReceiptRule"},
    "flattened": false
  },
  "Recipient": {"type": "string", "flattened": false},
  "RecipientDsnFields": {
    "type": "structure",
    "members": {
      "FinalRecipient": {"shape": "Address", "flattened": false},
      "Action": {"shape": "DsnAction", "flattened": false},
      "RemoteMta": {"shape": "RemoteMta", "flattened": false},
      "Status": {"shape": "DsnStatus", "flattened": false},
      "DiagnosticCode": {"shape": "DiagnosticCode", "flattened": false},
      "LastAttemptDate": {"shape": "LastAttemptDate", "flattened": false},
      "ExtensionFields": {"shape": "ExtensionFieldList", "flattened": false}
    },
    "flattened": false
  },
  "RecipientsList": {
    "type": "list",
    "member": {"shape": "Recipient"},
    "flattened": false
  },
  "RemoteMta": {"type": "string", "flattened": false},
  "RenderedTemplate": {"type": "string", "flattened": false},
  "ReorderReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "RuleNames": {"shape": "ReceiptRuleNamesList", "flattened": false}
    },
    "flattened": false
  },
  "ReorderReceiptRuleSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "ReportingMta": {"type": "string", "flattened": false},
  "ReputationOptions": {
    "type": "structure",
    "members": {
      "SendingEnabled": {"shape": "Enabled", "flattened": false},
      "ReputationMetricsEnabled": {"shape": "Enabled", "flattened": false},
      "LastFreshStart": {"shape": "LastFreshStart", "flattened": false}
    },
    "flattened": false
  },
  "S3Action": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false},
      "BucketName": {"shape": "S3BucketName", "flattened": false},
      "ObjectKeyPrefix": {"shape": "S3KeyPrefix", "flattened": false},
      "KmsKeyArn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "S3BucketName": {"type": "string", "flattened": false},
  "S3KeyPrefix": {"type": "string", "flattened": false},
  "SNSAction": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false},
      "Encoding": {"shape": "SNSActionEncoding", "flattened": false}
    },
    "flattened": false
  },
  "SNSActionEncoding": {"type": "string", "flattened": false},
  "SNSDestination": {
    "type": "structure",
    "members": {
      "TopicARN": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "SendBounceRequest": {
    "type": "structure",
    "members": {
      "OriginalMessageId": {"shape": "MessageId", "flattened": false},
      "BounceSender": {"shape": "Address", "flattened": false},
      "Explanation": {"shape": "Explanation", "flattened": false},
      "MessageDsn": {"shape": "MessageDsn", "flattened": false},
      "BouncedRecipientInfoList": {
        "shape": "BouncedRecipientInfoList",
        "flattened": false
      },
      "BounceSenderArn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "SendBounceResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "SendBulkTemplatedEmailRequest": {
    "type": "structure",
    "members": {
      "Source": {"shape": "Address", "flattened": false},
      "SourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "ReplyToAddresses": {"shape": "AddressList", "flattened": false},
      "ReturnPath": {"shape": "Address", "flattened": false},
      "ReturnPathArn": {"shape": "AmazonResourceName", "flattened": false},
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "DefaultTags": {"shape": "MessageTagList", "flattened": false},
      "Template": {"shape": "TemplateName", "flattened": false},
      "TemplateArn": {"shape": "AmazonResourceName", "flattened": false},
      "DefaultTemplateData": {"shape": "TemplateData", "flattened": false},
      "Destinations": {"shape": "BulkEmailDestinationList", "flattened": false}
    },
    "flattened": false
  },
  "SendBulkTemplatedEmailResponse": {
    "type": "structure",
    "members": {
      "Status": {"shape": "BulkEmailDestinationStatusList", "flattened": false}
    },
    "flattened": false
  },
  "SendCustomVerificationEmailRequest": {
    "type": "structure",
    "members": {
      "EmailAddress": {"shape": "Address", "flattened": false},
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SendCustomVerificationEmailResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "SendDataPoint": {
    "type": "structure",
    "members": {
      "Timestamp": {"shape": "Timestamp", "flattened": false},
      "DeliveryAttempts": {"shape": "Counter", "flattened": false},
      "Bounces": {"shape": "Counter", "flattened": false},
      "Complaints": {"shape": "Counter", "flattened": false},
      "Rejects": {"shape": "Counter", "flattened": false}
    },
    "flattened": false
  },
  "SendDataPointList": {
    "type": "list",
    "member": {"shape": "SendDataPoint"},
    "flattened": false
  },
  "SendEmailRequest": {
    "type": "structure",
    "members": {
      "Source": {"shape": "Address", "flattened": false},
      "Destination": {"shape": "Destination", "flattened": false},
      "Message": {"shape": "Message", "flattened": false},
      "ReplyToAddresses": {"shape": "AddressList", "flattened": false},
      "ReturnPath": {"shape": "Address", "flattened": false},
      "SourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "ReturnPathArn": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "MessageTagList", "flattened": false},
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SendEmailResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "SendRawEmailRequest": {
    "type": "structure",
    "members": {
      "Source": {"shape": "Address", "flattened": false},
      "Destinations": {"shape": "AddressList", "flattened": false},
      "RawMessage": {"shape": "RawMessage", "flattened": false},
      "FromArn": {"shape": "AmazonResourceName", "flattened": false},
      "SourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "ReturnPathArn": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "MessageTagList", "flattened": false},
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SendRawEmailResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "SendTemplatedEmailRequest": {
    "type": "structure",
    "members": {
      "Source": {"shape": "Address", "flattened": false},
      "Destination": {"shape": "Destination", "flattened": false},
      "ReplyToAddresses": {"shape": "AddressList", "flattened": false},
      "ReturnPath": {"shape": "Address", "flattened": false},
      "SourceArn": {"shape": "AmazonResourceName", "flattened": false},
      "ReturnPathArn": {"shape": "AmazonResourceName", "flattened": false},
      "Tags": {"shape": "MessageTagList", "flattened": false},
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "Template": {"shape": "TemplateName", "flattened": false},
      "TemplateArn": {"shape": "AmazonResourceName", "flattened": false},
      "TemplateData": {"shape": "TemplateData", "flattened": false}
    },
    "flattened": false
  },
  "SendTemplatedEmailResponse": {
    "type": "structure",
    "members": {
      "MessageId": {"shape": "MessageId", "flattened": false}
    },
    "flattened": false
  },
  "SentLast24Hours": {"type": "double", "flattened": false},
  "SetActiveReceiptRuleSetRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false}
    },
    "flattened": false
  },
  "SetActiveReceiptRuleSetResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetIdentityDkimEnabledRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "DkimEnabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "SetIdentityDkimEnabledResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetIdentityFeedbackForwardingEnabledRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "ForwardingEnabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "SetIdentityFeedbackForwardingEnabledResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetIdentityHeadersInNotificationsEnabledRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "NotificationType": {"shape": "NotificationType", "flattened": false},
      "Enabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "SetIdentityHeadersInNotificationsEnabledResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetIdentityMailFromDomainRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "MailFromDomain": {"shape": "MailFromDomainName", "flattened": false},
      "BehaviorOnMXFailure": {
        "shape": "BehaviorOnMXFailure",
        "flattened": false
      }
    },
    "flattened": false
  },
  "SetIdentityMailFromDomainResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetIdentityNotificationTopicRequest": {
    "type": "structure",
    "members": {
      "Identity": {"shape": "Identity", "flattened": false},
      "NotificationType": {"shape": "NotificationType", "flattened": false},
      "SnsTopic": {"shape": "NotificationTopic", "flattened": false}
    },
    "flattened": false
  },
  "SetIdentityNotificationTopicResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "SetReceiptRulePositionRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "RuleName": {"shape": "ReceiptRuleName", "flattened": false},
      "After": {"shape": "ReceiptRuleName", "flattened": false}
    },
    "flattened": false
  },
  "SetReceiptRulePositionResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "StopAction": {
    "type": "structure",
    "members": {
      "Scope": {"shape": "StopScope", "flattened": false},
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  },
  "StopScope": {"type": "string", "flattened": false},
  "Subject": {"type": "string", "flattened": false},
  "SubjectPart": {"type": "string", "flattened": false},
  "SuccessRedirectionURL": {"type": "string", "flattened": false},
  "Template": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "SubjectPart": {"shape": "SubjectPart", "flattened": false},
      "TextPart": {"shape": "TextPart", "flattened": false},
      "HtmlPart": {"shape": "HtmlPart", "flattened": false}
    },
    "flattened": false
  },
  "TemplateContent": {"type": "string", "flattened": false},
  "TemplateData": {"type": "string", "flattened": false},
  "TemplateMetadata": {
    "type": "structure",
    "members": {
      "Name": {"shape": "TemplateName", "flattened": false},
      "CreatedTimestamp": {"shape": "Timestamp", "flattened": false}
    },
    "flattened": false
  },
  "TemplateMetadataList": {
    "type": "list",
    "member": {"shape": "TemplateMetadata"},
    "flattened": false
  },
  "TemplateName": {"type": "string", "flattened": false},
  "TestRenderTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "TemplateData": {"shape": "TemplateData", "flattened": false}
    },
    "flattened": false
  },
  "TestRenderTemplateResponse": {
    "type": "structure",
    "members": {
      "RenderedTemplate": {"shape": "RenderedTemplate", "flattened": false}
    },
    "flattened": false
  },
  "TextPart": {"type": "string", "flattened": false},
  "Timestamp": {"type": "timestamp", "flattened": false},
  "TlsPolicy": {"type": "string", "flattened": false},
  "TrackingOptions": {
    "type": "structure",
    "members": {
      "CustomRedirectDomain": {
        "shape": "CustomRedirectDomain",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateAccountSendingEnabledRequest": {
    "type": "structure",
    "members": {
      "Enabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationSetEventDestinationRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "EventDestination": {"shape": "EventDestination", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationSetEventDestinationResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "UpdateConfigurationSetReputationMetricsEnabledRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "Enabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationSetSendingEnabledRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "Enabled": {"shape": "Enabled", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationSetTrackingOptionsRequest": {
    "type": "structure",
    "members": {
      "ConfigurationSetName": {
        "shape": "ConfigurationSetName",
        "flattened": false
      },
      "TrackingOptions": {"shape": "TrackingOptions", "flattened": false}
    },
    "flattened": false
  },
  "UpdateConfigurationSetTrackingOptionsResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "UpdateCustomVerificationEmailTemplateRequest": {
    "type": "structure",
    "members": {
      "TemplateName": {"shape": "TemplateName", "flattened": false},
      "FromEmailAddress": {"shape": "FromAddress", "flattened": false},
      "TemplateSubject": {"shape": "Subject", "flattened": false},
      "TemplateContent": {"shape": "TemplateContent", "flattened": false},
      "SuccessRedirectionURL": {
        "shape": "SuccessRedirectionURL",
        "flattened": false
      },
      "FailureRedirectionURL": {
        "shape": "FailureRedirectionURL",
        "flattened": false
      }
    },
    "flattened": false
  },
  "UpdateReceiptRuleRequest": {
    "type": "structure",
    "members": {
      "RuleSetName": {"shape": "ReceiptRuleSetName", "flattened": false},
      "Rule": {"shape": "ReceiptRule", "flattened": false}
    },
    "flattened": false
  },
  "UpdateReceiptRuleResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "UpdateTemplateRequest": {
    "type": "structure",
    "members": {
      "Template": {"shape": "Template", "flattened": false}
    },
    "flattened": false
  },
  "UpdateTemplateResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "VerificationAttributes": {
    "type": "map",
    "key": {"shape": "Identity"},
    "value": {"shape": "IdentityVerificationAttributes"},
    "flattened": false
  },
  "VerificationStatus": {"type": "string", "flattened": false},
  "VerificationToken": {"type": "string", "flattened": false},
  "VerificationTokenList": {
    "type": "list",
    "member": {"shape": "VerificationToken"},
    "flattened": false
  },
  "VerifyDomainDkimRequest": {
    "type": "structure",
    "members": {
      "Domain": {"shape": "Domain", "flattened": false}
    },
    "flattened": false
  },
  "VerifyDomainDkimResponse": {
    "type": "structure",
    "members": {
      "DkimTokens": {"shape": "VerificationTokenList", "flattened": false}
    },
    "flattened": false
  },
  "VerifyDomainIdentityRequest": {
    "type": "structure",
    "members": {
      "Domain": {"shape": "Domain", "flattened": false}
    },
    "flattened": false
  },
  "VerifyDomainIdentityResponse": {
    "type": "structure",
    "members": {
      "VerificationToken": {"shape": "VerificationToken", "flattened": false}
    },
    "flattened": false
  },
  "VerifyEmailAddressRequest": {
    "type": "structure",
    "members": {
      "EmailAddress": {"shape": "Address", "flattened": false}
    },
    "flattened": false
  },
  "VerifyEmailIdentityRequest": {
    "type": "structure",
    "members": {
      "EmailAddress": {"shape": "Address", "flattened": false}
    },
    "flattened": false
  },
  "VerifyEmailIdentityResponse": {
    "type": "structure",
    "members": {},
    "flattened": false
  },
  "WorkmailAction": {
    "type": "structure",
    "members": {
      "TopicArn": {"shape": "AmazonResourceName", "flattened": false},
      "OrganizationArn": {"shape": "AmazonResourceName", "flattened": false}
    },
    "flattened": false
  }
};
