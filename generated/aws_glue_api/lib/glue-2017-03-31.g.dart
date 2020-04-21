// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glue-2017-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    arguments: (json['Arguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    crawlerName: json['CrawlerName'] as String,
    jobName: json['JobName'] as String,
    notificationProperty: json['NotificationProperty'] == null
        ? null
        : NotificationProperty.fromJson(
            json['NotificationProperty'] as Map<String, dynamic>),
    securityConfiguration: json['SecurityConfiguration'] as String,
    timeout: json['Timeout'] as int,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arguments', instance.arguments);
  writeNotNull('CrawlerName', instance.crawlerName);
  writeNotNull('JobName', instance.jobName);
  writeNotNull('NotificationProperty', instance.notificationProperty?.toJson());
  writeNotNull('SecurityConfiguration', instance.securityConfiguration);
  writeNotNull('Timeout', instance.timeout);
  return val;
}

BatchCreatePartitionResponse _$BatchCreatePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreatePartitionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : PartitionError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteConnectionResponse _$BatchDeleteConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteConnectionResponse(
    errors: (json['Errors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>)),
    ),
    succeeded: (json['Succeeded'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchDeletePartitionResponse _$BatchDeletePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeletePartitionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : PartitionError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteTableResponse _$BatchDeleteTableResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteTableResponse(
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : TableError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteTableVersionResponse _$BatchDeleteTableVersionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteTableVersionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : TableVersionError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetCrawlersResponse _$BatchGetCrawlersResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetCrawlersResponse(
    crawlers: (json['Crawlers'] as List)
        ?.map((e) =>
            e == null ? null : Crawler.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crawlersNotFound:
        (json['CrawlersNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchGetDevEndpointsResponse _$BatchGetDevEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetDevEndpointsResponse(
    devEndpoints: (json['DevEndpoints'] as List)
        ?.map((e) =>
            e == null ? null : DevEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    devEndpointsNotFound: (json['DevEndpointsNotFound'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

BatchGetJobsResponse _$BatchGetJobsResponseFromJson(Map<String, dynamic> json) {
  return BatchGetJobsResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobsNotFound:
        (json['JobsNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchGetPartitionResponse _$BatchGetPartitionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetPartitionResponse(
    partitions: (json['Partitions'] as List)
        ?.map((e) =>
            e == null ? null : Partition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedKeys: (json['UnprocessedKeys'] as List)
        ?.map((e) => e == null
            ? null
            : PartitionValueList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetTriggersResponse _$BatchGetTriggersResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetTriggersResponse(
    triggers: (json['Triggers'] as List)
        ?.map((e) =>
            e == null ? null : Trigger.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    triggersNotFound:
        (json['TriggersNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchGetWorkflowsResponse _$BatchGetWorkflowsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetWorkflowsResponse(
    missingWorkflows:
        (json['MissingWorkflows'] as List)?.map((e) => e as String)?.toList(),
    workflows: (json['Workflows'] as List)
        ?.map((e) =>
            e == null ? null : Workflow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchStopJobRunError _$BatchStopJobRunErrorFromJson(Map<String, dynamic> json) {
  return BatchStopJobRunError(
    errorDetail: json['ErrorDetail'] == null
        ? null
        : ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>),
    jobName: json['JobName'] as String,
    jobRunId: json['JobRunId'] as String,
  );
}

BatchStopJobRunResponse _$BatchStopJobRunResponseFromJson(
    Map<String, dynamic> json) {
  return BatchStopJobRunResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchStopJobRunError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successfulSubmissions: (json['SuccessfulSubmissions'] as List)
        ?.map((e) => e == null
            ? null
            : BatchStopJobRunSuccessfulSubmission.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchStopJobRunSuccessfulSubmission
    _$BatchStopJobRunSuccessfulSubmissionFromJson(Map<String, dynamic> json) {
  return BatchStopJobRunSuccessfulSubmission(
    jobName: json['JobName'] as String,
    jobRunId: json['JobRunId'] as String,
  );
}

CancelMLTaskRunResponse _$CancelMLTaskRunResponseFromJson(
    Map<String, dynamic> json) {
  return CancelMLTaskRunResponse(
    status: _$enumDecodeNullable(_$TaskStatusTypeEnumMap, json['Status']),
    taskRunId: json['TaskRunId'] as String,
    transformId: json['TransformId'] as String,
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

const _$TaskStatusTypeEnumMap = {
  TaskStatusType.starting: 'STARTING',
  TaskStatusType.running: 'RUNNING',
  TaskStatusType.stopping: 'STOPPING',
  TaskStatusType.stopped: 'STOPPED',
  TaskStatusType.succeeded: 'SUCCEEDED',
  TaskStatusType.failed: 'FAILED',
  TaskStatusType.timeout: 'TIMEOUT',
};

Map<String, dynamic> _$CatalogEntryToJson(CatalogEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('TableName', instance.tableName);
  return val;
}

CatalogImportStatus _$CatalogImportStatusFromJson(Map<String, dynamic> json) {
  return CatalogImportStatus(
    importCompleted: json['ImportCompleted'] as bool,
    importTime: unixFromJson(json['ImportTime']),
    importedBy: json['ImportedBy'] as String,
  );
}

CatalogTarget _$CatalogTargetFromJson(Map<String, dynamic> json) {
  return CatalogTarget(
    databaseName: json['DatabaseName'] as String,
    tables: (json['Tables'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CatalogTargetToJson(CatalogTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Tables', instance.tables);
  return val;
}

Classifier _$ClassifierFromJson(Map<String, dynamic> json) {
  return Classifier(
    csvClassifier: json['CsvClassifier'] == null
        ? null
        : CsvClassifier.fromJson(json['CsvClassifier'] as Map<String, dynamic>),
    grokClassifier: json['GrokClassifier'] == null
        ? null
        : GrokClassifier.fromJson(
            json['GrokClassifier'] as Map<String, dynamic>),
    jsonClassifier: json['JsonClassifier'] == null
        ? null
        : JsonClassifier.fromJson(
            json['JsonClassifier'] as Map<String, dynamic>),
    xMLClassifier: json['XMLClassifier'] == null
        ? null
        : XMLClassifier.fromJson(json['XMLClassifier'] as Map<String, dynamic>),
  );
}

CloudWatchEncryption _$CloudWatchEncryptionFromJson(Map<String, dynamic> json) {
  return CloudWatchEncryption(
    cloudWatchEncryptionMode: _$enumDecodeNullable(
        _$CloudWatchEncryptionModeEnumMap, json['CloudWatchEncryptionMode']),
    kmsKeyArn: json['KmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$CloudWatchEncryptionToJson(
    CloudWatchEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchEncryptionMode',
      _$CloudWatchEncryptionModeEnumMap[instance.cloudWatchEncryptionMode]);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$CloudWatchEncryptionModeEnumMap = {
  CloudWatchEncryptionMode.disabled: 'DISABLED',
  CloudWatchEncryptionMode.sseKms: 'SSE-KMS',
};

CodeGenEdge _$CodeGenEdgeFromJson(Map<String, dynamic> json) {
  return CodeGenEdge(
    source: json['Source'] as String,
    target: json['Target'] as String,
    targetParameter: json['TargetParameter'] as String,
  );
}

Map<String, dynamic> _$CodeGenEdgeToJson(CodeGenEdge instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Source', instance.source);
  writeNotNull('Target', instance.target);
  writeNotNull('TargetParameter', instance.targetParameter);
  return val;
}

CodeGenNode _$CodeGenNodeFromJson(Map<String, dynamic> json) {
  return CodeGenNode(
    args: (json['Args'] as List)
        ?.map((e) => e == null
            ? null
            : CodeGenNodeArg.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    nodeType: json['NodeType'] as String,
    lineNumber: json['LineNumber'] as int,
  );
}

Map<String, dynamic> _$CodeGenNodeToJson(CodeGenNode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Args', instance.args?.map((e) => e?.toJson())?.toList());
  writeNotNull('Id', instance.id);
  writeNotNull('NodeType', instance.nodeType);
  writeNotNull('LineNumber', instance.lineNumber);
  return val;
}

CodeGenNodeArg _$CodeGenNodeArgFromJson(Map<String, dynamic> json) {
  return CodeGenNodeArg(
    name: json['Name'] as String,
    value: json['Value'] as String,
    param: json['Param'] as bool,
  );
}

Map<String, dynamic> _$CodeGenNodeArgToJson(CodeGenNodeArg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  writeNotNull('Param', instance.param);
  return val;
}

Column _$ColumnFromJson(Map<String, dynamic> json) {
  return Column(
    name: json['Name'] as String,
    comment: json['Comment'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$ColumnToJson(Column instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Comment', instance.comment);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('Type', instance.type);
  return val;
}

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    crawlState: _$enumDecodeNullable(_$CrawlStateEnumMap, json['CrawlState']),
    crawlerName: json['CrawlerName'] as String,
    jobName: json['JobName'] as String,
    logicalOperator:
        _$enumDecodeNullable(_$LogicalOperatorEnumMap, json['LogicalOperator']),
    state: _$enumDecodeNullable(_$JobRunStateEnumMap, json['State']),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CrawlState', _$CrawlStateEnumMap[instance.crawlState]);
  writeNotNull('CrawlerName', instance.crawlerName);
  writeNotNull('JobName', instance.jobName);
  writeNotNull(
      'LogicalOperator', _$LogicalOperatorEnumMap[instance.logicalOperator]);
  writeNotNull('State', _$JobRunStateEnumMap[instance.state]);
  return val;
}

const _$CrawlStateEnumMap = {
  CrawlState.running: 'RUNNING',
  CrawlState.succeeded: 'SUCCEEDED',
  CrawlState.cancelled: 'CANCELLED',
  CrawlState.failed: 'FAILED',
};

const _$LogicalOperatorEnumMap = {
  LogicalOperator.equals: 'EQUALS',
};

const _$JobRunStateEnumMap = {
  JobRunState.starting: 'STARTING',
  JobRunState.running: 'RUNNING',
  JobRunState.stopping: 'STOPPING',
  JobRunState.stopped: 'STOPPED',
  JobRunState.succeeded: 'SUCCEEDED',
  JobRunState.failed: 'FAILED',
  JobRunState.timeout: 'TIMEOUT',
};

ConfusionMatrix _$ConfusionMatrixFromJson(Map<String, dynamic> json) {
  return ConfusionMatrix(
    numFalseNegatives: json['NumFalseNegatives'] as int,
    numFalsePositives: json['NumFalsePositives'] as int,
    numTrueNegatives: json['NumTrueNegatives'] as int,
    numTruePositives: json['NumTruePositives'] as int,
  );
}

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    connectionProperties:
        (json['ConnectionProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['ConnectionType']),
    creationTime: unixFromJson(json['CreationTime']),
    description: json['Description'] as String,
    lastUpdatedBy: json['LastUpdatedBy'] as String,
    lastUpdatedTime: unixFromJson(json['LastUpdatedTime']),
    matchCriteria:
        (json['MatchCriteria'] as List)?.map((e) => e as String)?.toList(),
    name: json['Name'] as String,
    physicalConnectionRequirements:
        json['PhysicalConnectionRequirements'] == null
            ? null
            : PhysicalConnectionRequirements.fromJson(
                json['PhysicalConnectionRequirements'] as Map<String, dynamic>),
  );
}

const _$ConnectionTypeEnumMap = {
  ConnectionType.jdbc: 'JDBC',
  ConnectionType.sftp: 'SFTP',
  ConnectionType.mongodb: 'MONGODB',
  ConnectionType.kafka: 'KAFKA',
};

Map<String, dynamic> _$ConnectionInputToJson(ConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionProperties', instance.connectionProperties);
  writeNotNull(
      'ConnectionType', _$ConnectionTypeEnumMap[instance.connectionType]);
  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('MatchCriteria', instance.matchCriteria);
  writeNotNull('PhysicalConnectionRequirements',
      instance.physicalConnectionRequirements?.toJson());
  return val;
}

ConnectionPasswordEncryption _$ConnectionPasswordEncryptionFromJson(
    Map<String, dynamic> json) {
  return ConnectionPasswordEncryption(
    returnConnectionPasswordEncrypted:
        json['ReturnConnectionPasswordEncrypted'] as bool,
    awsKmsKeyId: json['AwsKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$ConnectionPasswordEncryptionToJson(
    ConnectionPasswordEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReturnConnectionPasswordEncrypted',
      instance.returnConnectionPasswordEncrypted);
  writeNotNull('AwsKmsKeyId', instance.awsKmsKeyId);
  return val;
}

ConnectionsList _$ConnectionsListFromJson(Map<String, dynamic> json) {
  return ConnectionsList(
    connections:
        (json['Connections'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ConnectionsListToJson(ConnectionsList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Connections', instance.connections);
  return val;
}

Crawl _$CrawlFromJson(Map<String, dynamic> json) {
  return Crawl(
    completedOn: unixFromJson(json['CompletedOn']),
    errorMessage: json['ErrorMessage'] as String,
    logGroup: json['LogGroup'] as String,
    logStream: json['LogStream'] as String,
    startedOn: unixFromJson(json['StartedOn']),
    state: _$enumDecodeNullable(_$CrawlStateEnumMap, json['State']),
  );
}

Crawler _$CrawlerFromJson(Map<String, dynamic> json) {
  return Crawler(
    classifiers:
        (json['Classifiers'] as List)?.map((e) => e as String)?.toList(),
    configuration: json['Configuration'] as String,
    crawlElapsedTime: json['CrawlElapsedTime'] as int,
    crawlerSecurityConfiguration:
        json['CrawlerSecurityConfiguration'] as String,
    creationTime: unixFromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    description: json['Description'] as String,
    lastCrawl: json['LastCrawl'] == null
        ? null
        : LastCrawlInfo.fromJson(json['LastCrawl'] as Map<String, dynamic>),
    lastUpdated: unixFromJson(json['LastUpdated']),
    name: json['Name'] as String,
    role: json['Role'] as String,
    schedule: json['Schedule'] == null
        ? null
        : Schedule.fromJson(json['Schedule'] as Map<String, dynamic>),
    schemaChangePolicy: json['SchemaChangePolicy'] == null
        ? null
        : SchemaChangePolicy.fromJson(
            json['SchemaChangePolicy'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$CrawlerStateEnumMap, json['State']),
    tablePrefix: json['TablePrefix'] as String,
    targets: json['Targets'] == null
        ? null
        : CrawlerTargets.fromJson(json['Targets'] as Map<String, dynamic>),
    version: json['Version'] as int,
  );
}

const _$CrawlerStateEnumMap = {
  CrawlerState.ready: 'READY',
  CrawlerState.running: 'RUNNING',
  CrawlerState.stopping: 'STOPPING',
};

CrawlerMetrics _$CrawlerMetricsFromJson(Map<String, dynamic> json) {
  return CrawlerMetrics(
    crawlerName: json['CrawlerName'] as String,
    lastRuntimeSeconds: (json['LastRuntimeSeconds'] as num)?.toDouble(),
    medianRuntimeSeconds: (json['MedianRuntimeSeconds'] as num)?.toDouble(),
    stillEstimating: json['StillEstimating'] as bool,
    tablesCreated: json['TablesCreated'] as int,
    tablesDeleted: json['TablesDeleted'] as int,
    tablesUpdated: json['TablesUpdated'] as int,
    timeLeftSeconds: (json['TimeLeftSeconds'] as num)?.toDouble(),
  );
}

CrawlerNodeDetails _$CrawlerNodeDetailsFromJson(Map<String, dynamic> json) {
  return CrawlerNodeDetails(
    crawls: (json['Crawls'] as List)
        ?.map(
            (e) => e == null ? null : Crawl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CrawlerTargets _$CrawlerTargetsFromJson(Map<String, dynamic> json) {
  return CrawlerTargets(
    catalogTargets: (json['CatalogTargets'] as List)
        ?.map((e) => e == null
            ? null
            : CatalogTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dynamoDBTargets: (json['DynamoDBTargets'] as List)
        ?.map((e) => e == null
            ? null
            : DynamoDBTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jdbcTargets: (json['JdbcTargets'] as List)
        ?.map((e) =>
            e == null ? null : JdbcTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    s3Targets: (json['S3Targets'] as List)
        ?.map((e) =>
            e == null ? null : S3Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CrawlerTargetsToJson(CrawlerTargets instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogTargets',
      instance.catalogTargets?.map((e) => e?.toJson())?.toList());
  writeNotNull('DynamoDBTargets',
      instance.dynamoDBTargets?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'JdbcTargets', instance.jdbcTargets?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'S3Targets', instance.s3Targets?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateClassifierResponse _$CreateClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClassifierResponse();
}

CreateConnectionResponse _$CreateConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConnectionResponse();
}

CreateCrawlerResponse _$CreateCrawlerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCrawlerResponse();
}

Map<String, dynamic> _$CreateCsvClassifierRequestToJson(
    CreateCsvClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AllowSingleColumn', instance.allowSingleColumn);
  writeNotNull(
      'ContainsHeader', _$CsvHeaderOptionEnumMap[instance.containsHeader]);
  writeNotNull('Delimiter', instance.delimiter);
  writeNotNull('DisableValueTrimming', instance.disableValueTrimming);
  writeNotNull('Header', instance.header);
  writeNotNull('QuoteSymbol', instance.quoteSymbol);
  return val;
}

const _$CsvHeaderOptionEnumMap = {
  CsvHeaderOption.unknown: 'UNKNOWN',
  CsvHeaderOption.present: 'PRESENT',
  CsvHeaderOption.absent: 'ABSENT',
};

CreateDatabaseResponse _$CreateDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatabaseResponse();
}

CreateDevEndpointResponse _$CreateDevEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDevEndpointResponse(
    arguments: (json['Arguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    availabilityZone: json['AvailabilityZone'] as String,
    createdTimestamp: unixFromJson(json['CreatedTimestamp']),
    endpointName: json['EndpointName'] as String,
    extraJarsS3Path: json['ExtraJarsS3Path'] as String,
    extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String,
    failureReason: json['FailureReason'] as String,
    glueVersion: json['GlueVersion'] as String,
    numberOfNodes: json['NumberOfNodes'] as int,
    numberOfWorkers: json['NumberOfWorkers'] as int,
    roleArn: json['RoleArn'] as String,
    securityConfiguration: json['SecurityConfiguration'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    status: json['Status'] as String,
    subnetId: json['SubnetId'] as String,
    vpcId: json['VpcId'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
    yarnEndpointAddress: json['YarnEndpointAddress'] as String,
    zeppelinRemoteSparkInterpreterPort:
        json['ZeppelinRemoteSparkInterpreterPort'] as int,
  );
}

const _$WorkerTypeEnumMap = {
  WorkerType.standard: 'Standard',
  WorkerType.g_1x: 'G.1X',
  WorkerType.g_2x: 'G.2X',
};

Map<String, dynamic> _$CreateGrokClassifierRequestToJson(
    CreateGrokClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Classification', instance.classification);
  writeNotNull('GrokPattern', instance.grokPattern);
  writeNotNull('Name', instance.name);
  writeNotNull('CustomPatterns', instance.customPatterns);
  return val;
}

CreateJobResponse _$CreateJobResponseFromJson(Map<String, dynamic> json) {
  return CreateJobResponse(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$CreateJsonClassifierRequestToJson(
    CreateJsonClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JsonPath', instance.jsonPath);
  writeNotNull('Name', instance.name);
  return val;
}

CreateMLTransformResponse _$CreateMLTransformResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMLTransformResponse(
    transformId: json['TransformId'] as String,
  );
}

CreatePartitionResponse _$CreatePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePartitionResponse();
}

CreateScriptResponse _$CreateScriptResponseFromJson(Map<String, dynamic> json) {
  return CreateScriptResponse(
    pythonScript: json['PythonScript'] as String,
    scalaCode: json['ScalaCode'] as String,
  );
}

CreateSecurityConfigurationResponse
    _$CreateSecurityConfigurationResponseFromJson(Map<String, dynamic> json) {
  return CreateSecurityConfigurationResponse(
    createdTimestamp: unixFromJson(json['CreatedTimestamp']),
    name: json['Name'] as String,
  );
}

CreateTableResponse _$CreateTableResponseFromJson(Map<String, dynamic> json) {
  return CreateTableResponse();
}

CreateTriggerResponse _$CreateTriggerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTriggerResponse(
    name: json['Name'] as String,
  );
}

CreateUserDefinedFunctionResponse _$CreateUserDefinedFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserDefinedFunctionResponse();
}

CreateWorkflowResponse _$CreateWorkflowResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkflowResponse(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$CreateXMLClassifierRequestToJson(
    CreateXMLClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Classification', instance.classification);
  writeNotNull('Name', instance.name);
  writeNotNull('RowTag', instance.rowTag);
  return val;
}

CsvClassifier _$CsvClassifierFromJson(Map<String, dynamic> json) {
  return CsvClassifier(
    name: json['Name'] as String,
    allowSingleColumn: json['AllowSingleColumn'] as bool,
    containsHeader:
        _$enumDecodeNullable(_$CsvHeaderOptionEnumMap, json['ContainsHeader']),
    creationTime: unixFromJson(json['CreationTime']),
    delimiter: json['Delimiter'] as String,
    disableValueTrimming: json['DisableValueTrimming'] as bool,
    header: (json['Header'] as List)?.map((e) => e as String)?.toList(),
    lastUpdated: unixFromJson(json['LastUpdated']),
    quoteSymbol: json['QuoteSymbol'] as String,
    version: json['Version'] as int,
  );
}

DataCatalogEncryptionSettings _$DataCatalogEncryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return DataCatalogEncryptionSettings(
    connectionPasswordEncryption: json['ConnectionPasswordEncryption'] == null
        ? null
        : ConnectionPasswordEncryption.fromJson(
            json['ConnectionPasswordEncryption'] as Map<String, dynamic>),
    encryptionAtRest: json['EncryptionAtRest'] == null
        ? null
        : EncryptionAtRest.fromJson(
            json['EncryptionAtRest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataCatalogEncryptionSettingsToJson(
    DataCatalogEncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionPasswordEncryption',
      instance.connectionPasswordEncryption?.toJson());
  writeNotNull('EncryptionAtRest', instance.encryptionAtRest?.toJson());
  return val;
}

DataLakePrincipal _$DataLakePrincipalFromJson(Map<String, dynamic> json) {
  return DataLakePrincipal(
    dataLakePrincipalIdentifier: json['DataLakePrincipalIdentifier'] as String,
  );
}

Map<String, dynamic> _$DataLakePrincipalToJson(DataLakePrincipal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DataLakePrincipalIdentifier', instance.dataLakePrincipalIdentifier);
  return val;
}

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return Database(
    name: json['Name'] as String,
    createTableDefaultPermissions:
        (json['CreateTableDefaultPermissions'] as List)
            ?.map((e) => e == null
                ? null
                : PrincipalPermissions.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    createTime: unixFromJson(json['CreateTime']),
    description: json['Description'] as String,
    locationUri: json['LocationUri'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DatabaseInputToJson(DatabaseInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull(
      'CreateTableDefaultPermissions',
      instance.createTableDefaultPermissions
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('LocationUri', instance.locationUri);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

DeleteClassifierResponse _$DeleteClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClassifierResponse();
}

DeleteConnectionResponse _$DeleteConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionResponse();
}

DeleteCrawlerResponse _$DeleteCrawlerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCrawlerResponse();
}

DeleteDatabaseResponse _$DeleteDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDatabaseResponse();
}

DeleteDevEndpointResponse _$DeleteDevEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDevEndpointResponse();
}

DeleteJobResponse _$DeleteJobResponseFromJson(Map<String, dynamic> json) {
  return DeleteJobResponse(
    jobName: json['JobName'] as String,
  );
}

DeleteMLTransformResponse _$DeleteMLTransformResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMLTransformResponse(
    transformId: json['TransformId'] as String,
  );
}

DeletePartitionResponse _$DeletePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePartitionResponse();
}

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse();
}

DeleteSecurityConfigurationResponse
    _$DeleteSecurityConfigurationResponseFromJson(Map<String, dynamic> json) {
  return DeleteSecurityConfigurationResponse();
}

DeleteTableResponse _$DeleteTableResponseFromJson(Map<String, dynamic> json) {
  return DeleteTableResponse();
}

DeleteTableVersionResponse _$DeleteTableVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTableVersionResponse();
}

DeleteTriggerResponse _$DeleteTriggerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTriggerResponse(
    name: json['Name'] as String,
  );
}

DeleteUserDefinedFunctionResponse _$DeleteUserDefinedFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserDefinedFunctionResponse();
}

DeleteWorkflowResponse _$DeleteWorkflowResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkflowResponse(
    name: json['Name'] as String,
  );
}

DevEndpoint _$DevEndpointFromJson(Map<String, dynamic> json) {
  return DevEndpoint(
    arguments: (json['Arguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    availabilityZone: json['AvailabilityZone'] as String,
    createdTimestamp: unixFromJson(json['CreatedTimestamp']),
    endpointName: json['EndpointName'] as String,
    extraJarsS3Path: json['ExtraJarsS3Path'] as String,
    extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String,
    failureReason: json['FailureReason'] as String,
    glueVersion: json['GlueVersion'] as String,
    lastModifiedTimestamp: unixFromJson(json['LastModifiedTimestamp']),
    lastUpdateStatus: json['LastUpdateStatus'] as String,
    numberOfNodes: json['NumberOfNodes'] as int,
    numberOfWorkers: json['NumberOfWorkers'] as int,
    privateAddress: json['PrivateAddress'] as String,
    publicAddress: json['PublicAddress'] as String,
    publicKey: json['PublicKey'] as String,
    publicKeys: (json['PublicKeys'] as List)?.map((e) => e as String)?.toList(),
    roleArn: json['RoleArn'] as String,
    securityConfiguration: json['SecurityConfiguration'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    status: json['Status'] as String,
    subnetId: json['SubnetId'] as String,
    vpcId: json['VpcId'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
    yarnEndpointAddress: json['YarnEndpointAddress'] as String,
    zeppelinRemoteSparkInterpreterPort:
        json['ZeppelinRemoteSparkInterpreterPort'] as int,
  );
}

Map<String, dynamic> _$DevEndpointCustomLibrariesToJson(
    DevEndpointCustomLibraries instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExtraJarsS3Path', instance.extraJarsS3Path);
  writeNotNull('ExtraPythonLibsS3Path', instance.extraPythonLibsS3Path);
  return val;
}

DynamoDBTarget _$DynamoDBTargetFromJson(Map<String, dynamic> json) {
  return DynamoDBTarget(
    path: json['Path'] as String,
  );
}

Map<String, dynamic> _$DynamoDBTargetToJson(DynamoDBTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Path', instance.path);
  return val;
}

Edge _$EdgeFromJson(Map<String, dynamic> json) {
  return Edge(
    destinationId: json['DestinationId'] as String,
    sourceId: json['SourceId'] as String,
  );
}

EncryptionAtRest _$EncryptionAtRestFromJson(Map<String, dynamic> json) {
  return EncryptionAtRest(
    catalogEncryptionMode: _$enumDecodeNullable(
        _$CatalogEncryptionModeEnumMap, json['CatalogEncryptionMode']),
    sseAwsKmsKeyId: json['SseAwsKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionAtRestToJson(EncryptionAtRest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogEncryptionMode',
      _$CatalogEncryptionModeEnumMap[instance.catalogEncryptionMode]);
  writeNotNull('SseAwsKmsKeyId', instance.sseAwsKmsKeyId);
  return val;
}

const _$CatalogEncryptionModeEnumMap = {
  CatalogEncryptionMode.disabled: 'DISABLED',
  CatalogEncryptionMode.sseKms: 'SSE-KMS',
};

EncryptionConfiguration _$EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return EncryptionConfiguration(
    cloudWatchEncryption: json['CloudWatchEncryption'] == null
        ? null
        : CloudWatchEncryption.fromJson(
            json['CloudWatchEncryption'] as Map<String, dynamic>),
    jobBookmarksEncryption: json['JobBookmarksEncryption'] == null
        ? null
        : JobBookmarksEncryption.fromJson(
            json['JobBookmarksEncryption'] as Map<String, dynamic>),
    s3Encryption: (json['S3Encryption'] as List)
        ?.map((e) =>
            e == null ? null : S3Encryption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EncryptionConfigurationToJson(
    EncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchEncryption', instance.cloudWatchEncryption?.toJson());
  writeNotNull(
      'JobBookmarksEncryption', instance.jobBookmarksEncryption?.toJson());
  writeNotNull(
      'S3Encryption', instance.s3Encryption?.map((e) => e?.toJson())?.toList());
  return val;
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
  );
}

EvaluationMetrics _$EvaluationMetricsFromJson(Map<String, dynamic> json) {
  return EvaluationMetrics(
    transformType:
        _$enumDecodeNullable(_$TransformTypeEnumMap, json['TransformType']),
    findMatchesMetrics: json['FindMatchesMetrics'] == null
        ? null
        : FindMatchesMetrics.fromJson(
            json['FindMatchesMetrics'] as Map<String, dynamic>),
  );
}

const _$TransformTypeEnumMap = {
  TransformType.findMatches: 'FIND_MATCHES',
};

ExecutionProperty _$ExecutionPropertyFromJson(Map<String, dynamic> json) {
  return ExecutionProperty(
    maxConcurrentRuns: json['MaxConcurrentRuns'] as int,
  );
}

Map<String, dynamic> _$ExecutionPropertyToJson(ExecutionProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxConcurrentRuns', instance.maxConcurrentRuns);
  return val;
}

ExportLabelsTaskRunProperties _$ExportLabelsTaskRunPropertiesFromJson(
    Map<String, dynamic> json) {
  return ExportLabelsTaskRunProperties(
    outputS3Path: json['OutputS3Path'] as String,
  );
}

FindMatchesMetrics _$FindMatchesMetricsFromJson(Map<String, dynamic> json) {
  return FindMatchesMetrics(
    areaUnderPRCurve: (json['AreaUnderPRCurve'] as num)?.toDouble(),
    confusionMatrix: json['ConfusionMatrix'] == null
        ? null
        : ConfusionMatrix.fromJson(
            json['ConfusionMatrix'] as Map<String, dynamic>),
    f1: (json['F1'] as num)?.toDouble(),
    precision: (json['Precision'] as num)?.toDouble(),
    recall: (json['Recall'] as num)?.toDouble(),
  );
}

FindMatchesParameters _$FindMatchesParametersFromJson(
    Map<String, dynamic> json) {
  return FindMatchesParameters(
    accuracyCostTradeoff: (json['AccuracyCostTradeoff'] as num)?.toDouble(),
    enforceProvidedLabels: json['EnforceProvidedLabels'] as bool,
    precisionRecallTradeoff:
        (json['PrecisionRecallTradeoff'] as num)?.toDouble(),
    primaryKeyColumnName: json['PrimaryKeyColumnName'] as String,
  );
}

Map<String, dynamic> _$FindMatchesParametersToJson(
    FindMatchesParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccuracyCostTradeoff', instance.accuracyCostTradeoff);
  writeNotNull('EnforceProvidedLabels', instance.enforceProvidedLabels);
  writeNotNull('PrecisionRecallTradeoff', instance.precisionRecallTradeoff);
  writeNotNull('PrimaryKeyColumnName', instance.primaryKeyColumnName);
  return val;
}

FindMatchesTaskRunProperties _$FindMatchesTaskRunPropertiesFromJson(
    Map<String, dynamic> json) {
  return FindMatchesTaskRunProperties(
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobRunId: json['JobRunId'] as String,
  );
}

GetCatalogImportStatusResponse _$GetCatalogImportStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetCatalogImportStatusResponse(
    importStatus: json['ImportStatus'] == null
        ? null
        : CatalogImportStatus.fromJson(
            json['ImportStatus'] as Map<String, dynamic>),
  );
}

GetClassifierResponse _$GetClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return GetClassifierResponse(
    classifier: json['Classifier'] == null
        ? null
        : Classifier.fromJson(json['Classifier'] as Map<String, dynamic>),
  );
}

GetClassifiersResponse _$GetClassifiersResponseFromJson(
    Map<String, dynamic> json) {
  return GetClassifiersResponse(
    classifiers: (json['Classifiers'] as List)
        ?.map((e) =>
            e == null ? null : Classifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetConnectionResponse _$GetConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetConnectionsFilterToJson(
    GetConnectionsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ConnectionType', _$ConnectionTypeEnumMap[instance.connectionType]);
  writeNotNull('MatchCriteria', instance.matchCriteria);
  return val;
}

GetConnectionsResponse _$GetConnectionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionsResponse(
    connectionList: (json['ConnectionList'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetCrawlerMetricsResponse _$GetCrawlerMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return GetCrawlerMetricsResponse(
    crawlerMetricsList: (json['CrawlerMetricsList'] as List)
        ?.map((e) => e == null
            ? null
            : CrawlerMetrics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetCrawlerResponse _$GetCrawlerResponseFromJson(Map<String, dynamic> json) {
  return GetCrawlerResponse(
    crawler: json['Crawler'] == null
        ? null
        : Crawler.fromJson(json['Crawler'] as Map<String, dynamic>),
  );
}

GetCrawlersResponse _$GetCrawlersResponseFromJson(Map<String, dynamic> json) {
  return GetCrawlersResponse(
    crawlers: (json['Crawlers'] as List)
        ?.map((e) =>
            e == null ? null : Crawler.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDataCatalogEncryptionSettingsResponse
    _$GetDataCatalogEncryptionSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return GetDataCatalogEncryptionSettingsResponse(
    dataCatalogEncryptionSettings: json['DataCatalogEncryptionSettings'] == null
        ? null
        : DataCatalogEncryptionSettings.fromJson(
            json['DataCatalogEncryptionSettings'] as Map<String, dynamic>),
  );
}

GetDatabaseResponse _$GetDatabaseResponseFromJson(Map<String, dynamic> json) {
  return GetDatabaseResponse(
    database: json['Database'] == null
        ? null
        : Database.fromJson(json['Database'] as Map<String, dynamic>),
  );
}

GetDatabasesResponse _$GetDatabasesResponseFromJson(Map<String, dynamic> json) {
  return GetDatabasesResponse(
    databaseList: (json['DatabaseList'] as List)
        ?.map((e) =>
            e == null ? null : Database.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDataflowGraphResponse _$GetDataflowGraphResponseFromJson(
    Map<String, dynamic> json) {
  return GetDataflowGraphResponse(
    dagEdges: (json['DagEdges'] as List)
        ?.map((e) =>
            e == null ? null : CodeGenEdge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dagNodes: (json['DagNodes'] as List)
        ?.map((e) =>
            e == null ? null : CodeGenNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetDevEndpointResponse _$GetDevEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevEndpointResponse(
    devEndpoint: json['DevEndpoint'] == null
        ? null
        : DevEndpoint.fromJson(json['DevEndpoint'] as Map<String, dynamic>),
  );
}

GetDevEndpointsResponse _$GetDevEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevEndpointsResponse(
    devEndpoints: (json['DevEndpoints'] as List)
        ?.map((e) =>
            e == null ? null : DevEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetJobBookmarkResponse _$GetJobBookmarkResponseFromJson(
    Map<String, dynamic> json) {
  return GetJobBookmarkResponse(
    jobBookmarkEntry: json['JobBookmarkEntry'] == null
        ? null
        : JobBookmarkEntry.fromJson(
            json['JobBookmarkEntry'] as Map<String, dynamic>),
  );
}

GetJobResponse _$GetJobResponseFromJson(Map<String, dynamic> json) {
  return GetJobResponse(
    job: json['Job'] == null
        ? null
        : Job.fromJson(json['Job'] as Map<String, dynamic>),
  );
}

GetJobRunResponse _$GetJobRunResponseFromJson(Map<String, dynamic> json) {
  return GetJobRunResponse(
    jobRun: json['JobRun'] == null
        ? null
        : JobRun.fromJson(json['JobRun'] as Map<String, dynamic>),
  );
}

GetJobRunsResponse _$GetJobRunsResponseFromJson(Map<String, dynamic> json) {
  return GetJobRunsResponse(
    jobRuns: (json['JobRuns'] as List)
        ?.map((e) =>
            e == null ? null : JobRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetJobsResponse _$GetJobsResponseFromJson(Map<String, dynamic> json) {
  return GetJobsResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetMLTaskRunResponse _$GetMLTaskRunResponseFromJson(Map<String, dynamic> json) {
  return GetMLTaskRunResponse(
    completedOn: unixFromJson(json['CompletedOn']),
    errorString: json['ErrorString'] as String,
    executionTime: json['ExecutionTime'] as int,
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    logGroupName: json['LogGroupName'] as String,
    properties: json['Properties'] == null
        ? null
        : TaskRunProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    startedOn: unixFromJson(json['StartedOn']),
    status: _$enumDecodeNullable(_$TaskStatusTypeEnumMap, json['Status']),
    taskRunId: json['TaskRunId'] as String,
    transformId: json['TransformId'] as String,
  );
}

GetMLTaskRunsResponse _$GetMLTaskRunsResponseFromJson(
    Map<String, dynamic> json) {
  return GetMLTaskRunsResponse(
    nextToken: json['NextToken'] as String,
    taskRuns: (json['TaskRuns'] as List)
        ?.map((e) =>
            e == null ? null : TaskRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetMLTransformResponse _$GetMLTransformResponseFromJson(
    Map<String, dynamic> json) {
  return GetMLTransformResponse(
    createdOn: unixFromJson(json['CreatedOn']),
    description: json['Description'] as String,
    evaluationMetrics: json['EvaluationMetrics'] == null
        ? null
        : EvaluationMetrics.fromJson(
            json['EvaluationMetrics'] as Map<String, dynamic>),
    glueVersion: json['GlueVersion'] as String,
    inputRecordTables: (json['InputRecordTables'] as List)
        ?.map((e) =>
            e == null ? null : GlueTable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    labelCount: json['LabelCount'] as int,
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    maxCapacity: (json['MaxCapacity'] as num)?.toDouble(),
    maxRetries: json['MaxRetries'] as int,
    name: json['Name'] as String,
    numberOfWorkers: json['NumberOfWorkers'] as int,
    parameters: json['Parameters'] == null
        ? null
        : TransformParameters.fromJson(
            json['Parameters'] as Map<String, dynamic>),
    role: json['Role'] as String,
    schema: (json['Schema'] as List)
        ?.map((e) =>
            e == null ? null : SchemaColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$TransformStatusTypeEnumMap, json['Status']),
    timeout: json['Timeout'] as int,
    transformId: json['TransformId'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
  );
}

const _$TransformStatusTypeEnumMap = {
  TransformStatusType.notReady: 'NOT_READY',
  TransformStatusType.ready: 'READY',
  TransformStatusType.deleting: 'DELETING',
};

GetMLTransformsResponse _$GetMLTransformsResponseFromJson(
    Map<String, dynamic> json) {
  return GetMLTransformsResponse(
    transforms: (json['Transforms'] as List)
        ?.map((e) =>
            e == null ? null : MLTransform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetMappingResponse _$GetMappingResponseFromJson(Map<String, dynamic> json) {
  return GetMappingResponse(
    mapping: (json['Mapping'] as List)
        ?.map((e) =>
            e == null ? null : MappingEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPartitionResponse _$GetPartitionResponseFromJson(Map<String, dynamic> json) {
  return GetPartitionResponse(
    partition: json['Partition'] == null
        ? null
        : Partition.fromJson(json['Partition'] as Map<String, dynamic>),
  );
}

GetPartitionsResponse _$GetPartitionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetPartitionsResponse(
    nextToken: json['NextToken'] as String,
    partitions: (json['Partitions'] as List)
        ?.map((e) =>
            e == null ? null : Partition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPlanResponse _$GetPlanResponseFromJson(Map<String, dynamic> json) {
  return GetPlanResponse(
    pythonScript: json['PythonScript'] as String,
    scalaCode: json['ScalaCode'] as String,
  );
}

GetResourcePolicyResponse _$GetResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyResponse(
    createTime: unixFromJson(json['CreateTime']),
    policyHash: json['PolicyHash'] as String,
    policyInJson: json['PolicyInJson'] as String,
    updateTime: unixFromJson(json['UpdateTime']),
  );
}

GetSecurityConfigurationResponse _$GetSecurityConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetSecurityConfigurationResponse(
    securityConfiguration: json['SecurityConfiguration'] == null
        ? null
        : SecurityConfiguration.fromJson(
            json['SecurityConfiguration'] as Map<String, dynamic>),
  );
}

GetSecurityConfigurationsResponse _$GetSecurityConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSecurityConfigurationsResponse(
    nextToken: json['NextToken'] as String,
    securityConfigurations: (json['SecurityConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTableResponse _$GetTableResponseFromJson(Map<String, dynamic> json) {
  return GetTableResponse(
    table: json['Table'] == null
        ? null
        : Table.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

GetTableVersionResponse _$GetTableVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetTableVersionResponse(
    tableVersion: json['TableVersion'] == null
        ? null
        : TableVersion.fromJson(json['TableVersion'] as Map<String, dynamic>),
  );
}

GetTableVersionsResponse _$GetTableVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetTableVersionsResponse(
    nextToken: json['NextToken'] as String,
    tableVersions: (json['TableVersions'] as List)
        ?.map((e) =>
            e == null ? null : TableVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTablesResponse _$GetTablesResponseFromJson(Map<String, dynamic> json) {
  return GetTablesResponse(
    nextToken: json['NextToken'] as String,
    tableList: (json['TableList'] as List)
        ?.map(
            (e) => e == null ? null : Table.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTagsResponse _$GetTagsResponseFromJson(Map<String, dynamic> json) {
  return GetTagsResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetTriggerResponse _$GetTriggerResponseFromJson(Map<String, dynamic> json) {
  return GetTriggerResponse(
    trigger: json['Trigger'] == null
        ? null
        : Trigger.fromJson(json['Trigger'] as Map<String, dynamic>),
  );
}

GetTriggersResponse _$GetTriggersResponseFromJson(Map<String, dynamic> json) {
  return GetTriggersResponse(
    nextToken: json['NextToken'] as String,
    triggers: (json['Triggers'] as List)
        ?.map((e) =>
            e == null ? null : Trigger.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUserDefinedFunctionResponse _$GetUserDefinedFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserDefinedFunctionResponse(
    userDefinedFunction: json['UserDefinedFunction'] == null
        ? null
        : UserDefinedFunction.fromJson(
            json['UserDefinedFunction'] as Map<String, dynamic>),
  );
}

GetUserDefinedFunctionsResponse _$GetUserDefinedFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserDefinedFunctionsResponse(
    nextToken: json['NextToken'] as String,
    userDefinedFunctions: (json['UserDefinedFunctions'] as List)
        ?.map((e) => e == null
            ? null
            : UserDefinedFunction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetWorkflowResponse _$GetWorkflowResponseFromJson(Map<String, dynamic> json) {
  return GetWorkflowResponse(
    workflow: json['Workflow'] == null
        ? null
        : Workflow.fromJson(json['Workflow'] as Map<String, dynamic>),
  );
}

GetWorkflowRunPropertiesResponse _$GetWorkflowRunPropertiesResponseFromJson(
    Map<String, dynamic> json) {
  return GetWorkflowRunPropertiesResponse(
    runProperties: (json['RunProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetWorkflowRunResponse _$GetWorkflowRunResponseFromJson(
    Map<String, dynamic> json) {
  return GetWorkflowRunResponse(
    run: json['Run'] == null
        ? null
        : WorkflowRun.fromJson(json['Run'] as Map<String, dynamic>),
  );
}

GetWorkflowRunsResponse _$GetWorkflowRunsResponseFromJson(
    Map<String, dynamic> json) {
  return GetWorkflowRunsResponse(
    nextToken: json['NextToken'] as String,
    runs: (json['Runs'] as List)
        ?.map((e) =>
            e == null ? null : WorkflowRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GlueTable _$GlueTableFromJson(Map<String, dynamic> json) {
  return GlueTable(
    databaseName: json['DatabaseName'] as String,
    tableName: json['TableName'] as String,
    catalogId: json['CatalogId'] as String,
    connectionName: json['ConnectionName'] as String,
  );
}

Map<String, dynamic> _$GlueTableToJson(GlueTable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('TableName', instance.tableName);
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('ConnectionName', instance.connectionName);
  return val;
}

GrokClassifier _$GrokClassifierFromJson(Map<String, dynamic> json) {
  return GrokClassifier(
    classification: json['Classification'] as String,
    grokPattern: json['GrokPattern'] as String,
    name: json['Name'] as String,
    creationTime: unixFromJson(json['CreationTime']),
    customPatterns: json['CustomPatterns'] as String,
    lastUpdated: unixFromJson(json['LastUpdated']),
    version: json['Version'] as int,
  );
}

ImportCatalogToGlueResponse _$ImportCatalogToGlueResponseFromJson(
    Map<String, dynamic> json) {
  return ImportCatalogToGlueResponse();
}

ImportLabelsTaskRunProperties _$ImportLabelsTaskRunPropertiesFromJson(
    Map<String, dynamic> json) {
  return ImportLabelsTaskRunProperties(
    inputS3Path: json['InputS3Path'] as String,
    replace: json['Replace'] as bool,
  );
}

JdbcTarget _$JdbcTargetFromJson(Map<String, dynamic> json) {
  return JdbcTarget(
    connectionName: json['ConnectionName'] as String,
    exclusions: (json['Exclusions'] as List)?.map((e) => e as String)?.toList(),
    path: json['Path'] as String,
  );
}

Map<String, dynamic> _$JdbcTargetToJson(JdbcTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionName', instance.connectionName);
  writeNotNull('Exclusions', instance.exclusions);
  writeNotNull('Path', instance.path);
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    allocatedCapacity: json['AllocatedCapacity'] as int,
    command: json['Command'] == null
        ? null
        : JobCommand.fromJson(json['Command'] as Map<String, dynamic>),
    connections: json['Connections'] == null
        ? null
        : ConnectionsList.fromJson(json['Connections'] as Map<String, dynamic>),
    createdOn: unixFromJson(json['CreatedOn']),
    defaultArguments: (json['DefaultArguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['Description'] as String,
    executionProperty: json['ExecutionProperty'] == null
        ? null
        : ExecutionProperty.fromJson(
            json['ExecutionProperty'] as Map<String, dynamic>),
    glueVersion: json['GlueVersion'] as String,
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    logUri: json['LogUri'] as String,
    maxCapacity: (json['MaxCapacity'] as num)?.toDouble(),
    maxRetries: json['MaxRetries'] as int,
    name: json['Name'] as String,
    nonOverridableArguments:
        (json['NonOverridableArguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    notificationProperty: json['NotificationProperty'] == null
        ? null
        : NotificationProperty.fromJson(
            json['NotificationProperty'] as Map<String, dynamic>),
    numberOfWorkers: json['NumberOfWorkers'] as int,
    role: json['Role'] as String,
    securityConfiguration: json['SecurityConfiguration'] as String,
    timeout: json['Timeout'] as int,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
  );
}

JobBookmarkEntry _$JobBookmarkEntryFromJson(Map<String, dynamic> json) {
  return JobBookmarkEntry(
    attempt: json['Attempt'] as int,
    jobBookmark: json['JobBookmark'] as String,
    jobName: json['JobName'] as String,
    previousRunId: json['PreviousRunId'] as String,
    run: json['Run'] as int,
    runId: json['RunId'] as String,
    version: json['Version'] as int,
  );
}

JobBookmarksEncryption _$JobBookmarksEncryptionFromJson(
    Map<String, dynamic> json) {
  return JobBookmarksEncryption(
    jobBookmarksEncryptionMode: _$enumDecodeNullable(
        _$JobBookmarksEncryptionModeEnumMap,
        json['JobBookmarksEncryptionMode']),
    kmsKeyArn: json['KmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$JobBookmarksEncryptionToJson(
    JobBookmarksEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobBookmarksEncryptionMode',
      _$JobBookmarksEncryptionModeEnumMap[instance.jobBookmarksEncryptionMode]);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$JobBookmarksEncryptionModeEnumMap = {
  JobBookmarksEncryptionMode.disabled: 'DISABLED',
  JobBookmarksEncryptionMode.cseKms: 'CSE-KMS',
};

JobCommand _$JobCommandFromJson(Map<String, dynamic> json) {
  return JobCommand(
    name: json['Name'] as String,
    pythonVersion: json['PythonVersion'] as String,
    scriptLocation: json['ScriptLocation'] as String,
  );
}

Map<String, dynamic> _$JobCommandToJson(JobCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('PythonVersion', instance.pythonVersion);
  writeNotNull('ScriptLocation', instance.scriptLocation);
  return val;
}

JobNodeDetails _$JobNodeDetailsFromJson(Map<String, dynamic> json) {
  return JobNodeDetails(
    jobRuns: (json['JobRuns'] as List)
        ?.map((e) =>
            e == null ? null : JobRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

JobRun _$JobRunFromJson(Map<String, dynamic> json) {
  return JobRun(
    allocatedCapacity: json['AllocatedCapacity'] as int,
    arguments: (json['Arguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    attempt: json['Attempt'] as int,
    completedOn: unixFromJson(json['CompletedOn']),
    errorMessage: json['ErrorMessage'] as String,
    executionTime: json['ExecutionTime'] as int,
    glueVersion: json['GlueVersion'] as String,
    id: json['Id'] as String,
    jobName: json['JobName'] as String,
    jobRunState:
        _$enumDecodeNullable(_$JobRunStateEnumMap, json['JobRunState']),
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    logGroupName: json['LogGroupName'] as String,
    maxCapacity: (json['MaxCapacity'] as num)?.toDouble(),
    notificationProperty: json['NotificationProperty'] == null
        ? null
        : NotificationProperty.fromJson(
            json['NotificationProperty'] as Map<String, dynamic>),
    numberOfWorkers: json['NumberOfWorkers'] as int,
    predecessorRuns: (json['PredecessorRuns'] as List)
        ?.map((e) =>
            e == null ? null : Predecessor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    previousRunId: json['PreviousRunId'] as String,
    securityConfiguration: json['SecurityConfiguration'] as String,
    startedOn: unixFromJson(json['StartedOn']),
    timeout: json['Timeout'] as int,
    triggerName: json['TriggerName'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
  );
}

Map<String, dynamic> _$JobUpdateToJson(JobUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedCapacity', instance.allocatedCapacity);
  writeNotNull('Command', instance.command?.toJson());
  writeNotNull('Connections', instance.connections?.toJson());
  writeNotNull('DefaultArguments', instance.defaultArguments);
  writeNotNull('Description', instance.description);
  writeNotNull('ExecutionProperty', instance.executionProperty?.toJson());
  writeNotNull('GlueVersion', instance.glueVersion);
  writeNotNull('LogUri', instance.logUri);
  writeNotNull('MaxCapacity', instance.maxCapacity);
  writeNotNull('MaxRetries', instance.maxRetries);
  writeNotNull('NonOverridableArguments', instance.nonOverridableArguments);
  writeNotNull('NotificationProperty', instance.notificationProperty?.toJson());
  writeNotNull('NumberOfWorkers', instance.numberOfWorkers);
  writeNotNull('Role', instance.role);
  writeNotNull('SecurityConfiguration', instance.securityConfiguration);
  writeNotNull('Timeout', instance.timeout);
  writeNotNull('WorkerType', _$WorkerTypeEnumMap[instance.workerType]);
  return val;
}

JsonClassifier _$JsonClassifierFromJson(Map<String, dynamic> json) {
  return JsonClassifier(
    jsonPath: json['JsonPath'] as String,
    name: json['Name'] as String,
    creationTime: unixFromJson(json['CreationTime']),
    lastUpdated: unixFromJson(json['LastUpdated']),
    version: json['Version'] as int,
  );
}

LabelingSetGenerationTaskRunProperties
    _$LabelingSetGenerationTaskRunPropertiesFromJson(
        Map<String, dynamic> json) {
  return LabelingSetGenerationTaskRunProperties(
    outputS3Path: json['OutputS3Path'] as String,
  );
}

LastCrawlInfo _$LastCrawlInfoFromJson(Map<String, dynamic> json) {
  return LastCrawlInfo(
    errorMessage: json['ErrorMessage'] as String,
    logGroup: json['LogGroup'] as String,
    logStream: json['LogStream'] as String,
    messagePrefix: json['MessagePrefix'] as String,
    startTime: unixFromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$LastCrawlStatusEnumMap, json['Status']),
  );
}

const _$LastCrawlStatusEnumMap = {
  LastCrawlStatus.succeeded: 'SUCCEEDED',
  LastCrawlStatus.cancelled: 'CANCELLED',
  LastCrawlStatus.failed: 'FAILED',
};

ListCrawlersResponse _$ListCrawlersResponseFromJson(Map<String, dynamic> json) {
  return ListCrawlersResponse(
    crawlerNames:
        (json['CrawlerNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDevEndpointsResponse _$ListDevEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDevEndpointsResponse(
    devEndpointNames:
        (json['DevEndpointNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobNames: (json['JobNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMLTransformsResponse _$ListMLTransformsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMLTransformsResponse(
    transformIds:
        (json['TransformIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTriggersResponse _$ListTriggersResponseFromJson(Map<String, dynamic> json) {
  return ListTriggersResponse(
    nextToken: json['NextToken'] as String,
    triggerNames:
        (json['TriggerNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListWorkflowsResponse _$ListWorkflowsResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkflowsResponse(
    nextToken: json['NextToken'] as String,
    workflows: (json['Workflows'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DynamoDB', instance.dynamoDB?.map((e) => e?.toJson())?.toList());
  writeNotNull('Jdbc', instance.jdbc?.map((e) => e?.toJson())?.toList());
  writeNotNull('S3', instance.s3?.map((e) => e?.toJson())?.toList());
  return val;
}

MLTransform _$MLTransformFromJson(Map<String, dynamic> json) {
  return MLTransform(
    createdOn: unixFromJson(json['CreatedOn']),
    description: json['Description'] as String,
    evaluationMetrics: json['EvaluationMetrics'] == null
        ? null
        : EvaluationMetrics.fromJson(
            json['EvaluationMetrics'] as Map<String, dynamic>),
    glueVersion: json['GlueVersion'] as String,
    inputRecordTables: (json['InputRecordTables'] as List)
        ?.map((e) =>
            e == null ? null : GlueTable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    labelCount: json['LabelCount'] as int,
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    maxCapacity: (json['MaxCapacity'] as num)?.toDouble(),
    maxRetries: json['MaxRetries'] as int,
    name: json['Name'] as String,
    numberOfWorkers: json['NumberOfWorkers'] as int,
    parameters: json['Parameters'] == null
        ? null
        : TransformParameters.fromJson(
            json['Parameters'] as Map<String, dynamic>),
    role: json['Role'] as String,
    schema: (json['Schema'] as List)
        ?.map((e) =>
            e == null ? null : SchemaColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$TransformStatusTypeEnumMap, json['Status']),
    timeout: json['Timeout'] as int,
    transformId: json['TransformId'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
  );
}

MappingEntry _$MappingEntryFromJson(Map<String, dynamic> json) {
  return MappingEntry(
    sourcePath: json['SourcePath'] as String,
    sourceTable: json['SourceTable'] as String,
    sourceType: json['SourceType'] as String,
    targetPath: json['TargetPath'] as String,
    targetTable: json['TargetTable'] as String,
    targetType: json['TargetType'] as String,
  );
}

Map<String, dynamic> _$MappingEntryToJson(MappingEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourcePath', instance.sourcePath);
  writeNotNull('SourceTable', instance.sourceTable);
  writeNotNull('SourceType', instance.sourceType);
  writeNotNull('TargetPath', instance.targetPath);
  writeNotNull('TargetTable', instance.targetTable);
  writeNotNull('TargetType', instance.targetType);
  return val;
}

Node _$NodeFromJson(Map<String, dynamic> json) {
  return Node(
    crawlerDetails: json['CrawlerDetails'] == null
        ? null
        : CrawlerNodeDetails.fromJson(
            json['CrawlerDetails'] as Map<String, dynamic>),
    jobDetails: json['JobDetails'] == null
        ? null
        : JobNodeDetails.fromJson(json['JobDetails'] as Map<String, dynamic>),
    name: json['Name'] as String,
    triggerDetails: json['TriggerDetails'] == null
        ? null
        : TriggerNodeDetails.fromJson(
            json['TriggerDetails'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$NodeTypeEnumMap, json['Type']),
    uniqueId: json['UniqueId'] as String,
  );
}

const _$NodeTypeEnumMap = {
  NodeType.crawler: 'CRAWLER',
  NodeType.job: 'JOB',
  NodeType.trigger: 'TRIGGER',
};

NotificationProperty _$NotificationPropertyFromJson(Map<String, dynamic> json) {
  return NotificationProperty(
    notifyDelayAfter: json['NotifyDelayAfter'] as int,
  );
}

Map<String, dynamic> _$NotificationPropertyToJson(
    NotificationProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotifyDelayAfter', instance.notifyDelayAfter);
  return val;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    column: json['Column'] as String,
    sortOrder: json['SortOrder'] as int,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Column', instance.column);
  writeNotNull('SortOrder', instance.sortOrder);
  return val;
}

Partition _$PartitionFromJson(Map<String, dynamic> json) {
  return Partition(
    creationTime: unixFromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    lastAccessTime: unixFromJson(json['LastAccessTime']),
    lastAnalyzedTime: unixFromJson(json['LastAnalyzedTime']),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    storageDescriptor: json['StorageDescriptor'] == null
        ? null
        : StorageDescriptor.fromJson(
            json['StorageDescriptor'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

PartitionError _$PartitionErrorFromJson(Map<String, dynamic> json) {
  return PartitionError(
    errorDetail: json['ErrorDetail'] == null
        ? null
        : ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>),
    partitionValues:
        (json['PartitionValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PartitionInputToJson(PartitionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LastAccessTime', unixToJson(instance.lastAccessTime));
  writeNotNull('LastAnalyzedTime', unixToJson(instance.lastAnalyzedTime));
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('StorageDescriptor', instance.storageDescriptor?.toJson());
  writeNotNull('Values', instance.values);
  return val;
}

PartitionValueList _$PartitionValueListFromJson(Map<String, dynamic> json) {
  return PartitionValueList(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PartitionValueListToJson(PartitionValueList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

PhysicalConnectionRequirements _$PhysicalConnectionRequirementsFromJson(
    Map<String, dynamic> json) {
  return PhysicalConnectionRequirements(
    availabilityZone: json['AvailabilityZone'] as String,
    securityGroupIdList: (json['SecurityGroupIdList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    subnetId: json['SubnetId'] as String,
  );
}

Map<String, dynamic> _$PhysicalConnectionRequirementsToJson(
    PhysicalConnectionRequirements instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('SecurityGroupIdList', instance.securityGroupIdList);
  writeNotNull('SubnetId', instance.subnetId);
  return val;
}

Predecessor _$PredecessorFromJson(Map<String, dynamic> json) {
  return Predecessor(
    jobName: json['JobName'] as String,
    runId: json['RunId'] as String,
  );
}

Predicate _$PredicateFromJson(Map<String, dynamic> json) {
  return Predicate(
    conditions: (json['Conditions'] as List)
        ?.map((e) =>
            e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    logical: _$enumDecodeNullable(_$LogicalEnumMap, json['Logical']),
  );
}

Map<String, dynamic> _$PredicateToJson(Predicate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Conditions', instance.conditions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Logical', _$LogicalEnumMap[instance.logical]);
  return val;
}

const _$LogicalEnumMap = {
  Logical.and: 'AND',
  Logical.any: 'ANY',
};

PrincipalPermissions _$PrincipalPermissionsFromJson(Map<String, dynamic> json) {
  return PrincipalPermissions(
    permissions:
        (json['Permissions'] as List)?.map((e) => e as String)?.toList(),
    principal: json['Principal'] == null
        ? null
        : DataLakePrincipal.fromJson(json['Principal'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrincipalPermissionsToJson(
    PrincipalPermissions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Permissions', instance.permissions);
  writeNotNull('Principal', instance.principal?.toJson());
  return val;
}

Map<String, dynamic> _$PropertyPredicateToJson(PropertyPredicate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparator', _$ComparatorEnumMap[instance.comparator]);
  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ComparatorEnumMap = {
  Comparator.equals: 'EQUALS',
  Comparator.greaterThan: 'GREATER_THAN',
  Comparator.lessThan: 'LESS_THAN',
  Comparator.greaterThanEquals: 'GREATER_THAN_EQUALS',
  Comparator.lessThanEquals: 'LESS_THAN_EQUALS',
};

PutDataCatalogEncryptionSettingsResponse
    _$PutDataCatalogEncryptionSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return PutDataCatalogEncryptionSettingsResponse();
}

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse(
    policyHash: json['PolicyHash'] as String,
  );
}

PutWorkflowRunPropertiesResponse _$PutWorkflowRunPropertiesResponseFromJson(
    Map<String, dynamic> json) {
  return PutWorkflowRunPropertiesResponse();
}

ResetJobBookmarkResponse _$ResetJobBookmarkResponseFromJson(
    Map<String, dynamic> json) {
  return ResetJobBookmarkResponse(
    jobBookmarkEntry: json['JobBookmarkEntry'] == null
        ? null
        : JobBookmarkEntry.fromJson(
            json['JobBookmarkEntry'] as Map<String, dynamic>),
  );
}

ResourceUri _$ResourceUriFromJson(Map<String, dynamic> json) {
  return ResourceUri(
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
    uri: json['Uri'] as String,
  );
}

Map<String, dynamic> _$ResourceUriToJson(ResourceUri instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  writeNotNull('Uri', instance.uri);
  return val;
}

const _$ResourceTypeEnumMap = {
  ResourceType.jar: 'JAR',
  ResourceType.file: 'FILE',
  ResourceType.archive: 'ARCHIVE',
};

S3Encryption _$S3EncryptionFromJson(Map<String, dynamic> json) {
  return S3Encryption(
    kmsKeyArn: json['KmsKeyArn'] as String,
    s3EncryptionMode: _$enumDecodeNullable(
        _$S3EncryptionModeEnumMap, json['S3EncryptionMode']),
  );
}

Map<String, dynamic> _$S3EncryptionToJson(S3Encryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  writeNotNull(
      'S3EncryptionMode', _$S3EncryptionModeEnumMap[instance.s3EncryptionMode]);
  return val;
}

const _$S3EncryptionModeEnumMap = {
  S3EncryptionMode.disabled: 'DISABLED',
  S3EncryptionMode.sseKms: 'SSE-KMS',
  S3EncryptionMode.sseS3: 'SSE-S3',
};

S3Target _$S3TargetFromJson(Map<String, dynamic> json) {
  return S3Target(
    exclusions: (json['Exclusions'] as List)?.map((e) => e as String)?.toList(),
    path: json['Path'] as String,
  );
}

Map<String, dynamic> _$S3TargetToJson(S3Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Exclusions', instance.exclusions);
  writeNotNull('Path', instance.path);
  return val;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    scheduleExpression: json['ScheduleExpression'] as String,
    state: _$enumDecodeNullable(_$ScheduleStateEnumMap, json['State']),
  );
}

const _$ScheduleStateEnumMap = {
  ScheduleState.scheduled: 'SCHEDULED',
  ScheduleState.notScheduled: 'NOT_SCHEDULED',
  ScheduleState.transitioning: 'TRANSITIONING',
};

SchemaChangePolicy _$SchemaChangePolicyFromJson(Map<String, dynamic> json) {
  return SchemaChangePolicy(
    deleteBehavior:
        _$enumDecodeNullable(_$DeleteBehaviorEnumMap, json['DeleteBehavior']),
    updateBehavior:
        _$enumDecodeNullable(_$UpdateBehaviorEnumMap, json['UpdateBehavior']),
  );
}

Map<String, dynamic> _$SchemaChangePolicyToJson(SchemaChangePolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DeleteBehavior', _$DeleteBehaviorEnumMap[instance.deleteBehavior]);
  writeNotNull(
      'UpdateBehavior', _$UpdateBehaviorEnumMap[instance.updateBehavior]);
  return val;
}

const _$DeleteBehaviorEnumMap = {
  DeleteBehavior.log: 'LOG',
  DeleteBehavior.deleteFromDatabase: 'DELETE_FROM_DATABASE',
  DeleteBehavior.deprecateInDatabase: 'DEPRECATE_IN_DATABASE',
};

const _$UpdateBehaviorEnumMap = {
  UpdateBehavior.log: 'LOG',
  UpdateBehavior.updateInDatabase: 'UPDATE_IN_DATABASE',
};

SchemaColumn _$SchemaColumnFromJson(Map<String, dynamic> json) {
  return SchemaColumn(
    dataType: json['DataType'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SchemaColumnToJson(SchemaColumn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataType', instance.dataType);
  writeNotNull('Name', instance.name);
  return val;
}

SearchTablesResponse _$SearchTablesResponseFromJson(Map<String, dynamic> json) {
  return SearchTablesResponse(
    nextToken: json['NextToken'] as String,
    tableList: (json['TableList'] as List)
        ?.map(
            (e) => e == null ? null : Table.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SecurityConfiguration _$SecurityConfigurationFromJson(
    Map<String, dynamic> json) {
  return SecurityConfiguration(
    createdTimeStamp: unixFromJson(json['CreatedTimeStamp']),
    encryptionConfiguration: json['EncryptionConfiguration'] == null
        ? null
        : EncryptionConfiguration.fromJson(
            json['EncryptionConfiguration'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SegmentToJson(Segment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SegmentNumber', instance.segmentNumber);
  writeNotNull('TotalSegments', instance.totalSegments);
  return val;
}

SerDeInfo _$SerDeInfoFromJson(Map<String, dynamic> json) {
  return SerDeInfo(
    name: json['Name'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    serializationLibrary: json['SerializationLibrary'] as String,
  );
}

Map<String, dynamic> _$SerDeInfoToJson(SerDeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('SerializationLibrary', instance.serializationLibrary);
  return val;
}

SkewedInfo _$SkewedInfoFromJson(Map<String, dynamic> json) {
  return SkewedInfo(
    skewedColumnNames:
        (json['SkewedColumnNames'] as List)?.map((e) => e as String)?.toList(),
    skewedColumnValueLocationMaps:
        (json['SkewedColumnValueLocationMaps'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    skewedColumnValues:
        (json['SkewedColumnValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SkewedInfoToJson(SkewedInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SkewedColumnNames', instance.skewedColumnNames);
  writeNotNull(
      'SkewedColumnValueLocationMaps', instance.skewedColumnValueLocationMaps);
  writeNotNull('SkewedColumnValues', instance.skewedColumnValues);
  return val;
}

Map<String, dynamic> _$SortCriterionToJson(SortCriterion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldName', instance.fieldName);
  writeNotNull('Sort', _$SortEnumMap[instance.sort]);
  return val;
}

const _$SortEnumMap = {
  Sort.asc: 'ASC',
  Sort.desc: 'DESC',
};

StartCrawlerResponse _$StartCrawlerResponseFromJson(Map<String, dynamic> json) {
  return StartCrawlerResponse();
}

StartCrawlerScheduleResponse _$StartCrawlerScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return StartCrawlerScheduleResponse();
}

StartExportLabelsTaskRunResponse _$StartExportLabelsTaskRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartExportLabelsTaskRunResponse(
    taskRunId: json['TaskRunId'] as String,
  );
}

StartImportLabelsTaskRunResponse _$StartImportLabelsTaskRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartImportLabelsTaskRunResponse(
    taskRunId: json['TaskRunId'] as String,
  );
}

StartJobRunResponse _$StartJobRunResponseFromJson(Map<String, dynamic> json) {
  return StartJobRunResponse(
    jobRunId: json['JobRunId'] as String,
  );
}

StartMLEvaluationTaskRunResponse _$StartMLEvaluationTaskRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartMLEvaluationTaskRunResponse(
    taskRunId: json['TaskRunId'] as String,
  );
}

StartMLLabelingSetGenerationTaskRunResponse
    _$StartMLLabelingSetGenerationTaskRunResponseFromJson(
        Map<String, dynamic> json) {
  return StartMLLabelingSetGenerationTaskRunResponse(
    taskRunId: json['TaskRunId'] as String,
  );
}

StartTriggerResponse _$StartTriggerResponseFromJson(Map<String, dynamic> json) {
  return StartTriggerResponse(
    name: json['Name'] as String,
  );
}

StartWorkflowRunResponse _$StartWorkflowRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartWorkflowRunResponse(
    runId: json['RunId'] as String,
  );
}

StopCrawlerResponse _$StopCrawlerResponseFromJson(Map<String, dynamic> json) {
  return StopCrawlerResponse();
}

StopCrawlerScheduleResponse _$StopCrawlerScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return StopCrawlerScheduleResponse();
}

StopTriggerResponse _$StopTriggerResponseFromJson(Map<String, dynamic> json) {
  return StopTriggerResponse(
    name: json['Name'] as String,
  );
}

StorageDescriptor _$StorageDescriptorFromJson(Map<String, dynamic> json) {
  return StorageDescriptor(
    bucketColumns:
        (json['BucketColumns'] as List)?.map((e) => e as String)?.toList(),
    columns: (json['Columns'] as List)
        ?.map((e) =>
            e == null ? null : Column.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    compressed: json['Compressed'] as bool,
    inputFormat: json['InputFormat'] as String,
    location: json['Location'] as String,
    numberOfBuckets: json['NumberOfBuckets'] as int,
    outputFormat: json['OutputFormat'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    serdeInfo: json['SerdeInfo'] == null
        ? null
        : SerDeInfo.fromJson(json['SerdeInfo'] as Map<String, dynamic>),
    skewedInfo: json['SkewedInfo'] == null
        ? null
        : SkewedInfo.fromJson(json['SkewedInfo'] as Map<String, dynamic>),
    sortColumns: (json['SortColumns'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storedAsSubDirectories: json['StoredAsSubDirectories'] as bool,
  );
}

Map<String, dynamic> _$StorageDescriptorToJson(StorageDescriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketColumns', instance.bucketColumns);
  writeNotNull('Columns', instance.columns?.map((e) => e?.toJson())?.toList());
  writeNotNull('Compressed', instance.compressed);
  writeNotNull('InputFormat', instance.inputFormat);
  writeNotNull('Location', instance.location);
  writeNotNull('NumberOfBuckets', instance.numberOfBuckets);
  writeNotNull('OutputFormat', instance.outputFormat);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('SerdeInfo', instance.serdeInfo?.toJson());
  writeNotNull('SkewedInfo', instance.skewedInfo?.toJson());
  writeNotNull(
      'SortColumns', instance.sortColumns?.map((e) => e?.toJson())?.toList());
  writeNotNull('StoredAsSubDirectories', instance.storedAsSubDirectories);
  return val;
}

Table _$TableFromJson(Map<String, dynamic> json) {
  return Table(
    name: json['Name'] as String,
    createTime: unixFromJson(json['CreateTime']),
    createdBy: json['CreatedBy'] as String,
    databaseName: json['DatabaseName'] as String,
    description: json['Description'] as String,
    isRegisteredWithLakeFormation:
        json['IsRegisteredWithLakeFormation'] as bool,
    lastAccessTime: unixFromJson(json['LastAccessTime']),
    lastAnalyzedTime: unixFromJson(json['LastAnalyzedTime']),
    owner: json['Owner'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    partitionKeys: (json['PartitionKeys'] as List)
        ?.map((e) =>
            e == null ? null : Column.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    retention: json['Retention'] as int,
    storageDescriptor: json['StorageDescriptor'] == null
        ? null
        : StorageDescriptor.fromJson(
            json['StorageDescriptor'] as Map<String, dynamic>),
    tableType: json['TableType'] as String,
    updateTime: unixFromJson(json['UpdateTime']),
    viewExpandedText: json['ViewExpandedText'] as String,
    viewOriginalText: json['ViewOriginalText'] as String,
  );
}

TableError _$TableErrorFromJson(Map<String, dynamic> json) {
  return TableError(
    errorDetail: json['ErrorDetail'] == null
        ? null
        : ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$TableInputToJson(TableInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('LastAccessTime', unixToJson(instance.lastAccessTime));
  writeNotNull('LastAnalyzedTime', unixToJson(instance.lastAnalyzedTime));
  writeNotNull('Owner', instance.owner);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('PartitionKeys',
      instance.partitionKeys?.map((e) => e?.toJson())?.toList());
  writeNotNull('Retention', instance.retention);
  writeNotNull('StorageDescriptor', instance.storageDescriptor?.toJson());
  writeNotNull('TableType', instance.tableType);
  writeNotNull('ViewExpandedText', instance.viewExpandedText);
  writeNotNull('ViewOriginalText', instance.viewOriginalText);
  return val;
}

TableVersion _$TableVersionFromJson(Map<String, dynamic> json) {
  return TableVersion(
    table: json['Table'] == null
        ? null
        : Table.fromJson(json['Table'] as Map<String, dynamic>),
    versionId: json['VersionId'] as String,
  );
}

TableVersionError _$TableVersionErrorFromJson(Map<String, dynamic> json) {
  return TableVersionError(
    errorDetail: json['ErrorDetail'] == null
        ? null
        : ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    versionId: json['VersionId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TaskRun _$TaskRunFromJson(Map<String, dynamic> json) {
  return TaskRun(
    completedOn: unixFromJson(json['CompletedOn']),
    errorString: json['ErrorString'] as String,
    executionTime: json['ExecutionTime'] as int,
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    logGroupName: json['LogGroupName'] as String,
    properties: json['Properties'] == null
        ? null
        : TaskRunProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    startedOn: unixFromJson(json['StartedOn']),
    status: _$enumDecodeNullable(_$TaskStatusTypeEnumMap, json['Status']),
    taskRunId: json['TaskRunId'] as String,
    transformId: json['TransformId'] as String,
  );
}

Map<String, dynamic> _$TaskRunFilterCriteriaToJson(
    TaskRunFilterCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartedAfter', unixToJson(instance.startedAfter));
  writeNotNull('StartedBefore', unixToJson(instance.startedBefore));
  writeNotNull('Status', _$TaskStatusTypeEnumMap[instance.status]);
  writeNotNull('TaskRunType', _$TaskTypeEnumMap[instance.taskRunType]);
  return val;
}

const _$TaskTypeEnumMap = {
  TaskType.evaluation: 'EVALUATION',
  TaskType.labelingSetGeneration: 'LABELING_SET_GENERATION',
  TaskType.importLabels: 'IMPORT_LABELS',
  TaskType.exportLabels: 'EXPORT_LABELS',
  TaskType.findMatches: 'FIND_MATCHES',
};

TaskRunProperties _$TaskRunPropertiesFromJson(Map<String, dynamic> json) {
  return TaskRunProperties(
    exportLabelsTaskRunProperties: json['ExportLabelsTaskRunProperties'] == null
        ? null
        : ExportLabelsTaskRunProperties.fromJson(
            json['ExportLabelsTaskRunProperties'] as Map<String, dynamic>),
    findMatchesTaskRunProperties: json['FindMatchesTaskRunProperties'] == null
        ? null
        : FindMatchesTaskRunProperties.fromJson(
            json['FindMatchesTaskRunProperties'] as Map<String, dynamic>),
    importLabelsTaskRunProperties: json['ImportLabelsTaskRunProperties'] == null
        ? null
        : ImportLabelsTaskRunProperties.fromJson(
            json['ImportLabelsTaskRunProperties'] as Map<String, dynamic>),
    labelingSetGenerationTaskRunProperties:
        json['LabelingSetGenerationTaskRunProperties'] == null
            ? null
            : LabelingSetGenerationTaskRunProperties.fromJson(
                json['LabelingSetGenerationTaskRunProperties']
                    as Map<String, dynamic>),
    taskType: _$enumDecodeNullable(_$TaskTypeEnumMap, json['TaskType']),
  );
}

Map<String, dynamic> _$TaskRunSortCriteriaToJson(TaskRunSortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Column', _$TaskRunSortColumnTypeEnumMap[instance.column]);
  writeNotNull(
      'SortDirection', _$SortDirectionTypeEnumMap[instance.sortDirection]);
  return val;
}

const _$TaskRunSortColumnTypeEnumMap = {
  TaskRunSortColumnType.taskRunType: 'TASK_RUN_TYPE',
  TaskRunSortColumnType.status: 'STATUS',
  TaskRunSortColumnType.started: 'STARTED',
};

const _$SortDirectionTypeEnumMap = {
  SortDirectionType.descending: 'DESCENDING',
  SortDirectionType.ascending: 'ASCENDING',
};

Map<String, dynamic> _$TransformFilterCriteriaToJson(
    TransformFilterCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAfter', unixToJson(instance.createdAfter));
  writeNotNull('CreatedBefore', unixToJson(instance.createdBefore));
  writeNotNull('GlueVersion', instance.glueVersion);
  writeNotNull('LastModifiedAfter', unixToJson(instance.lastModifiedAfter));
  writeNotNull('LastModifiedBefore', unixToJson(instance.lastModifiedBefore));
  writeNotNull('Name', instance.name);
  writeNotNull('Schema', instance.schema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Status', _$TransformStatusTypeEnumMap[instance.status]);
  writeNotNull('TransformType', _$TransformTypeEnumMap[instance.transformType]);
  return val;
}

TransformParameters _$TransformParametersFromJson(Map<String, dynamic> json) {
  return TransformParameters(
    transformType:
        _$enumDecodeNullable(_$TransformTypeEnumMap, json['TransformType']),
    findMatchesParameters: json['FindMatchesParameters'] == null
        ? null
        : FindMatchesParameters.fromJson(
            json['FindMatchesParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransformParametersToJson(TransformParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TransformType', _$TransformTypeEnumMap[instance.transformType]);
  writeNotNull(
      'FindMatchesParameters', instance.findMatchesParameters?.toJson());
  return val;
}

Map<String, dynamic> _$TransformSortCriteriaToJson(
    TransformSortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Column', _$TransformSortColumnTypeEnumMap[instance.column]);
  writeNotNull(
      'SortDirection', _$SortDirectionTypeEnumMap[instance.sortDirection]);
  return val;
}

const _$TransformSortColumnTypeEnumMap = {
  TransformSortColumnType.name: 'NAME',
  TransformSortColumnType.transformType: 'TRANSFORM_TYPE',
  TransformSortColumnType.status: 'STATUS',
  TransformSortColumnType.created: 'CREATED',
  TransformSortColumnType.lastModified: 'LAST_MODIFIED',
};

Trigger _$TriggerFromJson(Map<String, dynamic> json) {
  return Trigger(
    actions: (json['Actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    predicate: json['Predicate'] == null
        ? null
        : Predicate.fromJson(json['Predicate'] as Map<String, dynamic>),
    schedule: json['Schedule'] as String,
    state: _$enumDecodeNullable(_$TriggerStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$TriggerTypeEnumMap, json['Type']),
    workflowName: json['WorkflowName'] as String,
  );
}

const _$TriggerStateEnumMap = {
  TriggerState.creating: 'CREATING',
  TriggerState.created: 'CREATED',
  TriggerState.activating: 'ACTIVATING',
  TriggerState.activated: 'ACTIVATED',
  TriggerState.deactivating: 'DEACTIVATING',
  TriggerState.deactivated: 'DEACTIVATED',
  TriggerState.deleting: 'DELETING',
  TriggerState.updating: 'UPDATING',
};

const _$TriggerTypeEnumMap = {
  TriggerType.scheduled: 'SCHEDULED',
  TriggerType.conditional: 'CONDITIONAL',
  TriggerType.onDemand: 'ON_DEMAND',
};

TriggerNodeDetails _$TriggerNodeDetailsFromJson(Map<String, dynamic> json) {
  return TriggerNodeDetails(
    trigger: json['Trigger'] == null
        ? null
        : Trigger.fromJson(json['Trigger'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TriggerUpdateToJson(TriggerUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('Predicate', instance.predicate?.toJson());
  writeNotNull('Schedule', instance.schedule);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateClassifierResponse _$UpdateClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClassifierResponse();
}

UpdateConnectionResponse _$UpdateConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConnectionResponse();
}

UpdateCrawlerResponse _$UpdateCrawlerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCrawlerResponse();
}

UpdateCrawlerScheduleResponse _$UpdateCrawlerScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCrawlerScheduleResponse();
}

Map<String, dynamic> _$UpdateCsvClassifierRequestToJson(
    UpdateCsvClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AllowSingleColumn', instance.allowSingleColumn);
  writeNotNull(
      'ContainsHeader', _$CsvHeaderOptionEnumMap[instance.containsHeader]);
  writeNotNull('Delimiter', instance.delimiter);
  writeNotNull('DisableValueTrimming', instance.disableValueTrimming);
  writeNotNull('Header', instance.header);
  writeNotNull('QuoteSymbol', instance.quoteSymbol);
  return val;
}

UpdateDatabaseResponse _$UpdateDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDatabaseResponse();
}

UpdateDevEndpointResponse _$UpdateDevEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDevEndpointResponse();
}

Map<String, dynamic> _$UpdateGrokClassifierRequestToJson(
    UpdateGrokClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Classification', instance.classification);
  writeNotNull('CustomPatterns', instance.customPatterns);
  writeNotNull('GrokPattern', instance.grokPattern);
  return val;
}

UpdateJobResponse _$UpdateJobResponseFromJson(Map<String, dynamic> json) {
  return UpdateJobResponse(
    jobName: json['JobName'] as String,
  );
}

Map<String, dynamic> _$UpdateJsonClassifierRequestToJson(
    UpdateJsonClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('JsonPath', instance.jsonPath);
  return val;
}

UpdateMLTransformResponse _$UpdateMLTransformResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMLTransformResponse(
    transformId: json['TransformId'] as String,
  );
}

UpdatePartitionResponse _$UpdatePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePartitionResponse();
}

UpdateTableResponse _$UpdateTableResponseFromJson(Map<String, dynamic> json) {
  return UpdateTableResponse();
}

UpdateTriggerResponse _$UpdateTriggerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTriggerResponse(
    trigger: json['Trigger'] == null
        ? null
        : Trigger.fromJson(json['Trigger'] as Map<String, dynamic>),
  );
}

UpdateUserDefinedFunctionResponse _$UpdateUserDefinedFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserDefinedFunctionResponse();
}

UpdateWorkflowResponse _$UpdateWorkflowResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkflowResponse(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$UpdateXMLClassifierRequestToJson(
    UpdateXMLClassifierRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Classification', instance.classification);
  writeNotNull('RowTag', instance.rowTag);
  return val;
}

UserDefinedFunction _$UserDefinedFunctionFromJson(Map<String, dynamic> json) {
  return UserDefinedFunction(
    className: json['ClassName'] as String,
    createTime: unixFromJson(json['CreateTime']),
    functionName: json['FunctionName'] as String,
    ownerName: json['OwnerName'] as String,
    ownerType: _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['OwnerType']),
    resourceUris: (json['ResourceUris'] as List)
        ?.map((e) =>
            e == null ? null : ResourceUri.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$PrincipalTypeEnumMap = {
  PrincipalType.user: 'USER',
  PrincipalType.role: 'ROLE',
  PrincipalType.group: 'GROUP',
};

Map<String, dynamic> _$UserDefinedFunctionInputToJson(
    UserDefinedFunctionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClassName', instance.className);
  writeNotNull('FunctionName', instance.functionName);
  writeNotNull('OwnerName', instance.ownerName);
  writeNotNull('OwnerType', _$PrincipalTypeEnumMap[instance.ownerType]);
  writeNotNull(
      'ResourceUris', instance.resourceUris?.map((e) => e?.toJson())?.toList());
  return val;
}

Workflow _$WorkflowFromJson(Map<String, dynamic> json) {
  return Workflow(
    createdOn: unixFromJson(json['CreatedOn']),
    defaultRunProperties:
        (json['DefaultRunProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['Description'] as String,
    graph: json['Graph'] == null
        ? null
        : WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>),
    lastModifiedOn: unixFromJson(json['LastModifiedOn']),
    lastRun: json['LastRun'] == null
        ? null
        : WorkflowRun.fromJson(json['LastRun'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

WorkflowGraph _$WorkflowGraphFromJson(Map<String, dynamic> json) {
  return WorkflowGraph(
    edges: (json['Edges'] as List)
        ?.map(
            (e) => e == null ? null : Edge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nodes: (json['Nodes'] as List)
        ?.map(
            (e) => e == null ? null : Node.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

WorkflowRun _$WorkflowRunFromJson(Map<String, dynamic> json) {
  return WorkflowRun(
    completedOn: unixFromJson(json['CompletedOn']),
    graph: json['Graph'] == null
        ? null
        : WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>),
    name: json['Name'] as String,
    startedOn: unixFromJson(json['StartedOn']),
    statistics: json['Statistics'] == null
        ? null
        : WorkflowRunStatistics.fromJson(
            json['Statistics'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$WorkflowRunStatusEnumMap, json['Status']),
    workflowRunId: json['WorkflowRunId'] as String,
    workflowRunProperties:
        (json['WorkflowRunProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$WorkflowRunStatusEnumMap = {
  WorkflowRunStatus.running: 'RUNNING',
  WorkflowRunStatus.completed: 'COMPLETED',
};

WorkflowRunStatistics _$WorkflowRunStatisticsFromJson(
    Map<String, dynamic> json) {
  return WorkflowRunStatistics(
    failedActions: json['FailedActions'] as int,
    runningActions: json['RunningActions'] as int,
    stoppedActions: json['StoppedActions'] as int,
    succeededActions: json['SucceededActions'] as int,
    timeoutActions: json['TimeoutActions'] as int,
    totalActions: json['TotalActions'] as int,
  );
}

XMLClassifier _$XMLClassifierFromJson(Map<String, dynamic> json) {
  return XMLClassifier(
    classification: json['Classification'] as String,
    name: json['Name'] as String,
    creationTime: unixFromJson(json['CreationTime']),
    lastUpdated: unixFromJson(json['LastUpdated']),
    rowTag: json['RowTag'] as String,
    version: json['Version'] as int,
  );
}
