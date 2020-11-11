// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamelift-2015-10-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AcceptMatchInputToJson(AcceptMatchInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AcceptanceType', _$AcceptanceTypeEnumMap[instance.acceptanceType]);
  writeNotNull('PlayerIds', instance.playerIds);
  writeNotNull('TicketId', instance.ticketId);
  return val;
}

const _$AcceptanceTypeEnumMap = {
  AcceptanceType.accept: 'ACCEPT',
  AcceptanceType.reject: 'REJECT',
};

AcceptMatchOutput _$AcceptMatchOutputFromJson(Map<String, dynamic> json) {
  return AcceptMatchOutput();
}

Alias _$AliasFromJson(Map<String, dynamic> json) {
  return Alias(
    aliasArn: json['AliasArn'] as String,
    aliasId: json['AliasId'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    description: json['Description'] as String,
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    routingStrategy: json['RoutingStrategy'] == null
        ? null
        : RoutingStrategy.fromJson(
            json['RoutingStrategy'] as Map<String, dynamic>),
  );
}

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    n: (json['N'] as num)?.toDouble(),
    s: json['S'] as String,
    sdm: (json['SDM'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    sl: (json['SL'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AttributeValueToJson(AttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('N', instance.n);
  writeNotNull('S', instance.s);
  writeNotNull('SDM', instance.sdm);
  writeNotNull('SL', instance.sl);
  return val;
}

AwsCredentials _$AwsCredentialsFromJson(Map<String, dynamic> json) {
  return AwsCredentials(
    accessKeyId: json['AccessKeyId'] as String,
    secretAccessKey: json['SecretAccessKey'] as String,
    sessionToken: json['SessionToken'] as String,
  );
}

Build _$BuildFromJson(Map<String, dynamic> json) {
  return Build(
    buildArn: json['BuildArn'] as String,
    buildId: json['BuildId'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    name: json['Name'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    sizeOnDisk: json['SizeOnDisk'] as int,
    status: _$enumDecodeNullable(_$BuildStatusEnumMap, json['Status']),
    version: json['Version'] as String,
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

const _$OperatingSystemEnumMap = {
  OperatingSystem.windows_2012: 'WINDOWS_2012',
  OperatingSystem.amazonLinux: 'AMAZON_LINUX',
  OperatingSystem.amazonLinux_2: 'AMAZON_LINUX_2',
};

const _$BuildStatusEnumMap = {
  BuildStatus.initialized: 'INITIALIZED',
  BuildStatus.ready: 'READY',
  BuildStatus.failed: 'FAILED',
};

CertificateConfiguration _$CertificateConfigurationFromJson(
    Map<String, dynamic> json) {
  return CertificateConfiguration(
    certificateType:
        _$enumDecodeNullable(_$CertificateTypeEnumMap, json['CertificateType']),
  );
}

Map<String, dynamic> _$CertificateConfigurationToJson(
    CertificateConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CertificateType', _$CertificateTypeEnumMap[instance.certificateType]);
  return val;
}

const _$CertificateTypeEnumMap = {
  CertificateType.disabled: 'DISABLED',
  CertificateType.generated: 'GENERATED',
};

Map<String, dynamic> _$ClaimGameServerInputToJson(
    ClaimGameServerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('GameServerData', instance.gameServerData);
  writeNotNull('GameServerId', instance.gameServerId);
  return val;
}

ClaimGameServerOutput _$ClaimGameServerOutputFromJson(
    Map<String, dynamic> json) {
  return ClaimGameServerOutput(
    gameServer: json['GameServer'] == null
        ? null
        : GameServer.fromJson(json['GameServer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateAliasInputToJson(CreateAliasInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RoutingStrategy', instance.routingStrategy?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateAliasOutput _$CreateAliasOutputFromJson(Map<String, dynamic> json) {
  return CreateAliasOutput(
    alias: json['Alias'] == null
        ? null
        : Alias.fromJson(json['Alias'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBuildInputToJson(CreateBuildInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull(
      'OperatingSystem', _$OperatingSystemEnumMap[instance.operatingSystem]);
  writeNotNull('StorageLocation', instance.storageLocation?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('Version', instance.version);
  return val;
}

CreateBuildOutput _$CreateBuildOutputFromJson(Map<String, dynamic> json) {
  return CreateBuildOutput(
    build: json['Build'] == null
        ? null
        : Build.fromJson(json['Build'] as Map<String, dynamic>),
    storageLocation: json['StorageLocation'] == null
        ? null
        : S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>),
    uploadCredentials: json['UploadCredentials'] == null
        ? null
        : AwsCredentials.fromJson(
            json['UploadCredentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateFleetInputToJson(CreateFleetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EC2InstanceType', _$EC2InstanceTypeEnumMap[instance.eC2InstanceType]);
  writeNotNull('Name', instance.name);
  writeNotNull('BuildId', instance.buildId);
  writeNotNull(
      'CertificateConfiguration', instance.certificateConfiguration?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('EC2InboundPermissions',
      instance.eC2InboundPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('FleetType', _$FleetTypeEnumMap[instance.fleetType]);
  writeNotNull('InstanceRoleArn', instance.instanceRoleArn);
  writeNotNull('LogPaths', instance.logPaths);
  writeNotNull('MetricGroups', instance.metricGroups);
  writeNotNull('NewGameSessionProtectionPolicy',
      _$ProtectionPolicyEnumMap[instance.newGameSessionProtectionPolicy]);
  writeNotNull('PeerVpcAwsAccountId', instance.peerVpcAwsAccountId);
  writeNotNull('PeerVpcId', instance.peerVpcId);
  writeNotNull('ResourceCreationLimitPolicy',
      instance.resourceCreationLimitPolicy?.toJson());
  writeNotNull('RuntimeConfiguration', instance.runtimeConfiguration?.toJson());
  writeNotNull('ScriptId', instance.scriptId);
  writeNotNull('ServerLaunchParameters', instance.serverLaunchParameters);
  writeNotNull('ServerLaunchPath', instance.serverLaunchPath);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$EC2InstanceTypeEnumMap = {
  EC2InstanceType.t2Micro: 't2.micro',
  EC2InstanceType.t2Small: 't2.small',
  EC2InstanceType.t2Medium: 't2.medium',
  EC2InstanceType.t2Large: 't2.large',
  EC2InstanceType.c3Large: 'c3.large',
  EC2InstanceType.c3Xlarge: 'c3.xlarge',
  EC2InstanceType.c3_2xlarge: 'c3.2xlarge',
  EC2InstanceType.c3_4xlarge: 'c3.4xlarge',
  EC2InstanceType.c3_8xlarge: 'c3.8xlarge',
  EC2InstanceType.c4Large: 'c4.large',
  EC2InstanceType.c4Xlarge: 'c4.xlarge',
  EC2InstanceType.c4_2xlarge: 'c4.2xlarge',
  EC2InstanceType.c4_4xlarge: 'c4.4xlarge',
  EC2InstanceType.c4_8xlarge: 'c4.8xlarge',
  EC2InstanceType.c5Large: 'c5.large',
  EC2InstanceType.c5Xlarge: 'c5.xlarge',
  EC2InstanceType.c5_2xlarge: 'c5.2xlarge',
  EC2InstanceType.c5_4xlarge: 'c5.4xlarge',
  EC2InstanceType.c5_9xlarge: 'c5.9xlarge',
  EC2InstanceType.c5_12xlarge: 'c5.12xlarge',
  EC2InstanceType.c5_18xlarge: 'c5.18xlarge',
  EC2InstanceType.c5_24xlarge: 'c5.24xlarge',
  EC2InstanceType.r3Large: 'r3.large',
  EC2InstanceType.r3Xlarge: 'r3.xlarge',
  EC2InstanceType.r3_2xlarge: 'r3.2xlarge',
  EC2InstanceType.r3_4xlarge: 'r3.4xlarge',
  EC2InstanceType.r3_8xlarge: 'r3.8xlarge',
  EC2InstanceType.r4Large: 'r4.large',
  EC2InstanceType.r4Xlarge: 'r4.xlarge',
  EC2InstanceType.r4_2xlarge: 'r4.2xlarge',
  EC2InstanceType.r4_4xlarge: 'r4.4xlarge',
  EC2InstanceType.r4_8xlarge: 'r4.8xlarge',
  EC2InstanceType.r4_16xlarge: 'r4.16xlarge',
  EC2InstanceType.r5Large: 'r5.large',
  EC2InstanceType.r5Xlarge: 'r5.xlarge',
  EC2InstanceType.r5_2xlarge: 'r5.2xlarge',
  EC2InstanceType.r5_4xlarge: 'r5.4xlarge',
  EC2InstanceType.r5_8xlarge: 'r5.8xlarge',
  EC2InstanceType.r5_12xlarge: 'r5.12xlarge',
  EC2InstanceType.r5_16xlarge: 'r5.16xlarge',
  EC2InstanceType.r5_24xlarge: 'r5.24xlarge',
  EC2InstanceType.m3Medium: 'm3.medium',
  EC2InstanceType.m3Large: 'm3.large',
  EC2InstanceType.m3Xlarge: 'm3.xlarge',
  EC2InstanceType.m3_2xlarge: 'm3.2xlarge',
  EC2InstanceType.m4Large: 'm4.large',
  EC2InstanceType.m4Xlarge: 'm4.xlarge',
  EC2InstanceType.m4_2xlarge: 'm4.2xlarge',
  EC2InstanceType.m4_4xlarge: 'm4.4xlarge',
  EC2InstanceType.m4_10xlarge: 'm4.10xlarge',
  EC2InstanceType.m5Large: 'm5.large',
  EC2InstanceType.m5Xlarge: 'm5.xlarge',
  EC2InstanceType.m5_2xlarge: 'm5.2xlarge',
  EC2InstanceType.m5_4xlarge: 'm5.4xlarge',
  EC2InstanceType.m5_8xlarge: 'm5.8xlarge',
  EC2InstanceType.m5_12xlarge: 'm5.12xlarge',
  EC2InstanceType.m5_16xlarge: 'm5.16xlarge',
  EC2InstanceType.m5_24xlarge: 'm5.24xlarge',
};

const _$FleetTypeEnumMap = {
  FleetType.onDemand: 'ON_DEMAND',
  FleetType.spot: 'SPOT',
};

const _$ProtectionPolicyEnumMap = {
  ProtectionPolicy.noProtection: 'NoProtection',
  ProtectionPolicy.fullProtection: 'FullProtection',
};

CreateFleetOutput _$CreateFleetOutputFromJson(Map<String, dynamic> json) {
  return CreateFleetOutput(
    fleetAttributes: json['FleetAttributes'] == null
        ? null
        : FleetAttributes.fromJson(
            json['FleetAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGameServerGroupInputToJson(
    CreateGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('InstanceDefinitions',
      instance.instanceDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('LaunchTemplate', instance.launchTemplate?.toJson());
  writeNotNull('MaxSize', instance.maxSize);
  writeNotNull('MinSize', instance.minSize);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('AutoScalingPolicy', instance.autoScalingPolicy?.toJson());
  writeNotNull('BalancingStrategy',
      _$BalancingStrategyEnumMap[instance.balancingStrategy]);
  writeNotNull('GameServerProtectionPolicy',
      _$GameServerProtectionPolicyEnumMap[instance.gameServerProtectionPolicy]);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('VpcSubnets', instance.vpcSubnets);
  return val;
}

const _$BalancingStrategyEnumMap = {
  BalancingStrategy.spotOnly: 'SPOT_ONLY',
  BalancingStrategy.spotPreferred: 'SPOT_PREFERRED',
};

const _$GameServerProtectionPolicyEnumMap = {
  GameServerProtectionPolicy.noProtection: 'NO_PROTECTION',
  GameServerProtectionPolicy.fullProtection: 'FULL_PROTECTION',
};

CreateGameServerGroupOutput _$CreateGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGameSessionInputToJson(
    CreateGameSessionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaximumPlayerSessionCount', instance.maximumPlayerSessionCount);
  writeNotNull('AliasId', instance.aliasId);
  writeNotNull('CreatorId', instance.creatorId);
  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('GameProperties',
      instance.gameProperties?.map((e) => e?.toJson())?.toList());
  writeNotNull('GameSessionData', instance.gameSessionData);
  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Name', instance.name);
  return val;
}

CreateGameSessionOutput _$CreateGameSessionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGameSessionOutput(
    gameSession: json['GameSession'] == null
        ? null
        : GameSession.fromJson(json['GameSession'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGameSessionQueueInputToJson(
    CreateGameSessionQueueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull(
      'Destinations', instance.destinations?.map((e) => e?.toJson())?.toList());
  writeNotNull('PlayerLatencyPolicies',
      instance.playerLatencyPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('TimeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

CreateGameSessionQueueOutput _$CreateGameSessionQueueOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGameSessionQueueOutput(
    gameSessionQueue: json['GameSessionQueue'] == null
        ? null
        : GameSessionQueue.fromJson(
            json['GameSessionQueue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateMatchmakingConfigurationInputToJson(
    CreateMatchmakingConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptanceRequired', instance.acceptanceRequired);
  writeNotNull('GameSessionQueueArns', instance.gameSessionQueueArns);
  writeNotNull('Name', instance.name);
  writeNotNull('RequestTimeoutSeconds', instance.requestTimeoutSeconds);
  writeNotNull('RuleSetName', instance.ruleSetName);
  writeNotNull('AcceptanceTimeoutSeconds', instance.acceptanceTimeoutSeconds);
  writeNotNull('AdditionalPlayerCount', instance.additionalPlayerCount);
  writeNotNull('BackfillMode', _$BackfillModeEnumMap[instance.backfillMode]);
  writeNotNull('CustomEventData', instance.customEventData);
  writeNotNull('Description', instance.description);
  writeNotNull('GameProperties',
      instance.gameProperties?.map((e) => e?.toJson())?.toList());
  writeNotNull('GameSessionData', instance.gameSessionData);
  writeNotNull('NotificationTarget', instance.notificationTarget);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$BackfillModeEnumMap = {
  BackfillMode.automatic: 'AUTOMATIC',
  BackfillMode.manual: 'MANUAL',
};

CreateMatchmakingConfigurationOutput
    _$CreateMatchmakingConfigurationOutputFromJson(Map<String, dynamic> json) {
  return CreateMatchmakingConfigurationOutput(
    configuration: json['Configuration'] == null
        ? null
        : MatchmakingConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateMatchmakingRuleSetInputToJson(
    CreateMatchmakingRuleSetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RuleSetBody', instance.ruleSetBody);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateMatchmakingRuleSetOutput _$CreateMatchmakingRuleSetOutputFromJson(
    Map<String, dynamic> json) {
  return CreateMatchmakingRuleSetOutput(
    ruleSet: json['RuleSet'] == null
        ? null
        : MatchmakingRuleSet.fromJson(json['RuleSet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreatePlayerSessionInputToJson(
    CreatePlayerSessionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('PlayerId', instance.playerId);
  writeNotNull('PlayerData', instance.playerData);
  return val;
}

CreatePlayerSessionOutput _$CreatePlayerSessionOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePlayerSessionOutput(
    playerSession: json['PlayerSession'] == null
        ? null
        : PlayerSession.fromJson(json['PlayerSession'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreatePlayerSessionsInputToJson(
    CreatePlayerSessionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('PlayerIds', instance.playerIds);
  writeNotNull('PlayerDataMap', instance.playerDataMap);
  return val;
}

CreatePlayerSessionsOutput _$CreatePlayerSessionsOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePlayerSessionsOutput(
    playerSessions: (json['PlayerSessions'] as List)
        ?.map((e) => e == null
            ? null
            : PlayerSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateScriptInputToJson(CreateScriptInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('StorageLocation', instance.storageLocation?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('Version', instance.version);
  writeNotNull('ZipFile', const Uint8ListConverter().toJson(instance.zipFile));
  return val;
}

CreateScriptOutput _$CreateScriptOutputFromJson(Map<String, dynamic> json) {
  return CreateScriptOutput(
    script: json['Script'] == null
        ? null
        : Script.fromJson(json['Script'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateVpcPeeringAuthorizationInputToJson(
    CreateVpcPeeringAuthorizationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameLiftAwsAccountId', instance.gameLiftAwsAccountId);
  writeNotNull('PeerVpcId', instance.peerVpcId);
  return val;
}

CreateVpcPeeringAuthorizationOutput
    _$CreateVpcPeeringAuthorizationOutputFromJson(Map<String, dynamic> json) {
  return CreateVpcPeeringAuthorizationOutput(
    vpcPeeringAuthorization: json['VpcPeeringAuthorization'] == null
        ? null
        : VpcPeeringAuthorization.fromJson(
            json['VpcPeeringAuthorization'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateVpcPeeringConnectionInputToJson(
    CreateVpcPeeringConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('PeerVpcAwsAccountId', instance.peerVpcAwsAccountId);
  writeNotNull('PeerVpcId', instance.peerVpcId);
  return val;
}

CreateVpcPeeringConnectionOutput _$CreateVpcPeeringConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateVpcPeeringConnectionOutput();
}

Map<String, dynamic> _$DeleteAliasInputToJson(DeleteAliasInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  return val;
}

Map<String, dynamic> _$DeleteBuildInputToJson(DeleteBuildInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BuildId', instance.buildId);
  return val;
}

Map<String, dynamic> _$DeleteFleetInputToJson(DeleteFleetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  return val;
}

Map<String, dynamic> _$DeleteGameServerGroupInputToJson(
    DeleteGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('DeleteOption',
      _$GameServerGroupDeleteOptionEnumMap[instance.deleteOption]);
  return val;
}

const _$GameServerGroupDeleteOptionEnumMap = {
  GameServerGroupDeleteOption.safeDelete: 'SAFE_DELETE',
  GameServerGroupDeleteOption.forceDelete: 'FORCE_DELETE',
  GameServerGroupDeleteOption.retain: 'RETAIN',
};

DeleteGameServerGroupOutput _$DeleteGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteGameSessionQueueInputToJson(
    DeleteGameSessionQueueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteGameSessionQueueOutput _$DeleteGameSessionQueueOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteGameSessionQueueOutput();
}

Map<String, dynamic> _$DeleteMatchmakingConfigurationInputToJson(
    DeleteMatchmakingConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteMatchmakingConfigurationOutput
    _$DeleteMatchmakingConfigurationOutputFromJson(Map<String, dynamic> json) {
  return DeleteMatchmakingConfigurationOutput();
}

Map<String, dynamic> _$DeleteMatchmakingRuleSetInputToJson(
    DeleteMatchmakingRuleSetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteMatchmakingRuleSetOutput _$DeleteMatchmakingRuleSetOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteMatchmakingRuleSetOutput();
}

Map<String, dynamic> _$DeleteScalingPolicyInputToJson(
    DeleteScalingPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$DeleteScriptInputToJson(DeleteScriptInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScriptId', instance.scriptId);
  return val;
}

Map<String, dynamic> _$DeleteVpcPeeringAuthorizationInputToJson(
    DeleteVpcPeeringAuthorizationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameLiftAwsAccountId', instance.gameLiftAwsAccountId);
  writeNotNull('PeerVpcId', instance.peerVpcId);
  return val;
}

DeleteVpcPeeringAuthorizationOutput
    _$DeleteVpcPeeringAuthorizationOutputFromJson(Map<String, dynamic> json) {
  return DeleteVpcPeeringAuthorizationOutput();
}

Map<String, dynamic> _$DeleteVpcPeeringConnectionInputToJson(
    DeleteVpcPeeringConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('VpcPeeringConnectionId', instance.vpcPeeringConnectionId);
  return val;
}

DeleteVpcPeeringConnectionOutput _$DeleteVpcPeeringConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteVpcPeeringConnectionOutput();
}

Map<String, dynamic> _$DeregisterGameServerInputToJson(
    DeregisterGameServerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('GameServerId', instance.gameServerId);
  return val;
}

Map<String, dynamic> _$DescribeAliasInputToJson(DescribeAliasInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  return val;
}

DescribeAliasOutput _$DescribeAliasOutputFromJson(Map<String, dynamic> json) {
  return DescribeAliasOutput(
    alias: json['Alias'] == null
        ? null
        : Alias.fromJson(json['Alias'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeBuildInputToJson(DescribeBuildInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BuildId', instance.buildId);
  return val;
}

DescribeBuildOutput _$DescribeBuildOutputFromJson(Map<String, dynamic> json) {
  return DescribeBuildOutput(
    build: json['Build'] == null
        ? null
        : Build.fromJson(json['Build'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeEC2InstanceLimitsInputToJson(
    DescribeEC2InstanceLimitsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EC2InstanceType', _$EC2InstanceTypeEnumMap[instance.eC2InstanceType]);
  return val;
}

DescribeEC2InstanceLimitsOutput _$DescribeEC2InstanceLimitsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEC2InstanceLimitsOutput(
    eC2InstanceLimits: (json['EC2InstanceLimits'] as List)
        ?.map((e) => e == null
            ? null
            : EC2InstanceLimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeFleetAttributesInputToJson(
    DescribeFleetAttributesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetIds', instance.fleetIds);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeFleetAttributesOutput _$DescribeFleetAttributesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetAttributesOutput(
    fleetAttributes: (json['FleetAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : FleetAttributes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeFleetCapacityInputToJson(
    DescribeFleetCapacityInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetIds', instance.fleetIds);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeFleetCapacityOutput _$DescribeFleetCapacityOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetCapacityOutput(
    fleetCapacity: (json['FleetCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : FleetCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeFleetEventsInputToJson(
    DescribeFleetEventsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}

DescribeFleetEventsOutput _$DescribeFleetEventsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetEventsOutput(
    events: (json['Events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeFleetPortSettingsInputToJson(
    DescribeFleetPortSettingsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  return val;
}

DescribeFleetPortSettingsOutput _$DescribeFleetPortSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetPortSettingsOutput(
    inboundPermissions: (json['InboundPermissions'] as List)
        ?.map((e) =>
            e == null ? null : IpPermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeFleetUtilizationInputToJson(
    DescribeFleetUtilizationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetIds', instance.fleetIds);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeFleetUtilizationOutput _$DescribeFleetUtilizationOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetUtilizationOutput(
    fleetUtilization: (json['FleetUtilization'] as List)
        ?.map((e) => e == null
            ? null
            : FleetUtilization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeGameServerGroupInputToJson(
    DescribeGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  return val;
}

DescribeGameServerGroupOutput _$DescribeGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeGameServerInputToJson(
    DescribeGameServerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('GameServerId', instance.gameServerId);
  return val;
}

DescribeGameServerOutput _$DescribeGameServerOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameServerOutput(
    gameServer: json['GameServer'] == null
        ? null
        : GameServer.fromJson(json['GameServer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeGameSessionDetailsInputToJson(
    DescribeGameSessionDetailsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StatusFilter', instance.statusFilter);
  return val;
}

DescribeGameSessionDetailsOutput _$DescribeGameSessionDetailsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameSessionDetailsOutput(
    gameSessionDetails: (json['GameSessionDetails'] as List)
        ?.map((e) => e == null
            ? null
            : GameSessionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeGameSessionPlacementInputToJson(
    DescribeGameSessionPlacementInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlacementId', instance.placementId);
  return val;
}

DescribeGameSessionPlacementOutput _$DescribeGameSessionPlacementOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameSessionPlacementOutput(
    gameSessionPlacement: json['GameSessionPlacement'] == null
        ? null
        : GameSessionPlacement.fromJson(
            json['GameSessionPlacement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeGameSessionQueuesInputToJson(
    DescribeGameSessionQueuesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeGameSessionQueuesOutput _$DescribeGameSessionQueuesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameSessionQueuesOutput(
    gameSessionQueues: (json['GameSessionQueues'] as List)
        ?.map((e) => e == null
            ? null
            : GameSessionQueue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeGameSessionsInputToJson(
    DescribeGameSessionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StatusFilter', instance.statusFilter);
  return val;
}

DescribeGameSessionsOutput _$DescribeGameSessionsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGameSessionsOutput(
    gameSessions: (json['GameSessions'] as List)
        ?.map((e) =>
            e == null ? null : GameSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeInstancesInputToJson(
    DescribeInstancesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeInstancesOutput _$DescribeInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeInstancesOutput(
    instances: (json['Instances'] as List)
        ?.map((e) =>
            e == null ? null : Instance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeMatchmakingConfigurationsInputToJson(
    DescribeMatchmakingConfigurationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('RuleSetName', instance.ruleSetName);
  return val;
}

DescribeMatchmakingConfigurationsOutput
    _$DescribeMatchmakingConfigurationsOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeMatchmakingConfigurationsOutput(
    configurations: (json['Configurations'] as List)
        ?.map((e) => e == null
            ? null
            : MatchmakingConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeMatchmakingInputToJson(
    DescribeMatchmakingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TicketIds', instance.ticketIds);
  return val;
}

DescribeMatchmakingOutput _$DescribeMatchmakingOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMatchmakingOutput(
    ticketList: (json['TicketList'] as List)
        ?.map((e) => e == null
            ? null
            : MatchmakingTicket.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeMatchmakingRuleSetsInputToJson(
    DescribeMatchmakingRuleSetsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeMatchmakingRuleSetsOutput _$DescribeMatchmakingRuleSetsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMatchmakingRuleSetsOutput(
    ruleSets: (json['RuleSets'] as List)
        ?.map((e) => e == null
            ? null
            : MatchmakingRuleSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribePlayerSessionsInputToJson(
    DescribePlayerSessionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('PlayerId', instance.playerId);
  writeNotNull('PlayerSessionId', instance.playerSessionId);
  writeNotNull('PlayerSessionStatusFilter', instance.playerSessionStatusFilter);
  return val;
}

DescribePlayerSessionsOutput _$DescribePlayerSessionsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePlayerSessionsOutput(
    nextToken: json['NextToken'] as String,
    playerSessions: (json['PlayerSessions'] as List)
        ?.map((e) => e == null
            ? null
            : PlayerSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeRuntimeConfigurationInputToJson(
    DescribeRuntimeConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  return val;
}

DescribeRuntimeConfigurationOutput _$DescribeRuntimeConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeRuntimeConfigurationOutput(
    runtimeConfiguration: json['RuntimeConfiguration'] == null
        ? null
        : RuntimeConfiguration.fromJson(
            json['RuntimeConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeScalingPoliciesInputToJson(
    DescribeScalingPoliciesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull(
      'StatusFilter', _$ScalingStatusTypeEnumMap[instance.statusFilter]);
  return val;
}

const _$ScalingStatusTypeEnumMap = {
  ScalingStatusType.active: 'ACTIVE',
  ScalingStatusType.updateRequested: 'UPDATE_REQUESTED',
  ScalingStatusType.updating: 'UPDATING',
  ScalingStatusType.deleteRequested: 'DELETE_REQUESTED',
  ScalingStatusType.deleting: 'DELETING',
  ScalingStatusType.deleted: 'DELETED',
  ScalingStatusType.error: 'ERROR',
};

DescribeScalingPoliciesOutput _$DescribeScalingPoliciesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeScalingPoliciesOutput(
    nextToken: json['NextToken'] as String,
    scalingPolicies: (json['ScalingPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : ScalingPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeScriptInputToJson(DescribeScriptInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScriptId', instance.scriptId);
  return val;
}

DescribeScriptOutput _$DescribeScriptOutputFromJson(Map<String, dynamic> json) {
  return DescribeScriptOutput(
    script: json['Script'] == null
        ? null
        : Script.fromJson(json['Script'] as Map<String, dynamic>),
  );
}

DescribeVpcPeeringAuthorizationsOutput
    _$DescribeVpcPeeringAuthorizationsOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeVpcPeeringAuthorizationsOutput(
    vpcPeeringAuthorizations: (json['VpcPeeringAuthorizations'] as List)
        ?.map((e) => e == null
            ? null
            : VpcPeeringAuthorization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeVpcPeeringConnectionsInputToJson(
    DescribeVpcPeeringConnectionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  return val;
}

DescribeVpcPeeringConnectionsOutput
    _$DescribeVpcPeeringConnectionsOutputFromJson(Map<String, dynamic> json) {
  return DescribeVpcPeeringConnectionsOutput(
    vpcPeeringConnections: (json['VpcPeeringConnections'] as List)
        ?.map((e) => e == null
            ? null
            : VpcPeeringConnection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DesiredPlayerSessionToJson(
    DesiredPlayerSession instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlayerData', instance.playerData);
  writeNotNull('PlayerId', instance.playerId);
  return val;
}

EC2InstanceCounts _$EC2InstanceCountsFromJson(Map<String, dynamic> json) {
  return EC2InstanceCounts(
    active: json['ACTIVE'] as int,
    desired: json['DESIRED'] as int,
    idle: json['IDLE'] as int,
    maximum: json['MAXIMUM'] as int,
    minimum: json['MINIMUM'] as int,
    pending: json['PENDING'] as int,
    terminating: json['TERMINATING'] as int,
  );
}

EC2InstanceLimit _$EC2InstanceLimitFromJson(Map<String, dynamic> json) {
  return EC2InstanceLimit(
    currentInstances: json['CurrentInstances'] as int,
    eC2InstanceType:
        _$enumDecodeNullable(_$EC2InstanceTypeEnumMap, json['EC2InstanceType']),
    instanceLimit: json['InstanceLimit'] as int,
  );
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventCode: _$enumDecodeNullable(_$EventCodeEnumMap, json['EventCode']),
    eventId: json['EventId'] as String,
    eventTime: unixTimestampFromJson(json['EventTime']),
    message: json['Message'] as String,
    preSignedLogUrl: json['PreSignedLogUrl'] as String,
    resourceId: json['ResourceId'] as String,
  );
}

const _$EventCodeEnumMap = {
  EventCode.genericEvent: 'GENERIC_EVENT',
  EventCode.fleetCreated: 'FLEET_CREATED',
  EventCode.fleetDeleted: 'FLEET_DELETED',
  EventCode.fleetScalingEvent: 'FLEET_SCALING_EVENT',
  EventCode.fleetStateDownloading: 'FLEET_STATE_DOWNLOADING',
  EventCode.fleetStateValidating: 'FLEET_STATE_VALIDATING',
  EventCode.fleetStateBuilding: 'FLEET_STATE_BUILDING',
  EventCode.fleetStateActivating: 'FLEET_STATE_ACTIVATING',
  EventCode.fleetStateActive: 'FLEET_STATE_ACTIVE',
  EventCode.fleetStateError: 'FLEET_STATE_ERROR',
  EventCode.fleetInitializationFailed: 'FLEET_INITIALIZATION_FAILED',
  EventCode.fleetBinaryDownloadFailed: 'FLEET_BINARY_DOWNLOAD_FAILED',
  EventCode.fleetValidationLaunchPathNotFound:
      'FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND',
  EventCode.fleetValidationExecutableRuntimeFailure:
      'FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE',
  EventCode.fleetValidationTimedOut: 'FLEET_VALIDATION_TIMED_OUT',
  EventCode.fleetActivationFailed: 'FLEET_ACTIVATION_FAILED',
  EventCode.fleetActivationFailedNoInstances:
      'FLEET_ACTIVATION_FAILED_NO_INSTANCES',
  EventCode.fleetNewGameSessionProtectionPolicyUpdated:
      'FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED',
  EventCode.serverProcessInvalidPath: 'SERVER_PROCESS_INVALID_PATH',
  EventCode.serverProcessSdkInitializationTimeout:
      'SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT',
  EventCode.serverProcessProcessReadyTimeout:
      'SERVER_PROCESS_PROCESS_READY_TIMEOUT',
  EventCode.serverProcessCrashed: 'SERVER_PROCESS_CRASHED',
  EventCode.serverProcessTerminatedUnhealthy:
      'SERVER_PROCESS_TERMINATED_UNHEALTHY',
  EventCode.serverProcessForceTerminated: 'SERVER_PROCESS_FORCE_TERMINATED',
  EventCode.serverProcessProcessExitTimeout:
      'SERVER_PROCESS_PROCESS_EXIT_TIMEOUT',
  EventCode.gameSessionActivationTimeout: 'GAME_SESSION_ACTIVATION_TIMEOUT',
  EventCode.fleetCreationExtractingBuild: 'FLEET_CREATION_EXTRACTING_BUILD',
  EventCode.fleetCreationRunningInstaller: 'FLEET_CREATION_RUNNING_INSTALLER',
  EventCode.fleetCreationValidatingRuntimeConfig:
      'FLEET_CREATION_VALIDATING_RUNTIME_CONFIG',
  EventCode.fleetVpcPeeringSucceeded: 'FLEET_VPC_PEERING_SUCCEEDED',
  EventCode.fleetVpcPeeringFailed: 'FLEET_VPC_PEERING_FAILED',
  EventCode.fleetVpcPeeringDeleted: 'FLEET_VPC_PEERING_DELETED',
  EventCode.instanceInterrupted: 'INSTANCE_INTERRUPTED',
};

FleetAttributes _$FleetAttributesFromJson(Map<String, dynamic> json) {
  return FleetAttributes(
    buildArn: json['BuildArn'] as String,
    buildId: json['BuildId'] as String,
    certificateConfiguration: json['CertificateConfiguration'] == null
        ? null
        : CertificateConfiguration.fromJson(
            json['CertificateConfiguration'] as Map<String, dynamic>),
    creationTime: unixTimestampFromJson(json['CreationTime']),
    description: json['Description'] as String,
    fleetArn: json['FleetArn'] as String,
    fleetId: json['FleetId'] as String,
    fleetType: _$enumDecodeNullable(_$FleetTypeEnumMap, json['FleetType']),
    instanceRoleArn: json['InstanceRoleArn'] as String,
    instanceType:
        _$enumDecodeNullable(_$EC2InstanceTypeEnumMap, json['InstanceType']),
    logPaths: (json['LogPaths'] as List)?.map((e) => e as String)?.toList(),
    metricGroups:
        (json['MetricGroups'] as List)?.map((e) => e as String)?.toList(),
    name: json['Name'] as String,
    newGameSessionProtectionPolicy: _$enumDecodeNullable(
        _$ProtectionPolicyEnumMap, json['NewGameSessionProtectionPolicy']),
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    resourceCreationLimitPolicy: json['ResourceCreationLimitPolicy'] == null
        ? null
        : ResourceCreationLimitPolicy.fromJson(
            json['ResourceCreationLimitPolicy'] as Map<String, dynamic>),
    scriptArn: json['ScriptArn'] as String,
    scriptId: json['ScriptId'] as String,
    serverLaunchParameters: json['ServerLaunchParameters'] as String,
    serverLaunchPath: json['ServerLaunchPath'] as String,
    status: _$enumDecodeNullable(_$FleetStatusEnumMap, json['Status']),
    stoppedActions:
        (json['StoppedActions'] as List)?.map((e) => e as String)?.toList(),
    terminationTime: unixTimestampFromJson(json['TerminationTime']),
  );
}

const _$FleetStatusEnumMap = {
  FleetStatus.$new: 'NEW',
  FleetStatus.downloading: 'DOWNLOADING',
  FleetStatus.validating: 'VALIDATING',
  FleetStatus.building: 'BUILDING',
  FleetStatus.activating: 'ACTIVATING',
  FleetStatus.active: 'ACTIVE',
  FleetStatus.deleting: 'DELETING',
  FleetStatus.error: 'ERROR',
  FleetStatus.terminated: 'TERMINATED',
};

FleetCapacity _$FleetCapacityFromJson(Map<String, dynamic> json) {
  return FleetCapacity(
    fleetId: json['FleetId'] as String,
    instanceCounts: json['InstanceCounts'] == null
        ? null
        : EC2InstanceCounts.fromJson(
            json['InstanceCounts'] as Map<String, dynamic>),
    instanceType:
        _$enumDecodeNullable(_$EC2InstanceTypeEnumMap, json['InstanceType']),
  );
}

FleetUtilization _$FleetUtilizationFromJson(Map<String, dynamic> json) {
  return FleetUtilization(
    activeGameSessionCount: json['ActiveGameSessionCount'] as int,
    activeServerProcessCount: json['ActiveServerProcessCount'] as int,
    currentPlayerSessionCount: json['CurrentPlayerSessionCount'] as int,
    fleetId: json['FleetId'] as String,
    maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int,
  );
}

GameProperty _$GamePropertyFromJson(Map<String, dynamic> json) {
  return GameProperty(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$GamePropertyToJson(GameProperty instance) {
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

GameServer _$GameServerFromJson(Map<String, dynamic> json) {
  return GameServer(
    claimStatus: _$enumDecodeNullable(
        _$GameServerClaimStatusEnumMap, json['ClaimStatus']),
    connectionInfo: json['ConnectionInfo'] as String,
    customSortKey: json['CustomSortKey'] as String,
    gameServerData: json['GameServerData'] as String,
    gameServerGroupArn: json['GameServerGroupArn'] as String,
    gameServerGroupName: json['GameServerGroupName'] as String,
    gameServerId: json['GameServerId'] as String,
    instanceId: json['InstanceId'] as String,
    lastClaimTime: unixTimestampFromJson(json['LastClaimTime']),
    lastHealthCheckTime: unixTimestampFromJson(json['LastHealthCheckTime']),
    registrationTime: unixTimestampFromJson(json['RegistrationTime']),
    utilizationStatus: _$enumDecodeNullable(
        _$GameServerUtilizationStatusEnumMap, json['UtilizationStatus']),
  );
}

const _$GameServerClaimStatusEnumMap = {
  GameServerClaimStatus.claimed: 'CLAIMED',
};

const _$GameServerUtilizationStatusEnumMap = {
  GameServerUtilizationStatus.available: 'AVAILABLE',
  GameServerUtilizationStatus.utilized: 'UTILIZED',
};

GameServerGroup _$GameServerGroupFromJson(Map<String, dynamic> json) {
  return GameServerGroup(
    autoScalingGroupArn: json['AutoScalingGroupArn'] as String,
    balancingStrategy: _$enumDecodeNullable(
        _$BalancingStrategyEnumMap, json['BalancingStrategy']),
    creationTime: unixTimestampFromJson(json['CreationTime']),
    gameServerGroupArn: json['GameServerGroupArn'] as String,
    gameServerGroupName: json['GameServerGroupName'] as String,
    gameServerProtectionPolicy: _$enumDecodeNullable(
        _$GameServerProtectionPolicyEnumMap,
        json['GameServerProtectionPolicy']),
    instanceDefinitions: (json['InstanceDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    roleArn: json['RoleArn'] as String,
    status:
        _$enumDecodeNullable(_$GameServerGroupStatusEnumMap, json['Status']),
    statusReason: json['StatusReason'] as String,
    suspendedActions:
        (json['SuspendedActions'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$GameServerGroupStatusEnumMap = {
  GameServerGroupStatus.$new: 'NEW',
  GameServerGroupStatus.activating: 'ACTIVATING',
  GameServerGroupStatus.active: 'ACTIVE',
  GameServerGroupStatus.deleteScheduled: 'DELETE_SCHEDULED',
  GameServerGroupStatus.deleting: 'DELETING',
  GameServerGroupStatus.deleted: 'DELETED',
  GameServerGroupStatus.error: 'ERROR',
};

Map<String, dynamic> _$GameServerGroupAutoScalingPolicyToJson(
    GameServerGroupAutoScalingPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetTrackingConfiguration',
      instance.targetTrackingConfiguration?.toJson());
  writeNotNull('EstimatedInstanceWarmup', instance.estimatedInstanceWarmup);
  return val;
}

GameSession _$GameSessionFromJson(Map<String, dynamic> json) {
  return GameSession(
    creationTime: unixTimestampFromJson(json['CreationTime']),
    creatorId: json['CreatorId'] as String,
    currentPlayerSessionCount: json['CurrentPlayerSessionCount'] as int,
    dnsName: json['DnsName'] as String,
    fleetArn: json['FleetArn'] as String,
    fleetId: json['FleetId'] as String,
    gameProperties: (json['GameProperties'] as List)
        ?.map((e) =>
            e == null ? null : GameProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gameSessionData: json['GameSessionData'] as String,
    gameSessionId: json['GameSessionId'] as String,
    ipAddress: json['IpAddress'] as String,
    matchmakerData: json['MatchmakerData'] as String,
    maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int,
    name: json['Name'] as String,
    playerSessionCreationPolicy: _$enumDecodeNullable(
        _$PlayerSessionCreationPolicyEnumMap,
        json['PlayerSessionCreationPolicy']),
    port: json['Port'] as int,
    status: _$enumDecodeNullable(_$GameSessionStatusEnumMap, json['Status']),
    statusReason: _$enumDecodeNullable(
        _$GameSessionStatusReasonEnumMap, json['StatusReason']),
    terminationTime: unixTimestampFromJson(json['TerminationTime']),
  );
}

const _$PlayerSessionCreationPolicyEnumMap = {
  PlayerSessionCreationPolicy.acceptAll: 'ACCEPT_ALL',
  PlayerSessionCreationPolicy.denyAll: 'DENY_ALL',
};

const _$GameSessionStatusEnumMap = {
  GameSessionStatus.active: 'ACTIVE',
  GameSessionStatus.activating: 'ACTIVATING',
  GameSessionStatus.terminated: 'TERMINATED',
  GameSessionStatus.terminating: 'TERMINATING',
  GameSessionStatus.error: 'ERROR',
};

const _$GameSessionStatusReasonEnumMap = {
  GameSessionStatusReason.interrupted: 'INTERRUPTED',
};

GameSessionConnectionInfo _$GameSessionConnectionInfoFromJson(
    Map<String, dynamic> json) {
  return GameSessionConnectionInfo(
    dnsName: json['DnsName'] as String,
    gameSessionArn: json['GameSessionArn'] as String,
    ipAddress: json['IpAddress'] as String,
    matchedPlayerSessions: (json['MatchedPlayerSessions'] as List)
        ?.map((e) => e == null
            ? null
            : MatchedPlayerSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    port: json['Port'] as int,
  );
}

GameSessionDetail _$GameSessionDetailFromJson(Map<String, dynamic> json) {
  return GameSessionDetail(
    gameSession: json['GameSession'] == null
        ? null
        : GameSession.fromJson(json['GameSession'] as Map<String, dynamic>),
    protectionPolicy: _$enumDecodeNullable(
        _$ProtectionPolicyEnumMap, json['ProtectionPolicy']),
  );
}

GameSessionPlacement _$GameSessionPlacementFromJson(Map<String, dynamic> json) {
  return GameSessionPlacement(
    dnsName: json['DnsName'] as String,
    endTime: unixTimestampFromJson(json['EndTime']),
    gameProperties: (json['GameProperties'] as List)
        ?.map((e) =>
            e == null ? null : GameProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gameSessionArn: json['GameSessionArn'] as String,
    gameSessionData: json['GameSessionData'] as String,
    gameSessionId: json['GameSessionId'] as String,
    gameSessionName: json['GameSessionName'] as String,
    gameSessionQueueName: json['GameSessionQueueName'] as String,
    gameSessionRegion: json['GameSessionRegion'] as String,
    ipAddress: json['IpAddress'] as String,
    matchmakerData: json['MatchmakerData'] as String,
    maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int,
    placedPlayerSessions: (json['PlacedPlayerSessions'] as List)
        ?.map((e) => e == null
            ? null
            : PlacedPlayerSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    placementId: json['PlacementId'] as String,
    playerLatencies: (json['PlayerLatencies'] as List)
        ?.map((e) => e == null
            ? null
            : PlayerLatency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    port: json['Port'] as int,
    startTime: unixTimestampFromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$GameSessionPlacementStateEnumMap, json['Status']),
  );
}

const _$GameSessionPlacementStateEnumMap = {
  GameSessionPlacementState.pending: 'PENDING',
  GameSessionPlacementState.fulfilled: 'FULFILLED',
  GameSessionPlacementState.cancelled: 'CANCELLED',
  GameSessionPlacementState.timedOut: 'TIMED_OUT',
  GameSessionPlacementState.failed: 'FAILED',
};

GameSessionQueue _$GameSessionQueueFromJson(Map<String, dynamic> json) {
  return GameSessionQueue(
    destinations: (json['Destinations'] as List)
        ?.map((e) => e == null
            ? null
            : GameSessionQueueDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gameSessionQueueArn: json['GameSessionQueueArn'] as String,
    name: json['Name'] as String,
    playerLatencyPolicies: (json['PlayerLatencyPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : PlayerLatencyPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeoutInSeconds: json['TimeoutInSeconds'] as int,
  );
}

GameSessionQueueDestination _$GameSessionQueueDestinationFromJson(
    Map<String, dynamic> json) {
  return GameSessionQueueDestination(
    destinationArn: json['DestinationArn'] as String,
  );
}

Map<String, dynamic> _$GameSessionQueueDestinationToJson(
    GameSessionQueueDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationArn', instance.destinationArn);
  return val;
}

Map<String, dynamic> _$GetGameSessionLogUrlInputToJson(
    GetGameSessionLogUrlInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionId', instance.gameSessionId);
  return val;
}

GetGameSessionLogUrlOutput _$GetGameSessionLogUrlOutputFromJson(
    Map<String, dynamic> json) {
  return GetGameSessionLogUrlOutput(
    preSignedUrl: json['PreSignedUrl'] as String,
  );
}

Map<String, dynamic> _$GetInstanceAccessInputToJson(
    GetInstanceAccessInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('InstanceId', instance.instanceId);
  return val;
}

GetInstanceAccessOutput _$GetInstanceAccessOutputFromJson(
    Map<String, dynamic> json) {
  return GetInstanceAccessOutput(
    instanceAccess: json['InstanceAccess'] == null
        ? null
        : InstanceAccess.fromJson(
            json['InstanceAccess'] as Map<String, dynamic>),
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    creationTime: unixTimestampFromJson(json['CreationTime']),
    dnsName: json['DnsName'] as String,
    fleetId: json['FleetId'] as String,
    instanceId: json['InstanceId'] as String,
    ipAddress: json['IpAddress'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    status: _$enumDecodeNullable(_$InstanceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$EC2InstanceTypeEnumMap, json['Type']),
  );
}

const _$InstanceStatusEnumMap = {
  InstanceStatus.pending: 'PENDING',
  InstanceStatus.active: 'ACTIVE',
  InstanceStatus.terminating: 'TERMINATING',
};

InstanceAccess _$InstanceAccessFromJson(Map<String, dynamic> json) {
  return InstanceAccess(
    credentials: json['Credentials'] == null
        ? null
        : InstanceCredentials.fromJson(
            json['Credentials'] as Map<String, dynamic>),
    fleetId: json['FleetId'] as String,
    instanceId: json['InstanceId'] as String,
    ipAddress: json['IpAddress'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
  );
}

InstanceCredentials _$InstanceCredentialsFromJson(Map<String, dynamic> json) {
  return InstanceCredentials(
    secret: json['Secret'] as String,
    userName: json['UserName'] as String,
  );
}

InstanceDefinition _$InstanceDefinitionFromJson(Map<String, dynamic> json) {
  return InstanceDefinition(
    instanceType: _$enumDecodeNullable(
        _$GameServerGroupInstanceTypeEnumMap, json['InstanceType']),
    weightedCapacity: json['WeightedCapacity'] as String,
  );
}

Map<String, dynamic> _$InstanceDefinitionToJson(InstanceDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceType',
      _$GameServerGroupInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('WeightedCapacity', instance.weightedCapacity);
  return val;
}

const _$GameServerGroupInstanceTypeEnumMap = {
  GameServerGroupInstanceType.c4Large: 'c4.large',
  GameServerGroupInstanceType.c4Xlarge: 'c4.xlarge',
  GameServerGroupInstanceType.c4_2xlarge: 'c4.2xlarge',
  GameServerGroupInstanceType.c4_4xlarge: 'c4.4xlarge',
  GameServerGroupInstanceType.c4_8xlarge: 'c4.8xlarge',
  GameServerGroupInstanceType.c5Large: 'c5.large',
  GameServerGroupInstanceType.c5Xlarge: 'c5.xlarge',
  GameServerGroupInstanceType.c5_2xlarge: 'c5.2xlarge',
  GameServerGroupInstanceType.c5_4xlarge: 'c5.4xlarge',
  GameServerGroupInstanceType.c5_9xlarge: 'c5.9xlarge',
  GameServerGroupInstanceType.c5_12xlarge: 'c5.12xlarge',
  GameServerGroupInstanceType.c5_18xlarge: 'c5.18xlarge',
  GameServerGroupInstanceType.c5_24xlarge: 'c5.24xlarge',
  GameServerGroupInstanceType.r4Large: 'r4.large',
  GameServerGroupInstanceType.r4Xlarge: 'r4.xlarge',
  GameServerGroupInstanceType.r4_2xlarge: 'r4.2xlarge',
  GameServerGroupInstanceType.r4_4xlarge: 'r4.4xlarge',
  GameServerGroupInstanceType.r4_8xlarge: 'r4.8xlarge',
  GameServerGroupInstanceType.r4_16xlarge: 'r4.16xlarge',
  GameServerGroupInstanceType.r5Large: 'r5.large',
  GameServerGroupInstanceType.r5Xlarge: 'r5.xlarge',
  GameServerGroupInstanceType.r5_2xlarge: 'r5.2xlarge',
  GameServerGroupInstanceType.r5_4xlarge: 'r5.4xlarge',
  GameServerGroupInstanceType.r5_8xlarge: 'r5.8xlarge',
  GameServerGroupInstanceType.r5_12xlarge: 'r5.12xlarge',
  GameServerGroupInstanceType.r5_16xlarge: 'r5.16xlarge',
  GameServerGroupInstanceType.r5_24xlarge: 'r5.24xlarge',
  GameServerGroupInstanceType.m4Large: 'm4.large',
  GameServerGroupInstanceType.m4Xlarge: 'm4.xlarge',
  GameServerGroupInstanceType.m4_2xlarge: 'm4.2xlarge',
  GameServerGroupInstanceType.m4_4xlarge: 'm4.4xlarge',
  GameServerGroupInstanceType.m4_10xlarge: 'm4.10xlarge',
  GameServerGroupInstanceType.m5Large: 'm5.large',
  GameServerGroupInstanceType.m5Xlarge: 'm5.xlarge',
  GameServerGroupInstanceType.m5_2xlarge: 'm5.2xlarge',
  GameServerGroupInstanceType.m5_4xlarge: 'm5.4xlarge',
  GameServerGroupInstanceType.m5_8xlarge: 'm5.8xlarge',
  GameServerGroupInstanceType.m5_12xlarge: 'm5.12xlarge',
  GameServerGroupInstanceType.m5_16xlarge: 'm5.16xlarge',
  GameServerGroupInstanceType.m5_24xlarge: 'm5.24xlarge',
};

IpPermission _$IpPermissionFromJson(Map<String, dynamic> json) {
  return IpPermission(
    fromPort: json['FromPort'] as int,
    ipRange: json['IpRange'] as String,
    protocol: _$enumDecodeNullable(_$IpProtocolEnumMap, json['Protocol']),
    toPort: json['ToPort'] as int,
  );
}

Map<String, dynamic> _$IpPermissionToJson(IpPermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromPort', instance.fromPort);
  writeNotNull('IpRange', instance.ipRange);
  writeNotNull('Protocol', _$IpProtocolEnumMap[instance.protocol]);
  writeNotNull('ToPort', instance.toPort);
  return val;
}

const _$IpProtocolEnumMap = {
  IpProtocol.tcp: 'TCP',
  IpProtocol.udp: 'UDP',
};

Map<String, dynamic> _$LaunchTemplateSpecificationToJson(
    LaunchTemplateSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LaunchTemplateId', instance.launchTemplateId);
  writeNotNull('LaunchTemplateName', instance.launchTemplateName);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$ListAliasesInputToJson(ListAliasesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Name', instance.name);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('RoutingStrategyType',
      _$RoutingStrategyTypeEnumMap[instance.routingStrategyType]);
  return val;
}

const _$RoutingStrategyTypeEnumMap = {
  RoutingStrategyType.simple: 'SIMPLE',
  RoutingStrategyType.terminal: 'TERMINAL',
};

ListAliasesOutput _$ListAliasesOutputFromJson(Map<String, dynamic> json) {
  return ListAliasesOutput(
    aliases: (json['Aliases'] as List)
        ?.map(
            (e) => e == null ? null : Alias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListBuildsInputToJson(ListBuildsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Status', _$BuildStatusEnumMap[instance.status]);
  return val;
}

ListBuildsOutput _$ListBuildsOutputFromJson(Map<String, dynamic> json) {
  return ListBuildsOutput(
    builds: (json['Builds'] as List)
        ?.map(
            (e) => e == null ? null : Build.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListFleetsInputToJson(ListFleetsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BuildId', instance.buildId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ScriptId', instance.scriptId);
  return val;
}

ListFleetsOutput _$ListFleetsOutputFromJson(Map<String, dynamic> json) {
  return ListFleetsOutput(
    fleetIds: (json['FleetIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListGameServerGroupsInputToJson(
    ListGameServerGroupsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListGameServerGroupsOutput _$ListGameServerGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListGameServerGroupsOutput(
    gameServerGroups: (json['GameServerGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GameServerGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListGameServersInputToJson(
    ListGameServersInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'ASCENDING',
  SortOrder.descending: 'DESCENDING',
};

ListGameServersOutput _$ListGameServersOutputFromJson(
    Map<String, dynamic> json) {
  return ListGameServersOutput(
    gameServers: (json['GameServers'] as List)
        ?.map((e) =>
            e == null ? null : GameServer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListScriptsInputToJson(ListScriptsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListScriptsOutput _$ListScriptsOutputFromJson(Map<String, dynamic> json) {
  return ListScriptsOutput(
    nextToken: json['NextToken'] as String,
    scripts: (json['Scripts'] as List)
        ?.map((e) =>
            e == null ? null : Script.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MatchedPlayerSession _$MatchedPlayerSessionFromJson(Map<String, dynamic> json) {
  return MatchedPlayerSession(
    playerId: json['PlayerId'] as String,
    playerSessionId: json['PlayerSessionId'] as String,
  );
}

MatchmakingConfiguration _$MatchmakingConfigurationFromJson(
    Map<String, dynamic> json) {
  return MatchmakingConfiguration(
    acceptanceRequired: json['AcceptanceRequired'] as bool,
    acceptanceTimeoutSeconds: json['AcceptanceTimeoutSeconds'] as int,
    additionalPlayerCount: json['AdditionalPlayerCount'] as int,
    backfillMode:
        _$enumDecodeNullable(_$BackfillModeEnumMap, json['BackfillMode']),
    configurationArn: json['ConfigurationArn'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    customEventData: json['CustomEventData'] as String,
    description: json['Description'] as String,
    gameProperties: (json['GameProperties'] as List)
        ?.map((e) =>
            e == null ? null : GameProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gameSessionData: json['GameSessionData'] as String,
    gameSessionQueueArns: (json['GameSessionQueueArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    name: json['Name'] as String,
    notificationTarget: json['NotificationTarget'] as String,
    requestTimeoutSeconds: json['RequestTimeoutSeconds'] as int,
    ruleSetArn: json['RuleSetArn'] as String,
    ruleSetName: json['RuleSetName'] as String,
  );
}

MatchmakingRuleSet _$MatchmakingRuleSetFromJson(Map<String, dynamic> json) {
  return MatchmakingRuleSet(
    ruleSetBody: json['RuleSetBody'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    ruleSetArn: json['RuleSetArn'] as String,
    ruleSetName: json['RuleSetName'] as String,
  );
}

MatchmakingTicket _$MatchmakingTicketFromJson(Map<String, dynamic> json) {
  return MatchmakingTicket(
    configurationArn: json['ConfigurationArn'] as String,
    configurationName: json['ConfigurationName'] as String,
    endTime: unixTimestampFromJson(json['EndTime']),
    estimatedWaitTime: json['EstimatedWaitTime'] as int,
    gameSessionConnectionInfo: json['GameSessionConnectionInfo'] == null
        ? null
        : GameSessionConnectionInfo.fromJson(
            json['GameSessionConnectionInfo'] as Map<String, dynamic>),
    players: (json['Players'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTime: unixTimestampFromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MatchmakingConfigurationStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    statusReason: json['StatusReason'] as String,
    ticketId: json['TicketId'] as String,
  );
}

const _$MatchmakingConfigurationStatusEnumMap = {
  MatchmakingConfigurationStatus.cancelled: 'CANCELLED',
  MatchmakingConfigurationStatus.completed: 'COMPLETED',
  MatchmakingConfigurationStatus.failed: 'FAILED',
  MatchmakingConfigurationStatus.placing: 'PLACING',
  MatchmakingConfigurationStatus.queued: 'QUEUED',
  MatchmakingConfigurationStatus.requiresAcceptance: 'REQUIRES_ACCEPTANCE',
  MatchmakingConfigurationStatus.searching: 'SEARCHING',
  MatchmakingConfigurationStatus.timedOut: 'TIMED_OUT',
};

PlacedPlayerSession _$PlacedPlayerSessionFromJson(Map<String, dynamic> json) {
  return PlacedPlayerSession(
    playerId: json['PlayerId'] as String,
    playerSessionId: json['PlayerSessionId'] as String,
  );
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    latencyInMs: (json['LatencyInMs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    playerAttributes: (json['PlayerAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    playerId: json['PlayerId'] as String,
    team: json['Team'] as String,
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LatencyInMs', instance.latencyInMs);
  writeNotNull('PlayerAttributes',
      instance.playerAttributes?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('PlayerId', instance.playerId);
  writeNotNull('Team', instance.team);
  return val;
}

PlayerLatency _$PlayerLatencyFromJson(Map<String, dynamic> json) {
  return PlayerLatency(
    latencyInMilliseconds: (json['LatencyInMilliseconds'] as num)?.toDouble(),
    playerId: json['PlayerId'] as String,
    regionIdentifier: json['RegionIdentifier'] as String,
  );
}

Map<String, dynamic> _$PlayerLatencyToJson(PlayerLatency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LatencyInMilliseconds', instance.latencyInMilliseconds);
  writeNotNull('PlayerId', instance.playerId);
  writeNotNull('RegionIdentifier', instance.regionIdentifier);
  return val;
}

PlayerLatencyPolicy _$PlayerLatencyPolicyFromJson(Map<String, dynamic> json) {
  return PlayerLatencyPolicy(
    maximumIndividualPlayerLatencyMilliseconds:
        json['MaximumIndividualPlayerLatencyMilliseconds'] as int,
    policyDurationSeconds: json['PolicyDurationSeconds'] as int,
  );
}

Map<String, dynamic> _$PlayerLatencyPolicyToJson(PlayerLatencyPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaximumIndividualPlayerLatencyMilliseconds',
      instance.maximumIndividualPlayerLatencyMilliseconds);
  writeNotNull('PolicyDurationSeconds', instance.policyDurationSeconds);
  return val;
}

PlayerSession _$PlayerSessionFromJson(Map<String, dynamic> json) {
  return PlayerSession(
    creationTime: unixTimestampFromJson(json['CreationTime']),
    dnsName: json['DnsName'] as String,
    fleetArn: json['FleetArn'] as String,
    fleetId: json['FleetId'] as String,
    gameSessionId: json['GameSessionId'] as String,
    ipAddress: json['IpAddress'] as String,
    playerData: json['PlayerData'] as String,
    playerId: json['PlayerId'] as String,
    playerSessionId: json['PlayerSessionId'] as String,
    port: json['Port'] as int,
    status: _$enumDecodeNullable(_$PlayerSessionStatusEnumMap, json['Status']),
    terminationTime: unixTimestampFromJson(json['TerminationTime']),
  );
}

const _$PlayerSessionStatusEnumMap = {
  PlayerSessionStatus.reserved: 'RESERVED',
  PlayerSessionStatus.active: 'ACTIVE',
  PlayerSessionStatus.completed: 'COMPLETED',
  PlayerSessionStatus.timedout: 'TIMEDOUT',
};

Map<String, dynamic> _$PutScalingPolicyInputToJson(
    PutScalingPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('MetricName', _$MetricNameEnumMap[instance.metricName]);
  writeNotNull('Name', instance.name);
  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorTypeEnumMap[instance.comparisonOperator]);
  writeNotNull('EvaluationPeriods', instance.evaluationPeriods);
  writeNotNull('PolicyType', _$PolicyTypeEnumMap[instance.policyType]);
  writeNotNull('ScalingAdjustment', instance.scalingAdjustment);
  writeNotNull('ScalingAdjustmentType',
      _$ScalingAdjustmentTypeEnumMap[instance.scalingAdjustmentType]);
  writeNotNull('TargetConfiguration', instance.targetConfiguration?.toJson());
  writeNotNull('Threshold', instance.threshold);
  return val;
}

const _$MetricNameEnumMap = {
  MetricName.activatingGameSessions: 'ActivatingGameSessions',
  MetricName.activeGameSessions: 'ActiveGameSessions',
  MetricName.activeInstances: 'ActiveInstances',
  MetricName.availableGameSessions: 'AvailableGameSessions',
  MetricName.availablePlayerSessions: 'AvailablePlayerSessions',
  MetricName.currentPlayerSessions: 'CurrentPlayerSessions',
  MetricName.idleInstances: 'IdleInstances',
  MetricName.percentAvailableGameSessions: 'PercentAvailableGameSessions',
  MetricName.percentIdleInstances: 'PercentIdleInstances',
  MetricName.queueDepth: 'QueueDepth',
  MetricName.waitTime: 'WaitTime',
};

const _$ComparisonOperatorTypeEnumMap = {
  ComparisonOperatorType.greaterThanOrEqualToThreshold:
      'GreaterThanOrEqualToThreshold',
  ComparisonOperatorType.greaterThanThreshold: 'GreaterThanThreshold',
  ComparisonOperatorType.lessThanThreshold: 'LessThanThreshold',
  ComparisonOperatorType.lessThanOrEqualToThreshold:
      'LessThanOrEqualToThreshold',
};

const _$PolicyTypeEnumMap = {
  PolicyType.ruleBased: 'RuleBased',
  PolicyType.targetBased: 'TargetBased',
};

const _$ScalingAdjustmentTypeEnumMap = {
  ScalingAdjustmentType.changeInCapacity: 'ChangeInCapacity',
  ScalingAdjustmentType.exactCapacity: 'ExactCapacity',
  ScalingAdjustmentType.percentChangeInCapacity: 'PercentChangeInCapacity',
};

PutScalingPolicyOutput _$PutScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutScalingPolicyOutput(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$RegisterGameServerInputToJson(
    RegisterGameServerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('GameServerId', instance.gameServerId);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('ConnectionInfo', instance.connectionInfo);
  writeNotNull('CustomSortKey', instance.customSortKey);
  writeNotNull('GameServerData', instance.gameServerData);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

RegisterGameServerOutput _$RegisterGameServerOutputFromJson(
    Map<String, dynamic> json) {
  return RegisterGameServerOutput(
    gameServer: json['GameServer'] == null
        ? null
        : GameServer.fromJson(json['GameServer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RequestUploadCredentialsInputToJson(
    RequestUploadCredentialsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BuildId', instance.buildId);
  return val;
}

RequestUploadCredentialsOutput _$RequestUploadCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return RequestUploadCredentialsOutput(
    storageLocation: json['StorageLocation'] == null
        ? null
        : S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>),
    uploadCredentials: json['UploadCredentials'] == null
        ? null
        : AwsCredentials.fromJson(
            json['UploadCredentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResolveAliasInputToJson(ResolveAliasInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  return val;
}

ResolveAliasOutput _$ResolveAliasOutputFromJson(Map<String, dynamic> json) {
  return ResolveAliasOutput(
    fleetArn: json['FleetArn'] as String,
    fleetId: json['FleetId'] as String,
  );
}

ResourceCreationLimitPolicy _$ResourceCreationLimitPolicyFromJson(
    Map<String, dynamic> json) {
  return ResourceCreationLimitPolicy(
    newGameSessionsPerCreator: json['NewGameSessionsPerCreator'] as int,
    policyPeriodInMinutes: json['PolicyPeriodInMinutes'] as int,
  );
}

Map<String, dynamic> _$ResourceCreationLimitPolicyToJson(
    ResourceCreationLimitPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NewGameSessionsPerCreator', instance.newGameSessionsPerCreator);
  writeNotNull('PolicyPeriodInMinutes', instance.policyPeriodInMinutes);
  return val;
}

Map<String, dynamic> _$ResumeGameServerGroupInputToJson(
    ResumeGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('ResumeActions', instance.resumeActions);
  return val;
}

ResumeGameServerGroupOutput _$ResumeGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return ResumeGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
}

RoutingStrategy _$RoutingStrategyFromJson(Map<String, dynamic> json) {
  return RoutingStrategy(
    fleetId: json['FleetId'] as String,
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$RoutingStrategyTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$RoutingStrategyToJson(RoutingStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('Message', instance.message);
  writeNotNull('Type', _$RoutingStrategyTypeEnumMap[instance.type]);
  return val;
}

RuntimeConfiguration _$RuntimeConfigurationFromJson(Map<String, dynamic> json) {
  return RuntimeConfiguration(
    gameSessionActivationTimeoutSeconds:
        json['GameSessionActivationTimeoutSeconds'] as int,
    maxConcurrentGameSessionActivations:
        json['MaxConcurrentGameSessionActivations'] as int,
    serverProcesses: (json['ServerProcesses'] as List)
        ?.map((e) => e == null
            ? null
            : ServerProcess.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RuntimeConfigurationToJson(
    RuntimeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionActivationTimeoutSeconds',
      instance.gameSessionActivationTimeoutSeconds);
  writeNotNull('MaxConcurrentGameSessionActivations',
      instance.maxConcurrentGameSessionActivations);
  writeNotNull('ServerProcesses',
      instance.serverProcesses?.map((e) => e?.toJson())?.toList());
  return val;
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
    objectVersion: json['ObjectVersion'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  writeNotNull('ObjectVersion', instance.objectVersion);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

ScalingPolicy _$ScalingPolicyFromJson(Map<String, dynamic> json) {
  return ScalingPolicy(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorTypeEnumMap, json['ComparisonOperator']),
    evaluationPeriods: json['EvaluationPeriods'] as int,
    fleetId: json['FleetId'] as String,
    metricName: _$enumDecodeNullable(_$MetricNameEnumMap, json['MetricName']),
    name: json['Name'] as String,
    policyType: _$enumDecodeNullable(_$PolicyTypeEnumMap, json['PolicyType']),
    scalingAdjustment: json['ScalingAdjustment'] as int,
    scalingAdjustmentType: _$enumDecodeNullable(
        _$ScalingAdjustmentTypeEnumMap, json['ScalingAdjustmentType']),
    status: _$enumDecodeNullable(_$ScalingStatusTypeEnumMap, json['Status']),
    targetConfiguration: json['TargetConfiguration'] == null
        ? null
        : TargetConfiguration.fromJson(
            json['TargetConfiguration'] as Map<String, dynamic>),
    threshold: (json['Threshold'] as num)?.toDouble(),
  );
}

Script _$ScriptFromJson(Map<String, dynamic> json) {
  return Script(
    creationTime: unixTimestampFromJson(json['CreationTime']),
    name: json['Name'] as String,
    scriptArn: json['ScriptArn'] as String,
    scriptId: json['ScriptId'] as String,
    sizeOnDisk: json['SizeOnDisk'] as int,
    storageLocation: json['StorageLocation'] == null
        ? null
        : S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>),
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$SearchGameSessionsInputToJson(
    SearchGameSessionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  writeNotNull('FilterExpression', instance.filterExpression);
  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SortExpression', instance.sortExpression);
  return val;
}

SearchGameSessionsOutput _$SearchGameSessionsOutputFromJson(
    Map<String, dynamic> json) {
  return SearchGameSessionsOutput(
    gameSessions: (json['GameSessions'] as List)
        ?.map((e) =>
            e == null ? null : GameSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ServerProcess _$ServerProcessFromJson(Map<String, dynamic> json) {
  return ServerProcess(
    concurrentExecutions: json['ConcurrentExecutions'] as int,
    launchPath: json['LaunchPath'] as String,
    parameters: json['Parameters'] as String,
  );
}

Map<String, dynamic> _$ServerProcessToJson(ServerProcess instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConcurrentExecutions', instance.concurrentExecutions);
  writeNotNull('LaunchPath', instance.launchPath);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

Map<String, dynamic> _$StartFleetActionsInputToJson(
    StartFleetActionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions);
  writeNotNull('FleetId', instance.fleetId);
  return val;
}

StartFleetActionsOutput _$StartFleetActionsOutputFromJson(
    Map<String, dynamic> json) {
  return StartFleetActionsOutput();
}

Map<String, dynamic> _$StartGameSessionPlacementInputToJson(
    StartGameSessionPlacementInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionQueueName', instance.gameSessionQueueName);
  writeNotNull('MaximumPlayerSessionCount', instance.maximumPlayerSessionCount);
  writeNotNull('PlacementId', instance.placementId);
  writeNotNull('DesiredPlayerSessions',
      instance.desiredPlayerSessions?.map((e) => e?.toJson())?.toList());
  writeNotNull('GameProperties',
      instance.gameProperties?.map((e) => e?.toJson())?.toList());
  writeNotNull('GameSessionData', instance.gameSessionData);
  writeNotNull('GameSessionName', instance.gameSessionName);
  writeNotNull('PlayerLatencies',
      instance.playerLatencies?.map((e) => e?.toJson())?.toList());
  return val;
}

StartGameSessionPlacementOutput _$StartGameSessionPlacementOutputFromJson(
    Map<String, dynamic> json) {
  return StartGameSessionPlacementOutput(
    gameSessionPlacement: json['GameSessionPlacement'] == null
        ? null
        : GameSessionPlacement.fromJson(
            json['GameSessionPlacement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartMatchBackfillInputToJson(
    StartMatchBackfillInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationName', instance.configurationName);
  writeNotNull('GameSessionArn', instance.gameSessionArn);
  writeNotNull('Players', instance.players?.map((e) => e?.toJson())?.toList());
  writeNotNull('TicketId', instance.ticketId);
  return val;
}

StartMatchBackfillOutput _$StartMatchBackfillOutputFromJson(
    Map<String, dynamic> json) {
  return StartMatchBackfillOutput(
    matchmakingTicket: json['MatchmakingTicket'] == null
        ? null
        : MatchmakingTicket.fromJson(
            json['MatchmakingTicket'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartMatchmakingInputToJson(
    StartMatchmakingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationName', instance.configurationName);
  writeNotNull('Players', instance.players?.map((e) => e?.toJson())?.toList());
  writeNotNull('TicketId', instance.ticketId);
  return val;
}

StartMatchmakingOutput _$StartMatchmakingOutputFromJson(
    Map<String, dynamic> json) {
  return StartMatchmakingOutput(
    matchmakingTicket: json['MatchmakingTicket'] == null
        ? null
        : MatchmakingTicket.fromJson(
            json['MatchmakingTicket'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StopFleetActionsInputToJson(
    StopFleetActionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions);
  writeNotNull('FleetId', instance.fleetId);
  return val;
}

StopFleetActionsOutput _$StopFleetActionsOutputFromJson(
    Map<String, dynamic> json) {
  return StopFleetActionsOutput();
}

Map<String, dynamic> _$StopGameSessionPlacementInputToJson(
    StopGameSessionPlacementInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlacementId', instance.placementId);
  return val;
}

StopGameSessionPlacementOutput _$StopGameSessionPlacementOutputFromJson(
    Map<String, dynamic> json) {
  return StopGameSessionPlacementOutput(
    gameSessionPlacement: json['GameSessionPlacement'] == null
        ? null
        : GameSessionPlacement.fromJson(
            json['GameSessionPlacement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StopMatchmakingInputToJson(
    StopMatchmakingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TicketId', instance.ticketId);
  return val;
}

StopMatchmakingOutput _$StopMatchmakingOutputFromJson(
    Map<String, dynamic> json) {
  return StopMatchmakingOutput();
}

Map<String, dynamic> _$SuspendGameServerGroupInputToJson(
    SuspendGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('SuspendActions', instance.suspendActions);
  return val;
}

SuspendGameServerGroupOutput _$SuspendGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return SuspendGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TargetConfiguration _$TargetConfigurationFromJson(Map<String, dynamic> json) {
  return TargetConfiguration(
    targetValue: (json['TargetValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TargetConfigurationToJson(TargetConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetValue', instance.targetValue);
  return val;
}

Map<String, dynamic> _$TargetTrackingConfigurationToJson(
    TargetTrackingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetValue', instance.targetValue);
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateAliasInputToJson(UpdateAliasInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasId', instance.aliasId);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('RoutingStrategy', instance.routingStrategy?.toJson());
  return val;
}

UpdateAliasOutput _$UpdateAliasOutputFromJson(Map<String, dynamic> json) {
  return UpdateAliasOutput(
    alias: json['Alias'] == null
        ? null
        : Alias.fromJson(json['Alias'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateBuildInputToJson(UpdateBuildInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BuildId', instance.buildId);
  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

UpdateBuildOutput _$UpdateBuildOutputFromJson(Map<String, dynamic> json) {
  return UpdateBuildOutput(
    build: json['Build'] == null
        ? null
        : Build.fromJson(json['Build'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateFleetAttributesInputToJson(
    UpdateFleetAttributesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('Description', instance.description);
  writeNotNull('MetricGroups', instance.metricGroups);
  writeNotNull('Name', instance.name);
  writeNotNull('NewGameSessionProtectionPolicy',
      _$ProtectionPolicyEnumMap[instance.newGameSessionProtectionPolicy]);
  writeNotNull('ResourceCreationLimitPolicy',
      instance.resourceCreationLimitPolicy?.toJson());
  return val;
}

UpdateFleetAttributesOutput _$UpdateFleetAttributesOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateFleetAttributesOutput(
    fleetId: json['FleetId'] as String,
  );
}

Map<String, dynamic> _$UpdateFleetCapacityInputToJson(
    UpdateFleetCapacityInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('DesiredInstances', instance.desiredInstances);
  writeNotNull('MaxSize', instance.maxSize);
  writeNotNull('MinSize', instance.minSize);
  return val;
}

UpdateFleetCapacityOutput _$UpdateFleetCapacityOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateFleetCapacityOutput(
    fleetId: json['FleetId'] as String,
  );
}

Map<String, dynamic> _$UpdateFleetPortSettingsInputToJson(
    UpdateFleetPortSettingsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull(
      'InboundPermissionAuthorizations',
      instance.inboundPermissionAuthorizations
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('InboundPermissionRevocations',
      instance.inboundPermissionRevocations?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateFleetPortSettingsOutput _$UpdateFleetPortSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateFleetPortSettingsOutput(
    fleetId: json['FleetId'] as String,
  );
}

Map<String, dynamic> _$UpdateGameServerGroupInputToJson(
    UpdateGameServerGroupInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('BalancingStrategy',
      _$BalancingStrategyEnumMap[instance.balancingStrategy]);
  writeNotNull('GameServerProtectionPolicy',
      _$GameServerProtectionPolicyEnumMap[instance.gameServerProtectionPolicy]);
  writeNotNull('InstanceDefinitions',
      instance.instanceDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

UpdateGameServerGroupOutput _$UpdateGameServerGroupOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGameServerGroupOutput(
    gameServerGroup: json['GameServerGroup'] == null
        ? null
        : GameServerGroup.fromJson(
            json['GameServerGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGameServerInputToJson(
    UpdateGameServerInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameServerGroupName', instance.gameServerGroupName);
  writeNotNull('GameServerId', instance.gameServerId);
  writeNotNull('CustomSortKey', instance.customSortKey);
  writeNotNull('GameServerData', instance.gameServerData);
  writeNotNull(
      'HealthCheck', _$GameServerHealthCheckEnumMap[instance.healthCheck]);
  writeNotNull('UtilizationStatus',
      _$GameServerUtilizationStatusEnumMap[instance.utilizationStatus]);
  return val;
}

const _$GameServerHealthCheckEnumMap = {
  GameServerHealthCheck.healthy: 'HEALTHY',
};

UpdateGameServerOutput _$UpdateGameServerOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGameServerOutput(
    gameServer: json['GameServer'] == null
        ? null
        : GameServer.fromJson(json['GameServer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGameSessionInputToJson(
    UpdateGameSessionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GameSessionId', instance.gameSessionId);
  writeNotNull('MaximumPlayerSessionCount', instance.maximumPlayerSessionCount);
  writeNotNull('Name', instance.name);
  writeNotNull(
      'PlayerSessionCreationPolicy',
      _$PlayerSessionCreationPolicyEnumMap[
          instance.playerSessionCreationPolicy]);
  writeNotNull(
      'ProtectionPolicy', _$ProtectionPolicyEnumMap[instance.protectionPolicy]);
  return val;
}

UpdateGameSessionOutput _$UpdateGameSessionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGameSessionOutput(
    gameSession: json['GameSession'] == null
        ? null
        : GameSession.fromJson(json['GameSession'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGameSessionQueueInputToJson(
    UpdateGameSessionQueueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull(
      'Destinations', instance.destinations?.map((e) => e?.toJson())?.toList());
  writeNotNull('PlayerLatencyPolicies',
      instance.playerLatencyPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('TimeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

UpdateGameSessionQueueOutput _$UpdateGameSessionQueueOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGameSessionQueueOutput(
    gameSessionQueue: json['GameSessionQueue'] == null
        ? null
        : GameSessionQueue.fromJson(
            json['GameSessionQueue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateMatchmakingConfigurationInputToJson(
    UpdateMatchmakingConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AcceptanceRequired', instance.acceptanceRequired);
  writeNotNull('AcceptanceTimeoutSeconds', instance.acceptanceTimeoutSeconds);
  writeNotNull('AdditionalPlayerCount', instance.additionalPlayerCount);
  writeNotNull('BackfillMode', _$BackfillModeEnumMap[instance.backfillMode]);
  writeNotNull('CustomEventData', instance.customEventData);
  writeNotNull('Description', instance.description);
  writeNotNull('GameProperties',
      instance.gameProperties?.map((e) => e?.toJson())?.toList());
  writeNotNull('GameSessionData', instance.gameSessionData);
  writeNotNull('GameSessionQueueArns', instance.gameSessionQueueArns);
  writeNotNull('NotificationTarget', instance.notificationTarget);
  writeNotNull('RequestTimeoutSeconds', instance.requestTimeoutSeconds);
  writeNotNull('RuleSetName', instance.ruleSetName);
  return val;
}

UpdateMatchmakingConfigurationOutput
    _$UpdateMatchmakingConfigurationOutputFromJson(Map<String, dynamic> json) {
  return UpdateMatchmakingConfigurationOutput(
    configuration: json['Configuration'] == null
        ? null
        : MatchmakingConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateRuntimeConfigurationInputToJson(
    UpdateRuntimeConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetId', instance.fleetId);
  writeNotNull('RuntimeConfiguration', instance.runtimeConfiguration?.toJson());
  return val;
}

UpdateRuntimeConfigurationOutput _$UpdateRuntimeConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateRuntimeConfigurationOutput(
    runtimeConfiguration: json['RuntimeConfiguration'] == null
        ? null
        : RuntimeConfiguration.fromJson(
            json['RuntimeConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateScriptInputToJson(UpdateScriptInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScriptId', instance.scriptId);
  writeNotNull('Name', instance.name);
  writeNotNull('StorageLocation', instance.storageLocation?.toJson());
  writeNotNull('Version', instance.version);
  writeNotNull('ZipFile', const Uint8ListConverter().toJson(instance.zipFile));
  return val;
}

UpdateScriptOutput _$UpdateScriptOutputFromJson(Map<String, dynamic> json) {
  return UpdateScriptOutput(
    script: json['Script'] == null
        ? null
        : Script.fromJson(json['Script'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ValidateMatchmakingRuleSetInputToJson(
    ValidateMatchmakingRuleSetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleSetBody', instance.ruleSetBody);
  return val;
}

ValidateMatchmakingRuleSetOutput _$ValidateMatchmakingRuleSetOutputFromJson(
    Map<String, dynamic> json) {
  return ValidateMatchmakingRuleSetOutput(
    valid: json['Valid'] as bool,
  );
}

VpcPeeringAuthorization _$VpcPeeringAuthorizationFromJson(
    Map<String, dynamic> json) {
  return VpcPeeringAuthorization(
    creationTime: unixTimestampFromJson(json['CreationTime']),
    expirationTime: unixTimestampFromJson(json['ExpirationTime']),
    gameLiftAwsAccountId: json['GameLiftAwsAccountId'] as String,
    peerVpcAwsAccountId: json['PeerVpcAwsAccountId'] as String,
    peerVpcId: json['PeerVpcId'] as String,
  );
}

VpcPeeringConnection _$VpcPeeringConnectionFromJson(Map<String, dynamic> json) {
  return VpcPeeringConnection(
    fleetArn: json['FleetArn'] as String,
    fleetId: json['FleetId'] as String,
    gameLiftVpcId: json['GameLiftVpcId'] as String,
    ipV4CidrBlock: json['IpV4CidrBlock'] as String,
    peerVpcId: json['PeerVpcId'] as String,
    status: json['Status'] == null
        ? null
        : VpcPeeringConnectionStatus.fromJson(
            json['Status'] as Map<String, dynamic>),
    vpcPeeringConnectionId: json['VpcPeeringConnectionId'] as String,
  );
}

VpcPeeringConnectionStatus _$VpcPeeringConnectionStatusFromJson(
    Map<String, dynamic> json) {
  return VpcPeeringConnectionStatus(
    code: json['Code'] as String,
    message: json['Message'] as String,
  );
}
