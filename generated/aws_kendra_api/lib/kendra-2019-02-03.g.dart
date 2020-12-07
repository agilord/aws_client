// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kendra-2019-02-03.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessControlListConfiguration _$AccessControlListConfigurationFromJson(
    Map<String, dynamic> json) {
  return AccessControlListConfiguration(
    keyPath: json['KeyPath'] as String,
  );
}

Map<String, dynamic> _$AccessControlListConfigurationToJson(
    AccessControlListConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyPath', instance.keyPath);
  return val;
}

AclConfiguration _$AclConfigurationFromJson(Map<String, dynamic> json) {
  return AclConfiguration(
    allowedGroupsColumnName: json['AllowedGroupsColumnName'] as String,
  );
}

Map<String, dynamic> _$AclConfigurationToJson(AclConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedGroupsColumnName', instance.allowedGroupsColumnName);
  return val;
}

AdditionalResultAttribute _$AdditionalResultAttributeFromJson(
    Map<String, dynamic> json) {
  return AdditionalResultAttribute(
    key: json['Key'] as String,
    value: json['Value'] == null
        ? null
        : AdditionalResultAttributeValue.fromJson(
            json['Value'] as Map<String, dynamic>),
    valueType: _$enumDecodeNullable(
        _$AdditionalResultAttributeValueTypeEnumMap, json['ValueType']),
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

const _$AdditionalResultAttributeValueTypeEnumMap = {
  AdditionalResultAttributeValueType.textWithHighlightsValue:
      'TEXT_WITH_HIGHLIGHTS_VALUE',
};

AdditionalResultAttributeValue _$AdditionalResultAttributeValueFromJson(
    Map<String, dynamic> json) {
  return AdditionalResultAttributeValue(
    textWithHighlightsValue: json['TextWithHighlightsValue'] == null
        ? null
        : TextWithHighlights.fromJson(
            json['TextWithHighlightsValue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeFilterToJson(AttributeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AndAllFilters',
      instance.andAllFilters?.map((e) => e?.toJson())?.toList());
  writeNotNull('ContainsAll', instance.containsAll?.toJson());
  writeNotNull('ContainsAny', instance.containsAny?.toJson());
  writeNotNull('EqualsTo', instance.equalsTo?.toJson());
  writeNotNull('GreaterThan', instance.greaterThan?.toJson());
  writeNotNull('GreaterThanOrEquals', instance.greaterThanOrEquals?.toJson());
  writeNotNull('LessThan', instance.lessThan?.toJson());
  writeNotNull('LessThanOrEquals', instance.lessThanOrEquals?.toJson());
  writeNotNull('NotFilter', instance.notFilter?.toJson());
  writeNotNull(
      'OrAllFilters', instance.orAllFilters?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchDeleteDocumentResponse _$BatchDeleteDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteDocumentResponse(
    failedDocuments: (json['FailedDocuments'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDeleteDocumentResponseFailedDocument.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteDocumentResponseFailedDocument
    _$BatchDeleteDocumentResponseFailedDocumentFromJson(
        Map<String, dynamic> json) {
  return BatchDeleteDocumentResponseFailedDocument(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.internalError: 'InternalError',
  ErrorCode.invalidRequest: 'InvalidRequest',
};

BatchPutDocumentResponse _$BatchPutDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return BatchPutDocumentResponse(
    failedDocuments: (json['FailedDocuments'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutDocumentResponseFailedDocument.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchPutDocumentResponseFailedDocument
    _$BatchPutDocumentResponseFailedDocumentFromJson(
        Map<String, dynamic> json) {
  return BatchPutDocumentResponseFailedDocument(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
  );
}

Map<String, dynamic> _$ClickFeedbackToJson(ClickFeedback instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClickTime', unixTimestampToJson(instance.clickTime));
  writeNotNull('ResultId', instance.resultId);
  return val;
}

ColumnConfiguration _$ColumnConfigurationFromJson(Map<String, dynamic> json) {
  return ColumnConfiguration(
    changeDetectingColumns: (json['ChangeDetectingColumns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    documentDataColumnName: json['DocumentDataColumnName'] as String,
    documentIdColumnName: json['DocumentIdColumnName'] as String,
    documentTitleColumnName: json['DocumentTitleColumnName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ColumnConfigurationToJson(ColumnConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChangeDetectingColumns', instance.changeDetectingColumns);
  writeNotNull('DocumentDataColumnName', instance.documentDataColumnName);
  writeNotNull('DocumentIdColumnName', instance.documentIdColumnName);
  writeNotNull('DocumentTitleColumnName', instance.documentTitleColumnName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

ConnectionConfiguration _$ConnectionConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConnectionConfiguration(
    databaseHost: json['DatabaseHost'] as String,
    databaseName: json['DatabaseName'] as String,
    databasePort: json['DatabasePort'] as int,
    secretArn: json['SecretArn'] as String,
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$ConnectionConfigurationToJson(
    ConnectionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseHost', instance.databaseHost);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('DatabasePort', instance.databasePort);
  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('TableName', instance.tableName);
  return val;
}

CreateDataSourceResponse _$CreateDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceResponse(
    id: json['Id'] as String,
  );
}

CreateFaqResponse _$CreateFaqResponseFromJson(Map<String, dynamic> json) {
  return CreateFaqResponse(
    id: json['Id'] as String,
  );
}

CreateIndexResponse _$CreateIndexResponseFromJson(Map<String, dynamic> json) {
  return CreateIndexResponse(
    id: json['Id'] as String,
  );
}

DataSourceConfiguration _$DataSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return DataSourceConfiguration(
    databaseConfiguration: json['DatabaseConfiguration'] == null
        ? null
        : DatabaseConfiguration.fromJson(
            json['DatabaseConfiguration'] as Map<String, dynamic>),
    s3Configuration: json['S3Configuration'] == null
        ? null
        : S3DataSourceConfiguration.fromJson(
            json['S3Configuration'] as Map<String, dynamic>),
    sharePointConfiguration: json['SharePointConfiguration'] == null
        ? null
        : SharePointConfiguration.fromJson(
            json['SharePointConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataSourceConfigurationToJson(
    DataSourceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DatabaseConfiguration', instance.databaseConfiguration?.toJson());
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull(
      'SharePointConfiguration', instance.sharePointConfiguration?.toJson());
  return val;
}

DataSourceSummary _$DataSourceSummaryFromJson(Map<String, dynamic> json) {
  return DataSourceSummary(
    createdAt: timeStampFromJson(json['CreatedAt']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['Type']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
  );
}

const _$DataSourceStatusEnumMap = {
  DataSourceStatus.creating: 'CREATING',
  DataSourceStatus.deleting: 'DELETING',
  DataSourceStatus.failed: 'FAILED',
  DataSourceStatus.updating: 'UPDATING',
  DataSourceStatus.active: 'ACTIVE',
};

const _$DataSourceTypeEnumMap = {
  DataSourceType.s3: 'S3',
  DataSourceType.sharepoint: 'SHAREPOINT',
  DataSourceType.database: 'DATABASE',
};

DataSourceSyncJob _$DataSourceSyncJobFromJson(Map<String, dynamic> json) {
  return DataSourceSyncJob(
    dataSourceErrorCode: json['DataSourceErrorCode'] as String,
    endTime: timeStampFromJson(json['EndTime']),
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    executionId: json['ExecutionId'] as String,
    startTime: timeStampFromJson(json['StartTime']),
    status:
        _$enumDecodeNullable(_$DataSourceSyncJobStatusEnumMap, json['Status']),
  );
}

const _$DataSourceSyncJobStatusEnumMap = {
  DataSourceSyncJobStatus.failed: 'FAILED',
  DataSourceSyncJobStatus.succeeded: 'SUCCEEDED',
  DataSourceSyncJobStatus.syncing: 'SYNCING',
  DataSourceSyncJobStatus.incomplete: 'INCOMPLETE',
  DataSourceSyncJobStatus.stopping: 'STOPPING',
  DataSourceSyncJobStatus.aborted: 'ABORTED',
};

DataSourceToIndexFieldMapping _$DataSourceToIndexFieldMappingFromJson(
    Map<String, dynamic> json) {
  return DataSourceToIndexFieldMapping(
    dataSourceFieldName: json['DataSourceFieldName'] as String,
    indexFieldName: json['IndexFieldName'] as String,
    dateFieldFormat: json['DateFieldFormat'] as String,
  );
}

Map<String, dynamic> _$DataSourceToIndexFieldMappingToJson(
    DataSourceToIndexFieldMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceFieldName', instance.dataSourceFieldName);
  writeNotNull('IndexFieldName', instance.indexFieldName);
  writeNotNull('DateFieldFormat', instance.dateFieldFormat);
  return val;
}

DataSourceVpcConfiguration _$DataSourceVpcConfigurationFromJson(
    Map<String, dynamic> json) {
  return DataSourceVpcConfiguration(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DataSourceVpcConfigurationToJson(
    DataSourceVpcConfiguration instance) {
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

DatabaseConfiguration _$DatabaseConfigurationFromJson(
    Map<String, dynamic> json) {
  return DatabaseConfiguration(
    columnConfiguration: json['ColumnConfiguration'] == null
        ? null
        : ColumnConfiguration.fromJson(
            json['ColumnConfiguration'] as Map<String, dynamic>),
    connectionConfiguration: json['ConnectionConfiguration'] == null
        ? null
        : ConnectionConfiguration.fromJson(
            json['ConnectionConfiguration'] as Map<String, dynamic>),
    databaseEngineType: _$enumDecodeNullable(
        _$DatabaseEngineTypeEnumMap, json['DatabaseEngineType']),
    aclConfiguration: json['AclConfiguration'] == null
        ? null
        : AclConfiguration.fromJson(
            json['AclConfiguration'] as Map<String, dynamic>),
    vpcConfiguration: json['VpcConfiguration'] == null
        ? null
        : DataSourceVpcConfiguration.fromJson(
            json['VpcConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatabaseConfigurationToJson(
    DatabaseConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnConfiguration', instance.columnConfiguration?.toJson());
  writeNotNull(
      'ConnectionConfiguration', instance.connectionConfiguration?.toJson());
  writeNotNull('DatabaseEngineType',
      _$DatabaseEngineTypeEnumMap[instance.databaseEngineType]);
  writeNotNull('AclConfiguration', instance.aclConfiguration?.toJson());
  writeNotNull('VpcConfiguration', instance.vpcConfiguration?.toJson());
  return val;
}

const _$DatabaseEngineTypeEnumMap = {
  DatabaseEngineType.rdsAuroraMysql: 'RDS_AURORA_MYSQL',
  DatabaseEngineType.rdsAuroraPostgresql: 'RDS_AURORA_POSTGRESQL',
  DatabaseEngineType.rdsMysql: 'RDS_MYSQL',
  DatabaseEngineType.rdsPostgresql: 'RDS_POSTGRESQL',
};

DescribeDataSourceResponse _$DescribeDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSourceResponse(
    configuration: json['Configuration'] == null
        ? null
        : DataSourceConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    createdAt: timeStampFromJson(json['CreatedAt']),
    description: json['Description'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    indexId: json['IndexId'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    schedule: json['Schedule'] as String,
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['Type']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
  );
}

DescribeFaqResponse _$DescribeFaqResponseFromJson(Map<String, dynamic> json) {
  return DescribeFaqResponse(
    createdAt: timeStampFromJson(json['CreatedAt']),
    description: json['Description'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    indexId: json['IndexId'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    s3Path: json['S3Path'] == null
        ? null
        : S3Path.fromJson(json['S3Path'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$FaqStatusEnumMap, json['Status']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
  );
}

const _$FaqStatusEnumMap = {
  FaqStatus.creating: 'CREATING',
  FaqStatus.updating: 'UPDATING',
  FaqStatus.active: 'ACTIVE',
  FaqStatus.deleting: 'DELETING',
  FaqStatus.failed: 'FAILED',
};

DescribeIndexResponse _$DescribeIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIndexResponse(
    createdAt: timeStampFromJson(json['CreatedAt']),
    description: json['Description'] as String,
    documentMetadataConfigurations: (json['DocumentMetadataConfigurations']
            as List)
        ?.map((e) => e == null
            ? null
            : DocumentMetadataConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    indexStatistics: json['IndexStatistics'] == null
        ? null
        : IndexStatistics.fromJson(
            json['IndexStatistics'] as Map<String, dynamic>),
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    serverSideEncryptionConfiguration:
        json['ServerSideEncryptionConfiguration'] == null
            ? null
            : ServerSideEncryptionConfiguration.fromJson(
                json['ServerSideEncryptionConfiguration']
                    as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$IndexStatusEnumMap, json['Status']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
  );
}

const _$IndexStatusEnumMap = {
  IndexStatus.creating: 'CREATING',
  IndexStatus.active: 'ACTIVE',
  IndexStatus.deleting: 'DELETING',
  IndexStatus.failed: 'FAILED',
  IndexStatus.systemUpdating: 'SYSTEM_UPDATING',
};

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AccessControlList',
      instance.accessControlList?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('Blob', const Uint8ListConverter().toJson(instance.blob));
  writeNotNull('ContentType', _$ContentTypeEnumMap[instance.contentType]);
  writeNotNull('S3Path', instance.s3Path?.toJson());
  writeNotNull('Title', instance.title);
  return val;
}

const _$ContentTypeEnumMap = {
  ContentType.pdf: 'PDF',
  ContentType.html: 'HTML',
  ContentType.msWord: 'MS_WORD',
  ContentType.plainText: 'PLAIN_TEXT',
  ContentType.ppt: 'PPT',
};

DocumentAttribute _$DocumentAttributeFromJson(Map<String, dynamic> json) {
  return DocumentAttribute(
    key: json['Key'] as String,
    value: json['Value'] == null
        ? null
        : DocumentAttributeValue.fromJson(
            json['Value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentAttributeToJson(DocumentAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

DocumentAttributeValue _$DocumentAttributeValueFromJson(
    Map<String, dynamic> json) {
  return DocumentAttributeValue(
    dateValue: timeStampFromJson(json['DateValue']),
    longValue: json['LongValue'] as int,
    stringListValue:
        (json['StringListValue'] as List)?.map((e) => e as String)?.toList(),
    stringValue: json['StringValue'] as String,
  );
}

Map<String, dynamic> _$DocumentAttributeValueToJson(
    DocumentAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DateValue', unixTimestampToJson(instance.dateValue));
  writeNotNull('LongValue', instance.longValue);
  writeNotNull('StringListValue', instance.stringListValue);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

DocumentAttributeValueCountPair _$DocumentAttributeValueCountPairFromJson(
    Map<String, dynamic> json) {
  return DocumentAttributeValueCountPair(
    count: json['Count'] as int,
    documentAttributeValue: json['DocumentAttributeValue'] == null
        ? null
        : DocumentAttributeValue.fromJson(
            json['DocumentAttributeValue'] as Map<String, dynamic>),
  );
}

DocumentMetadataConfiguration _$DocumentMetadataConfigurationFromJson(
    Map<String, dynamic> json) {
  return DocumentMetadataConfiguration(
    name: json['Name'] as String,
    type:
        _$enumDecodeNullable(_$DocumentAttributeValueTypeEnumMap, json['Type']),
    relevance: json['Relevance'] == null
        ? null
        : Relevance.fromJson(json['Relevance'] as Map<String, dynamic>),
    search: json['Search'] == null
        ? null
        : Search.fromJson(json['Search'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentMetadataConfigurationToJson(
    DocumentMetadataConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$DocumentAttributeValueTypeEnumMap[instance.type]);
  writeNotNull('Relevance', instance.relevance?.toJson());
  writeNotNull('Search', instance.search?.toJson());
  return val;
}

const _$DocumentAttributeValueTypeEnumMap = {
  DocumentAttributeValueType.stringValue: 'STRING_VALUE',
  DocumentAttributeValueType.stringListValue: 'STRING_LIST_VALUE',
  DocumentAttributeValueType.longValue: 'LONG_VALUE',
  DocumentAttributeValueType.dateValue: 'DATE_VALUE',
};

DocumentsMetadataConfiguration _$DocumentsMetadataConfigurationFromJson(
    Map<String, dynamic> json) {
  return DocumentsMetadataConfiguration(
    s3Prefix: json['S3Prefix'] as String,
  );
}

Map<String, dynamic> _$DocumentsMetadataConfigurationToJson(
    DocumentsMetadataConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Prefix', instance.s3Prefix);
  return val;
}

Map<String, dynamic> _$FacetToJson(Facet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentAttributeKey', instance.documentAttributeKey);
  return val;
}

FacetResult _$FacetResultFromJson(Map<String, dynamic> json) {
  return FacetResult(
    documentAttributeKey: json['DocumentAttributeKey'] as String,
    documentAttributeValueCountPairs:
        (json['DocumentAttributeValueCountPairs'] as List)
            ?.map((e) => e == null
                ? null
                : DocumentAttributeValueCountPair.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

FaqStatistics _$FaqStatisticsFromJson(Map<String, dynamic> json) {
  return FaqStatistics(
    indexedQuestionAnswersCount: json['IndexedQuestionAnswersCount'] as int,
  );
}

FaqSummary _$FaqSummaryFromJson(Map<String, dynamic> json) {
  return FaqSummary(
    createdAt: timeStampFromJson(json['CreatedAt']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$FaqStatusEnumMap, json['Status']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
  );
}

Highlight _$HighlightFromJson(Map<String, dynamic> json) {
  return Highlight(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    topAnswer: json['TopAnswer'] as bool,
  );
}

IndexConfigurationSummary _$IndexConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return IndexConfigurationSummary(
    createdAt: timeStampFromJson(json['CreatedAt']),
    status: _$enumDecodeNullable(_$IndexStatusEnumMap, json['Status']),
    updatedAt: timeStampFromJson(json['UpdatedAt']),
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

IndexStatistics _$IndexStatisticsFromJson(Map<String, dynamic> json) {
  return IndexStatistics(
    faqStatistics: json['FaqStatistics'] == null
        ? null
        : FaqStatistics.fromJson(json['FaqStatistics'] as Map<String, dynamic>),
    textDocumentStatistics: json['TextDocumentStatistics'] == null
        ? null
        : TextDocumentStatistics.fromJson(
            json['TextDocumentStatistics'] as Map<String, dynamic>),
  );
}

ListDataSourceSyncJobsResponse _$ListDataSourceSyncJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataSourceSyncJobsResponse(
    history: (json['History'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceSyncJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDataSourcesResponse _$ListDataSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataSourcesResponse(
    nextToken: json['NextToken'] as String,
    summaryItems: (json['SummaryItems'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListFaqsResponse _$ListFaqsResponseFromJson(Map<String, dynamic> json) {
  return ListFaqsResponse(
    faqSummaryItems: (json['FaqSummaryItems'] as List)
        ?.map((e) =>
            e == null ? null : FaqSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIndicesResponse _$ListIndicesResponseFromJson(Map<String, dynamic> json) {
  return ListIndicesResponse(
    indexConfigurationSummaryItems:
        (json['IndexConfigurationSummaryItems'] as List)
            ?.map((e) => e == null
                ? null
                : IndexConfigurationSummary.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$PrincipalToJson(Principal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Access', _$ReadAccessTypeEnumMap[instance.access]);
  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$PrincipalTypeEnumMap[instance.type]);
  return val;
}

const _$ReadAccessTypeEnumMap = {
  ReadAccessType.allow: 'ALLOW',
  ReadAccessType.deny: 'DENY',
};

const _$PrincipalTypeEnumMap = {
  PrincipalType.user: 'USER',
  PrincipalType.group: 'GROUP',
};

QueryResult _$QueryResultFromJson(Map<String, dynamic> json) {
  return QueryResult(
    facetResults: (json['FacetResults'] as List)
        ?.map((e) =>
            e == null ? null : FacetResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    queryId: json['QueryId'] as String,
    resultItems: (json['ResultItems'] as List)
        ?.map((e) => e == null
            ? null
            : QueryResultItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalNumberOfResults: json['TotalNumberOfResults'] as int,
  );
}

QueryResultItem _$QueryResultItemFromJson(Map<String, dynamic> json) {
  return QueryResultItem(
    additionalAttributes: (json['AdditionalAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AdditionalResultAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    documentAttributes: (json['DocumentAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    documentExcerpt: json['DocumentExcerpt'] == null
        ? null
        : TextWithHighlights.fromJson(
            json['DocumentExcerpt'] as Map<String, dynamic>),
    documentId: json['DocumentId'] as String,
    documentTitle: json['DocumentTitle'] == null
        ? null
        : TextWithHighlights.fromJson(
            json['DocumentTitle'] as Map<String, dynamic>),
    documentURI: json['DocumentURI'] as String,
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$QueryResultTypeEnumMap, json['Type']),
  );
}

const _$QueryResultTypeEnumMap = {
  QueryResultType.document: 'DOCUMENT',
  QueryResultType.questionAnswer: 'QUESTION_ANSWER',
  QueryResultType.answer: 'ANSWER',
};

Relevance _$RelevanceFromJson(Map<String, dynamic> json) {
  return Relevance(
    duration: json['Duration'] as String,
    freshness: json['Freshness'] as bool,
    importance: json['Importance'] as int,
    rankOrder: _$enumDecodeNullable(_$OrderEnumMap, json['RankOrder']),
    valueImportanceMap:
        (json['ValueImportanceMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

Map<String, dynamic> _$RelevanceToJson(Relevance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Duration', instance.duration);
  writeNotNull('Freshness', instance.freshness);
  writeNotNull('Importance', instance.importance);
  writeNotNull('RankOrder', _$OrderEnumMap[instance.rankOrder]);
  writeNotNull('ValueImportanceMap', instance.valueImportanceMap);
  return val;
}

const _$OrderEnumMap = {
  Order.ascending: 'ASCENDING',
  Order.descending: 'DESCENDING',
};

Map<String, dynamic> _$RelevanceFeedbackToJson(RelevanceFeedback instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RelevanceValue', _$RelevanceTypeEnumMap[instance.relevanceValue]);
  writeNotNull('ResultId', instance.resultId);
  return val;
}

const _$RelevanceTypeEnumMap = {
  RelevanceType.relevant: 'RELEVANT',
  RelevanceType.notRelevant: 'NOT_RELEVANT',
};

S3DataSourceConfiguration _$S3DataSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return S3DataSourceConfiguration(
    bucketName: json['BucketName'] as String,
    accessControlListConfiguration:
        json['AccessControlListConfiguration'] == null
            ? null
            : AccessControlListConfiguration.fromJson(
                json['AccessControlListConfiguration'] as Map<String, dynamic>),
    documentsMetadataConfiguration:
        json['DocumentsMetadataConfiguration'] == null
            ? null
            : DocumentsMetadataConfiguration.fromJson(
                json['DocumentsMetadataConfiguration'] as Map<String, dynamic>),
    exclusionPatterns:
        (json['ExclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    inclusionPrefixes:
        (json['InclusionPrefixes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$S3DataSourceConfigurationToJson(
    S3DataSourceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('AccessControlListConfiguration',
      instance.accessControlListConfiguration?.toJson());
  writeNotNull('DocumentsMetadataConfiguration',
      instance.documentsMetadataConfiguration?.toJson());
  writeNotNull('ExclusionPatterns', instance.exclusionPatterns);
  writeNotNull('InclusionPrefixes', instance.inclusionPrefixes);
  return val;
}

S3Path _$S3PathFromJson(Map<String, dynamic> json) {
  return S3Path(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$S3PathToJson(S3Path instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  return val;
}

Search _$SearchFromJson(Map<String, dynamic> json) {
  return Search(
    displayable: json['Displayable'] as bool,
    facetable: json['Facetable'] as bool,
    searchable: json['Searchable'] as bool,
  );
}

Map<String, dynamic> _$SearchToJson(Search instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Displayable', instance.displayable);
  writeNotNull('Facetable', instance.facetable);
  writeNotNull('Searchable', instance.searchable);
  return val;
}

ServerSideEncryptionConfiguration _$ServerSideEncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return ServerSideEncryptionConfiguration(
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$ServerSideEncryptionConfigurationToJson(
    ServerSideEncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

SharePointConfiguration _$SharePointConfigurationFromJson(
    Map<String, dynamic> json) {
  return SharePointConfiguration(
    secretArn: json['SecretArn'] as String,
    sharePointVersion: _$enumDecodeNullable(
        _$SharePointVersionEnumMap, json['SharePointVersion']),
    urls: (json['Urls'] as List)?.map((e) => e as String)?.toList(),
    crawlAttachments: json['CrawlAttachments'] as bool,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    exclusionPatterns:
        (json['ExclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inclusionPatterns:
        (json['InclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    useChangeLog: json['UseChangeLog'] as bool,
    vpcConfiguration: json['VpcConfiguration'] == null
        ? null
        : DataSourceVpcConfiguration.fromJson(
            json['VpcConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharePointConfigurationToJson(
    SharePointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('SharePointVersion',
      _$SharePointVersionEnumMap[instance.sharePointVersion]);
  writeNotNull('Urls', instance.urls);
  writeNotNull('CrawlAttachments', instance.crawlAttachments);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('ExclusionPatterns', instance.exclusionPatterns);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('InclusionPatterns', instance.inclusionPatterns);
  writeNotNull('UseChangeLog', instance.useChangeLog);
  writeNotNull('VpcConfiguration', instance.vpcConfiguration?.toJson());
  return val;
}

const _$SharePointVersionEnumMap = {
  SharePointVersion.sharepointOnline: 'SHAREPOINT_ONLINE',
};

StartDataSourceSyncJobResponse _$StartDataSourceSyncJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartDataSourceSyncJobResponse(
    executionId: json['ExecutionId'] as String,
  );
}

TextDocumentStatistics _$TextDocumentStatisticsFromJson(
    Map<String, dynamic> json) {
  return TextDocumentStatistics(
    indexedTextDocumentsCount: json['IndexedTextDocumentsCount'] as int,
  );
}

TextWithHighlights _$TextWithHighlightsFromJson(Map<String, dynamic> json) {
  return TextWithHighlights(
    highlights: (json['Highlights'] as List)
        ?.map((e) =>
            e == null ? null : Highlight.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    text: json['Text'] as String,
  );
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
}
