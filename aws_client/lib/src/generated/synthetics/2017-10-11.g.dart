// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Canary _$CanaryFromJson(Map<String, dynamic> json) {
  return Canary(
    artifactS3Location: json['ArtifactS3Location'] as String,
    code: json['Code'] == null
        ? null
        : CanaryCodeOutput.fromJson(json['Code'] as Map<String, dynamic>),
    engineArn: json['EngineArn'] as String,
    executionRoleArn: json['ExecutionRoleArn'] as String,
    failureRetentionPeriodInDays: json['FailureRetentionPeriodInDays'] as int,
    id: json['Id'] as String,
    name: json['Name'] as String,
    runConfig: json['RunConfig'] == null
        ? null
        : CanaryRunConfigOutput.fromJson(
            json['RunConfig'] as Map<String, dynamic>),
    runtimeVersion: json['RuntimeVersion'] as String,
    schedule: json['Schedule'] == null
        ? null
        : CanaryScheduleOutput.fromJson(
            json['Schedule'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : CanaryStatus.fromJson(json['Status'] as Map<String, dynamic>),
    successRetentionPeriodInDays: json['SuccessRetentionPeriodInDays'] as int,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeline: json['Timeline'] == null
        ? null
        : CanaryTimeline.fromJson(json['Timeline'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfigOutput.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CanaryCodeInputToJson(CanaryCodeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Handler', instance.handler);
  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  writeNotNull('S3Version', instance.s3Version);
  writeNotNull('ZipFile', const Uint8ListConverter().toJson(instance.zipFile));
  return val;
}

CanaryCodeOutput _$CanaryCodeOutputFromJson(Map<String, dynamic> json) {
  return CanaryCodeOutput(
    handler: json['Handler'] as String,
    sourceLocationArn: json['SourceLocationArn'] as String,
  );
}

CanaryLastRun _$CanaryLastRunFromJson(Map<String, dynamic> json) {
  return CanaryLastRun(
    canaryName: json['CanaryName'] as String,
    lastRun: json['LastRun'] == null
        ? null
        : CanaryRun.fromJson(json['LastRun'] as Map<String, dynamic>),
  );
}

CanaryRun _$CanaryRunFromJson(Map<String, dynamic> json) {
  return CanaryRun(
    artifactS3Location: json['ArtifactS3Location'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: json['Status'] == null
        ? null
        : CanaryRunStatus.fromJson(json['Status'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : CanaryRunTimeline.fromJson(json['Timeline'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CanaryRunConfigInputToJson(
    CanaryRunConfigInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActiveTracing', instance.activeTracing);
  writeNotNull('EnvironmentVariables', instance.environmentVariables);
  writeNotNull('MemoryInMB', instance.memoryInMB);
  writeNotNull('TimeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

CanaryRunConfigOutput _$CanaryRunConfigOutputFromJson(
    Map<String, dynamic> json) {
  return CanaryRunConfigOutput(
    activeTracing: json['ActiveTracing'] as bool,
    memoryInMB: json['MemoryInMB'] as int,
    timeoutInSeconds: json['TimeoutInSeconds'] as int,
  );
}

CanaryRunStatus _$CanaryRunStatusFromJson(Map<String, dynamic> json) {
  return CanaryRunStatus(
    state: _$enumDecodeNullable(_$CanaryRunStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
    stateReasonCode: _$enumDecodeNullable(
        _$CanaryRunStateReasonCodeEnumMap, json['StateReasonCode']),
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

const _$CanaryRunStateEnumMap = {
  CanaryRunState.running: 'RUNNING',
  CanaryRunState.passed: 'PASSED',
  CanaryRunState.failed: 'FAILED',
};

const _$CanaryRunStateReasonCodeEnumMap = {
  CanaryRunStateReasonCode.canaryFailure: 'CANARY_FAILURE',
  CanaryRunStateReasonCode.executionFailure: 'EXECUTION_FAILURE',
};

CanaryRunTimeline _$CanaryRunTimelineFromJson(Map<String, dynamic> json) {
  return CanaryRunTimeline(
    completed: const UnixDateTimeConverter().fromJson(json['Completed']),
    started: const UnixDateTimeConverter().fromJson(json['Started']),
  );
}

Map<String, dynamic> _$CanaryScheduleInputToJson(CanaryScheduleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Expression', instance.expression);
  writeNotNull('DurationInSeconds', instance.durationInSeconds);
  return val;
}

CanaryScheduleOutput _$CanaryScheduleOutputFromJson(Map<String, dynamic> json) {
  return CanaryScheduleOutput(
    durationInSeconds: json['DurationInSeconds'] as int,
    expression: json['Expression'] as String,
  );
}

CanaryStatus _$CanaryStatusFromJson(Map<String, dynamic> json) {
  return CanaryStatus(
    state: _$enumDecodeNullable(_$CanaryStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
    stateReasonCode: _$enumDecodeNullable(
        _$CanaryStateReasonCodeEnumMap, json['StateReasonCode']),
  );
}

const _$CanaryStateEnumMap = {
  CanaryState.creating: 'CREATING',
  CanaryState.ready: 'READY',
  CanaryState.starting: 'STARTING',
  CanaryState.running: 'RUNNING',
  CanaryState.updating: 'UPDATING',
  CanaryState.stopping: 'STOPPING',
  CanaryState.stopped: 'STOPPED',
  CanaryState.error: 'ERROR',
  CanaryState.deleting: 'DELETING',
};

const _$CanaryStateReasonCodeEnumMap = {
  CanaryStateReasonCode.invalidPermissions: 'INVALID_PERMISSIONS',
};

CanaryTimeline _$CanaryTimelineFromJson(Map<String, dynamic> json) {
  return CanaryTimeline(
    created: const UnixDateTimeConverter().fromJson(json['Created']),
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    lastStarted: const UnixDateTimeConverter().fromJson(json['LastStarted']),
    lastStopped: const UnixDateTimeConverter().fromJson(json['LastStopped']),
  );
}

CreateCanaryResponse _$CreateCanaryResponseFromJson(Map<String, dynamic> json) {
  return CreateCanaryResponse(
    canary: json['Canary'] == null
        ? null
        : Canary.fromJson(json['Canary'] as Map<String, dynamic>),
  );
}

DeleteCanaryResponse _$DeleteCanaryResponseFromJson(Map<String, dynamic> json) {
  return DeleteCanaryResponse();
}

DescribeCanariesLastRunResponse _$DescribeCanariesLastRunResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCanariesLastRunResponse(
    canariesLastRun: (json['CanariesLastRun'] as List)
        ?.map((e) => e == null
            ? null
            : CanaryLastRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeCanariesResponse _$DescribeCanariesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCanariesResponse(
    canaries: (json['Canaries'] as List)
        ?.map((e) =>
            e == null ? null : Canary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeRuntimeVersionsResponse _$DescribeRuntimeVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRuntimeVersionsResponse(
    nextToken: json['NextToken'] as String,
    runtimeVersions: (json['RuntimeVersions'] as List)
        ?.map((e) => e == null
            ? null
            : RuntimeVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCanaryResponse _$GetCanaryResponseFromJson(Map<String, dynamic> json) {
  return GetCanaryResponse(
    canary: json['Canary'] == null
        ? null
        : Canary.fromJson(json['Canary'] as Map<String, dynamic>),
  );
}

GetCanaryRunsResponse _$GetCanaryRunsResponseFromJson(
    Map<String, dynamic> json) {
  return GetCanaryRunsResponse(
    canaryRuns: (json['CanaryRuns'] as List)
        ?.map((e) =>
            e == null ? null : CanaryRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
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

RuntimeVersion _$RuntimeVersionFromJson(Map<String, dynamic> json) {
  return RuntimeVersion(
    deprecationDate:
        const UnixDateTimeConverter().fromJson(json['DeprecationDate']),
    description: json['Description'] as String,
    releaseDate: const UnixDateTimeConverter().fromJson(json['ReleaseDate']),
    versionName: json['VersionName'] as String,
  );
}

StartCanaryResponse _$StartCanaryResponseFromJson(Map<String, dynamic> json) {
  return StartCanaryResponse();
}

StopCanaryResponse _$StopCanaryResponseFromJson(Map<String, dynamic> json) {
  return StopCanaryResponse();
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateCanaryResponse _$UpdateCanaryResponseFromJson(Map<String, dynamic> json) {
  return UpdateCanaryResponse();
}

Map<String, dynamic> _$VpcConfigInputToJson(VpcConfigInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

VpcConfigOutput _$VpcConfigOutputFromJson(Map<String, dynamic> json) {
  return VpcConfigOutput(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}
