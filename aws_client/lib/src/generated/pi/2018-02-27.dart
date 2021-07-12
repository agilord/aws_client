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

/// Amazon RDS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running DB
/// instance. The guide provides detailed information about Performance Insights
/// data types, parameters and errors.
class PI {
  final _s.JsonProtocol _protocol;
  PI({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pi',
            signingName: 'pi',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// For a specific time period, retrieve the top <code>N</code> dimension keys
  /// for a metric.
  /// <note>
  /// Each response element returns a maximum of 500 bytes. For larger elements,
  /// such as SQL statements, only the first 500 bytes are returned.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifying the end of the requested time series data.
  /// The value specified is <i>exclusive</i>, which means that data points less
  /// than (but not equal to) <code>EndTime</code> are returned.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [groupBy] :
  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights returns all
  /// dimensions within this group, unless you provide the names of specific
  /// dimensions within this group. You can also request that Performance
  /// Insights return a limited number of values for a dimension.
  ///
  /// Parameter [identifier] :
  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>
  ///
  /// Parameter [metric] :
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for
  /// the database engine.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of
  /// active sessions is greater than the internal threshold, Performance
  /// Insights samples the active sessions, with <code>db.load.avg</code>
  /// showing the scaled values, <code>db.sampledload.avg</code> showing the raw
  /// values, and <code>db.sampledload.avg</code> less than
  /// <code>db.load.avg</code>. For most use cases, you can query
  /// <code>db.load.avg</code> only.
  ///
  /// Parameter [serviceType] :
  /// The AWS service for which Performance Insights will return metrics. The
  /// only valid value for <i>ServiceType</i> is <code>RDS</code>.
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// data. You must specify a <code>StartTime</code> within the past 7 days.
  /// The value specified is <i>inclusive</i>, which means that data points
  /// equal to or greater than <code>StartTime</code> are returned.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [filter] :
  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> or <code>Partition</code> parameters.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [partitionBy] :
  /// For each dimension specified in <code>GroupBy</code>, specify a secondary
  /// dimension to further subdivide the partition keys in the response.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights chooses a value for you, with a goal of returning roughly 100-200
  /// data points in the response.
  Future<DescribeDimensionKeysResponse> describeDimensionKeys({
    required DateTime endTime,
    required DimensionGroup groupBy,
    required String identifier,
    required String metric,
    required ServiceType serviceType,
    required DateTime startTime,
    Map<String, String>? filter,
    int? maxResults,
    String? nextToken,
    DimensionGroup? partitionBy,
    int? periodInSeconds,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(groupBy, 'groupBy');
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(metric, 'metric');
    _s.validateStringLength(
      'metric',
      metric,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceType, 'serviceType');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      8192,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.DescribeDimensionKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'GroupBy': groupBy,
        'Identifier': identifier,
        'Metric': metric,
        'ServiceType': serviceType.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (partitionBy != null) 'PartitionBy': partitionBy,
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return DescribeDimensionKeysResponse.fromJson(jsonResponse.body);
  }

  /// Get the attributes of the specified dimension group for a DB instance or
  /// data source. For example, if you specify a SQL ID,
  /// <code>GetDimensionKeyDetails</code> retrieves the full text of the
  /// dimension <code>db.sql.statement</code> associated with this ID. This
  /// operation is useful because <code>GetResourceMetrics</code> and
  /// <code>DescribeDimensionKeys</code> don't support retrieval of large SQL
  /// statement text.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [group] :
  /// The name of the dimension group. The only valid value is
  /// <code>db.sql</code>. Performance Insights searches the specified group for
  /// the dimension group ID.
  ///
  /// Parameter [groupIdentifier] :
  /// The ID of the dimension group from which to retrieve dimension details.
  /// For dimension group <code>db.sql</code>, the group ID is
  /// <code>db.sql.id</code>.
  ///
  /// Parameter [identifier] :
  /// The ID for a data source from which to gather dimension data. This ID must
  /// be immutable and unique within an AWS Region. When a DB instance is the
  /// data source, specify its <code>DbiResourceId</code> value. For example,
  /// specify <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The AWS service for which Performance Insights returns data. The only
  /// valid value is <code>RDS</code>.
  ///
  /// Parameter [requestedDimensions] :
  /// A list of dimensions to retrieve the detail data for within the given
  /// dimension group. For the dimension group <code>db.sql</code>, specify
  /// either the full dimension name <code>db.sql.statement</code> or the short
  /// dimension name <code>statement</code>. If you don't specify this
  /// parameter, Performance Insights returns all dimension data within the
  /// specified dimension group.
  Future<GetDimensionKeyDetailsResponse> getDimensionKeyDetails({
    required String group,
    required String groupIdentifier,
    required String identifier,
    required ServiceType serviceType,
    List<String>? requestedDimensions,
  }) async {
    ArgumentError.checkNotNull(group, 'group');
    _s.validateStringLength(
      'group',
      group,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupIdentifier, 'groupIdentifier');
    _s.validateStringLength(
      'groupIdentifier',
      groupIdentifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceType, 'serviceType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetDimensionKeyDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Group': group,
        'GroupIdentifier': groupIdentifier,
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
        if (requestedDimensions != null)
          'RequestedDimensions': requestedDimensions,
      },
    );

    return GetDimensionKeyDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve Performance Insights metrics for a set of data sources, over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide aggregation and filtering criteria for each group.
  /// <note>
  /// Each response element returns a maximum of 500 bytes. For larger elements,
  /// such as SQL statements, only the first 500 bytes are returned.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifying the end of the requested time series data.
  /// The value specified is <i>exclusive</i> - data points less than (but not
  /// equal to) <code>EndTime</code> will be returned.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [identifier] :
  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>.
  ///
  /// Parameter [metricQueries] :
  /// An array of one or more queries to perform. Each query must specify a
  /// Performance Insights metric, and can optionally specify aggregation and
  /// filtering criteria.
  ///
  /// Parameter [serviceType] :
  /// The AWS service for which Performance Insights returns metrics. The only
  /// valid value for <i>ServiceType</i> is <code>RDS</code>.
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// data. You can't specify a <code>StartTime</code> that's earlier than 7
  /// days ago. The value specified is <i>inclusive</i> - data points equal to
  /// or greater than <code>StartTime</code> will be returned.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights will choose a value for you, with a goal of returning roughly
  /// 100-200 data points in the response.
  Future<GetResourceMetricsResponse> getResourceMetrics({
    required DateTime endTime,
    required String identifier,
    required List<MetricQuery> metricQueries,
    required ServiceType serviceType,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
    int? periodInSeconds,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricQueries, 'metricQueries');
    ArgumentError.checkNotNull(serviceType, 'serviceType');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      8192,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'Identifier': identifier,
        'MetricQueries': metricQueries,
        'ServiceType': serviceType.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return GetResourceMetricsResponse.fromJson(jsonResponse.body);
  }
}

/// A timestamp, and a single numerical value, which together represent a
/// measurement at a particular point in time.
class DataPoint {
  /// The time, in epoch format, associated with a particular <code>Value</code>.
  final DateTime timestamp;

  /// The actual value associated with a particular <code>Timestamp</code>.
  final double value;

  DataPoint({
    required this.timestamp,
    required this.value,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
      value: json['Value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      'Timestamp': unixTimestampToJson(timestamp),
      'Value': value,
    };
  }
}

class DescribeDimensionKeysResponse {
  /// The end time for the returned dimension keys, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  final DateTime? alignedEndTime;

  /// The start time for the returned dimension keys, after alignment to a
  /// granular boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  final DateTime? alignedStartTime;

  /// The dimension keys that were requested.
  final List<DimensionKeyDescription>? keys;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  final String? nextToken;

  /// If <code>PartitionBy</code> was present in the request,
  /// <code>PartitionKeys</code> contains the breakdown of dimension keys by the
  /// specified partitions.
  final List<ResponsePartitionKey>? partitionKeys;

  DescribeDimensionKeysResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.keys,
    this.nextToken,
    this.partitionKeys,
  });

  factory DescribeDimensionKeysResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDimensionKeysResponse(
      alignedEndTime: timeStampFromJson(json['AlignedEndTime']),
      alignedStartTime: timeStampFromJson(json['AlignedStartTime']),
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DimensionKeyDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => ResponsePartitionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alignedEndTime = this.alignedEndTime;
    final alignedStartTime = this.alignedStartTime;
    final keys = this.keys;
    final nextToken = this.nextToken;
    final partitionKeys = this.partitionKeys;
    return {
      if (alignedEndTime != null)
        'AlignedEndTime': unixTimestampToJson(alignedEndTime),
      if (alignedStartTime != null)
        'AlignedStartTime': unixTimestampToJson(alignedStartTime),
      if (keys != null) 'Keys': keys,
      if (nextToken != null) 'NextToken': nextToken,
      if (partitionKeys != null) 'PartitionKeys': partitionKeys,
    };
  }
}

enum DetailStatus {
  available,
  processing,
  unavailable,
}

extension on DetailStatus {
  String toValue() {
    switch (this) {
      case DetailStatus.available:
        return 'AVAILABLE';
      case DetailStatus.processing:
        return 'PROCESSING';
      case DetailStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension on String {
  DetailStatus toDetailStatus() {
    switch (this) {
      case 'AVAILABLE':
        return DetailStatus.available;
      case 'PROCESSING':
        return DetailStatus.processing;
      case 'UNAVAILABLE':
        return DetailStatus.unavailable;
    }
    throw Exception('$this is not known in enum DetailStatus');
  }
}

/// A logical grouping of Performance Insights metrics for a related subject
/// area. For example, the <code>db.sql</code> dimension group consists of the
/// following dimensions: <code>db.sql.id</code>, <code>db.sql.db_id</code>,
/// <code>db.sql.statement</code>, and <code>db.sql.tokenized_id</code>.
/// <note>
/// Each response element returns a maximum of 500 bytes. For larger elements,
/// such as SQL statements, only the first 500 bytes are returned.
/// </note>
class DimensionGroup {
  /// The name of the dimension group. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>db</code> - The name of the database to which the client is connected
  /// (only Aurora PostgreSQL, RDS PostgreSQL, Aurora MySQL, RDS MySQL, and
  /// MariaDB)
  /// </li>
  /// <li>
  /// <code>db.application</code> - The name of the application that is connected
  /// to the database (only Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.host</code> - The host name of the connected client (all engines)
  /// </li>
  /// <li>
  /// <code>db.session_type</code> - The type of the current session (only Aurora
  /// PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.sql</code> - The SQL that is currently executing (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized</code> - The SQL digest (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event</code> - The event for which the database backend is
  /// waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event_type</code> - The type of event for which the database
  /// backend is waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.user</code> - The user logged in to the database (all engines)
  /// </li>
  /// </ul>
  final String group;

  /// A list of specific dimensions from a dimension group. If this parameter is
  /// not present, then it signifies that all of the dimensions in the group were
  /// requested, or are present in the response.
  ///
  /// Valid values for elements in the <code>Dimensions</code> array are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.application.name</code> - The name of the application that is
  /// connected to the database (only Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.host.id</code> - The host ID of the connected client (all engines)
  /// </li>
  /// <li>
  /// <code>db.host.name</code> - The host name of the connected client (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.name</code> - The name of the database to which the client is
  /// connected (only Aurora PostgreSQL, RDS PostgreSQL, Aurora MySQL, RDS MySQL,
  /// and MariaDB)
  /// </li>
  /// <li>
  /// <code>db.session_type.name</code> - The type of the current session (only
  /// Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.sql.id</code> - The SQL ID generated by Performance Insights (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.db_id</code> - The SQL ID generated by the database (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> - The SQL text that is being executed (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.id</code> - The SQL digest ID generated by
  /// Performance Insights (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.db_id</code> - SQL digest ID generated by the
  /// database (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.statement</code> - The SQL digest text (all engines)
  /// </li>
  /// <li>
  /// <code>db.user.id</code> - The ID of the user logged in to the database (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.user.name</code> - The name of the user logged in to the database
  /// (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event.name</code> - The event for which the backend is waiting
  /// (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event.type</code> - The type of event for which the backend is
  /// waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event_type.name</code> - The name of the event type for which
  /// the backend is waiting (all engines)
  /// </li>
  /// </ul>
  final List<String>? dimensions;

  /// The maximum number of items to fetch for this dimension group.
  final int? limit;

  DimensionGroup({
    required this.group,
    this.dimensions,
    this.limit,
  });

  factory DimensionGroup.fromJson(Map<String, dynamic> json) {
    return DimensionGroup(
      group: json['Group'] as String,
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      limit: json['Limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final dimensions = this.dimensions;
    final limit = this.limit;
    return {
      'Group': group,
      if (dimensions != null) 'Dimensions': dimensions,
      if (limit != null) 'Limit': limit,
    };
  }
}

/// An array of descriptions and aggregated values for each dimension within a
/// dimension group.
class DimensionKeyDescription {
  /// A map of name-value pairs for the dimensions in the group.
  final Map<String, String>? dimensions;

  /// If <code>PartitionBy</code> was specified, <code>PartitionKeys</code>
  /// contains the dimensions that were.
  final List<double>? partitions;

  /// The aggregated metric value for the dimension(s), over the requested time
  /// range.
  final double? total;

  DimensionKeyDescription({
    this.dimensions,
    this.partitions,
    this.total,
  });

  factory DimensionKeyDescription.fromJson(Map<String, dynamic> json) {
    return DimensionKeyDescription(
      dimensions: (json['Dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      partitions: (json['Partitions'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      total: json['Total'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final partitions = this.partitions;
    final total = this.total;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (partitions != null) 'Partitions': partitions,
      if (total != null) 'Total': total,
    };
  }
}

/// An object that describes the details for a specified dimension.
class DimensionKeyDetail {
  /// The full name of the dimension. The full name includes the group name and
  /// key name. The only valid value is <code>db.sql.statement</code>.
  final String? dimension;

  /// The status of the dimension detail data. Possible values include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The dimension detail data is ready to be retrieved.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code> - The dimension detail data isn't ready to be
  /// retrieved because more processing time is required. If the requested detail
  /// data for <code>db.sql.statement</code> has the status
  /// <code>PROCESSING</code>, Performance Insights returns the truncated query.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code> - The dimension detail data could not be collected
  /// successfully.
  /// </li>
  /// </ul>
  final DetailStatus? status;

  /// The value of the dimension detail data. For the
  /// <code>db.sql.statement</code> dimension, this value is either the full or
  /// truncated SQL query, depending on the return status.
  final String? value;

  DimensionKeyDetail({
    this.dimension,
    this.status,
    this.value,
  });

  factory DimensionKeyDetail.fromJson(Map<String, dynamic> json) {
    return DimensionKeyDetail(
      dimension: json['Dimension'] as String?,
      status: (json['Status'] as String?)?.toDetailStatus(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final status = this.status;
    final value = this.value;
    return {
      if (dimension != null) 'Dimension': dimension,
      if (status != null) 'Status': status.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

class GetDimensionKeyDetailsResponse {
  /// The details for the requested dimensions.
  final List<DimensionKeyDetail>? dimensions;

  GetDimensionKeyDetailsResponse({
    this.dimensions,
  });

  factory GetDimensionKeyDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetDimensionKeyDetailsResponse(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionKeyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

class GetResourceMetricsResponse {
  /// The end time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  final DateTime? alignedEndTime;

  /// The start time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  final DateTime? alignedStartTime;

  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use a DB instance as a data source, you specify its
  /// <code>DbiResourceId</code> value - for example:
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>
  final String? identifier;

  /// An array of metric results,, where each array element contains all of the
  /// data points for a particular dimension.
  final List<MetricKeyDataPoints>? metricList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  final String? nextToken;

  GetResourceMetricsResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.identifier,
    this.metricList,
    this.nextToken,
  });

  factory GetResourceMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceMetricsResponse(
      alignedEndTime: timeStampFromJson(json['AlignedEndTime']),
      alignedStartTime: timeStampFromJson(json['AlignedStartTime']),
      identifier: json['Identifier'] as String?,
      metricList: (json['MetricList'] as List?)
          ?.whereNotNull()
          .map((e) => MetricKeyDataPoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignedEndTime = this.alignedEndTime;
    final alignedStartTime = this.alignedStartTime;
    final identifier = this.identifier;
    final metricList = this.metricList;
    final nextToken = this.nextToken;
    return {
      if (alignedEndTime != null)
        'AlignedEndTime': unixTimestampToJson(alignedEndTime),
      if (alignedStartTime != null)
        'AlignedStartTime': unixTimestampToJson(alignedStartTime),
      if (identifier != null) 'Identifier': identifier,
      if (metricList != null) 'MetricList': metricList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A time-ordered series of data points, corresponding to a dimension of a
/// Performance Insights metric.
class MetricKeyDataPoints {
  /// An array of timestamp-value pairs, representing measurements over a period
  /// of time.
  final List<DataPoint>? dataPoints;

  /// The dimension(s) to which the data points apply.
  final ResponseResourceMetricKey? key;

  MetricKeyDataPoints({
    this.dataPoints,
    this.key,
  });

  factory MetricKeyDataPoints.fromJson(Map<String, dynamic> json) {
    return MetricKeyDataPoints(
      dataPoints: (json['DataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['Key'] != null
          ? ResponseResourceMetricKey.fromJson(
              json['Key'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataPoints = this.dataPoints;
    final key = this.key;
    return {
      if (dataPoints != null) 'DataPoints': dataPoints,
      if (key != null) 'Key': key,
    };
  }
}

/// A single query to be processed. You must provide the metric to query. If no
/// other parameters are specified, Performance Insights returns all of the data
/// points for that metric. You can optionally request that the data points be
/// aggregated by dimension group ( <code>GroupBy</code>), and return only those
/// data points that match your criteria (<code>Filter</code>).
class MetricQuery {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for the
  /// database engine.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of active
  /// sessions is greater than the internal threshold, Performance Insights
  /// samples the active sessions, with <code>db.load.avg</code> showing the
  /// scaled values, <code>db.sampledload.avg</code> showing the raw values, and
  /// <code>db.sampledload.avg</code> less than <code>db.load.avg</code>. For most
  /// use cases, you can query <code>db.load.avg</code> only.
  final String metric;

  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> parameter.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  final Map<String, String>? filter;

  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights will return
  /// all of the dimensions within that group, unless you provide the names of
  /// specific dimensions within that group. You can also request that Performance
  /// Insights return a limited number of values for a dimension.
  final DimensionGroup? groupBy;

  MetricQuery({
    required this.metric,
    this.filter,
    this.groupBy,
  });

  factory MetricQuery.fromJson(Map<String, dynamic> json) {
    return MetricQuery(
      metric: json['Metric'] as String,
      filter: (json['Filter'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      groupBy: json['GroupBy'] != null
          ? DimensionGroup.fromJson(json['GroupBy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final filter = this.filter;
    final groupBy = this.groupBy;
    return {
      'Metric': metric,
      if (filter != null) 'Filter': filter,
      if (groupBy != null) 'GroupBy': groupBy,
    };
  }
}

/// If <code>PartitionBy</code> was specified in a
/// <code>DescribeDimensionKeys</code> request, the dimensions are returned in
/// an array. Each element in the array specifies one dimension.
class ResponsePartitionKey {
  /// A dimension map that contains the dimension(s) for this partition.
  final Map<String, String> dimensions;

  ResponsePartitionKey({
    required this.dimensions,
  });

  factory ResponsePartitionKey.fromJson(Map<String, dynamic> json) {
    return ResponsePartitionKey(
      dimensions: (json['Dimensions'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    return {
      'Dimensions': dimensions,
    };
  }
}

/// An object describing a Performance Insights metric and one or more
/// dimensions for that metric.
class ResponseResourceMetricKey {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for the
  /// database engine.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of active
  /// sessions is greater than the internal threshold, Performance Insights
  /// samples the active sessions, with <code>db.load.avg</code> showing the
  /// scaled values, <code>db.sampledload.avg</code> showing the raw values, and
  /// <code>db.sampledload.avg</code> less than <code>db.load.avg</code>. For most
  /// use cases, you can query <code>db.load.avg</code> only.
  final String metric;

  /// The valid dimensions for the metric.
  final Map<String, String>? dimensions;

  ResponseResourceMetricKey({
    required this.metric,
    this.dimensions,
  });

  factory ResponseResourceMetricKey.fromJson(Map<String, dynamic> json) {
    return ResponseResourceMetricKey(
      metric: json['Metric'] as String,
      dimensions: (json['Dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final dimensions = this.dimensions;
    return {
      'Metric': metric,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

enum ServiceType {
  rds,
}

extension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.rds:
        return 'RDS';
    }
  }
}

extension on String {
  ServiceType toServiceType() {
    switch (this) {
      case 'RDS':
        return ServiceType.rds;
    }
    throw Exception('$this is not known in enum ServiceType');
  }
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
};
