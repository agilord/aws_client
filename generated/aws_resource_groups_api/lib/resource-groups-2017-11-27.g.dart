// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource-groups-2017-11-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroupOutput _$CreateGroupOutputFromJson(Map<String, dynamic> json) {
  return CreateGroupOutput(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    groupConfiguration: json['GroupConfiguration'] == null
        ? null
        : GroupConfiguration.fromJson(
            json['GroupConfiguration'] as Map<String, dynamic>),
    resourceQuery: json['ResourceQuery'] == null
        ? null
        : ResourceQuery.fromJson(json['ResourceQuery'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DeleteGroupOutput _$DeleteGroupOutputFromJson(Map<String, dynamic> json) {
  return DeleteGroupOutput(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

FailedResource _$FailedResourceFromJson(Map<String, dynamic> json) {
  return FailedResource(
    errorCode: json['ErrorCode'] as String?,
    errorMessage: json['ErrorMessage'] as String?,
    resourceArn: json['ResourceArn'] as String?,
  );
}

GetGroupConfigurationOutput _$GetGroupConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return GetGroupConfigurationOutput(
    groupConfiguration: json['GroupConfiguration'] == null
        ? null
        : GroupConfiguration.fromJson(
            json['GroupConfiguration'] as Map<String, dynamic>),
  );
}

GetGroupOutput _$GetGroupOutputFromJson(Map<String, dynamic> json) {
  return GetGroupOutput(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

GetGroupQueryOutput _$GetGroupQueryOutputFromJson(Map<String, dynamic> json) {
  return GetGroupQueryOutput(
    groupQuery: json['GroupQuery'] == null
        ? null
        : GroupQuery.fromJson(json['GroupQuery'] as Map<String, dynamic>),
  );
}

GetTagsOutput _$GetTagsOutputFromJson(Map<String, dynamic> json) {
  return GetTagsOutput(
    arn: json['Arn'] as String?,
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    groupArn: json['GroupArn'] as String,
    name: json['Name'] as String,
    description: json['Description'] as String?,
  );
}

GroupConfiguration _$GroupConfigurationFromJson(Map<String, dynamic> json) {
  return GroupConfiguration(
    configuration: (json['Configuration'] as List<dynamic>?)
        ?.map((e) => GroupConfigurationItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    failureReason: json['FailureReason'] as String?,
    proposedConfiguration: (json['ProposedConfiguration'] as List<dynamic>?)
        ?.map((e) => GroupConfigurationItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    status:
        _$enumDecodeNullable(_$GroupConfigurationStatusEnumMap, json['Status']),
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$GroupConfigurationStatusEnumMap = {
  GroupConfigurationStatus.updating: 'UPDATING',
  GroupConfigurationStatus.updateComplete: 'UPDATE_COMPLETE',
  GroupConfigurationStatus.updateFailed: 'UPDATE_FAILED',
};

GroupConfigurationItem _$GroupConfigurationItemFromJson(
    Map<String, dynamic> json) {
  return GroupConfigurationItem(
    type: json['Type'] as String,
    parameters: (json['Parameters'] as List<dynamic>?)
        ?.map((e) =>
            GroupConfigurationParameter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GroupConfigurationItemToJson(
    GroupConfigurationItem instance) {
  final val = <String, dynamic>{
    'Type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Parameters', instance.parameters?.map((e) => e.toJson()).toList());
  return val;
}

GroupConfigurationParameter _$GroupConfigurationParameterFromJson(
    Map<String, dynamic> json) {
  return GroupConfigurationParameter(
    name: json['Name'] as String,
    values:
        (json['Values'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$GroupConfigurationParameterToJson(
    GroupConfigurationParameter instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$GroupFilterToJson(GroupFilter instance) =>
    <String, dynamic>{
      'Name': _$GroupFilterNameEnumMap[instance.name],
      'Values': instance.values,
    };

const _$GroupFilterNameEnumMap = {
  GroupFilterName.resourceType: 'resource-type',
  GroupFilterName.configurationType: 'configuration-type',
};

GroupIdentifier _$GroupIdentifierFromJson(Map<String, dynamic> json) {
  return GroupIdentifier(
    groupArn: json['GroupArn'] as String?,
    groupName: json['GroupName'] as String?,
  );
}

GroupQuery _$GroupQueryFromJson(Map<String, dynamic> json) {
  return GroupQuery(
    groupName: json['GroupName'] as String,
    resourceQuery:
        ResourceQuery.fromJson(json['ResourceQuery'] as Map<String, dynamic>),
  );
}

GroupResourcesOutput _$GroupResourcesOutputFromJson(Map<String, dynamic> json) {
  return GroupResourcesOutput(
    failed: (json['Failed'] as List<dynamic>?)
        ?.map((e) => FailedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    pending: (json['Pending'] as List<dynamic>?)
        ?.map((e) => PendingResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    succeeded:
        (json['Succeeded'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

ListGroupResourcesItem _$ListGroupResourcesItemFromJson(
    Map<String, dynamic> json) {
  return ListGroupResourcesItem(
    identifier: json['Identifier'] == null
        ? null
        : ResourceIdentifier.fromJson(
            json['Identifier'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : ResourceStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

ListGroupResourcesOutput _$ListGroupResourcesOutputFromJson(
    Map<String, dynamic> json) {
  return ListGroupResourcesOutput(
    nextToken: json['NextToken'] as String?,
    queryErrors: (json['QueryErrors'] as List<dynamic>?)
        ?.map((e) => QueryError.fromJson(e as Map<String, dynamic>))
        .toList(),
    resourceIdentifiers: (json['ResourceIdentifiers'] as List<dynamic>?)
        ?.map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    resources: (json['Resources'] as List<dynamic>?)
        ?.map((e) => ListGroupResourcesItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListGroupsOutput _$ListGroupsOutputFromJson(Map<String, dynamic> json) {
  return ListGroupsOutput(
    groupIdentifiers: (json['GroupIdentifiers'] as List<dynamic>?)
        ?.map((e) => GroupIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    groups: (json['Groups'] as List<dynamic>?)
        ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

PendingResource _$PendingResourceFromJson(Map<String, dynamic> json) {
  return PendingResource(
    resourceArn: json['ResourceArn'] as String?,
  );
}

PutGroupConfigurationOutput _$PutGroupConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return PutGroupConfigurationOutput();
}

QueryError _$QueryErrorFromJson(Map<String, dynamic> json) {
  return QueryError(
    errorCode: _$enumDecodeNullable(_$QueryErrorCodeEnumMap, json['ErrorCode']),
    message: json['Message'] as String?,
  );
}

const _$QueryErrorCodeEnumMap = {
  QueryErrorCode.cloudformationStackInactive: 'CLOUDFORMATION_STACK_INACTIVE',
  QueryErrorCode.cloudformationStackNotExisting:
      'CLOUDFORMATION_STACK_NOT_EXISTING',
};

Map<String, dynamic> _$ResourceFilterToJson(ResourceFilter instance) =>
    <String, dynamic>{
      'Name': _$ResourceFilterNameEnumMap[instance.name],
      'Values': instance.values,
    };

const _$ResourceFilterNameEnumMap = {
  ResourceFilterName.resourceType: 'resource-type',
};

ResourceIdentifier _$ResourceIdentifierFromJson(Map<String, dynamic> json) {
  return ResourceIdentifier(
    resourceArn: json['ResourceArn'] as String?,
    resourceType: json['ResourceType'] as String?,
  );
}

ResourceQuery _$ResourceQueryFromJson(Map<String, dynamic> json) {
  return ResourceQuery(
    query: json['Query'] as String,
    type: _$enumDecode(_$QueryTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ResourceQueryToJson(ResourceQuery instance) =>
    <String, dynamic>{
      'Query': instance.query,
      'Type': _$QueryTypeEnumMap[instance.type],
    };

const _$QueryTypeEnumMap = {
  QueryType.tagFilters_1_0: 'TAG_FILTERS_1_0',
  QueryType.cloudformationStack_1_0: 'CLOUDFORMATION_STACK_1_0',
};

ResourceStatus _$ResourceStatusFromJson(Map<String, dynamic> json) {
  return ResourceStatus(
    name: _$enumDecodeNullable(_$ResourceStatusValueEnumMap, json['Name']),
  );
}

const _$ResourceStatusValueEnumMap = {
  ResourceStatusValue.pending: 'PENDING',
};

SearchResourcesOutput _$SearchResourcesOutputFromJson(
    Map<String, dynamic> json) {
  return SearchResourcesOutput(
    nextToken: json['NextToken'] as String?,
    queryErrors: (json['QueryErrors'] as List<dynamic>?)
        ?.map((e) => QueryError.fromJson(e as Map<String, dynamic>))
        .toList(),
    resourceIdentifiers: (json['ResourceIdentifiers'] as List<dynamic>?)
        ?.map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

TagOutput _$TagOutputFromJson(Map<String, dynamic> json) {
  return TagOutput(
    arn: json['Arn'] as String?,
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

UngroupResourcesOutput _$UngroupResourcesOutputFromJson(
    Map<String, dynamic> json) {
  return UngroupResourcesOutput(
    failed: (json['Failed'] as List<dynamic>?)
        ?.map((e) => FailedResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    pending: (json['Pending'] as List<dynamic>?)
        ?.map((e) => PendingResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    succeeded:
        (json['Succeeded'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

UntagOutput _$UntagOutputFromJson(Map<String, dynamic> json) {
  return UntagOutput(
    arn: json['Arn'] as String?,
    keys: (json['Keys'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

UpdateGroupOutput _$UpdateGroupOutputFromJson(Map<String, dynamic> json) {
  return UpdateGroupOutput(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

UpdateGroupQueryOutput _$UpdateGroupQueryOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGroupQueryOutput(
    groupQuery: json['GroupQuery'] == null
        ? null
        : GroupQuery.fromJson(json['GroupQuery'] as Map<String, dynamic>),
  );
}
