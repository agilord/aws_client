// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dlm-2018-01-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLifecyclePolicyResponse _$CreateLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLifecyclePolicyResponse(
    policyId: json['PolicyId'] as String,
  );
}

CreateRule _$CreateRuleFromJson(Map<String, dynamic> json) {
  return CreateRule(
    interval: json['Interval'] as int,
    intervalUnit:
        _$enumDecodeNullable(_$IntervalUnitValuesEnumMap, json['IntervalUnit']),
    times: (json['Times'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CreateRuleToJson(CreateRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Interval', instance.interval);
  writeNotNull(
      'IntervalUnit', _$IntervalUnitValuesEnumMap[instance.intervalUnit]);
  writeNotNull('Times', instance.times);
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

const _$IntervalUnitValuesEnumMap = {
  IntervalUnitValues.hours: 'HOURS',
};

CrossRegionCopyRetainRule _$CrossRegionCopyRetainRuleFromJson(
    Map<String, dynamic> json) {
  return CrossRegionCopyRetainRule(
    interval: json['Interval'] as int,
    intervalUnit: _$enumDecodeNullable(
        _$RetentionIntervalUnitValuesEnumMap, json['IntervalUnit']),
  );
}

Map<String, dynamic> _$CrossRegionCopyRetainRuleToJson(
    CrossRegionCopyRetainRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Interval', instance.interval);
  writeNotNull('IntervalUnit',
      _$RetentionIntervalUnitValuesEnumMap[instance.intervalUnit]);
  return val;
}

const _$RetentionIntervalUnitValuesEnumMap = {
  RetentionIntervalUnitValues.days: 'DAYS',
  RetentionIntervalUnitValues.weeks: 'WEEKS',
  RetentionIntervalUnitValues.months: 'MONTHS',
  RetentionIntervalUnitValues.years: 'YEARS',
};

CrossRegionCopyRule _$CrossRegionCopyRuleFromJson(Map<String, dynamic> json) {
  return CrossRegionCopyRule(
    encrypted: json['Encrypted'] as bool,
    targetRegion: json['TargetRegion'] as String,
    cmkArn: json['CmkArn'] as String,
    copyTags: json['CopyTags'] as bool,
    retainRule: json['RetainRule'] == null
        ? null
        : CrossRegionCopyRetainRule.fromJson(
            json['RetainRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CrossRegionCopyRuleToJson(CrossRegionCopyRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('TargetRegion', instance.targetRegion);
  writeNotNull('CmkArn', instance.cmkArn);
  writeNotNull('CopyTags', instance.copyTags);
  writeNotNull('RetainRule', instance.retainRule?.toJson());
  return val;
}

DeleteLifecyclePolicyResponse _$DeleteLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyResponse();
}

FastRestoreRule _$FastRestoreRuleFromJson(Map<String, dynamic> json) {
  return FastRestoreRule(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    count: json['Count'] as int,
    interval: json['Interval'] as int,
    intervalUnit: _$enumDecodeNullable(
        _$RetentionIntervalUnitValuesEnumMap, json['IntervalUnit']),
  );
}

Map<String, dynamic> _$FastRestoreRuleToJson(FastRestoreRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('Count', instance.count);
  writeNotNull('Interval', instance.interval);
  writeNotNull('IntervalUnit',
      _$RetentionIntervalUnitValuesEnumMap[instance.intervalUnit]);
  return val;
}

GetLifecyclePoliciesResponse _$GetLifecyclePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePoliciesResponse(
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : LifecyclePolicySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetLifecyclePolicyResponse _$GetLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyResponse(
    policy: json['Policy'] == null
        ? null
        : LifecyclePolicy.fromJson(json['Policy'] as Map<String, dynamic>),
  );
}

LifecyclePolicy _$LifecyclePolicyFromJson(Map<String, dynamic> json) {
  return LifecyclePolicy(
    dateCreated: const IsoDateTimeConverter().fromJson(json['DateCreated']),
    dateModified: const IsoDateTimeConverter().fromJson(json['DateModified']),
    description: json['Description'] as String,
    executionRoleArn: json['ExecutionRoleArn'] as String,
    policyArn: json['PolicyArn'] as String,
    policyDetails: json['PolicyDetails'] == null
        ? null
        : PolicyDetails.fromJson(json['PolicyDetails'] as Map<String, dynamic>),
    policyId: json['PolicyId'] as String,
    state:
        _$enumDecodeNullable(_$GettablePolicyStateValuesEnumMap, json['State']),
    statusMessage: json['StatusMessage'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$GettablePolicyStateValuesEnumMap = {
  GettablePolicyStateValues.enabled: 'ENABLED',
  GettablePolicyStateValues.disabled: 'DISABLED',
  GettablePolicyStateValues.error: 'ERROR',
};

LifecyclePolicySummary _$LifecyclePolicySummaryFromJson(
    Map<String, dynamic> json) {
  return LifecyclePolicySummary(
    description: json['Description'] as String,
    policyId: json['PolicyId'] as String,
    state:
        _$enumDecodeNullable(_$GettablePolicyStateValuesEnumMap, json['State']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Parameters _$ParametersFromJson(Map<String, dynamic> json) {
  return Parameters(
    excludeBootVolume: json['ExcludeBootVolume'] as bool,
  );
}

Map<String, dynamic> _$ParametersToJson(Parameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExcludeBootVolume', instance.excludeBootVolume);
  return val;
}

PolicyDetails _$PolicyDetailsFromJson(Map<String, dynamic> json) {
  return PolicyDetails(
    parameters: json['Parameters'] == null
        ? null
        : Parameters.fromJson(json['Parameters'] as Map<String, dynamic>),
    policyType:
        _$enumDecodeNullable(_$PolicyTypeValuesEnumMap, json['PolicyType']),
    resourceTypes: (json['ResourceTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ResourceTypeValuesEnumMap, e))
        ?.toList(),
    schedules: (json['Schedules'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetTags: (json['TargetTags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PolicyDetailsToJson(PolicyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Parameters', instance.parameters?.toJson());
  writeNotNull('PolicyType', _$PolicyTypeValuesEnumMap[instance.policyType]);
  writeNotNull(
      'ResourceTypes',
      instance.resourceTypes
          ?.map((e) => _$ResourceTypeValuesEnumMap[e])
          ?.toList());
  writeNotNull(
      'Schedules', instance.schedules?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'TargetTags', instance.targetTags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$PolicyTypeValuesEnumMap = {
  PolicyTypeValues.ebsSnapshotManagement: 'EBS_SNAPSHOT_MANAGEMENT',
};

const _$ResourceTypeValuesEnumMap = {
  ResourceTypeValues.volume: 'VOLUME',
  ResourceTypeValues.instance: 'INSTANCE',
};

RetainRule _$RetainRuleFromJson(Map<String, dynamic> json) {
  return RetainRule(
    count: json['Count'] as int,
    interval: json['Interval'] as int,
    intervalUnit: _$enumDecodeNullable(
        _$RetentionIntervalUnitValuesEnumMap, json['IntervalUnit']),
  );
}

Map<String, dynamic> _$RetainRuleToJson(RetainRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Count', instance.count);
  writeNotNull('Interval', instance.interval);
  writeNotNull('IntervalUnit',
      _$RetentionIntervalUnitValuesEnumMap[instance.intervalUnit]);
  return val;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    copyTags: json['CopyTags'] as bool,
    createRule: json['CreateRule'] == null
        ? null
        : CreateRule.fromJson(json['CreateRule'] as Map<String, dynamic>),
    crossRegionCopyRules: (json['CrossRegionCopyRules'] as List)
        ?.map((e) => e == null
            ? null
            : CrossRegionCopyRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fastRestoreRule: json['FastRestoreRule'] == null
        ? null
        : FastRestoreRule.fromJson(
            json['FastRestoreRule'] as Map<String, dynamic>),
    name: json['Name'] as String,
    retainRule: json['RetainRule'] == null
        ? null
        : RetainRule.fromJson(json['RetainRule'] as Map<String, dynamic>),
    tagsToAdd: (json['TagsToAdd'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variableTags: (json['VariableTags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CopyTags', instance.copyTags);
  writeNotNull('CreateRule', instance.createRule?.toJson());
  writeNotNull('CrossRegionCopyRules',
      instance.crossRegionCopyRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('FastRestoreRule', instance.fastRestoreRule?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('RetainRule', instance.retainRule?.toJson());
  writeNotNull(
      'TagsToAdd', instance.tagsToAdd?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'VariableTags', instance.variableTags?.map((e) => e?.toJson())?.toList());
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateLifecyclePolicyResponse _$UpdateLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLifecyclePolicyResponse();
}
