// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route53resolver-2018-04-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateResolverEndpointIpAddressRequestToJson(
    AssociateResolverEndpointIpAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IpAddress', instance.ipAddress?.toJson());
  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  return val;
}

AssociateResolverEndpointIpAddressResponse
    _$AssociateResolverEndpointIpAddressResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateResolverEndpointIpAddressResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssociateResolverRuleRequestToJson(
    AssociateResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverRuleId', instance.resolverRuleId);
  writeNotNull('VPCId', instance.vPCId);
  writeNotNull('Name', instance.name);
  return val;
}

AssociateResolverRuleResponse _$AssociateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateResolverRuleResponse(
    resolverRuleAssociation: json['ResolverRuleAssociation'] == null
        ? null
        : ResolverRuleAssociation.fromJson(
            json['ResolverRuleAssociation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateResolverEndpointRequestToJson(
    CreateResolverEndpointRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull(
      'Direction', _$ResolverEndpointDirectionEnumMap[instance.direction]);
  writeNotNull(
      'IpAddresses', instance.ipAddresses?.map((e) => e?.toJson())?.toList());
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('Name', instance.name);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ResolverEndpointDirectionEnumMap = {
  ResolverEndpointDirection.inbound: 'INBOUND',
  ResolverEndpointDirection.outbound: 'OUTBOUND',
};

CreateResolverEndpointResponse _$CreateResolverEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResolverEndpointResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateResolverRuleRequestToJson(
    CreateResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('RuleType', _$RuleTypeOptionEnumMap[instance.ruleType]);
  writeNotNull('Name', instance.name);
  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'TargetIps', instance.targetIps?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$RuleTypeOptionEnumMap = {
  RuleTypeOption.forward: 'FORWARD',
  RuleTypeOption.system: 'SYSTEM',
  RuleTypeOption.recursive: 'RECURSIVE',
};

CreateResolverRuleResponse _$CreateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteResolverEndpointRequestToJson(
    DeleteResolverEndpointRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  return val;
}

DeleteResolverEndpointResponse _$DeleteResolverEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResolverEndpointResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteResolverRuleRequestToJson(
    DeleteResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverRuleId', instance.resolverRuleId);
  return val;
}

DeleteResolverRuleResponse _$DeleteResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisassociateResolverEndpointIpAddressRequestToJson(
    DisassociateResolverEndpointIpAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IpAddress', instance.ipAddress?.toJson());
  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  return val;
}

DisassociateResolverEndpointIpAddressResponse
    _$DisassociateResolverEndpointIpAddressResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateResolverEndpointIpAddressResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisassociateResolverRuleRequestToJson(
    DisassociateResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverRuleId', instance.resolverRuleId);
  writeNotNull('VPCId', instance.vPCId);
  return val;
}

DisassociateResolverRuleResponse _$DisassociateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateResolverRuleResponse(
    resolverRuleAssociation: json['ResolverRuleAssociation'] == null
        ? null
        : ResolverRuleAssociation.fromJson(
            json['ResolverRuleAssociation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$GetResolverEndpointRequestToJson(
    GetResolverEndpointRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  return val;
}

GetResolverEndpointResponse _$GetResolverEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverEndpointResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetResolverRuleAssociationRequestToJson(
    GetResolverRuleAssociationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverRuleAssociationId', instance.resolverRuleAssociationId);
  return val;
}

GetResolverRuleAssociationResponse _$GetResolverRuleAssociationResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverRuleAssociationResponse(
    resolverRuleAssociation: json['ResolverRuleAssociation'] == null
        ? null
        : ResolverRuleAssociation.fromJson(
            json['ResolverRuleAssociation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetResolverRulePolicyRequestToJson(
    GetResolverRulePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  return val;
}

GetResolverRulePolicyResponse _$GetResolverRulePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverRulePolicyResponse(
    resolverRulePolicy: json['ResolverRulePolicy'] as String,
  );
}

Map<String, dynamic> _$GetResolverRuleRequestToJson(
    GetResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverRuleId', instance.resolverRuleId);
  return val;
}

GetResolverRuleResponse _$GetResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IpAddressRequestToJson(IpAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('Ip', instance.ip);
  return val;
}

IpAddressResponse _$IpAddressResponseFromJson(Map<String, dynamic> json) {
  return IpAddressResponse(
    creationTime: json['CreationTime'] as String,
    ip: json['Ip'] as String,
    ipId: json['IpId'] as String,
    modificationTime: json['ModificationTime'] as String,
    status: _$enumDecodeNullable(_$IpAddressStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
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

const _$IpAddressStatusEnumMap = {
  IpAddressStatus.creating: 'CREATING',
  IpAddressStatus.failedCreation: 'FAILED_CREATION',
  IpAddressStatus.attaching: 'ATTACHING',
  IpAddressStatus.attached: 'ATTACHED',
  IpAddressStatus.remapDetaching: 'REMAP_DETACHING',
  IpAddressStatus.remapAttaching: 'REMAP_ATTACHING',
  IpAddressStatus.detaching: 'DETACHING',
  IpAddressStatus.failedResourceGone: 'FAILED_RESOURCE_GONE',
  IpAddressStatus.deleting: 'DELETING',
  IpAddressStatus.deleteFailedFasExpired: 'DELETE_FAILED_FAS_EXPIRED',
};

Map<String, dynamic> _$IpAddressUpdateToJson(IpAddressUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Ip', instance.ip);
  writeNotNull('IpId', instance.ipId);
  writeNotNull('SubnetId', instance.subnetId);
  return val;
}

Map<String, dynamic> _$ListResolverEndpointIpAddressesRequestToJson(
    ListResolverEndpointIpAddressesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListResolverEndpointIpAddressesResponse
    _$ListResolverEndpointIpAddressesResponseFromJson(
        Map<String, dynamic> json) {
  return ListResolverEndpointIpAddressesResponse(
    ipAddresses: (json['IpAddresses'] as List)
        ?.map((e) => e == null
            ? null
            : IpAddressResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListResolverEndpointsRequestToJson(
    ListResolverEndpointsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListResolverEndpointsResponse _$ListResolverEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return ListResolverEndpointsResponse(
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
    resolverEndpoints: (json['ResolverEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ResolverEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListResolverRuleAssociationsRequestToJson(
    ListResolverRuleAssociationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListResolverRuleAssociationsResponse
    _$ListResolverRuleAssociationsResponseFromJson(Map<String, dynamic> json) {
  return ListResolverRuleAssociationsResponse(
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
    resolverRuleAssociations: (json['ResolverRuleAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : ResolverRuleAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListResolverRulesRequestToJson(
    ListResolverRulesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListResolverRulesResponse _$ListResolverRulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResolverRulesResponse(
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
    resolverRules: (json['ResolverRules'] as List)
        ?.map((e) =>
            e == null ? null : ResolverRule.fromJson(e as Map<String, dynamic>))
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

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$PutResolverRulePolicyRequestToJson(
    PutResolverRulePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('ResolverRulePolicy', instance.resolverRulePolicy);
  return val;
}

PutResolverRulePolicyResponse _$PutResolverRulePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResolverRulePolicyResponse(
    returnValue: json['ReturnValue'] as bool,
  );
}

ResolverEndpoint _$ResolverEndpointFromJson(Map<String, dynamic> json) {
  return ResolverEndpoint(
    arn: json['Arn'] as String,
    creationTime: json['CreationTime'] as String,
    creatorRequestId: json['CreatorRequestId'] as String,
    direction: _$enumDecodeNullable(
        _$ResolverEndpointDirectionEnumMap, json['Direction']),
    hostVPCId: json['HostVPCId'] as String,
    id: json['Id'] as String,
    ipAddressCount: json['IpAddressCount'] as int,
    modificationTime: json['ModificationTime'] as String,
    name: json['Name'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    status:
        _$enumDecodeNullable(_$ResolverEndpointStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

const _$ResolverEndpointStatusEnumMap = {
  ResolverEndpointStatus.creating: 'CREATING',
  ResolverEndpointStatus.operational: 'OPERATIONAL',
  ResolverEndpointStatus.updating: 'UPDATING',
  ResolverEndpointStatus.autoRecovering: 'AUTO_RECOVERING',
  ResolverEndpointStatus.actionNeeded: 'ACTION_NEEDED',
  ResolverEndpointStatus.deleting: 'DELETING',
};

ResolverRule _$ResolverRuleFromJson(Map<String, dynamic> json) {
  return ResolverRule(
    arn: json['Arn'] as String,
    creatorRequestId: json['CreatorRequestId'] as String,
    domainName: json['DomainName'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    ownerId: json['OwnerId'] as String,
    resolverEndpointId: json['ResolverEndpointId'] as String,
    ruleType: _$enumDecodeNullable(_$RuleTypeOptionEnumMap, json['RuleType']),
    shareStatus:
        _$enumDecodeNullable(_$ShareStatusEnumMap, json['ShareStatus']),
    status: _$enumDecodeNullable(_$ResolverRuleStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    targetIps: (json['TargetIps'] as List)
        ?.map((e) => e == null
            ? null
            : TargetAddress.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$ShareStatusEnumMap = {
  ShareStatus.notShared: 'NOT_SHARED',
  ShareStatus.sharedWithMe: 'SHARED_WITH_ME',
  ShareStatus.sharedByMe: 'SHARED_BY_ME',
};

const _$ResolverRuleStatusEnumMap = {
  ResolverRuleStatus.complete: 'COMPLETE',
  ResolverRuleStatus.deleting: 'DELETING',
  ResolverRuleStatus.updating: 'UPDATING',
  ResolverRuleStatus.failed: 'FAILED',
};

ResolverRuleAssociation _$ResolverRuleAssociationFromJson(
    Map<String, dynamic> json) {
  return ResolverRuleAssociation(
    id: json['Id'] as String,
    name: json['Name'] as String,
    resolverRuleId: json['ResolverRuleId'] as String,
    status: _$enumDecodeNullable(
        _$ResolverRuleAssociationStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    vPCId: json['VPCId'] as String,
  );
}

const _$ResolverRuleAssociationStatusEnumMap = {
  ResolverRuleAssociationStatus.creating: 'CREATING',
  ResolverRuleAssociationStatus.complete: 'COMPLETE',
  ResolverRuleAssociationStatus.deleting: 'DELETING',
  ResolverRuleAssociationStatus.failed: 'FAILED',
  ResolverRuleAssociationStatus.overridden: 'OVERRIDDEN',
};

Map<String, dynamic> _$ResolverRuleConfigToJson(ResolverRuleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  writeNotNull(
      'TargetIps', instance.targetIps?.map((e) => e?.toJson())?.toList());
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TargetAddress _$TargetAddressFromJson(Map<String, dynamic> json) {
  return TargetAddress(
    ip: json['Ip'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$TargetAddressToJson(TargetAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Ip', instance.ip);
  writeNotNull('Port', instance.port);
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateResolverEndpointRequestToJson(
    UpdateResolverEndpointRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResolverEndpointId', instance.resolverEndpointId);
  writeNotNull('Name', instance.name);
  return val;
}

UpdateResolverEndpointResponse _$UpdateResolverEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResolverEndpointResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateResolverRuleRequestToJson(
    UpdateResolverRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Config', instance.config?.toJson());
  writeNotNull('ResolverRuleId', instance.resolverRuleId);
  return val;
}

UpdateResolverRuleResponse _$UpdateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
}
