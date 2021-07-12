// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

///
class TimestreamQuery {
  final _s.JsonProtocol _protocol;
  TimestreamQuery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'query.timestream',
            signingName: 'timestream',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels a query that has been issued. Cancellation is guaranteed only if
  /// the query has not completed execution before the cancellation request was
  /// issued. Because cancellation is an idempotent operation, subsequent
  /// cancellation requests will return a <code>CancellationMessage</code>,
  /// indicating that the query has already been canceled.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [queryId] :
  /// The id of the query that needs to be cancelled. <code>QueryID</code> is
  /// returned as part of QueryResult.
  Future<CancelQueryResponse> cancelQuery({
    required String queryId,
  }) async {
    ArgumentError.checkNotNull(queryId, 'queryId');
    _s.validateStringLength(
      'queryId',
      queryId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.CancelQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryId': queryId,
      },
    );

    return CancelQueryResponse.fromJson(jsonResponse.body);
  }

  /// DescribeEndpoints returns a list of available endpoints to make Timestream
  /// API calls against. This API is available through both Write and Query.
  ///
  /// Because Timestream’s SDKs are designed to transparently work with the
  /// service’s architecture, including the management and mapping of the
  /// service endpoints, <i>it is not recommended that you use this API
  /// unless</i>:
  ///
  /// <ul>
  /// <li>
  /// Your application uses a programming language that does not yet have SDK
  /// support
  /// </li>
  /// <li>
  /// You require better control over the client-side implementation
  /// </li>
  /// </ul>
  /// For detailed information on how to use DescribeEndpoints, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/Using-API.endpoint-discovery.html">The
  /// Endpoint Discovery Pattern and REST APIs</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  Future<DescribeEndpointsResponse> describeEndpoints() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DescribeEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Query is a synchronous operation that enables you to execute a query.
  /// Query will timeout after 60 seconds. You must update the default timeout
  /// in the SDK to support a timeout of 60 seconds. The result set will be
  /// truncated to 1MB. Service quotas apply. For more information, see Quotas
  /// in the Timestream Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [QueryExecutionException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [queryString] :
  /// The query to be executed by Timestream.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify when you make a Query request. Providing a
  /// <code>ClientToken</code> makes the call to <code>Query</code> idempotent,
  /// meaning that multiple identical calls have the same effect as one single
  /// call.
  ///
  /// Your query request will fail in the following cases:
  ///
  /// <ul>
  /// <li>
  /// If you submit a request with the same client token outside the 5-minute
  /// idepotency window.
  /// </li>
  /// <li>
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 5-minute idempotency window.
  /// </li>
  /// </ul>
  /// After 4 hours, any request with the same client token is treated as a new
  /// request.
  ///
  /// Parameter [maxRows] :
  /// The total number of rows to return in the output. If the total number of
  /// rows available is more than the value specified, a NextToken is provided
  /// in the command's output. To resume pagination, provide the NextToken value
  /// in the starting-token argument of a subsequent command.
  ///
  /// Parameter [nextToken] :
  /// A pagination token passed to get a set of results.
  Future<QueryResponse> query({
    required String queryString,
    String? clientToken,
    int? maxRows,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      32,
      128,
    );
    _s.validateNumRange(
      'maxRows',
      maxRows,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.Query'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryString': queryString,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (maxRows != null) 'MaxRows': maxRows,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return QueryResponse.fromJson(jsonResponse.body);
  }
}

class CancelQueryResponse {
  /// A <code>CancellationMessage</code> is returned when a
  /// <code>CancelQuery</code> request for the query specified by
  /// <code>QueryId</code> has already been issued.
  final String? cancellationMessage;

  CancelQueryResponse({
    this.cancellationMessage,
  });

  factory CancelQueryResponse.fromJson(Map<String, dynamic> json) {
    return CancelQueryResponse(
      cancellationMessage: json['CancellationMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationMessage = this.cancellationMessage;
    return {
      if (cancellationMessage != null)
        'CancellationMessage': cancellationMessage,
    };
  }
}

/// Contains the meta data for query results such as the column names, data
/// types, and other attributes.
class ColumnInfo {
  /// The data type of the result set column. The data type can be a scalar or
  /// complex. Scalar data types are integers, strings, doubles, booleans, and
  /// others. Complex data types are types such as arrays, rows, and others.
  final Type type;

  /// The name of the result set column. The name of the result set is available
  /// for columns of all data types except for arrays.
  final String? name;

  ColumnInfo({
    required this.type,
    this.name,
  });

  factory ColumnInfo.fromJson(Map<String, dynamic> json) {
    return ColumnInfo(
      type: Type.fromJson(json['Type'] as Map<String, dynamic>),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final name = this.name;
    return {
      'Type': type,
      if (name != null) 'Name': name,
    };
  }
}

/// Datum represents a single data point in a query result.
class Datum {
  /// Indicates if the data point is an array.
  final List<Datum>? arrayValue;

  /// Indicates if the data point is null.
  final bool? nullValue;

  /// Indicates if the data point is a row.
  final Row? rowValue;

  /// Indicates if the data point is a scalar value such as integer, string,
  /// double, or boolean.
  final String? scalarValue;

  /// Indicates if the data point is of timeseries data type.
  final List<TimeSeriesDataPoint>? timeSeriesValue;

  Datum({
    this.arrayValue,
    this.nullValue,
    this.rowValue,
    this.scalarValue,
    this.timeSeriesValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      arrayValue: (json['ArrayValue'] as List?)
          ?.whereNotNull()
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nullValue: json['NullValue'] as bool?,
      rowValue: json['RowValue'] != null
          ? Row.fromJson(json['RowValue'] as Map<String, dynamic>)
          : null,
      scalarValue: json['ScalarValue'] as String?,
      timeSeriesValue: (json['TimeSeriesValue'] as List?)
          ?.whereNotNull()
          .map((e) => TimeSeriesDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arrayValue = this.arrayValue;
    final nullValue = this.nullValue;
    final rowValue = this.rowValue;
    final scalarValue = this.scalarValue;
    final timeSeriesValue = this.timeSeriesValue;
    return {
      if (arrayValue != null) 'ArrayValue': arrayValue,
      if (nullValue != null) 'NullValue': nullValue,
      if (rowValue != null) 'RowValue': rowValue,
      if (scalarValue != null) 'ScalarValue': scalarValue,
      if (timeSeriesValue != null) 'TimeSeriesValue': timeSeriesValue,
    };
  }
}

class DescribeEndpointsResponse {
  /// An <code>Endpoints</code> object is returned when a
  /// <code>DescribeEndpoints</code> request is made.
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    required this.endpoints,
  });

  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointsResponse(
      endpoints: (json['Endpoints'] as List)
          .whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      'Endpoints': endpoints,
    };
  }
}

/// Represents an available endpoint against which to make API calls agaisnt, as
/// well as the TTL for that endpoint.
class Endpoint {
  /// An endpoint address.
  final String address;

  /// The TTL for the endpoint, in minutes.
  final int cachePeriodInMinutes;

  Endpoint({
    required this.address,
    required this.cachePeriodInMinutes,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      address: json['Address'] as String,
      cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final cachePeriodInMinutes = this.cachePeriodInMinutes;
    return {
      'Address': address,
      'CachePeriodInMinutes': cachePeriodInMinutes,
    };
  }
}

class QueryResponse {
  /// The column data types of the returned result set.
  final List<ColumnInfo> columnInfo;

  /// A unique ID for the given query.
  final String queryId;

  /// The result set rows returned by the query.
  final List<Row> rows;

  /// A pagination token that can be used again on a <code>Query</code> call to
  /// get the next set of results.
  final String? nextToken;

  /// Information about the status of the query, including progress and bytes
  /// scannned.
  final QueryStatus? queryStatus;

  QueryResponse({
    required this.columnInfo,
    required this.queryId,
    required this.rows,
    this.nextToken,
    this.queryStatus,
  });

  factory QueryResponse.fromJson(Map<String, dynamic> json) {
    return QueryResponse(
      columnInfo: (json['ColumnInfo'] as List)
          .whereNotNull()
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryId: json['QueryId'] as String,
      rows: (json['Rows'] as List)
          .whereNotNull()
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      queryStatus: json['QueryStatus'] != null
          ? QueryStatus.fromJson(json['QueryStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final columnInfo = this.columnInfo;
    final queryId = this.queryId;
    final rows = this.rows;
    final nextToken = this.nextToken;
    final queryStatus = this.queryStatus;
    return {
      'ColumnInfo': columnInfo,
      'QueryId': queryId,
      'Rows': rows,
      if (nextToken != null) 'NextToken': nextToken,
      if (queryStatus != null) 'QueryStatus': queryStatus,
    };
  }
}

/// Information about the status of the query, including progress and bytes
/// scannned.
class QueryStatus {
  /// The amount of data scanned by the query in bytes that you will be charged
  /// for. This is a cumulative sum and represents the total amount of data that
  /// you will be charged for since the query was started. The charge is applied
  /// only once and is either applied when the query completes execution or when
  /// the query is cancelled.
  final int? cumulativeBytesMetered;

  /// The amount of data scanned by the query in bytes. This is a cumulative sum
  /// and represents the total amount of bytes scanned since the query was
  /// started.
  final int? cumulativeBytesScanned;

  /// The progress of the query, expressed as a percentage.
  final double? progressPercentage;

  QueryStatus({
    this.cumulativeBytesMetered,
    this.cumulativeBytesScanned,
    this.progressPercentage,
  });

  factory QueryStatus.fromJson(Map<String, dynamic> json) {
    return QueryStatus(
      cumulativeBytesMetered: json['CumulativeBytesMetered'] as int?,
      cumulativeBytesScanned: json['CumulativeBytesScanned'] as int?,
      progressPercentage: json['ProgressPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final cumulativeBytesMetered = this.cumulativeBytesMetered;
    final cumulativeBytesScanned = this.cumulativeBytesScanned;
    final progressPercentage = this.progressPercentage;
    return {
      if (cumulativeBytesMetered != null)
        'CumulativeBytesMetered': cumulativeBytesMetered,
      if (cumulativeBytesScanned != null)
        'CumulativeBytesScanned': cumulativeBytesScanned,
      if (progressPercentage != null) 'ProgressPercentage': progressPercentage,
    };
  }
}

/// Represents a single row in the query results.
class Row {
  /// List of data points in a single row of the result set.
  final List<Datum> data;

  Row({
    required this.data,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      data: (json['Data'] as List)
          .whereNotNull()
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      'Data': data,
    };
  }
}

enum ScalarType {
  varchar,
  boolean,
  bigint,
  double,
  timestamp,
  date,
  time,
  intervalDayToSecond,
  intervalYearToMonth,
  unknown,
  integer,
}

extension on ScalarType {
  String toValue() {
    switch (this) {
      case ScalarType.varchar:
        return 'VARCHAR';
      case ScalarType.boolean:
        return 'BOOLEAN';
      case ScalarType.bigint:
        return 'BIGINT';
      case ScalarType.double:
        return 'DOUBLE';
      case ScalarType.timestamp:
        return 'TIMESTAMP';
      case ScalarType.date:
        return 'DATE';
      case ScalarType.time:
        return 'TIME';
      case ScalarType.intervalDayToSecond:
        return 'INTERVAL_DAY_TO_SECOND';
      case ScalarType.intervalYearToMonth:
        return 'INTERVAL_YEAR_TO_MONTH';
      case ScalarType.unknown:
        return 'UNKNOWN';
      case ScalarType.integer:
        return 'INTEGER';
    }
  }
}

extension on String {
  ScalarType toScalarType() {
    switch (this) {
      case 'VARCHAR':
        return ScalarType.varchar;
      case 'BOOLEAN':
        return ScalarType.boolean;
      case 'BIGINT':
        return ScalarType.bigint;
      case 'DOUBLE':
        return ScalarType.double;
      case 'TIMESTAMP':
        return ScalarType.timestamp;
      case 'DATE':
        return ScalarType.date;
      case 'TIME':
        return ScalarType.time;
      case 'INTERVAL_DAY_TO_SECOND':
        return ScalarType.intervalDayToSecond;
      case 'INTERVAL_YEAR_TO_MONTH':
        return ScalarType.intervalYearToMonth;
      case 'UNKNOWN':
        return ScalarType.unknown;
      case 'INTEGER':
        return ScalarType.integer;
    }
    throw Exception('$this is not known in enum ScalarType');
  }
}

/// The timeseries datatype represents the values of a measure over time. A time
/// series is an array of rows of timestamps and measure values, with rows
/// sorted in ascending order of time. A TimeSeriesDataPoint is a single data
/// point in the timeseries. It represents a tuple of (time, measure value) in a
/// timeseries.
class TimeSeriesDataPoint {
  /// The timestamp when the measure value was collected.
  final String time;

  /// The measure value for the data point.
  final Datum value;

  TimeSeriesDataPoint({
    required this.time,
    required this.value,
  });

  factory TimeSeriesDataPoint.fromJson(Map<String, dynamic> json) {
    return TimeSeriesDataPoint(
      time: json['Time'] as String,
      value: Datum.fromJson(json['Value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    final value = this.value;
    return {
      'Time': time,
      'Value': value,
    };
  }
}

/// Contains the data type of a column in a query result set. The data type can
/// be scalar or complex. The supported scalar data types are integers, boolean,
/// string, double, timestamp, date, time, and intervals. The supported complex
/// data types are arrays, rows, and timeseries.
class Type {
  /// Indicates if the column is an array.
  final ColumnInfo? arrayColumnInfo;

  /// Indicates if the column is a row.
  final List<ColumnInfo>? rowColumnInfo;

  /// Indicates if the column is of type string, integer, boolean, double,
  /// timestamp, date, time.
  final ScalarType? scalarType;

  /// Indicates if the column is a timeseries data type.
  final ColumnInfo? timeSeriesMeasureValueColumnInfo;

  Type({
    this.arrayColumnInfo,
    this.rowColumnInfo,
    this.scalarType,
    this.timeSeriesMeasureValueColumnInfo,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      arrayColumnInfo: json['ArrayColumnInfo'] != null
          ? ColumnInfo.fromJson(json['ArrayColumnInfo'] as Map<String, dynamic>)
          : null,
      rowColumnInfo: (json['RowColumnInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalarType: (json['ScalarType'] as String?)?.toScalarType(),
      timeSeriesMeasureValueColumnInfo:
          json['TimeSeriesMeasureValueColumnInfo'] != null
              ? ColumnInfo.fromJson(json['TimeSeriesMeasureValueColumnInfo']
                  as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arrayColumnInfo = this.arrayColumnInfo;
    final rowColumnInfo = this.rowColumnInfo;
    final scalarType = this.scalarType;
    final timeSeriesMeasureValueColumnInfo =
        this.timeSeriesMeasureValueColumnInfo;
    return {
      if (arrayColumnInfo != null) 'ArrayColumnInfo': arrayColumnInfo,
      if (rowColumnInfo != null) 'RowColumnInfo': rowColumnInfo,
      if (scalarType != null) 'ScalarType': scalarType.toValue(),
      if (timeSeriesMeasureValueColumnInfo != null)
        'TimeSeriesMeasureValueColumnInfo': timeSeriesMeasureValueColumnInfo,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidEndpointException extends _s.GenericAwsException {
  InvalidEndpointException({String? type, String? message})
      : super(type: type, code: 'InvalidEndpointException', message: message);
}

class QueryExecutionException extends _s.GenericAwsException {
  QueryExecutionException({String? type, String? message})
      : super(type: type, code: 'QueryExecutionException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidEndpointException': (type, message) =>
      InvalidEndpointException(type: type, message: message),
  'QueryExecutionException': (type, message) =>
      QueryExecutionException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
