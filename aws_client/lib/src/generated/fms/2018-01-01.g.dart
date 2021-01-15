// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    appName: json['AppName'] as String,
    port: json['Port'] as int,
    protocol: json['Protocol'] as String,
  );
}

Map<String, dynamic> _$AppToJson(App instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppName', instance.appName);
  writeNotNull('Port', instance.port);
  writeNotNull('Protocol', instance.protocol);
  return val;
}

AppsListData _$AppsListDataFromJson(Map<String, dynamic> json) {
  return AppsListData(
    appsList: (json['AppsList'] as List)
        ?.map((e) => e == null ? null : App.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    listName: json['ListName'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    listId: json['ListId'] as String,
    listUpdateToken: json['ListUpdateToken'] as String,
    previousAppsList: (json['PreviousAppsList'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) =>
                  e == null ? null : App.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$AppsListDataToJson(AppsListData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AppsList', instance.appsList?.map((e) => e?.toJson())?.toList());
  writeNotNull('ListName', instance.listName);
  writeNotNull(
      'CreateTime', const UnixDateTimeConverter().toJson(instance.createTime));
  writeNotNull('LastUpdateTime',
      const UnixDateTimeConverter().toJson(instance.lastUpdateTime));
  writeNotNull('ListId', instance.listId);
  writeNotNull('ListUpdateToken', instance.listUpdateToken);
  writeNotNull(
      'PreviousAppsList',
      instance.previousAppsList
          ?.map((k, e) => MapEntry(k, e?.map((e) => e?.toJson())?.toList())));
  return val;
}

AppsListDataSummary _$AppsListDataSummaryFromJson(Map<String, dynamic> json) {
  return AppsListDataSummary(
    appsList: (json['AppsList'] as List)
        ?.map((e) => e == null ? null : App.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    listArn: json['ListArn'] as String,
    listId: json['ListId'] as String,
    listName: json['ListName'] as String,
  );
}

AwsEc2InstanceViolation _$AwsEc2InstanceViolationFromJson(
    Map<String, dynamic> json) {
  return AwsEc2InstanceViolation(
    awsEc2NetworkInterfaceViolations:
        (json['AwsEc2NetworkInterfaceViolations'] as List)
            ?.map((e) => e == null
                ? null
                : AwsEc2NetworkInterfaceViolation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    violationTarget: json['ViolationTarget'] as String,
  );
}

AwsEc2NetworkInterfaceViolation _$AwsEc2NetworkInterfaceViolationFromJson(
    Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceViolation(
    violatingSecurityGroups: (json['ViolatingSecurityGroups'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    violationTarget: json['ViolationTarget'] as String,
  );
}

AwsVPCSecurityGroupViolation _$AwsVPCSecurityGroupViolationFromJson(
    Map<String, dynamic> json) {
  return AwsVPCSecurityGroupViolation(
    partialMatches: (json['PartialMatches'] as List)
        ?.map((e) =>
            e == null ? null : PartialMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    possibleSecurityGroupRemediationActions:
        (json['PossibleSecurityGroupRemediationActions'] as List)
            ?.map((e) => e == null
                ? null
                : SecurityGroupRemediationAction.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    violationTarget: json['ViolationTarget'] as String,
    violationTargetDescription: json['ViolationTargetDescription'] as String,
  );
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
  ViolationReason.missingFirewall: 'MISSING_FIREWALL',
  ViolationReason.missingFirewallSubnetInAz: 'MISSING_FIREWALL_SUBNET_IN_AZ',
  ViolationReason.missingExpectedRouteTable: 'MISSING_EXPECTED_ROUTE_TABLE',
  ViolationReason.networkFirewallPolicyModified:
      'NETWORK_FIREWALL_POLICY_MODIFIED',
};

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

GetAppsListResponse _$GetAppsListResponseFromJson(Map<String, dynamic> json) {
  return GetAppsListResponse(
    appsList: json['AppsList'] == null
        ? null
        : AppsListData.fromJson(json['AppsList'] as Map<String, dynamic>),
    appsListArn: json['AppsListArn'] as String,
  );
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

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
    policyArn: json['PolicyArn'] as String,
  );
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
  SecurityServiceType.networkFirewall: 'NETWORK_FIREWALL',
};

GetProtocolsListResponse _$GetProtocolsListResponseFromJson(
    Map<String, dynamic> json) {
  return GetProtocolsListResponse(
    protocolsList: json['ProtocolsList'] == null
        ? null
        : ProtocolsListData.fromJson(
            json['ProtocolsList'] as Map<String, dynamic>),
    protocolsListArn: json['ProtocolsListArn'] as String,
  );
}

GetViolationDetailsResponse _$GetViolationDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return GetViolationDetailsResponse(
    violationDetail: json['ViolationDetail'] == null
        ? null
        : ViolationDetail.fromJson(
            json['ViolationDetail'] as Map<String, dynamic>),
  );
}

ListAppsListsResponse _$ListAppsListsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppsListsResponse(
    appsLists: (json['AppsLists'] as List)
        ?.map((e) => e == null
            ? null
            : AppsListDataSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
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

ListMemberAccountsResponse _$ListMemberAccountsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMemberAccountsResponse(
    memberAccounts:
        (json['MemberAccounts'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
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

ListProtocolsListsResponse _$ListProtocolsListsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProtocolsListsResponse(
    nextToken: json['NextToken'] as String,
    protocolsLists: (json['ProtocolsLists'] as List)
        ?.map((e) => e == null
            ? null
            : ProtocolsListDataSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NetworkFirewallMissingExpectedRTViolation
    _$NetworkFirewallMissingExpectedRTViolationFromJson(
        Map<String, dynamic> json) {
  return NetworkFirewallMissingExpectedRTViolation(
    availabilityZone: json['AvailabilityZone'] as String,
    currentRouteTable: json['CurrentRouteTable'] as String,
    expectedRouteTable: json['ExpectedRouteTable'] as String,
    vpc: json['VPC'] as String,
    violationTarget: json['ViolationTarget'] as String,
  );
}

NetworkFirewallMissingFirewallViolation
    _$NetworkFirewallMissingFirewallViolationFromJson(
        Map<String, dynamic> json) {
  return NetworkFirewallMissingFirewallViolation(
    availabilityZone: json['AvailabilityZone'] as String,
    targetViolationReason: json['TargetViolationReason'] as String,
    vpc: json['VPC'] as String,
    violationTarget: json['ViolationTarget'] as String,
  );
}

NetworkFirewallMissingSubnetViolation
    _$NetworkFirewallMissingSubnetViolationFromJson(Map<String, dynamic> json) {
  return NetworkFirewallMissingSubnetViolation(
    availabilityZone: json['AvailabilityZone'] as String,
    targetViolationReason: json['TargetViolationReason'] as String,
    vpc: json['VPC'] as String,
    violationTarget: json['ViolationTarget'] as String,
  );
}

NetworkFirewallPolicyDescription _$NetworkFirewallPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return NetworkFirewallPolicyDescription(
    statefulRuleGroups: (json['StatefulRuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : StatefulRuleGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statelessCustomActions: (json['StatelessCustomActions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    statelessDefaultActions: (json['StatelessDefaultActions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    statelessFragmentDefaultActions:
        (json['StatelessFragmentDefaultActions'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    statelessRuleGroups: (json['StatelessRuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : StatelessRuleGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NetworkFirewallPolicyModifiedViolation
    _$NetworkFirewallPolicyModifiedViolationFromJson(
        Map<String, dynamic> json) {
  return NetworkFirewallPolicyModifiedViolation(
    currentPolicyDescription: json['CurrentPolicyDescription'] == null
        ? null
        : NetworkFirewallPolicyDescription.fromJson(
            json['CurrentPolicyDescription'] as Map<String, dynamic>),
    expectedPolicyDescription: json['ExpectedPolicyDescription'] == null
        ? null
        : NetworkFirewallPolicyDescription.fromJson(
            json['ExpectedPolicyDescription'] as Map<String, dynamic>),
    violationTarget: json['ViolationTarget'] as String,
  );
}

PartialMatch _$PartialMatchFromJson(Map<String, dynamic> json) {
  return PartialMatch(
    reference: json['Reference'] as String,
    targetViolationReasons: (json['TargetViolationReasons'] as List)
        ?.map((e) => e as String)
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
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$CustomerPolicyScopeIdTypeEnumMap, k),
          (e as List)?.map((e) => e as String)?.toList()),
    ),
    includeMap: (json['IncludeMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$CustomerPolicyScopeIdTypeEnumMap, k),
          (e as List)?.map((e) => e as String)?.toList()),
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
  writeNotNull(
      'ExcludeMap',
      instance.excludeMap
          ?.map((k, e) => MapEntry(_$CustomerPolicyScopeIdTypeEnumMap[k], e)));
  writeNotNull(
      'IncludeMap',
      instance.includeMap
          ?.map((k, e) => MapEntry(_$CustomerPolicyScopeIdTypeEnumMap[k], e)));
  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('PolicyUpdateToken', instance.policyUpdateToken);
  writeNotNull(
      'ResourceTags', instance.resourceTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceTypeList', instance.resourceTypeList);
  return val;
}

const _$CustomerPolicyScopeIdTypeEnumMap = {
  CustomerPolicyScopeIdType.account: 'ACCOUNT',
  CustomerPolicyScopeIdType.orgUnit: 'ORG_UNIT',
};

PolicyComplianceDetail _$PolicyComplianceDetailFromJson(
    Map<String, dynamic> json) {
  return PolicyComplianceDetail(
    evaluationLimitExceeded: json['EvaluationLimitExceeded'] as bool,
    expiredAt: const UnixDateTimeConverter().fromJson(json['ExpiredAt']),
    issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$DependentServiceNameEnumMap, k), e as String),
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

const _$DependentServiceNameEnumMap = {
  DependentServiceName.awsconfig: 'AWSCONFIG',
  DependentServiceName.awswaf: 'AWSWAF',
  DependentServiceName.awsshieldAdvanced: 'AWSSHIELD_ADVANCED',
  DependentServiceName.awsvpc: 'AWSVPC',
};

PolicyComplianceStatus _$PolicyComplianceStatusFromJson(
    Map<String, dynamic> json) {
  return PolicyComplianceStatus(
    evaluationResults: (json['EvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$DependentServiceNameEnumMap, k), e as String),
    ),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
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

ProtocolsListData _$ProtocolsListDataFromJson(Map<String, dynamic> json) {
  return ProtocolsListData(
    listName: json['ListName'] as String,
    protocolsList:
        (json['ProtocolsList'] as List)?.map((e) => e as String)?.toList(),
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    listId: json['ListId'] as String,
    listUpdateToken: json['ListUpdateToken'] as String,
    previousProtocolsList:
        (json['PreviousProtocolsList'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$ProtocolsListDataToJson(ProtocolsListData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ListName', instance.listName);
  writeNotNull('ProtocolsList', instance.protocolsList);
  writeNotNull(
      'CreateTime', const UnixDateTimeConverter().toJson(instance.createTime));
  writeNotNull('LastUpdateTime',
      const UnixDateTimeConverter().toJson(instance.lastUpdateTime));
  writeNotNull('ListId', instance.listId);
  writeNotNull('ListUpdateToken', instance.listUpdateToken);
  writeNotNull('PreviousProtocolsList', instance.previousProtocolsList);
  return val;
}

ProtocolsListDataSummary _$ProtocolsListDataSummaryFromJson(
    Map<String, dynamic> json) {
  return ProtocolsListDataSummary(
    listArn: json['ListArn'] as String,
    listId: json['ListId'] as String,
    listName: json['ListName'] as String,
    protocolsList:
        (json['ProtocolsList'] as List)?.map((e) => e as String)?.toList(),
  );
}

PutAppsListResponse _$PutAppsListResponseFromJson(Map<String, dynamic> json) {
  return PutAppsListResponse(
    appsList: json['AppsList'] == null
        ? null
        : AppsListData.fromJson(json['AppsList'] as Map<String, dynamic>),
    appsListArn: json['AppsListArn'] as String,
  );
}

PutPolicyResponse _$PutPolicyResponseFromJson(Map<String, dynamic> json) {
  return PutPolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
    policyArn: json['PolicyArn'] as String,
  );
}

PutProtocolsListResponse _$PutProtocolsListResponseFromJson(
    Map<String, dynamic> json) {
  return PutProtocolsListResponse(
    protocolsList: json['ProtocolsList'] == null
        ? null
        : ProtocolsListData.fromJson(
            json['ProtocolsList'] as Map<String, dynamic>),
    protocolsListArn: json['ProtocolsListArn'] as String,
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

ResourceViolation _$ResourceViolationFromJson(Map<String, dynamic> json) {
  return ResourceViolation(
    awsEc2InstanceViolation: json['AwsEc2InstanceViolation'] == null
        ? null
        : AwsEc2InstanceViolation.fromJson(
            json['AwsEc2InstanceViolation'] as Map<String, dynamic>),
    awsEc2NetworkInterfaceViolation: json['AwsEc2NetworkInterfaceViolation'] ==
            null
        ? null
        : AwsEc2NetworkInterfaceViolation.fromJson(
            json['AwsEc2NetworkInterfaceViolation'] as Map<String, dynamic>),
    awsVPCSecurityGroupViolation: json['AwsVPCSecurityGroupViolation'] == null
        ? null
        : AwsVPCSecurityGroupViolation.fromJson(
            json['AwsVPCSecurityGroupViolation'] as Map<String, dynamic>),
    networkFirewallMissingExpectedRTViolation:
        json['NetworkFirewallMissingExpectedRTViolation'] == null
            ? null
            : NetworkFirewallMissingExpectedRTViolation.fromJson(
                json['NetworkFirewallMissingExpectedRTViolation']
                    as Map<String, dynamic>),
    networkFirewallMissingFirewallViolation:
        json['NetworkFirewallMissingFirewallViolation'] == null
            ? null
            : NetworkFirewallMissingFirewallViolation.fromJson(
                json['NetworkFirewallMissingFirewallViolation']
                    as Map<String, dynamic>),
    networkFirewallMissingSubnetViolation:
        json['NetworkFirewallMissingSubnetViolation'] == null
            ? null
            : NetworkFirewallMissingSubnetViolation.fromJson(
                json['NetworkFirewallMissingSubnetViolation']
                    as Map<String, dynamic>),
    networkFirewallPolicyModifiedViolation:
        json['NetworkFirewallPolicyModifiedViolation'] == null
            ? null
            : NetworkFirewallPolicyModifiedViolation.fromJson(
                json['NetworkFirewallPolicyModifiedViolation']
                    as Map<String, dynamic>),
  );
}

SecurityGroupRemediationAction _$SecurityGroupRemediationActionFromJson(
    Map<String, dynamic> json) {
  return SecurityGroupRemediationAction(
    description: json['Description'] as String,
    isDefaultAction: json['IsDefaultAction'] as bool,
    remediationActionType: _$enumDecodeNullable(
        _$RemediationActionTypeEnumMap, json['RemediationActionType']),
    remediationResult: json['RemediationResult'] == null
        ? null
        : SecurityGroupRuleDescription.fromJson(
            json['RemediationResult'] as Map<String, dynamic>),
  );
}

const _$RemediationActionTypeEnumMap = {
  RemediationActionType.remove: 'REMOVE',
  RemediationActionType.modify: 'MODIFY',
};

SecurityGroupRuleDescription _$SecurityGroupRuleDescriptionFromJson(
    Map<String, dynamic> json) {
  return SecurityGroupRuleDescription(
    fromPort: json['FromPort'] as int,
    iPV4Range: json['IPV4Range'] as String,
    iPV6Range: json['IPV6Range'] as String,
    prefixListId: json['PrefixListId'] as String,
    protocol: json['Protocol'] as String,
    toPort: json['ToPort'] as int,
  );
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

StatefulRuleGroup _$StatefulRuleGroupFromJson(Map<String, dynamic> json) {
  return StatefulRuleGroup(
    resourceId: json['ResourceId'] as String,
    ruleGroupName: json['RuleGroupName'] as String,
  );
}

StatelessRuleGroup _$StatelessRuleGroupFromJson(Map<String, dynamic> json) {
  return StatelessRuleGroup(
    priority: json['Priority'] as int,
    resourceId: json['ResourceId'] as String,
    ruleGroupName: json['RuleGroupName'] as String,
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

ViolationDetail _$ViolationDetailFromJson(Map<String, dynamic> json) {
  return ViolationDetail(
    memberAccount: json['MemberAccount'] as String,
    policyId: json['PolicyId'] as String,
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    resourceViolations: (json['ResourceViolations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceViolation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceDescription: json['ResourceDescription'] as String,
    resourceTags: (json['ResourceTags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
