// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-05-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchGetNamedQueryOutput _$BatchGetNamedQueryOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetNamedQueryOutput(
    namedQueries: (json['NamedQueries'] as List)
        ?.map((e) =>
            e == null ? null : NamedQuery.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedNamedQueryIds: (json['UnprocessedNamedQueryIds'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedNamedQueryId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetQueryExecutionOutput _$BatchGetQueryExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetQueryExecutionOutput(
    queryExecutions: (json['QueryExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : QueryExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedQueryExecutionIds: (json['UnprocessedQueryExecutionIds'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedQueryExecutionId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Column _$ColumnFromJson(Map<String, dynamic> json) {
  return Column(
    name: json['Name'] as String,
    comment: json['Comment'] as String,
    type: json['Type'] as String,
  );
}

ColumnInfo _$ColumnInfoFromJson(Map<String, dynamic> json) {
  return ColumnInfo(
    name: json['Name'] as String,
    type: json['Type'] as String,
    caseSensitive: json['CaseSensitive'] as bool,
    catalogName: json['CatalogName'] as String,
    label: json['Label'] as String,
    nullable: _$enumDecodeNullable(_$ColumnNullableEnumMap, json['Nullable']),
    precision: json['Precision'] as int,
    scale: json['Scale'] as int,
    schemaName: json['SchemaName'] as String,
    tableName: json['TableName'] as String,
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

const _$ColumnNullableEnumMap = {
  ColumnNullable.notNull: 'NOT_NULL',
  ColumnNullable.nullable: 'NULLABLE',
  ColumnNullable.unknown: 'UNKNOWN',
};

CreateDataCatalogOutput _$CreateDataCatalogOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataCatalogOutput();
}

CreateNamedQueryOutput _$CreateNamedQueryOutputFromJson(
    Map<String, dynamic> json) {
  return CreateNamedQueryOutput(
    namedQueryId: json['NamedQueryId'] as String,
  );
}

CreateWorkGroupOutput _$CreateWorkGroupOutputFromJson(
    Map<String, dynamic> json) {
  return CreateWorkGroupOutput();
}

DataCatalog _$DataCatalogFromJson(Map<String, dynamic> json) {
  return DataCatalog(
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$DataCatalogTypeEnumMap, json['Type']),
    description: json['Description'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$DataCatalogTypeEnumMap = {
  DataCatalogType.lambda: 'LAMBDA',
  DataCatalogType.glue: 'GLUE',
  DataCatalogType.hive: 'HIVE',
};

DataCatalogSummary _$DataCatalogSummaryFromJson(Map<String, dynamic> json) {
  return DataCatalogSummary(
    catalogName: json['CatalogName'] as String,
    type: _$enumDecodeNullable(_$DataCatalogTypeEnumMap, json['Type']),
  );
}

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return Database(
    name: json['Name'] as String,
    description: json['Description'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return Datum(
    varCharValue: json['VarCharValue'] as String,
  );
}

DeleteDataCatalogOutput _$DeleteDataCatalogOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteDataCatalogOutput();
}

DeleteNamedQueryOutput _$DeleteNamedQueryOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteNamedQueryOutput();
}

DeleteWorkGroupOutput _$DeleteWorkGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkGroupOutput();
}

EncryptionConfiguration _$EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return EncryptionConfiguration(
    encryptionOption: _$enumDecodeNullable(
        _$EncryptionOptionEnumMap, json['EncryptionOption']),
    kmsKey: json['KmsKey'] as String,
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

  writeNotNull(
      'EncryptionOption', _$EncryptionOptionEnumMap[instance.encryptionOption]);
  writeNotNull('KmsKey', instance.kmsKey);
  return val;
}

const _$EncryptionOptionEnumMap = {
  EncryptionOption.sseS3: 'SSE_S3',
  EncryptionOption.sseKms: 'SSE_KMS',
  EncryptionOption.cseKms: 'CSE_KMS',
};

GetDataCatalogOutput _$GetDataCatalogOutputFromJson(Map<String, dynamic> json) {
  return GetDataCatalogOutput(
    dataCatalog: json['DataCatalog'] == null
        ? null
        : DataCatalog.fromJson(json['DataCatalog'] as Map<String, dynamic>),
  );
}

GetDatabaseOutput _$GetDatabaseOutputFromJson(Map<String, dynamic> json) {
  return GetDatabaseOutput(
    database: json['Database'] == null
        ? null
        : Database.fromJson(json['Database'] as Map<String, dynamic>),
  );
}

GetNamedQueryOutput _$GetNamedQueryOutputFromJson(Map<String, dynamic> json) {
  return GetNamedQueryOutput(
    namedQuery: json['NamedQuery'] == null
        ? null
        : NamedQuery.fromJson(json['NamedQuery'] as Map<String, dynamic>),
  );
}

GetQueryExecutionOutput _$GetQueryExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return GetQueryExecutionOutput(
    queryExecution: json['QueryExecution'] == null
        ? null
        : QueryExecution.fromJson(
            json['QueryExecution'] as Map<String, dynamic>),
  );
}

GetQueryResultsOutput _$GetQueryResultsOutputFromJson(
    Map<String, dynamic> json) {
  return GetQueryResultsOutput(
    nextToken: json['NextToken'] as String,
    resultSet: json['ResultSet'] == null
        ? null
        : ResultSet.fromJson(json['ResultSet'] as Map<String, dynamic>),
    updateCount: json['UpdateCount'] as int,
  );
}

GetTableMetadataOutput _$GetTableMetadataOutputFromJson(
    Map<String, dynamic> json) {
  return GetTableMetadataOutput(
    tableMetadata: json['TableMetadata'] == null
        ? null
        : TableMetadata.fromJson(json['TableMetadata'] as Map<String, dynamic>),
  );
}

GetWorkGroupOutput _$GetWorkGroupOutputFromJson(Map<String, dynamic> json) {
  return GetWorkGroupOutput(
    workGroup: json['WorkGroup'] == null
        ? null
        : WorkGroup.fromJson(json['WorkGroup'] as Map<String, dynamic>),
  );
}

ListDataCatalogsOutput _$ListDataCatalogsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDataCatalogsOutput(
    dataCatalogsSummary: (json['DataCatalogsSummary'] as List)
        ?.map((e) => e == null
            ? null
            : DataCatalogSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDatabasesOutput _$ListDatabasesOutputFromJson(Map<String, dynamic> json) {
  return ListDatabasesOutput(
    databaseList: (json['DatabaseList'] as List)
        ?.map((e) =>
            e == null ? null : Database.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListNamedQueriesOutput _$ListNamedQueriesOutputFromJson(
    Map<String, dynamic> json) {
  return ListNamedQueriesOutput(
    namedQueryIds:
        (json['NamedQueryIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListQueryExecutionsOutput _$ListQueryExecutionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListQueryExecutionsOutput(
    nextToken: json['NextToken'] as String,
    queryExecutionIds:
        (json['QueryExecutionIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTableMetadataOutput _$ListTableMetadataOutputFromJson(
    Map<String, dynamic> json) {
  return ListTableMetadataOutput(
    nextToken: json['NextToken'] as String,
    tableMetadataList: (json['TableMetadataList'] as List)
        ?.map((e) => e == null
            ? null
            : TableMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWorkGroupsOutput _$ListWorkGroupsOutputFromJson(Map<String, dynamic> json) {
  return ListWorkGroupsOutput(
    nextToken: json['NextToken'] as String,
    workGroups: (json['WorkGroups'] as List)
        ?.map((e) => e == null
            ? null
            : WorkGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NamedQuery _$NamedQueryFromJson(Map<String, dynamic> json) {
  return NamedQuery(
    database: json['Database'] as String,
    name: json['Name'] as String,
    queryString: json['QueryString'] as String,
    description: json['Description'] as String,
    namedQueryId: json['NamedQueryId'] as String,
    workGroup: json['WorkGroup'] as String,
  );
}

QueryExecution _$QueryExecutionFromJson(Map<String, dynamic> json) {
  return QueryExecution(
    query: json['Query'] as String,
    queryExecutionContext: json['QueryExecutionContext'] == null
        ? null
        : QueryExecutionContext.fromJson(
            json['QueryExecutionContext'] as Map<String, dynamic>),
    queryExecutionId: json['QueryExecutionId'] as String,
    resultConfiguration: json['ResultConfiguration'] == null
        ? null
        : ResultConfiguration.fromJson(
            json['ResultConfiguration'] as Map<String, dynamic>),
    statementType:
        _$enumDecodeNullable(_$StatementTypeEnumMap, json['StatementType']),
    statistics: json['Statistics'] == null
        ? null
        : QueryExecutionStatistics.fromJson(
            json['Statistics'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : QueryExecutionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    workGroup: json['WorkGroup'] as String,
  );
}

const _$StatementTypeEnumMap = {
  StatementType.ddl: 'DDL',
  StatementType.dml: 'DML',
  StatementType.utility: 'UTILITY',
};

QueryExecutionContext _$QueryExecutionContextFromJson(
    Map<String, dynamic> json) {
  return QueryExecutionContext(
    catalog: json['Catalog'] as String,
    database: json['Database'] as String,
  );
}

Map<String, dynamic> _$QueryExecutionContextToJson(
    QueryExecutionContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Catalog', instance.catalog);
  writeNotNull('Database', instance.database);
  return val;
}

QueryExecutionStatistics _$QueryExecutionStatisticsFromJson(
    Map<String, dynamic> json) {
  return QueryExecutionStatistics(
    dataManifestLocation: json['DataManifestLocation'] as String,
    dataScannedInBytes: json['DataScannedInBytes'] as int,
    engineExecutionTimeInMillis: json['EngineExecutionTimeInMillis'] as int,
    queryPlanningTimeInMillis: json['QueryPlanningTimeInMillis'] as int,
    queryQueueTimeInMillis: json['QueryQueueTimeInMillis'] as int,
    serviceProcessingTimeInMillis: json['ServiceProcessingTimeInMillis'] as int,
    totalExecutionTimeInMillis: json['TotalExecutionTimeInMillis'] as int,
  );
}

QueryExecutionStatus _$QueryExecutionStatusFromJson(Map<String, dynamic> json) {
  return QueryExecutionStatus(
    completionDateTime:
        const UnixDateTimeConverter().fromJson(json['CompletionDateTime']),
    state: _$enumDecodeNullable(_$QueryExecutionStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] as String,
    submissionDateTime:
        const UnixDateTimeConverter().fromJson(json['SubmissionDateTime']),
  );
}

const _$QueryExecutionStateEnumMap = {
  QueryExecutionState.queued: 'QUEUED',
  QueryExecutionState.running: 'RUNNING',
  QueryExecutionState.succeeded: 'SUCCEEDED',
  QueryExecutionState.failed: 'FAILED',
  QueryExecutionState.cancelled: 'CANCELLED',
};

ResultConfiguration _$ResultConfigurationFromJson(Map<String, dynamic> json) {
  return ResultConfiguration(
    encryptionConfiguration: json['EncryptionConfiguration'] == null
        ? null
        : EncryptionConfiguration.fromJson(
            json['EncryptionConfiguration'] as Map<String, dynamic>),
    outputLocation: json['OutputLocation'] as String,
  );
}

Map<String, dynamic> _$ResultConfigurationToJson(ResultConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('OutputLocation', instance.outputLocation);
  return val;
}

Map<String, dynamic> _$ResultConfigurationUpdatesToJson(
    ResultConfigurationUpdates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('OutputLocation', instance.outputLocation);
  writeNotNull(
      'RemoveEncryptionConfiguration', instance.removeEncryptionConfiguration);
  writeNotNull('RemoveOutputLocation', instance.removeOutputLocation);
  return val;
}

ResultSet _$ResultSetFromJson(Map<String, dynamic> json) {
  return ResultSet(
    resultSetMetadata: json['ResultSetMetadata'] == null
        ? null
        : ResultSetMetadata.fromJson(
            json['ResultSetMetadata'] as Map<String, dynamic>),
    rows: (json['Rows'] as List)
        ?.map((e) => e == null ? null : Row.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResultSetMetadata _$ResultSetMetadataFromJson(Map<String, dynamic> json) {
  return ResultSetMetadata(
    columnInfo: (json['ColumnInfo'] as List)
        ?.map((e) =>
            e == null ? null : ColumnInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return Row(
    data: (json['Data'] as List)
        ?.map(
            (e) => e == null ? null : Datum.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StartQueryExecutionOutput _$StartQueryExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return StartQueryExecutionOutput(
    queryExecutionId: json['QueryExecutionId'] as String,
  );
}

StopQueryExecutionOutput _$StopQueryExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return StopQueryExecutionOutput();
}

TableMetadata _$TableMetadataFromJson(Map<String, dynamic> json) {
  return TableMetadata(
    name: json['Name'] as String,
    columns: (json['Columns'] as List)
        ?.map((e) =>
            e == null ? null : Column.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    lastAccessTime:
        const UnixDateTimeConverter().fromJson(json['LastAccessTime']),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    partitionKeys: (json['PartitionKeys'] as List)
        ?.map((e) =>
            e == null ? null : Column.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableType: json['TableType'] as String,
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

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

UnprocessedNamedQueryId _$UnprocessedNamedQueryIdFromJson(
    Map<String, dynamic> json) {
  return UnprocessedNamedQueryId(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    namedQueryId: json['NamedQueryId'] as String,
  );
}

UnprocessedQueryExecutionId _$UnprocessedQueryExecutionIdFromJson(
    Map<String, dynamic> json) {
  return UnprocessedQueryExecutionId(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    queryExecutionId: json['QueryExecutionId'] as String,
  );
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdateDataCatalogOutput _$UpdateDataCatalogOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDataCatalogOutput();
}

UpdateWorkGroupOutput _$UpdateWorkGroupOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkGroupOutput();
}

WorkGroup _$WorkGroupFromJson(Map<String, dynamic> json) {
  return WorkGroup(
    name: json['Name'] as String,
    configuration: json['Configuration'] == null
        ? null
        : WorkGroupConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String,
    state: _$enumDecodeNullable(_$WorkGroupStateEnumMap, json['State']),
  );
}

const _$WorkGroupStateEnumMap = {
  WorkGroupState.enabled: 'ENABLED',
  WorkGroupState.disabled: 'DISABLED',
};

WorkGroupConfiguration _$WorkGroupConfigurationFromJson(
    Map<String, dynamic> json) {
  return WorkGroupConfiguration(
    bytesScannedCutoffPerQuery: json['BytesScannedCutoffPerQuery'] as int,
    enforceWorkGroupConfiguration:
        json['EnforceWorkGroupConfiguration'] as bool,
    publishCloudWatchMetricsEnabled:
        json['PublishCloudWatchMetricsEnabled'] as bool,
    requesterPaysEnabled: json['RequesterPaysEnabled'] as bool,
    resultConfiguration: json['ResultConfiguration'] == null
        ? null
        : ResultConfiguration.fromJson(
            json['ResultConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkGroupConfigurationToJson(
    WorkGroupConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BytesScannedCutoffPerQuery', instance.bytesScannedCutoffPerQuery);
  writeNotNull(
      'EnforceWorkGroupConfiguration', instance.enforceWorkGroupConfiguration);
  writeNotNull('PublishCloudWatchMetricsEnabled',
      instance.publishCloudWatchMetricsEnabled);
  writeNotNull('RequesterPaysEnabled', instance.requesterPaysEnabled);
  writeNotNull('ResultConfiguration', instance.resultConfiguration?.toJson());
  return val;
}

Map<String, dynamic> _$WorkGroupConfigurationUpdatesToJson(
    WorkGroupConfigurationUpdates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BytesScannedCutoffPerQuery', instance.bytesScannedCutoffPerQuery);
  writeNotNull(
      'EnforceWorkGroupConfiguration', instance.enforceWorkGroupConfiguration);
  writeNotNull('PublishCloudWatchMetricsEnabled',
      instance.publishCloudWatchMetricsEnabled);
  writeNotNull('RemoveBytesScannedCutoffPerQuery',
      instance.removeBytesScannedCutoffPerQuery);
  writeNotNull('RequesterPaysEnabled', instance.requesterPaysEnabled);
  writeNotNull('ResultConfigurationUpdates',
      instance.resultConfigurationUpdates?.toJson());
  return val;
}

WorkGroupSummary _$WorkGroupSummaryFromJson(Map<String, dynamic> json) {
  return WorkGroupSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$WorkGroupStateEnumMap, json['State']),
  );
}
