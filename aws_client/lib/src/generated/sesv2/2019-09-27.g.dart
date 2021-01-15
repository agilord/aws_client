// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-09-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) {
  return AccountDetails(
    additionalContactEmailAddresses:
        (json['AdditionalContactEmailAddresses'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    contactLanguage:
        _$enumDecodeNullable(_$ContactLanguageEnumMap, json['ContactLanguage']),
    mailType: _$enumDecodeNullable(_$MailTypeEnumMap, json['MailType']),
    reviewDetails: json['ReviewDetails'] == null
        ? null
        : ReviewDetails.fromJson(json['ReviewDetails'] as Map<String, dynamic>),
    useCaseDescription: json['UseCaseDescription'] as String,
    websiteURL: json['WebsiteURL'] as String,
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ContactLanguageEnumMap = {
  ContactLanguage.en: 'EN',
  ContactLanguage.ja: 'JA',
};

const _$MailTypeEnumMap = {
  MailType.marketing: 'MARKETING',
  MailType.transactional: 'TRANSACTIONAL',
};

BlacklistEntry _$BlacklistEntryFromJson(Map<String, dynamic> json) {
  return BlacklistEntry(
    description: json['Description'] as String,
    listingTime: const UnixDateTimeConverter().fromJson(json['ListingTime']),
    rblName: json['RblName'] as String,
  );
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

Map<String, dynamic> _$BulkEmailContentToJson(BulkEmailContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Template', instance.template?.toJson());
  return val;
}

Map<String, dynamic> _$BulkEmailEntryToJson(BulkEmailEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination?.toJson());
  writeNotNull(
      'ReplacementEmailContent', instance.replacementEmailContent?.toJson());
  writeNotNull('ReplacementTags',
      instance.replacementTags?.map((e) => e?.toJson())?.toList());
  return val;
}

BulkEmailEntryResult _$BulkEmailEntryResultFromJson(Map<String, dynamic> json) {
  return BulkEmailEntryResult(
    error: json['Error'] as String,
    messageId: json['MessageId'] as String,
    status: _$enumDecodeNullable(_$BulkEmailStatusEnumMap, json['Status']),
  );
}

const _$BulkEmailStatusEnumMap = {
  BulkEmailStatus.success: 'SUCCESS',
  BulkEmailStatus.messageRejected: 'MESSAGE_REJECTED',
  BulkEmailStatus.mailFromDomainNotVerified: 'MAIL_FROM_DOMAIN_NOT_VERIFIED',
  BulkEmailStatus.configurationSetNotFound: 'CONFIGURATION_SET_NOT_FOUND',
  BulkEmailStatus.templateNotFound: 'TEMPLATE_NOT_FOUND',
  BulkEmailStatus.accountSuspended: 'ACCOUNT_SUSPENDED',
  BulkEmailStatus.accountThrottled: 'ACCOUNT_THROTTLED',
  BulkEmailStatus.accountDailyQuotaExceeded: 'ACCOUNT_DAILY_QUOTA_EXCEEDED',
  BulkEmailStatus.invalidSendingPoolName: 'INVALID_SENDING_POOL_NAME',
  BulkEmailStatus.accountSendingPaused: 'ACCOUNT_SENDING_PAUSED',
  BulkEmailStatus.configurationSetSendingPaused:
      'CONFIGURATION_SET_SENDING_PAUSED',
  BulkEmailStatus.invalidParameter: 'INVALID_PARAMETER',
  BulkEmailStatus.transientFailure: 'TRANSIENT_FAILURE',
  BulkEmailStatus.failed: 'FAILED',
};

CloudWatchDestination _$CloudWatchDestinationFromJson(
    Map<String, dynamic> json) {
  return CloudWatchDestination(
    dimensionConfigurations: (json['DimensionConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : CloudWatchDimensionConfiguration.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
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

CloudWatchDimensionConfiguration _$CloudWatchDimensionConfigurationFromJson(
    Map<String, dynamic> json) {
  return CloudWatchDimensionConfiguration(
    defaultDimensionValue: json['DefaultDimensionValue'] as String,
    dimensionName: json['DimensionName'] as String,
    dimensionValueSource: _$enumDecodeNullable(
        _$DimensionValueSourceEnumMap, json['DimensionValueSource']),
  );
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
  DimensionValueSource.messageTag: 'MESSAGE_TAG',
  DimensionValueSource.emailHeader: 'EMAIL_HEADER',
  DimensionValueSource.linkTag: 'LINK_TAG',
};

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    emailAddress: json['EmailAddress'] as String,
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    topicDefaultPreferences: (json['TopicDefaultPreferences'] as List)
        ?.map((e) => e == null
            ? null
            : TopicPreference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topicPreferences: (json['TopicPreferences'] as List)
        ?.map((e) => e == null
            ? null
            : TopicPreference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unsubscribeAll: json['UnsubscribeAll'] as bool,
  );
}

ContactList _$ContactListFromJson(Map<String, dynamic> json) {
  return ContactList(
    contactListName: json['ContactListName'] as String,
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
  );
}

ContactListDestination _$ContactListDestinationFromJson(
    Map<String, dynamic> json) {
  return ContactListDestination(
    contactListImportAction: _$enumDecodeNullable(
        _$ContactListImportActionEnumMap, json['ContactListImportAction']),
    contactListName: json['ContactListName'] as String,
  );
}

Map<String, dynamic> _$ContactListDestinationToJson(
    ContactListDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContactListImportAction',
      _$ContactListImportActionEnumMap[instance.contactListImportAction]);
  writeNotNull('ContactListName', instance.contactListName);
  return val;
}

const _$ContactListImportActionEnumMap = {
  ContactListImportAction.delete: 'DELETE',
  ContactListImportAction.put: 'PUT',
};

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

CreateConfigurationSetEventDestinationResponse
    _$CreateConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateConfigurationSetEventDestinationResponse();
}

CreateConfigurationSetResponse _$CreateConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationSetResponse();
}

CreateContactListResponse _$CreateContactListResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContactListResponse();
}

CreateContactResponse _$CreateContactResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContactResponse();
}

CreateCustomVerificationEmailTemplateResponse
    _$CreateCustomVerificationEmailTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return CreateCustomVerificationEmailTemplateResponse();
}

CreateDedicatedIpPoolResponse _$CreateDedicatedIpPoolResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDedicatedIpPoolResponse();
}

CreateDeliverabilityTestReportResponse
    _$CreateDeliverabilityTestReportResponseFromJson(
        Map<String, dynamic> json) {
  return CreateDeliverabilityTestReportResponse(
    deliverabilityTestStatus: _$enumDecodeNullable(
        _$DeliverabilityTestStatusEnumMap, json['DeliverabilityTestStatus']),
    reportId: json['ReportId'] as String,
  );
}

const _$DeliverabilityTestStatusEnumMap = {
  DeliverabilityTestStatus.inProgress: 'IN_PROGRESS',
  DeliverabilityTestStatus.completed: 'COMPLETED',
};

CreateEmailIdentityPolicyResponse _$CreateEmailIdentityPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEmailIdentityPolicyResponse();
}

CreateEmailIdentityResponse _$CreateEmailIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEmailIdentityResponse(
    dkimAttributes: json['DkimAttributes'] == null
        ? null
        : DkimAttributes.fromJson(
            json['DkimAttributes'] as Map<String, dynamic>),
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    verifiedForSendingStatus: json['VerifiedForSendingStatus'] as bool,
  );
}

const _$IdentityTypeEnumMap = {
  IdentityType.emailAddress: 'EMAIL_ADDRESS',
  IdentityType.domain: 'DOMAIN',
  IdentityType.managedDomain: 'MANAGED_DOMAIN',
};

CreateEmailTemplateResponse _$CreateEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEmailTemplateResponse();
}

CreateImportJobResponse _$CreateImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateImportJobResponse(
    jobId: json['JobId'] as String,
  );
}

CustomVerificationEmailTemplateMetadata
    _$CustomVerificationEmailTemplateMetadataFromJson(
        Map<String, dynamic> json) {
  return CustomVerificationEmailTemplateMetadata(
    failureRedirectionURL: json['FailureRedirectionURL'] as String,
    fromEmailAddress: json['FromEmailAddress'] as String,
    successRedirectionURL: json['SuccessRedirectionURL'] as String,
    templateName: json['TemplateName'] as String,
    templateSubject: json['TemplateSubject'] as String,
  );
}

DailyVolume _$DailyVolumeFromJson(Map<String, dynamic> json) {
  return DailyVolume(
    domainIspPlacements: (json['DomainIspPlacements'] as List)
        ?.map((e) => e == null
            ? null
            : DomainIspPlacement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startDate: const UnixDateTimeConverter().fromJson(json['StartDate']),
    volumeStatistics: json['VolumeStatistics'] == null
        ? null
        : VolumeStatistics.fromJson(
            json['VolumeStatistics'] as Map<String, dynamic>),
  );
}

DedicatedIp _$DedicatedIpFromJson(Map<String, dynamic> json) {
  return DedicatedIp(
    ip: json['Ip'] as String,
    warmupPercentage: json['WarmupPercentage'] as int,
    warmupStatus:
        _$enumDecodeNullable(_$WarmupStatusEnumMap, json['WarmupStatus']),
    poolName: json['PoolName'] as String,
  );
}

const _$WarmupStatusEnumMap = {
  WarmupStatus.inProgress: 'IN_PROGRESS',
  WarmupStatus.done: 'DONE',
};

DeleteConfigurationSetEventDestinationResponse
    _$DeleteConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteConfigurationSetEventDestinationResponse();
}

DeleteConfigurationSetResponse _$DeleteConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConfigurationSetResponse();
}

DeleteContactListResponse _$DeleteContactListResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteContactListResponse();
}

DeleteContactResponse _$DeleteContactResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteContactResponse();
}

DeleteCustomVerificationEmailTemplateResponse
    _$DeleteCustomVerificationEmailTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteCustomVerificationEmailTemplateResponse();
}

DeleteDedicatedIpPoolResponse _$DeleteDedicatedIpPoolResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDedicatedIpPoolResponse();
}

DeleteEmailIdentityPolicyResponse _$DeleteEmailIdentityPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailIdentityPolicyResponse();
}

DeleteEmailIdentityResponse _$DeleteEmailIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailIdentityResponse();
}

DeleteEmailTemplateResponse _$DeleteEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailTemplateResponse();
}

DeleteSuppressedDestinationResponse
    _$DeleteSuppressedDestinationResponseFromJson(Map<String, dynamic> json) {
  return DeleteSuppressedDestinationResponse();
}

DeliverabilityTestReport _$DeliverabilityTestReportFromJson(
    Map<String, dynamic> json) {
  return DeliverabilityTestReport(
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    deliverabilityTestStatus: _$enumDecodeNullable(
        _$DeliverabilityTestStatusEnumMap, json['DeliverabilityTestStatus']),
    fromEmailAddress: json['FromEmailAddress'] as String,
    reportId: json['ReportId'] as String,
    reportName: json['ReportName'] as String,
    subject: json['Subject'] as String,
  );
}

DeliveryOptions _$DeliveryOptionsFromJson(Map<String, dynamic> json) {
  return DeliveryOptions(
    sendingPoolName: json['SendingPoolName'] as String,
    tlsPolicy: _$enumDecodeNullable(_$TlsPolicyEnumMap, json['TlsPolicy']),
  );
}

Map<String, dynamic> _$DeliveryOptionsToJson(DeliveryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SendingPoolName', instance.sendingPoolName);
  writeNotNull('TlsPolicy', _$TlsPolicyEnumMap[instance.tlsPolicy]);
  return val;
}

const _$TlsPolicyEnumMap = {
  TlsPolicy.require: 'REQUIRE',
  TlsPolicy.optional: 'OPTIONAL',
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

DkimAttributes _$DkimAttributesFromJson(Map<String, dynamic> json) {
  return DkimAttributes(
    signingAttributesOrigin: _$enumDecodeNullable(
        _$DkimSigningAttributesOriginEnumMap, json['SigningAttributesOrigin']),
    signingEnabled: json['SigningEnabled'] as bool,
    status: _$enumDecodeNullable(_$DkimStatusEnumMap, json['Status']),
    tokens: (json['Tokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$DkimSigningAttributesOriginEnumMap = {
  DkimSigningAttributesOrigin.awsSes: 'AWS_SES',
  DkimSigningAttributesOrigin.external: 'EXTERNAL',
};

const _$DkimStatusEnumMap = {
  DkimStatus.pending: 'PENDING',
  DkimStatus.success: 'SUCCESS',
  DkimStatus.failed: 'FAILED',
  DkimStatus.temporaryFailure: 'TEMPORARY_FAILURE',
  DkimStatus.notStarted: 'NOT_STARTED',
};

Map<String, dynamic> _$DkimSigningAttributesToJson(
    DkimSigningAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainSigningPrivateKey', instance.domainSigningPrivateKey);
  writeNotNull('DomainSigningSelector', instance.domainSigningSelector);
  return val;
}

DomainDeliverabilityCampaign _$DomainDeliverabilityCampaignFromJson(
    Map<String, dynamic> json) {
  return DomainDeliverabilityCampaign(
    campaignId: json['CampaignId'] as String,
    deleteRate: (json['DeleteRate'] as num)?.toDouble(),
    esps: (json['Esps'] as List)?.map((e) => e as String)?.toList(),
    firstSeenDateTime:
        const UnixDateTimeConverter().fromJson(json['FirstSeenDateTime']),
    fromAddress: json['FromAddress'] as String,
    imageUrl: json['ImageUrl'] as String,
    inboxCount: json['InboxCount'] as int,
    lastSeenDateTime:
        const UnixDateTimeConverter().fromJson(json['LastSeenDateTime']),
    projectedVolume: json['ProjectedVolume'] as int,
    readDeleteRate: (json['ReadDeleteRate'] as num)?.toDouble(),
    readRate: (json['ReadRate'] as num)?.toDouble(),
    sendingIps: (json['SendingIps'] as List)?.map((e) => e as String)?.toList(),
    spamCount: json['SpamCount'] as int,
    subject: json['Subject'] as String,
  );
}

DomainDeliverabilityTrackingOption _$DomainDeliverabilityTrackingOptionFromJson(
    Map<String, dynamic> json) {
  return DomainDeliverabilityTrackingOption(
    domain: json['Domain'] as String,
    inboxPlacementTrackingOption: json['InboxPlacementTrackingOption'] == null
        ? null
        : InboxPlacementTrackingOption.fromJson(
            json['InboxPlacementTrackingOption'] as Map<String, dynamic>),
    subscriptionStartDate:
        const UnixDateTimeConverter().fromJson(json['SubscriptionStartDate']),
  );
}

Map<String, dynamic> _$DomainDeliverabilityTrackingOptionToJson(
    DomainDeliverabilityTrackingOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Domain', instance.domain);
  writeNotNull('InboxPlacementTrackingOption',
      instance.inboxPlacementTrackingOption?.toJson());
  writeNotNull('SubscriptionStartDate',
      const UnixDateTimeConverter().toJson(instance.subscriptionStartDate));
  return val;
}

DomainIspPlacement _$DomainIspPlacementFromJson(Map<String, dynamic> json) {
  return DomainIspPlacement(
    inboxPercentage: (json['InboxPercentage'] as num)?.toDouble(),
    inboxRawCount: json['InboxRawCount'] as int,
    ispName: json['IspName'] as String,
    spamPercentage: (json['SpamPercentage'] as num)?.toDouble(),
    spamRawCount: json['SpamRawCount'] as int,
  );
}

Map<String, dynamic> _$EmailContentToJson(EmailContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Raw', instance.raw?.toJson());
  writeNotNull('Simple', instance.simple?.toJson());
  writeNotNull('Template', instance.template?.toJson());
  return val;
}

EmailTemplateContent _$EmailTemplateContentFromJson(Map<String, dynamic> json) {
  return EmailTemplateContent(
    html: json['Html'] as String,
    subject: json['Subject'] as String,
    text: json['Text'] as String,
  );
}

Map<String, dynamic> _$EmailTemplateContentToJson(
    EmailTemplateContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Html', instance.html);
  writeNotNull('Subject', instance.subject);
  writeNotNull('Text', instance.text);
  return val;
}

EmailTemplateMetadata _$EmailTemplateMetadataFromJson(
    Map<String, dynamic> json) {
  return EmailTemplateMetadata(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    templateName: json['TemplateName'] as String,
  );
}

EventDestination _$EventDestinationFromJson(Map<String, dynamic> json) {
  return EventDestination(
    matchingEventTypes: (json['MatchingEventTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EventTypeEnumMap, e))
        ?.toList(),
    name: json['Name'] as String,
    cloudWatchDestination: json['CloudWatchDestination'] == null
        ? null
        : CloudWatchDestination.fromJson(
            json['CloudWatchDestination'] as Map<String, dynamic>),
    enabled: json['Enabled'] as bool,
    kinesisFirehoseDestination: json['KinesisFirehoseDestination'] == null
        ? null
        : KinesisFirehoseDestination.fromJson(
            json['KinesisFirehoseDestination'] as Map<String, dynamic>),
    pinpointDestination: json['PinpointDestination'] == null
        ? null
        : PinpointDestination.fromJson(
            json['PinpointDestination'] as Map<String, dynamic>),
    snsDestination: json['SnsDestination'] == null
        ? null
        : SnsDestination.fromJson(
            json['SnsDestination'] as Map<String, dynamic>),
  );
}

const _$EventTypeEnumMap = {
  EventType.send: 'SEND',
  EventType.reject: 'REJECT',
  EventType.bounce: 'BOUNCE',
  EventType.complaint: 'COMPLAINT',
  EventType.delivery: 'DELIVERY',
  EventType.open: 'OPEN',
  EventType.click: 'CLICK',
  EventType.renderingFailure: 'RENDERING_FAILURE',
  EventType.deliveryDelay: 'DELIVERY_DELAY',
  EventType.subscription: 'SUBSCRIPTION',
};

Map<String, dynamic> _$EventDestinationDefinitionToJson(
    EventDestinationDefinition instance) {
  final val = <String, dynamic>{};

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
  writeNotNull('MatchingEventTypes',
      instance.matchingEventTypes?.map((e) => _$EventTypeEnumMap[e])?.toList());
  writeNotNull('PinpointDestination', instance.pinpointDestination?.toJson());
  writeNotNull('SnsDestination', instance.snsDestination?.toJson());
  return val;
}

FailureInfo _$FailureInfoFromJson(Map<String, dynamic> json) {
  return FailureInfo(
    errorMessage: json['ErrorMessage'] as String,
    failedRecordsS3Url: json['FailedRecordsS3Url'] as String,
  );
}

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) {
  return GetAccountResponse(
    dedicatedIpAutoWarmupEnabled: json['DedicatedIpAutoWarmupEnabled'] as bool,
    details: json['Details'] == null
        ? null
        : AccountDetails.fromJson(json['Details'] as Map<String, dynamic>),
    enforcementStatus: json['EnforcementStatus'] as String,
    productionAccessEnabled: json['ProductionAccessEnabled'] as bool,
    sendQuota: json['SendQuota'] == null
        ? null
        : SendQuota.fromJson(json['SendQuota'] as Map<String, dynamic>),
    sendingEnabled: json['SendingEnabled'] as bool,
    suppressionAttributes: json['SuppressionAttributes'] == null
        ? null
        : SuppressionAttributes.fromJson(
            json['SuppressionAttributes'] as Map<String, dynamic>),
  );
}

GetBlacklistReportsResponse _$GetBlacklistReportsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBlacklistReportsResponse(
    blacklistReport: (json['BlacklistReport'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : BlacklistEntry.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

GetConfigurationSetEventDestinationsResponse
    _$GetConfigurationSetEventDestinationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetConfigurationSetEventDestinationsResponse(
    eventDestinations: (json['EventDestinations'] as List)
        ?.map((e) => e == null
            ? null
            : EventDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetConfigurationSetResponse _$GetConfigurationSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetConfigurationSetResponse(
    configurationSetName: json['ConfigurationSetName'] as String,
    deliveryOptions: json['DeliveryOptions'] == null
        ? null
        : DeliveryOptions.fromJson(
            json['DeliveryOptions'] as Map<String, dynamic>),
    reputationOptions: json['ReputationOptions'] == null
        ? null
        : ReputationOptions.fromJson(
            json['ReputationOptions'] as Map<String, dynamic>),
    sendingOptions: json['SendingOptions'] == null
        ? null
        : SendingOptions.fromJson(
            json['SendingOptions'] as Map<String, dynamic>),
    suppressionOptions: json['SuppressionOptions'] == null
        ? null
        : SuppressionOptions.fromJson(
            json['SuppressionOptions'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trackingOptions: json['TrackingOptions'] == null
        ? null
        : TrackingOptions.fromJson(
            json['TrackingOptions'] as Map<String, dynamic>),
  );
}

GetContactListResponse _$GetContactListResponseFromJson(
    Map<String, dynamic> json) {
  return GetContactListResponse(
    contactListName: json['ContactListName'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    description: json['Description'] as String,
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topics: (json['Topics'] as List)
        ?.map(
            (e) => e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetContactResponse _$GetContactResponseFromJson(Map<String, dynamic> json) {
  return GetContactResponse(
    attributesData: json['AttributesData'] as String,
    contactListName: json['ContactListName'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    emailAddress: json['EmailAddress'] as String,
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    topicDefaultPreferences: (json['TopicDefaultPreferences'] as List)
        ?.map((e) => e == null
            ? null
            : TopicPreference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topicPreferences: (json['TopicPreferences'] as List)
        ?.map((e) => e == null
            ? null
            : TopicPreference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unsubscribeAll: json['UnsubscribeAll'] as bool,
  );
}

GetCustomVerificationEmailTemplateResponse
    _$GetCustomVerificationEmailTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return GetCustomVerificationEmailTemplateResponse(
    failureRedirectionURL: json['FailureRedirectionURL'] as String,
    fromEmailAddress: json['FromEmailAddress'] as String,
    successRedirectionURL: json['SuccessRedirectionURL'] as String,
    templateContent: json['TemplateContent'] as String,
    templateName: json['TemplateName'] as String,
    templateSubject: json['TemplateSubject'] as String,
  );
}

GetDedicatedIpResponse _$GetDedicatedIpResponseFromJson(
    Map<String, dynamic> json) {
  return GetDedicatedIpResponse(
    dedicatedIp: json['DedicatedIp'] == null
        ? null
        : DedicatedIp.fromJson(json['DedicatedIp'] as Map<String, dynamic>),
  );
}

GetDedicatedIpsResponse _$GetDedicatedIpsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDedicatedIpsResponse(
    dedicatedIps: (json['DedicatedIps'] as List)
        ?.map((e) =>
            e == null ? null : DedicatedIp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDeliverabilityDashboardOptionsResponse
    _$GetDeliverabilityDashboardOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return GetDeliverabilityDashboardOptionsResponse(
    dashboardEnabled: json['DashboardEnabled'] as bool,
    accountStatus: _$enumDecodeNullable(
        _$DeliverabilityDashboardAccountStatusEnumMap, json['AccountStatus']),
    activeSubscribedDomains: (json['ActiveSubscribedDomains'] as List)
        ?.map((e) => e == null
            ? null
            : DomainDeliverabilityTrackingOption.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    pendingExpirationSubscribedDomains:
        (json['PendingExpirationSubscribedDomains'] as List)
            ?.map((e) => e == null
                ? null
                : DomainDeliverabilityTrackingOption.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    subscriptionExpiryDate:
        const UnixDateTimeConverter().fromJson(json['SubscriptionExpiryDate']),
  );
}

const _$DeliverabilityDashboardAccountStatusEnumMap = {
  DeliverabilityDashboardAccountStatus.active: 'ACTIVE',
  DeliverabilityDashboardAccountStatus.pendingExpiration: 'PENDING_EXPIRATION',
  DeliverabilityDashboardAccountStatus.disabled: 'DISABLED',
};

GetDeliverabilityTestReportResponse
    _$GetDeliverabilityTestReportResponseFromJson(Map<String, dynamic> json) {
  return GetDeliverabilityTestReportResponse(
    deliverabilityTestReport: json['DeliverabilityTestReport'] == null
        ? null
        : DeliverabilityTestReport.fromJson(
            json['DeliverabilityTestReport'] as Map<String, dynamic>),
    ispPlacements: (json['IspPlacements'] as List)
        ?.map((e) =>
            e == null ? null : IspPlacement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    overallPlacement: json['OverallPlacement'] == null
        ? null
        : PlacementStatistics.fromJson(
            json['OverallPlacement'] as Map<String, dynamic>),
    message: json['Message'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetDomainDeliverabilityCampaignResponse
    _$GetDomainDeliverabilityCampaignResponseFromJson(
        Map<String, dynamic> json) {
  return GetDomainDeliverabilityCampaignResponse(
    domainDeliverabilityCampaign: json['DomainDeliverabilityCampaign'] == null
        ? null
        : DomainDeliverabilityCampaign.fromJson(
            json['DomainDeliverabilityCampaign'] as Map<String, dynamic>),
  );
}

GetDomainStatisticsReportResponse _$GetDomainStatisticsReportResponseFromJson(
    Map<String, dynamic> json) {
  return GetDomainStatisticsReportResponse(
    dailyVolumes: (json['DailyVolumes'] as List)
        ?.map((e) =>
            e == null ? null : DailyVolume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    overallVolume: json['OverallVolume'] == null
        ? null
        : OverallVolume.fromJson(json['OverallVolume'] as Map<String, dynamic>),
  );
}

GetEmailIdentityPoliciesResponse _$GetEmailIdentityPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetEmailIdentityPoliciesResponse(
    policies: (json['Policies'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetEmailIdentityResponse _$GetEmailIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return GetEmailIdentityResponse(
    dkimAttributes: json['DkimAttributes'] == null
        ? null
        : DkimAttributes.fromJson(
            json['DkimAttributes'] as Map<String, dynamic>),
    feedbackForwardingStatus: json['FeedbackForwardingStatus'] as bool,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    mailFromAttributes: json['MailFromAttributes'] == null
        ? null
        : MailFromAttributes.fromJson(
            json['MailFromAttributes'] as Map<String, dynamic>),
    policies: (json['Policies'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    verifiedForSendingStatus: json['VerifiedForSendingStatus'] as bool,
  );
}

GetEmailTemplateResponse _$GetEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetEmailTemplateResponse(
    templateContent: json['TemplateContent'] == null
        ? null
        : EmailTemplateContent.fromJson(
            json['TemplateContent'] as Map<String, dynamic>),
    templateName: json['TemplateName'] as String,
  );
}

GetImportJobResponse _$GetImportJobResponseFromJson(Map<String, dynamic> json) {
  return GetImportJobResponse(
    completedTimestamp:
        const UnixDateTimeConverter().fromJson(json['CompletedTimestamp']),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    failedRecordsCount: json['FailedRecordsCount'] as int,
    failureInfo: json['FailureInfo'] == null
        ? null
        : FailureInfo.fromJson(json['FailureInfo'] as Map<String, dynamic>),
    importDataSource: json['ImportDataSource'] == null
        ? null
        : ImportDataSource.fromJson(
            json['ImportDataSource'] as Map<String, dynamic>),
    importDestination: json['ImportDestination'] == null
        ? null
        : ImportDestination.fromJson(
            json['ImportDestination'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    processedRecordsCount: json['ProcessedRecordsCount'] as int,
  );
}

const _$JobStatusEnumMap = {
  JobStatus.created: 'CREATED',
  JobStatus.processing: 'PROCESSING',
  JobStatus.completed: 'COMPLETED',
  JobStatus.failed: 'FAILED',
};

GetSuppressedDestinationResponse _$GetSuppressedDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return GetSuppressedDestinationResponse(
    suppressedDestination: json['SuppressedDestination'] == null
        ? null
        : SuppressedDestination.fromJson(
            json['SuppressedDestination'] as Map<String, dynamic>),
  );
}

IdentityInfo _$IdentityInfoFromJson(Map<String, dynamic> json) {
  return IdentityInfo(
    identityName: json['IdentityName'] as String,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    sendingEnabled: json['SendingEnabled'] as bool,
  );
}

ImportDataSource _$ImportDataSourceFromJson(Map<String, dynamic> json) {
  return ImportDataSource(
    dataFormat: _$enumDecodeNullable(_$DataFormatEnumMap, json['DataFormat']),
    s3Url: json['S3Url'] as String,
  );
}

Map<String, dynamic> _$ImportDataSourceToJson(ImportDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataFormat', _$DataFormatEnumMap[instance.dataFormat]);
  writeNotNull('S3Url', instance.s3Url);
  return val;
}

const _$DataFormatEnumMap = {
  DataFormat.csv: 'CSV',
  DataFormat.json: 'JSON',
};

ImportDestination _$ImportDestinationFromJson(Map<String, dynamic> json) {
  return ImportDestination(
    contactListDestination: json['ContactListDestination'] == null
        ? null
        : ContactListDestination.fromJson(
            json['ContactListDestination'] as Map<String, dynamic>),
    suppressionListDestination: json['SuppressionListDestination'] == null
        ? null
        : SuppressionListDestination.fromJson(
            json['SuppressionListDestination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImportDestinationToJson(ImportDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ContactListDestination', instance.contactListDestination?.toJson());
  writeNotNull('SuppressionListDestination',
      instance.suppressionListDestination?.toJson());
  return val;
}

ImportJobSummary _$ImportJobSummaryFromJson(Map<String, dynamic> json) {
  return ImportJobSummary(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    importDestination: json['ImportDestination'] == null
        ? null
        : ImportDestination.fromJson(
            json['ImportDestination'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

InboxPlacementTrackingOption _$InboxPlacementTrackingOptionFromJson(
    Map<String, dynamic> json) {
  return InboxPlacementTrackingOption(
    global: json['Global'] as bool,
    trackedIsps:
        (json['TrackedIsps'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$InboxPlacementTrackingOptionToJson(
    InboxPlacementTrackingOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Global', instance.global);
  writeNotNull('TrackedIsps', instance.trackedIsps);
  return val;
}

IspPlacement _$IspPlacementFromJson(Map<String, dynamic> json) {
  return IspPlacement(
    ispName: json['IspName'] as String,
    placementStatistics: json['PlacementStatistics'] == null
        ? null
        : PlacementStatistics.fromJson(
            json['PlacementStatistics'] as Map<String, dynamic>),
  );
}

KinesisFirehoseDestination _$KinesisFirehoseDestinationFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseDestination(
    deliveryStreamArn: json['DeliveryStreamArn'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
  );
}

Map<String, dynamic> _$KinesisFirehoseDestinationToJson(
    KinesisFirehoseDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryStreamArn', instance.deliveryStreamArn);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  return val;
}

ListConfigurationSetsResponse _$ListConfigurationSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationSetsResponse(
    configurationSets:
        (json['ConfigurationSets'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListContactListsResponse _$ListContactListsResponseFromJson(
    Map<String, dynamic> json) {
  return ListContactListsResponse(
    contactLists: (json['ContactLists'] as List)
        ?.map((e) =>
            e == null ? null : ContactList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListContactsFilterToJson(ListContactsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FilteredStatus', _$SubscriptionStatusEnumMap[instance.filteredStatus]);
  writeNotNull('TopicFilter', instance.topicFilter?.toJson());
  return val;
}

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.optIn: 'OPT_IN',
  SubscriptionStatus.optOut: 'OPT_OUT',
};

ListContactsResponse _$ListContactsResponseFromJson(Map<String, dynamic> json) {
  return ListContactsResponse(
    contacts: (json['Contacts'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCustomVerificationEmailTemplatesResponse
    _$ListCustomVerificationEmailTemplatesResponseFromJson(
        Map<String, dynamic> json) {
  return ListCustomVerificationEmailTemplatesResponse(
    customVerificationEmailTemplates:
        (json['CustomVerificationEmailTemplates'] as List)
            ?.map((e) => e == null
                ? null
                : CustomVerificationEmailTemplateMetadata.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDedicatedIpPoolsResponse _$ListDedicatedIpPoolsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDedicatedIpPoolsResponse(
    dedicatedIpPools:
        (json['DedicatedIpPools'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDeliverabilityTestReportsResponse
    _$ListDeliverabilityTestReportsResponseFromJson(Map<String, dynamic> json) {
  return ListDeliverabilityTestReportsResponse(
    deliverabilityTestReports: (json['DeliverabilityTestReports'] as List)
        ?.map((e) => e == null
            ? null
            : DeliverabilityTestReport.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDomainDeliverabilityCampaignsResponse
    _$ListDomainDeliverabilityCampaignsResponseFromJson(
        Map<String, dynamic> json) {
  return ListDomainDeliverabilityCampaignsResponse(
    domainDeliverabilityCampaigns: (json['DomainDeliverabilityCampaigns']
            as List)
        ?.map((e) => e == null
            ? null
            : DomainDeliverabilityCampaign.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEmailIdentitiesResponse _$ListEmailIdentitiesResponseFromJson(
    Map<String, dynamic> json) {
  return ListEmailIdentitiesResponse(
    emailIdentities: (json['EmailIdentities'] as List)
        ?.map((e) =>
            e == null ? null : IdentityInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEmailTemplatesResponse _$ListEmailTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListEmailTemplatesResponse(
    nextToken: json['NextToken'] as String,
    templatesMetadata: (json['TemplatesMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : EmailTemplateMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListImportJobsResponse _$ListImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListImportJobsResponse(
    importJobs: (json['ImportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : ImportJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListManagementOptionsToJson(
    ListManagementOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContactListName', instance.contactListName);
  writeNotNull('TopicName', instance.topicName);
  return val;
}

ListSuppressedDestinationsResponse _$ListSuppressedDestinationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSuppressedDestinationsResponse(
    nextToken: json['NextToken'] as String,
    suppressedDestinationSummaries: (json['SuppressedDestinationSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : SuppressedDestinationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MailFromAttributes _$MailFromAttributesFromJson(Map<String, dynamic> json) {
  return MailFromAttributes(
    behaviorOnMxFailure: _$enumDecodeNullable(
        _$BehaviorOnMxFailureEnumMap, json['BehaviorOnMxFailure']),
    mailFromDomain: json['MailFromDomain'] as String,
    mailFromDomainStatus: _$enumDecodeNullable(
        _$MailFromDomainStatusEnumMap, json['MailFromDomainStatus']),
  );
}

const _$BehaviorOnMxFailureEnumMap = {
  BehaviorOnMxFailure.useDefaultValue: 'USE_DEFAULT_VALUE',
  BehaviorOnMxFailure.rejectMessage: 'REJECT_MESSAGE',
};

const _$MailFromDomainStatusEnumMap = {
  MailFromDomainStatus.pending: 'PENDING',
  MailFromDomainStatus.success: 'SUCCESS',
  MailFromDomainStatus.failed: 'FAILED',
  MailFromDomainStatus.temporaryFailure: 'TEMPORARY_FAILURE',
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

OverallVolume _$OverallVolumeFromJson(Map<String, dynamic> json) {
  return OverallVolume(
    domainIspPlacements: (json['DomainIspPlacements'] as List)
        ?.map((e) => e == null
            ? null
            : DomainIspPlacement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    readRatePercent: (json['ReadRatePercent'] as num)?.toDouble(),
    volumeStatistics: json['VolumeStatistics'] == null
        ? null
        : VolumeStatistics.fromJson(
            json['VolumeStatistics'] as Map<String, dynamic>),
  );
}

PinpointDestination _$PinpointDestinationFromJson(Map<String, dynamic> json) {
  return PinpointDestination(
    applicationArn: json['ApplicationArn'] as String,
  );
}

Map<String, dynamic> _$PinpointDestinationToJson(PinpointDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationArn', instance.applicationArn);
  return val;
}

PlacementStatistics _$PlacementStatisticsFromJson(Map<String, dynamic> json) {
  return PlacementStatistics(
    dkimPercentage: (json['DkimPercentage'] as num)?.toDouble(),
    inboxPercentage: (json['InboxPercentage'] as num)?.toDouble(),
    missingPercentage: (json['MissingPercentage'] as num)?.toDouble(),
    spamPercentage: (json['SpamPercentage'] as num)?.toDouble(),
    spfPercentage: (json['SpfPercentage'] as num)?.toDouble(),
  );
}

PutAccountDedicatedIpWarmupAttributesResponse
    _$PutAccountDedicatedIpWarmupAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutAccountDedicatedIpWarmupAttributesResponse();
}

PutAccountDetailsResponse _$PutAccountDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return PutAccountDetailsResponse();
}

PutAccountSendingAttributesResponse
    _$PutAccountSendingAttributesResponseFromJson(Map<String, dynamic> json) {
  return PutAccountSendingAttributesResponse();
}

PutAccountSuppressionAttributesResponse
    _$PutAccountSuppressionAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutAccountSuppressionAttributesResponse();
}

PutConfigurationSetDeliveryOptionsResponse
    _$PutConfigurationSetDeliveryOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return PutConfigurationSetDeliveryOptionsResponse();
}

PutConfigurationSetReputationOptionsResponse
    _$PutConfigurationSetReputationOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return PutConfigurationSetReputationOptionsResponse();
}

PutConfigurationSetSendingOptionsResponse
    _$PutConfigurationSetSendingOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return PutConfigurationSetSendingOptionsResponse();
}

PutConfigurationSetSuppressionOptionsResponse
    _$PutConfigurationSetSuppressionOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return PutConfigurationSetSuppressionOptionsResponse();
}

PutConfigurationSetTrackingOptionsResponse
    _$PutConfigurationSetTrackingOptionsResponseFromJson(
        Map<String, dynamic> json) {
  return PutConfigurationSetTrackingOptionsResponse();
}

PutDedicatedIpInPoolResponse _$PutDedicatedIpInPoolResponseFromJson(
    Map<String, dynamic> json) {
  return PutDedicatedIpInPoolResponse();
}

PutDedicatedIpWarmupAttributesResponse
    _$PutDedicatedIpWarmupAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutDedicatedIpWarmupAttributesResponse();
}

PutDeliverabilityDashboardOptionResponse
    _$PutDeliverabilityDashboardOptionResponseFromJson(
        Map<String, dynamic> json) {
  return PutDeliverabilityDashboardOptionResponse();
}

PutEmailIdentityDkimAttributesResponse
    _$PutEmailIdentityDkimAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutEmailIdentityDkimAttributesResponse();
}

PutEmailIdentityDkimSigningAttributesResponse
    _$PutEmailIdentityDkimSigningAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutEmailIdentityDkimSigningAttributesResponse(
    dkimStatus: _$enumDecodeNullable(_$DkimStatusEnumMap, json['DkimStatus']),
    dkimTokens: (json['DkimTokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

PutEmailIdentityFeedbackAttributesResponse
    _$PutEmailIdentityFeedbackAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutEmailIdentityFeedbackAttributesResponse();
}

PutEmailIdentityMailFromAttributesResponse
    _$PutEmailIdentityMailFromAttributesResponseFromJson(
        Map<String, dynamic> json) {
  return PutEmailIdentityMailFromAttributesResponse();
}

PutSuppressedDestinationResponse _$PutSuppressedDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return PutSuppressedDestinationResponse();
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

Map<String, dynamic> _$ReplacementEmailContentToJson(
    ReplacementEmailContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReplacementTemplate', instance.replacementTemplate?.toJson());
  return val;
}

Map<String, dynamic> _$ReplacementTemplateToJson(ReplacementTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReplacementTemplateData', instance.replacementTemplateData);
  return val;
}

ReputationOptions _$ReputationOptionsFromJson(Map<String, dynamic> json) {
  return ReputationOptions(
    lastFreshStart:
        const UnixDateTimeConverter().fromJson(json['LastFreshStart']),
    reputationMetricsEnabled: json['ReputationMetricsEnabled'] as bool,
  );
}

Map<String, dynamic> _$ReputationOptionsToJson(ReputationOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LastFreshStart',
      const UnixDateTimeConverter().toJson(instance.lastFreshStart));
  writeNotNull('ReputationMetricsEnabled', instance.reputationMetricsEnabled);
  return val;
}

ReviewDetails _$ReviewDetailsFromJson(Map<String, dynamic> json) {
  return ReviewDetails(
    caseId: json['CaseId'] as String,
    status: _$enumDecodeNullable(_$ReviewStatusEnumMap, json['Status']),
  );
}

const _$ReviewStatusEnumMap = {
  ReviewStatus.pending: 'PENDING',
  ReviewStatus.failed: 'FAILED',
  ReviewStatus.granted: 'GRANTED',
  ReviewStatus.denied: 'DENIED',
};

SendBulkEmailResponse _$SendBulkEmailResponseFromJson(
    Map<String, dynamic> json) {
  return SendBulkEmailResponse(
    bulkEmailEntryResults: (json['BulkEmailEntryResults'] as List)
        ?.map((e) => e == null
            ? null
            : BulkEmailEntryResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SendCustomVerificationEmailResponse
    _$SendCustomVerificationEmailResponseFromJson(Map<String, dynamic> json) {
  return SendCustomVerificationEmailResponse(
    messageId: json['MessageId'] as String,
  );
}

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) {
  return SendEmailResponse(
    messageId: json['MessageId'] as String,
  );
}

SendQuota _$SendQuotaFromJson(Map<String, dynamic> json) {
  return SendQuota(
    max24HourSend: (json['Max24HourSend'] as num)?.toDouble(),
    maxSendRate: (json['MaxSendRate'] as num)?.toDouble(),
    sentLast24Hours: (json['SentLast24Hours'] as num)?.toDouble(),
  );
}

SendingOptions _$SendingOptionsFromJson(Map<String, dynamic> json) {
  return SendingOptions(
    sendingEnabled: json['SendingEnabled'] as bool,
  );
}

Map<String, dynamic> _$SendingOptionsToJson(SendingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SendingEnabled', instance.sendingEnabled);
  return val;
}

SnsDestination _$SnsDestinationFromJson(Map<String, dynamic> json) {
  return SnsDestination(
    topicArn: json['TopicArn'] as String,
  );
}

Map<String, dynamic> _$SnsDestinationToJson(SnsDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

SuppressedDestination _$SuppressedDestinationFromJson(
    Map<String, dynamic> json) {
  return SuppressedDestination(
    emailAddress: json['EmailAddress'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    reason:
        _$enumDecodeNullable(_$SuppressionListReasonEnumMap, json['Reason']),
    attributes: json['Attributes'] == null
        ? null
        : SuppressedDestinationAttributes.fromJson(
            json['Attributes'] as Map<String, dynamic>),
  );
}

const _$SuppressionListReasonEnumMap = {
  SuppressionListReason.bounce: 'BOUNCE',
  SuppressionListReason.complaint: 'COMPLAINT',
};

SuppressedDestinationAttributes _$SuppressedDestinationAttributesFromJson(
    Map<String, dynamic> json) {
  return SuppressedDestinationAttributes(
    feedbackId: json['FeedbackId'] as String,
    messageId: json['MessageId'] as String,
  );
}

SuppressedDestinationSummary _$SuppressedDestinationSummaryFromJson(
    Map<String, dynamic> json) {
  return SuppressedDestinationSummary(
    emailAddress: json['EmailAddress'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    reason:
        _$enumDecodeNullable(_$SuppressionListReasonEnumMap, json['Reason']),
  );
}

SuppressionAttributes _$SuppressionAttributesFromJson(
    Map<String, dynamic> json) {
  return SuppressionAttributes(
    suppressedReasons: (json['SuppressedReasons'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SuppressionListReasonEnumMap, e))
        ?.toList(),
  );
}

SuppressionListDestination _$SuppressionListDestinationFromJson(
    Map<String, dynamic> json) {
  return SuppressionListDestination(
    suppressionListImportAction: _$enumDecodeNullable(
        _$SuppressionListImportActionEnumMap,
        json['SuppressionListImportAction']),
  );
}

Map<String, dynamic> _$SuppressionListDestinationToJson(
    SuppressionListDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SuppressionListImportAction',
      _$SuppressionListImportActionEnumMap[
          instance.suppressionListImportAction]);
  return val;
}

const _$SuppressionListImportActionEnumMap = {
  SuppressionListImportAction.delete: 'DELETE',
  SuppressionListImportAction.put: 'PUT',
};

SuppressionOptions _$SuppressionOptionsFromJson(Map<String, dynamic> json) {
  return SuppressionOptions(
    suppressedReasons: (json['SuppressedReasons'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SuppressionListReasonEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$SuppressionOptionsToJson(SuppressionOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SuppressedReasons',
      instance.suppressedReasons
          ?.map((e) => _$SuppressionListReasonEnumMap[e])
          ?.toList());
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$TemplateToJson(Template instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TemplateArn', instance.templateArn);
  writeNotNull('TemplateData', instance.templateData);
  writeNotNull('TemplateName', instance.templateName);
  return val;
}

TestRenderEmailTemplateResponse _$TestRenderEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return TestRenderEmailTemplateResponse(
    renderedTemplate: json['RenderedTemplate'] as String,
  );
}

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    defaultSubscriptionStatus: _$enumDecodeNullable(
        _$SubscriptionStatusEnumMap, json['DefaultSubscriptionStatus']),
    displayName: json['DisplayName'] as String,
    topicName: json['TopicName'] as String,
    description: json['Description'] as String,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultSubscriptionStatus',
      _$SubscriptionStatusEnumMap[instance.defaultSubscriptionStatus]);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('TopicName', instance.topicName);
  writeNotNull('Description', instance.description);
  return val;
}

Map<String, dynamic> _$TopicFilterToJson(TopicFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicName', instance.topicName);
  writeNotNull('UseDefaultIfPreferenceUnavailable',
      instance.useDefaultIfPreferenceUnavailable);
  return val;
}

TopicPreference _$TopicPreferenceFromJson(Map<String, dynamic> json) {
  return TopicPreference(
    subscriptionStatus: _$enumDecodeNullable(
        _$SubscriptionStatusEnumMap, json['SubscriptionStatus']),
    topicName: json['TopicName'] as String,
  );
}

Map<String, dynamic> _$TopicPreferenceToJson(TopicPreference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubscriptionStatus',
      _$SubscriptionStatusEnumMap[instance.subscriptionStatus]);
  writeNotNull('TopicName', instance.topicName);
  return val;
}

TrackingOptions _$TrackingOptionsFromJson(Map<String, dynamic> json) {
  return TrackingOptions(
    customRedirectDomain: json['CustomRedirectDomain'] as String,
  );
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

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateConfigurationSetEventDestinationResponse
    _$UpdateConfigurationSetEventDestinationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateConfigurationSetEventDestinationResponse();
}

UpdateContactListResponse _$UpdateContactListResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContactListResponse();
}

UpdateContactResponse _$UpdateContactResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContactResponse();
}

UpdateCustomVerificationEmailTemplateResponse
    _$UpdateCustomVerificationEmailTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateCustomVerificationEmailTemplateResponse();
}

UpdateEmailIdentityPolicyResponse _$UpdateEmailIdentityPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEmailIdentityPolicyResponse();
}

UpdateEmailTemplateResponse _$UpdateEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEmailTemplateResponse();
}

VolumeStatistics _$VolumeStatisticsFromJson(Map<String, dynamic> json) {
  return VolumeStatistics(
    inboxRawCount: json['InboxRawCount'] as int,
    projectedInbox: json['ProjectedInbox'] as int,
    projectedSpam: json['ProjectedSpam'] as int,
    spamRawCount: json['SpamRawCount'] as int,
  );
}
