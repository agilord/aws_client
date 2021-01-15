// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-12-20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelStatementResponse _$CancelStatementResponseFromJson(
    Map<String, dynamic> json) {
  return CancelStatementResponse(
    status: json['Status'] as bool,
  );
}

ColumnMetadata _$ColumnMetadataFromJson(Map<String, dynamic> json) {
  return ColumnMetadata(
    columnDefault: json['columnDefault'] as String,
    isCaseSensitive: json['isCaseSensitive'] as bool,
    isCurrency: json['isCurrency'] as bool,
    isSigned: json['isSigned'] as bool,
    label: json['label'] as String,
    length: json['length'] as int,
    name: json['name'] as String,
    nullable: json['nullable'] as int,
    precision: json['precision'] as int,
    scale: json['scale'] as int,
    schemaName: json['schemaName'] as String,
    tableName: json['tableName'] as String,
    typeName: json['typeName'] as String,
  );
}

DescribeStatementResponse _$DescribeStatementResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStatementResponse(
    id: json['Id'] as String,
    clusterIdentifier: json['ClusterIdentifier'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    database: json['Database'] as String,
    dbUser: json['DbUser'] as String,
    duration: json['Duration'] as int,
    error: json['Error'] as String,
    queryString: json['QueryString'] as String,
    redshiftPid: json['RedshiftPid'] as int,
    redshiftQueryId: json['RedshiftQueryId'] as int,
    resultRows: json['ResultRows'] as int,
    resultSize: json['ResultSize'] as int,
    secretArn: json['SecretArn'] as String,
    status: _$enumDecodeNullable(_$StatusStringEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
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

const _$StatusStringEnumMap = {
  StatusString.aborted: 'ABORTED',
  StatusString.all: 'ALL',
  StatusString.failed: 'FAILED',
  StatusString.finished: 'FINISHED',
  StatusString.picked: 'PICKED',
  StatusString.started: 'STARTED',
  StatusString.submitted: 'SUBMITTED',
};

DescribeTableResponse _$DescribeTableResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTableResponse(
    columnList: (json['ColumnList'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    tableName: json['TableName'] as String,
  );
}

ExecuteStatementOutput _$ExecuteStatementOutputFromJson(
    Map<String, dynamic> json) {
  return ExecuteStatementOutput(
    clusterIdentifier: json['ClusterIdentifier'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    database: json['Database'] as String,
    dbUser: json['DbUser'] as String,
    id: json['Id'] as String,
    secretArn: json['SecretArn'] as String,
  );
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    blobValue: const Uint8ListConverter().fromJson(json['blobValue'] as String),
    booleanValue: json['booleanValue'] as bool,
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    isNull: json['isNull'] as bool,
    longValue: json['longValue'] as int,
    stringValue: json['stringValue'] as String,
  );
}

GetStatementResultResponse _$GetStatementResultResponseFromJson(
    Map<String, dynamic> json) {
  return GetStatementResultResponse(
    records: (json['Records'] as List)
        ?.map((e) => (e as List)
            ?.map((e) =>
                e == null ? null : Field.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
    columnMetadata: (json['ColumnMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    totalNumRows: json['TotalNumRows'] as int,
  );
}

ListDatabasesResponse _$ListDatabasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatabasesResponse(
    databases: (json['Databases'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSchemasResponse _$ListSchemasResponseFromJson(Map<String, dynamic> json) {
  return ListSchemasResponse(
    nextToken: json['NextToken'] as String,
    schemas: (json['Schemas'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListStatementsResponse _$ListStatementsResponseFromJson(
    Map<String, dynamic> json) {
  return ListStatementsResponse(
    statements: (json['Statements'] as List)
        ?.map((e) => e == null
            ? null
            : StatementData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTablesResponse _$ListTablesResponseFromJson(Map<String, dynamic> json) {
  return ListTablesResponse(
    nextToken: json['NextToken'] as String,
    tables: (json['Tables'] as List)
        ?.map((e) =>
            e == null ? null : TableMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StatementData _$StatementDataFromJson(Map<String, dynamic> json) {
  return StatementData(
    id: json['Id'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    queryString: json['QueryString'] as String,
    secretArn: json['SecretArn'] as String,
    statementName: json['StatementName'] as String,
    status: _$enumDecodeNullable(_$StatusStringEnumMap, json['Status']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

TableMember _$TableMemberFromJson(Map<String, dynamic> json) {
  return TableMember(
    name: json['name'] as String,
    schema: json['schema'] as String,
    type: json['type'] as String,
  );
}
