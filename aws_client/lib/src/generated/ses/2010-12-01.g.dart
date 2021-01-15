// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2010-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddHeaderActionToJson(AddHeaderAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HeaderName', instance.headerName);
  writeNotNull('HeaderValue', instance.headerValue);
  return val;
}

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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Message', instance.message);
  writeNotNull('Sender', instance.sender);
  writeNotNull('SmtpReplyCode', instance.smtpReplyCode);
  writeNotNull('StatusCode', instance.statusCode);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

Map<String, dynamic> _$BouncedRecipientInfoToJson(
    BouncedRecipientInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Recipient', instance.recipient);
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination?.toJson());
  writeNotNull('ReplacementTags',
      instance.replacementTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('ReplacementTemplateData', instance.replacementTemplateData);
  return val;
}

Map<String, dynamic> _$CloudWatchDestinationToJson(
    CloudWatchDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DimensionConfigurations',
      instance.dimensionConfigurations?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$CloudWatchDimensionConfigurationToJson(
    CloudWatchDimensionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultDimensionValue', instance.defaultDimensionValue);
  writeNotNull('DimensionName', instance.dimensionName);
  writeNotNull('DimensionValueSource',
      _$DimensionValueSourceEnumMap[instance.dimensionValueSource]);
  return val;
}

const _$DimensionValueSourceEnumMap = {
  DimensionValueSource.messageTag: 'messageTag',
  DimensionValueSource.emailHeader: 'emailHeader',
  DimensionValueSource.linkTag: 'linkTag',
};

Map<String, dynamic> _$ConfigurationSetToJson(ConfigurationSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$ContentToJson(Content instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', instance.data);
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MatchingEventTypes',
      instance.matchingEventTypes?.map((e) => _$EventTypeEnumMap[e])?.toList());
  writeNotNull('Name', instance.name);
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

Map<String, dynamic> _$ExtensionFieldToJson(ExtensionField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$KinesisFirehoseDestinationToJson(
    KinesisFirehoseDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryStreamARN', instance.deliveryStreamARN);
  writeNotNull('IAMRoleARN', instance.iAMRoleARN);
  return val;
}

Map<String, dynamic> _$LambdaActionToJson(LambdaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FunctionArn', instance.functionArn);
  writeNotNull(
      'InvocationType', _$InvocationTypeEnumMap[instance.invocationType]);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

const _$InvocationTypeEnumMap = {
  InvocationType.event: 'Event',
  InvocationType.requestResponse: 'RequestResponse',
};

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body?.toJson());
  writeNotNull('Subject', instance.subject?.toJson());
  return val;
}

Map<String, dynamic> _$MessageDsnToJson(MessageDsn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReportingMta', instance.reportingMta);
  writeNotNull(
      'ArrivalDate', const IsoDateTimeConverter().toJson(instance.arrivalDate));
  writeNotNull('ExtensionFields',
      instance.extensionFields?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$MessageTagToJson(MessageTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

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

Map<String, dynamic> _$ReceiptFilterToJson(ReceiptFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IpFilter', instance.ipFilter?.toJson());
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$ReceiptIpFilterToJson(ReceiptIpFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  writeNotNull('Policy', _$ReceiptFilterPolicyEnumMap[instance.policy]);
  return val;
}

const _$ReceiptFilterPolicyEnumMap = {
  ReceiptFilterPolicy.block: 'Block',
  ReceiptFilterPolicy.allow: 'Allow',
};

Map<String, dynamic> _$ReceiptRuleToJson(ReceiptRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Actions', instance.actions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('Recipients', instance.recipients);
  writeNotNull('ScanEnabled', instance.scanEnabled);
  writeNotNull('TlsPolicy', _$TlsPolicyEnumMap[instance.tlsPolicy]);
  return val;
}

Map<String, dynamic> _$RecipientDsnFieldsToJson(RecipientDsnFields instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$DsnActionEnumMap[instance.action]);
  writeNotNull('Status', instance.status);
  writeNotNull('DiagnosticCode', instance.diagnosticCode);
  writeNotNull('ExtensionFields',
      instance.extensionFields?.map((e) => e?.toJson())?.toList());
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  writeNotNull('ObjectKeyPrefix', instance.objectKeyPrefix);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

Map<String, dynamic> _$SNSActionToJson(SNSAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  writeNotNull('Encoding', _$SNSActionEncodingEnumMap[instance.encoding]);
  return val;
}

const _$SNSActionEncodingEnumMap = {
  SNSActionEncoding.utf_8: 'UTF-8',
  SNSActionEncoding.base64: 'Base64',
};

Map<String, dynamic> _$SNSDestinationToJson(SNSDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicARN', instance.topicARN);
  return val;
}

Map<String, dynamic> _$StopActionToJson(StopAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$StopScopeEnumMap[instance.scope]);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

const _$StopScopeEnumMap = {
  StopScope.ruleSet: 'RuleSet',
};

Map<String, dynamic> _$TemplateToJson(Template instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TemplateName', instance.templateName);
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationArn', instance.organizationArn);
  writeNotNull('TopicArn', instance.topicArn);
  return val;
}
