// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-07-20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessControlAttribute _$AccessControlAttributeFromJson(
    Map<String, dynamic> json) {
  return AccessControlAttribute(
    key: json['Key'] as String,
    value: json['Value'] == null
        ? null
        : AccessControlAttributeValue.fromJson(
            json['Value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccessControlAttributeToJson(
    AccessControlAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

AccessControlAttributeValue _$AccessControlAttributeValueFromJson(
    Map<String, dynamic> json) {
  return AccessControlAttributeValue(
    source: (json['Source'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AccessControlAttributeValueToJson(
    AccessControlAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Source', instance.source);
  return val;
}

AccountAssignment _$AccountAssignmentFromJson(Map<String, dynamic> json) {
  return AccountAssignment(
    accountId: json['AccountId'] as String,
    permissionSetArn: json['PermissionSetArn'] as String,
    principalId: json['PrincipalId'] as String,
    principalType:
        _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['PrincipalType']),
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

const _$PrincipalTypeEnumMap = {
  PrincipalType.user: 'USER',
  PrincipalType.group: 'GROUP',
};

AccountAssignmentOperationStatus _$AccountAssignmentOperationStatusFromJson(
    Map<String, dynamic> json) {
  return AccountAssignmentOperationStatus(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    failureReason: json['FailureReason'] as String,
    permissionSetArn: json['PermissionSetArn'] as String,
    principalId: json['PrincipalId'] as String,
    principalType:
        _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['PrincipalType']),
    requestId: json['RequestId'] as String,
    status: _$enumDecodeNullable(_$StatusValuesEnumMap, json['Status']),
    targetId: json['TargetId'] as String,
    targetType: _$enumDecodeNullable(_$TargetTypeEnumMap, json['TargetType']),
  );
}

const _$StatusValuesEnumMap = {
  StatusValues.inProgress: 'IN_PROGRESS',
  StatusValues.failed: 'FAILED',
  StatusValues.succeeded: 'SUCCEEDED',
};

const _$TargetTypeEnumMap = {
  TargetType.awsAccount: 'AWS_ACCOUNT',
};

AccountAssignmentOperationStatusMetadata
    _$AccountAssignmentOperationStatusMetadataFromJson(
        Map<String, dynamic> json) {
  return AccountAssignmentOperationStatusMetadata(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    requestId: json['RequestId'] as String,
    status: _$enumDecodeNullable(_$StatusValuesEnumMap, json['Status']),
  );
}

AttachManagedPolicyToPermissionSetResponse
    _$AttachManagedPolicyToPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return AttachManagedPolicyToPermissionSetResponse();
}

AttachedManagedPolicy _$AttachedManagedPolicyFromJson(
    Map<String, dynamic> json) {
  return AttachedManagedPolicy(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

CreateAccountAssignmentResponse _$CreateAccountAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccountAssignmentResponse(
    accountAssignmentCreationStatus: json['AccountAssignmentCreationStatus'] ==
            null
        ? null
        : AccountAssignmentOperationStatus.fromJson(
            json['AccountAssignmentCreationStatus'] as Map<String, dynamic>),
  );
}

CreateInstanceAccessControlAttributeConfigurationResponse
    _$CreateInstanceAccessControlAttributeConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return CreateInstanceAccessControlAttributeConfigurationResponse();
}

CreatePermissionSetResponse _$CreatePermissionSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePermissionSetResponse(
    permissionSet: json['PermissionSet'] == null
        ? null
        : PermissionSet.fromJson(json['PermissionSet'] as Map<String, dynamic>),
  );
}

DeleteAccountAssignmentResponse _$DeleteAccountAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccountAssignmentResponse(
    accountAssignmentDeletionStatus: json['AccountAssignmentDeletionStatus'] ==
            null
        ? null
        : AccountAssignmentOperationStatus.fromJson(
            json['AccountAssignmentDeletionStatus'] as Map<String, dynamic>),
  );
}

DeleteInlinePolicyFromPermissionSetResponse
    _$DeleteInlinePolicyFromPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteInlinePolicyFromPermissionSetResponse();
}

DeleteInstanceAccessControlAttributeConfigurationResponse
    _$DeleteInstanceAccessControlAttributeConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteInstanceAccessControlAttributeConfigurationResponse();
}

DeletePermissionSetResponse _$DeletePermissionSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePermissionSetResponse();
}

DescribeAccountAssignmentCreationStatusResponse
    _$DescribeAccountAssignmentCreationStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAccountAssignmentCreationStatusResponse(
    accountAssignmentCreationStatus: json['AccountAssignmentCreationStatus'] ==
            null
        ? null
        : AccountAssignmentOperationStatus.fromJson(
            json['AccountAssignmentCreationStatus'] as Map<String, dynamic>),
  );
}

DescribeAccountAssignmentDeletionStatusResponse
    _$DescribeAccountAssignmentDeletionStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAccountAssignmentDeletionStatusResponse(
    accountAssignmentDeletionStatus: json['AccountAssignmentDeletionStatus'] ==
            null
        ? null
        : AccountAssignmentOperationStatus.fromJson(
            json['AccountAssignmentDeletionStatus'] as Map<String, dynamic>),
  );
}

DescribeInstanceAccessControlAttributeConfigurationResponse
    _$DescribeInstanceAccessControlAttributeConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeInstanceAccessControlAttributeConfigurationResponse(
    instanceAccessControlAttributeConfiguration:
        json['InstanceAccessControlAttributeConfiguration'] == null
            ? null
            : InstanceAccessControlAttributeConfiguration.fromJson(
                json['InstanceAccessControlAttributeConfiguration']
                    as Map<String, dynamic>),
    status: _$enumDecodeNullable(
        _$InstanceAccessControlAttributeConfigurationStatusEnumMap,
        json['Status']),
    statusReason: json['StatusReason'] as String,
  );
}

const _$InstanceAccessControlAttributeConfigurationStatusEnumMap = {
  InstanceAccessControlAttributeConfigurationStatus.enabled: 'ENABLED',
  InstanceAccessControlAttributeConfigurationStatus.creationInProgress:
      'CREATION_IN_PROGRESS',
  InstanceAccessControlAttributeConfigurationStatus.creationFailed:
      'CREATION_FAILED',
};

DescribePermissionSetProvisioningStatusResponse
    _$DescribePermissionSetProvisioningStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePermissionSetProvisioningStatusResponse(
    permissionSetProvisioningStatus: json['PermissionSetProvisioningStatus'] ==
            null
        ? null
        : PermissionSetProvisioningStatus.fromJson(
            json['PermissionSetProvisioningStatus'] as Map<String, dynamic>),
  );
}

DescribePermissionSetResponse _$DescribePermissionSetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePermissionSetResponse(
    permissionSet: json['PermissionSet'] == null
        ? null
        : PermissionSet.fromJson(json['PermissionSet'] as Map<String, dynamic>),
  );
}

DetachManagedPolicyFromPermissionSetResponse
    _$DetachManagedPolicyFromPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return DetachManagedPolicyFromPermissionSetResponse();
}

GetInlinePolicyForPermissionSetResponse
    _$GetInlinePolicyForPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return GetInlinePolicyForPermissionSetResponse(
    inlinePolicy: json['InlinePolicy'] as String,
  );
}

InstanceAccessControlAttributeConfiguration
    _$InstanceAccessControlAttributeConfigurationFromJson(
        Map<String, dynamic> json) {
  return InstanceAccessControlAttributeConfiguration(
    accessControlAttributes: (json['AccessControlAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AccessControlAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InstanceAccessControlAttributeConfigurationToJson(
    InstanceAccessControlAttributeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessControlAttributes',
      instance.accessControlAttributes?.map((e) => e?.toJson())?.toList());
  return val;
}

InstanceMetadata _$InstanceMetadataFromJson(Map<String, dynamic> json) {
  return InstanceMetadata(
    identityStoreId: json['IdentityStoreId'] as String,
    instanceArn: json['InstanceArn'] as String,
  );
}

ListAccountAssignmentCreationStatusResponse
    _$ListAccountAssignmentCreationStatusResponseFromJson(
        Map<String, dynamic> json) {
  return ListAccountAssignmentCreationStatusResponse(
    accountAssignmentsCreationStatus:
        (json['AccountAssignmentsCreationStatus'] as List)
            ?.map((e) => e == null
                ? null
                : AccountAssignmentOperationStatusMetadata.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAccountAssignmentDeletionStatusResponse
    _$ListAccountAssignmentDeletionStatusResponseFromJson(
        Map<String, dynamic> json) {
  return ListAccountAssignmentDeletionStatusResponse(
    accountAssignmentsDeletionStatus:
        (json['AccountAssignmentsDeletionStatus'] as List)
            ?.map((e) => e == null
                ? null
                : AccountAssignmentOperationStatusMetadata.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAccountAssignmentsResponse _$ListAccountAssignmentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccountAssignmentsResponse(
    accountAssignments: (json['AccountAssignments'] as List)
        ?.map((e) => e == null
            ? null
            : AccountAssignment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAccountsForProvisionedPermissionSetResponse
    _$ListAccountsForProvisionedPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return ListAccountsForProvisionedPermissionSetResponse(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListInstancesResponse _$ListInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstancesResponse(
    instances: (json['Instances'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListManagedPoliciesInPermissionSetResponse
    _$ListManagedPoliciesInPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return ListManagedPoliciesInPermissionSetResponse(
    attachedManagedPolicies: (json['AttachedManagedPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPermissionSetProvisioningStatusResponse
    _$ListPermissionSetProvisioningStatusResponseFromJson(
        Map<String, dynamic> json) {
  return ListPermissionSetProvisioningStatusResponse(
    nextToken: json['NextToken'] as String,
    permissionSetsProvisioningStatus:
        (json['PermissionSetsProvisioningStatus'] as List)
            ?.map((e) => e == null
                ? null
                : PermissionSetProvisioningStatusMetadata.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListPermissionSetsProvisionedToAccountResponse
    _$ListPermissionSetsProvisionedToAccountResponseFromJson(
        Map<String, dynamic> json) {
  return ListPermissionSetsProvisionedToAccountResponse(
    nextToken: json['NextToken'] as String,
    permissionSets:
        (json['PermissionSets'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListPermissionSetsResponse _$ListPermissionSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPermissionSetsResponse(
    nextToken: json['NextToken'] as String,
    permissionSets:
        (json['PermissionSets'] as List)?.map((e) => e as String)?.toList(),
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

Map<String, dynamic> _$OperationStatusFilterToJson(
    OperationStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$StatusValuesEnumMap[instance.status]);
  return val;
}

PermissionSet _$PermissionSetFromJson(Map<String, dynamic> json) {
  return PermissionSet(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    description: json['Description'] as String,
    name: json['Name'] as String,
    permissionSetArn: json['PermissionSetArn'] as String,
    relayState: json['RelayState'] as String,
    sessionDuration: json['SessionDuration'] as String,
  );
}

PermissionSetProvisioningStatus _$PermissionSetProvisioningStatusFromJson(
    Map<String, dynamic> json) {
  return PermissionSetProvisioningStatus(
    accountId: json['AccountId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    failureReason: json['FailureReason'] as String,
    permissionSetArn: json['PermissionSetArn'] as String,
    requestId: json['RequestId'] as String,
    status: _$enumDecodeNullable(_$StatusValuesEnumMap, json['Status']),
  );
}

PermissionSetProvisioningStatusMetadata
    _$PermissionSetProvisioningStatusMetadataFromJson(
        Map<String, dynamic> json) {
  return PermissionSetProvisioningStatusMetadata(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    requestId: json['RequestId'] as String,
    status: _$enumDecodeNullable(_$StatusValuesEnumMap, json['Status']),
  );
}

ProvisionPermissionSetResponse _$ProvisionPermissionSetResponseFromJson(
    Map<String, dynamic> json) {
  return ProvisionPermissionSetResponse(
    permissionSetProvisioningStatus: json['PermissionSetProvisioningStatus'] ==
            null
        ? null
        : PermissionSetProvisioningStatus.fromJson(
            json['PermissionSetProvisioningStatus'] as Map<String, dynamic>),
  );
}

PutInlinePolicyToPermissionSetResponse
    _$PutInlinePolicyToPermissionSetResponseFromJson(
        Map<String, dynamic> json) {
  return PutInlinePolicyToPermissionSetResponse();
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

UpdateInstanceAccessControlAttributeConfigurationResponse
    _$UpdateInstanceAccessControlAttributeConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateInstanceAccessControlAttributeConfigurationResponse();
}

UpdatePermissionSetResponse _$UpdatePermissionSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePermissionSetResponse();
}
