// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-02-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return Alarm(
    alarmARN: json['AlarmARN'] as String,
    alarmName: json['AlarmName'] as String,
  );
}

CustomizedMetricSpecification _$CustomizedMetricSpecificationFromJson(
    Map<String, dynamic> json) {
  return CustomizedMetricSpecification(
    metricName: json['MetricName'] as String,
    namespace: json['Namespace'] as String,
    statistic:
        _$enumDecodeNullable(_$MetricStatisticEnumMap, json['Statistic']),
    dimensions: (json['Dimensions'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDimension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unit: json['Unit'] as String,
  );
}

Map<String, dynamic> _$CustomizedMetricSpecificationToJson(
    CustomizedMetricSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricName', instance.metricName);
  writeNotNull('Namespace', instance.namespace);
  writeNotNull('Statistic', _$MetricStatisticEnumMap[instance.statistic]);
  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Unit', instance.unit);
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

const _$MetricStatisticEnumMap = {
  MetricStatistic.average: 'Average',
  MetricStatistic.minimum: 'Minimum',
  MetricStatistic.maximum: 'Maximum',
  MetricStatistic.sampleCount: 'SampleCount',
  MetricStatistic.sum: 'Sum',
};

DeleteScalingPolicyResponse _$DeleteScalingPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScalingPolicyResponse();
}

DeleteScheduledActionResponse _$DeleteScheduledActionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScheduledActionResponse();
}

DeregisterScalableTargetResponse _$DeregisterScalableTargetResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterScalableTargetResponse();
}

DescribeScalableTargetsResponse _$DescribeScalableTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScalableTargetsResponse(
    nextToken: json['NextToken'] as String,
    scalableTargets: (json['ScalableTargets'] as List)
        ?.map((e) => e == null
            ? null
            : ScalableTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeScalingActivitiesResponse _$DescribeScalingActivitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScalingActivitiesResponse(
    nextToken: json['NextToken'] as String,
    scalingActivities: (json['ScalingActivities'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingActivity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeScalingPoliciesResponse _$DescribeScalingPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScalingPoliciesResponse(
    nextToken: json['NextToken'] as String,
    scalingPolicies: (json['ScalingPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeScheduledActionsResponse _$DescribeScheduledActionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScheduledActionsResponse(
    nextToken: json['NextToken'] as String,
    scheduledActions: (json['ScheduledActions'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduledAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricDimension _$MetricDimensionFromJson(Map<String, dynamic> json) {
  return MetricDimension(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$MetricDimensionToJson(MetricDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

PredefinedMetricSpecification _$PredefinedMetricSpecificationFromJson(
    Map<String, dynamic> json) {
  return PredefinedMetricSpecification(
    predefinedMetricType:
        _$enumDecodeNullable(_$MetricTypeEnumMap, json['PredefinedMetricType']),
    resourceLabel: json['ResourceLabel'] as String,
  );
}

Map<String, dynamic> _$PredefinedMetricSpecificationToJson(
    PredefinedMetricSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PredefinedMetricType',
      _$MetricTypeEnumMap[instance.predefinedMetricType]);
  writeNotNull('ResourceLabel', instance.resourceLabel);
  return val;
}

const _$MetricTypeEnumMap = {
  MetricType.dynamoDBReadCapacityUtilization: 'DynamoDBReadCapacityUtilization',
  MetricType.dynamoDBWriteCapacityUtilization:
      'DynamoDBWriteCapacityUtilization',
  MetricType.aLBRequestCountPerTarget: 'ALBRequestCountPerTarget',
  MetricType.rDSReaderAverageCPUUtilization: 'RDSReaderAverageCPUUtilization',
  MetricType.rDSReaderAverageDatabaseConnections:
      'RDSReaderAverageDatabaseConnections',
  MetricType.eC2SpotFleetRequestAverageCPUUtilization:
      'EC2SpotFleetRequestAverageCPUUtilization',
  MetricType.eC2SpotFleetRequestAverageNetworkIn:
      'EC2SpotFleetRequestAverageNetworkIn',
  MetricType.eC2SpotFleetRequestAverageNetworkOut:
      'EC2SpotFleetRequestAverageNetworkOut',
  MetricType.sageMakerVariantInvocationsPerInstance:
      'SageMakerVariantInvocationsPerInstance',
  MetricType.eCSServiceAverageCPUUtilization: 'ECSServiceAverageCPUUtilization',
  MetricType.eCSServiceAverageMemoryUtilization:
      'ECSServiceAverageMemoryUtilization',
  MetricType.appStreamAverageCapacityUtilization:
      'AppStreamAverageCapacityUtilization',
  MetricType.comprehendInferenceUtilization: 'ComprehendInferenceUtilization',
  MetricType.lambdaProvisionedConcurrencyUtilization:
      'LambdaProvisionedConcurrencyUtilization',
  MetricType.cassandraReadCapacityUtilization:
      'CassandraReadCapacityUtilization',
  MetricType.cassandraWriteCapacityUtilization:
      'CassandraWriteCapacityUtilization',
  MetricType.kafkaBrokerStorageUtilization: 'KafkaBrokerStorageUtilization',
};

PutScalingPolicyResponse _$PutScalingPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutScalingPolicyResponse(
    policyARN: json['PolicyARN'] as String,
    alarms: (json['Alarms'] as List)
        ?.map(
            (e) => e == null ? null : Alarm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutScheduledActionResponse _$PutScheduledActionResponseFromJson(
    Map<String, dynamic> json) {
  return PutScheduledActionResponse();
}

RegisterScalableTargetResponse _$RegisterScalableTargetResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterScalableTargetResponse();
}

ScalableTarget _$ScalableTargetFromJson(Map<String, dynamic> json) {
  return ScalableTarget(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    maxCapacity: json['MaxCapacity'] as int,
    minCapacity: json['MinCapacity'] as int,
    resourceId: json['ResourceId'] as String,
    roleARN: json['RoleARN'] as String,
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    suspendedState: json['SuspendedState'] == null
        ? null
        : SuspendedState.fromJson(
            json['SuspendedState'] as Map<String, dynamic>),
  );
}

const _$ScalableDimensionEnumMap = {
  ScalableDimension.ecsServiceDesiredCount: 'ecs:service:DesiredCount',
  ScalableDimension.ec2SpotFleetRequestTargetCapacity:
      'ec2:spot-fleet-request:TargetCapacity',
  ScalableDimension.elasticmapreduceInstancegroupInstanceCount:
      'elasticmapreduce:instancegroup:InstanceCount',
  ScalableDimension.appstreamFleetDesiredCapacity:
      'appstream:fleet:DesiredCapacity',
  ScalableDimension.dynamodbTableReadCapacityUnits:
      'dynamodb:table:ReadCapacityUnits',
  ScalableDimension.dynamodbTableWriteCapacityUnits:
      'dynamodb:table:WriteCapacityUnits',
  ScalableDimension.dynamodbIndexReadCapacityUnits:
      'dynamodb:index:ReadCapacityUnits',
  ScalableDimension.dynamodbIndexWriteCapacityUnits:
      'dynamodb:index:WriteCapacityUnits',
  ScalableDimension.rdsClusterReadReplicaCount: 'rds:cluster:ReadReplicaCount',
  ScalableDimension.sagemakerVariantDesiredInstanceCount:
      'sagemaker:variant:DesiredInstanceCount',
  ScalableDimension.customResourceResourceTypeProperty:
      'custom-resource:ResourceType:Property',
  ScalableDimension.comprehendDocumentClassifierEndpointDesiredInferenceUnits:
      'comprehend:document-classifier-endpoint:DesiredInferenceUnits',
  ScalableDimension.comprehendEntityRecognizerEndpointDesiredInferenceUnits:
      'comprehend:entity-recognizer-endpoint:DesiredInferenceUnits',
  ScalableDimension.lambdaFunctionProvisionedConcurrency:
      'lambda:function:ProvisionedConcurrency',
  ScalableDimension.cassandraTableReadCapacityUnits:
      'cassandra:table:ReadCapacityUnits',
  ScalableDimension.cassandraTableWriteCapacityUnits:
      'cassandra:table:WriteCapacityUnits',
  ScalableDimension.kafkaBrokerStorageVolumeSize:
      'kafka:broker-storage:VolumeSize',
};

const _$ServiceNamespaceEnumMap = {
  ServiceNamespace.ecs: 'ecs',
  ServiceNamespace.elasticmapreduce: 'elasticmapreduce',
  ServiceNamespace.ec2: 'ec2',
  ServiceNamespace.appstream: 'appstream',
  ServiceNamespace.dynamodb: 'dynamodb',
  ServiceNamespace.rds: 'rds',
  ServiceNamespace.sagemaker: 'sagemaker',
  ServiceNamespace.customResource: 'custom-resource',
  ServiceNamespace.comprehend: 'comprehend',
  ServiceNamespace.lambda: 'lambda',
  ServiceNamespace.cassandra: 'cassandra',
  ServiceNamespace.kafka: 'kafka',
};

ScalableTargetAction _$ScalableTargetActionFromJson(Map<String, dynamic> json) {
  return ScalableTargetAction(
    maxCapacity: json['MaxCapacity'] as int,
    minCapacity: json['MinCapacity'] as int,
  );
}

Map<String, dynamic> _$ScalableTargetActionToJson(
    ScalableTargetAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxCapacity', instance.maxCapacity);
  writeNotNull('MinCapacity', instance.minCapacity);
  return val;
}

ScalingActivity _$ScalingActivityFromJson(Map<String, dynamic> json) {
  return ScalingActivity(
    activityId: json['ActivityId'] as String,
    cause: json['Cause'] as String,
    description: json['Description'] as String,
    resourceId: json['ResourceId'] as String,
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    statusCode: _$enumDecodeNullable(
        _$ScalingActivityStatusCodeEnumMap, json['StatusCode']),
    details: json['Details'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    statusMessage: json['StatusMessage'] as String,
  );
}

const _$ScalingActivityStatusCodeEnumMap = {
  ScalingActivityStatusCode.pending: 'Pending',
  ScalingActivityStatusCode.inProgress: 'InProgress',
  ScalingActivityStatusCode.successful: 'Successful',
  ScalingActivityStatusCode.overridden: 'Overridden',
  ScalingActivityStatusCode.unfulfilled: 'Unfulfilled',
  ScalingActivityStatusCode.failed: 'Failed',
};

ScalingPolicy _$ScalingPolicyFromJson(Map<String, dynamic> json) {
  return ScalingPolicy(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    policyARN: json['PolicyARN'] as String,
    policyName: json['PolicyName'] as String,
    policyType: _$enumDecodeNullable(_$PolicyTypeEnumMap, json['PolicyType']),
    resourceId: json['ResourceId'] as String,
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    alarms: (json['Alarms'] as List)
        ?.map(
            (e) => e == null ? null : Alarm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stepScalingPolicyConfiguration:
        json['StepScalingPolicyConfiguration'] == null
            ? null
            : StepScalingPolicyConfiguration.fromJson(
                json['StepScalingPolicyConfiguration'] as Map<String, dynamic>),
    targetTrackingScalingPolicyConfiguration:
        json['TargetTrackingScalingPolicyConfiguration'] == null
            ? null
            : TargetTrackingScalingPolicyConfiguration.fromJson(
                json['TargetTrackingScalingPolicyConfiguration']
                    as Map<String, dynamic>),
  );
}

const _$PolicyTypeEnumMap = {
  PolicyType.stepScaling: 'StepScaling',
  PolicyType.targetTrackingScaling: 'TargetTrackingScaling',
};

ScheduledAction _$ScheduledActionFromJson(Map<String, dynamic> json) {
  return ScheduledAction(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    resourceId: json['ResourceId'] as String,
    schedule: json['Schedule'] as String,
    scheduledActionARN: json['ScheduledActionARN'] as String,
    scheduledActionName: json['ScheduledActionName'] as String,
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    scalableTargetAction: json['ScalableTargetAction'] == null
        ? null
        : ScalableTargetAction.fromJson(
            json['ScalableTargetAction'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
  );
}

StepAdjustment _$StepAdjustmentFromJson(Map<String, dynamic> json) {
  return StepAdjustment(
    scalingAdjustment: json['ScalingAdjustment'] as int,
    metricIntervalLowerBound:
        (json['MetricIntervalLowerBound'] as num)?.toDouble(),
    metricIntervalUpperBound:
        (json['MetricIntervalUpperBound'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$StepAdjustmentToJson(StepAdjustment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScalingAdjustment', instance.scalingAdjustment);
  writeNotNull('MetricIntervalLowerBound', instance.metricIntervalLowerBound);
  writeNotNull('MetricIntervalUpperBound', instance.metricIntervalUpperBound);
  return val;
}

StepScalingPolicyConfiguration _$StepScalingPolicyConfigurationFromJson(
    Map<String, dynamic> json) {
  return StepScalingPolicyConfiguration(
    adjustmentType:
        _$enumDecodeNullable(_$AdjustmentTypeEnumMap, json['AdjustmentType']),
    cooldown: json['Cooldown'] as int,
    metricAggregationType: _$enumDecodeNullable(
        _$MetricAggregationTypeEnumMap, json['MetricAggregationType']),
    minAdjustmentMagnitude: json['MinAdjustmentMagnitude'] as int,
    stepAdjustments: (json['StepAdjustments'] as List)
        ?.map((e) => e == null
            ? null
            : StepAdjustment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StepScalingPolicyConfigurationToJson(
    StepScalingPolicyConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AdjustmentType', _$AdjustmentTypeEnumMap[instance.adjustmentType]);
  writeNotNull('Cooldown', instance.cooldown);
  writeNotNull('MetricAggregationType',
      _$MetricAggregationTypeEnumMap[instance.metricAggregationType]);
  writeNotNull('MinAdjustmentMagnitude', instance.minAdjustmentMagnitude);
  writeNotNull('StepAdjustments',
      instance.stepAdjustments?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$AdjustmentTypeEnumMap = {
  AdjustmentType.changeInCapacity: 'ChangeInCapacity',
  AdjustmentType.percentChangeInCapacity: 'PercentChangeInCapacity',
  AdjustmentType.exactCapacity: 'ExactCapacity',
};

const _$MetricAggregationTypeEnumMap = {
  MetricAggregationType.average: 'Average',
  MetricAggregationType.minimum: 'Minimum',
  MetricAggregationType.maximum: 'Maximum',
};

SuspendedState _$SuspendedStateFromJson(Map<String, dynamic> json) {
  return SuspendedState(
    dynamicScalingInSuspended: json['DynamicScalingInSuspended'] as bool,
    dynamicScalingOutSuspended: json['DynamicScalingOutSuspended'] as bool,
    scheduledScalingSuspended: json['ScheduledScalingSuspended'] as bool,
  );
}

Map<String, dynamic> _$SuspendedStateToJson(SuspendedState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DynamicScalingInSuspended', instance.dynamicScalingInSuspended);
  writeNotNull(
      'DynamicScalingOutSuspended', instance.dynamicScalingOutSuspended);
  writeNotNull('ScheduledScalingSuspended', instance.scheduledScalingSuspended);
  return val;
}

TargetTrackingScalingPolicyConfiguration
    _$TargetTrackingScalingPolicyConfigurationFromJson(
        Map<String, dynamic> json) {
  return TargetTrackingScalingPolicyConfiguration(
    targetValue: (json['TargetValue'] as num)?.toDouble(),
    customizedMetricSpecification: json['CustomizedMetricSpecification'] == null
        ? null
        : CustomizedMetricSpecification.fromJson(
            json['CustomizedMetricSpecification'] as Map<String, dynamic>),
    disableScaleIn: json['DisableScaleIn'] as bool,
    predefinedMetricSpecification: json['PredefinedMetricSpecification'] == null
        ? null
        : PredefinedMetricSpecification.fromJson(
            json['PredefinedMetricSpecification'] as Map<String, dynamic>),
    scaleInCooldown: json['ScaleInCooldown'] as int,
    scaleOutCooldown: json['ScaleOutCooldown'] as int,
  );
}

Map<String, dynamic> _$TargetTrackingScalingPolicyConfigurationToJson(
    TargetTrackingScalingPolicyConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetValue', instance.targetValue);
  writeNotNull('CustomizedMetricSpecification',
      instance.customizedMetricSpecification?.toJson());
  writeNotNull('DisableScaleIn', instance.disableScaleIn);
  writeNotNull('PredefinedMetricSpecification',
      instance.predefinedMetricSpecification?.toJson());
  writeNotNull('ScaleInCooldown', instance.scaleInCooldown);
  writeNotNull('ScaleOutCooldown', instance.scaleOutCooldown);
  return val;
}
