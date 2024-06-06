// ignore_for_file: deprecated_member_use_from_same_package
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a new performance analysis report for a specific time period for
  /// the DB instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The end time defined for the analysis report.
  ///
  /// Parameter [identifier] :
  /// An immutable, Amazon Web Services Region-unique identifier for a data
  /// source. Performance Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ADECBTYHKTSAUMUZQYPDS2GW4A</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights will return
  /// metrics. Valid value is <code>RDS</code>.
  ///
  /// Parameter [startTime] :
  /// The start time defined for the analysis report.
  ///
  /// Parameter [tags] :
  /// The metadata assigned to the analysis report consisting of a key-value
  /// pair.
  Future<CreatePerformanceAnalysisReportResponse>
      createPerformanceAnalysisReport({
    required DateTime endTime,
    required String identifier,
    required ServiceType serviceType,
    required DateTime startTime,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.CreatePerformanceAnalysisReport'
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
        'ServiceType': serviceType.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePerformanceAnalysisReportResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a performance analysis report.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [analysisReportId] :
  /// The unique identifier of the analysis report for deletion.
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. In the console, the identifier is shown as <i>ResourceID</i>. When
  /// you call <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights will return
  /// metrics. Valid value is <code>RDS</code>.
  Future<void> deletePerformanceAnalysisReport({
    required String analysisReportId,
    required String identifier,
    required ServiceType serviceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.DeletePerformanceAnalysisReport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AnalysisReportId': analysisReportId,
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
      },
    );
  }

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
  /// An immutable, Amazon Web Services Region-unique identifier for a data
  /// source. Performance Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>.
  ///
  /// Parameter [metric] :
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for
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
  /// The Amazon Web Services service for which Performance Insights will return
  /// metrics. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>RDS</code>
  /// </li>
  /// <li>
  /// <code>DOCDB</code>
  /// </li>
  /// </ul>
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
  /// Parameter [additionalMetrics] :
  /// Additional metrics for the top <code>N</code> dimension keys. If the
  /// specified dimension group in the <code>GroupBy</code> parameter is
  /// <code>db.sql_tokenized</code>, you can specify per-SQL metrics to get the
  /// values for the top <code>N</code> SQL digests. The response syntax is as
  /// follows: <code>"AdditionalMetrics" : { "<i>string</i>" : "<i>string</i>"
  /// }</code>.
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
    List<String>? additionalMetrics,
    Map<String, String>? filter,
    int? maxResults,
    String? nextToken,
    DimensionGroup? partitionBy,
    int? periodInSeconds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
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
        if (additionalMetrics != null) 'AdditionalMetrics': additionalMetrics,
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
  /// The name of the dimension group. Performance Insights searches the
  /// specified group for the dimension group ID. The following group name
  /// values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query</code> (Amazon DocumentDB only)
  /// </li>
  /// <li>
  /// <code>db.sql</code> (Amazon RDS and Aurora only)
  /// </li>
  /// </ul>
  ///
  /// Parameter [groupIdentifier] :
  /// The ID of the dimension group from which to retrieve dimension details.
  /// For dimension group <code>db.sql</code>, the group ID is
  /// <code>db.sql.id</code>. The following group ID values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.sql.id</code> for dimension group <code>db.sql</code> (Aurora and
  /// RDS only)
  /// </li>
  /// <li>
  /// <code>db.query.id</code> for dimension group <code>db.query</code>
  /// (DocumentDB only)
  /// </li>
  /// </ul>
  ///
  /// Parameter [identifier] :
  /// The ID for a data source from which to gather dimension data. This ID must
  /// be immutable and unique within an Amazon Web Services Region. When a DB
  /// instance is the data source, specify its <code>DbiResourceId</code> value.
  /// For example, specify <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// data. The only valid value is <code>RDS</code>.
  ///
  /// Parameter [requestedDimensions] :
  /// A list of dimensions to retrieve the detail data for within the given
  /// dimension group. If you don't specify this parameter, Performance Insights
  /// returns all dimension data within the specified dimension group. Specify
  /// dimension names for the following dimension groups:
  ///
  /// <ul>
  /// <li>
  /// <code>db.sql</code> - Specify either the full dimension name
  /// <code>db.sql.statement</code> or the short dimension name
  /// <code>statement</code> (Aurora and RDS only).
  /// </li>
  /// <li>
  /// <code>db.query</code> - Specify either the full dimension name
  /// <code>db.query.statement</code> or the short dimension name
  /// <code>statement</code> (DocumentDB only).
  /// </li>
  /// </ul>
  Future<GetDimensionKeyDetailsResponse> getDimensionKeyDetails({
    required String group,
    required String groupIdentifier,
    required String identifier,
    required ServiceType serviceType,
    List<String>? requestedDimensions,
  }) async {
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

  /// Retrieves the report including the report ID, status, time details, and
  /// the insights with recommendations. The report status can be
  /// <code>RUNNING</code>, <code>SUCCEEDED</code>, or <code>FAILED</code>. The
  /// insights include the <code>description</code> and
  /// <code>recommendation</code> fields.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [analysisReportId] :
  /// A unique identifier of the created analysis report. For example,
  /// <code>report-12345678901234567</code>
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. In the console, the identifier is shown as <i>ResourceID</i>. When
  /// you call <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights will return
  /// metrics. Valid value is <code>RDS</code>.
  ///
  /// Parameter [acceptLanguage] :
  /// The text language in the report. The default language is
  /// <code>EN_US</code> (English).
  ///
  /// Parameter [textFormat] :
  /// Indicates the text format in the report. The options are
  /// <code>PLAIN_TEXT</code> or <code>MARKDOWN</code>. The default value is
  /// <code>plain text</code>.
  Future<GetPerformanceAnalysisReportResponse> getPerformanceAnalysisReport({
    required String analysisReportId,
    required String identifier,
    required ServiceType serviceType,
    AcceptLanguage? acceptLanguage,
    TextFormat? textFormat,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.GetPerformanceAnalysisReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AnalysisReportId': analysisReportId,
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
        if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage.toValue(),
        if (textFormat != null) 'TextFormat': textFormat.toValue(),
      },
    );

    return GetPerformanceAnalysisReportResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve the metadata for different features. For example, the metadata
  /// might indicate that a feature is turned on or off on a specific DB
  /// instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  Future<GetResourceMetadataResponse> getResourceMetadata({
    required String identifier,
    required ServiceType serviceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetResourceMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
      },
    );

    return GetResourceMetadataResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve Performance Insights metrics for a set of data sources over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide filtering criteria for each group. You must specify an aggregate
  /// function for each metric.
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
  /// The date and time specifying the end of the requested time series query
  /// range. The value specified is <i>exclusive</i>. Thus, the command returns
  /// data points less than (but not equal to) <code>EndTime</code>.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. In the console, the identifier is shown as <i>ResourceID</i>. When
  /// you call <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [metricQueries] :
  /// An array of one or more queries to perform. Each query must specify a
  /// Performance Insights metric and specify an aggregate function, and you can
  /// provide filtering criteria. You must append the aggregate function to the
  /// metric. For example, to find the average for the metric
  /// <code>db.load</code> you must use <code>db.load.avg</code>. Valid values
  /// for aggregate functions include <code>.avg</code>, <code>.min</code>,
  /// <code>.max</code>, and <code>.sum</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>RDS</code>
  /// </li>
  /// <li>
  /// <code>DOCDB</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// query range. You can't specify a <code>StartTime</code> that is earlier
  /// than 7 days ago. By default, Performance Insights has 7 days of retention,
  /// but you can extend this range up to 2 years. The value specified is
  /// <i>inclusive</i>. Thus, the command returns data points equal to or
  /// greater than <code>StartTime</code>.
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
  /// Parameter [periodAlignment] :
  /// The returned timestamp which is the start or end time of the time periods.
  /// The default value is <code>END_TIME</code>.
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
    PeriodAlignment? periodAlignment,
    int? periodInSeconds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
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
        if (periodAlignment != null)
          'PeriodAlignment': periodAlignment.toValue(),
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return GetResourceMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve the dimensions that can be queried for each specified metric type
  /// on a specified DB instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique within an Amazon
  /// Web Services Region. Performance Insights gathers metrics from this data
  /// source. To use an Amazon RDS DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VWZ</code>.
  ///
  /// Parameter [metrics] :
  /// The types of metrics for which to retrieve dimensions. Valid values
  /// include <code>db.load</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  ///
  /// Parameter [authorizedActions] :
  /// The actions to discover the dimensions you are authorized to access. If
  /// you specify multiple actions, then the response will contain the
  /// dimensions common for all the actions.
  ///
  /// When you don't specify this request parameter or provide an empty list,
  /// the response contains all the available dimensions for the target database
  /// engine whether or not you are authorized to access them.
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
  Future<ListAvailableResourceDimensionsResponse>
      listAvailableResourceDimensions({
    required String identifier,
    required List<String> metrics,
    required ServiceType serviceType,
    List<FineGrainedAction>? authorizedActions,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.ListAvailableResourceDimensions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'Metrics': metrics,
        'ServiceType': serviceType.toValue(),
        if (authorizedActions != null)
          'AuthorizedActions':
              authorizedActions.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAvailableResourceDimensionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve metrics of the specified types that can be queried for a
  /// specified DB instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique within an Amazon
  /// Web Services Region. Performance Insights gathers metrics from this data
  /// source. To use an Amazon RDS DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VWZ</code>.
  ///
  /// Parameter [metricTypes] :
  /// The types of metrics to return in the response. Valid values in the array
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>os</code> (OS counter metrics) - All engines
  /// </li>
  /// <li>
  /// <code>db</code> (DB load metrics) - All engines except for Amazon
  /// DocumentDB
  /// </li>
  /// <li>
  /// <code>db.sql.stats</code> (per-SQL metrics) - All engines except for
  /// Amazon DocumentDB
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.stats</code> (per-SQL digest metrics) - All engines
  /// except for Amazon DocumentDB
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return. If the <code>MaxRecords</code>
  /// value is less than the number of existing items, the response includes a
  /// pagination token.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  Future<ListAvailableResourceMetricsResponse> listAvailableResourceMetrics({
    required String identifier,
    required List<String> metricTypes,
    required ServiceType serviceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.ListAvailableResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'MetricTypes': metricTypes,
        'ServiceType': serviceType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAvailableResourceMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the analysis reports created for the DB instance. The reports
  /// are sorted based on the start time of each report.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. In the console, the identifier is shown as <i>ResourceID</i>. When
  /// you call <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics. Valid value is <code>RDS</code>.
  ///
  /// Parameter [listTags] :
  /// Specifies whether or not to include the list of tags in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxResults</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxResults</code>.
  Future<ListPerformanceAnalysisReportsResponse>
      listPerformanceAnalysisReports({
    required String identifier,
    required ServiceType serviceType,
    bool? listTags,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.ListPerformanceAnalysisReports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
        if (listTags != null) 'ListTags': listTags,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPerformanceAnalysisReportsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all the metadata tags associated with Amazon RDS Performance
  /// Insights resource.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [resourceARN] :
  /// Lists all the tags for the Amazon RDS Performance Insights resource. This
  /// value is an Amazon Resource Name (ARN). For information about creating an
  /// ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an RDS Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [serviceType] :
  /// List the tags for the Amazon Web Services service for which Performance
  /// Insights returns metrics. Valid value is <code>RDS</code>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    required ServiceType serviceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'ServiceType': serviceType.toValue(),
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds metadata tags to the Amazon RDS Performance Insights resource.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon RDS Performance Insights resource that the tags are added to.
  /// This value is an Amazon Resource Name (ARN). For information about
  /// creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an RDS Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics. Valid value is <code>RDS</code>.
  ///
  /// Parameter [tags] :
  /// The metadata assigned to an Amazon RDS resource consisting of a key-value
  /// pair.
  Future<void> tagResource({
    required String resourceARN,
    required ServiceType serviceType,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'ServiceType': serviceType.toValue(),
        'Tags': tags,
      },
    );
  }

  /// Deletes the metadata tags from the Amazon RDS Performance Insights
  /// resource.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon RDS Performance Insights resource that the tags are added to.
  /// This value is an Amazon Resource Name (ARN). For information about
  /// creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">
  /// Constructing an RDS Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [serviceType] :
  /// List the tags for the Amazon Web Services service for which Performance
  /// Insights returns metrics. Valid value is <code>RDS</code>.
  ///
  /// Parameter [tagKeys] :
  /// The metadata assigned to an Amazon RDS Performance Insights resource
  /// consisting of a key-value pair.
  Future<void> untagResource({
    required String resourceARN,
    required ServiceType serviceType,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'ServiceType': serviceType.toValue(),
        'TagKeys': tagKeys,
      },
    );
  }
}

enum AcceptLanguage {
  enUs,
}

extension AcceptLanguageValueExtension on AcceptLanguage {
  String toValue() {
    switch (this) {
      case AcceptLanguage.enUs:
        return 'EN_US';
    }
  }
}

extension AcceptLanguageFromString on String {
  AcceptLanguage toAcceptLanguage() {
    switch (this) {
      case 'EN_US':
        return AcceptLanguage.enUs;
    }
    throw Exception('$this is not known in enum AcceptLanguage');
  }
}

/// Retrieves the summary of the performance analysis report created for a time
/// period.
class AnalysisReport {
  /// The name of the analysis report.
  final String analysisReportId;

  /// The time you created the analysis report.
  final DateTime? createTime;

  /// The analysis end time in the report.
  final DateTime? endTime;

  /// The unique identifier of the analysis report.
  final String? identifier;

  /// The list of identified insights in the analysis report.
  final List<Insight>? insights;

  /// List the tags for the Amazon Web Services service for which Performance
  /// Insights returns metrics. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>RDS</code>
  /// </li>
  /// <li>
  /// <code>DOCDB</code>
  /// </li>
  /// </ul>
  final ServiceType? serviceType;

  /// The analysis start time in the report.
  final DateTime? startTime;

  /// The status of the created analysis report.
  final AnalysisStatus? status;

  AnalysisReport({
    required this.analysisReportId,
    this.createTime,
    this.endTime,
    this.identifier,
    this.insights,
    this.serviceType,
    this.startTime,
    this.status,
  });

  factory AnalysisReport.fromJson(Map<String, dynamic> json) {
    return AnalysisReport(
      analysisReportId: json['AnalysisReportId'] as String,
      createTime: timeStampFromJson(json['CreateTime']),
      endTime: timeStampFromJson(json['EndTime']),
      identifier: json['Identifier'] as String?,
      insights: (json['Insights'] as List?)
          ?.whereNotNull()
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceType: (json['ServiceType'] as String?)?.toServiceType(),
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toAnalysisStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisReportId = this.analysisReportId;
    final createTime = this.createTime;
    final endTime = this.endTime;
    final identifier = this.identifier;
    final insights = this.insights;
    final serviceType = this.serviceType;
    final startTime = this.startTime;
    final status = this.status;
    return {
      'AnalysisReportId': analysisReportId,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (identifier != null) 'Identifier': identifier,
      if (insights != null) 'Insights': insights,
      if (serviceType != null) 'ServiceType': serviceType.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Retrieves the details of the performance analysis report.
class AnalysisReportSummary {
  /// The name of the analysis report.
  final String? analysisReportId;

  /// The time you created the analysis report.
  final DateTime? createTime;

  /// The end time of the analysis in the report.
  final DateTime? endTime;

  /// The start time of the analysis in the report.
  final DateTime? startTime;

  /// The status of the analysis report.
  final AnalysisStatus? status;

  /// List of all the tags added to the analysis report.
  final List<Tag>? tags;

  AnalysisReportSummary({
    this.analysisReportId,
    this.createTime,
    this.endTime,
    this.startTime,
    this.status,
    this.tags,
  });

  factory AnalysisReportSummary.fromJson(Map<String, dynamic> json) {
    return AnalysisReportSummary(
      analysisReportId: json['AnalysisReportId'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      endTime: timeStampFromJson(json['EndTime']),
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toAnalysisStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisReportId = this.analysisReportId;
    final createTime = this.createTime;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final status = this.status;
    final tags = this.tags;
    return {
      if (analysisReportId != null) 'AnalysisReportId': analysisReportId,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum AnalysisStatus {
  running,
  succeeded,
  failed,
}

extension AnalysisStatusValueExtension on AnalysisStatus {
  String toValue() {
    switch (this) {
      case AnalysisStatus.running:
        return 'RUNNING';
      case AnalysisStatus.succeeded:
        return 'SUCCEEDED';
      case AnalysisStatus.failed:
        return 'FAILED';
    }
  }
}

extension AnalysisStatusFromString on String {
  AnalysisStatus toAnalysisStatus() {
    switch (this) {
      case 'RUNNING':
        return AnalysisStatus.running;
      case 'SUCCEEDED':
        return AnalysisStatus.succeeded;
      case 'FAILED':
        return AnalysisStatus.failed;
    }
    throw Exception('$this is not known in enum AnalysisStatus');
  }
}

enum ContextType {
  causal,
  contextual,
}

extension ContextTypeValueExtension on ContextType {
  String toValue() {
    switch (this) {
      case ContextType.causal:
        return 'CAUSAL';
      case ContextType.contextual:
        return 'CONTEXTUAL';
    }
  }
}

extension ContextTypeFromString on String {
  ContextType toContextType() {
    switch (this) {
      case 'CAUSAL':
        return ContextType.causal;
      case 'CONTEXTUAL':
        return ContextType.contextual;
    }
    throw Exception('$this is not known in enum ContextType');
  }
}

class CreatePerformanceAnalysisReportResponse {
  /// A unique identifier for the created analysis report.
  final String? analysisReportId;

  CreatePerformanceAnalysisReportResponse({
    this.analysisReportId,
  });

  factory CreatePerformanceAnalysisReportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePerformanceAnalysisReportResponse(
      analysisReportId: json['AnalysisReportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisReportId = this.analysisReportId;
    return {
      if (analysisReportId != null) 'AnalysisReportId': analysisReportId,
    };
  }
}

/// List of data objects which provide details about source metrics. This field
/// can be used to determine the PI metric to render for the insight. This data
/// type also includes static values for the metrics for the Insight that were
/// calculated and included in text and annotations on the DB load chart.
class Data {
  /// This field determines the Performance Insights metric to render for the
  /// insight. The <code>name</code> field refers to a Performance Insights
  /// metric.
  final PerformanceInsightsMetric? performanceInsightsMetric;

  Data({
    this.performanceInsightsMetric,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      performanceInsightsMetric: json['PerformanceInsightsMetric'] != null
          ? PerformanceInsightsMetric.fromJson(
              json['PerformanceInsightsMetric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final performanceInsightsMetric = this.performanceInsightsMetric;
    return {
      if (performanceInsightsMetric != null)
        'PerformanceInsightsMetric': performanceInsightsMetric,
    };
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

class DeletePerformanceAnalysisReportResponse {
  DeletePerformanceAnalysisReportResponse();

  factory DeletePerformanceAnalysisReportResponse.fromJson(
      Map<String, dynamic> _) {
    return DeletePerformanceAnalysisReportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  /// A pagination token that indicates the response didn’t return all available
  /// records because <code>MaxRecords</code> was specified in the previous
  /// request. To get the remaining records, specify <code>NextToken</code> in a
  /// separate request with this value.
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

extension DetailStatusValueExtension on DetailStatus {
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

extension DetailStatusFromString on String {
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

/// The information about a dimension.
class DimensionDetail {
  /// The identifier of a dimension.
  final String? identifier;

  DimensionDetail({
    this.identifier,
  });

  factory DimensionDetail.fromJson(Map<String, dynamic> json) {
    return DimensionDetail(
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      if (identifier != null) 'Identifier': identifier,
    };
  }
}

/// A logical grouping of Performance Insights metrics for a related subject
/// area. For example, the <code>db.sql</code> dimension group consists of the
/// following dimensions:
///
/// <ul>
/// <li>
/// <code>db.sql.id</code> - The hash of a running SQL statement, generated by
/// Performance Insights.
/// </li>
/// <li>
/// <code>db.sql.db_id</code> - Either the SQL ID generated by the database
/// engine, or a value generated by Performance Insights that begins with
/// <code>pi-</code>.
/// </li>
/// <li>
/// <code>db.sql.statement</code> - The full text of the SQL statement that is
/// running, for example, <code>SELECT * FROM employees</code>.
/// </li>
/// <li>
/// <code>db.sql_tokenized.id</code> - The hash of the SQL digest generated by
/// Performance Insights.
/// </li>
/// </ul> <note>
/// Each response element returns a maximum of 500 bytes. For larger elements,
/// such as SQL statements, only the first 500 bytes are returned.
/// </note>
class DimensionGroup {
  /// The name of the dimension group. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>db</code> - The name of the database to which the client is connected.
  /// The following values are permitted:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Aurora MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MariaDB
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.application</code> - The name of the application that is connected
  /// to the database. The following values are permitted:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.host</code> - The host name of the connected client (all engines).
  /// </li>
  /// <li>
  /// <code>db.query</code> - The query that is currently running (only Amazon
  /// DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query_tokenized</code> - The digest query (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.session_type</code> - The type of the current session (only Aurora
  /// PostgreSQL and RDS PostgreSQL).
  /// </li>
  /// <li>
  /// <code>db.sql</code> - The text of the SQL statement that is currently
  /// running (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized</code> - The SQL digest (all engines except Amazon
  /// DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.user</code> - The user logged in to the database (all engines
  /// except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event</code> - The event for which the database backend is
  /// waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event_type</code> - The type of event for which the database
  /// backend is waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_state</code> - The event for which the database backend is
  /// waiting (only Amazon DocumentDB).
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
  /// connected to the database. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.host.id</code> - The host ID of the connected client (all engines).
  /// </li>
  /// <li>
  /// <code>db.host.name</code> - The host name of the connected client (all
  /// engines).
  /// </li>
  /// <li>
  /// <code>db.name</code> - The name of the database to which the client is
  /// connected. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Aurora MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MariaDB
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.query.id</code> - The query ID generated by Performance Insights
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.db_id</code> - The query ID generated by the database (only
  /// Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.statement</code> - The text of the query that is being run
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.id</code> - The query digest ID generated by
  /// Performance Insights (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.db_id</code> - The query digest ID generated by
  /// Performance Insights (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.statement</code> - The text of the query digest
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.session_type.name</code> - The type of the current session (only
  /// Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.id</code> - The hash of the full, non-tokenized SQL statement
  /// generated by Performance Insights (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.db_id</code> - Either the SQL ID generated by the database
  /// engine, or a value generated by Performance Insights that begins with
  /// <code>pi-</code> (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> - The full text of the SQL statement that is
  /// running, as in <code>SELECT * FROM employees</code> (all engines except
  /// Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.id</code> - The hash of the SQL digest generated by
  /// Performance Insights (all engines except Amazon DocumentDB). In the console,
  /// <code>db.sql_tokenized.id</code> is called the Support ID because Amazon Web
  /// Services Support can look at this data to help you troubleshoot database
  /// issues.
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.db_id</code> - Either the native database ID used to
  /// refer to the SQL statement, or a synthetic ID such as
  /// <code>pi-2372568224</code> that Performance Insights generates if the native
  /// database ID isn't available (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.statement</code> - The text of the SQL digest, as in
  /// <code>SELECT * FROM employees WHERE employee_id = ?</code> (all engines
  /// except Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.user.id</code> - The ID of the user logged in to the database (all
  /// engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.user.name</code> - The name of the user logged in to the database
  /// (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event.name</code> - The event for which the backend is waiting
  /// (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event.type</code> - The type of event for which the backend is
  /// waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event_type.name</code> - The name of the event type for which
  /// the backend is waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_state.name</code> - The event for which the backend is waiting
  /// (only Amazon DocumentDB).
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

/// Information about dimensions within a dimension group.
class DimensionGroupDetail {
  /// The dimensions within a dimension group.
  final List<DimensionDetail>? dimensions;

  /// The name of the dimension group.
  final String? group;

  DimensionGroupDetail({
    this.dimensions,
    this.group,
  });

  factory DimensionGroupDetail.fromJson(Map<String, dynamic> json) {
    return DimensionGroupDetail(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      group: json['Group'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final group = this.group;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (group != null) 'Group': group,
    };
  }
}

/// An object that includes the requested dimension key values and aggregated
/// metric values within a dimension group.
class DimensionKeyDescription {
  /// A map that contains the value for each additional metric.
  final Map<String, double>? additionalMetrics;

  /// A map of name-value pairs for the dimensions in the group.
  final Map<String, String>? dimensions;

  /// If <code>PartitionBy</code> was specified, <code>PartitionKeys</code>
  /// contains the dimensions that were.
  final List<double>? partitions;

  /// The aggregated metric value for the dimensions, over the requested time
  /// range.
  final double? total;

  DimensionKeyDescription({
    this.additionalMetrics,
    this.dimensions,
    this.partitions,
    this.total,
  });

  factory DimensionKeyDescription.fromJson(Map<String, dynamic> json) {
    return DimensionKeyDescription(
      additionalMetrics: (json['AdditionalMetrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
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
    final additionalMetrics = this.additionalMetrics;
    final dimensions = this.dimensions;
    final partitions = this.partitions;
    final total = this.total;
    return {
      if (additionalMetrics != null) 'AdditionalMetrics': additionalMetrics,
      if (dimensions != null) 'Dimensions': dimensions,
      if (partitions != null) 'Partitions': partitions,
      if (total != null) 'Total': total,
    };
  }
}

/// An object that describes the details for a specified dimension.
class DimensionKeyDetail {
  /// The full name of the dimension. The full name includes the group name and
  /// key name. The following values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query.statement</code> (Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> (Amazon RDS and Aurora)
  /// </li>
  /// </ul>
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
  /// data has the status <code>PROCESSING</code>, Performance Insights returns
  /// the truncated query.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code> - The dimension detail data could not be collected
  /// successfully.
  /// </li>
  /// </ul>
  final DetailStatus? status;

  /// The value of the dimension detail data. Depending on the return status, this
  /// value is either the full or truncated SQL query for the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query.statement</code> (Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> (Amazon RDS and Aurora)
  /// </li>
  /// </ul>
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

/// The metadata for a feature. For example, the metadata might indicate that a
/// feature is turned on or off on a specific DB instance.
class FeatureMetadata {
  /// The status of the feature on the DB instance. Possible values include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - The feature is enabled on the instance.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - The feature is disabled on the instance.
  /// </li>
  /// <li>
  /// <code>UNSUPPORTED</code> - The feature isn't supported on the instance.
  /// </li>
  /// <li>
  /// <code>ENABLED_PENDING_REBOOT</code> - The feature is enabled on the instance
  /// but requires a reboot to take effect.
  /// </li>
  /// <li>
  /// <code>DISABLED_PENDING_REBOOT</code> - The feature is disabled on the
  /// instance but requires a reboot to take effect.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code> - The feature status couldn't be determined.
  /// </li>
  /// </ul>
  final FeatureStatus? status;

  FeatureMetadata({
    this.status,
  });

  factory FeatureMetadata.fromJson(Map<String, dynamic> json) {
    return FeatureMetadata(
      status: (json['Status'] as String?)?.toFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum FeatureStatus {
  enabled,
  disabled,
  unsupported,
  enabledPendingReboot,
  disabledPendingReboot,
  unknown,
}

extension FeatureStatusValueExtension on FeatureStatus {
  String toValue() {
    switch (this) {
      case FeatureStatus.enabled:
        return 'ENABLED';
      case FeatureStatus.disabled:
        return 'DISABLED';
      case FeatureStatus.unsupported:
        return 'UNSUPPORTED';
      case FeatureStatus.enabledPendingReboot:
        return 'ENABLED_PENDING_REBOOT';
      case FeatureStatus.disabledPendingReboot:
        return 'DISABLED_PENDING_REBOOT';
      case FeatureStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension FeatureStatusFromString on String {
  FeatureStatus toFeatureStatus() {
    switch (this) {
      case 'ENABLED':
        return FeatureStatus.enabled;
      case 'DISABLED':
        return FeatureStatus.disabled;
      case 'UNSUPPORTED':
        return FeatureStatus.unsupported;
      case 'ENABLED_PENDING_REBOOT':
        return FeatureStatus.enabledPendingReboot;
      case 'DISABLED_PENDING_REBOOT':
        return FeatureStatus.disabledPendingReboot;
      case 'UNKNOWN':
        return FeatureStatus.unknown;
    }
    throw Exception('$this is not known in enum FeatureStatus');
  }
}

enum FineGrainedAction {
  describeDimensionKeys,
  getDimensionKeyDetails,
  getResourceMetrics,
}

extension FineGrainedActionValueExtension on FineGrainedAction {
  String toValue() {
    switch (this) {
      case FineGrainedAction.describeDimensionKeys:
        return 'DescribeDimensionKeys';
      case FineGrainedAction.getDimensionKeyDetails:
        return 'GetDimensionKeyDetails';
      case FineGrainedAction.getResourceMetrics:
        return 'GetResourceMetrics';
    }
  }
}

extension FineGrainedActionFromString on String {
  FineGrainedAction toFineGrainedAction() {
    switch (this) {
      case 'DescribeDimensionKeys':
        return FineGrainedAction.describeDimensionKeys;
      case 'GetDimensionKeyDetails':
        return FineGrainedAction.getDimensionKeyDetails;
      case 'GetResourceMetrics':
        return FineGrainedAction.getResourceMetrics;
    }
    throw Exception('$this is not known in enum FineGrainedAction');
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

class GetPerformanceAnalysisReportResponse {
  /// The summary of the performance analysis report created for a time period.
  final AnalysisReport? analysisReport;

  GetPerformanceAnalysisReportResponse({
    this.analysisReport,
  });

  factory GetPerformanceAnalysisReportResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPerformanceAnalysisReportResponse(
      analysisReport: json['AnalysisReport'] != null
          ? AnalysisReport.fromJson(
              json['AnalysisReport'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisReport = this.analysisReport;
    return {
      if (analysisReport != null) 'AnalysisReport': analysisReport,
    };
  }
}

class GetResourceMetadataResponse {
  /// The metadata for different features. For example, the metadata might
  /// indicate that a feature is turned on or off on a specific DB instance.
  final Map<String, FeatureMetadata>? features;

  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data source.
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  final String? identifier;

  GetResourceMetadataResponse({
    this.features,
    this.identifier,
  });

  factory GetResourceMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceMetadataResponse(
      features: (json['Features'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, FeatureMetadata.fromJson(e as Map<String, dynamic>))),
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final features = this.features;
    final identifier = this.identifier;
    return {
      if (features != null) 'Features': features,
      if (identifier != null) 'Identifier': identifier,
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

  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data source.
  /// In the console, the identifier is shown as <i>ResourceID</i>. When you call
  /// <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  final String? identifier;

  /// An array of metric results, where each array element contains all of the
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

/// Retrieves the list of performance issues which are identified.
class Insight {
  /// The unique identifier for the insight. For example,
  /// <code>insight-12345678901234567</code>.
  final String insightId;

  /// Metric names and values from the timeframe used as baseline to generate the
  /// insight.
  final List<Data>? baselineData;

  /// Indicates if the insight is causal or correlated insight.
  final ContextType? context;

  /// Description of the insight. For example: <code>A high severity Insight found
  /// between 02:00 to 02:30, where there was an unusually high DB load 600x above
  /// baseline. Likely performance impact</code>.
  final String? description;

  /// The end time of the insight. For example, <code>2018-10-30T00:00:00Z</code>.
  final DateTime? endTime;

  /// List of data objects containing metrics and references from the time range
  /// while generating the insight.
  final List<Data>? insightData;

  /// The type of insight. For example, <code>HighDBLoad</code>,
  /// <code>HighCPU</code>, or <code>DominatingSQLs</code>.
  final String? insightType;

  /// List of recommendations for the insight. For example, <code>Investigate the
  /// following SQLs that contributed to 100% of the total DBLoad during that time
  /// period: sql-id</code>.
  final List<Recommendation>? recommendations;

  /// The severity of the insight. The values are: <code>Low</code>,
  /// <code>Medium</code>, or <code>High</code>.
  final Severity? severity;

  /// The start time of the insight. For example,
  /// <code>2018-10-30T00:00:00Z</code>.
  final DateTime? startTime;

  /// List of supporting insights that provide additional factors for the insight.
  final List<Insight>? supportingInsights;

  Insight({
    required this.insightId,
    this.baselineData,
    this.context,
    this.description,
    this.endTime,
    this.insightData,
    this.insightType,
    this.recommendations,
    this.severity,
    this.startTime,
    this.supportingInsights,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      insightId: json['InsightId'] as String,
      baselineData: (json['BaselineData'] as List?)
          ?.whereNotNull()
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      context: (json['Context'] as String?)?.toContextType(),
      description: json['Description'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      insightData: (json['InsightData'] as List?)
          ?.whereNotNull()
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      insightType: json['InsightType'] as String?,
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['Severity'] as String?)?.toSeverity(),
      startTime: timeStampFromJson(json['StartTime']),
      supportingInsights: (json['SupportingInsights'] as List?)
          ?.whereNotNull()
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final insightId = this.insightId;
    final baselineData = this.baselineData;
    final context = this.context;
    final description = this.description;
    final endTime = this.endTime;
    final insightData = this.insightData;
    final insightType = this.insightType;
    final recommendations = this.recommendations;
    final severity = this.severity;
    final startTime = this.startTime;
    final supportingInsights = this.supportingInsights;
    return {
      'InsightId': insightId,
      if (baselineData != null) 'BaselineData': baselineData,
      if (context != null) 'Context': context.toValue(),
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (insightData != null) 'InsightData': insightData,
      if (insightType != null) 'InsightType': insightType,
      if (recommendations != null) 'Recommendations': recommendations,
      if (severity != null) 'Severity': severity.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (supportingInsights != null) 'SupportingInsights': supportingInsights,
    };
  }
}

class ListAvailableResourceDimensionsResponse {
  /// The dimension information returned for requested metric types.
  final List<MetricDimensionGroups>? metricDimensions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  final String? nextToken;

  ListAvailableResourceDimensionsResponse({
    this.metricDimensions,
    this.nextToken,
  });

  factory ListAvailableResourceDimensionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableResourceDimensionsResponse(
      metricDimensions: (json['MetricDimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimensionGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDimensions = this.metricDimensions;
    final nextToken = this.nextToken;
    return {
      if (metricDimensions != null) 'MetricDimensions': metricDimensions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAvailableResourceMetricsResponse {
  /// An array of metrics available to query. Each array element contains the full
  /// name, description, and unit of the metric.
  final List<ResponseResourceMetric>? metrics;

  /// A pagination token that indicates the response didn’t return all available
  /// records because <code>MaxRecords</code> was specified in the previous
  /// request. To get the remaining records, specify <code>NextToken</code> in a
  /// separate request with this value.
  final String? nextToken;

  ListAvailableResourceMetricsResponse({
    this.metrics,
    this.nextToken,
  });

  factory ListAvailableResourceMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableResourceMetricsResponse(
      metrics: (json['Metrics'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ResponseResourceMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    return {
      if (metrics != null) 'Metrics': metrics,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPerformanceAnalysisReportsResponse {
  /// List of reports including the report identifier, start and end time,
  /// creation time, and status.
  final List<AnalysisReportSummary>? analysisReports;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxResults</code>.
  final String? nextToken;

  ListPerformanceAnalysisReportsResponse({
    this.analysisReports,
    this.nextToken,
  });

  factory ListPerformanceAnalysisReportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPerformanceAnalysisReportsResponse(
      analysisReports: (json['AnalysisReports'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisReports = this.analysisReports;
    final nextToken = this.nextToken;
    return {
      if (analysisReports != null) 'AnalysisReports': analysisReports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The metadata assigned to an Amazon RDS resource consisting of a key-value
  /// pair.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The available dimension information for a metric type.
class MetricDimensionGroups {
  /// The available dimension groups for a metric type.
  final List<DimensionGroupDetail>? groups;

  /// The metric type to which the dimension information belongs.
  final String? metric;

  MetricDimensionGroups({
    this.groups,
    this.metric,
  });

  factory MetricDimensionGroups.fromJson(Map<String, dynamic> json) {
    return MetricDimensionGroups(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      metric: json['Metric'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final metric = this.metric;
    return {
      if (groups != null) 'Groups': groups,
      if (metric != null) 'Metric': metric,
    };
  }
}

/// A time-ordered series of data points, corresponding to a dimension of a
/// Performance Insights metric.
class MetricKeyDataPoints {
  /// An array of timestamp-value pairs, representing measurements over a period
  /// of time.
  final List<DataPoint>? dataPoints;

  /// The dimensions to which the data points apply.
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

/// A single query to be processed. You must provide the metric to query and
/// append an aggregate function to the metric. For example, to find the average
/// for the metric <code>db.load</code> you must use <code>db.load.avg</code>.
/// Valid values for aggregate functions include <code>.avg</code>,
/// <code>.min</code>, <code>.max</code>, and <code>.sum</code>. If no other
/// parameters are specified, Performance Insights returns all data points for
/// the specified metric. Optionally, you can request that the data points be
/// aggregated by dimension group (<code>GroupBy</code>), and return only those
/// data points that match your criteria (<code>Filter</code>).
class MetricQuery {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for the
  /// database engine.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon RDS User Guide</i>.
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

/// This data type helps to determine Performance Insights metric to render for
/// the insight.
class PerformanceInsightsMetric {
  /// A dimension map that contains the dimensions for this partition.
  final Map<String, String>? dimensions;

  /// The Performance Insights metric name.
  final String? displayName;

  /// The Performance Insights metric.
  final String? metric;

  /// The value of the metric. For example, <code>9</code> for
  /// <code>db.load.avg</code>.
  final double? value;

  PerformanceInsightsMetric({
    this.dimensions,
    this.displayName,
    this.metric,
    this.value,
  });

  factory PerformanceInsightsMetric.fromJson(Map<String, dynamic> json) {
    return PerformanceInsightsMetric(
      dimensions: (json['Dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      displayName: json['DisplayName'] as String?,
      metric: json['Metric'] as String?,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final displayName = this.displayName;
    final metric = this.metric;
    final value = this.value;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (displayName != null) 'DisplayName': displayName,
      if (metric != null) 'Metric': metric,
      if (value != null) 'Value': value,
    };
  }
}

enum PeriodAlignment {
  endTime,
  startTime,
}

extension PeriodAlignmentValueExtension on PeriodAlignment {
  String toValue() {
    switch (this) {
      case PeriodAlignment.endTime:
        return 'END_TIME';
      case PeriodAlignment.startTime:
        return 'START_TIME';
    }
  }
}

extension PeriodAlignmentFromString on String {
  PeriodAlignment toPeriodAlignment() {
    switch (this) {
      case 'END_TIME':
        return PeriodAlignment.endTime;
      case 'START_TIME':
        return PeriodAlignment.startTime;
    }
    throw Exception('$this is not known in enum PeriodAlignment');
  }
}

/// The list of recommendations for the insight.
class Recommendation {
  /// The recommendation details to help resolve the performance issue. For
  /// example, <code>Investigate the following SQLs that contributed to 100% of
  /// the total DBLoad during that time period: sql-id</code>
  final String? recommendationDescription;

  /// The unique identifier for the recommendation.
  final String? recommendationId;

  Recommendation({
    this.recommendationDescription,
    this.recommendationId,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      recommendationDescription: json['RecommendationDescription'] as String?,
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationDescription = this.recommendationDescription;
    final recommendationId = this.recommendationId;
    return {
      if (recommendationDescription != null)
        'RecommendationDescription': recommendationDescription,
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

/// If <code>PartitionBy</code> was specified in a
/// <code>DescribeDimensionKeys</code> request, the dimensions are returned in
/// an array. Each element in the array specifies one dimension.
class ResponsePartitionKey {
  /// A dimension map that contains the dimensions for this partition.
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

/// An object that contains the full name, description, and unit of a metric.
class ResponseResourceMetric {
  /// The description of the metric.
  final String? description;

  /// The full name of the metric.
  final String? metric;

  /// The unit of the metric.
  final String? unit;

  ResponseResourceMetric({
    this.description,
    this.metric,
    this.unit,
  });

  factory ResponseResourceMetric.fromJson(Map<String, dynamic> json) {
    return ResponseResourceMetric(
      description: json['Description'] as String?,
      metric: json['Metric'] as String?,
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final metric = this.metric;
    final unit = this.unit;
    return {
      if (description != null) 'Description': description,
      if (metric != null) 'Metric': metric,
      if (unit != null) 'Unit': unit,
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
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for the
  /// database engine.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon RDS User Guide</i>.
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
  docdb,
}

extension ServiceTypeValueExtension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.rds:
        return 'RDS';
      case ServiceType.docdb:
        return 'DOCDB';
    }
  }
}

extension ServiceTypeFromString on String {
  ServiceType toServiceType() {
    switch (this) {
      case 'RDS':
        return ServiceType.rds;
      case 'DOCDB':
        return ServiceType.docdb;
    }
    throw Exception('$this is not known in enum ServiceType');
  }
}

enum Severity {
  low,
  medium,
  high,
}

extension SeverityValueExtension on Severity {
  String toValue() {
    switch (this) {
      case Severity.low:
        return 'LOW';
      case Severity.medium:
        return 'MEDIUM';
      case Severity.high:
        return 'HIGH';
    }
  }
}

extension SeverityFromString on String {
  Severity toSeverity() {
    switch (this) {
      case 'LOW':
        return Severity.low;
      case 'MEDIUM':
        return Severity.medium;
      case 'HIGH':
        return Severity.high;
    }
    throw Exception('$this is not known in enum Severity');
  }
}

/// Metadata assigned to an Amazon RDS resource consisting of a key-value pair.
class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length and can't be prefixed with <code>aws:</code> or
  /// <code>rds:</code>. The string can only contain only the set of Unicode
  /// letters, digits, white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java
  /// regex: <code>"^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"</code>).
  final String key;

  /// A value is the optional value of the tag. The string value can be from 1 to
  /// 256 Unicode characters in length and can't be prefixed with
  /// <code>aws:</code> or <code>rds:</code>. The string can only contain only the
  /// set of Unicode letters, digits, white-space, '_', '.', ':', '/', '=', '+',
  /// '-', '@' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$").
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TextFormat {
  plainText,
  markdown,
}

extension TextFormatValueExtension on TextFormat {
  String toValue() {
    switch (this) {
      case TextFormat.plainText:
        return 'PLAIN_TEXT';
      case TextFormat.markdown:
        return 'MARKDOWN';
    }
  }
}

extension TextFormatFromString on String {
  TextFormat toTextFormat() {
    switch (this) {
      case 'PLAIN_TEXT':
        return TextFormat.plainText;
      case 'MARKDOWN':
        return TextFormat.markdown;
    }
    throw Exception('$this is not known in enum TextFormat');
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
