// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelChangeSetResponse _$CancelChangeSetResponseFromJson(
    Map<String, dynamic> json) {
  return CancelChangeSetResponse(
    changeSetArn: json['ChangeSetArn'] as String,
    changeSetId: json['ChangeSetId'] as String,
  );
}

Map<String, dynamic> _$ChangeToJson(Change instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChangeType', instance.changeType);
  writeNotNull('Details', instance.details);
  writeNotNull('Entity', instance.entity?.toJson());
  return val;
}

ChangeSetSummaryListItem _$ChangeSetSummaryListItemFromJson(
    Map<String, dynamic> json) {
  return ChangeSetSummaryListItem(
    changeSetArn: json['ChangeSetArn'] as String,
    changeSetId: json['ChangeSetId'] as String,
    changeSetName: json['ChangeSetName'] as String,
    endTime: json['EndTime'] as String,
    entityIdList:
        (json['EntityIdList'] as List)?.map((e) => e as String)?.toList(),
    failureCode:
        _$enumDecodeNullable(_$FailureCodeEnumMap, json['FailureCode']),
    startTime: json['StartTime'] as String,
    status: _$enumDecodeNullable(_$ChangeStatusEnumMap, json['Status']),
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

const _$FailureCodeEnumMap = {
  FailureCode.clientError: 'CLIENT_ERROR',
  FailureCode.serverFault: 'SERVER_FAULT',
};

const _$ChangeStatusEnumMap = {
  ChangeStatus.preparing: 'PREPARING',
  ChangeStatus.applying: 'APPLYING',
  ChangeStatus.succeeded: 'SUCCEEDED',
  ChangeStatus.cancelled: 'CANCELLED',
  ChangeStatus.failed: 'FAILED',
};

ChangeSummary _$ChangeSummaryFromJson(Map<String, dynamic> json) {
  return ChangeSummary(
    changeType: json['ChangeType'] as String,
    details: json['Details'] as String,
    entity: json['Entity'] == null
        ? null
        : Entity.fromJson(json['Entity'] as Map<String, dynamic>),
    errorDetailList: (json['ErrorDetailList'] as List)
        ?.map((e) =>
            e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeChangeSetResponse _$DescribeChangeSetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChangeSetResponse(
    changeSet: (json['ChangeSet'] as List)
        ?.map((e) => e == null
            ? null
            : ChangeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    changeSetArn: json['ChangeSetArn'] as String,
    changeSetId: json['ChangeSetId'] as String,
    changeSetName: json['ChangeSetName'] as String,
    endTime: json['EndTime'] as String,
    failureCode:
        _$enumDecodeNullable(_$FailureCodeEnumMap, json['FailureCode']),
    failureDescription: json['FailureDescription'] as String,
    startTime: json['StartTime'] as String,
    status: _$enumDecodeNullable(_$ChangeStatusEnumMap, json['Status']),
  );
}

DescribeEntityResponse _$DescribeEntityResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEntityResponse(
    details: json['Details'] as String,
    entityArn: json['EntityArn'] as String,
    entityIdentifier: json['EntityIdentifier'] as String,
    entityType: json['EntityType'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
  );
}

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    type: json['Type'] as String,
    identifier: json['Identifier'] as String,
  );
}

Map<String, dynamic> _$EntityToJson(Entity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  writeNotNull('Identifier', instance.identifier);
  return val;
}

EntitySummary _$EntitySummaryFromJson(Map<String, dynamic> json) {
  return EntitySummary(
    entityArn: json['EntityArn'] as String,
    entityId: json['EntityId'] as String,
    entityType: json['EntityType'] as String,
    lastModifiedDate: json['LastModifiedDate'] as String,
    name: json['Name'] as String,
    visibility: json['Visibility'] as String,
  );
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
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
  writeNotNull('ValueList', instance.valueList);
  return val;
}

ListChangeSetsResponse _$ListChangeSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListChangeSetsResponse(
    changeSetSummaryList: (json['ChangeSetSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ChangeSetSummaryListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEntitiesResponse _$ListEntitiesResponseFromJson(Map<String, dynamic> json) {
  return ListEntitiesResponse(
    entitySummaryList: (json['EntitySummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : EntitySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$SortToJson(Sort instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SortBy', instance.sortBy);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'ASCENDING',
  SortOrder.descending: 'DESCENDING',
};

StartChangeSetResponse _$StartChangeSetResponseFromJson(
    Map<String, dynamic> json) {
  return StartChangeSetResponse(
    changeSetArn: json['ChangeSetArn'] as String,
    changeSetId: json['ChangeSetId'] as String,
  );
}
