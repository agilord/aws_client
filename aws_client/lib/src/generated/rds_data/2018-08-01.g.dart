// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-08-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrayValue _$ArrayValueFromJson(Map<String, dynamic> json) {
  return ArrayValue(
    arrayValues: (json['arrayValues'] as List)
        ?.map((e) =>
            e == null ? null : ArrayValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    booleanValues:
        (json['booleanValues'] as List)?.map((e) => e as bool)?.toList(),
    doubleValues: (json['doubleValues'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    longValues: (json['longValues'] as List)?.map((e) => e as int)?.toList(),
    stringValues:
        (json['stringValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ArrayValueToJson(ArrayValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'arrayValues', instance.arrayValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('booleanValues', instance.booleanValues);
  writeNotNull('doubleValues', instance.doubleValues);
  writeNotNull('longValues', instance.longValues);
  writeNotNull('stringValues', instance.stringValues);
  return val;
}

BatchExecuteStatementResponse _$BatchExecuteStatementResponseFromJson(
    Map<String, dynamic> json) {
  return BatchExecuteStatementResponse(
    updateResults: (json['updateResults'] as List)
        ?.map((e) =>
            e == null ? null : UpdateResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BeginTransactionResponse _$BeginTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return BeginTransactionResponse(
    transactionId: json['transactionId'] as String,
  );
}

ColumnMetadata _$ColumnMetadataFromJson(Map<String, dynamic> json) {
  return ColumnMetadata(
    arrayBaseColumnType: json['arrayBaseColumnType'] as int,
    isAutoIncrement: json['isAutoIncrement'] as bool,
    isCaseSensitive: json['isCaseSensitive'] as bool,
    isCurrency: json['isCurrency'] as bool,
    isSigned: json['isSigned'] as bool,
    label: json['label'] as String,
    name: json['name'] as String,
    nullable: json['nullable'] as int,
    precision: json['precision'] as int,
    scale: json['scale'] as int,
    schemaName: json['schemaName'] as String,
    tableName: json['tableName'] as String,
    type: json['type'] as int,
    typeName: json['typeName'] as String,
  );
}

CommitTransactionResponse _$CommitTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return CommitTransactionResponse(
    transactionStatus: json['transactionStatus'] as String,
  );
}

ExecuteSqlResponse _$ExecuteSqlResponseFromJson(Map<String, dynamic> json) {
  return ExecuteSqlResponse(
    sqlStatementResults: (json['sqlStatementResults'] as List)
        ?.map((e) => e == null
            ? null
            : SqlStatementResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExecuteStatementResponse _$ExecuteStatementResponseFromJson(
    Map<String, dynamic> json) {
  return ExecuteStatementResponse(
    columnMetadata: (json['columnMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    generatedFields: (json['generatedFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    numberOfRecordsUpdated: json['numberOfRecordsUpdated'] as int,
    records: (json['records'] as List)
        ?.map((e) => (e as List)
            ?.map((e) =>
                e == null ? null : Field.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    arrayValue: json['arrayValue'] == null
        ? null
        : ArrayValue.fromJson(json['arrayValue'] as Map<String, dynamic>),
    blobValue: const Uint8ListConverter().fromJson(json['blobValue'] as String),
    booleanValue: json['booleanValue'] as bool,
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    isNull: json['isNull'] as bool,
    longValue: json['longValue'] as int,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arrayValue', instance.arrayValue?.toJson());
  writeNotNull(
      'blobValue', const Uint8ListConverter().toJson(instance.blobValue));
  writeNotNull('booleanValue', instance.booleanValue);
  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('isNull', instance.isNull);
  writeNotNull('longValue', instance.longValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    values: (json['values'] as List)
        ?.map(
            (e) => e == null ? null : Value.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResultFrame _$ResultFrameFromJson(Map<String, dynamic> json) {
  return ResultFrame(
    records: (json['records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultSetMetadata: json['resultSetMetadata'] == null
        ? null
        : ResultSetMetadata.fromJson(
            json['resultSetMetadata'] as Map<String, dynamic>),
  );
}

ResultSetMetadata _$ResultSetMetadataFromJson(Map<String, dynamic> json) {
  return ResultSetMetadata(
    columnCount: json['columnCount'] as int,
    columnMetadata: (json['columnMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : ColumnMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultSetOptionsToJson(ResultSetOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('decimalReturnType',
      _$DecimalReturnTypeEnumMap[instance.decimalReturnType]);
  return val;
}

const _$DecimalReturnTypeEnumMap = {
  DecimalReturnType.doubleOrLong: 'DOUBLE_OR_LONG',
  DecimalReturnType.string: 'STRING',
};

RollbackTransactionResponse _$RollbackTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return RollbackTransactionResponse(
    transactionStatus: json['transactionStatus'] as String,
  );
}

Map<String, dynamic> _$SqlParameterToJson(SqlParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('typeHint', _$TypeHintEnumMap[instance.typeHint]);
  writeNotNull('value', instance.value?.toJson());
  return val;
}

const _$TypeHintEnumMap = {
  TypeHint.date: 'DATE',
  TypeHint.decimal: 'DECIMAL',
  TypeHint.time: 'TIME',
  TypeHint.timestamp: 'TIMESTAMP',
};

SqlStatementResult _$SqlStatementResultFromJson(Map<String, dynamic> json) {
  return SqlStatementResult(
    numberOfRecordsUpdated: json['numberOfRecordsUpdated'] as int,
    resultFrame: json['resultFrame'] == null
        ? null
        : ResultFrame.fromJson(json['resultFrame'] as Map<String, dynamic>),
  );
}

StructValue _$StructValueFromJson(Map<String, dynamic> json) {
  return StructValue(
    attributes: (json['attributes'] as List)
        ?.map(
            (e) => e == null ? null : Value.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateResult _$UpdateResultFromJson(Map<String, dynamic> json) {
  return UpdateResult(
    generatedFields: (json['generatedFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Value _$ValueFromJson(Map<String, dynamic> json) {
  return Value(
    arrayValues: (json['arrayValues'] as List)
        ?.map(
            (e) => e == null ? null : Value.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bigIntValue: json['bigIntValue'] as int,
    bitValue: json['bitValue'] as bool,
    blobValue: const Uint8ListConverter().fromJson(json['blobValue'] as String),
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    intValue: json['intValue'] as int,
    isNull: json['isNull'] as bool,
    realValue: (json['realValue'] as num)?.toDouble(),
    stringValue: json['stringValue'] as String,
    structValue: json['structValue'] == null
        ? null
        : StructValue.fromJson(json['structValue'] as Map<String, dynamic>),
  );
}
