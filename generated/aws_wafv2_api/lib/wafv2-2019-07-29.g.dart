// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wafv2-2019-07-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllQueryArguments _$AllQueryArgumentsFromJson(Map<String, dynamic> json) {
  return AllQueryArguments();
}

Map<String, dynamic> _$AllQueryArgumentsToJson(AllQueryArguments instance) =>
    <String, dynamic>{};

AllowAction _$AllowActionFromJson(Map<String, dynamic> json) {
  return AllowAction();
}

Map<String, dynamic> _$AllowActionToJson(AllowAction instance) =>
    <String, dynamic>{};

AndStatement _$AndStatementFromJson(Map<String, dynamic> json) {
  return AndStatement(
    statements: (json['Statements'] as List)
        ?.map((e) =>
            e == null ? null : Statement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AndStatementToJson(AndStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Statements', instance.statements?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$AssociateWebACLRequestToJson(
    AssociateWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('WebACLArn', instance.webACLArn);
  return val;
}

AssociateWebACLResponse _$AssociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateWebACLResponse();
}

BlockAction _$BlockActionFromJson(Map<String, dynamic> json) {
  return BlockAction();
}

Map<String, dynamic> _$BlockActionToJson(BlockAction instance) =>
    <String, dynamic>{};

Body _$BodyFromJson(Map<String, dynamic> json) {
  return Body();
}

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{};

ByteMatchStatement _$ByteMatchStatementFromJson(Map<String, dynamic> json) {
  return ByteMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    positionalConstraint: _$enumDecodeNullable(
        _$PositionalConstraintEnumMap, json['PositionalConstraint']),
    searchString:
        const Uint8ListConverter().fromJson(json['SearchString'] as String),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ByteMatchStatementToJson(ByteMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('PositionalConstraint',
      _$PositionalConstraintEnumMap[instance.positionalConstraint]);
  writeNotNull(
      'SearchString', const Uint8ListConverter().toJson(instance.searchString));
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
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

const _$PositionalConstraintEnumMap = {
  PositionalConstraint.exactly: 'EXACTLY',
  PositionalConstraint.startsWith: 'STARTS_WITH',
  PositionalConstraint.endsWith: 'ENDS_WITH',
  PositionalConstraint.contains: 'CONTAINS',
  PositionalConstraint.containsWord: 'CONTAINS_WORD',
};

Map<String, dynamic> _$CheckCapacityRequestToJson(
    CheckCapacityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

const _$ScopeEnumMap = {
  Scope.cloudfront: 'CLOUDFRONT',
  Scope.regional: 'REGIONAL',
};

CheckCapacityResponse _$CheckCapacityResponseFromJson(
    Map<String, dynamic> json) {
  return CheckCapacityResponse(
    capacity: json['Capacity'] as int,
  );
}

CountAction _$CountActionFromJson(Map<String, dynamic> json) {
  return CountAction();
}

Map<String, dynamic> _$CountActionToJson(CountAction instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$CreateIPSetRequestToJson(CreateIPSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Addresses', instance.addresses);
  writeNotNull(
      'IPAddressVersion', _$IPAddressVersionEnumMap[instance.iPAddressVersion]);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$IPAddressVersionEnumMap = {
  IPAddressVersion.ipv4: 'IPV4',
  IPAddressVersion.ipv6: 'IPV6',
};

CreateIPSetResponse _$CreateIPSetResponseFromJson(Map<String, dynamic> json) {
  return CreateIPSetResponse(
    summary: json['Summary'] == null
        ? null
        : IPSetSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRegexPatternSetRequestToJson(
    CreateRegexPatternSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RegularExpressionList',
      instance.regularExpressionList?.map((e) => e?.toJson())?.toList());
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateRegexPatternSetResponse _$CreateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRegexPatternSetResponse(
    summary: json['Summary'] == null
        ? null
        : RegexPatternSetSummary.fromJson(
            json['Summary'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRuleGroupRequestToJson(
    CreateRuleGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Capacity', instance.capacity);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateRuleGroupResponse _$CreateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRuleGroupResponse(
    summary: json['Summary'] == null
        ? null
        : RuleGroupSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateWebACLRequestToJson(CreateWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultAction', instance.defaultAction?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateWebACLResponse _$CreateWebACLResponseFromJson(Map<String, dynamic> json) {
  return CreateWebACLResponse(
    summary: json['Summary'] == null
        ? null
        : WebACLSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

DefaultAction _$DefaultActionFromJson(Map<String, dynamic> json) {
  return DefaultAction(
    allow: json['Allow'] == null
        ? null
        : AllowAction.fromJson(json['Allow'] as Map<String, dynamic>),
    block: json['Block'] == null
        ? null
        : BlockAction.fromJson(json['Block'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DefaultActionToJson(DefaultAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Allow', instance.allow?.toJson());
  writeNotNull('Block', instance.block?.toJson());
  return val;
}

Map<String, dynamic> _$DeleteFirewallManagerRuleGroupsRequestToJson(
    DeleteFirewallManagerRuleGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WebACLArn', instance.webACLArn);
  writeNotNull('WebACLLockToken', instance.webACLLockToken);
  return val;
}

DeleteFirewallManagerRuleGroupsResponse
    _$DeleteFirewallManagerRuleGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteFirewallManagerRuleGroupsResponse(
    nextWebACLLockToken: json['NextWebACLLockToken'] as String,
  );
}

Map<String, dynamic> _$DeleteIPSetRequestToJson(DeleteIPSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

DeleteIPSetResponse _$DeleteIPSetResponseFromJson(Map<String, dynamic> json) {
  return DeleteIPSetResponse();
}

Map<String, dynamic> _$DeleteLoggingConfigurationRequestToJson(
    DeleteLoggingConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DeleteLoggingConfigurationResponse _$DeleteLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLoggingConfigurationResponse();
}

Map<String, dynamic> _$DeletePermissionPolicyRequestToJson(
    DeletePermissionPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DeletePermissionPolicyResponse _$DeletePermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePermissionPolicyResponse();
}

Map<String, dynamic> _$DeleteRegexPatternSetRequestToJson(
    DeleteRegexPatternSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

DeleteRegexPatternSetResponse _$DeleteRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegexPatternSetResponse();
}

Map<String, dynamic> _$DeleteRuleGroupRequestToJson(
    DeleteRuleGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

DeleteRuleGroupResponse _$DeleteRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleGroupResponse();
}

Map<String, dynamic> _$DeleteWebACLRequestToJson(DeleteWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

DeleteWebACLResponse _$DeleteWebACLResponseFromJson(Map<String, dynamic> json) {
  return DeleteWebACLResponse();
}

Map<String, dynamic> _$DescribeManagedRuleGroupRequestToJson(
    DescribeManagedRuleGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('VendorName', instance.vendorName);
  return val;
}

DescribeManagedRuleGroupResponse _$DescribeManagedRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeManagedRuleGroupResponse(
    capacity: json['Capacity'] as int,
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DisassociateWebACLRequestToJson(
    DisassociateWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DisassociateWebACLResponse _$DisassociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateWebACLResponse();
}

ExcludedRule _$ExcludedRuleFromJson(Map<String, dynamic> json) {
  return ExcludedRule(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ExcludedRuleToJson(ExcludedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

FieldToMatch _$FieldToMatchFromJson(Map<String, dynamic> json) {
  return FieldToMatch(
    allQueryArguments: json['AllQueryArguments'] == null
        ? null
        : AllQueryArguments.fromJson(
            json['AllQueryArguments'] as Map<String, dynamic>),
    body: json['Body'] == null
        ? null
        : Body.fromJson(json['Body'] as Map<String, dynamic>),
    method: json['Method'] == null
        ? null
        : Method.fromJson(json['Method'] as Map<String, dynamic>),
    queryString: json['QueryString'] == null
        ? null
        : QueryString.fromJson(json['QueryString'] as Map<String, dynamic>),
    singleHeader: json['SingleHeader'] == null
        ? null
        : SingleHeader.fromJson(json['SingleHeader'] as Map<String, dynamic>),
    singleQueryArgument: json['SingleQueryArgument'] == null
        ? null
        : SingleQueryArgument.fromJson(
            json['SingleQueryArgument'] as Map<String, dynamic>),
    uriPath: json['UriPath'] == null
        ? null
        : UriPath.fromJson(json['UriPath'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FieldToMatchToJson(FieldToMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllQueryArguments', instance.allQueryArguments?.toJson());
  writeNotNull('Body', instance.body?.toJson());
  writeNotNull('Method', instance.method?.toJson());
  writeNotNull('QueryString', instance.queryString?.toJson());
  writeNotNull('SingleHeader', instance.singleHeader?.toJson());
  writeNotNull('SingleQueryArgument', instance.singleQueryArgument?.toJson());
  writeNotNull('UriPath', instance.uriPath?.toJson());
  return val;
}

FirewallManagerRuleGroup _$FirewallManagerRuleGroupFromJson(
    Map<String, dynamic> json) {
  return FirewallManagerRuleGroup(
    firewallManagerStatement: json['FirewallManagerStatement'] == null
        ? null
        : FirewallManagerStatement.fromJson(
            json['FirewallManagerStatement'] as Map<String, dynamic>),
    name: json['Name'] as String,
    overrideAction: json['OverrideAction'] == null
        ? null
        : OverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
    priority: json['Priority'] as int,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
  );
}

FirewallManagerStatement _$FirewallManagerStatementFromJson(
    Map<String, dynamic> json) {
  return FirewallManagerStatement(
    managedRuleGroupStatement: json['ManagedRuleGroupStatement'] == null
        ? null
        : ManagedRuleGroupStatement.fromJson(
            json['ManagedRuleGroupStatement'] as Map<String, dynamic>),
    ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] == null
        ? null
        : RuleGroupReferenceStatement.fromJson(
            json['RuleGroupReferenceStatement'] as Map<String, dynamic>),
  );
}

GeoMatchStatement _$GeoMatchStatementFromJson(Map<String, dynamic> json) {
  return GeoMatchStatement(
    countryCodes:
        (json['CountryCodes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GeoMatchStatementToJson(GeoMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CountryCodes', instance.countryCodes);
  return val;
}

Map<String, dynamic> _$GetIPSetRequestToJson(GetIPSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

GetIPSetResponse _$GetIPSetResponseFromJson(Map<String, dynamic> json) {
  return GetIPSetResponse(
    iPSet: json['IPSet'] == null
        ? null
        : IPSet.fromJson(json['IPSet'] as Map<String, dynamic>),
    lockToken: json['LockToken'] as String,
  );
}

Map<String, dynamic> _$GetLoggingConfigurationRequestToJson(
    GetLoggingConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

GetLoggingConfigurationResponse _$GetLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetPermissionPolicyRequestToJson(
    GetPermissionPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

GetPermissionPolicyResponse _$GetPermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetPermissionPolicyResponse(
    policy: json['Policy'] as String,
  );
}

Map<String, dynamic> _$GetRateBasedStatementManagedKeysRequestToJson(
    GetRateBasedStatementManagedKeysRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleName', instance.ruleName);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('WebACLId', instance.webACLId);
  writeNotNull('WebACLName', instance.webACLName);
  return val;
}

GetRateBasedStatementManagedKeysResponse
    _$GetRateBasedStatementManagedKeysResponseFromJson(
        Map<String, dynamic> json) {
  return GetRateBasedStatementManagedKeysResponse(
    managedKeysIPV4: json['ManagedKeysIPV4'] == null
        ? null
        : RateBasedStatementManagedKeysIPSet.fromJson(
            json['ManagedKeysIPV4'] as Map<String, dynamic>),
    managedKeysIPV6: json['ManagedKeysIPV6'] == null
        ? null
        : RateBasedStatementManagedKeysIPSet.fromJson(
            json['ManagedKeysIPV6'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetRegexPatternSetRequestToJson(
    GetRegexPatternSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

GetRegexPatternSetResponse _$GetRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegexPatternSetResponse(
    lockToken: json['LockToken'] as String,
    regexPatternSet: json['RegexPatternSet'] == null
        ? null
        : RegexPatternSet.fromJson(
            json['RegexPatternSet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetRuleGroupRequestToJson(GetRuleGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

GetRuleGroupResponse _$GetRuleGroupResponseFromJson(Map<String, dynamic> json) {
  return GetRuleGroupResponse(
    lockToken: json['LockToken'] as String,
    ruleGroup: json['RuleGroup'] == null
        ? null
        : RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetSampledRequestsRequestToJson(
    GetSampledRequestsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxItems', instance.maxItems);
  writeNotNull('RuleMetricName', instance.ruleMetricName);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('TimeWindow', instance.timeWindow?.toJson());
  writeNotNull('WebAclArn', instance.webAclArn);
  return val;
}

GetSampledRequestsResponse _$GetSampledRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSampledRequestsResponse(
    populationSize: json['PopulationSize'] as int,
    sampledRequests: (json['SampledRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SampledHTTPRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeWindow: json['TimeWindow'] == null
        ? null
        : TimeWindow.fromJson(json['TimeWindow'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetWebACLForResourceRequestToJson(
    GetWebACLForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

GetWebACLForResourceResponse _$GetWebACLForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return GetWebACLForResourceResponse(
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetWebACLRequestToJson(GetWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

GetWebACLResponse _$GetWebACLResponseFromJson(Map<String, dynamic> json) {
  return GetWebACLResponse(
    lockToken: json['LockToken'] as String,
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

HTTPHeader _$HTTPHeaderFromJson(Map<String, dynamic> json) {
  return HTTPHeader(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

HTTPRequest _$HTTPRequestFromJson(Map<String, dynamic> json) {
  return HTTPRequest(
    clientIP: json['ClientIP'] as String,
    country: json['Country'] as String,
    hTTPVersion: json['HTTPVersion'] as String,
    headers: (json['Headers'] as List)
        ?.map((e) =>
            e == null ? null : HTTPHeader.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    method: json['Method'] as String,
    uri: json['URI'] as String,
  );
}

IPSet _$IPSetFromJson(Map<String, dynamic> json) {
  return IPSet(
    arn: json['ARN'] as String,
    addresses: (json['Addresses'] as List)?.map((e) => e as String)?.toList(),
    iPAddressVersion: _$enumDecodeNullable(
        _$IPAddressVersionEnumMap, json['IPAddressVersion']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    description: json['Description'] as String,
  );
}

IPSetReferenceStatement _$IPSetReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return IPSetReferenceStatement(
    arn: json['ARN'] as String,
  );
}

Map<String, dynamic> _$IPSetReferenceStatementToJson(
    IPSetReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  return val;
}

IPSetSummary _$IPSetSummaryFromJson(Map<String, dynamic> json) {
  return IPSetSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ListAvailableManagedRuleGroupsRequestToJson(
    ListAvailableManagedRuleGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListAvailableManagedRuleGroupsResponse
    _$ListAvailableManagedRuleGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return ListAvailableManagedRuleGroupsResponse(
    managedRuleGroups: (json['ManagedRuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ManagedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

Map<String, dynamic> _$ListIPSetsRequestToJson(ListIPSetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListIPSetsResponse _$ListIPSetsResponseFromJson(Map<String, dynamic> json) {
  return ListIPSetsResponse(
    iPSets: (json['IPSets'] as List)
        ?.map((e) =>
            e == null ? null : IPSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

Map<String, dynamic> _$ListLoggingConfigurationsRequestToJson(
    ListLoggingConfigurationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

ListLoggingConfigurationsResponse _$ListLoggingConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLoggingConfigurationsResponse(
    loggingConfigurations: (json['LoggingConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : LoggingConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

Map<String, dynamic> _$ListRegexPatternSetsRequestToJson(
    ListRegexPatternSetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListRegexPatternSetsResponse _$ListRegexPatternSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRegexPatternSetsResponse(
    nextMarker: json['NextMarker'] as String,
    regexPatternSets: (json['RegexPatternSets'] as List)
        ?.map((e) => e == null
            ? null
            : RegexPatternSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListResourcesForWebACLRequestToJson(
    ListResourcesForWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WebACLArn', instance.webACLArn);
  writeNotNull('ResourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  return val;
}

const _$ResourceTypeEnumMap = {
  ResourceType.applicationLoadBalancer: 'APPLICATION_LOAD_BALANCER',
  ResourceType.apiGateway: 'API_GATEWAY',
};

ListResourcesForWebACLResponse _$ListResourcesForWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourcesForWebACLResponse(
    resourceArns:
        (json['ResourceArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListRuleGroupsRequestToJson(
    ListRuleGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListRuleGroupsResponse _$ListRuleGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRuleGroupsResponse(
    nextMarker: json['NextMarker'] as String,
    ruleGroups: (json['RuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : RuleGroupSummary.fromJson(e as Map<String, dynamic>))
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

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextMarker: json['NextMarker'] as String,
    tagInfoForResource: json['TagInfoForResource'] == null
        ? null
        : TagInfoForResource.fromJson(
            json['TagInfoForResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListWebACLsRequestToJson(ListWebACLsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextMarker', instance.nextMarker);
  return val;
}

ListWebACLsResponse _$ListWebACLsResponseFromJson(Map<String, dynamic> json) {
  return ListWebACLsResponse(
    nextMarker: json['NextMarker'] as String,
    webACLs: (json['WebACLs'] as List)
        ?.map((e) => e == null
            ? null
            : WebACLSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    logDestinationConfigs: (json['LogDestinationConfigs'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    resourceArn: json['ResourceArn'] as String,
    redactedFields: (json['RedactedFields'] as List)
        ?.map((e) =>
            e == null ? null : FieldToMatch.fromJson(e as Map<String, dynamic>))
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

  writeNotNull('LogDestinationConfigs', instance.logDestinationConfigs);
  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('RedactedFields',
      instance.redactedFields?.map((e) => e?.toJson())?.toList());
  return val;
}

ManagedRuleGroupStatement _$ManagedRuleGroupStatementFromJson(
    Map<String, dynamic> json) {
  return ManagedRuleGroupStatement(
    name: json['Name'] as String,
    vendorName: json['VendorName'] as String,
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) =>
            e == null ? null : ExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ManagedRuleGroupStatementToJson(
    ManagedRuleGroupStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('VendorName', instance.vendorName);
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  return val;
}

ManagedRuleGroupSummary _$ManagedRuleGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return ManagedRuleGroupSummary(
    description: json['Description'] as String,
    name: json['Name'] as String,
    vendorName: json['VendorName'] as String,
  );
}

Method _$MethodFromJson(Map<String, dynamic> json) {
  return Method();
}

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{};

NoneAction _$NoneActionFromJson(Map<String, dynamic> json) {
  return NoneAction();
}

Map<String, dynamic> _$NoneActionToJson(NoneAction instance) =>
    <String, dynamic>{};

NotStatement _$NotStatementFromJson(Map<String, dynamic> json) {
  return NotStatement(
    statement: json['Statement'] == null
        ? null
        : Statement.fromJson(json['Statement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotStatementToJson(NotStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Statement', instance.statement?.toJson());
  return val;
}

OrStatement _$OrStatementFromJson(Map<String, dynamic> json) {
  return OrStatement(
    statements: (json['Statements'] as List)
        ?.map((e) =>
            e == null ? null : Statement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrStatementToJson(OrStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Statements', instance.statements?.map((e) => e?.toJson())?.toList());
  return val;
}

OverrideAction _$OverrideActionFromJson(Map<String, dynamic> json) {
  return OverrideAction(
    count: json['Count'] == null
        ? null
        : CountAction.fromJson(json['Count'] as Map<String, dynamic>),
    none: json['None'] == null
        ? null
        : NoneAction.fromJson(json['None'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OverrideActionToJson(OverrideAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Count', instance.count?.toJson());
  writeNotNull('None', instance.none?.toJson());
  return val;
}

Map<String, dynamic> _$PutLoggingConfigurationRequestToJson(
    PutLoggingConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LoggingConfiguration', instance.loggingConfiguration?.toJson());
  return val;
}

PutLoggingConfigurationResponse _$PutLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutPermissionPolicyRequestToJson(
    PutPermissionPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Policy', instance.policy);
  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

PutPermissionPolicyResponse _$PutPermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutPermissionPolicyResponse();
}

QueryString _$QueryStringFromJson(Map<String, dynamic> json) {
  return QueryString();
}

Map<String, dynamic> _$QueryStringToJson(QueryString instance) =>
    <String, dynamic>{};

RateBasedStatement _$RateBasedStatementFromJson(Map<String, dynamic> json) {
  return RateBasedStatement(
    aggregateKeyType: _$enumDecodeNullable(
        _$RateBasedStatementAggregateKeyTypeEnumMap, json['AggregateKeyType']),
    limit: json['Limit'] as int,
    scopeDownStatement: json['ScopeDownStatement'] == null
        ? null
        : Statement.fromJson(
            json['ScopeDownStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RateBasedStatementToJson(RateBasedStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AggregateKeyType',
      _$RateBasedStatementAggregateKeyTypeEnumMap[instance.aggregateKeyType]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('ScopeDownStatement', instance.scopeDownStatement?.toJson());
  return val;
}

const _$RateBasedStatementAggregateKeyTypeEnumMap = {
  RateBasedStatementAggregateKeyType.ip: 'IP',
};

RateBasedStatementManagedKeysIPSet _$RateBasedStatementManagedKeysIPSetFromJson(
    Map<String, dynamic> json) {
  return RateBasedStatementManagedKeysIPSet(
    addresses: (json['Addresses'] as List)?.map((e) => e as String)?.toList(),
    iPAddressVersion: _$enumDecodeNullable(
        _$IPAddressVersionEnumMap, json['IPAddressVersion']),
  );
}

Regex _$RegexFromJson(Map<String, dynamic> json) {
  return Regex(
    regexString: json['RegexString'] as String,
  );
}

Map<String, dynamic> _$RegexToJson(Regex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegexString', instance.regexString);
  return val;
}

RegexPatternSet _$RegexPatternSetFromJson(Map<String, dynamic> json) {
  return RegexPatternSet(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    regularExpressionList: (json['RegularExpressionList'] as List)
        ?.map(
            (e) => e == null ? null : Regex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RegexPatternSetReferenceStatement _$RegexPatternSetReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return RegexPatternSetReferenceStatement(
    arn: json['ARN'] as String,
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RegexPatternSetReferenceStatementToJson(
    RegexPatternSetReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

RegexPatternSetSummary _$RegexPatternSetSummaryFromJson(
    Map<String, dynamic> json) {
  return RegexPatternSetSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    name: json['Name'] as String,
    priority: json['Priority'] as int,
    statement: json['Statement'] == null
        ? null
        : Statement.fromJson(json['Statement'] as Map<String, dynamic>),
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    action: json['Action'] == null
        ? null
        : RuleAction.fromJson(json['Action'] as Map<String, dynamic>),
    overrideAction: json['OverrideAction'] == null
        ? null
        : OverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Priority', instance.priority);
  writeNotNull('Statement', instance.statement?.toJson());
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('OverrideAction', instance.overrideAction?.toJson());
  return val;
}

RuleAction _$RuleActionFromJson(Map<String, dynamic> json) {
  return RuleAction(
    allow: json['Allow'] == null
        ? null
        : AllowAction.fromJson(json['Allow'] as Map<String, dynamic>),
    block: json['Block'] == null
        ? null
        : BlockAction.fromJson(json['Block'] as Map<String, dynamic>),
    count: json['Count'] == null
        ? null
        : CountAction.fromJson(json['Count'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleActionToJson(RuleAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Allow', instance.allow?.toJson());
  writeNotNull('Block', instance.block?.toJson());
  writeNotNull('Count', instance.count?.toJson());
  return val;
}

RuleGroup _$RuleGroupFromJson(Map<String, dynamic> json) {
  return RuleGroup(
    arn: json['ARN'] as String,
    capacity: json['Capacity'] as int,
    id: json['Id'] as String,
    name: json['Name'] as String,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    description: json['Description'] as String,
    rules: (json['Rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RuleGroupReferenceStatement _$RuleGroupReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return RuleGroupReferenceStatement(
    arn: json['ARN'] as String,
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) =>
            e == null ? null : ExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RuleGroupReferenceStatementToJson(
    RuleGroupReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  return val;
}

RuleGroupSummary _$RuleGroupSummaryFromJson(Map<String, dynamic> json) {
  return RuleGroupSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

RuleSummary _$RuleSummaryFromJson(Map<String, dynamic> json) {
  return RuleSummary(
    action: json['Action'] == null
        ? null
        : RuleAction.fromJson(json['Action'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

SampledHTTPRequest _$SampledHTTPRequestFromJson(Map<String, dynamic> json) {
  return SampledHTTPRequest(
    request: json['Request'] == null
        ? null
        : HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
    weight: json['Weight'] as int,
    action: json['Action'] as String,
    ruleNameWithinRuleGroup: json['RuleNameWithinRuleGroup'] as String,
    timestamp: unixTimestampFromJson(json['Timestamp']),
  );
}

SingleHeader _$SingleHeaderFromJson(Map<String, dynamic> json) {
  return SingleHeader(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SingleHeaderToJson(SingleHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

SingleQueryArgument _$SingleQueryArgumentFromJson(Map<String, dynamic> json) {
  return SingleQueryArgument(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SingleQueryArgumentToJson(SingleQueryArgument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

SizeConstraintStatement _$SizeConstraintStatementFromJson(
    Map<String, dynamic> json) {
  return SizeConstraintStatement(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    size: json['Size'] as int,
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SizeConstraintStatementToJson(
    SizeConstraintStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('Size', instance.size);
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.eq: 'EQ',
  ComparisonOperator.ne: 'NE',
  ComparisonOperator.le: 'LE',
  ComparisonOperator.lt: 'LT',
  ComparisonOperator.ge: 'GE',
  ComparisonOperator.gt: 'GT',
};

SqliMatchStatement _$SqliMatchStatementFromJson(Map<String, dynamic> json) {
  return SqliMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SqliMatchStatementToJson(SqliMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    andStatement: json['AndStatement'] == null
        ? null
        : AndStatement.fromJson(json['AndStatement'] as Map<String, dynamic>),
    byteMatchStatement: json['ByteMatchStatement'] == null
        ? null
        : ByteMatchStatement.fromJson(
            json['ByteMatchStatement'] as Map<String, dynamic>),
    geoMatchStatement: json['GeoMatchStatement'] == null
        ? null
        : GeoMatchStatement.fromJson(
            json['GeoMatchStatement'] as Map<String, dynamic>),
    iPSetReferenceStatement: json['IPSetReferenceStatement'] == null
        ? null
        : IPSetReferenceStatement.fromJson(
            json['IPSetReferenceStatement'] as Map<String, dynamic>),
    managedRuleGroupStatement: json['ManagedRuleGroupStatement'] == null
        ? null
        : ManagedRuleGroupStatement.fromJson(
            json['ManagedRuleGroupStatement'] as Map<String, dynamic>),
    notStatement: json['NotStatement'] == null
        ? null
        : NotStatement.fromJson(json['NotStatement'] as Map<String, dynamic>),
    orStatement: json['OrStatement'] == null
        ? null
        : OrStatement.fromJson(json['OrStatement'] as Map<String, dynamic>),
    rateBasedStatement: json['RateBasedStatement'] == null
        ? null
        : RateBasedStatement.fromJson(
            json['RateBasedStatement'] as Map<String, dynamic>),
    regexPatternSetReferenceStatement:
        json['RegexPatternSetReferenceStatement'] == null
            ? null
            : RegexPatternSetReferenceStatement.fromJson(
                json['RegexPatternSetReferenceStatement']
                    as Map<String, dynamic>),
    ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] == null
        ? null
        : RuleGroupReferenceStatement.fromJson(
            json['RuleGroupReferenceStatement'] as Map<String, dynamic>),
    sizeConstraintStatement: json['SizeConstraintStatement'] == null
        ? null
        : SizeConstraintStatement.fromJson(
            json['SizeConstraintStatement'] as Map<String, dynamic>),
    sqliMatchStatement: json['SqliMatchStatement'] == null
        ? null
        : SqliMatchStatement.fromJson(
            json['SqliMatchStatement'] as Map<String, dynamic>),
    xssMatchStatement: json['XssMatchStatement'] == null
        ? null
        : XssMatchStatement.fromJson(
            json['XssMatchStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatementToJson(Statement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AndStatement', instance.andStatement?.toJson());
  writeNotNull('ByteMatchStatement', instance.byteMatchStatement?.toJson());
  writeNotNull('GeoMatchStatement', instance.geoMatchStatement?.toJson());
  writeNotNull(
      'IPSetReferenceStatement', instance.iPSetReferenceStatement?.toJson());
  writeNotNull('ManagedRuleGroupStatement',
      instance.managedRuleGroupStatement?.toJson());
  writeNotNull('NotStatement', instance.notStatement?.toJson());
  writeNotNull('OrStatement', instance.orStatement?.toJson());
  writeNotNull('RateBasedStatement', instance.rateBasedStatement?.toJson());
  writeNotNull('RegexPatternSetReferenceStatement',
      instance.regexPatternSetReferenceStatement?.toJson());
  writeNotNull('RuleGroupReferenceStatement',
      instance.ruleGroupReferenceStatement?.toJson());
  writeNotNull(
      'SizeConstraintStatement', instance.sizeConstraintStatement?.toJson());
  writeNotNull('SqliMatchStatement', instance.sqliMatchStatement?.toJson());
  writeNotNull('XssMatchStatement', instance.xssMatchStatement?.toJson());
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

TagInfoForResource _$TagInfoForResourceFromJson(Map<String, dynamic> json) {
  return TagInfoForResource(
    resourceARN: json['ResourceARN'] as String,
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TextTransformation _$TextTransformationFromJson(Map<String, dynamic> json) {
  return TextTransformation(
    priority: json['Priority'] as int,
    type: _$enumDecodeNullable(_$TextTransformationTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$TextTransformationToJson(TextTransformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('Type', _$TextTransformationTypeEnumMap[instance.type]);
  return val;
}

const _$TextTransformationTypeEnumMap = {
  TextTransformationType.none: 'NONE',
  TextTransformationType.compressWhiteSpace: 'COMPRESS_WHITE_SPACE',
  TextTransformationType.htmlEntityDecode: 'HTML_ENTITY_DECODE',
  TextTransformationType.lowercase: 'LOWERCASE',
  TextTransformationType.cmdLine: 'CMD_LINE',
  TextTransformationType.urlDecode: 'URL_DECODE',
};

TimeWindow _$TimeWindowFromJson(Map<String, dynamic> json) {
  return TimeWindow(
    endTime: unixTimestampFromJson(json['EndTime']),
    startTime: unixTimestampFromJson(json['StartTime']),
  );
}

Map<String, dynamic> _$TimeWindowToJson(TimeWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
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

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateIPSetRequestToJson(UpdateIPSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Addresses', instance.addresses);
  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Description', instance.description);
  return val;
}

UpdateIPSetResponse _$UpdateIPSetResponseFromJson(Map<String, dynamic> json) {
  return UpdateIPSetResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

Map<String, dynamic> _$UpdateRegexPatternSetRequestToJson(
    UpdateRegexPatternSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('RegularExpressionList',
      instance.regularExpressionList?.map((e) => e?.toJson())?.toList());
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('Description', instance.description);
  return val;
}

UpdateRegexPatternSetResponse _$UpdateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRegexPatternSetResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

Map<String, dynamic> _$UpdateRuleGroupRequestToJson(
    UpdateRuleGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateRuleGroupResponse _$UpdateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleGroupResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

Map<String, dynamic> _$UpdateWebACLRequestToJson(UpdateWebACLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultAction', instance.defaultAction?.toJson());
  writeNotNull('Id', instance.id);
  writeNotNull('LockToken', instance.lockToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Scope', _$ScopeEnumMap[instance.scope]);
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateWebACLResponse _$UpdateWebACLResponseFromJson(Map<String, dynamic> json) {
  return UpdateWebACLResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

UriPath _$UriPathFromJson(Map<String, dynamic> json) {
  return UriPath();
}

Map<String, dynamic> _$UriPathToJson(UriPath instance) => <String, dynamic>{};

VisibilityConfig _$VisibilityConfigFromJson(Map<String, dynamic> json) {
  return VisibilityConfig(
    cloudWatchMetricsEnabled: json['CloudWatchMetricsEnabled'] as bool,
    metricName: json['MetricName'] as String,
    sampledRequestsEnabled: json['SampledRequestsEnabled'] as bool,
  );
}

Map<String, dynamic> _$VisibilityConfigToJson(VisibilityConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchMetricsEnabled', instance.cloudWatchMetricsEnabled);
  writeNotNull('MetricName', instance.metricName);
  writeNotNull('SampledRequestsEnabled', instance.sampledRequestsEnabled);
  return val;
}

WebACL _$WebACLFromJson(Map<String, dynamic> json) {
  return WebACL(
    arn: json['ARN'] as String,
    defaultAction: json['DefaultAction'] == null
        ? null
        : DefaultAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
    id: json['Id'] as String,
    name: json['Name'] as String,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    capacity: json['Capacity'] as int,
    description: json['Description'] as String,
    managedByFirewallManager: json['ManagedByFirewallManager'] as bool,
    postProcessFirewallManagerRuleGroups:
        (json['PostProcessFirewallManagerRuleGroups'] as List)
            ?.map((e) => e == null
                ? null
                : FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    preProcessFirewallManagerRuleGroups:
        (json['PreProcessFirewallManagerRuleGroups'] as List)
            ?.map((e) => e == null
                ? null
                : FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    rules: (json['Rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

WebACLSummary _$WebACLSummaryFromJson(Map<String, dynamic> json) {
  return WebACLSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

XssMatchStatement _$XssMatchStatementFromJson(Map<String, dynamic> json) {
  return XssMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$XssMatchStatementToJson(XssMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}
