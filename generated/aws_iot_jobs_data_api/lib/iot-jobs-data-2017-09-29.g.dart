// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot-jobs-data-2017-09-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescribeJobExecutionResponse _$DescribeJobExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJobExecutionResponse(
    execution: json['execution'] == null
        ? null
        : JobExecution.fromJson(json['execution'] as Map<String, dynamic>),
  );
}

GetPendingJobExecutionsResponse _$GetPendingJobExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetPendingJobExecutionsResponse(
    inProgressJobs: (json['inProgressJobs'] as List<dynamic>?)
        ?.map((e) => JobExecutionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    queuedJobs: (json['queuedJobs'] as List<dynamic>?)
        ?.map((e) => JobExecutionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

JobExecution _$JobExecutionFromJson(Map<String, dynamic> json) {
  return JobExecution(
    approximateSecondsBeforeTimedOut:
        json['approximateSecondsBeforeTimedOut'] as int?,
    executionNumber: json['executionNumber'] as int?,
    jobDocument: json['jobDocument'] as String?,
    jobId: json['jobId'] as String?,
    lastUpdatedAt: json['lastUpdatedAt'] as int?,
    queuedAt: json['queuedAt'] as int?,
    startedAt: json['startedAt'] as int?,
    status: _$enumDecodeNullable(_$JobExecutionStatusEnumMap, json['status']),
    statusDetails: (json['statusDetails'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    thingName: json['thingName'] as String?,
    versionNumber: json['versionNumber'] as int?,
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

const _$JobExecutionStatusEnumMap = {
  JobExecutionStatus.queued: 'QUEUED',
  JobExecutionStatus.inProgress: 'IN_PROGRESS',
  JobExecutionStatus.succeeded: 'SUCCEEDED',
  JobExecutionStatus.failed: 'FAILED',
  JobExecutionStatus.timedOut: 'TIMED_OUT',
  JobExecutionStatus.rejected: 'REJECTED',
  JobExecutionStatus.removed: 'REMOVED',
  JobExecutionStatus.canceled: 'CANCELED',
};

JobExecutionState _$JobExecutionStateFromJson(Map<String, dynamic> json) {
  return JobExecutionState(
    status: _$enumDecodeNullable(_$JobExecutionStatusEnumMap, json['status']),
    statusDetails: (json['statusDetails'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    versionNumber: json['versionNumber'] as int?,
  );
}

JobExecutionSummary _$JobExecutionSummaryFromJson(Map<String, dynamic> json) {
  return JobExecutionSummary(
    executionNumber: json['executionNumber'] as int?,
    jobId: json['jobId'] as String?,
    lastUpdatedAt: json['lastUpdatedAt'] as int?,
    queuedAt: json['queuedAt'] as int?,
    startedAt: json['startedAt'] as int?,
    versionNumber: json['versionNumber'] as int?,
  );
}

StartNextPendingJobExecutionResponse
    _$StartNextPendingJobExecutionResponseFromJson(Map<String, dynamic> json) {
  return StartNextPendingJobExecutionResponse(
    execution: json['execution'] == null
        ? null
        : JobExecution.fromJson(json['execution'] as Map<String, dynamic>),
  );
}

UpdateJobExecutionResponse _$UpdateJobExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateJobExecutionResponse(
    executionState: json['executionState'] == null
        ? null
        : JobExecutionState.fromJson(
            json['executionState'] as Map<String, dynamic>),
    jobDocument: json['jobDocument'] as String?,
  );
}
