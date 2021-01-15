// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    appArn: json['appArn'] as String,
    appId: json['appId'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    defaultDomain: json['defaultDomain'] as String,
    description: json['description'] as String,
    enableBasicAuth: json['enableBasicAuth'] as bool,
    enableBranchAutoBuild: json['enableBranchAutoBuild'] as bool,
    environmentVariables:
        (json['environmentVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    name: json['name'] as String,
    platform: _$enumDecodeNullable(_$PlatformEnumMap, json['platform']),
    repository: json['repository'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['updateTime']),
    autoBranchCreationConfig: json['autoBranchCreationConfig'] == null
        ? null
        : AutoBranchCreationConfig.fromJson(
            json['autoBranchCreationConfig'] as Map<String, dynamic>),
    autoBranchCreationPatterns: (json['autoBranchCreationPatterns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    basicAuthCredentials: json['basicAuthCredentials'] as String,
    buildSpec: json['buildSpec'] as String,
    customHeaders: json['customHeaders'] as String,
    customRules: (json['customRules'] as List)
        ?.map((e) =>
            e == null ? null : CustomRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enableAutoBranchCreation: json['enableAutoBranchCreation'] as bool,
    enableBranchAutoDeletion: json['enableBranchAutoDeletion'] as bool,
    iamServiceRoleArn: json['iamServiceRoleArn'] as String,
    productionBranch: json['productionBranch'] == null
        ? null
        : ProductionBranch.fromJson(
            json['productionBranch'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

const _$PlatformEnumMap = {
  Platform.web: 'WEB',
};

Artifact _$ArtifactFromJson(Map<String, dynamic> json) {
  return Artifact(
    artifactFileName: json['artifactFileName'] as String,
    artifactId: json['artifactId'] as String,
  );
}

AutoBranchCreationConfig _$AutoBranchCreationConfigFromJson(
    Map<String, dynamic> json) {
  return AutoBranchCreationConfig(
    basicAuthCredentials: json['basicAuthCredentials'] as String,
    buildSpec: json['buildSpec'] as String,
    enableAutoBuild: json['enableAutoBuild'] as bool,
    enableBasicAuth: json['enableBasicAuth'] as bool,
    enablePerformanceMode: json['enablePerformanceMode'] as bool,
    enablePullRequestPreview: json['enablePullRequestPreview'] as bool,
    environmentVariables:
        (json['environmentVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    framework: json['framework'] as String,
    pullRequestEnvironmentName: json['pullRequestEnvironmentName'] as String,
    stage: _$enumDecodeNullable(_$StageEnumMap, json['stage']),
  );
}

Map<String, dynamic> _$AutoBranchCreationConfigToJson(
    AutoBranchCreationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('basicAuthCredentials', instance.basicAuthCredentials);
  writeNotNull('buildSpec', instance.buildSpec);
  writeNotNull('enableAutoBuild', instance.enableAutoBuild);
  writeNotNull('enableBasicAuth', instance.enableBasicAuth);
  writeNotNull('enablePerformanceMode', instance.enablePerformanceMode);
  writeNotNull('enablePullRequestPreview', instance.enablePullRequestPreview);
  writeNotNull('environmentVariables', instance.environmentVariables);
  writeNotNull('framework', instance.framework);
  writeNotNull(
      'pullRequestEnvironmentName', instance.pullRequestEnvironmentName);
  writeNotNull('stage', _$StageEnumMap[instance.stage]);
  return val;
}

const _$StageEnumMap = {
  Stage.production: 'PRODUCTION',
  Stage.beta: 'BETA',
  Stage.development: 'DEVELOPMENT',
  Stage.experimental: 'EXPERIMENTAL',
  Stage.pullRequest: 'PULL_REQUEST',
};

BackendEnvironment _$BackendEnvironmentFromJson(Map<String, dynamic> json) {
  return BackendEnvironment(
    backendEnvironmentArn: json['backendEnvironmentArn'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    environmentName: json['environmentName'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['updateTime']),
    deploymentArtifacts: json['deploymentArtifacts'] as String,
    stackName: json['stackName'] as String,
  );
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    activeJobId: json['activeJobId'] as String,
    branchArn: json['branchArn'] as String,
    branchName: json['branchName'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    customDomains:
        (json['customDomains'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
    displayName: json['displayName'] as String,
    enableAutoBuild: json['enableAutoBuild'] as bool,
    enableBasicAuth: json['enableBasicAuth'] as bool,
    enableNotification: json['enableNotification'] as bool,
    enablePullRequestPreview: json['enablePullRequestPreview'] as bool,
    environmentVariables:
        (json['environmentVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    framework: json['framework'] as String,
    stage: _$enumDecodeNullable(_$StageEnumMap, json['stage']),
    totalNumberOfJobs: json['totalNumberOfJobs'] as String,
    ttl: json['ttl'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['updateTime']),
    associatedResources: (json['associatedResources'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    backendEnvironmentArn: json['backendEnvironmentArn'] as String,
    basicAuthCredentials: json['basicAuthCredentials'] as String,
    buildSpec: json['buildSpec'] as String,
    destinationBranch: json['destinationBranch'] as String,
    enablePerformanceMode: json['enablePerformanceMode'] as bool,
    pullRequestEnvironmentName: json['pullRequestEnvironmentName'] as String,
    sourceBranch: json['sourceBranch'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

CreateAppResult _$CreateAppResultFromJson(Map<String, dynamic> json) {
  return CreateAppResult(
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
  );
}

CreateBackendEnvironmentResult _$CreateBackendEnvironmentResultFromJson(
    Map<String, dynamic> json) {
  return CreateBackendEnvironmentResult(
    backendEnvironment: json['backendEnvironment'] == null
        ? null
        : BackendEnvironment.fromJson(
            json['backendEnvironment'] as Map<String, dynamic>),
  );
}

CreateBranchResult _$CreateBranchResultFromJson(Map<String, dynamic> json) {
  return CreateBranchResult(
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

CreateDeploymentResult _$CreateDeploymentResultFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentResult(
    fileUploadUrls: (json['fileUploadUrls'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    zipUploadUrl: json['zipUploadUrl'] as String,
    jobId: json['jobId'] as String,
  );
}

CreateDomainAssociationResult _$CreateDomainAssociationResultFromJson(
    Map<String, dynamic> json) {
  return CreateDomainAssociationResult(
    domainAssociation: json['domainAssociation'] == null
        ? null
        : DomainAssociation.fromJson(
            json['domainAssociation'] as Map<String, dynamic>),
  );
}

CreateWebhookResult _$CreateWebhookResultFromJson(Map<String, dynamic> json) {
  return CreateWebhookResult(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

CustomRule _$CustomRuleFromJson(Map<String, dynamic> json) {
  return CustomRule(
    source: json['source'] as String,
    target: json['target'] as String,
    condition: json['condition'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$CustomRuleToJson(CustomRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('target', instance.target);
  writeNotNull('condition', instance.condition);
  writeNotNull('status', instance.status);
  return val;
}

DeleteAppResult _$DeleteAppResultFromJson(Map<String, dynamic> json) {
  return DeleteAppResult(
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
  );
}

DeleteBackendEnvironmentResult _$DeleteBackendEnvironmentResultFromJson(
    Map<String, dynamic> json) {
  return DeleteBackendEnvironmentResult(
    backendEnvironment: json['backendEnvironment'] == null
        ? null
        : BackendEnvironment.fromJson(
            json['backendEnvironment'] as Map<String, dynamic>),
  );
}

DeleteBranchResult _$DeleteBranchResultFromJson(Map<String, dynamic> json) {
  return DeleteBranchResult(
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

DeleteDomainAssociationResult _$DeleteDomainAssociationResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDomainAssociationResult(
    domainAssociation: json['domainAssociation'] == null
        ? null
        : DomainAssociation.fromJson(
            json['domainAssociation'] as Map<String, dynamic>),
  );
}

DeleteJobResult _$DeleteJobResultFromJson(Map<String, dynamic> json) {
  return DeleteJobResult(
    jobSummary: json['jobSummary'] == null
        ? null
        : JobSummary.fromJson(json['jobSummary'] as Map<String, dynamic>),
  );
}

DeleteWebhookResult _$DeleteWebhookResultFromJson(Map<String, dynamic> json) {
  return DeleteWebhookResult(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

DomainAssociation _$DomainAssociationFromJson(Map<String, dynamic> json) {
  return DomainAssociation(
    domainAssociationArn: json['domainAssociationArn'] as String,
    domainName: json['domainName'] as String,
    domainStatus:
        _$enumDecodeNullable(_$DomainStatusEnumMap, json['domainStatus']),
    enableAutoSubDomain: json['enableAutoSubDomain'] as bool,
    statusReason: json['statusReason'] as String,
    subDomains: (json['subDomains'] as List)
        ?.map((e) =>
            e == null ? null : SubDomain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    autoSubDomainCreationPatterns:
        (json['autoSubDomainCreationPatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    autoSubDomainIAMRole: json['autoSubDomainIAMRole'] as String,
    certificateVerificationDNSRecord:
        json['certificateVerificationDNSRecord'] as String,
  );
}

const _$DomainStatusEnumMap = {
  DomainStatus.pendingVerification: 'PENDING_VERIFICATION',
  DomainStatus.inProgress: 'IN_PROGRESS',
  DomainStatus.available: 'AVAILABLE',
  DomainStatus.pendingDeployment: 'PENDING_DEPLOYMENT',
  DomainStatus.failed: 'FAILED',
  DomainStatus.creating: 'CREATING',
  DomainStatus.requestingCertificate: 'REQUESTING_CERTIFICATE',
  DomainStatus.updating: 'UPDATING',
};

GenerateAccessLogsResult _$GenerateAccessLogsResultFromJson(
    Map<String, dynamic> json) {
  return GenerateAccessLogsResult(
    logUrl: json['logUrl'] as String,
  );
}

GetAppResult _$GetAppResultFromJson(Map<String, dynamic> json) {
  return GetAppResult(
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
  );
}

GetArtifactUrlResult _$GetArtifactUrlResultFromJson(Map<String, dynamic> json) {
  return GetArtifactUrlResult(
    artifactId: json['artifactId'] as String,
    artifactUrl: json['artifactUrl'] as String,
  );
}

GetBackendEnvironmentResult _$GetBackendEnvironmentResultFromJson(
    Map<String, dynamic> json) {
  return GetBackendEnvironmentResult(
    backendEnvironment: json['backendEnvironment'] == null
        ? null
        : BackendEnvironment.fromJson(
            json['backendEnvironment'] as Map<String, dynamic>),
  );
}

GetBranchResult _$GetBranchResultFromJson(Map<String, dynamic> json) {
  return GetBranchResult(
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

GetDomainAssociationResult _$GetDomainAssociationResultFromJson(
    Map<String, dynamic> json) {
  return GetDomainAssociationResult(
    domainAssociation: json['domainAssociation'] == null
        ? null
        : DomainAssociation.fromJson(
            json['domainAssociation'] as Map<String, dynamic>),
  );
}

GetJobResult _$GetJobResultFromJson(Map<String, dynamic> json) {
  return GetJobResult(
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

GetWebhookResult _$GetWebhookResultFromJson(Map<String, dynamic> json) {
  return GetWebhookResult(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    steps: (json['steps'] as List)
        ?.map(
            (e) => e == null ? null : Step.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    summary: json['summary'] == null
        ? null
        : JobSummary.fromJson(json['summary'] as Map<String, dynamic>),
  );
}

JobSummary _$JobSummaryFromJson(Map<String, dynamic> json) {
  return JobSummary(
    commitId: json['commitId'] as String,
    commitMessage: json['commitMessage'] as String,
    commitTime: const UnixDateTimeConverter().fromJson(json['commitTime']),
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['jobType']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
  );
}

const _$JobTypeEnumMap = {
  JobType.release: 'RELEASE',
  JobType.retry: 'RETRY',
  JobType.manual: 'MANUAL',
  JobType.webHook: 'WEB_HOOK',
};

const _$JobStatusEnumMap = {
  JobStatus.pending: 'PENDING',
  JobStatus.provisioning: 'PROVISIONING',
  JobStatus.running: 'RUNNING',
  JobStatus.failed: 'FAILED',
  JobStatus.succeed: 'SUCCEED',
  JobStatus.cancelling: 'CANCELLING',
  JobStatus.cancelled: 'CANCELLED',
};

ListAppsResult _$ListAppsResultFromJson(Map<String, dynamic> json) {
  return ListAppsResult(
    apps: (json['apps'] as List)
        ?.map((e) => e == null ? null : App.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListArtifactsResult _$ListArtifactsResultFromJson(Map<String, dynamic> json) {
  return ListArtifactsResult(
    artifacts: (json['artifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBackendEnvironmentsResult _$ListBackendEnvironmentsResultFromJson(
    Map<String, dynamic> json) {
  return ListBackendEnvironmentsResult(
    backendEnvironments: (json['backendEnvironments'] as List)
        ?.map((e) => e == null
            ? null
            : BackendEnvironment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBranchesResult _$ListBranchesResultFromJson(Map<String, dynamic> json) {
  return ListBranchesResult(
    branches: (json['branches'] as List)
        ?.map((e) =>
            e == null ? null : Branch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDomainAssociationsResult _$ListDomainAssociationsResultFromJson(
    Map<String, dynamic> json) {
  return ListDomainAssociationsResult(
    domainAssociations: (json['domainAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobsResult _$ListJobsResultFromJson(Map<String, dynamic> json) {
  return ListJobsResult(
    jobSummaries: (json['jobSummaries'] as List)
        ?.map((e) =>
            e == null ? null : JobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListWebhooksResult _$ListWebhooksResultFromJson(Map<String, dynamic> json) {
  return ListWebhooksResult(
    webhooks: (json['webhooks'] as List)
        ?.map((e) =>
            e == null ? null : Webhook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ProductionBranch _$ProductionBranchFromJson(Map<String, dynamic> json) {
  return ProductionBranch(
    branchName: json['branchName'] as String,
    lastDeployTime:
        const UnixDateTimeConverter().fromJson(json['lastDeployTime']),
    status: json['status'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

StartDeploymentResult _$StartDeploymentResultFromJson(
    Map<String, dynamic> json) {
  return StartDeploymentResult(
    jobSummary: json['jobSummary'] == null
        ? null
        : JobSummary.fromJson(json['jobSummary'] as Map<String, dynamic>),
  );
}

StartJobResult _$StartJobResultFromJson(Map<String, dynamic> json) {
  return StartJobResult(
    jobSummary: json['jobSummary'] == null
        ? null
        : JobSummary.fromJson(json['jobSummary'] as Map<String, dynamic>),
  );
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return Step(
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    stepName: json['stepName'] as String,
    artifactsUrl: json['artifactsUrl'] as String,
    context: json['context'] as String,
    logUrl: json['logUrl'] as String,
    screenshots: (json['screenshots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    statusReason: json['statusReason'] as String,
    testArtifactsUrl: json['testArtifactsUrl'] as String,
    testConfigUrl: json['testConfigUrl'] as String,
  );
}

StopJobResult _$StopJobResultFromJson(Map<String, dynamic> json) {
  return StopJobResult(
    jobSummary: json['jobSummary'] == null
        ? null
        : JobSummary.fromJson(json['jobSummary'] as Map<String, dynamic>),
  );
}

SubDomain _$SubDomainFromJson(Map<String, dynamic> json) {
  return SubDomain(
    dnsRecord: json['dnsRecord'] as String,
    subDomainSetting: json['subDomainSetting'] == null
        ? null
        : SubDomainSetting.fromJson(
            json['subDomainSetting'] as Map<String, dynamic>),
    verified: json['verified'] as bool,
  );
}

SubDomainSetting _$SubDomainSettingFromJson(Map<String, dynamic> json) {
  return SubDomainSetting(
    branchName: json['branchName'] as String,
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$SubDomainSettingToJson(SubDomainSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('branchName', instance.branchName);
  writeNotNull('prefix', instance.prefix);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAppResult _$UpdateAppResultFromJson(Map<String, dynamic> json) {
  return UpdateAppResult(
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
  );
}

UpdateBranchResult _$UpdateBranchResultFromJson(Map<String, dynamic> json) {
  return UpdateBranchResult(
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

UpdateDomainAssociationResult _$UpdateDomainAssociationResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainAssociationResult(
    domainAssociation: json['domainAssociation'] == null
        ? null
        : DomainAssociation.fromJson(
            json['domainAssociation'] as Map<String, dynamic>),
  );
}

UpdateWebhookResult _$UpdateWebhookResultFromJson(Map<String, dynamic> json) {
  return UpdateWebhookResult(
    webhook: json['webhook'] == null
        ? null
        : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

Webhook _$WebhookFromJson(Map<String, dynamic> json) {
  return Webhook(
    branchName: json['branchName'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    description: json['description'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['updateTime']),
    webhookArn: json['webhookArn'] as String,
    webhookId: json['webhookId'] as String,
    webhookUrl: json['webhookUrl'] as String,
  );
}
