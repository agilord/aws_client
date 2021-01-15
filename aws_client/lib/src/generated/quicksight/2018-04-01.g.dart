// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-04-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCustomization _$AccountCustomizationFromJson(Map<String, dynamic> json) {
  return AccountCustomization(
    defaultTheme: json['DefaultTheme'] as String,
  );
}

Map<String, dynamic> _$AccountCustomizationToJson(
    AccountCustomization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultTheme', instance.defaultTheme);
  return val;
}

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) {
  return AccountSettings(
    accountName: json['AccountName'] as String,
    defaultNamespace: json['DefaultNamespace'] as String,
    edition: _$enumDecodeNullable(_$EditionEnumMap, json['Edition']),
    notificationEmail: json['NotificationEmail'] as String,
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

const _$EditionEnumMap = {
  Edition.standard: 'STANDARD',
  Edition.enterprise: 'ENTERPRISE',
};

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

Analysis _$AnalysisFromJson(Map<String, dynamic> json) {
  return Analysis(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dataSetArns:
        (json['DataSetArns'] as List)?.map((e) => e as String)?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : AnalysisError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    sheets: (json['Sheets'] as List)
        ?.map(
            (e) => e == null ? null : Sheet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    themeArn: json['ThemeArn'] as String,
  );
}

const _$ResourceStatusEnumMap = {
  ResourceStatus.creationInProgress: 'CREATION_IN_PROGRESS',
  ResourceStatus.creationSuccessful: 'CREATION_SUCCESSFUL',
  ResourceStatus.creationFailed: 'CREATION_FAILED',
  ResourceStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  ResourceStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  ResourceStatus.updateFailed: 'UPDATE_FAILED',
  ResourceStatus.deleted: 'DELETED',
};

AnalysisError _$AnalysisErrorFromJson(Map<String, dynamic> json) {
  return AnalysisError(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$AnalysisErrorTypeEnumMap, json['Type']),
  );
}

const _$AnalysisErrorTypeEnumMap = {
  AnalysisErrorType.accessDenied: 'ACCESS_DENIED',
  AnalysisErrorType.sourceNotFound: 'SOURCE_NOT_FOUND',
  AnalysisErrorType.dataSetNotFound: 'DATA_SET_NOT_FOUND',
  AnalysisErrorType.internalFailure: 'INTERNAL_FAILURE',
  AnalysisErrorType.parameterValueIncompatible: 'PARAMETER_VALUE_INCOMPATIBLE',
  AnalysisErrorType.parameterTypeInvalid: 'PARAMETER_TYPE_INVALID',
  AnalysisErrorType.parameterNotFound: 'PARAMETER_NOT_FOUND',
  AnalysisErrorType.columnTypeMismatch: 'COLUMN_TYPE_MISMATCH',
  AnalysisErrorType.columnGeographicRoleMismatch:
      'COLUMN_GEOGRAPHIC_ROLE_MISMATCH',
  AnalysisErrorType.columnReplacementMissing: 'COLUMN_REPLACEMENT_MISSING',
};

Map<String, dynamic> _$AnalysisSearchFilterToJson(
    AnalysisSearchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$AnalysisFilterAttributeEnumMap[instance.name]);
  writeNotNull('Operator', _$FilterOperatorEnumMap[instance.operator]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$AnalysisFilterAttributeEnumMap = {
  AnalysisFilterAttribute.quicksightUser: 'QUICKSIGHT_USER',
};

const _$FilterOperatorEnumMap = {
  FilterOperator.stringEquals: 'StringEquals',
};

Map<String, dynamic> _$AnalysisSourceEntityToJson(
    AnalysisSourceEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceTemplate', instance.sourceTemplate?.toJson());
  return val;
}

Map<String, dynamic> _$AnalysisSourceTemplateToJson(
    AnalysisSourceTemplate instance) {
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

AnalysisSummary _$AnalysisSummaryFromJson(Map<String, dynamic> json) {
  return AnalysisSummary(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
  );
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

BorderStyle _$BorderStyleFromJson(Map<String, dynamic> json) {
  return BorderStyle(
    show: json['Show'] as bool,
  );
}

Map<String, dynamic> _$BorderStyleToJson(BorderStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Show', instance.show);
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

const _$ColumnDataTypeEnumMap = {
  ColumnDataType.string: 'STRING',
  ColumnDataType.integer: 'INTEGER',
  ColumnDataType.decimal: 'DECIMAL',
  ColumnDataType.datetime: 'DATETIME',
};

ColumnDescription _$ColumnDescriptionFromJson(Map<String, dynamic> json) {
  return ColumnDescription(
    text: json['Text'] as String,
  );
}

Map<String, dynamic> _$ColumnDescriptionToJson(ColumnDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  return val;
}

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

ColumnLevelPermissionRule _$ColumnLevelPermissionRuleFromJson(
    Map<String, dynamic> json) {
  return ColumnLevelPermissionRule(
    columnNames:
        (json['ColumnNames'] as List)?.map((e) => e as String)?.toList(),
    principals: (json['Principals'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ColumnLevelPermissionRuleToJson(
    ColumnLevelPermissionRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnNames', instance.columnNames);
  writeNotNull('Principals', instance.principals);
  return val;
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
    columnDescription: json['ColumnDescription'] == null
        ? null
        : ColumnDescription.fromJson(
            json['ColumnDescription'] as Map<String, dynamic>),
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

  writeNotNull('ColumnDescription', instance.columnDescription?.toJson());
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

CreateAccountCustomizationResponse _$CreateAccountCustomizationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccountCustomizationResponse(
    accountCustomization: json['AccountCustomization'] == null
        ? null
        : AccountCustomization.fromJson(
            json['AccountCustomization'] as Map<String, dynamic>),
    arn: json['Arn'] as String,
    awsAccountId: json['AwsAccountId'] as String,
    namespace: json['Namespace'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

CreateAnalysisResponse _$CreateAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAnalysisResponse(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

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

CreateGroupResponse _$CreateGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateGroupResponse(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

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

const _$AssignmentStatusEnumMap = {
  AssignmentStatus.enabled: 'ENABLED',
  AssignmentStatus.draft: 'DRAFT',
  AssignmentStatus.disabled: 'DISABLED',
};

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

CreateNamespaceResponse _$CreateNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateNamespaceResponse(
    arn: json['Arn'] as String,
    capacityRegion: json['CapacityRegion'] as String,
    creationStatus:
        _$enumDecodeNullable(_$NamespaceStatusEnumMap, json['CreationStatus']),
    identityStore:
        _$enumDecodeNullable(_$IdentityStoreEnumMap, json['IdentityStore']),
    name: json['Name'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

const _$NamespaceStatusEnumMap = {
  NamespaceStatus.created: 'CREATED',
  NamespaceStatus.creating: 'CREATING',
  NamespaceStatus.deleting: 'DELETING',
  NamespaceStatus.retryableFailure: 'RETRYABLE_FAILURE',
  NamespaceStatus.nonRetryableFailure: 'NON_RETRYABLE_FAILURE',
};

const _$IdentityStoreEnumMap = {
  IdentityStore.quicksight: 'QUICKSIGHT',
};

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

CreateThemeAliasResponse _$CreateThemeAliasResponseFromJson(
    Map<String, dynamic> json) {
  return CreateThemeAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeAlias: json['ThemeAlias'] == null
        ? null
        : ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>),
  );
}

CreateThemeResponse _$CreateThemeResponseFromJson(Map<String, dynamic> json) {
  return CreateThemeResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeId: json['ThemeId'] as String,
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
  writeNotNull(
      'AlternateDataSourceParameters',
      instance.alternateDataSourceParameters
          ?.map((e) => e?.toJson())
          ?.toList());
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dashboardId: json['DashboardId'] as String,
    lastPublishedTime:
        const UnixDateTimeConverter().fromJson(json['LastPublishedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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
  DashboardErrorType.accessDenied: 'ACCESS_DENIED',
  DashboardErrorType.sourceNotFound: 'SOURCE_NOT_FOUND',
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dashboardId: json['DashboardId'] as String,
    lastPublishedTime:
        const UnixDateTimeConverter().fromJson(json['LastPublishedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    publishedVersionNumber: json['PublishedVersionNumber'] as int,
  );
}

DashboardVersion _$DashboardVersionFromJson(Map<String, dynamic> json) {
  return DashboardVersion(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dataSetArns:
        (json['DataSetArns'] as List)?.map((e) => e as String)?.toList(),
    description: json['Description'] as String,
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sheets: (json['Sheets'] as List)
        ?.map(
            (e) => e == null ? null : Sheet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    themeArn: json['ThemeArn'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

DashboardVersionSummary _$DashboardVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return DashboardVersionSummary(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    description: json['Description'] as String,
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

DataColorPalette _$DataColorPaletteFromJson(Map<String, dynamic> json) {
  return DataColorPalette(
    colors: (json['Colors'] as List)?.map((e) => e as String)?.toList(),
    emptyFillColor: json['EmptyFillColor'] as String,
    minMaxGradient:
        (json['MinMaxGradient'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DataColorPaletteToJson(DataColorPalette instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Colors', instance.colors);
  writeNotNull('EmptyFillColor', instance.emptyFillColor);
  writeNotNull('MinMaxGradient', instance.minMaxGradient);
  return val;
}

DataSet _$DataSetFromJson(Map<String, dynamic> json) {
  return DataSet(
    arn: json['Arn'] as String,
    columnGroups: (json['ColumnGroups'] as List)
        ?.map((e) =>
            e == null ? null : ColumnGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    columnLevelPermissionRules: (json['ColumnLevelPermissionRules'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnLevelPermissionRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    consumedSpiceCapacityInBytes: json['ConsumedSpiceCapacityInBytes'] as int,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dataSetId: json['DataSetId'] as String,
    importMode:
        _$enumDecodeNullable(_$DataSetImportModeEnumMap, json['ImportMode']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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

const _$DataSetImportModeEnumMap = {
  DataSetImportMode.spice: 'SPICE',
  DataSetImportMode.directQuery: 'DIRECT_QUERY',
};

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
    columnLevelPermissionRulesApplied:
        json['ColumnLevelPermissionRulesApplied'] as bool,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dataSetId: json['DataSetId'] as String,
    importMode:
        _$enumDecodeNullable(_$DataSetImportModeEnumMap, json['ImportMode']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    rowLevelPermissionDataSet: json['RowLevelPermissionDataSet'] == null
        ? null
        : RowLevelPermissionDataSet.fromJson(
            json['RowLevelPermissionDataSet'] as Map<String, dynamic>),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    alternateDataSourceParameters:
        (json['AlternateDataSourceParameters'] as List)
            ?.map((e) => e == null
                ? null
                : DataSourceParameters.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    dataSourceId: json['DataSourceId'] as String,
    dataSourceParameters: json['DataSourceParameters'] == null
        ? null
        : DataSourceParameters.fromJson(
            json['DataSourceParameters'] as Map<String, dynamic>),
    errorInfo: json['ErrorInfo'] == null
        ? null
        : DataSourceErrorInfo.fromJson(
            json['ErrorInfo'] as Map<String, dynamic>),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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
  DataSourceType.oracle: 'ORACLE',
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
  DataSourceType.timestream: 'TIMESTREAM',
};

Map<String, dynamic> _$DataSourceCredentialsToJson(
    DataSourceCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CopySourceArn', instance.copySourceArn);
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
  DataSourceErrorInfoType.accessDenied: 'ACCESS_DENIED',
  DataSourceErrorInfoType.copySourceNotFound: 'COPY_SOURCE_NOT_FOUND',
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
    oracleParameters: json['OracleParameters'] == null
        ? null
        : OracleParameters.fromJson(
            json['OracleParameters'] as Map<String, dynamic>),
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
  writeNotNull('OracleParameters', instance.oracleParameters?.toJson());
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
  writeNotNull('Values',
      instance.values?.map(const UnixDateTimeConverter().toJson)?.toList());
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

DeleteAccountCustomizationResponse _$DeleteAccountCustomizationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccountCustomizationResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteAnalysisResponse _$DeleteAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAnalysisResponse(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    deletionTime: const UnixDateTimeConverter().fromJson(json['DeletionTime']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteDashboardResponse _$DeleteDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDashboardResponse(
    arn: json['Arn'] as String,
    dashboardId: json['DashboardId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteDataSetResponse _$DeleteDataSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSetResponse(
    arn: json['Arn'] as String,
    dataSetId: json['DataSetId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteDataSourceResponse _$DeleteDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSourceResponse(
    arn: json['Arn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteGroupMembershipResponse _$DeleteGroupMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGroupMembershipResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteGroupResponse _$DeleteGroupResponseFromJson(Map<String, dynamic> json) {
  return DeleteGroupResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteIAMPolicyAssignmentResponse _$DeleteIAMPolicyAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteIAMPolicyAssignmentResponse(
    assignmentName: json['AssignmentName'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteNamespaceResponse _$DeleteNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNamespaceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

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

DeleteTemplateResponse _$DeleteTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTemplateResponse(
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    templateId: json['TemplateId'] as String,
  );
}

DeleteThemeAliasResponse _$DeleteThemeAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThemeAliasResponse(
    aliasName: json['AliasName'] as String,
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeId: json['ThemeId'] as String,
  );
}

DeleteThemeResponse _$DeleteThemeResponseFromJson(Map<String, dynamic> json) {
  return DeleteThemeResponse(
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeId: json['ThemeId'] as String,
  );
}

DeleteUserByPrincipalIdResponse _$DeleteUserByPrincipalIdResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserByPrincipalIdResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeAccountCustomizationResponse
    _$DescribeAccountCustomizationResponseFromJson(Map<String, dynamic> json) {
  return DescribeAccountCustomizationResponse(
    accountCustomization: json['AccountCustomization'] == null
        ? null
        : AccountCustomization.fromJson(
            json['AccountCustomization'] as Map<String, dynamic>),
    arn: json['Arn'] as String,
    awsAccountId: json['AwsAccountId'] as String,
    namespace: json['Namespace'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeAccountSettingsResponse _$DescribeAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountSettingsResponse(
    accountSettings: json['AccountSettings'] == null
        ? null
        : AccountSettings.fromJson(
            json['AccountSettings'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeAnalysisPermissionsResponse
    _$DescribeAnalysisPermissionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeAnalysisPermissionsResponse(
    analysisArn: json['AnalysisArn'] as String,
    analysisId: json['AnalysisId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

DescribeAnalysisResponse _$DescribeAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAnalysisResponse(
    analysis: json['Analysis'] == null
        ? null
        : Analysis.fromJson(json['Analysis'] as Map<String, dynamic>),
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

DescribeNamespaceResponse _$DescribeNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeNamespaceResponse(
    namespace: json['Namespace'] == null
        ? null
        : NamespaceInfoV2.fromJson(json['Namespace'] as Map<String, dynamic>),
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
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    template: json['Template'] == null
        ? null
        : Template.fromJson(json['Template'] as Map<String, dynamic>),
  );
}

DescribeThemeAliasResponse _$DescribeThemeAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThemeAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeAlias: json['ThemeAlias'] == null
        ? null
        : ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>),
  );
}

DescribeThemePermissionsResponse _$DescribeThemePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThemePermissionsResponse(
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeArn: json['ThemeArn'] as String,
    themeId: json['ThemeId'] as String,
  );
}

DescribeThemeResponse _$DescribeThemeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThemeResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    theme: json['Theme'] == null
        ? null
        : Theme.fromJson(json['Theme'] as Map<String, dynamic>),
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

GetSessionEmbedUrlResponse _$GetSessionEmbedUrlResponseFromJson(
    Map<String, dynamic> json) {
  return GetSessionEmbedUrlResponse(
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

GutterStyle _$GutterStyleFromJson(Map<String, dynamic> json) {
  return GutterStyle(
    show: json['Show'] as bool,
  );
}

Map<String, dynamic> _$GutterStyleToJson(GutterStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Show', instance.show);
  return val;
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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
    leftJoinKeyProperties: json['LeftJoinKeyProperties'] == null
        ? null
        : JoinKeyProperties.fromJson(
            json['LeftJoinKeyProperties'] as Map<String, dynamic>),
    rightJoinKeyProperties: json['RightJoinKeyProperties'] == null
        ? null
        : JoinKeyProperties.fromJson(
            json['RightJoinKeyProperties'] as Map<String, dynamic>),
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
  writeNotNull(
      'LeftJoinKeyProperties', instance.leftJoinKeyProperties?.toJson());
  writeNotNull(
      'RightJoinKeyProperties', instance.rightJoinKeyProperties?.toJson());
  return val;
}

const _$JoinTypeEnumMap = {
  JoinType.inner: 'INNER',
  JoinType.outer: 'OUTER',
  JoinType.left: 'LEFT',
  JoinType.right: 'RIGHT',
};

JoinKeyProperties _$JoinKeyPropertiesFromJson(Map<String, dynamic> json) {
  return JoinKeyProperties(
    uniqueKey: json['UniqueKey'] as bool,
  );
}

Map<String, dynamic> _$JoinKeyPropertiesToJson(JoinKeyProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UniqueKey', instance.uniqueKey);
  return val;
}

ListAnalysesResponse _$ListAnalysesResponseFromJson(Map<String, dynamic> json) {
  return ListAnalysesResponse(
    analysisSummaryList: (json['AnalysisSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : AnalysisSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

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

ListNamespacesResponse _$ListNamespacesResponseFromJson(
    Map<String, dynamic> json) {
  return ListNamespacesResponse(
    namespaces: (json['Namespaces'] as List)
        ?.map((e) => e == null
            ? null
            : NamespaceInfoV2.fromJson(e as Map<String, dynamic>))
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

ListThemeAliasesResponse _$ListThemeAliasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListThemeAliasesResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeAliasList: (json['ThemeAliasList'] as List)
        ?.map((e) =>
            e == null ? null : ThemeAlias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThemeVersionsResponse _$ListThemeVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListThemeVersionsResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeVersionSummaryList: (json['ThemeVersionSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ThemeVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThemesResponse _$ListThemesResponseFromJson(Map<String, dynamic> json) {
  return ListThemesResponse(
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeSummaryList: (json['ThemeSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : ThemeSummary.fromJson(e as Map<String, dynamic>))
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

MarginStyle _$MarginStyleFromJson(Map<String, dynamic> json) {
  return MarginStyle(
    show: json['Show'] as bool,
  );
}

Map<String, dynamic> _$MarginStyleToJson(MarginStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Show', instance.show);
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

NamespaceError _$NamespaceErrorFromJson(Map<String, dynamic> json) {
  return NamespaceError(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$NamespaceErrorTypeEnumMap, json['Type']),
  );
}

const _$NamespaceErrorTypeEnumMap = {
  NamespaceErrorType.permissionDenied: 'PERMISSION_DENIED',
  NamespaceErrorType.internalServiceError: 'INTERNAL_SERVICE_ERROR',
};

NamespaceInfoV2 _$NamespaceInfoV2FromJson(Map<String, dynamic> json) {
  return NamespaceInfoV2(
    arn: json['Arn'] as String,
    capacityRegion: json['CapacityRegion'] as String,
    creationStatus:
        _$enumDecodeNullable(_$NamespaceStatusEnumMap, json['CreationStatus']),
    identityStore:
        _$enumDecodeNullable(_$IdentityStoreEnumMap, json['IdentityStore']),
    name: json['Name'] as String,
    namespaceError: json['NamespaceError'] == null
        ? null
        : NamespaceError.fromJson(
            json['NamespaceError'] as Map<String, dynamic>),
  );
}

OracleParameters _$OracleParametersFromJson(Map<String, dynamic> json) {
  return OracleParameters(
    database: json['Database'] as String,
    host: json['Host'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$OracleParametersToJson(OracleParameters instance) {
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
    description: json['Description'] as String,
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
    catalog: json['Catalog'] as String,
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
  writeNotNull('Catalog', instance.catalog);
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

RestoreAnalysisResponse _$RestoreAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreAnalysisResponse(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
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
    namespace: json['Namespace'] as String,
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
  writeNotNull('Namespace', instance.namespace);
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

SearchAnalysesResponse _$SearchAnalysesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchAnalysesResponse(
    analysisSummaryList: (json['AnalysisSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : AnalysisSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
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

Sheet _$SheetFromJson(Map<String, dynamic> json) {
  return Sheet(
    name: json['Name'] as String,
    sheetId: json['SheetId'] as String,
  );
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

SheetStyle _$SheetStyleFromJson(Map<String, dynamic> json) {
  return SheetStyle(
    tile: json['Tile'] == null
        ? null
        : TileStyle.fromJson(json['Tile'] as Map<String, dynamic>),
    tileLayout: json['TileLayout'] == null
        ? null
        : TileLayoutStyle.fromJson(json['TileLayout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SheetStyleToJson(SheetStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tile', instance.tile?.toJson());
  writeNotNull('TileLayout', instance.tileLayout?.toJson());
  return val;
}

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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return Template(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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
  TemplateErrorType.sourceNotFound: 'SOURCE_NOT_FOUND',
  TemplateErrorType.dataSetNotFound: 'DATA_SET_NOT_FOUND',
  TemplateErrorType.internalFailure: 'INTERNAL_FAILURE',
  TemplateErrorType.accessDenied: 'ACCESS_DENIED',
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    latestVersionNumber: json['LatestVersionNumber'] as int,
    name: json['Name'] as String,
    templateId: json['TemplateId'] as String,
  );
}

TemplateVersion _$TemplateVersionFromJson(Map<String, dynamic> json) {
  return TemplateVersion(
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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
    sheets: (json['Sheets'] as List)
        ?.map(
            (e) => e == null ? null : Sheet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceEntityArn: json['SourceEntityArn'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    themeArn: json['ThemeArn'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

TemplateVersionSummary _$TemplateVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return TemplateVersionSummary(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

Theme _$ThemeFromJson(Map<String, dynamic> json) {
  return Theme(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    name: json['Name'] as String,
    themeId: json['ThemeId'] as String,
    type: _$enumDecodeNullable(_$ThemeTypeEnumMap, json['Type']),
    version: json['Version'] == null
        ? null
        : ThemeVersion.fromJson(json['Version'] as Map<String, dynamic>),
  );
}

const _$ThemeTypeEnumMap = {
  ThemeType.quicksight: 'QUICKSIGHT',
  ThemeType.custom: 'CUSTOM',
  ThemeType.all: 'ALL',
};

ThemeAlias _$ThemeAliasFromJson(Map<String, dynamic> json) {
  return ThemeAlias(
    aliasName: json['AliasName'] as String,
    arn: json['Arn'] as String,
    themeVersionNumber: json['ThemeVersionNumber'] as int,
  );
}

ThemeConfiguration _$ThemeConfigurationFromJson(Map<String, dynamic> json) {
  return ThemeConfiguration(
    dataColorPalette: json['DataColorPalette'] == null
        ? null
        : DataColorPalette.fromJson(
            json['DataColorPalette'] as Map<String, dynamic>),
    sheet: json['Sheet'] == null
        ? null
        : SheetStyle.fromJson(json['Sheet'] as Map<String, dynamic>),
    uIColorPalette: json['UIColorPalette'] == null
        ? null
        : UIColorPalette.fromJson(
            json['UIColorPalette'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThemeConfigurationToJson(ThemeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataColorPalette', instance.dataColorPalette?.toJson());
  writeNotNull('Sheet', instance.sheet?.toJson());
  writeNotNull('UIColorPalette', instance.uIColorPalette?.toJson());
  return val;
}

ThemeError _$ThemeErrorFromJson(Map<String, dynamic> json) {
  return ThemeError(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$ThemeErrorTypeEnumMap, json['Type']),
  );
}

const _$ThemeErrorTypeEnumMap = {
  ThemeErrorType.internalFailure: 'INTERNAL_FAILURE',
};

ThemeSummary _$ThemeSummaryFromJson(Map<String, dynamic> json) {
  return ThemeSummary(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    latestVersionNumber: json['LatestVersionNumber'] as int,
    name: json['Name'] as String,
    themeId: json['ThemeId'] as String,
  );
}

ThemeVersion _$ThemeVersionFromJson(Map<String, dynamic> json) {
  return ThemeVersion(
    arn: json['Arn'] as String,
    baseThemeId: json['BaseThemeId'] as String,
    configuration: json['Configuration'] == null
        ? null
        : ThemeConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    description: json['Description'] as String,
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : ThemeError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

ThemeVersionSummary _$ThemeVersionSummaryFromJson(Map<String, dynamic> json) {
  return ThemeVersionSummary(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    description: json['Description'] as String,
    status: _$enumDecodeNullable(_$ResourceStatusEnumMap, json['Status']),
    versionNumber: json['VersionNumber'] as int,
  );
}

TileLayoutStyle _$TileLayoutStyleFromJson(Map<String, dynamic> json) {
  return TileLayoutStyle(
    gutter: json['Gutter'] == null
        ? null
        : GutterStyle.fromJson(json['Gutter'] as Map<String, dynamic>),
    margin: json['Margin'] == null
        ? null
        : MarginStyle.fromJson(json['Margin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TileLayoutStyleToJson(TileLayoutStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Gutter', instance.gutter?.toJson());
  writeNotNull('Margin', instance.margin?.toJson());
  return val;
}

TileStyle _$TileStyleFromJson(Map<String, dynamic> json) {
  return TileStyle(
    border: json['Border'] == null
        ? null
        : BorderStyle.fromJson(json['Border'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TileStyleToJson(TileStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Border', instance.border?.toJson());
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

UIColorPalette _$UIColorPaletteFromJson(Map<String, dynamic> json) {
  return UIColorPalette(
    accent: json['Accent'] as String,
    accentForeground: json['AccentForeground'] as String,
    danger: json['Danger'] as String,
    dangerForeground: json['DangerForeground'] as String,
    dimension: json['Dimension'] as String,
    dimensionForeground: json['DimensionForeground'] as String,
    measure: json['Measure'] as String,
    measureForeground: json['MeasureForeground'] as String,
    primaryBackground: json['PrimaryBackground'] as String,
    primaryForeground: json['PrimaryForeground'] as String,
    secondaryBackground: json['SecondaryBackground'] as String,
    secondaryForeground: json['SecondaryForeground'] as String,
    success: json['Success'] as String,
    successForeground: json['SuccessForeground'] as String,
    warning: json['Warning'] as String,
    warningForeground: json['WarningForeground'] as String,
  );
}

Map<String, dynamic> _$UIColorPaletteToJson(UIColorPalette instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Accent', instance.accent);
  writeNotNull('AccentForeground', instance.accentForeground);
  writeNotNull('Danger', instance.danger);
  writeNotNull('DangerForeground', instance.dangerForeground);
  writeNotNull('Dimension', instance.dimension);
  writeNotNull('DimensionForeground', instance.dimensionForeground);
  writeNotNull('Measure', instance.measure);
  writeNotNull('MeasureForeground', instance.measureForeground);
  writeNotNull('PrimaryBackground', instance.primaryBackground);
  writeNotNull('PrimaryForeground', instance.primaryForeground);
  writeNotNull('SecondaryBackground', instance.secondaryBackground);
  writeNotNull('SecondaryForeground', instance.secondaryForeground);
  writeNotNull('Success', instance.success);
  writeNotNull('SuccessForeground', instance.successForeground);
  writeNotNull('Warning', instance.warning);
  writeNotNull('WarningForeground', instance.warningForeground);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

UpdateAccountCustomizationResponse _$UpdateAccountCustomizationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountCustomizationResponse(
    accountCustomization: json['AccountCustomization'] == null
        ? null
        : AccountCustomization.fromJson(
            json['AccountCustomization'] as Map<String, dynamic>),
    arn: json['Arn'] as String,
    awsAccountId: json['AwsAccountId'] as String,
    namespace: json['Namespace'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

UpdateAccountSettingsResponse _$UpdateAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountSettingsResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

UpdateAnalysisPermissionsResponse _$UpdateAnalysisPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAnalysisPermissionsResponse(
    analysisArn: json['AnalysisArn'] as String,
    analysisId: json['AnalysisId'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
}

UpdateAnalysisResponse _$UpdateAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAnalysisResponse(
    analysisId: json['AnalysisId'] as String,
    arn: json['Arn'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    updateStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['UpdateStatus']),
  );
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

UpdateDataSetPermissionsResponse _$UpdateDataSetPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSetPermissionsResponse(
    dataSetArn: json['DataSetArn'] as String,
    dataSetId: json['DataSetId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
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

UpdateDataSourcePermissionsResponse
    _$UpdateDataSourcePermissionsResponseFromJson(Map<String, dynamic> json) {
  return UpdateDataSourcePermissionsResponse(
    dataSourceArn: json['DataSourceArn'] as String,
    dataSourceId: json['DataSourceId'] as String,
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
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

UpdateGroupResponse _$UpdateGroupResponseFromJson(Map<String, dynamic> json) {
  return UpdateGroupResponse(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
  );
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

UpdateThemeAliasResponse _$UpdateThemeAliasResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThemeAliasResponse(
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeAlias: json['ThemeAlias'] == null
        ? null
        : ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>),
  );
}

UpdateThemePermissionsResponse _$UpdateThemePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThemePermissionsResponse(
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePermission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeArn: json['ThemeArn'] as String,
    themeId: json['ThemeId'] as String,
  );
}

UpdateThemeResponse _$UpdateThemeResponseFromJson(Map<String, dynamic> json) {
  return UpdateThemeResponse(
    arn: json['Arn'] as String,
    creationStatus:
        _$enumDecodeNullable(_$ResourceStatusEnumMap, json['CreationStatus']),
    requestId: json['RequestId'] as String,
    status: json['Status'] as int,
    themeId: json['ThemeId'] as String,
    versionArn: json['VersionArn'] as String,
  );
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
    customPermissionsName: json['CustomPermissionsName'] as String,
    email: json['Email'] as String,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    principalId: json['PrincipalId'] as String,
    role: _$enumDecodeNullable(_$UserRoleEnumMap, json['Role']),
    userName: json['UserName'] as String,
  );
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
