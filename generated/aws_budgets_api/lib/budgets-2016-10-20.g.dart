// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets-2016-10-20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return Budget(
    budgetName: json['BudgetName'] as String,
    budgetType: _$enumDecodeNullable(_$BudgetTypeEnumMap, json['BudgetType']),
    timeUnit: _$enumDecodeNullable(_$TimeUnitEnumMap, json['TimeUnit']),
    budgetLimit: json['BudgetLimit'] == null
        ? null
        : Spend.fromJson(json['BudgetLimit'] as Map<String, dynamic>),
    calculatedSpend: json['CalculatedSpend'] == null
        ? null
        : CalculatedSpend.fromJson(
            json['CalculatedSpend'] as Map<String, dynamic>),
    costFilters: (json['CostFilters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    costTypes: json['CostTypes'] == null
        ? null
        : CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>),
    lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
    plannedBudgetLimits:
        (json['PlannedBudgetLimits'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Spend.fromJson(e as Map<String, dynamic>)),
    ),
    timePeriod: json['TimePeriod'] == null
        ? null
        : TimePeriod.fromJson(json['TimePeriod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BudgetToJson(Budget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BudgetName', instance.budgetName);
  writeNotNull('BudgetType', _$BudgetTypeEnumMap[instance.budgetType]);
  writeNotNull('TimeUnit', _$TimeUnitEnumMap[instance.timeUnit]);
  writeNotNull('BudgetLimit', instance.budgetLimit?.toJson());
  writeNotNull('CalculatedSpend', instance.calculatedSpend?.toJson());
  writeNotNull('CostFilters', instance.costFilters);
  writeNotNull('CostTypes', instance.costTypes?.toJson());
  writeNotNull(
      'LastUpdatedTime', unixTimestampToJson(instance.lastUpdatedTime));
  writeNotNull('PlannedBudgetLimits',
      instance.plannedBudgetLimits?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TimePeriod', instance.timePeriod?.toJson());
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
    budgetName: json['BudgetName'] as String,
    budgetType: _$enumDecodeNullable(_$BudgetTypeEnumMap, json['BudgetType']),
    budgetedAndActualAmountsList: (json['BudgetedAndActualAmountsList'] as List)
        ?.map((e) => e == null
            ? null
            : BudgetedAndActualAmounts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    costFilters: (json['CostFilters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    costTypes: json['CostTypes'] == null
        ? null
        : CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>),
    timeUnit: _$enumDecodeNullable(_$TimeUnitEnumMap, json['TimeUnit']),
  );
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
    actualSpend: json['ActualSpend'] == null
        ? null
        : Spend.fromJson(json['ActualSpend'] as Map<String, dynamic>),
    forecastedSpend: json['ForecastedSpend'] == null
        ? null
        : Spend.fromJson(json['ForecastedSpend'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CalculatedSpendToJson(CalculatedSpend instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActualSpend', instance.actualSpend?.toJson());
  writeNotNull('ForecastedSpend', instance.forecastedSpend?.toJson());
  return val;
}

CostTypes _$CostTypesFromJson(Map<String, dynamic> json) {
  return CostTypes(
    includeCredit: json['IncludeCredit'] as bool,
    includeDiscount: json['IncludeDiscount'] as bool,
    includeOtherSubscription: json['IncludeOtherSubscription'] as bool,
    includeRecurring: json['IncludeRecurring'] as bool,
    includeRefund: json['IncludeRefund'] as bool,
    includeSubscription: json['IncludeSubscription'] as bool,
    includeSupport: json['IncludeSupport'] as bool,
    includeTax: json['IncludeTax'] as bool,
    includeUpfront: json['IncludeUpfront'] as bool,
    useAmortized: json['UseAmortized'] as bool,
    useBlended: json['UseBlended'] as bool,
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

DescribeBudgetPerformanceHistoryResponse
    _$DescribeBudgetPerformanceHistoryResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeBudgetPerformanceHistoryResponse(
    budgetPerformanceHistory: json['BudgetPerformanceHistory'] == null
        ? null
        : BudgetPerformanceHistory.fromJson(
            json['BudgetPerformanceHistory'] as Map<String, dynamic>),
    nextToken: json['NextToken'] as String,
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
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : Budget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeNotificationsForBudgetResponse
    _$DescribeNotificationsForBudgetResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeNotificationsForBudgetResponse(
    nextToken: json['NextToken'] as String,
    notifications: (json['Notifications'] as List)
        ?.map((e) =>
            e == null ? null : Notification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSubscribersForNotificationResponse
    _$DescribeSubscribersForNotificationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeSubscribersForNotificationResponse(
    nextToken: json['NextToken'] as String,
    subscribers: (json['Subscribers'] as List)
        ?.map((e) =>
            e == null ? null : Subscriber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    notificationType: _$enumDecodeNullable(
        _$NotificationTypeEnumMap, json['NotificationType']),
    threshold: (json['Threshold'] as num)?.toDouble(),
    notificationState: _$enumDecodeNullable(
        _$NotificationStateEnumMap, json['NotificationState']),
    thresholdType:
        _$enumDecodeNullable(_$ThresholdTypeEnumMap, json['ThresholdType']),
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull(
      'NotificationType', _$NotificationTypeEnumMap[instance.notificationType]);
  writeNotNull('Threshold', instance.threshold);
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

const _$NotificationTypeEnumMap = {
  NotificationType.actual: 'ACTUAL',
  NotificationType.forecasted: 'FORECASTED',
};

const _$NotificationStateEnumMap = {
  NotificationState.ok: 'OK',
  NotificationState.alarm: 'ALARM',
};

const _$ThresholdTypeEnumMap = {
  ThresholdType.percentage: 'PERCENTAGE',
  ThresholdType.absoluteValue: 'ABSOLUTE_VALUE',
};

Map<String, dynamic> _$NotificationWithSubscribersToJson(
    NotificationWithSubscribers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull(
      'Subscribers', instance.subscribers?.map((e) => e?.toJson())?.toList());
  return val;
}

Spend _$SpendFromJson(Map<String, dynamic> json) {
  return Spend(
    amount: json['Amount'] as String,
    unit: json['Unit'] as String,
  );
}

Map<String, dynamic> _$SpendToJson(Spend instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amount', instance.amount);
  writeNotNull('Unit', instance.unit);
  return val;
}

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) {
  return Subscriber(
    address: json['Address'] as String,
    subscriptionType: _$enumDecodeNullable(
        _$SubscriptionTypeEnumMap, json['SubscriptionType']),
  );
}

Map<String, dynamic> _$SubscriberToJson(Subscriber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull(
      'SubscriptionType', _$SubscriptionTypeEnumMap[instance.subscriptionType]);
  return val;
}

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.sns: 'SNS',
  SubscriptionType.email: 'EMAIL',
};

TimePeriod _$TimePeriodFromJson(Map<String, dynamic> json) {
  return TimePeriod(
    end: timeStampFromJson(json['End']),
    start: timeStampFromJson(json['Start']),
  );
}

Map<String, dynamic> _$TimePeriodToJson(TimePeriod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('End', unixTimestampToJson(instance.end));
  writeNotNull('Start', unixTimestampToJson(instance.start));
  return val;
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
