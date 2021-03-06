// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamodb-2011-12-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    b: const Uint8ListNullableConverter().fromJson(json['B'] as String?),
    bs: (json['BS'] as List<dynamic>?)
        ?.map((e) => const Uint8ListConverter().fromJson(e as String))
        .toList(),
    n: json['N'] as String?,
    ns: (json['NS'] as List<dynamic>?)?.map((e) => e as String).toList(),
    s: json['S'] as String?,
    ss: (json['SS'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AttributeValueToJson(AttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('B', const Uint8ListNullableConverter().toJson(instance.b));
  writeNotNull(
      'BS', instance.bs?.map(const Uint8ListConverter().toJson).toList());
  writeNotNull('N', instance.n);
  writeNotNull('NS', instance.ns);
  writeNotNull('S', instance.s);
  writeNotNull('SS', instance.ss);
  return val;
}

Map<String, dynamic> _$AttributeValueUpdateToJson(
    AttributeValueUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$AttributeActionEnumMap[instance.action]);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

const _$AttributeActionEnumMap = {
  AttributeAction.add: 'ADD',
  AttributeAction.put: 'PUT',
  AttributeAction.delete: 'DELETE',
};

BatchGetItemOutput _$BatchGetItemOutputFromJson(Map<String, dynamic> json) {
  return BatchGetItemOutput(
    responses: (json['Responses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, BatchResponse.fromJson(e as Map<String, dynamic>)),
    ),
    unprocessedKeys: (json['UnprocessedKeys'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, KeysAndAttributes.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

BatchResponse _$BatchResponseFromJson(Map<String, dynamic> json) {
  return BatchResponse(
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
    items: (json['Items'] as List<dynamic>?)
        ?.map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        .toList(),
  );
}

BatchWriteItemOutput _$BatchWriteItemOutputFromJson(Map<String, dynamic> json) {
  return BatchWriteItemOutput(
    responses: (json['Responses'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, BatchWriteResponse.fromJson(e as Map<String, dynamic>)),
    ),
    unprocessedItems: (json['UnprocessedItems'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => WriteRequest.fromJson(e as Map<String, dynamic>))
              .toList()),
    ),
  );
}

BatchWriteResponse _$BatchWriteResponseFromJson(Map<String, dynamic> json) {
  return BatchWriteResponse(
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{
    'ComparisonOperator':
        _$ComparisonOperatorEnumMap[instance.comparisonOperator],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeValueList',
      instance.attributeValueList?.map((e) => e.toJson()).toList());
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.eq: 'EQ',
  ComparisonOperator.ne: 'NE',
  ComparisonOperator.$in: 'IN',
  ComparisonOperator.le: 'LE',
  ComparisonOperator.lt: 'LT',
  ComparisonOperator.ge: 'GE',
  ComparisonOperator.gt: 'GT',
  ComparisonOperator.between: 'BETWEEN',
  ComparisonOperator.notNull: 'NOT_NULL',
  ComparisonOperator.$null: 'NULL',
  ComparisonOperator.contains: 'CONTAINS',
  ComparisonOperator.notContains: 'NOT_CONTAINS',
  ComparisonOperator.beginsWith: 'BEGINS_WITH',
};

CreateTableOutput _$CreateTableOutputFromJson(Map<String, dynamic> json) {
  return CreateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

DeleteItemOutput _$DeleteItemOutputFromJson(Map<String, dynamic> json) {
  return DeleteItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
  );
}

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) {
  return DeleteRequest(
    key: Key.fromJson(json['Key'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{
      'Key': instance.key.toJson(),
    };

DeleteTableOutput _$DeleteTableOutputFromJson(Map<String, dynamic> json) {
  return DeleteTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

DescribeTableOutput _$DescribeTableOutputFromJson(Map<String, dynamic> json) {
  return DescribeTableOutput(
    table: json['Table'] == null
        ? null
        : TableDescription.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExpectedAttributeValueToJson(
    ExpectedAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Exists', instance.exists);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

GetItemOutput _$GetItemOutputFromJson(Map<String, dynamic> json) {
  return GetItemOutput(
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
    item: (json['Item'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Key _$KeyFromJson(Map<String, dynamic> json) {
  return Key(
    hashKeyElement:
        AttributeValue.fromJson(json['HashKeyElement'] as Map<String, dynamic>),
    rangeKeyElement: json['RangeKeyElement'] == null
        ? null
        : AttributeValue.fromJson(
            json['RangeKeyElement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KeyToJson(Key instance) {
  final val = <String, dynamic>{
    'HashKeyElement': instance.hashKeyElement.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RangeKeyElement', instance.rangeKeyElement?.toJson());
  return val;
}

KeySchema _$KeySchemaFromJson(Map<String, dynamic> json) {
  return KeySchema(
    hashKeyElement: KeySchemaElement.fromJson(
        json['HashKeyElement'] as Map<String, dynamic>),
    rangeKeyElement: json['RangeKeyElement'] == null
        ? null
        : KeySchemaElement.fromJson(
            json['RangeKeyElement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KeySchemaToJson(KeySchema instance) {
  final val = <String, dynamic>{
    'HashKeyElement': instance.hashKeyElement.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RangeKeyElement', instance.rangeKeyElement?.toJson());
  return val;
}

KeySchemaElement _$KeySchemaElementFromJson(Map<String, dynamic> json) {
  return KeySchemaElement(
    attributeName: json['AttributeName'] as String,
    attributeType:
        _$enumDecode(_$ScalarAttributeTypeEnumMap, json['AttributeType']),
  );
}

Map<String, dynamic> _$KeySchemaElementToJson(KeySchemaElement instance) =>
    <String, dynamic>{
      'AttributeName': instance.attributeName,
      'AttributeType': _$ScalarAttributeTypeEnumMap[instance.attributeType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ScalarAttributeTypeEnumMap = {
  ScalarAttributeType.s: 'S',
  ScalarAttributeType.n: 'N',
  ScalarAttributeType.b: 'B',
};

KeysAndAttributes _$KeysAndAttributesFromJson(Map<String, dynamic> json) {
  return KeysAndAttributes(
    keys: (json['Keys'] as List<dynamic>)
        .map((e) => Key.fromJson(e as Map<String, dynamic>))
        .toList(),
    attributesToGet: (json['AttributesToGet'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    consistentRead: json['ConsistentRead'] as bool?,
  );
}

Map<String, dynamic> _$KeysAndAttributesToJson(KeysAndAttributes instance) {
  final val = <String, dynamic>{
    'Keys': instance.keys.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributesToGet', instance.attributesToGet);
  writeNotNull('ConsistentRead', instance.consistentRead);
  return val;
}

ListTablesOutput _$ListTablesOutputFromJson(Map<String, dynamic> json) {
  return ListTablesOutput(
    lastEvaluatedTableName: json['LastEvaluatedTableName'] as String?,
    tableNames: (json['TableNames'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$ProvisionedThroughputToJson(
        ProvisionedThroughput instance) =>
    <String, dynamic>{
      'ReadCapacityUnits': instance.readCapacityUnits,
      'WriteCapacityUnits': instance.writeCapacityUnits,
    };

ProvisionedThroughputDescription _$ProvisionedThroughputDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughputDescription(
    lastDecreaseDateTime:
        const UnixDateTimeConverter().fromJson(json['LastDecreaseDateTime']),
    lastIncreaseDateTime:
        const UnixDateTimeConverter().fromJson(json['LastIncreaseDateTime']),
    numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int?,
    readCapacityUnits: json['ReadCapacityUnits'] as int?,
    writeCapacityUnits: json['WriteCapacityUnits'] as int?,
  );
}

PutItemOutput _$PutItemOutputFromJson(Map<String, dynamic> json) {
  return PutItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
  );
}

PutRequest _$PutRequestFromJson(Map<String, dynamic> json) {
  return PutRequest(
    item: (json['Item'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$PutRequestToJson(PutRequest instance) =>
    <String, dynamic>{
      'Item': instance.item.map((k, e) => MapEntry(k, e.toJson())),
    };

QueryOutput _$QueryOutputFromJson(Map<String, dynamic> json) {
  return QueryOutput(
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
    count: json['Count'] as int?,
    items: (json['Items'] as List<dynamic>?)
        ?.map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        .toList(),
    lastEvaluatedKey: json['LastEvaluatedKey'] == null
        ? null
        : Key.fromJson(json['LastEvaluatedKey'] as Map<String, dynamic>),
  );
}

ScanOutput _$ScanOutputFromJson(Map<String, dynamic> json) {
  return ScanOutput(
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
    count: json['Count'] as int?,
    items: (json['Items'] as List<dynamic>?)
        ?.map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        .toList(),
    lastEvaluatedKey: json['LastEvaluatedKey'] == null
        ? null
        : Key.fromJson(json['LastEvaluatedKey'] as Map<String, dynamic>),
    scannedCount: json['ScannedCount'] as int?,
  );
}

TableDescription _$TableDescriptionFromJson(Map<String, dynamic> json) {
  return TableDescription(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    itemCount: json['ItemCount'] as int?,
    keySchema: json['KeySchema'] == null
        ? null
        : KeySchema.fromJson(json['KeySchema'] as Map<String, dynamic>),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughputDescription.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    tableName: json['TableName'] as String?,
    tableSizeBytes: json['TableSizeBytes'] as int?,
    tableStatus:
        _$enumDecodeNullable(_$TableStatusEnumMap, json['TableStatus']),
  );
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$TableStatusEnumMap = {
  TableStatus.creating: 'CREATING',
  TableStatus.updating: 'UPDATING',
  TableStatus.deleting: 'DELETING',
  TableStatus.active: 'ACTIVE',
};

UpdateItemOutput _$UpdateItemOutputFromJson(Map<String, dynamic> json) {
  return UpdateItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacityUnits: (json['ConsumedCapacityUnits'] as num?)?.toDouble(),
  );
}

UpdateTableOutput _$UpdateTableOutputFromJson(Map<String, dynamic> json) {
  return UpdateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

WriteRequest _$WriteRequestFromJson(Map<String, dynamic> json) {
  return WriteRequest(
    deleteRequest: json['DeleteRequest'] == null
        ? null
        : DeleteRequest.fromJson(json['DeleteRequest'] as Map<String, dynamic>),
    putRequest: json['PutRequest'] == null
        ? null
        : PutRequest.fromJson(json['PutRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WriteRequestToJson(WriteRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeleteRequest', instance.deleteRequest?.toJson());
  writeNotNull('PutRequest', instance.putRequest?.toJson());
  return val;
}
