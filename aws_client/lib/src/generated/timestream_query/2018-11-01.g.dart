// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelQueryResponse _$CancelQueryResponseFromJson(Map<String, dynamic> json) {
  return CancelQueryResponse(
    cancellationMessage: json['CancellationMessage'] as String,
  );
}

ColumnInfo _$ColumnInfoFromJson(Map<String, dynamic> json) {
  return ColumnInfo(
    type: json['Type'] == null
        ? null
        : Type.fromJson(json['Type'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return Datum(
    arrayValue: (json['ArrayValue'] as List)
        ?.map(
            (e) => e == null ? null : Datum.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nullValue: json['NullValue'] as bool,
    rowValue: json['RowValue'] == null
        ? null
        : Row.fromJson(json['RowValue'] as Map<String, dynamic>),
    scalarValue: json['ScalarValue'] as String,
    timeSeriesValue: (json['TimeSeriesValue'] as List)
        ?.map((e) => e == null
            ? null
            : TimeSeriesDataPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    address: json['Address'] as String,
    cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
  );
}

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) {
  return QueryResponse(
    columnInfo: (json['ColumnInfo'] as List)
        ?.map((e) =>
            e == null ? null : ColumnInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    queryId: json['QueryId'] as String,
    rows: (json['Rows'] as List)
        ?.map((e) => e == null ? null : Row.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    queryStatus: json['QueryStatus'] == null
        ? null
        : QueryStatus.fromJson(json['QueryStatus'] as Map<String, dynamic>),
  );
}

QueryStatus _$QueryStatusFromJson(Map<String, dynamic> json) {
  return QueryStatus(
    cumulativeBytesMetered: json['CumulativeBytesMetered'] as int,
    cumulativeBytesScanned: json['CumulativeBytesScanned'] as int,
    progressPercentage: (json['ProgressPercentage'] as num)?.toDouble(),
  );
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return Row(
    data: (json['Data'] as List)
        ?.map(
            (e) => e == null ? null : Datum.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TimeSeriesDataPoint _$TimeSeriesDataPointFromJson(Map<String, dynamic> json) {
  return TimeSeriesDataPoint(
    time: json['Time'] as String,
    value: json['Value'] == null
        ? null
        : Datum.fromJson(json['Value'] as Map<String, dynamic>),
  );
}

Type _$TypeFromJson(Map<String, dynamic> json) {
  return Type(
    arrayColumnInfo: json['ArrayColumnInfo'] == null
        ? null
        : ColumnInfo.fromJson(json['ArrayColumnInfo'] as Map<String, dynamic>),
    rowColumnInfo: (json['RowColumnInfo'] as List)
        ?.map((e) =>
            e == null ? null : ColumnInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scalarType: _$enumDecodeNullable(_$ScalarTypeEnumMap, json['ScalarType']),
    timeSeriesMeasureValueColumnInfo:
        json['TimeSeriesMeasureValueColumnInfo'] == null
            ? null
            : ColumnInfo.fromJson(json['TimeSeriesMeasureValueColumnInfo']
                as Map<String, dynamic>),
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

const _$ScalarTypeEnumMap = {
  ScalarType.varchar: 'VARCHAR',
  ScalarType.boolean: 'BOOLEAN',
  ScalarType.bigint: 'BIGINT',
  ScalarType.double: 'DOUBLE',
  ScalarType.timestamp: 'TIMESTAMP',
  ScalarType.date: 'DATE',
  ScalarType.time: 'TIME',
  ScalarType.intervalDayToSecond: 'INTERVAL_DAY_TO_SECOND',
  ScalarType.intervalYearToMonth: 'INTERVAL_YEAR_TO_MONTH',
  ScalarType.unknown: 'UNKNOWN',
  ScalarType.integer: 'INTEGER',
};
