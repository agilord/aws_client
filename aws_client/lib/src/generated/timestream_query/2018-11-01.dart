// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2018-11-01.g.dart';

///
class TimestreamQuery {
  final _s.JsonProtocol _protocol;
  TimestreamQuery({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String queryId,
  }) async {
    ArgumentError.checkNotNull(queryId, 'queryId');
    _s.validateStringLength(
      'queryId',
      queryId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'queryId',
      queryId,
      r'''[a-zA-Z0-9]+''',
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
    @_s.required String queryString,
    String clientToken,
    int maxRows,
    String nextToken,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelQueryResponse {
  /// A <code>CancellationMessage</code> is returned when a
  /// <code>CancelQuery</code> request for the query specified by
  /// <code>QueryId</code> has already been issued.
  @_s.JsonKey(name: 'CancellationMessage')
  final String cancellationMessage;

  CancelQueryResponse({
    this.cancellationMessage,
  });
  factory CancelQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelQueryResponseFromJson(json);
}

/// Contains the meta data for query results such as the column names, data
/// types, and other attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnInfo {
  /// The data type of the result set column. The data type can be a scalar or
  /// complex. Scalar data types are integers, strings, doubles, booleans, and
  /// others. Complex data types are types such as arrays, rows, and others.
  @_s.JsonKey(name: 'Type')
  final Type type;

  /// The name of the result set column. The name of the result set is available
  /// for columns of all data types except for arrays.
  @_s.JsonKey(name: 'Name')
  final String name;

  ColumnInfo({
    @_s.required this.type,
    this.name,
  });
  factory ColumnInfo.fromJson(Map<String, dynamic> json) =>
      _$ColumnInfoFromJson(json);
}

/// Datum represents a single data point in a query result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Datum {
  /// Indicates if the data point is an array.
  @_s.JsonKey(name: 'ArrayValue')
  final List<Datum> arrayValue;

  /// Indicates if the data point is null.
  @_s.JsonKey(name: 'NullValue')
  final bool nullValue;

  /// Indicates if the data point is a row.
  @_s.JsonKey(name: 'RowValue')
  final Row rowValue;

  /// Indicates if the data point is a scalar value such as integer, string,
  /// double, or boolean.
  @_s.JsonKey(name: 'ScalarValue')
  final String scalarValue;

  /// Indicates if the data point is of timeseries data type.
  @_s.JsonKey(name: 'TimeSeriesValue')
  final List<TimeSeriesDataPoint> timeSeriesValue;

  Datum({
    this.arrayValue,
    this.nullValue,
    this.rowValue,
    this.scalarValue,
    this.timeSeriesValue,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointsResponse {
  /// An <code>Endpoints</code> object is returned when a
  /// <code>DescribeEndpoints</code> request is made.
  @_s.JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    @_s.required this.endpoints,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);
}

/// Represents an available endpoint against which to make API calls agaisnt, as
/// well as the TTL for that endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// An endpoint address.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The TTL for the endpoint, in minutes.
  @_s.JsonKey(name: 'CachePeriodInMinutes')
  final int cachePeriodInMinutes;

  Endpoint({
    @_s.required this.address,
    @_s.required this.cachePeriodInMinutes,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryResponse {
  /// The column data types of the returned result set.
  @_s.JsonKey(name: 'ColumnInfo')
  final List<ColumnInfo> columnInfo;

  /// A unique ID for the given query.
  @_s.JsonKey(name: 'QueryId')
  final String queryId;

  /// The result set rows returned by the query.
  @_s.JsonKey(name: 'Rows')
  final List<Row> rows;

  /// A pagination token that can be used again on a <code>Query</code> call to
  /// get the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the status of the query, including progress and bytes
  /// scannned.
  @_s.JsonKey(name: 'QueryStatus')
  final QueryStatus queryStatus;

  QueryResponse({
    @_s.required this.columnInfo,
    @_s.required this.queryId,
    @_s.required this.rows,
    this.nextToken,
    this.queryStatus,
  });
  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);
}

/// Information about the status of the query, including progress and bytes
/// scannned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryStatus {
  /// The amount of data scanned by the query in bytes that you will be charged
  /// for. This is a cumulative sum and represents the total amount of data that
  /// you will be charged for since the query was started. The charge is applied
  /// only once and is either applied when the query completes execution or when
  /// the query is cancelled.
  @_s.JsonKey(name: 'CumulativeBytesMetered')
  final int cumulativeBytesMetered;

  /// The amount of data scanned by the query in bytes. This is a cumulative sum
  /// and represents the total amount of bytes scanned since the query was
  /// started.
  @_s.JsonKey(name: 'CumulativeBytesScanned')
  final int cumulativeBytesScanned;

  /// The progress of the query, expressed as a percentage.
  @_s.JsonKey(name: 'ProgressPercentage')
  final double progressPercentage;

  QueryStatus({
    this.cumulativeBytesMetered,
    this.cumulativeBytesScanned,
    this.progressPercentage,
  });
  factory QueryStatus.fromJson(Map<String, dynamic> json) =>
      _$QueryStatusFromJson(json);
}

/// Represents a single row in the query results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Row {
  /// List of data points in a single row of the result set.
  @_s.JsonKey(name: 'Data')
  final List<Datum> data;

  Row({
    @_s.required this.data,
  });
  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

enum ScalarType {
  @_s.JsonValue('VARCHAR')
  varchar,
  @_s.JsonValue('BOOLEAN')
  boolean,
  @_s.JsonValue('BIGINT')
  bigint,
  @_s.JsonValue('DOUBLE')
  double,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
  @_s.JsonValue('DATE')
  date,
  @_s.JsonValue('TIME')
  time,
  @_s.JsonValue('INTERVAL_DAY_TO_SECOND')
  intervalDayToSecond,
  @_s.JsonValue('INTERVAL_YEAR_TO_MONTH')
  intervalYearToMonth,
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('INTEGER')
  integer,
}

/// The timeseries datatype represents the values of a measure over time. A time
/// series is an array of rows of timestamps and measure values, with rows
/// sorted in ascending order of time. A TimeSeriesDataPoint is a single data
/// point in the timeseries. It represents a tuple of (time, measure value) in a
/// timeseries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeSeriesDataPoint {
  /// The timestamp when the measure value was collected.
  @_s.JsonKey(name: 'Time')
  final String time;

  /// The measure value for the data point.
  @_s.JsonKey(name: 'Value')
  final Datum value;

  TimeSeriesDataPoint({
    @_s.required this.time,
    @_s.required this.value,
  });
  factory TimeSeriesDataPoint.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesDataPointFromJson(json);
}

/// Contains the data type of a column in a query result set. The data type can
/// be scalar or complex. The supported scalar data types are integers, boolean,
/// string, double, timestamp, date, time, and intervals. The supported complex
/// data types are arrays, rows, and timeseries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Type {
  /// Indicates if the column is an array.
  @_s.JsonKey(name: 'ArrayColumnInfo')
  final ColumnInfo arrayColumnInfo;

  /// Indicates if the column is a row.
  @_s.JsonKey(name: 'RowColumnInfo')
  final List<ColumnInfo> rowColumnInfo;

  /// Indicates if the column is of type string, integer, boolean, double,
  /// timestamp, date, time.
  @_s.JsonKey(name: 'ScalarType')
  final ScalarType scalarType;

  /// Indicates if the column is a timeseries data type.
  @_s.JsonKey(name: 'TimeSeriesMeasureValueColumnInfo')
  final ColumnInfo timeSeriesMeasureValueColumnInfo;

  Type({
    this.arrayColumnInfo,
    this.rowColumnInfo,
    this.scalarType,
    this.timeSeriesMeasureValueColumnInfo,
  });
  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidEndpointException extends _s.GenericAwsException {
  InvalidEndpointException({String type, String message})
      : super(type: type, code: 'InvalidEndpointException', message: message);
}

class QueryExecutionException extends _s.GenericAwsException {
  QueryExecutionException({String type, String message})
      : super(type: type, code: 'QueryExecutionException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
