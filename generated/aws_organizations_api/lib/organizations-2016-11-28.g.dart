// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations-2016-11-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AcceptHandshakeRequestToJson(
    AcceptHandshakeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HandshakeId', instance.handshakeId);
  return val;
}

AcceptHandshakeResponse _$AcceptHandshakeResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptHandshakeResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    arn: json['Arn'] as String,
    email: json['Email'] as String,
    id: json['Id'] as String,
    joinedMethod: _$enumDecodeNullable(
        _$AccountJoinedMethodEnumMap, json['JoinedMethod']),
    joinedTimestamp: unixTimestampFromJson(json['JoinedTimestamp']),
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$AccountStatusEnumMap, json['Status']),
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

const _$AccountJoinedMethodEnumMap = {
  AccountJoinedMethod.invited: 'INVITED',
  AccountJoinedMethod.created: 'CREATED',
};

const _$AccountStatusEnumMap = {
  AccountStatus.active: 'ACTIVE',
  AccountStatus.suspended: 'SUSPENDED',
};

Map<String, dynamic> _$AttachPolicyRequestToJson(AttachPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('TargetId', instance.targetId);
  return val;
}

Map<String, dynamic> _$CancelHandshakeRequestToJson(
    CancelHandshakeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HandshakeId', instance.handshakeId);
  return val;
}

CancelHandshakeResponse _$CancelHandshakeResponseFromJson(
    Map<String, dynamic> json) {
  return CancelHandshakeResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

Child _$ChildFromJson(Map<String, dynamic> json) {
  return Child(
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$ChildTypeEnumMap, json['Type']),
  );
}

const _$ChildTypeEnumMap = {
  ChildType.account: 'ACCOUNT',
  ChildType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
};

Map<String, dynamic> _$CreateAccountRequestToJson(
    CreateAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountName', instance.accountName);
  writeNotNull('Email', instance.email);
  writeNotNull('IamUserAccessToBilling',
      _$IAMUserAccessToBillingEnumMap[instance.iamUserAccessToBilling]);
  writeNotNull('RoleName', instance.roleName);
  return val;
}

const _$IAMUserAccessToBillingEnumMap = {
  IAMUserAccessToBilling.allow: 'ALLOW',
  IAMUserAccessToBilling.deny: 'DENY',
};

CreateAccountResponse _$CreateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccountResponse(
    createAccountStatus: json['CreateAccountStatus'] == null
        ? null
        : CreateAccountStatus.fromJson(
            json['CreateAccountStatus'] as Map<String, dynamic>),
  );
}

CreateAccountStatus _$CreateAccountStatusFromJson(Map<String, dynamic> json) {
  return CreateAccountStatus(
    accountId: json['AccountId'] as String,
    accountName: json['AccountName'] as String,
    completedTimestamp: unixTimestampFromJson(json['CompletedTimestamp']),
    failureReason: _$enumDecodeNullable(
        _$CreateAccountFailureReasonEnumMap, json['FailureReason']),
    govCloudAccountId: json['GovCloudAccountId'] as String,
    id: json['Id'] as String,
    requestedTimestamp: unixTimestampFromJson(json['RequestedTimestamp']),
    state: _$enumDecodeNullable(_$CreateAccountStateEnumMap, json['State']),
  );
}

const _$CreateAccountFailureReasonEnumMap = {
  CreateAccountFailureReason.accountLimitExceeded: 'ACCOUNT_LIMIT_EXCEEDED',
  CreateAccountFailureReason.emailAlreadyExists: 'EMAIL_ALREADY_EXISTS',
  CreateAccountFailureReason.invalidAddress: 'INVALID_ADDRESS',
  CreateAccountFailureReason.invalidEmail: 'INVALID_EMAIL',
  CreateAccountFailureReason.concurrentAccountModification:
      'CONCURRENT_ACCOUNT_MODIFICATION',
  CreateAccountFailureReason.internalFailure: 'INTERNAL_FAILURE',
  CreateAccountFailureReason.govcloudAccountAlreadyExists:
      'GOVCLOUD_ACCOUNT_ALREADY_EXISTS',
};

const _$CreateAccountStateEnumMap = {
  CreateAccountState.inProgress: 'IN_PROGRESS',
  CreateAccountState.succeeded: 'SUCCEEDED',
  CreateAccountState.failed: 'FAILED',
};

Map<String, dynamic> _$CreateGovCloudAccountRequestToJson(
    CreateGovCloudAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountName', instance.accountName);
  writeNotNull('Email', instance.email);
  writeNotNull('IamUserAccessToBilling',
      _$IAMUserAccessToBillingEnumMap[instance.iamUserAccessToBilling]);
  writeNotNull('RoleName', instance.roleName);
  return val;
}

CreateGovCloudAccountResponse _$CreateGovCloudAccountResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGovCloudAccountResponse(
    createAccountStatus: json['CreateAccountStatus'] == null
        ? null
        : CreateAccountStatus.fromJson(
            json['CreateAccountStatus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateOrganizationRequestToJson(
    CreateOrganizationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FeatureSet', _$OrganizationFeatureSetEnumMap[instance.featureSet]);
  return val;
}

const _$OrganizationFeatureSetEnumMap = {
  OrganizationFeatureSet.all: 'ALL',
  OrganizationFeatureSet.consolidatedBilling: 'CONSOLIDATED_BILLING',
};

CreateOrganizationResponse _$CreateOrganizationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateOrganizationResponse(
    organization: json['Organization'] == null
        ? null
        : Organization.fromJson(json['Organization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateOrganizationalUnitRequestToJson(
    CreateOrganizationalUnitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('ParentId', instance.parentId);
  return val;
}

CreateOrganizationalUnitResponse _$CreateOrganizationalUnitResponseFromJson(
    Map<String, dynamic> json) {
  return CreateOrganizationalUnitResponse(
    organizationalUnit: json['OrganizationalUnit'] == null
        ? null
        : OrganizationalUnit.fromJson(
            json['OrganizationalUnit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreatePolicyRequestToJson(CreatePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$PolicyTypeEnumMap[instance.type]);
  return val;
}

const _$PolicyTypeEnumMap = {
  PolicyType.serviceControlPolicy: 'SERVICE_CONTROL_POLICY',
  PolicyType.tagPolicy: 'TAG_POLICY',
};

CreatePolicyResponse _$CreatePolicyResponseFromJson(Map<String, dynamic> json) {
  return CreatePolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeclineHandshakeRequestToJson(
    DeclineHandshakeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HandshakeId', instance.handshakeId);
  return val;
}

DeclineHandshakeResponse _$DeclineHandshakeResponseFromJson(
    Map<String, dynamic> json) {
  return DeclineHandshakeResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

DelegatedAdministrator _$DelegatedAdministratorFromJson(
    Map<String, dynamic> json) {
  return DelegatedAdministrator(
    arn: json['Arn'] as String,
    delegationEnabledDate: unixTimestampFromJson(json['DelegationEnabledDate']),
    email: json['Email'] as String,
    id: json['Id'] as String,
    joinedMethod: _$enumDecodeNullable(
        _$AccountJoinedMethodEnumMap, json['JoinedMethod']),
    joinedTimestamp: unixTimestampFromJson(json['JoinedTimestamp']),
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$AccountStatusEnumMap, json['Status']),
  );
}

DelegatedService _$DelegatedServiceFromJson(Map<String, dynamic> json) {
  return DelegatedService(
    delegationEnabledDate: unixTimestampFromJson(json['DelegationEnabledDate']),
    servicePrincipal: json['ServicePrincipal'] as String,
  );
}

Map<String, dynamic> _$DeleteOrganizationalUnitRequestToJson(
    DeleteOrganizationalUnitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationalUnitId', instance.organizationalUnitId);
  return val;
}

Map<String, dynamic> _$DeletePolicyRequestToJson(DeletePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  return val;
}

Map<String, dynamic> _$DeregisterDelegatedAdministratorRequestToJson(
    DeregisterDelegatedAdministratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('ServicePrincipal', instance.servicePrincipal);
  return val;
}

Map<String, dynamic> _$DescribeAccountRequestToJson(
    DescribeAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  return val;
}

DescribeAccountResponse _$DescribeAccountResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeCreateAccountStatusRequestToJson(
    DescribeCreateAccountStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreateAccountRequestId', instance.createAccountRequestId);
  return val;
}

DescribeCreateAccountStatusResponse
    _$DescribeCreateAccountStatusResponseFromJson(Map<String, dynamic> json) {
  return DescribeCreateAccountStatusResponse(
    createAccountStatus: json['CreateAccountStatus'] == null
        ? null
        : CreateAccountStatus.fromJson(
            json['CreateAccountStatus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeEffectivePolicyRequestToJson(
    DescribeEffectivePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyType', _$EffectivePolicyTypeEnumMap[instance.policyType]);
  writeNotNull('TargetId', instance.targetId);
  return val;
}

const _$EffectivePolicyTypeEnumMap = {
  EffectivePolicyType.tagPolicy: 'TAG_POLICY',
};

DescribeEffectivePolicyResponse _$DescribeEffectivePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEffectivePolicyResponse(
    effectivePolicy: json['EffectivePolicy'] == null
        ? null
        : EffectivePolicy.fromJson(
            json['EffectivePolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeHandshakeRequestToJson(
    DescribeHandshakeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HandshakeId', instance.handshakeId);
  return val;
}

DescribeHandshakeResponse _$DescribeHandshakeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeHandshakeResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

DescribeOrganizationResponse _$DescribeOrganizationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOrganizationResponse(
    organization: json['Organization'] == null
        ? null
        : Organization.fromJson(json['Organization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeOrganizationalUnitRequestToJson(
    DescribeOrganizationalUnitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationalUnitId', instance.organizationalUnitId);
  return val;
}

DescribeOrganizationalUnitResponse _$DescribeOrganizationalUnitResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOrganizationalUnitResponse(
    organizationalUnit: json['OrganizationalUnit'] == null
        ? null
        : OrganizationalUnit.fromJson(
            json['OrganizationalUnit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribePolicyRequestToJson(
    DescribePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  return val;
}

DescribePolicyResponse _$DescribePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetachPolicyRequestToJson(DetachPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('TargetId', instance.targetId);
  return val;
}

Map<String, dynamic> _$DisableAWSServiceAccessRequestToJson(
    DisableAWSServiceAccessRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServicePrincipal', instance.servicePrincipal);
  return val;
}

Map<String, dynamic> _$DisablePolicyTypeRequestToJson(
    DisablePolicyTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyType', _$PolicyTypeEnumMap[instance.policyType]);
  writeNotNull('RootId', instance.rootId);
  return val;
}

DisablePolicyTypeResponse _$DisablePolicyTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DisablePolicyTypeResponse(
    root: json['Root'] == null
        ? null
        : Root.fromJson(json['Root'] as Map<String, dynamic>),
  );
}

EffectivePolicy _$EffectivePolicyFromJson(Map<String, dynamic> json) {
  return EffectivePolicy(
    lastUpdatedTimestamp: unixTimestampFromJson(json['LastUpdatedTimestamp']),
    policyContent: json['PolicyContent'] as String,
    policyType:
        _$enumDecodeNullable(_$EffectivePolicyTypeEnumMap, json['PolicyType']),
    targetId: json['TargetId'] as String,
  );
}

Map<String, dynamic> _$EnableAWSServiceAccessRequestToJson(
    EnableAWSServiceAccessRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServicePrincipal', instance.servicePrincipal);
  return val;
}

EnableAllFeaturesResponse _$EnableAllFeaturesResponseFromJson(
    Map<String, dynamic> json) {
  return EnableAllFeaturesResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnablePolicyTypeRequestToJson(
    EnablePolicyTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyType', _$PolicyTypeEnumMap[instance.policyType]);
  writeNotNull('RootId', instance.rootId);
  return val;
}

EnablePolicyTypeResponse _$EnablePolicyTypeResponseFromJson(
    Map<String, dynamic> json) {
  return EnablePolicyTypeResponse(
    root: json['Root'] == null
        ? null
        : Root.fromJson(json['Root'] as Map<String, dynamic>),
  );
}

EnabledServicePrincipal _$EnabledServicePrincipalFromJson(
    Map<String, dynamic> json) {
  return EnabledServicePrincipal(
    dateEnabled: unixTimestampFromJson(json['DateEnabled']),
    servicePrincipal: json['ServicePrincipal'] as String,
  );
}

Handshake _$HandshakeFromJson(Map<String, dynamic> json) {
  return Handshake(
    action: _$enumDecodeNullable(_$ActionTypeEnumMap, json['Action']),
    arn: json['Arn'] as String,
    expirationTimestamp: unixTimestampFromJson(json['ExpirationTimestamp']),
    id: json['Id'] as String,
    parties: (json['Parties'] as List)
        ?.map((e) => e == null
            ? null
            : HandshakeParty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestedTimestamp: unixTimestampFromJson(json['RequestedTimestamp']),
    resources: (json['Resources'] as List)
        ?.map((e) => e == null
            ? null
            : HandshakeResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$HandshakeStateEnumMap, json['State']),
  );
}

const _$ActionTypeEnumMap = {
  ActionType.invite: 'INVITE',
  ActionType.enableAllFeatures: 'ENABLE_ALL_FEATURES',
  ActionType.approveAllFeatures: 'APPROVE_ALL_FEATURES',
  ActionType.addOrganizationsServiceLinkedRole:
      'ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE',
};

const _$HandshakeStateEnumMap = {
  HandshakeState.requested: 'REQUESTED',
  HandshakeState.open: 'OPEN',
  HandshakeState.canceled: 'CANCELED',
  HandshakeState.accepted: 'ACCEPTED',
  HandshakeState.declined: 'DECLINED',
  HandshakeState.expired: 'EXPIRED',
};

Map<String, dynamic> _$HandshakeFilterToJson(HandshakeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActionType', _$ActionTypeEnumMap[instance.actionType]);
  writeNotNull('ParentHandshakeId', instance.parentHandshakeId);
  return val;
}

HandshakeParty _$HandshakePartyFromJson(Map<String, dynamic> json) {
  return HandshakeParty(
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$HandshakePartyTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$HandshakePartyToJson(HandshakeParty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', _$HandshakePartyTypeEnumMap[instance.type]);
  return val;
}

const _$HandshakePartyTypeEnumMap = {
  HandshakePartyType.account: 'ACCOUNT',
  HandshakePartyType.organization: 'ORGANIZATION',
  HandshakePartyType.email: 'EMAIL',
};

HandshakeResource _$HandshakeResourceFromJson(Map<String, dynamic> json) {
  return HandshakeResource(
    resources: (json['Resources'] as List)
        ?.map((e) => e == null
            ? null
            : HandshakeResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$HandshakeResourceTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

const _$HandshakeResourceTypeEnumMap = {
  HandshakeResourceType.account: 'ACCOUNT',
  HandshakeResourceType.organization: 'ORGANIZATION',
  HandshakeResourceType.organizationFeatureSet: 'ORGANIZATION_FEATURE_SET',
  HandshakeResourceType.email: 'EMAIL',
  HandshakeResourceType.masterEmail: 'MASTER_EMAIL',
  HandshakeResourceType.masterName: 'MASTER_NAME',
  HandshakeResourceType.notes: 'NOTES',
  HandshakeResourceType.parentHandshake: 'PARENT_HANDSHAKE',
};

Map<String, dynamic> _$InviteAccountToOrganizationRequestToJson(
    InviteAccountToOrganizationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Target', instance.target?.toJson());
  writeNotNull('Notes', instance.notes);
  return val;
}

InviteAccountToOrganizationResponse
    _$InviteAccountToOrganizationResponseFromJson(Map<String, dynamic> json) {
  return InviteAccountToOrganizationResponse(
    handshake: json['Handshake'] == null
        ? null
        : Handshake.fromJson(json['Handshake'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListAWSServiceAccessForOrganizationRequestToJson(
    ListAWSServiceAccessForOrganizationRequest instance) {
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

ListAWSServiceAccessForOrganizationResponse
    _$ListAWSServiceAccessForOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return ListAWSServiceAccessForOrganizationResponse(
    enabledServicePrincipals: (json['EnabledServicePrincipals'] as List)
        ?.map((e) => e == null
            ? null
            : EnabledServicePrincipal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListAccountsForParentRequestToJson(
    ListAccountsForParentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParentId', instance.parentId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListAccountsForParentResponse _$ListAccountsForParentResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccountsForParentResponse(
    accounts: (json['Accounts'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListAccountsRequestToJson(ListAccountsRequest instance) {
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

ListAccountsResponse _$ListAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListAccountsResponse(
    accounts: (json['Accounts'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListChildrenRequestToJson(ListChildrenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChildType', _$ChildTypeEnumMap[instance.childType]);
  writeNotNull('ParentId', instance.parentId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListChildrenResponse _$ListChildrenResponseFromJson(Map<String, dynamic> json) {
  return ListChildrenResponse(
    children: (json['Children'] as List)
        ?.map(
            (e) => e == null ? null : Child.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListCreateAccountStatusRequestToJson(
    ListCreateAccountStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('States', instance.states);
  return val;
}

ListCreateAccountStatusResponse _$ListCreateAccountStatusResponseFromJson(
    Map<String, dynamic> json) {
  return ListCreateAccountStatusResponse(
    createAccountStatuses: (json['CreateAccountStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : CreateAccountStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListDelegatedAdministratorsRequestToJson(
    ListDelegatedAdministratorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ServicePrincipal', instance.servicePrincipal);
  return val;
}

ListDelegatedAdministratorsResponse
    _$ListDelegatedAdministratorsResponseFromJson(Map<String, dynamic> json) {
  return ListDelegatedAdministratorsResponse(
    delegatedAdministrators: (json['DelegatedAdministrators'] as List)
        ?.map((e) => e == null
            ? null
            : DelegatedAdministrator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListDelegatedServicesForAccountRequestToJson(
    ListDelegatedServicesForAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListDelegatedServicesForAccountResponse
    _$ListDelegatedServicesForAccountResponseFromJson(
        Map<String, dynamic> json) {
  return ListDelegatedServicesForAccountResponse(
    delegatedServices: (json['DelegatedServices'] as List)
        ?.map((e) => e == null
            ? null
            : DelegatedService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListHandshakesForAccountRequestToJson(
    ListHandshakesForAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filter', instance.filter?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHandshakesForAccountResponse _$ListHandshakesForAccountResponseFromJson(
    Map<String, dynamic> json) {
  return ListHandshakesForAccountResponse(
    handshakes: (json['Handshakes'] as List)
        ?.map((e) =>
            e == null ? null : Handshake.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListHandshakesForOrganizationRequestToJson(
    ListHandshakesForOrganizationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filter', instance.filter?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHandshakesForOrganizationResponse
    _$ListHandshakesForOrganizationResponseFromJson(Map<String, dynamic> json) {
  return ListHandshakesForOrganizationResponse(
    handshakes: (json['Handshakes'] as List)
        ?.map((e) =>
            e == null ? null : Handshake.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListOrganizationalUnitsForParentRequestToJson(
    ListOrganizationalUnitsForParentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParentId', instance.parentId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListOrganizationalUnitsForParentResponse
    _$ListOrganizationalUnitsForParentResponseFromJson(
        Map<String, dynamic> json) {
  return ListOrganizationalUnitsForParentResponse(
    nextToken: json['NextToken'] as String,
    organizationalUnits: (json['OrganizationalUnits'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationalUnit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListParentsRequestToJson(ListParentsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChildId', instance.childId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListParentsResponse _$ListParentsResponseFromJson(Map<String, dynamic> json) {
  return ListParentsResponse(
    nextToken: json['NextToken'] as String,
    parents: (json['Parents'] as List)
        ?.map((e) =>
            e == null ? null : Parent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPoliciesForTargetRequestToJson(
    ListPoliciesForTargetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filter', _$PolicyTypeEnumMap[instance.filter]);
  writeNotNull('TargetId', instance.targetId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListPoliciesForTargetResponse _$ListPoliciesForTargetResponseFromJson(
    Map<String, dynamic> json) {
  return ListPoliciesForTargetResponse(
    nextToken: json['NextToken'] as String,
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : PolicySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPoliciesRequestToJson(ListPoliciesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filter', _$PolicyTypeEnumMap[instance.filter]);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListPoliciesResponse _$ListPoliciesResponseFromJson(Map<String, dynamic> json) {
  return ListPoliciesResponse(
    nextToken: json['NextToken'] as String,
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : PolicySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListRootsRequestToJson(ListRootsRequest instance) {
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

ListRootsResponse _$ListRootsResponseFromJson(Map<String, dynamic> json) {
  return ListRootsResponse(
    nextToken: json['NextToken'] as String,
    roots: (json['Roots'] as List)
        ?.map(
            (e) => e == null ? null : Root.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListTargetsForPolicyRequestToJson(
    ListTargetsForPolicyRequest instance) {
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

ListTargetsForPolicyResponse _$ListTargetsForPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return ListTargetsForPolicyResponse(
    nextToken: json['NextToken'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyTargetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MoveAccountRequestToJson(MoveAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('DestinationParentId', instance.destinationParentId);
  writeNotNull('SourceParentId', instance.sourceParentId);
  return val;
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    arn: json['Arn'] as String,
    availablePolicyTypes: (json['AvailablePolicyTypes'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyTypeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    featureSet: _$enumDecodeNullable(
        _$OrganizationFeatureSetEnumMap, json['FeatureSet']),
    id: json['Id'] as String,
    masterAccountArn: json['MasterAccountArn'] as String,
    masterAccountEmail: json['MasterAccountEmail'] as String,
    masterAccountId: json['MasterAccountId'] as String,
  );
}

OrganizationalUnit _$OrganizationalUnitFromJson(Map<String, dynamic> json) {
  return OrganizationalUnit(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$ParentTypeEnumMap, json['Type']),
  );
}

const _$ParentTypeEnumMap = {
  ParentType.root: 'ROOT',
  ParentType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
};

Policy _$PolicyFromJson(Map<String, dynamic> json) {
  return Policy(
    content: json['Content'] as String,
    policySummary: json['PolicySummary'] == null
        ? null
        : PolicySummary.fromJson(json['PolicySummary'] as Map<String, dynamic>),
  );
}

PolicySummary _$PolicySummaryFromJson(Map<String, dynamic> json) {
  return PolicySummary(
    arn: json['Arn'] as String,
    awsManaged: json['AwsManaged'] as bool,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$PolicyTypeEnumMap, json['Type']),
  );
}

PolicyTargetSummary _$PolicyTargetSummaryFromJson(Map<String, dynamic> json) {
  return PolicyTargetSummary(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
    targetId: json['TargetId'] as String,
    type: _$enumDecodeNullable(_$TargetTypeEnumMap, json['Type']),
  );
}

const _$TargetTypeEnumMap = {
  TargetType.account: 'ACCOUNT',
  TargetType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
  TargetType.root: 'ROOT',
};

PolicyTypeSummary _$PolicyTypeSummaryFromJson(Map<String, dynamic> json) {
  return PolicyTypeSummary(
    status: _$enumDecodeNullable(_$PolicyTypeStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$PolicyTypeEnumMap, json['Type']),
  );
}

const _$PolicyTypeStatusEnumMap = {
  PolicyTypeStatus.enabled: 'ENABLED',
  PolicyTypeStatus.pendingEnable: 'PENDING_ENABLE',
  PolicyTypeStatus.pendingDisable: 'PENDING_DISABLE',
};

Map<String, dynamic> _$RegisterDelegatedAdministratorRequestToJson(
    RegisterDelegatedAdministratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('ServicePrincipal', instance.servicePrincipal);
  return val;
}

Map<String, dynamic> _$RemoveAccountFromOrganizationRequestToJson(
    RemoveAccountFromOrganizationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  return val;
}

Root _$RootFromJson(Map<String, dynamic> json) {
  return Root(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    policyTypes: (json['PolicyTypes'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyTypeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
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

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
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

Map<String, dynamic> _$UpdateOrganizationalUnitRequestToJson(
    UpdateOrganizationalUnitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationalUnitId', instance.organizationalUnitId);
  writeNotNull('Name', instance.name);
  return val;
}

UpdateOrganizationalUnitResponse _$UpdateOrganizationalUnitResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateOrganizationalUnitResponse(
    organizationalUnit: json['OrganizationalUnit'] == null
        ? null
        : OrganizationalUnit.fromJson(
            json['OrganizationalUnit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdatePolicyRequestToJson(UpdatePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('Content', instance.content);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  return val;
}

UpdatePolicyResponse _$UpdatePolicyResponseFromJson(Map<String, dynamic> json) {
  return UpdatePolicyResponse(
    policy: json['Policy'] == null
        ? null
        : Policy.fromJson(json['Policy'] as Map<String, dynamic>),
  );
}
