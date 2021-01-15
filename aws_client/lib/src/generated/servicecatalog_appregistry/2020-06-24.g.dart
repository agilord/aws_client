// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-06-24.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ApplicationSummary _$ApplicationSummaryFromJson(Map<String, dynamic> json) {
  return ApplicationSummary(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
  );
}

AssociateAttributeGroupResponse _$AssociateAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateAttributeGroupResponse(
    applicationArn: json['applicationArn'] as String,
    attributeGroupArn: json['attributeGroupArn'] as String,
  );
}

AssociateResourceResponse _$AssociateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateResourceResponse(
    applicationArn: json['applicationArn'] as String,
    resourceArn: json['resourceArn'] as String,
  );
}

AttributeGroup _$AttributeGroupFromJson(Map<String, dynamic> json) {
  return AttributeGroup(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

AttributeGroupSummary _$AttributeGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return AttributeGroupSummary(
    arn: json['arn'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
  );
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    application: json['application'] == null
        ? null
        : Application.fromJson(json['application'] as Map<String, dynamic>),
  );
}

CreateAttributeGroupResponse _$CreateAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAttributeGroupResponse(
    attributeGroup: json['attributeGroup'] == null
        ? null
        : AttributeGroup.fromJson(
            json['attributeGroup'] as Map<String, dynamic>),
  );
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse(
    application: json['application'] == null
        ? null
        : ApplicationSummary.fromJson(
            json['application'] as Map<String, dynamic>),
  );
}

DeleteAttributeGroupResponse _$DeleteAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAttributeGroupResponse(
    attributeGroup: json['attributeGroup'] == null
        ? null
        : AttributeGroupSummary.fromJson(
            json['attributeGroup'] as Map<String, dynamic>),
  );
}

DisassociateAttributeGroupResponse _$DisassociateAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateAttributeGroupResponse(
    applicationArn: json['applicationArn'] as String,
    attributeGroupArn: json['attributeGroupArn'] as String,
  );
}

DisassociateResourceResponse _$DisassociateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateResourceResponse(
    applicationArn: json['applicationArn'] as String,
    resourceArn: json['resourceArn'] as String,
  );
}

GetApplicationResponse _$GetApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return GetApplicationResponse(
    arn: json['arn'] as String,
    associatedResourceCount: json['associatedResourceCount'] as int,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetAttributeGroupResponse _$GetAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return GetAttributeGroupResponse(
    arn: json['arn'] as String,
    attributes: json['attributes'] as String,
    creationTime: const IsoDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateTime:
        const IsoDateTimeConverter().fromJson(json['lastUpdateTime']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applications: (json['applications'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssociatedAttributeGroupsResponse
    _$ListAssociatedAttributeGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListAssociatedAttributeGroupsResponse(
    attributeGroups:
        (json['attributeGroups'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssociatedResourcesResponse _$ListAssociatedResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssociatedResourcesResponse(
    nextToken: json['nextToken'] as String,
    resources: (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : ResourceInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAttributeGroupsResponse _$ListAttributeGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttributeGroupsResponse(
    attributeGroups: (json['attributeGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ResourceInfo _$ResourceInfoFromJson(Map<String, dynamic> json) {
  return ResourceInfo(
    arn: json['arn'] as String,
    name: json['name'] as String,
  );
}

SyncResourceResponse _$SyncResourceResponseFromJson(Map<String, dynamic> json) {
  return SyncResourceResponse(
    actionTaken: _$enumDecodeNullable(_$SyncActionEnumMap, json['actionTaken']),
    applicationArn: json['applicationArn'] as String,
    resourceArn: json['resourceArn'] as String,
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

const _$SyncActionEnumMap = {
  SyncAction.startSync: 'START_SYNC',
  SyncAction.noAction: 'NO_ACTION',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse(
    application: json['application'] == null
        ? null
        : Application.fromJson(json['application'] as Map<String, dynamic>),
  );
}

UpdateAttributeGroupResponse _$UpdateAttributeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAttributeGroupResponse(
    attributeGroup: json['attributeGroup'] == null
        ? null
        : AttributeGroup.fromJson(
            json['attributeGroup'] as Map<String, dynamic>),
  );
}
