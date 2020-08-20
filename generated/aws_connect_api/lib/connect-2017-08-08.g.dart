// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect-2017-08-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  writeNotNull('ContentType', instance.contentType);
  return val;
}

ContactFlowSummary _$ContactFlowSummaryFromJson(Map<String, dynamic> json) {
  return ContactFlowSummary(
    arn: json['Arn'] as String,
    contactFlowType:
        _$enumDecodeNullable(_$ContactFlowTypeEnumMap, json['ContactFlowType']),
    id: json['Id'] as String,
    name: json['Name'] as String,
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

const _$ContactFlowTypeEnumMap = {
  ContactFlowType.contactFlow: 'CONTACT_FLOW',
  ContactFlowType.customerQueue: 'CUSTOMER_QUEUE',
  ContactFlowType.customerHold: 'CUSTOMER_HOLD',
  ContactFlowType.customerWhisper: 'CUSTOMER_WHISPER',
  ContactFlowType.agentHold: 'AGENT_HOLD',
  ContactFlowType.agentWhisper: 'AGENT_WHISPER',
  ContactFlowType.outboundWhisper: 'OUTBOUND_WHISPER',
  ContactFlowType.agentTransfer: 'AGENT_TRANSFER',
  ContactFlowType.queueTransfer: 'QUEUE_TRANSFER',
};

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    userArn: json['UserArn'] as String,
    userId: json['UserId'] as String,
  );
}

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return Credentials(
    accessToken: json['AccessToken'] as String,
    accessTokenExpiration: unixTimestampFromJson(json['AccessTokenExpiration']),
    refreshToken: json['RefreshToken'] as String,
    refreshTokenExpiration:
        unixTimestampFromJson(json['RefreshTokenExpiration']),
  );
}

CurrentMetric _$CurrentMetricFromJson(Map<String, dynamic> json) {
  return CurrentMetric(
    name: _$enumDecodeNullable(_$CurrentMetricNameEnumMap, json['Name']),
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
  );
}

Map<String, dynamic> _$CurrentMetricToJson(CurrentMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$CurrentMetricNameEnumMap[instance.name]);
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  return val;
}

const _$CurrentMetricNameEnumMap = {
  CurrentMetricName.agentsOnline: 'AGENTS_ONLINE',
  CurrentMetricName.agentsAvailable: 'AGENTS_AVAILABLE',
  CurrentMetricName.agentsOnCall: 'AGENTS_ON_CALL',
  CurrentMetricName.agentsNonProductive: 'AGENTS_NON_PRODUCTIVE',
  CurrentMetricName.agentsAfterContactWork: 'AGENTS_AFTER_CONTACT_WORK',
  CurrentMetricName.agentsError: 'AGENTS_ERROR',
  CurrentMetricName.agentsStaffed: 'AGENTS_STAFFED',
  CurrentMetricName.contactsInQueue: 'CONTACTS_IN_QUEUE',
  CurrentMetricName.oldestContactAge: 'OLDEST_CONTACT_AGE',
  CurrentMetricName.contactsScheduled: 'CONTACTS_SCHEDULED',
  CurrentMetricName.agentsOnContact: 'AGENTS_ON_CONTACT',
  CurrentMetricName.slotsActive: 'SLOTS_ACTIVE',
  CurrentMetricName.slotsAvailable: 'SLOTS_AVAILABLE',
};

const _$UnitEnumMap = {
  Unit.seconds: 'SECONDS',
  Unit.count: 'COUNT',
  Unit.percent: 'PERCENT',
};

CurrentMetricData _$CurrentMetricDataFromJson(Map<String, dynamic> json) {
  return CurrentMetricData(
    metric: json['Metric'] == null
        ? null
        : CurrentMetric.fromJson(json['Metric'] as Map<String, dynamic>),
    value: (json['Value'] as num)?.toDouble(),
  );
}

CurrentMetricResult _$CurrentMetricResultFromJson(Map<String, dynamic> json) {
  return CurrentMetricResult(
    collections: (json['Collections'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentMetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dimensions: json['Dimensions'] == null
        ? null
        : Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
  );
}

DescribeUserHierarchyGroupResponse _$DescribeUserHierarchyGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserHierarchyGroupResponse(
    hierarchyGroup: json['HierarchyGroup'] == null
        ? null
        : HierarchyGroup.fromJson(
            json['HierarchyGroup'] as Map<String, dynamic>),
  );
}

DescribeUserHierarchyStructureResponse
    _$DescribeUserHierarchyStructureResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeUserHierarchyStructureResponse(
    hierarchyStructure: json['HierarchyStructure'] == null
        ? null
        : HierarchyStructure.fromJson(
            json['HierarchyStructure'] as Map<String, dynamic>),
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) {
  return Dimensions(
    channel: _$enumDecodeNullable(_$ChannelEnumMap, json['Channel']),
    queue: json['Queue'] == null
        ? null
        : QueueReference.fromJson(json['Queue'] as Map<String, dynamic>),
  );
}

const _$ChannelEnumMap = {
  Channel.voice: 'VOICE',
  Channel.chat: 'CHAT',
};

Map<String, dynamic> _$FiltersToJson(Filters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Channels', instance.channels);
  writeNotNull('Queues', instance.queues);
  return val;
}

GetContactAttributesResponse _$GetContactAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return GetContactAttributesResponse(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetCurrentMetricDataResponse _$GetCurrentMetricDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetCurrentMetricDataResponse(
    dataSnapshotTime: unixTimestampFromJson(json['DataSnapshotTime']),
    metricResults: (json['MetricResults'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentMetricResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetFederationTokenResponse _$GetFederationTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetFederationTokenResponse(
    credentials: json['Credentials'] == null
        ? null
        : Credentials.fromJson(json['Credentials'] as Map<String, dynamic>),
  );
}

GetMetricDataResponse _$GetMetricDataResponseFromJson(
    Map<String, dynamic> json) {
  return GetMetricDataResponse(
    metricResults: (json['MetricResults'] as List)
        ?.map((e) => e == null
            ? null
            : HistoricalMetricResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

HierarchyGroup _$HierarchyGroupFromJson(Map<String, dynamic> json) {
  return HierarchyGroup(
    arn: json['Arn'] as String,
    hierarchyPath: json['HierarchyPath'] == null
        ? null
        : HierarchyPath.fromJson(json['HierarchyPath'] as Map<String, dynamic>),
    id: json['Id'] as String,
    levelId: json['LevelId'] as String,
    name: json['Name'] as String,
  );
}

HierarchyGroupSummary _$HierarchyGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return HierarchyGroupSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

HierarchyLevel _$HierarchyLevelFromJson(Map<String, dynamic> json) {
  return HierarchyLevel(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

HierarchyPath _$HierarchyPathFromJson(Map<String, dynamic> json) {
  return HierarchyPath(
    levelFive: json['LevelFive'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelFive'] as Map<String, dynamic>),
    levelFour: json['LevelFour'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelFour'] as Map<String, dynamic>),
    levelOne: json['LevelOne'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelOne'] as Map<String, dynamic>),
    levelThree: json['LevelThree'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelThree'] as Map<String, dynamic>),
    levelTwo: json['LevelTwo'] == null
        ? null
        : HierarchyGroupSummary.fromJson(
            json['LevelTwo'] as Map<String, dynamic>),
  );
}

HierarchyStructure _$HierarchyStructureFromJson(Map<String, dynamic> json) {
  return HierarchyStructure(
    levelFive: json['LevelFive'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelFive'] as Map<String, dynamic>),
    levelFour: json['LevelFour'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelFour'] as Map<String, dynamic>),
    levelOne: json['LevelOne'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelOne'] as Map<String, dynamic>),
    levelThree: json['LevelThree'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelThree'] as Map<String, dynamic>),
    levelTwo: json['LevelTwo'] == null
        ? null
        : HierarchyLevel.fromJson(json['LevelTwo'] as Map<String, dynamic>),
  );
}

HistoricalMetric _$HistoricalMetricFromJson(Map<String, dynamic> json) {
  return HistoricalMetric(
    name: _$enumDecodeNullable(_$HistoricalMetricNameEnumMap, json['Name']),
    statistic: _$enumDecodeNullable(_$StatisticEnumMap, json['Statistic']),
    threshold: json['Threshold'] == null
        ? null
        : Threshold.fromJson(json['Threshold'] as Map<String, dynamic>),
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
  );
}

Map<String, dynamic> _$HistoricalMetricToJson(HistoricalMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$HistoricalMetricNameEnumMap[instance.name]);
  writeNotNull('Statistic', _$StatisticEnumMap[instance.statistic]);
  writeNotNull('Threshold', instance.threshold?.toJson());
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  return val;
}

const _$HistoricalMetricNameEnumMap = {
  HistoricalMetricName.contactsQueued: 'CONTACTS_QUEUED',
  HistoricalMetricName.contactsHandled: 'CONTACTS_HANDLED',
  HistoricalMetricName.contactsAbandoned: 'CONTACTS_ABANDONED',
  HistoricalMetricName.contactsConsulted: 'CONTACTS_CONSULTED',
  HistoricalMetricName.contactsAgentHungUpFirst: 'CONTACTS_AGENT_HUNG_UP_FIRST',
  HistoricalMetricName.contactsHandledIncoming: 'CONTACTS_HANDLED_INCOMING',
  HistoricalMetricName.contactsHandledOutbound: 'CONTACTS_HANDLED_OUTBOUND',
  HistoricalMetricName.contactsHoldAbandons: 'CONTACTS_HOLD_ABANDONS',
  HistoricalMetricName.contactsTransferredIn: 'CONTACTS_TRANSFERRED_IN',
  HistoricalMetricName.contactsTransferredOut: 'CONTACTS_TRANSFERRED_OUT',
  HistoricalMetricName.contactsTransferredInFromQueue:
      'CONTACTS_TRANSFERRED_IN_FROM_QUEUE',
  HistoricalMetricName.contactsTransferredOutFromQueue:
      'CONTACTS_TRANSFERRED_OUT_FROM_QUEUE',
  HistoricalMetricName.contactsMissed: 'CONTACTS_MISSED',
  HistoricalMetricName.callbackContactsHandled: 'CALLBACK_CONTACTS_HANDLED',
  HistoricalMetricName.apiContactsHandled: 'API_CONTACTS_HANDLED',
  HistoricalMetricName.occupancy: 'OCCUPANCY',
  HistoricalMetricName.handleTime: 'HANDLE_TIME',
  HistoricalMetricName.afterContactWorkTime: 'AFTER_CONTACT_WORK_TIME',
  HistoricalMetricName.queuedTime: 'QUEUED_TIME',
  HistoricalMetricName.abandonTime: 'ABANDON_TIME',
  HistoricalMetricName.queueAnswerTime: 'QUEUE_ANSWER_TIME',
  HistoricalMetricName.holdTime: 'HOLD_TIME',
  HistoricalMetricName.interactionTime: 'INTERACTION_TIME',
  HistoricalMetricName.interactionAndHoldTime: 'INTERACTION_AND_HOLD_TIME',
  HistoricalMetricName.serviceLevel: 'SERVICE_LEVEL',
};

const _$StatisticEnumMap = {
  Statistic.sum: 'SUM',
  Statistic.max: 'MAX',
  Statistic.avg: 'AVG',
};

HistoricalMetricData _$HistoricalMetricDataFromJson(Map<String, dynamic> json) {
  return HistoricalMetricData(
    metric: json['Metric'] == null
        ? null
        : HistoricalMetric.fromJson(json['Metric'] as Map<String, dynamic>),
    value: (json['Value'] as num)?.toDouble(),
  );
}

HistoricalMetricResult _$HistoricalMetricResultFromJson(
    Map<String, dynamic> json) {
  return HistoricalMetricResult(
    collections: (json['Collections'] as List)
        ?.map((e) => e == null
            ? null
            : HistoricalMetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dimensions: json['Dimensions'] == null
        ? null
        : Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
  );
}

HoursOfOperationSummary _$HoursOfOperationSummaryFromJson(
    Map<String, dynamic> json) {
  return HoursOfOperationSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

ListContactFlowsResponse _$ListContactFlowsResponseFromJson(
    Map<String, dynamic> json) {
  return ListContactFlowsResponse(
    contactFlowSummaryList: (json['ContactFlowSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ContactFlowSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListHoursOfOperationsResponse _$ListHoursOfOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListHoursOfOperationsResponse(
    hoursOfOperationSummaryList: (json['HoursOfOperationSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : HoursOfOperationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPhoneNumbersResponse _$ListPhoneNumbersResponseFromJson(
    Map<String, dynamic> json) {
  return ListPhoneNumbersResponse(
    nextToken: json['NextToken'] as String,
    phoneNumberSummaryList: (json['PhoneNumberSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListQueuesResponse _$ListQueuesResponseFromJson(Map<String, dynamic> json) {
  return ListQueuesResponse(
    nextToken: json['NextToken'] as String,
    queueSummaryList: (json['QueueSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : QueueSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRoutingProfilesResponse _$ListRoutingProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRoutingProfilesResponse(
    nextToken: json['NextToken'] as String,
    routingProfileSummaryList: (json['RoutingProfileSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : RoutingProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecurityProfilesResponse _$ListSecurityProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecurityProfilesResponse(
    nextToken: json['NextToken'] as String,
    securityProfileSummaryList: (json['SecurityProfileSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListUserHierarchyGroupsResponse _$ListUserHierarchyGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserHierarchyGroupsResponse(
    nextToken: json['NextToken'] as String,
    userHierarchyGroupSummaryList:
        (json['UserHierarchyGroupSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : HierarchyGroupSummary.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    nextToken: json['NextToken'] as String,
    userSummaryList: (json['UserSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : UserSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ParticipantDetailsToJson(ParticipantDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  return val;
}

PhoneNumberSummary _$PhoneNumberSummaryFromJson(Map<String, dynamic> json) {
  return PhoneNumberSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    phoneNumberCountryCode: _$enumDecodeNullable(
        _$PhoneNumberCountryCodeEnumMap, json['PhoneNumberCountryCode']),
    phoneNumberType:
        _$enumDecodeNullable(_$PhoneNumberTypeEnumMap, json['PhoneNumberType']),
  );
}

const _$PhoneNumberCountryCodeEnumMap = {
  PhoneNumberCountryCode.af: 'AF',
  PhoneNumberCountryCode.al: 'AL',
  PhoneNumberCountryCode.dz: 'DZ',
  PhoneNumberCountryCode.as: 'AS',
  PhoneNumberCountryCode.ad: 'AD',
  PhoneNumberCountryCode.ao: 'AO',
  PhoneNumberCountryCode.ai: 'AI',
  PhoneNumberCountryCode.aq: 'AQ',
  PhoneNumberCountryCode.ag: 'AG',
  PhoneNumberCountryCode.ar: 'AR',
  PhoneNumberCountryCode.am: 'AM',
  PhoneNumberCountryCode.aw: 'AW',
  PhoneNumberCountryCode.au: 'AU',
  PhoneNumberCountryCode.at: 'AT',
  PhoneNumberCountryCode.az: 'AZ',
  PhoneNumberCountryCode.bs: 'BS',
  PhoneNumberCountryCode.bh: 'BH',
  PhoneNumberCountryCode.bd: 'BD',
  PhoneNumberCountryCode.bb: 'BB',
  PhoneNumberCountryCode.by: 'BY',
  PhoneNumberCountryCode.be: 'BE',
  PhoneNumberCountryCode.bz: 'BZ',
  PhoneNumberCountryCode.bj: 'BJ',
  PhoneNumberCountryCode.bm: 'BM',
  PhoneNumberCountryCode.bt: 'BT',
  PhoneNumberCountryCode.bo: 'BO',
  PhoneNumberCountryCode.ba: 'BA',
  PhoneNumberCountryCode.bw: 'BW',
  PhoneNumberCountryCode.br: 'BR',
  PhoneNumberCountryCode.io: 'IO',
  PhoneNumberCountryCode.vg: 'VG',
  PhoneNumberCountryCode.bn: 'BN',
  PhoneNumberCountryCode.bg: 'BG',
  PhoneNumberCountryCode.bf: 'BF',
  PhoneNumberCountryCode.bi: 'BI',
  PhoneNumberCountryCode.kh: 'KH',
  PhoneNumberCountryCode.cm: 'CM',
  PhoneNumberCountryCode.ca: 'CA',
  PhoneNumberCountryCode.cv: 'CV',
  PhoneNumberCountryCode.ky: 'KY',
  PhoneNumberCountryCode.cf: 'CF',
  PhoneNumberCountryCode.td: 'TD',
  PhoneNumberCountryCode.cl: 'CL',
  PhoneNumberCountryCode.cn: 'CN',
  PhoneNumberCountryCode.cx: 'CX',
  PhoneNumberCountryCode.cc: 'CC',
  PhoneNumberCountryCode.co: 'CO',
  PhoneNumberCountryCode.km: 'KM',
  PhoneNumberCountryCode.ck: 'CK',
  PhoneNumberCountryCode.cr: 'CR',
  PhoneNumberCountryCode.hr: 'HR',
  PhoneNumberCountryCode.cu: 'CU',
  PhoneNumberCountryCode.cw: 'CW',
  PhoneNumberCountryCode.cy: 'CY',
  PhoneNumberCountryCode.cz: 'CZ',
  PhoneNumberCountryCode.cd: 'CD',
  PhoneNumberCountryCode.dk: 'DK',
  PhoneNumberCountryCode.dj: 'DJ',
  PhoneNumberCountryCode.dm: 'DM',
  PhoneNumberCountryCode.$do: 'DO',
  PhoneNumberCountryCode.tl: 'TL',
  PhoneNumberCountryCode.ec: 'EC',
  PhoneNumberCountryCode.eg: 'EG',
  PhoneNumberCountryCode.sv: 'SV',
  PhoneNumberCountryCode.gq: 'GQ',
  PhoneNumberCountryCode.er: 'ER',
  PhoneNumberCountryCode.ee: 'EE',
  PhoneNumberCountryCode.et: 'ET',
  PhoneNumberCountryCode.fk: 'FK',
  PhoneNumberCountryCode.fo: 'FO',
  PhoneNumberCountryCode.fj: 'FJ',
  PhoneNumberCountryCode.fi: 'FI',
  PhoneNumberCountryCode.fr: 'FR',
  PhoneNumberCountryCode.pf: 'PF',
  PhoneNumberCountryCode.ga: 'GA',
  PhoneNumberCountryCode.gm: 'GM',
  PhoneNumberCountryCode.ge: 'GE',
  PhoneNumberCountryCode.de: 'DE',
  PhoneNumberCountryCode.gh: 'GH',
  PhoneNumberCountryCode.gi: 'GI',
  PhoneNumberCountryCode.gr: 'GR',
  PhoneNumberCountryCode.gl: 'GL',
  PhoneNumberCountryCode.gd: 'GD',
  PhoneNumberCountryCode.gu: 'GU',
  PhoneNumberCountryCode.gt: 'GT',
  PhoneNumberCountryCode.gg: 'GG',
  PhoneNumberCountryCode.gn: 'GN',
  PhoneNumberCountryCode.gw: 'GW',
  PhoneNumberCountryCode.gy: 'GY',
  PhoneNumberCountryCode.ht: 'HT',
  PhoneNumberCountryCode.hn: 'HN',
  PhoneNumberCountryCode.hk: 'HK',
  PhoneNumberCountryCode.hu: 'HU',
  PhoneNumberCountryCode.$is: 'IS',
  PhoneNumberCountryCode.$in: 'IN',
  PhoneNumberCountryCode.id: 'ID',
  PhoneNumberCountryCode.ir: 'IR',
  PhoneNumberCountryCode.iq: 'IQ',
  PhoneNumberCountryCode.ie: 'IE',
  PhoneNumberCountryCode.im: 'IM',
  PhoneNumberCountryCode.il: 'IL',
  PhoneNumberCountryCode.it: 'IT',
  PhoneNumberCountryCode.ci: 'CI',
  PhoneNumberCountryCode.jm: 'JM',
  PhoneNumberCountryCode.jp: 'JP',
  PhoneNumberCountryCode.je: 'JE',
  PhoneNumberCountryCode.jo: 'JO',
  PhoneNumberCountryCode.kz: 'KZ',
  PhoneNumberCountryCode.ke: 'KE',
  PhoneNumberCountryCode.ki: 'KI',
  PhoneNumberCountryCode.kw: 'KW',
  PhoneNumberCountryCode.kg: 'KG',
  PhoneNumberCountryCode.la: 'LA',
  PhoneNumberCountryCode.lv: 'LV',
  PhoneNumberCountryCode.lb: 'LB',
  PhoneNumberCountryCode.ls: 'LS',
  PhoneNumberCountryCode.lr: 'LR',
  PhoneNumberCountryCode.ly: 'LY',
  PhoneNumberCountryCode.li: 'LI',
  PhoneNumberCountryCode.lt: 'LT',
  PhoneNumberCountryCode.lu: 'LU',
  PhoneNumberCountryCode.mo: 'MO',
  PhoneNumberCountryCode.mk: 'MK',
  PhoneNumberCountryCode.mg: 'MG',
  PhoneNumberCountryCode.mw: 'MW',
  PhoneNumberCountryCode.my: 'MY',
  PhoneNumberCountryCode.mv: 'MV',
  PhoneNumberCountryCode.ml: 'ML',
  PhoneNumberCountryCode.mt: 'MT',
  PhoneNumberCountryCode.mh: 'MH',
  PhoneNumberCountryCode.mr: 'MR',
  PhoneNumberCountryCode.mu: 'MU',
  PhoneNumberCountryCode.yt: 'YT',
  PhoneNumberCountryCode.mx: 'MX',
  PhoneNumberCountryCode.fm: 'FM',
  PhoneNumberCountryCode.md: 'MD',
  PhoneNumberCountryCode.mc: 'MC',
  PhoneNumberCountryCode.mn: 'MN',
  PhoneNumberCountryCode.me: 'ME',
  PhoneNumberCountryCode.ms: 'MS',
  PhoneNumberCountryCode.ma: 'MA',
  PhoneNumberCountryCode.mz: 'MZ',
  PhoneNumberCountryCode.mm: 'MM',
  PhoneNumberCountryCode.na: 'NA',
  PhoneNumberCountryCode.nr: 'NR',
  PhoneNumberCountryCode.np: 'NP',
  PhoneNumberCountryCode.nl: 'NL',
  PhoneNumberCountryCode.an: 'AN',
  PhoneNumberCountryCode.nc: 'NC',
  PhoneNumberCountryCode.nz: 'NZ',
  PhoneNumberCountryCode.ni: 'NI',
  PhoneNumberCountryCode.ne: 'NE',
  PhoneNumberCountryCode.ng: 'NG',
  PhoneNumberCountryCode.nu: 'NU',
  PhoneNumberCountryCode.kp: 'KP',
  PhoneNumberCountryCode.mp: 'MP',
  PhoneNumberCountryCode.no: 'NO',
  PhoneNumberCountryCode.om: 'OM',
  PhoneNumberCountryCode.pk: 'PK',
  PhoneNumberCountryCode.pw: 'PW',
  PhoneNumberCountryCode.pa: 'PA',
  PhoneNumberCountryCode.pg: 'PG',
  PhoneNumberCountryCode.py: 'PY',
  PhoneNumberCountryCode.pe: 'PE',
  PhoneNumberCountryCode.ph: 'PH',
  PhoneNumberCountryCode.pn: 'PN',
  PhoneNumberCountryCode.pl: 'PL',
  PhoneNumberCountryCode.pt: 'PT',
  PhoneNumberCountryCode.pr: 'PR',
  PhoneNumberCountryCode.qa: 'QA',
  PhoneNumberCountryCode.cg: 'CG',
  PhoneNumberCountryCode.re: 'RE',
  PhoneNumberCountryCode.ro: 'RO',
  PhoneNumberCountryCode.ru: 'RU',
  PhoneNumberCountryCode.rw: 'RW',
  PhoneNumberCountryCode.bl: 'BL',
  PhoneNumberCountryCode.sh: 'SH',
  PhoneNumberCountryCode.kn: 'KN',
  PhoneNumberCountryCode.lc: 'LC',
  PhoneNumberCountryCode.mf: 'MF',
  PhoneNumberCountryCode.pm: 'PM',
  PhoneNumberCountryCode.vc: 'VC',
  PhoneNumberCountryCode.ws: 'WS',
  PhoneNumberCountryCode.sm: 'SM',
  PhoneNumberCountryCode.st: 'ST',
  PhoneNumberCountryCode.sa: 'SA',
  PhoneNumberCountryCode.sn: 'SN',
  PhoneNumberCountryCode.rs: 'RS',
  PhoneNumberCountryCode.sc: 'SC',
  PhoneNumberCountryCode.sl: 'SL',
  PhoneNumberCountryCode.sg: 'SG',
  PhoneNumberCountryCode.sx: 'SX',
  PhoneNumberCountryCode.sk: 'SK',
  PhoneNumberCountryCode.si: 'SI',
  PhoneNumberCountryCode.sb: 'SB',
  PhoneNumberCountryCode.so: 'SO',
  PhoneNumberCountryCode.za: 'ZA',
  PhoneNumberCountryCode.kr: 'KR',
  PhoneNumberCountryCode.es: 'ES',
  PhoneNumberCountryCode.lk: 'LK',
  PhoneNumberCountryCode.sd: 'SD',
  PhoneNumberCountryCode.sr: 'SR',
  PhoneNumberCountryCode.sj: 'SJ',
  PhoneNumberCountryCode.sz: 'SZ',
  PhoneNumberCountryCode.se: 'SE',
  PhoneNumberCountryCode.ch: 'CH',
  PhoneNumberCountryCode.sy: 'SY',
  PhoneNumberCountryCode.tw: 'TW',
  PhoneNumberCountryCode.tj: 'TJ',
  PhoneNumberCountryCode.tz: 'TZ',
  PhoneNumberCountryCode.th: 'TH',
  PhoneNumberCountryCode.tg: 'TG',
  PhoneNumberCountryCode.tk: 'TK',
  PhoneNumberCountryCode.to: 'TO',
  PhoneNumberCountryCode.tt: 'TT',
  PhoneNumberCountryCode.tn: 'TN',
  PhoneNumberCountryCode.tr: 'TR',
  PhoneNumberCountryCode.tm: 'TM',
  PhoneNumberCountryCode.tc: 'TC',
  PhoneNumberCountryCode.tv: 'TV',
  PhoneNumberCountryCode.vi: 'VI',
  PhoneNumberCountryCode.ug: 'UG',
  PhoneNumberCountryCode.ua: 'UA',
  PhoneNumberCountryCode.ae: 'AE',
  PhoneNumberCountryCode.gb: 'GB',
  PhoneNumberCountryCode.us: 'US',
  PhoneNumberCountryCode.uy: 'UY',
  PhoneNumberCountryCode.uz: 'UZ',
  PhoneNumberCountryCode.vu: 'VU',
  PhoneNumberCountryCode.va: 'VA',
  PhoneNumberCountryCode.ve: 'VE',
  PhoneNumberCountryCode.vn: 'VN',
  PhoneNumberCountryCode.wf: 'WF',
  PhoneNumberCountryCode.eh: 'EH',
  PhoneNumberCountryCode.ye: 'YE',
  PhoneNumberCountryCode.zm: 'ZM',
  PhoneNumberCountryCode.zw: 'ZW',
};

const _$PhoneNumberTypeEnumMap = {
  PhoneNumberType.tollFree: 'TOLL_FREE',
  PhoneNumberType.did: 'DID',
};

QueueReference _$QueueReferenceFromJson(Map<String, dynamic> json) {
  return QueueReference(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

QueueSummary _$QueueSummaryFromJson(Map<String, dynamic> json) {
  return QueueSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    queueType: _$enumDecodeNullable(_$QueueTypeEnumMap, json['QueueType']),
  );
}

const _$QueueTypeEnumMap = {
  QueueType.standard: 'STANDARD',
  QueueType.agent: 'AGENT',
};

RoutingProfileSummary _$RoutingProfileSummaryFromJson(
    Map<String, dynamic> json) {
  return RoutingProfileSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

SecurityProfileSummary _$SecurityProfileSummaryFromJson(
    Map<String, dynamic> json) {
  return SecurityProfileSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

StartChatContactResponse _$StartChatContactResponseFromJson(
    Map<String, dynamic> json) {
  return StartChatContactResponse(
    contactId: json['ContactId'] as String,
    participantId: json['ParticipantId'] as String,
    participantToken: json['ParticipantToken'] as String,
  );
}

StartOutboundVoiceContactResponse _$StartOutboundVoiceContactResponseFromJson(
    Map<String, dynamic> json) {
  return StartOutboundVoiceContactResponse(
    contactId: json['ContactId'] as String,
  );
}

StopContactResponse _$StopContactResponseFromJson(Map<String, dynamic> json) {
  return StopContactResponse();
}

Threshold _$ThresholdFromJson(Map<String, dynamic> json) {
  return Threshold(
    comparison: _$enumDecodeNullable(_$ComparisonEnumMap, json['Comparison']),
    thresholdValue: (json['ThresholdValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ThresholdToJson(Threshold instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparison', _$ComparisonEnumMap[instance.comparison]);
  writeNotNull('ThresholdValue', instance.thresholdValue);
  return val;
}

const _$ComparisonEnumMap = {
  Comparison.lt: 'LT',
};

UpdateContactAttributesResponse _$UpdateContactAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContactAttributesResponse();
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    arn: json['Arn'] as String,
    directoryUserId: json['DirectoryUserId'] as String,
    hierarchyGroupId: json['HierarchyGroupId'] as String,
    id: json['Id'] as String,
    identityInfo: json['IdentityInfo'] == null
        ? null
        : UserIdentityInfo.fromJson(
            json['IdentityInfo'] as Map<String, dynamic>),
    phoneConfig: json['PhoneConfig'] == null
        ? null
        : UserPhoneConfig.fromJson(json['PhoneConfig'] as Map<String, dynamic>),
    routingProfileId: json['RoutingProfileId'] as String,
    securityProfileIds:
        (json['SecurityProfileIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    username: json['Username'] as String,
  );
}

UserIdentityInfo _$UserIdentityInfoFromJson(Map<String, dynamic> json) {
  return UserIdentityInfo(
    email: json['Email'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
  );
}

Map<String, dynamic> _$UserIdentityInfoToJson(UserIdentityInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('LastName', instance.lastName);
  return val;
}

UserPhoneConfig _$UserPhoneConfigFromJson(Map<String, dynamic> json) {
  return UserPhoneConfig(
    phoneType: _$enumDecodeNullable(_$PhoneTypeEnumMap, json['PhoneType']),
    afterContactWorkTimeLimit: json['AfterContactWorkTimeLimit'] as int,
    autoAccept: json['AutoAccept'] as bool,
    deskPhoneNumber: json['DeskPhoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserPhoneConfigToJson(UserPhoneConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneType', _$PhoneTypeEnumMap[instance.phoneType]);
  writeNotNull('AfterContactWorkTimeLimit', instance.afterContactWorkTimeLimit);
  writeNotNull('AutoAccept', instance.autoAccept);
  writeNotNull('DeskPhoneNumber', instance.deskPhoneNumber);
  return val;
}

const _$PhoneTypeEnumMap = {
  PhoneType.softPhone: 'SOFT_PHONE',
  PhoneType.deskPhone: 'DESK_PHONE',
};

UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) {
  return UserSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    username: json['Username'] as String,
  );
}
