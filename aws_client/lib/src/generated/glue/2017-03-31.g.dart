// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-03-31.dart';

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

BackfillError _$BackfillErrorFromJson(Map<String, dynamic> json) {
  return BackfillError(
    code: _$enumDecodeNullable(_$BackfillErrorCodeEnumMap, json['Code']),
    partitions: (json['Partitions'] as List)
        ?.map((e) => e == null
            ? null
            : PartitionValueList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

const _$BackfillErrorCodeEnumMap = {
  BackfillErrorCode.encryptedPartitionError: 'ENCRYPTED_PARTITION_ERROR',
  BackfillErrorCode.internalError: 'INTERNAL_ERROR',
  BackfillErrorCode.invalidPartitionTypeDataError:
      'INVALID_PARTITION_TYPE_DATA_ERROR',
  BackfillErrorCode.missingPartitionValueError: 'MISSING_PARTITION_VALUE_ERROR',
  BackfillErrorCode.unsupportedPartitionCharacterError:
      'UNSUPPORTED_PARTITION_CHARACTER_ERROR',
};

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

BatchUpdatePartitionFailureEntry _$BatchUpdatePartitionFailureEntryFromJson(
    Map<String, dynamic> json) {
  return BatchUpdatePartitionFailureEntry(
    errorDetail: json['ErrorDetail'] == null
        ? null
        : ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>),
    partitionValueList:
        (json['PartitionValueList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BatchUpdatePartitionRequestEntryToJson(
    BatchUpdatePartitionRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PartitionInput', instance.partitionInput?.toJson());
  writeNotNull('PartitionValueList', instance.partitionValueList);
  return val;
}

BatchUpdatePartitionResponse _$BatchUpdatePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdatePartitionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchUpdatePartitionFailureEntry.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BinaryColumnStatisticsData _$BinaryColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return BinaryColumnStatisticsData(
    averageLength: (json['AverageLength'] as num)?.toDouble(),
    maximumLength: json['MaximumLength'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
  );
}

Map<String, dynamic> _$BinaryColumnStatisticsDataToJson(
    BinaryColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AverageLength', instance.averageLength);
  writeNotNull('MaximumLength', instance.maximumLength);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  return val;
}

BooleanColumnStatisticsData _$BooleanColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return BooleanColumnStatisticsData(
    numberOfFalses: json['NumberOfFalses'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
    numberOfTrues: json['NumberOfTrues'] as int,
  );
}

Map<String, dynamic> _$BooleanColumnStatisticsDataToJson(
    BooleanColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberOfFalses', instance.numberOfFalses);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  writeNotNull('NumberOfTrues', instance.numberOfTrues);
  return val;
}

CancelMLTaskRunResponse _$CancelMLTaskRunResponseFromJson(
    Map<String, dynamic> json) {
  return CancelMLTaskRunResponse(
    status: _$enumDecodeNullable(_$TaskStatusTypeEnumMap, json['Status']),
    taskRunId: json['TaskRunId'] as String,
    transformId: json['TransformId'] as String,
  );
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
    importTime: const UnixDateTimeConverter().fromJson(json['ImportTime']),
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

CheckSchemaVersionValidityResponse _$CheckSchemaVersionValidityResponseFromJson(
    Map<String, dynamic> json) {
  return CheckSchemaVersionValidityResponse(
    error: json['Error'] as String,
    valid: json['Valid'] as bool,
  );
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

ColumnError _$ColumnErrorFromJson(Map<String, dynamic> json) {
  return ColumnError(
    columnName: json['ColumnName'] as String,
    error: json['Error'] == null
        ? null
        : ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>),
  );
}

ColumnImportance _$ColumnImportanceFromJson(Map<String, dynamic> json) {
  return ColumnImportance(
    columnName: json['ColumnName'] as String,
    importance: (json['Importance'] as num)?.toDouble(),
  );
}

ColumnStatistics _$ColumnStatisticsFromJson(Map<String, dynamic> json) {
  return ColumnStatistics(
    analyzedTime: const UnixDateTimeConverter().fromJson(json['AnalyzedTime']),
    columnName: json['ColumnName'] as String,
    columnType: json['ColumnType'] as String,
    statisticsData: json['StatisticsData'] == null
        ? null
        : ColumnStatisticsData.fromJson(
            json['StatisticsData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ColumnStatisticsToJson(ColumnStatistics instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnalyzedTime',
      const UnixDateTimeConverter().toJson(instance.analyzedTime));
  writeNotNull('ColumnName', instance.columnName);
  writeNotNull('ColumnType', instance.columnType);
  writeNotNull('StatisticsData', instance.statisticsData?.toJson());
  return val;
}

ColumnStatisticsData _$ColumnStatisticsDataFromJson(Map<String, dynamic> json) {
  return ColumnStatisticsData(
    type: _$enumDecodeNullable(_$ColumnStatisticsTypeEnumMap, json['Type']),
    binaryColumnStatisticsData: json['BinaryColumnStatisticsData'] == null
        ? null
        : BinaryColumnStatisticsData.fromJson(
            json['BinaryColumnStatisticsData'] as Map<String, dynamic>),
    booleanColumnStatisticsData: json['BooleanColumnStatisticsData'] == null
        ? null
        : BooleanColumnStatisticsData.fromJson(
            json['BooleanColumnStatisticsData'] as Map<String, dynamic>),
    dateColumnStatisticsData: json['DateColumnStatisticsData'] == null
        ? null
        : DateColumnStatisticsData.fromJson(
            json['DateColumnStatisticsData'] as Map<String, dynamic>),
    decimalColumnStatisticsData: json['DecimalColumnStatisticsData'] == null
        ? null
        : DecimalColumnStatisticsData.fromJson(
            json['DecimalColumnStatisticsData'] as Map<String, dynamic>),
    doubleColumnStatisticsData: json['DoubleColumnStatisticsData'] == null
        ? null
        : DoubleColumnStatisticsData.fromJson(
            json['DoubleColumnStatisticsData'] as Map<String, dynamic>),
    longColumnStatisticsData: json['LongColumnStatisticsData'] == null
        ? null
        : LongColumnStatisticsData.fromJson(
            json['LongColumnStatisticsData'] as Map<String, dynamic>),
    stringColumnStatisticsData: json['StringColumnStatisticsData'] == null
        ? null
        : StringColumnStatisticsData.fromJson(
            json['StringColumnStatisticsData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ColumnStatisticsDataToJson(
    ColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ColumnStatisticsTypeEnumMap[instance.type]);
  writeNotNull('BinaryColumnStatisticsData',
      instance.binaryColumnStatisticsData?.toJson());
  writeNotNull('BooleanColumnStatisticsData',
      instance.booleanColumnStatisticsData?.toJson());
  writeNotNull(
      'DateColumnStatisticsData', instance.dateColumnStatisticsData?.toJson());
  writeNotNull('DecimalColumnStatisticsData',
      instance.decimalColumnStatisticsData?.toJson());
  writeNotNull('DoubleColumnStatisticsData',
      instance.doubleColumnStatisticsData?.toJson());
  writeNotNull(
      'LongColumnStatisticsData', instance.longColumnStatisticsData?.toJson());
  writeNotNull('StringColumnStatisticsData',
      instance.stringColumnStatisticsData?.toJson());
  return val;
}

const _$ColumnStatisticsTypeEnumMap = {
  ColumnStatisticsType.boolean: 'BOOLEAN',
  ColumnStatisticsType.date: 'DATE',
  ColumnStatisticsType.decimal: 'DECIMAL',
  ColumnStatisticsType.double: 'DOUBLE',
  ColumnStatisticsType.long: 'LONG',
  ColumnStatisticsType.string: 'STRING',
  ColumnStatisticsType.binary: 'BINARY',
};

ColumnStatisticsError _$ColumnStatisticsErrorFromJson(
    Map<String, dynamic> json) {
  return ColumnStatisticsError(
    columnStatistics: json['ColumnStatistics'] == null
        ? null
        : ColumnStatistics.fromJson(
            json['ColumnStatistics'] as Map<String, dynamic>),
    error: json['Error'] == null
        ? null
        : ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>),
  );
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
  CrawlState.cancelling: 'CANCELLING',
  CrawlState.cancelled: 'CANCELLED',
  CrawlState.succeeded: 'SUCCEEDED',
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
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$ConnectionPropertyKeyEnumMap, k), e as String),
    ),
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['ConnectionType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String,
    lastUpdatedBy: json['LastUpdatedBy'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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

const _$ConnectionPropertyKeyEnumMap = {
  ConnectionPropertyKey.host: 'HOST',
  ConnectionPropertyKey.port: 'PORT',
  ConnectionPropertyKey.username: 'USERNAME',
  ConnectionPropertyKey.password: 'PASSWORD',
  ConnectionPropertyKey.encryptedPassword: 'ENCRYPTED_PASSWORD',
  ConnectionPropertyKey.jdbcDriverJarUri: 'JDBC_DRIVER_JAR_URI',
  ConnectionPropertyKey.jdbcDriverClassName: 'JDBC_DRIVER_CLASS_NAME',
  ConnectionPropertyKey.jdbcEngine: 'JDBC_ENGINE',
  ConnectionPropertyKey.jdbcEngineVersion: 'JDBC_ENGINE_VERSION',
  ConnectionPropertyKey.configFiles: 'CONFIG_FILES',
  ConnectionPropertyKey.instanceId: 'INSTANCE_ID',
  ConnectionPropertyKey.jdbcConnectionUrl: 'JDBC_CONNECTION_URL',
  ConnectionPropertyKey.jdbcEnforceSsl: 'JDBC_ENFORCE_SSL',
  ConnectionPropertyKey.customJdbcCert: 'CUSTOM_JDBC_CERT',
  ConnectionPropertyKey.skipCustomJdbcCertValidation:
      'SKIP_CUSTOM_JDBC_CERT_VALIDATION',
  ConnectionPropertyKey.customJdbcCertString: 'CUSTOM_JDBC_CERT_STRING',
  ConnectionPropertyKey.connectionUrl: 'CONNECTION_URL',
  ConnectionPropertyKey.kafkaBootstrapServers: 'KAFKA_BOOTSTRAP_SERVERS',
  ConnectionPropertyKey.kafkaSslEnabled: 'KAFKA_SSL_ENABLED',
  ConnectionPropertyKey.kafkaCustomCert: 'KAFKA_CUSTOM_CERT',
  ConnectionPropertyKey.kafkaSkipCustomCertValidation:
      'KAFKA_SKIP_CUSTOM_CERT_VALIDATION',
  ConnectionPropertyKey.secretId: 'SECRET_ID',
  ConnectionPropertyKey.connectorUrl: 'CONNECTOR_URL',
  ConnectionPropertyKey.connectorType: 'CONNECTOR_TYPE',
  ConnectionPropertyKey.connectorClassName: 'CONNECTOR_CLASS_NAME',
};

const _$ConnectionTypeEnumMap = {
  ConnectionType.jdbc: 'JDBC',
  ConnectionType.sftp: 'SFTP',
  ConnectionType.mongodb: 'MONGODB',
  ConnectionType.kafka: 'KAFKA',
  ConnectionType.network: 'NETWORK',
  ConnectionType.marketplace: 'MARKETPLACE',
  ConnectionType.custom: 'CUSTOM',
};

Map<String, dynamic> _$ConnectionInputToJson(ConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ConnectionProperties',
      instance.connectionProperties
          ?.map((k, e) => MapEntry(_$ConnectionPropertyKeyEnumMap[k], e)));
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
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    errorMessage: json['ErrorMessage'] as String,
    logGroup: json['LogGroup'] as String,
    logStream: json['LogStream'] as String,
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    description: json['Description'] as String,
    lastCrawl: json['LastCrawl'] == null
        ? null
        : LastCrawlInfo.fromJson(json['LastCrawl'] as Map<String, dynamic>),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
    lineageConfiguration: json['LineageConfiguration'] == null
        ? null
        : LineageConfiguration.fromJson(
            json['LineageConfiguration'] as Map<String, dynamic>),
    name: json['Name'] as String,
    recrawlPolicy: json['RecrawlPolicy'] == null
        ? null
        : RecrawlPolicy.fromJson(json['RecrawlPolicy'] as Map<String, dynamic>),
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
    mongoDBTargets: (json['MongoDBTargets'] as List)
        ?.map((e) => e == null
            ? null
            : MongoDBTarget.fromJson(e as Map<String, dynamic>))
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
  writeNotNull('MongoDBTargets',
      instance.mongoDBTargets?.map((e) => e?.toJson())?.toList());
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
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
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

CreatePartitionIndexResponse _$CreatePartitionIndexResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePartitionIndexResponse();
}

CreatePartitionResponse _$CreatePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePartitionResponse();
}

CreateRegistryResponse _$CreateRegistryResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRegistryResponse(
    description: json['Description'] as String,
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateSchemaResponse _$CreateSchemaResponseFromJson(Map<String, dynamic> json) {
  return CreateSchemaResponse(
    compatibility:
        _$enumDecodeNullable(_$CompatibilityEnumMap, json['Compatibility']),
    dataFormat: _$enumDecodeNullable(_$DataFormatEnumMap, json['DataFormat']),
    description: json['Description'] as String,
    latestSchemaVersion: json['LatestSchemaVersion'] as int,
    nextSchemaVersion: json['NextSchemaVersion'] as int,
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaCheckpoint: json['SchemaCheckpoint'] as int,
    schemaName: json['SchemaName'] as String,
    schemaStatus:
        _$enumDecodeNullable(_$SchemaStatusEnumMap, json['SchemaStatus']),
    schemaVersionId: json['SchemaVersionId'] as String,
    schemaVersionStatus: _$enumDecodeNullable(
        _$SchemaVersionStatusEnumMap, json['SchemaVersionStatus']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$CompatibilityEnumMap = {
  Compatibility.none: 'NONE',
  Compatibility.disabled: 'DISABLED',
  Compatibility.backward: 'BACKWARD',
  Compatibility.backwardAll: 'BACKWARD_ALL',
  Compatibility.forward: 'FORWARD',
  Compatibility.forwardAll: 'FORWARD_ALL',
  Compatibility.full: 'FULL',
  Compatibility.fullAll: 'FULL_ALL',
};

const _$DataFormatEnumMap = {
  DataFormat.avro: 'AVRO',
};

const _$SchemaStatusEnumMap = {
  SchemaStatus.available: 'AVAILABLE',
  SchemaStatus.pending: 'PENDING',
  SchemaStatus.deleting: 'DELETING',
};

const _$SchemaVersionStatusEnumMap = {
  SchemaVersionStatus.available: 'AVAILABLE',
  SchemaVersionStatus.pending: 'PENDING',
  SchemaVersionStatus.failure: 'FAILURE',
  SchemaVersionStatus.deleting: 'DELETING',
};

CreateScriptResponse _$CreateScriptResponseFromJson(Map<String, dynamic> json) {
  return CreateScriptResponse(
    pythonScript: json['PythonScript'] as String,
    scalaCode: json['ScalaCode'] as String,
  );
}

CreateSecurityConfigurationResponse
    _$CreateSecurityConfigurationResponseFromJson(Map<String, dynamic> json) {
  return CreateSecurityConfigurationResponse(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    delimiter: json['Delimiter'] as String,
    disableValueTrimming: json['DisableValueTrimming'] as bool,
    header: (json['Header'] as List)?.map((e) => e as String)?.toList(),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
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
    catalogId: json['CatalogId'] as String,
    createTableDefaultPermissions:
        (json['CreateTableDefaultPermissions'] as List)
            ?.map((e) => e == null
                ? null
                : PrincipalPermissions.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    description: json['Description'] as String,
    locationUri: json['LocationUri'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    targetDatabase: json['TargetDatabase'] == null
        ? null
        : DatabaseIdentifier.fromJson(
            json['TargetDatabase'] as Map<String, dynamic>),
  );
}

DatabaseIdentifier _$DatabaseIdentifierFromJson(Map<String, dynamic> json) {
  return DatabaseIdentifier(
    catalogId: json['CatalogId'] as String,
    databaseName: json['DatabaseName'] as String,
  );
}

Map<String, dynamic> _$DatabaseIdentifierToJson(DatabaseIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('DatabaseName', instance.databaseName);
  return val;
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
  writeNotNull('TargetDatabase', instance.targetDatabase?.toJson());
  return val;
}

DateColumnStatisticsData _$DateColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return DateColumnStatisticsData(
    numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
    maximumValue: const UnixDateTimeConverter().fromJson(json['MaximumValue']),
    minimumValue: const UnixDateTimeConverter().fromJson(json['MinimumValue']),
  );
}

Map<String, dynamic> _$DateColumnStatisticsDataToJson(
    DateColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberOfDistinctValues', instance.numberOfDistinctValues);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  writeNotNull('MaximumValue',
      const UnixDateTimeConverter().toJson(instance.maximumValue));
  writeNotNull('MinimumValue',
      const UnixDateTimeConverter().toJson(instance.minimumValue));
  return val;
}

DecimalColumnStatisticsData _$DecimalColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return DecimalColumnStatisticsData(
    numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
    maximumValue: json['MaximumValue'] == null
        ? null
        : DecimalNumber.fromJson(json['MaximumValue'] as Map<String, dynamic>),
    minimumValue: json['MinimumValue'] == null
        ? null
        : DecimalNumber.fromJson(json['MinimumValue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DecimalColumnStatisticsDataToJson(
    DecimalColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberOfDistinctValues', instance.numberOfDistinctValues);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  writeNotNull('MaximumValue', instance.maximumValue?.toJson());
  writeNotNull('MinimumValue', instance.minimumValue?.toJson());
  return val;
}

DecimalNumber _$DecimalNumberFromJson(Map<String, dynamic> json) {
  return DecimalNumber(
    scale: json['Scale'] as int,
    unscaledValue:
        const Uint8ListConverter().fromJson(json['UnscaledValue'] as String),
  );
}

Map<String, dynamic> _$DecimalNumberToJson(DecimalNumber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scale', instance.scale);
  writeNotNull('UnscaledValue',
      const Uint8ListConverter().toJson(instance.unscaledValue));
  return val;
}

DeleteClassifierResponse _$DeleteClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClassifierResponse();
}

DeleteColumnStatisticsForPartitionResponse
    _$DeleteColumnStatisticsForPartitionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteColumnStatisticsForPartitionResponse();
}

DeleteColumnStatisticsForTableResponse
    _$DeleteColumnStatisticsForTableResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteColumnStatisticsForTableResponse();
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

DeletePartitionIndexResponse _$DeletePartitionIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePartitionIndexResponse();
}

DeletePartitionResponse _$DeletePartitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePartitionResponse();
}

DeleteRegistryResponse _$DeleteRegistryResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegistryResponse(
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    status: _$enumDecodeNullable(_$RegistryStatusEnumMap, json['Status']),
  );
}

const _$RegistryStatusEnumMap = {
  RegistryStatus.available: 'AVAILABLE',
  RegistryStatus.deleting: 'DELETING',
};

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse();
}

DeleteSchemaResponse _$DeleteSchemaResponseFromJson(Map<String, dynamic> json) {
  return DeleteSchemaResponse(
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
    status: _$enumDecodeNullable(_$SchemaStatusEnumMap, json['Status']),
  );
}

DeleteSchemaVersionsResponse _$DeleteSchemaVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSchemaVersionsResponse(
    schemaVersionErrors: (json['SchemaVersionErrors'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaVersionErrorItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    endpointName: json['EndpointName'] as String,
    extraJarsS3Path: json['ExtraJarsS3Path'] as String,
    extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String,
    failureReason: json['FailureReason'] as String,
    glueVersion: json['GlueVersion'] as String,
    lastModifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTimestamp']),
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

DoubleColumnStatisticsData _$DoubleColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return DoubleColumnStatisticsData(
    numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
    maximumValue: (json['MaximumValue'] as num)?.toDouble(),
    minimumValue: (json['MinimumValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DoubleColumnStatisticsDataToJson(
    DoubleColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberOfDistinctValues', instance.numberOfDistinctValues);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  writeNotNull('MaximumValue', instance.maximumValue);
  writeNotNull('MinimumValue', instance.minimumValue);
  return val;
}

DynamoDBTarget _$DynamoDBTargetFromJson(Map<String, dynamic> json) {
  return DynamoDBTarget(
    path: json['Path'] as String,
    scanAll: json['scanAll'] as bool,
    scanRate: (json['scanRate'] as num)?.toDouble(),
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
  writeNotNull('scanAll', instance.scanAll);
  writeNotNull('scanRate', instance.scanRate);
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

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) {
  return ErrorDetails(
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
    columnImportances: (json['ColumnImportances'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnImportance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

GetColumnStatisticsForPartitionResponse
    _$GetColumnStatisticsForPartitionResponseFromJson(
        Map<String, dynamic> json) {
  return GetColumnStatisticsForPartitionResponse(
    columnStatisticsList: (json['ColumnStatisticsList'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : ColumnError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetColumnStatisticsForTableResponse
    _$GetColumnStatisticsForTableResponseFromJson(Map<String, dynamic> json) {
  return GetColumnStatisticsForTableResponse(
    columnStatisticsList: (json['ColumnStatisticsList'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : ColumnError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    errorString: json['ErrorString'] as String,
    executionTime: json['ExecutionTime'] as int,
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
    logGroupName: json['LogGroupName'] as String,
    properties: json['Properties'] == null
        ? null
        : TaskRunProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
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
    createdOn: const UnixDateTimeConverter().fromJson(json['CreatedOn']),
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
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
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
    transformEncryption: json['TransformEncryption'] == null
        ? null
        : TransformEncryption.fromJson(
            json['TransformEncryption'] as Map<String, dynamic>),
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

GetPartitionIndexesResponse _$GetPartitionIndexesResponseFromJson(
    Map<String, dynamic> json) {
  return GetPartitionIndexesResponse(
    nextToken: json['NextToken'] as String,
    partitionIndexDescriptorList: (json['PartitionIndexDescriptorList'] as List)
        ?.map((e) => e == null
            ? null
            : PartitionIndexDescriptor.fromJson(e as Map<String, dynamic>))
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

GetRegistryResponse _$GetRegistryResponseFromJson(Map<String, dynamic> json) {
  return GetRegistryResponse(
    createdTime: json['CreatedTime'] as String,
    description: json['Description'] as String,
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    status: _$enumDecodeNullable(_$RegistryStatusEnumMap, json['Status']),
    updatedTime: json['UpdatedTime'] as String,
  );
}

GetResourcePoliciesResponse _$GetResourcePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePoliciesResponse(
    getResourcePoliciesResponseList: (json['GetResourcePoliciesResponseList']
            as List)
        ?.map((e) =>
            e == null ? null : GluePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetResourcePolicyResponse _$GetResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyResponse(
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    policyHash: json['PolicyHash'] as String,
    policyInJson: json['PolicyInJson'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

GetSchemaByDefinitionResponse _$GetSchemaByDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchemaByDefinitionResponse(
    createdTime: json['CreatedTime'] as String,
    dataFormat: _$enumDecodeNullable(_$DataFormatEnumMap, json['DataFormat']),
    schemaArn: json['SchemaArn'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
    status: _$enumDecodeNullable(_$SchemaVersionStatusEnumMap, json['Status']),
  );
}

GetSchemaResponse _$GetSchemaResponseFromJson(Map<String, dynamic> json) {
  return GetSchemaResponse(
    compatibility:
        _$enumDecodeNullable(_$CompatibilityEnumMap, json['Compatibility']),
    createdTime: json['CreatedTime'] as String,
    dataFormat: _$enumDecodeNullable(_$DataFormatEnumMap, json['DataFormat']),
    description: json['Description'] as String,
    latestSchemaVersion: json['LatestSchemaVersion'] as int,
    nextSchemaVersion: json['NextSchemaVersion'] as int,
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaCheckpoint: json['SchemaCheckpoint'] as int,
    schemaName: json['SchemaName'] as String,
    schemaStatus:
        _$enumDecodeNullable(_$SchemaStatusEnumMap, json['SchemaStatus']),
    updatedTime: json['UpdatedTime'] as String,
  );
}

GetSchemaVersionResponse _$GetSchemaVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchemaVersionResponse(
    createdTime: json['CreatedTime'] as String,
    dataFormat: _$enumDecodeNullable(_$DataFormatEnumMap, json['DataFormat']),
    schemaArn: json['SchemaArn'] as String,
    schemaDefinition: json['SchemaDefinition'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
    status: _$enumDecodeNullable(_$SchemaVersionStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

GetSchemaVersionsDiffResponse _$GetSchemaVersionsDiffResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchemaVersionsDiffResponse(
    diff: json['Diff'] as String,
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

GluePolicy _$GluePolicyFromJson(Map<String, dynamic> json) {
  return GluePolicy(
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    policyHash: json['PolicyHash'] as String,
    policyInJson: json['PolicyInJson'] as String,
    updateTime: const UnixDateTimeConverter().fromJson(json['UpdateTime']),
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    customPatterns: json['CustomPatterns'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
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
    createdOn: const UnixDateTimeConverter().fromJson(json['CreatedOn']),
    defaultArguments: (json['DefaultArguments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['Description'] as String,
    executionProperty: json['ExecutionProperty'] == null
        ? null
        : ExecutionProperty.fromJson(
            json['ExecutionProperty'] as Map<String, dynamic>),
    glueVersion: json['GlueVersion'] as String,
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
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
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    errorMessage: json['ErrorMessage'] as String,
    executionTime: json['ExecutionTime'] as int,
    glueVersion: json['GlueVersion'] as String,
    id: json['Id'] as String,
    jobName: json['JobName'] as String,
    jobRunState:
        _$enumDecodeNullable(_$JobRunStateEnumMap, json['JobRunState']),
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
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
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
    version: json['Version'] as int,
  );
}

KeySchemaElement _$KeySchemaElementFromJson(Map<String, dynamic> json) {
  return KeySchemaElement(
    name: json['Name'] as String,
    type: json['Type'] as String,
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
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$LastCrawlStatusEnumMap, json['Status']),
  );
}

const _$LastCrawlStatusEnumMap = {
  LastCrawlStatus.succeeded: 'SUCCEEDED',
  LastCrawlStatus.cancelled: 'CANCELLED',
  LastCrawlStatus.failed: 'FAILED',
};

LineageConfiguration _$LineageConfigurationFromJson(Map<String, dynamic> json) {
  return LineageConfiguration(
    crawlerLineageSettings: _$enumDecodeNullable(
        _$CrawlerLineageSettingsEnumMap, json['CrawlerLineageSettings']),
  );
}

Map<String, dynamic> _$LineageConfigurationToJson(
    LineageConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CrawlerLineageSettings',
      _$CrawlerLineageSettingsEnumMap[instance.crawlerLineageSettings]);
  return val;
}

const _$CrawlerLineageSettingsEnumMap = {
  CrawlerLineageSettings.enable: 'ENABLE',
  CrawlerLineageSettings.disable: 'DISABLE',
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

ListRegistriesResponse _$ListRegistriesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRegistriesResponse(
    nextToken: json['NextToken'] as String,
    registries: (json['Registries'] as List)
        ?.map((e) => e == null
            ? null
            : RegistryListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSchemaVersionsResponse _$ListSchemaVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSchemaVersionsResponse(
    nextToken: json['NextToken'] as String,
    schemas: (json['Schemas'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaVersionListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSchemasResponse _$ListSchemasResponseFromJson(Map<String, dynamic> json) {
  return ListSchemasResponse(
    nextToken: json['NextToken'] as String,
    schemas: (json['Schemas'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

LongColumnStatisticsData _$LongColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return LongColumnStatisticsData(
    numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
    maximumValue: json['MaximumValue'] as int,
    minimumValue: json['MinimumValue'] as int,
  );
}

Map<String, dynamic> _$LongColumnStatisticsDataToJson(
    LongColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberOfDistinctValues', instance.numberOfDistinctValues);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  writeNotNull('MaximumValue', instance.maximumValue);
  writeNotNull('MinimumValue', instance.minimumValue);
  return val;
}

MLTransform _$MLTransformFromJson(Map<String, dynamic> json) {
  return MLTransform(
    createdOn: const UnixDateTimeConverter().fromJson(json['CreatedOn']),
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
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
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
    transformEncryption: json['TransformEncryption'] == null
        ? null
        : TransformEncryption.fromJson(
            json['TransformEncryption'] as Map<String, dynamic>),
    transformId: json['TransformId'] as String,
    workerType: _$enumDecodeNullable(_$WorkerTypeEnumMap, json['WorkerType']),
  );
}

MLUserDataEncryption _$MLUserDataEncryptionFromJson(Map<String, dynamic> json) {
  return MLUserDataEncryption(
    mlUserDataEncryptionMode: _$enumDecodeNullable(
        _$MLUserDataEncryptionModeStringEnumMap,
        json['MlUserDataEncryptionMode']),
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$MLUserDataEncryptionToJson(
    MLUserDataEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MlUserDataEncryptionMode',
      _$MLUserDataEncryptionModeStringEnumMap[
          instance.mlUserDataEncryptionMode]);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

const _$MLUserDataEncryptionModeStringEnumMap = {
  MLUserDataEncryptionModeString.disabled: 'DISABLED',
  MLUserDataEncryptionModeString.sseKms: 'SSE-KMS',
};

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

MetadataInfo _$MetadataInfoFromJson(Map<String, dynamic> json) {
  return MetadataInfo(
    createdTime: json['CreatedTime'] as String,
    metadataValue: json['MetadataValue'] as String,
  );
}

Map<String, dynamic> _$MetadataKeyValuePairToJson(
    MetadataKeyValuePair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetadataKey', instance.metadataKey);
  writeNotNull('MetadataValue', instance.metadataValue);
  return val;
}

MongoDBTarget _$MongoDBTargetFromJson(Map<String, dynamic> json) {
  return MongoDBTarget(
    connectionName: json['ConnectionName'] as String,
    path: json['Path'] as String,
    scanAll: json['ScanAll'] as bool,
  );
}

Map<String, dynamic> _$MongoDBTargetToJson(MongoDBTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionName', instance.connectionName);
  writeNotNull('Path', instance.path);
  writeNotNull('ScanAll', instance.scanAll);
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
    catalogId: json['CatalogId'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    lastAccessTime:
        const UnixDateTimeConverter().fromJson(json['LastAccessTime']),
    lastAnalyzedTime:
        const UnixDateTimeConverter().fromJson(json['LastAnalyzedTime']),
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

Map<String, dynamic> _$PartitionIndexToJson(PartitionIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('Keys', instance.keys);
  return val;
}

PartitionIndexDescriptor _$PartitionIndexDescriptorFromJson(
    Map<String, dynamic> json) {
  return PartitionIndexDescriptor(
    indexName: json['IndexName'] as String,
    indexStatus: _$enumDecodeNullable(
        _$PartitionIndexStatusEnumMap, json['IndexStatus']),
    keys: (json['Keys'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backfillErrors: (json['BackfillErrors'] as List)
        ?.map((e) => e == null
            ? null
            : BackfillError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$PartitionIndexStatusEnumMap = {
  PartitionIndexStatus.creating: 'CREATING',
  PartitionIndexStatus.active: 'ACTIVE',
  PartitionIndexStatus.deleting: 'DELETING',
  PartitionIndexStatus.failed: 'FAILED',
};

Map<String, dynamic> _$PartitionInputToJson(PartitionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LastAccessTime',
      const UnixDateTimeConverter().toJson(instance.lastAccessTime));
  writeNotNull('LastAnalyzedTime',
      const UnixDateTimeConverter().toJson(instance.lastAnalyzedTime));
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
    permissions: (json['Permissions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PermissionEnumMap, e))
        ?.toList(),
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

  writeNotNull('Permissions',
      instance.permissions?.map((e) => _$PermissionEnumMap[e])?.toList());
  writeNotNull('Principal', instance.principal?.toJson());
  return val;
}

const _$PermissionEnumMap = {
  Permission.all: 'ALL',
  Permission.select: 'SELECT',
  Permission.alter: 'ALTER',
  Permission.drop: 'DROP',
  Permission.delete: 'DELETE',
  Permission.insert: 'INSERT',
  Permission.createDatabase: 'CREATE_DATABASE',
  Permission.createTable: 'CREATE_TABLE',
  Permission.dataLocationAccess: 'DATA_LOCATION_ACCESS',
};

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

PutSchemaVersionMetadataResponse _$PutSchemaVersionMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return PutSchemaVersionMetadataResponse(
    latestVersion: json['LatestVersion'] as bool,
    metadataKey: json['MetadataKey'] as String,
    metadataValue: json['MetadataValue'] as String,
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

PutWorkflowRunPropertiesResponse _$PutWorkflowRunPropertiesResponseFromJson(
    Map<String, dynamic> json) {
  return PutWorkflowRunPropertiesResponse();
}

QuerySchemaVersionMetadataResponse _$QuerySchemaVersionMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return QuerySchemaVersionMetadataResponse(
    metadataInfoMap: (json['MetadataInfoMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MetadataInfo.fromJson(e as Map<String, dynamic>)),
    ),
    nextToken: json['NextToken'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
  );
}

RecrawlPolicy _$RecrawlPolicyFromJson(Map<String, dynamic> json) {
  return RecrawlPolicy(
    recrawlBehavior:
        _$enumDecodeNullable(_$RecrawlBehaviorEnumMap, json['RecrawlBehavior']),
  );
}

Map<String, dynamic> _$RecrawlPolicyToJson(RecrawlPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RecrawlBehavior', _$RecrawlBehaviorEnumMap[instance.recrawlBehavior]);
  return val;
}

const _$RecrawlBehaviorEnumMap = {
  RecrawlBehavior.crawlEverything: 'CRAWL_EVERYTHING',
  RecrawlBehavior.crawlNewFoldersOnly: 'CRAWL_NEW_FOLDERS_ONLY',
};

RegisterSchemaVersionResponse _$RegisterSchemaVersionResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterSchemaVersionResponse(
    schemaVersionId: json['SchemaVersionId'] as String,
    status: _$enumDecodeNullable(_$SchemaVersionStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

Map<String, dynamic> _$RegistryIdToJson(RegistryId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegistryArn', instance.registryArn);
  writeNotNull('RegistryName', instance.registryName);
  return val;
}

RegistryListItem _$RegistryListItemFromJson(Map<String, dynamic> json) {
  return RegistryListItem(
    createdTime: json['CreatedTime'] as String,
    description: json['Description'] as String,
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
    status: _$enumDecodeNullable(_$RegistryStatusEnumMap, json['Status']),
    updatedTime: json['UpdatedTime'] as String,
  );
}

RemoveSchemaVersionMetadataResponse
    _$RemoveSchemaVersionMetadataResponseFromJson(Map<String, dynamic> json) {
  return RemoveSchemaVersionMetadataResponse(
    latestVersion: json['LatestVersion'] as bool,
    metadataKey: json['MetadataKey'] as String,
    metadataValue: json['MetadataValue'] as String,
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
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

ResumeWorkflowRunResponse _$ResumeWorkflowRunResponseFromJson(
    Map<String, dynamic> json) {
  return ResumeWorkflowRunResponse(
    nodeIds: (json['NodeIds'] as List)?.map((e) => e as String)?.toList(),
    runId: json['RunId'] as String,
  );
}

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
    connectionName: json['ConnectionName'] as String,
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

  writeNotNull('ConnectionName', instance.connectionName);
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

SchemaId _$SchemaIdFromJson(Map<String, dynamic> json) {
  return SchemaId(
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
  );
}

Map<String, dynamic> _$SchemaIdToJson(SchemaId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegistryName', instance.registryName);
  writeNotNull('SchemaArn', instance.schemaArn);
  writeNotNull('SchemaName', instance.schemaName);
  return val;
}

SchemaListItem _$SchemaListItemFromJson(Map<String, dynamic> json) {
  return SchemaListItem(
    createdTime: json['CreatedTime'] as String,
    description: json['Description'] as String,
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
    schemaStatus:
        _$enumDecodeNullable(_$SchemaStatusEnumMap, json['SchemaStatus']),
    updatedTime: json['UpdatedTime'] as String,
  );
}

SchemaReference _$SchemaReferenceFromJson(Map<String, dynamic> json) {
  return SchemaReference(
    schemaId: json['SchemaId'] == null
        ? null
        : SchemaId.fromJson(json['SchemaId'] as Map<String, dynamic>),
    schemaVersionId: json['SchemaVersionId'] as String,
    schemaVersionNumber: json['SchemaVersionNumber'] as int,
  );
}

Map<String, dynamic> _$SchemaReferenceToJson(SchemaReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SchemaId', instance.schemaId?.toJson());
  writeNotNull('SchemaVersionId', instance.schemaVersionId);
  writeNotNull('SchemaVersionNumber', instance.schemaVersionNumber);
  return val;
}

SchemaVersionErrorItem _$SchemaVersionErrorItemFromJson(
    Map<String, dynamic> json) {
  return SchemaVersionErrorItem(
    errorDetails: json['ErrorDetails'] == null
        ? null
        : ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>),
    versionNumber: json['VersionNumber'] as int,
  );
}

SchemaVersionListItem _$SchemaVersionListItemFromJson(
    Map<String, dynamic> json) {
  return SchemaVersionListItem(
    createdTime: json['CreatedTime'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaVersionId: json['SchemaVersionId'] as String,
    status: _$enumDecodeNullable(_$SchemaVersionStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

Map<String, dynamic> _$SchemaVersionNumberToJson(SchemaVersionNumber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LatestVersion', instance.latestVersion);
  writeNotNull('VersionNumber', instance.versionNumber);
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
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimeStamp']),
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

StopWorkflowRunResponse _$StopWorkflowRunResponseFromJson(
    Map<String, dynamic> json) {
  return StopWorkflowRunResponse();
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
    schemaReference: json['SchemaReference'] == null
        ? null
        : SchemaReference.fromJson(
            json['SchemaReference'] as Map<String, dynamic>),
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
  writeNotNull('SchemaReference', instance.schemaReference?.toJson());
  writeNotNull('SerdeInfo', instance.serdeInfo?.toJson());
  writeNotNull('SkewedInfo', instance.skewedInfo?.toJson());
  writeNotNull(
      'SortColumns', instance.sortColumns?.map((e) => e?.toJson())?.toList());
  writeNotNull('StoredAsSubDirectories', instance.storedAsSubDirectories);
  return val;
}

StringColumnStatisticsData _$StringColumnStatisticsDataFromJson(
    Map<String, dynamic> json) {
  return StringColumnStatisticsData(
    averageLength: (json['AverageLength'] as num)?.toDouble(),
    maximumLength: json['MaximumLength'] as int,
    numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
    numberOfNulls: json['NumberOfNulls'] as int,
  );
}

Map<String, dynamic> _$StringColumnStatisticsDataToJson(
    StringColumnStatisticsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AverageLength', instance.averageLength);
  writeNotNull('MaximumLength', instance.maximumLength);
  writeNotNull('NumberOfDistinctValues', instance.numberOfDistinctValues);
  writeNotNull('NumberOfNulls', instance.numberOfNulls);
  return val;
}

Table _$TableFromJson(Map<String, dynamic> json) {
  return Table(
    name: json['Name'] as String,
    catalogId: json['CatalogId'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    createdBy: json['CreatedBy'] as String,
    databaseName: json['DatabaseName'] as String,
    description: json['Description'] as String,
    isRegisteredWithLakeFormation:
        json['IsRegisteredWithLakeFormation'] as bool,
    lastAccessTime:
        const UnixDateTimeConverter().fromJson(json['LastAccessTime']),
    lastAnalyzedTime:
        const UnixDateTimeConverter().fromJson(json['LastAnalyzedTime']),
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
    targetTable: json['TargetTable'] == null
        ? null
        : TableIdentifier.fromJson(json['TargetTable'] as Map<String, dynamic>),
    updateTime: const UnixDateTimeConverter().fromJson(json['UpdateTime']),
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

TableIdentifier _$TableIdentifierFromJson(Map<String, dynamic> json) {
  return TableIdentifier(
    catalogId: json['CatalogId'] as String,
    databaseName: json['DatabaseName'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$TableIdentifierToJson(TableIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Name', instance.name);
  return val;
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
  writeNotNull('LastAccessTime',
      const UnixDateTimeConverter().toJson(instance.lastAccessTime));
  writeNotNull('LastAnalyzedTime',
      const UnixDateTimeConverter().toJson(instance.lastAnalyzedTime));
  writeNotNull('Owner', instance.owner);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('PartitionKeys',
      instance.partitionKeys?.map((e) => e?.toJson())?.toList());
  writeNotNull('Retention', instance.retention);
  writeNotNull('StorageDescriptor', instance.storageDescriptor?.toJson());
  writeNotNull('TableType', instance.tableType);
  writeNotNull('TargetTable', instance.targetTable?.toJson());
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
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    errorString: json['ErrorString'] as String,
    executionTime: json['ExecutionTime'] as int,
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
    logGroupName: json['LogGroupName'] as String,
    properties: json['Properties'] == null
        ? null
        : TaskRunProperties.fromJson(
            json['Properties'] as Map<String, dynamic>),
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
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

  writeNotNull('StartedAfter',
      const UnixDateTimeConverter().toJson(instance.startedAfter));
  writeNotNull('StartedBefore',
      const UnixDateTimeConverter().toJson(instance.startedBefore));
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

TransformEncryption _$TransformEncryptionFromJson(Map<String, dynamic> json) {
  return TransformEncryption(
    mlUserDataEncryption: json['MlUserDataEncryption'] == null
        ? null
        : MLUserDataEncryption.fromJson(
            json['MlUserDataEncryption'] as Map<String, dynamic>),
    taskRunSecurityConfigurationName:
        json['TaskRunSecurityConfigurationName'] as String,
  );
}

Map<String, dynamic> _$TransformEncryptionToJson(TransformEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MlUserDataEncryption', instance.mlUserDataEncryption?.toJson());
  writeNotNull('TaskRunSecurityConfigurationName',
      instance.taskRunSecurityConfigurationName);
  return val;
}

Map<String, dynamic> _$TransformFilterCriteriaToJson(
    TransformFilterCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAfter',
      const UnixDateTimeConverter().toJson(instance.createdAfter));
  writeNotNull('CreatedBefore',
      const UnixDateTimeConverter().toJson(instance.createdBefore));
  writeNotNull('GlueVersion', instance.glueVersion);
  writeNotNull('LastModifiedAfter',
      const UnixDateTimeConverter().toJson(instance.lastModifiedAfter));
  writeNotNull('LastModifiedBefore',
      const UnixDateTimeConverter().toJson(instance.lastModifiedBefore));
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

UpdateColumnStatisticsForPartitionResponse
    _$UpdateColumnStatisticsForPartitionResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateColumnStatisticsForPartitionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnStatisticsError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateColumnStatisticsForTableResponse
    _$UpdateColumnStatisticsForTableResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateColumnStatisticsForTableResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnStatisticsError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

UpdateRegistryResponse _$UpdateRegistryResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRegistryResponse(
    registryArn: json['RegistryArn'] as String,
    registryName: json['RegistryName'] as String,
  );
}

UpdateSchemaResponse _$UpdateSchemaResponseFromJson(Map<String, dynamic> json) {
  return UpdateSchemaResponse(
    registryName: json['RegistryName'] as String,
    schemaArn: json['SchemaArn'] as String,
    schemaName: json['SchemaName'] as String,
  );
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
    catalogId: json['CatalogId'] as String,
    className: json['ClassName'] as String,
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    databaseName: json['DatabaseName'] as String,
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
    createdOn: const UnixDateTimeConverter().fromJson(json['CreatedOn']),
    defaultRunProperties:
        (json['DefaultRunProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    description: json['Description'] as String,
    graph: json['Graph'] == null
        ? null
        : WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>),
    lastModifiedOn:
        const UnixDateTimeConverter().fromJson(json['LastModifiedOn']),
    lastRun: json['LastRun'] == null
        ? null
        : WorkflowRun.fromJson(json['LastRun'] as Map<String, dynamic>),
    maxConcurrentRuns: json['MaxConcurrentRuns'] as int,
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
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    errorMessage: json['ErrorMessage'] as String,
    graph: json['Graph'] == null
        ? null
        : WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>),
    name: json['Name'] as String,
    previousRunId: json['PreviousRunId'] as String,
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
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
  WorkflowRunStatus.stopping: 'STOPPING',
  WorkflowRunStatus.stopped: 'STOPPED',
  WorkflowRunStatus.error: 'ERROR',
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
    rowTag: json['RowTag'] as String,
    version: json['Version'] as int,
  );
}
