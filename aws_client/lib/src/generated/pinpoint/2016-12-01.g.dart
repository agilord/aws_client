// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ADMChannelRequestToJson(ADMChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientId', instance.clientId);
  writeNotNull('ClientSecret', instance.clientSecret);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

ADMChannelResponse _$ADMChannelResponseFromJson(Map<String, dynamic> json) {
  return ADMChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$ADMMessageToJson(ADMMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('ConsolidationKey', instance.consolidationKey);
  writeNotNull('Data', instance.data);
  writeNotNull('ExpiresAfter', instance.expiresAfter);
  writeNotNull('IconReference', instance.iconReference);
  writeNotNull('ImageIconUrl', instance.imageIconUrl);
  writeNotNull('ImageUrl', instance.imageUrl);
  writeNotNull('MD5', instance.md5);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('SmallImageIconUrl', instance.smallImageIconUrl);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

const _$ActionEnumMap = {
  Action.openApp: 'OPEN_APP',
  Action.deepLink: 'DEEP_LINK',
  Action.url: 'URL',
};

Map<String, dynamic> _$APNSChannelRequestToJson(APNSChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BundleId', instance.bundleId);
  writeNotNull('Certificate', instance.certificate);
  writeNotNull(
      'DefaultAuthenticationMethod', instance.defaultAuthenticationMethod);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PrivateKey', instance.privateKey);
  writeNotNull('TeamId', instance.teamId);
  writeNotNull('TokenKey', instance.tokenKey);
  writeNotNull('TokenKeyId', instance.tokenKeyId);
  return val;
}

APNSChannelResponse _$APNSChannelResponseFromJson(Map<String, dynamic> json) {
  return APNSChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    defaultAuthenticationMethod: json['DefaultAuthenticationMethod'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    hasTokenKey: json['HasTokenKey'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$APNSMessageToJson(APNSMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('APNSPushType', instance.aPNSPushType);
  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Badge', instance.badge);
  writeNotNull('Body', instance.body);
  writeNotNull('Category', instance.category);
  writeNotNull('CollapseId', instance.collapseId);
  writeNotNull('Data', instance.data);
  writeNotNull('MediaUrl', instance.mediaUrl);
  writeNotNull(
      'PreferredAuthenticationMethod', instance.preferredAuthenticationMethod);
  writeNotNull('Priority', instance.priority);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('ThreadId', instance.threadId);
  writeNotNull('TimeToLive', instance.timeToLive);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

APNSPushNotificationTemplate _$APNSPushNotificationTemplateFromJson(
    Map<String, dynamic> json) {
  return APNSPushNotificationTemplate(
    action: _$enumDecodeNullable(_$ActionEnumMap, json['Action']),
    body: json['Body'] as String,
    mediaUrl: json['MediaUrl'] as String,
    rawContent: json['RawContent'] as String,
    sound: json['Sound'] as String,
    title: json['Title'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$APNSPushNotificationTemplateToJson(
    APNSPushNotificationTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('MediaUrl', instance.mediaUrl);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
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

Map<String, dynamic> _$APNSSandboxChannelRequestToJson(
    APNSSandboxChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BundleId', instance.bundleId);
  writeNotNull('Certificate', instance.certificate);
  writeNotNull(
      'DefaultAuthenticationMethod', instance.defaultAuthenticationMethod);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PrivateKey', instance.privateKey);
  writeNotNull('TeamId', instance.teamId);
  writeNotNull('TokenKey', instance.tokenKey);
  writeNotNull('TokenKeyId', instance.tokenKeyId);
  return val;
}

APNSSandboxChannelResponse _$APNSSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return APNSSandboxChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    defaultAuthenticationMethod: json['DefaultAuthenticationMethod'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    hasTokenKey: json['HasTokenKey'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$APNSVoipChannelRequestToJson(
    APNSVoipChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BundleId', instance.bundleId);
  writeNotNull('Certificate', instance.certificate);
  writeNotNull(
      'DefaultAuthenticationMethod', instance.defaultAuthenticationMethod);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PrivateKey', instance.privateKey);
  writeNotNull('TeamId', instance.teamId);
  writeNotNull('TokenKey', instance.tokenKey);
  writeNotNull('TokenKeyId', instance.tokenKeyId);
  return val;
}

APNSVoipChannelResponse _$APNSVoipChannelResponseFromJson(
    Map<String, dynamic> json) {
  return APNSVoipChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    defaultAuthenticationMethod: json['DefaultAuthenticationMethod'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    hasTokenKey: json['HasTokenKey'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$APNSVoipSandboxChannelRequestToJson(
    APNSVoipSandboxChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BundleId', instance.bundleId);
  writeNotNull('Certificate', instance.certificate);
  writeNotNull(
      'DefaultAuthenticationMethod', instance.defaultAuthenticationMethod);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PrivateKey', instance.privateKey);
  writeNotNull('TeamId', instance.teamId);
  writeNotNull('TokenKey', instance.tokenKey);
  writeNotNull('TokenKeyId', instance.tokenKeyId);
  return val;
}

APNSVoipSandboxChannelResponse _$APNSVoipSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return APNSVoipSandboxChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    defaultAuthenticationMethod: json['DefaultAuthenticationMethod'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    hasTokenKey: json['HasTokenKey'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

ActivitiesResponse _$ActivitiesResponseFromJson(Map<String, dynamic> json) {
  return ActivitiesResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : ActivityResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    custom: json['CUSTOM'] == null
        ? null
        : CustomMessageActivity.fromJson(
            json['CUSTOM'] as Map<String, dynamic>),
    conditionalSplit: json['ConditionalSplit'] == null
        ? null
        : ConditionalSplitActivity.fromJson(
            json['ConditionalSplit'] as Map<String, dynamic>),
    description: json['Description'] as String,
    email: json['EMAIL'] == null
        ? null
        : EmailMessageActivity.fromJson(json['EMAIL'] as Map<String, dynamic>),
    holdout: json['Holdout'] == null
        ? null
        : HoldoutActivity.fromJson(json['Holdout'] as Map<String, dynamic>),
    multiCondition: json['MultiCondition'] == null
        ? null
        : MultiConditionalSplitActivity.fromJson(
            json['MultiCondition'] as Map<String, dynamic>),
    push: json['PUSH'] == null
        ? null
        : PushMessageActivity.fromJson(json['PUSH'] as Map<String, dynamic>),
    randomSplit: json['RandomSplit'] == null
        ? null
        : RandomSplitActivity.fromJson(
            json['RandomSplit'] as Map<String, dynamic>),
    sms: json['SMS'] == null
        ? null
        : SMSMessageActivity.fromJson(json['SMS'] as Map<String, dynamic>),
    wait: json['Wait'] == null
        ? null
        : WaitActivity.fromJson(json['Wait'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CUSTOM', instance.custom?.toJson());
  writeNotNull('ConditionalSplit', instance.conditionalSplit?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('EMAIL', instance.email?.toJson());
  writeNotNull('Holdout', instance.holdout?.toJson());
  writeNotNull('MultiCondition', instance.multiCondition?.toJson());
  writeNotNull('PUSH', instance.push?.toJson());
  writeNotNull('RandomSplit', instance.randomSplit?.toJson());
  writeNotNull('SMS', instance.sms?.toJson());
  writeNotNull('Wait', instance.wait?.toJson());
  return val;
}

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) {
  return ActivityResponse(
    applicationId: json['ApplicationId'] as String,
    campaignId: json['CampaignId'] as String,
    id: json['Id'] as String,
    end: json['End'] as String,
    result: json['Result'] as String,
    scheduledStart: json['ScheduledStart'] as String,
    start: json['Start'] as String,
    state: json['State'] as String,
    successfulEndpointCount: json['SuccessfulEndpointCount'] as int,
    timezonesCompletedCount: json['TimezonesCompletedCount'] as int,
    timezonesTotalCount: json['TimezonesTotalCount'] as int,
    totalEndpointCount: json['TotalEndpointCount'] as int,
    treatmentId: json['TreatmentId'] as String,
  );
}

Map<String, dynamic> _$AddressConfigurationToJson(
    AddressConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BodyOverride', instance.bodyOverride);
  writeNotNull('ChannelType', _$ChannelTypeEnumMap[instance.channelType]);
  writeNotNull('Context', instance.context);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('TitleOverride', instance.titleOverride);
  return val;
}

const _$ChannelTypeEnumMap = {
  ChannelType.push: 'PUSH',
  ChannelType.gcm: 'GCM',
  ChannelType.apns: 'APNS',
  ChannelType.apnsSandbox: 'APNS_SANDBOX',
  ChannelType.apnsVoip: 'APNS_VOIP',
  ChannelType.apnsVoipSandbox: 'APNS_VOIP_SANDBOX',
  ChannelType.adm: 'ADM',
  ChannelType.sms: 'SMS',
  ChannelType.voice: 'VOICE',
  ChannelType.email: 'EMAIL',
  ChannelType.baidu: 'BAIDU',
  ChannelType.custom: 'CUSTOM',
};

AndroidPushNotificationTemplate _$AndroidPushNotificationTemplateFromJson(
    Map<String, dynamic> json) {
  return AndroidPushNotificationTemplate(
    action: _$enumDecodeNullable(_$ActionEnumMap, json['Action']),
    body: json['Body'] as String,
    imageIconUrl: json['ImageIconUrl'] as String,
    imageUrl: json['ImageUrl'] as String,
    rawContent: json['RawContent'] as String,
    smallImageIconUrl: json['SmallImageIconUrl'] as String,
    sound: json['Sound'] as String,
    title: json['Title'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$AndroidPushNotificationTemplateToJson(
    AndroidPushNotificationTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('ImageIconUrl', instance.imageIconUrl);
  writeNotNull('ImageUrl', instance.imageUrl);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('SmallImageIconUrl', instance.smallImageIconUrl);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

ApplicationDateRangeKpiResponse _$ApplicationDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return ApplicationDateRangeKpiResponse(
    applicationId: json['ApplicationId'] as String,
    endTime: const IsoDateTimeConverter().fromJson(json['EndTime']),
    kpiName: json['KpiName'] as String,
    kpiResult: json['KpiResult'] == null
        ? null
        : BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
    startTime: const IsoDateTimeConverter().fromJson(json['StartTime']),
    nextToken: json['NextToken'] as String,
  );
}

ApplicationResponse _$ApplicationResponseFromJson(Map<String, dynamic> json) {
  return ApplicationResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ApplicationSettingsResource _$ApplicationSettingsResourceFromJson(
    Map<String, dynamic> json) {
  return ApplicationSettingsResource(
    applicationId: json['ApplicationId'] as String,
    campaignHook: json['CampaignHook'] == null
        ? null
        : CampaignHook.fromJson(json['CampaignHook'] as Map<String, dynamic>),
    lastModifiedDate: json['LastModifiedDate'] as String,
    limits: json['Limits'] == null
        ? null
        : CampaignLimits.fromJson(json['Limits'] as Map<String, dynamic>),
    quietTime: json['QuietTime'] == null
        ? null
        : QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>),
  );
}

ApplicationsResponse _$ApplicationsResponseFromJson(Map<String, dynamic> json) {
  return ApplicationsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

AttributeDimension _$AttributeDimensionFromJson(Map<String, dynamic> json) {
  return AttributeDimension(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
    attributeType:
        _$enumDecodeNullable(_$AttributeTypeEnumMap, json['AttributeType']),
  );
}

Map<String, dynamic> _$AttributeDimensionToJson(AttributeDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  writeNotNull('AttributeType', _$AttributeTypeEnumMap[instance.attributeType]);
  return val;
}

const _$AttributeTypeEnumMap = {
  AttributeType.inclusive: 'INCLUSIVE',
  AttributeType.exclusive: 'EXCLUSIVE',
};

AttributesResource _$AttributesResourceFromJson(Map<String, dynamic> json) {
  return AttributesResource(
    applicationId: json['ApplicationId'] as String,
    attributeType: json['AttributeType'] as String,
    attributes: (json['Attributes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BaiduChannelRequestToJson(BaiduChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('SecretKey', instance.secretKey);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

BaiduChannelResponse _$BaiduChannelResponseFromJson(Map<String, dynamic> json) {
  return BaiduChannelResponse(
    credential: json['Credential'] as String,
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$BaiduMessageToJson(BaiduMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('Data', instance.data);
  writeNotNull('IconReference', instance.iconReference);
  writeNotNull('ImageIconUrl', instance.imageIconUrl);
  writeNotNull('ImageUrl', instance.imageUrl);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('SmallImageIconUrl', instance.smallImageIconUrl);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('TimeToLive', instance.timeToLive);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

BaseKpiResult _$BaseKpiResultFromJson(Map<String, dynamic> json) {
  return BaseKpiResult(
    rows: (json['Rows'] as List)
        ?.map((e) =>
            e == null ? null : ResultRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CampaignCustomMessage _$CampaignCustomMessageFromJson(
    Map<String, dynamic> json) {
  return CampaignCustomMessage(
    data: json['Data'] as String,
  );
}

Map<String, dynamic> _$CampaignCustomMessageToJson(
    CampaignCustomMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', instance.data);
  return val;
}

CampaignDateRangeKpiResponse _$CampaignDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return CampaignDateRangeKpiResponse(
    applicationId: json['ApplicationId'] as String,
    campaignId: json['CampaignId'] as String,
    endTime: const IsoDateTimeConverter().fromJson(json['EndTime']),
    kpiName: json['KpiName'] as String,
    kpiResult: json['KpiResult'] == null
        ? null
        : BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
    startTime: const IsoDateTimeConverter().fromJson(json['StartTime']),
    nextToken: json['NextToken'] as String,
  );
}

CampaignEmailMessage _$CampaignEmailMessageFromJson(Map<String, dynamic> json) {
  return CampaignEmailMessage(
    body: json['Body'] as String,
    fromAddress: json['FromAddress'] as String,
    htmlBody: json['HtmlBody'] as String,
    title: json['Title'] as String,
  );
}

Map<String, dynamic> _$CampaignEmailMessageToJson(
    CampaignEmailMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('FromAddress', instance.fromAddress);
  writeNotNull('HtmlBody', instance.htmlBody);
  writeNotNull('Title', instance.title);
  return val;
}

CampaignEventFilter _$CampaignEventFilterFromJson(Map<String, dynamic> json) {
  return CampaignEventFilter(
    dimensions: json['Dimensions'] == null
        ? null
        : EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
    filterType: _$enumDecodeNullable(_$FilterTypeEnumMap, json['FilterType']),
  );
}

Map<String, dynamic> _$CampaignEventFilterToJson(CampaignEventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimensions', instance.dimensions?.toJson());
  writeNotNull('FilterType', _$FilterTypeEnumMap[instance.filterType]);
  return val;
}

const _$FilterTypeEnumMap = {
  FilterType.system: 'SYSTEM',
  FilterType.endpoint: 'ENDPOINT',
};

CampaignHook _$CampaignHookFromJson(Map<String, dynamic> json) {
  return CampaignHook(
    lambdaFunctionName: json['LambdaFunctionName'] as String,
    mode: _$enumDecodeNullable(_$ModeEnumMap, json['Mode']),
    webUrl: json['WebUrl'] as String,
  );
}

Map<String, dynamic> _$CampaignHookToJson(CampaignHook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaFunctionName', instance.lambdaFunctionName);
  writeNotNull('Mode', _$ModeEnumMap[instance.mode]);
  writeNotNull('WebUrl', instance.webUrl);
  return val;
}

const _$ModeEnumMap = {
  Mode.delivery: 'DELIVERY',
  Mode.filter: 'FILTER',
};

CampaignLimits _$CampaignLimitsFromJson(Map<String, dynamic> json) {
  return CampaignLimits(
    daily: json['Daily'] as int,
    maximumDuration: json['MaximumDuration'] as int,
    messagesPerSecond: json['MessagesPerSecond'] as int,
    total: json['Total'] as int,
  );
}

Map<String, dynamic> _$CampaignLimitsToJson(CampaignLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Daily', instance.daily);
  writeNotNull('MaximumDuration', instance.maximumDuration);
  writeNotNull('MessagesPerSecond', instance.messagesPerSecond);
  writeNotNull('Total', instance.total);
  return val;
}

CampaignResponse _$CampaignResponseFromJson(Map<String, dynamic> json) {
  return CampaignResponse(
    applicationId: json['ApplicationId'] as String,
    arn: json['Arn'] as String,
    creationDate: json['CreationDate'] as String,
    id: json['Id'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    segmentId: json['SegmentId'] as String,
    segmentVersion: json['SegmentVersion'] as int,
    additionalTreatments: (json['AdditionalTreatments'] as List)
        ?.map((e) => e == null
            ? null
            : TreatmentResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    customDeliveryConfiguration: json['CustomDeliveryConfiguration'] == null
        ? null
        : CustomDeliveryConfiguration.fromJson(
            json['CustomDeliveryConfiguration'] as Map<String, dynamic>),
    defaultState: json['DefaultState'] == null
        ? null
        : CampaignState.fromJson(json['DefaultState'] as Map<String, dynamic>),
    description: json['Description'] as String,
    holdoutPercent: json['HoldoutPercent'] as int,
    hook: json['Hook'] == null
        ? null
        : CampaignHook.fromJson(json['Hook'] as Map<String, dynamic>),
    isPaused: json['IsPaused'] as bool,
    limits: json['Limits'] == null
        ? null
        : CampaignLimits.fromJson(json['Limits'] as Map<String, dynamic>),
    messageConfiguration: json['MessageConfiguration'] == null
        ? null
        : MessageConfiguration.fromJson(
            json['MessageConfiguration'] as Map<String, dynamic>),
    name: json['Name'] as String,
    schedule: json['Schedule'] == null
        ? null
        : Schedule.fromJson(json['Schedule'] as Map<String, dynamic>),
    state: json['State'] == null
        ? null
        : CampaignState.fromJson(json['State'] as Map<String, dynamic>),
    templateConfiguration: json['TemplateConfiguration'] == null
        ? null
        : TemplateConfiguration.fromJson(
            json['TemplateConfiguration'] as Map<String, dynamic>),
    treatmentDescription: json['TreatmentDescription'] as String,
    treatmentName: json['TreatmentName'] as String,
    version: json['Version'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CampaignSmsMessage _$CampaignSmsMessageFromJson(Map<String, dynamic> json) {
  return CampaignSmsMessage(
    body: json['Body'] as String,
    messageType:
        _$enumDecodeNullable(_$MessageTypeEnumMap, json['MessageType']),
    senderId: json['SenderId'] as String,
  );
}

Map<String, dynamic> _$CampaignSmsMessageToJson(CampaignSmsMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  writeNotNull('SenderId', instance.senderId);
  return val;
}

const _$MessageTypeEnumMap = {
  MessageType.transactional: 'TRANSACTIONAL',
  MessageType.promotional: 'PROMOTIONAL',
};

CampaignState _$CampaignStateFromJson(Map<String, dynamic> json) {
  return CampaignState(
    campaignStatus:
        _$enumDecodeNullable(_$CampaignStatusEnumMap, json['CampaignStatus']),
  );
}

const _$CampaignStatusEnumMap = {
  CampaignStatus.scheduled: 'SCHEDULED',
  CampaignStatus.executing: 'EXECUTING',
  CampaignStatus.pendingNextRun: 'PENDING_NEXT_RUN',
  CampaignStatus.completed: 'COMPLETED',
  CampaignStatus.paused: 'PAUSED',
  CampaignStatus.deleted: 'DELETED',
  CampaignStatus.invalid: 'INVALID',
};

CampaignsResponse _$CampaignsResponseFromJson(Map<String, dynamic> json) {
  return CampaignsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : CampaignResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ChannelResponse _$ChannelResponseFromJson(Map<String, dynamic> json) {
  return ChannelResponse(
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

ChannelsResponse _$ChannelsResponseFromJson(Map<String, dynamic> json) {
  return ChannelsResponse(
    channels: (json['Channels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ChannelResponse.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    conditions: (json['Conditions'] as List)
        ?.map((e) => e == null
            ? null
            : SimpleCondition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    operator: _$enumDecodeNullable(_$OperatorEnumMap, json['Operator']),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Conditions', instance.conditions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Operator', _$OperatorEnumMap[instance.operator]);
  return val;
}

const _$OperatorEnumMap = {
  Operator.all: 'ALL',
  Operator.any: 'ANY',
};

ConditionalSplitActivity _$ConditionalSplitActivityFromJson(
    Map<String, dynamic> json) {
  return ConditionalSplitActivity(
    condition: json['Condition'] == null
        ? null
        : Condition.fromJson(json['Condition'] as Map<String, dynamic>),
    evaluationWaitTime: json['EvaluationWaitTime'] == null
        ? null
        : WaitTime.fromJson(json['EvaluationWaitTime'] as Map<String, dynamic>),
    falseActivity: json['FalseActivity'] as String,
    trueActivity: json['TrueActivity'] as String,
  );
}

Map<String, dynamic> _$ConditionalSplitActivityToJson(
    ConditionalSplitActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Condition', instance.condition?.toJson());
  writeNotNull('EvaluationWaitTime', instance.evaluationWaitTime?.toJson());
  writeNotNull('FalseActivity', instance.falseActivity);
  writeNotNull('TrueActivity', instance.trueActivity);
  return val;
}

CreateAppResponse _$CreateAppResponseFromJson(Map<String, dynamic> json) {
  return CreateAppResponse(
    applicationResponse: json['ApplicationResponse'] == null
        ? null
        : ApplicationResponse.fromJson(
            json['ApplicationResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateApplicationRequestToJson(
    CreateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('tags', instance.tags);
  return val;
}

CreateCampaignResponse _$CreateCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCampaignResponse(
    campaignResponse: json['CampaignResponse'] == null
        ? null
        : CampaignResponse.fromJson(
            json['CampaignResponse'] as Map<String, dynamic>),
  );
}

CreateEmailTemplateResponse _$CreateEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEmailTemplateResponse(
    createTemplateMessageBody: json['CreateTemplateMessageBody'] == null
        ? null
        : CreateTemplateMessageBody.fromJson(
            json['CreateTemplateMessageBody'] as Map<String, dynamic>),
  );
}

CreateExportJobResponse _$CreateExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateExportJobResponse(
    exportJobResponse: json['ExportJobResponse'] == null
        ? null
        : ExportJobResponse.fromJson(
            json['ExportJobResponse'] as Map<String, dynamic>),
  );
}

CreateImportJobResponse _$CreateImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateImportJobResponse(
    importJobResponse: json['ImportJobResponse'] == null
        ? null
        : ImportJobResponse.fromJson(
            json['ImportJobResponse'] as Map<String, dynamic>),
  );
}

CreateJourneyResponse _$CreateJourneyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateJourneyResponse(
    journeyResponse: json['JourneyResponse'] == null
        ? null
        : JourneyResponse.fromJson(
            json['JourneyResponse'] as Map<String, dynamic>),
  );
}

CreatePushTemplateResponse _$CreatePushTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePushTemplateResponse(
    createTemplateMessageBody: json['CreateTemplateMessageBody'] == null
        ? null
        : CreateTemplateMessageBody.fromJson(
            json['CreateTemplateMessageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRecommenderConfigurationToJson(
    CreateRecommenderConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RecommendationProviderRoleArn', instance.recommendationProviderRoleArn);
  writeNotNull('RecommendationProviderUri', instance.recommendationProviderUri);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull(
      'RecommendationProviderIdType', instance.recommendationProviderIdType);
  writeNotNull(
      'RecommendationTransformerUri', instance.recommendationTransformerUri);
  writeNotNull(
      'RecommendationsDisplayName', instance.recommendationsDisplayName);
  writeNotNull('RecommendationsPerMessage', instance.recommendationsPerMessage);
  return val;
}

CreateRecommenderConfigurationResponse
    _$CreateRecommenderConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateRecommenderConfigurationResponse(
    recommenderConfigurationResponse:
        json['RecommenderConfigurationResponse'] == null
            ? null
            : RecommenderConfigurationResponse.fromJson(
                json['RecommenderConfigurationResponse']
                    as Map<String, dynamic>),
  );
}

CreateSegmentResponse _$CreateSegmentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSegmentResponse(
    segmentResponse: json['SegmentResponse'] == null
        ? null
        : SegmentResponse.fromJson(
            json['SegmentResponse'] as Map<String, dynamic>),
  );
}

CreateSmsTemplateResponse _$CreateSmsTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSmsTemplateResponse(
    createTemplateMessageBody: json['CreateTemplateMessageBody'] == null
        ? null
        : CreateTemplateMessageBody.fromJson(
            json['CreateTemplateMessageBody'] as Map<String, dynamic>),
  );
}

CreateTemplateMessageBody _$CreateTemplateMessageBodyFromJson(
    Map<String, dynamic> json) {
  return CreateTemplateMessageBody(
    arn: json['Arn'] as String,
    message: json['Message'] as String,
    requestID: json['RequestID'] as String,
  );
}

CreateVoiceTemplateResponse _$CreateVoiceTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVoiceTemplateResponse(
    createTemplateMessageBody: json['CreateTemplateMessageBody'] == null
        ? null
        : CreateTemplateMessageBody.fromJson(
            json['CreateTemplateMessageBody'] as Map<String, dynamic>),
  );
}

CustomDeliveryConfiguration _$CustomDeliveryConfigurationFromJson(
    Map<String, dynamic> json) {
  return CustomDeliveryConfiguration(
    deliveryUri: json['DeliveryUri'] as String,
    endpointTypes: (json['EndpointTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EndpointTypesElementEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomDeliveryConfigurationToJson(
    CustomDeliveryConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryUri', instance.deliveryUri);
  writeNotNull(
      'EndpointTypes',
      instance.endpointTypes
          ?.map((e) => _$EndpointTypesElementEnumMap[e])
          ?.toList());
  return val;
}

const _$EndpointTypesElementEnumMap = {
  EndpointTypesElement.push: 'PUSH',
  EndpointTypesElement.gcm: 'GCM',
  EndpointTypesElement.apns: 'APNS',
  EndpointTypesElement.apnsSandbox: 'APNS_SANDBOX',
  EndpointTypesElement.apnsVoip: 'APNS_VOIP',
  EndpointTypesElement.apnsVoipSandbox: 'APNS_VOIP_SANDBOX',
  EndpointTypesElement.adm: 'ADM',
  EndpointTypesElement.sms: 'SMS',
  EndpointTypesElement.voice: 'VOICE',
  EndpointTypesElement.email: 'EMAIL',
  EndpointTypesElement.baidu: 'BAIDU',
  EndpointTypesElement.custom: 'CUSTOM',
};

CustomMessageActivity _$CustomMessageActivityFromJson(
    Map<String, dynamic> json) {
  return CustomMessageActivity(
    deliveryUri: json['DeliveryUri'] as String,
    endpointTypes: (json['EndpointTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EndpointTypesElementEnumMap, e))
        ?.toList(),
    messageConfig: json['MessageConfig'] == null
        ? null
        : JourneyCustomMessage.fromJson(
            json['MessageConfig'] as Map<String, dynamic>),
    nextActivity: json['NextActivity'] as String,
    templateName: json['TemplateName'] as String,
    templateVersion: json['TemplateVersion'] as String,
  );
}

Map<String, dynamic> _$CustomMessageActivityToJson(
    CustomMessageActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryUri', instance.deliveryUri);
  writeNotNull(
      'EndpointTypes',
      instance.endpointTypes
          ?.map((e) => _$EndpointTypesElementEnumMap[e])
          ?.toList());
  writeNotNull('MessageConfig', instance.messageConfig?.toJson());
  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('TemplateName', instance.templateName);
  writeNotNull('TemplateVersion', instance.templateVersion);
  return val;
}

Map<String, dynamic> _$DefaultMessageToJson(DefaultMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('Substitutions', instance.substitutions);
  return val;
}

Map<String, dynamic> _$DefaultPushNotificationMessageToJson(
    DefaultPushNotificationMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('Data', instance.data);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

DefaultPushNotificationTemplate _$DefaultPushNotificationTemplateFromJson(
    Map<String, dynamic> json) {
  return DefaultPushNotificationTemplate(
    action: _$enumDecodeNullable(_$ActionEnumMap, json['Action']),
    body: json['Body'] as String,
    sound: json['Sound'] as String,
    title: json['Title'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$DefaultPushNotificationTemplateToJson(
    DefaultPushNotificationTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

DeleteAdmChannelResponse _$DeleteAdmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAdmChannelResponse(
    aDMChannelResponse: json['ADMChannelResponse'] == null
        ? null
        : ADMChannelResponse.fromJson(
            json['ADMChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteApnsChannelResponse _$DeleteApnsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApnsChannelResponse(
    aPNSChannelResponse: json['APNSChannelResponse'] == null
        ? null
        : APNSChannelResponse.fromJson(
            json['APNSChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteApnsSandboxChannelResponse _$DeleteApnsSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApnsSandboxChannelResponse(
    aPNSSandboxChannelResponse: json['APNSSandboxChannelResponse'] == null
        ? null
        : APNSSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteApnsVoipChannelResponse _$DeleteApnsVoipChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApnsVoipChannelResponse(
    aPNSVoipChannelResponse: json['APNSVoipChannelResponse'] == null
        ? null
        : APNSVoipChannelResponse.fromJson(
            json['APNSVoipChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteApnsVoipSandboxChannelResponse
    _$DeleteApnsVoipSandboxChannelResponseFromJson(Map<String, dynamic> json) {
  return DeleteApnsVoipSandboxChannelResponse(
    aPNSVoipSandboxChannelResponse:
        json['APNSVoipSandboxChannelResponse'] == null
            ? null
            : APNSVoipSandboxChannelResponse.fromJson(
                json['APNSVoipSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteAppResponse _$DeleteAppResponseFromJson(Map<String, dynamic> json) {
  return DeleteAppResponse(
    applicationResponse: json['ApplicationResponse'] == null
        ? null
        : ApplicationResponse.fromJson(
            json['ApplicationResponse'] as Map<String, dynamic>),
  );
}

DeleteBaiduChannelResponse _$DeleteBaiduChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBaiduChannelResponse(
    baiduChannelResponse: json['BaiduChannelResponse'] == null
        ? null
        : BaiduChannelResponse.fromJson(
            json['BaiduChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteCampaignResponse _$DeleteCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCampaignResponse(
    campaignResponse: json['CampaignResponse'] == null
        ? null
        : CampaignResponse.fromJson(
            json['CampaignResponse'] as Map<String, dynamic>),
  );
}

DeleteEmailChannelResponse _$DeleteEmailChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailChannelResponse(
    emailChannelResponse: json['EmailChannelResponse'] == null
        ? null
        : EmailChannelResponse.fromJson(
            json['EmailChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteEmailTemplateResponse _$DeleteEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmailTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

DeleteEndpointResponse _$DeleteEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEndpointResponse(
    endpointResponse: json['EndpointResponse'] == null
        ? null
        : EndpointResponse.fromJson(
            json['EndpointResponse'] as Map<String, dynamic>),
  );
}

DeleteEventStreamResponse _$DeleteEventStreamResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEventStreamResponse(
    eventStream: json['EventStream'] == null
        ? null
        : EventStream.fromJson(json['EventStream'] as Map<String, dynamic>),
  );
}

DeleteGcmChannelResponse _$DeleteGcmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGcmChannelResponse(
    gCMChannelResponse: json['GCMChannelResponse'] == null
        ? null
        : GCMChannelResponse.fromJson(
            json['GCMChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteJourneyResponse _$DeleteJourneyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteJourneyResponse(
    journeyResponse: json['JourneyResponse'] == null
        ? null
        : JourneyResponse.fromJson(
            json['JourneyResponse'] as Map<String, dynamic>),
  );
}

DeletePushTemplateResponse _$DeletePushTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePushTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

DeleteRecommenderConfigurationResponse
    _$DeleteRecommenderConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteRecommenderConfigurationResponse(
    recommenderConfigurationResponse:
        json['RecommenderConfigurationResponse'] == null
            ? null
            : RecommenderConfigurationResponse.fromJson(
                json['RecommenderConfigurationResponse']
                    as Map<String, dynamic>),
  );
}

DeleteSegmentResponse _$DeleteSegmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSegmentResponse(
    segmentResponse: json['SegmentResponse'] == null
        ? null
        : SegmentResponse.fromJson(
            json['SegmentResponse'] as Map<String, dynamic>),
  );
}

DeleteSmsChannelResponse _$DeleteSmsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSmsChannelResponse(
    sMSChannelResponse: json['SMSChannelResponse'] == null
        ? null
        : SMSChannelResponse.fromJson(
            json['SMSChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteSmsTemplateResponse _$DeleteSmsTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSmsTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

DeleteUserEndpointsResponse _$DeleteUserEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserEndpointsResponse(
    endpointsResponse: json['EndpointsResponse'] == null
        ? null
        : EndpointsResponse.fromJson(
            json['EndpointsResponse'] as Map<String, dynamic>),
  );
}

DeleteVoiceChannelResponse _$DeleteVoiceChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteVoiceChannelResponse(
    voiceChannelResponse: json['VoiceChannelResponse'] == null
        ? null
        : VoiceChannelResponse.fromJson(
            json['VoiceChannelResponse'] as Map<String, dynamic>),
  );
}

DeleteVoiceTemplateResponse _$DeleteVoiceTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteVoiceTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DirectMessageConfigurationToJson(
    DirectMessageConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADMMessage', instance.aDMMessage?.toJson());
  writeNotNull('APNSMessage', instance.aPNSMessage?.toJson());
  writeNotNull('BaiduMessage', instance.baiduMessage?.toJson());
  writeNotNull('DefaultMessage', instance.defaultMessage?.toJson());
  writeNotNull('DefaultPushNotificationMessage',
      instance.defaultPushNotificationMessage?.toJson());
  writeNotNull('EmailMessage', instance.emailMessage?.toJson());
  writeNotNull('GCMMessage', instance.gCMMessage?.toJson());
  writeNotNull('SMSMessage', instance.sMSMessage?.toJson());
  writeNotNull('VoiceMessage', instance.voiceMessage?.toJson());
  return val;
}

Map<String, dynamic> _$EmailChannelRequestToJson(EmailChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromAddress', instance.fromAddress);
  writeNotNull('Identity', instance.identity);
  writeNotNull('ConfigurationSet', instance.configurationSet);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

EmailChannelResponse _$EmailChannelResponseFromJson(Map<String, dynamic> json) {
  return EmailChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    configurationSet: json['ConfigurationSet'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    fromAddress: json['FromAddress'] as String,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    identity: json['Identity'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    messagesPerSecond: json['MessagesPerSecond'] as int,
    roleArn: json['RoleArn'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$EmailMessageToJson(EmailMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('FeedbackForwardingAddress', instance.feedbackForwardingAddress);
  writeNotNull('FromAddress', instance.fromAddress);
  writeNotNull('RawEmail', instance.rawEmail?.toJson());
  writeNotNull('ReplyToAddresses', instance.replyToAddresses);
  writeNotNull('SimpleEmail', instance.simpleEmail?.toJson());
  writeNotNull('Substitutions', instance.substitutions);
  return val;
}

EmailMessageActivity _$EmailMessageActivityFromJson(Map<String, dynamic> json) {
  return EmailMessageActivity(
    messageConfig: json['MessageConfig'] == null
        ? null
        : JourneyEmailMessage.fromJson(
            json['MessageConfig'] as Map<String, dynamic>),
    nextActivity: json['NextActivity'] as String,
    templateName: json['TemplateName'] as String,
    templateVersion: json['TemplateVersion'] as String,
  );
}

Map<String, dynamic> _$EmailMessageActivityToJson(
    EmailMessageActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageConfig', instance.messageConfig?.toJson());
  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('TemplateName', instance.templateName);
  writeNotNull('TemplateVersion', instance.templateVersion);
  return val;
}

Map<String, dynamic> _$EmailTemplateRequestToJson(
    EmailTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultSubstitutions', instance.defaultSubstitutions);
  writeNotNull('HtmlPart', instance.htmlPart);
  writeNotNull('RecommenderId', instance.recommenderId);
  writeNotNull('Subject', instance.subject);
  writeNotNull('TemplateDescription', instance.templateDescription);
  writeNotNull('TextPart', instance.textPart);
  writeNotNull('tags', instance.tags);
  return val;
}

EmailTemplateResponse _$EmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return EmailTemplateResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType:
        _$enumDecodeNullable(_$TemplateTypeEnumMap, json['TemplateType']),
    arn: json['Arn'] as String,
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    htmlPart: json['HtmlPart'] as String,
    recommenderId: json['RecommenderId'] as String,
    subject: json['Subject'] as String,
    templateDescription: json['TemplateDescription'] as String,
    textPart: json['TextPart'] as String,
    version: json['Version'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$TemplateTypeEnumMap = {
  TemplateType.email: 'EMAIL',
  TemplateType.sms: 'SMS',
  TemplateType.voice: 'VOICE',
  TemplateType.push: 'PUSH',
};

Map<String, dynamic> _$EndpointBatchItemToJson(EndpointBatchItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('ChannelType', _$ChannelTypeEnumMap[instance.channelType]);
  writeNotNull('Demographic', instance.demographic?.toJson());
  writeNotNull('EffectiveDate', instance.effectiveDate);
  writeNotNull('EndpointStatus', instance.endpointStatus);
  writeNotNull('Id', instance.id);
  writeNotNull('Location', instance.location?.toJson());
  writeNotNull('Metrics', instance.metrics);
  writeNotNull('OptOut', instance.optOut);
  writeNotNull('RequestId', instance.requestId);
  writeNotNull('User', instance.user?.toJson());
  return val;
}

Map<String, dynamic> _$EndpointBatchRequestToJson(
    EndpointBatchRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Item', instance.item?.map((e) => e?.toJson())?.toList());
  return val;
}

EndpointDemographic _$EndpointDemographicFromJson(Map<String, dynamic> json) {
  return EndpointDemographic(
    appVersion: json['AppVersion'] as String,
    locale: json['Locale'] as String,
    make: json['Make'] as String,
    model: json['Model'] as String,
    modelVersion: json['ModelVersion'] as String,
    platform: json['Platform'] as String,
    platformVersion: json['PlatformVersion'] as String,
    timezone: json['Timezone'] as String,
  );
}

Map<String, dynamic> _$EndpointDemographicToJson(EndpointDemographic instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppVersion', instance.appVersion);
  writeNotNull('Locale', instance.locale);
  writeNotNull('Make', instance.make);
  writeNotNull('Model', instance.model);
  writeNotNull('ModelVersion', instance.modelVersion);
  writeNotNull('Platform', instance.platform);
  writeNotNull('PlatformVersion', instance.platformVersion);
  writeNotNull('Timezone', instance.timezone);
  return val;
}

EndpointItemResponse _$EndpointItemResponseFromJson(Map<String, dynamic> json) {
  return EndpointItemResponse(
    message: json['Message'] as String,
    statusCode: json['StatusCode'] as int,
  );
}

EndpointLocation _$EndpointLocationFromJson(Map<String, dynamic> json) {
  return EndpointLocation(
    city: json['City'] as String,
    country: json['Country'] as String,
    latitude: (json['Latitude'] as num)?.toDouble(),
    longitude: (json['Longitude'] as num)?.toDouble(),
    postalCode: json['PostalCode'] as String,
    region: json['Region'] as String,
  );
}

Map<String, dynamic> _$EndpointLocationToJson(EndpointLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('City', instance.city);
  writeNotNull('Country', instance.country);
  writeNotNull('Latitude', instance.latitude);
  writeNotNull('Longitude', instance.longitude);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('Region', instance.region);
  return val;
}

EndpointMessageResult _$EndpointMessageResultFromJson(
    Map<String, dynamic> json) {
  return EndpointMessageResult(
    deliveryStatus:
        _$enumDecodeNullable(_$DeliveryStatusEnumMap, json['DeliveryStatus']),
    statusCode: json['StatusCode'] as int,
    address: json['Address'] as String,
    messageId: json['MessageId'] as String,
    statusMessage: json['StatusMessage'] as String,
    updatedToken: json['UpdatedToken'] as String,
  );
}

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.successful: 'SUCCESSFUL',
  DeliveryStatus.throttled: 'THROTTLED',
  DeliveryStatus.temporaryFailure: 'TEMPORARY_FAILURE',
  DeliveryStatus.permanentFailure: 'PERMANENT_FAILURE',
  DeliveryStatus.unknownFailure: 'UNKNOWN_FAILURE',
  DeliveryStatus.optOut: 'OPT_OUT',
  DeliveryStatus.duplicate: 'DUPLICATE',
};

Map<String, dynamic> _$EndpointRequestToJson(EndpointRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('ChannelType', _$ChannelTypeEnumMap[instance.channelType]);
  writeNotNull('Demographic', instance.demographic?.toJson());
  writeNotNull('EffectiveDate', instance.effectiveDate);
  writeNotNull('EndpointStatus', instance.endpointStatus);
  writeNotNull('Location', instance.location?.toJson());
  writeNotNull('Metrics', instance.metrics);
  writeNotNull('OptOut', instance.optOut);
  writeNotNull('RequestId', instance.requestId);
  writeNotNull('User', instance.user?.toJson());
  return val;
}

EndpointResponse _$EndpointResponseFromJson(Map<String, dynamic> json) {
  return EndpointResponse(
    address: json['Address'] as String,
    applicationId: json['ApplicationId'] as String,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    channelType:
        _$enumDecodeNullable(_$ChannelTypeEnumMap, json['ChannelType']),
    cohortId: json['CohortId'] as String,
    creationDate: json['CreationDate'] as String,
    demographic: json['Demographic'] == null
        ? null
        : EndpointDemographic.fromJson(
            json['Demographic'] as Map<String, dynamic>),
    effectiveDate: json['EffectiveDate'] as String,
    endpointStatus: json['EndpointStatus'] as String,
    id: json['Id'] as String,
    location: json['Location'] == null
        ? null
        : EndpointLocation.fromJson(json['Location'] as Map<String, dynamic>),
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    optOut: json['OptOut'] as String,
    requestId: json['RequestId'] as String,
    user: json['User'] == null
        ? null
        : EndpointUser.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndpointSendConfigurationToJson(
    EndpointSendConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BodyOverride', instance.bodyOverride);
  writeNotNull('Context', instance.context);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('TitleOverride', instance.titleOverride);
  return val;
}

EndpointUser _$EndpointUserFromJson(Map<String, dynamic> json) {
  return EndpointUser(
    userAttributes: (json['UserAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    userId: json['UserId'] as String,
  );
}

Map<String, dynamic> _$EndpointUserToJson(EndpointUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserAttributes', instance.userAttributes);
  writeNotNull('UserId', instance.userId);
  return val;
}

EndpointsResponse _$EndpointsResponseFromJson(Map<String, dynamic> json) {
  return EndpointsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventType', instance.eventType);
  writeNotNull('Timestamp', instance.timestamp);
  writeNotNull('AppPackageName', instance.appPackageName);
  writeNotNull('AppTitle', instance.appTitle);
  writeNotNull('AppVersionCode', instance.appVersionCode);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('ClientSdkVersion', instance.clientSdkVersion);
  writeNotNull('Metrics', instance.metrics);
  writeNotNull('SdkName', instance.sdkName);
  writeNotNull('Session', instance.session?.toJson());
  return val;
}

EventCondition _$EventConditionFromJson(Map<String, dynamic> json) {
  return EventCondition(
    dimensions: json['Dimensions'] == null
        ? null
        : EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
    messageActivity: json['MessageActivity'] as String,
  );
}

Map<String, dynamic> _$EventConditionToJson(EventCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimensions', instance.dimensions?.toJson());
  writeNotNull('MessageActivity', instance.messageActivity);
  return val;
}

EventDimensions _$EventDimensionsFromJson(Map<String, dynamic> json) {
  return EventDimensions(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeDimension.fromJson(e as Map<String, dynamic>)),
    ),
    eventType: json['EventType'] == null
        ? null
        : SetDimension.fromJson(json['EventType'] as Map<String, dynamic>),
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MetricDimension.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$EventDimensionsToJson(EventDimensions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attributes',
      instance.attributes?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('EventType', instance.eventType?.toJson());
  writeNotNull(
      'Metrics', instance.metrics?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

EventFilter _$EventFilterFromJson(Map<String, dynamic> json) {
  return EventFilter(
    dimensions: json['Dimensions'] == null
        ? null
        : EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
    filterType: _$enumDecodeNullable(_$FilterTypeEnumMap, json['FilterType']),
  );
}

Map<String, dynamic> _$EventFilterToJson(EventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimensions', instance.dimensions?.toJson());
  writeNotNull('FilterType', _$FilterTypeEnumMap[instance.filterType]);
  return val;
}

EventItemResponse _$EventItemResponseFromJson(Map<String, dynamic> json) {
  return EventItemResponse(
    message: json['Message'] as String,
    statusCode: json['StatusCode'] as int,
  );
}

EventStartCondition _$EventStartConditionFromJson(Map<String, dynamic> json) {
  return EventStartCondition(
    eventFilter: json['EventFilter'] == null
        ? null
        : EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>),
    segmentId: json['SegmentId'] as String,
  );
}

Map<String, dynamic> _$EventStartConditionToJson(EventStartCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventFilter', instance.eventFilter?.toJson());
  writeNotNull('SegmentId', instance.segmentId);
  return val;
}

EventStream _$EventStreamFromJson(Map<String, dynamic> json) {
  return EventStream(
    applicationId: json['ApplicationId'] as String,
    destinationStreamArn: json['DestinationStreamArn'] as String,
    roleArn: json['RoleArn'] as String,
    externalId: json['ExternalId'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    lastUpdatedBy: json['LastUpdatedBy'] as String,
  );
}

Map<String, dynamic> _$EventsBatchToJson(EventsBatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Endpoint', instance.endpoint?.toJson());
  writeNotNull(
      'Events', instance.events?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

Map<String, dynamic> _$EventsRequestToJson(EventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BatchItem', instance.batchItem?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

EventsResponse _$EventsResponseFromJson(Map<String, dynamic> json) {
  return EventsResponse(
    results: (json['Results'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : ItemResponse.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ExportJobRequestToJson(ExportJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('S3UrlPrefix', instance.s3UrlPrefix);
  writeNotNull('SegmentId', instance.segmentId);
  writeNotNull('SegmentVersion', instance.segmentVersion);
  return val;
}

ExportJobResource _$ExportJobResourceFromJson(Map<String, dynamic> json) {
  return ExportJobResource(
    roleArn: json['RoleArn'] as String,
    s3UrlPrefix: json['S3UrlPrefix'] as String,
    segmentId: json['SegmentId'] as String,
    segmentVersion: json['SegmentVersion'] as int,
  );
}

ExportJobResponse _$ExportJobResponseFromJson(Map<String, dynamic> json) {
  return ExportJobResponse(
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    definition: json['Definition'] == null
        ? null
        : ExportJobResource.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    type: json['Type'] as String,
    completedPieces: json['CompletedPieces'] as int,
    completionDate: json['CompletionDate'] as String,
    failedPieces: json['FailedPieces'] as int,
    failures: (json['Failures'] as List)?.map((e) => e as String)?.toList(),
    totalFailures: json['TotalFailures'] as int,
    totalPieces: json['TotalPieces'] as int,
    totalProcessed: json['TotalProcessed'] as int,
  );
}

const _$JobStatusEnumMap = {
  JobStatus.created: 'CREATED',
  JobStatus.preparingForInitialization: 'PREPARING_FOR_INITIALIZATION',
  JobStatus.initializing: 'INITIALIZING',
  JobStatus.processing: 'PROCESSING',
  JobStatus.pendingJob: 'PENDING_JOB',
  JobStatus.completing: 'COMPLETING',
  JobStatus.completed: 'COMPLETED',
  JobStatus.failing: 'FAILING',
  JobStatus.failed: 'FAILED',
};

ExportJobsResponse _$ExportJobsResponseFromJson(Map<String, dynamic> json) {
  return ExportJobsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : ExportJobResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$GCMChannelRequestToJson(GCMChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

GCMChannelResponse _$GCMChannelResponseFromJson(Map<String, dynamic> json) {
  return GCMChannelResponse(
    credential: json['Credential'] as String,
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$GCMMessageToJson(GCMMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('CollapseKey', instance.collapseKey);
  writeNotNull('Data', instance.data);
  writeNotNull('IconReference', instance.iconReference);
  writeNotNull('ImageIconUrl', instance.imageIconUrl);
  writeNotNull('ImageUrl', instance.imageUrl);
  writeNotNull('Priority', instance.priority);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('RestrictedPackageName', instance.restrictedPackageName);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('SmallImageIconUrl', instance.smallImageIconUrl);
  writeNotNull('Sound', instance.sound);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('TimeToLive', instance.timeToLive);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

GPSCoordinates _$GPSCoordinatesFromJson(Map<String, dynamic> json) {
  return GPSCoordinates(
    latitude: (json['Latitude'] as num)?.toDouble(),
    longitude: (json['Longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GPSCoordinatesToJson(GPSCoordinates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Latitude', instance.latitude);
  writeNotNull('Longitude', instance.longitude);
  return val;
}

GPSPointDimension _$GPSPointDimensionFromJson(Map<String, dynamic> json) {
  return GPSPointDimension(
    coordinates: json['Coordinates'] == null
        ? null
        : GPSCoordinates.fromJson(json['Coordinates'] as Map<String, dynamic>),
    rangeInKilometers: (json['RangeInKilometers'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GPSPointDimensionToJson(GPSPointDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Coordinates', instance.coordinates?.toJson());
  writeNotNull('RangeInKilometers', instance.rangeInKilometers);
  return val;
}

GetAdmChannelResponse _$GetAdmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetAdmChannelResponse(
    aDMChannelResponse: json['ADMChannelResponse'] == null
        ? null
        : ADMChannelResponse.fromJson(
            json['ADMChannelResponse'] as Map<String, dynamic>),
  );
}

GetApnsChannelResponse _$GetApnsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetApnsChannelResponse(
    aPNSChannelResponse: json['APNSChannelResponse'] == null
        ? null
        : APNSChannelResponse.fromJson(
            json['APNSChannelResponse'] as Map<String, dynamic>),
  );
}

GetApnsSandboxChannelResponse _$GetApnsSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetApnsSandboxChannelResponse(
    aPNSSandboxChannelResponse: json['APNSSandboxChannelResponse'] == null
        ? null
        : APNSSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

GetApnsVoipChannelResponse _$GetApnsVoipChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetApnsVoipChannelResponse(
    aPNSVoipChannelResponse: json['APNSVoipChannelResponse'] == null
        ? null
        : APNSVoipChannelResponse.fromJson(
            json['APNSVoipChannelResponse'] as Map<String, dynamic>),
  );
}

GetApnsVoipSandboxChannelResponse _$GetApnsVoipSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetApnsVoipSandboxChannelResponse(
    aPNSVoipSandboxChannelResponse:
        json['APNSVoipSandboxChannelResponse'] == null
            ? null
            : APNSVoipSandboxChannelResponse.fromJson(
                json['APNSVoipSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

GetAppResponse _$GetAppResponseFromJson(Map<String, dynamic> json) {
  return GetAppResponse(
    applicationResponse: json['ApplicationResponse'] == null
        ? null
        : ApplicationResponse.fromJson(
            json['ApplicationResponse'] as Map<String, dynamic>),
  );
}

GetApplicationDateRangeKpiResponse _$GetApplicationDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return GetApplicationDateRangeKpiResponse(
    applicationDateRangeKpiResponse: json['ApplicationDateRangeKpiResponse'] ==
            null
        ? null
        : ApplicationDateRangeKpiResponse.fromJson(
            json['ApplicationDateRangeKpiResponse'] as Map<String, dynamic>),
  );
}

GetApplicationSettingsResponse _$GetApplicationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetApplicationSettingsResponse(
    applicationSettingsResource: json['ApplicationSettingsResource'] == null
        ? null
        : ApplicationSettingsResource.fromJson(
            json['ApplicationSettingsResource'] as Map<String, dynamic>),
  );
}

GetAppsResponse _$GetAppsResponseFromJson(Map<String, dynamic> json) {
  return GetAppsResponse(
    applicationsResponse: json['ApplicationsResponse'] == null
        ? null
        : ApplicationsResponse.fromJson(
            json['ApplicationsResponse'] as Map<String, dynamic>),
  );
}

GetBaiduChannelResponse _$GetBaiduChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetBaiduChannelResponse(
    baiduChannelResponse: json['BaiduChannelResponse'] == null
        ? null
        : BaiduChannelResponse.fromJson(
            json['BaiduChannelResponse'] as Map<String, dynamic>),
  );
}

GetCampaignActivitiesResponse _$GetCampaignActivitiesResponseFromJson(
    Map<String, dynamic> json) {
  return GetCampaignActivitiesResponse(
    activitiesResponse: json['ActivitiesResponse'] == null
        ? null
        : ActivitiesResponse.fromJson(
            json['ActivitiesResponse'] as Map<String, dynamic>),
  );
}

GetCampaignDateRangeKpiResponse _$GetCampaignDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return GetCampaignDateRangeKpiResponse(
    campaignDateRangeKpiResponse: json['CampaignDateRangeKpiResponse'] == null
        ? null
        : CampaignDateRangeKpiResponse.fromJson(
            json['CampaignDateRangeKpiResponse'] as Map<String, dynamic>),
  );
}

GetCampaignResponse _$GetCampaignResponseFromJson(Map<String, dynamic> json) {
  return GetCampaignResponse(
    campaignResponse: json['CampaignResponse'] == null
        ? null
        : CampaignResponse.fromJson(
            json['CampaignResponse'] as Map<String, dynamic>),
  );
}

GetCampaignVersionResponse _$GetCampaignVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetCampaignVersionResponse(
    campaignResponse: json['CampaignResponse'] == null
        ? null
        : CampaignResponse.fromJson(
            json['CampaignResponse'] as Map<String, dynamic>),
  );
}

GetCampaignVersionsResponse _$GetCampaignVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetCampaignVersionsResponse(
    campaignsResponse: json['CampaignsResponse'] == null
        ? null
        : CampaignsResponse.fromJson(
            json['CampaignsResponse'] as Map<String, dynamic>),
  );
}

GetCampaignsResponse _$GetCampaignsResponseFromJson(Map<String, dynamic> json) {
  return GetCampaignsResponse(
    campaignsResponse: json['CampaignsResponse'] == null
        ? null
        : CampaignsResponse.fromJson(
            json['CampaignsResponse'] as Map<String, dynamic>),
  );
}

GetChannelsResponse _$GetChannelsResponseFromJson(Map<String, dynamic> json) {
  return GetChannelsResponse(
    channelsResponse: json['ChannelsResponse'] == null
        ? null
        : ChannelsResponse.fromJson(
            json['ChannelsResponse'] as Map<String, dynamic>),
  );
}

GetEmailChannelResponse _$GetEmailChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetEmailChannelResponse(
    emailChannelResponse: json['EmailChannelResponse'] == null
        ? null
        : EmailChannelResponse.fromJson(
            json['EmailChannelResponse'] as Map<String, dynamic>),
  );
}

GetEmailTemplateResponse _$GetEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetEmailTemplateResponse(
    emailTemplateResponse: json['EmailTemplateResponse'] == null
        ? null
        : EmailTemplateResponse.fromJson(
            json['EmailTemplateResponse'] as Map<String, dynamic>),
  );
}

GetEndpointResponse _$GetEndpointResponseFromJson(Map<String, dynamic> json) {
  return GetEndpointResponse(
    endpointResponse: json['EndpointResponse'] == null
        ? null
        : EndpointResponse.fromJson(
            json['EndpointResponse'] as Map<String, dynamic>),
  );
}

GetEventStreamResponse _$GetEventStreamResponseFromJson(
    Map<String, dynamic> json) {
  return GetEventStreamResponse(
    eventStream: json['EventStream'] == null
        ? null
        : EventStream.fromJson(json['EventStream'] as Map<String, dynamic>),
  );
}

GetExportJobResponse _$GetExportJobResponseFromJson(Map<String, dynamic> json) {
  return GetExportJobResponse(
    exportJobResponse: json['ExportJobResponse'] == null
        ? null
        : ExportJobResponse.fromJson(
            json['ExportJobResponse'] as Map<String, dynamic>),
  );
}

GetExportJobsResponse _$GetExportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return GetExportJobsResponse(
    exportJobsResponse: json['ExportJobsResponse'] == null
        ? null
        : ExportJobsResponse.fromJson(
            json['ExportJobsResponse'] as Map<String, dynamic>),
  );
}

GetGcmChannelResponse _$GetGcmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetGcmChannelResponse(
    gCMChannelResponse: json['GCMChannelResponse'] == null
        ? null
        : GCMChannelResponse.fromJson(
            json['GCMChannelResponse'] as Map<String, dynamic>),
  );
}

GetImportJobResponse _$GetImportJobResponseFromJson(Map<String, dynamic> json) {
  return GetImportJobResponse(
    importJobResponse: json['ImportJobResponse'] == null
        ? null
        : ImportJobResponse.fromJson(
            json['ImportJobResponse'] as Map<String, dynamic>),
  );
}

GetImportJobsResponse _$GetImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return GetImportJobsResponse(
    importJobsResponse: json['ImportJobsResponse'] == null
        ? null
        : ImportJobsResponse.fromJson(
            json['ImportJobsResponse'] as Map<String, dynamic>),
  );
}

GetJourneyDateRangeKpiResponse _$GetJourneyDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return GetJourneyDateRangeKpiResponse(
    journeyDateRangeKpiResponse: json['JourneyDateRangeKpiResponse'] == null
        ? null
        : JourneyDateRangeKpiResponse.fromJson(
            json['JourneyDateRangeKpiResponse'] as Map<String, dynamic>),
  );
}

GetJourneyExecutionActivityMetricsResponse
    _$GetJourneyExecutionActivityMetricsResponseFromJson(
        Map<String, dynamic> json) {
  return GetJourneyExecutionActivityMetricsResponse(
    journeyExecutionActivityMetricsResponse:
        json['JourneyExecutionActivityMetricsResponse'] == null
            ? null
            : JourneyExecutionActivityMetricsResponse.fromJson(
                json['JourneyExecutionActivityMetricsResponse']
                    as Map<String, dynamic>),
  );
}

GetJourneyExecutionMetricsResponse _$GetJourneyExecutionMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return GetJourneyExecutionMetricsResponse(
    journeyExecutionMetricsResponse: json['JourneyExecutionMetricsResponse'] ==
            null
        ? null
        : JourneyExecutionMetricsResponse.fromJson(
            json['JourneyExecutionMetricsResponse'] as Map<String, dynamic>),
  );
}

GetJourneyResponse _$GetJourneyResponseFromJson(Map<String, dynamic> json) {
  return GetJourneyResponse(
    journeyResponse: json['JourneyResponse'] == null
        ? null
        : JourneyResponse.fromJson(
            json['JourneyResponse'] as Map<String, dynamic>),
  );
}

GetPushTemplateResponse _$GetPushTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetPushTemplateResponse(
    pushNotificationTemplateResponse:
        json['PushNotificationTemplateResponse'] == null
            ? null
            : PushNotificationTemplateResponse.fromJson(
                json['PushNotificationTemplateResponse']
                    as Map<String, dynamic>),
  );
}

GetRecommenderConfigurationResponse
    _$GetRecommenderConfigurationResponseFromJson(Map<String, dynamic> json) {
  return GetRecommenderConfigurationResponse(
    recommenderConfigurationResponse:
        json['RecommenderConfigurationResponse'] == null
            ? null
            : RecommenderConfigurationResponse.fromJson(
                json['RecommenderConfigurationResponse']
                    as Map<String, dynamic>),
  );
}

GetRecommenderConfigurationsResponse
    _$GetRecommenderConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return GetRecommenderConfigurationsResponse(
    listRecommenderConfigurationsResponse:
        json['ListRecommenderConfigurationsResponse'] == null
            ? null
            : ListRecommenderConfigurationsResponse.fromJson(
                json['ListRecommenderConfigurationsResponse']
                    as Map<String, dynamic>),
  );
}

GetSegmentExportJobsResponse _$GetSegmentExportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSegmentExportJobsResponse(
    exportJobsResponse: json['ExportJobsResponse'] == null
        ? null
        : ExportJobsResponse.fromJson(
            json['ExportJobsResponse'] as Map<String, dynamic>),
  );
}

GetSegmentImportJobsResponse _$GetSegmentImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSegmentImportJobsResponse(
    importJobsResponse: json['ImportJobsResponse'] == null
        ? null
        : ImportJobsResponse.fromJson(
            json['ImportJobsResponse'] as Map<String, dynamic>),
  );
}

GetSegmentResponse _$GetSegmentResponseFromJson(Map<String, dynamic> json) {
  return GetSegmentResponse(
    segmentResponse: json['SegmentResponse'] == null
        ? null
        : SegmentResponse.fromJson(
            json['SegmentResponse'] as Map<String, dynamic>),
  );
}

GetSegmentVersionResponse _$GetSegmentVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSegmentVersionResponse(
    segmentResponse: json['SegmentResponse'] == null
        ? null
        : SegmentResponse.fromJson(
            json['SegmentResponse'] as Map<String, dynamic>),
  );
}

GetSegmentVersionsResponse _$GetSegmentVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSegmentVersionsResponse(
    segmentsResponse: json['SegmentsResponse'] == null
        ? null
        : SegmentsResponse.fromJson(
            json['SegmentsResponse'] as Map<String, dynamic>),
  );
}

GetSegmentsResponse _$GetSegmentsResponseFromJson(Map<String, dynamic> json) {
  return GetSegmentsResponse(
    segmentsResponse: json['SegmentsResponse'] == null
        ? null
        : SegmentsResponse.fromJson(
            json['SegmentsResponse'] as Map<String, dynamic>),
  );
}

GetSmsChannelResponse _$GetSmsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetSmsChannelResponse(
    sMSChannelResponse: json['SMSChannelResponse'] == null
        ? null
        : SMSChannelResponse.fromJson(
            json['SMSChannelResponse'] as Map<String, dynamic>),
  );
}

GetSmsTemplateResponse _$GetSmsTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetSmsTemplateResponse(
    sMSTemplateResponse: json['SMSTemplateResponse'] == null
        ? null
        : SMSTemplateResponse.fromJson(
            json['SMSTemplateResponse'] as Map<String, dynamic>),
  );
}

GetUserEndpointsResponse _$GetUserEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserEndpointsResponse(
    endpointsResponse: json['EndpointsResponse'] == null
        ? null
        : EndpointsResponse.fromJson(
            json['EndpointsResponse'] as Map<String, dynamic>),
  );
}

GetVoiceChannelResponse _$GetVoiceChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetVoiceChannelResponse(
    voiceChannelResponse: json['VoiceChannelResponse'] == null
        ? null
        : VoiceChannelResponse.fromJson(
            json['VoiceChannelResponse'] as Map<String, dynamic>),
  );
}

GetVoiceTemplateResponse _$GetVoiceTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetVoiceTemplateResponse(
    voiceTemplateResponse: json['VoiceTemplateResponse'] == null
        ? null
        : VoiceTemplateResponse.fromJson(
            json['VoiceTemplateResponse'] as Map<String, dynamic>),
  );
}

HoldoutActivity _$HoldoutActivityFromJson(Map<String, dynamic> json) {
  return HoldoutActivity(
    percentage: json['Percentage'] as int,
    nextActivity: json['NextActivity'] as String,
  );
}

Map<String, dynamic> _$HoldoutActivityToJson(HoldoutActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Percentage', instance.percentage);
  writeNotNull('NextActivity', instance.nextActivity);
  return val;
}

Map<String, dynamic> _$ImportJobRequestToJson(ImportJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Format', _$FormatEnumMap[instance.format]);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('S3Url', instance.s3Url);
  writeNotNull('DefineSegment', instance.defineSegment);
  writeNotNull('ExternalId', instance.externalId);
  writeNotNull('RegisterEndpoints', instance.registerEndpoints);
  writeNotNull('SegmentId', instance.segmentId);
  writeNotNull('SegmentName', instance.segmentName);
  return val;
}

const _$FormatEnumMap = {
  Format.csv: 'CSV',
  Format.json: 'JSON',
};

ImportJobResource _$ImportJobResourceFromJson(Map<String, dynamic> json) {
  return ImportJobResource(
    format: _$enumDecodeNullable(_$FormatEnumMap, json['Format']),
    roleArn: json['RoleArn'] as String,
    s3Url: json['S3Url'] as String,
    defineSegment: json['DefineSegment'] as bool,
    externalId: json['ExternalId'] as String,
    registerEndpoints: json['RegisterEndpoints'] as bool,
    segmentId: json['SegmentId'] as String,
    segmentName: json['SegmentName'] as String,
  );
}

ImportJobResponse _$ImportJobResponseFromJson(Map<String, dynamic> json) {
  return ImportJobResponse(
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    definition: json['Definition'] == null
        ? null
        : ImportJobResource.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    type: json['Type'] as String,
    completedPieces: json['CompletedPieces'] as int,
    completionDate: json['CompletionDate'] as String,
    failedPieces: json['FailedPieces'] as int,
    failures: (json['Failures'] as List)?.map((e) => e as String)?.toList(),
    totalFailures: json['TotalFailures'] as int,
    totalPieces: json['TotalPieces'] as int,
    totalProcessed: json['TotalProcessed'] as int,
  );
}

ImportJobsResponse _$ImportJobsResponseFromJson(Map<String, dynamic> json) {
  return ImportJobsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : ImportJobResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) {
  return ItemResponse(
    endpointItemResponse: json['EndpointItemResponse'] == null
        ? null
        : EndpointItemResponse.fromJson(
            json['EndpointItemResponse'] as Map<String, dynamic>),
    eventsItemResponse:
        (json['EventsItemResponse'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : EventItemResponse.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

JourneyCustomMessage _$JourneyCustomMessageFromJson(Map<String, dynamic> json) {
  return JourneyCustomMessage(
    data: json['Data'] as String,
  );
}

Map<String, dynamic> _$JourneyCustomMessageToJson(
    JourneyCustomMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', instance.data);
  return val;
}

JourneyDateRangeKpiResponse _$JourneyDateRangeKpiResponseFromJson(
    Map<String, dynamic> json) {
  return JourneyDateRangeKpiResponse(
    applicationId: json['ApplicationId'] as String,
    endTime: const IsoDateTimeConverter().fromJson(json['EndTime']),
    journeyId: json['JourneyId'] as String,
    kpiName: json['KpiName'] as String,
    kpiResult: json['KpiResult'] == null
        ? null
        : BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
    startTime: const IsoDateTimeConverter().fromJson(json['StartTime']),
    nextToken: json['NextToken'] as String,
  );
}

JourneyEmailMessage _$JourneyEmailMessageFromJson(Map<String, dynamic> json) {
  return JourneyEmailMessage(
    fromAddress: json['FromAddress'] as String,
  );
}

Map<String, dynamic> _$JourneyEmailMessageToJson(JourneyEmailMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromAddress', instance.fromAddress);
  return val;
}

JourneyExecutionActivityMetricsResponse
    _$JourneyExecutionActivityMetricsResponseFromJson(
        Map<String, dynamic> json) {
  return JourneyExecutionActivityMetricsResponse(
    activityType: json['ActivityType'] as String,
    applicationId: json['ApplicationId'] as String,
    journeyActivityId: json['JourneyActivityId'] as String,
    journeyId: json['JourneyId'] as String,
    lastEvaluatedTime: json['LastEvaluatedTime'] as String,
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

JourneyExecutionMetricsResponse _$JourneyExecutionMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return JourneyExecutionMetricsResponse(
    applicationId: json['ApplicationId'] as String,
    journeyId: json['JourneyId'] as String,
    lastEvaluatedTime: json['LastEvaluatedTime'] as String,
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

JourneyLimits _$JourneyLimitsFromJson(Map<String, dynamic> json) {
  return JourneyLimits(
    dailyCap: json['DailyCap'] as int,
    endpointReentryCap: json['EndpointReentryCap'] as int,
    messagesPerSecond: json['MessagesPerSecond'] as int,
  );
}

Map<String, dynamic> _$JourneyLimitsToJson(JourneyLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DailyCap', instance.dailyCap);
  writeNotNull('EndpointReentryCap', instance.endpointReentryCap);
  writeNotNull('MessagesPerSecond', instance.messagesPerSecond);
  return val;
}

JourneyPushMessage _$JourneyPushMessageFromJson(Map<String, dynamic> json) {
  return JourneyPushMessage(
    timeToLive: json['TimeToLive'] as String,
  );
}

Map<String, dynamic> _$JourneyPushMessageToJson(JourneyPushMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TimeToLive', instance.timeToLive);
  return val;
}

JourneyResponse _$JourneyResponseFromJson(Map<String, dynamic> json) {
  return JourneyResponse(
    applicationId: json['ApplicationId'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    activities: (json['Activities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Activity.fromJson(e as Map<String, dynamic>)),
    ),
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    limits: json['Limits'] == null
        ? null
        : JourneyLimits.fromJson(json['Limits'] as Map<String, dynamic>),
    localTime: json['LocalTime'] as bool,
    quietTime: json['QuietTime'] == null
        ? null
        : QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>),
    refreshFrequency: json['RefreshFrequency'] as String,
    schedule: json['Schedule'] == null
        ? null
        : JourneySchedule.fromJson(json['Schedule'] as Map<String, dynamic>),
    startActivity: json['StartActivity'] as String,
    startCondition: json['StartCondition'] == null
        ? null
        : StartCondition.fromJson(
            json['StartCondition'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$StateEnumMap = {
  State.draft: 'DRAFT',
  State.active: 'ACTIVE',
  State.completed: 'COMPLETED',
  State.cancelled: 'CANCELLED',
  State.closed: 'CLOSED',
};

JourneySMSMessage _$JourneySMSMessageFromJson(Map<String, dynamic> json) {
  return JourneySMSMessage(
    messageType:
        _$enumDecodeNullable(_$MessageTypeEnumMap, json['MessageType']),
    senderId: json['SenderId'] as String,
  );
}

Map<String, dynamic> _$JourneySMSMessageToJson(JourneySMSMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  writeNotNull('SenderId', instance.senderId);
  return val;
}

JourneySchedule _$JourneyScheduleFromJson(Map<String, dynamic> json) {
  return JourneySchedule(
    endTime: const IsoDateTimeConverter().fromJson(json['EndTime']),
    startTime: const IsoDateTimeConverter().fromJson(json['StartTime']),
    timezone: json['Timezone'] as String,
  );
}

Map<String, dynamic> _$JourneyScheduleToJson(JourneySchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EndTime', const IsoDateTimeConverter().toJson(instance.endTime));
  writeNotNull(
      'StartTime', const IsoDateTimeConverter().toJson(instance.startTime));
  writeNotNull('Timezone', instance.timezone);
  return val;
}

Map<String, dynamic> _$JourneyStateRequestToJson(JourneyStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('State', _$StateEnumMap[instance.state]);
  return val;
}

JourneysResponse _$JourneysResponseFromJson(Map<String, dynamic> json) {
  return JourneysResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : JourneyResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJourneysResponse _$ListJourneysResponseFromJson(Map<String, dynamic> json) {
  return ListJourneysResponse(
    journeysResponse: json['JourneysResponse'] == null
        ? null
        : JourneysResponse.fromJson(
            json['JourneysResponse'] as Map<String, dynamic>),
  );
}

ListRecommenderConfigurationsResponse
    _$ListRecommenderConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return ListRecommenderConfigurationsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : RecommenderConfigurationResponse.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagsModel: json['TagsModel'] == null
        ? null
        : TagsModel.fromJson(json['TagsModel'] as Map<String, dynamic>),
  );
}

ListTemplateVersionsResponse _$ListTemplateVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTemplateVersionsResponse(
    templateVersionsResponse: json['TemplateVersionsResponse'] == null
        ? null
        : TemplateVersionsResponse.fromJson(
            json['TemplateVersionsResponse'] as Map<String, dynamic>),
  );
}

ListTemplatesResponse _$ListTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTemplatesResponse(
    templatesResponse: json['TemplatesResponse'] == null
        ? null
        : TemplatesResponse.fromJson(
            json['TemplatesResponse'] as Map<String, dynamic>),
  );
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    action: _$enumDecodeNullable(_$ActionEnumMap, json['Action']),
    body: json['Body'] as String,
    imageIconUrl: json['ImageIconUrl'] as String,
    imageSmallIconUrl: json['ImageSmallIconUrl'] as String,
    imageUrl: json['ImageUrl'] as String,
    jsonBody: json['JsonBody'] as String,
    mediaUrl: json['MediaUrl'] as String,
    rawContent: json['RawContent'] as String,
    silentPush: json['SilentPush'] as bool,
    timeToLive: json['TimeToLive'] as int,
    title: json['Title'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Body', instance.body);
  writeNotNull('ImageIconUrl', instance.imageIconUrl);
  writeNotNull('ImageSmallIconUrl', instance.imageSmallIconUrl);
  writeNotNull('ImageUrl', instance.imageUrl);
  writeNotNull('JsonBody', instance.jsonBody);
  writeNotNull('MediaUrl', instance.mediaUrl);
  writeNotNull('RawContent', instance.rawContent);
  writeNotNull('SilentPush', instance.silentPush);
  writeNotNull('TimeToLive', instance.timeToLive);
  writeNotNull('Title', instance.title);
  writeNotNull('Url', instance.url);
  return val;
}

MessageBody _$MessageBodyFromJson(Map<String, dynamic> json) {
  return MessageBody(
    message: json['Message'] as String,
    requestID: json['RequestID'] as String,
  );
}

MessageConfiguration _$MessageConfigurationFromJson(Map<String, dynamic> json) {
  return MessageConfiguration(
    aDMMessage: json['ADMMessage'] == null
        ? null
        : Message.fromJson(json['ADMMessage'] as Map<String, dynamic>),
    aPNSMessage: json['APNSMessage'] == null
        ? null
        : Message.fromJson(json['APNSMessage'] as Map<String, dynamic>),
    baiduMessage: json['BaiduMessage'] == null
        ? null
        : Message.fromJson(json['BaiduMessage'] as Map<String, dynamic>),
    customMessage: json['CustomMessage'] == null
        ? null
        : CampaignCustomMessage.fromJson(
            json['CustomMessage'] as Map<String, dynamic>),
    defaultMessage: json['DefaultMessage'] == null
        ? null
        : Message.fromJson(json['DefaultMessage'] as Map<String, dynamic>),
    emailMessage: json['EmailMessage'] == null
        ? null
        : CampaignEmailMessage.fromJson(
            json['EmailMessage'] as Map<String, dynamic>),
    gCMMessage: json['GCMMessage'] == null
        ? null
        : Message.fromJson(json['GCMMessage'] as Map<String, dynamic>),
    sMSMessage: json['SMSMessage'] == null
        ? null
        : CampaignSmsMessage.fromJson(
            json['SMSMessage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageConfigurationToJson(
    MessageConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADMMessage', instance.aDMMessage?.toJson());
  writeNotNull('APNSMessage', instance.aPNSMessage?.toJson());
  writeNotNull('BaiduMessage', instance.baiduMessage?.toJson());
  writeNotNull('CustomMessage', instance.customMessage?.toJson());
  writeNotNull('DefaultMessage', instance.defaultMessage?.toJson());
  writeNotNull('EmailMessage', instance.emailMessage?.toJson());
  writeNotNull('GCMMessage', instance.gCMMessage?.toJson());
  writeNotNull('SMSMessage', instance.sMSMessage?.toJson());
  return val;
}

Map<String, dynamic> _$MessageRequestToJson(MessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageConfiguration', instance.messageConfiguration?.toJson());
  writeNotNull(
      'Addresses', instance.addresses?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('Context', instance.context);
  writeNotNull(
      'Endpoints', instance.endpoints?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull(
      'TemplateConfiguration', instance.templateConfiguration?.toJson());
  writeNotNull('TraceId', instance.traceId);
  return val;
}

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return MessageResponse(
    applicationId: json['ApplicationId'] as String,
    endpointResult: (json['EndpointResult'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : EndpointMessageResult.fromJson(e as Map<String, dynamic>)),
    ),
    requestId: json['RequestId'] as String,
    result: (json['Result'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MessageResult.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

MessageResult _$MessageResultFromJson(Map<String, dynamic> json) {
  return MessageResult(
    deliveryStatus:
        _$enumDecodeNullable(_$DeliveryStatusEnumMap, json['DeliveryStatus']),
    statusCode: json['StatusCode'] as int,
    messageId: json['MessageId'] as String,
    statusMessage: json['StatusMessage'] as String,
    updatedToken: json['UpdatedToken'] as String,
  );
}

MetricDimension _$MetricDimensionFromJson(Map<String, dynamic> json) {
  return MetricDimension(
    comparisonOperator: json['ComparisonOperator'] as String,
    value: (json['Value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MetricDimensionToJson(MetricDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator', instance.comparisonOperator);
  writeNotNull('Value', instance.value);
  return val;
}

MultiConditionalBranch _$MultiConditionalBranchFromJson(
    Map<String, dynamic> json) {
  return MultiConditionalBranch(
    condition: json['Condition'] == null
        ? null
        : SimpleCondition.fromJson(json['Condition'] as Map<String, dynamic>),
    nextActivity: json['NextActivity'] as String,
  );
}

Map<String, dynamic> _$MultiConditionalBranchToJson(
    MultiConditionalBranch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Condition', instance.condition?.toJson());
  writeNotNull('NextActivity', instance.nextActivity);
  return val;
}

MultiConditionalSplitActivity _$MultiConditionalSplitActivityFromJson(
    Map<String, dynamic> json) {
  return MultiConditionalSplitActivity(
    branches: (json['Branches'] as List)
        ?.map((e) => e == null
            ? null
            : MultiConditionalBranch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    defaultActivity: json['DefaultActivity'] as String,
    evaluationWaitTime: json['EvaluationWaitTime'] == null
        ? null
        : WaitTime.fromJson(json['EvaluationWaitTime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MultiConditionalSplitActivityToJson(
    MultiConditionalSplitActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Branches', instance.branches?.map((e) => e?.toJson())?.toList());
  writeNotNull('DefaultActivity', instance.defaultActivity);
  writeNotNull('EvaluationWaitTime', instance.evaluationWaitTime?.toJson());
  return val;
}

Map<String, dynamic> _$NumberValidateRequestToJson(
    NumberValidateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IsoCountryCode', instance.isoCountryCode);
  writeNotNull('PhoneNumber', instance.phoneNumber);
  return val;
}

NumberValidateResponse _$NumberValidateResponseFromJson(
    Map<String, dynamic> json) {
  return NumberValidateResponse(
    carrier: json['Carrier'] as String,
    city: json['City'] as String,
    cleansedPhoneNumberE164: json['CleansedPhoneNumberE164'] as String,
    cleansedPhoneNumberNational: json['CleansedPhoneNumberNational'] as String,
    country: json['Country'] as String,
    countryCodeIso2: json['CountryCodeIso2'] as String,
    countryCodeNumeric: json['CountryCodeNumeric'] as String,
    county: json['County'] as String,
    originalCountryCodeIso2: json['OriginalCountryCodeIso2'] as String,
    originalPhoneNumber: json['OriginalPhoneNumber'] as String,
    phoneType: json['PhoneType'] as String,
    phoneTypeCode: json['PhoneTypeCode'] as int,
    timezone: json['Timezone'] as String,
    zipCode: json['ZipCode'] as String,
  );
}

PhoneNumberValidateResponse _$PhoneNumberValidateResponseFromJson(
    Map<String, dynamic> json) {
  return PhoneNumberValidateResponse(
    numberValidateResponse: json['NumberValidateResponse'] == null
        ? null
        : NumberValidateResponse.fromJson(
            json['NumberValidateResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PublicEndpointToJson(PublicEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('ChannelType', _$ChannelTypeEnumMap[instance.channelType]);
  writeNotNull('Demographic', instance.demographic?.toJson());
  writeNotNull('EffectiveDate', instance.effectiveDate);
  writeNotNull('EndpointStatus', instance.endpointStatus);
  writeNotNull('Location', instance.location?.toJson());
  writeNotNull('Metrics', instance.metrics);
  writeNotNull('OptOut', instance.optOut);
  writeNotNull('RequestId', instance.requestId);
  writeNotNull('User', instance.user?.toJson());
  return val;
}

PushMessageActivity _$PushMessageActivityFromJson(Map<String, dynamic> json) {
  return PushMessageActivity(
    messageConfig: json['MessageConfig'] == null
        ? null
        : JourneyPushMessage.fromJson(
            json['MessageConfig'] as Map<String, dynamic>),
    nextActivity: json['NextActivity'] as String,
    templateName: json['TemplateName'] as String,
    templateVersion: json['TemplateVersion'] as String,
  );
}

Map<String, dynamic> _$PushMessageActivityToJson(PushMessageActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageConfig', instance.messageConfig?.toJson());
  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('TemplateName', instance.templateName);
  writeNotNull('TemplateVersion', instance.templateVersion);
  return val;
}

Map<String, dynamic> _$PushNotificationTemplateRequestToJson(
    PushNotificationTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADM', instance.adm?.toJson());
  writeNotNull('APNS', instance.apns?.toJson());
  writeNotNull('Baidu', instance.baidu?.toJson());
  writeNotNull('Default', instance.defaultValue?.toJson());
  writeNotNull('DefaultSubstitutions', instance.defaultSubstitutions);
  writeNotNull('GCM', instance.gcm?.toJson());
  writeNotNull('RecommenderId', instance.recommenderId);
  writeNotNull('TemplateDescription', instance.templateDescription);
  writeNotNull('tags', instance.tags);
  return val;
}

PushNotificationTemplateResponse _$PushNotificationTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return PushNotificationTemplateResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType:
        _$enumDecodeNullable(_$TemplateTypeEnumMap, json['TemplateType']),
    adm: json['ADM'] == null
        ? null
        : AndroidPushNotificationTemplate.fromJson(
            json['ADM'] as Map<String, dynamic>),
    apns: json['APNS'] == null
        ? null
        : APNSPushNotificationTemplate.fromJson(
            json['APNS'] as Map<String, dynamic>),
    arn: json['Arn'] as String,
    baidu: json['Baidu'] == null
        ? null
        : AndroidPushNotificationTemplate.fromJson(
            json['Baidu'] as Map<String, dynamic>),
    defaultValue: json['Default'] == null
        ? null
        : DefaultPushNotificationTemplate.fromJson(
            json['Default'] as Map<String, dynamic>),
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    gcm: json['GCM'] == null
        ? null
        : AndroidPushNotificationTemplate.fromJson(
            json['GCM'] as Map<String, dynamic>),
    recommenderId: json['RecommenderId'] as String,
    templateDescription: json['TemplateDescription'] as String,
    version: json['Version'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PutEventStreamResponse _$PutEventStreamResponseFromJson(
    Map<String, dynamic> json) {
  return PutEventStreamResponse(
    eventStream: json['EventStream'] == null
        ? null
        : EventStream.fromJson(json['EventStream'] as Map<String, dynamic>),
  );
}

PutEventsResponse _$PutEventsResponseFromJson(Map<String, dynamic> json) {
  return PutEventsResponse(
    eventsResponse: json['EventsResponse'] == null
        ? null
        : EventsResponse.fromJson(
            json['EventsResponse'] as Map<String, dynamic>),
  );
}

QuietTime _$QuietTimeFromJson(Map<String, dynamic> json) {
  return QuietTime(
    end: json['End'] as String,
    start: json['Start'] as String,
  );
}

Map<String, dynamic> _$QuietTimeToJson(QuietTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('End', instance.end);
  writeNotNull('Start', instance.start);
  return val;
}

RandomSplitActivity _$RandomSplitActivityFromJson(Map<String, dynamic> json) {
  return RandomSplitActivity(
    branches: (json['Branches'] as List)
        ?.map((e) => e == null
            ? null
            : RandomSplitEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RandomSplitActivityToJson(RandomSplitActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Branches', instance.branches?.map((e) => e?.toJson())?.toList());
  return val;
}

RandomSplitEntry _$RandomSplitEntryFromJson(Map<String, dynamic> json) {
  return RandomSplitEntry(
    nextActivity: json['NextActivity'] as String,
    percentage: json['Percentage'] as int,
  );
}

Map<String, dynamic> _$RandomSplitEntryToJson(RandomSplitEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('Percentage', instance.percentage);
  return val;
}

Map<String, dynamic> _$RawEmailToJson(RawEmail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', const Uint8ListConverter().toJson(instance.data));
  return val;
}

RecencyDimension _$RecencyDimensionFromJson(Map<String, dynamic> json) {
  return RecencyDimension(
    duration: _$enumDecodeNullable(_$DurationEnumMap, json['Duration']),
    recencyType:
        _$enumDecodeNullable(_$RecencyTypeEnumMap, json['RecencyType']),
  );
}

Map<String, dynamic> _$RecencyDimensionToJson(RecencyDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Duration', _$DurationEnumMap[instance.duration]);
  writeNotNull('RecencyType', _$RecencyTypeEnumMap[instance.recencyType]);
  return val;
}

const _$DurationEnumMap = {
  Duration.hr_24: 'HR_24',
  Duration.day_7: 'DAY_7',
  Duration.day_14: 'DAY_14',
  Duration.day_30: 'DAY_30',
};

const _$RecencyTypeEnumMap = {
  RecencyType.active: 'ACTIVE',
  RecencyType.inactive: 'INACTIVE',
};

RecommenderConfigurationResponse _$RecommenderConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return RecommenderConfigurationResponse(
    creationDate: json['CreationDate'] as String,
    id: json['Id'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    recommendationProviderRoleArn:
        json['RecommendationProviderRoleArn'] as String,
    recommendationProviderUri: json['RecommendationProviderUri'] as String,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['Description'] as String,
    name: json['Name'] as String,
    recommendationProviderIdType:
        json['RecommendationProviderIdType'] as String,
    recommendationTransformerUri:
        json['RecommendationTransformerUri'] as String,
    recommendationsDisplayName: json['RecommendationsDisplayName'] as String,
    recommendationsPerMessage: json['RecommendationsPerMessage'] as int,
  );
}

RemoveAttributesResponse _$RemoveAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveAttributesResponse(
    attributesResource: json['AttributesResource'] == null
        ? null
        : AttributesResource.fromJson(
            json['AttributesResource'] as Map<String, dynamic>),
  );
}

ResultRow _$ResultRowFromJson(Map<String, dynamic> json) {
  return ResultRow(
    groupedBys: (json['GroupedBys'] as List)
        ?.map((e) => e == null
            ? null
            : ResultRowValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    values: (json['Values'] as List)
        ?.map((e) => e == null
            ? null
            : ResultRowValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResultRowValue _$ResultRowValueFromJson(Map<String, dynamic> json) {
  return ResultRowValue(
    key: json['Key'] as String,
    type: json['Type'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$SMSChannelRequestToJson(SMSChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('SenderId', instance.senderId);
  writeNotNull('ShortCode', instance.shortCode);
  return val;
}

SMSChannelResponse _$SMSChannelResponseFromJson(Map<String, dynamic> json) {
  return SMSChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    promotionalMessagesPerSecond: json['PromotionalMessagesPerSecond'] as int,
    senderId: json['SenderId'] as String,
    shortCode: json['ShortCode'] as String,
    transactionalMessagesPerSecond:
        json['TransactionalMessagesPerSecond'] as int,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$SMSMessageToJson(SMSMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('Keyword', instance.keyword);
  writeNotNull('MediaUrl', instance.mediaUrl);
  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  writeNotNull('OriginationNumber', instance.originationNumber);
  writeNotNull('SenderId', instance.senderId);
  writeNotNull('Substitutions', instance.substitutions);
  return val;
}

SMSMessageActivity _$SMSMessageActivityFromJson(Map<String, dynamic> json) {
  return SMSMessageActivity(
    messageConfig: json['MessageConfig'] == null
        ? null
        : JourneySMSMessage.fromJson(
            json['MessageConfig'] as Map<String, dynamic>),
    nextActivity: json['NextActivity'] as String,
    templateName: json['TemplateName'] as String,
    templateVersion: json['TemplateVersion'] as String,
  );
}

Map<String, dynamic> _$SMSMessageActivityToJson(SMSMessageActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageConfig', instance.messageConfig?.toJson());
  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('TemplateName', instance.templateName);
  writeNotNull('TemplateVersion', instance.templateVersion);
  return val;
}

Map<String, dynamic> _$SMSTemplateRequestToJson(SMSTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('DefaultSubstitutions', instance.defaultSubstitutions);
  writeNotNull('RecommenderId', instance.recommenderId);
  writeNotNull('TemplateDescription', instance.templateDescription);
  writeNotNull('tags', instance.tags);
  return val;
}

SMSTemplateResponse _$SMSTemplateResponseFromJson(Map<String, dynamic> json) {
  return SMSTemplateResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType:
        _$enumDecodeNullable(_$TemplateTypeEnumMap, json['TemplateType']),
    arn: json['Arn'] as String,
    body: json['Body'] as String,
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    recommenderId: json['RecommenderId'] as String,
    templateDescription: json['TemplateDescription'] as String,
    version: json['Version'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    startTime: json['StartTime'] as String,
    endTime: json['EndTime'] as String,
    eventFilter: json['EventFilter'] == null
        ? null
        : CampaignEventFilter.fromJson(
            json['EventFilter'] as Map<String, dynamic>),
    frequency: _$enumDecodeNullable(_$FrequencyEnumMap, json['Frequency']),
    isLocalTime: json['IsLocalTime'] as bool,
    quietTime: json['QuietTime'] == null
        ? null
        : QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>),
    timezone: json['Timezone'] as String,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartTime', instance.startTime);
  writeNotNull('EndTime', instance.endTime);
  writeNotNull('EventFilter', instance.eventFilter?.toJson());
  writeNotNull('Frequency', _$FrequencyEnumMap[instance.frequency]);
  writeNotNull('IsLocalTime', instance.isLocalTime);
  writeNotNull('QuietTime', instance.quietTime?.toJson());
  writeNotNull('Timezone', instance.timezone);
  return val;
}

const _$FrequencyEnumMap = {
  Frequency.once: 'ONCE',
  Frequency.hourly: 'HOURLY',
  Frequency.daily: 'DAILY',
  Frequency.weekly: 'WEEKLY',
  Frequency.monthly: 'MONTHLY',
  Frequency.event: 'EVENT',
};

SegmentBehaviors _$SegmentBehaviorsFromJson(Map<String, dynamic> json) {
  return SegmentBehaviors(
    recency: json['Recency'] == null
        ? null
        : RecencyDimension.fromJson(json['Recency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SegmentBehaviorsToJson(SegmentBehaviors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Recency', instance.recency?.toJson());
  return val;
}

SegmentCondition _$SegmentConditionFromJson(Map<String, dynamic> json) {
  return SegmentCondition(
    segmentId: json['SegmentId'] as String,
  );
}

Map<String, dynamic> _$SegmentConditionToJson(SegmentCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SegmentId', instance.segmentId);
  return val;
}

SegmentDemographics _$SegmentDemographicsFromJson(Map<String, dynamic> json) {
  return SegmentDemographics(
    appVersion: json['AppVersion'] == null
        ? null
        : SetDimension.fromJson(json['AppVersion'] as Map<String, dynamic>),
    channel: json['Channel'] == null
        ? null
        : SetDimension.fromJson(json['Channel'] as Map<String, dynamic>),
    deviceType: json['DeviceType'] == null
        ? null
        : SetDimension.fromJson(json['DeviceType'] as Map<String, dynamic>),
    make: json['Make'] == null
        ? null
        : SetDimension.fromJson(json['Make'] as Map<String, dynamic>),
    model: json['Model'] == null
        ? null
        : SetDimension.fromJson(json['Model'] as Map<String, dynamic>),
    platform: json['Platform'] == null
        ? null
        : SetDimension.fromJson(json['Platform'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SegmentDemographicsToJson(SegmentDemographics instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppVersion', instance.appVersion?.toJson());
  writeNotNull('Channel', instance.channel?.toJson());
  writeNotNull('DeviceType', instance.deviceType?.toJson());
  writeNotNull('Make', instance.make?.toJson());
  writeNotNull('Model', instance.model?.toJson());
  writeNotNull('Platform', instance.platform?.toJson());
  return val;
}

SegmentDimensions _$SegmentDimensionsFromJson(Map<String, dynamic> json) {
  return SegmentDimensions(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeDimension.fromJson(e as Map<String, dynamic>)),
    ),
    behavior: json['Behavior'] == null
        ? null
        : SegmentBehaviors.fromJson(json['Behavior'] as Map<String, dynamic>),
    demographic: json['Demographic'] == null
        ? null
        : SegmentDemographics.fromJson(
            json['Demographic'] as Map<String, dynamic>),
    location: json['Location'] == null
        ? null
        : SegmentLocation.fromJson(json['Location'] as Map<String, dynamic>),
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MetricDimension.fromJson(e as Map<String, dynamic>)),
    ),
    userAttributes: (json['UserAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeDimension.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$SegmentDimensionsToJson(SegmentDimensions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attributes',
      instance.attributes?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('Behavior', instance.behavior?.toJson());
  writeNotNull('Demographic', instance.demographic?.toJson());
  writeNotNull('Location', instance.location?.toJson());
  writeNotNull(
      'Metrics', instance.metrics?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('UserAttributes',
      instance.userAttributes?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

SegmentGroup _$SegmentGroupFromJson(Map<String, dynamic> json) {
  return SegmentGroup(
    dimensions: (json['Dimensions'] as List)
        ?.map((e) => e == null
            ? null
            : SegmentDimensions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceSegments: (json['SourceSegments'] as List)
        ?.map((e) => e == null
            ? null
            : SegmentReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['SourceType']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$SegmentGroupToJson(SegmentGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  writeNotNull('SourceSegments',
      instance.sourceSegments?.map((e) => e?.toJson())?.toList());
  writeNotNull('SourceType', _$SourceTypeEnumMap[instance.sourceType]);
  writeNotNull('Type', _$TypeEnumMap[instance.type]);
  return val;
}

const _$SourceTypeEnumMap = {
  SourceType.all: 'ALL',
  SourceType.any: 'ANY',
  SourceType.none: 'NONE',
};

const _$TypeEnumMap = {
  Type.all: 'ALL',
  Type.any: 'ANY',
  Type.none: 'NONE',
};

SegmentGroupList _$SegmentGroupListFromJson(Map<String, dynamic> json) {
  return SegmentGroupList(
    groups: (json['Groups'] as List)
        ?.map((e) =>
            e == null ? null : SegmentGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    include: _$enumDecodeNullable(_$IncludeEnumMap, json['Include']),
  );
}

Map<String, dynamic> _$SegmentGroupListToJson(SegmentGroupList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Groups', instance.groups?.map((e) => e?.toJson())?.toList());
  writeNotNull('Include', _$IncludeEnumMap[instance.include]);
  return val;
}

const _$IncludeEnumMap = {
  Include.all: 'ALL',
  Include.any: 'ANY',
  Include.none: 'NONE',
};

SegmentImportResource _$SegmentImportResourceFromJson(
    Map<String, dynamic> json) {
  return SegmentImportResource(
    externalId: json['ExternalId'] as String,
    format: _$enumDecodeNullable(_$FormatEnumMap, json['Format']),
    roleArn: json['RoleArn'] as String,
    s3Url: json['S3Url'] as String,
    size: json['Size'] as int,
    channelCounts: (json['ChannelCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

SegmentLocation _$SegmentLocationFromJson(Map<String, dynamic> json) {
  return SegmentLocation(
    country: json['Country'] == null
        ? null
        : SetDimension.fromJson(json['Country'] as Map<String, dynamic>),
    gPSPoint: json['GPSPoint'] == null
        ? null
        : GPSPointDimension.fromJson(json['GPSPoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SegmentLocationToJson(SegmentLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Country', instance.country?.toJson());
  writeNotNull('GPSPoint', instance.gPSPoint?.toJson());
  return val;
}

SegmentReference _$SegmentReferenceFromJson(Map<String, dynamic> json) {
  return SegmentReference(
    id: json['Id'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$SegmentReferenceToJson(SegmentReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Version', instance.version);
  return val;
}

SegmentResponse _$SegmentResponseFromJson(Map<String, dynamic> json) {
  return SegmentResponse(
    applicationId: json['ApplicationId'] as String,
    arn: json['Arn'] as String,
    creationDate: json['CreationDate'] as String,
    id: json['Id'] as String,
    segmentType:
        _$enumDecodeNullable(_$SegmentTypeEnumMap, json['SegmentType']),
    dimensions: json['Dimensions'] == null
        ? null
        : SegmentDimensions.fromJson(
            json['Dimensions'] as Map<String, dynamic>),
    importDefinition: json['ImportDefinition'] == null
        ? null
        : SegmentImportResource.fromJson(
            json['ImportDefinition'] as Map<String, dynamic>),
    lastModifiedDate: json['LastModifiedDate'] as String,
    name: json['Name'] as String,
    segmentGroups: json['SegmentGroups'] == null
        ? null
        : SegmentGroupList.fromJson(
            json['SegmentGroups'] as Map<String, dynamic>),
    version: json['Version'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$SegmentTypeEnumMap = {
  SegmentType.dimensional: 'DIMENSIONAL',
  SegmentType.import: 'IMPORT',
};

SegmentsResponse _$SegmentsResponseFromJson(Map<String, dynamic> json) {
  return SegmentsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : SegmentResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

SendMessagesResponse _$SendMessagesResponseFromJson(Map<String, dynamic> json) {
  return SendMessagesResponse(
    messageResponse: json['MessageResponse'] == null
        ? null
        : MessageResponse.fromJson(
            json['MessageResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SendUsersMessageRequestToJson(
    SendUsersMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageConfiguration', instance.messageConfiguration?.toJson());
  writeNotNull(
      'Users', instance.users?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('Context', instance.context);
  writeNotNull(
      'TemplateConfiguration', instance.templateConfiguration?.toJson());
  writeNotNull('TraceId', instance.traceId);
  return val;
}

SendUsersMessageResponse _$SendUsersMessageResponseFromJson(
    Map<String, dynamic> json) {
  return SendUsersMessageResponse(
    applicationId: json['ApplicationId'] as String,
    requestId: json['RequestId'] as String,
    result: (json['Result'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : EndpointMessageResult.fromJson(
                        e as Map<String, dynamic>)),
          )),
    ),
  );
}

SendUsersMessagesResponse _$SendUsersMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return SendUsersMessagesResponse(
    sendUsersMessageResponse: json['SendUsersMessageResponse'] == null
        ? null
        : SendUsersMessageResponse.fromJson(
            json['SendUsersMessageResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('StartTimestamp', instance.startTimestamp);
  writeNotNull('Duration', instance.duration);
  writeNotNull('StopTimestamp', instance.stopTimestamp);
  return val;
}

SetDimension _$SetDimensionFromJson(Map<String, dynamic> json) {
  return SetDimension(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
    dimensionType:
        _$enumDecodeNullable(_$DimensionTypeEnumMap, json['DimensionType']),
  );
}

Map<String, dynamic> _$SetDimensionToJson(SetDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  writeNotNull('DimensionType', _$DimensionTypeEnumMap[instance.dimensionType]);
  return val;
}

const _$DimensionTypeEnumMap = {
  DimensionType.inclusive: 'INCLUSIVE',
  DimensionType.exclusive: 'EXCLUSIVE',
};

SimpleCondition _$SimpleConditionFromJson(Map<String, dynamic> json) {
  return SimpleCondition(
    eventCondition: json['EventCondition'] == null
        ? null
        : EventCondition.fromJson(
            json['EventCondition'] as Map<String, dynamic>),
    segmentCondition: json['SegmentCondition'] == null
        ? null
        : SegmentCondition.fromJson(
            json['SegmentCondition'] as Map<String, dynamic>),
    segmentDimensions: json['segmentDimensions'] == null
        ? null
        : SegmentDimensions.fromJson(
            json['segmentDimensions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SimpleConditionToJson(SimpleCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventCondition', instance.eventCondition?.toJson());
  writeNotNull('SegmentCondition', instance.segmentCondition?.toJson());
  writeNotNull('segmentDimensions', instance.segmentDimensions?.toJson());
  return val;
}

Map<String, dynamic> _$SimpleEmailToJson(SimpleEmail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HtmlPart', instance.htmlPart?.toJson());
  writeNotNull('Subject', instance.subject?.toJson());
  writeNotNull('TextPart', instance.textPart?.toJson());
  return val;
}

Map<String, dynamic> _$SimpleEmailPartToJson(SimpleEmailPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Charset', instance.charset);
  writeNotNull('Data', instance.data);
  return val;
}

StartCondition _$StartConditionFromJson(Map<String, dynamic> json) {
  return StartCondition(
    description: json['Description'] as String,
    eventStartCondition: json['EventStartCondition'] == null
        ? null
        : EventStartCondition.fromJson(
            json['EventStartCondition'] as Map<String, dynamic>),
    segmentStartCondition: json['SegmentStartCondition'] == null
        ? null
        : SegmentCondition.fromJson(
            json['SegmentStartCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartConditionToJson(StartCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('EventStartCondition', instance.eventStartCondition?.toJson());
  writeNotNull(
      'SegmentStartCondition', instance.segmentStartCondition?.toJson());
  return val;
}

TagsModel _$TagsModelFromJson(Map<String, dynamic> json) {
  return TagsModel(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TagsModelToJson(TagsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  return val;
}

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return Template(
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$TemplateToJson(Template instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$TemplateActiveVersionRequestToJson(
    TemplateActiveVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Version', instance.version);
  return val;
}

TemplateConfiguration _$TemplateConfigurationFromJson(
    Map<String, dynamic> json) {
  return TemplateConfiguration(
    emailTemplate: json['EmailTemplate'] == null
        ? null
        : Template.fromJson(json['EmailTemplate'] as Map<String, dynamic>),
    pushTemplate: json['PushTemplate'] == null
        ? null
        : Template.fromJson(json['PushTemplate'] as Map<String, dynamic>),
    sMSTemplate: json['SMSTemplate'] == null
        ? null
        : Template.fromJson(json['SMSTemplate'] as Map<String, dynamic>),
    voiceTemplate: json['VoiceTemplate'] == null
        ? null
        : Template.fromJson(json['VoiceTemplate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TemplateConfigurationToJson(
    TemplateConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmailTemplate', instance.emailTemplate?.toJson());
  writeNotNull('PushTemplate', instance.pushTemplate?.toJson());
  writeNotNull('SMSTemplate', instance.sMSTemplate?.toJson());
  writeNotNull('VoiceTemplate', instance.voiceTemplate?.toJson());
  return val;
}

TemplateResponse _$TemplateResponseFromJson(Map<String, dynamic> json) {
  return TemplateResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType:
        _$enumDecodeNullable(_$TemplateTypeEnumMap, json['TemplateType']),
    arn: json['Arn'] as String,
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    templateDescription: json['TemplateDescription'] as String,
    version: json['Version'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

TemplateVersionResponse _$TemplateVersionResponseFromJson(
    Map<String, dynamic> json) {
  return TemplateVersionResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType: json['TemplateType'] as String,
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    templateDescription: json['TemplateDescription'] as String,
    version: json['Version'] as String,
  );
}

TemplateVersionsResponse _$TemplateVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return TemplateVersionsResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateVersionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['Message'] as String,
    nextToken: json['NextToken'] as String,
    requestID: json['RequestID'] as String,
  );
}

TemplatesResponse _$TemplatesResponseFromJson(Map<String, dynamic> json) {
  return TemplatesResponse(
    item: (json['Item'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

TreatmentResource _$TreatmentResourceFromJson(Map<String, dynamic> json) {
  return TreatmentResource(
    id: json['Id'] as String,
    sizePercent: json['SizePercent'] as int,
    customDeliveryConfiguration: json['CustomDeliveryConfiguration'] == null
        ? null
        : CustomDeliveryConfiguration.fromJson(
            json['CustomDeliveryConfiguration'] as Map<String, dynamic>),
    messageConfiguration: json['MessageConfiguration'] == null
        ? null
        : MessageConfiguration.fromJson(
            json['MessageConfiguration'] as Map<String, dynamic>),
    schedule: json['Schedule'] == null
        ? null
        : Schedule.fromJson(json['Schedule'] as Map<String, dynamic>),
    state: json['State'] == null
        ? null
        : CampaignState.fromJson(json['State'] as Map<String, dynamic>),
    templateConfiguration: json['TemplateConfiguration'] == null
        ? null
        : TemplateConfiguration.fromJson(
            json['TemplateConfiguration'] as Map<String, dynamic>),
    treatmentDescription: json['TreatmentDescription'] as String,
    treatmentName: json['TreatmentName'] as String,
  );
}

UpdateAdmChannelResponse _$UpdateAdmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAdmChannelResponse(
    aDMChannelResponse: json['ADMChannelResponse'] == null
        ? null
        : ADMChannelResponse.fromJson(
            json['ADMChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateApnsChannelResponse _$UpdateApnsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApnsChannelResponse(
    aPNSChannelResponse: json['APNSChannelResponse'] == null
        ? null
        : APNSChannelResponse.fromJson(
            json['APNSChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateApnsSandboxChannelResponse _$UpdateApnsSandboxChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApnsSandboxChannelResponse(
    aPNSSandboxChannelResponse: json['APNSSandboxChannelResponse'] == null
        ? null
        : APNSSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateApnsVoipChannelResponse _$UpdateApnsVoipChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApnsVoipChannelResponse(
    aPNSVoipChannelResponse: json['APNSVoipChannelResponse'] == null
        ? null
        : APNSVoipChannelResponse.fromJson(
            json['APNSVoipChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateApnsVoipSandboxChannelResponse
    _$UpdateApnsVoipSandboxChannelResponseFromJson(Map<String, dynamic> json) {
  return UpdateApnsVoipSandboxChannelResponse(
    aPNSVoipSandboxChannelResponse:
        json['APNSVoipSandboxChannelResponse'] == null
            ? null
            : APNSVoipSandboxChannelResponse.fromJson(
                json['APNSVoipSandboxChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateApplicationSettingsResponse _$UpdateApplicationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationSettingsResponse(
    applicationSettingsResource: json['ApplicationSettingsResource'] == null
        ? null
        : ApplicationSettingsResource.fromJson(
            json['ApplicationSettingsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateAttributesRequestToJson(
    UpdateAttributesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Blacklist', instance.blacklist);
  return val;
}

UpdateBaiduChannelResponse _$UpdateBaiduChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBaiduChannelResponse(
    baiduChannelResponse: json['BaiduChannelResponse'] == null
        ? null
        : BaiduChannelResponse.fromJson(
            json['BaiduChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateCampaignResponse _$UpdateCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCampaignResponse(
    campaignResponse: json['CampaignResponse'] == null
        ? null
        : CampaignResponse.fromJson(
            json['CampaignResponse'] as Map<String, dynamic>),
  );
}

UpdateEmailChannelResponse _$UpdateEmailChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEmailChannelResponse(
    emailChannelResponse: json['EmailChannelResponse'] == null
        ? null
        : EmailChannelResponse.fromJson(
            json['EmailChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateEmailTemplateResponse _$UpdateEmailTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEmailTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

UpdateEndpointResponse _$UpdateEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEndpointResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

UpdateEndpointsBatchResponse _$UpdateEndpointsBatchResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEndpointsBatchResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

UpdateGcmChannelResponse _$UpdateGcmChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGcmChannelResponse(
    gCMChannelResponse: json['GCMChannelResponse'] == null
        ? null
        : GCMChannelResponse.fromJson(
            json['GCMChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateJourneyResponse _$UpdateJourneyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateJourneyResponse(
    journeyResponse: json['JourneyResponse'] == null
        ? null
        : JourneyResponse.fromJson(
            json['JourneyResponse'] as Map<String, dynamic>),
  );
}

UpdateJourneyStateResponse _$UpdateJourneyStateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateJourneyStateResponse(
    journeyResponse: json['JourneyResponse'] == null
        ? null
        : JourneyResponse.fromJson(
            json['JourneyResponse'] as Map<String, dynamic>),
  );
}

UpdatePushTemplateResponse _$UpdatePushTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePushTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateRecommenderConfigurationToJson(
    UpdateRecommenderConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RecommendationProviderRoleArn', instance.recommendationProviderRoleArn);
  writeNotNull('RecommendationProviderUri', instance.recommendationProviderUri);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull(
      'RecommendationProviderIdType', instance.recommendationProviderIdType);
  writeNotNull(
      'RecommendationTransformerUri', instance.recommendationTransformerUri);
  writeNotNull(
      'RecommendationsDisplayName', instance.recommendationsDisplayName);
  writeNotNull('RecommendationsPerMessage', instance.recommendationsPerMessage);
  return val;
}

UpdateRecommenderConfigurationResponse
    _$UpdateRecommenderConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateRecommenderConfigurationResponse(
    recommenderConfigurationResponse:
        json['RecommenderConfigurationResponse'] == null
            ? null
            : RecommenderConfigurationResponse.fromJson(
                json['RecommenderConfigurationResponse']
                    as Map<String, dynamic>),
  );
}

UpdateSegmentResponse _$UpdateSegmentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSegmentResponse(
    segmentResponse: json['SegmentResponse'] == null
        ? null
        : SegmentResponse.fromJson(
            json['SegmentResponse'] as Map<String, dynamic>),
  );
}

UpdateSmsChannelResponse _$UpdateSmsChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSmsChannelResponse(
    sMSChannelResponse: json['SMSChannelResponse'] == null
        ? null
        : SMSChannelResponse.fromJson(
            json['SMSChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateSmsTemplateResponse _$UpdateSmsTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSmsTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

UpdateTemplateActiveVersionResponse
    _$UpdateTemplateActiveVersionResponseFromJson(Map<String, dynamic> json) {
  return UpdateTemplateActiveVersionResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

UpdateVoiceChannelResponse _$UpdateVoiceChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVoiceChannelResponse(
    voiceChannelResponse: json['VoiceChannelResponse'] == null
        ? null
        : VoiceChannelResponse.fromJson(
            json['VoiceChannelResponse'] as Map<String, dynamic>),
  );
}

UpdateVoiceTemplateResponse _$UpdateVoiceTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVoiceTemplateResponse(
    messageBody: json['MessageBody'] == null
        ? null
        : MessageBody.fromJson(json['MessageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VoiceChannelRequestToJson(VoiceChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

VoiceChannelResponse _$VoiceChannelResponseFromJson(Map<String, dynamic> json) {
  return VoiceChannelResponse(
    platform: json['Platform'] as String,
    applicationId: json['ApplicationId'] as String,
    creationDate: json['CreationDate'] as String,
    enabled: json['Enabled'] as bool,
    hasCredential: json['HasCredential'] as bool,
    id: json['Id'] as String,
    isArchived: json['IsArchived'] as bool,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$VoiceMessageToJson(VoiceMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('OriginationNumber', instance.originationNumber);
  writeNotNull('Substitutions', instance.substitutions);
  writeNotNull('VoiceId', instance.voiceId);
  return val;
}

Map<String, dynamic> _$VoiceTemplateRequestToJson(
    VoiceTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Body', instance.body);
  writeNotNull('DefaultSubstitutions', instance.defaultSubstitutions);
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('TemplateDescription', instance.templateDescription);
  writeNotNull('VoiceId', instance.voiceId);
  writeNotNull('tags', instance.tags);
  return val;
}

VoiceTemplateResponse _$VoiceTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return VoiceTemplateResponse(
    creationDate: json['CreationDate'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    templateName: json['TemplateName'] as String,
    templateType:
        _$enumDecodeNullable(_$TemplateTypeEnumMap, json['TemplateType']),
    arn: json['Arn'] as String,
    body: json['Body'] as String,
    defaultSubstitutions: json['DefaultSubstitutions'] as String,
    languageCode: json['LanguageCode'] as String,
    templateDescription: json['TemplateDescription'] as String,
    version: json['Version'] as String,
    voiceId: json['VoiceId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

WaitActivity _$WaitActivityFromJson(Map<String, dynamic> json) {
  return WaitActivity(
    nextActivity: json['NextActivity'] as String,
    waitTime: json['WaitTime'] == null
        ? null
        : WaitTime.fromJson(json['WaitTime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WaitActivityToJson(WaitActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextActivity', instance.nextActivity);
  writeNotNull('WaitTime', instance.waitTime?.toJson());
  return val;
}

WaitTime _$WaitTimeFromJson(Map<String, dynamic> json) {
  return WaitTime(
    waitFor: json['WaitFor'] as String,
    waitUntil: json['WaitUntil'] as String,
  );
}

Map<String, dynamic> _$WaitTimeToJson(WaitTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WaitFor', instance.waitFor);
  writeNotNull('WaitUntil', instance.waitUntil);
  return val;
}

Map<String, dynamic> _$WriteApplicationSettingsRequestToJson(
    WriteApplicationSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CampaignHook', instance.campaignHook?.toJson());
  writeNotNull('CloudWatchMetricsEnabled', instance.cloudWatchMetricsEnabled);
  writeNotNull('EventTaggingEnabled', instance.eventTaggingEnabled);
  writeNotNull('Limits', instance.limits?.toJson());
  writeNotNull('QuietTime', instance.quietTime?.toJson());
  return val;
}

Map<String, dynamic> _$WriteCampaignRequestToJson(
    WriteCampaignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdditionalTreatments',
      instance.additionalTreatments?.map((e) => e?.toJson())?.toList());
  writeNotNull('CustomDeliveryConfiguration',
      instance.customDeliveryConfiguration?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('HoldoutPercent', instance.holdoutPercent);
  writeNotNull('Hook', instance.hook?.toJson());
  writeNotNull('IsPaused', instance.isPaused);
  writeNotNull('Limits', instance.limits?.toJson());
  writeNotNull('MessageConfiguration', instance.messageConfiguration?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('Schedule', instance.schedule?.toJson());
  writeNotNull('SegmentId', instance.segmentId);
  writeNotNull('SegmentVersion', instance.segmentVersion);
  writeNotNull(
      'TemplateConfiguration', instance.templateConfiguration?.toJson());
  writeNotNull('TreatmentDescription', instance.treatmentDescription);
  writeNotNull('TreatmentName', instance.treatmentName);
  writeNotNull('tags', instance.tags);
  return val;
}

Map<String, dynamic> _$WriteEventStreamToJson(WriteEventStream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationStreamArn', instance.destinationStreamArn);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

Map<String, dynamic> _$WriteJourneyRequestToJson(WriteJourneyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Activities',
      instance.activities?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('CreationDate', instance.creationDate);
  writeNotNull('LastModifiedDate', instance.lastModifiedDate);
  writeNotNull('Limits', instance.limits?.toJson());
  writeNotNull('LocalTime', instance.localTime);
  writeNotNull('QuietTime', instance.quietTime?.toJson());
  writeNotNull('RefreshFrequency', instance.refreshFrequency);
  writeNotNull('Schedule', instance.schedule?.toJson());
  writeNotNull('StartActivity', instance.startActivity);
  writeNotNull('StartCondition', instance.startCondition?.toJson());
  writeNotNull('State', _$StateEnumMap[instance.state]);
  return val;
}

Map<String, dynamic> _$WriteSegmentRequestToJson(WriteSegmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimensions', instance.dimensions?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('SegmentGroups', instance.segmentGroups?.toJson());
  writeNotNull('tags', instance.tags);
  return val;
}

Map<String, dynamic> _$WriteTreatmentResourceToJson(
    WriteTreatmentResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SizePercent', instance.sizePercent);
  writeNotNull('CustomDeliveryConfiguration',
      instance.customDeliveryConfiguration?.toJson());
  writeNotNull('MessageConfiguration', instance.messageConfiguration?.toJson());
  writeNotNull('Schedule', instance.schedule?.toJson());
  writeNotNull(
      'TemplateConfiguration', instance.templateConfiguration?.toJson());
  writeNotNull('TreatmentDescription', instance.treatmentDescription);
  writeNotNull('TreatmentName', instance.treatmentName);
  return val;
}
