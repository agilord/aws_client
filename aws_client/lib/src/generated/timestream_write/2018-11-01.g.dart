// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDatabaseResponse _$CreateDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatabaseResponse(
    database: json['Database'] == null
        ? null
        : Database.fromJson(json['Database'] as Map<String, dynamic>),
  );
}

CreateTableResponse _$CreateTableResponseFromJson(Map<String, dynamic> json) {
  return CreateTableResponse(
    table: json['Table'] == null
        ? null
        : Table.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return Database(
    arn: json['Arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    tableCount: json['TableCount'] as int,
  );
}

DescribeDatabaseResponse _$DescribeDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatabaseResponse(
    database: json['Database'] == null
        ? null
        : Database.fromJson(json['Database'] as Map<String, dynamic>),
  );
}

DescribeEndpointsResponse _$DescribeEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointsResponse(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTableResponse _$DescribeTableResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTableResponse(
    table: json['Table'] == null
        ? null
        : Table.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DimensionToJson(Dimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  writeNotNull('DimensionValueType',
      _$DimensionValueTypeEnumMap[instance.dimensionValueType]);
  return val;
}

const _$DimensionValueTypeEnumMap = {
  DimensionValueType.varchar: 'VARCHAR',
};

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    address: json['Address'] as String,
    cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
  );
}

ListDatabasesResponse _$ListDatabasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatabasesResponse(
    databases: (json['Databases'] as List)
        ?.map((e) =>
            e == null ? null : Database.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTablesResponse _$ListTablesResponseFromJson(Map<String, dynamic> json) {
  return ListTablesResponse(
    nextToken: json['NextToken'] as String,
    tables: (json['Tables'] as List)
        ?.map(
            (e) => e == null ? null : Table.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

Map<String, dynamic> _$RecordToJson(Record instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  writeNotNull('MeasureName', instance.measureName);
  writeNotNull('MeasureValue', instance.measureValue);
  writeNotNull(
      'MeasureValueType', _$MeasureValueTypeEnumMap[instance.measureValueType]);
  writeNotNull('Time', instance.time);
  writeNotNull('TimeUnit', _$TimeUnitEnumMap[instance.timeUnit]);
  writeNotNull('Version', instance.version);
  return val;
}

const _$MeasureValueTypeEnumMap = {
  MeasureValueType.double: 'DOUBLE',
  MeasureValueType.bigint: 'BIGINT',
  MeasureValueType.varchar: 'VARCHAR',
  MeasureValueType.boolean: 'BOOLEAN',
};

const _$TimeUnitEnumMap = {
  TimeUnit.milliseconds: 'MILLISECONDS',
  TimeUnit.seconds: 'SECONDS',
  TimeUnit.microseconds: 'MICROSECONDS',
  TimeUnit.nanoseconds: 'NANOSECONDS',
};

RetentionProperties _$RetentionPropertiesFromJson(Map<String, dynamic> json) {
  return RetentionProperties(
    magneticStoreRetentionPeriodInDays:
        json['MagneticStoreRetentionPeriodInDays'] as int,
    memoryStoreRetentionPeriodInHours:
        json['MemoryStoreRetentionPeriodInHours'] as int,
  );
}

Map<String, dynamic> _$RetentionPropertiesToJson(RetentionProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MagneticStoreRetentionPeriodInDays',
      instance.magneticStoreRetentionPeriodInDays);
  writeNotNull('MemoryStoreRetentionPeriodInHours',
      instance.memoryStoreRetentionPeriodInHours);
  return val;
}

Table _$TableFromJson(Map<String, dynamic> json) {
  return Table(
    arn: json['Arn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    databaseName: json['DatabaseName'] as String,
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    retentionProperties: json['RetentionProperties'] == null
        ? null
        : RetentionProperties.fromJson(
            json['RetentionProperties'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    tableStatus:
        _$enumDecodeNullable(_$TableStatusEnumMap, json['TableStatus']),
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

const _$TableStatusEnumMap = {
  TableStatus.active: 'ACTIVE',
  TableStatus.deleting: 'DELETING',
};

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

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDatabaseResponse _$UpdateDatabaseResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDatabaseResponse(
    database: json['Database'] == null
        ? null
        : Database.fromJson(json['Database'] as Map<String, dynamic>),
  );
}

UpdateTableResponse _$UpdateTableResponseFromJson(Map<String, dynamic> json) {
  return UpdateTableResponse(
    table: json['Table'] == null
        ? null
        : Table.fromJson(json['Table'] as Map<String, dynamic>),
  );
}
