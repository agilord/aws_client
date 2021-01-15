// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-04-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

AssociateResolverQueryLogConfigResponse
    _$AssociateResolverQueryLogConfigResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateResolverQueryLogConfigResponse(
    resolverQueryLogConfigAssociation:
        json['ResolverQueryLogConfigAssociation'] == null
            ? null
            : ResolverQueryLogConfigAssociation.fromJson(
                json['ResolverQueryLogConfigAssociation']
                    as Map<String, dynamic>),
  );
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

CreateResolverEndpointResponse _$CreateResolverEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResolverEndpointResponse(
    resolverEndpoint: json['ResolverEndpoint'] == null
        ? null
        : ResolverEndpoint.fromJson(
            json['ResolverEndpoint'] as Map<String, dynamic>),
  );
}

CreateResolverQueryLogConfigResponse
    _$CreateResolverQueryLogConfigResponseFromJson(Map<String, dynamic> json) {
  return CreateResolverQueryLogConfigResponse(
    resolverQueryLogConfig: json['ResolverQueryLogConfig'] == null
        ? null
        : ResolverQueryLogConfig.fromJson(
            json['ResolverQueryLogConfig'] as Map<String, dynamic>),
  );
}

CreateResolverRuleResponse _$CreateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
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

DeleteResolverQueryLogConfigResponse
    _$DeleteResolverQueryLogConfigResponseFromJson(Map<String, dynamic> json) {
  return DeleteResolverQueryLogConfigResponse(
    resolverQueryLogConfig: json['ResolverQueryLogConfig'] == null
        ? null
        : ResolverQueryLogConfig.fromJson(
            json['ResolverQueryLogConfig'] as Map<String, dynamic>),
  );
}

DeleteResolverRuleResponse _$DeleteResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
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

DisassociateResolverQueryLogConfigResponse
    _$DisassociateResolverQueryLogConfigResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateResolverQueryLogConfigResponse(
    resolverQueryLogConfigAssociation:
        json['ResolverQueryLogConfigAssociation'] == null
            ? null
            : ResolverQueryLogConfigAssociation.fromJson(
                json['ResolverQueryLogConfigAssociation']
                    as Map<String, dynamic>),
  );
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

GetResolverDnssecConfigResponse _$GetResolverDnssecConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverDnssecConfigResponse(
    resolverDNSSECConfig: json['ResolverDNSSECConfig'] == null
        ? null
        : ResolverDnssecConfig.fromJson(
            json['ResolverDNSSECConfig'] as Map<String, dynamic>),
  );
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

GetResolverQueryLogConfigAssociationResponse
    _$GetResolverQueryLogConfigAssociationResponseFromJson(
        Map<String, dynamic> json) {
  return GetResolverQueryLogConfigAssociationResponse(
    resolverQueryLogConfigAssociation:
        json['ResolverQueryLogConfigAssociation'] == null
            ? null
            : ResolverQueryLogConfigAssociation.fromJson(
                json['ResolverQueryLogConfigAssociation']
                    as Map<String, dynamic>),
  );
}

GetResolverQueryLogConfigPolicyResponse
    _$GetResolverQueryLogConfigPolicyResponseFromJson(
        Map<String, dynamic> json) {
  return GetResolverQueryLogConfigPolicyResponse(
    resolverQueryLogConfigPolicy:
        json['ResolverQueryLogConfigPolicy'] as String,
  );
}

GetResolverQueryLogConfigResponse _$GetResolverQueryLogConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverQueryLogConfigResponse(
    resolverQueryLogConfig: json['ResolverQueryLogConfig'] == null
        ? null
        : ResolverQueryLogConfig.fromJson(
            json['ResolverQueryLogConfig'] as Map<String, dynamic>),
  );
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

GetResolverRulePolicyResponse _$GetResolverRulePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResolverRulePolicyResponse(
    resolverRulePolicy: json['ResolverRulePolicy'] as String,
  );
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

ListResolverDnssecConfigsResponse _$ListResolverDnssecConfigsResponseFromJson(
    Map<String, dynamic> json) {
  return ListResolverDnssecConfigsResponse(
    nextToken: json['NextToken'] as String,
    resolverDnssecConfigs: (json['ResolverDnssecConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : ResolverDnssecConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

ListResolverQueryLogConfigAssociationsResponse
    _$ListResolverQueryLogConfigAssociationsResponseFromJson(
        Map<String, dynamic> json) {
  return ListResolverQueryLogConfigAssociationsResponse(
    nextToken: json['NextToken'] as String,
    resolverQueryLogConfigAssociations:
        (json['ResolverQueryLogConfigAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : ResolverQueryLogConfigAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    totalCount: json['TotalCount'] as int,
    totalFilteredCount: json['TotalFilteredCount'] as int,
  );
}

ListResolverQueryLogConfigsResponse
    _$ListResolverQueryLogConfigsResponseFromJson(Map<String, dynamic> json) {
  return ListResolverQueryLogConfigsResponse(
    nextToken: json['NextToken'] as String,
    resolverQueryLogConfigs: (json['ResolverQueryLogConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : ResolverQueryLogConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
    totalFilteredCount: json['TotalFilteredCount'] as int,
  );
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

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutResolverQueryLogConfigPolicyResponse
    _$PutResolverQueryLogConfigPolicyResponseFromJson(
        Map<String, dynamic> json) {
  return PutResolverQueryLogConfigPolicyResponse(
    returnValue: json['ReturnValue'] as bool,
  );
}

PutResolverRulePolicyResponse _$PutResolverRulePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResolverRulePolicyResponse(
    returnValue: json['ReturnValue'] as bool,
  );
}

ResolverDnssecConfig _$ResolverDnssecConfigFromJson(Map<String, dynamic> json) {
  return ResolverDnssecConfig(
    id: json['Id'] as String,
    ownerId: json['OwnerId'] as String,
    resourceId: json['ResourceId'] as String,
    validationStatus: _$enumDecodeNullable(
        _$ResolverDNSSECValidationStatusEnumMap, json['ValidationStatus']),
  );
}

const _$ResolverDNSSECValidationStatusEnumMap = {
  ResolverDNSSECValidationStatus.enabling: 'ENABLING',
  ResolverDNSSECValidationStatus.enabled: 'ENABLED',
  ResolverDNSSECValidationStatus.disabling: 'DISABLING',
  ResolverDNSSECValidationStatus.disabled: 'DISABLED',
};

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

const _$ResolverEndpointDirectionEnumMap = {
  ResolverEndpointDirection.inbound: 'INBOUND',
  ResolverEndpointDirection.outbound: 'OUTBOUND',
};

const _$ResolverEndpointStatusEnumMap = {
  ResolverEndpointStatus.creating: 'CREATING',
  ResolverEndpointStatus.operational: 'OPERATIONAL',
  ResolverEndpointStatus.updating: 'UPDATING',
  ResolverEndpointStatus.autoRecovering: 'AUTO_RECOVERING',
  ResolverEndpointStatus.actionNeeded: 'ACTION_NEEDED',
  ResolverEndpointStatus.deleting: 'DELETING',
};

ResolverQueryLogConfig _$ResolverQueryLogConfigFromJson(
    Map<String, dynamic> json) {
  return ResolverQueryLogConfig(
    arn: json['Arn'] as String,
    associationCount: json['AssociationCount'] as int,
    creationTime: json['CreationTime'] as String,
    creatorRequestId: json['CreatorRequestId'] as String,
    destinationArn: json['DestinationArn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    ownerId: json['OwnerId'] as String,
    shareStatus:
        _$enumDecodeNullable(_$ShareStatusEnumMap, json['ShareStatus']),
    status: _$enumDecodeNullable(
        _$ResolverQueryLogConfigStatusEnumMap, json['Status']),
  );
}

const _$ShareStatusEnumMap = {
  ShareStatus.notShared: 'NOT_SHARED',
  ShareStatus.sharedWithMe: 'SHARED_WITH_ME',
  ShareStatus.sharedByMe: 'SHARED_BY_ME',
};

const _$ResolverQueryLogConfigStatusEnumMap = {
  ResolverQueryLogConfigStatus.creating: 'CREATING',
  ResolverQueryLogConfigStatus.created: 'CREATED',
  ResolverQueryLogConfigStatus.deleting: 'DELETING',
  ResolverQueryLogConfigStatus.failed: 'FAILED',
};

ResolverQueryLogConfigAssociation _$ResolverQueryLogConfigAssociationFromJson(
    Map<String, dynamic> json) {
  return ResolverQueryLogConfigAssociation(
    creationTime: json['CreationTime'] as String,
    error: _$enumDecodeNullable(
        _$ResolverQueryLogConfigAssociationErrorEnumMap, json['Error']),
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    resolverQueryLogConfigId: json['ResolverQueryLogConfigId'] as String,
    resourceId: json['ResourceId'] as String,
    status: _$enumDecodeNullable(
        _$ResolverQueryLogConfigAssociationStatusEnumMap, json['Status']),
  );
}

const _$ResolverQueryLogConfigAssociationErrorEnumMap = {
  ResolverQueryLogConfigAssociationError.none: 'NONE',
  ResolverQueryLogConfigAssociationError.destinationNotFound:
      'DESTINATION_NOT_FOUND',
  ResolverQueryLogConfigAssociationError.accessDenied: 'ACCESS_DENIED',
  ResolverQueryLogConfigAssociationError.internalServiceError:
      'INTERNAL_SERVICE_ERROR',
};

const _$ResolverQueryLogConfigAssociationStatusEnumMap = {
  ResolverQueryLogConfigAssociationStatus.creating: 'CREATING',
  ResolverQueryLogConfigAssociationStatus.active: 'ACTIVE',
  ResolverQueryLogConfigAssociationStatus.actionNeeded: 'ACTION_NEEDED',
  ResolverQueryLogConfigAssociationStatus.deleting: 'DELETING',
  ResolverQueryLogConfigAssociationStatus.failed: 'FAILED',
};

ResolverRule _$ResolverRuleFromJson(Map<String, dynamic> json) {
  return ResolverRule(
    arn: json['Arn'] as String,
    creationTime: json['CreationTime'] as String,
    creatorRequestId: json['CreatorRequestId'] as String,
    domainName: json['DomainName'] as String,
    id: json['Id'] as String,
    modificationTime: json['ModificationTime'] as String,
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

const _$RuleTypeOptionEnumMap = {
  RuleTypeOption.forward: 'FORWARD',
  RuleTypeOption.system: 'SYSTEM',
  RuleTypeOption.recursive: 'RECURSIVE',
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

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateResolverDnssecConfigResponse _$UpdateResolverDnssecConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResolverDnssecConfigResponse(
    resolverDNSSECConfig: json['ResolverDNSSECConfig'] == null
        ? null
        : ResolverDnssecConfig.fromJson(
            json['ResolverDNSSECConfig'] as Map<String, dynamic>),
  );
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

UpdateResolverRuleResponse _$UpdateResolverRuleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResolverRuleResponse(
    resolverRule: json['ResolverRule'] == null
        ? null
        : ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>),
  );
}
