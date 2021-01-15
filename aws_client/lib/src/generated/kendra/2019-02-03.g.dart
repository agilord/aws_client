// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-02-03.dart';

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

CapacityUnitsConfiguration _$CapacityUnitsConfigurationFromJson(
    Map<String, dynamic> json) {
  return CapacityUnitsConfiguration(
    queryCapacityUnits: json['QueryCapacityUnits'] as int,
    storageCapacityUnits: json['StorageCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$CapacityUnitsConfigurationToJson(
    CapacityUnitsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QueryCapacityUnits', instance.queryCapacityUnits);
  writeNotNull('StorageCapacityUnits', instance.storageCapacityUnits);
  return val;
}

Map<String, dynamic> _$ClickFeedbackToJson(ClickFeedback instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ClickTime', const UnixDateTimeConverter().toJson(instance.clickTime));
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

ConfluenceAttachmentConfiguration _$ConfluenceAttachmentConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConfluenceAttachmentConfiguration(
    attachmentFieldMappings: (json['AttachmentFieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : ConfluenceAttachmentToIndexFieldMapping.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    crawlAttachments: json['CrawlAttachments'] as bool,
  );
}

Map<String, dynamic> _$ConfluenceAttachmentConfigurationToJson(
    ConfluenceAttachmentConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachmentFieldMappings',
      instance.attachmentFieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('CrawlAttachments', instance.crawlAttachments);
  return val;
}

ConfluenceAttachmentToIndexFieldMapping
    _$ConfluenceAttachmentToIndexFieldMappingFromJson(
        Map<String, dynamic> json) {
  return ConfluenceAttachmentToIndexFieldMapping(
    dataSourceFieldName: _$enumDecodeNullable(
        _$ConfluenceAttachmentFieldNameEnumMap, json['DataSourceFieldName']),
    dateFieldFormat: json['DateFieldFormat'] as String,
    indexFieldName: json['IndexFieldName'] as String,
  );
}

Map<String, dynamic> _$ConfluenceAttachmentToIndexFieldMappingToJson(
    ConfluenceAttachmentToIndexFieldMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceFieldName',
      _$ConfluenceAttachmentFieldNameEnumMap[instance.dataSourceFieldName]);
  writeNotNull('DateFieldFormat', instance.dateFieldFormat);
  writeNotNull('IndexFieldName', instance.indexFieldName);
  return val;
}

const _$ConfluenceAttachmentFieldNameEnumMap = {
  ConfluenceAttachmentFieldName.author: 'AUTHOR',
  ConfluenceAttachmentFieldName.contentType: 'CONTENT_TYPE',
  ConfluenceAttachmentFieldName.createdDate: 'CREATED_DATE',
  ConfluenceAttachmentFieldName.displayUrl: 'DISPLAY_URL',
  ConfluenceAttachmentFieldName.fileSize: 'FILE_SIZE',
  ConfluenceAttachmentFieldName.itemType: 'ITEM_TYPE',
  ConfluenceAttachmentFieldName.parentId: 'PARENT_ID',
  ConfluenceAttachmentFieldName.spaceKey: 'SPACE_KEY',
  ConfluenceAttachmentFieldName.spaceName: 'SPACE_NAME',
  ConfluenceAttachmentFieldName.url: 'URL',
  ConfluenceAttachmentFieldName.version: 'VERSION',
};

ConfluenceBlogConfiguration _$ConfluenceBlogConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConfluenceBlogConfiguration(
    blogFieldMappings: (json['BlogFieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : ConfluenceBlogToIndexFieldMapping.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfluenceBlogConfigurationToJson(
    ConfluenceBlogConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BlogFieldMappings',
      instance.blogFieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

ConfluenceBlogToIndexFieldMapping _$ConfluenceBlogToIndexFieldMappingFromJson(
    Map<String, dynamic> json) {
  return ConfluenceBlogToIndexFieldMapping(
    dataSourceFieldName: _$enumDecodeNullable(
        _$ConfluenceBlogFieldNameEnumMap, json['DataSourceFieldName']),
    dateFieldFormat: json['DateFieldFormat'] as String,
    indexFieldName: json['IndexFieldName'] as String,
  );
}

Map<String, dynamic> _$ConfluenceBlogToIndexFieldMappingToJson(
    ConfluenceBlogToIndexFieldMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceFieldName',
      _$ConfluenceBlogFieldNameEnumMap[instance.dataSourceFieldName]);
  writeNotNull('DateFieldFormat', instance.dateFieldFormat);
  writeNotNull('IndexFieldName', instance.indexFieldName);
  return val;
}

const _$ConfluenceBlogFieldNameEnumMap = {
  ConfluenceBlogFieldName.author: 'AUTHOR',
  ConfluenceBlogFieldName.displayUrl: 'DISPLAY_URL',
  ConfluenceBlogFieldName.itemType: 'ITEM_TYPE',
  ConfluenceBlogFieldName.labels: 'LABELS',
  ConfluenceBlogFieldName.publishDate: 'PUBLISH_DATE',
  ConfluenceBlogFieldName.spaceKey: 'SPACE_KEY',
  ConfluenceBlogFieldName.spaceName: 'SPACE_NAME',
  ConfluenceBlogFieldName.url: 'URL',
  ConfluenceBlogFieldName.version: 'VERSION',
};

ConfluenceConfiguration _$ConfluenceConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConfluenceConfiguration(
    secretArn: json['SecretArn'] as String,
    serverUrl: json['ServerUrl'] as String,
    version: _$enumDecodeNullable(_$ConfluenceVersionEnumMap, json['Version']),
    attachmentConfiguration: json['AttachmentConfiguration'] == null
        ? null
        : ConfluenceAttachmentConfiguration.fromJson(
            json['AttachmentConfiguration'] as Map<String, dynamic>),
    blogConfiguration: json['BlogConfiguration'] == null
        ? null
        : ConfluenceBlogConfiguration.fromJson(
            json['BlogConfiguration'] as Map<String, dynamic>),
    exclusionPatterns:
        (json['ExclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    inclusionPatterns:
        (json['InclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    pageConfiguration: json['PageConfiguration'] == null
        ? null
        : ConfluencePageConfiguration.fromJson(
            json['PageConfiguration'] as Map<String, dynamic>),
    spaceConfiguration: json['SpaceConfiguration'] == null
        ? null
        : ConfluenceSpaceConfiguration.fromJson(
            json['SpaceConfiguration'] as Map<String, dynamic>),
    vpcConfiguration: json['VpcConfiguration'] == null
        ? null
        : DataSourceVpcConfiguration.fromJson(
            json['VpcConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfluenceConfigurationToJson(
    ConfluenceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('ServerUrl', instance.serverUrl);
  writeNotNull('Version', _$ConfluenceVersionEnumMap[instance.version]);
  writeNotNull(
      'AttachmentConfiguration', instance.attachmentConfiguration?.toJson());
  writeNotNull('BlogConfiguration', instance.blogConfiguration?.toJson());
  writeNotNull('ExclusionPatterns', instance.exclusionPatterns);
  writeNotNull('InclusionPatterns', instance.inclusionPatterns);
  writeNotNull('PageConfiguration', instance.pageConfiguration?.toJson());
  writeNotNull('SpaceConfiguration', instance.spaceConfiguration?.toJson());
  writeNotNull('VpcConfiguration', instance.vpcConfiguration?.toJson());
  return val;
}

const _$ConfluenceVersionEnumMap = {
  ConfluenceVersion.cloud: 'CLOUD',
  ConfluenceVersion.server: 'SERVER',
};

ConfluencePageConfiguration _$ConfluencePageConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConfluencePageConfiguration(
    pageFieldMappings: (json['PageFieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : ConfluencePageToIndexFieldMapping.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfluencePageConfigurationToJson(
    ConfluencePageConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PageFieldMappings',
      instance.pageFieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

ConfluencePageToIndexFieldMapping _$ConfluencePageToIndexFieldMappingFromJson(
    Map<String, dynamic> json) {
  return ConfluencePageToIndexFieldMapping(
    dataSourceFieldName: _$enumDecodeNullable(
        _$ConfluencePageFieldNameEnumMap, json['DataSourceFieldName']),
    dateFieldFormat: json['DateFieldFormat'] as String,
    indexFieldName: json['IndexFieldName'] as String,
  );
}

Map<String, dynamic> _$ConfluencePageToIndexFieldMappingToJson(
    ConfluencePageToIndexFieldMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceFieldName',
      _$ConfluencePageFieldNameEnumMap[instance.dataSourceFieldName]);
  writeNotNull('DateFieldFormat', instance.dateFieldFormat);
  writeNotNull('IndexFieldName', instance.indexFieldName);
  return val;
}

const _$ConfluencePageFieldNameEnumMap = {
  ConfluencePageFieldName.author: 'AUTHOR',
  ConfluencePageFieldName.contentStatus: 'CONTENT_STATUS',
  ConfluencePageFieldName.createdDate: 'CREATED_DATE',
  ConfluencePageFieldName.displayUrl: 'DISPLAY_URL',
  ConfluencePageFieldName.itemType: 'ITEM_TYPE',
  ConfluencePageFieldName.labels: 'LABELS',
  ConfluencePageFieldName.modifiedDate: 'MODIFIED_DATE',
  ConfluencePageFieldName.parentId: 'PARENT_ID',
  ConfluencePageFieldName.spaceKey: 'SPACE_KEY',
  ConfluencePageFieldName.spaceName: 'SPACE_NAME',
  ConfluencePageFieldName.url: 'URL',
  ConfluencePageFieldName.version: 'VERSION',
};

ConfluenceSpaceConfiguration _$ConfluenceSpaceConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConfluenceSpaceConfiguration(
    crawlArchivedSpaces: json['CrawlArchivedSpaces'] as bool,
    crawlPersonalSpaces: json['CrawlPersonalSpaces'] as bool,
    excludeSpaces:
        (json['ExcludeSpaces'] as List)?.map((e) => e as String)?.toList(),
    includeSpaces:
        (json['IncludeSpaces'] as List)?.map((e) => e as String)?.toList(),
    spaceFieldMappings: (json['SpaceFieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : ConfluenceSpaceToIndexFieldMapping.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfluenceSpaceConfigurationToJson(
    ConfluenceSpaceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CrawlArchivedSpaces', instance.crawlArchivedSpaces);
  writeNotNull('CrawlPersonalSpaces', instance.crawlPersonalSpaces);
  writeNotNull('ExcludeSpaces', instance.excludeSpaces);
  writeNotNull('IncludeSpaces', instance.includeSpaces);
  writeNotNull('SpaceFieldMappings',
      instance.spaceFieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

ConfluenceSpaceToIndexFieldMapping _$ConfluenceSpaceToIndexFieldMappingFromJson(
    Map<String, dynamic> json) {
  return ConfluenceSpaceToIndexFieldMapping(
    dataSourceFieldName: _$enumDecodeNullable(
        _$ConfluenceSpaceFieldNameEnumMap, json['DataSourceFieldName']),
    dateFieldFormat: json['DateFieldFormat'] as String,
    indexFieldName: json['IndexFieldName'] as String,
  );
}

Map<String, dynamic> _$ConfluenceSpaceToIndexFieldMappingToJson(
    ConfluenceSpaceToIndexFieldMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceFieldName',
      _$ConfluenceSpaceFieldNameEnumMap[instance.dataSourceFieldName]);
  writeNotNull('DateFieldFormat', instance.dateFieldFormat);
  writeNotNull('IndexFieldName', instance.indexFieldName);
  return val;
}

const _$ConfluenceSpaceFieldNameEnumMap = {
  ConfluenceSpaceFieldName.displayUrl: 'DISPLAY_URL',
  ConfluenceSpaceFieldName.itemType: 'ITEM_TYPE',
  ConfluenceSpaceFieldName.spaceKey: 'SPACE_KEY',
  ConfluenceSpaceFieldName.url: 'URL',
};

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

CreateThesaurusResponse _$CreateThesaurusResponseFromJson(
    Map<String, dynamic> json) {
  return CreateThesaurusResponse(
    id: json['Id'] as String,
  );
}

DataSourceConfiguration _$DataSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return DataSourceConfiguration(
    confluenceConfiguration: json['ConfluenceConfiguration'] == null
        ? null
        : ConfluenceConfiguration.fromJson(
            json['ConfluenceConfiguration'] as Map<String, dynamic>),
    databaseConfiguration: json['DatabaseConfiguration'] == null
        ? null
        : DatabaseConfiguration.fromJson(
            json['DatabaseConfiguration'] as Map<String, dynamic>),
    googleDriveConfiguration: json['GoogleDriveConfiguration'] == null
        ? null
        : GoogleDriveConfiguration.fromJson(
            json['GoogleDriveConfiguration'] as Map<String, dynamic>),
    oneDriveConfiguration: json['OneDriveConfiguration'] == null
        ? null
        : OneDriveConfiguration.fromJson(
            json['OneDriveConfiguration'] as Map<String, dynamic>),
    s3Configuration: json['S3Configuration'] == null
        ? null
        : S3DataSourceConfiguration.fromJson(
            json['S3Configuration'] as Map<String, dynamic>),
    salesforceConfiguration: json['SalesforceConfiguration'] == null
        ? null
        : SalesforceConfiguration.fromJson(
            json['SalesforceConfiguration'] as Map<String, dynamic>),
    serviceNowConfiguration: json['ServiceNowConfiguration'] == null
        ? null
        : ServiceNowConfiguration.fromJson(
            json['ServiceNowConfiguration'] as Map<String, dynamic>),
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
      'ConfluenceConfiguration', instance.confluenceConfiguration?.toJson());
  writeNotNull(
      'DatabaseConfiguration', instance.databaseConfiguration?.toJson());
  writeNotNull(
      'GoogleDriveConfiguration', instance.googleDriveConfiguration?.toJson());
  writeNotNull(
      'OneDriveConfiguration', instance.oneDriveConfiguration?.toJson());
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull(
      'SalesforceConfiguration', instance.salesforceConfiguration?.toJson());
  writeNotNull(
      'ServiceNowConfiguration', instance.serviceNowConfiguration?.toJson());
  writeNotNull(
      'SharePointConfiguration', instance.sharePointConfiguration?.toJson());
  return val;
}

DataSourceSummary _$DataSourceSummaryFromJson(Map<String, dynamic> json) {
  return DataSourceSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['Type']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
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
  DataSourceType.salesforce: 'SALESFORCE',
  DataSourceType.onedrive: 'ONEDRIVE',
  DataSourceType.servicenow: 'SERVICENOW',
  DataSourceType.custom: 'CUSTOM',
  DataSourceType.confluence: 'CONFLUENCE',
  DataSourceType.googledrive: 'GOOGLEDRIVE',
};

DataSourceSyncJob _$DataSourceSyncJobFromJson(Map<String, dynamic> json) {
  return DataSourceSyncJob(
    dataSourceErrorCode: json['DataSourceErrorCode'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    executionId: json['ExecutionId'] as String,
    metrics: json['Metrics'] == null
        ? null
        : DataSourceSyncJobMetrics.fromJson(
            json['Metrics'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
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
  DataSourceSyncJobStatus.syncingIndexing: 'SYNCING_INDEXING',
};

Map<String, dynamic> _$DataSourceSyncJobMetricTargetToJson(
    DataSourceSyncJobMetricTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('DataSourceSyncJobId', instance.dataSourceSyncJobId);
  return val;
}

DataSourceSyncJobMetrics _$DataSourceSyncJobMetricsFromJson(
    Map<String, dynamic> json) {
  return DataSourceSyncJobMetrics(
    documentsAdded: json['DocumentsAdded'] as String,
    documentsDeleted: json['DocumentsDeleted'] as String,
    documentsFailed: json['DocumentsFailed'] as String,
    documentsModified: json['DocumentsModified'] as String,
    documentsScanned: json['DocumentsScanned'] as String,
  );
}

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
    sqlConfiguration: json['SqlConfiguration'] == null
        ? null
        : SqlConfiguration.fromJson(
            json['SqlConfiguration'] as Map<String, dynamic>),
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
  writeNotNull('SqlConfiguration', instance.sqlConfiguration?.toJson());
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
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
    indexId: json['IndexId'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    schedule: json['Schedule'] as String,
    status: _$enumDecodeNullable(_$DataSourceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['Type']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

DescribeFaqResponse _$DescribeFaqResponseFromJson(Map<String, dynamic> json) {
  return DescribeFaqResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    errorMessage: json['ErrorMessage'] as String,
    fileFormat:
        _$enumDecodeNullable(_$FaqFileFormatEnumMap, json['FileFormat']),
    id: json['Id'] as String,
    indexId: json['IndexId'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    s3Path: json['S3Path'] == null
        ? null
        : S3Path.fromJson(json['S3Path'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$FaqStatusEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

const _$FaqFileFormatEnumMap = {
  FaqFileFormat.csv: 'CSV',
  FaqFileFormat.csvWithHeader: 'CSV_WITH_HEADER',
  FaqFileFormat.json: 'JSON',
};

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
    capacityUnits: json['CapacityUnits'] == null
        ? null
        : CapacityUnitsConfiguration.fromJson(
            json['CapacityUnits'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    documentMetadataConfigurations: (json['DocumentMetadataConfigurations']
            as List)
        ?.map((e) => e == null
            ? null
            : DocumentMetadataConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    edition: _$enumDecodeNullable(_$IndexEditionEnumMap, json['Edition']),
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
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
    userContextPolicy: _$enumDecodeNullable(
        _$UserContextPolicyEnumMap, json['UserContextPolicy']),
    userTokenConfigurations: (json['UserTokenConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : UserTokenConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$IndexEditionEnumMap = {
  IndexEdition.developerEdition: 'DEVELOPER_EDITION',
  IndexEdition.enterpriseEdition: 'ENTERPRISE_EDITION',
};

const _$IndexStatusEnumMap = {
  IndexStatus.creating: 'CREATING',
  IndexStatus.active: 'ACTIVE',
  IndexStatus.deleting: 'DELETING',
  IndexStatus.failed: 'FAILED',
  IndexStatus.updating: 'UPDATING',
  IndexStatus.systemUpdating: 'SYSTEM_UPDATING',
};

const _$UserContextPolicyEnumMap = {
  UserContextPolicy.attributeFilter: 'ATTRIBUTE_FILTER',
  UserContextPolicy.userToken: 'USER_TOKEN',
};

DescribeThesaurusResponse _$DescribeThesaurusResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThesaurusResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    errorMessage: json['ErrorMessage'] as String,
    fileSizeBytes: json['FileSizeBytes'] as int,
    id: json['Id'] as String,
    indexId: json['IndexId'] as String,
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
    sourceS3Path: json['SourceS3Path'] == null
        ? null
        : S3Path.fromJson(json['SourceS3Path'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ThesaurusStatusEnumMap, json['Status']),
    synonymRuleCount: json['SynonymRuleCount'] as int,
    termCount: json['TermCount'] as int,
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

const _$ThesaurusStatusEnumMap = {
  ThesaurusStatus.creating: 'CREATING',
  ThesaurusStatus.active: 'ACTIVE',
  ThesaurusStatus.deleting: 'DELETING',
  ThesaurusStatus.updating: 'UPDATING',
  ThesaurusStatus.activeButUpdateFailed: 'ACTIVE_BUT_UPDATE_FAILED',
  ThesaurusStatus.failed: 'FAILED',
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
    dateValue: const UnixDateTimeConverter().fromJson(json['DateValue']),
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

  writeNotNull(
      'DateValue', const UnixDateTimeConverter().toJson(instance.dateValue));
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
    documentAttributeValueType: _$enumDecodeNullable(
        _$DocumentAttributeValueTypeEnumMap,
        json['DocumentAttributeValueType']),
  );
}

FaqStatistics _$FaqStatisticsFromJson(Map<String, dynamic> json) {
  return FaqStatistics(
    indexedQuestionAnswersCount: json['IndexedQuestionAnswersCount'] as int,
  );
}

FaqSummary _$FaqSummaryFromJson(Map<String, dynamic> json) {
  return FaqSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    fileFormat:
        _$enumDecodeNullable(_$FaqFileFormatEnumMap, json['FileFormat']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$FaqStatusEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

GoogleDriveConfiguration _$GoogleDriveConfigurationFromJson(
    Map<String, dynamic> json) {
  return GoogleDriveConfiguration(
    secretArn: json['SecretArn'] as String,
    excludeMimeTypes:
        (json['ExcludeMimeTypes'] as List)?.map((e) => e as String)?.toList(),
    excludeSharedDrives: (json['ExcludeSharedDrives'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    excludeUserAccounts: (json['ExcludeUserAccounts'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    exclusionPatterns:
        (json['ExclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inclusionPatterns:
        (json['InclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GoogleDriveConfigurationToJson(
    GoogleDriveConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('ExcludeMimeTypes', instance.excludeMimeTypes);
  writeNotNull('ExcludeSharedDrives', instance.excludeSharedDrives);
  writeNotNull('ExcludeUserAccounts', instance.excludeUserAccounts);
  writeNotNull('ExclusionPatterns', instance.exclusionPatterns);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('InclusionPatterns', instance.inclusionPatterns);
  return val;
}

Highlight _$HighlightFromJson(Map<String, dynamic> json) {
  return Highlight(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    topAnswer: json['TopAnswer'] as bool,
    type: _$enumDecodeNullable(_$HighlightTypeEnumMap, json['Type']),
  );
}

const _$HighlightTypeEnumMap = {
  HighlightType.standard: 'STANDARD',
  HighlightType.thesaurusSynonym: 'THESAURUS_SYNONYM',
};

IndexConfigurationSummary _$IndexConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return IndexConfigurationSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    status: _$enumDecodeNullable(_$IndexStatusEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
    edition: _$enumDecodeNullable(_$IndexEditionEnumMap, json['Edition']),
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

JsonTokenTypeConfiguration _$JsonTokenTypeConfigurationFromJson(
    Map<String, dynamic> json) {
  return JsonTokenTypeConfiguration(
    groupAttributeField: json['GroupAttributeField'] as String,
    userNameAttributeField: json['UserNameAttributeField'] as String,
  );
}

Map<String, dynamic> _$JsonTokenTypeConfigurationToJson(
    JsonTokenTypeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupAttributeField', instance.groupAttributeField);
  writeNotNull('UserNameAttributeField', instance.userNameAttributeField);
  return val;
}

JwtTokenTypeConfiguration _$JwtTokenTypeConfigurationFromJson(
    Map<String, dynamic> json) {
  return JwtTokenTypeConfiguration(
    keyLocation:
        _$enumDecodeNullable(_$KeyLocationEnumMap, json['KeyLocation']),
    claimRegex: json['ClaimRegex'] as String,
    groupAttributeField: json['GroupAttributeField'] as String,
    issuer: json['Issuer'] as String,
    secretManagerArn: json['SecretManagerArn'] as String,
    url: json['URL'] as String,
    userNameAttributeField: json['UserNameAttributeField'] as String,
  );
}

Map<String, dynamic> _$JwtTokenTypeConfigurationToJson(
    JwtTokenTypeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyLocation', _$KeyLocationEnumMap[instance.keyLocation]);
  writeNotNull('ClaimRegex', instance.claimRegex);
  writeNotNull('GroupAttributeField', instance.groupAttributeField);
  writeNotNull('Issuer', instance.issuer);
  writeNotNull('SecretManagerArn', instance.secretManagerArn);
  writeNotNull('URL', instance.url);
  writeNotNull('UserNameAttributeField', instance.userNameAttributeField);
  return val;
}

const _$KeyLocationEnumMap = {
  KeyLocation.url: 'URL',
  KeyLocation.secretManager: 'SECRET_MANAGER',
};

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

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThesauriResponse _$ListThesauriResponseFromJson(Map<String, dynamic> json) {
  return ListThesauriResponse(
    nextToken: json['NextToken'] as String,
    thesaurusSummaryItems: (json['ThesaurusSummaryItems'] as List)
        ?.map((e) => e == null
            ? null
            : ThesaurusSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OneDriveConfiguration _$OneDriveConfigurationFromJson(
    Map<String, dynamic> json) {
  return OneDriveConfiguration(
    oneDriveUsers: json['OneDriveUsers'] == null
        ? null
        : OneDriveUsers.fromJson(json['OneDriveUsers'] as Map<String, dynamic>),
    secretArn: json['SecretArn'] as String,
    tenantDomain: json['TenantDomain'] as String,
    disableLocalGroups: json['DisableLocalGroups'] as bool,
    exclusionPatterns:
        (json['ExclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inclusionPatterns:
        (json['InclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OneDriveConfigurationToJson(
    OneDriveConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OneDriveUsers', instance.oneDriveUsers?.toJson());
  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('TenantDomain', instance.tenantDomain);
  writeNotNull('DisableLocalGroups', instance.disableLocalGroups);
  writeNotNull('ExclusionPatterns', instance.exclusionPatterns);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('InclusionPatterns', instance.inclusionPatterns);
  return val;
}

OneDriveUsers _$OneDriveUsersFromJson(Map<String, dynamic> json) {
  return OneDriveUsers(
    oneDriveUserList:
        (json['OneDriveUserList'] as List)?.map((e) => e as String)?.toList(),
    oneDriveUserS3Path: json['OneDriveUserS3Path'] == null
        ? null
        : S3Path.fromJson(json['OneDriveUserS3Path'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OneDriveUsersToJson(OneDriveUsers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OneDriveUserList', instance.oneDriveUserList);
  writeNotNull('OneDriveUserS3Path', instance.oneDriveUserS3Path?.toJson());
  return val;
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
    feedbackToken: json['FeedbackToken'] as String,
    id: json['Id'] as String,
    scoreAttributes: json['ScoreAttributes'] == null
        ? null
        : ScoreAttributes.fromJson(
            json['ScoreAttributes'] as Map<String, dynamic>),
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
    inclusionPatterns:
        (json['InclusionPatterns'] as List)?.map((e) => e as String)?.toList(),
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
  writeNotNull('InclusionPatterns', instance.inclusionPatterns);
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

SalesforceChatterFeedConfiguration _$SalesforceChatterFeedConfigurationFromJson(
    Map<String, dynamic> json) {
  return SalesforceChatterFeedConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    includeFilterTypes: (json['IncludeFilterTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(
            _$SalesforceChatterFeedIncludeFilterTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$SalesforceChatterFeedConfigurationToJson(
    SalesforceChatterFeedConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'IncludeFilterTypes',
      instance.includeFilterTypes
          ?.map((e) => _$SalesforceChatterFeedIncludeFilterTypeEnumMap[e])
          ?.toList());
  return val;
}

const _$SalesforceChatterFeedIncludeFilterTypeEnumMap = {
  SalesforceChatterFeedIncludeFilterType.activeUser: 'ACTIVE_USER',
  SalesforceChatterFeedIncludeFilterType.standardUser: 'STANDARD_USER',
};

SalesforceConfiguration _$SalesforceConfigurationFromJson(
    Map<String, dynamic> json) {
  return SalesforceConfiguration(
    secretArn: json['SecretArn'] as String,
    serverUrl: json['ServerUrl'] as String,
    chatterFeedConfiguration: json['ChatterFeedConfiguration'] == null
        ? null
        : SalesforceChatterFeedConfiguration.fromJson(
            json['ChatterFeedConfiguration'] as Map<String, dynamic>),
    crawlAttachments: json['CrawlAttachments'] as bool,
    excludeAttachmentFilePatterns:
        (json['ExcludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    includeAttachmentFilePatterns:
        (json['IncludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    knowledgeArticleConfiguration: json['KnowledgeArticleConfiguration'] == null
        ? null
        : SalesforceKnowledgeArticleConfiguration.fromJson(
            json['KnowledgeArticleConfiguration'] as Map<String, dynamic>),
    standardObjectAttachmentConfiguration:
        json['StandardObjectAttachmentConfiguration'] == null
            ? null
            : SalesforceStandardObjectAttachmentConfiguration.fromJson(
                json['StandardObjectAttachmentConfiguration']
                    as Map<String, dynamic>),
    standardObjectConfigurations: (json['StandardObjectConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SalesforceStandardObjectConfiguration.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SalesforceConfigurationToJson(
    SalesforceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('ServerUrl', instance.serverUrl);
  writeNotNull(
      'ChatterFeedConfiguration', instance.chatterFeedConfiguration?.toJson());
  writeNotNull('CrawlAttachments', instance.crawlAttachments);
  writeNotNull(
      'ExcludeAttachmentFilePatterns', instance.excludeAttachmentFilePatterns);
  writeNotNull(
      'IncludeAttachmentFilePatterns', instance.includeAttachmentFilePatterns);
  writeNotNull('KnowledgeArticleConfiguration',
      instance.knowledgeArticleConfiguration?.toJson());
  writeNotNull('StandardObjectAttachmentConfiguration',
      instance.standardObjectAttachmentConfiguration?.toJson());
  writeNotNull('StandardObjectConfigurations',
      instance.standardObjectConfigurations?.map((e) => e?.toJson())?.toList());
  return val;
}

SalesforceCustomKnowledgeArticleTypeConfiguration
    _$SalesforceCustomKnowledgeArticleTypeConfigurationFromJson(
        Map<String, dynamic> json) {
  return SalesforceCustomKnowledgeArticleTypeConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    name: json['Name'] as String,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SalesforceCustomKnowledgeArticleTypeConfigurationToJson(
    SalesforceCustomKnowledgeArticleTypeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('Name', instance.name);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

SalesforceKnowledgeArticleConfiguration
    _$SalesforceKnowledgeArticleConfigurationFromJson(
        Map<String, dynamic> json) {
  return SalesforceKnowledgeArticleConfiguration(
    includedStates: (json['IncludedStates'] as List)
        ?.map((e) =>
            _$enumDecodeNullable(_$SalesforceKnowledgeArticleStateEnumMap, e))
        ?.toList(),
    customKnowledgeArticleTypeConfigurations:
        (json['CustomKnowledgeArticleTypeConfigurations'] as List)
            ?.map((e) => e == null
                ? null
                : SalesforceCustomKnowledgeArticleTypeConfiguration.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    standardKnowledgeArticleTypeConfiguration:
        json['StandardKnowledgeArticleTypeConfiguration'] == null
            ? null
            : SalesforceStandardKnowledgeArticleTypeConfiguration.fromJson(
                json['StandardKnowledgeArticleTypeConfiguration']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SalesforceKnowledgeArticleConfigurationToJson(
    SalesforceKnowledgeArticleConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'IncludedStates',
      instance.includedStates
          ?.map((e) => _$SalesforceKnowledgeArticleStateEnumMap[e])
          ?.toList());
  writeNotNull(
      'CustomKnowledgeArticleTypeConfigurations',
      instance.customKnowledgeArticleTypeConfigurations
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('StandardKnowledgeArticleTypeConfiguration',
      instance.standardKnowledgeArticleTypeConfiguration?.toJson());
  return val;
}

const _$SalesforceKnowledgeArticleStateEnumMap = {
  SalesforceKnowledgeArticleState.draft: 'DRAFT',
  SalesforceKnowledgeArticleState.published: 'PUBLISHED',
  SalesforceKnowledgeArticleState.archived: 'ARCHIVED',
};

SalesforceStandardKnowledgeArticleTypeConfiguration
    _$SalesforceStandardKnowledgeArticleTypeConfigurationFromJson(
        Map<String, dynamic> json) {
  return SalesforceStandardKnowledgeArticleTypeConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic>
    _$SalesforceStandardKnowledgeArticleTypeConfigurationToJson(
        SalesforceStandardKnowledgeArticleTypeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

SalesforceStandardObjectAttachmentConfiguration
    _$SalesforceStandardObjectAttachmentConfigurationFromJson(
        Map<String, dynamic> json) {
  return SalesforceStandardObjectAttachmentConfiguration(
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SalesforceStandardObjectAttachmentConfigurationToJson(
    SalesforceStandardObjectAttachmentConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

SalesforceStandardObjectConfiguration
    _$SalesforceStandardObjectConfigurationFromJson(Map<String, dynamic> json) {
  return SalesforceStandardObjectConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    name: _$enumDecodeNullable(
        _$SalesforceStandardObjectNameEnumMap, json['Name']),
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SalesforceStandardObjectConfigurationToJson(
    SalesforceStandardObjectConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('Name', _$SalesforceStandardObjectNameEnumMap[instance.name]);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$SalesforceStandardObjectNameEnumMap = {
  SalesforceStandardObjectName.account: 'ACCOUNT',
  SalesforceStandardObjectName.campaign: 'CAMPAIGN',
  SalesforceStandardObjectName.$case: 'CASE',
  SalesforceStandardObjectName.contact: 'CONTACT',
  SalesforceStandardObjectName.contract: 'CONTRACT',
  SalesforceStandardObjectName.document: 'DOCUMENT',
  SalesforceStandardObjectName.group: 'GROUP',
  SalesforceStandardObjectName.idea: 'IDEA',
  SalesforceStandardObjectName.lead: 'LEAD',
  SalesforceStandardObjectName.opportunity: 'OPPORTUNITY',
  SalesforceStandardObjectName.partner: 'PARTNER',
  SalesforceStandardObjectName.pricebook: 'PRICEBOOK',
  SalesforceStandardObjectName.product: 'PRODUCT',
  SalesforceStandardObjectName.profile: 'PROFILE',
  SalesforceStandardObjectName.solution: 'SOLUTION',
  SalesforceStandardObjectName.task: 'TASK',
  SalesforceStandardObjectName.user: 'USER',
};

ScoreAttributes _$ScoreAttributesFromJson(Map<String, dynamic> json) {
  return ScoreAttributes(
    scoreConfidence:
        _$enumDecodeNullable(_$ScoreConfidenceEnumMap, json['ScoreConfidence']),
  );
}

const _$ScoreConfidenceEnumMap = {
  ScoreConfidence.veryHigh: 'VERY_HIGH',
  ScoreConfidence.high: 'HIGH',
  ScoreConfidence.medium: 'MEDIUM',
  ScoreConfidence.low: 'LOW',
};

Search _$SearchFromJson(Map<String, dynamic> json) {
  return Search(
    displayable: json['Displayable'] as bool,
    facetable: json['Facetable'] as bool,
    searchable: json['Searchable'] as bool,
    sortable: json['Sortable'] as bool,
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
  writeNotNull('Sortable', instance.sortable);
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

ServiceNowConfiguration _$ServiceNowConfigurationFromJson(
    Map<String, dynamic> json) {
  return ServiceNowConfiguration(
    hostUrl: json['HostUrl'] as String,
    secretArn: json['SecretArn'] as String,
    serviceNowBuildVersion: _$enumDecodeNullable(
        _$ServiceNowBuildVersionTypeEnumMap, json['ServiceNowBuildVersion']),
    knowledgeArticleConfiguration: json['KnowledgeArticleConfiguration'] == null
        ? null
        : ServiceNowKnowledgeArticleConfiguration.fromJson(
            json['KnowledgeArticleConfiguration'] as Map<String, dynamic>),
    serviceCatalogConfiguration: json['ServiceCatalogConfiguration'] == null
        ? null
        : ServiceNowServiceCatalogConfiguration.fromJson(
            json['ServiceCatalogConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceNowConfigurationToJson(
    ServiceNowConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HostUrl', instance.hostUrl);
  writeNotNull('SecretArn', instance.secretArn);
  writeNotNull('ServiceNowBuildVersion',
      _$ServiceNowBuildVersionTypeEnumMap[instance.serviceNowBuildVersion]);
  writeNotNull('KnowledgeArticleConfiguration',
      instance.knowledgeArticleConfiguration?.toJson());
  writeNotNull('ServiceCatalogConfiguration',
      instance.serviceCatalogConfiguration?.toJson());
  return val;
}

const _$ServiceNowBuildVersionTypeEnumMap = {
  ServiceNowBuildVersionType.london: 'LONDON',
  ServiceNowBuildVersionType.others: 'OTHERS',
};

ServiceNowKnowledgeArticleConfiguration
    _$ServiceNowKnowledgeArticleConfigurationFromJson(
        Map<String, dynamic> json) {
  return ServiceNowKnowledgeArticleConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    crawlAttachments: json['CrawlAttachments'] as bool,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    excludeAttachmentFilePatterns:
        (json['ExcludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    includeAttachmentFilePatterns:
        (json['IncludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
  );
}

Map<String, dynamic> _$ServiceNowKnowledgeArticleConfigurationToJson(
    ServiceNowKnowledgeArticleConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('CrawlAttachments', instance.crawlAttachments);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull(
      'ExcludeAttachmentFilePatterns', instance.excludeAttachmentFilePatterns);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'IncludeAttachmentFilePatterns', instance.includeAttachmentFilePatterns);
  return val;
}

ServiceNowServiceCatalogConfiguration
    _$ServiceNowServiceCatalogConfigurationFromJson(Map<String, dynamic> json) {
  return ServiceNowServiceCatalogConfiguration(
    documentDataFieldName: json['DocumentDataFieldName'] as String,
    crawlAttachments: json['CrawlAttachments'] as bool,
    documentTitleFieldName: json['DocumentTitleFieldName'] as String,
    excludeAttachmentFilePatterns:
        (json['ExcludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    fieldMappings: (json['FieldMappings'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    includeAttachmentFilePatterns:
        (json['IncludeAttachmentFilePatterns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
  );
}

Map<String, dynamic> _$ServiceNowServiceCatalogConfigurationToJson(
    ServiceNowServiceCatalogConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentDataFieldName', instance.documentDataFieldName);
  writeNotNull('CrawlAttachments', instance.crawlAttachments);
  writeNotNull('DocumentTitleFieldName', instance.documentTitleFieldName);
  writeNotNull(
      'ExcludeAttachmentFilePatterns', instance.excludeAttachmentFilePatterns);
  writeNotNull('FieldMappings',
      instance.fieldMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'IncludeAttachmentFilePatterns', instance.includeAttachmentFilePatterns);
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
    disableLocalGroups: json['DisableLocalGroups'] as bool,
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
  writeNotNull('DisableLocalGroups', instance.disableLocalGroups);
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

Map<String, dynamic> _$SortingConfigurationToJson(
    SortingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentAttributeKey', instance.documentAttributeKey);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.desc: 'DESC',
  SortOrder.asc: 'ASC',
};

SqlConfiguration _$SqlConfigurationFromJson(Map<String, dynamic> json) {
  return SqlConfiguration(
    queryIdentifiersEnclosingOption: _$enumDecodeNullable(
        _$QueryIdentifiersEnclosingOptionEnumMap,
        json['QueryIdentifiersEnclosingOption']),
  );
}

Map<String, dynamic> _$SqlConfigurationToJson(SqlConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'QueryIdentifiersEnclosingOption',
      _$QueryIdentifiersEnclosingOptionEnumMap[
          instance.queryIdentifiersEnclosingOption]);
  return val;
}

const _$QueryIdentifiersEnclosingOptionEnumMap = {
  QueryIdentifiersEnclosingOption.doubleQuotes: 'DOUBLE_QUOTES',
  QueryIdentifiersEnclosingOption.none: 'NONE',
};

StartDataSourceSyncJobResponse _$StartDataSourceSyncJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartDataSourceSyncJobResponse(
    executionId: json['ExecutionId'] as String,
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TextDocumentStatistics _$TextDocumentStatisticsFromJson(
    Map<String, dynamic> json) {
  return TextDocumentStatistics(
    indexedTextBytes: json['IndexedTextBytes'] as int,
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

ThesaurusSummary _$ThesaurusSummaryFromJson(Map<String, dynamic> json) {
  return ThesaurusSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$ThesaurusStatusEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EndTime', const UnixDateTimeConverter().toJson(instance.endTime));
  writeNotNull(
      'StartTime', const UnixDateTimeConverter().toJson(instance.startTime));
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UserContextToJson(UserContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.token);
  return val;
}

UserTokenConfiguration _$UserTokenConfigurationFromJson(
    Map<String, dynamic> json) {
  return UserTokenConfiguration(
    jsonTokenTypeConfiguration: json['JsonTokenTypeConfiguration'] == null
        ? null
        : JsonTokenTypeConfiguration.fromJson(
            json['JsonTokenTypeConfiguration'] as Map<String, dynamic>),
    jwtTokenTypeConfiguration: json['JwtTokenTypeConfiguration'] == null
        ? null
        : JwtTokenTypeConfiguration.fromJson(
            json['JwtTokenTypeConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserTokenConfigurationToJson(
    UserTokenConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JsonTokenTypeConfiguration',
      instance.jsonTokenTypeConfiguration?.toJson());
  writeNotNull('JwtTokenTypeConfiguration',
      instance.jwtTokenTypeConfiguration?.toJson());
  return val;
}
