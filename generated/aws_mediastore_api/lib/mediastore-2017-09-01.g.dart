// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediastore-2017-09-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Container _$ContainerFromJson(Map<String, dynamic> json) {
  return Container(
    arn: json['ARN'] as String,
    accessLoggingEnabled: json['AccessLoggingEnabled'] as bool,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    endpoint: json['Endpoint'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$ContainerStatusEnumMap, json['Status']),
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

const _$ContainerStatusEnumMap = {
  ContainerStatus.active: 'ACTIVE',
  ContainerStatus.creating: 'CREATING',
  ContainerStatus.deleting: 'DELETING',
};

CorsRule _$CorsRuleFromJson(Map<String, dynamic> json) {
  return CorsRule(
    allowedHeaders:
        (json['AllowedHeaders'] as List)?.map((e) => e as String)?.toList(),
    allowedOrigins:
        (json['AllowedOrigins'] as List)?.map((e) => e as String)?.toList(),
    allowedMethods:
        (json['AllowedMethods'] as List)?.map((e) => e as String)?.toList(),
    exposeHeaders:
        (json['ExposeHeaders'] as List)?.map((e) => e as String)?.toList(),
    maxAgeSeconds: json['MaxAgeSeconds'] as int,
  );
}

Map<String, dynamic> _$CorsRuleToJson(CorsRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedHeaders', instance.allowedHeaders);
  writeNotNull('AllowedOrigins', instance.allowedOrigins);
  writeNotNull('AllowedMethods', instance.allowedMethods);
  writeNotNull('ExposeHeaders', instance.exposeHeaders);
  writeNotNull('MaxAgeSeconds', instance.maxAgeSeconds);
  return val;
}

Map<String, dynamic> _$CreateContainerInputToJson(
    CreateContainerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateContainerOutput _$CreateContainerOutputFromJson(
    Map<String, dynamic> json) {
  return CreateContainerOutput(
    container: json['Container'] == null
        ? null
        : Container.fromJson(json['Container'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteContainerInputToJson(
    DeleteContainerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DeleteContainerOutput _$DeleteContainerOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteContainerOutput();
}

Map<String, dynamic> _$DeleteContainerPolicyInputToJson(
    DeleteContainerPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DeleteContainerPolicyOutput _$DeleteContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteContainerPolicyOutput();
}

Map<String, dynamic> _$DeleteCorsPolicyInputToJson(
    DeleteCorsPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DeleteCorsPolicyOutput _$DeleteCorsPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteCorsPolicyOutput();
}

Map<String, dynamic> _$DeleteLifecyclePolicyInputToJson(
    DeleteLifecyclePolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DeleteLifecyclePolicyOutput _$DeleteLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyOutput();
}

Map<String, dynamic> _$DeleteMetricPolicyInputToJson(
    DeleteMetricPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DeleteMetricPolicyOutput _$DeleteMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteMetricPolicyOutput();
}

Map<String, dynamic> _$DescribeContainerInputToJson(
    DescribeContainerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

DescribeContainerOutput _$DescribeContainerOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeContainerOutput(
    container: json['Container'] == null
        ? null
        : Container.fromJson(json['Container'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetContainerPolicyInputToJson(
    GetContainerPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

GetContainerPolicyOutput _$GetContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetContainerPolicyOutput(
    policy: json['Policy'] as String,
  );
}

Map<String, dynamic> _$GetCorsPolicyInputToJson(GetCorsPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

GetCorsPolicyOutput _$GetCorsPolicyOutputFromJson(Map<String, dynamic> json) {
  return GetCorsPolicyOutput(
    corsPolicy: (json['CorsPolicy'] as List)
        ?.map((e) =>
            e == null ? null : CorsRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetLifecyclePolicyInputToJson(
    GetLifecyclePolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

GetLifecyclePolicyOutput _$GetLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyOutput(
    lifecyclePolicy: json['LifecyclePolicy'] as String,
  );
}

Map<String, dynamic> _$GetMetricPolicyInputToJson(
    GetMetricPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

GetMetricPolicyOutput _$GetMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetMetricPolicyOutput(
    metricPolicy: json['MetricPolicy'] == null
        ? null
        : MetricPolicy.fromJson(json['MetricPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListContainersInputToJson(ListContainersInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListContainersOutput _$ListContainersOutputFromJson(Map<String, dynamic> json) {
  return ListContainersOutput(
    containers: (json['Containers'] as List)
        ?.map((e) =>
            e == null ? null : Container.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceInputToJson(
    ListTagsForResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Resource', instance.resource);
  return val;
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricPolicy _$MetricPolicyFromJson(Map<String, dynamic> json) {
  return MetricPolicy(
    containerLevelMetrics: _$enumDecodeNullable(
        _$ContainerLevelMetricsEnumMap, json['ContainerLevelMetrics']),
    metricPolicyRules: (json['MetricPolicyRules'] as List)
        ?.map((e) => e == null
            ? null
            : MetricPolicyRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MetricPolicyToJson(MetricPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerLevelMetrics',
      _$ContainerLevelMetricsEnumMap[instance.containerLevelMetrics]);
  writeNotNull('MetricPolicyRules',
      instance.metricPolicyRules?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ContainerLevelMetricsEnumMap = {
  ContainerLevelMetrics.enabled: 'ENABLED',
  ContainerLevelMetrics.disabled: 'DISABLED',
};

MetricPolicyRule _$MetricPolicyRuleFromJson(Map<String, dynamic> json) {
  return MetricPolicyRule(
    objectGroup: json['ObjectGroup'] as String,
    objectGroupName: json['ObjectGroupName'] as String,
  );
}

Map<String, dynamic> _$MetricPolicyRuleToJson(MetricPolicyRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectGroup', instance.objectGroup);
  writeNotNull('ObjectGroupName', instance.objectGroupName);
  return val;
}

Map<String, dynamic> _$PutContainerPolicyInputToJson(
    PutContainerPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  writeNotNull('Policy', instance.policy);
  return val;
}

PutContainerPolicyOutput _$PutContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutContainerPolicyOutput();
}

Map<String, dynamic> _$PutCorsPolicyInputToJson(PutCorsPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  writeNotNull(
      'CorsPolicy', instance.corsPolicy?.map((e) => e?.toJson())?.toList());
  return val;
}

PutCorsPolicyOutput _$PutCorsPolicyOutputFromJson(Map<String, dynamic> json) {
  return PutCorsPolicyOutput();
}

Map<String, dynamic> _$PutLifecyclePolicyInputToJson(
    PutLifecyclePolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  writeNotNull('LifecyclePolicy', instance.lifecyclePolicy);
  return val;
}

PutLifecyclePolicyOutput _$PutLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutLifecyclePolicyOutput();
}

Map<String, dynamic> _$PutMetricPolicyInputToJson(
    PutMetricPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  writeNotNull('MetricPolicy', instance.metricPolicy?.toJson());
  return val;
}

PutMetricPolicyOutput _$PutMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutMetricPolicyOutput();
}

Map<String, dynamic> _$StartAccessLoggingInputToJson(
    StartAccessLoggingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

StartAccessLoggingOutput _$StartAccessLoggingOutputFromJson(
    Map<String, dynamic> json) {
  return StartAccessLoggingOutput();
}

Map<String, dynamic> _$StopAccessLoggingInputToJson(
    StopAccessLoggingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerName', instance.containerName);
  return val;
}

StopAccessLoggingOutput _$StopAccessLoggingOutputFromJson(
    Map<String, dynamic> json) {
  return StopAccessLoggingOutput();
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

Map<String, dynamic> _$TagResourceInputToJson(TagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Resource', instance.resource);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

Map<String, dynamic> _$UntagResourceInputToJson(UntagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Resource', instance.resource);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}
