// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-03-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchCreateTableRowsResult _$BatchCreateTableRowsResultFromJson(
    Map<String, dynamic> json) {
  return BatchCreateTableRowsResult(
    createdRows: (json['createdRows'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    workbookCursor: json['workbookCursor'] as int,
    failedBatchItems: (json['failedBatchItems'] as List)
        ?.map((e) => e == null
            ? null
            : FailedBatchItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteTableRowsResult _$BatchDeleteTableRowsResultFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteTableRowsResult(
    workbookCursor: json['workbookCursor'] as int,
    failedBatchItems: (json['failedBatchItems'] as List)
        ?.map((e) => e == null
            ? null
            : FailedBatchItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateTableRowsResult _$BatchUpdateTableRowsResultFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateTableRowsResult(
    workbookCursor: json['workbookCursor'] as int,
    failedBatchItems: (json['failedBatchItems'] as List)
        ?.map((e) => e == null
            ? null
            : FailedBatchItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpsertTableRowsResult _$BatchUpsertTableRowsResultFromJson(
    Map<String, dynamic> json) {
  return BatchUpsertTableRowsResult(
    rows: (json['rows'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : UpsertRowsResult.fromJson(e as Map<String, dynamic>)),
    ),
    workbookCursor: json['workbookCursor'] as int,
    failedBatchItems: (json['failedBatchItems'] as List)
        ?.map((e) => e == null
            ? null
            : FailedBatchItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Cell _$CellFromJson(Map<String, dynamic> json) {
  return Cell(
    format: _$enumDecodeNullable(_$FormatEnumMap, json['format']),
    formattedValue: json['formattedValue'] as String,
    formula: json['formula'] as String,
    rawValue: json['rawValue'] as String,
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

const _$FormatEnumMap = {
  Format.auto: 'AUTO',
  Format.number: 'NUMBER',
  Format.currency: 'CURRENCY',
  Format.date: 'DATE',
  Format.time: 'TIME',
  Format.dateTime: 'DATE_TIME',
  Format.percentage: 'PERCENTAGE',
  Format.text: 'TEXT',
  Format.accounting: 'ACCOUNTING',
  Format.contact: 'CONTACT',
  Format.rowlink: 'ROWLINK',
};

Map<String, dynamic> _$CellInputToJson(CellInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fact', instance.fact);
  return val;
}

ColumnMetadata _$ColumnMetadataFromJson(Map<String, dynamic> json) {
  return ColumnMetadata(
    format: _$enumDecodeNullable(_$FormatEnumMap, json['format']),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CreateRowDataToJson(CreateRowData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('batchItemId', instance.batchItemId);
  writeNotNull('cellsToCreate',
      instance.cellsToCreate?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return DataItem(
    formattedValue: json['formattedValue'] as String,
    overrideFormat:
        _$enumDecodeNullable(_$FormatEnumMap, json['overrideFormat']),
    rawValue: json['rawValue'] as String,
  );
}

DelimitedTextImportOptions _$DelimitedTextImportOptionsFromJson(
    Map<String, dynamic> json) {
  return DelimitedTextImportOptions(
    delimiter: json['delimiter'] as String,
    dataCharacterEncoding: _$enumDecodeNullable(
        _$ImportDataCharacterEncodingEnumMap, json['dataCharacterEncoding']),
    hasHeaderRow: json['hasHeaderRow'] as bool,
    ignoreEmptyRows: json['ignoreEmptyRows'] as bool,
  );
}

Map<String, dynamic> _$DelimitedTextImportOptionsToJson(
    DelimitedTextImportOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('delimiter', instance.delimiter);
  writeNotNull('dataCharacterEncoding',
      _$ImportDataCharacterEncodingEnumMap[instance.dataCharacterEncoding]);
  writeNotNull('hasHeaderRow', instance.hasHeaderRow);
  writeNotNull('ignoreEmptyRows', instance.ignoreEmptyRows);
  return val;
}

const _$ImportDataCharacterEncodingEnumMap = {
  ImportDataCharacterEncoding.utf_8: 'UTF-8',
  ImportDataCharacterEncoding.usAscii: 'US-ASCII',
  ImportDataCharacterEncoding.iso_8859_1: 'ISO-8859-1',
  ImportDataCharacterEncoding.utf_16be: 'UTF-16BE',
  ImportDataCharacterEncoding.utf_16le: 'UTF-16LE',
  ImportDataCharacterEncoding.utf_16: 'UTF-16',
};

DescribeTableDataImportJobResult _$DescribeTableDataImportJobResultFromJson(
    Map<String, dynamic> json) {
  return DescribeTableDataImportJobResult(
    jobMetadata: json['jobMetadata'] == null
        ? null
        : TableDataImportJobMetadata.fromJson(
            json['jobMetadata'] as Map<String, dynamic>),
    jobStatus: _$enumDecodeNullable(
        _$TableDataImportJobStatusEnumMap, json['jobStatus']),
    message: json['message'] as String,
  );
}

const _$TableDataImportJobStatusEnumMap = {
  TableDataImportJobStatus.submitted: 'SUBMITTED',
  TableDataImportJobStatus.inProgress: 'IN_PROGRESS',
  TableDataImportJobStatus.completed: 'COMPLETED',
  TableDataImportJobStatus.failed: 'FAILED',
};

DestinationOptions _$DestinationOptionsFromJson(Map<String, dynamic> json) {
  return DestinationOptions(
    columnMap: (json['columnMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SourceDataColumnProperties.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$DestinationOptionsToJson(DestinationOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'columnMap', instance.columnMap?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

FailedBatchItem _$FailedBatchItemFromJson(Map<String, dynamic> json) {
  return FailedBatchItem(
    errorMessage: json['errorMessage'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('formula', instance.formula);
  writeNotNull('contextRowId', instance.contextRowId);
  return val;
}

GetScreenDataResult _$GetScreenDataResultFromJson(Map<String, dynamic> json) {
  return GetScreenDataResult(
    results: (json['results'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : ResultSet.fromJson(e as Map<String, dynamic>)),
    ),
    workbookCursor: json['workbookCursor'] as int,
    nextToken: json['nextToken'] as String,
  );
}

ImportDataSource _$ImportDataSourceFromJson(Map<String, dynamic> json) {
  return ImportDataSource(
    dataSourceConfig: json['dataSourceConfig'] == null
        ? null
        : ImportDataSourceConfig.fromJson(
            json['dataSourceConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImportDataSourceToJson(ImportDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSourceConfig', instance.dataSourceConfig?.toJson());
  return val;
}

ImportDataSourceConfig _$ImportDataSourceConfigFromJson(
    Map<String, dynamic> json) {
  return ImportDataSourceConfig(
    dataSourceUrl: json['dataSourceUrl'] as String,
  );
}

Map<String, dynamic> _$ImportDataSourceConfigToJson(
    ImportDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSourceUrl', instance.dataSourceUrl);
  return val;
}

ImportJobSubmitter _$ImportJobSubmitterFromJson(Map<String, dynamic> json) {
  return ImportJobSubmitter(
    email: json['email'] as String,
    userArn: json['userArn'] as String,
  );
}

ImportOptions _$ImportOptionsFromJson(Map<String, dynamic> json) {
  return ImportOptions(
    delimitedTextOptions: json['delimitedTextOptions'] == null
        ? null
        : DelimitedTextImportOptions.fromJson(
            json['delimitedTextOptions'] as Map<String, dynamic>),
    destinationOptions: json['destinationOptions'] == null
        ? null
        : DestinationOptions.fromJson(
            json['destinationOptions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImportOptionsToJson(ImportOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('delimitedTextOptions', instance.delimitedTextOptions?.toJson());
  writeNotNull('destinationOptions', instance.destinationOptions?.toJson());
  return val;
}

InvokeScreenAutomationResult _$InvokeScreenAutomationResultFromJson(
    Map<String, dynamic> json) {
  return InvokeScreenAutomationResult(
    workbookCursor: json['workbookCursor'] as int,
  );
}

ListTableColumnsResult _$ListTableColumnsResultFromJson(
    Map<String, dynamic> json) {
  return ListTableColumnsResult(
    tableColumns: (json['tableColumns'] as List)
        ?.map((e) =>
            e == null ? null : TableColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    workbookCursor: json['workbookCursor'] as int,
  );
}

ListTableRowsResult _$ListTableRowsResultFromJson(Map<String, dynamic> json) {
  return ListTableRowsResult(
    columnIds: (json['columnIds'] as List)?.map((e) => e as String)?.toList(),
    rows: (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : TableRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workbookCursor: json['workbookCursor'] as int,
    nextToken: json['nextToken'] as String,
    rowIdsNotFound:
        (json['rowIdsNotFound'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTablesResult _$ListTablesResultFromJson(Map<String, dynamic> json) {
  return ListTablesResult(
    tables: (json['tables'] as List)
        ?.map(
            (e) => e == null ? null : Table.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    workbookCursor: json['workbookCursor'] as int,
  );
}

QueryTableRowsResult _$QueryTableRowsResultFromJson(Map<String, dynamic> json) {
  return QueryTableRowsResult(
    columnIds: (json['columnIds'] as List)?.map((e) => e as String)?.toList(),
    rows: (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : TableRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workbookCursor: json['workbookCursor'] as int,
    nextToken: json['nextToken'] as String,
  );
}

ResultRow _$ResultRowFromJson(Map<String, dynamic> json) {
  return ResultRow(
    dataItems: (json['dataItems'] as List)
        ?.map((e) =>
            e == null ? null : DataItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rowId: json['rowId'] as String,
  );
}

ResultSet _$ResultSetFromJson(Map<String, dynamic> json) {
  return ResultSet(
    headers: (json['headers'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rows: (json['rows'] as List)
        ?.map((e) =>
            e == null ? null : ResultRow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SourceDataColumnProperties _$SourceDataColumnPropertiesFromJson(
    Map<String, dynamic> json) {
  return SourceDataColumnProperties(
    columnIndex: json['columnIndex'] as int,
  );
}

Map<String, dynamic> _$SourceDataColumnPropertiesToJson(
    SourceDataColumnProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('columnIndex', instance.columnIndex);
  return val;
}

StartTableDataImportJobResult _$StartTableDataImportJobResultFromJson(
    Map<String, dynamic> json) {
  return StartTableDataImportJobResult(
    jobId: json['jobId'] as String,
    jobStatus: _$enumDecodeNullable(
        _$TableDataImportJobStatusEnumMap, json['jobStatus']),
  );
}

Table _$TableFromJson(Map<String, dynamic> json) {
  return Table(
    tableId: json['tableId'] as String,
    tableName: json['tableName'] as String,
  );
}

TableColumn _$TableColumnFromJson(Map<String, dynamic> json) {
  return TableColumn(
    format: _$enumDecodeNullable(_$FormatEnumMap, json['format']),
    tableColumnId: json['tableColumnId'] as String,
    tableColumnName: json['tableColumnName'] as String,
  );
}

TableDataImportJobMetadata _$TableDataImportJobMetadataFromJson(
    Map<String, dynamic> json) {
  return TableDataImportJobMetadata(
    dataSource: json['dataSource'] == null
        ? null
        : ImportDataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
    importOptions: json['importOptions'] == null
        ? null
        : ImportOptions.fromJson(json['importOptions'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['submitTime']),
    submitter: json['submitter'] == null
        ? null
        : ImportJobSubmitter.fromJson(
            json['submitter'] as Map<String, dynamic>),
  );
}

TableRow _$TableRowFromJson(Map<String, dynamic> json) {
  return TableRow(
    cells: (json['cells'] as List)
        ?.map(
            (e) => e == null ? null : Cell.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rowId: json['rowId'] as String,
  );
}

Map<String, dynamic> _$UpdateRowDataToJson(UpdateRowData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cellsToUpdate',
      instance.cellsToUpdate?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('rowId', instance.rowId);
  return val;
}

Map<String, dynamic> _$UpsertRowDataToJson(UpsertRowData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('batchItemId', instance.batchItemId);
  writeNotNull('cellsToUpdate',
      instance.cellsToUpdate?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('filter', instance.filter?.toJson());
  return val;
}

UpsertRowsResult _$UpsertRowsResultFromJson(Map<String, dynamic> json) {
  return UpsertRowsResult(
    rowIds: (json['rowIds'] as List)?.map((e) => e as String)?.toList(),
    upsertAction:
        _$enumDecodeNullable(_$UpsertActionEnumMap, json['upsertAction']),
  );
}

const _$UpsertActionEnumMap = {
  UpsertAction.updated: 'UPDATED',
  UpsertAction.appended: 'APPENDED',
};

Map<String, dynamic> _$VariableValueToJson(VariableValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rawValue', instance.rawValue);
  return val;
}
