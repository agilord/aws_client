// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events-2015-10-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ActivateEventSourceRequestToJson(
    ActivateEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

AwsVpcConfiguration _$AwsVpcConfigurationFromJson(Map<String, dynamic> json) {
  return AwsVpcConfiguration(
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
    assignPublicIp:
        _$enumDecodeNullable(_$AssignPublicIpEnumMap, json['AssignPublicIp']),
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsVpcConfigurationToJson(AwsVpcConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subnets', instance.subnets);
  writeNotNull(
      'AssignPublicIp', _$AssignPublicIpEnumMap[instance.assignPublicIp]);
  writeNotNull('SecurityGroups', instance.securityGroups);
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

const _$AssignPublicIpEnumMap = {
  AssignPublicIp.enabled: 'ENABLED',
  AssignPublicIp.disabled: 'DISABLED',
};

BatchArrayProperties _$BatchArrayPropertiesFromJson(Map<String, dynamic> json) {
  return BatchArrayProperties(
    size: json['Size'] as int,
  );
}

Map<String, dynamic> _$BatchArrayPropertiesToJson(
    BatchArrayProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Size', instance.size);
  return val;
}

BatchParameters _$BatchParametersFromJson(Map<String, dynamic> json) {
  return BatchParameters(
    jobDefinition: json['JobDefinition'] as String,
    jobName: json['JobName'] as String,
    arrayProperties: json['ArrayProperties'] == null
        ? null
        : BatchArrayProperties.fromJson(
            json['ArrayProperties'] as Map<String, dynamic>),
    retryStrategy: json['RetryStrategy'] == null
        ? null
        : BatchRetryStrategy.fromJson(
            json['RetryStrategy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchParametersToJson(BatchParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobDefinition', instance.jobDefinition);
  writeNotNull('JobName', instance.jobName);
  writeNotNull('ArrayProperties', instance.arrayProperties?.toJson());
  writeNotNull('RetryStrategy', instance.retryStrategy?.toJson());
  return val;
}

BatchRetryStrategy _$BatchRetryStrategyFromJson(Map<String, dynamic> json) {
  return BatchRetryStrategy(
    attempts: json['Attempts'] as int,
  );
}

Map<String, dynamic> _$BatchRetryStrategyToJson(BatchRetryStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attempts', instance.attempts);
  return val;
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', instance.type);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$CreateEventBusRequestToJson(
    CreateEventBusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('EventSourceName', instance.eventSourceName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateEventBusResponse _$CreateEventBusResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEventBusResponse(
    eventBusArn: json['EventBusArn'] as String,
  );
}

Map<String, dynamic> _$CreatePartnerEventSourceRequestToJson(
    CreatePartnerEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Account', instance.account);
  writeNotNull('Name', instance.name);
  return val;
}

CreatePartnerEventSourceResponse _$CreatePartnerEventSourceResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePartnerEventSourceResponse(
    eventSourceArn: json['EventSourceArn'] as String,
  );
}

Map<String, dynamic> _$DeactivateEventSourceRequestToJson(
    DeactivateEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$DeleteEventBusRequestToJson(
    DeleteEventBusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$DeletePartnerEventSourceRequestToJson(
    DeletePartnerEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Account', instance.account);
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$DeleteRuleRequestToJson(DeleteRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Force', instance.force);
  return val;
}

Map<String, dynamic> _$DescribeEventBusRequestToJson(
    DescribeEventBusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DescribeEventBusResponse _$DescribeEventBusResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventBusResponse(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
    policy: json['Policy'] as String,
  );
}

Map<String, dynamic> _$DescribeEventSourceRequestToJson(
    DescribeEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DescribeEventSourceResponse _$DescribeEventSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventSourceResponse(
    arn: json['Arn'] as String,
    createdBy: json['CreatedBy'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    expirationTime: unixTimestampFromJson(json['ExpirationTime']),
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EventSourceStateEnumMap, json['State']),
  );
}

const _$EventSourceStateEnumMap = {
  EventSourceState.pending: 'PENDING',
  EventSourceState.active: 'ACTIVE',
  EventSourceState.deleted: 'DELETED',
};

Map<String, dynamic> _$DescribePartnerEventSourceRequestToJson(
    DescribePartnerEventSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DescribePartnerEventSourceResponse _$DescribePartnerEventSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePartnerEventSourceResponse(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DescribeRuleRequestToJson(DescribeRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

DescribeRuleResponse _$DescribeRuleResponseFromJson(Map<String, dynamic> json) {
  return DescribeRuleResponse(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    eventBusName: json['EventBusName'] as String,
    eventPattern: json['EventPattern'] as String,
    managedBy: json['ManagedBy'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    scheduleExpression: json['ScheduleExpression'] as String,
    state: _$enumDecodeNullable(_$RuleStateEnumMap, json['State']),
  );
}

const _$RuleStateEnumMap = {
  RuleState.enabled: 'ENABLED',
  RuleState.disabled: 'DISABLED',
};

Map<String, dynamic> _$DisableRuleRequestToJson(DisableRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

EcsParameters _$EcsParametersFromJson(Map<String, dynamic> json) {
  return EcsParameters(
    taskDefinitionArn: json['TaskDefinitionArn'] as String,
    group: json['Group'] as String,
    launchType: _$enumDecodeNullable(_$LaunchTypeEnumMap, json['LaunchType']),
    networkConfiguration: json['NetworkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['NetworkConfiguration'] as Map<String, dynamic>),
    platformVersion: json['PlatformVersion'] as String,
    taskCount: json['TaskCount'] as int,
  );
}

Map<String, dynamic> _$EcsParametersToJson(EcsParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaskDefinitionArn', instance.taskDefinitionArn);
  writeNotNull('Group', instance.group);
  writeNotNull('LaunchType', _$LaunchTypeEnumMap[instance.launchType]);
  writeNotNull('NetworkConfiguration', instance.networkConfiguration?.toJson());
  writeNotNull('PlatformVersion', instance.platformVersion);
  writeNotNull('TaskCount', instance.taskCount);
  return val;
}

const _$LaunchTypeEnumMap = {
  LaunchType.ec2: 'EC2',
  LaunchType.fargate: 'FARGATE',
};

Map<String, dynamic> _$EnableRuleRequestToJson(EnableRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

EventBus _$EventBusFromJson(Map<String, dynamic> json) {
  return EventBus(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
    policy: json['Policy'] as String,
  );
}

EventSource _$EventSourceFromJson(Map<String, dynamic> json) {
  return EventSource(
    arn: json['Arn'] as String,
    createdBy: json['CreatedBy'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    expirationTime: unixTimestampFromJson(json['ExpirationTime']),
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EventSourceStateEnumMap, json['State']),
  );
}

InputTransformer _$InputTransformerFromJson(Map<String, dynamic> json) {
  return InputTransformer(
    inputTemplate: json['InputTemplate'] as String,
    inputPathsMap: (json['InputPathsMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$InputTransformerToJson(InputTransformer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputTemplate', instance.inputTemplate);
  writeNotNull('InputPathsMap', instance.inputPathsMap);
  return val;
}

KinesisParameters _$KinesisParametersFromJson(Map<String, dynamic> json) {
  return KinesisParameters(
    partitionKeyPath: json['PartitionKeyPath'] as String,
  );
}

Map<String, dynamic> _$KinesisParametersToJson(KinesisParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PartitionKeyPath', instance.partitionKeyPath);
  return val;
}

Map<String, dynamic> _$ListEventBusesRequestToJson(
    ListEventBusesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NamePrefix', instance.namePrefix);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListEventBusesResponse _$ListEventBusesResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventBusesResponse(
    eventBuses: (json['EventBuses'] as List)
        ?.map((e) =>
            e == null ? null : EventBus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListEventSourcesRequestToJson(
    ListEventSourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('NamePrefix', instance.namePrefix);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListEventSourcesResponse _$ListEventSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventSourcesResponse(
    eventSources: (json['EventSources'] as List)
        ?.map((e) =>
            e == null ? null : EventSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListPartnerEventSourceAccountsRequestToJson(
    ListPartnerEventSourceAccountsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventSourceName', instance.eventSourceName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListPartnerEventSourceAccountsResponse
    _$ListPartnerEventSourceAccountsResponseFromJson(
        Map<String, dynamic> json) {
  return ListPartnerEventSourceAccountsResponse(
    nextToken: json['NextToken'] as String,
    partnerEventSourceAccounts: (json['PartnerEventSourceAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : PartnerEventSourceAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPartnerEventSourcesRequestToJson(
    ListPartnerEventSourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NamePrefix', instance.namePrefix);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListPartnerEventSourcesResponse _$ListPartnerEventSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPartnerEventSourcesResponse(
    nextToken: json['NextToken'] as String,
    partnerEventSources: (json['PartnerEventSources'] as List)
        ?.map((e) => e == null
            ? null
            : PartnerEventSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListRuleNamesByTargetRequestToJson(
    ListRuleNamesByTargetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetArn', instance.targetArn);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListRuleNamesByTargetResponse _$ListRuleNamesByTargetResponseFromJson(
    Map<String, dynamic> json) {
  return ListRuleNamesByTargetResponse(
    nextToken: json['NextToken'] as String,
    ruleNames: (json['RuleNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListRulesRequestToJson(ListRulesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NamePrefix', instance.namePrefix);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListRulesResponse _$ListRulesResponseFromJson(Map<String, dynamic> json) {
  return ListRulesResponse(
    nextToken: json['NextToken'] as String,
    rules: (json['Rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListTargetsByRuleRequestToJson(
    ListTargetsByRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rule', instance.rule);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListTargetsByRuleResponse _$ListTargetsByRuleResponseFromJson(
    Map<String, dynamic> json) {
  return ListTargetsByRuleResponse(
    nextToken: json['NextToken'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NetworkConfiguration _$NetworkConfigurationFromJson(Map<String, dynamic> json) {
  return NetworkConfiguration(
    awsvpcConfiguration: json['awsvpcConfiguration'] == null
        ? null
        : AwsVpcConfiguration.fromJson(
            json['awsvpcConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkConfigurationToJson(
    NetworkConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsvpcConfiguration', instance.awsvpcConfiguration?.toJson());
  return val;
}

PartnerEventSource _$PartnerEventSourceFromJson(Map<String, dynamic> json) {
  return PartnerEventSource(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

PartnerEventSourceAccount _$PartnerEventSourceAccountFromJson(
    Map<String, dynamic> json) {
  return PartnerEventSourceAccount(
    account: json['Account'] as String,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    expirationTime: unixTimestampFromJson(json['ExpirationTime']),
    state: _$enumDecodeNullable(_$EventSourceStateEnumMap, json['State']),
  );
}

Map<String, dynamic> _$PutEventsRequestToJson(PutEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Entries', instance.entries?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$PutEventsRequestEntryToJson(
    PutEventsRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Detail', instance.detail);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Resources', instance.resources);
  writeNotNull('Source', instance.source);
  writeNotNull('Time', unixTimestampToJson(instance.time));
  return val;
}

PutEventsResponse _$PutEventsResponseFromJson(Map<String, dynamic> json) {
  return PutEventsResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : PutEventsResultEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedEntryCount: json['FailedEntryCount'] as int,
  );
}

PutEventsResultEntry _$PutEventsResultEntryFromJson(Map<String, dynamic> json) {
  return PutEventsResultEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    eventId: json['EventId'] as String,
  );
}

Map<String, dynamic> _$PutPartnerEventsRequestToJson(
    PutPartnerEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Entries', instance.entries?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$PutPartnerEventsRequestEntryToJson(
    PutPartnerEventsRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Detail', instance.detail);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('Resources', instance.resources);
  writeNotNull('Source', instance.source);
  writeNotNull('Time', unixTimestampToJson(instance.time));
  return val;
}

PutPartnerEventsResponse _$PutPartnerEventsResponseFromJson(
    Map<String, dynamic> json) {
  return PutPartnerEventsResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : PutPartnerEventsResultEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedEntryCount: json['FailedEntryCount'] as int,
  );
}

PutPartnerEventsResultEntry _$PutPartnerEventsResultEntryFromJson(
    Map<String, dynamic> json) {
  return PutPartnerEventsResultEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    eventId: json['EventId'] as String,
  );
}

Map<String, dynamic> _$PutPermissionRequestToJson(
    PutPermissionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', instance.action);
  writeNotNull('Principal', instance.principal);
  writeNotNull('StatementId', instance.statementId);
  writeNotNull('Condition', instance.condition?.toJson());
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

Map<String, dynamic> _$PutRuleRequestToJson(PutRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('EventPattern', instance.eventPattern);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('ScheduleExpression', instance.scheduleExpression);
  writeNotNull('State', _$RuleStateEnumMap[instance.state]);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

PutRuleResponse _$PutRuleResponseFromJson(Map<String, dynamic> json) {
  return PutRuleResponse(
    ruleArn: json['RuleArn'] as String,
  );
}

Map<String, dynamic> _$PutTargetsRequestToJson(PutTargetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rule', instance.rule);
  writeNotNull('Targets', instance.targets?.map((e) => e?.toJson())?.toList());
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

PutTargetsResponse _$PutTargetsResponseFromJson(Map<String, dynamic> json) {
  return PutTargetsResponse(
    failedEntries: (json['FailedEntries'] as List)
        ?.map((e) => e == null
            ? null
            : PutTargetsResultEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedEntryCount: json['FailedEntryCount'] as int,
  );
}

PutTargetsResultEntry _$PutTargetsResultEntryFromJson(
    Map<String, dynamic> json) {
  return PutTargetsResultEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    targetId: json['TargetId'] as String,
  );
}

Map<String, dynamic> _$RemovePermissionRequestToJson(
    RemovePermissionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatementId', instance.statementId);
  writeNotNull('EventBusName', instance.eventBusName);
  return val;
}

Map<String, dynamic> _$RemoveTargetsRequestToJson(
    RemoveTargetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Ids', instance.ids);
  writeNotNull('Rule', instance.rule);
  writeNotNull('EventBusName', instance.eventBusName);
  writeNotNull('Force', instance.force);
  return val;
}

RemoveTargetsResponse _$RemoveTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveTargetsResponse(
    failedEntries: (json['FailedEntries'] as List)
        ?.map((e) => e == null
            ? null
            : RemoveTargetsResultEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedEntryCount: json['FailedEntryCount'] as int,
  );
}

RemoveTargetsResultEntry _$RemoveTargetsResultEntryFromJson(
    Map<String, dynamic> json) {
  return RemoveTargetsResultEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    targetId: json['TargetId'] as String,
  );
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    eventBusName: json['EventBusName'] as String,
    eventPattern: json['EventPattern'] as String,
    managedBy: json['ManagedBy'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    scheduleExpression: json['ScheduleExpression'] as String,
    state: _$enumDecodeNullable(_$RuleStateEnumMap, json['State']),
  );
}

RunCommandParameters _$RunCommandParametersFromJson(Map<String, dynamic> json) {
  return RunCommandParameters(
    runCommandTargets: (json['RunCommandTargets'] as List)
        ?.map((e) => e == null
            ? null
            : RunCommandTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RunCommandParametersToJson(
    RunCommandParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RunCommandTargets',
      instance.runCommandTargets?.map((e) => e?.toJson())?.toList());
  return val;
}

RunCommandTarget _$RunCommandTargetFromJson(Map<String, dynamic> json) {
  return RunCommandTarget(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RunCommandTargetToJson(RunCommandTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

SqsParameters _$SqsParametersFromJson(Map<String, dynamic> json) {
  return SqsParameters(
    messageGroupId: json['MessageGroupId'] as String,
  );
}

Map<String, dynamic> _$SqsParametersToJson(SqsParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageGroupId', instance.messageGroupId);
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

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    batchParameters: json['BatchParameters'] == null
        ? null
        : BatchParameters.fromJson(
            json['BatchParameters'] as Map<String, dynamic>),
    ecsParameters: json['EcsParameters'] == null
        ? null
        : EcsParameters.fromJson(json['EcsParameters'] as Map<String, dynamic>),
    input: json['Input'] as String,
    inputPath: json['InputPath'] as String,
    inputTransformer: json['InputTransformer'] == null
        ? null
        : InputTransformer.fromJson(
            json['InputTransformer'] as Map<String, dynamic>),
    kinesisParameters: json['KinesisParameters'] == null
        ? null
        : KinesisParameters.fromJson(
            json['KinesisParameters'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    runCommandParameters: json['RunCommandParameters'] == null
        ? null
        : RunCommandParameters.fromJson(
            json['RunCommandParameters'] as Map<String, dynamic>),
    sqsParameters: json['SqsParameters'] == null
        ? null
        : SqsParameters.fromJson(json['SqsParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('Id', instance.id);
  writeNotNull('BatchParameters', instance.batchParameters?.toJson());
  writeNotNull('EcsParameters', instance.ecsParameters?.toJson());
  writeNotNull('Input', instance.input);
  writeNotNull('InputPath', instance.inputPath);
  writeNotNull('InputTransformer', instance.inputTransformer?.toJson());
  writeNotNull('KinesisParameters', instance.kinesisParameters?.toJson());
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('RunCommandParameters', instance.runCommandParameters?.toJson());
  writeNotNull('SqsParameters', instance.sqsParameters?.toJson());
  return val;
}

Map<String, dynamic> _$TestEventPatternRequestToJson(
    TestEventPatternRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Event', instance.event);
  writeNotNull('EventPattern', instance.eventPattern);
  return val;
}

TestEventPatternResponse _$TestEventPatternResponseFromJson(
    Map<String, dynamic> json) {
  return TestEventPatternResponse(
    result: json['Result'] as bool,
  );
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
