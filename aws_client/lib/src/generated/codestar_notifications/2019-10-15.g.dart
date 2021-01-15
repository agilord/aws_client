// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-10-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNotificationRuleResult _$CreateNotificationRuleResultFromJson(
    Map<String, dynamic> json) {
  return CreateNotificationRuleResult(
    arn: json['Arn'] as String,
  );
}

DeleteNotificationRuleResult _$DeleteNotificationRuleResultFromJson(
    Map<String, dynamic> json) {
  return DeleteNotificationRuleResult(
    arn: json['Arn'] as String,
  );
}

DeleteTargetResult _$DeleteTargetResultFromJson(Map<String, dynamic> json) {
  return DeleteTargetResult();
}

DescribeNotificationRuleResult _$DescribeNotificationRuleResultFromJson(
    Map<String, dynamic> json) {
  return DescribeNotificationRuleResult(
    arn: json['Arn'] as String,
    createdBy: json['CreatedBy'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    detailType: _$enumDecodeNullable(_$DetailTypeEnumMap, json['DetailType']),
    eventTypes: (json['EventTypes'] as List)
        ?.map((e) => e == null
            ? null
            : EventTypeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastModifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTimestamp']),
    name: json['Name'] as String,
    resource: json['Resource'] as String,
    status:
        _$enumDecodeNullable(_$NotificationRuleStatusEnumMap, json['Status']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    targets: (json['Targets'] as List)
        ?.map((e) => e == null
            ? null
            : TargetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

const _$DetailTypeEnumMap = {
  DetailType.basic: 'BASIC',
  DetailType.full: 'FULL',
};

const _$NotificationRuleStatusEnumMap = {
  NotificationRuleStatus.enabled: 'ENABLED',
  NotificationRuleStatus.disabled: 'DISABLED',
};

EventTypeSummary _$EventTypeSummaryFromJson(Map<String, dynamic> json) {
  return EventTypeSummary(
    eventTypeId: json['EventTypeId'] as String,
    eventTypeName: json['EventTypeName'] as String,
    resourceType: json['ResourceType'] as String,
    serviceName: json['ServiceName'] as String,
  );
}

Map<String, dynamic> _$ListEventTypesFilterToJson(
    ListEventTypesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$ListEventTypesFilterNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ListEventTypesFilterNameEnumMap = {
  ListEventTypesFilterName.resourceType: 'RESOURCE_TYPE',
  ListEventTypesFilterName.serviceName: 'SERVICE_NAME',
};

ListEventTypesResult _$ListEventTypesResultFromJson(Map<String, dynamic> json) {
  return ListEventTypesResult(
    eventTypes: (json['EventTypes'] as List)
        ?.map((e) => e == null
            ? null
            : EventTypeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListNotificationRulesFilterToJson(
    ListNotificationRulesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$ListNotificationRulesFilterNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ListNotificationRulesFilterNameEnumMap = {
  ListNotificationRulesFilterName.eventTypeId: 'EVENT_TYPE_ID',
  ListNotificationRulesFilterName.createdBy: 'CREATED_BY',
  ListNotificationRulesFilterName.resource: 'RESOURCE',
  ListNotificationRulesFilterName.targetAddress: 'TARGET_ADDRESS',
};

ListNotificationRulesResult _$ListNotificationRulesResultFromJson(
    Map<String, dynamic> json) {
  return ListNotificationRulesResult(
    nextToken: json['NextToken'] as String,
    notificationRules: (json['NotificationRules'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationRuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ListTargetsFilterToJson(ListTargetsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$ListTargetsFilterNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ListTargetsFilterNameEnumMap = {
  ListTargetsFilterName.targetType: 'TARGET_TYPE',
  ListTargetsFilterName.targetAddress: 'TARGET_ADDRESS',
  ListTargetsFilterName.targetStatus: 'TARGET_STATUS',
};

ListTargetsResult _$ListTargetsResultFromJson(Map<String, dynamic> json) {
  return ListTargetsResult(
    nextToken: json['NextToken'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) => e == null
            ? null
            : TargetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NotificationRuleSummary _$NotificationRuleSummaryFromJson(
    Map<String, dynamic> json) {
  return NotificationRuleSummary(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

SubscribeResult _$SubscribeResultFromJson(Map<String, dynamic> json) {
  return SubscribeResult(
    arn: json['Arn'] as String,
  );
}

TagResourceResult _$TagResourceResultFromJson(Map<String, dynamic> json) {
  return TagResourceResult(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetAddress', instance.targetAddress);
  writeNotNull('TargetType', instance.targetType);
  return val;
}

TargetSummary _$TargetSummaryFromJson(Map<String, dynamic> json) {
  return TargetSummary(
    targetAddress: json['TargetAddress'] as String,
    targetStatus:
        _$enumDecodeNullable(_$TargetStatusEnumMap, json['TargetStatus']),
    targetType: json['TargetType'] as String,
  );
}

const _$TargetStatusEnumMap = {
  TargetStatus.pending: 'PENDING',
  TargetStatus.active: 'ACTIVE',
  TargetStatus.unreachable: 'UNREACHABLE',
  TargetStatus.inactive: 'INACTIVE',
  TargetStatus.deactivated: 'DEACTIVATED',
};

UnsubscribeResult _$UnsubscribeResultFromJson(Map<String, dynamic> json) {
  return UnsubscribeResult(
    arn: json['Arn'] as String,
  );
}

UntagResourceResult _$UntagResourceResultFromJson(Map<String, dynamic> json) {
  return UntagResourceResult();
}

UpdateNotificationRuleResult _$UpdateNotificationRuleResultFromJson(
    Map<String, dynamic> json) {
  return UpdateNotificationRuleResult();
}
