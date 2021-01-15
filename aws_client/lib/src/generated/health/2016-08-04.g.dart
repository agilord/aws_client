// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-08-04.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffectedEntity _$AffectedEntityFromJson(Map<String, dynamic> json) {
  return AffectedEntity(
    awsAccountId: json['awsAccountId'] as String,
    entityArn: json['entityArn'] as String,
    entityUrl: json['entityUrl'] as String,
    entityValue: json['entityValue'] as String,
    eventArn: json['eventArn'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    statusCode:
        _$enumDecodeNullable(_$EntityStatusCodeEnumMap, json['statusCode']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

const _$EntityStatusCodeEnumMap = {
  EntityStatusCode.impaired: 'IMPAIRED',
  EntityStatusCode.unimpaired: 'UNIMPAIRED',
  EntityStatusCode.unknown: 'UNKNOWN',
};

Map<String, dynamic> _$DateTimeRangeToJson(DateTimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', const UnixDateTimeConverter().toJson(instance.from));
  writeNotNull('to', const UnixDateTimeConverter().toJson(instance.to));
  return val;
}

DescribeAffectedAccountsForOrganizationResponse
    _$DescribeAffectedAccountsForOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAffectedAccountsForOrganizationResponse(
    affectedAccounts:
        (json['affectedAccounts'] as List)?.map((e) => e as String)?.toList(),
    eventScopeCode:
        _$enumDecodeNullable(_$EventScopeCodeEnumMap, json['eventScopeCode']),
    nextToken: json['nextToken'] as String,
  );
}

const _$EventScopeCodeEnumMap = {
  EventScopeCode.public: 'PUBLIC',
  EventScopeCode.accountSpecific: 'ACCOUNT_SPECIFIC',
  EventScopeCode.none: 'NONE',
};

DescribeAffectedEntitiesForOrganizationResponse
    _$DescribeAffectedEntitiesForOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAffectedEntitiesForOrganizationResponse(
    entities: (json['entities'] as List)
        ?.map((e) => e == null
            ? null
            : AffectedEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedSet: (json['failedSet'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationAffectedEntitiesErrorItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeAffectedEntitiesResponse _$DescribeAffectedEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAffectedEntitiesResponse(
    entities: (json['entities'] as List)
        ?.map((e) => e == null
            ? null
            : AffectedEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeEntityAggregatesResponse _$DescribeEntityAggregatesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEntityAggregatesResponse(
    entityAggregates: (json['entityAggregates'] as List)
        ?.map((e) => e == null
            ? null
            : EntityAggregate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEventAggregatesResponse _$DescribeEventAggregatesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventAggregatesResponse(
    eventAggregates: (json['eventAggregates'] as List)
        ?.map((e) => e == null
            ? null
            : EventAggregate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeEventDetailsForOrganizationResponse
    _$DescribeEventDetailsForOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeEventDetailsForOrganizationResponse(
    failedSet: (json['failedSet'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationEventDetailsErrorItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    successfulSet: (json['successfulSet'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationEventDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEventDetailsResponse _$DescribeEventDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventDetailsResponse(
    failedSet: (json['failedSet'] as List)
        ?.map((e) => e == null
            ? null
            : EventDetailsErrorItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successfulSet: (json['successfulSet'] as List)
        ?.map((e) =>
            e == null ? null : EventDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEventTypesResponse _$DescribeEventTypesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventTypesResponse(
    eventTypes: (json['eventTypes'] as List)
        ?.map((e) =>
            e == null ? null : EventType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeEventsForOrganizationResponse
    _$DescribeEventsForOrganizationResponseFromJson(Map<String, dynamic> json) {
  return DescribeEventsForOrganizationResponse(
    events: (json['events'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeEventsResponse _$DescribeEventsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventsResponse(
    events: (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeHealthServiceStatusForOrganizationResponse
    _$DescribeHealthServiceStatusForOrganizationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeHealthServiceStatusForOrganizationResponse(
    healthServiceAccessStatusForOrganization:
        json['healthServiceAccessStatusForOrganization'] as String,
  );
}

EntityAggregate _$EntityAggregateFromJson(Map<String, dynamic> json) {
  return EntityAggregate(
    count: json['count'] as int,
    eventArn: json['eventArn'] as String,
  );
}

Map<String, dynamic> _$EntityFilterToJson(EntityFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventArns', instance.eventArns);
  writeNotNull('entityArns', instance.entityArns);
  writeNotNull('entityValues', instance.entityValues);
  writeNotNull('lastUpdatedTimes',
      instance.lastUpdatedTimes?.map((e) => e?.toJson())?.toList());
  writeNotNull('statusCodes',
      instance.statusCodes?.map((e) => _$EntityStatusCodeEnumMap[e])?.toList());
  writeNotNull('tags', instance.tags);
  return val;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    arn: json['arn'] as String,
    availabilityZone: json['availabilityZone'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    eventScopeCode:
        _$enumDecodeNullable(_$EventScopeCodeEnumMap, json['eventScopeCode']),
    eventTypeCategory: _$enumDecodeNullable(
        _$EventTypeCategoryEnumMap, json['eventTypeCategory']),
    eventTypeCode: json['eventTypeCode'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    region: json['region'] as String,
    service: json['service'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    statusCode:
        _$enumDecodeNullable(_$EventStatusCodeEnumMap, json['statusCode']),
  );
}

const _$EventTypeCategoryEnumMap = {
  EventTypeCategory.issue: 'issue',
  EventTypeCategory.accountNotification: 'accountNotification',
  EventTypeCategory.scheduledChange: 'scheduledChange',
  EventTypeCategory.investigation: 'investigation',
};

const _$EventStatusCodeEnumMap = {
  EventStatusCode.open: 'open',
  EventStatusCode.closed: 'closed',
  EventStatusCode.upcoming: 'upcoming',
};

Map<String, dynamic> _$EventAccountFilterToJson(EventAccountFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventArn', instance.eventArn);
  writeNotNull('awsAccountId', instance.awsAccountId);
  return val;
}

EventAggregate _$EventAggregateFromJson(Map<String, dynamic> json) {
  return EventAggregate(
    aggregateValue: json['aggregateValue'] as String,
    count: json['count'] as int,
  );
}

EventDescription _$EventDescriptionFromJson(Map<String, dynamic> json) {
  return EventDescription(
    latestDescription: json['latestDescription'] as String,
  );
}

EventDetails _$EventDetailsFromJson(Map<String, dynamic> json) {
  return EventDetails(
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    eventDescription: json['eventDescription'] == null
        ? null
        : EventDescription.fromJson(
            json['eventDescription'] as Map<String, dynamic>),
    eventMetadata: (json['eventMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EventDetailsErrorItem _$EventDetailsErrorItemFromJson(
    Map<String, dynamic> json) {
  return EventDetailsErrorItem(
    errorMessage: json['errorMessage'] as String,
    errorName: json['errorName'] as String,
    eventArn: json['eventArn'] as String,
  );
}

Map<String, dynamic> _$EventFilterToJson(EventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('availabilityZones', instance.availabilityZones);
  writeNotNull(
      'endTimes', instance.endTimes?.map((e) => e?.toJson())?.toList());
  writeNotNull('entityArns', instance.entityArns);
  writeNotNull('entityValues', instance.entityValues);
  writeNotNull('eventArns', instance.eventArns);
  writeNotNull(
      'eventStatusCodes',
      instance.eventStatusCodes
          ?.map((e) => _$EventStatusCodeEnumMap[e])
          ?.toList());
  writeNotNull(
      'eventTypeCategories',
      instance.eventTypeCategories
          ?.map((e) => _$EventTypeCategoryEnumMap[e])
          ?.toList());
  writeNotNull('eventTypeCodes', instance.eventTypeCodes);
  writeNotNull('lastUpdatedTimes',
      instance.lastUpdatedTimes?.map((e) => e?.toJson())?.toList());
  writeNotNull('regions', instance.regions);
  writeNotNull('services', instance.services);
  writeNotNull(
      'startTimes', instance.startTimes?.map((e) => e?.toJson())?.toList());
  writeNotNull('tags', instance.tags);
  return val;
}

EventType _$EventTypeFromJson(Map<String, dynamic> json) {
  return EventType(
    category:
        _$enumDecodeNullable(_$EventTypeCategoryEnumMap, json['category']),
    code: json['code'] as String,
    service: json['service'] as String,
  );
}

Map<String, dynamic> _$EventTypeFilterToJson(EventTypeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'eventTypeCategories',
      instance.eventTypeCategories
          ?.map((e) => _$EventTypeCategoryEnumMap[e])
          ?.toList());
  writeNotNull('eventTypeCodes', instance.eventTypeCodes);
  writeNotNull('services', instance.services);
  return val;
}

OrganizationAffectedEntitiesErrorItem
    _$OrganizationAffectedEntitiesErrorItemFromJson(Map<String, dynamic> json) {
  return OrganizationAffectedEntitiesErrorItem(
    awsAccountId: json['awsAccountId'] as String,
    errorMessage: json['errorMessage'] as String,
    errorName: json['errorName'] as String,
    eventArn: json['eventArn'] as String,
  );
}

OrganizationEvent _$OrganizationEventFromJson(Map<String, dynamic> json) {
  return OrganizationEvent(
    arn: json['arn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    eventScopeCode:
        _$enumDecodeNullable(_$EventScopeCodeEnumMap, json['eventScopeCode']),
    eventTypeCategory: _$enumDecodeNullable(
        _$EventTypeCategoryEnumMap, json['eventTypeCategory']),
    eventTypeCode: json['eventTypeCode'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTime']),
    region: json['region'] as String,
    service: json['service'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    statusCode:
        _$enumDecodeNullable(_$EventStatusCodeEnumMap, json['statusCode']),
  );
}

OrganizationEventDetails _$OrganizationEventDetailsFromJson(
    Map<String, dynamic> json) {
  return OrganizationEventDetails(
    awsAccountId: json['awsAccountId'] as String,
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    eventDescription: json['eventDescription'] == null
        ? null
        : EventDescription.fromJson(
            json['eventDescription'] as Map<String, dynamic>),
    eventMetadata: (json['eventMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

OrganizationEventDetailsErrorItem _$OrganizationEventDetailsErrorItemFromJson(
    Map<String, dynamic> json) {
  return OrganizationEventDetailsErrorItem(
    awsAccountId: json['awsAccountId'] as String,
    errorMessage: json['errorMessage'] as String,
    errorName: json['errorName'] as String,
    eventArn: json['eventArn'] as String,
  );
}

Map<String, dynamic> _$OrganizationEventFilterToJson(
    OrganizationEventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsAccountIds', instance.awsAccountIds);
  writeNotNull('endTime', instance.endTime?.toJson());
  writeNotNull('entityArns', instance.entityArns);
  writeNotNull('entityValues', instance.entityValues);
  writeNotNull(
      'eventStatusCodes',
      instance.eventStatusCodes
          ?.map((e) => _$EventStatusCodeEnumMap[e])
          ?.toList());
  writeNotNull(
      'eventTypeCategories',
      instance.eventTypeCategories
          ?.map((e) => _$EventTypeCategoryEnumMap[e])
          ?.toList());
  writeNotNull('eventTypeCodes', instance.eventTypeCodes);
  writeNotNull('lastUpdatedTime', instance.lastUpdatedTime?.toJson());
  writeNotNull('regions', instance.regions);
  writeNotNull('services', instance.services);
  writeNotNull('startTime', instance.startTime?.toJson());
  return val;
}
