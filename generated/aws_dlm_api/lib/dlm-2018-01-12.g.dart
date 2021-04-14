// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dlm-2018-01-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    crossRegionCopy: (json['CrossRegionCopy'] as List<dynamic>)
        .map((e) => CrossRegionCopyAction.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'CrossRegionCopy':
          instance.crossRegionCopy.map((e) => e.toJson()).toList(),
      'Name': instance.name,
    };

CreateLifecyclePolicyResponse _$CreateLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLifecyclePolicyResponse(
    policyId: json['PolicyId'] as String?,
  );
}

CreateRule _$CreateRuleFromJson(Map<String, dynamic> json) {
  return CreateRule(
    cronExpression: json['CronExpression'] as String?,
    interval: json['Interval'] as int?,
    intervalUnit:
        _$enumDecodeNullable(_$IntervalUnitValuesEnumMap, json['IntervalUnit']),
    times: (json['Times'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CreateRuleToJson(CreateRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CronExpression', instance.cronExpression);
  writeNotNull('Interval', instance.interval);
  writeNotNull(
      'IntervalUnit', _$IntervalUnitValuesEnumMap[instance.intervalUnit]);
  writeNotNull('Times', instance.times);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$IntervalUnitValuesEnumMap = {
  IntervalUnitValues.hours: 'HOURS',
};

CrossRegionCopyAction _$CrossRegionCopyActionFromJson(
    Map<String, dynamic> json) {
  return CrossRegionCopyAction(
    encryptionConfiguration: EncryptionConfiguration.fromJson(
        json['EncryptionConfiguration'] as Map<String, dynamic>),
    target: json['Target'] as String,
    retainRule: json['RetainRule'] == null
        ? null
        : CrossRegionCopyRetainRule.fromJson(
            json['RetainRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CrossRegionCopyActionToJson(
    CrossRegionCopyAction instance) {
  final val = <String, dynamic>{
    'EncryptionConfiguration': instance.encryptionConfiguration.toJson(),
    'Target': instance.target,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetainRule', instance.retainRule?.toJson());
  return val;
}

CrossRegionCopyRetainRule _$CrossRegionCopyRetainRuleFromJson(
    Map<String, dynamic> json) {
  return CrossRegionCopyRetainRule(
    interval: json['Interval'] as int?,
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
    cmkArn: json['CmkArn'] as String?,
    copyTags: json['CopyTags'] as bool?,
    retainRule: json['RetainRule'] == null
        ? null
        : CrossRegionCopyRetainRule.fromJson(
            json['RetainRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CrossRegionCopyRuleToJson(CrossRegionCopyRule instance) {
  final val = <String, dynamic>{
    'Encrypted': instance.encrypted,
    'TargetRegion': instance.targetRegion,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CmkArn', instance.cmkArn);
  writeNotNull('CopyTags', instance.copyTags);
  writeNotNull('RetainRule', instance.retainRule?.toJson());
  return val;
}

DeleteLifecyclePolicyResponse _$DeleteLifecyclePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyResponse();
}

EncryptionConfiguration _$EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return EncryptionConfiguration(
    encrypted: json['Encrypted'] as bool,
    cmkArn: json['CmkArn'] as String?,
  );
}

Map<String, dynamic> _$EncryptionConfigurationToJson(
    EncryptionConfiguration instance) {
  final val = <String, dynamic>{
    'Encrypted': instance.encrypted,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CmkArn', instance.cmkArn);
  return val;
}

EventParameters _$EventParametersFromJson(Map<String, dynamic> json) {
  return EventParameters(
    descriptionRegex: json['DescriptionRegex'] as String,
    eventType: _$enumDecode(_$EventTypeValuesEnumMap, json['EventType']),
    snapshotOwner: (json['SnapshotOwner'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$EventParametersToJson(EventParameters instance) =>
    <String, dynamic>{
      'DescriptionRegex': instance.descriptionRegex,
      'EventType': _$EventTypeValuesEnumMap[instance.eventType],
      'SnapshotOwner': instance.snapshotOwner,
    };

const _$EventTypeValuesEnumMap = {
  EventTypeValues.shareSnapshot: 'shareSnapshot',
};

EventSource _$EventSourceFromJson(Map<String, dynamic> json) {
  return EventSource(
    type: _$enumDecode(_$EventSourceValuesEnumMap, json['Type']),
    parameters: json['Parameters'] == null
        ? null
        : EventParameters.fromJson(json['Parameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventSourceToJson(EventSource instance) {
  final val = <String, dynamic>{
    'Type': _$EventSourceValuesEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Parameters', instance.parameters?.toJson());
  return val;
}

const _$EventSourceValuesEnumMap = {
  EventSourceValues.managedCwe: 'MANAGED_CWE',
};

FastRestoreRule _$FastRestoreRuleFromJson(Map<String, dynamic> json) {
  return FastRestoreRule(
    availabilityZones: (json['AvailabilityZones'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    count: json['Count'] as int?,
    interval: json['Interval'] as int?,
    intervalUnit: _$enumDecodeNullable(
        _$RetentionIntervalUnitValuesEnumMap, json['IntervalUnit']),
  );
}

Map<String, dynamic> _$FastRestoreRuleToJson(FastRestoreRule instance) {
  final val = <String, dynamic>{
    'AvailabilityZones': instance.availabilityZones,
  };

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

GetLifecyclePoliciesResponse _$GetLifecyclePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePoliciesResponse(
    policies: (json['Policies'] as List<dynamic>?)
        ?.map((e) => LifecyclePolicySummary.fromJson(e as Map<String, dynamic>))
        .toList(),
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
    description: json['Description'] as String?,
    executionRoleArn: json['ExecutionRoleArn'] as String?,
    policyArn: json['PolicyArn'] as String?,
    policyDetails: json['PolicyDetails'] == null
        ? null
        : PolicyDetails.fromJson(json['PolicyDetails'] as Map<String, dynamic>),
    policyId: json['PolicyId'] as String?,
    state:
        _$enumDecodeNullable(_$GettablePolicyStateValuesEnumMap, json['State']),
    statusMessage: json['StatusMessage'] as String?,
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
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
    description: json['Description'] as String?,
    policyId: json['PolicyId'] as String?,
    policyType:
        _$enumDecodeNullable(_$PolicyTypeValuesEnumMap, json['PolicyType']),
    state:
        _$enumDecodeNullable(_$GettablePolicyStateValuesEnumMap, json['State']),
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$PolicyTypeValuesEnumMap = {
  PolicyTypeValues.ebsSnapshotManagement: 'EBS_SNAPSHOT_MANAGEMENT',
  PolicyTypeValues.imageManagement: 'IMAGE_MANAGEMENT',
  PolicyTypeValues.eventBasedPolicy: 'EVENT_BASED_POLICY',
};

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Parameters _$ParametersFromJson(Map<String, dynamic> json) {
  return Parameters(
    excludeBootVolume: json['ExcludeBootVolume'] as bool?,
    noReboot: json['NoReboot'] as bool?,
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
  writeNotNull('NoReboot', instance.noReboot);
  return val;
}

PolicyDetails _$PolicyDetailsFromJson(Map<String, dynamic> json) {
  return PolicyDetails(
    actions: (json['Actions'] as List<dynamic>?)
        ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventSource: json['EventSource'] == null
        ? null
        : EventSource.fromJson(json['EventSource'] as Map<String, dynamic>),
    parameters: json['Parameters'] == null
        ? null
        : Parameters.fromJson(json['Parameters'] as Map<String, dynamic>),
    policyType:
        _$enumDecodeNullable(_$PolicyTypeValuesEnumMap, json['PolicyType']),
    resourceTypes: (json['ResourceTypes'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$ResourceTypeValuesEnumMap, e))
        .toList(),
    schedules: (json['Schedules'] as List<dynamic>?)
        ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
        .toList(),
    targetTags: (json['TargetTags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PolicyDetailsToJson(PolicyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions?.map((e) => e.toJson()).toList());
  writeNotNull('EventSource', instance.eventSource?.toJson());
  writeNotNull('Parameters', instance.parameters?.toJson());
  writeNotNull('PolicyType', _$PolicyTypeValuesEnumMap[instance.policyType]);
  writeNotNull(
      'ResourceTypes',
      instance.resourceTypes
          ?.map((e) => _$ResourceTypeValuesEnumMap[e])
          .toList());
  writeNotNull(
      'Schedules', instance.schedules?.map((e) => e.toJson()).toList());
  writeNotNull(
      'TargetTags', instance.targetTags?.map((e) => e.toJson()).toList());
  return val;
}

const _$ResourceTypeValuesEnumMap = {
  ResourceTypeValues.volume: 'VOLUME',
  ResourceTypeValues.instance: 'INSTANCE',
};

RetainRule _$RetainRuleFromJson(Map<String, dynamic> json) {
  return RetainRule(
    count: json['Count'] as int?,
    interval: json['Interval'] as int?,
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
    copyTags: json['CopyTags'] as bool?,
    createRule: json['CreateRule'] == null
        ? null
        : CreateRule.fromJson(json['CreateRule'] as Map<String, dynamic>),
    crossRegionCopyRules: (json['CrossRegionCopyRules'] as List<dynamic>?)
        ?.map((e) => CrossRegionCopyRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    fastRestoreRule: json['FastRestoreRule'] == null
        ? null
        : FastRestoreRule.fromJson(
            json['FastRestoreRule'] as Map<String, dynamic>),
    name: json['Name'] as String?,
    retainRule: json['RetainRule'] == null
        ? null
        : RetainRule.fromJson(json['RetainRule'] as Map<String, dynamic>),
    shareRules: (json['ShareRules'] as List<dynamic>?)
        ?.map((e) => ShareRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    tagsToAdd: (json['TagsToAdd'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    variableTags: (json['VariableTags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
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
      instance.crossRegionCopyRules?.map((e) => e.toJson()).toList());
  writeNotNull('FastRestoreRule', instance.fastRestoreRule?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('RetainRule', instance.retainRule?.toJson());
  writeNotNull(
      'ShareRules', instance.shareRules?.map((e) => e.toJson()).toList());
  writeNotNull(
      'TagsToAdd', instance.tagsToAdd?.map((e) => e.toJson()).toList());
  writeNotNull(
      'VariableTags', instance.variableTags?.map((e) => e.toJson()).toList());
  return val;
}

ShareRule _$ShareRuleFromJson(Map<String, dynamic> json) {
  return ShareRule(
    targetAccounts: (json['TargetAccounts'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    unshareInterval: json['UnshareInterval'] as int?,
    unshareIntervalUnit: _$enumDecodeNullable(
        _$RetentionIntervalUnitValuesEnumMap, json['UnshareIntervalUnit']),
  );
}

Map<String, dynamic> _$ShareRuleToJson(ShareRule instance) {
  final val = <String, dynamic>{
    'TargetAccounts': instance.targetAccounts,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UnshareInterval', instance.unshareInterval);
  writeNotNull('UnshareIntervalUnit',
      _$RetentionIntervalUnitValuesEnumMap[instance.unshareIntervalUnit]);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

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
