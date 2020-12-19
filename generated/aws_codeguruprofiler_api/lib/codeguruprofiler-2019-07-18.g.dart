// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codeguruprofiler-2019-07-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentConfiguration _$AgentConfigurationFromJson(Map<String, dynamic> json) {
  return AgentConfiguration(
    periodInSeconds: json['periodInSeconds'] as int,
    shouldProfile: json['shouldProfile'] as bool,
  );
}

AgentOrchestrationConfig _$AgentOrchestrationConfigFromJson(
    Map<String, dynamic> json) {
  return AgentOrchestrationConfig(
    profilingEnabled: json['profilingEnabled'] as bool,
  );
}

Map<String, dynamic> _$AgentOrchestrationConfigToJson(
    AgentOrchestrationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profilingEnabled', instance.profilingEnabled);
  return val;
}

AggregatedProfileTime _$AggregatedProfileTimeFromJson(
    Map<String, dynamic> json) {
  return AggregatedProfileTime(
    period: _$enumDecodeNullable(_$AggregationPeriodEnumMap, json['period']),
    start: const IsoDateTimeConverter().fromJson(json['start']),
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

const _$AggregationPeriodEnumMap = {
  AggregationPeriod.p1d: 'P1D',
  AggregationPeriod.pt1h: 'PT1H',
  AggregationPeriod.pt5m: 'PT5M',
};

ConfigureAgentResponse _$ConfigureAgentResponseFromJson(
    Map<String, dynamic> json) {
  return ConfigureAgentResponse(
    configuration: json['configuration'] == null
        ? null
        : AgentConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
  );
}

CreateProfilingGroupResponse _$CreateProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}

DeleteProfilingGroupResponse _$DeleteProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfilingGroupResponse();
}

DescribeProfilingGroupResponse _$DescribeProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) {
  return GetProfileResponse(
    contentType: json['Content-Type'] as String,
    profile: const Uint8ListConverter().fromJson(json['profile'] as String),
    contentEncoding: json['Content-Encoding'] as String,
  );
}

ListProfileTimesResponse _$ListProfileTimesResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfileTimesResponse(
    profileTimes: (json['profileTimes'] as List)
        ?.map((e) =>
            e == null ? null : ProfileTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProfilingGroupsResponse _$ListProfilingGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfilingGroupsResponse(
    profilingGroupNames: (json['profilingGroupNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
    profilingGroups: (json['profilingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ProfilingGroupDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PostAgentProfileResponse _$PostAgentProfileResponseFromJson(
    Map<String, dynamic> json) {
  return PostAgentProfileResponse();
}

ProfileTime _$ProfileTimeFromJson(Map<String, dynamic> json) {
  return ProfileTime(
    start: const IsoDateTimeConverter().fromJson(json['start']),
  );
}

ProfilingGroupDescription _$ProfilingGroupDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProfilingGroupDescription(
    agentOrchestrationConfig: json['agentOrchestrationConfig'] == null
        ? null
        : AgentOrchestrationConfig.fromJson(
            json['agentOrchestrationConfig'] as Map<String, dynamic>),
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    profilingStatus: json['profilingStatus'] == null
        ? null
        : ProfilingStatus.fromJson(
            json['profilingStatus'] as Map<String, dynamic>),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

ProfilingStatus _$ProfilingStatusFromJson(Map<String, dynamic> json) {
  return ProfilingStatus(
    latestAgentOrchestratedAt: const IsoDateTimeConverter()
        .fromJson(json['latestAgentOrchestratedAt']),
    latestAgentProfileReportedAt: const IsoDateTimeConverter()
        .fromJson(json['latestAgentProfileReportedAt']),
    latestAggregatedProfile: json['latestAggregatedProfile'] == null
        ? null
        : AggregatedProfileTime.fromJson(
            json['latestAggregatedProfile'] as Map<String, dynamic>),
  );
}

PutPermissionResponse _$PutPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return PutPermissionResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

RemovePermissionResponse _$RemovePermissionResponseFromJson(
    Map<String, dynamic> json) {
  return RemovePermissionResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

UpdateProfilingGroupResponse _$UpdateProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}
