// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-11-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptInvitationResponse _$AcceptInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptInvitationResponse();
}

AccessControlList _$AccessControlListFromJson(Map<String, dynamic> json) {
  return AccessControlList(
    allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool,
    allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool,
  );
}

AccessKeyDetails _$AccessKeyDetailsFromJson(Map<String, dynamic> json) {
  return AccessKeyDetails(
    accessKeyId: json['accessKeyId'] as String,
    principalId: json['principalId'] as String,
    userName: json['userName'] as String,
    userType: json['userType'] as String,
  );
}

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('email', instance.email);
  return val;
}

AccountLevelPermissions _$AccountLevelPermissionsFromJson(
    Map<String, dynamic> json) {
  return AccountLevelPermissions(
    blockPublicAccess: json['blockPublicAccess'] == null
        ? null
        : BlockPublicAccess.fromJson(
            json['blockPublicAccess'] as Map<String, dynamic>),
  );
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    actionType: json['actionType'] as String,
    awsApiCallAction: json['awsApiCallAction'] == null
        ? null
        : AwsApiCallAction.fromJson(
            json['awsApiCallAction'] as Map<String, dynamic>),
    dnsRequestAction: json['dnsRequestAction'] == null
        ? null
        : DnsRequestAction.fromJson(
            json['dnsRequestAction'] as Map<String, dynamic>),
    networkConnectionAction: json['networkConnectionAction'] == null
        ? null
        : NetworkConnectionAction.fromJson(
            json['networkConnectionAction'] as Map<String, dynamic>),
    portProbeAction: json['portProbeAction'] == null
        ? null
        : PortProbeAction.fromJson(
            json['portProbeAction'] as Map<String, dynamic>),
  );
}

AdminAccount _$AdminAccountFromJson(Map<String, dynamic> json) {
  return AdminAccount(
    adminAccountId: json['adminAccountId'] as String,
    adminStatus:
        _$enumDecodeNullable(_$AdminStatusEnumMap, json['adminStatus']),
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

const _$AdminStatusEnumMap = {
  AdminStatus.enabled: 'ENABLED',
  AdminStatus.disableInProgress: 'DISABLE_IN_PROGRESS',
};

ArchiveFindingsResponse _$ArchiveFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return ArchiveFindingsResponse();
}

AwsApiCallAction _$AwsApiCallActionFromJson(Map<String, dynamic> json) {
  return AwsApiCallAction(
    api: json['api'] as String,
    callerType: json['callerType'] as String,
    domainDetails: json['domainDetails'] == null
        ? null
        : DomainDetails.fromJson(json['domainDetails'] as Map<String, dynamic>),
    errorCode: json['errorCode'] as String,
    remoteIpDetails: json['remoteIpDetails'] == null
        ? null
        : RemoteIpDetails.fromJson(
            json['remoteIpDetails'] as Map<String, dynamic>),
    serviceName: json['serviceName'] as String,
  );
}

BlockPublicAccess _$BlockPublicAccessFromJson(Map<String, dynamic> json) {
  return BlockPublicAccess(
    blockPublicAcls: json['blockPublicAcls'] as bool,
    blockPublicPolicy: json['blockPublicPolicy'] as bool,
    ignorePublicAcls: json['ignorePublicAcls'] as bool,
    restrictPublicBuckets: json['restrictPublicBuckets'] as bool,
  );
}

BucketLevelPermissions _$BucketLevelPermissionsFromJson(
    Map<String, dynamic> json) {
  return BucketLevelPermissions(
    accessControlList: json['accessControlList'] == null
        ? null
        : AccessControlList.fromJson(
            json['accessControlList'] as Map<String, dynamic>),
    blockPublicAccess: json['blockPublicAccess'] == null
        ? null
        : BlockPublicAccess.fromJson(
            json['blockPublicAccess'] as Map<String, dynamic>),
    bucketPolicy: json['bucketPolicy'] == null
        ? null
        : BucketPolicy.fromJson(json['bucketPolicy'] as Map<String, dynamic>),
  );
}

BucketPolicy _$BucketPolicyFromJson(Map<String, dynamic> json) {
  return BucketPolicy(
    allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool,
    allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool,
  );
}

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    cityName: json['cityName'] as String,
  );
}

CloudTrailConfigurationResult _$CloudTrailConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return CloudTrailConfigurationResult(
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['status']),
  );
}

const _$DataSourceStatusEnumMap = {
  DataSourceStatus.enabled: 'ENABLED',
  DataSourceStatus.disabled: 'DISABLED',
};

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    eq: (json['eq'] as List)?.map((e) => e as String)?.toList(),
    equals: (json['equals'] as List)?.map((e) => e as String)?.toList(),
    greaterThan: json['greaterThan'] as int,
    greaterThanOrEqual: json['greaterThanOrEqual'] as int,
    gt: json['gt'] as int,
    gte: json['gte'] as int,
    lessThan: json['lessThan'] as int,
    lessThanOrEqual: json['lessThanOrEqual'] as int,
    lt: json['lt'] as int,
    lte: json['lte'] as int,
    neq: (json['neq'] as List)?.map((e) => e as String)?.toList(),
    notEquals: (json['notEquals'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eq', instance.eq);
  writeNotNull('equals', instance.equals);
  writeNotNull('greaterThan', instance.greaterThan);
  writeNotNull('greaterThanOrEqual', instance.greaterThanOrEqual);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('lessThan', instance.lessThan);
  writeNotNull('lessThanOrEqual', instance.lessThanOrEqual);
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('neq', instance.neq);
  writeNotNull('notEquals', instance.notEquals);
  return val;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    countryCode: json['countryCode'] as String,
    countryName: json['countryName'] as String,
  );
}

CreateDetectorResponse _$CreateDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDetectorResponse(
    detectorId: json['detectorId'] as String,
  );
}

CreateFilterResponse _$CreateFilterResponseFromJson(Map<String, dynamic> json) {
  return CreateFilterResponse(
    name: json['name'] as String,
  );
}

CreateIPSetResponse _$CreateIPSetResponseFromJson(Map<String, dynamic> json) {
  return CreateIPSetResponse(
    ipSetId: json['ipSetId'] as String,
  );
}

CreateMembersResponse _$CreateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreatePublishingDestinationResponse
    _$CreatePublishingDestinationResponseFromJson(Map<String, dynamic> json) {
  return CreatePublishingDestinationResponse(
    destinationId: json['destinationId'] as String,
  );
}

CreateSampleFindingsResponse _$CreateSampleFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSampleFindingsResponse();
}

CreateThreatIntelSetResponse _$CreateThreatIntelSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateThreatIntelSetResponse(
    threatIntelSetId: json['threatIntelSetId'] as String,
  );
}

DNSLogsConfigurationResult _$DNSLogsConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return DNSLogsConfigurationResult(
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$DataSourceConfigurationsToJson(
    DataSourceConfigurations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Logs', instance.s3Logs?.toJson());
  return val;
}

DataSourceConfigurationsResult _$DataSourceConfigurationsResultFromJson(
    Map<String, dynamic> json) {
  return DataSourceConfigurationsResult(
    cloudTrail: json['cloudTrail'] == null
        ? null
        : CloudTrailConfigurationResult.fromJson(
            json['cloudTrail'] as Map<String, dynamic>),
    dNSLogs: json['dnsLogs'] == null
        ? null
        : DNSLogsConfigurationResult.fromJson(
            json['dnsLogs'] as Map<String, dynamic>),
    flowLogs: json['flowLogs'] == null
        ? null
        : FlowLogsConfigurationResult.fromJson(
            json['flowLogs'] as Map<String, dynamic>),
    s3Logs: json['s3Logs'] == null
        ? null
        : S3LogsConfigurationResult.fromJson(
            json['s3Logs'] as Map<String, dynamic>),
  );
}

DeclineInvitationsResponse _$DeclineInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeclineInvitationsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DefaultServerSideEncryption _$DefaultServerSideEncryptionFromJson(
    Map<String, dynamic> json) {
  return DefaultServerSideEncryption(
    encryptionType: json['encryptionType'] as String,
    kmsMasterKeyArn: json['kmsMasterKeyArn'] as String,
  );
}

DeleteDetectorResponse _$DeleteDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDetectorResponse();
}

DeleteFilterResponse _$DeleteFilterResponseFromJson(Map<String, dynamic> json) {
  return DeleteFilterResponse();
}

DeleteIPSetResponse _$DeleteIPSetResponseFromJson(Map<String, dynamic> json) {
  return DeleteIPSetResponse();
}

DeleteInvitationsResponse _$DeleteInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInvitationsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteMembersResponse _$DeleteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeletePublishingDestinationResponse
    _$DeletePublishingDestinationResponseFromJson(Map<String, dynamic> json) {
  return DeletePublishingDestinationResponse();
}

DeleteThreatIntelSetResponse _$DeleteThreatIntelSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThreatIntelSetResponse();
}

DescribeOrganizationConfigurationResponse
    _$DescribeOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConfigurationResponse(
    autoEnable: json['autoEnable'] as bool,
    memberAccountLimitReached: json['memberAccountLimitReached'] as bool,
    dataSources: json['dataSources'] == null
        ? null
        : OrganizationDataSourceConfigurationsResult.fromJson(
            json['dataSources'] as Map<String, dynamic>),
  );
}

DescribePublishingDestinationResponse
    _$DescribePublishingDestinationResponseFromJson(Map<String, dynamic> json) {
  return DescribePublishingDestinationResponse(
    destinationId: json['destinationId'] as String,
    destinationProperties: json['destinationProperties'] == null
        ? null
        : DestinationProperties.fromJson(
            json['destinationProperties'] as Map<String, dynamic>),
    destinationType:
        _$enumDecodeNullable(_$DestinationTypeEnumMap, json['destinationType']),
    publishingFailureStartTimestamp:
        json['publishingFailureStartTimestamp'] as int,
    status: _$enumDecodeNullable(_$PublishingStatusEnumMap, json['status']),
  );
}

const _$DestinationTypeEnumMap = {
  DestinationType.s3: 'S3',
};

const _$PublishingStatusEnumMap = {
  PublishingStatus.pendingVerification: 'PENDING_VERIFICATION',
  PublishingStatus.publishing: 'PUBLISHING',
  PublishingStatus.unableToPublishFixDestinationProperty:
      'UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY',
  PublishingStatus.stopped: 'STOPPED',
};

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return Destination(
    destinationId: json['destinationId'] as String,
    destinationType:
        _$enumDecodeNullable(_$DestinationTypeEnumMap, json['destinationType']),
    status: _$enumDecodeNullable(_$PublishingStatusEnumMap, json['status']),
  );
}

DestinationProperties _$DestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return DestinationProperties(
    destinationArn: json['destinationArn'] as String,
    kmsKeyArn: json['kmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$DestinationPropertiesToJson(
    DestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationArn', instance.destinationArn);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  return val;
}

DisableOrganizationAdminAccountResponse
    _$DisableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisableOrganizationAdminAccountResponse();
}

DisassociateFromMasterAccountResponse
    _$DisassociateFromMasterAccountResponseFromJson(Map<String, dynamic> json) {
  return DisassociateFromMasterAccountResponse();
}

DisassociateMembersResponse _$DisassociateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DnsRequestAction _$DnsRequestActionFromJson(Map<String, dynamic> json) {
  return DnsRequestAction(
    domain: json['domain'] as String,
  );
}

DomainDetails _$DomainDetailsFromJson(Map<String, dynamic> json) {
  return DomainDetails(
    domain: json['domain'] as String,
  );
}

EnableOrganizationAdminAccountResponse
    _$EnableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return EnableOrganizationAdminAccountResponse();
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return Evidence(
    threatIntelligenceDetails: (json['threatIntelligenceDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ThreatIntelligenceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Finding _$FindingFromJson(Map<String, dynamic> json) {
  return Finding(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    createdAt: json['createdAt'] as String,
    id: json['id'] as String,
    region: json['region'] as String,
    resource: json['resource'] == null
        ? null
        : Resource.fromJson(json['resource'] as Map<String, dynamic>),
    schemaVersion: json['schemaVersion'] as String,
    severity: (json['severity'] as num)?.toDouble(),
    type: json['type'] as String,
    updatedAt: json['updatedAt'] as String,
    confidence: (json['confidence'] as num)?.toDouble(),
    description: json['description'] as String,
    partition: json['partition'] as String,
    service: json['service'] == null
        ? null
        : Service.fromJson(json['service'] as Map<String, dynamic>),
    title: json['title'] as String,
  );
}

FindingCriteria _$FindingCriteriaFromJson(Map<String, dynamic> json) {
  return FindingCriteria(
    criterion: (json['criterion'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Condition.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$FindingCriteriaToJson(FindingCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'criterion', instance.criterion?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

FindingStatistics _$FindingStatisticsFromJson(Map<String, dynamic> json) {
  return FindingStatistics(
    countBySeverity: (json['countBySeverity'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

FlowLogsConfigurationResult _$FlowLogsConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return FlowLogsConfigurationResult(
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['status']),
  );
}

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return GeoLocation(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

GetDetectorResponse _$GetDetectorResponseFromJson(Map<String, dynamic> json) {
  return GetDetectorResponse(
    serviceRole: json['serviceRole'] as String,
    status: _$enumDecodeNullable(_$DetectorStatusEnumMap, json['status']),
    createdAt: json['createdAt'] as String,
    dataSources: json['dataSources'] == null
        ? null
        : DataSourceConfigurationsResult.fromJson(
            json['dataSources'] as Map<String, dynamic>),
    findingPublishingFrequency: _$enumDecodeNullable(
        _$FindingPublishingFrequencyEnumMap,
        json['findingPublishingFrequency']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: json['updatedAt'] as String,
  );
}

const _$DetectorStatusEnumMap = {
  DetectorStatus.enabled: 'ENABLED',
  DetectorStatus.disabled: 'DISABLED',
};

const _$FindingPublishingFrequencyEnumMap = {
  FindingPublishingFrequency.fifteenMinutes: 'FIFTEEN_MINUTES',
  FindingPublishingFrequency.oneHour: 'ONE_HOUR',
  FindingPublishingFrequency.sixHours: 'SIX_HOURS',
};

GetFilterResponse _$GetFilterResponseFromJson(Map<String, dynamic> json) {
  return GetFilterResponse(
    action: _$enumDecodeNullable(_$FilterActionEnumMap, json['action']),
    findingCriteria: json['findingCriteria'] == null
        ? null
        : FindingCriteria.fromJson(
            json['findingCriteria'] as Map<String, dynamic>),
    name: json['name'] as String,
    description: json['description'] as String,
    rank: json['rank'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$FilterActionEnumMap = {
  FilterAction.noop: 'NOOP',
  FilterAction.archive: 'ARCHIVE',
};

GetFindingsResponse _$GetFindingsResponseFromJson(Map<String, dynamic> json) {
  return GetFindingsResponse(
    findings: (json['findings'] as List)
        ?.map((e) =>
            e == null ? null : Finding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFindingsStatisticsResponse _$GetFindingsStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetFindingsStatisticsResponse(
    findingStatistics: json['findingStatistics'] == null
        ? null
        : FindingStatistics.fromJson(
            json['findingStatistics'] as Map<String, dynamic>),
  );
}

GetIPSetResponse _$GetIPSetResponseFromJson(Map<String, dynamic> json) {
  return GetIPSetResponse(
    format: _$enumDecodeNullable(_$IpSetFormatEnumMap, json['format']),
    location: json['location'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$IpSetStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$IpSetFormatEnumMap = {
  IpSetFormat.txt: 'TXT',
  IpSetFormat.stix: 'STIX',
  IpSetFormat.otxCsv: 'OTX_CSV',
  IpSetFormat.alienVault: 'ALIEN_VAULT',
  IpSetFormat.proofPoint: 'PROOF_POINT',
  IpSetFormat.fireEye: 'FIRE_EYE',
};

const _$IpSetStatusEnumMap = {
  IpSetStatus.inactive: 'INACTIVE',
  IpSetStatus.activating: 'ACTIVATING',
  IpSetStatus.active: 'ACTIVE',
  IpSetStatus.deactivating: 'DEACTIVATING',
  IpSetStatus.error: 'ERROR',
  IpSetStatus.deletePending: 'DELETE_PENDING',
  IpSetStatus.deleted: 'DELETED',
};

GetInvitationsCountResponse _$GetInvitationsCountResponseFromJson(
    Map<String, dynamic> json) {
  return GetInvitationsCountResponse(
    invitationsCount: json['invitationsCount'] as int,
  );
}

GetMasterAccountResponse _$GetMasterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetMasterAccountResponse(
    master: json['master'] == null
        ? null
        : Master.fromJson(json['master'] as Map<String, dynamic>),
  );
}

GetMemberDetectorsResponse _$GetMemberDetectorsResponseFromJson(
    Map<String, dynamic> json) {
  return GetMemberDetectorsResponse(
    memberDataSourceConfigurations: (json['members'] as List)
        ?.map((e) => e == null
            ? null
            : MemberDataSourceConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetMembersResponse _$GetMembersResponseFromJson(Map<String, dynamic> json) {
  return GetMembersResponse(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetThreatIntelSetResponse _$GetThreatIntelSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetThreatIntelSetResponse(
    format: _$enumDecodeNullable(_$ThreatIntelSetFormatEnumMap, json['format']),
    location: json['location'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$ThreatIntelSetStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$ThreatIntelSetFormatEnumMap = {
  ThreatIntelSetFormat.txt: 'TXT',
  ThreatIntelSetFormat.stix: 'STIX',
  ThreatIntelSetFormat.otxCsv: 'OTX_CSV',
  ThreatIntelSetFormat.alienVault: 'ALIEN_VAULT',
  ThreatIntelSetFormat.proofPoint: 'PROOF_POINT',
  ThreatIntelSetFormat.fireEye: 'FIRE_EYE',
};

const _$ThreatIntelSetStatusEnumMap = {
  ThreatIntelSetStatus.inactive: 'INACTIVE',
  ThreatIntelSetStatus.activating: 'ACTIVATING',
  ThreatIntelSetStatus.active: 'ACTIVE',
  ThreatIntelSetStatus.deactivating: 'DEACTIVATING',
  ThreatIntelSetStatus.error: 'ERROR',
  ThreatIntelSetStatus.deletePending: 'DELETE_PENDING',
  ThreatIntelSetStatus.deleted: 'DELETED',
};

GetUsageStatisticsResponse _$GetUsageStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUsageStatisticsResponse(
    nextToken: json['nextToken'] as String,
    usageStatistics: json['usageStatistics'] == null
        ? null
        : UsageStatistics.fromJson(
            json['usageStatistics'] as Map<String, dynamic>),
  );
}

IamInstanceProfile _$IamInstanceProfileFromJson(Map<String, dynamic> json) {
  return IamInstanceProfile(
    arn: json['arn'] as String,
    id: json['id'] as String,
  );
}

InstanceDetails _$InstanceDetailsFromJson(Map<String, dynamic> json) {
  return InstanceDetails(
    availabilityZone: json['availabilityZone'] as String,
    iamInstanceProfile: json['iamInstanceProfile'] == null
        ? null
        : IamInstanceProfile.fromJson(
            json['iamInstanceProfile'] as Map<String, dynamic>),
    imageDescription: json['imageDescription'] as String,
    imageId: json['imageId'] as String,
    instanceId: json['instanceId'] as String,
    instanceState: json['instanceState'] as String,
    instanceType: json['instanceType'] as String,
    launchTime: json['launchTime'] as String,
    networkInterfaces: (json['networkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outpostArn: json['outpostArn'] as String,
    platform: json['platform'] as String,
    productCodes: (json['productCodes'] as List)
        ?.map((e) =>
            e == null ? null : ProductCode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
    accountId: json['accountId'] as String,
    invitationId: json['invitationId'] as String,
    invitedAt: json['invitedAt'] as String,
    relationshipStatus: json['relationshipStatus'] as String,
  );
}

InviteMembersResponse _$InviteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return InviteMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDetectorsResponse _$ListDetectorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDetectorsResponse(
    detectorIds:
        (json['detectorIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFiltersResponse _$ListFiltersResponseFromJson(Map<String, dynamic> json) {
  return ListFiltersResponse(
    filterNames:
        (json['filterNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFindingsResponse _$ListFindingsResponseFromJson(Map<String, dynamic> json) {
  return ListFindingsResponse(
    findingIds: (json['findingIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListIPSetsResponse _$ListIPSetsResponseFromJson(Map<String, dynamic> json) {
  return ListIPSetsResponse(
    ipSetIds: (json['ipSetIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['invitations'] as List)
        ?.map((e) =>
            e == null ? null : Invitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOrganizationAdminAccountsResponse
    _$ListOrganizationAdminAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListOrganizationAdminAccountsResponse(
    adminAccounts: (json['adminAccounts'] as List)
        ?.map((e) =>
            e == null ? null : AdminAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPublishingDestinationsResponse _$ListPublishingDestinationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPublishingDestinationsResponse(
    destinations: (json['destinations'] as List)
        ?.map((e) =>
            e == null ? null : Destination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

ListThreatIntelSetsResponse _$ListThreatIntelSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListThreatIntelSetsResponse(
    threatIntelSetIds:
        (json['threatIntelSetIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

LocalIpDetails _$LocalIpDetailsFromJson(Map<String, dynamic> json) {
  return LocalIpDetails(
    ipAddressV4: json['ipAddressV4'] as String,
  );
}

LocalPortDetails _$LocalPortDetailsFromJson(Map<String, dynamic> json) {
  return LocalPortDetails(
    port: json['port'] as int,
    portName: json['portName'] as String,
  );
}

Master _$MasterFromJson(Map<String, dynamic> json) {
  return Master(
    accountId: json['accountId'] as String,
    invitationId: json['invitationId'] as String,
    invitedAt: json['invitedAt'] as String,
    relationshipStatus: json['relationshipStatus'] as String,
  );
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    accountId: json['accountId'] as String,
    email: json['email'] as String,
    masterId: json['masterId'] as String,
    relationshipStatus: json['relationshipStatus'] as String,
    updatedAt: json['updatedAt'] as String,
    detectorId: json['detectorId'] as String,
    invitedAt: json['invitedAt'] as String,
  );
}

MemberDataSourceConfiguration _$MemberDataSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return MemberDataSourceConfiguration(
    accountId: json['accountId'] as String,
    dataSources: json['dataSources'] == null
        ? null
        : DataSourceConfigurationsResult.fromJson(
            json['dataSources'] as Map<String, dynamic>),
  );
}

NetworkConnectionAction _$NetworkConnectionActionFromJson(
    Map<String, dynamic> json) {
  return NetworkConnectionAction(
    blocked: json['blocked'] as bool,
    connectionDirection: json['connectionDirection'] as String,
    localIpDetails: json['localIpDetails'] == null
        ? null
        : LocalIpDetails.fromJson(
            json['localIpDetails'] as Map<String, dynamic>),
    localPortDetails: json['localPortDetails'] == null
        ? null
        : LocalPortDetails.fromJson(
            json['localPortDetails'] as Map<String, dynamic>),
    protocol: json['protocol'] as String,
    remoteIpDetails: json['remoteIpDetails'] == null
        ? null
        : RemoteIpDetails.fromJson(
            json['remoteIpDetails'] as Map<String, dynamic>),
    remotePortDetails: json['remotePortDetails'] == null
        ? null
        : RemotePortDetails.fromJson(
            json['remotePortDetails'] as Map<String, dynamic>),
  );
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    ipv6Addresses:
        (json['ipv6Addresses'] as List)?.map((e) => e as String)?.toList(),
    networkInterfaceId: json['networkInterfaceId'] as String,
    privateDnsName: json['privateDnsName'] as String,
    privateIpAddress: json['privateIpAddress'] as String,
    privateIpAddresses: (json['privateIpAddresses'] as List)
        ?.map((e) => e == null
            ? null
            : PrivateIpAddressDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publicDnsName: json['publicDnsName'] as String,
    publicIp: json['publicIp'] as String,
    securityGroups: (json['securityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subnetId: json['subnetId'] as String,
    vpcId: json['vpcId'] as String,
  );
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    asn: json['asn'] as String,
    asnOrg: json['asnOrg'] as String,
    isp: json['isp'] as String,
    org: json['org'] as String,
  );
}

Map<String, dynamic> _$OrganizationDataSourceConfigurationsToJson(
    OrganizationDataSourceConfigurations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Logs', instance.s3Logs?.toJson());
  return val;
}

OrganizationDataSourceConfigurationsResult
    _$OrganizationDataSourceConfigurationsResultFromJson(
        Map<String, dynamic> json) {
  return OrganizationDataSourceConfigurationsResult(
    s3Logs: json['s3Logs'] == null
        ? null
        : OrganizationS3LogsConfigurationResult.fromJson(
            json['s3Logs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrganizationS3LogsConfigurationToJson(
    OrganizationS3LogsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoEnable', instance.autoEnable);
  return val;
}

OrganizationS3LogsConfigurationResult
    _$OrganizationS3LogsConfigurationResultFromJson(Map<String, dynamic> json) {
  return OrganizationS3LogsConfigurationResult(
    autoEnable: json['autoEnable'] as bool,
  );
}

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    id: json['id'] as String,
  );
}

PermissionConfiguration _$PermissionConfigurationFromJson(
    Map<String, dynamic> json) {
  return PermissionConfiguration(
    accountLevelPermissions: json['accountLevelPermissions'] == null
        ? null
        : AccountLevelPermissions.fromJson(
            json['accountLevelPermissions'] as Map<String, dynamic>),
    bucketLevelPermissions: json['bucketLevelPermissions'] == null
        ? null
        : BucketLevelPermissions.fromJson(
            json['bucketLevelPermissions'] as Map<String, dynamic>),
  );
}

PortProbeAction _$PortProbeActionFromJson(Map<String, dynamic> json) {
  return PortProbeAction(
    blocked: json['blocked'] as bool,
    portProbeDetails: (json['portProbeDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PortProbeDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PortProbeDetail _$PortProbeDetailFromJson(Map<String, dynamic> json) {
  return PortProbeDetail(
    localIpDetails: json['localIpDetails'] == null
        ? null
        : LocalIpDetails.fromJson(
            json['localIpDetails'] as Map<String, dynamic>),
    localPortDetails: json['localPortDetails'] == null
        ? null
        : LocalPortDetails.fromJson(
            json['localPortDetails'] as Map<String, dynamic>),
    remoteIpDetails: json['remoteIpDetails'] == null
        ? null
        : RemoteIpDetails.fromJson(
            json['remoteIpDetails'] as Map<String, dynamic>),
  );
}

PrivateIpAddressDetails _$PrivateIpAddressDetailsFromJson(
    Map<String, dynamic> json) {
  return PrivateIpAddressDetails(
    privateDnsName: json['privateDnsName'] as String,
    privateIpAddress: json['privateIpAddress'] as String,
  );
}

ProductCode _$ProductCodeFromJson(Map<String, dynamic> json) {
  return ProductCode(
    code: json['code'] as String,
    productType: json['productType'] as String,
  );
}

PublicAccess _$PublicAccessFromJson(Map<String, dynamic> json) {
  return PublicAccess(
    effectivePermission: json['effectivePermission'] as String,
    permissionConfiguration: json['permissionConfiguration'] == null
        ? null
        : PermissionConfiguration.fromJson(
            json['permissionConfiguration'] as Map<String, dynamic>),
  );
}

RemoteIpDetails _$RemoteIpDetailsFromJson(Map<String, dynamic> json) {
  return RemoteIpDetails(
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    geoLocation: json['geoLocation'] == null
        ? null
        : GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
    ipAddressV4: json['ipAddressV4'] as String,
    organization: json['organization'] == null
        ? null
        : Organization.fromJson(json['organization'] as Map<String, dynamic>),
  );
}

RemotePortDetails _$RemotePortDetailsFromJson(Map<String, dynamic> json) {
  return RemotePortDetails(
    port: json['port'] as int,
    portName: json['portName'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    accessKeyDetails: json['accessKeyDetails'] == null
        ? null
        : AccessKeyDetails.fromJson(
            json['accessKeyDetails'] as Map<String, dynamic>),
    instanceDetails: json['instanceDetails'] == null
        ? null
        : InstanceDetails.fromJson(
            json['instanceDetails'] as Map<String, dynamic>),
    resourceType: json['resourceType'] as String,
    s3BucketDetails: (json['s3BucketDetails'] as List)
        ?.map((e) => e == null
            ? null
            : S3BucketDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

S3BucketDetail _$S3BucketDetailFromJson(Map<String, dynamic> json) {
  return S3BucketDetail(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    defaultServerSideEncryption: json['defaultServerSideEncryption'] == null
        ? null
        : DefaultServerSideEncryption.fromJson(
            json['defaultServerSideEncryption'] as Map<String, dynamic>),
    name: json['name'] as String,
    owner: json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    publicAccess: json['publicAccess'] == null
        ? null
        : PublicAccess.fromJson(json['publicAccess'] as Map<String, dynamic>),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$S3LogsConfigurationToJson(S3LogsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enable', instance.enable);
  return val;
}

S3LogsConfigurationResult _$S3LogsConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return S3LogsConfigurationResult(
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['status']),
  );
}

SecurityGroup _$SecurityGroupFromJson(Map<String, dynamic> json) {
  return SecurityGroup(
    groupId: json['groupId'] as String,
    groupName: json['groupName'] as String,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    action: json['action'] == null
        ? null
        : Action.fromJson(json['action'] as Map<String, dynamic>),
    archived: json['archived'] as bool,
    count: json['count'] as int,
    detectorId: json['detectorId'] as String,
    eventFirstSeen: json['eventFirstSeen'] as String,
    eventLastSeen: json['eventLastSeen'] as String,
    evidence: json['evidence'] == null
        ? null
        : Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
    resourceRole: json['resourceRole'] as String,
    serviceName: json['serviceName'] as String,
    userFeedback: json['userFeedback'] as String,
  );
}

Map<String, dynamic> _$SortCriteriaToJson(SortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributeName', instance.attributeName);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$OrderByEnumMap = {
  OrderBy.asc: 'ASC',
  OrderBy.desc: 'DESC',
};

StartMonitoringMembersResponse _$StartMonitoringMembersResponseFromJson(
    Map<String, dynamic> json) {
  return StartMonitoringMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StopMonitoringMembersResponse _$StopMonitoringMembersResponseFromJson(
    Map<String, dynamic> json) {
  return StopMonitoringMembersResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

ThreatIntelligenceDetail _$ThreatIntelligenceDetailFromJson(
    Map<String, dynamic> json) {
  return ThreatIntelligenceDetail(
    threatListName: json['threatListName'] as String,
    threatNames:
        (json['threatNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Total _$TotalFromJson(Map<String, dynamic> json) {
  return Total(
    amount: json['amount'] as String,
    unit: json['unit'] as String,
  );
}

UnarchiveFindingsResponse _$UnarchiveFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return UnarchiveFindingsResponse();
}

UnprocessedAccount _$UnprocessedAccountFromJson(Map<String, dynamic> json) {
  return UnprocessedAccount(
    accountId: json['accountId'] as String,
    result: json['result'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDetectorResponse _$UpdateDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorResponse();
}

UpdateFilterResponse _$UpdateFilterResponseFromJson(Map<String, dynamic> json) {
  return UpdateFilterResponse(
    name: json['name'] as String,
  );
}

UpdateFindingsFeedbackResponse _$UpdateFindingsFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFindingsFeedbackResponse();
}

UpdateIPSetResponse _$UpdateIPSetResponseFromJson(Map<String, dynamic> json) {
  return UpdateIPSetResponse();
}

UpdateMemberDetectorsResponse _$UpdateMemberDetectorsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMemberDetectorsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateOrganizationConfigurationResponse
    _$UpdateOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateOrganizationConfigurationResponse();
}

UpdatePublishingDestinationResponse
    _$UpdatePublishingDestinationResponseFromJson(Map<String, dynamic> json) {
  return UpdatePublishingDestinationResponse();
}

UpdateThreatIntelSetResponse _$UpdateThreatIntelSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThreatIntelSetResponse();
}

UsageAccountResult _$UsageAccountResultFromJson(Map<String, dynamic> json) {
  return UsageAccountResult(
    accountId: json['accountId'] as String,
    total: json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsageCriteriaToJson(UsageCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSources',
      instance.dataSources?.map((e) => _$DataSourceEnumMap[e])?.toList());
  writeNotNull('accountIds', instance.accountIds);
  writeNotNull('resources', instance.resources);
  return val;
}

const _$DataSourceEnumMap = {
  DataSource.flowLogs: 'FLOW_LOGS',
  DataSource.cloudTrail: 'CLOUD_TRAIL',
  DataSource.dnsLogs: 'DNS_LOGS',
  DataSource.s3Logs: 'S3_LOGS',
};

UsageDataSourceResult _$UsageDataSourceResultFromJson(
    Map<String, dynamic> json) {
  return UsageDataSourceResult(
    dataSource: _$enumDecodeNullable(_$DataSourceEnumMap, json['dataSource']),
    total: json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>),
  );
}

UsageResourceResult _$UsageResourceResultFromJson(Map<String, dynamic> json) {
  return UsageResourceResult(
    resource: json['resource'] as String,
    total: json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>),
  );
}

UsageStatistics _$UsageStatisticsFromJson(Map<String, dynamic> json) {
  return UsageStatistics(
    sumByAccount: (json['sumByAccount'] as List)
        ?.map((e) => e == null
            ? null
            : UsageAccountResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sumByDataSource: (json['sumByDataSource'] as List)
        ?.map((e) => e == null
            ? null
            : UsageDataSourceResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sumByResource: (json['sumByResource'] as List)
        ?.map((e) => e == null
            ? null
            : UsageResourceResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topResources: (json['topResources'] as List)
        ?.map((e) => e == null
            ? null
            : UsageResourceResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
