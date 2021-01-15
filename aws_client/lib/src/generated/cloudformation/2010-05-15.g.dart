// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2010-05-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AutoDeploymentToJson(AutoDeployment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull(
      'RetainStacksOnAccountRemoval', instance.retainStacksOnAccountRemoval);
  return val;
}

Map<String, dynamic> _$DeploymentTargetsToJson(DeploymentTargets instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Accounts', instance.accounts);
  writeNotNull('OrganizationalUnitIds', instance.organizationalUnitIds);
  return val;
}

Map<String, dynamic> _$LoggingConfigToJson(LoggingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogGroupName', instance.logGroupName);
  writeNotNull('LogRoleArn', instance.logRoleArn);
  return val;
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterKey', instance.parameterKey);
  writeNotNull('ParameterValue', instance.parameterValue);
  writeNotNull('ResolvedValue', instance.resolvedValue);
  writeNotNull('UsePreviousValue', instance.usePreviousValue);
  return val;
}

Map<String, dynamic> _$ResourceToImportToJson(ResourceToImport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogicalResourceId', instance.logicalResourceId);
  writeNotNull('ResourceIdentifier', instance.resourceIdentifier);
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

Map<String, dynamic> _$RollbackConfigurationToJson(
    RollbackConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MonitoringTimeInMinutes', instance.monitoringTimeInMinutes);
  writeNotNull('RollbackTriggers',
      instance.rollbackTriggers?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$RollbackTriggerToJson(RollbackTrigger instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('Type', instance.type);
  return val;
}

Map<String, dynamic> _$StackInstanceFilterToJson(StackInstanceFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$StackInstanceFilterNameEnumMap[instance.name]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$StackInstanceFilterNameEnumMap = {
  StackInstanceFilterName.detailedStatus: 'DETAILED_STATUS',
};

Map<String, dynamic> _$StackSetOperationPreferencesToJson(
    StackSetOperationPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FailureToleranceCount', instance.failureToleranceCount);
  writeNotNull(
      'FailureTolerancePercentage', instance.failureTolerancePercentage);
  writeNotNull('MaxConcurrentCount', instance.maxConcurrentCount);
  writeNotNull('MaxConcurrentPercentage', instance.maxConcurrentPercentage);
  writeNotNull('RegionOrder', instance.regionOrder);
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
  writeNotNull('Value', instance.value);
  return val;
}
