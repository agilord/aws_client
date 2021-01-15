// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2010-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ApplicationResourceLifecycleConfigToJson(
    ApplicationResourceLifecycleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceRole', instance.serviceRole);
  writeNotNull(
      'VersionLifecycleConfig', instance.versionLifecycleConfig?.toJson());
  return val;
}

Map<String, dynamic> _$ApplicationVersionLifecycleConfigToJson(
    ApplicationVersionLifecycleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxAgeRule', instance.maxAgeRule?.toJson());
  writeNotNull('MaxCountRule', instance.maxCountRule?.toJson());
  return val;
}

Map<String, dynamic> _$BuildConfigurationToJson(BuildConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CodeBuildServiceRole', instance.codeBuildServiceRole);
  writeNotNull('Image', instance.image);
  writeNotNull('ArtifactName', instance.artifactName);
  writeNotNull('ComputeType', _$ComputeTypeEnumMap[instance.computeType]);
  writeNotNull('TimeoutInMinutes', instance.timeoutInMinutes);
  return val;
}

const _$ComputeTypeEnumMap = {
  ComputeType.buildGeneral1Small: 'BUILD_GENERAL1_SMALL',
  ComputeType.buildGeneral1Medium: 'BUILD_GENERAL1_MEDIUM',
  ComputeType.buildGeneral1Large: 'BUILD_GENERAL1_LARGE',
};

Map<String, dynamic> _$ConfigurationOptionSettingToJson(
    ConfigurationOptionSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Namespace', instance.namespace);
  writeNotNull('OptionName', instance.optionName);
  writeNotNull('ResourceName', instance.resourceName);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$EnvironmentTierToJson(EnvironmentTier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Type', instance.type);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$MaxAgeRuleToJson(MaxAgeRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('DeleteSourceFromS3', instance.deleteSourceFromS3);
  writeNotNull('MaxAgeInDays', instance.maxAgeInDays);
  return val;
}

Map<String, dynamic> _$MaxCountRuleToJson(MaxCountRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('DeleteSourceFromS3', instance.deleteSourceFromS3);
  writeNotNull('MaxCount', instance.maxCount);
  return val;
}

Map<String, dynamic> _$OptionSpecificationToJson(OptionSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Namespace', instance.namespace);
  writeNotNull('OptionName', instance.optionName);
  writeNotNull('ResourceName', instance.resourceName);
  return val;
}

Map<String, dynamic> _$PlatformFilterToJson(PlatformFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Operator', instance.operator);
  writeNotNull('Type', instance.type);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  return val;
}

Map<String, dynamic> _$SearchFilterToJson(SearchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attribute', instance.attribute);
  writeNotNull('Operator', instance.operator);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$SourceBuildInformationToJson(
    SourceBuildInformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceLocation', instance.sourceLocation);
  writeNotNull(
      'SourceRepository', _$SourceRepositoryEnumMap[instance.sourceRepository]);
  writeNotNull('SourceType', _$SourceTypeEnumMap[instance.sourceType]);
  return val;
}

const _$SourceRepositoryEnumMap = {
  SourceRepository.codeCommit: 'CodeCommit',
  SourceRepository.s3: 'S3',
};

const _$SourceTypeEnumMap = {
  SourceType.git: 'Git',
  SourceType.zip: 'Zip',
};

Map<String, dynamic> _$SourceConfigurationToJson(SourceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationName', instance.applicationName);
  writeNotNull('TemplateName', instance.templateName);
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
