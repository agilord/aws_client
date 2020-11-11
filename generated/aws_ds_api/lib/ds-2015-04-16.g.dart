// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ds-2015-04-16.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AcceptSharedDirectoryRequestToJson(
    AcceptSharedDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SharedDirectoryId', instance.sharedDirectoryId);
  return val;
}

AcceptSharedDirectoryResult _$AcceptSharedDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return AcceptSharedDirectoryResult(
    sharedDirectory: json['SharedDirectory'] == null
        ? null
        : SharedDirectory.fromJson(
            json['SharedDirectory'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddIpRoutesRequestToJson(AddIpRoutesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull(
      'IpRoutes', instance.ipRoutes?.map((e) => e?.toJson())?.toList());
  writeNotNull('UpdateSecurityGroupForDirectoryControllers',
      instance.updateSecurityGroupForDirectoryControllers);
  return val;
}

AddIpRoutesResult _$AddIpRoutesResultFromJson(Map<String, dynamic> json) {
  return AddIpRoutesResult();
}

Map<String, dynamic> _$AddTagsToResourceRequestToJson(
    AddTagsToResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
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

Map<String, dynamic> _$CancelSchemaExtensionRequestToJson(
    CancelSchemaExtensionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('SchemaExtensionId', instance.schemaExtensionId);
  return val;
}

CancelSchemaExtensionResult _$CancelSchemaExtensionResultFromJson(
    Map<String, dynamic> json) {
  return CancelSchemaExtensionResult();
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    certificateId: json['CertificateId'] as String,
    commonName: json['CommonName'] as String,
    expiryDateTime: unixTimestampFromJson(json['ExpiryDateTime']),
    registeredDateTime: unixTimestampFromJson(json['RegisteredDateTime']),
    state: _$enumDecodeNullable(_$CertificateStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
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

CertificateInfo _$CertificateInfoFromJson(Map<String, dynamic> json) {
  return CertificateInfo(
    certificateId: json['CertificateId'] as String,
    commonName: json['CommonName'] as String,
    expiryDateTime: unixTimestampFromJson(json['ExpiryDateTime']),
    state: _$enumDecodeNullable(_$CertificateStateEnumMap, json['State']),
  );
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

Map<String, dynamic> _$ConnectDirectoryRequestToJson(
    ConnectDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectSettings', instance.connectSettings?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('Password', instance.password);
  writeNotNull('Size', _$DirectorySizeEnumMap[instance.size]);
  writeNotNull('Description', instance.description);
  writeNotNull('ShortName', instance.shortName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$DirectorySizeEnumMap = {
  DirectorySize.small: 'Small',
  DirectorySize.large: 'Large',
};

ConnectDirectoryResult _$ConnectDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return ConnectDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

Map<String, dynamic> _$CreateAliasRequestToJson(CreateAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Alias', instance.alias);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

CreateAliasResult _$CreateAliasResultFromJson(Map<String, dynamic> json) {
  return CreateAliasResult(
    alias: json['Alias'] as String,
    directoryId: json['DirectoryId'] as String,
  );
}

Map<String, dynamic> _$CreateComputerRequestToJson(
    CreateComputerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComputerName', instance.computerName);
  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Password', instance.password);
  writeNotNull('ComputerAttributes',
      instance.computerAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('OrganizationalUnitDistinguishedName',
      instance.organizationalUnitDistinguishedName);
  return val;
}

CreateComputerResult _$CreateComputerResultFromJson(Map<String, dynamic> json) {
  return CreateComputerResult(
    computer: json['Computer'] == null
        ? null
        : Computer.fromJson(json['Computer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateConditionalForwarderRequestToJson(
    CreateConditionalForwarderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('DnsIpAddrs', instance.dnsIpAddrs);
  writeNotNull('RemoteDomainName', instance.remoteDomainName);
  return val;
}

CreateConditionalForwarderResult _$CreateConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return CreateConditionalForwarderResult();
}

Map<String, dynamic> _$CreateDirectoryRequestToJson(
    CreateDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Password', instance.password);
  writeNotNull('Size', _$DirectorySizeEnumMap[instance.size]);
  writeNotNull('Description', instance.description);
  writeNotNull('ShortName', instance.shortName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('VpcSettings', instance.vpcSettings?.toJson());
  return val;
}

CreateDirectoryResult _$CreateDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return CreateDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

Map<String, dynamic> _$CreateLogSubscriptionRequestToJson(
    CreateLogSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('LogGroupName', instance.logGroupName);
  return val;
}

CreateLogSubscriptionResult _$CreateLogSubscriptionResultFromJson(
    Map<String, dynamic> json) {
  return CreateLogSubscriptionResult();
}

Map<String, dynamic> _$CreateMicrosoftADRequestToJson(
    CreateMicrosoftADRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Password', instance.password);
  writeNotNull('VpcSettings', instance.vpcSettings?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Edition', _$DirectoryEditionEnumMap[instance.edition]);
  writeNotNull('ShortName', instance.shortName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$DirectoryEditionEnumMap = {
  DirectoryEdition.enterprise: 'Enterprise',
  DirectoryEdition.standard: 'Standard',
};

CreateMicrosoftADResult _$CreateMicrosoftADResultFromJson(
    Map<String, dynamic> json) {
  return CreateMicrosoftADResult(
    directoryId: json['DirectoryId'] as String,
  );
}

Map<String, dynamic> _$CreateSnapshotRequestToJson(
    CreateSnapshotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Name', instance.name);
  return val;
}

CreateSnapshotResult _$CreateSnapshotResultFromJson(Map<String, dynamic> json) {
  return CreateSnapshotResult(
    snapshotId: json['SnapshotId'] as String,
  );
}

Map<String, dynamic> _$CreateTrustRequestToJson(CreateTrustRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('RemoteDomainName', instance.remoteDomainName);
  writeNotNull(
      'TrustDirection', _$TrustDirectionEnumMap[instance.trustDirection]);
  writeNotNull('TrustPassword', instance.trustPassword);
  writeNotNull(
      'ConditionalForwarderIpAddrs', instance.conditionalForwarderIpAddrs);
  writeNotNull('SelectiveAuth', _$SelectiveAuthEnumMap[instance.selectiveAuth]);
  writeNotNull('TrustType', _$TrustTypeEnumMap[instance.trustType]);
  return val;
}

const _$TrustDirectionEnumMap = {
  TrustDirection.oneWayOutgoing: 'One-Way: Outgoing',
  TrustDirection.oneWayIncoming: 'One-Way: Incoming',
  TrustDirection.twoWay: 'Two-Way',
};

const _$SelectiveAuthEnumMap = {
  SelectiveAuth.enabled: 'Enabled',
  SelectiveAuth.disabled: 'Disabled',
};

const _$TrustTypeEnumMap = {
  TrustType.forest: 'Forest',
  TrustType.external: 'External',
};

CreateTrustResult _$CreateTrustResultFromJson(Map<String, dynamic> json) {
  return CreateTrustResult(
    trustId: json['TrustId'] as String,
  );
}

Map<String, dynamic> _$DeleteConditionalForwarderRequestToJson(
    DeleteConditionalForwarderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('RemoteDomainName', instance.remoteDomainName);
  return val;
}

DeleteConditionalForwarderResult _$DeleteConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return DeleteConditionalForwarderResult();
}

Map<String, dynamic> _$DeleteDirectoryRequestToJson(
    DeleteDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

DeleteDirectoryResult _$DeleteDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDirectoryResult(
    directoryId: json['DirectoryId'] as String,
  );
}

Map<String, dynamic> _$DeleteLogSubscriptionRequestToJson(
    DeleteLogSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

DeleteLogSubscriptionResult _$DeleteLogSubscriptionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteLogSubscriptionResult();
}

Map<String, dynamic> _$DeleteSnapshotRequestToJson(
    DeleteSnapshotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotId', instance.snapshotId);
  return val;
}

DeleteSnapshotResult _$DeleteSnapshotResultFromJson(Map<String, dynamic> json) {
  return DeleteSnapshotResult(
    snapshotId: json['SnapshotId'] as String,
  );
}

Map<String, dynamic> _$DeleteTrustRequestToJson(DeleteTrustRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrustId', instance.trustId);
  writeNotNull('DeleteAssociatedConditionalForwarder',
      instance.deleteAssociatedConditionalForwarder);
  return val;
}

DeleteTrustResult _$DeleteTrustResultFromJson(Map<String, dynamic> json) {
  return DeleteTrustResult(
    trustId: json['TrustId'] as String,
  );
}

Map<String, dynamic> _$DeregisterCertificateRequestToJson(
    DeregisterCertificateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateId', instance.certificateId);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

DeregisterCertificateResult _$DeregisterCertificateResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterCertificateResult();
}

Map<String, dynamic> _$DeregisterEventTopicRequestToJson(
    DeregisterEventTopicRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('TopicName', instance.topicName);
  return val;
}

DeregisterEventTopicResult _$DeregisterEventTopicResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterEventTopicResult();
}

Map<String, dynamic> _$DescribeCertificateRequestToJson(
    DescribeCertificateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateId', instance.certificateId);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

DescribeCertificateResult _$DescribeCertificateResultFromJson(
    Map<String, dynamic> json) {
  return DescribeCertificateResult(
    certificate: json['Certificate'] == null
        ? null
        : Certificate.fromJson(json['Certificate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeConditionalForwardersRequestToJson(
    DescribeConditionalForwardersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('RemoteDomainNames', instance.remoteDomainNames);
  return val;
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

Map<String, dynamic> _$DescribeDirectoriesRequestToJson(
    DescribeDirectoriesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryIds', instance.directoryIds);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$DescribeDomainControllersRequestToJson(
    DescribeDomainControllersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('DomainControllerIds', instance.domainControllerIds);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$DescribeEventTopicsRequestToJson(
    DescribeEventTopicsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('TopicNames', instance.topicNames);
  return val;
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

Map<String, dynamic> _$DescribeLDAPSSettingsRequestToJson(
    DescribeLDAPSSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Type', _$LDAPSTypeEnumMap[instance.type]);
  return val;
}

const _$LDAPSTypeEnumMap = {
  LDAPSType.client: 'Client',
};

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

Map<String, dynamic> _$DescribeSharedDirectoriesRequestToJson(
    DescribeSharedDirectoriesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OwnerDirectoryId', instance.ownerDirectoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SharedDirectoryIds', instance.sharedDirectoryIds);
  return val;
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

Map<String, dynamic> _$DescribeSnapshotsRequestToJson(
    DescribeSnapshotsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SnapshotIds', instance.snapshotIds);
  return val;
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

Map<String, dynamic> _$DescribeTrustsRequestToJson(
    DescribeTrustsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('TrustIds', instance.trustIds);
  return val;
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
    launchTime: unixTimestampFromJson(json['LaunchTime']),
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
    shareMethod:
        _$enumDecodeNullable(_$ShareMethodEnumMap, json['ShareMethod']),
    shareNotes: json['ShareNotes'] as String,
    shareStatus:
        _$enumDecodeNullable(_$ShareStatusEnumMap, json['ShareStatus']),
    shortName: json['ShortName'] as String,
    size: _$enumDecodeNullable(_$DirectorySizeEnumMap, json['Size']),
    ssoEnabled: json['SsoEnabled'] as bool,
    stage: _$enumDecodeNullable(_$DirectoryStageEnumMap, json['Stage']),
    stageLastUpdatedDateTime:
        unixTimestampFromJson(json['StageLastUpdatedDateTime']),
    stageReason: json['StageReason'] as String,
    type: _$enumDecodeNullable(_$DirectoryTypeEnumMap, json['Type']),
    vpcSettings: json['VpcSettings'] == null
        ? null
        : DirectoryVpcSettingsDescription.fromJson(
            json['VpcSettings'] as Map<String, dynamic>),
  );
}

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

Map<String, dynamic> _$DisableLDAPSRequestToJson(DisableLDAPSRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Type', _$LDAPSTypeEnumMap[instance.type]);
  return val;
}

DisableLDAPSResult _$DisableLDAPSResultFromJson(Map<String, dynamic> json) {
  return DisableLDAPSResult();
}

Map<String, dynamic> _$DisableRadiusRequestToJson(
    DisableRadiusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

DisableRadiusResult _$DisableRadiusResultFromJson(Map<String, dynamic> json) {
  return DisableRadiusResult();
}

Map<String, dynamic> _$DisableSsoRequestToJson(DisableSsoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Password', instance.password);
  writeNotNull('UserName', instance.userName);
  return val;
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
    launchTime: unixTimestampFromJson(json['LaunchTime']),
    status:
        _$enumDecodeNullable(_$DomainControllerStatusEnumMap, json['Status']),
    statusLastUpdatedDateTime:
        unixTimestampFromJson(json['StatusLastUpdatedDateTime']),
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

Map<String, dynamic> _$EnableLDAPSRequestToJson(EnableLDAPSRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Type', _$LDAPSTypeEnumMap[instance.type]);
  return val;
}

EnableLDAPSResult _$EnableLDAPSResultFromJson(Map<String, dynamic> json) {
  return EnableLDAPSResult();
}

Map<String, dynamic> _$EnableRadiusRequestToJson(EnableRadiusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('RadiusSettings', instance.radiusSettings?.toJson());
  return val;
}

EnableRadiusResult _$EnableRadiusResultFromJson(Map<String, dynamic> json) {
  return EnableRadiusResult();
}

Map<String, dynamic> _$EnableSsoRequestToJson(EnableSsoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Password', instance.password);
  writeNotNull('UserName', instance.userName);
  return val;
}

EnableSsoResult _$EnableSsoResultFromJson(Map<String, dynamic> json) {
  return EnableSsoResult();
}

EventTopic _$EventTopicFromJson(Map<String, dynamic> json) {
  return EventTopic(
    createdDateTime: unixTimestampFromJson(json['CreatedDateTime']),
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

Map<String, dynamic> _$GetSnapshotLimitsRequestToJson(
    GetSnapshotLimitsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  return val;
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
    addedDateTime: unixTimestampFromJson(json['AddedDateTime']),
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
    lastUpdatedDateTime: unixTimestampFromJson(json['LastUpdatedDateTime']),
  );
}

const _$LDAPSStatusEnumMap = {
  LDAPSStatus.enabling: 'Enabling',
  LDAPSStatus.enabled: 'Enabled',
  LDAPSStatus.enableFailed: 'EnableFailed',
  LDAPSStatus.disabled: 'Disabled',
};

Map<String, dynamic> _$ListCertificatesRequestToJson(
    ListCertificatesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

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

Map<String, dynamic> _$ListIpRoutesRequestToJson(ListIpRoutesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListLogSubscriptionsRequestToJson(
    ListLogSubscriptionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListSchemaExtensionsRequestToJson(
    ListSchemaExtensionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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
    subscriptionCreatedDateTime:
        unixTimestampFromJson(json['SubscriptionCreatedDateTime']),
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

Map<String, dynamic> _$RegisterCertificateRequestToJson(
    RegisterCertificateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateData', instance.certificateData);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

RegisterCertificateResult _$RegisterCertificateResultFromJson(
    Map<String, dynamic> json) {
  return RegisterCertificateResult(
    certificateId: json['CertificateId'] as String,
  );
}

Map<String, dynamic> _$RegisterEventTopicRequestToJson(
    RegisterEventTopicRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('TopicName', instance.topicName);
  return val;
}

RegisterEventTopicResult _$RegisterEventTopicResultFromJson(
    Map<String, dynamic> json) {
  return RegisterEventTopicResult();
}

Map<String, dynamic> _$RejectSharedDirectoryRequestToJson(
    RejectSharedDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SharedDirectoryId', instance.sharedDirectoryId);
  return val;
}

RejectSharedDirectoryResult _$RejectSharedDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return RejectSharedDirectoryResult(
    sharedDirectoryId: json['SharedDirectoryId'] as String,
  );
}

Map<String, dynamic> _$RemoveIpRoutesRequestToJson(
    RemoveIpRoutesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIps', instance.cidrIps);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

RemoveIpRoutesResult _$RemoveIpRoutesResultFromJson(Map<String, dynamic> json) {
  return RemoveIpRoutesResult();
}

Map<String, dynamic> _$RemoveTagsFromResourceRequestToJson(
    RemoveTagsFromResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

RemoveTagsFromResourceResult _$RemoveTagsFromResourceResultFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceResult();
}

Map<String, dynamic> _$ResetUserPasswordRequestToJson(
    ResetUserPasswordRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('NewPassword', instance.newPassword);
  writeNotNull('UserName', instance.userName);
  return val;
}

ResetUserPasswordResult _$ResetUserPasswordResultFromJson(
    Map<String, dynamic> json) {
  return ResetUserPasswordResult();
}

Map<String, dynamic> _$RestoreFromSnapshotRequestToJson(
    RestoreFromSnapshotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotId', instance.snapshotId);
  return val;
}

RestoreFromSnapshotResult _$RestoreFromSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return RestoreFromSnapshotResult();
}

SchemaExtensionInfo _$SchemaExtensionInfoFromJson(Map<String, dynamic> json) {
  return SchemaExtensionInfo(
    description: json['Description'] as String,
    directoryId: json['DirectoryId'] as String,
    endDateTime: unixTimestampFromJson(json['EndDateTime']),
    schemaExtensionId: json['SchemaExtensionId'] as String,
    schemaExtensionStatus: _$enumDecodeNullable(
        _$SchemaExtensionStatusEnumMap, json['SchemaExtensionStatus']),
    schemaExtensionStatusReason: json['SchemaExtensionStatusReason'] as String,
    startDateTime: unixTimestampFromJson(json['StartDateTime']),
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

Map<String, dynamic> _$ShareDirectoryRequestToJson(
    ShareDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('ShareMethod', _$ShareMethodEnumMap[instance.shareMethod]);
  writeNotNull('ShareTarget', instance.shareTarget?.toJson());
  writeNotNull('ShareNotes', instance.shareNotes);
  return val;
}

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
    createdDateTime: unixTimestampFromJson(json['CreatedDateTime']),
    lastUpdatedDateTime: unixTimestampFromJson(json['LastUpdatedDateTime']),
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
    startTime: unixTimestampFromJson(json['StartTime']),
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

Map<String, dynamic> _$StartSchemaExtensionRequestToJson(
    StartSchemaExtensionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreateSnapshotBeforeSchemaExtension',
      instance.createSnapshotBeforeSchemaExtension);
  writeNotNull('Description', instance.description);
  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('LdifContent', instance.ldifContent);
  return val;
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
    createdDateTime: unixTimestampFromJson(json['CreatedDateTime']),
    directoryId: json['DirectoryId'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['LastUpdatedDateTime']),
    remoteDomainName: json['RemoteDomainName'] as String,
    selectiveAuth:
        _$enumDecodeNullable(_$SelectiveAuthEnumMap, json['SelectiveAuth']),
    stateLastUpdatedDateTime:
        unixTimestampFromJson(json['StateLastUpdatedDateTime']),
    trustDirection:
        _$enumDecodeNullable(_$TrustDirectionEnumMap, json['TrustDirection']),
    trustId: json['TrustId'] as String,
    trustState: _$enumDecodeNullable(_$TrustStateEnumMap, json['TrustState']),
    trustStateReason: json['TrustStateReason'] as String,
    trustType: _$enumDecodeNullable(_$TrustTypeEnumMap, json['TrustType']),
  );
}

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

Map<String, dynamic> _$UnshareDirectoryRequestToJson(
    UnshareDirectoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('UnshareTarget', instance.unshareTarget?.toJson());
  return val;
}

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

Map<String, dynamic> _$UpdateConditionalForwarderRequestToJson(
    UpdateConditionalForwarderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('DnsIpAddrs', instance.dnsIpAddrs);
  writeNotNull('RemoteDomainName', instance.remoteDomainName);
  return val;
}

UpdateConditionalForwarderResult _$UpdateConditionalForwarderResultFromJson(
    Map<String, dynamic> json) {
  return UpdateConditionalForwarderResult();
}

Map<String, dynamic> _$UpdateNumberOfDomainControllersRequestToJson(
    UpdateNumberOfDomainControllersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DesiredNumber', instance.desiredNumber);
  writeNotNull('DirectoryId', instance.directoryId);
  return val;
}

UpdateNumberOfDomainControllersResult
    _$UpdateNumberOfDomainControllersResultFromJson(Map<String, dynamic> json) {
  return UpdateNumberOfDomainControllersResult();
}

Map<String, dynamic> _$UpdateRadiusRequestToJson(UpdateRadiusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('RadiusSettings', instance.radiusSettings?.toJson());
  return val;
}

UpdateRadiusResult _$UpdateRadiusResultFromJson(Map<String, dynamic> json) {
  return UpdateRadiusResult();
}

Map<String, dynamic> _$UpdateTrustRequestToJson(UpdateTrustRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrustId', instance.trustId);
  writeNotNull('SelectiveAuth', _$SelectiveAuthEnumMap[instance.selectiveAuth]);
  return val;
}

UpdateTrustResult _$UpdateTrustResultFromJson(Map<String, dynamic> json) {
  return UpdateTrustResult(
    requestId: json['RequestId'] as String,
    trustId: json['TrustId'] as String,
  );
}

Map<String, dynamic> _$VerifyTrustRequestToJson(VerifyTrustRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrustId', instance.trustId);
  return val;
}

VerifyTrustResult _$VerifyTrustResultFromJson(Map<String, dynamic> json) {
  return VerifyTrustResult(
    trustId: json['TrustId'] as String,
  );
}
