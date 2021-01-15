// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-10-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CloudwatchLogsExportConfigurationToJson(
    CloudwatchLogsExportConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisableLogTypes', instance.disableLogTypes);
  writeNotNull('EnableLogTypes', instance.enableLogTypes);
  return val;
}

Map<String, dynamic> _$ConnectionPoolConfigurationToJson(
    ConnectionPoolConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionBorrowTimeout', instance.connectionBorrowTimeout);
  writeNotNull('InitQuery', instance.initQuery);
  writeNotNull('MaxConnectionsPercent', instance.maxConnectionsPercent);
  writeNotNull('MaxIdleConnectionsPercent', instance.maxIdleConnectionsPercent);
  writeNotNull('SessionPinningFilters', instance.sessionPinningFilters);
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

Map<String, dynamic> _$OptionConfigurationToJson(OptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OptionName', instance.optionName);
  writeNotNull(
      'DBSecurityGroupMemberships', instance.dBSecurityGroupMemberships);
  writeNotNull('OptionSettings',
      instance.optionSettings?.map((e) => e?.toJson())?.toList());
  writeNotNull('OptionVersion', instance.optionVersion);
  writeNotNull('Port', instance.port);
  writeNotNull(
      'VpcSecurityGroupMemberships', instance.vpcSecurityGroupMemberships);
  return val;
}

Map<String, dynamic> _$OptionSettingToJson(OptionSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedValues', instance.allowedValues);
  writeNotNull('ApplyType', instance.applyType);
  writeNotNull('DataType', instance.dataType);
  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('Description', instance.description);
  writeNotNull('IsCollection', instance.isCollection);
  writeNotNull('IsModifiable', instance.isModifiable);
  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedValues', instance.allowedValues);
  writeNotNull('ApplyMethod', _$ApplyMethodEnumMap[instance.applyMethod]);
  writeNotNull('ApplyType', instance.applyType);
  writeNotNull('DataType', instance.dataType);
  writeNotNull('Description', instance.description);
  writeNotNull('IsModifiable', instance.isModifiable);
  writeNotNull('MinimumEngineVersion', instance.minimumEngineVersion);
  writeNotNull('ParameterName', instance.parameterName);
  writeNotNull('ParameterValue', instance.parameterValue);
  writeNotNull('Source', instance.source);
  writeNotNull('SupportedEngineModes', instance.supportedEngineModes);
  return val;
}

const _$ApplyMethodEnumMap = {
  ApplyMethod.immediate: 'immediate',
  ApplyMethod.pendingReboot: 'pending-reboot',
};

Map<String, dynamic> _$ProcessorFeatureToJson(ProcessorFeature instance) {
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

Map<String, dynamic> _$ScalingConfigurationToJson(
    ScalingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoPause', instance.autoPause);
  writeNotNull('MaxCapacity', instance.maxCapacity);
  writeNotNull('MinCapacity', instance.minCapacity);
  writeNotNull('SecondsUntilAutoPause', instance.secondsUntilAutoPause);
  writeNotNull('TimeoutAction', instance.timeoutAction);
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

Map<String, dynamic> _$UserAuthConfigToJson(UserAuthConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthScheme', _$AuthSchemeEnumMap[instance.authScheme]);
  writeNotNull('Description', instance.description);
  writeNotNull('IAMAuth', _$IAMAuthModeEnumMap[instance.iAMAuth]);
  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('UserName', instance.userName);
  return val;
}

const _$AuthSchemeEnumMap = {
  AuthScheme.secrets: 'SECRETS',
};

const _$IAMAuthModeEnumMap = {
  IAMAuthMode.disabled: 'DISABLED',
  IAMAuthMode.required: 'REQUIRED',
};
