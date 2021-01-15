// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-09-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  return val;
}

const _$ApplyMethodEnumMap = {
  ApplyMethod.immediate: 'immediate',
  ApplyMethod.pendingReboot: 'pending-reboot',
};

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
