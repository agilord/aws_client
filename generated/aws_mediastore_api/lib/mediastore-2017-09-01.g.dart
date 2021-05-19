// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediastore-2017-09-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Container _$ContainerFromJson(Map<String, dynamic> json) {
  return Container(
    arn: json['ARN'] as String?,
    accessLoggingEnabled: json['AccessLoggingEnabled'] as bool?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpoint: json['Endpoint'] as String?,
    name: json['Name'] as String?,
    status: _$enumDecodeNullable(_$ContainerStatusEnumMap, json['Status']),
  );
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

const _$ContainerStatusEnumMap = {
  ContainerStatus.active: 'ACTIVE',
  ContainerStatus.creating: 'CREATING',
  ContainerStatus.deleting: 'DELETING',
};

CorsRule _$CorsRuleFromJson(Map<String, dynamic> json) {
  return CorsRule(
    allowedHeaders: (json['AllowedHeaders'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    allowedOrigins: (json['AllowedOrigins'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    allowedMethods: (json['AllowedMethods'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$MethodNameEnumMap, e))
        .toList(),
    exposeHeaders: (json['ExposeHeaders'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    maxAgeSeconds: json['MaxAgeSeconds'] as int?,
  );
}

Map<String, dynamic> _$CorsRuleToJson(CorsRule instance) {
  final val = <String, dynamic>{
    'AllowedHeaders': instance.allowedHeaders,
    'AllowedOrigins': instance.allowedOrigins,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedMethods',
      instance.allowedMethods?.map((e) => _$MethodNameEnumMap[e]).toList());
  writeNotNull('ExposeHeaders', instance.exposeHeaders);
  writeNotNull('MaxAgeSeconds', instance.maxAgeSeconds);
  return val;
}

const _$MethodNameEnumMap = {
  MethodName.put: 'PUT',
  MethodName.get: 'GET',
  MethodName.delete: 'DELETE',
  MethodName.head: 'HEAD',
};

CreateContainerOutput _$CreateContainerOutputFromJson(
    Map<String, dynamic> json) {
  return CreateContainerOutput(
    container: Container.fromJson(json['Container'] as Map<String, dynamic>),
  );
}

DeleteContainerOutput _$DeleteContainerOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteContainerOutput();
}

DeleteContainerPolicyOutput _$DeleteContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteContainerPolicyOutput();
}

DeleteCorsPolicyOutput _$DeleteCorsPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteCorsPolicyOutput();
}

DeleteLifecyclePolicyOutput _$DeleteLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteLifecyclePolicyOutput();
}

DeleteMetricPolicyOutput _$DeleteMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteMetricPolicyOutput();
}

DescribeContainerOutput _$DescribeContainerOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeContainerOutput(
    container: json['Container'] == null
        ? null
        : Container.fromJson(json['Container'] as Map<String, dynamic>),
  );
}

GetContainerPolicyOutput _$GetContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetContainerPolicyOutput(
    policy: json['Policy'] as String,
  );
}

GetCorsPolicyOutput _$GetCorsPolicyOutputFromJson(Map<String, dynamic> json) {
  return GetCorsPolicyOutput(
    corsPolicy: (json['CorsPolicy'] as List<dynamic>)
        .map((e) => CorsRule.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetLifecyclePolicyOutput _$GetLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetLifecyclePolicyOutput(
    lifecyclePolicy: json['LifecyclePolicy'] as String,
  );
}

GetMetricPolicyOutput _$GetMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetMetricPolicyOutput(
    metricPolicy:
        MetricPolicy.fromJson(json['MetricPolicy'] as Map<String, dynamic>),
  );
}

ListContainersOutput _$ListContainersOutputFromJson(Map<String, dynamic> json) {
  return ListContainersOutput(
    containers: (json['Containers'] as List<dynamic>)
        .map((e) => Container.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

MetricPolicy _$MetricPolicyFromJson(Map<String, dynamic> json) {
  return MetricPolicy(
    containerLevelMetrics: _$enumDecode(
        _$ContainerLevelMetricsEnumMap, json['ContainerLevelMetrics']),
    metricPolicyRules: (json['MetricPolicyRules'] as List<dynamic>?)
        ?.map((e) => MetricPolicyRule.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MetricPolicyToJson(MetricPolicy instance) {
  final val = <String, dynamic>{
    'ContainerLevelMetrics':
        _$ContainerLevelMetricsEnumMap[instance.containerLevelMetrics],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricPolicyRules',
      instance.metricPolicyRules?.map((e) => e.toJson()).toList());
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

Map<String, dynamic> _$MetricPolicyRuleToJson(MetricPolicyRule instance) =>
    <String, dynamic>{
      'ObjectGroup': instance.objectGroup,
      'ObjectGroupName': instance.objectGroupName,
    };

PutContainerPolicyOutput _$PutContainerPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutContainerPolicyOutput();
}

PutCorsPolicyOutput _$PutCorsPolicyOutputFromJson(Map<String, dynamic> json) {
  return PutCorsPolicyOutput();
}

PutLifecyclePolicyOutput _$PutLifecyclePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutLifecyclePolicyOutput();
}

PutMetricPolicyOutput _$PutMetricPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutMetricPolicyOutput();
}

StartAccessLoggingOutput _$StartAccessLoggingOutputFromJson(
    Map<String, dynamic> json) {
  return StartAccessLoggingOutput();
}

StopAccessLoggingOutput _$StopAccessLoggingOutputFromJson(
    Map<String, dynamic> json) {
  return StopAccessLoggingOutput();
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{
    'Key': instance.key,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}
