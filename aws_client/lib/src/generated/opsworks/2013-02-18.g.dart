// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2013-02-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentVersion _$AgentVersionFromJson(Map<String, dynamic> json) {
  return AgentVersion(
    configurationManager: json['ConfigurationManager'] == null
        ? null
        : StackConfigurationManager.fromJson(
            json['ConfigurationManager'] as Map<String, dynamic>),
    version: json['Version'] as String,
  );
}

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    appId: json['AppId'] as String,
    appSource: json['AppSource'] == null
        ? null
        : Source.fromJson(json['AppSource'] as Map<String, dynamic>),
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$AppAttributesKeysEnumMap, k), e as String),
    ),
    createdAt: json['CreatedAt'] as String,
    dataSources: (json['DataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['Description'] as String,
    domains: (json['Domains'] as List)?.map((e) => e as String)?.toList(),
    enableSsl: json['EnableSsl'] as bool,
    environment: (json['Environment'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    shortname: json['Shortname'] as String,
    sslConfiguration: json['SslConfiguration'] == null
        ? null
        : SslConfiguration.fromJson(
            json['SslConfiguration'] as Map<String, dynamic>),
    stackId: json['StackId'] as String,
    type: _$enumDecodeNullable(_$AppTypeEnumMap, json['Type']),
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

const _$AppAttributesKeysEnumMap = {
  AppAttributesKeys.documentRoot: 'DocumentRoot',
  AppAttributesKeys.railsEnv: 'RailsEnv',
  AppAttributesKeys.autoBundleOnDeploy: 'AutoBundleOnDeploy',
  AppAttributesKeys.awsFlowRubySettings: 'AwsFlowRubySettings',
};

const _$AppTypeEnumMap = {
  AppType.awsFlowRuby: 'aws-flow-ruby',
  AppType.java: 'java',
  AppType.rails: 'rails',
  AppType.php: 'php',
  AppType.nodejs: 'nodejs',
  AppType.static: 'static',
  AppType.other: 'other',
};

AutoScalingThresholds _$AutoScalingThresholdsFromJson(
    Map<String, dynamic> json) {
  return AutoScalingThresholds(
    alarms: (json['Alarms'] as List)?.map((e) => e as String)?.toList(),
    cpuThreshold: (json['CpuThreshold'] as num)?.toDouble(),
    ignoreMetricsTime: json['IgnoreMetricsTime'] as int,
    instanceCount: json['InstanceCount'] as int,
    loadThreshold: (json['LoadThreshold'] as num)?.toDouble(),
    memoryThreshold: (json['MemoryThreshold'] as num)?.toDouble(),
    thresholdsWaitTime: json['ThresholdsWaitTime'] as int,
  );
}

Map<String, dynamic> _$AutoScalingThresholdsToJson(
    AutoScalingThresholds instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Alarms', instance.alarms);
  writeNotNull('CpuThreshold', instance.cpuThreshold);
  writeNotNull('IgnoreMetricsTime', instance.ignoreMetricsTime);
  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull('LoadThreshold', instance.loadThreshold);
  writeNotNull('MemoryThreshold', instance.memoryThreshold);
  writeNotNull('ThresholdsWaitTime', instance.thresholdsWaitTime);
  return val;
}

BlockDeviceMapping _$BlockDeviceMappingFromJson(Map<String, dynamic> json) {
  return BlockDeviceMapping(
    deviceName: json['DeviceName'] as String,
    ebs: json['Ebs'] == null
        ? null
        : EbsBlockDevice.fromJson(json['Ebs'] as Map<String, dynamic>),
    noDevice: json['NoDevice'] as String,
    virtualName: json['VirtualName'] as String,
  );
}

Map<String, dynamic> _$BlockDeviceMappingToJson(BlockDeviceMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceName', instance.deviceName);
  writeNotNull('Ebs', instance.ebs?.toJson());
  writeNotNull('NoDevice', instance.noDevice);
  writeNotNull('VirtualName', instance.virtualName);
  return val;
}

ChefConfiguration _$ChefConfigurationFromJson(Map<String, dynamic> json) {
  return ChefConfiguration(
    berkshelfVersion: json['BerkshelfVersion'] as String,
    manageBerkshelf: json['ManageBerkshelf'] as bool,
  );
}

Map<String, dynamic> _$ChefConfigurationToJson(ChefConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BerkshelfVersion', instance.berkshelfVersion);
  writeNotNull('ManageBerkshelf', instance.manageBerkshelf);
  return val;
}

CloneStackResult _$CloneStackResultFromJson(Map<String, dynamic> json) {
  return CloneStackResult(
    stackId: json['StackId'] as String,
  );
}

CloudWatchLogsConfiguration _$CloudWatchLogsConfigurationFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLogsConfiguration(
    enabled: json['Enabled'] as bool,
    logStreams: (json['LogStreams'] as List)
        ?.map((e) => e == null
            ? null
            : CloudWatchLogsLogStream.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CloudWatchLogsConfigurationToJson(
    CloudWatchLogsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull(
      'LogStreams', instance.logStreams?.map((e) => e?.toJson())?.toList());
  return val;
}

CloudWatchLogsLogStream _$CloudWatchLogsLogStreamFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLogsLogStream(
    batchCount: json['BatchCount'] as int,
    batchSize: json['BatchSize'] as int,
    bufferDuration: json['BufferDuration'] as int,
    datetimeFormat: json['DatetimeFormat'] as String,
    encoding:
        _$enumDecodeNullable(_$CloudWatchLogsEncodingEnumMap, json['Encoding']),
    file: json['File'] as String,
    fileFingerprintLines: json['FileFingerprintLines'] as String,
    initialPosition: _$enumDecodeNullable(
        _$CloudWatchLogsInitialPositionEnumMap, json['InitialPosition']),
    logGroupName: json['LogGroupName'] as String,
    multiLineStartPattern: json['MultiLineStartPattern'] as String,
    timeZone:
        _$enumDecodeNullable(_$CloudWatchLogsTimeZoneEnumMap, json['TimeZone']),
  );
}

Map<String, dynamic> _$CloudWatchLogsLogStreamToJson(
    CloudWatchLogsLogStream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BatchCount', instance.batchCount);
  writeNotNull('BatchSize', instance.batchSize);
  writeNotNull('BufferDuration', instance.bufferDuration);
  writeNotNull('DatetimeFormat', instance.datetimeFormat);
  writeNotNull('Encoding', _$CloudWatchLogsEncodingEnumMap[instance.encoding]);
  writeNotNull('File', instance.file);
  writeNotNull('FileFingerprintLines', instance.fileFingerprintLines);
  writeNotNull('InitialPosition',
      _$CloudWatchLogsInitialPositionEnumMap[instance.initialPosition]);
  writeNotNull('LogGroupName', instance.logGroupName);
  writeNotNull('MultiLineStartPattern', instance.multiLineStartPattern);
  writeNotNull('TimeZone', _$CloudWatchLogsTimeZoneEnumMap[instance.timeZone]);
  return val;
}

const _$CloudWatchLogsEncodingEnumMap = {
  CloudWatchLogsEncoding.ascii: 'ascii',
  CloudWatchLogsEncoding.big5: 'big5',
  CloudWatchLogsEncoding.big5hkscs: 'big5hkscs',
  CloudWatchLogsEncoding.cp037: 'cp037',
  CloudWatchLogsEncoding.cp424: 'cp424',
  CloudWatchLogsEncoding.cp437: 'cp437',
  CloudWatchLogsEncoding.cp500: 'cp500',
  CloudWatchLogsEncoding.cp720: 'cp720',
  CloudWatchLogsEncoding.cp737: 'cp737',
  CloudWatchLogsEncoding.cp775: 'cp775',
  CloudWatchLogsEncoding.cp850: 'cp850',
  CloudWatchLogsEncoding.cp852: 'cp852',
  CloudWatchLogsEncoding.cp855: 'cp855',
  CloudWatchLogsEncoding.cp856: 'cp856',
  CloudWatchLogsEncoding.cp857: 'cp857',
  CloudWatchLogsEncoding.cp858: 'cp858',
  CloudWatchLogsEncoding.cp860: 'cp860',
  CloudWatchLogsEncoding.cp861: 'cp861',
  CloudWatchLogsEncoding.cp862: 'cp862',
  CloudWatchLogsEncoding.cp863: 'cp863',
  CloudWatchLogsEncoding.cp864: 'cp864',
  CloudWatchLogsEncoding.cp865: 'cp865',
  CloudWatchLogsEncoding.cp866: 'cp866',
  CloudWatchLogsEncoding.cp869: 'cp869',
  CloudWatchLogsEncoding.cp874: 'cp874',
  CloudWatchLogsEncoding.cp875: 'cp875',
  CloudWatchLogsEncoding.cp932: 'cp932',
  CloudWatchLogsEncoding.cp949: 'cp949',
  CloudWatchLogsEncoding.cp950: 'cp950',
  CloudWatchLogsEncoding.cp1006: 'cp1006',
  CloudWatchLogsEncoding.cp1026: 'cp1026',
  CloudWatchLogsEncoding.cp1140: 'cp1140',
  CloudWatchLogsEncoding.cp1250: 'cp1250',
  CloudWatchLogsEncoding.cp1251: 'cp1251',
  CloudWatchLogsEncoding.cp1252: 'cp1252',
  CloudWatchLogsEncoding.cp1253: 'cp1253',
  CloudWatchLogsEncoding.cp1254: 'cp1254',
  CloudWatchLogsEncoding.cp1255: 'cp1255',
  CloudWatchLogsEncoding.cp1256: 'cp1256',
  CloudWatchLogsEncoding.cp1257: 'cp1257',
  CloudWatchLogsEncoding.cp1258: 'cp1258',
  CloudWatchLogsEncoding.eucJp: 'euc_jp',
  CloudWatchLogsEncoding.eucJis_2004: 'euc_jis_2004',
  CloudWatchLogsEncoding.eucJisx0213: 'euc_jisx0213',
  CloudWatchLogsEncoding.eucKr: 'euc_kr',
  CloudWatchLogsEncoding.gb2312: 'gb2312',
  CloudWatchLogsEncoding.gbk: 'gbk',
  CloudWatchLogsEncoding.gb18030: 'gb18030',
  CloudWatchLogsEncoding.hz: 'hz',
  CloudWatchLogsEncoding.iso2022Jp: 'iso2022_jp',
  CloudWatchLogsEncoding.iso2022Jp_1: 'iso2022_jp_1',
  CloudWatchLogsEncoding.iso2022Jp_2: 'iso2022_jp_2',
  CloudWatchLogsEncoding.iso2022Jp_2004: 'iso2022_jp_2004',
  CloudWatchLogsEncoding.iso2022Jp_3: 'iso2022_jp_3',
  CloudWatchLogsEncoding.iso2022JpExt: 'iso2022_jp_ext',
  CloudWatchLogsEncoding.iso2022Kr: 'iso2022_kr',
  CloudWatchLogsEncoding.latin_1: 'latin_1',
  CloudWatchLogsEncoding.iso8859_2: 'iso8859_2',
  CloudWatchLogsEncoding.iso8859_3: 'iso8859_3',
  CloudWatchLogsEncoding.iso8859_4: 'iso8859_4',
  CloudWatchLogsEncoding.iso8859_5: 'iso8859_5',
  CloudWatchLogsEncoding.iso8859_6: 'iso8859_6',
  CloudWatchLogsEncoding.iso8859_7: 'iso8859_7',
  CloudWatchLogsEncoding.iso8859_8: 'iso8859_8',
  CloudWatchLogsEncoding.iso8859_9: 'iso8859_9',
  CloudWatchLogsEncoding.iso8859_10: 'iso8859_10',
  CloudWatchLogsEncoding.iso8859_13: 'iso8859_13',
  CloudWatchLogsEncoding.iso8859_14: 'iso8859_14',
  CloudWatchLogsEncoding.iso8859_15: 'iso8859_15',
  CloudWatchLogsEncoding.iso8859_16: 'iso8859_16',
  CloudWatchLogsEncoding.johab: 'johab',
  CloudWatchLogsEncoding.koi8R: 'koi8_r',
  CloudWatchLogsEncoding.koi8U: 'koi8_u',
  CloudWatchLogsEncoding.macCyrillic: 'mac_cyrillic',
  CloudWatchLogsEncoding.macGreek: 'mac_greek',
  CloudWatchLogsEncoding.macIceland: 'mac_iceland',
  CloudWatchLogsEncoding.macLatin2: 'mac_latin2',
  CloudWatchLogsEncoding.macRoman: 'mac_roman',
  CloudWatchLogsEncoding.macTurkish: 'mac_turkish',
  CloudWatchLogsEncoding.ptcp154: 'ptcp154',
  CloudWatchLogsEncoding.shiftJis: 'shift_jis',
  CloudWatchLogsEncoding.shiftJis_2004: 'shift_jis_2004',
  CloudWatchLogsEncoding.shiftJisx0213: 'shift_jisx0213',
  CloudWatchLogsEncoding.utf_32: 'utf_32',
  CloudWatchLogsEncoding.utf_32Be: 'utf_32_be',
  CloudWatchLogsEncoding.utf_32Le: 'utf_32_le',
  CloudWatchLogsEncoding.utf_16: 'utf_16',
  CloudWatchLogsEncoding.utf_16Be: 'utf_16_be',
  CloudWatchLogsEncoding.utf_16Le: 'utf_16_le',
  CloudWatchLogsEncoding.utf_7: 'utf_7',
  CloudWatchLogsEncoding.utf_8: 'utf_8',
  CloudWatchLogsEncoding.utf_8Sig: 'utf_8_sig',
};

const _$CloudWatchLogsInitialPositionEnumMap = {
  CloudWatchLogsInitialPosition.startOfFile: 'start_of_file',
  CloudWatchLogsInitialPosition.endOfFile: 'end_of_file',
};

const _$CloudWatchLogsTimeZoneEnumMap = {
  CloudWatchLogsTimeZone.local: 'LOCAL',
  CloudWatchLogsTimeZone.utc: 'UTC',
};

Command _$CommandFromJson(Map<String, dynamic> json) {
  return Command(
    acknowledgedAt: json['AcknowledgedAt'] as String,
    commandId: json['CommandId'] as String,
    completedAt: json['CompletedAt'] as String,
    createdAt: json['CreatedAt'] as String,
    deploymentId: json['DeploymentId'] as String,
    exitCode: json['ExitCode'] as int,
    instanceId: json['InstanceId'] as String,
    logUrl: json['LogUrl'] as String,
    status: json['Status'] as String,
    type: json['Type'] as String,
  );
}

CreateAppResult _$CreateAppResultFromJson(Map<String, dynamic> json) {
  return CreateAppResult(
    appId: json['AppId'] as String,
  );
}

CreateDeploymentResult _$CreateDeploymentResultFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentResult(
    deploymentId: json['DeploymentId'] as String,
  );
}

CreateInstanceResult _$CreateInstanceResultFromJson(Map<String, dynamic> json) {
  return CreateInstanceResult(
    instanceId: json['InstanceId'] as String,
  );
}

CreateLayerResult _$CreateLayerResultFromJson(Map<String, dynamic> json) {
  return CreateLayerResult(
    layerId: json['LayerId'] as String,
  );
}

CreateStackResult _$CreateStackResultFromJson(Map<String, dynamic> json) {
  return CreateStackResult(
    stackId: json['StackId'] as String,
  );
}

CreateUserProfileResult _$CreateUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return CreateUserProfileResult(
    iamUserArn: json['IamUserArn'] as String,
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    arn: json['Arn'] as String,
    databaseName: json['DatabaseName'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$DataSourceToJson(DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Type', instance.type);
  return val;
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    appId: json['AppId'] as String,
    command: json['Command'] == null
        ? null
        : DeploymentCommand.fromJson(json['Command'] as Map<String, dynamic>),
    comment: json['Comment'] as String,
    completedAt: json['CompletedAt'] as String,
    createdAt: json['CreatedAt'] as String,
    customJson: json['CustomJson'] as String,
    deploymentId: json['DeploymentId'] as String,
    duration: json['Duration'] as int,
    iamUserArn: json['IamUserArn'] as String,
    instanceIds:
        (json['InstanceIds'] as List)?.map((e) => e as String)?.toList(),
    stackId: json['StackId'] as String,
    status: json['Status'] as String,
  );
}

DeploymentCommand _$DeploymentCommandFromJson(Map<String, dynamic> json) {
  return DeploymentCommand(
    name: _$enumDecodeNullable(_$DeploymentCommandNameEnumMap, json['Name']),
    args: (json['Args'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$DeploymentCommandToJson(DeploymentCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$DeploymentCommandNameEnumMap[instance.name]);
  writeNotNull('Args', instance.args);
  return val;
}

const _$DeploymentCommandNameEnumMap = {
  DeploymentCommandName.installDependencies: 'install_dependencies',
  DeploymentCommandName.updateDependencies: 'update_dependencies',
  DeploymentCommandName.updateCustomCookbooks: 'update_custom_cookbooks',
  DeploymentCommandName.executeRecipes: 'execute_recipes',
  DeploymentCommandName.configure: 'configure',
  DeploymentCommandName.setup: 'setup',
  DeploymentCommandName.deploy: 'deploy',
  DeploymentCommandName.rollback: 'rollback',
  DeploymentCommandName.start: 'start',
  DeploymentCommandName.stop: 'stop',
  DeploymentCommandName.restart: 'restart',
  DeploymentCommandName.undeploy: 'undeploy',
};

DescribeAgentVersionsResult _$DescribeAgentVersionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAgentVersionsResult(
    agentVersions: (json['AgentVersions'] as List)
        ?.map((e) =>
            e == null ? null : AgentVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeAppsResult _$DescribeAppsResultFromJson(Map<String, dynamic> json) {
  return DescribeAppsResult(
    apps: (json['Apps'] as List)
        ?.map((e) => e == null ? null : App.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeCommandsResult _$DescribeCommandsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeCommandsResult(
    commands: (json['Commands'] as List)
        ?.map((e) =>
            e == null ? null : Command.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDeploymentsResult _$DescribeDeploymentsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDeploymentsResult(
    deployments: (json['Deployments'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEcsClustersResult _$DescribeEcsClustersResultFromJson(
    Map<String, dynamic> json) {
  return DescribeEcsClustersResult(
    ecsClusters: (json['EcsClusters'] as List)
        ?.map((e) =>
            e == null ? null : EcsCluster.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeElasticIpsResult _$DescribeElasticIpsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeElasticIpsResult(
    elasticIps: (json['ElasticIps'] as List)
        ?.map((e) =>
            e == null ? null : ElasticIp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeElasticLoadBalancersResult _$DescribeElasticLoadBalancersResultFromJson(
    Map<String, dynamic> json) {
  return DescribeElasticLoadBalancersResult(
    elasticLoadBalancers: (json['ElasticLoadBalancers'] as List)
        ?.map((e) => e == null
            ? null
            : ElasticLoadBalancer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeInstancesResult _$DescribeInstancesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeInstancesResult(
    instances: (json['Instances'] as List)
        ?.map((e) =>
            e == null ? null : Instance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeLayersResult _$DescribeLayersResultFromJson(Map<String, dynamic> json) {
  return DescribeLayersResult(
    layers: (json['Layers'] as List)
        ?.map(
            (e) => e == null ? null : Layer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeLoadBasedAutoScalingResult _$DescribeLoadBasedAutoScalingResultFromJson(
    Map<String, dynamic> json) {
  return DescribeLoadBasedAutoScalingResult(
    loadBasedAutoScalingConfigurations:
        (json['LoadBasedAutoScalingConfigurations'] as List)
            ?.map((e) => e == null
                ? null
                : LoadBasedAutoScalingConfiguration.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeMyUserProfileResult _$DescribeMyUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return DescribeMyUserProfileResult(
    userProfile: json['UserProfile'] == null
        ? null
        : SelfUserProfile.fromJson(json['UserProfile'] as Map<String, dynamic>),
  );
}

DescribeOperatingSystemsResponse _$DescribeOperatingSystemsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOperatingSystemsResponse(
    operatingSystems: (json['OperatingSystems'] as List)
        ?.map((e) => e == null
            ? null
            : OperatingSystem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribePermissionsResult _$DescribePermissionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribePermissionsResult(
    permissions: (json['Permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRaidArraysResult _$DescribeRaidArraysResultFromJson(
    Map<String, dynamic> json) {
  return DescribeRaidArraysResult(
    raidArrays: (json['RaidArrays'] as List)
        ?.map((e) =>
            e == null ? null : RaidArray.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRdsDbInstancesResult _$DescribeRdsDbInstancesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeRdsDbInstancesResult(
    rdsDbInstances: (json['RdsDbInstances'] as List)
        ?.map((e) => e == null
            ? null
            : RdsDbInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeServiceErrorsResult _$DescribeServiceErrorsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeServiceErrorsResult(
    serviceErrors: (json['ServiceErrors'] as List)
        ?.map((e) =>
            e == null ? null : ServiceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeStackProvisioningParametersResult
    _$DescribeStackProvisioningParametersResultFromJson(
        Map<String, dynamic> json) {
  return DescribeStackProvisioningParametersResult(
    agentInstallerUrl: json['AgentInstallerUrl'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeStackSummaryResult _$DescribeStackSummaryResultFromJson(
    Map<String, dynamic> json) {
  return DescribeStackSummaryResult(
    stackSummary: json['StackSummary'] == null
        ? null
        : StackSummary.fromJson(json['StackSummary'] as Map<String, dynamic>),
  );
}

DescribeStacksResult _$DescribeStacksResultFromJson(Map<String, dynamic> json) {
  return DescribeStacksResult(
    stacks: (json['Stacks'] as List)
        ?.map(
            (e) => e == null ? null : Stack.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTimeBasedAutoScalingResult _$DescribeTimeBasedAutoScalingResultFromJson(
    Map<String, dynamic> json) {
  return DescribeTimeBasedAutoScalingResult(
    timeBasedAutoScalingConfigurations:
        (json['TimeBasedAutoScalingConfigurations'] as List)
            ?.map((e) => e == null
                ? null
                : TimeBasedAutoScalingConfiguration.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeUserProfilesResult _$DescribeUserProfilesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeUserProfilesResult(
    userProfiles: (json['UserProfiles'] as List)
        ?.map((e) =>
            e == null ? null : UserProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeVolumesResult _$DescribeVolumesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeVolumesResult(
    volumes: (json['Volumes'] as List)
        ?.map((e) =>
            e == null ? null : Volume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

EbsBlockDevice _$EbsBlockDeviceFromJson(Map<String, dynamic> json) {
  return EbsBlockDevice(
    deleteOnTermination: json['DeleteOnTermination'] as bool,
    iops: json['Iops'] as int,
    snapshotId: json['SnapshotId'] as String,
    volumeSize: json['VolumeSize'] as int,
    volumeType: _$enumDecodeNullable(_$VolumeTypeEnumMap, json['VolumeType']),
  );
}

Map<String, dynamic> _$EbsBlockDeviceToJson(EbsBlockDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeleteOnTermination', instance.deleteOnTermination);
  writeNotNull('Iops', instance.iops);
  writeNotNull('SnapshotId', instance.snapshotId);
  writeNotNull('VolumeSize', instance.volumeSize);
  writeNotNull('VolumeType', _$VolumeTypeEnumMap[instance.volumeType]);
  return val;
}

const _$VolumeTypeEnumMap = {
  VolumeType.gp2: 'gp2',
  VolumeType.io1: 'io1',
  VolumeType.standard: 'standard',
};

EcsCluster _$EcsClusterFromJson(Map<String, dynamic> json) {
  return EcsCluster(
    ecsClusterArn: json['EcsClusterArn'] as String,
    ecsClusterName: json['EcsClusterName'] as String,
    registeredAt: json['RegisteredAt'] as String,
    stackId: json['StackId'] as String,
  );
}

ElasticIp _$ElasticIpFromJson(Map<String, dynamic> json) {
  return ElasticIp(
    domain: json['Domain'] as String,
    instanceId: json['InstanceId'] as String,
    ip: json['Ip'] as String,
    name: json['Name'] as String,
    region: json['Region'] as String,
  );
}

ElasticLoadBalancer _$ElasticLoadBalancerFromJson(Map<String, dynamic> json) {
  return ElasticLoadBalancer(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    dnsName: json['DnsName'] as String,
    ec2InstanceIds:
        (json['Ec2InstanceIds'] as List)?.map((e) => e as String)?.toList(),
    elasticLoadBalancerName: json['ElasticLoadBalancerName'] as String,
    layerId: json['LayerId'] as String,
    region: json['Region'] as String,
    stackId: json['StackId'] as String,
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

EnvironmentVariable _$EnvironmentVariableFromJson(Map<String, dynamic> json) {
  return EnvironmentVariable(
    key: json['Key'] as String,
    value: json['Value'] as String,
    secure: json['Secure'] as bool,
  );
}

Map<String, dynamic> _$EnvironmentVariableToJson(EnvironmentVariable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  writeNotNull('Secure', instance.secure);
  return val;
}

GetHostnameSuggestionResult _$GetHostnameSuggestionResultFromJson(
    Map<String, dynamic> json) {
  return GetHostnameSuggestionResult(
    hostname: json['Hostname'] as String,
    layerId: json['LayerId'] as String,
  );
}

GrantAccessResult _$GrantAccessResultFromJson(Map<String, dynamic> json) {
  return GrantAccessResult(
    temporaryCredential: json['TemporaryCredential'] == null
        ? null
        : TemporaryCredential.fromJson(
            json['TemporaryCredential'] as Map<String, dynamic>),
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    agentVersion: json['AgentVersion'] as String,
    amiId: json['AmiId'] as String,
    architecture:
        _$enumDecodeNullable(_$ArchitectureEnumMap, json['Architecture']),
    arn: json['Arn'] as String,
    autoScalingType:
        _$enumDecodeNullable(_$AutoScalingTypeEnumMap, json['AutoScalingType']),
    availabilityZone: json['AvailabilityZone'] as String,
    blockDeviceMappings: (json['BlockDeviceMappings'] as List)
        ?.map((e) => e == null
            ? null
            : BlockDeviceMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['CreatedAt'] as String,
    ebsOptimized: json['EbsOptimized'] as bool,
    ec2InstanceId: json['Ec2InstanceId'] as String,
    ecsClusterArn: json['EcsClusterArn'] as String,
    ecsContainerInstanceArn: json['EcsContainerInstanceArn'] as String,
    elasticIp: json['ElasticIp'] as String,
    hostname: json['Hostname'] as String,
    infrastructureClass: json['InfrastructureClass'] as String,
    installUpdatesOnBoot: json['InstallUpdatesOnBoot'] as bool,
    instanceId: json['InstanceId'] as String,
    instanceProfileArn: json['InstanceProfileArn'] as String,
    instanceType: json['InstanceType'] as String,
    lastServiceErrorId: json['LastServiceErrorId'] as String,
    layerIds: (json['LayerIds'] as List)?.map((e) => e as String)?.toList(),
    os: json['Os'] as String,
    platform: json['Platform'] as String,
    privateDns: json['PrivateDns'] as String,
    privateIp: json['PrivateIp'] as String,
    publicDns: json['PublicDns'] as String,
    publicIp: json['PublicIp'] as String,
    registeredBy: json['RegisteredBy'] as String,
    reportedAgentVersion: json['ReportedAgentVersion'] as String,
    reportedOs: json['ReportedOs'] == null
        ? null
        : ReportedOs.fromJson(json['ReportedOs'] as Map<String, dynamic>),
    rootDeviceType:
        _$enumDecodeNullable(_$RootDeviceTypeEnumMap, json['RootDeviceType']),
    rootDeviceVolumeId: json['RootDeviceVolumeId'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    sshHostDsaKeyFingerprint: json['SshHostDsaKeyFingerprint'] as String,
    sshHostRsaKeyFingerprint: json['SshHostRsaKeyFingerprint'] as String,
    sshKeyName: json['SshKeyName'] as String,
    stackId: json['StackId'] as String,
    status: json['Status'] as String,
    subnetId: json['SubnetId'] as String,
    tenancy: json['Tenancy'] as String,
    virtualizationType: _$enumDecodeNullable(
        _$VirtualizationTypeEnumMap, json['VirtualizationType']),
  );
}

const _$ArchitectureEnumMap = {
  Architecture.x86_64: 'x86_64',
  Architecture.i386: 'i386',
};

const _$AutoScalingTypeEnumMap = {
  AutoScalingType.load: 'load',
  AutoScalingType.timer: 'timer',
};

const _$RootDeviceTypeEnumMap = {
  RootDeviceType.ebs: 'ebs',
  RootDeviceType.instanceStore: 'instance-store',
};

const _$VirtualizationTypeEnumMap = {
  VirtualizationType.paravirtual: 'paravirtual',
  VirtualizationType.hvm: 'hvm',
};

Map<String, dynamic> _$InstanceIdentityToJson(InstanceIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Document', instance.document);
  writeNotNull('Signature', instance.signature);
  return val;
}

InstancesCount _$InstancesCountFromJson(Map<String, dynamic> json) {
  return InstancesCount(
    assigning: json['Assigning'] as int,
    booting: json['Booting'] as int,
    connectionLost: json['ConnectionLost'] as int,
    deregistering: json['Deregistering'] as int,
    online: json['Online'] as int,
    pending: json['Pending'] as int,
    rebooting: json['Rebooting'] as int,
    registered: json['Registered'] as int,
    registering: json['Registering'] as int,
    requested: json['Requested'] as int,
    runningSetup: json['RunningSetup'] as int,
    setupFailed: json['SetupFailed'] as int,
    shuttingDown: json['ShuttingDown'] as int,
    startFailed: json['StartFailed'] as int,
    stopFailed: json['StopFailed'] as int,
    stopped: json['Stopped'] as int,
    stopping: json['Stopping'] as int,
    terminated: json['Terminated'] as int,
    terminating: json['Terminating'] as int,
    unassigning: json['Unassigning'] as int,
  );
}

Layer _$LayerFromJson(Map<String, dynamic> json) {
  return Layer(
    arn: json['Arn'] as String,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$LayerAttributesKeysEnumMap, k), e as String),
    ),
    autoAssignElasticIps: json['AutoAssignElasticIps'] as bool,
    autoAssignPublicIps: json['AutoAssignPublicIps'] as bool,
    cloudWatchLogsConfiguration: json['CloudWatchLogsConfiguration'] == null
        ? null
        : CloudWatchLogsConfiguration.fromJson(
            json['CloudWatchLogsConfiguration'] as Map<String, dynamic>),
    createdAt: json['CreatedAt'] as String,
    customInstanceProfileArn: json['CustomInstanceProfileArn'] as String,
    customJson: json['CustomJson'] as String,
    customRecipes: json['CustomRecipes'] == null
        ? null
        : Recipes.fromJson(json['CustomRecipes'] as Map<String, dynamic>),
    customSecurityGroupIds: (json['CustomSecurityGroupIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    defaultRecipes: json['DefaultRecipes'] == null
        ? null
        : Recipes.fromJson(json['DefaultRecipes'] as Map<String, dynamic>),
    defaultSecurityGroupNames: (json['DefaultSecurityGroupNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    enableAutoHealing: json['EnableAutoHealing'] as bool,
    installUpdatesOnBoot: json['InstallUpdatesOnBoot'] as bool,
    layerId: json['LayerId'] as String,
    lifecycleEventConfiguration: json['LifecycleEventConfiguration'] == null
        ? null
        : LifecycleEventConfiguration.fromJson(
            json['LifecycleEventConfiguration'] as Map<String, dynamic>),
    name: json['Name'] as String,
    packages: (json['Packages'] as List)?.map((e) => e as String)?.toList(),
    shortname: json['Shortname'] as String,
    stackId: json['StackId'] as String,
    type: _$enumDecodeNullable(_$LayerTypeEnumMap, json['Type']),
    useEbsOptimizedInstances: json['UseEbsOptimizedInstances'] as bool,
    volumeConfigurations: (json['VolumeConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : VolumeConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LayerAttributesKeysEnumMap = {
  LayerAttributesKeys.ecsClusterArn: 'EcsClusterArn',
  LayerAttributesKeys.enableHaproxyStats: 'EnableHaproxyStats',
  LayerAttributesKeys.haproxyStatsUrl: 'HaproxyStatsUrl',
  LayerAttributesKeys.haproxyStatsUser: 'HaproxyStatsUser',
  LayerAttributesKeys.haproxyStatsPassword: 'HaproxyStatsPassword',
  LayerAttributesKeys.haproxyHealthCheckUrl: 'HaproxyHealthCheckUrl',
  LayerAttributesKeys.haproxyHealthCheckMethod: 'HaproxyHealthCheckMethod',
  LayerAttributesKeys.mysqlRootPassword: 'MysqlRootPassword',
  LayerAttributesKeys.mysqlRootPasswordUbiquitous:
      'MysqlRootPasswordUbiquitous',
  LayerAttributesKeys.gangliaUrl: 'GangliaUrl',
  LayerAttributesKeys.gangliaUser: 'GangliaUser',
  LayerAttributesKeys.gangliaPassword: 'GangliaPassword',
  LayerAttributesKeys.memcachedMemory: 'MemcachedMemory',
  LayerAttributesKeys.nodejsVersion: 'NodejsVersion',
  LayerAttributesKeys.rubyVersion: 'RubyVersion',
  LayerAttributesKeys.rubygemsVersion: 'RubygemsVersion',
  LayerAttributesKeys.manageBundler: 'ManageBundler',
  LayerAttributesKeys.bundlerVersion: 'BundlerVersion',
  LayerAttributesKeys.railsStack: 'RailsStack',
  LayerAttributesKeys.passengerVersion: 'PassengerVersion',
  LayerAttributesKeys.jvm: 'Jvm',
  LayerAttributesKeys.jvmVersion: 'JvmVersion',
  LayerAttributesKeys.jvmOptions: 'JvmOptions',
  LayerAttributesKeys.javaAppServer: 'JavaAppServer',
  LayerAttributesKeys.javaAppServerVersion: 'JavaAppServerVersion',
};

const _$LayerTypeEnumMap = {
  LayerType.awsFlowRuby: 'aws-flow-ruby',
  LayerType.ecsCluster: 'ecs-cluster',
  LayerType.javaApp: 'java-app',
  LayerType.lb: 'lb',
  LayerType.web: 'web',
  LayerType.phpApp: 'php-app',
  LayerType.railsApp: 'rails-app',
  LayerType.nodejsApp: 'nodejs-app',
  LayerType.memcached: 'memcached',
  LayerType.dbMaster: 'db-master',
  LayerType.monitoringMaster: 'monitoring-master',
  LayerType.custom: 'custom',
};

LifecycleEventConfiguration _$LifecycleEventConfigurationFromJson(
    Map<String, dynamic> json) {
  return LifecycleEventConfiguration(
    shutdown: json['Shutdown'] == null
        ? null
        : ShutdownEventConfiguration.fromJson(
            json['Shutdown'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LifecycleEventConfigurationToJson(
    LifecycleEventConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Shutdown', instance.shutdown?.toJson());
  return val;
}

ListTagsResult _$ListTagsResultFromJson(Map<String, dynamic> json) {
  return ListTagsResult(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LoadBasedAutoScalingConfiguration _$LoadBasedAutoScalingConfigurationFromJson(
    Map<String, dynamic> json) {
  return LoadBasedAutoScalingConfiguration(
    downScaling: json['DownScaling'] == null
        ? null
        : AutoScalingThresholds.fromJson(
            json['DownScaling'] as Map<String, dynamic>),
    enable: json['Enable'] as bool,
    layerId: json['LayerId'] as String,
    upScaling: json['UpScaling'] == null
        ? null
        : AutoScalingThresholds.fromJson(
            json['UpScaling'] as Map<String, dynamic>),
  );
}

OperatingSystem _$OperatingSystemFromJson(Map<String, dynamic> json) {
  return OperatingSystem(
    configurationManagers: (json['ConfigurationManagers'] as List)
        ?.map((e) => e == null
            ? null
            : OperatingSystemConfigurationManager.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    name: json['Name'] as String,
    reportedName: json['ReportedName'] as String,
    reportedVersion: json['ReportedVersion'] as String,
    supported: json['Supported'] as bool,
    type: json['Type'] as String,
  );
}

OperatingSystemConfigurationManager
    _$OperatingSystemConfigurationManagerFromJson(Map<String, dynamic> json) {
  return OperatingSystemConfigurationManager(
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    allowSsh: json['AllowSsh'] as bool,
    allowSudo: json['AllowSudo'] as bool,
    iamUserArn: json['IamUserArn'] as String,
    level: json['Level'] as String,
    stackId: json['StackId'] as String,
  );
}

RaidArray _$RaidArrayFromJson(Map<String, dynamic> json) {
  return RaidArray(
    availabilityZone: json['AvailabilityZone'] as String,
    createdAt: json['CreatedAt'] as String,
    device: json['Device'] as String,
    instanceId: json['InstanceId'] as String,
    iops: json['Iops'] as int,
    mountPoint: json['MountPoint'] as String,
    name: json['Name'] as String,
    numberOfDisks: json['NumberOfDisks'] as int,
    raidArrayId: json['RaidArrayId'] as String,
    raidLevel: json['RaidLevel'] as int,
    size: json['Size'] as int,
    stackId: json['StackId'] as String,
    volumeType: json['VolumeType'] as String,
  );
}

RdsDbInstance _$RdsDbInstanceFromJson(Map<String, dynamic> json) {
  return RdsDbInstance(
    address: json['Address'] as String,
    dbInstanceIdentifier: json['DbInstanceIdentifier'] as String,
    dbPassword: json['DbPassword'] as String,
    dbUser: json['DbUser'] as String,
    engine: json['Engine'] as String,
    missingOnRds: json['MissingOnRds'] as bool,
    rdsDbInstanceArn: json['RdsDbInstanceArn'] as String,
    region: json['Region'] as String,
    stackId: json['StackId'] as String,
  );
}

Recipes _$RecipesFromJson(Map<String, dynamic> json) {
  return Recipes(
    configure: (json['Configure'] as List)?.map((e) => e as String)?.toList(),
    deploy: (json['Deploy'] as List)?.map((e) => e as String)?.toList(),
    setup: (json['Setup'] as List)?.map((e) => e as String)?.toList(),
    shutdown: (json['Shutdown'] as List)?.map((e) => e as String)?.toList(),
    undeploy: (json['Undeploy'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RecipesToJson(Recipes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Configure', instance.configure);
  writeNotNull('Deploy', instance.deploy);
  writeNotNull('Setup', instance.setup);
  writeNotNull('Shutdown', instance.shutdown);
  writeNotNull('Undeploy', instance.undeploy);
  return val;
}

RegisterEcsClusterResult _$RegisterEcsClusterResultFromJson(
    Map<String, dynamic> json) {
  return RegisterEcsClusterResult(
    ecsClusterArn: json['EcsClusterArn'] as String,
  );
}

RegisterElasticIpResult _$RegisterElasticIpResultFromJson(
    Map<String, dynamic> json) {
  return RegisterElasticIpResult(
    elasticIp: json['ElasticIp'] as String,
  );
}

RegisterInstanceResult _$RegisterInstanceResultFromJson(
    Map<String, dynamic> json) {
  return RegisterInstanceResult(
    instanceId: json['InstanceId'] as String,
  );
}

RegisterVolumeResult _$RegisterVolumeResultFromJson(Map<String, dynamic> json) {
  return RegisterVolumeResult(
    volumeId: json['VolumeId'] as String,
  );
}

ReportedOs _$ReportedOsFromJson(Map<String, dynamic> json) {
  return ReportedOs(
    family: json['Family'] as String,
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

SelfUserProfile _$SelfUserProfileFromJson(Map<String, dynamic> json) {
  return SelfUserProfile(
    iamUserArn: json['IamUserArn'] as String,
    name: json['Name'] as String,
    sshPublicKey: json['SshPublicKey'] as String,
    sshUsername: json['SshUsername'] as String,
  );
}

ServiceError _$ServiceErrorFromJson(Map<String, dynamic> json) {
  return ServiceError(
    createdAt: json['CreatedAt'] as String,
    instanceId: json['InstanceId'] as String,
    message: json['Message'] as String,
    serviceErrorId: json['ServiceErrorId'] as String,
    stackId: json['StackId'] as String,
    type: json['Type'] as String,
  );
}

ShutdownEventConfiguration _$ShutdownEventConfigurationFromJson(
    Map<String, dynamic> json) {
  return ShutdownEventConfiguration(
    delayUntilElbConnectionsDrained:
        json['DelayUntilElbConnectionsDrained'] as bool,
    executionTimeout: json['ExecutionTimeout'] as int,
  );
}

Map<String, dynamic> _$ShutdownEventConfigurationToJson(
    ShutdownEventConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DelayUntilElbConnectionsDrained',
      instance.delayUntilElbConnectionsDrained);
  writeNotNull('ExecutionTimeout', instance.executionTimeout);
  return val;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    password: json['Password'] as String,
    revision: json['Revision'] as String,
    sshKey: json['SshKey'] as String,
    type: _$enumDecodeNullable(_$SourceTypeEnumMap, json['Type']),
    url: json['Url'] as String,
    username: json['Username'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Password', instance.password);
  writeNotNull('Revision', instance.revision);
  writeNotNull('SshKey', instance.sshKey);
  writeNotNull('Type', _$SourceTypeEnumMap[instance.type]);
  writeNotNull('Url', instance.url);
  writeNotNull('Username', instance.username);
  return val;
}

const _$SourceTypeEnumMap = {
  SourceType.git: 'git',
  SourceType.svn: 'svn',
  SourceType.archive: 'archive',
  SourceType.s3: 's3',
};

SslConfiguration _$SslConfigurationFromJson(Map<String, dynamic> json) {
  return SslConfiguration(
    certificate: json['Certificate'] as String,
    privateKey: json['PrivateKey'] as String,
    chain: json['Chain'] as String,
  );
}

Map<String, dynamic> _$SslConfigurationToJson(SslConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('PrivateKey', instance.privateKey);
  writeNotNull('Chain', instance.chain);
  return val;
}

Stack _$StackFromJson(Map<String, dynamic> json) {
  return Stack(
    agentVersion: json['AgentVersion'] as String,
    arn: json['Arn'] as String,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$StackAttributesKeysEnumMap, k), e as String),
    ),
    chefConfiguration: json['ChefConfiguration'] == null
        ? null
        : ChefConfiguration.fromJson(
            json['ChefConfiguration'] as Map<String, dynamic>),
    configurationManager: json['ConfigurationManager'] == null
        ? null
        : StackConfigurationManager.fromJson(
            json['ConfigurationManager'] as Map<String, dynamic>),
    createdAt: json['CreatedAt'] as String,
    customCookbooksSource: json['CustomCookbooksSource'] == null
        ? null
        : Source.fromJson(
            json['CustomCookbooksSource'] as Map<String, dynamic>),
    customJson: json['CustomJson'] as String,
    defaultAvailabilityZone: json['DefaultAvailabilityZone'] as String,
    defaultInstanceProfileArn: json['DefaultInstanceProfileArn'] as String,
    defaultOs: json['DefaultOs'] as String,
    defaultRootDeviceType: _$enumDecodeNullable(
        _$RootDeviceTypeEnumMap, json['DefaultRootDeviceType']),
    defaultSshKeyName: json['DefaultSshKeyName'] as String,
    defaultSubnetId: json['DefaultSubnetId'] as String,
    hostnameTheme: json['HostnameTheme'] as String,
    name: json['Name'] as String,
    region: json['Region'] as String,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    stackId: json['StackId'] as String,
    useCustomCookbooks: json['UseCustomCookbooks'] as bool,
    useOpsworksSecurityGroups: json['UseOpsworksSecurityGroups'] as bool,
    vpcId: json['VpcId'] as String,
  );
}

const _$StackAttributesKeysEnumMap = {
  StackAttributesKeys.color: 'Color',
};

StackConfigurationManager _$StackConfigurationManagerFromJson(
    Map<String, dynamic> json) {
  return StackConfigurationManager(
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$StackConfigurationManagerToJson(
    StackConfigurationManager instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

StackSummary _$StackSummaryFromJson(Map<String, dynamic> json) {
  return StackSummary(
    appsCount: json['AppsCount'] as int,
    arn: json['Arn'] as String,
    instancesCount: json['InstancesCount'] == null
        ? null
        : InstancesCount.fromJson(
            json['InstancesCount'] as Map<String, dynamic>),
    layersCount: json['LayersCount'] as int,
    name: json['Name'] as String,
    stackId: json['StackId'] as String,
  );
}

TemporaryCredential _$TemporaryCredentialFromJson(Map<String, dynamic> json) {
  return TemporaryCredential(
    instanceId: json['InstanceId'] as String,
    password: json['Password'] as String,
    username: json['Username'] as String,
    validForInMinutes: json['ValidForInMinutes'] as int,
  );
}

TimeBasedAutoScalingConfiguration _$TimeBasedAutoScalingConfigurationFromJson(
    Map<String, dynamic> json) {
  return TimeBasedAutoScalingConfiguration(
    autoScalingSchedule: json['AutoScalingSchedule'] == null
        ? null
        : WeeklyAutoScalingSchedule.fromJson(
            json['AutoScalingSchedule'] as Map<String, dynamic>),
    instanceId: json['InstanceId'] as String,
  );
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    allowSelfManagement: json['AllowSelfManagement'] as bool,
    iamUserArn: json['IamUserArn'] as String,
    name: json['Name'] as String,
    sshPublicKey: json['SshPublicKey'] as String,
    sshUsername: json['SshUsername'] as String,
  );
}

Volume _$VolumeFromJson(Map<String, dynamic> json) {
  return Volume(
    availabilityZone: json['AvailabilityZone'] as String,
    device: json['Device'] as String,
    ec2VolumeId: json['Ec2VolumeId'] as String,
    encrypted: json['Encrypted'] as bool,
    instanceId: json['InstanceId'] as String,
    iops: json['Iops'] as int,
    mountPoint: json['MountPoint'] as String,
    name: json['Name'] as String,
    raidArrayId: json['RaidArrayId'] as String,
    region: json['Region'] as String,
    size: json['Size'] as int,
    status: json['Status'] as String,
    volumeId: json['VolumeId'] as String,
    volumeType: json['VolumeType'] as String,
  );
}

VolumeConfiguration _$VolumeConfigurationFromJson(Map<String, dynamic> json) {
  return VolumeConfiguration(
    mountPoint: json['MountPoint'] as String,
    numberOfDisks: json['NumberOfDisks'] as int,
    size: json['Size'] as int,
    encrypted: json['Encrypted'] as bool,
    iops: json['Iops'] as int,
    raidLevel: json['RaidLevel'] as int,
    volumeType: json['VolumeType'] as String,
  );
}

Map<String, dynamic> _$VolumeConfigurationToJson(VolumeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MountPoint', instance.mountPoint);
  writeNotNull('NumberOfDisks', instance.numberOfDisks);
  writeNotNull('Size', instance.size);
  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('Iops', instance.iops);
  writeNotNull('RaidLevel', instance.raidLevel);
  writeNotNull('VolumeType', instance.volumeType);
  return val;
}

WeeklyAutoScalingSchedule _$WeeklyAutoScalingScheduleFromJson(
    Map<String, dynamic> json) {
  return WeeklyAutoScalingSchedule(
    friday: (json['Friday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    monday: (json['Monday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    saturday: (json['Saturday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    sunday: (json['Sunday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    thursday: (json['Thursday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tuesday: (json['Tuesday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    wednesday: (json['Wednesday'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$WeeklyAutoScalingScheduleToJson(
    WeeklyAutoScalingSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Friday', instance.friday);
  writeNotNull('Monday', instance.monday);
  writeNotNull('Saturday', instance.saturday);
  writeNotNull('Sunday', instance.sunday);
  writeNotNull('Thursday', instance.thursday);
  writeNotNull('Tuesday', instance.tuesday);
  writeNotNull('Wednesday', instance.wednesday);
  return val;
}
