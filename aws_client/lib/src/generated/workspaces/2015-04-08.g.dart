// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-04-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModification _$AccountModificationFromJson(Map<String, dynamic> json) {
  return AccountModification(
    dedicatedTenancyManagementCidrRange:
        json['DedicatedTenancyManagementCidrRange'] as String,
    dedicatedTenancySupport: _$enumDecodeNullable(
        _$DedicatedTenancySupportResultEnumEnumMap,
        json['DedicatedTenancySupport']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    modificationState: _$enumDecodeNullable(
        _$DedicatedTenancyModificationStateEnumEnumMap,
        json['ModificationState']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
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

const _$DedicatedTenancySupportResultEnumEnumMap = {
  DedicatedTenancySupportResultEnum.enabled: 'ENABLED',
  DedicatedTenancySupportResultEnum.disabled: 'DISABLED',
};

const _$DedicatedTenancyModificationStateEnumEnumMap = {
  DedicatedTenancyModificationStateEnum.pending: 'PENDING',
  DedicatedTenancyModificationStateEnum.completed: 'COMPLETED',
  DedicatedTenancyModificationStateEnum.failed: 'FAILED',
};

AssociateConnectionAliasResult _$AssociateConnectionAliasResultFromJson(
    Map<String, dynamic> json) {
  return AssociateConnectionAliasResult(
    connectionIdentifier: json['ConnectionIdentifier'] as String,
  );
}

AssociateIpGroupsResult _$AssociateIpGroupsResultFromJson(
    Map<String, dynamic> json) {
  return AssociateIpGroupsResult();
}

AuthorizeIpRulesResult _$AuthorizeIpRulesResultFromJson(
    Map<String, dynamic> json) {
  return AuthorizeIpRulesResult();
}

ClientProperties _$ClientPropertiesFromJson(Map<String, dynamic> json) {
  return ClientProperties(
    reconnectEnabled:
        _$enumDecodeNullable(_$ReconnectEnumEnumMap, json['ReconnectEnabled']),
  );
}

Map<String, dynamic> _$ClientPropertiesToJson(ClientProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ReconnectEnabled', _$ReconnectEnumEnumMap[instance.reconnectEnabled]);
  return val;
}

const _$ReconnectEnumEnumMap = {
  ReconnectEnum.enabled: 'ENABLED',
  ReconnectEnum.disabled: 'DISABLED',
};

ClientPropertiesResult _$ClientPropertiesResultFromJson(
    Map<String, dynamic> json) {
  return ClientPropertiesResult(
    clientProperties: json['ClientProperties'] == null
        ? null
        : ClientProperties.fromJson(
            json['ClientProperties'] as Map<String, dynamic>),
    resourceId: json['ResourceId'] as String,
  );
}

ComputeType _$ComputeTypeFromJson(Map<String, dynamic> json) {
  return ComputeType(
    name: _$enumDecodeNullable(_$ComputeEnumMap, json['Name']),
  );
}

const _$ComputeEnumMap = {
  Compute.value: 'VALUE',
  Compute.standard: 'STANDARD',
  Compute.performance: 'PERFORMANCE',
  Compute.power: 'POWER',
  Compute.graphics: 'GRAPHICS',
  Compute.powerpro: 'POWERPRO',
  Compute.graphicspro: 'GRAPHICSPRO',
};

ConnectionAlias _$ConnectionAliasFromJson(Map<String, dynamic> json) {
  return ConnectionAlias(
    aliasId: json['AliasId'] as String,
    associations: (json['Associations'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectionAliasAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    connectionString: json['ConnectionString'] as String,
    ownerAccountId: json['OwnerAccountId'] as String,
    state: _$enumDecodeNullable(_$ConnectionAliasStateEnumMap, json['State']),
  );
}

const _$ConnectionAliasStateEnumMap = {
  ConnectionAliasState.creating: 'CREATING',
  ConnectionAliasState.created: 'CREATED',
  ConnectionAliasState.deleting: 'DELETING',
};

ConnectionAliasAssociation _$ConnectionAliasAssociationFromJson(
    Map<String, dynamic> json) {
  return ConnectionAliasAssociation(
    associatedAccountId: json['AssociatedAccountId'] as String,
    associationStatus: _$enumDecodeNullable(
        _$AssociationStatusEnumMap, json['AssociationStatus']),
    connectionIdentifier: json['ConnectionIdentifier'] as String,
    resourceId: json['ResourceId'] as String,
  );
}

const _$AssociationStatusEnumMap = {
  AssociationStatus.notAssociated: 'NOT_ASSOCIATED',
  AssociationStatus.associatedWithOwnerAccount: 'ASSOCIATED_WITH_OWNER_ACCOUNT',
  AssociationStatus.associatedWithSharedAccount:
      'ASSOCIATED_WITH_SHARED_ACCOUNT',
  AssociationStatus.pendingAssociation: 'PENDING_ASSOCIATION',
  AssociationStatus.pendingDisassociation: 'PENDING_DISASSOCIATION',
};

ConnectionAliasPermission _$ConnectionAliasPermissionFromJson(
    Map<String, dynamic> json) {
  return ConnectionAliasPermission(
    allowAssociation: json['AllowAssociation'] as bool,
    sharedAccountId: json['SharedAccountId'] as String,
  );
}

Map<String, dynamic> _$ConnectionAliasPermissionToJson(
    ConnectionAliasPermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowAssociation', instance.allowAssociation);
  writeNotNull('SharedAccountId', instance.sharedAccountId);
  return val;
}

CopyWorkspaceImageResult _$CopyWorkspaceImageResultFromJson(
    Map<String, dynamic> json) {
  return CopyWorkspaceImageResult(
    imageId: json['ImageId'] as String,
  );
}

CreateConnectionAliasResult _$CreateConnectionAliasResultFromJson(
    Map<String, dynamic> json) {
  return CreateConnectionAliasResult(
    aliasId: json['AliasId'] as String,
  );
}

CreateIpGroupResult _$CreateIpGroupResultFromJson(Map<String, dynamic> json) {
  return CreateIpGroupResult(
    groupId: json['GroupId'] as String,
  );
}

CreateTagsResult _$CreateTagsResultFromJson(Map<String, dynamic> json) {
  return CreateTagsResult();
}

CreateWorkspacesResult _$CreateWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return CreateWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedCreateWorkspaceRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pendingRequests: (json['PendingRequests'] as List)
        ?.map((e) =>
            e == null ? null : Workspace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DefaultWorkspaceCreationProperties _$DefaultWorkspaceCreationPropertiesFromJson(
    Map<String, dynamic> json) {
  return DefaultWorkspaceCreationProperties(
    customSecurityGroupId: json['CustomSecurityGroupId'] as String,
    defaultOu: json['DefaultOu'] as String,
    enableInternetAccess: json['EnableInternetAccess'] as bool,
    enableMaintenanceMode: json['EnableMaintenanceMode'] as bool,
    enableWorkDocs: json['EnableWorkDocs'] as bool,
    userEnabledAsLocalAdministrator:
        json['UserEnabledAsLocalAdministrator'] as bool,
  );
}

DeleteConnectionAliasResult _$DeleteConnectionAliasResultFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionAliasResult();
}

DeleteIpGroupResult _$DeleteIpGroupResultFromJson(Map<String, dynamic> json) {
  return DeleteIpGroupResult();
}

DeleteTagsResult _$DeleteTagsResultFromJson(Map<String, dynamic> json) {
  return DeleteTagsResult();
}

DeleteWorkspaceImageResult _$DeleteWorkspaceImageResultFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkspaceImageResult();
}

DeregisterWorkspaceDirectoryResult _$DeregisterWorkspaceDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterWorkspaceDirectoryResult();
}

DescribeAccountModificationsResult _$DescribeAccountModificationsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountModificationsResult(
    accountModifications: (json['AccountModifications'] as List)
        ?.map((e) => e == null
            ? null
            : AccountModification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAccountResult _$DescribeAccountResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountResult(
    dedicatedTenancyManagementCidrRange:
        json['DedicatedTenancyManagementCidrRange'] as String,
    dedicatedTenancySupport: _$enumDecodeNullable(
        _$DedicatedTenancySupportResultEnumEnumMap,
        json['DedicatedTenancySupport']),
  );
}

DescribeClientPropertiesResult _$DescribeClientPropertiesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeClientPropertiesResult(
    clientPropertiesList: (json['ClientPropertiesList'] as List)
        ?.map((e) => e == null
            ? null
            : ClientPropertiesResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeConnectionAliasPermissionsResult
    _$DescribeConnectionAliasPermissionsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeConnectionAliasPermissionsResult(
    aliasId: json['AliasId'] as String,
    connectionAliasPermissions: (json['ConnectionAliasPermissions'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectionAliasPermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConnectionAliasesResult _$DescribeConnectionAliasesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectionAliasesResult(
    connectionAliases: (json['ConnectionAliases'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectionAlias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeIpGroupsResult _$DescribeIpGroupsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeIpGroupsResult(
    nextToken: json['NextToken'] as String,
    result: (json['Result'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspacesIpGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTagsResult _$DescribeTagsResultFromJson(Map<String, dynamic> json) {
  return DescribeTagsResult(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeWorkspaceBundlesResult _$DescribeWorkspaceBundlesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspaceBundlesResult(
    bundles: (json['Bundles'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspaceBundle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeWorkspaceDirectoriesResult _$DescribeWorkspaceDirectoriesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspaceDirectoriesResult(
    directories: (json['Directories'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspaceDirectory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeWorkspaceImagePermissionsResult
    _$DescribeWorkspaceImagePermissionsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeWorkspaceImagePermissionsResult(
    imageId: json['ImageId'] as String,
    imagePermissions: (json['ImagePermissions'] as List)
        ?.map((e) => e == null
            ? null
            : ImagePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeWorkspaceImagesResult _$DescribeWorkspaceImagesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspaceImagesResult(
    images: (json['Images'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspaceImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeWorkspaceSnapshotsResult _$DescribeWorkspaceSnapshotsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspaceSnapshotsResult(
    rebuildSnapshots: (json['RebuildSnapshots'] as List)
        ?.map((e) =>
            e == null ? null : Snapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    restoreSnapshots: (json['RestoreSnapshots'] as List)
        ?.map((e) =>
            e == null ? null : Snapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeWorkspacesConnectionStatusResult
    _$DescribeWorkspacesConnectionStatusResultFromJson(
        Map<String, dynamic> json) {
  return DescribeWorkspacesConnectionStatusResult(
    nextToken: json['NextToken'] as String,
    workspacesConnectionStatus: (json['WorkspacesConnectionStatus'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspaceConnectionStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeWorkspacesResult _$DescribeWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspacesResult(
    nextToken: json['NextToken'] as String,
    workspaces: (json['Workspaces'] as List)
        ?.map((e) =>
            e == null ? null : Workspace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DisassociateConnectionAliasResult _$DisassociateConnectionAliasResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateConnectionAliasResult();
}

DisassociateIpGroupsResult _$DisassociateIpGroupsResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateIpGroupsResult();
}

FailedCreateWorkspaceRequest _$FailedCreateWorkspaceRequestFromJson(
    Map<String, dynamic> json) {
  return FailedCreateWorkspaceRequest(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    workspaceRequest: json['WorkspaceRequest'] == null
        ? null
        : WorkspaceRequest.fromJson(
            json['WorkspaceRequest'] as Map<String, dynamic>),
  );
}

FailedWorkspaceChangeRequest _$FailedWorkspaceChangeRequestFromJson(
    Map<String, dynamic> json) {
  return FailedWorkspaceChangeRequest(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    workspaceId: json['WorkspaceId'] as String,
  );
}

ImagePermission _$ImagePermissionFromJson(Map<String, dynamic> json) {
  return ImagePermission(
    sharedAccountId: json['SharedAccountId'] as String,
  );
}

ImportWorkspaceImageResult _$ImportWorkspaceImageResultFromJson(
    Map<String, dynamic> json) {
  return ImportWorkspaceImageResult(
    imageId: json['ImageId'] as String,
  );
}

IpRuleItem _$IpRuleItemFromJson(Map<String, dynamic> json) {
  return IpRuleItem(
    ipRule: json['ipRule'] as String,
    ruleDesc: json['ruleDesc'] as String,
  );
}

Map<String, dynamic> _$IpRuleItemToJson(IpRuleItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ipRule', instance.ipRule);
  writeNotNull('ruleDesc', instance.ruleDesc);
  return val;
}

ListAvailableManagementCidrRangesResult
    _$ListAvailableManagementCidrRangesResultFromJson(
        Map<String, dynamic> json) {
  return ListAvailableManagementCidrRangesResult(
    managementCidrRanges: (json['ManagementCidrRanges'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

MigrateWorkspaceResult _$MigrateWorkspaceResultFromJson(
    Map<String, dynamic> json) {
  return MigrateWorkspaceResult(
    sourceWorkspaceId: json['SourceWorkspaceId'] as String,
    targetWorkspaceId: json['TargetWorkspaceId'] as String,
  );
}

ModificationState _$ModificationStateFromJson(Map<String, dynamic> json) {
  return ModificationState(
    resource: _$enumDecodeNullable(
        _$ModificationResourceEnumEnumMap, json['Resource']),
    state: _$enumDecodeNullable(_$ModificationStateEnumEnumMap, json['State']),
  );
}

const _$ModificationResourceEnumEnumMap = {
  ModificationResourceEnum.rootVolume: 'ROOT_VOLUME',
  ModificationResourceEnum.userVolume: 'USER_VOLUME',
  ModificationResourceEnum.computeType: 'COMPUTE_TYPE',
};

const _$ModificationStateEnumEnumMap = {
  ModificationStateEnum.updateInitiated: 'UPDATE_INITIATED',
  ModificationStateEnum.updateInProgress: 'UPDATE_IN_PROGRESS',
};

ModifyAccountResult _$ModifyAccountResultFromJson(Map<String, dynamic> json) {
  return ModifyAccountResult();
}

ModifyClientPropertiesResult _$ModifyClientPropertiesResultFromJson(
    Map<String, dynamic> json) {
  return ModifyClientPropertiesResult();
}

ModifySelfservicePermissionsResult _$ModifySelfservicePermissionsResultFromJson(
    Map<String, dynamic> json) {
  return ModifySelfservicePermissionsResult();
}

ModifyWorkspaceAccessPropertiesResult
    _$ModifyWorkspaceAccessPropertiesResultFromJson(Map<String, dynamic> json) {
  return ModifyWorkspaceAccessPropertiesResult();
}

ModifyWorkspaceCreationPropertiesResult
    _$ModifyWorkspaceCreationPropertiesResultFromJson(
        Map<String, dynamic> json) {
  return ModifyWorkspaceCreationPropertiesResult();
}

ModifyWorkspacePropertiesResult _$ModifyWorkspacePropertiesResultFromJson(
    Map<String, dynamic> json) {
  return ModifyWorkspacePropertiesResult();
}

ModifyWorkspaceStateResult _$ModifyWorkspaceStateResultFromJson(
    Map<String, dynamic> json) {
  return ModifyWorkspaceStateResult();
}

OperatingSystem _$OperatingSystemFromJson(Map<String, dynamic> json) {
  return OperatingSystem(
    type: _$enumDecodeNullable(_$OperatingSystemTypeEnumMap, json['Type']),
  );
}

const _$OperatingSystemTypeEnumMap = {
  OperatingSystemType.windows: 'WINDOWS',
  OperatingSystemType.linux: 'LINUX',
};

Map<String, dynamic> _$RebootRequestToJson(RebootRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkspaceId', instance.workspaceId);
  return val;
}

RebootWorkspacesResult _$RebootWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return RebootWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RebuildRequestToJson(RebuildRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkspaceId', instance.workspaceId);
  return val;
}

RebuildWorkspacesResult _$RebuildWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return RebuildWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RegisterWorkspaceDirectoryResult _$RegisterWorkspaceDirectoryResultFromJson(
    Map<String, dynamic> json) {
  return RegisterWorkspaceDirectoryResult();
}

RestoreWorkspaceResult _$RestoreWorkspaceResultFromJson(
    Map<String, dynamic> json) {
  return RestoreWorkspaceResult();
}

RevokeIpRulesResult _$RevokeIpRulesResultFromJson(Map<String, dynamic> json) {
  return RevokeIpRulesResult();
}

RootStorage _$RootStorageFromJson(Map<String, dynamic> json) {
  return RootStorage(
    capacity: json['Capacity'] as String,
  );
}

SelfservicePermissions _$SelfservicePermissionsFromJson(
    Map<String, dynamic> json) {
  return SelfservicePermissions(
    changeComputeType:
        _$enumDecodeNullable(_$ReconnectEnumEnumMap, json['ChangeComputeType']),
    increaseVolumeSize: _$enumDecodeNullable(
        _$ReconnectEnumEnumMap, json['IncreaseVolumeSize']),
    rebuildWorkspace:
        _$enumDecodeNullable(_$ReconnectEnumEnumMap, json['RebuildWorkspace']),
    restartWorkspace:
        _$enumDecodeNullable(_$ReconnectEnumEnumMap, json['RestartWorkspace']),
    switchRunningMode:
        _$enumDecodeNullable(_$ReconnectEnumEnumMap, json['SwitchRunningMode']),
  );
}

Map<String, dynamic> _$SelfservicePermissionsToJson(
    SelfservicePermissions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ChangeComputeType', _$ReconnectEnumEnumMap[instance.changeComputeType]);
  writeNotNull('IncreaseVolumeSize',
      _$ReconnectEnumEnumMap[instance.increaseVolumeSize]);
  writeNotNull(
      'RebuildWorkspace', _$ReconnectEnumEnumMap[instance.rebuildWorkspace]);
  writeNotNull(
      'RestartWorkspace', _$ReconnectEnumEnumMap[instance.restartWorkspace]);
  writeNotNull(
      'SwitchRunningMode', _$ReconnectEnumEnumMap[instance.switchRunningMode]);
  return val;
}

Snapshot _$SnapshotFromJson(Map<String, dynamic> json) {
  return Snapshot(
    snapshotTime: const UnixDateTimeConverter().fromJson(json['SnapshotTime']),
  );
}

Map<String, dynamic> _$StartRequestToJson(StartRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkspaceId', instance.workspaceId);
  return val;
}

StartWorkspacesResult _$StartWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return StartWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StopRequestToJson(StopRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkspaceId', instance.workspaceId);
  return val;
}

StopWorkspacesResult _$StopWorkspacesResultFromJson(Map<String, dynamic> json) {
  return StopWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$TerminateRequestToJson(TerminateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkspaceId', instance.workspaceId);
  return val;
}

TerminateWorkspacesResult _$TerminateWorkspacesResultFromJson(
    Map<String, dynamic> json) {
  return TerminateWorkspacesResult(
    failedRequests: (json['FailedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateConnectionAliasPermissionResult
    _$UpdateConnectionAliasPermissionResultFromJson(Map<String, dynamic> json) {
  return UpdateConnectionAliasPermissionResult();
}

UpdateRulesOfIpGroupResult _$UpdateRulesOfIpGroupResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRulesOfIpGroupResult();
}

UpdateWorkspaceImagePermissionResult
    _$UpdateWorkspaceImagePermissionResultFromJson(Map<String, dynamic> json) {
  return UpdateWorkspaceImagePermissionResult();
}

UserStorage _$UserStorageFromJson(Map<String, dynamic> json) {
  return UserStorage(
    capacity: json['Capacity'] as String,
  );
}

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return Workspace(
    bundleId: json['BundleId'] as String,
    computerName: json['ComputerName'] as String,
    directoryId: json['DirectoryId'] as String,
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    ipAddress: json['IpAddress'] as String,
    modificationStates: (json['ModificationStates'] as List)
        ?.map((e) => e == null
            ? null
            : ModificationState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rootVolumeEncryptionEnabled: json['RootVolumeEncryptionEnabled'] as bool,
    state: _$enumDecodeNullable(_$WorkspaceStateEnumMap, json['State']),
    subnetId: json['SubnetId'] as String,
    userName: json['UserName'] as String,
    userVolumeEncryptionEnabled: json['UserVolumeEncryptionEnabled'] as bool,
    volumeEncryptionKey: json['VolumeEncryptionKey'] as String,
    workspaceId: json['WorkspaceId'] as String,
    workspaceProperties: json['WorkspaceProperties'] == null
        ? null
        : WorkspaceProperties.fromJson(
            json['WorkspaceProperties'] as Map<String, dynamic>),
  );
}

const _$WorkspaceStateEnumMap = {
  WorkspaceState.pending: 'PENDING',
  WorkspaceState.available: 'AVAILABLE',
  WorkspaceState.impaired: 'IMPAIRED',
  WorkspaceState.unhealthy: 'UNHEALTHY',
  WorkspaceState.rebooting: 'REBOOTING',
  WorkspaceState.starting: 'STARTING',
  WorkspaceState.rebuilding: 'REBUILDING',
  WorkspaceState.restoring: 'RESTORING',
  WorkspaceState.maintenance: 'MAINTENANCE',
  WorkspaceState.adminMaintenance: 'ADMIN_MAINTENANCE',
  WorkspaceState.terminating: 'TERMINATING',
  WorkspaceState.terminated: 'TERMINATED',
  WorkspaceState.suspended: 'SUSPENDED',
  WorkspaceState.updating: 'UPDATING',
  WorkspaceState.stopping: 'STOPPING',
  WorkspaceState.stopped: 'STOPPED',
  WorkspaceState.error: 'ERROR',
};

WorkspaceAccessProperties _$WorkspaceAccessPropertiesFromJson(
    Map<String, dynamic> json) {
  return WorkspaceAccessProperties(
    deviceTypeAndroid: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeAndroid']),
    deviceTypeChromeOs: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeChromeOs']),
    deviceTypeIos: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeIos']),
    deviceTypeOsx: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeOsx']),
    deviceTypeWeb: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeWeb']),
    deviceTypeWindows: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeWindows']),
    deviceTypeZeroClient: _$enumDecodeNullable(
        _$AccessPropertyValueEnumMap, json['DeviceTypeZeroClient']),
  );
}

Map<String, dynamic> _$WorkspaceAccessPropertiesToJson(
    WorkspaceAccessProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceTypeAndroid',
      _$AccessPropertyValueEnumMap[instance.deviceTypeAndroid]);
  writeNotNull('DeviceTypeChromeOs',
      _$AccessPropertyValueEnumMap[instance.deviceTypeChromeOs]);
  writeNotNull(
      'DeviceTypeIos', _$AccessPropertyValueEnumMap[instance.deviceTypeIos]);
  writeNotNull(
      'DeviceTypeOsx', _$AccessPropertyValueEnumMap[instance.deviceTypeOsx]);
  writeNotNull(
      'DeviceTypeWeb', _$AccessPropertyValueEnumMap[instance.deviceTypeWeb]);
  writeNotNull('DeviceTypeWindows',
      _$AccessPropertyValueEnumMap[instance.deviceTypeWindows]);
  writeNotNull('DeviceTypeZeroClient',
      _$AccessPropertyValueEnumMap[instance.deviceTypeZeroClient]);
  return val;
}

const _$AccessPropertyValueEnumMap = {
  AccessPropertyValue.allow: 'ALLOW',
  AccessPropertyValue.deny: 'DENY',
};

WorkspaceBundle _$WorkspaceBundleFromJson(Map<String, dynamic> json) {
  return WorkspaceBundle(
    bundleId: json['BundleId'] as String,
    computeType: json['ComputeType'] == null
        ? null
        : ComputeType.fromJson(json['ComputeType'] as Map<String, dynamic>),
    description: json['Description'] as String,
    imageId: json['ImageId'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    rootStorage: json['RootStorage'] == null
        ? null
        : RootStorage.fromJson(json['RootStorage'] as Map<String, dynamic>),
    userStorage: json['UserStorage'] == null
        ? null
        : UserStorage.fromJson(json['UserStorage'] as Map<String, dynamic>),
  );
}

WorkspaceConnectionStatus _$WorkspaceConnectionStatusFromJson(
    Map<String, dynamic> json) {
  return WorkspaceConnectionStatus(
    connectionState:
        _$enumDecodeNullable(_$ConnectionStateEnumMap, json['ConnectionState']),
    connectionStateCheckTimestamp: const UnixDateTimeConverter()
        .fromJson(json['ConnectionStateCheckTimestamp']),
    lastKnownUserConnectionTimestamp: const UnixDateTimeConverter()
        .fromJson(json['LastKnownUserConnectionTimestamp']),
    workspaceId: json['WorkspaceId'] as String,
  );
}

const _$ConnectionStateEnumMap = {
  ConnectionState.connected: 'CONNECTED',
  ConnectionState.disconnected: 'DISCONNECTED',
  ConnectionState.unknown: 'UNKNOWN',
};

Map<String, dynamic> _$WorkspaceCreationPropertiesToJson(
    WorkspaceCreationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomSecurityGroupId', instance.customSecurityGroupId);
  writeNotNull('DefaultOu', instance.defaultOu);
  writeNotNull('EnableInternetAccess', instance.enableInternetAccess);
  writeNotNull('EnableMaintenanceMode', instance.enableMaintenanceMode);
  writeNotNull('EnableWorkDocs', instance.enableWorkDocs);
  writeNotNull('UserEnabledAsLocalAdministrator',
      instance.userEnabledAsLocalAdministrator);
  return val;
}

WorkspaceDirectory _$WorkspaceDirectoryFromJson(Map<String, dynamic> json) {
  return WorkspaceDirectory(
    alias: json['Alias'] as String,
    customerUserName: json['CustomerUserName'] as String,
    directoryId: json['DirectoryId'] as String,
    directoryName: json['DirectoryName'] as String,
    directoryType: _$enumDecodeNullable(
        _$WorkspaceDirectoryTypeEnumMap, json['DirectoryType']),
    dnsIpAddresses:
        (json['DnsIpAddresses'] as List)?.map((e) => e as String)?.toList(),
    iamRoleId: json['IamRoleId'] as String,
    registrationCode: json['RegistrationCode'] as String,
    selfservicePermissions: json['SelfservicePermissions'] == null
        ? null
        : SelfservicePermissions.fromJson(
            json['SelfservicePermissions'] as Map<String, dynamic>),
    state:
        _$enumDecodeNullable(_$WorkspaceDirectoryStateEnumMap, json['State']),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    tenancy: _$enumDecodeNullable(_$TenancyEnumMap, json['Tenancy']),
    workspaceAccessProperties: json['WorkspaceAccessProperties'] == null
        ? null
        : WorkspaceAccessProperties.fromJson(
            json['WorkspaceAccessProperties'] as Map<String, dynamic>),
    workspaceCreationProperties: json['WorkspaceCreationProperties'] == null
        ? null
        : DefaultWorkspaceCreationProperties.fromJson(
            json['WorkspaceCreationProperties'] as Map<String, dynamic>),
    workspaceSecurityGroupId: json['WorkspaceSecurityGroupId'] as String,
    ipGroupIds: (json['ipGroupIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$WorkspaceDirectoryTypeEnumMap = {
  WorkspaceDirectoryType.simpleAd: 'SIMPLE_AD',
  WorkspaceDirectoryType.adConnector: 'AD_CONNECTOR',
};

const _$WorkspaceDirectoryStateEnumMap = {
  WorkspaceDirectoryState.registering: 'REGISTERING',
  WorkspaceDirectoryState.registered: 'REGISTERED',
  WorkspaceDirectoryState.deregistering: 'DEREGISTERING',
  WorkspaceDirectoryState.deregistered: 'DEREGISTERED',
  WorkspaceDirectoryState.error: 'ERROR',
};

const _$TenancyEnumMap = {
  Tenancy.dedicated: 'DEDICATED',
  Tenancy.shared: 'SHARED',
};

WorkspaceImage _$WorkspaceImageFromJson(Map<String, dynamic> json) {
  return WorkspaceImage(
    created: const UnixDateTimeConverter().fromJson(json['Created']),
    description: json['Description'] as String,
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    imageId: json['ImageId'] as String,
    name: json['Name'] as String,
    operatingSystem: json['OperatingSystem'] == null
        ? null
        : OperatingSystem.fromJson(
            json['OperatingSystem'] as Map<String, dynamic>),
    ownerAccountId: json['OwnerAccountId'] as String,
    requiredTenancy: _$enumDecodeNullable(
        _$WorkspaceImageRequiredTenancyEnumMap, json['RequiredTenancy']),
    state: _$enumDecodeNullable(_$WorkspaceImageStateEnumMap, json['State']),
  );
}

const _$WorkspaceImageRequiredTenancyEnumMap = {
  WorkspaceImageRequiredTenancy.$default: 'DEFAULT',
  WorkspaceImageRequiredTenancy.dedicated: 'DEDICATED',
};

const _$WorkspaceImageStateEnumMap = {
  WorkspaceImageState.available: 'AVAILABLE',
  WorkspaceImageState.pending: 'PENDING',
  WorkspaceImageState.error: 'ERROR',
};

WorkspaceProperties _$WorkspacePropertiesFromJson(Map<String, dynamic> json) {
  return WorkspaceProperties(
    computeTypeName:
        _$enumDecodeNullable(_$ComputeEnumMap, json['ComputeTypeName']),
    rootVolumeSizeGib: json['RootVolumeSizeGib'] as int,
    runningMode:
        _$enumDecodeNullable(_$RunningModeEnumMap, json['RunningMode']),
    runningModeAutoStopTimeoutInMinutes:
        json['RunningModeAutoStopTimeoutInMinutes'] as int,
    userVolumeSizeGib: json['UserVolumeSizeGib'] as int,
  );
}

Map<String, dynamic> _$WorkspacePropertiesToJson(WorkspaceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComputeTypeName', _$ComputeEnumMap[instance.computeTypeName]);
  writeNotNull('RootVolumeSizeGib', instance.rootVolumeSizeGib);
  writeNotNull('RunningMode', _$RunningModeEnumMap[instance.runningMode]);
  writeNotNull('RunningModeAutoStopTimeoutInMinutes',
      instance.runningModeAutoStopTimeoutInMinutes);
  writeNotNull('UserVolumeSizeGib', instance.userVolumeSizeGib);
  return val;
}

const _$RunningModeEnumMap = {
  RunningMode.autoStop: 'AUTO_STOP',
  RunningMode.alwaysOn: 'ALWAYS_ON',
};

WorkspaceRequest _$WorkspaceRequestFromJson(Map<String, dynamic> json) {
  return WorkspaceRequest(
    bundleId: json['BundleId'] as String,
    directoryId: json['DirectoryId'] as String,
    userName: json['UserName'] as String,
    rootVolumeEncryptionEnabled: json['RootVolumeEncryptionEnabled'] as bool,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userVolumeEncryptionEnabled: json['UserVolumeEncryptionEnabled'] as bool,
    volumeEncryptionKey: json['VolumeEncryptionKey'] as String,
    workspaceProperties: json['WorkspaceProperties'] == null
        ? null
        : WorkspaceProperties.fromJson(
            json['WorkspaceProperties'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkspaceRequestToJson(WorkspaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BundleId', instance.bundleId);
  writeNotNull('DirectoryId', instance.directoryId);
  writeNotNull('UserName', instance.userName);
  writeNotNull(
      'RootVolumeEncryptionEnabled', instance.rootVolumeEncryptionEnabled);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'UserVolumeEncryptionEnabled', instance.userVolumeEncryptionEnabled);
  writeNotNull('VolumeEncryptionKey', instance.volumeEncryptionKey);
  writeNotNull('WorkspaceProperties', instance.workspaceProperties?.toJson());
  return val;
}

WorkspacesIpGroup _$WorkspacesIpGroupFromJson(Map<String, dynamic> json) {
  return WorkspacesIpGroup(
    groupDesc: json['groupDesc'] as String,
    groupId: json['groupId'] as String,
    groupName: json['groupName'] as String,
    userRules: (json['userRules'] as List)
        ?.map((e) =>
            e == null ? null : IpRuleItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
