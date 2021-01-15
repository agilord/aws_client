// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-04-16.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptSharedDirectoryResult _$AcceptSharedDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return AcceptSharedDirectoryResult(
    sharedDirectory: json['SharedDirectory'] == null
        ? null
        : SharedDirectory.fromJson(
            json['SharedDirectory'] as Map<String, dynamic>),
  );
}

AddIpRoutesResult _$AddIpRoutesResultFromJson(Map<String, dynamic> json) {
  return AddIpRoutesResult();
}

AddRegionResult _$AddRegionResultFromJson(Map<String, dynamic> json) {
  return AddRegionResult();
}

AddTagsToResourceResult _$AddTagsToResourceResultFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceResult();
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) {
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

CancelSchemaExtensionResult _$CancelSchemaExtensionResultFromJson(
    Map<String, dynamic> json) {
  return CancelSchemaExtensionResult();
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    certificateId: json['CertificateId'] as String,
    clientCertAuthSettings: json['ClientCertAuthSettings'] == null
        ? null
        : ClientCertAuthSettings.fromJson(
            json['ClientCertAuthSettings'] as Map<String, dynamic>),
    commonName: json['CommonName'] as String,
    expiryDateTime:
        const UnixDateTimeConverter().fromJson(json['ExpiryDateTime']),
    registeredDateTime:
        const UnixDateTimeConverter().fromJson(json['RegisteredDateTime']),
    state: _$enumDecodeNullable(_$CertificateStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
    type: _$enumDecodeNullable(_$CertificateTypeEnumMap, json['Type']),
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

const _$CertificateStateEnumMap = {
  CertificateState.registering: 'Registering',
  CertificateState.registered: 'Registered',
  CertificateState.registerFailed: 'RegisterFailed',
  CertificateState.deregistering: 'Deregistering',
  CertificateState.deregistered: 'Deregistered',
  CertificateState.deregisterFailed: 'DeregisterFailed',
};

const _$CertificateTypeEnumMap = {
  CertificateType.clientCertAuth: 'ClientCertAuth',
  CertificateType.clientLDAPS: 'ClientLDAPS',
};

CertificateInfo _$CertificateInfoFromJson(Map<String, dynamic> json) {
  return CertificateInfo(
    certificateId: json['CertificateId'] as String,
    commonName: json['CommonName'] as String,
    expiryDateTime:
        const UnixDateTimeConverter().fromJson(json['ExpiryDateTime']),
    state: _$enumDecodeNullable(_$CertificateStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$CertificateTypeEnumMap, json['Type']),
  );
}

ClientCertAuthSettings _$ClientCertAuthSettingsFromJson(
    Map<String, dynamic> json) {
  return ClientCertAuthSettings(
    oCSPUrl: json['OCSPUrl'] as String,
  );
}

Map<String, dynamic> _$ClientCertAuthSettingsToJson(
    ClientCertAuthSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OCSPUrl', instance.oCSPUrl);
  return val;
}

Computer _$ComputerFromJson(Map<String, dynamic> json) {
  return Computer(
    computerAttributes: (json['ComputerAttributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    computerId: json['ComputerId'] as String,
    computerName: json['ComputerName'] as String,
  );
}

ConditionalForwarder _$ConditionalForwarderFromJson(Map<String, dynamic> json) {
  return ConditionalForwarder(
    dnsIpAddrs: (json['DnsIpAddrs'] as List)?.map((e) => e as String)?.toList(),
    remoteDomainName: json['RemoteDomainName'] as String,
    replicationScope: _$enumDecodeNullable(
        _$ReplicationScopeEnumMap, json['ReplicationScope']),
  );
}

const _$ReplicationScopeEnumMap = {
  ReplicationScope.domain: 'Domain',
};

ConnectDirectoryResult _$ConnectDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return ConnectDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

CreateAliasResult _$CreateAliasResultFromJson(Map<String, dynamic> json) {
  return CreateAliasResult(
    alias: json['Alias'] as String,
    directoryId: json['DirectoryId'] as String,
  );
}

CreateComputerResult _$CreateComputerResultFromJson(Map<String, dynamic> json) {
  return CreateComputerResult(
    computer: json['Computer'] == null
        ? null
        : Computer.fromJson(json['Computer'] as Map<String, dynamic>),
  );
}

CreateConditionalForwarderResult _$CreateConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return CreateConditionalForwarderResult();
}

CreateDirectoryResult _$CreateDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return CreateDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

CreateLogSubscriptionResult _$CreateLogSubscriptionResultFromJson(
    Map<String, dynamic> json) {
  return CreateLogSubscriptionResult();
}

CreateMicrosoftADResult _$CreateMicrosoftADResultFromJson(
    Map<String, dynamic> json) {
  return CreateMicrosoftADResult(
    directoryId: json['DirectoryId'] as String,
  );
}

CreateSnapshotResult _$CreateSnapshotResultFromJson(Map<String, dynamic> json) {
  return CreateSnapshotResult(
    snapshotId: json['SnapshotId'] as String,
  );
}

CreateTrustResult _$CreateTrustResultFromJson(Map<String, dynamic> json) {
  return CreateTrustResult(
    trustId: json['TrustId'] as String,
  );
}

DeleteConditionalForwarderResult _$DeleteConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return DeleteConditionalForwarderResult();
}

DeleteDirectoryResult _$DeleteDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

DeleteLogSubscriptionResult _$DeleteLogSubscriptionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteLogSubscriptionResult();
}

DeleteSnapshotResult _$DeleteSnapshotResultFromJson(Map<String, dynamic> json) {
  return DeleteSnapshotResult(
    snapshotId: json['SnapshotId'] as String,
  );
}

DeleteTrustResult _$DeleteTrustResultFromJson(Map<String, dynamic> json) {
  return DeleteTrustResult(
    trustId: json['TrustId'] as String,
  );
}

DeregisterCertificateResult _$DeregisterCertificateResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterCertificateResult();
}

DeregisterEventTopicResult _$DeregisterEventTopicResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterEventTopicResult();
}

DescribeCertificateResult _$DescribeCertificateResultFromJson(
    Map<String, dynamic> json) {
  return DescribeCertificateResult(
    certificate: json['Certificate'] == null
        ? null
        : Certificate.fromJson(json['Certificate'] as Map<String, dynamic>),
  );
}

DescribeConditionalForwardersResult
    _$DescribeConditionalForwardersResultFromJson(Map<String, dynamic> json) {
  return DescribeConditionalForwardersResult(
    conditionalForwarders: (json['ConditionalForwarders'] as List)
        ?.map((e) => e == null
            ? null
            : ConditionalForwarder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDirectoriesResult _$DescribeDirectoriesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDirectoriesResult(
    directoryDescriptions: (json['DirectoryDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : DirectoryDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeDomainControllersResult _$DescribeDomainControllersResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDomainControllersResult(
    domainControllers: (json['DomainControllers'] as List)
        ?.map((e) => e == null
            ? null
            : DomainController.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeEventTopicsResult _$DescribeEventTopicsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeEventTopicsResult(
    eventTopics: (json['EventTopics'] as List)
        ?.map((e) =>
            e == null ? null : EventTopic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeLDAPSSettingsResult _$DescribeLDAPSSettingsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeLDAPSSettingsResult(
    lDAPSSettingsInfo: (json['LDAPSSettingsInfo'] as List)
        ?.map((e) => e == null
            ? null
            : LDAPSSettingInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeRegionsResult _$DescribeRegionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeRegionsResult(
    nextToken: json['NextToken'] as String,
    regionsDescription: (json['RegionsDescription'] as List)
        ?.map((e) => e == null
            ? null
            : RegionDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSharedDirectoriesResult _$DescribeSharedDirectoriesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeSharedDirectoriesResult(
    nextToken: json['NextToken'] as String,
    sharedDirectories: (json['SharedDirectories'] as List)
        ?.map((e) => e == null
            ? null
            : SharedDirectory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSnapshotsResult _$DescribeSnapshotsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeSnapshotsResult(
    nextToken: json['NextToken'] as String,
    snapshots: (json['Snapshots'] as List)
        ?.map((e) =>
            e == null ? null : Snapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTrustsResult _$DescribeTrustsResultFromJson(Map<String, dynamic> json) {
  return DescribeTrustsResult(
    nextToken: json['NextToken'] as String,
    trusts: (json['Trusts'] as List)
        ?.map(
            (e) => e == null ? null : Trust.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DirectoryConnectSettingsToJson(
    DirectoryConnectSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomerDnsIps', instance.customerDnsIps);
  writeNotNull('CustomerUserName', instance.customerUserName);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

DirectoryConnectSettingsDescription
    _$DirectoryConnectSettingsDescriptionFromJson(Map<String, dynamic> json) {
  return DirectoryConnectSettingsDescription(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    connectIps: (json['ConnectIps'] as List)?.map((e) => e as String)?.toList(),
    customerUserName: json['CustomerUserName'] as String,
    securityGroupId: json['SecurityGroupId'] as String,
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

DirectoryDescription _$DirectoryDescriptionFromJson(Map<String, dynamic> json) {
  return DirectoryDescription(
    accessUrl: json['AccessUrl'] as String,
    alias: json['Alias'] as String,
    connectSettings: json['ConnectSettings'] == null
        ? null
        : DirectoryConnectSettingsDescription.fromJson(
            json['ConnectSettings'] as Map<String, dynamic>),
    description: json['Description'] as String,
    desiredNumberOfDomainControllers:
        json['DesiredNumberOfDomainControllers'] as int,
    directoryId: json['DirectoryId'] as String,
    dnsIpAddrs: (json['DnsIpAddrs'] as List)?.map((e) => e as String)?.toList(),
    edition: _$enumDecodeNullable(_$DirectoryEditionEnumMap, json['Edition']),
    launchTime: const UnixDateTimeConverter().fromJson(json['LaunchTime']),
    name: json['Name'] as String,
    ownerDirectoryDescription: json['OwnerDirectoryDescription'] == null
        ? null
        : OwnerDirectoryDescription.fromJson(
            json['OwnerDirectoryDescription'] as Map<String, dynamic>),
    radiusSettings: json['RadiusSettings'] == null
        ? null
        : RadiusSettings.fromJson(
            json['RadiusSettings'] as Map<String, dynamic>),
    radiusStatus:
        _$enumDecodeNullable(_$RadiusStatusEnumMap, json['RadiusStatus']),
    regionsInfo: json['RegionsInfo'] == null
        ? null
        : RegionsInfo.fromJson(json['RegionsInfo'] as Map<String, dynamic>),
    shareMethod:
        _$enumDecodeNullable(_$ShareMethodEnumMap, json['ShareMethod']),
    shareNotes: json['ShareNotes'] as String,
    shareStatus:
        _$enumDecodeNullable(_$ShareStatusEnumMap, json['ShareStatus']),
    shortName: json['ShortName'] as String,
    size: _$enumDecodeNullable(_$DirectorySizeEnumMap, json['Size']),
    ssoEnabled: json['SsoEnabled'] as bool,
    stage: _$enumDecodeNullable(_$DirectoryStageEnumMap, json['Stage']),
    stageLastUpdatedDateTime: const UnixDateTimeConverter()
        .fromJson(json['StageLastUpdatedDateTime']),
    stageReason: json['StageReason'] as String,
    type: _$enumDecodeNullable(_$DirectoryTypeEnumMap, json['Type']),
    vpcSettings: json['VpcSettings'] == null
        ? null
        : DirectoryVpcSettingsDescription.fromJson(
            json['VpcSettings'] as Map<String, dynamic>),
  );
}

const _$DirectoryEditionEnumMap = {
  DirectoryEdition.enterprise: 'Enterprise',
  DirectoryEdition.standard: 'Standard',
};

const _$RadiusStatusEnumMap = {
  RadiusStatus.creating: 'Creating',
  RadiusStatus.completed: 'Completed',
  RadiusStatus.failed: 'Failed',
};

const _$ShareMethodEnumMap = {
  ShareMethod.organizations: 'ORGANIZATIONS',
  ShareMethod.handshake: 'HANDSHAKE',
};

const _$ShareStatusEnumMap = {
  ShareStatus.shared: 'Shared',
  ShareStatus.pendingAcceptance: 'PendingAcceptance',
  ShareStatus.rejected: 'Rejected',
  ShareStatus.rejecting: 'Rejecting',
  ShareStatus.rejectFailed: 'RejectFailed',
  ShareStatus.sharing: 'Sharing',
  ShareStatus.shareFailed: 'ShareFailed',
  ShareStatus.deleted: 'Deleted',
  ShareStatus.deleting: 'Deleting',
};

const _$DirectorySizeEnumMap = {
  DirectorySize.small: 'Small',
  DirectorySize.large: 'Large',
};

const _$DirectoryStageEnumMap = {
  DirectoryStage.requested: 'Requested',
  DirectoryStage.creating: 'Creating',
  DirectoryStage.created: 'Created',
  DirectoryStage.active: 'Active',
  DirectoryStage.inoperable: 'Inoperable',
  DirectoryStage.impaired: 'Impaired',
  DirectoryStage.restoring: 'Restoring',
  DirectoryStage.restoreFailed: 'RestoreFailed',
  DirectoryStage.deleting: 'Deleting',
  DirectoryStage.deleted: 'Deleted',
  DirectoryStage.failed: 'Failed',
};

const _$DirectoryTypeEnumMap = {
  DirectoryType.simpleAD: 'SimpleAD',
  DirectoryType.aDConnector: 'ADConnector',
  DirectoryType.microsoftAD: 'MicrosoftAD',
  DirectoryType.sharedMicrosoftAD: 'SharedMicrosoftAD',
};

DirectoryLimits _$DirectoryLimitsFromJson(Map<String, dynamic> json) {
  return DirectoryLimits(
    cloudOnlyDirectoriesCurrentCount:
        json['CloudOnlyDirectoriesCurrentCount'] as int,
    cloudOnlyDirectoriesLimit: json['CloudOnlyDirectoriesLimit'] as int,
    cloudOnlyDirectoriesLimitReached:
        json['CloudOnlyDirectoriesLimitReached'] as bool,
    cloudOnlyMicrosoftADCurrentCount:
        json['CloudOnlyMicrosoftADCurrentCount'] as int,
    cloudOnlyMicrosoftADLimit: json['CloudOnlyMicrosoftADLimit'] as int,
    cloudOnlyMicrosoftADLimitReached:
        json['CloudOnlyMicrosoftADLimitReached'] as bool,
    connectedDirectoriesCurrentCount:
        json['ConnectedDirectoriesCurrentCount'] as int,
    connectedDirectoriesLimit: json['ConnectedDirectoriesLimit'] as int,
    connectedDirectoriesLimitReached:
        json['ConnectedDirectoriesLimitReached'] as bool,
  );
}

DirectoryVpcSettings _$DirectoryVpcSettingsFromJson(Map<String, dynamic> json) {
  return DirectoryVpcSettings(
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$DirectoryVpcSettingsToJson(
    DirectoryVpcSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

DirectoryVpcSettingsDescription _$DirectoryVpcSettingsDescriptionFromJson(
    Map<String, dynamic> json) {
  return DirectoryVpcSettingsDescription(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    securityGroupId: json['SecurityGroupId'] as String,
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

DisableClientAuthenticationResult _$DisableClientAuthenticationResultFromJson(
    Map<String, dynamic> json) {
  return DisableClientAuthenticationResult();
}

DisableLDAPSResult _$DisableLDAPSResultFromJson(Map<String, dynamic> json) {
  return DisableLDAPSResult();
}

DisableRadiusResult _$DisableRadiusResultFromJson(Map<String, dynamic> json) {
  return DisableRadiusResult();
}

DisableSsoResult _$DisableSsoResultFromJson(Map<String, dynamic> json) {
  return DisableSsoResult();
}

DomainController _$DomainControllerFromJson(Map<String, dynamic> json) {
  return DomainController(
    availabilityZone: json['AvailabilityZone'] as String,
    directoryId: json['DirectoryId'] as String,
    dnsIpAddr: json['DnsIpAddr'] as String,
    domainControllerId: json['DomainControllerId'] as String,
    launchTime: const UnixDateTimeConverter().fromJson(json['LaunchTime']),
    status:
        _$enumDecodeNullable(_$DomainControllerStatusEnumMap, json['Status']),
    statusLastUpdatedDateTime: const UnixDateTimeConverter()
        .fromJson(json['StatusLastUpdatedDateTime']),
    statusReason: json['StatusReason'] as String,
    subnetId: json['SubnetId'] as String,
    vpcId: json['VpcId'] as String,
  );
}

const _$DomainControllerStatusEnumMap = {
  DomainControllerStatus.creating: 'Creating',
  DomainControllerStatus.active: 'Active',
  DomainControllerStatus.impaired: 'Impaired',
  DomainControllerStatus.restoring: 'Restoring',
  DomainControllerStatus.deleting: 'Deleting',
  DomainControllerStatus.deleted: 'Deleted',
  DomainControllerStatus.failed: 'Failed',
};

EnableClientAuthenticationResult _$EnableClientAuthenticationResultFromJson(
    Map<String, dynamic> json) {
  return EnableClientAuthenticationResult();
}

EnableLDAPSResult _$EnableLDAPSResultFromJson(Map<String, dynamic> json) {
  return EnableLDAPSResult();
}

EnableRadiusResult _$EnableRadiusResultFromJson(Map<String, dynamic> json) {
  return EnableRadiusResult();
}

EnableSsoResult _$EnableSsoResultFromJson(Map<String, dynamic> json) {
  return EnableSsoResult();
}

EventTopic _$EventTopicFromJson(Map<String, dynamic> json) {
  return EventTopic(
    createdDateTime:
        const UnixDateTimeConverter().fromJson(json['CreatedDateTime']),
    directoryId: json['DirectoryId'] as String,
    status: _$enumDecodeNullable(_$TopicStatusEnumMap, json['Status']),
    topicArn: json['TopicArn'] as String,
    topicName: json['TopicName'] as String,
  );
}

const _$TopicStatusEnumMap = {
  TopicStatus.registered: 'Registered',
  TopicStatus.topicNotFound: 'Topic not found',
  TopicStatus.failed: 'Failed',
  TopicStatus.deleted: 'Deleted',
};

GetDirectoryLimitsResult _$GetDirectoryLimitsResultFromJson(
    Map<String, dynamic> json) {
  return GetDirectoryLimitsResult(
    directoryLimits: json['DirectoryLimits'] == null
        ? null
        : DirectoryLimits.fromJson(
            json['DirectoryLimits'] as Map<String, dynamic>),
  );
}

GetSnapshotLimitsResult _$GetSnapshotLimitsResultFromJson(
    Map<String, dynamic> json) {
  return GetSnapshotLimitsResult(
    snapshotLimits: json['SnapshotLimits'] == null
        ? null
        : SnapshotLimits.fromJson(
            json['SnapshotLimits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IpRouteToJson(IpRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIp', instance.cidrIp);
  writeNotNull('Description', instance.description);
  return val;
}

IpRouteInfo _$IpRouteInfoFromJson(Map<String, dynamic> json) {
  return IpRouteInfo(
    addedDateTime:
        const UnixDateTimeConverter().fromJson(json['AddedDateTime']),
    cidrIp: json['CidrIp'] as String,
    description: json['Description'] as String,
    directoryId: json['DirectoryId'] as String,
    ipRouteStatusMsg: _$enumDecodeNullable(
        _$IpRouteStatusMsgEnumMap, json['IpRouteStatusMsg']),
    ipRouteStatusReason: json['IpRouteStatusReason'] as String,
  );
}

const _$IpRouteStatusMsgEnumMap = {
  IpRouteStatusMsg.adding: 'Adding',
  IpRouteStatusMsg.added: 'Added',
  IpRouteStatusMsg.removing: 'Removing',
  IpRouteStatusMsg.removed: 'Removed',
  IpRouteStatusMsg.addFailed: 'AddFailed',
  IpRouteStatusMsg.removeFailed: 'RemoveFailed',
};

LDAPSSettingInfo _$LDAPSSettingInfoFromJson(Map<String, dynamic> json) {
  return LDAPSSettingInfo(
    lDAPSStatus:
        _$enumDecodeNullable(_$LDAPSStatusEnumMap, json['LDAPSStatus']),
    lDAPSStatusReason: json['LDAPSStatusReason'] as String,
    lastUpdatedDateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDateTime']),
  );
}

const _$LDAPSStatusEnumMap = {
  LDAPSStatus.enabling: 'Enabling',
  LDAPSStatus.enabled: 'Enabled',
  LDAPSStatus.enableFailed: 'EnableFailed',
  LDAPSStatus.disabled: 'Disabled',
};

ListCertificatesResult _$ListCertificatesResultFromJson(
    Map<String, dynamic> json) {
  return ListCertificatesResult(
    certificatesInfo: (json['CertificatesInfo'] as List)
        ?.map((e) => e == null
            ? null
            : CertificateInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIpRoutesResult _$ListIpRoutesResultFromJson(Map<String, dynamic> json) {
  return ListIpRoutesResult(
    ipRoutesInfo: (json['IpRoutesInfo'] as List)
        ?.map((e) =>
            e == null ? null : IpRouteInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLogSubscriptionsResult _$ListLogSubscriptionsResultFromJson(
    Map<String, dynamic> json) {
  return ListLogSubscriptionsResult(
    logSubscriptions: (json['LogSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : LogSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSchemaExtensionsResult _$ListSchemaExtensionsResultFromJson(
    Map<String, dynamic> json) {
  return ListSchemaExtensionsResult(
    nextToken: json['NextToken'] as String,
    schemaExtensionsInfo: (json['SchemaExtensionsInfo'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaExtensionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogSubscription _$LogSubscriptionFromJson(Map<String, dynamic> json) {
  return LogSubscription(
    directoryId: json['DirectoryId'] as String,
    logGroupName: json['LogGroupName'] as String,
    subscriptionCreatedDateTime: const UnixDateTimeConverter()
        .fromJson(json['SubscriptionCreatedDateTime']),
  );
}

OwnerDirectoryDescription _$OwnerDirectoryDescriptionFromJson(
    Map<String, dynamic> json) {
  return OwnerDirectoryDescription(
    accountId: json['AccountId'] as String,
    directoryId: json['DirectoryId'] as String,
    dnsIpAddrs: (json['DnsIpAddrs'] as List)?.map((e) => e as String)?.toList(),
    radiusSettings: json['RadiusSettings'] == null
        ? null
        : RadiusSettings.fromJson(
            json['RadiusSettings'] as Map<String, dynamic>),
    radiusStatus:
        _$enumDecodeNullable(_$RadiusStatusEnumMap, json['RadiusStatus']),
    vpcSettings: json['VpcSettings'] == null
        ? null
        : DirectoryVpcSettingsDescription.fromJson(
            json['VpcSettings'] as Map<String, dynamic>),
  );
}

RadiusSettings _$RadiusSettingsFromJson(Map<String, dynamic> json) {
  return RadiusSettings(
    authenticationProtocol: _$enumDecodeNullable(
        _$RadiusAuthenticationProtocolEnumMap, json['AuthenticationProtocol']),
    displayLabel: json['DisplayLabel'] as String,
    radiusPort: json['RadiusPort'] as int,
    radiusRetries: json['RadiusRetries'] as int,
    radiusServers:
        (json['RadiusServers'] as List)?.map((e) => e as String)?.toList(),
    radiusTimeout: json['RadiusTimeout'] as int,
    sharedSecret: json['SharedSecret'] as String,
    useSameUsername: json['UseSameUsername'] as bool,
  );
}

Map<String, dynamic> _$RadiusSettingsToJson(RadiusSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationProtocol',
      _$RadiusAuthenticationProtocolEnumMap[instance.authenticationProtocol]);
  writeNotNull('DisplayLabel', instance.displayLabel);
  writeNotNull('RadiusPort', instance.radiusPort);
  writeNotNull('RadiusRetries', instance.radiusRetries);
  writeNotNull('RadiusServers', instance.radiusServers);
  writeNotNull('RadiusTimeout', instance.radiusTimeout);
  writeNotNull('SharedSecret', instance.sharedSecret);
  writeNotNull('UseSameUsername', instance.useSameUsername);
  return val;
}

const _$RadiusAuthenticationProtocolEnumMap = {
  RadiusAuthenticationProtocol.pap: 'PAP',
  RadiusAuthenticationProtocol.chap: 'CHAP',
  RadiusAuthenticationProtocol.msCHAPv1: 'MS-CHAPv1',
  RadiusAuthenticationProtocol.msCHAPv2: 'MS-CHAPv2',
};

RegionDescription _$RegionDescriptionFromJson(Map<String, dynamic> json) {
  return RegionDescription(
    desiredNumberOfDomainControllers:
        json['DesiredNumberOfDomainControllers'] as int,
    directoryId: json['DirectoryId'] as String,
    lastUpdatedDateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDateTime']),
    launchTime: const UnixDateTimeConverter().fromJson(json['LaunchTime']),
    regionName: json['RegionName'] as String,
    regionType: _$enumDecodeNullable(_$RegionTypeEnumMap, json['RegionType']),
    status: _$enumDecodeNullable(_$DirectoryStageEnumMap, json['Status']),
    statusLastUpdatedDateTime: const UnixDateTimeConverter()
        .fromJson(json['StatusLastUpdatedDateTime']),
    vpcSettings: json['VpcSettings'] == null
        ? null
        : DirectoryVpcSettings.fromJson(
            json['VpcSettings'] as Map<String, dynamic>),
  );
}

const _$RegionTypeEnumMap = {
  RegionType.primary: 'Primary',
  RegionType.additional: 'Additional',
};

RegionsInfo _$RegionsInfoFromJson(Map<String, dynamic> json) {
  return RegionsInfo(
    additionalRegions:
        (json['AdditionalRegions'] as List)?.map((e) => e as String)?.toList(),
    primaryRegion: json['PrimaryRegion'] as String,
  );
}

RegisterCertificateResult _$RegisterCertificateResultFromJson(
    Map<String, dynamic> json) {
  return RegisterCertificateResult(
    certificateId: json['CertificateId'] as String,
  );
}

RegisterEventTopicResult _$RegisterEventTopicResultFromJson(
    Map<String, dynamic> json) {
  return RegisterEventTopicResult();
}

RejectSharedDirectoryResult _$RejectSharedDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return RejectSharedDirectoryResult(
    sharedDirectoryId: json['SharedDirectoryId'] as String,
  );
}

RemoveIpRoutesResult _$RemoveIpRoutesResultFromJson(Map<String, dynamic> json) {
  return RemoveIpRoutesResult();
}

RemoveRegionResult _$RemoveRegionResultFromJson(Map<String, dynamic> json) {
  return RemoveRegionResult();
}

RemoveTagsFromResourceResult _$RemoveTagsFromResourceResultFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceResult();
}

ResetUserPasswordResult _$ResetUserPasswordResultFromJson(
    Map<String, dynamic> json) {
  return ResetUserPasswordResult();
}

RestoreFromSnapshotResult _$RestoreFromSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return RestoreFromSnapshotResult();
}

SchemaExtensionInfo _$SchemaExtensionInfoFromJson(Map<String, dynamic> json) {
  return SchemaExtensionInfo(
    description: json['Description'] as String,
    directoryId: json['DirectoryId'] as String,
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    schemaExtensionId: json['SchemaExtensionId'] as String,
    schemaExtensionStatus: _$enumDecodeNullable(
        _$SchemaExtensionStatusEnumMap, json['SchemaExtensionStatus']),
    schemaExtensionStatusReason: json['SchemaExtensionStatusReason'] as String,
    startDateTime:
        const UnixDateTimeConverter().fromJson(json['StartDateTime']),
  );
}

const _$SchemaExtensionStatusEnumMap = {
  SchemaExtensionStatus.initializing: 'Initializing',
  SchemaExtensionStatus.creatingSnapshot: 'CreatingSnapshot',
  SchemaExtensionStatus.updatingSchema: 'UpdatingSchema',
  SchemaExtensionStatus.replicating: 'Replicating',
  SchemaExtensionStatus.cancelInProgress: 'CancelInProgress',
  SchemaExtensionStatus.rollbackInProgress: 'RollbackInProgress',
  SchemaExtensionStatus.cancelled: 'Cancelled',
  SchemaExtensionStatus.failed: 'Failed',
  SchemaExtensionStatus.completed: 'Completed',
};

ShareDirectoryResult _$ShareDirectoryResultFromJson(Map<String, dynamic> json) {
  return ShareDirectoryResult(
    sharedDirectoryId: json['SharedDirectoryId'] as String,
  );
}

Map<String, dynamic> _$ShareTargetToJson(ShareTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', _$TargetTypeEnumMap[instance.type]);
  return val;
}

const _$TargetTypeEnumMap = {
  TargetType.account: 'ACCOUNT',
};

SharedDirectory _$SharedDirectoryFromJson(Map<String, dynamic> json) {
  return SharedDirectory(
    createdDateTime:
        const UnixDateTimeConverter().fromJson(json['CreatedDateTime']),
    lastUpdatedDateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDateTime']),
    ownerAccountId: json['OwnerAccountId'] as String,
    ownerDirectoryId: json['OwnerDirectoryId'] as String,
    shareMethod:
        _$enumDecodeNullable(_$ShareMethodEnumMap, json['ShareMethod']),
    shareNotes: json['ShareNotes'] as String,
    shareStatus:
        _$enumDecodeNullable(_$ShareStatusEnumMap, json['ShareStatus']),
    sharedAccountId: json['SharedAccountId'] as String,
    sharedDirectoryId: json['SharedDirectoryId'] as String,
  );
}

Snapshot _$SnapshotFromJson(Map<String, dynamic> json) {
  return Snapshot(
    directoryId: json['DirectoryId'] as String,
    name: json['Name'] as String,
    snapshotId: json['SnapshotId'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$SnapshotStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$SnapshotTypeEnumMap, json['Type']),
  );
}

const _$SnapshotStatusEnumMap = {
  SnapshotStatus.creating: 'Creating',
  SnapshotStatus.completed: 'Completed',
  SnapshotStatus.failed: 'Failed',
};

const _$SnapshotTypeEnumMap = {
  SnapshotType.auto: 'Auto',
  SnapshotType.manual: 'Manual',
};

SnapshotLimits _$SnapshotLimitsFromJson(Map<String, dynamic> json) {
  return SnapshotLimits(
    manualSnapshotsCurrentCount: json['ManualSnapshotsCurrentCount'] as int,
    manualSnapshotsLimit: json['ManualSnapshotsLimit'] as int,
    manualSnapshotsLimitReached: json['ManualSnapshotsLimitReached'] as bool,
  );
}

StartSchemaExtensionResult _$StartSchemaExtensionResultFromJson(
    Map<String, dynamic> json) {
  return StartSchemaExtensionResult(
    schemaExtensionId: json['SchemaExtensionId'] as String,
  );
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

Trust _$TrustFromJson(Map<String, dynamic> json) {
  return Trust(
    createdDateTime:
        const UnixDateTimeConverter().fromJson(json['CreatedDateTime']),
    directoryId: json['DirectoryId'] as String,
    lastUpdatedDateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDateTime']),
    remoteDomainName: json['RemoteDomainName'] as String,
    selectiveAuth:
        _$enumDecodeNullable(_$SelectiveAuthEnumMap, json['SelectiveAuth']),
    stateLastUpdatedDateTime: const UnixDateTimeConverter()
        .fromJson(json['StateLastUpdatedDateTime']),
    trustDirection:
        _$enumDecodeNullable(_$TrustDirectionEnumMap, json['TrustDirection']),
    trustId: json['TrustId'] as String,
    trustState: _$enumDecodeNullable(_$TrustStateEnumMap, json['TrustState']),
    trustStateReason: json['TrustStateReason'] as String,
    trustType: _$enumDecodeNullable(_$TrustTypeEnumMap, json['TrustType']),
  );
}

const _$SelectiveAuthEnumMap = {
  SelectiveAuth.enabled: 'Enabled',
  SelectiveAuth.disabled: 'Disabled',
};

const _$TrustDirectionEnumMap = {
  TrustDirection.oneWayOutgoing: 'One-Way: Outgoing',
  TrustDirection.oneWayIncoming: 'One-Way: Incoming',
  TrustDirection.twoWay: 'Two-Way',
};

const _$TrustStateEnumMap = {
  TrustState.creating: 'Creating',
  TrustState.created: 'Created',
  TrustState.verifying: 'Verifying',
  TrustState.verifyFailed: 'VerifyFailed',
  TrustState.verified: 'Verified',
  TrustState.updating: 'Updating',
  TrustState.updateFailed: 'UpdateFailed',
  TrustState.updated: 'Updated',
  TrustState.deleting: 'Deleting',
  TrustState.deleted: 'Deleted',
  TrustState.failed: 'Failed',
};

const _$TrustTypeEnumMap = {
  TrustType.forest: 'Forest',
  TrustType.external: 'External',
};

UnshareDirectoryResult _$UnshareDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return UnshareDirectoryResult(
    sharedDirectoryId: json['SharedDirectoryId'] as String,
  );
}

Map<String, dynamic> _$UnshareTargetToJson(UnshareTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', _$TargetTypeEnumMap[instance.type]);
  return val;
}

UpdateConditionalForwarderResult _$UpdateConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return UpdateConditionalForwarderResult();
}

UpdateNumberOfDomainControllersResult
    _$UpdateNumberOfDomainControllersResultFromJson(Map<String, dynamic> json) {
  return UpdateNumberOfDomainControllersResult();
}

UpdateRadiusResult _$UpdateRadiusResultFromJson(Map<String, dynamic> json) {
  return UpdateRadiusResult();
}

UpdateTrustResult _$UpdateTrustResultFromJson(Map<String, dynamic> json) {
  return UpdateTrustResult(
    requestId: json['RequestId'] as String,
    trustId: json['TrustId'] as String,
  );
}

VerifyTrustResult _$VerifyTrustResultFromJson(Map<String, dynamic> json) {
  return VerifyTrustResult(
    trustId: json['TrustId'] as String,
  );
}
