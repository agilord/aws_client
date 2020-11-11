// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fms-2018-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateAdminAccountRequestToJson(
    AssociateAdminAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdminAccount', instance.adminAccount);
  return val;
}

ComplianceViolator _$ComplianceViolatorFromJson(Map<String, dynamic> json) {
  return ComplianceViolator(
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    violationReason:
        _$enumDecodeNullable(_$ViolationReasonEnumMap, json['ViolationReason']),
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

const _$ViolationReasonEnumMap = {
  ViolationReason.webAclMissingRuleGroup: 'WEB_ACL_MISSING_RULE_GROUP',
  ViolationReason.resourceMissingWebAcl: 'RESOURCE_MISSING_WEB_ACL',
  ViolationReason.resourceIncorrectWebAcl: 'RESOURCE_INCORRECT_WEB_ACL',
  ViolationReason.resourceMissingShieldProtection:
      'RESOURCE_MISSING_SHIELD_PROTECTION',
  ViolationReason.resourceMissingWebAclOrShieldProtection:
      'RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION',
  ViolationReason.resourceMissingSecurityGroup:
      'RESOURCE_MISSING_SECURITY_GROUP',
  ViolationReason.resourceViolatesAuditSecurityGroup:
      'RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP',
  ViolationReason.securityGroupUnused: 'SECURITY_GROUP_UNUSED',
  ViolationReason.securityGroupRedundant: 'SECURITY_GROUP_REDUNDANT',
};

Map<String, dynamic> _$DeletePolicyRequestToJson(DeletePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('DeleteAllPolicyResources', instance.deleteAllPolicyResources);
  return val;
}

EvaluationResult _$EvaluationResultFromJson(Map<String, dynamic> json) {
  return EvaluationResult(
    complianceStatus: _$enumDecodeNullable(
        _$PolicyComplianceStatusTypeEnumMap, json['ComplianceStatus']),
    evaluationLimitExceeded: json['EvaluationLimitExceeded'] as bool,
    violatorCount: json['ViolatorCount'] as int,
  );
}

const _$PolicyComplianceStatusTypeEnumMap = {
  PolicyComplianceStatusType.compliant: 'COMPLIANT',
  PolicyComplianceStatusType.nonCompliant: 'NON_COMPLIANT',
};

GetAdminAccountResponse _$GetAdminAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetAdminAccountResponse(
    adminAccount: json['AdminAccount'] as String,
    roleStatus:
        _$enumDecodeNullable(_$AccountRoleStatusEnumMap, json['RoleStatus']),
  );
}

const _$AccountRoleStatusEnumMap = {
  AccountRoleStatus.ready: 'READY',
  AccountRoleStatus.creating: 'CREATING',
  AccountRoleStatus.pendingDeletion: 'PENDING_DELETION',
  AccountRoleStatus.deleting: 'DELETING',
  AccountRoleStatus.deleted: 'DELETED',
};

Map<String, dynamic> _$GetComplianceDetailRequestToJson(
    GetComplianceDetailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MemberAccount', instance.memberAccount);
  writeNotNull('PolicyId', instance.policyId);
  return val;
}

GetComplianceDetailResponse _$GetComplianceDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetComplianceDetailResponse(
    policyComplianceDetail: json['PolicyComplianceDetail'] == null
        ? null
        : PolicyComplianceDetail.fromJson(
            json['PolicyComplianceDetail'] as Map<String, dynamic>),
  );
}

GetNotificationChannelResponse _$GetNotificationChannelResponseFromJson(
    Map<String, dynamic> json) {
  return GetNotificationChannelResponse(
    snsRoleName: json['SnsRoleName'] as String,
    snsTopicArn: json['SnsTopicArn'] as String,
  );
}

Map<String, dynamic> _$GetPolicyRequestToJson(GetPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  return val;
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
    policyArn: json['PolicyArn'] as String,
  );
}

Map<String, dynamic> _$GetProtectionStatusRequestToJson(
    GetProtectionStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('MemberAccountId', instance.memberAccountId);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}

GetProtectionStatusResponse _$GetProtectionStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetProtectionStatusResponse(
    adminAccountId: json['AdminAccountId'] as String,
    data: json['Data'] as String,
    nextToken: json['NextToken'] as String,
    serviceType:
        _$enumDecodeNullable(_$SecurityServiceTypeEnumMap, json['ServiceType']),
  );
}

const _$SecurityServiceTypeEnumMap = {
  SecurityServiceType.waf: 'WAF',
  SecurityServiceType.wafv2: 'WAFV2',
  SecurityServiceType.shieldAdvanced: 'SHIELD_ADVANCED',
  SecurityServiceType.securityGroupsCommon: 'SECURITY_GROUPS_COMMON',
  SecurityServiceType.securityGroupsContentAudit:
      'SECURITY_GROUPS_CONTENT_AUDIT',
  SecurityServiceType.securityGroupsUsageAudit: 'SECURITY_GROUPS_USAGE_AUDIT',
};

Map<String, dynamic> _$ListComplianceStatusRequestToJson(
    ListComplianceStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListComplianceStatusResponse _$ListComplianceStatusResponseFromJson(
    Map<String, dynamic> json) {
  return ListComplianceStatusResponse(
    nextToken: json['NextToken'] as String,
    policyComplianceStatusList: (json['PolicyComplianceStatusList'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyComplianceStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListMemberAccountsRequestToJson(
    ListMemberAccountsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListMemberAccountsResponse _$ListMemberAccountsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMemberAccountsResponse(
    memberAccounts:
        (json['MemberAccounts'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListPoliciesRequestToJson(ListPoliciesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListPoliciesResponse _$ListPoliciesResponseFromJson(Map<String, dynamic> json) {
  return ListPoliciesResponse(
    nextToken: json['NextToken'] as String,
    policyList: (json['PolicyList'] as List)
        ?.map((e) => e == null
            ? null
            : PolicySummary.fromJson(e as Map<String, dynamic>))
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
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Policy _$PolicyFromJson(Map<String, dynamic> json) {
  return Policy(
    excludeResourceTags: json['ExcludeResourceTags'] as bool,
    policyName: json['PolicyName'] as String,
    remediationEnabled: json['RemediationEnabled'] as bool,
    resourceType: json['ResourceType'] as String,
    securityServicePolicyData: json['SecurityServicePolicyData'] == null
        ? null
        : SecurityServicePolicyData.fromJson(
            json['SecurityServicePolicyData'] as Map<String, dynamic>),
    excludeMap: (json['ExcludeMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    includeMap: (json['IncludeMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    policyId: json['PolicyId'] as String,
    policyUpdateToken: json['PolicyUpdateToken'] as String,
    resourceTags: (json['ResourceTags'] as List)
        ?.map((e) =>
            e == null ? null : ResourceTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceTypeList:
        (json['ResourceTypeList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PolicyToJson(Policy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExcludeResourceTags', instance.excludeResourceTags);
  writeNotNull('PolicyName', instance.policyName);
  writeNotNull('RemediationEnabled', instance.remediationEnabled);
  writeNotNull('ResourceType', instance.resourceType);
  writeNotNull('SecurityServicePolicyData',
      instance.securityServicePolicyData?.toJson());
  writeNotNull('ExcludeMap', instance.excludeMap);
  writeNotNull('IncludeMap', instance.includeMap);
  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('PolicyUpdateToken', instance.policyUpdateToken);
  writeNotNull(
      'ResourceTags', instance.resourceTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceTypeList', instance.resourceTypeList);
  return val;
}

PolicyComplianceDetail _$PolicyComplianceDetailFromJson(
    Map<String, dynamic> json) {
  return PolicyComplianceDetail(
    evaluationLimitExceeded: json['EvaluationLimitExceeded'] as bool,
    expiredAt: unixTimestampFromJson(json['ExpiredAt']),
    issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    memberAccount: json['MemberAccount'] as String,
    policyId: json['PolicyId'] as String,
    policyOwner: json['PolicyOwner'] as String,
    violators: (json['Violators'] as List)
        ?.map((e) => e == null
            ? null
            : ComplianceViolator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PolicyComplianceStatus _$PolicyComplianceStatusFromJson(
    Map<String, dynamic> json) {
  return PolicyComplianceStatus(
    evaluationResults: (json['EvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    lastUpdated: unixTimestampFromJson(json['LastUpdated']),
    memberAccount: json['MemberAccount'] as String,
    policyId: json['PolicyId'] as String,
    policyName: json['PolicyName'] as String,
    policyOwner: json['PolicyOwner'] as String,
  );
}

PolicySummary _$PolicySummaryFromJson(Map<String, dynamic> json) {
  return PolicySummary(
    policyArn: json['PolicyArn'] as String,
    policyId: json['PolicyId'] as String,
    policyName: json['PolicyName'] as String,
    remediationEnabled: json['RemediationEnabled'] as bool,
    resourceType: json['ResourceType'] as String,
    securityServiceType: _$enumDecodeNullable(
        _$SecurityServiceTypeEnumMap, json['SecurityServiceType']),
  );
}

Map<String, dynamic> _$PutNotificationChannelRequestToJson(
    PutNotificationChannelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnsRoleName', instance.snsRoleName);
  writeNotNull('SnsTopicArn', instance.snsTopicArn);
  return val;
}

Map<String, dynamic> _$PutPolicyRequestToJson(PutPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Policy', instance.policy?.toJson());
  writeNotNull('TagList', instance.tagList?.map((e) => e?.toJson())?.toList());
  return val;
}

PutPolicyResponse _$PutPolicyResponseFromJson(Map<String, dynamic> json) {
  return PutPolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
    policyArn: json['PolicyArn'] as String,
  );
}

ResourceTag _$ResourceTagFromJson(Map<String, dynamic> json) {
  return ResourceTag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ResourceTagToJson(ResourceTag instance) {
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

SecurityServicePolicyData _$SecurityServicePolicyDataFromJson(
    Map<String, dynamic> json) {
  return SecurityServicePolicyData(
    type: _$enumDecodeNullable(_$SecurityServiceTypeEnumMap, json['Type']),
    managedServiceData: json['ManagedServiceData'] as String,
  );
}

Map<String, dynamic> _$SecurityServicePolicyDataToJson(
    SecurityServicePolicyData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$SecurityServiceTypeEnumMap[instance.type]);
  writeNotNull('ManagedServiceData', instance.managedServiceData);
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
  writeNotNull('TagList', instance.tagList?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
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
