// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
    permissions: (json['Permissions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PermissionEnumMap, e))
        ?.toList(),
    permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PermissionEnumMap, e))
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
  writeNotNull('Permissions',
      instance.permissions?.map((e) => _$PermissionEnumMap[e])?.toList());
  writeNotNull(
      'PermissionsWithGrantOption',
      instance.permissionsWithGrantOption
          ?.map((e) => _$PermissionEnumMap[e])
          ?.toList());
  writeNotNull('Principal', instance.principal?.toJson());
  writeNotNull('Resource', instance.resource?.toJson());
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

const _$PermissionEnumMap = {
  Permission.all: 'ALL',
  Permission.select: 'SELECT',
  Permission.alter: 'ALTER',
  Permission.drop: 'DROP',
  Permission.delete: 'DELETE',
  Permission.insert: 'INSERT',
  Permission.describe: 'DESCRIBE',
  Permission.createDatabase: 'CREATE_DATABASE',
  Permission.createTable: 'CREATE_TABLE',
  Permission.dataLocationAccess: 'DATA_LOCATION_ACCESS',
};

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
    trustedResourceOwners: (json['TrustedResourceOwners'] as List)
        ?.map((e) => e as String)
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
  writeNotNull('TrustedResourceOwners', instance.trustedResourceOwners);
  return val;
}

DataLocationResource _$DataLocationResourceFromJson(Map<String, dynamic> json) {
  return DataLocationResource(
    resourceArn: json['ResourceArn'] as String,
    catalogId: json['CatalogId'] as String,
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
  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

DatabaseResource _$DatabaseResourceFromJson(Map<String, dynamic> json) {
  return DatabaseResource(
    name: json['Name'] as String,
    catalogId: json['CatalogId'] as String,
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
  writeNotNull('CatalogId', instance.catalogId);
  return val;
}

DeregisterResourceResponse _$DeregisterResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterResourceResponse();
}

DescribeResourceResponse _$DescribeResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourceResponse(
    resourceInfo: json['ResourceInfo'] == null
        ? null
        : ResourceInfo.fromJson(json['ResourceInfo'] as Map<String, dynamic>),
  );
}

DetailsMap _$DetailsMapFromJson(Map<String, dynamic> json) {
  return DetailsMap(
    resourceShare:
        (json['ResourceShare'] as List)?.map((e) => e as String)?.toList(),
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

GetDataLakeSettingsResponse _$GetDataLakeSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDataLakeSettingsResponse(
    dataLakeSettings: json['DataLakeSettings'] == null
        ? null
        : DataLakeSettings.fromJson(
            json['DataLakeSettings'] as Map<String, dynamic>),
  );
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

GrantPermissionsResponse _$GrantPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return GrantPermissionsResponse();
}

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

PrincipalResourcePermissions _$PrincipalResourcePermissionsFromJson(
    Map<String, dynamic> json) {
  return PrincipalResourcePermissions(
    additionalDetails: json['AdditionalDetails'] == null
        ? null
        : DetailsMap.fromJson(
            json['AdditionalDetails'] as Map<String, dynamic>),
    permissions: (json['Permissions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PermissionEnumMap, e))
        ?.toList(),
    permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PermissionEnumMap, e))
        ?.toList(),
    principal: json['Principal'] == null
        ? null
        : DataLakePrincipal.fromJson(json['Principal'] as Map<String, dynamic>),
    resource: json['Resource'] == null
        ? null
        : Resource.fromJson(json['Resource'] as Map<String, dynamic>),
  );
}

PutDataLakeSettingsResponse _$PutDataLakeSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return PutDataLakeSettingsResponse();
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
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

RevokePermissionsResponse _$RevokePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return RevokePermissionsResponse();
}

TableResource _$TableResourceFromJson(Map<String, dynamic> json) {
  return TableResource(
    databaseName: json['DatabaseName'] as String,
    catalogId: json['CatalogId'] as String,
    name: json['Name'] as String,
    tableWildcard: json['TableWildcard'] == null
        ? null
        : TableWildcard.fromJson(json['TableWildcard'] as Map<String, dynamic>),
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
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('Name', instance.name);
  writeNotNull('TableWildcard', instance.tableWildcard?.toJson());
  return val;
}

TableWildcard _$TableWildcardFromJson(Map<String, dynamic> json) {
  return TableWildcard();
}

Map<String, dynamic> _$TableWildcardToJson(TableWildcard instance) =>
    <String, dynamic>{};

TableWithColumnsResource _$TableWithColumnsResourceFromJson(
    Map<String, dynamic> json) {
  return TableWithColumnsResource(
    databaseName: json['DatabaseName'] as String,
    name: json['Name'] as String,
    catalogId: json['CatalogId'] as String,
    columnNames:
        (json['ColumnNames'] as List)?.map((e) => e as String)?.toList(),
    columnWildcard: json['ColumnWildcard'] == null
        ? null
        : ColumnWildcard.fromJson(
            json['ColumnWildcard'] as Map<String, dynamic>),
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

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Name', instance.name);
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('ColumnNames', instance.columnNames);
  writeNotNull('ColumnWildcard', instance.columnWildcard?.toJson());
  return val;
}

UpdateResourceResponse _$UpdateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceResponse();
}
