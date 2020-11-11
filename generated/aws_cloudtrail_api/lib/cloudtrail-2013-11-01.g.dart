// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudtrail-2013-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddTagsRequestToJson(AddTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull(
      'TagsList', instance.tagsList?.map((e) => e?.toJson())?.toList());
  return val;
}

AddTagsResponse _$AddTagsResponseFromJson(Map<String, dynamic> json) {
  return AddTagsResponse();
}

Map<String, dynamic> _$CreateTrailRequestToJson(CreateTrailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('CloudWatchLogsLogGroupArn', instance.cloudWatchLogsLogGroupArn);
  writeNotNull('CloudWatchLogsRoleArn', instance.cloudWatchLogsRoleArn);
  writeNotNull('EnableLogFileValidation', instance.enableLogFileValidation);
  writeNotNull(
      'IncludeGlobalServiceEvents', instance.includeGlobalServiceEvents);
  writeNotNull('IsMultiRegionTrail', instance.isMultiRegionTrail);
  writeNotNull('IsOrganizationTrail', instance.isOrganizationTrail);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('S3KeyPrefix', instance.s3KeyPrefix);
  writeNotNull('SnsTopicName', instance.snsTopicName);
  writeNotNull(
      'TagsList', instance.tagsList?.map((e) => e?.toJson())?.toList());
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

Map<String, dynamic> _$DeleteTrailRequestToJson(DeleteTrailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteTrailResponse _$DeleteTrailResponseFromJson(Map<String, dynamic> json) {
  return DeleteTrailResponse();
}

Map<String, dynamic> _$DescribeTrailsRequestToJson(
    DescribeTrailsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('includeShadowTrails', instance.includeShadowTrails);
  writeNotNull('trailNameList', instance.trailNameList);
  return val;
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
    eventTime: unixTimestampFromJson(json['EventTime']),
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

Map<String, dynamic> _$GetEventSelectorsRequestToJson(
    GetEventSelectorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrailName', instance.trailName);
  return val;
}

GetEventSelectorsResponse _$GetEventSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return GetEventSelectorsResponse(
    eventSelectors: (json['EventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : EventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

Map<String, dynamic> _$GetInsightSelectorsRequestToJson(
    GetInsightSelectorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrailName', instance.trailName);
  return val;
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

Map<String, dynamic> _$GetTrailRequestToJson(GetTrailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

GetTrailResponse _$GetTrailResponseFromJson(Map<String, dynamic> json) {
  return GetTrailResponse(
    trail: json['Trail'] == null
        ? null
        : Trail.fromJson(json['Trail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetTrailStatusRequestToJson(
    GetTrailStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

GetTrailStatusResponse _$GetTrailStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetTrailStatusResponse(
    isLogging: json['IsLogging'] as bool,
    latestCloudWatchLogsDeliveryError:
        json['LatestCloudWatchLogsDeliveryError'] as String,
    latestCloudWatchLogsDeliveryTime:
        unixTimestampFromJson(json['LatestCloudWatchLogsDeliveryTime']),
    latestDeliveryAttemptSucceeded:
        json['LatestDeliveryAttemptSucceeded'] as String,
    latestDeliveryAttemptTime: json['LatestDeliveryAttemptTime'] as String,
    latestDeliveryError: json['LatestDeliveryError'] as String,
    latestDeliveryTime: unixTimestampFromJson(json['LatestDeliveryTime']),
    latestDigestDeliveryError: json['LatestDigestDeliveryError'] as String,
    latestDigestDeliveryTime:
        unixTimestampFromJson(json['LatestDigestDeliveryTime']),
    latestNotificationAttemptSucceeded:
        json['LatestNotificationAttemptSucceeded'] as String,
    latestNotificationAttemptTime:
        json['LatestNotificationAttemptTime'] as String,
    latestNotificationError: json['LatestNotificationError'] as String,
    latestNotificationTime:
        unixTimestampFromJson(json['LatestNotificationTime']),
    startLoggingTime: unixTimestampFromJson(json['StartLoggingTime']),
    stopLoggingTime: unixTimestampFromJson(json['StopLoggingTime']),
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

Map<String, dynamic> _$ListPublicKeysRequestToJson(
    ListPublicKeysRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}

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

Map<String, dynamic> _$ListTagsRequestToJson(ListTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceIdList', instance.resourceIdList);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListTrailsRequestToJson(ListTrailsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$LookupEventsRequestToJson(LookupEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('EventCategory', _$EventCategoryEnumMap[instance.eventCategory]);
  writeNotNull('LookupAttributes',
      instance.lookupAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}

const _$EventCategoryEnumMap = {
  EventCategory.insight: 'insight',
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
    validityEndTime: unixTimestampFromJson(json['ValidityEndTime']),
    validityStartTime: unixTimestampFromJson(json['ValidityStartTime']),
    value: const Uint8ListConverter().fromJson(json['Value'] as String),
  );
}

Map<String, dynamic> _$PutEventSelectorsRequestToJson(
    PutEventSelectorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventSelectors',
      instance.eventSelectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('TrailName', instance.trailName);
  return val;
}

PutEventSelectorsResponse _$PutEventSelectorsResponseFromJson(
    Map<String, dynamic> json) {
  return PutEventSelectorsResponse(
    eventSelectors: (json['EventSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : EventSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailARN: json['TrailARN'] as String,
  );
}

Map<String, dynamic> _$PutInsightSelectorsRequestToJson(
    PutInsightSelectorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InsightSelectors',
      instance.insightSelectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('TrailName', instance.trailName);
  return val;
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

Map<String, dynamic> _$RemoveTagsRequestToJson(RemoveTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull(
      'TagsList', instance.tagsList?.map((e) => e?.toJson())?.toList());
  return val;
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

Map<String, dynamic> _$StartLoggingRequestToJson(StartLoggingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

StartLoggingResponse _$StartLoggingResponseFromJson(Map<String, dynamic> json) {
  return StartLoggingResponse();
}

Map<String, dynamic> _$StopLoggingRequestToJson(StopLoggingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
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

Map<String, dynamic> _$UpdateTrailRequestToJson(UpdateTrailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('CloudWatchLogsLogGroupArn', instance.cloudWatchLogsLogGroupArn);
  writeNotNull('CloudWatchLogsRoleArn', instance.cloudWatchLogsRoleArn);
  writeNotNull('EnableLogFileValidation', instance.enableLogFileValidation);
  writeNotNull(
      'IncludeGlobalServiceEvents', instance.includeGlobalServiceEvents);
  writeNotNull('IsMultiRegionTrail', instance.isMultiRegionTrail);
  writeNotNull('IsOrganizationTrail', instance.isOrganizationTrail);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3KeyPrefix', instance.s3KeyPrefix);
  writeNotNull('SnsTopicName', instance.snsTopicName);
  return val;
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
