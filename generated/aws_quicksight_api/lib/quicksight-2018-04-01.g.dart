// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quicksight-2018-04-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveIAMPolicyAssignment _$ActiveIAMPolicyAssignmentFromJson(
    Map<String, dynamic> json) {
  return ActiveIAMPolicyAssignment(
    assignmentName: json['AssignmentName'] as String,
    policyArn: json['PolicyArn'] as String,
  );
}

Map<String, dynamic> _$AdHocFilteringOptionToJson(
    AdHocFilteringOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityStatus',
      _$DashboardBehaviorEnumMap[instance.availabilityStatus]);
  return val;
}

const _$DashboardBehaviorEnumMap = {
  DashboardBehavior.enabled: 'ENABLED',
  DashboardBehavior.disabled: 'DISABLED',
};

AmazonElasticsearchParameters _$AmazonElasticsearchParametersFromJson(
    Map<String, dynamic> json) {
  return AmazonElasticsearchParameters(
    domain: json['Domain'] as String,
  );
}

Map<String, dynamic> _$AmazonElasticsearchParametersToJson(
    AmazonElasticsearchParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Domain', instance.domain);
  return val;
}

AthenaParameters _$AthenaParametersFromJson(Map<String, dynamic> json) {
  return AthenaParameters(
    workGroup: json['WorkGroup'] as String,
  );
}

Map<String, dynamic> _$AthenaParametersToJson(AthenaParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkGroup', instance.workGroup);
  return val;
}

AuroraParameters _$AuroraParametersFromJson(Map<String, dynamic> json) {
  return AuroraParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$AuroraParametersToJson(AuroraParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

AuroraPostgreSqlParameters _$AuroraPostgreSqlParametersFromJson(
    Map<String, dynamic> json) {
  return AuroraPostgreSqlParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$AuroraPostgreSqlParametersToJson(
    AuroraPostgreSqlParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

AwsIotAnalyticsParameters _$AwsIotAnalyticsParametersFromJson(
    Map<String, dynamic> json) {
  return AwsIotAnalyticsParameters(
    dataSetName: json['DataSetName'] as String,
  );
}

Map<String, dynamic> _$AwsIotAnalyticsParametersToJson(
    AwsIotAnalyticsParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSetName', instance.dataSetName);
  return val;
}

CalculatedColumn _$CalculatedColumnFromJson(Map<String, dynamic> json) {
  return CalculatedColumn(
    columnId: json['ColumnId'] as String,
    columnName: json['ColumnName'] as String,
    expression: json['Expression'] as String,
  );
}

Map<String, dynamic> _$CalculatedColumnToJson(CalculatedColumn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnId', instance.columnId);
  writeNotNull('ColumnName', instance.columnName);
  writeNotNull('Expression', instance.expression);
  return val;
}

Map<String, dynamic> _$CancelIngestionRequestToJson(
        CancelIngestionRequest instance) =>
    <String, dynamic>{};

CancelIngestionResponse _$CancelIngestionResponseFromJson(
    Map<String, dynamic> json) {
  return CancelIngestionResponse(
    arn: json['Arn'] as String,
    ingestionId: json['IngestionId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

CastColumnTypeOperation _$CastColumnTypeOperationFromJson(
    Map<String, dynamic> json) {
  return CastColumnTypeOperation(
    columnName: json['ColumnName'] as String,
    newColumnType:
        _$enumDecodeNullable(_$ColumnDataTypeEnumMap, json['NewColumnType']),
    format: json['Format'] as String,
  );
}

Map<String, dynamic> _$CastColumnTypeOperationToJson(
    CastColumnTypeOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnName', instance.columnName);
  writeNotNull(
      'NewColumnType', _$ColumnDataTypeEnumMap[instance.newColumnType]);
  writeNotNull('Format', instance.format);
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

const _$ColumnDataTypeEnumMap = {
  ColumnDataType.string: 'STRING',
  ColumnDataType.integer: 'INTEGER',
  ColumnDataType.decimal: 'DECIMAL',
  ColumnDataType.datetime: 'DATETIME',
};

ColumnGroup _$ColumnGroupFromJson(Map<String, dynamic> json) {
  return ColumnGroup(
    geoSpatialColumnGroup: json['GeoSpatialColumnGroup'] == null
        ? null
        : GeoSpatialColumnGroup.fromJson(
            json['GeoSpatialColumnGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ColumnGroupToJson(ColumnGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'GeoSpatialColumnGroup', instance.geoSpatialColumnGroup?.toJson());
  return val;
}

ColumnGroupColumnSchema _$ColumnGroupColumnSchemaFromJson(
    Map<String, dynamic> json) {
  return ColumnGroupColumnSchema(
    name: json['Name'] as String,
  );
}

ColumnGroupSchema _$ColumnGroupSchemaFromJson(Map<String, dynamic> json) {
  return ColumnGroupSchema(
    columnGroupColumnSchemaList: (json['ColumnGroupColumnSchemaList'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnGroupColumnSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

ColumnSchema _$ColumnSchemaFromJson(Map<String, dynamic> json) {
  return ColumnSchema(
    dataType: json['DataType'] as String,
    geographicRole: json['GeographicRole'] as String,
    name: json['Name'] as String,
  );
}

ColumnTag _$ColumnTagFromJson(Map<String, dynamic> json) {
  return ColumnTag(
    columnGeographicRole: _$enumDecodeNullable(
        _$GeoSpatialDataRoleEnumMap, json['ColumnGeographicRole']),
  );
}

Map<String, dynamic> _$ColumnTagToJson(ColumnTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnGeographicRole',
      _$GeoSpatialDataRoleEnumMap[instance.columnGeographicRole]);
  return val;
}

const _$GeoSpatialDataRoleEnumMap = {
  GeoSpatialDataRole.country: 'COUNTRY',
  GeoSpatialDataRole.state: 'STATE',
  GeoSpatialDataRole.county: 'COUNTY',
  GeoSpatialDataRole.city: 'CITY',
  GeoSpatialDataRole.postcode: 'POSTCODE',
  GeoSpatialDataRole.longitude: 'LONGITUDE',
  GeoSpatialDataRole.latitude: 'LATITUDE',
};

CreateColumnsOperation _$CreateColumnsOperationFromJson(
    Map<String, dynamic> json) {
  return CreateColumnsOperation(
    columns: (json['Columns'] as List)
        ?.map((e) => e == null
            ? null
            : CalculatedColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateColumnsOperationToJson(
    CreateColumnsOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Columns', instance.columns?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$CreateDashboardRequestToJson(
    CreateDashboardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SourceEntity', instance.sourceEntity?.toJson());
  writeNotNull(
      'DashboardPublishOptions', instance.dashboardPublishOptions?.toJson());
  writeNotNull('Parameters', instance.parameters?.toJson());
  writeNotNull(
      'Permissions', instance.permissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('VersionDescription', instance.versionDescription);
  return val;
}

CreateDashboardResponse _$CreateDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDashboardResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    dashboardId: json['DashboardId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    versionArn: json['VersionArn'] as String,
  );
}

const _$ResourceStatusEnumMap = {
  ResourceStatus.creationInProgress: 'CREATION_IN_PROGRESS',
  ResourceStatus.creationSuccessful: 'CREATION_SUCCESSFUL',
  ResourceStatus.creationFailed: 'CREATION_FAILED',
  ResourceStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  ResourceStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  ResourceStatus.updateFailed: 'UPDATE_FAILED',
};

Map<String, dynamic> _$CreateDataSetRequestToJson(
    CreateDataSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSetId', instance.dataSetId);
  writeNotNull('ImportMode', _$DataSetImportModeEnumMap[instance.importMode]);
  writeNotNull('Name', instance.name);
  writeNotNull('PhysicalTableMap',
      instance.physicalTableMap?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull(
      'ColumnGroups', instance.columnGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('LogicalTableMap',
      instance.logicalTableMap?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull(
      'Permissions', instance.permissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RowLevelPermissionDataSet',
      instance.rowLevelPermissionDataSet?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$DataSetImportModeEnumMap = {
  DataSetImportMode.spice: 'SPICE',
  DataSetImportMode.directQuery: 'DIRECT_QUERY',
};

CreateDataSetResponse _$CreateDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDataSetResponse(
    arn: json['Arn'] as String,
    dataSetId: json['DataSetId'] as String,
    ingestionArn: json['IngestionArn'] as String,
    ingestionId: json['IngestionId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$CreateDataSourceRequestToJson(
    CreateDataSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$DataSourceTypeEnumMap[instance.type]);
  writeNotNull('Credentials', instance.credentials?.toJson());
  writeNotNull('DataSourceParameters', instance.dataSourceParameters?.toJson());
  writeNotNull(
      'Permissions', instance.permissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('SslProperties', instance.sslProperties?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'VpcConnectionProperties', instance.vpcConnectionProperties?.toJson());
  return val;
}

const _$DataSourceTypeEnumMap = {
  DataSourceType.adobeAnalytics: 'ADOBE_ANALYTICS',
  DataSourceType.amazonElasticsearch: 'AMAZON_ELASTICSEARCH',
  DataSourceType.athena: 'ATHENA',
  DataSourceType.aurora: 'AURORA',
  DataSourceType.auroraPostgresql: 'AURORA_POSTGRESQL',
  DataSourceType.awsIotAnalytics: 'AWS_IOT_ANALYTICS',
  DataSourceType.github: 'GITHUB',
  DataSourceType.jira: 'JIRA',
  DataSourceType.mariadb: 'MARIADB',
  DataSourceType.mysql: 'MYSQL',
  DataSourceType.postgresql: 'POSTGRESQL',
  DataSourceType.presto: 'PRESTO',
  DataSourceType.redshift: 'REDSHIFT',
  DataSourceType.s3: 'S3',
  DataSourceType.salesforce: 'SALESFORCE',
  DataSourceType.servicenow: 'SERVICENOW',
  DataSourceType.snowflake: 'SNOWFLAKE',
  DataSourceType.spark: 'SPARK',
  DataSourceType.sqlserver: 'SQLSERVER',
  DataSourceType.teradata: 'TERADATA',
  DataSourceType.twitter: 'TWITTER',
};

CreateDataSourceResponse _$CreateDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$CreateGroupMembershipRequestToJson(
        CreateGroupMembershipRequest instance) =>
    <String, dynamic>{};

CreateGroupMembershipResponse _$CreateGroupMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGroupMembershipResponse(
    groupMember: json['GroupMember'] == null
        ? null
        : GroupMember.fromJson(json['GroupMember'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$CreateGroupRequestToJson(CreateGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupName', instance.groupName);
  writeNotNull('Description', instance.description);
  return val;
}

CreateGroupResponse _$CreateGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateGroupResponse(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$CreateIAMPolicyAssignmentRequestToJson(
    CreateIAMPolicyAssignmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentName', instance.assignmentName);
  writeNotNull(
      'AssignmentStatus', _$AssignmentStatusEnumMap[instance.assignmentStatus]);
  writeNotNull('Identities', instance.identities);
  writeNotNull('PolicyArn', instance.policyArn);
  return val;
}

const _$AssignmentStatusEnumMap = {
  AssignmentStatus.enabled: 'ENABLED',
  AssignmentStatus.draft: 'DRAFT',
  AssignmentStatus.disabled: 'DISABLED',
};

CreateIAMPolicyAssignmentResponse _$CreateIAMPolicyAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIAMPolicyAssignmentResponse(
    assignmentId: json['AssignmentId'] as String,
    assignmentName: json['AssignmentName'] as String,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
    identities: (json['Identities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    policyArn: json['PolicyArn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$CreateIngestionRequestToJson(
        CreateIngestionRequest instance) =>
    <String, dynamic>{};

CreateIngestionResponse _$CreateIngestionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIngestionResponse(
    arn: json['Arn'] as String,
    ingestionId: json['IngestionId'] as String,
    ingestionStatus:
        _$enumDecodeNullable(_$IngestionStatusEnumMap, json['IngestionStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

const _$IngestionStatusEnumMap = {
  IngestionStatus.initialized: 'INITIALIZED',
  IngestionStatus.queued: 'QUEUED',
  IngestionStatus.running: 'RUNNING',
  IngestionStatus.failed: 'FAILED',
  IngestionStatus.completed: 'COMPLETED',
  IngestionStatus.cancelled: 'CANCELLED',
};

Map<String, dynamic> _$CreateTemplateAliasRequestToJson(
    CreateTemplateAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TemplateVersionNumber', instance.templateVersionNumber);
  return val;
}

CreateTemplateAliasResponse _$CreateTemplateAliasResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTemplateAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateAlias: json['TemplateAlias'] == null
        ? null
        : TemplateAlias.fromJson(json['TemplateAlias'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTemplateRequestToJson(
    CreateTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceEntity', instance.sourceEntity?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull(
      'Permissions', instance.permissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('VersionDescription', instance.versionDescription);
  return val;
}

CreateTemplateResponse _$CreateTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTemplateResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateId: json['TemplateId'] as String,
    versionArn: json['VersionArn'] as String,
  );
}

Map<String, dynamic> _$CredentialPairToJson(CredentialPair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Password', instance.password);
  writeNotNull('Username', instance.username);
  return val;
}

CustomSql _$CustomSqlFromJson(Map<String, dynamic> json) {
  return CustomSql(
    dataSourceArn: json['DataSourceArn'] as String,
    name: json['Name'] as String,
    sqlQuery: json['SqlQuery'] as String,
    columns: (json['Columns'] as List)
        ?.map((e) =>
            e == null ? null : InputColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomSqlToJson(CustomSql instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceArn', instance.dataSourceArn);
  writeNotNull('Name', instance.name);
  writeNotNull('SqlQuery', instance.sqlQuery);
  writeNotNull('Columns', instance.columns?.map((e) => e?.toJson())?.toList());
  return val;
}

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return Dashboard(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dashboardId: json['DashboardId'] as String,
    lastPublishedTime: unixTimestampFromJson(json['LastPublishedTime']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    version: json['Version'] == null
        ? null
        : DashboardVersion.fromJson(json['Version'] as Map<String, dynamic>),
  );
}

DashboardError _$DashboardErrorFromJson(Map<String, dynamic> json) {
  return DashboardError(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$DashboardErrorTypeEnumMap, json['Type']),
  );
}

const _$DashboardErrorTypeEnumMap = {
  DashboardErrorType.dataSetNotFound: 'DATA_SET_NOT_FOUND',
  DashboardErrorType.internalFailure: 'INTERNAL_FAILURE',
  DashboardErrorType.parameterValueIncompatible: 'PARAMETER_VALUE_INCOMPATIBLE',
  DashboardErrorType.parameterTypeInvalid: 'PARAMETER_TYPE_INVALID',
  DashboardErrorType.parameterNotFound: 'PARAMETER_NOT_FOUND',
  DashboardErrorType.columnTypeMismatch: 'COLUMN_TYPE_MISMATCH',
  DashboardErrorType.columnGeographicRoleMismatch:
      'COLUMN_GEOGRAPHIC_ROLE_MISMATCH',
  DashboardErrorType.columnReplacementMissing: 'COLUMN_REPLACEMENT_MISSING',
};

Map<String, dynamic> _$DashboardPublishOptionsToJson(
    DashboardPublishOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdHocFilteringOption', instance.adHocFilteringOption?.toJson());
  writeNotNull('ExportToCSVOption', instance.exportToCSVOption?.toJson());
  writeNotNull('SheetControlsOption', instance.sheetControlsOption?.toJson());
  return val;
}

Map<String, dynamic> _$DashboardSearchFilterToJson(
    DashboardSearchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Operator', _$FilterOperatorEnumMap[instance.operator]);
  writeNotNull('Name', _$DashboardFilterAttributeEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$FilterOperatorEnumMap = {
  FilterOperator.stringEquals: 'StringEquals',
};

const _$DashboardFilterAttributeEnumMap = {
  DashboardFilterAttribute.quicksightUser: 'QUICKSIGHT_USER',
};

Map<String, dynamic> _$DashboardSourceEntityToJson(
    DashboardSourceEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceTemplate', instance.sourceTemplate?.toJson());
  return val;
}

Map<String, dynamic> _$DashboardSourceTemplateToJson(
    DashboardSourceTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('DataSetReferences',
      instance.dataSetReferences?.map((e) => e?.toJson())?.toList());
  return val;
}

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) {
  return DashboardSummary(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dashboardId: json['DashboardId'] as String,
    lastPublishedTime: unixTimestampFromJson(json['LastPublishedTime']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    publishedVersionNumber: json['PublishedVersionNumber'] as int,
  );
}

DashboardVersion _$DashboardVersionFromJson(Map<String, dynamic> json) {
  return DashboardVersion(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

DashboardVersionSummary _$DashboardVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return DashboardVersionSummary(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

DataSet _$DataSetFromJson(Map<String, dynamic> json) {
  return DataSet(
    arn: json['Arn'] as String,
    columnGroups: (json['ColumnGroups'] as List)
        ?.map((e) =>
            e == null ? null : ColumnGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    consumedSpiceCapacityInBytes: json['ConsumedSpiceCapacityInBytes'] as int,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dataSetId: json['DataSetId'] as String,
    importMode:
        _$enumDecodeNullable(_$DataSetImportModeEnumMap, json['ImportMode']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    logicalTableMap: (json['LogicalTableMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : LogicalTable.fromJson(e as Map<String, dynamic>)),
    ),
    name: json['Name'] as String,
    outputColumns: (json['OutputColumns'] as List)
        ?.map((e) =>
            e == null ? null : OutputColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    physicalTableMap: (json['PhysicalTableMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : PhysicalTable.fromJson(e as Map<String, dynamic>)),
    ),
    rowLevelPermissionDataSet: json['RowLevelPermissionDataSet'] == null
        ? null
        : RowLevelPermissionDataSet.fromJson(
            json['RowLevelPermissionDataSet'] as Map<String, dynamic>),
  );
}

DataSetConfiguration _$DataSetConfigurationFromJson(Map<String, dynamic> json) {
  return DataSetConfiguration(
    columnGroupSchemaList: (json['ColumnGroupSchemaList'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnGroupSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataSetSchema: json['DataSetSchema'] == null
        ? null
        : DataSetSchema.fromJson(json['DataSetSchema'] as Map<String, dynamic>),
    placeholder: json['Placeholder'] as String,
  );
}

Map<String, dynamic> _$DataSetReferenceToJson(DataSetReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSetArn', instance.dataSetArn);
  writeNotNull('DataSetPlaceholder', instance.dataSetPlaceholder);
  return val;
}

DataSetSchema _$DataSetSchemaFromJson(Map<String, dynamic> json) {
  return DataSetSchema(
    columnSchemaList: (json['ColumnSchemaList'] as List)
        ?.map((e) =>
            e == null ? null : ColumnSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DataSetSummary _$DataSetSummaryFromJson(Map<String, dynamic> json) {
  return DataSetSummary(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dataSetId: json['DataSetId'] as String,
    importMode:
        _$enumDecodeNullable(_$DataSetImportModeEnumMap, json['ImportMode']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    rowLevelPermissionDataSet: json['RowLevelPermissionDataSet'] == null
        ? null
        : RowLevelPermissionDataSet.fromJson(
            json['RowLevelPermissionDataSet'] as Map<String, dynamic>),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dataSourceId: json['DataSourceId'] as String,
    dataSourceParameters: json['DataSourceParameters'] == null
        ? null
        : DataSourceParameters.fromJson(
            json['DataSourceParameters'] as Map<String, dynamic>),
    errorInfo: json['ErrorInfo'] == null
        ? null
        : DataSourceErrorInfo.fromJson(
            json['ErrorInfo'] as Map<String, dynamic>),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    sslProperties: json['SslProperties'] == null
        ? null
        : SslProperties.fromJson(json['SslProperties'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['Type']),
    vpcConnectionProperties: json['VpcConnectionProperties'] == null
        ? null
        : VpcConnectionProperties.fromJson(
            json['VpcConnectionProperties'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataSourceCredentialsToJson(
    DataSourceCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CredentialPair', instance.credentialPair?.toJson());
  return val;
}

DataSourceErrorInfo _$DataSourceErrorInfoFromJson(Map<String, dynamic> json) {
  return DataSourceErrorInfo(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$DataSourceErrorInfoTypeEnumMap, json['Type']),
  );
}

const _$DataSourceErrorInfoTypeEnumMap = {
  DataSourceErrorInfoType.timeout: 'TIMEOUT',
  DataSourceErrorInfoType.engineVersionNotSupported:
      'ENGINE_VERSION_NOT_SUPPORTED',
  DataSourceErrorInfoType.unknownHost: 'UNKNOWN_HOST',
  DataSourceErrorInfoType.genericSqlFailure: 'GENERIC_SQL_FAILURE',
  DataSourceErrorInfoType.conflict: 'CONFLICT',
  DataSourceErrorInfoType.unknown: 'UNKNOWN',
};

DataSourceParameters _$DataSourceParametersFromJson(Map<String, dynamic> json) {
  return DataSourceParameters(
    amazonElasticsearchParameters: json['AmazonElasticsearchParameters'] == null
        ? null
        : AmazonElasticsearchParameters.fromJson(
            json['AmazonElasticsearchParameters'] as Map<String, dynamic>),
    athenaParameters: json['AthenaParameters'] == null
        ? null
        : AthenaParameters.fromJson(
            json['AthenaParameters'] as Map<String, dynamic>),
    auroraParameters: json['AuroraParameters'] == null
        ? null
        : AuroraParameters.fromJson(
            json['AuroraParameters'] as Map<String, dynamic>),
    auroraPostgreSqlParameters: json['AuroraPostgreSqlParameters'] == null
        ? null
        : AuroraPostgreSqlParameters.fromJson(
            json['AuroraPostgreSqlParameters'] as Map<String, dynamic>),
    awsIotAnalyticsParameters: json['AwsIotAnalyticsParameters'] == null
        ? null
        : AwsIotAnalyticsParameters.fromJson(
            json['AwsIotAnalyticsParameters'] as Map<String, dynamic>),
    jiraParameters: json['JiraParameters'] == null
        ? null
        : JiraParameters.fromJson(
            json['JiraParameters'] as Map<String, dynamic>),
    mariaDbParameters: json['MariaDbParameters'] == null
        ? null
        : MariaDbParameters.fromJson(
            json['MariaDbParameters'] as Map<String, dynamic>),
    mySqlParameters: json['MySqlParameters'] == null
        ? null
        : MySqlParameters.fromJson(
            json['MySqlParameters'] as Map<String, dynamic>),
    postgreSqlParameters: json['PostgreSqlParameters'] == null
        ? null
        : PostgreSqlParameters.fromJson(
            json['PostgreSqlParameters'] as Map<String, dynamic>),
    prestoParameters: json['PrestoParameters'] == null
        ? null
        : PrestoParameters.fromJson(
            json['PrestoParameters'] as Map<String, dynamic>),
    rdsParameters: json['RdsParameters'] == null
        ? null
        : RdsParameters.fromJson(json['RdsParameters'] as Map<String, dynamic>),
    redshiftParameters: json['RedshiftParameters'] == null
        ? null
        : RedshiftParameters.fromJson(
            json['RedshiftParameters'] as Map<String, dynamic>),
    s3Parameters: json['S3Parameters'] == null
        ? null
        : S3Parameters.fromJson(json['S3Parameters'] as Map<String, dynamic>),
    serviceNowParameters: json['ServiceNowParameters'] == null
        ? null
        : ServiceNowParameters.fromJson(
            json['ServiceNowParameters'] as Map<String, dynamic>),
    snowflakeParameters: json['SnowflakeParameters'] == null
        ? null
        : SnowflakeParameters.fromJson(
            json['SnowflakeParameters'] as Map<String, dynamic>),
    sparkParameters: json['SparkParameters'] == null
        ? null
        : SparkParameters.fromJson(
            json['SparkParameters'] as Map<String, dynamic>),
    sqlServerParameters: json['SqlServerParameters'] == null
        ? null
        : SqlServerParameters.fromJson(
            json['SqlServerParameters'] as Map<String, dynamic>),
    teradataParameters: json['TeradataParameters'] == null
        ? null
        : TeradataParameters.fromJson(
            json['TeradataParameters'] as Map<String, dynamic>),
    twitterParameters: json['TwitterParameters'] == null
        ? null
        : TwitterParameters.fromJson(
            json['TwitterParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataSourceParametersToJson(
    DataSourceParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AmazonElasticsearchParameters',
      instance.amazonElasticsearchParameters?.toJson());
  writeNotNull('AthenaParameters', instance.athenaParameters?.toJson());
  writeNotNull('AuroraParameters', instance.auroraParameters?.toJson());
  writeNotNull('AuroraPostgreSqlParameters',
      instance.auroraPostgreSqlParameters?.toJson());
  writeNotNull('AwsIotAnalyticsParameters',
      instance.awsIotAnalyticsParameters?.toJson());
  writeNotNull('JiraParameters', instance.jiraParameters?.toJson());
  writeNotNull('MariaDbParameters', instance.mariaDbParameters?.toJson());
  writeNotNull('MySqlParameters', instance.mySqlParameters?.toJson());
  writeNotNull('PostgreSqlParameters', instance.postgreSqlParameters?.toJson());
  writeNotNull('PrestoParameters', instance.prestoParameters?.toJson());
  writeNotNull('RdsParameters', instance.rdsParameters?.toJson());
  writeNotNull('RedshiftParameters', instance.redshiftParameters?.toJson());
  writeNotNull('S3Parameters', instance.s3Parameters?.toJson());
  writeNotNull('ServiceNowParameters', instance.serviceNowParameters?.toJson());
  writeNotNull('SnowflakeParameters', instance.snowflakeParameters?.toJson());
  writeNotNull('SparkParameters', instance.sparkParameters?.toJson());
  writeNotNull('SqlServerParameters', instance.sqlServerParameters?.toJson());
  writeNotNull('TeradataParameters', instance.teradataParameters?.toJson());
  writeNotNull('TwitterParameters', instance.twitterParameters?.toJson());
  return val;
}

Map<String, dynamic> _$DateTimeParameterToJson(DateTimeParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull(
      'Values', instance.values?.map((e) => e?.toIso8601String())?.toList());
  return val;
}

Map<String, dynamic> _$DecimalParameterToJson(DecimalParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$DeleteDashboardRequestToJson(
        DeleteDashboardRequest instance) =>
    <String, dynamic>{};

DeleteDashboardResponse _$DeleteDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDashboardResponse(
    arn: json['Arn'] as String,
    dashboardId: json['DashboardId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteDataSetRequestToJson(
        DeleteDataSetRequest instance) =>
    <String, dynamic>{};

DeleteDataSetResponse _$DeleteDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSetResponse(
    arn: json['Arn'] as String,
    dataSetId: json['DataSetId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteDataSourceRequestToJson(
        DeleteDataSourceRequest instance) =>
    <String, dynamic>{};

DeleteDataSourceResponse _$DeleteDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSourceResponse(
    arn: json['Arn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteGroupMembershipRequestToJson(
        DeleteGroupMembershipRequest instance) =>
    <String, dynamic>{};

DeleteGroupMembershipResponse _$DeleteGroupMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGroupMembershipResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteGroupRequestToJson(DeleteGroupRequest instance) =>
    <String, dynamic>{};

DeleteGroupResponse _$DeleteGroupResponseFromJson(Map<String, dynamic> json) {
  return DeleteGroupResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteIAMPolicyAssignmentRequestToJson(
        DeleteIAMPolicyAssignmentRequest instance) =>
    <String, dynamic>{};

DeleteIAMPolicyAssignmentResponse _$DeleteIAMPolicyAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteIAMPolicyAssignmentResponse(
    assignmentName: json['AssignmentName'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteTemplateAliasRequestToJson(
        DeleteTemplateAliasRequest instance) =>
    <String, dynamic>{};

DeleteTemplateAliasResponse _$DeleteTemplateAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTemplateAliasResponse(
    aliasName: json['AliasName'] as String,
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateId: json['TemplateId'] as String,
  );
}

Map<String, dynamic> _$DeleteTemplateRequestToJson(
        DeleteTemplateRequest instance) =>
    <String, dynamic>{};

DeleteTemplateResponse _$DeleteTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTemplateResponse(
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateId: json['TemplateId'] as String,
  );
}

Map<String, dynamic> _$DeleteUserByPrincipalIdRequestToJson(
        DeleteUserByPrincipalIdRequest instance) =>
    <String, dynamic>{};

DeleteUserByPrincipalIdResponse _$DeleteUserByPrincipalIdResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserByPrincipalIdResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{};

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDashboardPermissionsResponse
    _$DescribeDashboardPermissionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeDashboardPermissionsResponse(
    dashboardArn: json['DashboardArn'] as String,
    dashboardId: json['DashboardId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDashboardResponse _$DescribeDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDashboardResponse(
    dashboard: json['Dashboard'] == null
        ? null
        : Dashboard.fromJson(json['Dashboard'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDataSetPermissionsResponse _$DescribeDataSetPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSetPermissionsResponse(
    dataSetArn: json['DataSetArn'] as String,
    dataSetId: json['DataSetId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDataSetResponse _$DescribeDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSetResponse(
    dataSet: json['DataSet'] == null
        ? null
        : DataSet.fromJson(json['DataSet'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDataSourcePermissionsResponse
    _$DescribeDataSourcePermissionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeDataSourcePermissionsResponse(
    dataSourceArn: json['DataSourceArn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeDataSourceResponse _$DescribeDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSourceResponse(
    dataSource: json['DataSource'] == null
        ? null
        : DataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeGroupResponse _$DescribeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGroupResponse(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeIAMPolicyAssignmentResponse
    _$DescribeIAMPolicyAssignmentResponseFromJson(Map<String, dynamic> json) {
  return DescribeIAMPolicyAssignmentResponse(
    iAMPolicyAssignment: json['IAMPolicyAssignment'] == null
        ? null
        : IAMPolicyAssignment.fromJson(
            json['IAMPolicyAssignment'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeIngestionResponse _$DescribeIngestionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIngestionResponse(
    ingestion: json['Ingestion'] == null
        ? null
        : Ingestion.fromJson(json['Ingestion'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeTemplateAliasResponse _$DescribeTemplateAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTemplateAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateAlias: json['TemplateAlias'] == null
        ? null
        : TemplateAlias.fromJson(json['TemplateAlias'] as Map<String, dynamic>),
  );
}

DescribeTemplatePermissionsResponse
    _$DescribeTemplatePermissionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeTemplatePermissionsResponse(
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateArn: json['TemplateArn'] as String,
    templateId: json['TemplateId'] as String,
  );
}

DescribeTemplateResponse _$DescribeTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTemplateResponse(
    status: json['Status'] as int,
    template: json['Template'] == null
        ? null
        : Template.fromJson(json['Template'] as Map<String, dynamic>),
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  return ErrorInfo(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$IngestionErrorTypeEnumMap, json['Type']),
  );
}

const _$IngestionErrorTypeEnumMap = {
  IngestionErrorType.failureToAssumeRole: 'FAILURE_TO_ASSUME_ROLE',
  IngestionErrorType.ingestionSuperseded: 'INGESTION_SUPERSEDED',
  IngestionErrorType.ingestionCanceled: 'INGESTION_CANCELED',
  IngestionErrorType.dataSetDeleted: 'DATA_SET_DELETED',
  IngestionErrorType.dataSetNotSpice: 'DATA_SET_NOT_SPICE',
  IngestionErrorType.s3UploadedFileDeleted: 'S3_UPLOADED_FILE_DELETED',
  IngestionErrorType.s3ManifestError: 'S3_MANIFEST_ERROR',
  IngestionErrorType.dataToleranceException: 'DATA_TOLERANCE_EXCEPTION',
  IngestionErrorType.spiceTableNotFound: 'SPICE_TABLE_NOT_FOUND',
  IngestionErrorType.dataSetSizeLimitExceeded: 'DATA_SET_SIZE_LIMIT_EXCEEDED',
  IngestionErrorType.rowSizeLimitExceeded: 'ROW_SIZE_LIMIT_EXCEEDED',
  IngestionErrorType.accountCapacityLimitExceeded:
      'ACCOUNT_CAPACITY_LIMIT_EXCEEDED',
  IngestionErrorType.customerError: 'CUSTOMER_ERROR',
  IngestionErrorType.dataSourceNotFound: 'DATA_SOURCE_NOT_FOUND',
  IngestionErrorType.iamRoleNotAvailable: 'IAM_ROLE_NOT_AVAILABLE',
  IngestionErrorType.connectionFailure: 'CONNECTION_FAILURE',
  IngestionErrorType.sqlTableNotFound: 'SQL_TABLE_NOT_FOUND',
  IngestionErrorType.permissionDenied: 'PERMISSION_DENIED',
  IngestionErrorType.sslCertificateValidationFailure:
      'SSL_CERTIFICATE_VALIDATION_FAILURE',
  IngestionErrorType.oauthTokenFailure: 'OAUTH_TOKEN_FAILURE',
  IngestionErrorType.sourceApiLimitExceededFailure:
      'SOURCE_API_LIMIT_EXCEEDED_FAILURE',
  IngestionErrorType.passwordAuthenticationFailure:
      'PASSWORD_AUTHENTICATION_FAILURE',
  IngestionErrorType.sqlSchemaMismatchError: 'SQL_SCHEMA_MISMATCH_ERROR',
  IngestionErrorType.invalidDateFormat: 'INVALID_DATE_FORMAT',
  IngestionErrorType.invalidDataprepSyntax: 'INVALID_DATAPREP_SYNTAX',
  IngestionErrorType.sourceResourceLimitExceeded:
      'SOURCE_RESOURCE_LIMIT_EXCEEDED',
  IngestionErrorType.sqlInvalidParameterValue: 'SQL_INVALID_PARAMETER_VALUE',
  IngestionErrorType.queryTimeout: 'QUERY_TIMEOUT',
  IngestionErrorType.sqlNumericOverflow: 'SQL_NUMERIC_OVERFLOW',
  IngestionErrorType.unresolvableHost: 'UNRESOLVABLE_HOST',
  IngestionErrorType.unroutableHost: 'UNROUTABLE_HOST',
  IngestionErrorType.sqlException: 'SQL_EXCEPTION',
  IngestionErrorType.s3FileInaccessible: 'S3_FILE_INACCESSIBLE',
  IngestionErrorType.iotFileNotFound: 'IOT_FILE_NOT_FOUND',
  IngestionErrorType.iotDataSetFileEmpty: 'IOT_DATA_SET_FILE_EMPTY',
  IngestionErrorType.invalidDataSourceConfig: 'INVALID_DATA_SOURCE_CONFIG',
  IngestionErrorType.dataSourceAuthFailed: 'DATA_SOURCE_AUTH_FAILED',
  IngestionErrorType.dataSourceConnectionFailed:
      'DATA_SOURCE_CONNECTION_FAILED',
  IngestionErrorType.failureToProcessJsonFile: 'FAILURE_TO_PROCESS_JSON_FILE',
  IngestionErrorType.internalServiceError: 'INTERNAL_SERVICE_ERROR',
};

Map<String, dynamic> _$ExportToCSVOptionToJson(ExportToCSVOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityStatus',
      _$DashboardBehaviorEnumMap[instance.availabilityStatus]);
  return val;
}

FilterOperation _$FilterOperationFromJson(Map<String, dynamic> json) {
  return FilterOperation(
    conditionExpression: json['ConditionExpression'] as String,
  );
}

Map<String, dynamic> _$FilterOperationToJson(FilterOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConditionExpression', instance.conditionExpression);
  return val;
}

GeoSpatialColumnGroup _$GeoSpatialColumnGroupFromJson(
    Map<String, dynamic> json) {
  return GeoSpatialColumnGroup(
    columns: (json['Columns'] as List)?.map((e) => e as String)?.toList(),
    countryCode: _$enumDecodeNullable(
        _$GeoSpatialCountryCodeEnumMap, json['CountryCode']),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$GeoSpatialColumnGroupToJson(
    GeoSpatialColumnGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Columns', instance.columns);
  writeNotNull(
      'CountryCode', _$GeoSpatialCountryCodeEnumMap[instance.countryCode]);
  writeNotNull('Name', instance.name);
  return val;
}

const _$GeoSpatialCountryCodeEnumMap = {
  GeoSpatialCountryCode.us: 'US',
};

GetDashboardEmbedUrlResponse _$GetDashboardEmbedUrlResponseFromJson(
    Map<String, dynamic> json) {
  return GetDashboardEmbedUrlResponse(
    embedUrl: json['EmbedUrl'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    groupName: json['GroupName'] as String,
    principalId: json['PrincipalId'] as String,
  );
}

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) {
  return GroupMember(
    arn: json['Arn'] as String,
    memberName: json['MemberName'] as String,
  );
}

IAMPolicyAssignment _$IAMPolicyAssignmentFromJson(Map<String, dynamic> json) {
  return IAMPolicyAssignment(
    assignmentId: json['AssignmentId'] as String,
    assignmentName: json['AssignmentName'] as String,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
    awsAccountId: json['AwsAccountId'] as String,
    identities: (json['Identities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    policyArn: json['PolicyArn'] as String,
  );
}

IAMPolicyAssignmentSummary _$IAMPolicyAssignmentSummaryFromJson(
    Map<String, dynamic> json) {
  return IAMPolicyAssignmentSummary(
    assignmentName: json['AssignmentName'] as String,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
  );
}

Ingestion _$IngestionFromJson(Map<String, dynamic> json) {
  return Ingestion(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    ingestionStatus:
        _$enumDecodeNullable(_$IngestionStatusEnumMap, json['IngestionStatus']),
    errorInfo: json['ErrorInfo'] == null
        ? null
        : ErrorInfo.fromJson(json['ErrorInfo'] as Map<String, dynamic>),
    ingestionId: json['IngestionId'] as String,
    ingestionSizeInBytes: json['IngestionSizeInBytes'] as int,
    ingestionTimeInSeconds: json['IngestionTimeInSeconds'] as int,
    queueInfo: json['QueueInfo'] == null
        ? null
        : QueueInfo.fromJson(json['QueueInfo'] as Map<String, dynamic>),
    requestSource: _$enumDecodeNullable(
        _$IngestionRequestSourceEnumMap, json['RequestSource']),
    requestType: _$enumDecodeNullable(
        _$IngestionRequestTypeEnumMap, json['RequestType']),
    rowInfo: json['RowInfo'] == null
        ? null
        : RowInfo.fromJson(json['RowInfo'] as Map<String, dynamic>),
  );
}

const _$IngestionRequestSourceEnumMap = {
  IngestionRequestSource.manual: 'MANUAL',
  IngestionRequestSource.scheduled: 'SCHEDULED',
};

const _$IngestionRequestTypeEnumMap = {
  IngestionRequestType.initialIngestion: 'INITIAL_INGESTION',
  IngestionRequestType.edit: 'EDIT',
  IngestionRequestType.incrementalRefresh: 'INCREMENTAL_REFRESH',
  IngestionRequestType.fullRefresh: 'FULL_REFRESH',
};

InputColumn _$InputColumnFromJson(Map<String, dynamic> json) {
  return InputColumn(
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$InputColumnDataTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$InputColumnToJson(InputColumn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$InputColumnDataTypeEnumMap[instance.type]);
  return val;
}

const _$InputColumnDataTypeEnumMap = {
  InputColumnDataType.string: 'STRING',
  InputColumnDataType.integer: 'INTEGER',
  InputColumnDataType.decimal: 'DECIMAL',
  InputColumnDataType.datetime: 'DATETIME',
  InputColumnDataType.bit: 'BIT',
  InputColumnDataType.boolean: 'BOOLEAN',
  InputColumnDataType.json: 'JSON',
};

Map<String, dynamic> _$IntegerParameterToJson(IntegerParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

JiraParameters _$JiraParametersFromJson(Map<String, dynamic> json) {
  return JiraParameters(
    siteBaseUrl: json['SiteBaseUrl'] as String,
  );
}

Map<String, dynamic> _$JiraParametersToJson(JiraParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SiteBaseUrl', instance.siteBaseUrl);
  return val;
}

JoinInstruction _$JoinInstructionFromJson(Map<String, dynamic> json) {
  return JoinInstruction(
    leftOperand: json['LeftOperand'] as String,
    onClause: json['OnClause'] as String,
    rightOperand: json['RightOperand'] as String,
    type: _$enumDecodeNullable(_$JoinTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$JoinInstructionToJson(JoinInstruction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LeftOperand', instance.leftOperand);
  writeNotNull('OnClause', instance.onClause);
  writeNotNull('RightOperand', instance.rightOperand);
  writeNotNull('Type', _$JoinTypeEnumMap[instance.type]);
  return val;
}

const _$JoinTypeEnumMap = {
  JoinType.inner: 'INNER',
  JoinType.outer: 'OUTER',
  JoinType.left: 'LEFT',
  JoinType.right: 'RIGHT',
};

ListDashboardVersionsResponse _$ListDashboardVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDashboardVersionsResponse(
    dashboardVersionSummaryList: (json['DashboardVersionSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListDashboardsResponse _$ListDashboardsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDashboardsResponse(
    dashboardSummaryList: (json['DashboardSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListDataSetsResponse _$ListDataSetsResponseFromJson(Map<String, dynamic> json) {
  return ListDataSetsResponse(
    dataSetSummaries: (json['DataSetSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : DataSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListDataSourcesResponse _$ListDataSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataSourcesResponse(
    dataSources: (json['DataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListGroupMembershipsResponse _$ListGroupMembershipsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGroupMembershipsResponse(
    groupMemberList: (json['GroupMemberList'] as List)
        ?.map((e) =>
            e == null ? null : GroupMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListGroupsResponse _$ListGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListGroupsResponse(
    groupList: (json['GroupList'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListIAMPolicyAssignmentsForUserResponse
    _$ListIAMPolicyAssignmentsForUserResponseFromJson(
        Map<String, dynamic> json) {
  return ListIAMPolicyAssignmentsForUserResponse(
    activeAssignments: (json['ActiveAssignments'] as List)
        ?.map((e) => e == null
            ? null
            : ActiveIAMPolicyAssignment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListIAMPolicyAssignmentsResponse _$ListIAMPolicyAssignmentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListIAMPolicyAssignmentsResponse(
    iAMPolicyAssignments: (json['IAMPolicyAssignments'] as List)
        ?.map((e) => e == null
            ? null
            : IAMPolicyAssignmentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListIngestionsResponse _$ListIngestionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListIngestionsResponse(
    ingestions: (json['Ingestions'] as List)
        ?.map((e) =>
            e == null ? null : Ingestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTemplateAliasesResponse _$ListTemplateAliasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTemplateAliasesResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateAliasList: (json['TemplateAliasList'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateAlias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTemplateVersionsResponse _$ListTemplateVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTemplateVersionsResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateVersionSummaryList: (json['TemplateVersionSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTemplatesResponse _$ListTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTemplatesResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateSummaryList: (json['TemplateSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUserGroupsResponse _$ListUserGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserGroupsResponse(
    groupList: (json['GroupList'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    userList: (json['UserList'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogicalTable _$LogicalTableFromJson(Map<String, dynamic> json) {
  return LogicalTable(
    alias: json['Alias'] as String,
    source: json['Source'] == null
        ? null
        : LogicalTableSource.fromJson(json['Source'] as Map<String, dynamic>),
    dataTransforms: (json['DataTransforms'] as List)
        ?.map((e) => e == null
            ? null
            : TransformOperation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LogicalTableToJson(LogicalTable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Alias', instance.alias);
  writeNotNull('Source', instance.source?.toJson());
  writeNotNull('DataTransforms',
      instance.dataTransforms?.map((e) => e?.toJson())?.toList());
  return val;
}

LogicalTableSource _$LogicalTableSourceFromJson(Map<String, dynamic> json) {
  return LogicalTableSource(
    joinInstruction: json['JoinInstruction'] == null
        ? null
        : JoinInstruction.fromJson(
            json['JoinInstruction'] as Map<String, dynamic>),
    physicalTableId: json['PhysicalTableId'] as String,
  );
}

Map<String, dynamic> _$LogicalTableSourceToJson(LogicalTableSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JoinInstruction', instance.joinInstruction?.toJson());
  writeNotNull('PhysicalTableId', instance.physicalTableId);
  return val;
}

ManifestFileLocation _$ManifestFileLocationFromJson(Map<String, dynamic> json) {
  return ManifestFileLocation(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$ManifestFileLocationToJson(
    ManifestFileLocation instance) {
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

MariaDbParameters _$MariaDbParametersFromJson(Map<String, dynamic> json) {
  return MariaDbParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$MariaDbParametersToJson(MariaDbParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

MySqlParameters _$MySqlParametersFromJson(Map<String, dynamic> json) {
  return MySqlParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$MySqlParametersToJson(MySqlParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

OutputColumn _$OutputColumnFromJson(Map<String, dynamic> json) {
  return OutputColumn(
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$ColumnDataTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ParametersToJson(Parameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DateTimeParameters',
      instance.dateTimeParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('DecimalParameters',
      instance.decimalParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('IntegerParameters',
      instance.integerParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('StringParameters',
      instance.stringParameters?.map((e) => e?.toJson())?.toList());
  return val;
}

PhysicalTable _$PhysicalTableFromJson(Map<String, dynamic> json) {
  return PhysicalTable(
    customSql: json['CustomSql'] == null
        ? null
        : CustomSql.fromJson(json['CustomSql'] as Map<String, dynamic>),
    relationalTable: json['RelationalTable'] == null
        ? null
        : RelationalTable.fromJson(
            json['RelationalTable'] as Map<String, dynamic>),
    s3Source: json['S3Source'] == null
        ? null
        : S3Source.fromJson(json['S3Source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PhysicalTableToJson(PhysicalTable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomSql', instance.customSql?.toJson());
  writeNotNull('RelationalTable', instance.relationalTable?.toJson());
  writeNotNull('S3Source', instance.s3Source?.toJson());
  return val;
}

PostgreSqlParameters _$PostgreSqlParametersFromJson(Map<String, dynamic> json) {
  return PostgreSqlParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$PostgreSqlParametersToJson(
    PostgreSqlParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

PrestoParameters _$PrestoParametersFromJson(Map<String, dynamic> json) {
  return PrestoParameters(
    catalog: json['Catalog'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$PrestoParametersToJson(PrestoParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Catalog', instance.catalog);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

ProjectOperation _$ProjectOperationFromJson(Map<String, dynamic> json) {
  return ProjectOperation(
    projectedColumns:
        (json['ProjectedColumns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ProjectOperationToJson(ProjectOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProjectedColumns', instance.projectedColumns);
  return val;
}

QueueInfo _$QueueInfoFromJson(Map<String, dynamic> json) {
  return QueueInfo(
    queuedIngestion: json['QueuedIngestion'] as String,
    waitingOnIngestion: json['WaitingOnIngestion'] as String,
  );
}

RdsParameters _$RdsParametersFromJson(Map<String, dynamic> json) {
  return RdsParameters(
    database: json['Database'] as String,
    instanceId: json['InstanceId'] as String,
  );
}

Map<String, dynamic> _$RdsParametersToJson(RdsParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('InstanceId', instance.instanceId);
  return val;
}

RedshiftParameters _$RedshiftParametersFromJson(Map<String, dynamic> json) {
  return RedshiftParameters(
    database: json['Database'] as String,
    clusterId: json['ClusterId'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$RedshiftParametersToJson(RedshiftParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('ClusterId', instance.clusterId);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

Map<String, dynamic> _$RegisterUserRequestToJson(RegisterUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('IdentityType', _$IdentityTypeEnumMap[instance.identityType]);
  writeNotNull('UserRole', _$UserRoleEnumMap[instance.userRole]);
  writeNotNull('IamArn', instance.iamArn);
  writeNotNull('SessionName', instance.sessionName);
  writeNotNull('UserName', instance.userName);
  return val;
}

const _$IdentityTypeEnumMap = {
  IdentityType.iam: 'IAM',
  IdentityType.quicksight: 'QUICKSIGHT',
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'ADMIN',
  UserRole.author: 'AUTHOR',
  UserRole.reader: 'READER',
  UserRole.restrictedAuthor: 'RESTRICTED_AUTHOR',
  UserRole.restrictedReader: 'RESTRICTED_READER',
};

RegisterUserResponse _$RegisterUserResponseFromJson(Map<String, dynamic> json) {
  return RegisterUserResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
    userInvitationUrl: json['UserInvitationUrl'] as String,
  );
}

RelationalTable _$RelationalTableFromJson(Map<String, dynamic> json) {
  return RelationalTable(
    dataSourceArn: json['DataSourceArn'] as String,
    inputColumns: (json['InputColumns'] as List)
        ?.map((e) =>
            e == null ? null : InputColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    schema: json['Schema'] as String,
  );
}

Map<String, dynamic> _$RelationalTableToJson(RelationalTable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceArn', instance.dataSourceArn);
  writeNotNull(
      'InputColumns', instance.inputColumns?.map((e) => e?.toJson())?.toList());
  writeNotNull('Name', instance.name);
  writeNotNull('Schema', instance.schema);
  return val;
}

RenameColumnOperation _$RenameColumnOperationFromJson(
    Map<String, dynamic> json) {
  return RenameColumnOperation(
    columnName: json['ColumnName'] as String,
    newColumnName: json['NewColumnName'] as String,
  );
}

Map<String, dynamic> _$RenameColumnOperationToJson(
    RenameColumnOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnName', instance.columnName);
  writeNotNull('NewColumnName', instance.newColumnName);
  return val;
}

ResourcePermission _$ResourcePermissionFromJson(Map<String, dynamic> json) {
  return ResourcePermission(
    actions: (json['Actions'] as List)?.map((e) => e as String)?.toList(),
    principal: json['Principal'] as String,
  );
}

Map<String, dynamic> _$ResourcePermissionToJson(ResourcePermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions);
  writeNotNull('Principal', instance.principal);
  return val;
}

RowInfo _$RowInfoFromJson(Map<String, dynamic> json) {
  return RowInfo(
    rowsDropped: json['RowsDropped'] as int,
    rowsIngested: json['RowsIngested'] as int,
  );
}

RowLevelPermissionDataSet _$RowLevelPermissionDataSetFromJson(
    Map<String, dynamic> json) {
  return RowLevelPermissionDataSet(
    arn: json['Arn'] as String,
    permissionPolicy: _$enumDecodeNullable(
        _$RowLevelPermissionPolicyEnumMap, json['PermissionPolicy']),
  );
}

Map<String, dynamic> _$RowLevelPermissionDataSetToJson(
    RowLevelPermissionDataSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('PermissionPolicy',
      _$RowLevelPermissionPolicyEnumMap[instance.permissionPolicy]);
  return val;
}

const _$RowLevelPermissionPolicyEnumMap = {
  RowLevelPermissionPolicy.grantAccess: 'GRANT_ACCESS',
  RowLevelPermissionPolicy.denyAccess: 'DENY_ACCESS',
};

S3Parameters _$S3ParametersFromJson(Map<String, dynamic> json) {
  return S3Parameters(
    manifestFileLocation: json['ManifestFileLocation'] == null
        ? null
        : ManifestFileLocation.fromJson(
            json['ManifestFileLocation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3ParametersToJson(S3Parameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ManifestFileLocation', instance.manifestFileLocation?.toJson());
  return val;
}

S3Source _$S3SourceFromJson(Map<String, dynamic> json) {
  return S3Source(
    dataSourceArn: json['DataSourceArn'] as String,
    inputColumns: (json['InputColumns'] as List)
        ?.map((e) =>
            e == null ? null : InputColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    uploadSettings: json['UploadSettings'] == null
        ? null
        : UploadSettings.fromJson(
            json['UploadSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3SourceToJson(S3Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceArn', instance.dataSourceArn);
  writeNotNull(
      'InputColumns', instance.inputColumns?.map((e) => e?.toJson())?.toList());
  writeNotNull('UploadSettings', instance.uploadSettings?.toJson());
  return val;
}

Map<String, dynamic> _$SearchDashboardsRequestToJson(
    SearchDashboardsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

SearchDashboardsResponse _$SearchDashboardsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchDashboardsResponse(
    dashboardSummaryList: (json['DashboardSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

ServiceNowParameters _$ServiceNowParametersFromJson(Map<String, dynamic> json) {
  return ServiceNowParameters(
    siteBaseUrl: json['SiteBaseUrl'] as String,
  );
}

Map<String, dynamic> _$ServiceNowParametersToJson(
    ServiceNowParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SiteBaseUrl', instance.siteBaseUrl);
  return val;
}

Map<String, dynamic> _$SheetControlsOptionToJson(SheetControlsOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'VisibilityState', _$DashboardUIStateEnumMap[instance.visibilityState]);
  return val;
}

const _$DashboardUIStateEnumMap = {
  DashboardUIState.expanded: 'EXPANDED',
  DashboardUIState.collapsed: 'COLLAPSED',
};

SnowflakeParameters _$SnowflakeParametersFromJson(Map<String, dynamic> json) {
  return SnowflakeParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    warehouse: json['Warehouse'] as String,
  );
}

Map<String, dynamic> _$SnowflakeParametersToJson(SnowflakeParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Warehouse', instance.warehouse);
  return val;
}

SparkParameters _$SparkParametersFromJson(Map<String, dynamic> json) {
  return SparkParameters(
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$SparkParametersToJson(SparkParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

SqlServerParameters _$SqlServerParametersFromJson(Map<String, dynamic> json) {
  return SqlServerParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$SqlServerParametersToJson(SqlServerParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

SslProperties _$SslPropertiesFromJson(Map<String, dynamic> json) {
  return SslProperties(
    disableSsl: json['DisableSsl'] as bool,
  );
}

Map<String, dynamic> _$SslPropertiesToJson(SslProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisableSsl', instance.disableSsl);
  return val;
}

Map<String, dynamic> _$StringParameterToJson(StringParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
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

TagColumnOperation _$TagColumnOperationFromJson(Map<String, dynamic> json) {
  return TagColumnOperation(
    columnName: json['ColumnName'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) =>
            e == null ? null : ColumnTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TagColumnOperationToJson(TagColumnOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnName', instance.columnName);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return Template(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    templateId: json['TemplateId'] as String,
    version: json['Version'] == null
        ? null
        : TemplateVersion.fromJson(json['Version'] as Map<String, dynamic>),
  );
}

TemplateAlias _$TemplateAliasFromJson(Map<String, dynamic> json) {
  return TemplateAlias(
    aliasName: json['AliasName'] as String,
    arn: json['Arn'] as String,
    templateVersionNumber: json['TemplateVersionNumber'] as int,
  );
}

TemplateError _$TemplateErrorFromJson(Map<String, dynamic> json) {
  return TemplateError(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$TemplateErrorTypeEnumMap, json['Type']),
  );
}

const _$TemplateErrorTypeEnumMap = {
  TemplateErrorType.dataSetNotFound: 'DATA_SET_NOT_FOUND',
  TemplateErrorType.internalFailure: 'INTERNAL_FAILURE',
};

Map<String, dynamic> _$TemplateSourceAnalysisToJson(
    TemplateSourceAnalysis instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('DataSetReferences',
      instance.dataSetReferences?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$TemplateSourceEntityToJson(
    TemplateSourceEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceAnalysis', instance.sourceAnalysis?.toJson());
  writeNotNull('SourceTemplate', instance.sourceTemplate?.toJson());
  return val;
}

Map<String, dynamic> _$TemplateSourceTemplateToJson(
    TemplateSourceTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  return val;
}

TemplateSummary _$TemplateSummaryFromJson(Map<String, dynamic> json) {
  return TemplateSummary(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    latestVersionNumber: json['LatestVersionNumber'] as int,
    name: json['Name'] as String,
    templateId: json['TemplateId'] as String,
  );
}

TemplateVersion _$TemplateVersionFromJson(Map<String, dynamic> json) {
  return TemplateVersion(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dataSetConfigurations: (json['DataSetConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DataSetConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['Description'] as String,
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

TemplateVersionSummary _$TemplateVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return TemplateVersionSummary(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

TeradataParameters _$TeradataParametersFromJson(Map<String, dynamic> json) {
  return TeradataParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$TeradataParametersToJson(TeradataParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Database', instance.database);
  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  return val;
}

TransformOperation _$TransformOperationFromJson(Map<String, dynamic> json) {
  return TransformOperation(
    castColumnTypeOperation: json['CastColumnTypeOperation'] == null
        ? null
        : CastColumnTypeOperation.fromJson(
            json['CastColumnTypeOperation'] as Map<String, dynamic>),
    createColumnsOperation: json['CreateColumnsOperation'] == null
        ? null
        : CreateColumnsOperation.fromJson(
            json['CreateColumnsOperation'] as Map<String, dynamic>),
    filterOperation: json['FilterOperation'] == null
        ? null
        : FilterOperation.fromJson(
            json['FilterOperation'] as Map<String, dynamic>),
    projectOperation: json['ProjectOperation'] == null
        ? null
        : ProjectOperation.fromJson(
            json['ProjectOperation'] as Map<String, dynamic>),
    renameColumnOperation: json['RenameColumnOperation'] == null
        ? null
        : RenameColumnOperation.fromJson(
            json['RenameColumnOperation'] as Map<String, dynamic>),
    tagColumnOperation: json['TagColumnOperation'] == null
        ? null
        : TagColumnOperation.fromJson(
            json['TagColumnOperation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransformOperationToJson(TransformOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CastColumnTypeOperation', instance.castColumnTypeOperation?.toJson());
  writeNotNull(
      'CreateColumnsOperation', instance.createColumnsOperation?.toJson());
  writeNotNull('FilterOperation', instance.filterOperation?.toJson());
  writeNotNull('ProjectOperation', instance.projectOperation?.toJson());
  writeNotNull(
      'RenameColumnOperation', instance.renameColumnOperation?.toJson());
  writeNotNull('TagColumnOperation', instance.tagColumnOperation?.toJson());
  return val;
}

TwitterParameters _$TwitterParametersFromJson(Map<String, dynamic> json) {
  return TwitterParameters(
    maxRows: json['MaxRows'] as int,
    query: json['Query'] as String,
  );
}

Map<String, dynamic> _$TwitterParametersToJson(TwitterParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxRows', instance.maxRows);
  writeNotNull('Query', instance.query);
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDashboardPermissionsRequestToJson(
    UpdateDashboardPermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantPermissions',
      instance.grantPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RevokePermissions',
      instance.revokePermissions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateDashboardPermissionsResponse _$UpdateDashboardPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDashboardPermissionsResponse(
    dashboardArn: json['DashboardArn'] as String,
    dashboardId: json['DashboardId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDashboardPublishedVersionRequestToJson(
        UpdateDashboardPublishedVersionRequest instance) =>
    <String, dynamic>{};

UpdateDashboardPublishedVersionResponse
    _$UpdateDashboardPublishedVersionResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateDashboardPublishedVersionResponse(
    dashboardArn: json['DashboardArn'] as String,
    dashboardId: json['DashboardId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDashboardRequestToJson(
    UpdateDashboardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SourceEntity', instance.sourceEntity?.toJson());
  writeNotNull(
      'DashboardPublishOptions', instance.dashboardPublishOptions?.toJson());
  writeNotNull('Parameters', instance.parameters?.toJson());
  writeNotNull('VersionDescription', instance.versionDescription);
  return val;
}

UpdateDashboardResponse _$UpdateDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDashboardResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    dashboardId: json['DashboardId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    versionArn: json['VersionArn'] as String,
  );
}

Map<String, dynamic> _$UpdateDataSetPermissionsRequestToJson(
    UpdateDataSetPermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantPermissions',
      instance.grantPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RevokePermissions',
      instance.revokePermissions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateDataSetPermissionsResponse _$UpdateDataSetPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSetPermissionsResponse(
    dataSetArn: json['DataSetArn'] as String,
    dataSetId: json['DataSetId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDataSetRequestToJson(
    UpdateDataSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImportMode', _$DataSetImportModeEnumMap[instance.importMode]);
  writeNotNull('Name', instance.name);
  writeNotNull('PhysicalTableMap',
      instance.physicalTableMap?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull(
      'ColumnGroups', instance.columnGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('LogicalTableMap',
      instance.logicalTableMap?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('RowLevelPermissionDataSet',
      instance.rowLevelPermissionDataSet?.toJson());
  return val;
}

UpdateDataSetResponse _$UpdateDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSetResponse(
    arn: json['Arn'] as String,
    dataSetId: json['DataSetId'] as String,
    ingestionArn: json['IngestionArn'] as String,
    ingestionId: json['IngestionId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDataSourcePermissionsRequestToJson(
    UpdateDataSourcePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantPermissions',
      instance.grantPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RevokePermissions',
      instance.revokePermissions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateDataSourcePermissionsResponse
    _$UpdateDataSourcePermissionsResponseFromJson(Map<String, dynamic> json) {
  return UpdateDataSourcePermissionsResponse(
    dataSourceArn: json['DataSourceArn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateDataSourceRequestToJson(
    UpdateDataSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Credentials', instance.credentials?.toJson());
  writeNotNull('DataSourceParameters', instance.dataSourceParameters?.toJson());
  writeNotNull('SslProperties', instance.sslProperties?.toJson());
  writeNotNull(
      'VpcConnectionProperties', instance.vpcConnectionProperties?.toJson());
  return val;
}

UpdateDataSourceResponse _$UpdateDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSourceResponse(
    arn: json['Arn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    updateStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['UpdateStatus']),
  );
}

Map<String, dynamic> _$UpdateGroupRequestToJson(UpdateGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  return val;
}

UpdateGroupResponse _$UpdateGroupResponseFromJson(Map<String, dynamic> json) {
  return UpdateGroupResponse(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateIAMPolicyAssignmentRequestToJson(
    UpdateIAMPolicyAssignmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AssignmentStatus', _$AssignmentStatusEnumMap[instance.assignmentStatus]);
  writeNotNull('Identities', instance.identities);
  writeNotNull('PolicyArn', instance.policyArn);
  return val;
}

UpdateIAMPolicyAssignmentResponse _$UpdateIAMPolicyAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateIAMPolicyAssignmentResponse(
    assignmentId: json['AssignmentId'] as String,
    assignmentName: json['AssignmentName'] as String,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
    identities: (json['Identities'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    policyArn: json['PolicyArn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$UpdateTemplateAliasRequestToJson(
    UpdateTemplateAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TemplateVersionNumber', instance.templateVersionNumber);
  return val;
}

UpdateTemplateAliasResponse _$UpdateTemplateAliasResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTemplateAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateAlias: json['TemplateAlias'] == null
        ? null
        : TemplateAlias.fromJson(json['TemplateAlias'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTemplatePermissionsRequestToJson(
    UpdateTemplatePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantPermissions',
      instance.grantPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RevokePermissions',
      instance.revokePermissions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateTemplatePermissionsResponse _$UpdateTemplatePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTemplatePermissionsResponse(
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateArn: json['TemplateArn'] as String,
    templateId: json['TemplateId'] as String,
  );
}

Map<String, dynamic> _$UpdateTemplateRequestToJson(
    UpdateTemplateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceEntity', instance.sourceEntity?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('VersionDescription', instance.versionDescription);
  return val;
}

UpdateTemplateResponse _$UpdateTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTemplateResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateId: json['TemplateId'] as String,
    versionArn: json['VersionArn'] as String,
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('Role', _$UserRoleEnumMap[instance.role]);
  return val;
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

UploadSettings _$UploadSettingsFromJson(Map<String, dynamic> json) {
  return UploadSettings(
    containsHeader: json['ContainsHeader'] as bool,
    delimiter: json['Delimiter'] as String,
    format: _$enumDecodeNullable(_$FileFormatEnumMap, json['Format']),
    startFromRow: json['StartFromRow'] as int,
    textQualifier:
        _$enumDecodeNullable(_$TextQualifierEnumMap, json['TextQualifier']),
  );
}

Map<String, dynamic> _$UploadSettingsToJson(UploadSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainsHeader', instance.containsHeader);
  writeNotNull('Delimiter', instance.delimiter);
  writeNotNull('Format', _$FileFormatEnumMap[instance.format]);
  writeNotNull('StartFromRow', instance.startFromRow);
  writeNotNull('TextQualifier', _$TextQualifierEnumMap[instance.textQualifier]);
  return val;
}

const _$FileFormatEnumMap = {
  FileFormat.csv: 'CSV',
  FileFormat.tsv: 'TSV',
  FileFormat.clf: 'CLF',
  FileFormat.elf: 'ELF',
  FileFormat.xlsx: 'XLSX',
  FileFormat.json: 'JSON',
};

const _$TextQualifierEnumMap = {
  TextQualifier.doubleQuote: 'DOUBLE_QUOTE',
  TextQualifier.singleQuote: 'SINGLE_QUOTE',
};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    active: json['Active'] as bool,
    arn: json['Arn'] as String,
    email: json['Email'] as String,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    principalId: json['PrincipalId'] as String,
    role: _$enumDecodeNullable(_$UserRoleEnumMap, json['Role']),
    userName: json['UserName'] as String,
  );
}

VpcConnectionProperties _$VpcConnectionPropertiesFromJson(
    Map<String, dynamic> json) {
  return VpcConnectionProperties(
    vpcConnectionArn: json['VpcConnectionArn'] as String,
  );
}

Map<String, dynamic> _$VpcConnectionPropertiesToJson(
    VpcConnectionProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VpcConnectionArn', instance.vpcConnectionArn);
  return val;
}
