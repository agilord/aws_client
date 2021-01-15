// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-24.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalThresholdPolicy _$ApprovalThresholdPolicyFromJson(
    Map<String, dynamic> json) {
  return ApprovalThresholdPolicy(
    proposalDurationInHours: json['ProposalDurationInHours'] as int,
    thresholdComparator: _$enumDecodeNullable(
        _$ThresholdComparatorEnumMap, json['ThresholdComparator']),
    thresholdPercentage: json['ThresholdPercentage'] as int,
  );
}

Map<String, dynamic> _$ApprovalThresholdPolicyToJson(
    ApprovalThresholdPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProposalDurationInHours', instance.proposalDurationInHours);
  writeNotNull('ThresholdComparator',
      _$ThresholdComparatorEnumMap[instance.thresholdComparator]);
  writeNotNull('ThresholdPercentage', instance.thresholdPercentage);
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

const _$ThresholdComparatorEnumMap = {
  ThresholdComparator.greaterThan: 'GREATER_THAN',
  ThresholdComparator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
};

CreateMemberOutput _$CreateMemberOutputFromJson(Map<String, dynamic> json) {
  return CreateMemberOutput(
    memberId: json['MemberId'] as String,
  );
}

CreateNetworkOutput _$CreateNetworkOutputFromJson(Map<String, dynamic> json) {
  return CreateNetworkOutput(
    memberId: json['MemberId'] as String,
    networkId: json['NetworkId'] as String,
  );
}

CreateNodeOutput _$CreateNodeOutputFromJson(Map<String, dynamic> json) {
  return CreateNodeOutput(
    nodeId: json['NodeId'] as String,
  );
}

CreateProposalOutput _$CreateProposalOutputFromJson(Map<String, dynamic> json) {
  return CreateProposalOutput(
    proposalId: json['ProposalId'] as String,
  );
}

DeleteMemberOutput _$DeleteMemberOutputFromJson(Map<String, dynamic> json) {
  return DeleteMemberOutput();
}

DeleteNodeOutput _$DeleteNodeOutputFromJson(Map<String, dynamic> json) {
  return DeleteNodeOutput();
}

GetMemberOutput _$GetMemberOutputFromJson(Map<String, dynamic> json) {
  return GetMemberOutput(
    member: json['Member'] == null
        ? null
        : Member.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

GetNetworkOutput _$GetNetworkOutputFromJson(Map<String, dynamic> json) {
  return GetNetworkOutput(
    network: json['Network'] == null
        ? null
        : Network.fromJson(json['Network'] as Map<String, dynamic>),
  );
}

GetNodeOutput _$GetNodeOutputFromJson(Map<String, dynamic> json) {
  return GetNodeOutput(
    node: json['Node'] == null
        ? null
        : Node.fromJson(json['Node'] as Map<String, dynamic>),
  );
}

GetProposalOutput _$GetProposalOutputFromJson(Map<String, dynamic> json) {
  return GetProposalOutput(
    proposal: json['Proposal'] == null
        ? null
        : Proposal.fromJson(json['Proposal'] as Map<String, dynamic>),
  );
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    expirationDate:
        const IsoDateTimeConverter().fromJson(json['ExpirationDate']),
    invitationId: json['InvitationId'] as String,
    networkSummary: json['NetworkSummary'] == null
        ? null
        : NetworkSummary.fromJson(
            json['NetworkSummary'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$InvitationStatusEnumMap, json['Status']),
  );
}

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'PENDING',
  InvitationStatus.accepted: 'ACCEPTED',
  InvitationStatus.accepting: 'ACCEPTING',
  InvitationStatus.rejected: 'REJECTED',
  InvitationStatus.expired: 'EXPIRED',
};

InviteAction _$InviteActionFromJson(Map<String, dynamic> json) {
  return InviteAction(
    principal: json['Principal'] as String,
  );
}

Map<String, dynamic> _$InviteActionToJson(InviteAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Principal', instance.principal);
  return val;
}

ListInvitationsOutput _$ListInvitationsOutputFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsOutput(
    invitations: (json['Invitations'] as List)
        ?.map((e) =>
            e == null ? null : Invitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMembersOutput _$ListMembersOutputFromJson(Map<String, dynamic> json) {
  return ListMembersOutput(
    members: (json['Members'] as List)
        ?.map((e) => e == null
            ? null
            : MemberSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListNetworksOutput _$ListNetworksOutputFromJson(Map<String, dynamic> json) {
  return ListNetworksOutput(
    networks: (json['Networks'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListNodesOutput _$ListNodesOutputFromJson(Map<String, dynamic> json) {
  return ListNodesOutput(
    nextToken: json['NextToken'] as String,
    nodes: (json['Nodes'] as List)
        ?.map((e) =>
            e == null ? null : NodeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProposalVotesOutput _$ListProposalVotesOutputFromJson(
    Map<String, dynamic> json) {
  return ListProposalVotesOutput(
    nextToken: json['NextToken'] as String,
    proposalVotes: (json['ProposalVotes'] as List)
        ?.map((e) =>
            e == null ? null : VoteSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProposalsOutput _$ListProposalsOutputFromJson(Map<String, dynamic> json) {
  return ListProposalsOutput(
    nextToken: json['NextToken'] as String,
    proposals: (json['Proposals'] as List)
        ?.map((e) => e == null
            ? null
            : ProposalSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogConfiguration _$LogConfigurationFromJson(Map<String, dynamic> json) {
  return LogConfiguration(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$LogConfigurationToJson(LogConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

LogConfigurations _$LogConfigurationsFromJson(Map<String, dynamic> json) {
  return LogConfigurations(
    cloudwatch: json['Cloudwatch'] == null
        ? null
        : LogConfiguration.fromJson(json['Cloudwatch'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LogConfigurationsToJson(LogConfigurations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cloudwatch', instance.cloudwatch?.toJson());
  return val;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    frameworkAttributes: json['FrameworkAttributes'] == null
        ? null
        : MemberFrameworkAttributes.fromJson(
            json['FrameworkAttributes'] as Map<String, dynamic>),
    id: json['Id'] as String,
    logPublishingConfiguration: json['LogPublishingConfiguration'] == null
        ? null
        : MemberLogPublishingConfiguration.fromJson(
            json['LogPublishingConfiguration'] as Map<String, dynamic>),
    name: json['Name'] as String,
    networkId: json['NetworkId'] as String,
    status: _$enumDecodeNullable(_$MemberStatusEnumMap, json['Status']),
  );
}

const _$MemberStatusEnumMap = {
  MemberStatus.creating: 'CREATING',
  MemberStatus.available: 'AVAILABLE',
  MemberStatus.createFailed: 'CREATE_FAILED',
  MemberStatus.updating: 'UPDATING',
  MemberStatus.deleting: 'DELETING',
  MemberStatus.deleted: 'DELETED',
};

Map<String, dynamic> _$MemberConfigurationToJson(MemberConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FrameworkConfiguration', instance.frameworkConfiguration?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('LogPublishingConfiguration',
      instance.logPublishingConfiguration?.toJson());
  return val;
}

MemberFabricAttributes _$MemberFabricAttributesFromJson(
    Map<String, dynamic> json) {
  return MemberFabricAttributes(
    adminUsername: json['AdminUsername'] as String,
    caEndpoint: json['CaEndpoint'] as String,
  );
}

Map<String, dynamic> _$MemberFabricConfigurationToJson(
    MemberFabricConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdminPassword', instance.adminPassword);
  writeNotNull('AdminUsername', instance.adminUsername);
  return val;
}

MemberFabricLogPublishingConfiguration
    _$MemberFabricLogPublishingConfigurationFromJson(
        Map<String, dynamic> json) {
  return MemberFabricLogPublishingConfiguration(
    caLogs: json['CaLogs'] == null
        ? null
        : LogConfigurations.fromJson(json['CaLogs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberFabricLogPublishingConfigurationToJson(
    MemberFabricLogPublishingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaLogs', instance.caLogs?.toJson());
  return val;
}

MemberFrameworkAttributes _$MemberFrameworkAttributesFromJson(
    Map<String, dynamic> json) {
  return MemberFrameworkAttributes(
    fabric: json['Fabric'] == null
        ? null
        : MemberFabricAttributes.fromJson(
            json['Fabric'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberFrameworkConfigurationToJson(
    MemberFrameworkConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Fabric', instance.fabric?.toJson());
  return val;
}

MemberLogPublishingConfiguration _$MemberLogPublishingConfigurationFromJson(
    Map<String, dynamic> json) {
  return MemberLogPublishingConfiguration(
    fabric: json['Fabric'] == null
        ? null
        : MemberFabricLogPublishingConfiguration.fromJson(
            json['Fabric'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberLogPublishingConfigurationToJson(
    MemberLogPublishingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Fabric', instance.fabric?.toJson());
  return val;
}

MemberSummary _$MemberSummaryFromJson(Map<String, dynamic> json) {
  return MemberSummary(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    isOwned: json['IsOwned'] as bool,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$MemberStatusEnumMap, json['Status']),
  );
}

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return Network(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    framework: _$enumDecodeNullable(_$FrameworkEnumMap, json['Framework']),
    frameworkAttributes: json['FrameworkAttributes'] == null
        ? null
        : NetworkFrameworkAttributes.fromJson(
            json['FrameworkAttributes'] as Map<String, dynamic>),
    frameworkVersion: json['FrameworkVersion'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$NetworkStatusEnumMap, json['Status']),
    votingPolicy: json['VotingPolicy'] == null
        ? null
        : VotingPolicy.fromJson(json['VotingPolicy'] as Map<String, dynamic>),
    vpcEndpointServiceName: json['VpcEndpointServiceName'] as String,
  );
}

const _$FrameworkEnumMap = {
  Framework.hyperledgerFabric: 'HYPERLEDGER_FABRIC',
  Framework.ethereum: 'ETHEREUM',
};

const _$NetworkStatusEnumMap = {
  NetworkStatus.creating: 'CREATING',
  NetworkStatus.available: 'AVAILABLE',
  NetworkStatus.createFailed: 'CREATE_FAILED',
  NetworkStatus.deleting: 'DELETING',
  NetworkStatus.deleted: 'DELETED',
};

NetworkEthereumAttributes _$NetworkEthereumAttributesFromJson(
    Map<String, dynamic> json) {
  return NetworkEthereumAttributes(
    chainId: json['ChainId'] as String,
  );
}

NetworkFabricAttributes _$NetworkFabricAttributesFromJson(
    Map<String, dynamic> json) {
  return NetworkFabricAttributes(
    edition: _$enumDecodeNullable(_$EditionEnumMap, json['Edition']),
    orderingServiceEndpoint: json['OrderingServiceEndpoint'] as String,
  );
}

const _$EditionEnumMap = {
  Edition.starter: 'STARTER',
  Edition.standard: 'STANDARD',
};

Map<String, dynamic> _$NetworkFabricConfigurationToJson(
    NetworkFabricConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Edition', _$EditionEnumMap[instance.edition]);
  return val;
}

NetworkFrameworkAttributes _$NetworkFrameworkAttributesFromJson(
    Map<String, dynamic> json) {
  return NetworkFrameworkAttributes(
    ethereum: json['Ethereum'] == null
        ? null
        : NetworkEthereumAttributes.fromJson(
            json['Ethereum'] as Map<String, dynamic>),
    fabric: json['Fabric'] == null
        ? null
        : NetworkFabricAttributes.fromJson(
            json['Fabric'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkFrameworkConfigurationToJson(
    NetworkFrameworkConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Fabric', instance.fabric?.toJson());
  return val;
}

NetworkSummary _$NetworkSummaryFromJson(Map<String, dynamic> json) {
  return NetworkSummary(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    framework: _$enumDecodeNullable(_$FrameworkEnumMap, json['Framework']),
    frameworkVersion: json['FrameworkVersion'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$NetworkStatusEnumMap, json['Status']),
  );
}

Node _$NodeFromJson(Map<String, dynamic> json) {
  return Node(
    availabilityZone: json['AvailabilityZone'] as String,
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    frameworkAttributes: json['FrameworkAttributes'] == null
        ? null
        : NodeFrameworkAttributes.fromJson(
            json['FrameworkAttributes'] as Map<String, dynamic>),
    id: json['Id'] as String,
    instanceType: json['InstanceType'] as String,
    logPublishingConfiguration: json['LogPublishingConfiguration'] == null
        ? null
        : NodeLogPublishingConfiguration.fromJson(
            json['LogPublishingConfiguration'] as Map<String, dynamic>),
    memberId: json['MemberId'] as String,
    networkId: json['NetworkId'] as String,
    stateDB: _$enumDecodeNullable(_$StateDBTypeEnumMap, json['StateDB']),
    status: _$enumDecodeNullable(_$NodeStatusEnumMap, json['Status']),
  );
}

const _$StateDBTypeEnumMap = {
  StateDBType.levelDB: 'LevelDB',
  StateDBType.couchDB: 'CouchDB',
};

const _$NodeStatusEnumMap = {
  NodeStatus.creating: 'CREATING',
  NodeStatus.available: 'AVAILABLE',
  NodeStatus.unhealthy: 'UNHEALTHY',
  NodeStatus.createFailed: 'CREATE_FAILED',
  NodeStatus.updating: 'UPDATING',
  NodeStatus.deleting: 'DELETING',
  NodeStatus.deleted: 'DELETED',
  NodeStatus.failed: 'FAILED',
};

Map<String, dynamic> _$NodeConfigurationToJson(NodeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('LogPublishingConfiguration',
      instance.logPublishingConfiguration?.toJson());
  writeNotNull('StateDB', _$StateDBTypeEnumMap[instance.stateDB]);
  return val;
}

NodeEthereumAttributes _$NodeEthereumAttributesFromJson(
    Map<String, dynamic> json) {
  return NodeEthereumAttributes(
    httpEndpoint: json['HttpEndpoint'] as String,
    webSocketEndpoint: json['WebSocketEndpoint'] as String,
  );
}

NodeFabricAttributes _$NodeFabricAttributesFromJson(Map<String, dynamic> json) {
  return NodeFabricAttributes(
    peerEndpoint: json['PeerEndpoint'] as String,
    peerEventEndpoint: json['PeerEventEndpoint'] as String,
  );
}

NodeFabricLogPublishingConfiguration
    _$NodeFabricLogPublishingConfigurationFromJson(Map<String, dynamic> json) {
  return NodeFabricLogPublishingConfiguration(
    chaincodeLogs: json['ChaincodeLogs'] == null
        ? null
        : LogConfigurations.fromJson(
            json['ChaincodeLogs'] as Map<String, dynamic>),
    peerLogs: json['PeerLogs'] == null
        ? null
        : LogConfigurations.fromJson(json['PeerLogs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NodeFabricLogPublishingConfigurationToJson(
    NodeFabricLogPublishingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChaincodeLogs', instance.chaincodeLogs?.toJson());
  writeNotNull('PeerLogs', instance.peerLogs?.toJson());
  return val;
}

NodeFrameworkAttributes _$NodeFrameworkAttributesFromJson(
    Map<String, dynamic> json) {
  return NodeFrameworkAttributes(
    ethereum: json['Ethereum'] == null
        ? null
        : NodeEthereumAttributes.fromJson(
            json['Ethereum'] as Map<String, dynamic>),
    fabric: json['Fabric'] == null
        ? null
        : NodeFabricAttributes.fromJson(json['Fabric'] as Map<String, dynamic>),
  );
}

NodeLogPublishingConfiguration _$NodeLogPublishingConfigurationFromJson(
    Map<String, dynamic> json) {
  return NodeLogPublishingConfiguration(
    fabric: json['Fabric'] == null
        ? null
        : NodeFabricLogPublishingConfiguration.fromJson(
            json['Fabric'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NodeLogPublishingConfigurationToJson(
    NodeLogPublishingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Fabric', instance.fabric?.toJson());
  return val;
}

NodeSummary _$NodeSummaryFromJson(Map<String, dynamic> json) {
  return NodeSummary(
    availabilityZone: json['AvailabilityZone'] as String,
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    id: json['Id'] as String,
    instanceType: json['InstanceType'] as String,
    status: _$enumDecodeNullable(_$NodeStatusEnumMap, json['Status']),
  );
}

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return Proposal(
    actions: json['Actions'] == null
        ? null
        : ProposalActions.fromJson(json['Actions'] as Map<String, dynamic>),
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    expirationDate:
        const IsoDateTimeConverter().fromJson(json['ExpirationDate']),
    networkId: json['NetworkId'] as String,
    noVoteCount: json['NoVoteCount'] as int,
    outstandingVoteCount: json['OutstandingVoteCount'] as int,
    proposalId: json['ProposalId'] as String,
    proposedByMemberId: json['ProposedByMemberId'] as String,
    proposedByMemberName: json['ProposedByMemberName'] as String,
    status: _$enumDecodeNullable(_$ProposalStatusEnumMap, json['Status']),
    yesVoteCount: json['YesVoteCount'] as int,
  );
}

const _$ProposalStatusEnumMap = {
  ProposalStatus.inProgress: 'IN_PROGRESS',
  ProposalStatus.approved: 'APPROVED',
  ProposalStatus.rejected: 'REJECTED',
  ProposalStatus.expired: 'EXPIRED',
  ProposalStatus.actionFailed: 'ACTION_FAILED',
};

ProposalActions _$ProposalActionsFromJson(Map<String, dynamic> json) {
  return ProposalActions(
    invitations: (json['Invitations'] as List)
        ?.map((e) =>
            e == null ? null : InviteAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    removals: (json['Removals'] as List)
        ?.map((e) =>
            e == null ? null : RemoveAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProposalActionsToJson(ProposalActions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Invitations', instance.invitations?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Removals', instance.removals?.map((e) => e?.toJson())?.toList());
  return val;
}

ProposalSummary _$ProposalSummaryFromJson(Map<String, dynamic> json) {
  return ProposalSummary(
    creationDate: const IsoDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    expirationDate:
        const IsoDateTimeConverter().fromJson(json['ExpirationDate']),
    proposalId: json['ProposalId'] as String,
    proposedByMemberId: json['ProposedByMemberId'] as String,
    proposedByMemberName: json['ProposedByMemberName'] as String,
    status: _$enumDecodeNullable(_$ProposalStatusEnumMap, json['Status']),
  );
}

RejectInvitationOutput _$RejectInvitationOutputFromJson(
    Map<String, dynamic> json) {
  return RejectInvitationOutput();
}

RemoveAction _$RemoveActionFromJson(Map<String, dynamic> json) {
  return RemoveAction(
    memberId: json['MemberId'] as String,
  );
}

Map<String, dynamic> _$RemoveActionToJson(RemoveAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MemberId', instance.memberId);
  return val;
}

UpdateMemberOutput _$UpdateMemberOutputFromJson(Map<String, dynamic> json) {
  return UpdateMemberOutput();
}

UpdateNodeOutput _$UpdateNodeOutputFromJson(Map<String, dynamic> json) {
  return UpdateNodeOutput();
}

VoteOnProposalOutput _$VoteOnProposalOutputFromJson(Map<String, dynamic> json) {
  return VoteOnProposalOutput();
}

VoteSummary _$VoteSummaryFromJson(Map<String, dynamic> json) {
  return VoteSummary(
    memberId: json['MemberId'] as String,
    memberName: json['MemberName'] as String,
    vote: _$enumDecodeNullable(_$VoteValueEnumMap, json['Vote']),
  );
}

const _$VoteValueEnumMap = {
  VoteValue.yes: 'YES',
  VoteValue.no: 'NO',
};

VotingPolicy _$VotingPolicyFromJson(Map<String, dynamic> json) {
  return VotingPolicy(
    approvalThresholdPolicy: json['ApprovalThresholdPolicy'] == null
        ? null
        : ApprovalThresholdPolicy.fromJson(
            json['ApprovalThresholdPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VotingPolicyToJson(VotingPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ApprovalThresholdPolicy', instance.approvalThresholdPolicy?.toJson());
  return val;
}
