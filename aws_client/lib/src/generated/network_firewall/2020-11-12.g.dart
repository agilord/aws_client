// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionDefinition _$ActionDefinitionFromJson(Map<String, dynamic> json) {
  return ActionDefinition(
    publishMetricAction: json['PublishMetricAction'] == null
        ? null
        : PublishMetricAction.fromJson(
            json['PublishMetricAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActionDefinitionToJson(ActionDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PublishMetricAction', instance.publishMetricAction?.toJson());
  return val;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    addressDefinition: json['AddressDefinition'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressDefinition', instance.addressDefinition);
  return val;
}

AssociateFirewallPolicyResponse _$AssociateFirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateFirewallPolicyResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    firewallPolicyArn: json['FirewallPolicyArn'] as String,
    updateToken: json['UpdateToken'] as String,
  );
}

AssociateSubnetsResponse _$AssociateSubnetsResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateSubnetsResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    subnetMappings: (json['SubnetMappings'] as List)
        ?.map((e) => e == null
            ? null
            : SubnetMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updateToken: json['UpdateToken'] as String,
  );
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
    endpointId: json['EndpointId'] as String,
    status: _$enumDecodeNullable(_$AttachmentStatusEnumMap, json['Status']),
    subnetId: json['SubnetId'] as String,
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

const _$AttachmentStatusEnumMap = {
  AttachmentStatus.creating: 'CREATING',
  AttachmentStatus.deleting: 'DELETING',
  AttachmentStatus.scaling: 'SCALING',
  AttachmentStatus.ready: 'READY',
};

CreateFirewallPolicyResponse _$CreateFirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFirewallPolicyResponse(
    firewallPolicyResponse: json['FirewallPolicyResponse'] == null
        ? null
        : FirewallPolicyResponse.fromJson(
            json['FirewallPolicyResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
  );
}

CreateFirewallResponse _$CreateFirewallResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFirewallResponse(
    firewall: json['Firewall'] == null
        ? null
        : Firewall.fromJson(json['Firewall'] as Map<String, dynamic>),
    firewallStatus: json['FirewallStatus'] == null
        ? null
        : FirewallStatus.fromJson(
            json['FirewallStatus'] as Map<String, dynamic>),
  );
}

CreateRuleGroupResponse _$CreateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRuleGroupResponse(
    ruleGroupResponse: json['RuleGroupResponse'] == null
        ? null
        : RuleGroupResponse.fromJson(
            json['RuleGroupResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
  );
}

CustomAction _$CustomActionFromJson(Map<String, dynamic> json) {
  return CustomAction(
    actionDefinition: json['ActionDefinition'] == null
        ? null
        : ActionDefinition.fromJson(
            json['ActionDefinition'] as Map<String, dynamic>),
    actionName: json['ActionName'] as String,
  );
}

Map<String, dynamic> _$CustomActionToJson(CustomAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActionDefinition', instance.actionDefinition?.toJson());
  writeNotNull('ActionName', instance.actionName);
  return val;
}

DeleteFirewallPolicyResponse _$DeleteFirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFirewallPolicyResponse(
    firewallPolicyResponse: json['FirewallPolicyResponse'] == null
        ? null
        : FirewallPolicyResponse.fromJson(
            json['FirewallPolicyResponse'] as Map<String, dynamic>),
  );
}

DeleteFirewallResponse _$DeleteFirewallResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFirewallResponse(
    firewall: json['Firewall'] == null
        ? null
        : Firewall.fromJson(json['Firewall'] as Map<String, dynamic>),
    firewallStatus: json['FirewallStatus'] == null
        ? null
        : FirewallStatus.fromJson(
            json['FirewallStatus'] as Map<String, dynamic>),
  );
}

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse();
}

DeleteRuleGroupResponse _$DeleteRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleGroupResponse(
    ruleGroupResponse: json['RuleGroupResponse'] == null
        ? null
        : RuleGroupResponse.fromJson(
            json['RuleGroupResponse'] as Map<String, dynamic>),
  );
}

DescribeFirewallPolicyResponse _$DescribeFirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFirewallPolicyResponse(
    firewallPolicyResponse: json['FirewallPolicyResponse'] == null
        ? null
        : FirewallPolicyResponse.fromJson(
            json['FirewallPolicyResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
    firewallPolicy: json['FirewallPolicy'] == null
        ? null
        : FirewallPolicy.fromJson(
            json['FirewallPolicy'] as Map<String, dynamic>),
  );
}

DescribeFirewallResponse _$DescribeFirewallResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFirewallResponse(
    firewall: json['Firewall'] == null
        ? null
        : Firewall.fromJson(json['Firewall'] as Map<String, dynamic>),
    firewallStatus: json['FirewallStatus'] == null
        ? null
        : FirewallStatus.fromJson(
            json['FirewallStatus'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
  );
}

DescribeLoggingConfigurationResponse
    _$DescribeLoggingConfigurationResponseFromJson(Map<String, dynamic> json) {
  return DescribeLoggingConfigurationResponse(
    firewallArn: json['FirewallArn'] as String,
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

DescribeResourcePolicyResponse _$DescribeResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourcePolicyResponse(
    policy: json['Policy'] as String,
  );
}

DescribeRuleGroupResponse _$DescribeRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRuleGroupResponse(
    ruleGroupResponse: json['RuleGroupResponse'] == null
        ? null
        : RuleGroupResponse.fromJson(
            json['RuleGroupResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
    ruleGroup: json['RuleGroup'] == null
        ? null
        : RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>),
  );
}

Dimension _$DimensionFromJson(Map<String, dynamic> json) {
  return Dimension(
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$DimensionToJson(Dimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

DisassociateSubnetsResponse _$DisassociateSubnetsResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateSubnetsResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    subnetMappings: (json['SubnetMappings'] as List)
        ?.map((e) => e == null
            ? null
            : SubnetMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updateToken: json['UpdateToken'] as String,
  );
}

Firewall _$FirewallFromJson(Map<String, dynamic> json) {
  return Firewall(
    firewallId: json['FirewallId'] as String,
    firewallPolicyArn: json['FirewallPolicyArn'] as String,
    subnetMappings: (json['SubnetMappings'] as List)
        ?.map((e) => e == null
            ? null
            : SubnetMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcId: json['VpcId'] as String,
    deleteProtection: json['DeleteProtection'] as bool,
    description: json['Description'] as String,
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    firewallPolicyChangeProtection:
        json['FirewallPolicyChangeProtection'] as bool,
    subnetChangeProtection: json['SubnetChangeProtection'] as bool,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FirewallMetadata _$FirewallMetadataFromJson(Map<String, dynamic> json) {
  return FirewallMetadata(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
  );
}

FirewallPolicy _$FirewallPolicyFromJson(Map<String, dynamic> json) {
  return FirewallPolicy(
    statelessDefaultActions: (json['StatelessDefaultActions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    statelessFragmentDefaultActions:
        (json['StatelessFragmentDefaultActions'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    statefulRuleGroupReferences: (json['StatefulRuleGroupReferences'] as List)
        ?.map((e) => e == null
            ? null
            : StatefulRuleGroupReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statelessCustomActions: (json['StatelessCustomActions'] as List)
        ?.map((e) =>
            e == null ? null : CustomAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statelessRuleGroupReferences: (json['StatelessRuleGroupReferences'] as List)
        ?.map((e) => e == null
            ? null
            : StatelessRuleGroupReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FirewallPolicyToJson(FirewallPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatelessDefaultActions', instance.statelessDefaultActions);
  writeNotNull('StatelessFragmentDefaultActions',
      instance.statelessFragmentDefaultActions);
  writeNotNull('StatefulRuleGroupReferences',
      instance.statefulRuleGroupReferences?.map((e) => e?.toJson())?.toList());
  writeNotNull('StatelessCustomActions',
      instance.statelessCustomActions?.map((e) => e?.toJson())?.toList());
  writeNotNull('StatelessRuleGroupReferences',
      instance.statelessRuleGroupReferences?.map((e) => e?.toJson())?.toList());
  return val;
}

FirewallPolicyMetadata _$FirewallPolicyMetadataFromJson(
    Map<String, dynamic> json) {
  return FirewallPolicyMetadata(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

FirewallPolicyResponse _$FirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return FirewallPolicyResponse(
    firewallPolicyArn: json['FirewallPolicyArn'] as String,
    firewallPolicyId: json['FirewallPolicyId'] as String,
    firewallPolicyName: json['FirewallPolicyName'] as String,
    description: json['Description'] as String,
    firewallPolicyStatus: _$enumDecodeNullable(
        _$ResourceStatusEnumMap, json['FirewallPolicyStatus']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$ResourceStatusEnumMap = {
  ResourceStatus.active: 'ACTIVE',
  ResourceStatus.deleting: 'DELETING',
};

FirewallStatus _$FirewallStatusFromJson(Map<String, dynamic> json) {
  return FirewallStatus(
    configurationSyncStateSummary: _$enumDecodeNullable(
        _$ConfigurationSyncStateEnumMap, json['ConfigurationSyncStateSummary']),
    status: _$enumDecodeNullable(_$FirewallStatusValueEnumMap, json['Status']),
    syncStates: (json['SyncStates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : SyncState.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

const _$ConfigurationSyncStateEnumMap = {
  ConfigurationSyncState.pending: 'PENDING',
  ConfigurationSyncState.inSync: 'IN_SYNC',
};

const _$FirewallStatusValueEnumMap = {
  FirewallStatusValue.provisioning: 'PROVISIONING',
  FirewallStatusValue.deleting: 'DELETING',
  FirewallStatusValue.ready: 'READY',
};

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return Header(
    destination: json['Destination'] as String,
    destinationPort: json['DestinationPort'] as String,
    direction:
        _$enumDecodeNullable(_$StatefulRuleDirectionEnumMap, json['Direction']),
    protocol:
        _$enumDecodeNullable(_$StatefulRuleProtocolEnumMap, json['Protocol']),
    source: json['Source'] as String,
    sourcePort: json['SourcePort'] as String,
  );
}

Map<String, dynamic> _$HeaderToJson(Header instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination);
  writeNotNull('DestinationPort', instance.destinationPort);
  writeNotNull('Direction', _$StatefulRuleDirectionEnumMap[instance.direction]);
  writeNotNull('Protocol', _$StatefulRuleProtocolEnumMap[instance.protocol]);
  writeNotNull('Source', instance.source);
  writeNotNull('SourcePort', instance.sourcePort);
  return val;
}

const _$StatefulRuleDirectionEnumMap = {
  StatefulRuleDirection.forward: 'FORWARD',
  StatefulRuleDirection.any: 'ANY',
};

const _$StatefulRuleProtocolEnumMap = {
  StatefulRuleProtocol.ip: 'IP',
  StatefulRuleProtocol.tcp: 'TCP',
  StatefulRuleProtocol.udp: 'UDP',
  StatefulRuleProtocol.icmp: 'ICMP',
  StatefulRuleProtocol.http: 'HTTP',
  StatefulRuleProtocol.ftp: 'FTP',
  StatefulRuleProtocol.tls: 'TLS',
  StatefulRuleProtocol.smb: 'SMB',
  StatefulRuleProtocol.dns: 'DNS',
  StatefulRuleProtocol.dcerpc: 'DCERPC',
  StatefulRuleProtocol.ssh: 'SSH',
  StatefulRuleProtocol.smtp: 'SMTP',
  StatefulRuleProtocol.imap: 'IMAP',
  StatefulRuleProtocol.msn: 'MSN',
  StatefulRuleProtocol.krb5: 'KRB5',
  StatefulRuleProtocol.ikev2: 'IKEV2',
  StatefulRuleProtocol.tftp: 'TFTP',
  StatefulRuleProtocol.ntp: 'NTP',
  StatefulRuleProtocol.dhcp: 'DHCP',
};

IPSet _$IPSetFromJson(Map<String, dynamic> json) {
  return IPSet(
    definition: (json['Definition'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$IPSetToJson(IPSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Definition', instance.definition);
  return val;
}

ListFirewallPoliciesResponse _$ListFirewallPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListFirewallPoliciesResponse(
    firewallPolicies: (json['FirewallPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : FirewallPolicyMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFirewallsResponse _$ListFirewallsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFirewallsResponse(
    firewalls: (json['Firewalls'] as List)
        ?.map((e) => e == null
            ? null
            : FirewallMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRuleGroupsResponse _$ListRuleGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRuleGroupsResponse(
    nextToken: json['NextToken'] as String,
    ruleGroups: (json['RuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : RuleGroupMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogDestinationConfig _$LogDestinationConfigFromJson(Map<String, dynamic> json) {
  return LogDestinationConfig(
    logDestination: (json['LogDestination'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    logDestinationType: _$enumDecodeNullable(
        _$LogDestinationTypeEnumMap, json['LogDestinationType']),
    logType: _$enumDecodeNullable(_$LogTypeEnumMap, json['LogType']),
  );
}

Map<String, dynamic> _$LogDestinationConfigToJson(
    LogDestinationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogDestination', instance.logDestination);
  writeNotNull('LogDestinationType',
      _$LogDestinationTypeEnumMap[instance.logDestinationType]);
  writeNotNull('LogType', _$LogTypeEnumMap[instance.logType]);
  return val;
}

const _$LogDestinationTypeEnumMap = {
  LogDestinationType.s3: 'S3',
  LogDestinationType.cloudWatchLogs: 'CloudWatchLogs',
  LogDestinationType.kinesisDataFirehose: 'KinesisDataFirehose',
};

const _$LogTypeEnumMap = {
  LogType.alert: 'ALERT',
  LogType.flow: 'FLOW',
};

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    logDestinationConfigs: (json['LogDestinationConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : LogDestinationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoggingConfigurationToJson(
    LoggingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogDestinationConfigs',
      instance.logDestinationConfigs?.map((e) => e?.toJson())?.toList());
  return val;
}

MatchAttributes _$MatchAttributesFromJson(Map<String, dynamic> json) {
  return MatchAttributes(
    destinationPorts: (json['DestinationPorts'] as List)
        ?.map((e) =>
            e == null ? null : PortRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    destinations: (json['Destinations'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    protocols: (json['Protocols'] as List)?.map((e) => e as int)?.toList(),
    sourcePorts: (json['SourcePorts'] as List)
        ?.map((e) =>
            e == null ? null : PortRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sources: (json['Sources'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tCPFlags: (json['TCPFlags'] as List)
        ?.map((e) =>
            e == null ? null : TCPFlagField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MatchAttributesToJson(MatchAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationPorts',
      instance.destinationPorts?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Destinations', instance.destinations?.map((e) => e?.toJson())?.toList());
  writeNotNull('Protocols', instance.protocols);
  writeNotNull(
      'SourcePorts', instance.sourcePorts?.map((e) => e?.toJson())?.toList());
  writeNotNull('Sources', instance.sources?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'TCPFlags', instance.tCPFlags?.map((e) => e?.toJson())?.toList());
  return val;
}

PerObjectStatus _$PerObjectStatusFromJson(Map<String, dynamic> json) {
  return PerObjectStatus(
    syncStatus:
        _$enumDecodeNullable(_$PerObjectSyncStatusEnumMap, json['SyncStatus']),
  );
}

const _$PerObjectSyncStatusEnumMap = {
  PerObjectSyncStatus.pending: 'PENDING',
  PerObjectSyncStatus.inSync: 'IN_SYNC',
};

PortRange _$PortRangeFromJson(Map<String, dynamic> json) {
  return PortRange(
    fromPort: json['FromPort'] as int,
    toPort: json['ToPort'] as int,
  );
}

Map<String, dynamic> _$PortRangeToJson(PortRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromPort', instance.fromPort);
  writeNotNull('ToPort', instance.toPort);
  return val;
}

PortSet _$PortSetFromJson(Map<String, dynamic> json) {
  return PortSet(
    definition: (json['Definition'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PortSetToJson(PortSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Definition', instance.definition);
  return val;
}

PublishMetricAction _$PublishMetricActionFromJson(Map<String, dynamic> json) {
  return PublishMetricAction(
    dimensions: (json['Dimensions'] as List)
        ?.map((e) =>
            e == null ? null : Dimension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PublishMetricActionToJson(PublishMetricAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  return val;
}

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse();
}

RuleDefinition _$RuleDefinitionFromJson(Map<String, dynamic> json) {
  return RuleDefinition(
    actions: (json['Actions'] as List)?.map((e) => e as String)?.toList(),
    matchAttributes: json['MatchAttributes'] == null
        ? null
        : MatchAttributes.fromJson(
            json['MatchAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleDefinitionToJson(RuleDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions);
  writeNotNull('MatchAttributes', instance.matchAttributes?.toJson());
  return val;
}

RuleGroup _$RuleGroupFromJson(Map<String, dynamic> json) {
  return RuleGroup(
    rulesSource: json['RulesSource'] == null
        ? null
        : RulesSource.fromJson(json['RulesSource'] as Map<String, dynamic>),
    ruleVariables: json['RuleVariables'] == null
        ? null
        : RuleVariables.fromJson(json['RuleVariables'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleGroupToJson(RuleGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RulesSource', instance.rulesSource?.toJson());
  writeNotNull('RuleVariables', instance.ruleVariables?.toJson());
  return val;
}

RuleGroupMetadata _$RuleGroupMetadataFromJson(Map<String, dynamic> json) {
  return RuleGroupMetadata(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

RuleGroupResponse _$RuleGroupResponseFromJson(Map<String, dynamic> json) {
  return RuleGroupResponse(
    ruleGroupArn: json['RuleGroupArn'] as String,
    ruleGroupId: json['RuleGroupId'] as String,
    ruleGroupName: json['RuleGroupName'] as String,
    capacity: json['Capacity'] as int,
    description: json['Description'] as String,
    ruleGroupStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['RuleGroupStatus']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$RuleGroupTypeEnumMap, json['Type']),
  );
}

const _$RuleGroupTypeEnumMap = {
  RuleGroupType.stateless: 'STATELESS',
  RuleGroupType.stateful: 'STATEFUL',
};

RuleOption _$RuleOptionFromJson(Map<String, dynamic> json) {
  return RuleOption(
    keyword: json['Keyword'] as String,
    settings: (json['Settings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RuleOptionToJson(RuleOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Keyword', instance.keyword);
  writeNotNull('Settings', instance.settings);
  return val;
}

RuleVariables _$RuleVariablesFromJson(Map<String, dynamic> json) {
  return RuleVariables(
    iPSets: (json['IPSets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : IPSet.fromJson(e as Map<String, dynamic>)),
    ),
    portSets: (json['PortSets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : PortSet.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$RuleVariablesToJson(RuleVariables instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'IPSets', instance.iPSets?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull(
      'PortSets', instance.portSets?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

RulesSource _$RulesSourceFromJson(Map<String, dynamic> json) {
  return RulesSource(
    rulesSourceList: json['RulesSourceList'] == null
        ? null
        : RulesSourceList.fromJson(
            json['RulesSourceList'] as Map<String, dynamic>),
    rulesString: json['RulesString'] as String,
    statefulRules: (json['StatefulRules'] as List)
        ?.map((e) =>
            e == null ? null : StatefulRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statelessRulesAndCustomActions:
        json['StatelessRulesAndCustomActions'] == null
            ? null
            : StatelessRulesAndCustomActions.fromJson(
                json['StatelessRulesAndCustomActions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RulesSourceToJson(RulesSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RulesSourceList', instance.rulesSourceList?.toJson());
  writeNotNull('RulesString', instance.rulesString);
  writeNotNull('StatefulRules',
      instance.statefulRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('StatelessRulesAndCustomActions',
      instance.statelessRulesAndCustomActions?.toJson());
  return val;
}

RulesSourceList _$RulesSourceListFromJson(Map<String, dynamic> json) {
  return RulesSourceList(
    generatedRulesType: _$enumDecodeNullable(
        _$GeneratedRulesTypeEnumMap, json['GeneratedRulesType']),
    targetTypes: (json['TargetTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TargetTypeEnumMap, e))
        ?.toList(),
    targets: (json['Targets'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RulesSourceListToJson(RulesSourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GeneratedRulesType',
      _$GeneratedRulesTypeEnumMap[instance.generatedRulesType]);
  writeNotNull('TargetTypes',
      instance.targetTypes?.map((e) => _$TargetTypeEnumMap[e])?.toList());
  writeNotNull('Targets', instance.targets);
  return val;
}

const _$GeneratedRulesTypeEnumMap = {
  GeneratedRulesType.allowlist: 'ALLOWLIST',
  GeneratedRulesType.denylist: 'DENYLIST',
};

const _$TargetTypeEnumMap = {
  TargetType.tlsSni: 'TLS_SNI',
  TargetType.httpHost: 'HTTP_HOST',
};

StatefulRule _$StatefulRuleFromJson(Map<String, dynamic> json) {
  return StatefulRule(
    action: _$enumDecodeNullable(_$StatefulActionEnumMap, json['Action']),
    header: json['Header'] == null
        ? null
        : Header.fromJson(json['Header'] as Map<String, dynamic>),
    ruleOptions: (json['RuleOptions'] as List)
        ?.map((e) =>
            e == null ? null : RuleOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StatefulRuleToJson(StatefulRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$StatefulActionEnumMap[instance.action]);
  writeNotNull('Header', instance.header?.toJson());
  writeNotNull(
      'RuleOptions', instance.ruleOptions?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$StatefulActionEnumMap = {
  StatefulAction.pass: 'PASS',
  StatefulAction.drop: 'DROP',
  StatefulAction.alert: 'ALERT',
};

StatefulRuleGroupReference _$StatefulRuleGroupReferenceFromJson(
    Map<String, dynamic> json) {
  return StatefulRuleGroupReference(
    resourceArn: json['ResourceArn'] as String,
  );
}

Map<String, dynamic> _$StatefulRuleGroupReferenceToJson(
    StatefulRuleGroupReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

StatelessRule _$StatelessRuleFromJson(Map<String, dynamic> json) {
  return StatelessRule(
    priority: json['Priority'] as int,
    ruleDefinition: json['RuleDefinition'] == null
        ? null
        : RuleDefinition.fromJson(
            json['RuleDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatelessRuleToJson(StatelessRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('RuleDefinition', instance.ruleDefinition?.toJson());
  return val;
}

StatelessRuleGroupReference _$StatelessRuleGroupReferenceFromJson(
    Map<String, dynamic> json) {
  return StatelessRuleGroupReference(
    priority: json['Priority'] as int,
    resourceArn: json['ResourceArn'] as String,
  );
}

Map<String, dynamic> _$StatelessRuleGroupReferenceToJson(
    StatelessRuleGroupReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

StatelessRulesAndCustomActions _$StatelessRulesAndCustomActionsFromJson(
    Map<String, dynamic> json) {
  return StatelessRulesAndCustomActions(
    statelessRules: (json['StatelessRules'] as List)
        ?.map((e) => e == null
            ? null
            : StatelessRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    customActions: (json['CustomActions'] as List)
        ?.map((e) =>
            e == null ? null : CustomAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StatelessRulesAndCustomActionsToJson(
    StatelessRulesAndCustomActions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatelessRules',
      instance.statelessRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('CustomActions',
      instance.customActions?.map((e) => e?.toJson())?.toList());
  return val;
}

SubnetMapping _$SubnetMappingFromJson(Map<String, dynamic> json) {
  return SubnetMapping(
    subnetId: json['SubnetId'] as String,
  );
}

Map<String, dynamic> _$SubnetMappingToJson(SubnetMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetId', instance.subnetId);
  return val;
}

SyncState _$SyncStateFromJson(Map<String, dynamic> json) {
  return SyncState(
    attachment: json['Attachment'] == null
        ? null
        : Attachment.fromJson(json['Attachment'] as Map<String, dynamic>),
    config: (json['Config'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PerObjectStatus.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

TCPFlagField _$TCPFlagFieldFromJson(Map<String, dynamic> json) {
  return TCPFlagField(
    flags: (json['Flags'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TCPFlagEnumMap, e))
        ?.toList(),
    masks: (json['Masks'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TCPFlagEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$TCPFlagFieldToJson(TCPFlagField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Flags', instance.flags?.map((e) => _$TCPFlagEnumMap[e])?.toList());
  writeNotNull(
      'Masks', instance.masks?.map((e) => _$TCPFlagEnumMap[e])?.toList());
  return val;
}

const _$TCPFlagEnumMap = {
  TCPFlag.fin: 'FIN',
  TCPFlag.syn: 'SYN',
  TCPFlag.rst: 'RST',
  TCPFlag.psh: 'PSH',
  TCPFlag.ack: 'ACK',
  TCPFlag.urg: 'URG',
  TCPFlag.ece: 'ECE',
  TCPFlag.cwr: 'CWR',
};

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

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateFirewallDeleteProtectionResponse
    _$UpdateFirewallDeleteProtectionResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateFirewallDeleteProtectionResponse(
    deleteProtection: json['DeleteProtection'] as bool,
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    updateToken: json['UpdateToken'] as String,
  );
}

UpdateFirewallDescriptionResponse _$UpdateFirewallDescriptionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFirewallDescriptionResponse(
    description: json['Description'] as String,
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    updateToken: json['UpdateToken'] as String,
  );
}

UpdateFirewallPolicyChangeProtectionResponse
    _$UpdateFirewallPolicyChangeProtectionResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateFirewallPolicyChangeProtectionResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    firewallPolicyChangeProtection:
        json['FirewallPolicyChangeProtection'] as bool,
    updateToken: json['UpdateToken'] as String,
  );
}

UpdateFirewallPolicyResponse _$UpdateFirewallPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFirewallPolicyResponse(
    firewallPolicyResponse: json['FirewallPolicyResponse'] == null
        ? null
        : FirewallPolicyResponse.fromJson(
            json['FirewallPolicyResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
  );
}

UpdateLoggingConfigurationResponse _$UpdateLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLoggingConfigurationResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

UpdateRuleGroupResponse _$UpdateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleGroupResponse(
    ruleGroupResponse: json['RuleGroupResponse'] == null
        ? null
        : RuleGroupResponse.fromJson(
            json['RuleGroupResponse'] as Map<String, dynamic>),
    updateToken: json['UpdateToken'] as String,
  );
}

UpdateSubnetChangeProtectionResponse
    _$UpdateSubnetChangeProtectionResponseFromJson(Map<String, dynamic> json) {
  return UpdateSubnetChangeProtectionResponse(
    firewallArn: json['FirewallArn'] as String,
    firewallName: json['FirewallName'] as String,
    subnetChangeProtection: json['SubnetChangeProtection'] as bool,
    updateToken: json['UpdateToken'] as String,
  );
}
