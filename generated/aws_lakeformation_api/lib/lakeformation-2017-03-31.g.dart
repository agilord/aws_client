// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lakeformation-2017-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BatchGrantPermissionsRequestToJson(
    BatchGrantPermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Entries', instance.entries?.map((e) => e?.toJson())?.toList());
  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

BatchGrantPermissionsResponse _$BatchGrantPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGrantPermissionsResponse(
    failures: (json['Failures'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPermissionsFailureEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchPermissionsFailureEntry _$BatchPermissionsFailureEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPermissionsFailureEntry(
    error: json['Error'] == null
        ? null
        : ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>),
    requestEntry: json['RequestEntry'] == null
        ? null
        : BatchPermissionsRequestEntry.fromJson(
            json['RequestEntry'] as Map<String, dynamic>),
  );
}

BatchPermissionsRequestEntry _$BatchPermissionsRequestEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPermissionsRequestEntry(
    id: json['Id'] as String,
    permissions:
        (json['Permissions'] as List)?.map((e) => e as String)?.toList(),
    permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    principal: json['Principal'] == null
        ? null
        : DataLakePrincipal.fromJson(json['Principal'] as Map<String, dynamic>),
    resource: json['Resource'] == null
        ? null
        : Resource.fromJson(json['Resource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchPermissionsRequestEntryToJson(
    BatchPermissionsRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Permissions', instance.permissions);
  writeNotNull(
      'PermissionsWithGrantOption', instance.permissionsWithGrantOption);
  writeNotNull('Principal', instance.principal?.toJson());
  writeNotNull('Resource', instance.resource?.toJson());
  return val;
}

Map<String, dynamic> _$BatchRevokePermissionsRequestToJson(
    BatchRevokePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Entries', instance.entries?.map((e) => e?.toJson())?.toList());
  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

BatchRevokePermissionsResponse _$BatchRevokePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchRevokePermissionsResponse(
    failures: (json['Failures'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPermissionsFailureEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CatalogResource _$CatalogResourceFromJson(Map<String, dynamic> json) {
  return CatalogResource();
}

Map<String, dynamic> _$CatalogResourceToJson(CatalogResource instance) =>
    <String, dynamic>{};

ColumnWildcard _$ColumnWildcardFromJson(Map<String, dynamic> json) {
  return ColumnWildcard(
    excludedColumnNames: (json['ExcludedColumnNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$ColumnWildcardToJson(ColumnWildcard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExcludedColumnNames', instance.excludedColumnNames);
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

DataLakeSettings _$DataLakeSettingsFromJson(Map<String, dynamic> json) {
  return DataLakeSettings(
    createDatabaseDefaultPermissions:
        (json['CreateDatabaseDefaultPermissions'] as List)
            ?.map((e) => e == null
                ? null
                : PrincipalPermissions.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    createTableDefaultPermissions:
        (json['CreateTableDefaultPermissions'] as List)
            ?.map((e) => e == null
                ? null
                : PrincipalPermissions.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    dataLakeAdmins: (json['DataLakeAdmins'] as List)
        ?.map((e) => e == null
            ? null
            : DataLakePrincipal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataLakeSettingsToJson(DataLakeSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CreateDatabaseDefaultPermissions',
      instance.createDatabaseDefaultPermissions
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'CreateTableDefaultPermissions',
      instance.createTableDefaultPermissions
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('DataLakeAdmins',
      instance.dataLakeAdmins?.map((e) => e?.toJson())?.toList());
  return val;
}

DataLocationResource _$DataLocationResourceFromJson(Map<String, dynamic> json) {
  return DataLocationResource(
    resourceArn: json['ResourceArn'] as String,
  );
}

Map<String, dynamic> _$DataLocationResourceToJson(
    DataLocationResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DatabaseResource _$DatabaseResourceFromJson(Map<String, dynamic> json) {
  return DatabaseResource(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DatabaseResourceToJson(DatabaseResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$DeregisterResourceRequestToJson(
    DeregisterResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DeregisterResourceResponse _$DeregisterResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterResourceResponse();
}

Map<String, dynamic> _$DescribeResourceRequestToJson(
    DescribeResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

DescribeResourceResponse _$DescribeResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourceResponse(
    resourceInfo: json['ResourceInfo'] == null
        ? null
        : ResourceInfo.fromJson(json['ResourceInfo'] as Map<String, dynamic>),
  );
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
  );
}

Map<String, dynamic> _$FilterConditionToJson(FilterCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull('Field', _$FieldNameStringEnumMap[instance.field]);
  writeNotNull('StringValueList', instance.stringValueList);
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.eq: 'EQ',
  ComparisonOperator.ne: 'NE',
  ComparisonOperator.le: 'LE',
  ComparisonOperator.lt: 'LT',
  ComparisonOperator.ge: 'GE',
  ComparisonOperator.gt: 'GT',
  ComparisonOperator.contains: 'CONTAINS',
  ComparisonOperator.notContains: 'NOT_CONTAINS',
  ComparisonOperator.beginsWith: 'BEGINS_WITH',
  ComparisonOperator.$in: 'IN',
  ComparisonOperator.between: 'BETWEEN',
};

const _$FieldNameStringEnumMap = {
  FieldNameString.resourceArn: 'RESOURCE_ARN',
  FieldNameString.roleArn: 'ROLE_ARN',
  FieldNameString.lastModified: 'LAST_MODIFIED',
};

Map<String, dynamic> _$GetDataLakeSettingsRequestToJson(
    GetDataLakeSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

GetDataLakeSettingsResponse _$GetDataLakeSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDataLakeSettingsResponse(
    dataLakeSettings: json['DataLakeSettings'] == null
        ? null
        : DataLakeSettings.fromJson(
            json['DataLakeSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetEffectivePermissionsForPathRequestToJson(
    GetEffectivePermissionsForPathRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

GetEffectivePermissionsForPathResponse
    _$GetEffectivePermissionsForPathResponseFromJson(
        Map<String, dynamic> json) {
  return GetEffectivePermissionsForPathResponse(
    nextToken: json['NextToken'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) => e == null
            ? null
            : PrincipalResourcePermissions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrantPermissionsRequestToJson(
    GrantPermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Permissions', instance.permissions);
  writeNotNull('Principal', instance.principal?.toJson());
  writeNotNull('Resource', instance.resource?.toJson());
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull(
      'PermissionsWithGrantOption', instance.permissionsWithGrantOption);
  return val;
}

GrantPermissionsResponse _$GrantPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return GrantPermissionsResponse();
}

Map<String, dynamic> _$ListPermissionsRequestToJson(
    ListPermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Principal', instance.principal?.toJson());
  writeNotNull('Resource', instance.resource?.toJson());
  writeNotNull(
      'ResourceType', _$DataLakeResourceTypeEnumMap[instance.resourceType]);
  return val;
}

const _$DataLakeResourceTypeEnumMap = {
  DataLakeResourceType.catalog: 'CATALOG',
  DataLakeResourceType.database: 'DATABASE',
  DataLakeResourceType.table: 'TABLE',
  DataLakeResourceType.dataLocation: 'DATA_LOCATION',
};

ListPermissionsResponse _$ListPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPermissionsResponse(
    nextToken: json['NextToken'] as String,
    principalResourcePermissions: (json['PrincipalResourcePermissions'] as List)
        ?.map((e) => e == null
            ? null
            : PrincipalResourcePermissions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListResourcesRequestToJson(
    ListResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FilterConditionList',
      instance.filterConditionList?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListResourcesResponse _$ListResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourcesResponse(
    nextToken: json['NextToken'] as String,
    resourceInfoList: (json['ResourceInfoList'] as List)
        ?.map((e) =>
            e == null ? null : ResourceInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

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

PrincipalResourcePermissions _$PrincipalResourcePermissionsFromJson(
    Map<String, dynamic> json) {
  return PrincipalResourcePermissions(
    permissions:
        (json['Permissions'] as List)?.map((e) => e as String)?.toList(),
    permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    principal: json['Principal'] == null
        ? null
        : DataLakePrincipal.fromJson(json['Principal'] as Map<String, dynamic>),
    resource: json['Resource'] == null
        ? null
        : Resource.fromJson(json['Resource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutDataLakeSettingsRequestToJson(
    PutDataLakeSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataLakeSettings', instance.dataLakeSettings?.toJson());
  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

PutDataLakeSettingsResponse _$PutDataLakeSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return PutDataLakeSettingsResponse();
}

Map<String, dynamic> _$RegisterResourceRequestToJson(
    RegisterResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('UseServiceLinkedRole', instance.useServiceLinkedRole);
  return val;
}

RegisterResourceResponse _$RegisterResourceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterResourceResponse();
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    catalog: json['Catalog'] == null
        ? null
        : CatalogResource.fromJson(json['Catalog'] as Map<String, dynamic>),
    dataLocation: json['DataLocation'] == null
        ? null
        : DataLocationResource.fromJson(
            json['DataLocation'] as Map<String, dynamic>),
    database: json['Database'] == null
        ? null
        : DatabaseResource.fromJson(json['Database'] as Map<String, dynamic>),
    table: json['Table'] == null
        ? null
        : TableResource.fromJson(json['Table'] as Map<String, dynamic>),
    tableWithColumns: json['TableWithColumns'] == null
        ? null
        : TableWithColumnsResource.fromJson(
            json['TableWithColumns'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Catalog', instance.catalog?.toJson());
  writeNotNull('DataLocation', instance.dataLocation?.toJson());
  writeNotNull('Database', instance.database?.toJson());
  writeNotNull('Table', instance.table?.toJson());
  writeNotNull('TableWithColumns', instance.tableWithColumns?.toJson());
  return val;
}

ResourceInfo _$ResourceInfoFromJson(Map<String, dynamic> json) {
  return ResourceInfo(
    lastModified: unixTimestampFromJson(json['LastModified']),
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

Map<String, dynamic> _$RevokePermissionsRequestToJson(
    RevokePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Permissions', instance.permissions);
  writeNotNull('Principal', instance.principal?.toJson());
  writeNotNull('Resource', instance.resource?.toJson());
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull(
      'PermissionsWithGrantOption', instance.permissionsWithGrantOption);
  return val;
}

RevokePermissionsResponse _$RevokePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return RevokePermissionsResponse();
}

TableResource _$TableResourceFromJson(Map<String, dynamic> json) {
  return TableResource(
    databaseName: json['DatabaseName'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$TableResourceToJson(TableResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Name', instance.name);
  return val;
}

TableWithColumnsResource _$TableWithColumnsResourceFromJson(
    Map<String, dynamic> json) {
  return TableWithColumnsResource(
    columnNames:
        (json['ColumnNames'] as List)?.map((e) => e as String)?.toList(),
    columnWildcard: json['ColumnWildcard'] == null
        ? null
        : ColumnWildcard.fromJson(
            json['ColumnWildcard'] as Map<String, dynamic>),
    databaseName: json['DatabaseName'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$TableWithColumnsResourceToJson(
    TableWithColumnsResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColumnNames', instance.columnNames);
  writeNotNull('ColumnWildcard', instance.columnWildcard?.toJson());
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$UpdateResourceRequestToJson(
    UpdateResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

UpdateResourceResponse _$UpdateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceResponse();
}
