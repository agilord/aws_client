// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets-2016-10-20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    actionId: json['ActionId'] as String,
    actionThreshold: ActionThreshold.fromJson(
        json['ActionThreshold'] as Map<String, dynamic>),
    actionType: _$enumDecode(_$ActionTypeEnumMap, json['ActionType']),
    approvalModel: _$enumDecode(_$ApprovalModelEnumMap, json['ApprovalModel']),
    budgetName: json['BudgetName'] as String,
    definition: Definition.fromJson(json['Definition'] as Map<String, dynamic>),
    executionRoleArn: json['ExecutionRoleArn'] as String,
    notificationType:
        _$enumDecode(_$NotificationTypeEnumMap, json['NotificationType']),
    status: _$enumDecode(_$ActionStatusEnumMap, json['Status']),
    subscribers: (json['Subscribers'] as List<dynamic>)
        .map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
        .toList(),
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

const _$ActionTypeEnumMap = {
  ActionType.applyIamPolicy: 'APPLY_IAM_POLICY',
  ActionType.applyScpPolicy: 'APPLY_SCP_POLICY',
  ActionType.runSsmDocuments: 'RUN_SSM_DOCUMENTS',
};

const _$ApprovalModelEnumMap = {
  ApprovalModel.automatic: 'AUTOMATIC',
  ApprovalModel.manual: 'MANUAL',
};

const _$NotificationTypeEnumMap = {
  NotificationType.actual: 'ACTUAL',
  NotificationType.forecasted: 'FORECASTED',
};

const _$ActionStatusEnumMap = {
  ActionStatus.standby: 'STANDBY',
  ActionStatus.pending: 'PENDING',
  ActionStatus.executionInProgress: 'EXECUTION_IN_PROGRESS',
  ActionStatus.executionSuccess: 'EXECUTION_SUCCESS',
  ActionStatus.executionFailure: 'EXECUTION_FAILURE',
  ActionStatus.reverseInProgress: 'REVERSE_IN_PROGRESS',
  ActionStatus.reverseSuccess: 'REVERSE_SUCCESS',
  ActionStatus.reverseFailure: 'REVERSE_FAILURE',
  ActionStatus.resetInProgress: 'RESET_IN_PROGRESS',
  ActionStatus.resetFailure: 'RESET_FAILURE',
};

ActionHistory _$ActionHistoryFromJson(Map<String, dynamic> json) {
  return ActionHistory(
    actionHistoryDetails: ActionHistoryDetails.fromJson(
        json['ActionHistoryDetails'] as Map<String, dynamic>),
    eventType: _$enumDecode(_$EventTypeEnumMap, json['EventType']),
    status: _$enumDecode(_$ActionStatusEnumMap, json['Status']),
    timestamp: DateTime.parse(json['Timestamp'] as String),
  );
}

const _$EventTypeEnumMap = {
  EventType.system: 'SYSTEM',
  EventType.createAction: 'CREATE_ACTION',
  EventType.deleteAction: 'DELETE_ACTION',
  EventType.updateAction: 'UPDATE_ACTION',
  EventType.executeAction: 'EXECUTE_ACTION',
};

ActionHistoryDetails _$ActionHistoryDetailsFromJson(Map<String, dynamic> json) {
  return ActionHistoryDetails(
    action: Action.fromJson(json['Action'] as Map<String, dynamic>),
    message: json['Message'] as String,
  );
}

ActionThreshold _$ActionThresholdFromJson(Map<String, dynamic> json) {
  return ActionThreshold(
    actionThresholdType:
        _$enumDecode(_$ThresholdTypeEnumMap, json['ActionThresholdType']),
    actionThresholdValue: (json['ActionThresholdValue'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ActionThresholdToJson(ActionThreshold instance) =>
    <String, dynamic>{
      'ActionThresholdType':
          _$ThresholdTypeEnumMap[instance.actionThresholdType],
      'ActionThresholdValue': instance.actionThresholdValue,
    };

const _$ThresholdTypeEnumMap = {
  ThresholdType.percentage: 'PERCENTAGE',
  ThresholdType.absoluteValue: 'ABSOLUTE_VALUE',
};

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return Budget(
    budgetName: json['BudgetName'] as String,
    budgetType: _$enumDecode(_$BudgetTypeEnumMap, json['BudgetType']),
    timeUnit: _$enumDecode(_$TimeUnitEnumMap, json['TimeUnit']),
    budgetLimit: json['BudgetLimit'] == null
        ? null
        : Spend.fromJson(json['BudgetLimit'] as Map<String, dynamic>),
    calculatedSpend: json['CalculatedSpend'] == null
        ? null
        : CalculatedSpend.fromJson(
            json['CalculatedSpend'] as Map<String, dynamic>),
    costFilters: (json['CostFilters'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
    costTypes: json['CostTypes'] == null
        ? null
        : CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    plannedBudgetLimits:
        (json['PlannedBudgetLimits'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Spend.fromJson(e as Map<String, dynamic>)),
    ),
    timePeriod: json['TimePeriod'] == null
        ? null
        : TimePeriod.fromJson(json['TimePeriod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BudgetToJson(Budget instance) {
  final val = <String, dynamic>{
    'BudgetName': instance.budgetName,
    'BudgetType': _$BudgetTypeEnumMap[instance.budgetType],
    'TimeUnit': _$TimeUnitEnumMap[instance.timeUnit],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BudgetLimit', instance.budgetLimit?.toJson());
  writeNotNull('CalculatedSpend', instance.calculatedSpend?.toJson());
  writeNotNull('CostFilters', instance.costFilters);
  writeNotNull('CostTypes', instance.costTypes?.toJson());
  writeNotNull('LastUpdatedTime',
      const UnixDateTimeConverter().toJson(instance.lastUpdatedTime));
  writeNotNull('PlannedBudgetLimits',
      instance.plannedBudgetLimits?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('TimePeriod', instance.timePeriod?.toJson());
  return val;
}

const _$BudgetTypeEnumMap = {
  BudgetType.usage: 'USAGE',
  BudgetType.cost: 'COST',
  BudgetType.riUtilization: 'RI_UTILIZATION',
  BudgetType.riCoverage: 'RI_COVERAGE',
  BudgetType.savingsPlansUtilization: 'SAVINGS_PLANS_UTILIZATION',
  BudgetType.savingsPlansCoverage: 'SAVINGS_PLANS_COVERAGE',
};

const _$TimeUnitEnumMap = {
  TimeUnit.daily: 'DAILY',
  TimeUnit.monthly: 'MONTHLY',
  TimeUnit.quarterly: 'QUARTERLY',
  TimeUnit.annually: 'ANNUALLY',
};

BudgetPerformanceHistory _$BudgetPerformanceHistoryFromJson(
    Map<String, dynamic> json) {
  return BudgetPerformanceHistory(
    budgetName: json['BudgetName'] as String?,
    budgetType: _$enumDecodeNullable(_$BudgetTypeEnumMap, json['BudgetType']),
    budgetedAndActualAmountsList: (json['BudgetedAndActualAmountsList']
            as List<dynamic>?)
        ?.map(
            (e) => BudgetedAndActualAmounts.fromJson(e as Map<String, dynamic>))
        .toList(),
    costFilters: (json['CostFilters'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
    costTypes: json['CostTypes'] == null
        ? null
        : CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>),
    timeUnit: _$enumDecodeNullable(_$TimeUnitEnumMap, json['TimeUnit']),
  );
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

BudgetedAndActualAmounts _$BudgetedAndActualAmountsFromJson(
    Map<String, dynamic> json) {
  return BudgetedAndActualAmounts(
    actualAmount: json['ActualAmount'] == null
        ? null
        : Spend.fromJson(json['ActualAmount'] as Map<String, dynamic>),
    budgetedAmount: json['BudgetedAmount'] == null
        ? null
        : Spend.fromJson(json['BudgetedAmount'] as Map<String, dynamic>),
    timePeriod: json['TimePeriod'] == null
        ? null
        : TimePeriod.fromJson(json['TimePeriod'] as Map<String, dynamic>),
  );
}

CalculatedSpend _$CalculatedSpendFromJson(Map<String, dynamic> json) {
  return CalculatedSpend(
    actualSpend: Spend.fromJson(json['ActualSpend'] as Map<String, dynamic>),
    forecastedSpend: json['ForecastedSpend'] == null
        ? null
        : Spend.fromJson(json['ForecastedSpend'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CalculatedSpendToJson(CalculatedSpend instance) {
  final val = <String, dynamic>{
    'ActualSpend': instance.actualSpend.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ForecastedSpend', instance.forecastedSpend?.toJson());
  return val;
}

CostTypes _$CostTypesFromJson(Map<String, dynamic> json) {
  return CostTypes(
    includeCredit: json['IncludeCredit'] as bool?,
    includeDiscount: json['IncludeDiscount'] as bool?,
    includeOtherSubscription: json['IncludeOtherSubscription'] as bool?,
    includeRecurring: json['IncludeRecurring'] as bool?,
    includeRefund: json['IncludeRefund'] as bool?,
    includeSubscription: json['IncludeSubscription'] as bool?,
    includeSupport: json['IncludeSupport'] as bool?,
    includeTax: json['IncludeTax'] as bool?,
    includeUpfront: json['IncludeUpfront'] as bool?,
    useAmortized: json['UseAmortized'] as bool?,
    useBlended: json['UseBlended'] as bool?,
  );
}

Map<String, dynamic> _$CostTypesToJson(CostTypes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IncludeCredit', instance.includeCredit);
  writeNotNull('IncludeDiscount', instance.includeDiscount);
  writeNotNull('IncludeOtherSubscription', instance.includeOtherSubscription);
  writeNotNull('IncludeRecurring', instance.includeRecurring);
  writeNotNull('IncludeRefund', instance.includeRefund);
  writeNotNull('IncludeSubscription', instance.includeSubscription);
  writeNotNull('IncludeSupport', instance.includeSupport);
  writeNotNull('IncludeTax', instance.includeTax);
  writeNotNull('IncludeUpfront', instance.includeUpfront);
  writeNotNull('UseAmortized', instance.useAmortized);
  writeNotNull('UseBlended', instance.useBlended);
  return val;
}

CreateBudgetActionResponse _$CreateBudgetActionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBudgetActionResponse(
    accountId: json['AccountId'] as String,
    actionId: json['ActionId'] as String,
    budgetName: json['BudgetName'] as String,
  );
}

CreateBudgetResponse _$CreateBudgetResponseFromJson(Map<String, dynamic> json) {
  return CreateBudgetResponse();
}

CreateNotificationResponse _$CreateNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateNotificationResponse();
}

CreateSubscriberResponse _$CreateSubscriberResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSubscriberResponse();
}

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return Definition(
    iamActionDefinition: json['IamActionDefinition'] == null
        ? null
        : IamActionDefinition.fromJson(
            json['IamActionDefinition'] as Map<String, dynamic>),
    scpActionDefinition: json['ScpActionDefinition'] == null
        ? null
        : ScpActionDefinition.fromJson(
            json['ScpActionDefinition'] as Map<String, dynamic>),
    ssmActionDefinition: json['SsmActionDefinition'] == null
        ? null
        : SsmActionDefinition.fromJson(
            json['SsmActionDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DefinitionToJson(Definition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamActionDefinition', instance.iamActionDefinition?.toJson());
  writeNotNull('ScpActionDefinition', instance.scpActionDefinition?.toJson());
  writeNotNull('SsmActionDefinition', instance.ssmActionDefinition?.toJson());
  return val;
}

DeleteBudgetActionResponse _$DeleteBudgetActionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBudgetActionResponse(
    accountId: json['AccountId'] as String,
    action: Action.fromJson(json['Action'] as Map<String, dynamic>),
    budgetName: json['BudgetName'] as String,
  );
}

DeleteBudgetResponse _$DeleteBudgetResponseFromJson(Map<String, dynamic> json) {
  return DeleteBudgetResponse();
}

DeleteNotificationResponse _$DeleteNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNotificationResponse();
}

DeleteSubscriberResponse _$DeleteSubscriberResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSubscriberResponse();
}

DescribeBudgetActionHistoriesResponse
    _$DescribeBudgetActionHistoriesResponseFromJson(Map<String, dynamic> json) {
  return DescribeBudgetActionHistoriesResponse(
    actionHistories: (json['ActionHistories'] as List<dynamic>)
        .map((e) => ActionHistory.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeBudgetActionResponse _$DescribeBudgetActionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBudgetActionResponse(
    accountId: json['AccountId'] as String,
    action: Action.fromJson(json['Action'] as Map<String, dynamic>),
    budgetName: json['BudgetName'] as String,
  );
}

DescribeBudgetActionsForAccountResponse
    _$DescribeBudgetActionsForAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeBudgetActionsForAccountResponse(
    actions: (json['Actions'] as List<dynamic>)
        .map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeBudgetActionsForBudgetResponse
    _$DescribeBudgetActionsForBudgetResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeBudgetActionsForBudgetResponse(
    actions: (json['Actions'] as List<dynamic>)
        .map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeBudgetPerformanceHistoryResponse
    _$DescribeBudgetPerformanceHistoryResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeBudgetPerformanceHistoryResponse(
    budgetPerformanceHistory: json['BudgetPerformanceHistory'] == null
        ? null
        : BudgetPerformanceHistory.fromJson(
            json['BudgetPerformanceHistory'] as Map<String, dynamic>),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeBudgetResponse _$DescribeBudgetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBudgetResponse(
    budget: json['Budget'] == null
        ? null
        : Budget.fromJson(json['Budget'] as Map<String, dynamic>),
  );
}

DescribeBudgetsResponse _$DescribeBudgetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBudgetsResponse(
    budgets: (json['Budgets'] as List<dynamic>?)
        ?.map((e) => Budget.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeNotificationsForBudgetResponse
    _$DescribeNotificationsForBudgetResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeNotificationsForBudgetResponse(
    nextToken: json['NextToken'] as String?,
    notifications: (json['Notifications'] as List<dynamic>?)
        ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeSubscribersForNotificationResponse
    _$DescribeSubscribersForNotificationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeSubscribersForNotificationResponse(
    nextToken: json['NextToken'] as String?,
    subscribers: (json['Subscribers'] as List<dynamic>?)
        ?.map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ExecuteBudgetActionResponse _$ExecuteBudgetActionResponseFromJson(
    Map<String, dynamic> json) {
  return ExecuteBudgetActionResponse(
    accountId: json['AccountId'] as String,
    actionId: json['ActionId'] as String,
    budgetName: json['BudgetName'] as String,
    executionType: _$enumDecode(_$ExecutionTypeEnumMap, json['ExecutionType']),
  );
}

const _$ExecutionTypeEnumMap = {
  ExecutionType.approveBudgetAction: 'APPROVE_BUDGET_ACTION',
  ExecutionType.retryBudgetAction: 'RETRY_BUDGET_ACTION',
  ExecutionType.reverseBudgetAction: 'REVERSE_BUDGET_ACTION',
  ExecutionType.resetBudgetAction: 'RESET_BUDGET_ACTION',
};

IamActionDefinition _$IamActionDefinitionFromJson(Map<String, dynamic> json) {
  return IamActionDefinition(
    policyArn: json['PolicyArn'] as String,
    groups:
        (json['Groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
    roles: (json['Roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    users: (json['Users'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$IamActionDefinitionToJson(IamActionDefinition instance) {
  final val = <String, dynamic>{
    'PolicyArn': instance.policyArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Groups', instance.groups);
  writeNotNull('Roles', instance.roles);
  writeNotNull('Users', instance.users);
  return val;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    comparisonOperator:
        _$enumDecode(_$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    notificationType:
        _$enumDecode(_$NotificationTypeEnumMap, json['NotificationType']),
    threshold: (json['Threshold'] as num).toDouble(),
    notificationState: _$enumDecodeNullable(
        _$NotificationStateEnumMap, json['NotificationState']),
    thresholdType:
        _$enumDecodeNullable(_$ThresholdTypeEnumMap, json['ThresholdType']),
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) {
  final val = <String, dynamic>{
    'ComparisonOperator':
        _$ComparisonOperatorEnumMap[instance.comparisonOperator],
    'NotificationType': _$NotificationTypeEnumMap[instance.notificationType],
    'Threshold': instance.threshold,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotificationState',
      _$NotificationStateEnumMap[instance.notificationState]);
  writeNotNull('ThresholdType', _$ThresholdTypeEnumMap[instance.thresholdType]);
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.greaterThan: 'GREATER_THAN',
  ComparisonOperator.lessThan: 'LESS_THAN',
  ComparisonOperator.equalTo: 'EQUAL_TO',
};

const _$NotificationStateEnumMap = {
  NotificationState.ok: 'OK',
  NotificationState.alarm: 'ALARM',
};

Map<String, dynamic> _$NotificationWithSubscribersToJson(
        NotificationWithSubscribers instance) =>
    <String, dynamic>{
      'Notification': instance.notification.toJson(),
      'Subscribers': instance.subscribers.map((e) => e.toJson()).toList(),
    };

ScpActionDefinition _$ScpActionDefinitionFromJson(Map<String, dynamic> json) {
  return ScpActionDefinition(
    policyId: json['PolicyId'] as String,
    targetIds:
        (json['TargetIds'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ScpActionDefinitionToJson(
        ScpActionDefinition instance) =>
    <String, dynamic>{
      'PolicyId': instance.policyId,
      'TargetIds': instance.targetIds,
    };

Spend _$SpendFromJson(Map<String, dynamic> json) {
  return Spend(
    amount: json['Amount'] as String,
    unit: json['Unit'] as String,
  );
}

Map<String, dynamic> _$SpendToJson(Spend instance) => <String, dynamic>{
      'Amount': instance.amount,
      'Unit': instance.unit,
    };

SsmActionDefinition _$SsmActionDefinitionFromJson(Map<String, dynamic> json) {
  return SsmActionDefinition(
    actionSubType: _$enumDecode(_$ActionSubTypeEnumMap, json['ActionSubType']),
    instanceIds:
        (json['InstanceIds'] as List<dynamic>).map((e) => e as String).toList(),
    region: json['Region'] as String,
  );
}

Map<String, dynamic> _$SsmActionDefinitionToJson(
        SsmActionDefinition instance) =>
    <String, dynamic>{
      'ActionSubType': _$ActionSubTypeEnumMap[instance.actionSubType],
      'InstanceIds': instance.instanceIds,
      'Region': instance.region,
    };

const _$ActionSubTypeEnumMap = {
  ActionSubType.stopEc2Instances: 'STOP_EC2_INSTANCES',
  ActionSubType.stopRdsInstances: 'STOP_RDS_INSTANCES',
};

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) {
  return Subscriber(
    address: json['Address'] as String,
    subscriptionType:
        _$enumDecode(_$SubscriptionTypeEnumMap, json['SubscriptionType']),
  );
}

Map<String, dynamic> _$SubscriberToJson(Subscriber instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'SubscriptionType': _$SubscriptionTypeEnumMap[instance.subscriptionType],
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.sns: 'SNS',
  SubscriptionType.email: 'EMAIL',
};

TimePeriod _$TimePeriodFromJson(Map<String, dynamic> json) {
  return TimePeriod(
    end: const UnixDateTimeConverter().fromJson(json['End']),
    start: const UnixDateTimeConverter().fromJson(json['Start']),
  );
}

Map<String, dynamic> _$TimePeriodToJson(TimePeriod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('End', const UnixDateTimeConverter().toJson(instance.end));
  writeNotNull('Start', const UnixDateTimeConverter().toJson(instance.start));
  return val;
}

UpdateBudgetActionResponse _$UpdateBudgetActionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBudgetActionResponse(
    accountId: json['AccountId'] as String,
    budgetName: json['BudgetName'] as String,
    newAction: Action.fromJson(json['NewAction'] as Map<String, dynamic>),
    oldAction: Action.fromJson(json['OldAction'] as Map<String, dynamic>),
  );
}

UpdateBudgetResponse _$UpdateBudgetResponseFromJson(Map<String, dynamic> json) {
  return UpdateBudgetResponse();
}

UpdateNotificationResponse _$UpdateNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNotificationResponse();
}

UpdateSubscriberResponse _$UpdateSubscriberResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSubscriberResponse();
}
