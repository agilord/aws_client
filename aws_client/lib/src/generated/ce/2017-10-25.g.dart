// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anomaly _$AnomalyFromJson(Map<String, dynamic> json) {
  return Anomaly(
    anomalyId: json['AnomalyId'] as String,
    anomalyScore: json['AnomalyScore'] == null
        ? null
        : AnomalyScore.fromJson(json['AnomalyScore'] as Map<String, dynamic>),
    impact: json['Impact'] == null
        ? null
        : Impact.fromJson(json['Impact'] as Map<String, dynamic>),
    monitorArn: json['MonitorArn'] as String,
    anomalyEndDate: json['AnomalyEndDate'] as String,
    anomalyStartDate: json['AnomalyStartDate'] as String,
    dimensionValue: json['DimensionValue'] as String,
    feedback:
        _$enumDecodeNullable(_$AnomalyFeedbackTypeEnumMap, json['Feedback']),
    rootCauses: (json['RootCauses'] as List)
        ?.map((e) =>
            e == null ? null : RootCause.fromJson(e as Map<String, dynamic>))
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

const _$AnomalyFeedbackTypeEnumMap = {
  AnomalyFeedbackType.yes: 'YES',
  AnomalyFeedbackType.no: 'NO',
  AnomalyFeedbackType.plannedActivity: 'PLANNED_ACTIVITY',
};

Map<String, dynamic> _$AnomalyDateIntervalToJson(AnomalyDateInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartDate', instance.startDate);
  writeNotNull('EndDate', instance.endDate);
  return val;
}

AnomalyMonitor _$AnomalyMonitorFromJson(Map<String, dynamic> json) {
  return AnomalyMonitor(
    monitorName: json['MonitorName'] as String,
    monitorType:
        _$enumDecodeNullable(_$MonitorTypeEnumMap, json['MonitorType']),
    creationDate: json['CreationDate'] as String,
    dimensionalValueCount: json['DimensionalValueCount'] as int,
    lastEvaluatedDate: json['LastEvaluatedDate'] as String,
    lastUpdatedDate: json['LastUpdatedDate'] as String,
    monitorArn: json['MonitorArn'] as String,
    monitorDimension: _$enumDecodeNullable(
        _$MonitorDimensionEnumMap, json['MonitorDimension']),
    monitorSpecification: json['MonitorSpecification'] == null
        ? null
        : Expression.fromJson(
            json['MonitorSpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnomalyMonitorToJson(AnomalyMonitor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MonitorName', instance.monitorName);
  writeNotNull('MonitorType', _$MonitorTypeEnumMap[instance.monitorType]);
  writeNotNull('CreationDate', instance.creationDate);
  writeNotNull('DimensionalValueCount', instance.dimensionalValueCount);
  writeNotNull('LastEvaluatedDate', instance.lastEvaluatedDate);
  writeNotNull('LastUpdatedDate', instance.lastUpdatedDate);
  writeNotNull('MonitorArn', instance.monitorArn);
  writeNotNull(
      'MonitorDimension', _$MonitorDimensionEnumMap[instance.monitorDimension]);
  writeNotNull('MonitorSpecification', instance.monitorSpecification?.toJson());
  return val;
}

const _$MonitorTypeEnumMap = {
  MonitorType.dimensional: 'DIMENSIONAL',
  MonitorType.custom: 'CUSTOM',
};

const _$MonitorDimensionEnumMap = {
  MonitorDimension.service: 'SERVICE',
};

AnomalyScore _$AnomalyScoreFromJson(Map<String, dynamic> json) {
  return AnomalyScore(
    currentScore: (json['CurrentScore'] as num)?.toDouble(),
    maxScore: (json['MaxScore'] as num)?.toDouble(),
  );
}

AnomalySubscription _$AnomalySubscriptionFromJson(Map<String, dynamic> json) {
  return AnomalySubscription(
    frequency: _$enumDecodeNullable(
        _$AnomalySubscriptionFrequencyEnumMap, json['Frequency']),
    monitorArnList:
        (json['MonitorArnList'] as List)?.map((e) => e as String)?.toList(),
    subscribers: (json['Subscribers'] as List)
        ?.map((e) =>
            e == null ? null : Subscriber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subscriptionName: json['SubscriptionName'] as String,
    threshold: (json['Threshold'] as num)?.toDouble(),
    accountId: json['AccountId'] as String,
    subscriptionArn: json['SubscriptionArn'] as String,
  );
}

Map<String, dynamic> _$AnomalySubscriptionToJson(AnomalySubscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Frequency', _$AnomalySubscriptionFrequencyEnumMap[instance.frequency]);
  writeNotNull('MonitorArnList', instance.monitorArnList);
  writeNotNull(
      'Subscribers', instance.subscribers?.map((e) => e?.toJson())?.toList());
  writeNotNull('SubscriptionName', instance.subscriptionName);
  writeNotNull('Threshold', instance.threshold);
  writeNotNull('AccountId', instance.accountId);
  writeNotNull('SubscriptionArn', instance.subscriptionArn);
  return val;
}

const _$AnomalySubscriptionFrequencyEnumMap = {
  AnomalySubscriptionFrequency.daily: 'DAILY',
  AnomalySubscriptionFrequency.immediate: 'IMMEDIATE',
  AnomalySubscriptionFrequency.weekly: 'WEEKLY',
};

CostCategory _$CostCategoryFromJson(Map<String, dynamic> json) {
  return CostCategory(
    costCategoryArn: json['CostCategoryArn'] as String,
    effectiveStart: json['EffectiveStart'] as String,
    name: json['Name'] as String,
    ruleVersion: _$enumDecodeNullable(
        _$CostCategoryRuleVersionEnumMap, json['RuleVersion']),
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : CostCategoryRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    effectiveEnd: json['EffectiveEnd'] as String,
    processingStatus: (json['ProcessingStatus'] as List)
        ?.map((e) => e == null
            ? null
            : CostCategoryProcessingStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$CostCategoryRuleVersionEnumMap = {
  CostCategoryRuleVersion.costCategoryExpressionV1: 'CostCategoryExpression.v1',
};

CostCategoryProcessingStatus _$CostCategoryProcessingStatusFromJson(
    Map<String, dynamic> json) {
  return CostCategoryProcessingStatus(
    component: _$enumDecodeNullable(
        _$CostCategoryStatusComponentEnumMap, json['Component']),
    status: _$enumDecodeNullable(_$CostCategoryStatusEnumMap, json['Status']),
  );
}

const _$CostCategoryStatusComponentEnumMap = {
  CostCategoryStatusComponent.costExplorer: 'COST_EXPLORER',
};

const _$CostCategoryStatusEnumMap = {
  CostCategoryStatus.processing: 'PROCESSING',
  CostCategoryStatus.applied: 'APPLIED',
};

CostCategoryReference _$CostCategoryReferenceFromJson(
    Map<String, dynamic> json) {
  return CostCategoryReference(
    costCategoryArn: json['CostCategoryArn'] as String,
    effectiveEnd: json['EffectiveEnd'] as String,
    effectiveStart: json['EffectiveStart'] as String,
    name: json['Name'] as String,
    numberOfRules: json['NumberOfRules'] as int,
    processingStatus: (json['ProcessingStatus'] as List)
        ?.map((e) => e == null
            ? null
            : CostCategoryProcessingStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

CostCategoryRule _$CostCategoryRuleFromJson(Map<String, dynamic> json) {
  return CostCategoryRule(
    rule: json['Rule'] == null
        ? null
        : Expression.fromJson(json['Rule'] as Map<String, dynamic>),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$CostCategoryRuleToJson(CostCategoryRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rule', instance.rule?.toJson());
  writeNotNull('Value', instance.value);
  return val;
}

CostCategoryValues _$CostCategoryValuesFromJson(Map<String, dynamic> json) {
  return CostCategoryValues(
    key: json['Key'] as String,
    matchOptions: (json['MatchOptions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$MatchOptionEnumMap, e))
        ?.toList(),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CostCategoryValuesToJson(CostCategoryValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('MatchOptions',
      instance.matchOptions?.map((e) => _$MatchOptionEnumMap[e])?.toList());
  writeNotNull('Values', instance.values);
  return val;
}

const _$MatchOptionEnumMap = {
  MatchOption.equals: 'EQUALS',
  MatchOption.startsWith: 'STARTS_WITH',
  MatchOption.endsWith: 'ENDS_WITH',
  MatchOption.contains: 'CONTAINS',
  MatchOption.caseSensitive: 'CASE_SENSITIVE',
  MatchOption.caseInsensitive: 'CASE_INSENSITIVE',
};

Coverage _$CoverageFromJson(Map<String, dynamic> json) {
  return Coverage(
    coverageCost: json['CoverageCost'] == null
        ? null
        : CoverageCost.fromJson(json['CoverageCost'] as Map<String, dynamic>),
    coverageHours: json['CoverageHours'] == null
        ? null
        : CoverageHours.fromJson(json['CoverageHours'] as Map<String, dynamic>),
    coverageNormalizedUnits: json['CoverageNormalizedUnits'] == null
        ? null
        : CoverageNormalizedUnits.fromJson(
            json['CoverageNormalizedUnits'] as Map<String, dynamic>),
  );
}

CoverageByTime _$CoverageByTimeFromJson(Map<String, dynamic> json) {
  return CoverageByTime(
    groups: (json['Groups'] as List)
        ?.map((e) => e == null
            ? null
            : ReservationCoverageGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
    total: json['Total'] == null
        ? null
        : Coverage.fromJson(json['Total'] as Map<String, dynamic>),
  );
}

CoverageCost _$CoverageCostFromJson(Map<String, dynamic> json) {
  return CoverageCost(
    onDemandCost: json['OnDemandCost'] as String,
  );
}

CoverageHours _$CoverageHoursFromJson(Map<String, dynamic> json) {
  return CoverageHours(
    coverageHoursPercentage: json['CoverageHoursPercentage'] as String,
    onDemandHours: json['OnDemandHours'] as String,
    reservedHours: json['ReservedHours'] as String,
    totalRunningHours: json['TotalRunningHours'] as String,
  );
}

CoverageNormalizedUnits _$CoverageNormalizedUnitsFromJson(
    Map<String, dynamic> json) {
  return CoverageNormalizedUnits(
    coverageNormalizedUnitsPercentage:
        json['CoverageNormalizedUnitsPercentage'] as String,
    onDemandNormalizedUnits: json['OnDemandNormalizedUnits'] as String,
    reservedNormalizedUnits: json['ReservedNormalizedUnits'] as String,
    totalRunningNormalizedUnits: json['TotalRunningNormalizedUnits'] as String,
  );
}

CreateAnomalyMonitorResponse _$CreateAnomalyMonitorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAnomalyMonitorResponse(
    monitorArn: json['MonitorArn'] as String,
  );
}

CreateAnomalySubscriptionResponse _$CreateAnomalySubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAnomalySubscriptionResponse(
    subscriptionArn: json['SubscriptionArn'] as String,
  );
}

CreateCostCategoryDefinitionResponse
    _$CreateCostCategoryDefinitionResponseFromJson(Map<String, dynamic> json) {
  return CreateCostCategoryDefinitionResponse(
    costCategoryArn: json['CostCategoryArn'] as String,
    effectiveStart: json['EffectiveStart'] as String,
  );
}

CurrentInstance _$CurrentInstanceFromJson(Map<String, dynamic> json) {
  return CurrentInstance(
    currencyCode: json['CurrencyCode'] as String,
    instanceName: json['InstanceName'] as String,
    monthlyCost: json['MonthlyCost'] as String,
    onDemandHoursInLookbackPeriod:
        json['OnDemandHoursInLookbackPeriod'] as String,
    reservationCoveredHoursInLookbackPeriod:
        json['ReservationCoveredHoursInLookbackPeriod'] as String,
    resourceDetails: json['ResourceDetails'] == null
        ? null
        : ResourceDetails.fromJson(
            json['ResourceDetails'] as Map<String, dynamic>),
    resourceId: json['ResourceId'] as String,
    resourceUtilization: json['ResourceUtilization'] == null
        ? null
        : ResourceUtilization.fromJson(
            json['ResourceUtilization'] as Map<String, dynamic>),
    savingsPlansCoveredHoursInLookbackPeriod:
        json['SavingsPlansCoveredHoursInLookbackPeriod'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) =>
            e == null ? null : TagValues.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalRunningHoursInLookbackPeriod:
        json['TotalRunningHoursInLookbackPeriod'] as String,
  );
}

DateInterval _$DateIntervalFromJson(Map<String, dynamic> json) {
  return DateInterval(
    end: json['End'] as String,
    start: json['Start'] as String,
  );
}

Map<String, dynamic> _$DateIntervalToJson(DateInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('End', instance.end);
  writeNotNull('Start', instance.start);
  return val;
}

DeleteAnomalyMonitorResponse _$DeleteAnomalyMonitorResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAnomalyMonitorResponse();
}

DeleteAnomalySubscriptionResponse _$DeleteAnomalySubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAnomalySubscriptionResponse();
}

DeleteCostCategoryDefinitionResponse
    _$DeleteCostCategoryDefinitionResponseFromJson(Map<String, dynamic> json) {
  return DeleteCostCategoryDefinitionResponse(
    costCategoryArn: json['CostCategoryArn'] as String,
    effectiveEnd: json['EffectiveEnd'] as String,
  );
}

DescribeCostCategoryDefinitionResponse
    _$DescribeCostCategoryDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeCostCategoryDefinitionResponse(
    costCategory: json['CostCategory'] == null
        ? null
        : CostCategory.fromJson(json['CostCategory'] as Map<String, dynamic>),
  );
}

DimensionValues _$DimensionValuesFromJson(Map<String, dynamic> json) {
  return DimensionValues(
    key: _$enumDecodeNullable(_$DimensionEnumMap, json['Key']),
    matchOptions: (json['MatchOptions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$MatchOptionEnumMap, e))
        ?.toList(),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DimensionValuesToJson(DimensionValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$DimensionEnumMap[instance.key]);
  writeNotNull('MatchOptions',
      instance.matchOptions?.map((e) => _$MatchOptionEnumMap[e])?.toList());
  writeNotNull('Values', instance.values);
  return val;
}

const _$DimensionEnumMap = {
  Dimension.az: 'AZ',
  Dimension.instanceType: 'INSTANCE_TYPE',
  Dimension.linkedAccount: 'LINKED_ACCOUNT',
  Dimension.linkedAccountName: 'LINKED_ACCOUNT_NAME',
  Dimension.operation: 'OPERATION',
  Dimension.purchaseType: 'PURCHASE_TYPE',
  Dimension.region: 'REGION',
  Dimension.service: 'SERVICE',
  Dimension.serviceCode: 'SERVICE_CODE',
  Dimension.usageType: 'USAGE_TYPE',
  Dimension.usageTypeGroup: 'USAGE_TYPE_GROUP',
  Dimension.recordType: 'RECORD_TYPE',
  Dimension.operatingSystem: 'OPERATING_SYSTEM',
  Dimension.tenancy: 'TENANCY',
  Dimension.scope: 'SCOPE',
  Dimension.platform: 'PLATFORM',
  Dimension.subscriptionId: 'SUBSCRIPTION_ID',
  Dimension.legalEntityName: 'LEGAL_ENTITY_NAME',
  Dimension.deploymentOption: 'DEPLOYMENT_OPTION',
  Dimension.databaseEngine: 'DATABASE_ENGINE',
  Dimension.cacheEngine: 'CACHE_ENGINE',
  Dimension.instanceTypeFamily: 'INSTANCE_TYPE_FAMILY',
  Dimension.billingEntity: 'BILLING_ENTITY',
  Dimension.reservationId: 'RESERVATION_ID',
  Dimension.resourceId: 'RESOURCE_ID',
  Dimension.rightsizingType: 'RIGHTSIZING_TYPE',
  Dimension.savingsPlansType: 'SAVINGS_PLANS_TYPE',
  Dimension.savingsPlanArn: 'SAVINGS_PLAN_ARN',
  Dimension.paymentOption: 'PAYMENT_OPTION',
};

DimensionValuesWithAttributes _$DimensionValuesWithAttributesFromJson(
    Map<String, dynamic> json) {
  return DimensionValuesWithAttributes(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    value: json['Value'] as String,
  );
}

EBSResourceUtilization _$EBSResourceUtilizationFromJson(
    Map<String, dynamic> json) {
  return EBSResourceUtilization(
    ebsReadBytesPerSecond: json['EbsReadBytesPerSecond'] as String,
    ebsReadOpsPerSecond: json['EbsReadOpsPerSecond'] as String,
    ebsWriteBytesPerSecond: json['EbsWriteBytesPerSecond'] as String,
    ebsWriteOpsPerSecond: json['EbsWriteOpsPerSecond'] as String,
  );
}

EC2InstanceDetails _$EC2InstanceDetailsFromJson(Map<String, dynamic> json) {
  return EC2InstanceDetails(
    availabilityZone: json['AvailabilityZone'] as String,
    currentGeneration: json['CurrentGeneration'] as bool,
    family: json['Family'] as String,
    instanceType: json['InstanceType'] as String,
    platform: json['Platform'] as String,
    region: json['Region'] as String,
    sizeFlexEligible: json['SizeFlexEligible'] as bool,
    tenancy: json['Tenancy'] as String,
  );
}

EC2ResourceDetails _$EC2ResourceDetailsFromJson(Map<String, dynamic> json) {
  return EC2ResourceDetails(
    hourlyOnDemandRate: json['HourlyOnDemandRate'] as String,
    instanceType: json['InstanceType'] as String,
    memory: json['Memory'] as String,
    networkPerformance: json['NetworkPerformance'] as String,
    platform: json['Platform'] as String,
    region: json['Region'] as String,
    sku: json['Sku'] as String,
    storage: json['Storage'] as String,
    vcpu: json['Vcpu'] as String,
  );
}

EC2ResourceUtilization _$EC2ResourceUtilizationFromJson(
    Map<String, dynamic> json) {
  return EC2ResourceUtilization(
    eBSResourceUtilization: json['EBSResourceUtilization'] == null
        ? null
        : EBSResourceUtilization.fromJson(
            json['EBSResourceUtilization'] as Map<String, dynamic>),
    maxCpuUtilizationPercentage: json['MaxCpuUtilizationPercentage'] as String,
    maxMemoryUtilizationPercentage:
        json['MaxMemoryUtilizationPercentage'] as String,
    maxStorageUtilizationPercentage:
        json['MaxStorageUtilizationPercentage'] as String,
  );
}

EC2Specification _$EC2SpecificationFromJson(Map<String, dynamic> json) {
  return EC2Specification(
    offeringClass:
        _$enumDecodeNullable(_$OfferingClassEnumMap, json['OfferingClass']),
  );
}

Map<String, dynamic> _$EC2SpecificationToJson(EC2Specification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OfferingClass', _$OfferingClassEnumMap[instance.offeringClass]);
  return val;
}

const _$OfferingClassEnumMap = {
  OfferingClass.standard: 'STANDARD',
  OfferingClass.convertible: 'CONVERTIBLE',
};

ESInstanceDetails _$ESInstanceDetailsFromJson(Map<String, dynamic> json) {
  return ESInstanceDetails(
    currentGeneration: json['CurrentGeneration'] as bool,
    instanceClass: json['InstanceClass'] as String,
    instanceSize: json['InstanceSize'] as String,
    region: json['Region'] as String,
    sizeFlexEligible: json['SizeFlexEligible'] as bool,
  );
}

ElastiCacheInstanceDetails _$ElastiCacheInstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return ElastiCacheInstanceDetails(
    currentGeneration: json['CurrentGeneration'] as bool,
    family: json['Family'] as String,
    nodeType: json['NodeType'] as String,
    productDescription: json['ProductDescription'] as String,
    region: json['Region'] as String,
    sizeFlexEligible: json['SizeFlexEligible'] as bool,
  );
}

Expression _$ExpressionFromJson(Map<String, dynamic> json) {
  return Expression(
    and: (json['And'] as List)
        ?.map((e) =>
            e == null ? null : Expression.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    costCategories: json['CostCategories'] == null
        ? null
        : CostCategoryValues.fromJson(
            json['CostCategories'] as Map<String, dynamic>),
    dimensions: json['Dimensions'] == null
        ? null
        : DimensionValues.fromJson(json['Dimensions'] as Map<String, dynamic>),
    not: json['Not'] == null
        ? null
        : Expression.fromJson(json['Not'] as Map<String, dynamic>),
    or: (json['Or'] as List)
        ?.map((e) =>
            e == null ? null : Expression.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: json['Tags'] == null
        ? null
        : TagValues.fromJson(json['Tags'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExpressionToJson(Expression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('And', instance.and?.map((e) => e?.toJson())?.toList());
  writeNotNull('CostCategories', instance.costCategories?.toJson());
  writeNotNull('Dimensions', instance.dimensions?.toJson());
  writeNotNull('Not', instance.not?.toJson());
  writeNotNull('Or', instance.or?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.toJson());
  return val;
}

ForecastResult _$ForecastResultFromJson(Map<String, dynamic> json) {
  return ForecastResult(
    meanValue: json['MeanValue'] as String,
    predictionIntervalLowerBound:
        json['PredictionIntervalLowerBound'] as String,
    predictionIntervalUpperBound:
        json['PredictionIntervalUpperBound'] as String,
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
  );
}

GetAnomaliesResponse _$GetAnomaliesResponseFromJson(Map<String, dynamic> json) {
  return GetAnomaliesResponse(
    anomalies: (json['Anomalies'] as List)
        ?.map((e) =>
            e == null ? null : Anomaly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

GetAnomalyMonitorsResponse _$GetAnomalyMonitorsResponseFromJson(
    Map<String, dynamic> json) {
  return GetAnomalyMonitorsResponse(
    anomalyMonitors: (json['AnomalyMonitors'] as List)
        ?.map((e) => e == null
            ? null
            : AnomalyMonitor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

GetAnomalySubscriptionsResponse _$GetAnomalySubscriptionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetAnomalySubscriptionsResponse(
    anomalySubscriptions: (json['AnomalySubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AnomalySubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

GetCostAndUsageResponse _$GetCostAndUsageResponseFromJson(
    Map<String, dynamic> json) {
  return GetCostAndUsageResponse(
    groupDefinitions: (json['GroupDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : GroupDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
    resultsByTime: (json['ResultsByTime'] as List)
        ?.map((e) =>
            e == null ? null : ResultByTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCostAndUsageWithResourcesResponse
    _$GetCostAndUsageWithResourcesResponseFromJson(Map<String, dynamic> json) {
  return GetCostAndUsageWithResourcesResponse(
    groupDefinitions: (json['GroupDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : GroupDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
    resultsByTime: (json['ResultsByTime'] as List)
        ?.map((e) =>
            e == null ? null : ResultByTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCostForecastResponse _$GetCostForecastResponseFromJson(
    Map<String, dynamic> json) {
  return GetCostForecastResponse(
    forecastResultsByTime: (json['ForecastResultsByTime'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total: json['Total'] == null
        ? null
        : MetricValue.fromJson(json['Total'] as Map<String, dynamic>),
  );
}

GetDimensionValuesResponse _$GetDimensionValuesResponseFromJson(
    Map<String, dynamic> json) {
  return GetDimensionValuesResponse(
    dimensionValues: (json['DimensionValues'] as List)
        ?.map((e) => e == null
            ? null
            : DimensionValuesWithAttributes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    returnSize: json['ReturnSize'] as int,
    totalSize: json['TotalSize'] as int,
    nextPageToken: json['NextPageToken'] as String,
  );
}

GetReservationCoverageResponse _$GetReservationCoverageResponseFromJson(
    Map<String, dynamic> json) {
  return GetReservationCoverageResponse(
    coveragesByTime: (json['CoveragesByTime'] as List)
        ?.map((e) => e == null
            ? null
            : CoverageByTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
    total: json['Total'] == null
        ? null
        : Coverage.fromJson(json['Total'] as Map<String, dynamic>),
  );
}

GetReservationPurchaseRecommendationResponse
    _$GetReservationPurchaseRecommendationResponseFromJson(
        Map<String, dynamic> json) {
  return GetReservationPurchaseRecommendationResponse(
    metadata: json['Metadata'] == null
        ? null
        : ReservationPurchaseRecommendationMetadata.fromJson(
            json['Metadata'] as Map<String, dynamic>),
    nextPageToken: json['NextPageToken'] as String,
    recommendations: (json['Recommendations'] as List)
        ?.map((e) => e == null
            ? null
            : ReservationPurchaseRecommendation.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetReservationUtilizationResponse _$GetReservationUtilizationResponseFromJson(
    Map<String, dynamic> json) {
  return GetReservationUtilizationResponse(
    utilizationsByTime: (json['UtilizationsByTime'] as List)
        ?.map((e) => e == null
            ? null
            : UtilizationByTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
    total: json['Total'] == null
        ? null
        : ReservationAggregates.fromJson(json['Total'] as Map<String, dynamic>),
  );
}

GetRightsizingRecommendationResponse
    _$GetRightsizingRecommendationResponseFromJson(Map<String, dynamic> json) {
  return GetRightsizingRecommendationResponse(
    configuration: json['Configuration'] == null
        ? null
        : RightsizingRecommendationConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    metadata: json['Metadata'] == null
        ? null
        : RightsizingRecommendationMetadata.fromJson(
            json['Metadata'] as Map<String, dynamic>),
    nextPageToken: json['NextPageToken'] as String,
    rightsizingRecommendations: (json['RightsizingRecommendations'] as List)
        ?.map((e) => e == null
            ? null
            : RightsizingRecommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    summary: json['Summary'] == null
        ? null
        : RightsizingRecommendationSummary.fromJson(
            json['Summary'] as Map<String, dynamic>),
  );
}

GetSavingsPlansCoverageResponse _$GetSavingsPlansCoverageResponseFromJson(
    Map<String, dynamic> json) {
  return GetSavingsPlansCoverageResponse(
    savingsPlansCoverages: (json['SavingsPlansCoverages'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlansCoverage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetSavingsPlansPurchaseRecommendationResponse
    _$GetSavingsPlansPurchaseRecommendationResponseFromJson(
        Map<String, dynamic> json) {
  return GetSavingsPlansPurchaseRecommendationResponse(
    metadata: json['Metadata'] == null
        ? null
        : SavingsPlansPurchaseRecommendationMetadata.fromJson(
            json['Metadata'] as Map<String, dynamic>),
    nextPageToken: json['NextPageToken'] as String,
    savingsPlansPurchaseRecommendation:
        json['SavingsPlansPurchaseRecommendation'] == null
            ? null
            : SavingsPlansPurchaseRecommendation.fromJson(
                json['SavingsPlansPurchaseRecommendation']
                    as Map<String, dynamic>),
  );
}

GetSavingsPlansUtilizationDetailsResponse
    _$GetSavingsPlansUtilizationDetailsResponseFromJson(
        Map<String, dynamic> json) {
  return GetSavingsPlansUtilizationDetailsResponse(
    savingsPlansUtilizationDetails: (json['SavingsPlansUtilizationDetails']
            as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlansUtilizationDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
    nextToken: json['NextToken'] as String,
    total: json['Total'] == null
        ? null
        : SavingsPlansUtilizationAggregates.fromJson(
            json['Total'] as Map<String, dynamic>),
  );
}

GetSavingsPlansUtilizationResponse _$GetSavingsPlansUtilizationResponseFromJson(
    Map<String, dynamic> json) {
  return GetSavingsPlansUtilizationResponse(
    total: json['Total'] == null
        ? null
        : SavingsPlansUtilizationAggregates.fromJson(
            json['Total'] as Map<String, dynamic>),
    savingsPlansUtilizationsByTime: (json['SavingsPlansUtilizationsByTime']
            as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlansUtilizationByTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTagsResponse _$GetTagsResponseFromJson(Map<String, dynamic> json) {
  return GetTagsResponse(
    returnSize: json['ReturnSize'] as int,
    tags: (json['Tags'] as List)?.map((e) => e as String)?.toList(),
    totalSize: json['TotalSize'] as int,
    nextPageToken: json['NextPageToken'] as String,
  );
}

GetUsageForecastResponse _$GetUsageForecastResponseFromJson(
    Map<String, dynamic> json) {
  return GetUsageForecastResponse(
    forecastResultsByTime: (json['ForecastResultsByTime'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total: json['Total'] == null
        ? null
        : MetricValue.fromJson(json['Total'] as Map<String, dynamic>),
  );
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    keys: (json['Keys'] as List)?.map((e) => e as String)?.toList(),
    metrics: (json['Metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MetricValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

GroupDefinition _$GroupDefinitionFromJson(Map<String, dynamic> json) {
  return GroupDefinition(
    key: json['Key'] as String,
    type: _$enumDecodeNullable(_$GroupDefinitionTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$GroupDefinitionToJson(GroupDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', _$GroupDefinitionTypeEnumMap[instance.type]);
  return val;
}

const _$GroupDefinitionTypeEnumMap = {
  GroupDefinitionType.dimension: 'DIMENSION',
  GroupDefinitionType.tag: 'TAG',
  GroupDefinitionType.costCategory: 'COST_CATEGORY',
};

Impact _$ImpactFromJson(Map<String, dynamic> json) {
  return Impact(
    maxImpact: (json['MaxImpact'] as num)?.toDouble(),
    totalImpact: (json['TotalImpact'] as num)?.toDouble(),
  );
}

InstanceDetails _$InstanceDetailsFromJson(Map<String, dynamic> json) {
  return InstanceDetails(
    eC2InstanceDetails: json['EC2InstanceDetails'] == null
        ? null
        : EC2InstanceDetails.fromJson(
            json['EC2InstanceDetails'] as Map<String, dynamic>),
    eSInstanceDetails: json['ESInstanceDetails'] == null
        ? null
        : ESInstanceDetails.fromJson(
            json['ESInstanceDetails'] as Map<String, dynamic>),
    elastiCacheInstanceDetails: json['ElastiCacheInstanceDetails'] == null
        ? null
        : ElastiCacheInstanceDetails.fromJson(
            json['ElastiCacheInstanceDetails'] as Map<String, dynamic>),
    rDSInstanceDetails: json['RDSInstanceDetails'] == null
        ? null
        : RDSInstanceDetails.fromJson(
            json['RDSInstanceDetails'] as Map<String, dynamic>),
    redshiftInstanceDetails: json['RedshiftInstanceDetails'] == null
        ? null
        : RedshiftInstanceDetails.fromJson(
            json['RedshiftInstanceDetails'] as Map<String, dynamic>),
  );
}

ListCostCategoryDefinitionsResponse
    _$ListCostCategoryDefinitionsResponseFromJson(Map<String, dynamic> json) {
  return ListCostCategoryDefinitionsResponse(
    costCategoryReferences: (json['CostCategoryReferences'] as List)
        ?.map((e) => e == null
            ? null
            : CostCategoryReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

MetricValue _$MetricValueFromJson(Map<String, dynamic> json) {
  return MetricValue(
    amount: json['Amount'] as String,
    unit: json['Unit'] as String,
  );
}

ModifyRecommendationDetail _$ModifyRecommendationDetailFromJson(
    Map<String, dynamic> json) {
  return ModifyRecommendationDetail(
    targetInstances: (json['TargetInstances'] as List)
        ?.map((e) => e == null
            ? null
            : TargetInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ProvideAnomalyFeedbackResponse _$ProvideAnomalyFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return ProvideAnomalyFeedbackResponse(
    anomalyId: json['AnomalyId'] as String,
  );
}

RDSInstanceDetails _$RDSInstanceDetailsFromJson(Map<String, dynamic> json) {
  return RDSInstanceDetails(
    currentGeneration: json['CurrentGeneration'] as bool,
    databaseEdition: json['DatabaseEdition'] as String,
    databaseEngine: json['DatabaseEngine'] as String,
    deploymentOption: json['DeploymentOption'] as String,
    family: json['Family'] as String,
    instanceType: json['InstanceType'] as String,
    licenseModel: json['LicenseModel'] as String,
    region: json['Region'] as String,
    sizeFlexEligible: json['SizeFlexEligible'] as bool,
  );
}

RedshiftInstanceDetails _$RedshiftInstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return RedshiftInstanceDetails(
    currentGeneration: json['CurrentGeneration'] as bool,
    family: json['Family'] as String,
    nodeType: json['NodeType'] as String,
    region: json['Region'] as String,
    sizeFlexEligible: json['SizeFlexEligible'] as bool,
  );
}

ReservationAggregates _$ReservationAggregatesFromJson(
    Map<String, dynamic> json) {
  return ReservationAggregates(
    amortizedRecurringFee: json['AmortizedRecurringFee'] as String,
    amortizedUpfrontFee: json['AmortizedUpfrontFee'] as String,
    netRISavings: json['NetRISavings'] as String,
    onDemandCostOfRIHoursUsed: json['OnDemandCostOfRIHoursUsed'] as String,
    purchasedHours: json['PurchasedHours'] as String,
    purchasedUnits: json['PurchasedUnits'] as String,
    totalActualHours: json['TotalActualHours'] as String,
    totalActualUnits: json['TotalActualUnits'] as String,
    totalAmortizedFee: json['TotalAmortizedFee'] as String,
    totalPotentialRISavings: json['TotalPotentialRISavings'] as String,
    unusedHours: json['UnusedHours'] as String,
    unusedUnits: json['UnusedUnits'] as String,
    utilizationPercentage: json['UtilizationPercentage'] as String,
    utilizationPercentageInUnits:
        json['UtilizationPercentageInUnits'] as String,
  );
}

ReservationCoverageGroup _$ReservationCoverageGroupFromJson(
    Map<String, dynamic> json) {
  return ReservationCoverageGroup(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    coverage: json['Coverage'] == null
        ? null
        : Coverage.fromJson(json['Coverage'] as Map<String, dynamic>),
  );
}

ReservationPurchaseRecommendation _$ReservationPurchaseRecommendationFromJson(
    Map<String, dynamic> json) {
  return ReservationPurchaseRecommendation(
    accountScope:
        _$enumDecodeNullable(_$AccountScopeEnumMap, json['AccountScope']),
    lookbackPeriodInDays: _$enumDecodeNullable(
        _$LookbackPeriodInDaysEnumMap, json['LookbackPeriodInDays']),
    paymentOption:
        _$enumDecodeNullable(_$PaymentOptionEnumMap, json['PaymentOption']),
    recommendationDetails: (json['RecommendationDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ReservationPurchaseRecommendationDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    recommendationSummary: json['RecommendationSummary'] == null
        ? null
        : ReservationPurchaseRecommendationSummary.fromJson(
            json['RecommendationSummary'] as Map<String, dynamic>),
    serviceSpecification: json['ServiceSpecification'] == null
        ? null
        : ServiceSpecification.fromJson(
            json['ServiceSpecification'] as Map<String, dynamic>),
    termInYears:
        _$enumDecodeNullable(_$TermInYearsEnumMap, json['TermInYears']),
  );
}

const _$AccountScopeEnumMap = {
  AccountScope.payer: 'PAYER',
  AccountScope.linked: 'LINKED',
};

const _$LookbackPeriodInDaysEnumMap = {
  LookbackPeriodInDays.sevenDays: 'SEVEN_DAYS',
  LookbackPeriodInDays.thirtyDays: 'THIRTY_DAYS',
  LookbackPeriodInDays.sixtyDays: 'SIXTY_DAYS',
};

const _$PaymentOptionEnumMap = {
  PaymentOption.noUpfront: 'NO_UPFRONT',
  PaymentOption.partialUpfront: 'PARTIAL_UPFRONT',
  PaymentOption.allUpfront: 'ALL_UPFRONT',
  PaymentOption.lightUtilization: 'LIGHT_UTILIZATION',
  PaymentOption.mediumUtilization: 'MEDIUM_UTILIZATION',
  PaymentOption.heavyUtilization: 'HEAVY_UTILIZATION',
};

const _$TermInYearsEnumMap = {
  TermInYears.oneYear: 'ONE_YEAR',
  TermInYears.threeYears: 'THREE_YEARS',
};

ReservationPurchaseRecommendationDetail
    _$ReservationPurchaseRecommendationDetailFromJson(
        Map<String, dynamic> json) {
  return ReservationPurchaseRecommendationDetail(
    accountId: json['AccountId'] as String,
    averageNormalizedUnitsUsedPerHour:
        json['AverageNormalizedUnitsUsedPerHour'] as String,
    averageNumberOfInstancesUsedPerHour:
        json['AverageNumberOfInstancesUsedPerHour'] as String,
    averageUtilization: json['AverageUtilization'] as String,
    currencyCode: json['CurrencyCode'] as String,
    estimatedBreakEvenInMonths: json['EstimatedBreakEvenInMonths'] as String,
    estimatedMonthlyOnDemandCost:
        json['EstimatedMonthlyOnDemandCost'] as String,
    estimatedMonthlySavingsAmount:
        json['EstimatedMonthlySavingsAmount'] as String,
    estimatedMonthlySavingsPercentage:
        json['EstimatedMonthlySavingsPercentage'] as String,
    estimatedReservationCostForLookbackPeriod:
        json['EstimatedReservationCostForLookbackPeriod'] as String,
    instanceDetails: json['InstanceDetails'] == null
        ? null
        : InstanceDetails.fromJson(
            json['InstanceDetails'] as Map<String, dynamic>),
    maximumNormalizedUnitsUsedPerHour:
        json['MaximumNormalizedUnitsUsedPerHour'] as String,
    maximumNumberOfInstancesUsedPerHour:
        json['MaximumNumberOfInstancesUsedPerHour'] as String,
    minimumNormalizedUnitsUsedPerHour:
        json['MinimumNormalizedUnitsUsedPerHour'] as String,
    minimumNumberOfInstancesUsedPerHour:
        json['MinimumNumberOfInstancesUsedPerHour'] as String,
    recommendedNormalizedUnitsToPurchase:
        json['RecommendedNormalizedUnitsToPurchase'] as String,
    recommendedNumberOfInstancesToPurchase:
        json['RecommendedNumberOfInstancesToPurchase'] as String,
    recurringStandardMonthlyCost:
        json['RecurringStandardMonthlyCost'] as String,
    upfrontCost: json['UpfrontCost'] as String,
  );
}

ReservationPurchaseRecommendationMetadata
    _$ReservationPurchaseRecommendationMetadataFromJson(
        Map<String, dynamic> json) {
  return ReservationPurchaseRecommendationMetadata(
    generationTimestamp: json['GenerationTimestamp'] as String,
    recommendationId: json['RecommendationId'] as String,
  );
}

ReservationPurchaseRecommendationSummary
    _$ReservationPurchaseRecommendationSummaryFromJson(
        Map<String, dynamic> json) {
  return ReservationPurchaseRecommendationSummary(
    currencyCode: json['CurrencyCode'] as String,
    totalEstimatedMonthlySavingsAmount:
        json['TotalEstimatedMonthlySavingsAmount'] as String,
    totalEstimatedMonthlySavingsPercentage:
        json['TotalEstimatedMonthlySavingsPercentage'] as String,
  );
}

ReservationUtilizationGroup _$ReservationUtilizationGroupFromJson(
    Map<String, dynamic> json) {
  return ReservationUtilizationGroup(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    key: json['Key'] as String,
    utilization: json['Utilization'] == null
        ? null
        : ReservationAggregates.fromJson(
            json['Utilization'] as Map<String, dynamic>),
    value: json['Value'] as String,
  );
}

ResourceDetails _$ResourceDetailsFromJson(Map<String, dynamic> json) {
  return ResourceDetails(
    eC2ResourceDetails: json['EC2ResourceDetails'] == null
        ? null
        : EC2ResourceDetails.fromJson(
            json['EC2ResourceDetails'] as Map<String, dynamic>),
  );
}

ResourceUtilization _$ResourceUtilizationFromJson(Map<String, dynamic> json) {
  return ResourceUtilization(
    eC2ResourceUtilization: json['EC2ResourceUtilization'] == null
        ? null
        : EC2ResourceUtilization.fromJson(
            json['EC2ResourceUtilization'] as Map<String, dynamic>),
  );
}

ResultByTime _$ResultByTimeFromJson(Map<String, dynamic> json) {
  return ResultByTime(
    estimated: json['Estimated'] as bool,
    groups: (json['Groups'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
    total: (json['Total'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MetricValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

RightsizingRecommendation _$RightsizingRecommendationFromJson(
    Map<String, dynamic> json) {
  return RightsizingRecommendation(
    accountId: json['AccountId'] as String,
    currentInstance: json['CurrentInstance'] == null
        ? null
        : CurrentInstance.fromJson(
            json['CurrentInstance'] as Map<String, dynamic>),
    modifyRecommendationDetail: json['ModifyRecommendationDetail'] == null
        ? null
        : ModifyRecommendationDetail.fromJson(
            json['ModifyRecommendationDetail'] as Map<String, dynamic>),
    rightsizingType:
        _$enumDecodeNullable(_$RightsizingTypeEnumMap, json['RightsizingType']),
    terminateRecommendationDetail: json['TerminateRecommendationDetail'] == null
        ? null
        : TerminateRecommendationDetail.fromJson(
            json['TerminateRecommendationDetail'] as Map<String, dynamic>),
  );
}

const _$RightsizingTypeEnumMap = {
  RightsizingType.terminate: 'TERMINATE',
  RightsizingType.modify: 'MODIFY',
};

RightsizingRecommendationConfiguration
    _$RightsizingRecommendationConfigurationFromJson(
        Map<String, dynamic> json) {
  return RightsizingRecommendationConfiguration(
    benefitsConsidered: json['BenefitsConsidered'] as bool,
    recommendationTarget: _$enumDecodeNullable(
        _$RecommendationTargetEnumMap, json['RecommendationTarget']),
  );
}

Map<String, dynamic> _$RightsizingRecommendationConfigurationToJson(
    RightsizingRecommendationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BenefitsConsidered', instance.benefitsConsidered);
  writeNotNull('RecommendationTarget',
      _$RecommendationTargetEnumMap[instance.recommendationTarget]);
  return val;
}

const _$RecommendationTargetEnumMap = {
  RecommendationTarget.sameInstanceFamily: 'SAME_INSTANCE_FAMILY',
  RecommendationTarget.crossInstanceFamily: 'CROSS_INSTANCE_FAMILY',
};

RightsizingRecommendationMetadata _$RightsizingRecommendationMetadataFromJson(
    Map<String, dynamic> json) {
  return RightsizingRecommendationMetadata(
    additionalMetadata: json['AdditionalMetadata'] as String,
    generationTimestamp: json['GenerationTimestamp'] as String,
    lookbackPeriodInDays: _$enumDecodeNullable(
        _$LookbackPeriodInDaysEnumMap, json['LookbackPeriodInDays']),
    recommendationId: json['RecommendationId'] as String,
  );
}

RightsizingRecommendationSummary _$RightsizingRecommendationSummaryFromJson(
    Map<String, dynamic> json) {
  return RightsizingRecommendationSummary(
    estimatedTotalMonthlySavingsAmount:
        json['EstimatedTotalMonthlySavingsAmount'] as String,
    savingsCurrencyCode: json['SavingsCurrencyCode'] as String,
    savingsPercentage: json['SavingsPercentage'] as String,
    totalRecommendationCount: json['TotalRecommendationCount'] as String,
  );
}

RootCause _$RootCauseFromJson(Map<String, dynamic> json) {
  return RootCause(
    linkedAccount: json['LinkedAccount'] as String,
    region: json['Region'] as String,
    service: json['Service'] as String,
    usageType: json['UsageType'] as String,
  );
}

SavingsPlansAmortizedCommitment _$SavingsPlansAmortizedCommitmentFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansAmortizedCommitment(
    amortizedRecurringCommitment:
        json['AmortizedRecurringCommitment'] as String,
    amortizedUpfrontCommitment: json['AmortizedUpfrontCommitment'] as String,
    totalAmortizedCommitment: json['TotalAmortizedCommitment'] as String,
  );
}

SavingsPlansCoverage _$SavingsPlansCoverageFromJson(Map<String, dynamic> json) {
  return SavingsPlansCoverage(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    coverage: json['Coverage'] == null
        ? null
        : SavingsPlansCoverageData.fromJson(
            json['Coverage'] as Map<String, dynamic>),
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
  );
}

SavingsPlansCoverageData _$SavingsPlansCoverageDataFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansCoverageData(
    coveragePercentage: json['CoveragePercentage'] as String,
    onDemandCost: json['OnDemandCost'] as String,
    spendCoveredBySavingsPlans: json['SpendCoveredBySavingsPlans'] as String,
    totalCost: json['TotalCost'] as String,
  );
}

SavingsPlansDetails _$SavingsPlansDetailsFromJson(Map<String, dynamic> json) {
  return SavingsPlansDetails(
    instanceFamily: json['InstanceFamily'] as String,
    offeringId: json['OfferingId'] as String,
    region: json['Region'] as String,
  );
}

SavingsPlansPurchaseRecommendation _$SavingsPlansPurchaseRecommendationFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansPurchaseRecommendation(
    accountScope:
        _$enumDecodeNullable(_$AccountScopeEnumMap, json['AccountScope']),
    lookbackPeriodInDays: _$enumDecodeNullable(
        _$LookbackPeriodInDaysEnumMap, json['LookbackPeriodInDays']),
    paymentOption:
        _$enumDecodeNullable(_$PaymentOptionEnumMap, json['PaymentOption']),
    savingsPlansPurchaseRecommendationDetails:
        (json['SavingsPlansPurchaseRecommendationDetails'] as List)
            ?.map((e) => e == null
                ? null
                : SavingsPlansPurchaseRecommendationDetail.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    savingsPlansPurchaseRecommendationSummary:
        json['SavingsPlansPurchaseRecommendationSummary'] == null
            ? null
            : SavingsPlansPurchaseRecommendationSummary.fromJson(
                json['SavingsPlansPurchaseRecommendationSummary']
                    as Map<String, dynamic>),
    savingsPlansType: _$enumDecodeNullable(
        _$SupportedSavingsPlansTypeEnumMap, json['SavingsPlansType']),
    termInYears:
        _$enumDecodeNullable(_$TermInYearsEnumMap, json['TermInYears']),
  );
}

const _$SupportedSavingsPlansTypeEnumMap = {
  SupportedSavingsPlansType.computeSp: 'COMPUTE_SP',
  SupportedSavingsPlansType.ec2InstanceSp: 'EC2_INSTANCE_SP',
};

SavingsPlansPurchaseRecommendationDetail
    _$SavingsPlansPurchaseRecommendationDetailFromJson(
        Map<String, dynamic> json) {
  return SavingsPlansPurchaseRecommendationDetail(
    accountId: json['AccountId'] as String,
    currencyCode: json['CurrencyCode'] as String,
    currentAverageHourlyOnDemandSpend:
        json['CurrentAverageHourlyOnDemandSpend'] as String,
    currentMaximumHourlyOnDemandSpend:
        json['CurrentMaximumHourlyOnDemandSpend'] as String,
    currentMinimumHourlyOnDemandSpend:
        json['CurrentMinimumHourlyOnDemandSpend'] as String,
    estimatedAverageUtilization: json['EstimatedAverageUtilization'] as String,
    estimatedMonthlySavingsAmount:
        json['EstimatedMonthlySavingsAmount'] as String,
    estimatedOnDemandCost: json['EstimatedOnDemandCost'] as String,
    estimatedOnDemandCostWithCurrentCommitment:
        json['EstimatedOnDemandCostWithCurrentCommitment'] as String,
    estimatedROI: json['EstimatedROI'] as String,
    estimatedSPCost: json['EstimatedSPCost'] as String,
    estimatedSavingsAmount: json['EstimatedSavingsAmount'] as String,
    estimatedSavingsPercentage: json['EstimatedSavingsPercentage'] as String,
    hourlyCommitmentToPurchase: json['HourlyCommitmentToPurchase'] as String,
    savingsPlansDetails: json['SavingsPlansDetails'] == null
        ? null
        : SavingsPlansDetails.fromJson(
            json['SavingsPlansDetails'] as Map<String, dynamic>),
    upfrontCost: json['UpfrontCost'] as String,
  );
}

SavingsPlansPurchaseRecommendationMetadata
    _$SavingsPlansPurchaseRecommendationMetadataFromJson(
        Map<String, dynamic> json) {
  return SavingsPlansPurchaseRecommendationMetadata(
    additionalMetadata: json['AdditionalMetadata'] as String,
    generationTimestamp: json['GenerationTimestamp'] as String,
    recommendationId: json['RecommendationId'] as String,
  );
}

SavingsPlansPurchaseRecommendationSummary
    _$SavingsPlansPurchaseRecommendationSummaryFromJson(
        Map<String, dynamic> json) {
  return SavingsPlansPurchaseRecommendationSummary(
    currencyCode: json['CurrencyCode'] as String,
    currentOnDemandSpend: json['CurrentOnDemandSpend'] as String,
    dailyCommitmentToPurchase: json['DailyCommitmentToPurchase'] as String,
    estimatedMonthlySavingsAmount:
        json['EstimatedMonthlySavingsAmount'] as String,
    estimatedOnDemandCostWithCurrentCommitment:
        json['EstimatedOnDemandCostWithCurrentCommitment'] as String,
    estimatedROI: json['EstimatedROI'] as String,
    estimatedSavingsAmount: json['EstimatedSavingsAmount'] as String,
    estimatedSavingsPercentage: json['EstimatedSavingsPercentage'] as String,
    estimatedTotalCost: json['EstimatedTotalCost'] as String,
    hourlyCommitmentToPurchase: json['HourlyCommitmentToPurchase'] as String,
    totalRecommendationCount: json['TotalRecommendationCount'] as String,
  );
}

SavingsPlansSavings _$SavingsPlansSavingsFromJson(Map<String, dynamic> json) {
  return SavingsPlansSavings(
    netSavings: json['NetSavings'] as String,
    onDemandCostEquivalent: json['OnDemandCostEquivalent'] as String,
  );
}

SavingsPlansUtilization _$SavingsPlansUtilizationFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansUtilization(
    totalCommitment: json['TotalCommitment'] as String,
    unusedCommitment: json['UnusedCommitment'] as String,
    usedCommitment: json['UsedCommitment'] as String,
    utilizationPercentage: json['UtilizationPercentage'] as String,
  );
}

SavingsPlansUtilizationAggregates _$SavingsPlansUtilizationAggregatesFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansUtilizationAggregates(
    utilization: json['Utilization'] == null
        ? null
        : SavingsPlansUtilization.fromJson(
            json['Utilization'] as Map<String, dynamic>),
    amortizedCommitment: json['AmortizedCommitment'] == null
        ? null
        : SavingsPlansAmortizedCommitment.fromJson(
            json['AmortizedCommitment'] as Map<String, dynamic>),
    savings: json['Savings'] == null
        ? null
        : SavingsPlansSavings.fromJson(json['Savings'] as Map<String, dynamic>),
  );
}

SavingsPlansUtilizationByTime _$SavingsPlansUtilizationByTimeFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansUtilizationByTime(
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
    utilization: json['Utilization'] == null
        ? null
        : SavingsPlansUtilization.fromJson(
            json['Utilization'] as Map<String, dynamic>),
    amortizedCommitment: json['AmortizedCommitment'] == null
        ? null
        : SavingsPlansAmortizedCommitment.fromJson(
            json['AmortizedCommitment'] as Map<String, dynamic>),
    savings: json['Savings'] == null
        ? null
        : SavingsPlansSavings.fromJson(json['Savings'] as Map<String, dynamic>),
  );
}

SavingsPlansUtilizationDetail _$SavingsPlansUtilizationDetailFromJson(
    Map<String, dynamic> json) {
  return SavingsPlansUtilizationDetail(
    amortizedCommitment: json['AmortizedCommitment'] == null
        ? null
        : SavingsPlansAmortizedCommitment.fromJson(
            json['AmortizedCommitment'] as Map<String, dynamic>),
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    savings: json['Savings'] == null
        ? null
        : SavingsPlansSavings.fromJson(json['Savings'] as Map<String, dynamic>),
    savingsPlanArn: json['SavingsPlanArn'] as String,
    utilization: json['Utilization'] == null
        ? null
        : SavingsPlansUtilization.fromJson(
            json['Utilization'] as Map<String, dynamic>),
  );
}

ServiceSpecification _$ServiceSpecificationFromJson(Map<String, dynamic> json) {
  return ServiceSpecification(
    eC2Specification: json['EC2Specification'] == null
        ? null
        : EC2Specification.fromJson(
            json['EC2Specification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceSpecificationToJson(
    ServiceSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EC2Specification', instance.eC2Specification?.toJson());
  return val;
}

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) {
  return Subscriber(
    address: json['Address'] as String,
    status: _$enumDecodeNullable(_$SubscriberStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$SubscriberTypeEnumMap, json['Type']),
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
  writeNotNull('Status', _$SubscriberStatusEnumMap[instance.status]);
  writeNotNull('Type', _$SubscriberTypeEnumMap[instance.type]);
  return val;
}

const _$SubscriberStatusEnumMap = {
  SubscriberStatus.confirmed: 'CONFIRMED',
  SubscriberStatus.declined: 'DECLINED',
};

const _$SubscriberTypeEnumMap = {
  SubscriberType.email: 'EMAIL',
  SubscriberType.sns: 'SNS',
};

TagValues _$TagValuesFromJson(Map<String, dynamic> json) {
  return TagValues(
    key: json['Key'] as String,
    matchOptions: (json['MatchOptions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$MatchOptionEnumMap, e))
        ?.toList(),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TagValuesToJson(TagValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('MatchOptions',
      instance.matchOptions?.map((e) => _$MatchOptionEnumMap[e])?.toList());
  writeNotNull('Values', instance.values);
  return val;
}

TargetInstance _$TargetInstanceFromJson(Map<String, dynamic> json) {
  return TargetInstance(
    currencyCode: json['CurrencyCode'] as String,
    defaultTargetInstance: json['DefaultTargetInstance'] as bool,
    estimatedMonthlyCost: json['EstimatedMonthlyCost'] as String,
    estimatedMonthlySavings: json['EstimatedMonthlySavings'] as String,
    expectedResourceUtilization: json['ExpectedResourceUtilization'] == null
        ? null
        : ResourceUtilization.fromJson(
            json['ExpectedResourceUtilization'] as Map<String, dynamic>),
    resourceDetails: json['ResourceDetails'] == null
        ? null
        : ResourceDetails.fromJson(
            json['ResourceDetails'] as Map<String, dynamic>),
  );
}

TerminateRecommendationDetail _$TerminateRecommendationDetailFromJson(
    Map<String, dynamic> json) {
  return TerminateRecommendationDetail(
    currencyCode: json['CurrencyCode'] as String,
    estimatedMonthlySavings: json['EstimatedMonthlySavings'] as String,
  );
}

Map<String, dynamic> _$TotalImpactFilterToJson(TotalImpactFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'NumericOperator', _$NumericOperatorEnumMap[instance.numericOperator]);
  writeNotNull('StartValue', instance.startValue);
  writeNotNull('EndValue', instance.endValue);
  return val;
}

const _$NumericOperatorEnumMap = {
  NumericOperator.equal: 'EQUAL',
  NumericOperator.greaterThanOrEqual: 'GREATER_THAN_OR_EQUAL',
  NumericOperator.lessThanOrEqual: 'LESS_THAN_OR_EQUAL',
  NumericOperator.greaterThan: 'GREATER_THAN',
  NumericOperator.lessThan: 'LESS_THAN',
  NumericOperator.between: 'BETWEEN',
};

UpdateAnomalyMonitorResponse _$UpdateAnomalyMonitorResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAnomalyMonitorResponse(
    monitorArn: json['MonitorArn'] as String,
  );
}

UpdateAnomalySubscriptionResponse _$UpdateAnomalySubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAnomalySubscriptionResponse(
    subscriptionArn: json['SubscriptionArn'] as String,
  );
}

UpdateCostCategoryDefinitionResponse
    _$UpdateCostCategoryDefinitionResponseFromJson(Map<String, dynamic> json) {
  return UpdateCostCategoryDefinitionResponse(
    costCategoryArn: json['CostCategoryArn'] as String,
    effectiveStart: json['EffectiveStart'] as String,
  );
}

UtilizationByTime _$UtilizationByTimeFromJson(Map<String, dynamic> json) {
  return UtilizationByTime(
    groups: (json['Groups'] as List)
        ?.map((e) => e == null
            ? null
            : ReservationUtilizationGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timePeriod: json['TimePeriod'] == null
        ? null
        : DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
    total: json['Total'] == null
        ? null
        : ReservationAggregates.fromJson(json['Total'] as Map<String, dynamic>),
  );
}
