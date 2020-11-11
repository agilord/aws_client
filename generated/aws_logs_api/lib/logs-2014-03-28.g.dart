// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs-2014-03-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateKmsKeyRequestToJson(
    AssociateKmsKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kmsKeyId', instance.kmsKeyId);
  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

Map<String, dynamic> _$CancelExportTaskRequestToJson(
    CancelExportTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taskId', instance.taskId);
  return val;
}

Map<String, dynamic> _$CreateExportTaskRequestToJson(
    CreateExportTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination);
  writeNotNull('from', instance.from);
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('to', instance.to);
  writeNotNull('destinationPrefix', instance.destinationPrefix);
  writeNotNull('logStreamNamePrefix', instance.logStreamNamePrefix);
  writeNotNull('taskName', instance.taskName);
  return val;
}

CreateExportTaskResponse _$CreateExportTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CreateExportTaskResponse(
    taskId: json['taskId'] as String,
  );
}

Map<String, dynamic> _$CreateLogGroupRequestToJson(
    CreateLogGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('kmsKeyId', instance.kmsKeyId);
  writeNotNull('tags', instance.tags);
  return val;
}

Map<String, dynamic> _$CreateLogStreamRequestToJson(
    CreateLogStreamRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logStreamName', instance.logStreamName);
  return val;
}

Map<String, dynamic> _$DeleteDestinationRequestToJson(
    DeleteDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationName', instance.destinationName);
  return val;
}

Map<String, dynamic> _$DeleteLogGroupRequestToJson(
    DeleteLogGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

Map<String, dynamic> _$DeleteLogStreamRequestToJson(
    DeleteLogStreamRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logStreamName', instance.logStreamName);
  return val;
}

Map<String, dynamic> _$DeleteMetricFilterRequestToJson(
    DeleteMetricFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filterName', instance.filterName);
  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

Map<String, dynamic> _$DeleteResourcePolicyRequestToJson(
    DeleteResourcePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('policyName', instance.policyName);
  return val;
}

Map<String, dynamic> _$DeleteRetentionPolicyRequestToJson(
    DeleteRetentionPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

Map<String, dynamic> _$DeleteSubscriptionFilterRequestToJson(
    DeleteSubscriptionFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filterName', instance.filterName);
  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

Map<String, dynamic> _$DescribeDestinationsRequestToJson(
    DescribeDestinationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationNamePrefix', instance.destinationNamePrefix);
  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeDestinationsResponse _$DescribeDestinationsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDestinationsResponse(
    destinations: (json['destinations'] as List)
        ?.map((e) =>
            e == null ? null : Destination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeExportTasksRequestToJson(
    DescribeExportTasksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull(
      'statusCode', _$ExportTaskStatusCodeEnumMap[instance.statusCode]);
  writeNotNull('taskId', instance.taskId);
  return val;
}

const _$ExportTaskStatusCodeEnumMap = {
  ExportTaskStatusCode.cancelled: 'CANCELLED',
  ExportTaskStatusCode.completed: 'COMPLETED',
  ExportTaskStatusCode.failed: 'FAILED',
  ExportTaskStatusCode.pending: 'PENDING',
  ExportTaskStatusCode.pendingCancel: 'PENDING_CANCEL',
  ExportTaskStatusCode.running: 'RUNNING',
};

DescribeExportTasksResponse _$DescribeExportTasksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeExportTasksResponse(
    exportTasks: (json['exportTasks'] as List)
        ?.map((e) =>
            e == null ? null : ExportTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeLogGroupsRequestToJson(
    DescribeLogGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('logGroupNamePrefix', instance.logGroupNamePrefix);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeLogGroupsResponse _$DescribeLogGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLogGroupsResponse(
    logGroups: (json['logGroups'] as List)
        ?.map((e) =>
            e == null ? null : LogGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeLogStreamsRequestToJson(
    DescribeLogStreamsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('descending', instance.descending);
  writeNotNull('limit', instance.limit);
  writeNotNull('logStreamNamePrefix', instance.logStreamNamePrefix);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$OrderByEnumMap = {
  OrderBy.logStreamName: 'LogStreamName',
  OrderBy.lastEventTime: 'LastEventTime',
};

DescribeLogStreamsResponse _$DescribeLogStreamsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLogStreamsResponse(
    logStreams: (json['logStreams'] as List)
        ?.map((e) =>
            e == null ? null : LogStream.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeMetricFiltersRequestToJson(
    DescribeMetricFiltersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filterNamePrefix', instance.filterNamePrefix);
  writeNotNull('limit', instance.limit);
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('metricName', instance.metricName);
  writeNotNull('metricNamespace', instance.metricNamespace);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeMetricFiltersResponse _$DescribeMetricFiltersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMetricFiltersResponse(
    metricFilters: (json['metricFilters'] as List)
        ?.map((e) =>
            e == null ? null : MetricFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeQueriesRequestToJson(
    DescribeQueriesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('status', _$QueryStatusEnumMap[instance.status]);
  return val;
}

const _$QueryStatusEnumMap = {
  QueryStatus.scheduled: 'Scheduled',
  QueryStatus.running: 'Running',
  QueryStatus.complete: 'Complete',
  QueryStatus.failed: 'Failed',
  QueryStatus.cancelled: 'Cancelled',
};

DescribeQueriesResponse _$DescribeQueriesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeQueriesResponse(
    nextToken: json['nextToken'] as String,
    queries: (json['queries'] as List)
        ?.map((e) =>
            e == null ? null : QueryInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeResourcePoliciesRequestToJson(
    DescribeResourcePoliciesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeResourcePoliciesResponse _$DescribeResourcePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourcePoliciesResponse(
    nextToken: json['nextToken'] as String,
    resourcePolicies: (json['resourcePolicies'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeSubscriptionFiltersRequestToJson(
    DescribeSubscriptionFiltersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('filterNamePrefix', instance.filterNamePrefix);
  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeSubscriptionFiltersResponse
    _$DescribeSubscriptionFiltersResponseFromJson(Map<String, dynamic> json) {
  return DescribeSubscriptionFiltersResponse(
    nextToken: json['nextToken'] as String,
    subscriptionFilters: (json['subscriptionFilters'] as List)
        ?.map((e) => e == null
            ? null
            : SubscriptionFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return Destination(
    accessPolicy: json['accessPolicy'] as String,
    arn: json['arn'] as String,
    creationTime: json['creationTime'] as int,
    destinationName: json['destinationName'] as String,
    roleArn: json['roleArn'] as String,
    targetArn: json['targetArn'] as String,
  );
}

Map<String, dynamic> _$DisassociateKmsKeyRequestToJson(
    DisassociateKmsKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

ExportTask _$ExportTaskFromJson(Map<String, dynamic> json) {
  return ExportTask(
    destination: json['destination'] as String,
    destinationPrefix: json['destinationPrefix'] as String,
    executionInfo: json['executionInfo'] == null
        ? null
        : ExportTaskExecutionInfo.fromJson(
            json['executionInfo'] as Map<String, dynamic>),
    from: json['from'] as int,
    logGroupName: json['logGroupName'] as String,
    status: json['status'] == null
        ? null
        : ExportTaskStatus.fromJson(json['status'] as Map<String, dynamic>),
    taskId: json['taskId'] as String,
    taskName: json['taskName'] as String,
    to: json['to'] as int,
  );
}

ExportTaskExecutionInfo _$ExportTaskExecutionInfoFromJson(
    Map<String, dynamic> json) {
  return ExportTaskExecutionInfo(
    completionTime: json['completionTime'] as int,
    creationTime: json['creationTime'] as int,
  );
}

ExportTaskStatus _$ExportTaskStatusFromJson(Map<String, dynamic> json) {
  return ExportTaskStatus(
    code: _$enumDecodeNullable(_$ExportTaskStatusCodeEnumMap, json['code']),
    message: json['message'] as String,
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

Map<String, dynamic> _$FilterLogEventsRequestToJson(
    FilterLogEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('filterPattern', instance.filterPattern);
  writeNotNull('interleaved', instance.interleaved);
  writeNotNull('limit', instance.limit);
  writeNotNull('logStreamNamePrefix', instance.logStreamNamePrefix);
  writeNotNull('logStreamNames', instance.logStreamNames);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('startTime', instance.startTime);
  return val;
}

FilterLogEventsResponse _$FilterLogEventsResponseFromJson(
    Map<String, dynamic> json) {
  return FilterLogEventsResponse(
    events: (json['events'] as List)
        ?.map((e) => e == null
            ? null
            : FilteredLogEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    searchedLogStreams: (json['searchedLogStreams'] as List)
        ?.map((e) => e == null
            ? null
            : SearchedLogStream.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FilteredLogEvent _$FilteredLogEventFromJson(Map<String, dynamic> json) {
  return FilteredLogEvent(
    eventId: json['eventId'] as String,
    ingestionTime: json['ingestionTime'] as int,
    logStreamName: json['logStreamName'] as String,
    message: json['message'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$GetLogEventsRequestToJson(GetLogEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logStreamName', instance.logStreamName);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('startFromHead', instance.startFromHead);
  writeNotNull('startTime', instance.startTime);
  return val;
}

GetLogEventsResponse _$GetLogEventsResponseFromJson(Map<String, dynamic> json) {
  return GetLogEventsResponse(
    events: (json['events'] as List)
        ?.map((e) => e == null
            ? null
            : OutputLogEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextBackwardToken: json['nextBackwardToken'] as String,
    nextForwardToken: json['nextForwardToken'] as String,
  );
}

Map<String, dynamic> _$GetLogGroupFieldsRequestToJson(
    GetLogGroupFieldsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('time', instance.time);
  return val;
}

GetLogGroupFieldsResponse _$GetLogGroupFieldsResponseFromJson(
    Map<String, dynamic> json) {
  return GetLogGroupFieldsResponse(
    logGroupFields: (json['logGroupFields'] as List)
        ?.map((e) => e == null
            ? null
            : LogGroupField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetLogRecordRequestToJson(GetLogRecordRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logRecordPointer', instance.logRecordPointer);
  return val;
}

GetLogRecordResponse _$GetLogRecordResponseFromJson(Map<String, dynamic> json) {
  return GetLogRecordResponse(
    logRecord: (json['logRecord'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$GetQueryResultsRequestToJson(
    GetQueryResultsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('queryId', instance.queryId);
  return val;
}

GetQueryResultsResponse _$GetQueryResultsResponseFromJson(
    Map<String, dynamic> json) {
  return GetQueryResultsResponse(
    results: (json['results'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : ResultField.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
    statistics: json['statistics'] == null
        ? null
        : QueryStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$QueryStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$InputLogEventToJson(InputLogEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('timestamp', instance.timestamp);
  return val;
}

Map<String, dynamic> _$ListTagsLogGroupRequestToJson(
    ListTagsLogGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

ListTagsLogGroupResponse _$ListTagsLogGroupResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsLogGroupResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LogGroup _$LogGroupFromJson(Map<String, dynamic> json) {
  return LogGroup(
    arn: json['arn'] as String,
    creationTime: json['creationTime'] as int,
    kmsKeyId: json['kmsKeyId'] as String,
    logGroupName: json['logGroupName'] as String,
    metricFilterCount: json['metricFilterCount'] as int,
    retentionInDays: json['retentionInDays'] as int,
    storedBytes: json['storedBytes'] as int,
  );
}

LogGroupField _$LogGroupFieldFromJson(Map<String, dynamic> json) {
  return LogGroupField(
    name: json['name'] as String,
    percent: json['percent'] as int,
  );
}

LogStream _$LogStreamFromJson(Map<String, dynamic> json) {
  return LogStream(
    arn: json['arn'] as String,
    creationTime: json['creationTime'] as int,
    firstEventTimestamp: json['firstEventTimestamp'] as int,
    lastEventTimestamp: json['lastEventTimestamp'] as int,
    lastIngestionTime: json['lastIngestionTime'] as int,
    logStreamName: json['logStreamName'] as String,
    storedBytes: json['storedBytes'] as int,
    uploadSequenceToken: json['uploadSequenceToken'] as String,
  );
}

MetricFilter _$MetricFilterFromJson(Map<String, dynamic> json) {
  return MetricFilter(
    creationTime: json['creationTime'] as int,
    filterName: json['filterName'] as String,
    filterPattern: json['filterPattern'] as String,
    logGroupName: json['logGroupName'] as String,
    metricTransformations: (json['metricTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : MetricTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricFilterMatchRecord _$MetricFilterMatchRecordFromJson(
    Map<String, dynamic> json) {
  return MetricFilterMatchRecord(
    eventMessage: json['eventMessage'] as String,
    eventNumber: json['eventNumber'] as int,
    extractedValues: (json['extractedValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

MetricTransformation _$MetricTransformationFromJson(Map<String, dynamic> json) {
  return MetricTransformation(
    metricName: json['metricName'] as String,
    metricNamespace: json['metricNamespace'] as String,
    metricValue: json['metricValue'] as String,
    defaultValue: (json['defaultValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MetricTransformationToJson(
    MetricTransformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metricName', instance.metricName);
  writeNotNull('metricNamespace', instance.metricNamespace);
  writeNotNull('metricValue', instance.metricValue);
  writeNotNull('defaultValue', instance.defaultValue);
  return val;
}

OutputLogEvent _$OutputLogEventFromJson(Map<String, dynamic> json) {
  return OutputLogEvent(
    ingestionTime: json['ingestionTime'] as int,
    message: json['message'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$PutDestinationPolicyRequestToJson(
    PutDestinationPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessPolicy', instance.accessPolicy);
  writeNotNull('destinationName', instance.destinationName);
  return val;
}

Map<String, dynamic> _$PutDestinationRequestToJson(
    PutDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationName', instance.destinationName);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('targetArn', instance.targetArn);
  return val;
}

PutDestinationResponse _$PutDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return PutDestinationResponse(
    destination: json['destination'] == null
        ? null
        : Destination.fromJson(json['destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutLogEventsRequestToJson(PutLogEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'logEvents', instance.logEvents?.map((e) => e?.toJson())?.toList());
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logStreamName', instance.logStreamName);
  writeNotNull('sequenceToken', instance.sequenceToken);
  return val;
}

PutLogEventsResponse _$PutLogEventsResponseFromJson(Map<String, dynamic> json) {
  return PutLogEventsResponse(
    nextSequenceToken: json['nextSequenceToken'] as String,
    rejectedLogEventsInfo: json['rejectedLogEventsInfo'] == null
        ? null
        : RejectedLogEventsInfo.fromJson(
            json['rejectedLogEventsInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutMetricFilterRequestToJson(
    PutMetricFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filterName', instance.filterName);
  writeNotNull('filterPattern', instance.filterPattern);
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('metricTransformations',
      instance.metricTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$PutResourcePolicyRequestToJson(
    PutResourcePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('policyDocument', instance.policyDocument);
  writeNotNull('policyName', instance.policyName);
  return val;
}

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse(
    resourcePolicy: json['resourcePolicy'] == null
        ? null
        : ResourcePolicy.fromJson(
            json['resourcePolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutRetentionPolicyRequestToJson(
    PutRetentionPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('retentionInDays', instance.retentionInDays);
  return val;
}

Map<String, dynamic> _$PutSubscriptionFilterRequestToJson(
    PutSubscriptionFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationArn', instance.destinationArn);
  writeNotNull('filterName', instance.filterName);
  writeNotNull('filterPattern', instance.filterPattern);
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('distribution', _$DistributionEnumMap[instance.distribution]);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

const _$DistributionEnumMap = {
  Distribution.random: 'Random',
  Distribution.byLogStream: 'ByLogStream',
};

QueryInfo _$QueryInfoFromJson(Map<String, dynamic> json) {
  return QueryInfo(
    createTime: json['createTime'] as int,
    logGroupName: json['logGroupName'] as String,
    queryId: json['queryId'] as String,
    queryString: json['queryString'] as String,
    status: _$enumDecodeNullable(_$QueryStatusEnumMap, json['status']),
  );
}

QueryStatistics _$QueryStatisticsFromJson(Map<String, dynamic> json) {
  return QueryStatistics(
    bytesScanned: (json['bytesScanned'] as num)?.toDouble(),
    recordsMatched: (json['recordsMatched'] as num)?.toDouble(),
    recordsScanned: (json['recordsScanned'] as num)?.toDouble(),
  );
}

RejectedLogEventsInfo _$RejectedLogEventsInfoFromJson(
    Map<String, dynamic> json) {
  return RejectedLogEventsInfo(
    expiredLogEventEndIndex: json['expiredLogEventEndIndex'] as int,
    tooNewLogEventStartIndex: json['tooNewLogEventStartIndex'] as int,
    tooOldLogEventEndIndex: json['tooOldLogEventEndIndex'] as int,
  );
}

ResourcePolicy _$ResourcePolicyFromJson(Map<String, dynamic> json) {
  return ResourcePolicy(
    lastUpdatedTime: json['lastUpdatedTime'] as int,
    policyDocument: json['policyDocument'] as String,
    policyName: json['policyName'] as String,
  );
}

ResultField _$ResultFieldFromJson(Map<String, dynamic> json) {
  return ResultField(
    field: json['field'] as String,
    value: json['value'] as String,
  );
}

SearchedLogStream _$SearchedLogStreamFromJson(Map<String, dynamic> json) {
  return SearchedLogStream(
    logStreamName: json['logStreamName'] as String,
    searchedCompletely: json['searchedCompletely'] as bool,
  );
}

Map<String, dynamic> _$StartQueryRequestToJson(StartQueryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endTime', instance.endTime);
  writeNotNull('queryString', instance.queryString);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('limit', instance.limit);
  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('logGroupNames', instance.logGroupNames);
  return val;
}

StartQueryResponse _$StartQueryResponseFromJson(Map<String, dynamic> json) {
  return StartQueryResponse(
    queryId: json['queryId'] as String,
  );
}

Map<String, dynamic> _$StopQueryRequestToJson(StopQueryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('queryId', instance.queryId);
  return val;
}

StopQueryResponse _$StopQueryResponseFromJson(Map<String, dynamic> json) {
  return StopQueryResponse(
    success: json['success'] as bool,
  );
}

SubscriptionFilter _$SubscriptionFilterFromJson(Map<String, dynamic> json) {
  return SubscriptionFilter(
    creationTime: json['creationTime'] as int,
    destinationArn: json['destinationArn'] as String,
    distribution:
        _$enumDecodeNullable(_$DistributionEnumMap, json['distribution']),
    filterName: json['filterName'] as String,
    filterPattern: json['filterPattern'] as String,
    logGroupName: json['logGroupName'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$TagLogGroupRequestToJson(TagLogGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('tags', instance.tags);
  return val;
}

Map<String, dynamic> _$TestMetricFilterRequestToJson(
    TestMetricFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filterPattern', instance.filterPattern);
  writeNotNull('logEventMessages', instance.logEventMessages);
  return val;
}

TestMetricFilterResponse _$TestMetricFilterResponseFromJson(
    Map<String, dynamic> json) {
  return TestMetricFilterResponse(
    matches: (json['matches'] as List)
        ?.map((e) => e == null
            ? null
            : MetricFilterMatchRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UntagLogGroupRequestToJson(
    UntagLogGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('tags', instance.tags);
  return val;
}
