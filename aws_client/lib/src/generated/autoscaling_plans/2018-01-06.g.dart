// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-01-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationSource _$ApplicationSourceFromJson(Map<String, dynamic> json) {
  return ApplicationSource(
    cloudFormationStackARN: json['CloudFormationStackARN'] as String,
    tagFilters: (json['TagFilters'] as List)
        ?.map((e) =>
            e == null ? null : TagFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ApplicationSourceToJson(ApplicationSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudFormationStackARN', instance.cloudFormationStackARN);
  writeNotNull(
      'TagFilters', instance.tagFilters?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateScalingPlanResponse _$CreateScalingPlanResponseFromJson(
    Map<String, dynamic> json) {
  return CreateScalingPlanResponse(
    scalingPlanVersion: json['ScalingPlanVersion'] as int,
  );
}

CustomizedLoadMetricSpecification _$CustomizedLoadMetricSpecificationFromJson(
    Map<String, dynamic> json) {
  return CustomizedLoadMetricSpecification(
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

Map<String, dynamic> _$CustomizedLoadMetricSpecificationToJson(
    CustomizedLoadMetricSpecification instance) {
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

CustomizedScalingMetricSpecification
    _$CustomizedScalingMetricSpecificationFromJson(Map<String, dynamic> json) {
  return CustomizedScalingMetricSpecification(
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

Map<String, dynamic> _$CustomizedScalingMetricSpecificationToJson(
    CustomizedScalingMetricSpecification instance) {
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

Datapoint _$DatapointFromJson(Map<String, dynamic> json) {
  return Datapoint(
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    value: (json['Value'] as num)?.toDouble(),
  );
}

DeleteScalingPlanResponse _$DeleteScalingPlanResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScalingPlanResponse();
}

DescribeScalingPlanResourcesResponse
    _$DescribeScalingPlanResourcesResponseFromJson(Map<String, dynamic> json) {
  return DescribeScalingPlanResourcesResponse(
    nextToken: json['NextToken'] as String,
    scalingPlanResources: (json['ScalingPlanResources'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingPlanResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeScalingPlansResponse _$DescribeScalingPlansResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScalingPlansResponse(
    nextToken: json['NextToken'] as String,
    scalingPlans: (json['ScalingPlans'] as List)
        ?.map((e) =>
            e == null ? null : ScalingPlan.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetScalingPlanResourceForecastDataResponse
    _$GetScalingPlanResourceForecastDataResponseFromJson(
        Map<String, dynamic> json) {
  return GetScalingPlanResourceForecastDataResponse(
    datapoints: (json['Datapoints'] as List)
        ?.map((e) =>
            e == null ? null : Datapoint.fromJson(e as Map<String, dynamic>))
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

PredefinedLoadMetricSpecification _$PredefinedLoadMetricSpecificationFromJson(
    Map<String, dynamic> json) {
  return PredefinedLoadMetricSpecification(
    predefinedLoadMetricType: _$enumDecodeNullable(
        _$LoadMetricTypeEnumMap, json['PredefinedLoadMetricType']),
    resourceLabel: json['ResourceLabel'] as String,
  );
}

Map<String, dynamic> _$PredefinedLoadMetricSpecificationToJson(
    PredefinedLoadMetricSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PredefinedLoadMetricType',
      _$LoadMetricTypeEnumMap[instance.predefinedLoadMetricType]);
  writeNotNull('ResourceLabel', instance.resourceLabel);
  return val;
}

const _$LoadMetricTypeEnumMap = {
  LoadMetricType.aSGTotalCPUUtilization: 'ASGTotalCPUUtilization',
  LoadMetricType.aSGTotalNetworkIn: 'ASGTotalNetworkIn',
  LoadMetricType.aSGTotalNetworkOut: 'ASGTotalNetworkOut',
  LoadMetricType.aLBTargetGroupRequestCount: 'ALBTargetGroupRequestCount',
};

PredefinedScalingMetricSpecification
    _$PredefinedScalingMetricSpecificationFromJson(Map<String, dynamic> json) {
  return PredefinedScalingMetricSpecification(
    predefinedScalingMetricType: _$enumDecodeNullable(
        _$ScalingMetricTypeEnumMap, json['PredefinedScalingMetricType']),
    resourceLabel: json['ResourceLabel'] as String,
  );
}

Map<String, dynamic> _$PredefinedScalingMetricSpecificationToJson(
    PredefinedScalingMetricSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PredefinedScalingMetricType',
      _$ScalingMetricTypeEnumMap[instance.predefinedScalingMetricType]);
  writeNotNull('ResourceLabel', instance.resourceLabel);
  return val;
}

const _$ScalingMetricTypeEnumMap = {
  ScalingMetricType.aSGAverageCPUUtilization: 'ASGAverageCPUUtilization',
  ScalingMetricType.aSGAverageNetworkIn: 'ASGAverageNetworkIn',
  ScalingMetricType.aSGAverageNetworkOut: 'ASGAverageNetworkOut',
  ScalingMetricType.dynamoDBReadCapacityUtilization:
      'DynamoDBReadCapacityUtilization',
  ScalingMetricType.dynamoDBWriteCapacityUtilization:
      'DynamoDBWriteCapacityUtilization',
  ScalingMetricType.eCSServiceAverageCPUUtilization:
      'ECSServiceAverageCPUUtilization',
  ScalingMetricType.eCSServiceAverageMemoryUtilization:
      'ECSServiceAverageMemoryUtilization',
  ScalingMetricType.aLBRequestCountPerTarget: 'ALBRequestCountPerTarget',
  ScalingMetricType.rDSReaderAverageCPUUtilization:
      'RDSReaderAverageCPUUtilization',
  ScalingMetricType.rDSReaderAverageDatabaseConnections:
      'RDSReaderAverageDatabaseConnections',
  ScalingMetricType.eC2SpotFleetRequestAverageCPUUtilization:
      'EC2SpotFleetRequestAverageCPUUtilization',
  ScalingMetricType.eC2SpotFleetRequestAverageNetworkIn:
      'EC2SpotFleetRequestAverageNetworkIn',
  ScalingMetricType.eC2SpotFleetRequestAverageNetworkOut:
      'EC2SpotFleetRequestAverageNetworkOut',
};

ScalingInstruction _$ScalingInstructionFromJson(Map<String, dynamic> json) {
  return ScalingInstruction(
    maxCapacity: json['MaxCapacity'] as int,
    minCapacity: json['MinCapacity'] as int,
    resourceId: json['ResourceId'] as String,
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    targetTrackingConfigurations: (json['TargetTrackingConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetTrackingConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    customizedLoadMetricSpecification:
        json['CustomizedLoadMetricSpecification'] == null
            ? null
            : CustomizedLoadMetricSpecification.fromJson(
                json['CustomizedLoadMetricSpecification']
                    as Map<String, dynamic>),
    disableDynamicScaling: json['DisableDynamicScaling'] as bool,
    predefinedLoadMetricSpecification:
        json['PredefinedLoadMetricSpecification'] == null
            ? null
            : PredefinedLoadMetricSpecification.fromJson(
                json['PredefinedLoadMetricSpecification']
                    as Map<String, dynamic>),
    predictiveScalingMaxCapacityBehavior: _$enumDecodeNullable(
        _$PredictiveScalingMaxCapacityBehaviorEnumMap,
        json['PredictiveScalingMaxCapacityBehavior']),
    predictiveScalingMaxCapacityBuffer:
        json['PredictiveScalingMaxCapacityBuffer'] as int,
    predictiveScalingMode: _$enumDecodeNullable(
        _$PredictiveScalingModeEnumMap, json['PredictiveScalingMode']),
    scalingPolicyUpdateBehavior: _$enumDecodeNullable(
        _$ScalingPolicyUpdateBehaviorEnumMap,
        json['ScalingPolicyUpdateBehavior']),
    scheduledActionBufferTime: json['ScheduledActionBufferTime'] as int,
  );
}

Map<String, dynamic> _$ScalingInstructionToJson(ScalingInstruction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxCapacity', instance.maxCapacity);
  writeNotNull('MinCapacity', instance.minCapacity);
  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('ScalableDimension',
      _$ScalableDimensionEnumMap[instance.scalableDimension]);
  writeNotNull(
      'ServiceNamespace', _$ServiceNamespaceEnumMap[instance.serviceNamespace]);
  writeNotNull('TargetTrackingConfigurations',
      instance.targetTrackingConfigurations?.map((e) => e?.toJson())?.toList());
  writeNotNull('CustomizedLoadMetricSpecification',
      instance.customizedLoadMetricSpecification?.toJson());
  writeNotNull('DisableDynamicScaling', instance.disableDynamicScaling);
  writeNotNull('PredefinedLoadMetricSpecification',
      instance.predefinedLoadMetricSpecification?.toJson());
  writeNotNull(
      'PredictiveScalingMaxCapacityBehavior',
      _$PredictiveScalingMaxCapacityBehaviorEnumMap[
          instance.predictiveScalingMaxCapacityBehavior]);
  writeNotNull('PredictiveScalingMaxCapacityBuffer',
      instance.predictiveScalingMaxCapacityBuffer);
  writeNotNull('PredictiveScalingMode',
      _$PredictiveScalingModeEnumMap[instance.predictiveScalingMode]);
  writeNotNull(
      'ScalingPolicyUpdateBehavior',
      _$ScalingPolicyUpdateBehaviorEnumMap[
          instance.scalingPolicyUpdateBehavior]);
  writeNotNull('ScheduledActionBufferTime', instance.scheduledActionBufferTime);
  return val;
}

const _$ScalableDimensionEnumMap = {
  ScalableDimension.autoscalingAutoScalingGroupDesiredCapacity:
      'autoscaling:autoScalingGroup:DesiredCapacity',
  ScalableDimension.ecsServiceDesiredCount: 'ecs:service:DesiredCount',
  ScalableDimension.ec2SpotFleetRequestTargetCapacity:
      'ec2:spot-fleet-request:TargetCapacity',
  ScalableDimension.rdsClusterReadReplicaCount: 'rds:cluster:ReadReplicaCount',
  ScalableDimension.dynamodbTableReadCapacityUnits:
      'dynamodb:table:ReadCapacityUnits',
  ScalableDimension.dynamodbTableWriteCapacityUnits:
      'dynamodb:table:WriteCapacityUnits',
  ScalableDimension.dynamodbIndexReadCapacityUnits:
      'dynamodb:index:ReadCapacityUnits',
  ScalableDimension.dynamodbIndexWriteCapacityUnits:
      'dynamodb:index:WriteCapacityUnits',
};

const _$ServiceNamespaceEnumMap = {
  ServiceNamespace.autoscaling: 'autoscaling',
  ServiceNamespace.ecs: 'ecs',
  ServiceNamespace.ec2: 'ec2',
  ServiceNamespace.rds: 'rds',
  ServiceNamespace.dynamodb: 'dynamodb',
};

const _$PredictiveScalingMaxCapacityBehaviorEnumMap = {
  PredictiveScalingMaxCapacityBehavior.setForecastCapacityToMaxCapacity:
      'SetForecastCapacityToMaxCapacity',
  PredictiveScalingMaxCapacityBehavior.setMaxCapacityToForecastCapacity:
      'SetMaxCapacityToForecastCapacity',
  PredictiveScalingMaxCapacityBehavior.setMaxCapacityAboveForecastCapacity:
      'SetMaxCapacityAboveForecastCapacity',
};

const _$PredictiveScalingModeEnumMap = {
  PredictiveScalingMode.forecastAndScale: 'ForecastAndScale',
  PredictiveScalingMode.forecastOnly: 'ForecastOnly',
};

const _$ScalingPolicyUpdateBehaviorEnumMap = {
  ScalingPolicyUpdateBehavior.keepExternalPolicies: 'KeepExternalPolicies',
  ScalingPolicyUpdateBehavior.replaceExternalPolicies:
      'ReplaceExternalPolicies',
};

ScalingPlan _$ScalingPlanFromJson(Map<String, dynamic> json) {
  return ScalingPlan(
    applicationSource: json['ApplicationSource'] == null
        ? null
        : ApplicationSource.fromJson(
            json['ApplicationSource'] as Map<String, dynamic>),
    scalingInstructions: (json['ScalingInstructions'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingInstruction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scalingPlanName: json['ScalingPlanName'] as String,
    scalingPlanVersion: json['ScalingPlanVersion'] as int,
    statusCode: _$enumDecodeNullable(
        _$ScalingPlanStatusCodeEnumMap, json['StatusCode']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    statusMessage: json['StatusMessage'] as String,
    statusStartTime:
        const UnixDateTimeConverter().fromJson(json['StatusStartTime']),
  );
}

const _$ScalingPlanStatusCodeEnumMap = {
  ScalingPlanStatusCode.active: 'Active',
  ScalingPlanStatusCode.activeWithProblems: 'ActiveWithProblems',
  ScalingPlanStatusCode.creationInProgress: 'CreationInProgress',
  ScalingPlanStatusCode.creationFailed: 'CreationFailed',
  ScalingPlanStatusCode.deletionInProgress: 'DeletionInProgress',
  ScalingPlanStatusCode.deletionFailed: 'DeletionFailed',
  ScalingPlanStatusCode.updateInProgress: 'UpdateInProgress',
  ScalingPlanStatusCode.updateFailed: 'UpdateFailed',
};

ScalingPlanResource _$ScalingPlanResourceFromJson(Map<String, dynamic> json) {
  return ScalingPlanResource(
    resourceId: json['ResourceId'] as String,
    scalableDimension: _$enumDecodeNullable(
        _$ScalableDimensionEnumMap, json['ScalableDimension']),
    scalingPlanName: json['ScalingPlanName'] as String,
    scalingPlanVersion: json['ScalingPlanVersion'] as int,
    scalingStatusCode: _$enumDecodeNullable(
        _$ScalingStatusCodeEnumMap, json['ScalingStatusCode']),
    serviceNamespace: _$enumDecodeNullable(
        _$ServiceNamespaceEnumMap, json['ServiceNamespace']),
    scalingPolicies: (json['ScalingPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scalingStatusMessage: json['ScalingStatusMessage'] as String,
  );
}

const _$ScalingStatusCodeEnumMap = {
  ScalingStatusCode.inactive: 'Inactive',
  ScalingStatusCode.partiallyActive: 'PartiallyActive',
  ScalingStatusCode.active: 'Active',
};

ScalingPolicy _$ScalingPolicyFromJson(Map<String, dynamic> json) {
  return ScalingPolicy(
    policyName: json['PolicyName'] as String,
    policyType: _$enumDecodeNullable(_$PolicyTypeEnumMap, json['PolicyType']),
    targetTrackingConfiguration: json['TargetTrackingConfiguration'] == null
        ? null
        : TargetTrackingConfiguration.fromJson(
            json['TargetTrackingConfiguration'] as Map<String, dynamic>),
  );
}

const _$PolicyTypeEnumMap = {
  PolicyType.targetTrackingScaling: 'TargetTrackingScaling',
};

TagFilter _$TagFilterFromJson(Map<String, dynamic> json) {
  return TagFilter(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

TargetTrackingConfiguration _$TargetTrackingConfigurationFromJson(
    Map<String, dynamic> json) {
  return TargetTrackingConfiguration(
    targetValue: (json['TargetValue'] as num)?.toDouble(),
    customizedScalingMetricSpecification:
        json['CustomizedScalingMetricSpecification'] == null
            ? null
            : CustomizedScalingMetricSpecification.fromJson(
                json['CustomizedScalingMetricSpecification']
                    as Map<String, dynamic>),
    disableScaleIn: json['DisableScaleIn'] as bool,
    estimatedInstanceWarmup: json['EstimatedInstanceWarmup'] as int,
    predefinedScalingMetricSpecification:
        json['PredefinedScalingMetricSpecification'] == null
            ? null
            : PredefinedScalingMetricSpecification.fromJson(
                json['PredefinedScalingMetricSpecification']
                    as Map<String, dynamic>),
    scaleInCooldown: json['ScaleInCooldown'] as int,
    scaleOutCooldown: json['ScaleOutCooldown'] as int,
  );
}

Map<String, dynamic> _$TargetTrackingConfigurationToJson(
    TargetTrackingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetValue', instance.targetValue);
  writeNotNull('CustomizedScalingMetricSpecification',
      instance.customizedScalingMetricSpecification?.toJson());
  writeNotNull('DisableScaleIn', instance.disableScaleIn);
  writeNotNull('EstimatedInstanceWarmup', instance.estimatedInstanceWarmup);
  writeNotNull('PredefinedScalingMetricSpecification',
      instance.predefinedScalingMetricSpecification?.toJson());
  writeNotNull('ScaleInCooldown', instance.scaleInCooldown);
  writeNotNull('ScaleOutCooldown', instance.scaleOutCooldown);
  return val;
}

UpdateScalingPlanResponse _$UpdateScalingPlanResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateScalingPlanResponse();
}
