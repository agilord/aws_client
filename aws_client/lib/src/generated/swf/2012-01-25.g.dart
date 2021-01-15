// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-01-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTask _$ActivityTaskFromJson(Map<String, dynamic> json) {
  return ActivityTask(
    activityId: json['activityId'] as String,
    activityType: json['activityType'] == null
        ? null
        : ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
    startedEventId: json['startedEventId'] as int,
    taskToken: json['taskToken'] as String,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    input: json['input'] as String,
  );
}

ActivityTaskCancelRequestedEventAttributes
    _$ActivityTaskCancelRequestedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ActivityTaskCancelRequestedEventAttributes(
    activityId: json['activityId'] as String,
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

ActivityTaskCanceledEventAttributes
    _$ActivityTaskCanceledEventAttributesFromJson(Map<String, dynamic> json) {
  return ActivityTaskCanceledEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    details: json['details'] as String,
    latestCancelRequestedEventId: json['latestCancelRequestedEventId'] as int,
  );
}

ActivityTaskCompletedEventAttributes
    _$ActivityTaskCompletedEventAttributesFromJson(Map<String, dynamic> json) {
  return ActivityTaskCompletedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    result: json['result'] as String,
  );
}

ActivityTaskFailedEventAttributes _$ActivityTaskFailedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return ActivityTaskFailedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    details: json['details'] as String,
    reason: json['reason'] as String,
  );
}

ActivityTaskScheduledEventAttributes
    _$ActivityTaskScheduledEventAttributesFromJson(Map<String, dynamic> json) {
  return ActivityTaskScheduledEventAttributes(
    activityId: json['activityId'] as String,
    activityType: json['activityType'] == null
        ? null
        : ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    control: json['control'] as String,
    heartbeatTimeout: json['heartbeatTimeout'] as String,
    input: json['input'] as String,
    scheduleToCloseTimeout: json['scheduleToCloseTimeout'] as String,
    scheduleToStartTimeout: json['scheduleToStartTimeout'] as String,
    startToCloseTimeout: json['startToCloseTimeout'] as String,
    taskPriority: json['taskPriority'] as String,
  );
}

ActivityTaskStartedEventAttributes _$ActivityTaskStartedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return ActivityTaskStartedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    identity: json['identity'] as String,
  );
}

ActivityTaskStatus _$ActivityTaskStatusFromJson(Map<String, dynamic> json) {
  return ActivityTaskStatus(
    cancelRequested: json['cancelRequested'] as bool,
  );
}

ActivityTaskTimedOutEventAttributes
    _$ActivityTaskTimedOutEventAttributesFromJson(Map<String, dynamic> json) {
  return ActivityTaskTimedOutEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    timeoutType: _$enumDecodeNullable(
        _$ActivityTaskTimeoutTypeEnumMap, json['timeoutType']),
    details: json['details'] as String,
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

const _$ActivityTaskTimeoutTypeEnumMap = {
  ActivityTaskTimeoutType.startToClose: 'START_TO_CLOSE',
  ActivityTaskTimeoutType.scheduleToStart: 'SCHEDULE_TO_START',
  ActivityTaskTimeoutType.scheduleToClose: 'SCHEDULE_TO_CLOSE',
  ActivityTaskTimeoutType.heartbeat: 'HEARTBEAT',
};

ActivityType _$ActivityTypeFromJson(Map<String, dynamic> json) {
  return ActivityType(
    name: json['name'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$ActivityTypeToJson(ActivityType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  return val;
}

ActivityTypeConfiguration _$ActivityTypeConfigurationFromJson(
    Map<String, dynamic> json) {
  return ActivityTypeConfiguration(
    defaultTaskHeartbeatTimeout: json['defaultTaskHeartbeatTimeout'] as String,
    defaultTaskList: json['defaultTaskList'] == null
        ? null
        : TaskList.fromJson(json['defaultTaskList'] as Map<String, dynamic>),
    defaultTaskPriority: json['defaultTaskPriority'] as String,
    defaultTaskScheduleToCloseTimeout:
        json['defaultTaskScheduleToCloseTimeout'] as String,
    defaultTaskScheduleToStartTimeout:
        json['defaultTaskScheduleToStartTimeout'] as String,
    defaultTaskStartToCloseTimeout:
        json['defaultTaskStartToCloseTimeout'] as String,
  );
}

ActivityTypeDetail _$ActivityTypeDetailFromJson(Map<String, dynamic> json) {
  return ActivityTypeDetail(
    configuration: json['configuration'] == null
        ? null
        : ActivityTypeConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
    typeInfo: json['typeInfo'] == null
        ? null
        : ActivityTypeInfo.fromJson(json['typeInfo'] as Map<String, dynamic>),
  );
}

ActivityTypeInfo _$ActivityTypeInfoFromJson(Map<String, dynamic> json) {
  return ActivityTypeInfo(
    activityType: json['activityType'] == null
        ? null
        : ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    status: _$enumDecodeNullable(_$RegistrationStatusEnumMap, json['status']),
    deprecationDate:
        const UnixDateTimeConverter().fromJson(json['deprecationDate']),
    description: json['description'] as String,
  );
}

const _$RegistrationStatusEnumMap = {
  RegistrationStatus.registered: 'REGISTERED',
  RegistrationStatus.deprecated: 'DEPRECATED',
};

ActivityTypeInfos _$ActivityTypeInfosFromJson(Map<String, dynamic> json) {
  return ActivityTypeInfos(
    typeInfos: (json['typeInfos'] as List)
        ?.map((e) => e == null
            ? null
            : ActivityTypeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

Map<String, dynamic> _$CancelTimerDecisionAttributesToJson(
    CancelTimerDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timerId', instance.timerId);
  return val;
}

CancelTimerFailedEventAttributes _$CancelTimerFailedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return CancelTimerFailedEventAttributes(
    cause: _$enumDecodeNullable(_$CancelTimerFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    timerId: json['timerId'] as String,
  );
}

const _$CancelTimerFailedCauseEnumMap = {
  CancelTimerFailedCause.timerIdUnknown: 'TIMER_ID_UNKNOWN',
  CancelTimerFailedCause.operationNotPermitted: 'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$CancelWorkflowExecutionDecisionAttributesToJson(
    CancelWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('details', instance.details);
  return val;
}

CancelWorkflowExecutionFailedEventAttributes
    _$CancelWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return CancelWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$CancelWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$CancelWorkflowExecutionFailedCauseEnumMap = {
  CancelWorkflowExecutionFailedCause.unhandledDecision: 'UNHANDLED_DECISION',
  CancelWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

ChildWorkflowExecutionCanceledEventAttributes
    _$ChildWorkflowExecutionCanceledEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionCanceledEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    details: json['details'] as String,
  );
}

ChildWorkflowExecutionCompletedEventAttributes
    _$ChildWorkflowExecutionCompletedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionCompletedEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    result: json['result'] as String,
  );
}

ChildWorkflowExecutionFailedEventAttributes
    _$ChildWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionFailedEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    details: json['details'] as String,
    reason: json['reason'] as String,
  );
}

ChildWorkflowExecutionStartedEventAttributes
    _$ChildWorkflowExecutionStartedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionStartedEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
  );
}

ChildWorkflowExecutionTerminatedEventAttributes
    _$ChildWorkflowExecutionTerminatedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionTerminatedEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
  );
}

ChildWorkflowExecutionTimedOutEventAttributes
    _$ChildWorkflowExecutionTimedOutEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ChildWorkflowExecutionTimedOutEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    timeoutType: _$enumDecodeNullable(
        _$WorkflowExecutionTimeoutTypeEnumMap, json['timeoutType']),
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
  );
}

const _$WorkflowExecutionTimeoutTypeEnumMap = {
  WorkflowExecutionTimeoutType.startToClose: 'START_TO_CLOSE',
};

Map<String, dynamic> _$CloseStatusFilterToJson(CloseStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$CloseStatusEnumMap[instance.status]);
  return val;
}

const _$CloseStatusEnumMap = {
  CloseStatus.completed: 'COMPLETED',
  CloseStatus.failed: 'FAILED',
  CloseStatus.canceled: 'CANCELED',
  CloseStatus.terminated: 'TERMINATED',
  CloseStatus.continuedAsNew: 'CONTINUED_AS_NEW',
  CloseStatus.timedOut: 'TIMED_OUT',
};

Map<String, dynamic> _$CompleteWorkflowExecutionDecisionAttributesToJson(
    CompleteWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result', instance.result);
  return val;
}

CompleteWorkflowExecutionFailedEventAttributes
    _$CompleteWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return CompleteWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$CompleteWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$CompleteWorkflowExecutionFailedCauseEnumMap = {
  CompleteWorkflowExecutionFailedCause.unhandledDecision: 'UNHANDLED_DECISION',
  CompleteWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$ContinueAsNewWorkflowExecutionDecisionAttributesToJson(
    ContinueAsNewWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('childPolicy', _$ChildPolicyEnumMap[instance.childPolicy]);
  writeNotNull(
      'executionStartToCloseTimeout', instance.executionStartToCloseTimeout);
  writeNotNull('input', instance.input);
  writeNotNull('lambdaRole', instance.lambdaRole);
  writeNotNull('tagList', instance.tagList);
  writeNotNull('taskList', instance.taskList?.toJson());
  writeNotNull('taskPriority', instance.taskPriority);
  writeNotNull('taskStartToCloseTimeout', instance.taskStartToCloseTimeout);
  writeNotNull('workflowTypeVersion', instance.workflowTypeVersion);
  return val;
}

const _$ChildPolicyEnumMap = {
  ChildPolicy.terminate: 'TERMINATE',
  ChildPolicy.requestCancel: 'REQUEST_CANCEL',
  ChildPolicy.abandon: 'ABANDON',
};

ContinueAsNewWorkflowExecutionFailedEventAttributes
    _$ContinueAsNewWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ContinueAsNewWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$ContinueAsNewWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$ContinueAsNewWorkflowExecutionFailedCauseEnumMap = {
  ContinueAsNewWorkflowExecutionFailedCause.unhandledDecision:
      'UNHANDLED_DECISION',
  ContinueAsNewWorkflowExecutionFailedCause.workflowTypeDeprecated:
      'WORKFLOW_TYPE_DEPRECATED',
  ContinueAsNewWorkflowExecutionFailedCause.workflowTypeDoesNotExist:
      'WORKFLOW_TYPE_DOES_NOT_EXIST',
  ContinueAsNewWorkflowExecutionFailedCause
          .defaultExecutionStartToCloseTimeoutUndefined:
      'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED',
  ContinueAsNewWorkflowExecutionFailedCause
          .defaultTaskStartToCloseTimeoutUndefined:
      'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED',
  ContinueAsNewWorkflowExecutionFailedCause.defaultTaskListUndefined:
      'DEFAULT_TASK_LIST_UNDEFINED',
  ContinueAsNewWorkflowExecutionFailedCause.defaultChildPolicyUndefined:
      'DEFAULT_CHILD_POLICY_UNDEFINED',
  ContinueAsNewWorkflowExecutionFailedCause
          .continueAsNewWorkflowExecutionRateExceeded:
      'CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED',
  ContinueAsNewWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$DecisionToJson(Decision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('decisionType', _$DecisionTypeEnumMap[instance.decisionType]);
  writeNotNull('cancelTimerDecisionAttributes',
      instance.cancelTimerDecisionAttributes?.toJson());
  writeNotNull('cancelWorkflowExecutionDecisionAttributes',
      instance.cancelWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('completeWorkflowExecutionDecisionAttributes',
      instance.completeWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('continueAsNewWorkflowExecutionDecisionAttributes',
      instance.continueAsNewWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('failWorkflowExecutionDecisionAttributes',
      instance.failWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('recordMarkerDecisionAttributes',
      instance.recordMarkerDecisionAttributes?.toJson());
  writeNotNull('requestCancelActivityTaskDecisionAttributes',
      instance.requestCancelActivityTaskDecisionAttributes?.toJson());
  writeNotNull(
      'requestCancelExternalWorkflowExecutionDecisionAttributes',
      instance.requestCancelExternalWorkflowExecutionDecisionAttributes
          ?.toJson());
  writeNotNull('scheduleActivityTaskDecisionAttributes',
      instance.scheduleActivityTaskDecisionAttributes?.toJson());
  writeNotNull('scheduleLambdaFunctionDecisionAttributes',
      instance.scheduleLambdaFunctionDecisionAttributes?.toJson());
  writeNotNull('signalExternalWorkflowExecutionDecisionAttributes',
      instance.signalExternalWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('startChildWorkflowExecutionDecisionAttributes',
      instance.startChildWorkflowExecutionDecisionAttributes?.toJson());
  writeNotNull('startTimerDecisionAttributes',
      instance.startTimerDecisionAttributes?.toJson());
  return val;
}

const _$DecisionTypeEnumMap = {
  DecisionType.scheduleActivityTask: 'ScheduleActivityTask',
  DecisionType.requestCancelActivityTask: 'RequestCancelActivityTask',
  DecisionType.completeWorkflowExecution: 'CompleteWorkflowExecution',
  DecisionType.failWorkflowExecution: 'FailWorkflowExecution',
  DecisionType.cancelWorkflowExecution: 'CancelWorkflowExecution',
  DecisionType.continueAsNewWorkflowExecution: 'ContinueAsNewWorkflowExecution',
  DecisionType.recordMarker: 'RecordMarker',
  DecisionType.startTimer: 'StartTimer',
  DecisionType.cancelTimer: 'CancelTimer',
  DecisionType.signalExternalWorkflowExecution:
      'SignalExternalWorkflowExecution',
  DecisionType.requestCancelExternalWorkflowExecution:
      'RequestCancelExternalWorkflowExecution',
  DecisionType.startChildWorkflowExecution: 'StartChildWorkflowExecution',
  DecisionType.scheduleLambdaFunction: 'ScheduleLambdaFunction',
};

DecisionTask _$DecisionTaskFromJson(Map<String, dynamic> json) {
  return DecisionTask(
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : HistoryEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startedEventId: json['startedEventId'] as int,
    taskToken: json['taskToken'] as String,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    nextPageToken: json['nextPageToken'] as String,
    previousStartedEventId: json['previousStartedEventId'] as int,
  );
}

DecisionTaskCompletedEventAttributes
    _$DecisionTaskCompletedEventAttributesFromJson(Map<String, dynamic> json) {
  return DecisionTaskCompletedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    executionContext: json['executionContext'] as String,
  );
}

DecisionTaskScheduledEventAttributes
    _$DecisionTaskScheduledEventAttributesFromJson(Map<String, dynamic> json) {
  return DecisionTaskScheduledEventAttributes(
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    startToCloseTimeout: json['startToCloseTimeout'] as String,
    taskPriority: json['taskPriority'] as String,
  );
}

DecisionTaskStartedEventAttributes _$DecisionTaskStartedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return DecisionTaskStartedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    identity: json['identity'] as String,
  );
}

DecisionTaskTimedOutEventAttributes
    _$DecisionTaskTimedOutEventAttributesFromJson(Map<String, dynamic> json) {
  return DecisionTaskTimedOutEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    timeoutType: _$enumDecodeNullable(
        _$DecisionTaskTimeoutTypeEnumMap, json['timeoutType']),
  );
}

const _$DecisionTaskTimeoutTypeEnumMap = {
  DecisionTaskTimeoutType.startToClose: 'START_TO_CLOSE',
};

DomainConfiguration _$DomainConfigurationFromJson(Map<String, dynamic> json) {
  return DomainConfiguration(
    workflowExecutionRetentionPeriodInDays:
        json['workflowExecutionRetentionPeriodInDays'] as String,
  );
}

DomainDetail _$DomainDetailFromJson(Map<String, dynamic> json) {
  return DomainDetail(
    configuration: json['configuration'] == null
        ? null
        : DomainConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
    domainInfo: json['domainInfo'] == null
        ? null
        : DomainInfo.fromJson(json['domainInfo'] as Map<String, dynamic>),
  );
}

DomainInfo _$DomainInfoFromJson(Map<String, dynamic> json) {
  return DomainInfo(
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$RegistrationStatusEnumMap, json['status']),
    arn: json['arn'] as String,
    description: json['description'] as String,
  );
}

DomainInfos _$DomainInfosFromJson(Map<String, dynamic> json) {
  return DomainInfos(
    domainInfos: (json['domainInfos'] as List)
        ?.map((e) =>
            e == null ? null : DomainInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

Map<String, dynamic> _$ExecutionTimeFilterToJson(ExecutionTimeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'oldestDate', const UnixDateTimeConverter().toJson(instance.oldestDate));
  writeNotNull(
      'latestDate', const UnixDateTimeConverter().toJson(instance.latestDate));
  return val;
}

ExternalWorkflowExecutionCancelRequestedEventAttributes
    _$ExternalWorkflowExecutionCancelRequestedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ExternalWorkflowExecutionCancelRequestedEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
  );
}

ExternalWorkflowExecutionSignaledEventAttributes
    _$ExternalWorkflowExecutionSignaledEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ExternalWorkflowExecutionSignaledEventAttributes(
    initiatedEventId: json['initiatedEventId'] as int,
    workflowExecution: json['workflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['workflowExecution'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FailWorkflowExecutionDecisionAttributesToJson(
    FailWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('details', instance.details);
  writeNotNull('reason', instance.reason);
  return val;
}

FailWorkflowExecutionFailedEventAttributes
    _$FailWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return FailWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$FailWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$FailWorkflowExecutionFailedCauseEnumMap = {
  FailWorkflowExecutionFailedCause.unhandledDecision: 'UNHANDLED_DECISION',
  FailWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : HistoryEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

HistoryEvent _$HistoryEventFromJson(Map<String, dynamic> json) {
  return HistoryEvent(
    eventId: json['eventId'] as int,
    eventTimestamp:
        const UnixDateTimeConverter().fromJson(json['eventTimestamp']),
    eventType: _$enumDecodeNullable(_$EventTypeEnumMap, json['eventType']),
    activityTaskCancelRequestedEventAttributes:
        json['activityTaskCancelRequestedEventAttributes'] == null
            ? null
            : ActivityTaskCancelRequestedEventAttributes.fromJson(
                json['activityTaskCancelRequestedEventAttributes']
                    as Map<String, dynamic>),
    activityTaskCanceledEventAttributes:
        json['activityTaskCanceledEventAttributes'] == null
            ? null
            : ActivityTaskCanceledEventAttributes.fromJson(
                json['activityTaskCanceledEventAttributes']
                    as Map<String, dynamic>),
    activityTaskCompletedEventAttributes:
        json['activityTaskCompletedEventAttributes'] == null
            ? null
            : ActivityTaskCompletedEventAttributes.fromJson(
                json['activityTaskCompletedEventAttributes']
                    as Map<String, dynamic>),
    activityTaskFailedEventAttributes:
        json['activityTaskFailedEventAttributes'] == null
            ? null
            : ActivityTaskFailedEventAttributes.fromJson(
                json['activityTaskFailedEventAttributes']
                    as Map<String, dynamic>),
    activityTaskScheduledEventAttributes:
        json['activityTaskScheduledEventAttributes'] == null
            ? null
            : ActivityTaskScheduledEventAttributes.fromJson(
                json['activityTaskScheduledEventAttributes']
                    as Map<String, dynamic>),
    activityTaskStartedEventAttributes:
        json['activityTaskStartedEventAttributes'] == null
            ? null
            : ActivityTaskStartedEventAttributes.fromJson(
                json['activityTaskStartedEventAttributes']
                    as Map<String, dynamic>),
    activityTaskTimedOutEventAttributes:
        json['activityTaskTimedOutEventAttributes'] == null
            ? null
            : ActivityTaskTimedOutEventAttributes.fromJson(
                json['activityTaskTimedOutEventAttributes']
                    as Map<String, dynamic>),
    cancelTimerFailedEventAttributes:
        json['cancelTimerFailedEventAttributes'] == null
            ? null
            : CancelTimerFailedEventAttributes.fromJson(
                json['cancelTimerFailedEventAttributes']
                    as Map<String, dynamic>),
    cancelWorkflowExecutionFailedEventAttributes:
        json['cancelWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : CancelWorkflowExecutionFailedEventAttributes.fromJson(
                json['cancelWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionCanceledEventAttributes:
        json['childWorkflowExecutionCanceledEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionCanceledEventAttributes.fromJson(
                json['childWorkflowExecutionCanceledEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionCompletedEventAttributes:
        json['childWorkflowExecutionCompletedEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionCompletedEventAttributes.fromJson(
                json['childWorkflowExecutionCompletedEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionFailedEventAttributes:
        json['childWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionFailedEventAttributes.fromJson(
                json['childWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionStartedEventAttributes:
        json['childWorkflowExecutionStartedEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionStartedEventAttributes.fromJson(
                json['childWorkflowExecutionStartedEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionTerminatedEventAttributes:
        json['childWorkflowExecutionTerminatedEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionTerminatedEventAttributes.fromJson(
                json['childWorkflowExecutionTerminatedEventAttributes']
                    as Map<String, dynamic>),
    childWorkflowExecutionTimedOutEventAttributes:
        json['childWorkflowExecutionTimedOutEventAttributes'] == null
            ? null
            : ChildWorkflowExecutionTimedOutEventAttributes.fromJson(
                json['childWorkflowExecutionTimedOutEventAttributes']
                    as Map<String, dynamic>),
    completeWorkflowExecutionFailedEventAttributes:
        json['completeWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : CompleteWorkflowExecutionFailedEventAttributes.fromJson(
                json['completeWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    continueAsNewWorkflowExecutionFailedEventAttributes:
        json['continueAsNewWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : ContinueAsNewWorkflowExecutionFailedEventAttributes.fromJson(
                json['continueAsNewWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    decisionTaskCompletedEventAttributes:
        json['decisionTaskCompletedEventAttributes'] == null
            ? null
            : DecisionTaskCompletedEventAttributes.fromJson(
                json['decisionTaskCompletedEventAttributes']
                    as Map<String, dynamic>),
    decisionTaskScheduledEventAttributes:
        json['decisionTaskScheduledEventAttributes'] == null
            ? null
            : DecisionTaskScheduledEventAttributes.fromJson(
                json['decisionTaskScheduledEventAttributes']
                    as Map<String, dynamic>),
    decisionTaskStartedEventAttributes:
        json['decisionTaskStartedEventAttributes'] == null
            ? null
            : DecisionTaskStartedEventAttributes.fromJson(
                json['decisionTaskStartedEventAttributes']
                    as Map<String, dynamic>),
    decisionTaskTimedOutEventAttributes:
        json['decisionTaskTimedOutEventAttributes'] == null
            ? null
            : DecisionTaskTimedOutEventAttributes.fromJson(
                json['decisionTaskTimedOutEventAttributes']
                    as Map<String, dynamic>),
    externalWorkflowExecutionCancelRequestedEventAttributes:
        json['externalWorkflowExecutionCancelRequestedEventAttributes'] == null
            ? null
            : ExternalWorkflowExecutionCancelRequestedEventAttributes.fromJson(
                json['externalWorkflowExecutionCancelRequestedEventAttributes']
                    as Map<String, dynamic>),
    externalWorkflowExecutionSignaledEventAttributes:
        json['externalWorkflowExecutionSignaledEventAttributes'] == null
            ? null
            : ExternalWorkflowExecutionSignaledEventAttributes.fromJson(
                json['externalWorkflowExecutionSignaledEventAttributes']
                    as Map<String, dynamic>),
    failWorkflowExecutionFailedEventAttributes:
        json['failWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : FailWorkflowExecutionFailedEventAttributes.fromJson(
                json['failWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    lambdaFunctionCompletedEventAttributes:
        json['lambdaFunctionCompletedEventAttributes'] == null
            ? null
            : LambdaFunctionCompletedEventAttributes.fromJson(
                json['lambdaFunctionCompletedEventAttributes']
                    as Map<String, dynamic>),
    lambdaFunctionFailedEventAttributes:
        json['lambdaFunctionFailedEventAttributes'] == null
            ? null
            : LambdaFunctionFailedEventAttributes.fromJson(
                json['lambdaFunctionFailedEventAttributes']
                    as Map<String, dynamic>),
    lambdaFunctionScheduledEventAttributes:
        json['lambdaFunctionScheduledEventAttributes'] == null
            ? null
            : LambdaFunctionScheduledEventAttributes.fromJson(
                json['lambdaFunctionScheduledEventAttributes']
                    as Map<String, dynamic>),
    lambdaFunctionStartedEventAttributes:
        json['lambdaFunctionStartedEventAttributes'] == null
            ? null
            : LambdaFunctionStartedEventAttributes.fromJson(
                json['lambdaFunctionStartedEventAttributes']
                    as Map<String, dynamic>),
    lambdaFunctionTimedOutEventAttributes:
        json['lambdaFunctionTimedOutEventAttributes'] == null
            ? null
            : LambdaFunctionTimedOutEventAttributes.fromJson(
                json['lambdaFunctionTimedOutEventAttributes']
                    as Map<String, dynamic>),
    markerRecordedEventAttributes: json['markerRecordedEventAttributes'] == null
        ? null
        : MarkerRecordedEventAttributes.fromJson(
            json['markerRecordedEventAttributes'] as Map<String, dynamic>),
    recordMarkerFailedEventAttributes:
        json['recordMarkerFailedEventAttributes'] == null
            ? null
            : RecordMarkerFailedEventAttributes.fromJson(
                json['recordMarkerFailedEventAttributes']
                    as Map<String, dynamic>),
    requestCancelActivityTaskFailedEventAttributes:
        json['requestCancelActivityTaskFailedEventAttributes'] == null
            ? null
            : RequestCancelActivityTaskFailedEventAttributes.fromJson(
                json['requestCancelActivityTaskFailedEventAttributes']
                    as Map<String, dynamic>),
    requestCancelExternalWorkflowExecutionFailedEventAttributes: json[
                'requestCancelExternalWorkflowExecutionFailedEventAttributes'] ==
            null
        ? null
        : RequestCancelExternalWorkflowExecutionFailedEventAttributes.fromJson(
            json['requestCancelExternalWorkflowExecutionFailedEventAttributes']
                as Map<String, dynamic>),
    requestCancelExternalWorkflowExecutionInitiatedEventAttributes: json[
                'requestCancelExternalWorkflowExecutionInitiatedEventAttributes'] ==
            null
        ? null
        : RequestCancelExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
            json['requestCancelExternalWorkflowExecutionInitiatedEventAttributes']
                as Map<String, dynamic>),
    scheduleActivityTaskFailedEventAttributes:
        json['scheduleActivityTaskFailedEventAttributes'] == null
            ? null
            : ScheduleActivityTaskFailedEventAttributes.fromJson(
                json['scheduleActivityTaskFailedEventAttributes']
                    as Map<String, dynamic>),
    scheduleLambdaFunctionFailedEventAttributes:
        json['scheduleLambdaFunctionFailedEventAttributes'] == null
            ? null
            : ScheduleLambdaFunctionFailedEventAttributes.fromJson(
                json['scheduleLambdaFunctionFailedEventAttributes']
                    as Map<String, dynamic>),
    signalExternalWorkflowExecutionFailedEventAttributes:
        json['signalExternalWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : SignalExternalWorkflowExecutionFailedEventAttributes.fromJson(
                json['signalExternalWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    signalExternalWorkflowExecutionInitiatedEventAttributes:
        json['signalExternalWorkflowExecutionInitiatedEventAttributes'] == null
            ? null
            : SignalExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
                json['signalExternalWorkflowExecutionInitiatedEventAttributes']
                    as Map<String, dynamic>),
    startChildWorkflowExecutionFailedEventAttributes:
        json['startChildWorkflowExecutionFailedEventAttributes'] == null
            ? null
            : StartChildWorkflowExecutionFailedEventAttributes.fromJson(
                json['startChildWorkflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    startChildWorkflowExecutionInitiatedEventAttributes:
        json['startChildWorkflowExecutionInitiatedEventAttributes'] == null
            ? null
            : StartChildWorkflowExecutionInitiatedEventAttributes.fromJson(
                json['startChildWorkflowExecutionInitiatedEventAttributes']
                    as Map<String, dynamic>),
    startLambdaFunctionFailedEventAttributes:
        json['startLambdaFunctionFailedEventAttributes'] == null
            ? null
            : StartLambdaFunctionFailedEventAttributes.fromJson(
                json['startLambdaFunctionFailedEventAttributes']
                    as Map<String, dynamic>),
    startTimerFailedEventAttributes: json['startTimerFailedEventAttributes'] ==
            null
        ? null
        : StartTimerFailedEventAttributes.fromJson(
            json['startTimerFailedEventAttributes'] as Map<String, dynamic>),
    timerCanceledEventAttributes: json['timerCanceledEventAttributes'] == null
        ? null
        : TimerCanceledEventAttributes.fromJson(
            json['timerCanceledEventAttributes'] as Map<String, dynamic>),
    timerFiredEventAttributes: json['timerFiredEventAttributes'] == null
        ? null
        : TimerFiredEventAttributes.fromJson(
            json['timerFiredEventAttributes'] as Map<String, dynamic>),
    timerStartedEventAttributes: json['timerStartedEventAttributes'] == null
        ? null
        : TimerStartedEventAttributes.fromJson(
            json['timerStartedEventAttributes'] as Map<String, dynamic>),
    workflowExecutionCancelRequestedEventAttributes:
        json['workflowExecutionCancelRequestedEventAttributes'] == null
            ? null
            : WorkflowExecutionCancelRequestedEventAttributes.fromJson(
                json['workflowExecutionCancelRequestedEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionCanceledEventAttributes:
        json['workflowExecutionCanceledEventAttributes'] == null
            ? null
            : WorkflowExecutionCanceledEventAttributes.fromJson(
                json['workflowExecutionCanceledEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionCompletedEventAttributes:
        json['workflowExecutionCompletedEventAttributes'] == null
            ? null
            : WorkflowExecutionCompletedEventAttributes.fromJson(
                json['workflowExecutionCompletedEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionContinuedAsNewEventAttributes:
        json['workflowExecutionContinuedAsNewEventAttributes'] == null
            ? null
            : WorkflowExecutionContinuedAsNewEventAttributes.fromJson(
                json['workflowExecutionContinuedAsNewEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionFailedEventAttributes:
        json['workflowExecutionFailedEventAttributes'] == null
            ? null
            : WorkflowExecutionFailedEventAttributes.fromJson(
                json['workflowExecutionFailedEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionSignaledEventAttributes:
        json['workflowExecutionSignaledEventAttributes'] == null
            ? null
            : WorkflowExecutionSignaledEventAttributes.fromJson(
                json['workflowExecutionSignaledEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionStartedEventAttributes:
        json['workflowExecutionStartedEventAttributes'] == null
            ? null
            : WorkflowExecutionStartedEventAttributes.fromJson(
                json['workflowExecutionStartedEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionTerminatedEventAttributes:
        json['workflowExecutionTerminatedEventAttributes'] == null
            ? null
            : WorkflowExecutionTerminatedEventAttributes.fromJson(
                json['workflowExecutionTerminatedEventAttributes']
                    as Map<String, dynamic>),
    workflowExecutionTimedOutEventAttributes:
        json['workflowExecutionTimedOutEventAttributes'] == null
            ? null
            : WorkflowExecutionTimedOutEventAttributes.fromJson(
                json['workflowExecutionTimedOutEventAttributes']
                    as Map<String, dynamic>),
  );
}

const _$EventTypeEnumMap = {
  EventType.workflowExecutionStarted: 'WorkflowExecutionStarted',
  EventType.workflowExecutionCancelRequested:
      'WorkflowExecutionCancelRequested',
  EventType.workflowExecutionCompleted: 'WorkflowExecutionCompleted',
  EventType.completeWorkflowExecutionFailed: 'CompleteWorkflowExecutionFailed',
  EventType.workflowExecutionFailed: 'WorkflowExecutionFailed',
  EventType.failWorkflowExecutionFailed: 'FailWorkflowExecutionFailed',
  EventType.workflowExecutionTimedOut: 'WorkflowExecutionTimedOut',
  EventType.workflowExecutionCanceled: 'WorkflowExecutionCanceled',
  EventType.cancelWorkflowExecutionFailed: 'CancelWorkflowExecutionFailed',
  EventType.workflowExecutionContinuedAsNew: 'WorkflowExecutionContinuedAsNew',
  EventType.continueAsNewWorkflowExecutionFailed:
      'ContinueAsNewWorkflowExecutionFailed',
  EventType.workflowExecutionTerminated: 'WorkflowExecutionTerminated',
  EventType.decisionTaskScheduled: 'DecisionTaskScheduled',
  EventType.decisionTaskStarted: 'DecisionTaskStarted',
  EventType.decisionTaskCompleted: 'DecisionTaskCompleted',
  EventType.decisionTaskTimedOut: 'DecisionTaskTimedOut',
  EventType.activityTaskScheduled: 'ActivityTaskScheduled',
  EventType.scheduleActivityTaskFailed: 'ScheduleActivityTaskFailed',
  EventType.activityTaskStarted: 'ActivityTaskStarted',
  EventType.activityTaskCompleted: 'ActivityTaskCompleted',
  EventType.activityTaskFailed: 'ActivityTaskFailed',
  EventType.activityTaskTimedOut: 'ActivityTaskTimedOut',
  EventType.activityTaskCanceled: 'ActivityTaskCanceled',
  EventType.activityTaskCancelRequested: 'ActivityTaskCancelRequested',
  EventType.requestCancelActivityTaskFailed: 'RequestCancelActivityTaskFailed',
  EventType.workflowExecutionSignaled: 'WorkflowExecutionSignaled',
  EventType.markerRecorded: 'MarkerRecorded',
  EventType.recordMarkerFailed: 'RecordMarkerFailed',
  EventType.timerStarted: 'TimerStarted',
  EventType.startTimerFailed: 'StartTimerFailed',
  EventType.timerFired: 'TimerFired',
  EventType.timerCanceled: 'TimerCanceled',
  EventType.cancelTimerFailed: 'CancelTimerFailed',
  EventType.startChildWorkflowExecutionInitiated:
      'StartChildWorkflowExecutionInitiated',
  EventType.startChildWorkflowExecutionFailed:
      'StartChildWorkflowExecutionFailed',
  EventType.childWorkflowExecutionStarted: 'ChildWorkflowExecutionStarted',
  EventType.childWorkflowExecutionCompleted: 'ChildWorkflowExecutionCompleted',
  EventType.childWorkflowExecutionFailed: 'ChildWorkflowExecutionFailed',
  EventType.childWorkflowExecutionTimedOut: 'ChildWorkflowExecutionTimedOut',
  EventType.childWorkflowExecutionCanceled: 'ChildWorkflowExecutionCanceled',
  EventType.childWorkflowExecutionTerminated:
      'ChildWorkflowExecutionTerminated',
  EventType.signalExternalWorkflowExecutionInitiated:
      'SignalExternalWorkflowExecutionInitiated',
  EventType.signalExternalWorkflowExecutionFailed:
      'SignalExternalWorkflowExecutionFailed',
  EventType.externalWorkflowExecutionSignaled:
      'ExternalWorkflowExecutionSignaled',
  EventType.requestCancelExternalWorkflowExecutionInitiated:
      'RequestCancelExternalWorkflowExecutionInitiated',
  EventType.requestCancelExternalWorkflowExecutionFailed:
      'RequestCancelExternalWorkflowExecutionFailed',
  EventType.externalWorkflowExecutionCancelRequested:
      'ExternalWorkflowExecutionCancelRequested',
  EventType.lambdaFunctionScheduled: 'LambdaFunctionScheduled',
  EventType.lambdaFunctionStarted: 'LambdaFunctionStarted',
  EventType.lambdaFunctionCompleted: 'LambdaFunctionCompleted',
  EventType.lambdaFunctionFailed: 'LambdaFunctionFailed',
  EventType.lambdaFunctionTimedOut: 'LambdaFunctionTimedOut',
  EventType.scheduleLambdaFunctionFailed: 'ScheduleLambdaFunctionFailed',
  EventType.startLambdaFunctionFailed: 'StartLambdaFunctionFailed',
};

LambdaFunctionCompletedEventAttributes
    _$LambdaFunctionCompletedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return LambdaFunctionCompletedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    result: json['result'] as String,
  );
}

LambdaFunctionFailedEventAttributes
    _$LambdaFunctionFailedEventAttributesFromJson(Map<String, dynamic> json) {
  return LambdaFunctionFailedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    details: json['details'] as String,
    reason: json['reason'] as String,
  );
}

LambdaFunctionScheduledEventAttributes
    _$LambdaFunctionScheduledEventAttributesFromJson(
        Map<String, dynamic> json) {
  return LambdaFunctionScheduledEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    id: json['id'] as String,
    name: json['name'] as String,
    control: json['control'] as String,
    input: json['input'] as String,
    startToCloseTimeout: json['startToCloseTimeout'] as String,
  );
}

LambdaFunctionStartedEventAttributes
    _$LambdaFunctionStartedEventAttributesFromJson(Map<String, dynamic> json) {
  return LambdaFunctionStartedEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
  );
}

LambdaFunctionTimedOutEventAttributes
    _$LambdaFunctionTimedOutEventAttributesFromJson(Map<String, dynamic> json) {
  return LambdaFunctionTimedOutEventAttributes(
    scheduledEventId: json['scheduledEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    timeoutType: _$enumDecodeNullable(
        _$LambdaFunctionTimeoutTypeEnumMap, json['timeoutType']),
  );
}

const _$LambdaFunctionTimeoutTypeEnumMap = {
  LambdaFunctionTimeoutType.startToClose: 'START_TO_CLOSE',
};

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : ResourceTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MarkerRecordedEventAttributes _$MarkerRecordedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return MarkerRecordedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    markerName: json['markerName'] as String,
    details: json['details'] as String,
  );
}

PendingTaskCount _$PendingTaskCountFromJson(Map<String, dynamic> json) {
  return PendingTaskCount(
    count: json['count'] as int,
    truncated: json['truncated'] as bool,
  );
}

Map<String, dynamic> _$RecordMarkerDecisionAttributesToJson(
    RecordMarkerDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('markerName', instance.markerName);
  writeNotNull('details', instance.details);
  return val;
}

RecordMarkerFailedEventAttributes _$RecordMarkerFailedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return RecordMarkerFailedEventAttributes(
    cause:
        _$enumDecodeNullable(_$RecordMarkerFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    markerName: json['markerName'] as String,
  );
}

const _$RecordMarkerFailedCauseEnumMap = {
  RecordMarkerFailedCause.operationNotPermitted: 'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$RequestCancelActivityTaskDecisionAttributesToJson(
    RequestCancelActivityTaskDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activityId', instance.activityId);
  return val;
}

RequestCancelActivityTaskFailedEventAttributes
    _$RequestCancelActivityTaskFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return RequestCancelActivityTaskFailedEventAttributes(
    activityId: json['activityId'] as String,
    cause: _$enumDecodeNullable(
        _$RequestCancelActivityTaskFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$RequestCancelActivityTaskFailedCauseEnumMap = {
  RequestCancelActivityTaskFailedCause.activityIdUnknown: 'ACTIVITY_ID_UNKNOWN',
  RequestCancelActivityTaskFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic>
    _$RequestCancelExternalWorkflowExecutionDecisionAttributesToJson(
        RequestCancelExternalWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('workflowId', instance.workflowId);
  writeNotNull('control', instance.control);
  writeNotNull('runId', instance.runId);
  return val;
}

RequestCancelExternalWorkflowExecutionFailedEventAttributes
    _$RequestCancelExternalWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return RequestCancelExternalWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$RequestCancelExternalWorkflowExecutionFailedCauseEnumMap,
        json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    initiatedEventId: json['initiatedEventId'] as int,
    workflowId: json['workflowId'] as String,
    control: json['control'] as String,
    runId: json['runId'] as String,
  );
}

const _$RequestCancelExternalWorkflowExecutionFailedCauseEnumMap = {
  RequestCancelExternalWorkflowExecutionFailedCause
      .unknownExternalWorkflowExecution: 'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION',
  RequestCancelExternalWorkflowExecutionFailedCause
          .requestCancelExternalWorkflowExecutionRateExceeded:
      'REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED',
  RequestCancelExternalWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
    _$RequestCancelExternalWorkflowExecutionInitiatedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return RequestCancelExternalWorkflowExecutionInitiatedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    workflowId: json['workflowId'] as String,
    control: json['control'] as String,
    runId: json['runId'] as String,
  );
}

ResourceTag _$ResourceTagFromJson(Map<String, dynamic> json) {
  return ResourceTag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ResourceTagToJson(ResourceTag instance) {
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

Run _$RunFromJson(Map<String, dynamic> json) {
  return Run(
    runId: json['runId'] as String,
  );
}

Map<String, dynamic> _$ScheduleActivityTaskDecisionAttributesToJson(
    ScheduleActivityTaskDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activityId', instance.activityId);
  writeNotNull('activityType', instance.activityType?.toJson());
  writeNotNull('control', instance.control);
  writeNotNull('heartbeatTimeout', instance.heartbeatTimeout);
  writeNotNull('input', instance.input);
  writeNotNull('scheduleToCloseTimeout', instance.scheduleToCloseTimeout);
  writeNotNull('scheduleToStartTimeout', instance.scheduleToStartTimeout);
  writeNotNull('startToCloseTimeout', instance.startToCloseTimeout);
  writeNotNull('taskList', instance.taskList?.toJson());
  writeNotNull('taskPriority', instance.taskPriority);
  return val;
}

ScheduleActivityTaskFailedEventAttributes
    _$ScheduleActivityTaskFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ScheduleActivityTaskFailedEventAttributes(
    activityId: json['activityId'] as String,
    activityType: json['activityType'] == null
        ? null
        : ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
    cause: _$enumDecodeNullable(
        _$ScheduleActivityTaskFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
  );
}

const _$ScheduleActivityTaskFailedCauseEnumMap = {
  ScheduleActivityTaskFailedCause.activityTypeDeprecated:
      'ACTIVITY_TYPE_DEPRECATED',
  ScheduleActivityTaskFailedCause.activityTypeDoesNotExist:
      'ACTIVITY_TYPE_DOES_NOT_EXIST',
  ScheduleActivityTaskFailedCause.activityIdAlreadyInUse:
      'ACTIVITY_ID_ALREADY_IN_USE',
  ScheduleActivityTaskFailedCause.openActivitiesLimitExceeded:
      'OPEN_ACTIVITIES_LIMIT_EXCEEDED',
  ScheduleActivityTaskFailedCause.activityCreationRateExceeded:
      'ACTIVITY_CREATION_RATE_EXCEEDED',
  ScheduleActivityTaskFailedCause.defaultScheduleToCloseTimeoutUndefined:
      'DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED',
  ScheduleActivityTaskFailedCause.defaultTaskListUndefined:
      'DEFAULT_TASK_LIST_UNDEFINED',
  ScheduleActivityTaskFailedCause.defaultScheduleToStartTimeoutUndefined:
      'DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED',
  ScheduleActivityTaskFailedCause.defaultStartToCloseTimeoutUndefined:
      'DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED',
  ScheduleActivityTaskFailedCause.defaultHeartbeatTimeoutUndefined:
      'DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED',
  ScheduleActivityTaskFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$ScheduleLambdaFunctionDecisionAttributesToJson(
    ScheduleLambdaFunctionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('control', instance.control);
  writeNotNull('input', instance.input);
  writeNotNull('startToCloseTimeout', instance.startToCloseTimeout);
  return val;
}

ScheduleLambdaFunctionFailedEventAttributes
    _$ScheduleLambdaFunctionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return ScheduleLambdaFunctionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$ScheduleLambdaFunctionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

const _$ScheduleLambdaFunctionFailedCauseEnumMap = {
  ScheduleLambdaFunctionFailedCause.idAlreadyInUse: 'ID_ALREADY_IN_USE',
  ScheduleLambdaFunctionFailedCause.openLambdaFunctionsLimitExceeded:
      'OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED',
  ScheduleLambdaFunctionFailedCause.lambdaFunctionCreationRateExceeded:
      'LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED',
  ScheduleLambdaFunctionFailedCause.lambdaServiceNotAvailableInRegion:
      'LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION',
};

Map<String, dynamic> _$SignalExternalWorkflowExecutionDecisionAttributesToJson(
    SignalExternalWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signalName', instance.signalName);
  writeNotNull('workflowId', instance.workflowId);
  writeNotNull('control', instance.control);
  writeNotNull('input', instance.input);
  writeNotNull('runId', instance.runId);
  return val;
}

SignalExternalWorkflowExecutionFailedEventAttributes
    _$SignalExternalWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return SignalExternalWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$SignalExternalWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    initiatedEventId: json['initiatedEventId'] as int,
    workflowId: json['workflowId'] as String,
    control: json['control'] as String,
    runId: json['runId'] as String,
  );
}

const _$SignalExternalWorkflowExecutionFailedCauseEnumMap = {
  SignalExternalWorkflowExecutionFailedCause.unknownExternalWorkflowExecution:
      'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION',
  SignalExternalWorkflowExecutionFailedCause
          .signalExternalWorkflowExecutionRateExceeded:
      'SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED',
  SignalExternalWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

SignalExternalWorkflowExecutionInitiatedEventAttributes
    _$SignalExternalWorkflowExecutionInitiatedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return SignalExternalWorkflowExecutionInitiatedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    signalName: json['signalName'] as String,
    workflowId: json['workflowId'] as String,
    control: json['control'] as String,
    input: json['input'] as String,
    runId: json['runId'] as String,
  );
}

Map<String, dynamic> _$StartChildWorkflowExecutionDecisionAttributesToJson(
    StartChildWorkflowExecutionDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('workflowId', instance.workflowId);
  writeNotNull('workflowType', instance.workflowType?.toJson());
  writeNotNull('childPolicy', _$ChildPolicyEnumMap[instance.childPolicy]);
  writeNotNull('control', instance.control);
  writeNotNull(
      'executionStartToCloseTimeout', instance.executionStartToCloseTimeout);
  writeNotNull('input', instance.input);
  writeNotNull('lambdaRole', instance.lambdaRole);
  writeNotNull('tagList', instance.tagList);
  writeNotNull('taskList', instance.taskList?.toJson());
  writeNotNull('taskPriority', instance.taskPriority);
  writeNotNull('taskStartToCloseTimeout', instance.taskStartToCloseTimeout);
  return val;
}

StartChildWorkflowExecutionFailedEventAttributes
    _$StartChildWorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return StartChildWorkflowExecutionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$StartChildWorkflowExecutionFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    initiatedEventId: json['initiatedEventId'] as int,
    workflowId: json['workflowId'] as String,
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    control: json['control'] as String,
  );
}

const _$StartChildWorkflowExecutionFailedCauseEnumMap = {
  StartChildWorkflowExecutionFailedCause.workflowTypeDoesNotExist:
      'WORKFLOW_TYPE_DOES_NOT_EXIST',
  StartChildWorkflowExecutionFailedCause.workflowTypeDeprecated:
      'WORKFLOW_TYPE_DEPRECATED',
  StartChildWorkflowExecutionFailedCause.openChildrenLimitExceeded:
      'OPEN_CHILDREN_LIMIT_EXCEEDED',
  StartChildWorkflowExecutionFailedCause.openWorkflowsLimitExceeded:
      'OPEN_WORKFLOWS_LIMIT_EXCEEDED',
  StartChildWorkflowExecutionFailedCause.childCreationRateExceeded:
      'CHILD_CREATION_RATE_EXCEEDED',
  StartChildWorkflowExecutionFailedCause.workflowAlreadyRunning:
      'WORKFLOW_ALREADY_RUNNING',
  StartChildWorkflowExecutionFailedCause
          .defaultExecutionStartToCloseTimeoutUndefined:
      'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED',
  StartChildWorkflowExecutionFailedCause.defaultTaskListUndefined:
      'DEFAULT_TASK_LIST_UNDEFINED',
  StartChildWorkflowExecutionFailedCause
          .defaultTaskStartToCloseTimeoutUndefined:
      'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED',
  StartChildWorkflowExecutionFailedCause.defaultChildPolicyUndefined:
      'DEFAULT_CHILD_POLICY_UNDEFINED',
  StartChildWorkflowExecutionFailedCause.operationNotPermitted:
      'OPERATION_NOT_PERMITTED',
};

StartChildWorkflowExecutionInitiatedEventAttributes
    _$StartChildWorkflowExecutionInitiatedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return StartChildWorkflowExecutionInitiatedEventAttributes(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    workflowId: json['workflowId'] as String,
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    control: json['control'] as String,
    executionStartToCloseTimeout:
        json['executionStartToCloseTimeout'] as String,
    input: json['input'] as String,
    lambdaRole: json['lambdaRole'] as String,
    tagList: (json['tagList'] as List)?.map((e) => e as String)?.toList(),
    taskPriority: json['taskPriority'] as String,
    taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
  );
}

StartLambdaFunctionFailedEventAttributes
    _$StartLambdaFunctionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return StartLambdaFunctionFailedEventAttributes(
    cause: _$enumDecodeNullable(
        _$StartLambdaFunctionFailedCauseEnumMap, json['cause']),
    message: json['message'] as String,
    scheduledEventId: json['scheduledEventId'] as int,
  );
}

const _$StartLambdaFunctionFailedCauseEnumMap = {
  StartLambdaFunctionFailedCause.assumeRoleFailed: 'ASSUME_ROLE_FAILED',
};

Map<String, dynamic> _$StartTimerDecisionAttributesToJson(
    StartTimerDecisionAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startToFireTimeout', instance.startToFireTimeout);
  writeNotNull('timerId', instance.timerId);
  writeNotNull('control', instance.control);
  return val;
}

StartTimerFailedEventAttributes _$StartTimerFailedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return StartTimerFailedEventAttributes(
    cause: _$enumDecodeNullable(_$StartTimerFailedCauseEnumMap, json['cause']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    timerId: json['timerId'] as String,
  );
}

const _$StartTimerFailedCauseEnumMap = {
  StartTimerFailedCause.timerIdAlreadyInUse: 'TIMER_ID_ALREADY_IN_USE',
  StartTimerFailedCause.openTimersLimitExceeded: 'OPEN_TIMERS_LIMIT_EXCEEDED',
  StartTimerFailedCause.timerCreationRateExceeded:
      'TIMER_CREATION_RATE_EXCEEDED',
  StartTimerFailedCause.operationNotPermitted: 'OPERATION_NOT_PERMITTED',
};

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tag', instance.tag);
  return val;
}

TaskList _$TaskListFromJson(Map<String, dynamic> json) {
  return TaskList(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TaskListToJson(TaskList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

TimerCanceledEventAttributes _$TimerCanceledEventAttributesFromJson(
    Map<String, dynamic> json) {
  return TimerCanceledEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    startedEventId: json['startedEventId'] as int,
    timerId: json['timerId'] as String,
  );
}

TimerFiredEventAttributes _$TimerFiredEventAttributesFromJson(
    Map<String, dynamic> json) {
  return TimerFiredEventAttributes(
    startedEventId: json['startedEventId'] as int,
    timerId: json['timerId'] as String,
  );
}

TimerStartedEventAttributes _$TimerStartedEventAttributesFromJson(
    Map<String, dynamic> json) {
  return TimerStartedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    startToFireTimeout: json['startToFireTimeout'] as String,
    timerId: json['timerId'] as String,
    control: json['control'] as String,
  );
}

WorkflowExecution _$WorkflowExecutionFromJson(Map<String, dynamic> json) {
  return WorkflowExecution(
    runId: json['runId'] as String,
    workflowId: json['workflowId'] as String,
  );
}

Map<String, dynamic> _$WorkflowExecutionToJson(WorkflowExecution instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('runId', instance.runId);
  writeNotNull('workflowId', instance.workflowId);
  return val;
}

WorkflowExecutionCancelRequestedEventAttributes
    _$WorkflowExecutionCancelRequestedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionCancelRequestedEventAttributes(
    cause: _$enumDecodeNullable(
        _$WorkflowExecutionCancelRequestedCauseEnumMap, json['cause']),
    externalInitiatedEventId: json['externalInitiatedEventId'] as int,
    externalWorkflowExecution: json['externalWorkflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['externalWorkflowExecution'] as Map<String, dynamic>),
  );
}

const _$WorkflowExecutionCancelRequestedCauseEnumMap = {
  WorkflowExecutionCancelRequestedCause.childPolicyApplied:
      'CHILD_POLICY_APPLIED',
};

WorkflowExecutionCanceledEventAttributes
    _$WorkflowExecutionCanceledEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionCanceledEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    details: json['details'] as String,
  );
}

WorkflowExecutionCompletedEventAttributes
    _$WorkflowExecutionCompletedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionCompletedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    result: json['result'] as String,
  );
}

WorkflowExecutionConfiguration _$WorkflowExecutionConfigurationFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionConfiguration(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    executionStartToCloseTimeout:
        json['executionStartToCloseTimeout'] as String,
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
    lambdaRole: json['lambdaRole'] as String,
    taskPriority: json['taskPriority'] as String,
  );
}

WorkflowExecutionContinuedAsNewEventAttributes
    _$WorkflowExecutionContinuedAsNewEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionContinuedAsNewEventAttributes(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    newExecutionRunId: json['newExecutionRunId'] as String,
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    executionStartToCloseTimeout:
        json['executionStartToCloseTimeout'] as String,
    input: json['input'] as String,
    lambdaRole: json['lambdaRole'] as String,
    tagList: (json['tagList'] as List)?.map((e) => e as String)?.toList(),
    taskPriority: json['taskPriority'] as String,
    taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
  );
}

WorkflowExecutionCount _$WorkflowExecutionCountFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionCount(
    count: json['count'] as int,
    truncated: json['truncated'] as bool,
  );
}

WorkflowExecutionDetail _$WorkflowExecutionDetailFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionDetail(
    executionConfiguration: json['executionConfiguration'] == null
        ? null
        : WorkflowExecutionConfiguration.fromJson(
            json['executionConfiguration'] as Map<String, dynamic>),
    executionInfo: json['executionInfo'] == null
        ? null
        : WorkflowExecutionInfo.fromJson(
            json['executionInfo'] as Map<String, dynamic>),
    openCounts: json['openCounts'] == null
        ? null
        : WorkflowExecutionOpenCounts.fromJson(
            json['openCounts'] as Map<String, dynamic>),
    latestActivityTaskTimestamp: const UnixDateTimeConverter()
        .fromJson(json['latestActivityTaskTimestamp']),
    latestExecutionContext: json['latestExecutionContext'] as String,
  );
}

WorkflowExecutionFailedEventAttributes
    _$WorkflowExecutionFailedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionFailedEventAttributes(
    decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    details: json['details'] as String,
    reason: json['reason'] as String,
  );
}

Map<String, dynamic> _$WorkflowExecutionFilterToJson(
    WorkflowExecutionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('workflowId', instance.workflowId);
  return val;
}

WorkflowExecutionInfo _$WorkflowExecutionInfoFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionInfo(
    execution: json['execution'] == null
        ? null
        : WorkflowExecution.fromJson(json['execution'] as Map<String, dynamic>),
    executionStatus:
        _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['executionStatus']),
    startTimestamp:
        const UnixDateTimeConverter().fromJson(json['startTimestamp']),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    cancelRequested: json['cancelRequested'] as bool,
    closeStatus:
        _$enumDecodeNullable(_$CloseStatusEnumMap, json['closeStatus']),
    closeTimestamp:
        const UnixDateTimeConverter().fromJson(json['closeTimestamp']),
    parent: json['parent'] == null
        ? null
        : WorkflowExecution.fromJson(json['parent'] as Map<String, dynamic>),
    tagList: (json['tagList'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ExecutionStatusEnumMap = {
  ExecutionStatus.open: 'OPEN',
  ExecutionStatus.closed: 'CLOSED',
};

WorkflowExecutionInfos _$WorkflowExecutionInfosFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionInfos(
    executionInfos: (json['executionInfos'] as List)
        ?.map((e) => e == null
            ? null
            : WorkflowExecutionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

WorkflowExecutionOpenCounts _$WorkflowExecutionOpenCountsFromJson(
    Map<String, dynamic> json) {
  return WorkflowExecutionOpenCounts(
    openActivityTasks: json['openActivityTasks'] as int,
    openChildWorkflowExecutions: json['openChildWorkflowExecutions'] as int,
    openDecisionTasks: json['openDecisionTasks'] as int,
    openTimers: json['openTimers'] as int,
    openLambdaFunctions: json['openLambdaFunctions'] as int,
  );
}

WorkflowExecutionSignaledEventAttributes
    _$WorkflowExecutionSignaledEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionSignaledEventAttributes(
    signalName: json['signalName'] as String,
    externalInitiatedEventId: json['externalInitiatedEventId'] as int,
    externalWorkflowExecution: json['externalWorkflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['externalWorkflowExecution'] as Map<String, dynamic>),
    input: json['input'] as String,
  );
}

WorkflowExecutionStartedEventAttributes
    _$WorkflowExecutionStartedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionStartedEventAttributes(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    taskList: json['taskList'] == null
        ? null
        : TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    continuedExecutionRunId: json['continuedExecutionRunId'] as String,
    executionStartToCloseTimeout:
        json['executionStartToCloseTimeout'] as String,
    input: json['input'] as String,
    lambdaRole: json['lambdaRole'] as String,
    parentInitiatedEventId: json['parentInitiatedEventId'] as int,
    parentWorkflowExecution: json['parentWorkflowExecution'] == null
        ? null
        : WorkflowExecution.fromJson(
            json['parentWorkflowExecution'] as Map<String, dynamic>),
    tagList: (json['tagList'] as List)?.map((e) => e as String)?.toList(),
    taskPriority: json['taskPriority'] as String,
    taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
  );
}

WorkflowExecutionTerminatedEventAttributes
    _$WorkflowExecutionTerminatedEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionTerminatedEventAttributes(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    cause: _$enumDecodeNullable(
        _$WorkflowExecutionTerminatedCauseEnumMap, json['cause']),
    details: json['details'] as String,
    reason: json['reason'] as String,
  );
}

const _$WorkflowExecutionTerminatedCauseEnumMap = {
  WorkflowExecutionTerminatedCause.childPolicyApplied: 'CHILD_POLICY_APPLIED',
  WorkflowExecutionTerminatedCause.eventLimitExceeded: 'EVENT_LIMIT_EXCEEDED',
  WorkflowExecutionTerminatedCause.operatorInitiated: 'OPERATOR_INITIATED',
};

WorkflowExecutionTimedOutEventAttributes
    _$WorkflowExecutionTimedOutEventAttributesFromJson(
        Map<String, dynamic> json) {
  return WorkflowExecutionTimedOutEventAttributes(
    childPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['childPolicy']),
    timeoutType: _$enumDecodeNullable(
        _$WorkflowExecutionTimeoutTypeEnumMap, json['timeoutType']),
  );
}

WorkflowType _$WorkflowTypeFromJson(Map<String, dynamic> json) {
  return WorkflowType(
    name: json['name'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$WorkflowTypeToJson(WorkflowType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  return val;
}

WorkflowTypeConfiguration _$WorkflowTypeConfigurationFromJson(
    Map<String, dynamic> json) {
  return WorkflowTypeConfiguration(
    defaultChildPolicy:
        _$enumDecodeNullable(_$ChildPolicyEnumMap, json['defaultChildPolicy']),
    defaultExecutionStartToCloseTimeout:
        json['defaultExecutionStartToCloseTimeout'] as String,
    defaultLambdaRole: json['defaultLambdaRole'] as String,
    defaultTaskList: json['defaultTaskList'] == null
        ? null
        : TaskList.fromJson(json['defaultTaskList'] as Map<String, dynamic>),
    defaultTaskPriority: json['defaultTaskPriority'] as String,
    defaultTaskStartToCloseTimeout:
        json['defaultTaskStartToCloseTimeout'] as String,
  );
}

WorkflowTypeDetail _$WorkflowTypeDetailFromJson(Map<String, dynamic> json) {
  return WorkflowTypeDetail(
    configuration: json['configuration'] == null
        ? null
        : WorkflowTypeConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
    typeInfo: json['typeInfo'] == null
        ? null
        : WorkflowTypeInfo.fromJson(json['typeInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkflowTypeFilterToJson(WorkflowTypeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  return val;
}

WorkflowTypeInfo _$WorkflowTypeInfoFromJson(Map<String, dynamic> json) {
  return WorkflowTypeInfo(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    status: _$enumDecodeNullable(_$RegistrationStatusEnumMap, json['status']),
    workflowType: json['workflowType'] == null
        ? null
        : WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    deprecationDate:
        const UnixDateTimeConverter().fromJson(json['deprecationDate']),
    description: json['description'] as String,
  );
}

WorkflowTypeInfos _$WorkflowTypeInfosFromJson(Map<String, dynamic> json) {
  return WorkflowTypeInfos(
    typeInfos: (json['typeInfos'] as List)
        ?.map((e) => e == null
            ? null
            : WorkflowTypeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}
