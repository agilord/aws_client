// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2013-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTagsResponse _$AddTagsResponseFromJson(Map<String, dynamic> json) {
  return AddTagsResponse();
}

AdvancedEventSelector _$AdvancedEventSelectorFromJson(
    Map<String, dynamic> json) {
  return AdvancedEventSelector(
    fieldSelectors: (json['FieldSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : AdvancedFieldSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$AdvancedEventSelectorToJson(
    AdvancedEventSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldSelectors',
      instance.fieldSelectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('Name', instance.name);
  return val;
}

AdvancedFieldSelector _$AdvancedFieldSelectorFromJson(
    Map<String, dynamic> json) {
  return AdvancedFieldSelector(
    field: json['Field'] as String,
    endsWith: (json['EndsWith'] as List)?.map((e) => e as String)?.toList(),
    equals: (json['Equals'] as List)?.map((e) => e as String)?.toList(),
    notEndsWith:
        (json['NotEndsWith'] as List)?.map((e) => e as String)?.toList(),
    notEquals: (json['NotEquals'] as List)?.map((e) => e as String)?.toList(),
    notStartsWith:
        (json['NotStartsWith'] as List)?.map((e) => e as String)?.toList(),
    startsWith: (json['StartsWith'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AdvancedFieldSelectorToJson(
    AdvancedFieldSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Field', instance.field);
  writeNotNull('EndsWith', instance.endsWith);
  writeNotNull('Equals', instance.equals);
  writeNotNull('NotEndsWith', instance.notEndsWith);
  writeNotNull('NotEquals', instance.notEquals);
  writeNotNull('NotStartsWith', instance.notStartsWith);
  writeNotNull('StartsWith', instance.startsWith);
  return val;
}

CreateTrailResponse _$CreateTrailResponseFromJson(Map<String, dynamic> json) {
  return CreateTrailResponse(
    cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String,
    cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String,
    includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool,
    isMultiRegionTrail: json['IsMultiRegionTrail'] as bool,
    isOrganizationTrail: json['IsOrganizationTrail'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    logFileValidationEnabled: json['LogFileValidationEnabled'] as bool,
    name: json['Name'] as String,
    s3BucketName: json['S3BucketName'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
    snsTopicARN: json['SnsTopicARN'] as String,
    snsTopicName: json['SnsTopicName'] as String,
    trailARN: json['TrailARN'] as String,
  );
}

DataResource _$DataResourceFromJson(Map<String, dynamic> json) {
  return DataResource(
    type: json['Type'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DataResourceToJson(DataResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  writeNotNull('Values', instance.values);
  return val;
}

DeleteTrailResponse _$DeleteTrailResponseFromJson(Map<String, dynamic> json) {
  return DeleteTrailResponse();
}

DescribeTrailsResponse _$DescribeTrailsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrailsResponse(
    trailList: (json['trailList'] as List)
        ?.map(
            (e) => e == null ? null : Trail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    accessKeyId: json['AccessKeyId'] as String,
    cloudTrailEvent: json['CloudTrailEvent'] as String,
    eventId: json['EventId'] as String,
    eventName: json['EventName'] as String,
    eventSource: json['EventSource'] as String,
    eventTime: const UnixDateTimeConverter().fromJson(json['EventTime']),
    readOnly: json['ReadOnly'] as String,
    resources: (json['Resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    username: json['Username'] as String,
  );
}

EventSelector _$EventSelectorFromJson(Map<String, dynamic> json) {
  return EventSelector(
    dataResources: (json['DataResources'] as List)
        ?.map((e) =>
            e == null ? null : DataResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    excludeManagementEventSources:
        (json['ExcludeManagementEventSources'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    includeManagementEvents: json['IncludeManagementEvents'] as bool,
    readWriteType:
        _$enumDecodeNullable(_$ReadWriteTypeEnumMap, json['ReadWriteType']),
  );
}

Map<String, dynamic> _$EventSelectorToJson(EventSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataResources',
      instance.dataResources?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ExcludeManagementEventSources', instance.excludeManagementEventSources);
  writeNotNull('IncludeManagementEvents', instance.includeManagementEvents);
  writeNotNull('ReadWriteType', _$ReadWriteTypeEnumMap[instance.readWriteType]);
  return val;
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

const _$ReadWriteTypeEnumMap = {
  ReadWriteType.readOnly: 'ReadOnly',
  ReadWriteType.writeOnly: 'WriteOnly',
  ReadWriteType.all: 'All',
};

GetEventSelectorsResponse _$GetEventSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return GetEventSelectorsResponse(
    advancedEventSelectors: (json['AdvancedEventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    eventSelectors: (json['EventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : EventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

GetInsightSelectorsResponse _$GetInsightSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return GetInsightSelectorsResponse(
    insightSelectors: (json['InsightSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : InsightSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

GetTrailResponse _$GetTrailResponseFromJson(Map<String, dynamic> json) {
  return GetTrailResponse(
    trail: json['Trail'] == null
        ? null
        : Trail.fromJson(json['Trail'] as Map<String, dynamic>),
  );
}

GetTrailStatusResponse _$GetTrailStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetTrailStatusResponse(
    isLogging: json['IsLogging'] as bool,
    latestCloudWatchLogsDeliveryError:
        json['LatestCloudWatchLogsDeliveryError'] as String,
    latestCloudWatchLogsDeliveryTime: const UnixDateTimeConverter()
        .fromJson(json['LatestCloudWatchLogsDeliveryTime']),
    latestDeliveryAttemptSucceeded:
        json['LatestDeliveryAttemptSucceeded'] as String,
    latestDeliveryAttemptTime: json['LatestDeliveryAttemptTime'] as String,
    latestDeliveryError: json['LatestDeliveryError'] as String,
    latestDeliveryTime:
        const UnixDateTimeConverter().fromJson(json['LatestDeliveryTime']),
    latestDigestDeliveryError: json['LatestDigestDeliveryError'] as String,
    latestDigestDeliveryTime: const UnixDateTimeConverter()
        .fromJson(json['LatestDigestDeliveryTime']),
    latestNotificationAttemptSucceeded:
        json['LatestNotificationAttemptSucceeded'] as String,
    latestNotificationAttemptTime:
        json['LatestNotificationAttemptTime'] as String,
    latestNotificationError: json['LatestNotificationError'] as String,
    latestNotificationTime:
        const UnixDateTimeConverter().fromJson(json['LatestNotificationTime']),
    startLoggingTime:
        const UnixDateTimeConverter().fromJson(json['StartLoggingTime']),
    stopLoggingTime:
        const UnixDateTimeConverter().fromJson(json['StopLoggingTime']),
    timeLoggingStarted: json['TimeLoggingStarted'] as String,
    timeLoggingStopped: json['TimeLoggingStopped'] as String,
  );
}

InsightSelector _$InsightSelectorFromJson(Map<String, dynamic> json) {
  return InsightSelector(
    insightType:
        _$enumDecodeNullable(_$InsightTypeEnumMap, json['InsightType']),
  );
}

Map<String, dynamic> _$InsightSelectorToJson(InsightSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InsightType', _$InsightTypeEnumMap[instance.insightType]);
  return val;
}

const _$InsightTypeEnumMap = {
  InsightType.apiCallRateInsight: 'ApiCallRateInsight',
};

ListPublicKeysResponse _$ListPublicKeysResponseFromJson(
    Map<String, dynamic> json) {
  return ListPublicKeysResponse(
    nextToken: json['NextToken'] as String,
    publicKeyList: (json['PublicKeyList'] as List)
        ?.map((e) =>
            e == null ? null : PublicKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    nextToken: json['NextToken'] as String,
    resourceTagList: (json['ResourceTagList'] as List)
        ?.map((e) =>
            e == null ? null : ResourceTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTrailsResponse _$ListTrailsResponseFromJson(Map<String, dynamic> json) {
  return ListTrailsResponse(
    nextToken: json['NextToken'] as String,
    trails: (json['Trails'] as List)
        ?.map((e) =>
            e == null ? null : TrailInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LookupAttributeToJson(LookupAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AttributeKey', _$LookupAttributeKeyEnumMap[instance.attributeKey]);
  writeNotNull('AttributeValue', instance.attributeValue);
  return val;
}

const _$LookupAttributeKeyEnumMap = {
  LookupAttributeKey.eventId: 'EventId',
  LookupAttributeKey.eventName: 'EventName',
  LookupAttributeKey.readOnly: 'ReadOnly',
  LookupAttributeKey.username: 'Username',
  LookupAttributeKey.resourceType: 'ResourceType',
  LookupAttributeKey.resourceName: 'ResourceName',
  LookupAttributeKey.eventSource: 'EventSource',
  LookupAttributeKey.accessKeyId: 'AccessKeyId',
};

LookupEventsResponse _$LookupEventsResponseFromJson(Map<String, dynamic> json) {
  return LookupEventsResponse(
    events: (json['Events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

PublicKey _$PublicKeyFromJson(Map<String, dynamic> json) {
  return PublicKey(
    fingerprint: json['Fingerprint'] as String,
    validityEndTime:
        const UnixDateTimeConverter().fromJson(json['ValidityEndTime']),
    validityStartTime:
        const UnixDateTimeConverter().fromJson(json['ValidityStartTime']),
    value: const Uint8ListConverter().fromJson(json['Value'] as String),
  );
}

PutEventSelectorsResponse _$PutEventSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return PutEventSelectorsResponse(
    advancedEventSelectors: (json['AdvancedEventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    eventSelectors: (json['EventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : EventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

PutInsightSelectorsResponse _$PutInsightSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return PutInsightSelectorsResponse(
    insightSelectors: (json['InsightSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : InsightSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

RemoveTagsResponse _$RemoveTagsResponseFromJson(Map<String, dynamic> json) {
  return RemoveTagsResponse();
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    resourceName: json['ResourceName'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

ResourceTag _$ResourceTagFromJson(Map<String, dynamic> json) {
  return ResourceTag(
    resourceId: json['ResourceId'] as String,
    tagsList: (json['TagsList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StartLoggingResponse _$StartLoggingResponseFromJson(Map<String, dynamic> json) {
  return StartLoggingResponse();
}

StopLoggingResponse _$StopLoggingResponseFromJson(Map<String, dynamic> json) {
  return StopLoggingResponse();
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

Trail _$TrailFromJson(Map<String, dynamic> json) {
  return Trail(
    cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String,
    cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String,
    hasCustomEventSelectors: json['HasCustomEventSelectors'] as bool,
    hasInsightSelectors: json['HasInsightSelectors'] as bool,
    homeRegion: json['HomeRegion'] as String,
    includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool,
    isMultiRegionTrail: json['IsMultiRegionTrail'] as bool,
    isOrganizationTrail: json['IsOrganizationTrail'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    logFileValidationEnabled: json['LogFileValidationEnabled'] as bool,
    name: json['Name'] as String,
    s3BucketName: json['S3BucketName'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
    snsTopicARN: json['SnsTopicARN'] as String,
    snsTopicName: json['SnsTopicName'] as String,
    trailARN: json['TrailARN'] as String,
  );
}

TrailInfo _$TrailInfoFromJson(Map<String, dynamic> json) {
  return TrailInfo(
    homeRegion: json['HomeRegion'] as String,
    name: json['Name'] as String,
    trailARN: json['TrailARN'] as String,
  );
}

UpdateTrailResponse _$UpdateTrailResponseFromJson(Map<String, dynamic> json) {
  return UpdateTrailResponse(
    cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String,
    cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String,
    includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool,
    isMultiRegionTrail: json['IsMultiRegionTrail'] as bool,
    isOrganizationTrail: json['IsOrganizationTrail'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    logFileValidationEnabled: json['LogFileValidationEnabled'] as bool,
    name: json['Name'] as String,
    s3BucketName: json['S3BucketName'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
    snsTopicARN: json['SnsTopicARN'] as String,
    snsTopicName: json['SnsTopicName'] as String,
    trailARN: json['TrailARN'] as String,
  );
}
