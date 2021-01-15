// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-01-04.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptResourceShareInvitationResponse
    _$AcceptResourceShareInvitationResponseFromJson(Map<String, dynamic> json) {
  return AcceptResourceShareInvitationResponse(
    clientToken: json['clientToken'] as String,
    resourceShareInvitation: json['resourceShareInvitation'] == null
        ? null
        : ResourceShareInvitation.fromJson(
            json['resourceShareInvitation'] as Map<String, dynamic>),
  );
}

AssociateResourceSharePermissionResponse
    _$AssociateResourceSharePermissionResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateResourceSharePermissionResponse(
    clientToken: json['clientToken'] as String,
    returnValue: json['returnValue'] as bool,
  );
}

AssociateResourceShareResponse _$AssociateResourceShareResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateResourceShareResponse(
    clientToken: json['clientToken'] as String,
    resourceShareAssociations: (json['resourceShareAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateResourceShareResponse _$CreateResourceShareResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResourceShareResponse(
    clientToken: json['clientToken'] as String,
    resourceShare: json['resourceShare'] == null
        ? null
        : ResourceShare.fromJson(json['resourceShare'] as Map<String, dynamic>),
  );
}

DeleteResourceShareResponse _$DeleteResourceShareResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourceShareResponse(
    clientToken: json['clientToken'] as String,
    returnValue: json['returnValue'] as bool,
  );
}

DisassociateResourceSharePermissionResponse
    _$DisassociateResourceSharePermissionResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateResourceSharePermissionResponse(
    clientToken: json['clientToken'] as String,
    returnValue: json['returnValue'] as bool,
  );
}

DisassociateResourceShareResponse _$DisassociateResourceShareResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateResourceShareResponse(
    clientToken: json['clientToken'] as String,
    resourceShareAssociations: (json['resourceShareAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

EnableSharingWithAwsOrganizationResponse
    _$EnableSharingWithAwsOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return EnableSharingWithAwsOrganizationResponse(
    returnValue: json['returnValue'] as bool,
  );
}

GetPermissionResponse _$GetPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return GetPermissionResponse(
    permission: json['permission'] == null
        ? null
        : ResourceSharePermissionDetail.fromJson(
            json['permission'] as Map<String, dynamic>),
  );
}

GetResourcePoliciesResponse _$GetResourcePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePoliciesResponse(
    nextToken: json['nextToken'] as String,
    policies: (json['policies'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetResourceShareAssociationsResponse
    _$GetResourceShareAssociationsResponseFromJson(Map<String, dynamic> json) {
  return GetResourceShareAssociationsResponse(
    nextToken: json['nextToken'] as String,
    resourceShareAssociations: (json['resourceShareAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetResourceShareInvitationsResponse
    _$GetResourceShareInvitationsResponseFromJson(Map<String, dynamic> json) {
  return GetResourceShareInvitationsResponse(
    nextToken: json['nextToken'] as String,
    resourceShareInvitations: (json['resourceShareInvitations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShareInvitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetResourceSharesResponse _$GetResourceSharesResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourceSharesResponse(
    nextToken: json['nextToken'] as String,
    resourceShares: (json['resourceShares'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShare.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPendingInvitationResourcesResponse
    _$ListPendingInvitationResourcesResponseFromJson(
        Map<String, dynamic> json) {
  return ListPendingInvitationResourcesResponse(
    nextToken: json['nextToken'] as String,
    resources: (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPermissionsResponse _$ListPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPermissionsResponse(
    nextToken: json['nextToken'] as String,
    permissions: (json['permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceSharePermissionSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPrincipalsResponse _$ListPrincipalsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPrincipalsResponse(
    nextToken: json['nextToken'] as String,
    principals: (json['principals'] as List)
        ?.map((e) =>
            e == null ? null : Principal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceSharePermissionsResponse
    _$ListResourceSharePermissionsResponseFromJson(Map<String, dynamic> json) {
  return ListResourceSharePermissionsResponse(
    nextToken: json['nextToken'] as String,
    permissions: (json['permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceSharePermissionSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceTypesResponse _$ListResourceTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceTypesResponse(
    nextToken: json['nextToken'] as String,
    resourceTypes: (json['resourceTypes'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceNameAndResourceType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourcesResponse _$ListResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourcesResponse(
    nextToken: json['nextToken'] as String,
    resources: (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Principal _$PrincipalFromJson(Map<String, dynamic> json) {
  return Principal(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    external: json['external'] as bool,
    id: json['id'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    resourceShareArn: json['resourceShareArn'] as String,
  );
}

PromoteResourceShareCreatedFromPolicyResponse
    _$PromoteResourceShareCreatedFromPolicyResponseFromJson(
        Map<String, dynamic> json) {
  return PromoteResourceShareCreatedFromPolicyResponse(
    returnValue: json['returnValue'] as bool,
  );
}

RejectResourceShareInvitationResponse
    _$RejectResourceShareInvitationResponseFromJson(Map<String, dynamic> json) {
  return RejectResourceShareInvitationResponse(
    clientToken: json['clientToken'] as String,
    resourceShareInvitation: json['resourceShareInvitation'] == null
        ? null
        : ResourceShareInvitation.fromJson(
            json['resourceShareInvitation'] as Map<String, dynamic>),
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    arn: json['arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    resourceGroupArn: json['resourceGroupArn'] as String,
    resourceShareArn: json['resourceShareArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['status']),
    statusMessage: json['statusMessage'] as String,
    type: json['type'] as String,
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

const _$ResourceStatusEnumMap = {
  ResourceStatus.available: 'AVAILABLE',
  ResourceStatus.zonalResourceInaccessible: 'ZONAL_RESOURCE_INACCESSIBLE',
  ResourceStatus.limitExceeded: 'LIMIT_EXCEEDED',
  ResourceStatus.unavailable: 'UNAVAILABLE',
  ResourceStatus.pending: 'PENDING',
};

ResourceShare _$ResourceShareFromJson(Map<String, dynamic> json) {
  return ResourceShare(
    allowExternalPrincipals: json['allowExternalPrincipals'] as bool,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    featureSet: _$enumDecodeNullable(
        _$ResourceShareFeatureSetEnumMap, json['featureSet']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    name: json['name'] as String,
    owningAccountId: json['owningAccountId'] as String,
    resourceShareArn: json['resourceShareArn'] as String,
    status: _$enumDecodeNullable(_$ResourceShareStatusEnumMap, json['status']),
    statusMessage: json['statusMessage'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$ResourceShareFeatureSetEnumMap = {
  ResourceShareFeatureSet.createdFromPolicy: 'CREATED_FROM_POLICY',
  ResourceShareFeatureSet.promotingToStandard: 'PROMOTING_TO_STANDARD',
  ResourceShareFeatureSet.standard: 'STANDARD',
};

const _$ResourceShareStatusEnumMap = {
  ResourceShareStatus.pending: 'PENDING',
  ResourceShareStatus.active: 'ACTIVE',
  ResourceShareStatus.failed: 'FAILED',
  ResourceShareStatus.deleting: 'DELETING',
  ResourceShareStatus.deleted: 'DELETED',
};

ResourceShareAssociation _$ResourceShareAssociationFromJson(
    Map<String, dynamic> json) {
  return ResourceShareAssociation(
    associatedEntity: json['associatedEntity'] as String,
    associationType: _$enumDecodeNullable(
        _$ResourceShareAssociationTypeEnumMap, json['associationType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    external: json['external'] as bool,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    resourceShareArn: json['resourceShareArn'] as String,
    resourceShareName: json['resourceShareName'] as String,
    status: _$enumDecodeNullable(
        _$ResourceShareAssociationStatusEnumMap, json['status']),
    statusMessage: json['statusMessage'] as String,
  );
}

const _$ResourceShareAssociationTypeEnumMap = {
  ResourceShareAssociationType.principal: 'PRINCIPAL',
  ResourceShareAssociationType.resource: 'RESOURCE',
};

const _$ResourceShareAssociationStatusEnumMap = {
  ResourceShareAssociationStatus.associating: 'ASSOCIATING',
  ResourceShareAssociationStatus.associated: 'ASSOCIATED',
  ResourceShareAssociationStatus.failed: 'FAILED',
  ResourceShareAssociationStatus.disassociating: 'DISASSOCIATING',
  ResourceShareAssociationStatus.disassociated: 'DISASSOCIATED',
};

ResourceShareInvitation _$ResourceShareInvitationFromJson(
    Map<String, dynamic> json) {
  return ResourceShareInvitation(
    invitationTimestamp:
        const UnixDateTimeConverter().fromJson(json['invitationTimestamp']),
    receiverAccountId: json['receiverAccountId'] as String,
    resourceShareArn: json['resourceShareArn'] as String,
    resourceShareAssociations: (json['resourceShareAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceShareInvitationArn: json['resourceShareInvitationArn'] as String,
    resourceShareName: json['resourceShareName'] as String,
    senderAccountId: json['senderAccountId'] as String,
    status: _$enumDecodeNullable(
        _$ResourceShareInvitationStatusEnumMap, json['status']),
  );
}

const _$ResourceShareInvitationStatusEnumMap = {
  ResourceShareInvitationStatus.pending: 'PENDING',
  ResourceShareInvitationStatus.accepted: 'ACCEPTED',
  ResourceShareInvitationStatus.rejected: 'REJECTED',
  ResourceShareInvitationStatus.expired: 'EXPIRED',
};

ResourceSharePermissionDetail _$ResourceSharePermissionDetailFromJson(
    Map<String, dynamic> json) {
  return ResourceSharePermissionDetail(
    arn: json['arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    defaultVersion: json['defaultVersion'] as bool,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    name: json['name'] as String,
    permission: json['permission'] as String,
    resourceType: json['resourceType'] as String,
    version: json['version'] as String,
  );
}

ResourceSharePermissionSummary _$ResourceSharePermissionSummaryFromJson(
    Map<String, dynamic> json) {
  return ResourceSharePermissionSummary(
    arn: json['arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    defaultVersion: json['defaultVersion'] as bool,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    name: json['name'] as String,
    resourceType: json['resourceType'] as String,
    status: json['status'] as String,
    version: json['version'] as String,
  );
}

ServiceNameAndResourceType _$ServiceNameAndResourceTypeFromJson(
    Map<String, dynamic> json) {
  return ServiceNameAndResourceType(
    resourceType: json['resourceType'] as String,
    serviceName: json['serviceName'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagKey', instance.tagKey);
  writeNotNull('tagValues', instance.tagValues);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateResourceShareResponse _$UpdateResourceShareResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceShareResponse(
    clientToken: json['clientToken'] as String,
    resourceShare: json['resourceShare'] == null
        ? null
        : ResourceShare.fromJson(json['resourceShare'] as Map<String, dynamic>),
  );
}
