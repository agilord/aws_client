// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email-2010-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddHeaderActionToJson(AddHeaderAction instance) =>
    <String, dynamic>{
      'HeaderName': instance.headerName,
      'HeaderValue': instance.headerValue,
    };

Map<String, dynamic> _$BodyToJson(Body instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Html', instance.html?.toJson());
  writeNotNull('Text', instance.text?.toJson());
  return val;
}

Map<String, dynamic> _$BounceActionToJson(BounceAction instance) {
  final val = <String, dynamic>{
    'Message': instance.message,
    'Sender': instance.sender,
    'SmtpReplyCode': instance.smtpReplyCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatusCode', instance.statusCode);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

Map<String, dynamic> _$BouncedRecipientInfoToJson(
    BouncedRecipientInfo instance) {
  final val = <String, dynamic>{
    'Recipient': instance.recipient,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BounceType', _$BounceTypeEnumMap[instance.bounceType]);
  writeNotNull('RecipientArn', instance.recipientArn);
  writeNotNull('RecipientDsnFields', instance.recipientDsnFields?.toJson());
  return val;
}

const _$BounceTypeEnumMap = {
  BounceType.doesNotExist: 'DoesNotExist',
  BounceType.messageTooLarge: 'MessageTooLarge',
  BounceType.exceededQuota: 'ExceededQuota',
  BounceType.contentRejected: 'ContentRejected',
  BounceType.undefined: 'Undefined',
  BounceType.temporaryFailure: 'TemporaryFailure',
};

Map<String, dynamic> _$BulkEmailDestinationToJson(
    BulkEmailDestination instance) {
  final val = <String, dynamic>{
    'Destination': instance.destination.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReplacementTags',
      instance.replacementTags?.map((e) => e.toJson()).toList());
  writeNotNull('ReplacementTemplateData', instance.replacementTemplateData);
  return val;
}

Map<String, dynamic> _$CloudWatchDestinationToJson(
        CloudWatchDestination instance) =>
    <String, dynamic>{
      'DimensionConfigurations':
          instance.dimensionConfigurations.map((e) => e.toJson()).toList(),
    };

Map<String, dynamic> _$CloudWatchDimensionConfigurationToJson(
        CloudWatchDimensionConfiguration instance) =>
    <String, dynamic>{
      'DefaultDimensionValue': instance.defaultDimensionValue,
      'DimensionName': instance.dimensionName,
      'DimensionValueSource':
          _$DimensionValueSourceEnumMap[instance.dimensionValueSource],
    };

const _$DimensionValueSourceEnumMap = {
  DimensionValueSource.messageTag: 'messageTag',
  DimensionValueSource.emailHeader: 'emailHeader',
  DimensionValueSource.linkTag: 'linkTag',
};

Map<String, dynamic> _$ConfigurationSetToJson(ConfigurationSet instance) =>
    <String, dynamic>{
      'Name': instance.name,
    };

Map<String, dynamic> _$ContentToJson(Content instance) {
  final val = <String, dynamic>{
    'Data': instance.data,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Charset', instance.charset);
  return val;
}

Map<String, dynamic> _$DeliveryOptionsToJson(DeliveryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TlsPolicy', _$TlsPolicyEnumMap[instance.tlsPolicy]);
  return val;
}

const _$TlsPolicyEnumMap = {
  TlsPolicy.require: 'Require',
  TlsPolicy.optional: 'Optional',
};

Map<String, dynamic> _$DestinationToJson(Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BccAddresses', instance.bccAddresses);
  writeNotNull('CcAddresses', instance.ccAddresses);
  writeNotNull('ToAddresses', instance.toAddresses);
  return val;
}

Map<String, dynamic> _$EventDestinationToJson(EventDestination instance) {
  final val = <String, dynamic>{
    'MatchingEventTypes':
        instance.matchingEventTypes.map((e) => _$EventTypeEnumMap[e]).toList(),
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CloudWatchDestination', instance.cloudWatchDestination?.toJson());
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KinesisFirehoseDestination',
      instance.kinesisFirehoseDestination?.toJson());
  writeNotNull('SNSDestination', instance.sNSDestination?.toJson());
  return val;
}

const _$EventTypeEnumMap = {
  EventType.send: 'send',
  EventType.reject: 'reject',
  EventType.bounce: 'bounce',
  EventType.complaint: 'complaint',
  EventType.delivery: 'delivery',
  EventType.open: 'open',
  EventType.click: 'click',
  EventType.renderingFailure: 'renderingFailure',
};

Map<String, dynamic> _$ExtensionFieldToJson(ExtensionField instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
    };

Map<String, dynamic> _$KinesisFirehoseDestinationToJson(
        KinesisFirehoseDestination instance) =>
    <String, dynamic>{
      'DeliveryStreamARN': instance.deliveryStreamARN,
      'IAMRoleARN': instance.iAMRoleARN,
    };

Map<String, dynamic> _$LambdaActionToJson(LambdaAction instance) {
  final val = <String, dynamic>{
    'FunctionArn': instance.functionArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InvocationType', _$InvocationTypeEnumMap[instance.invocationType]);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

const _$InvocationTypeEnumMap = {
  InvocationType.event: 'Event',
  InvocationType.requestResponse: 'RequestResponse',
};

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'Body': instance.body.toJson(),
      'Subject': instance.subject.toJson(),
    };

Map<String, dynamic> _$MessageDsnToJson(MessageDsn instance) {
  final val = <String, dynamic>{
    'ReportingMta': instance.reportingMta,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ArrivalDate', const IsoDateTimeConverter().toJson(instance.arrivalDate));
  writeNotNull('ExtensionFields',
      instance.extensionFields?.map((e) => e.toJson()).toList());
  return val;
}

Map<String, dynamic> _$MessageTagToJson(MessageTag instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
    };

Map<String, dynamic> _$RawMessageToJson(RawMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', const Uint8ListConverter().toJson(instance.data));
  return val;
}

Map<String, dynamic> _$ReceiptActionToJson(ReceiptAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddHeaderAction', instance.addHeaderAction?.toJson());
  writeNotNull('BounceAction', instance.bounceAction?.toJson());
  writeNotNull('LambdaAction', instance.lambdaAction?.toJson());
  writeNotNull('S3Action', instance.s3Action?.toJson());
  writeNotNull('SNSAction', instance.sNSAction?.toJson());
  writeNotNull('StopAction', instance.stopAction?.toJson());
  writeNotNull('WorkmailAction', instance.workmailAction?.toJson());
  return val;
}

Map<String, dynamic> _$ReceiptFilterToJson(ReceiptFilter instance) =>
    <String, dynamic>{
      'IpFilter': instance.ipFilter.toJson(),
      'Name': instance.name,
    };

Map<String, dynamic> _$ReceiptIpFilterToJson(ReceiptIpFilter instance) =>
    <String, dynamic>{
      'Cidr': instance.cidr,
      'Policy': _$ReceiptFilterPolicyEnumMap[instance.policy],
    };

const _$ReceiptFilterPolicyEnumMap = {
  ReceiptFilterPolicy.block: 'Block',
  ReceiptFilterPolicy.allow: 'Allow',
};

Map<String, dynamic> _$ReceiptRuleToJson(ReceiptRule instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions?.map((e) => e.toJson()).toList());
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('Recipients', instance.recipients);
  writeNotNull('ScanEnabled', instance.scanEnabled);
  writeNotNull('TlsPolicy', _$TlsPolicyEnumMap[instance.tlsPolicy]);
  return val;
}

Map<String, dynamic> _$RecipientDsnFieldsToJson(RecipientDsnFields instance) {
  final val = <String, dynamic>{
    'Action': _$DsnActionEnumMap[instance.action],
    'Status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiagnosticCode', instance.diagnosticCode);
  writeNotNull('ExtensionFields',
      instance.extensionFields?.map((e) => e.toJson()).toList());
  writeNotNull('FinalRecipient', instance.finalRecipient);
  writeNotNull('LastAttemptDate',
      const IsoDateTimeConverter().toJson(instance.lastAttemptDate));
  writeNotNull('RemoteMta', instance.remoteMta);
  return val;
}

const _$DsnActionEnumMap = {
  DsnAction.failed: 'failed',
  DsnAction.delayed: 'delayed',
  DsnAction.delivered: 'delivered',
  DsnAction.relayed: 'relayed',
  DsnAction.expanded: 'expanded',
};

Map<String, dynamic> _$S3ActionToJson(S3Action instance) {
  final val = <String, dynamic>{
    'BucketName': instance.bucketName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  writeNotNull('ObjectKeyPrefix', instance.objectKeyPrefix);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

Map<String, dynamic> _$SNSActionToJson(SNSAction instance) {
  final val = <String, dynamic>{
    'TopicArn': instance.topicArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Encoding', _$SNSActionEncodingEnumMap[instance.encoding]);
  return val;
}

const _$SNSActionEncodingEnumMap = {
  SNSActionEncoding.utf_8: 'UTF-8',
  SNSActionEncoding.base64: 'Base64',
};

Map<String, dynamic> _$SNSDestinationToJson(SNSDestination instance) =>
    <String, dynamic>{
      'TopicARN': instance.topicARN,
    };

Map<String, dynamic> _$StopActionToJson(StopAction instance) {
  final val = <String, dynamic>{
    'Scope': _$StopScopeEnumMap[instance.scope],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

const _$StopScopeEnumMap = {
  StopScope.ruleSet: 'RuleSet',
};

Map<String, dynamic> _$TemplateToJson(Template instance) {
  final val = <String, dynamic>{
    'TemplateName': instance.templateName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HtmlPart', instance.htmlPart);
  writeNotNull('SubjectPart', instance.subjectPart);
  writeNotNull('TextPart', instance.textPart);
  return val;
}

Map<String, dynamic> _$TrackingOptionsToJson(TrackingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomRedirectDomain', instance.customRedirectDomain);
  return val;
}

Map<String, dynamic> _$WorkmailActionToJson(WorkmailAction instance) {
  final val = <String, dynamic>{
    'OrganizationArn': instance.organizationArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  return val;
}
