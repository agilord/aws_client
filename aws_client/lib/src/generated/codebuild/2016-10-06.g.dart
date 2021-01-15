// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-10-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteBuildsOutput _$BatchDeleteBuildsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteBuildsOutput(
    buildsDeleted:
        (json['buildsDeleted'] as List)?.map((e) => e as String)?.toList(),
    buildsNotDeleted: (json['buildsNotDeleted'] as List)
        ?.map((e) => e == null
            ? null
            : BuildNotDeleted.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetBuildBatchesOutput _$BatchGetBuildBatchesOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetBuildBatchesOutput(
    buildBatches: (json['buildBatches'] as List)
        ?.map((e) =>
            e == null ? null : BuildBatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    buildBatchesNotFound: (json['buildBatchesNotFound'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

BatchGetBuildsOutput _$BatchGetBuildsOutputFromJson(Map<String, dynamic> json) {
  return BatchGetBuildsOutput(
    builds: (json['builds'] as List)
        ?.map(
            (e) => e == null ? null : Build.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    buildsNotFound:
        (json['buildsNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchGetProjectsOutput _$BatchGetProjectsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetProjectsOutput(
    projects: (json['projects'] as List)
        ?.map((e) =>
            e == null ? null : Project.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectsNotFound:
        (json['projectsNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchGetReportGroupsOutput _$BatchGetReportGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetReportGroupsOutput(
    reportGroups: (json['reportGroups'] as List)
        ?.map((e) =>
            e == null ? null : ReportGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reportGroupsNotFound: (json['reportGroupsNotFound'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

BatchGetReportsOutput _$BatchGetReportsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetReportsOutput(
    reports: (json['reports'] as List)
        ?.map((e) =>
            e == null ? null : Report.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reportsNotFound:
        (json['reportsNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchRestrictions _$BatchRestrictionsFromJson(Map<String, dynamic> json) {
  return BatchRestrictions(
    computeTypesAllowed: (json['computeTypesAllowed'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    maximumBuildsAllowed: json['maximumBuildsAllowed'] as int,
  );
}

Map<String, dynamic> _$BatchRestrictionsToJson(BatchRestrictions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('computeTypesAllowed', instance.computeTypesAllowed);
  writeNotNull('maximumBuildsAllowed', instance.maximumBuildsAllowed);
  return val;
}

Build _$BuildFromJson(Map<String, dynamic> json) {
  return Build(
    arn: json['arn'] as String,
    artifacts: json['artifacts'] == null
        ? null
        : BuildArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>),
    buildBatchArn: json['buildBatchArn'] as String,
    buildComplete: json['buildComplete'] as bool,
    buildNumber: json['buildNumber'] as int,
    buildStatus: _$enumDecodeNullable(_$StatusTypeEnumMap, json['buildStatus']),
    cache: json['cache'] == null
        ? null
        : ProjectCache.fromJson(json['cache'] as Map<String, dynamic>),
    currentPhase: json['currentPhase'] as String,
    debugSession: json['debugSession'] == null
        ? null
        : DebugSession.fromJson(json['debugSession'] as Map<String, dynamic>),
    encryptionKey: json['encryptionKey'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    environment: json['environment'] == null
        ? null
        : ProjectEnvironment.fromJson(
            json['environment'] as Map<String, dynamic>),
    exportedEnvironmentVariables: (json['exportedEnvironmentVariables'] as List)
        ?.map((e) => e == null
            ? null
            : ExportedEnvironmentVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fileSystemLocations: (json['fileSystemLocations'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    initiator: json['initiator'] as String,
    logs: json['logs'] == null
        ? null
        : LogsLocation.fromJson(json['logs'] as Map<String, dynamic>),
    networkInterface: json['networkInterface'] == null
        ? null
        : NetworkInterface.fromJson(
            json['networkInterface'] as Map<String, dynamic>),
    phases: (json['phases'] as List)
        ?.map((e) =>
            e == null ? null : BuildPhase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectName: json['projectName'] as String,
    queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int,
    reportArns: (json['reportArns'] as List)?.map((e) => e as String)?.toList(),
    resolvedSourceVersion: json['resolvedSourceVersion'] as String,
    secondaryArtifacts: (json['secondaryArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : BuildArtifacts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySourceVersions: (json['secondarySourceVersions'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySources: (json['secondarySources'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceRole: json['serviceRole'] as String,
    source: json['source'] == null
        ? null
        : ProjectSource.fromJson(json['source'] as Map<String, dynamic>),
    sourceVersion: json['sourceVersion'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    timeoutInMinutes: json['timeoutInMinutes'] as int,
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>),
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

const _$StatusTypeEnumMap = {
  StatusType.succeeded: 'SUCCEEDED',
  StatusType.failed: 'FAILED',
  StatusType.fault: 'FAULT',
  StatusType.timedOut: 'TIMED_OUT',
  StatusType.inProgress: 'IN_PROGRESS',
  StatusType.stopped: 'STOPPED',
};

BuildArtifacts _$BuildArtifactsFromJson(Map<String, dynamic> json) {
  return BuildArtifacts(
    artifactIdentifier: json['artifactIdentifier'] as String,
    encryptionDisabled: json['encryptionDisabled'] as bool,
    location: json['location'] as String,
    md5sum: json['md5sum'] as String,
    overrideArtifactName: json['overrideArtifactName'] as bool,
    sha256sum: json['sha256sum'] as String,
  );
}

BuildBatch _$BuildBatchFromJson(Map<String, dynamic> json) {
  return BuildBatch(
    arn: json['arn'] as String,
    artifacts: json['artifacts'] == null
        ? null
        : BuildArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>),
    buildBatchConfig: json['buildBatchConfig'] == null
        ? null
        : ProjectBuildBatchConfig.fromJson(
            json['buildBatchConfig'] as Map<String, dynamic>),
    buildBatchNumber: json['buildBatchNumber'] as int,
    buildBatchStatus:
        _$enumDecodeNullable(_$StatusTypeEnumMap, json['buildBatchStatus']),
    buildGroups: (json['buildGroups'] as List)
        ?.map((e) =>
            e == null ? null : BuildGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    buildTimeoutInMinutes: json['buildTimeoutInMinutes'] as int,
    cache: json['cache'] == null
        ? null
        : ProjectCache.fromJson(json['cache'] as Map<String, dynamic>),
    complete: json['complete'] as bool,
    currentPhase: json['currentPhase'] as String,
    encryptionKey: json['encryptionKey'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    environment: json['environment'] == null
        ? null
        : ProjectEnvironment.fromJson(
            json['environment'] as Map<String, dynamic>),
    fileSystemLocations: (json['fileSystemLocations'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    initiator: json['initiator'] as String,
    logConfig: json['logConfig'] == null
        ? null
        : LogsConfig.fromJson(json['logConfig'] as Map<String, dynamic>),
    phases: (json['phases'] as List)
        ?.map((e) => e == null
            ? null
            : BuildBatchPhase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectName: json['projectName'] as String,
    queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int,
    resolvedSourceVersion: json['resolvedSourceVersion'] as String,
    secondaryArtifacts: (json['secondaryArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : BuildArtifacts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySourceVersions: (json['secondarySourceVersions'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySources: (json['secondarySources'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceRole: json['serviceRole'] as String,
    source: json['source'] == null
        ? null
        : ProjectSource.fromJson(json['source'] as Map<String, dynamic>),
    sourceVersion: json['sourceVersion'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BuildBatchFilterToJson(BuildBatchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$StatusTypeEnumMap[instance.status]);
  return val;
}

BuildBatchPhase _$BuildBatchPhaseFromJson(Map<String, dynamic> json) {
  return BuildBatchPhase(
    contexts: (json['contexts'] as List)
        ?.map((e) =>
            e == null ? null : PhaseContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    durationInSeconds: json['durationInSeconds'] as int,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    phaseStatus: _$enumDecodeNullable(_$StatusTypeEnumMap, json['phaseStatus']),
    phaseType:
        _$enumDecodeNullable(_$BuildBatchPhaseTypeEnumMap, json['phaseType']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
  );
}

const _$BuildBatchPhaseTypeEnumMap = {
  BuildBatchPhaseType.submitted: 'SUBMITTED',
  BuildBatchPhaseType.downloadBatchspec: 'DOWNLOAD_BATCHSPEC',
  BuildBatchPhaseType.inProgress: 'IN_PROGRESS',
  BuildBatchPhaseType.combineArtifacts: 'COMBINE_ARTIFACTS',
  BuildBatchPhaseType.succeeded: 'SUCCEEDED',
  BuildBatchPhaseType.failed: 'FAILED',
  BuildBatchPhaseType.stopped: 'STOPPED',
};

BuildGroup _$BuildGroupFromJson(Map<String, dynamic> json) {
  return BuildGroup(
    currentBuildSummary: json['currentBuildSummary'] == null
        ? null
        : BuildSummary.fromJson(
            json['currentBuildSummary'] as Map<String, dynamic>),
    dependsOn: (json['dependsOn'] as List)?.map((e) => e as String)?.toList(),
    identifier: json['identifier'] as String,
    ignoreFailure: json['ignoreFailure'] as bool,
    priorBuildSummaryList: (json['priorBuildSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : BuildSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BuildNotDeleted _$BuildNotDeletedFromJson(Map<String, dynamic> json) {
  return BuildNotDeleted(
    id: json['id'] as String,
    statusCode: json['statusCode'] as String,
  );
}

BuildPhase _$BuildPhaseFromJson(Map<String, dynamic> json) {
  return BuildPhase(
    contexts: (json['contexts'] as List)
        ?.map((e) =>
            e == null ? null : PhaseContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    durationInSeconds: json['durationInSeconds'] as int,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    phaseStatus: _$enumDecodeNullable(_$StatusTypeEnumMap, json['phaseStatus']),
    phaseType: _$enumDecodeNullable(_$BuildPhaseTypeEnumMap, json['phaseType']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
  );
}

const _$BuildPhaseTypeEnumMap = {
  BuildPhaseType.submitted: 'SUBMITTED',
  BuildPhaseType.queued: 'QUEUED',
  BuildPhaseType.provisioning: 'PROVISIONING',
  BuildPhaseType.downloadSource: 'DOWNLOAD_SOURCE',
  BuildPhaseType.install: 'INSTALL',
  BuildPhaseType.preBuild: 'PRE_BUILD',
  BuildPhaseType.build: 'BUILD',
  BuildPhaseType.postBuild: 'POST_BUILD',
  BuildPhaseType.uploadArtifacts: 'UPLOAD_ARTIFACTS',
  BuildPhaseType.finalizing: 'FINALIZING',
  BuildPhaseType.completed: 'COMPLETED',
};

BuildStatusConfig _$BuildStatusConfigFromJson(Map<String, dynamic> json) {
  return BuildStatusConfig(
    context: json['context'] as String,
    targetUrl: json['targetUrl'] as String,
  );
}

Map<String, dynamic> _$BuildStatusConfigToJson(BuildStatusConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('context', instance.context);
  writeNotNull('targetUrl', instance.targetUrl);
  return val;
}

BuildSummary _$BuildSummaryFromJson(Map<String, dynamic> json) {
  return BuildSummary(
    arn: json['arn'] as String,
    buildStatus: _$enumDecodeNullable(_$StatusTypeEnumMap, json['buildStatus']),
    primaryArtifact: json['primaryArtifact'] == null
        ? null
        : ResolvedArtifact.fromJson(
            json['primaryArtifact'] as Map<String, dynamic>),
    requestedOn: const UnixDateTimeConverter().fromJson(json['requestedOn']),
    secondaryArtifacts: (json['secondaryArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ResolvedArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CloudWatchLogsConfig _$CloudWatchLogsConfigFromJson(Map<String, dynamic> json) {
  return CloudWatchLogsConfig(
    status: _$enumDecodeNullable(_$LogsConfigStatusTypeEnumMap, json['status']),
    groupName: json['groupName'] as String,
    streamName: json['streamName'] as String,
  );
}

Map<String, dynamic> _$CloudWatchLogsConfigToJson(
    CloudWatchLogsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$LogsConfigStatusTypeEnumMap[instance.status]);
  writeNotNull('groupName', instance.groupName);
  writeNotNull('streamName', instance.streamName);
  return val;
}

const _$LogsConfigStatusTypeEnumMap = {
  LogsConfigStatusType.enabled: 'ENABLED',
  LogsConfigStatusType.disabled: 'DISABLED',
};

CodeCoverage _$CodeCoverageFromJson(Map<String, dynamic> json) {
  return CodeCoverage(
    branchCoveragePercentage:
        (json['branchCoveragePercentage'] as num)?.toDouble(),
    branchesCovered: json['branchesCovered'] as int,
    branchesMissed: json['branchesMissed'] as int,
    expired: const UnixDateTimeConverter().fromJson(json['expired']),
    filePath: json['filePath'] as String,
    id: json['id'] as String,
    lineCoveragePercentage: (json['lineCoveragePercentage'] as num)?.toDouble(),
    linesCovered: json['linesCovered'] as int,
    linesMissed: json['linesMissed'] as int,
    reportARN: json['reportARN'] as String,
  );
}

CodeCoverageReportSummary _$CodeCoverageReportSummaryFromJson(
    Map<String, dynamic> json) {
  return CodeCoverageReportSummary(
    branchCoveragePercentage:
        (json['branchCoveragePercentage'] as num)?.toDouble(),
    branchesCovered: json['branchesCovered'] as int,
    branchesMissed: json['branchesMissed'] as int,
    lineCoveragePercentage: (json['lineCoveragePercentage'] as num)?.toDouble(),
    linesCovered: json['linesCovered'] as int,
    linesMissed: json['linesMissed'] as int,
  );
}

CreateProjectOutput _$CreateProjectOutputFromJson(Map<String, dynamic> json) {
  return CreateProjectOutput(
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

CreateReportGroupOutput _$CreateReportGroupOutputFromJson(
    Map<String, dynamic> json) {
  return CreateReportGroupOutput(
    reportGroup: json['reportGroup'] == null
        ? null
        : ReportGroup.fromJson(json['reportGroup'] as Map<String, dynamic>),
  );
}

CreateWebhookOutput _$CreateWebhookOutputFromJson(Map<String, dynamic> json) {
  return CreateWebhookOutput(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

DebugSession _$DebugSessionFromJson(Map<String, dynamic> json) {
  return DebugSession(
    sessionEnabled: json['sessionEnabled'] as bool,
    sessionTarget: json['sessionTarget'] as String,
  );
}

DeleteBuildBatchOutput _$DeleteBuildBatchOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBuildBatchOutput(
    buildsDeleted:
        (json['buildsDeleted'] as List)?.map((e) => e as String)?.toList(),
    buildsNotDeleted: (json['buildsNotDeleted'] as List)
        ?.map((e) => e == null
            ? null
            : BuildNotDeleted.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusCode: json['statusCode'] as String,
  );
}

DeleteProjectOutput _$DeleteProjectOutputFromJson(Map<String, dynamic> json) {
  return DeleteProjectOutput();
}

DeleteReportGroupOutput _$DeleteReportGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteReportGroupOutput();
}

DeleteReportOutput _$DeleteReportOutputFromJson(Map<String, dynamic> json) {
  return DeleteReportOutput();
}

DeleteResourcePolicyOutput _$DeleteResourcePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyOutput();
}

DeleteSourceCredentialsOutput _$DeleteSourceCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSourceCredentialsOutput(
    arn: json['arn'] as String,
  );
}

DeleteWebhookOutput _$DeleteWebhookOutputFromJson(Map<String, dynamic> json) {
  return DeleteWebhookOutput();
}

DescribeCodeCoveragesOutput _$DescribeCodeCoveragesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeCodeCoveragesOutput(
    codeCoverages: (json['codeCoverages'] as List)
        ?.map((e) =>
            e == null ? null : CodeCoverage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeTestCasesOutput _$DescribeTestCasesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTestCasesOutput(
    nextToken: json['nextToken'] as String,
    testCases: (json['testCases'] as List)
        ?.map((e) =>
            e == null ? null : TestCase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

EnvironmentImage _$EnvironmentImageFromJson(Map<String, dynamic> json) {
  return EnvironmentImage(
    description: json['description'] as String,
    name: json['name'] as String,
    versions: (json['versions'] as List)?.map((e) => e as String)?.toList(),
  );
}

EnvironmentLanguage _$EnvironmentLanguageFromJson(Map<String, dynamic> json) {
  return EnvironmentLanguage(
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    language: _$enumDecodeNullable(_$LanguageTypeEnumMap, json['language']),
  );
}

const _$LanguageTypeEnumMap = {
  LanguageType.java: 'JAVA',
  LanguageType.python: 'PYTHON',
  LanguageType.nodeJs: 'NODE_JS',
  LanguageType.ruby: 'RUBY',
  LanguageType.golang: 'GOLANG',
  LanguageType.docker: 'DOCKER',
  LanguageType.android: 'ANDROID',
  LanguageType.dotnet: 'DOTNET',
  LanguageType.base: 'BASE',
  LanguageType.php: 'PHP',
};

EnvironmentPlatform _$EnvironmentPlatformFromJson(Map<String, dynamic> json) {
  return EnvironmentPlatform(
    languages: (json['languages'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    platform: _$enumDecodeNullable(_$PlatformTypeEnumMap, json['platform']),
  );
}

const _$PlatformTypeEnumMap = {
  PlatformType.debian: 'DEBIAN',
  PlatformType.amazonLinux: 'AMAZON_LINUX',
  PlatformType.ubuntu: 'UBUNTU',
  PlatformType.windowsServer: 'WINDOWS_SERVER',
};

EnvironmentVariable _$EnvironmentVariableFromJson(Map<String, dynamic> json) {
  return EnvironmentVariable(
    name: json['name'] as String,
    value: json['value'] as String,
    type: _$enumDecodeNullable(_$EnvironmentVariableTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$EnvironmentVariableToJson(EnvironmentVariable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  writeNotNull('type', _$EnvironmentVariableTypeEnumMap[instance.type]);
  return val;
}

const _$EnvironmentVariableTypeEnumMap = {
  EnvironmentVariableType.plaintext: 'PLAINTEXT',
  EnvironmentVariableType.parameterStore: 'PARAMETER_STORE',
  EnvironmentVariableType.secretsManager: 'SECRETS_MANAGER',
};

ExportedEnvironmentVariable _$ExportedEnvironmentVariableFromJson(
    Map<String, dynamic> json) {
  return ExportedEnvironmentVariable(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

GetReportGroupTrendOutput _$GetReportGroupTrendOutputFromJson(
    Map<String, dynamic> json) {
  return GetReportGroupTrendOutput(
    rawData: (json['rawData'] as List)
        ?.map((e) => e == null
            ? null
            : ReportWithRawData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stats: json['stats'] == null
        ? null
        : ReportGroupTrendStats.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

GetResourcePolicyOutput _$GetResourcePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyOutput(
    policy: json['policy'] as String,
  );
}

GitSubmodulesConfig _$GitSubmodulesConfigFromJson(Map<String, dynamic> json) {
  return GitSubmodulesConfig(
    fetchSubmodules: json['fetchSubmodules'] as bool,
  );
}

Map<String, dynamic> _$GitSubmodulesConfigToJson(GitSubmodulesConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fetchSubmodules', instance.fetchSubmodules);
  return val;
}

ImportSourceCredentialsOutput _$ImportSourceCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return ImportSourceCredentialsOutput(
    arn: json['arn'] as String,
  );
}

InvalidateProjectCacheOutput _$InvalidateProjectCacheOutputFromJson(
    Map<String, dynamic> json) {
  return InvalidateProjectCacheOutput();
}

ListBuildBatchesForProjectOutput _$ListBuildBatchesForProjectOutputFromJson(
    Map<String, dynamic> json) {
  return ListBuildBatchesForProjectOutput(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBuildBatchesOutput _$ListBuildBatchesOutputFromJson(
    Map<String, dynamic> json) {
  return ListBuildBatchesOutput(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBuildsForProjectOutput _$ListBuildsForProjectOutputFromJson(
    Map<String, dynamic> json) {
  return ListBuildsForProjectOutput(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBuildsOutput _$ListBuildsOutputFromJson(Map<String, dynamic> json) {
  return ListBuildsOutput(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListCuratedEnvironmentImagesOutput _$ListCuratedEnvironmentImagesOutputFromJson(
    Map<String, dynamic> json) {
  return ListCuratedEnvironmentImagesOutput(
    platforms: (json['platforms'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentPlatform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProjectsOutput _$ListProjectsOutputFromJson(Map<String, dynamic> json) {
  return ListProjectsOutput(
    nextToken: json['nextToken'] as String,
    projects: (json['projects'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListReportGroupsOutput _$ListReportGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListReportGroupsOutput(
    nextToken: json['nextToken'] as String,
    reportGroups:
        (json['reportGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListReportsForReportGroupOutput _$ListReportsForReportGroupOutputFromJson(
    Map<String, dynamic> json) {
  return ListReportsForReportGroupOutput(
    nextToken: json['nextToken'] as String,
    reports: (json['reports'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListReportsOutput _$ListReportsOutputFromJson(Map<String, dynamic> json) {
  return ListReportsOutput(
    nextToken: json['nextToken'] as String,
    reports: (json['reports'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListSharedProjectsOutput _$ListSharedProjectsOutputFromJson(
    Map<String, dynamic> json) {
  return ListSharedProjectsOutput(
    nextToken: json['nextToken'] as String,
    projects: (json['projects'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListSharedReportGroupsOutput _$ListSharedReportGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListSharedReportGroupsOutput(
    nextToken: json['nextToken'] as String,
    reportGroups:
        (json['reportGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListSourceCredentialsOutput _$ListSourceCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return ListSourceCredentialsOutput(
    sourceCredentialsInfos: (json['sourceCredentialsInfos'] as List)
        ?.map((e) => e == null
            ? null
            : SourceCredentialsInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogsConfig _$LogsConfigFromJson(Map<String, dynamic> json) {
  return LogsConfig(
    cloudWatchLogs: json['cloudWatchLogs'] == null
        ? null
        : CloudWatchLogsConfig.fromJson(
            json['cloudWatchLogs'] as Map<String, dynamic>),
    s3Logs: json['s3Logs'] == null
        ? null
        : S3LogsConfig.fromJson(json['s3Logs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LogsConfigToJson(LogsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudWatchLogs', instance.cloudWatchLogs?.toJson());
  writeNotNull('s3Logs', instance.s3Logs?.toJson());
  return val;
}

LogsLocation _$LogsLocationFromJson(Map<String, dynamic> json) {
  return LogsLocation(
    cloudWatchLogs: json['cloudWatchLogs'] == null
        ? null
        : CloudWatchLogsConfig.fromJson(
            json['cloudWatchLogs'] as Map<String, dynamic>),
    cloudWatchLogsArn: json['cloudWatchLogsArn'] as String,
    deepLink: json['deepLink'] as String,
    groupName: json['groupName'] as String,
    s3DeepLink: json['s3DeepLink'] as String,
    s3Logs: json['s3Logs'] == null
        ? null
        : S3LogsConfig.fromJson(json['s3Logs'] as Map<String, dynamic>),
    s3LogsArn: json['s3LogsArn'] as String,
    streamName: json['streamName'] as String,
  );
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    networkInterfaceId: json['networkInterfaceId'] as String,
    subnetId: json['subnetId'] as String,
  );
}

PhaseContext _$PhaseContextFromJson(Map<String, dynamic> json) {
  return PhaseContext(
    message: json['message'] as String,
    statusCode: json['statusCode'] as String,
  );
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    arn: json['arn'] as String,
    artifacts: json['artifacts'] == null
        ? null
        : ProjectArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>),
    badge: json['badge'] == null
        ? null
        : ProjectBadge.fromJson(json['badge'] as Map<String, dynamic>),
    buildBatchConfig: json['buildBatchConfig'] == null
        ? null
        : ProjectBuildBatchConfig.fromJson(
            json['buildBatchConfig'] as Map<String, dynamic>),
    cache: json['cache'] == null
        ? null
        : ProjectCache.fromJson(json['cache'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    description: json['description'] as String,
    encryptionKey: json['encryptionKey'] as String,
    environment: json['environment'] == null
        ? null
        : ProjectEnvironment.fromJson(
            json['environment'] as Map<String, dynamic>),
    fileSystemLocations: (json['fileSystemLocations'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastModified: const UnixDateTimeConverter().fromJson(json['lastModified']),
    logsConfig: json['logsConfig'] == null
        ? null
        : LogsConfig.fromJson(json['logsConfig'] as Map<String, dynamic>),
    name: json['name'] as String,
    queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int,
    secondaryArtifacts: (json['secondaryArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectArtifacts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySourceVersions: (json['secondarySourceVersions'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondarySources: (json['secondarySources'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceRole: json['serviceRole'] as String,
    source: json['source'] == null
        ? null
        : ProjectSource.fromJson(json['source'] as Map<String, dynamic>),
    sourceVersion: json['sourceVersion'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeoutInMinutes: json['timeoutInMinutes'] as int,
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>),
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

ProjectArtifacts _$ProjectArtifactsFromJson(Map<String, dynamic> json) {
  return ProjectArtifacts(
    type: _$enumDecodeNullable(_$ArtifactsTypeEnumMap, json['type']),
    artifactIdentifier: json['artifactIdentifier'] as String,
    encryptionDisabled: json['encryptionDisabled'] as bool,
    location: json['location'] as String,
    name: json['name'] as String,
    namespaceType:
        _$enumDecodeNullable(_$ArtifactNamespaceEnumMap, json['namespaceType']),
    overrideArtifactName: json['overrideArtifactName'] as bool,
    packaging:
        _$enumDecodeNullable(_$ArtifactPackagingEnumMap, json['packaging']),
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$ProjectArtifactsToJson(ProjectArtifacts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$ArtifactsTypeEnumMap[instance.type]);
  writeNotNull('artifactIdentifier', instance.artifactIdentifier);
  writeNotNull('encryptionDisabled', instance.encryptionDisabled);
  writeNotNull('location', instance.location);
  writeNotNull('name', instance.name);
  writeNotNull(
      'namespaceType', _$ArtifactNamespaceEnumMap[instance.namespaceType]);
  writeNotNull('overrideArtifactName', instance.overrideArtifactName);
  writeNotNull('packaging', _$ArtifactPackagingEnumMap[instance.packaging]);
  writeNotNull('path', instance.path);
  return val;
}

const _$ArtifactsTypeEnumMap = {
  ArtifactsType.codepipeline: 'CODEPIPELINE',
  ArtifactsType.s3: 'S3',
  ArtifactsType.noArtifacts: 'NO_ARTIFACTS',
};

const _$ArtifactNamespaceEnumMap = {
  ArtifactNamespace.none: 'NONE',
  ArtifactNamespace.buildId: 'BUILD_ID',
};

const _$ArtifactPackagingEnumMap = {
  ArtifactPackaging.none: 'NONE',
  ArtifactPackaging.zip: 'ZIP',
};

ProjectBadge _$ProjectBadgeFromJson(Map<String, dynamic> json) {
  return ProjectBadge(
    badgeEnabled: json['badgeEnabled'] as bool,
    badgeRequestUrl: json['badgeRequestUrl'] as String,
  );
}

ProjectBuildBatchConfig _$ProjectBuildBatchConfigFromJson(
    Map<String, dynamic> json) {
  return ProjectBuildBatchConfig(
    combineArtifacts: json['combineArtifacts'] as bool,
    restrictions: json['restrictions'] == null
        ? null
        : BatchRestrictions.fromJson(
            json['restrictions'] as Map<String, dynamic>),
    serviceRole: json['serviceRole'] as String,
    timeoutInMins: json['timeoutInMins'] as int,
  );
}

Map<String, dynamic> _$ProjectBuildBatchConfigToJson(
    ProjectBuildBatchConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('combineArtifacts', instance.combineArtifacts);
  writeNotNull('restrictions', instance.restrictions?.toJson());
  writeNotNull('serviceRole', instance.serviceRole);
  writeNotNull('timeoutInMins', instance.timeoutInMins);
  return val;
}

ProjectCache _$ProjectCacheFromJson(Map<String, dynamic> json) {
  return ProjectCache(
    type: _$enumDecodeNullable(_$CacheTypeEnumMap, json['type']),
    location: json['location'] as String,
    modes: (json['modes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CacheModeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProjectCacheToJson(ProjectCache instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$CacheTypeEnumMap[instance.type]);
  writeNotNull('location', instance.location);
  writeNotNull(
      'modes', instance.modes?.map((e) => _$CacheModeEnumMap[e])?.toList());
  return val;
}

const _$CacheTypeEnumMap = {
  CacheType.noCache: 'NO_CACHE',
  CacheType.s3: 'S3',
  CacheType.local: 'LOCAL',
};

const _$CacheModeEnumMap = {
  CacheMode.localDockerLayerCache: 'LOCAL_DOCKER_LAYER_CACHE',
  CacheMode.localSourceCache: 'LOCAL_SOURCE_CACHE',
  CacheMode.localCustomCache: 'LOCAL_CUSTOM_CACHE',
};

ProjectEnvironment _$ProjectEnvironmentFromJson(Map<String, dynamic> json) {
  return ProjectEnvironment(
    computeType:
        _$enumDecodeNullable(_$ComputeTypeEnumMap, json['computeType']),
    image: json['image'] as String,
    type: _$enumDecodeNullable(_$EnvironmentTypeEnumMap, json['type']),
    certificate: json['certificate'] as String,
    environmentVariables: (json['environmentVariables'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imagePullCredentialsType: _$enumDecodeNullable(
        _$ImagePullCredentialsTypeEnumMap, json['imagePullCredentialsType']),
    privilegedMode: json['privilegedMode'] as bool,
    registryCredential: json['registryCredential'] == null
        ? null
        : RegistryCredential.fromJson(
            json['registryCredential'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProjectEnvironmentToJson(ProjectEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('computeType', _$ComputeTypeEnumMap[instance.computeType]);
  writeNotNull('image', instance.image);
  writeNotNull('type', _$EnvironmentTypeEnumMap[instance.type]);
  writeNotNull('certificate', instance.certificate);
  writeNotNull('environmentVariables',
      instance.environmentVariables?.map((e) => e?.toJson())?.toList());
  writeNotNull('imagePullCredentialsType',
      _$ImagePullCredentialsTypeEnumMap[instance.imagePullCredentialsType]);
  writeNotNull('privilegedMode', instance.privilegedMode);
  writeNotNull('registryCredential', instance.registryCredential?.toJson());
  return val;
}

const _$ComputeTypeEnumMap = {
  ComputeType.buildGeneral1Small: 'BUILD_GENERAL1_SMALL',
  ComputeType.buildGeneral1Medium: 'BUILD_GENERAL1_MEDIUM',
  ComputeType.buildGeneral1Large: 'BUILD_GENERAL1_LARGE',
  ComputeType.buildGeneral1_2xlarge: 'BUILD_GENERAL1_2XLARGE',
};

const _$EnvironmentTypeEnumMap = {
  EnvironmentType.windowsContainer: 'WINDOWS_CONTAINER',
  EnvironmentType.linuxContainer: 'LINUX_CONTAINER',
  EnvironmentType.linuxGpuContainer: 'LINUX_GPU_CONTAINER',
  EnvironmentType.armContainer: 'ARM_CONTAINER',
  EnvironmentType.windowsServer_2019Container: 'WINDOWS_SERVER_2019_CONTAINER',
};

const _$ImagePullCredentialsTypeEnumMap = {
  ImagePullCredentialsType.codebuild: 'CODEBUILD',
  ImagePullCredentialsType.serviceRole: 'SERVICE_ROLE',
};

ProjectFileSystemLocation _$ProjectFileSystemLocationFromJson(
    Map<String, dynamic> json) {
  return ProjectFileSystemLocation(
    identifier: json['identifier'] as String,
    location: json['location'] as String,
    mountOptions: json['mountOptions'] as String,
    mountPoint: json['mountPoint'] as String,
    type: _$enumDecodeNullable(_$FileSystemTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ProjectFileSystemLocationToJson(
    ProjectFileSystemLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('location', instance.location);
  writeNotNull('mountOptions', instance.mountOptions);
  writeNotNull('mountPoint', instance.mountPoint);
  writeNotNull('type', _$FileSystemTypeEnumMap[instance.type]);
  return val;
}

const _$FileSystemTypeEnumMap = {
  FileSystemType.efs: 'EFS',
};

ProjectSource _$ProjectSourceFromJson(Map<String, dynamic> json) {
  return ProjectSource(
    type: _$enumDecodeNullable(_$SourceTypeEnumMap, json['type']),
    auth: json['auth'] == null
        ? null
        : SourceAuth.fromJson(json['auth'] as Map<String, dynamic>),
    buildStatusConfig: json['buildStatusConfig'] == null
        ? null
        : BuildStatusConfig.fromJson(
            json['buildStatusConfig'] as Map<String, dynamic>),
    buildspec: json['buildspec'] as String,
    gitCloneDepth: json['gitCloneDepth'] as int,
    gitSubmodulesConfig: json['gitSubmodulesConfig'] == null
        ? null
        : GitSubmodulesConfig.fromJson(
            json['gitSubmodulesConfig'] as Map<String, dynamic>),
    insecureSsl: json['insecureSsl'] as bool,
    location: json['location'] as String,
    reportBuildStatus: json['reportBuildStatus'] as bool,
    sourceIdentifier: json['sourceIdentifier'] as String,
  );
}

Map<String, dynamic> _$ProjectSourceToJson(ProjectSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$SourceTypeEnumMap[instance.type]);
  writeNotNull('auth', instance.auth?.toJson());
  writeNotNull('buildStatusConfig', instance.buildStatusConfig?.toJson());
  writeNotNull('buildspec', instance.buildspec);
  writeNotNull('gitCloneDepth', instance.gitCloneDepth);
  writeNotNull('gitSubmodulesConfig', instance.gitSubmodulesConfig?.toJson());
  writeNotNull('insecureSsl', instance.insecureSsl);
  writeNotNull('location', instance.location);
  writeNotNull('reportBuildStatus', instance.reportBuildStatus);
  writeNotNull('sourceIdentifier', instance.sourceIdentifier);
  return val;
}

const _$SourceTypeEnumMap = {
  SourceType.codecommit: 'CODECOMMIT',
  SourceType.codepipeline: 'CODEPIPELINE',
  SourceType.github: 'GITHUB',
  SourceType.s3: 'S3',
  SourceType.bitbucket: 'BITBUCKET',
  SourceType.githubEnterprise: 'GITHUB_ENTERPRISE',
  SourceType.noSource: 'NO_SOURCE',
};

ProjectSourceVersion _$ProjectSourceVersionFromJson(Map<String, dynamic> json) {
  return ProjectSourceVersion(
    sourceIdentifier: json['sourceIdentifier'] as String,
    sourceVersion: json['sourceVersion'] as String,
  );
}

Map<String, dynamic> _$ProjectSourceVersionToJson(
    ProjectSourceVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceIdentifier', instance.sourceIdentifier);
  writeNotNull('sourceVersion', instance.sourceVersion);
  return val;
}

PutResourcePolicyOutput _$PutResourcePolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyOutput(
    resourceArn: json['resourceArn'] as String,
  );
}

RegistryCredential _$RegistryCredentialFromJson(Map<String, dynamic> json) {
  return RegistryCredential(
    credential: json['credential'] as String,
    credentialProvider: _$enumDecodeNullable(
        _$CredentialProviderTypeEnumMap, json['credentialProvider']),
  );
}

Map<String, dynamic> _$RegistryCredentialToJson(RegistryCredential instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credential', instance.credential);
  writeNotNull('credentialProvider',
      _$CredentialProviderTypeEnumMap[instance.credentialProvider]);
  return val;
}

const _$CredentialProviderTypeEnumMap = {
  CredentialProviderType.secretsManager: 'SECRETS_MANAGER',
};

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report(
    arn: json['arn'] as String,
    codeCoverageSummary: json['codeCoverageSummary'] == null
        ? null
        : CodeCoverageReportSummary.fromJson(
            json['codeCoverageSummary'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    executionId: json['executionId'] as String,
    expired: const UnixDateTimeConverter().fromJson(json['expired']),
    exportConfig: json['exportConfig'] == null
        ? null
        : ReportExportConfig.fromJson(
            json['exportConfig'] as Map<String, dynamic>),
    name: json['name'] as String,
    reportGroupArn: json['reportGroupArn'] as String,
    status: _$enumDecodeNullable(_$ReportStatusTypeEnumMap, json['status']),
    testSummary: json['testSummary'] == null
        ? null
        : TestReportSummary.fromJson(
            json['testSummary'] as Map<String, dynamic>),
    truncated: json['truncated'] as bool,
    type: _$enumDecodeNullable(_$ReportTypeEnumMap, json['type']),
  );
}

const _$ReportStatusTypeEnumMap = {
  ReportStatusType.generating: 'GENERATING',
  ReportStatusType.succeeded: 'SUCCEEDED',
  ReportStatusType.failed: 'FAILED',
  ReportStatusType.incomplete: 'INCOMPLETE',
  ReportStatusType.deleting: 'DELETING',
};

const _$ReportTypeEnumMap = {
  ReportType.test: 'TEST',
  ReportType.codeCoverage: 'CODE_COVERAGE',
};

ReportExportConfig _$ReportExportConfigFromJson(Map<String, dynamic> json) {
  return ReportExportConfig(
    exportConfigType: _$enumDecodeNullable(
        _$ReportExportConfigTypeEnumMap, json['exportConfigType']),
    s3Destination: json['s3Destination'] == null
        ? null
        : S3ReportExportConfig.fromJson(
            json['s3Destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReportExportConfigToJson(ReportExportConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exportConfigType',
      _$ReportExportConfigTypeEnumMap[instance.exportConfigType]);
  writeNotNull('s3Destination', instance.s3Destination?.toJson());
  return val;
}

const _$ReportExportConfigTypeEnumMap = {
  ReportExportConfigType.s3: 'S3',
  ReportExportConfigType.noExport: 'NO_EXPORT',
};

Map<String, dynamic> _$ReportFilterToJson(ReportFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$ReportStatusTypeEnumMap[instance.status]);
  return val;
}

ReportGroup _$ReportGroupFromJson(Map<String, dynamic> json) {
  return ReportGroup(
    arn: json['arn'] as String,
    created: const UnixDateTimeConverter().fromJson(json['created']),
    exportConfig: json['exportConfig'] == null
        ? null
        : ReportExportConfig.fromJson(
            json['exportConfig'] as Map<String, dynamic>),
    lastModified: const UnixDateTimeConverter().fromJson(json['lastModified']),
    name: json['name'] as String,
    status:
        _$enumDecodeNullable(_$ReportGroupStatusTypeEnumMap, json['status']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$ReportTypeEnumMap, json['type']),
  );
}

const _$ReportGroupStatusTypeEnumMap = {
  ReportGroupStatusType.active: 'ACTIVE',
  ReportGroupStatusType.deleting: 'DELETING',
};

ReportGroupTrendStats _$ReportGroupTrendStatsFromJson(
    Map<String, dynamic> json) {
  return ReportGroupTrendStats(
    average: json['average'] as String,
    max: json['max'] as String,
    min: json['min'] as String,
  );
}

ReportWithRawData _$ReportWithRawDataFromJson(Map<String, dynamic> json) {
  return ReportWithRawData(
    data: json['data'] as String,
    reportArn: json['reportArn'] as String,
  );
}

ResolvedArtifact _$ResolvedArtifactFromJson(Map<String, dynamic> json) {
  return ResolvedArtifact(
    identifier: json['identifier'] as String,
    location: json['location'] as String,
    type: _$enumDecodeNullable(_$ArtifactsTypeEnumMap, json['type']),
  );
}

RetryBuildBatchOutput _$RetryBuildBatchOutputFromJson(
    Map<String, dynamic> json) {
  return RetryBuildBatchOutput(
    buildBatch: json['buildBatch'] == null
        ? null
        : BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>),
  );
}

RetryBuildOutput _$RetryBuildOutputFromJson(Map<String, dynamic> json) {
  return RetryBuildOutput(
    build: json['build'] == null
        ? null
        : Build.fromJson(json['build'] as Map<String, dynamic>),
  );
}

S3LogsConfig _$S3LogsConfigFromJson(Map<String, dynamic> json) {
  return S3LogsConfig(
    status: _$enumDecodeNullable(_$LogsConfigStatusTypeEnumMap, json['status']),
    encryptionDisabled: json['encryptionDisabled'] as bool,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$S3LogsConfigToJson(S3LogsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$LogsConfigStatusTypeEnumMap[instance.status]);
  writeNotNull('encryptionDisabled', instance.encryptionDisabled);
  writeNotNull('location', instance.location);
  return val;
}

S3ReportExportConfig _$S3ReportExportConfigFromJson(Map<String, dynamic> json) {
  return S3ReportExportConfig(
    bucket: json['bucket'] as String,
    encryptionDisabled: json['encryptionDisabled'] as bool,
    encryptionKey: json['encryptionKey'] as String,
    packaging:
        _$enumDecodeNullable(_$ReportPackagingTypeEnumMap, json['packaging']),
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$S3ReportExportConfigToJson(
    S3ReportExportConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('encryptionDisabled', instance.encryptionDisabled);
  writeNotNull('encryptionKey', instance.encryptionKey);
  writeNotNull('packaging', _$ReportPackagingTypeEnumMap[instance.packaging]);
  writeNotNull('path', instance.path);
  return val;
}

const _$ReportPackagingTypeEnumMap = {
  ReportPackagingType.zip: 'ZIP',
  ReportPackagingType.none: 'NONE',
};

SourceAuth _$SourceAuthFromJson(Map<String, dynamic> json) {
  return SourceAuth(
    type: _$enumDecodeNullable(_$SourceAuthTypeEnumMap, json['type']),
    resource: json['resource'] as String,
  );
}

Map<String, dynamic> _$SourceAuthToJson(SourceAuth instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$SourceAuthTypeEnumMap[instance.type]);
  writeNotNull('resource', instance.resource);
  return val;
}

const _$SourceAuthTypeEnumMap = {
  SourceAuthType.oauth: 'OAUTH',
};

SourceCredentialsInfo _$SourceCredentialsInfoFromJson(
    Map<String, dynamic> json) {
  return SourceCredentialsInfo(
    arn: json['arn'] as String,
    authType: _$enumDecodeNullable(_$AuthTypeEnumMap, json['authType']),
    serverType: _$enumDecodeNullable(_$ServerTypeEnumMap, json['serverType']),
  );
}

const _$AuthTypeEnumMap = {
  AuthType.oauth: 'OAUTH',
  AuthType.basicAuth: 'BASIC_AUTH',
  AuthType.personalAccessToken: 'PERSONAL_ACCESS_TOKEN',
};

const _$ServerTypeEnumMap = {
  ServerType.github: 'GITHUB',
  ServerType.bitbucket: 'BITBUCKET',
  ServerType.githubEnterprise: 'GITHUB_ENTERPRISE',
};

StartBuildBatchOutput _$StartBuildBatchOutputFromJson(
    Map<String, dynamic> json) {
  return StartBuildBatchOutput(
    buildBatch: json['buildBatch'] == null
        ? null
        : BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>),
  );
}

StartBuildOutput _$StartBuildOutputFromJson(Map<String, dynamic> json) {
  return StartBuildOutput(
    build: json['build'] == null
        ? null
        : Build.fromJson(json['build'] as Map<String, dynamic>),
  );
}

StopBuildBatchOutput _$StopBuildBatchOutputFromJson(Map<String, dynamic> json) {
  return StopBuildBatchOutput(
    buildBatch: json['buildBatch'] == null
        ? null
        : BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>),
  );
}

StopBuildOutput _$StopBuildOutputFromJson(Map<String, dynamic> json) {
  return StopBuildOutput(
    build: json['build'] == null
        ? null
        : Build.fromJson(json['build'] as Map<String, dynamic>),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TestCase _$TestCaseFromJson(Map<String, dynamic> json) {
  return TestCase(
    durationInNanoSeconds: json['durationInNanoSeconds'] as int,
    expired: const UnixDateTimeConverter().fromJson(json['expired']),
    message: json['message'] as String,
    name: json['name'] as String,
    prefix: json['prefix'] as String,
    reportArn: json['reportArn'] as String,
    status: json['status'] as String,
    testRawDataPath: json['testRawDataPath'] as String,
  );
}

Map<String, dynamic> _$TestCaseFilterToJson(TestCaseFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyword', instance.keyword);
  writeNotNull('status', instance.status);
  return val;
}

TestReportSummary _$TestReportSummaryFromJson(Map<String, dynamic> json) {
  return TestReportSummary(
    durationInNanoSeconds: json['durationInNanoSeconds'] as int,
    statusCounts: (json['statusCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    total: json['total'] as int,
  );
}

UpdateProjectOutput _$UpdateProjectOutputFromJson(Map<String, dynamic> json) {
  return UpdateProjectOutput(
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

UpdateReportGroupOutput _$UpdateReportGroupOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateReportGroupOutput(
    reportGroup: json['reportGroup'] == null
        ? null
        : ReportGroup.fromJson(json['reportGroup'] as Map<String, dynamic>),
  );
}

UpdateWebhookOutput _$UpdateWebhookOutputFromJson(Map<String, dynamic> json) {
  return UpdateWebhookOutput(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['vpcId'] as String,
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('subnets', instance.subnets);
  writeNotNull('vpcId', instance.vpcId);
  return val;
}

Webhook _$WebhookFromJson(Map<String, dynamic> json) {
  return Webhook(
    branchFilter: json['branchFilter'] as String,
    buildType:
        _$enumDecodeNullable(_$WebhookBuildTypeEnumMap, json['buildType']),
    filterGroups: (json['filterGroups'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : WebhookFilter.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
    lastModifiedSecret:
        const UnixDateTimeConverter().fromJson(json['lastModifiedSecret']),
    payloadUrl: json['payloadUrl'] as String,
    secret: json['secret'] as String,
    url: json['url'] as String,
  );
}

const _$WebhookBuildTypeEnumMap = {
  WebhookBuildType.build: 'BUILD',
  WebhookBuildType.buildBatch: 'BUILD_BATCH',
};

WebhookFilter _$WebhookFilterFromJson(Map<String, dynamic> json) {
  return WebhookFilter(
    pattern: json['pattern'] as String,
    type: _$enumDecodeNullable(_$WebhookFilterTypeEnumMap, json['type']),
    excludeMatchedPattern: json['excludeMatchedPattern'] as bool,
  );
}

Map<String, dynamic> _$WebhookFilterToJson(WebhookFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pattern', instance.pattern);
  writeNotNull('type', _$WebhookFilterTypeEnumMap[instance.type]);
  writeNotNull('excludeMatchedPattern', instance.excludeMatchedPattern);
  return val;
}

const _$WebhookFilterTypeEnumMap = {
  WebhookFilterType.event: 'EVENT',
  WebhookFilterType.baseRef: 'BASE_REF',
  WebhookFilterType.headRef: 'HEAD_REF',
  WebhookFilterType.actorAccountId: 'ACTOR_ACCOUNT_ID',
  WebhookFilterType.filePath: 'FILE_PATH',
  WebhookFilterType.commitMessage: 'COMMIT_MESSAGE',
};
