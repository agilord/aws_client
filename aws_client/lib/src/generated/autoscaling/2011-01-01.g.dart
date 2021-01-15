// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2011-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BlockDeviceMappingToJson(BlockDeviceMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceName', instance.deviceName);
  writeNotNull('Ebs', instance.ebs?.toJson());
  writeNotNull('NoDevice', instance.noDevice);
  writeNotNull('VirtualName', instance.virtualName);
  return val;
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

const _$MetricStatisticEnumMap = {
  MetricStatistic.average: 'Average',
  MetricStatistic.minimum: 'Minimum',
  MetricStatistic.maximum: 'Maximum',
  MetricStatistic.sampleCount: 'SampleCount',
  MetricStatistic.sum: 'Sum',
};

Map<String, dynamic> _$EbsToJson(Ebs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeleteOnTermination', instance.deleteOnTermination);
  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('Iops', instance.iops);
  writeNotNull('SnapshotId', instance.snapshotId);
  writeNotNull('VolumeSize', instance.volumeSize);
  writeNotNull('VolumeType', instance.volumeType);
  return val;
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$InstanceMetadataOptionsToJson(
    InstanceMetadataOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HttpEndpoint',
      _$InstanceMetadataEndpointStateEnumMap[instance.httpEndpoint]);
  writeNotNull('HttpPutResponseHopLimit', instance.httpPutResponseHopLimit);
  writeNotNull('HttpTokens',
      _$InstanceMetadataHttpTokensStateEnumMap[instance.httpTokens]);
  return val;
}

const _$InstanceMetadataEndpointStateEnumMap = {
  InstanceMetadataEndpointState.disabled: 'disabled',
  InstanceMetadataEndpointState.enabled: 'enabled',
};

const _$InstanceMetadataHttpTokensStateEnumMap = {
  InstanceMetadataHttpTokensState.optional: 'optional',
  InstanceMetadataHttpTokensState.required: 'required',
};

Map<String, dynamic> _$InstanceMonitoringToJson(InstanceMonitoring instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$InstancesDistributionToJson(
    InstancesDistribution instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'OnDemandAllocationStrategy', instance.onDemandAllocationStrategy);
  writeNotNull('OnDemandBaseCapacity', instance.onDemandBaseCapacity);
  writeNotNull('OnDemandPercentageAboveBaseCapacity',
      instance.onDemandPercentageAboveBaseCapacity);
  writeNotNull('SpotAllocationStrategy', instance.spotAllocationStrategy);
  writeNotNull('SpotInstancePools', instance.spotInstancePools);
  writeNotNull('SpotMaxPrice', instance.spotMaxPrice);
  return val;
}

Map<String, dynamic> _$LaunchTemplateToJson(LaunchTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LaunchTemplateSpecification',
      instance.launchTemplateSpecification?.toJson());
  writeNotNull(
      'Overrides', instance.overrides?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$LaunchTemplateOverridesToJson(
    LaunchTemplateOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('LaunchTemplateSpecification',
      instance.launchTemplateSpecification?.toJson());
  writeNotNull('WeightedCapacity', instance.weightedCapacity);
  return val;
}

Map<String, dynamic> _$LaunchTemplateSpecificationToJson(
    LaunchTemplateSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LaunchTemplateId', instance.launchTemplateId);
  writeNotNull('LaunchTemplateName', instance.launchTemplateName);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$LifecycleHookSpecificationToJson(
    LifecycleHookSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LifecycleHookName', instance.lifecycleHookName);
  writeNotNull('LifecycleTransition', instance.lifecycleTransition);
  writeNotNull('DefaultResult', instance.defaultResult);
  writeNotNull('HeartbeatTimeout', instance.heartbeatTimeout);
  writeNotNull('NotificationMetadata', instance.notificationMetadata);
  writeNotNull('NotificationTargetARN', instance.notificationTargetARN);
  writeNotNull('RoleARN', instance.roleARN);
  return val;
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

Map<String, dynamic> _$MixedInstancesPolicyToJson(
    MixedInstancesPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InstancesDistribution', instance.instancesDistribution?.toJson());
  writeNotNull('LaunchTemplate', instance.launchTemplate?.toJson());
  return val;
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
  MetricType.aSGAverageCPUUtilization: 'ASGAverageCPUUtilization',
  MetricType.aSGAverageNetworkIn: 'ASGAverageNetworkIn',
  MetricType.aSGAverageNetworkOut: 'ASGAverageNetworkOut',
  MetricType.aLBRequestCountPerTarget: 'ALBRequestCountPerTarget',
};

Map<String, dynamic> _$RefreshPreferencesToJson(RefreshPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceWarmup', instance.instanceWarmup);
  writeNotNull('MinHealthyPercentage', instance.minHealthyPercentage);
  return val;
}

Map<String, dynamic> _$ScheduledUpdateGroupActionRequestToJson(
    ScheduledUpdateGroupActionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScheduledActionName', instance.scheduledActionName);
  writeNotNull('DesiredCapacity', instance.desiredCapacity);
  writeNotNull(
      'EndTime', const IsoDateTimeConverter().toJson(instance.endTime));
  writeNotNull('MaxSize', instance.maxSize);
  writeNotNull('MinSize', instance.minSize);
  writeNotNull('Recurrence', instance.recurrence);
  writeNotNull(
      'StartTime', const IsoDateTimeConverter().toJson(instance.startTime));
  return val;
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

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('PropagateAtLaunch', instance.propagateAtLaunch);
  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('ResourceType', instance.resourceType);
  writeNotNull('Value', instance.value);
  return val;
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
  writeNotNull('CustomizedMetricSpecification',
      instance.customizedMetricSpecification?.toJson());
  writeNotNull('DisableScaleIn', instance.disableScaleIn);
  writeNotNull('PredefinedMetricSpecification',
      instance.predefinedMetricSpecification?.toJson());
  return val;
}
