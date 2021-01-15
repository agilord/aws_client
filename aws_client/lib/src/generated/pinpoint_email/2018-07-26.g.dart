// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-07-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

const _$DimensionValueSourceEnumMap = {
  DimensionValueSource.messageTag: 'MESSAGE_TAG',
  DimensionValueSource.emailHeader: 'EMAIL_HEADER',
  DimensionValueSource.linkTag: 'LINK_TAG',
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

DeleteDedicatedIpPoolResponse _$DeleteDedicatedIpPoolResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDedicatedIpPoolResponse();
}

DeleteEmailIdentityResponse _$DeleteEmailIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailIdentityResponse();
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
    signingEnabled: json['SigningEnabled'] as bool,
    status: _$enumDecodeNullable(_$DkimStatusEnumMap, json['Status']),
    tokens: (json['Tokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$DkimStatusEnumMap = {
  DkimStatus.pending: 'PENDING',
  DkimStatus.success: 'SUCCESS',
  DkimStatus.failed: 'FAILED',
  DkimStatus.temporaryFailure: 'TEMPORARY_FAILURE',
  DkimStatus.notStarted: 'NOT_STARTED',
};

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

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) {
  return GetAccountResponse(
    dedicatedIpAutoWarmupEnabled: json['DedicatedIpAutoWarmupEnabled'] as bool,
    enforcementStatus: json['EnforcementStatus'] as String,
    productionAccessEnabled: json['ProductionAccessEnabled'] as bool,
    sendQuota: json['SendQuota'] == null
        ? null
        : SendQuota.fromJson(json['SendQuota'] as Map<String, dynamic>),
    sendingEnabled: json['SendingEnabled'] as bool,
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
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trackingOptions: json['TrackingOptions'] == null
        ? null
        : TrackingOptions.fromJson(
            json['TrackingOptions'] as Map<String, dynamic>),
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
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    verifiedForSendingStatus: json['VerifiedForSendingStatus'] as bool,
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

PutAccountSendingAttributesResponse
    _$PutAccountSendingAttributesResponseFromJson(Map<String, dynamic> json) {
  return PutAccountSendingAttributesResponse();
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

VolumeStatistics _$VolumeStatisticsFromJson(Map<String, dynamic> json) {
  return VolumeStatistics(
    inboxRawCount: json['InboxRawCount'] as int,
    projectedInbox: json['ProjectedInbox'] as int,
    projectedSpam: json['ProjectedSpam'] as int,
    spamRawCount: json['SpamRawCount'] as int,
  );
}
