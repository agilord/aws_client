// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

class TimestreamQuery {
  final _s.JsonProtocol _protocol;
  TimestreamQuery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Cancels a query that has been issued. Cancellation is provided only if the
  /// query has not completed running before the cancellation request was
  /// issued. Because cancellation is an idempotent operation, subsequent
  /// cancellation requests will return a <code>CancellationMessage</code>,
  /// indicating that the query has already been canceled. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.cancel-query.html">code
  /// sample</a> for details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The ID of the query that needs to be cancelled. <code>QueryID</code> is
  /// returned as part of the query result.
  Future<CancelQueryResponse> cancelQuery({
    required String queryId,
  }) async {
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

  /// Create a scheduled query that will be run on your behalf at the configured
  /// schedule. Timestream assumes the execution role provided as part of the
  /// <code>ScheduledQueryExecutionRoleArn</code> parameter to run the query.
  /// You can use the <code>NotificationConfiguration</code> parameter to
  /// configure notification for your scheduled query operations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [errorReportConfiguration] :
  /// Configuration for error reporting. Error reports will be generated when a
  /// problem is encountered when writing the query results.
  ///
  /// Parameter [name] :
  /// Name of the scheduled query.
  ///
  /// Parameter [notificationConfiguration] :
  /// Notification configuration for the scheduled query. A notification is sent
  /// by Timestream when a query run finishes, when the state is updated or when
  /// you delete it.
  ///
  /// Parameter [queryString] :
  /// The query string to run. Parameter names can be specified in the query
  /// string <code>@</code> character followed by an identifier. The named
  /// Parameter <code>@scheduled_runtime</code> is reserved and can be used in
  /// the query to get the time at which the query is scheduled to run.
  ///
  /// The timestamp calculated according to the ScheduleConfiguration parameter,
  /// will be the value of <code>@scheduled_runtime</code> paramater for each
  /// query run. For example, consider an instance of a scheduled query
  /// executing on 2021-12-01 00:00:00. For this instance, the
  /// <code>@scheduled_runtime</code> parameter is initialized to the timestamp
  /// 2021-12-01 00:00:00 when invoking the query.
  ///
  /// Parameter [scheduleConfiguration] :
  /// The schedule configuration for the query.
  ///
  /// Parameter [scheduledQueryExecutionRoleArn] :
  /// The ARN for the IAM role that Timestream will assume when running the
  /// scheduled query.
  ///
  /// Parameter [clientToken] :
  /// Using a ClientToken makes the call to CreateScheduledQuery idempotent, in
  /// other words, making the same request repeatedly will produce the same
  /// result. Making multiple identical CreateScheduledQuery requests has the
  /// same effect as making a single request.
  ///
  /// <ul>
  /// <li>
  /// If CreateScheduledQuery is called without a <code>ClientToken</code>, the
  /// Query SDK generates a <code>ClientToken</code> on your behalf.
  /// </li>
  /// <li>
  /// After 8 hours, any request with the same <code>ClientToken</code> is
  /// treated as a new request.
  /// </li>
  /// </ul>
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon KMS key used to encrypt the scheduled query resource, at-rest.
  /// If the Amazon KMS key is not specified, the scheduled query resource will
  /// be encrypted with a Timestream owned Amazon KMS key. To specify a KMS key,
  /// use the key ID, key ARN, alias name, or alias ARN. When using an alias
  /// name, prefix the name with <i>alias/</i>
  ///
  /// If ErrorReportConfiguration uses <code>SSE_KMS</code> as encryption type,
  /// the same KmsKeyId is used to encrypt the error report at rest.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the scheduled query.
  ///
  /// Parameter [targetConfiguration] :
  /// Configuration used for writing the result of a query.
  Future<CreateScheduledQueryResponse> createScheduledQuery({
    required ErrorReportConfiguration errorReportConfiguration,
    required String name,
    required NotificationConfiguration notificationConfiguration,
    required String queryString,
    required ScheduleConfiguration scheduleConfiguration,
    required String scheduledQueryExecutionRoleArn,
    String? clientToken,
    String? kmsKeyId,
    List<Tag>? tags,
    TargetConfiguration? targetConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.CreateScheduledQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ErrorReportConfiguration': errorReportConfiguration,
        'Name': name,
        'NotificationConfiguration': notificationConfiguration,
        'QueryString': queryString,
        'ScheduleConfiguration': scheduleConfiguration,
        'ScheduledQueryExecutionRoleArn': scheduledQueryExecutionRoleArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
        if (targetConfiguration != null)
          'TargetConfiguration': targetConfiguration,
      },
    );

    return CreateScheduledQueryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a given scheduled query. This is an irreversible operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledQueryArn] :
  /// The ARN of the scheduled query.
  Future<void> deleteScheduledQuery({
    required String scheduledQueryArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DeleteScheduledQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduledQueryArn': scheduledQueryArn,
      },
    );
  }

  /// Describes the settings for your account that include the query pricing
  /// model and the configured maximum TCUs the service can use for your query
  /// workload.
  ///
  /// You're charged only for the duration of compute units used for your
  /// workloads.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ThrottlingException].
  Future<DescribeAccountSettingsResponse> describeAccountSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DescribeAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// DescribeEndpoints returns a list of available endpoints to make Timestream
  /// API calls against. This API is available through both Write and Query.
  ///
  /// Because the Timestream SDKs are designed to transparently work with the
  /// service’s architecture, including the management and mapping of the
  /// service endpoints, <i>it is not recommended that you use this API
  /// unless</i>:
  ///
  /// <ul>
  /// <li>
  /// You are using <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/VPCEndpoints">VPC
  /// endpoints (Amazon Web Services PrivateLink) with Timestream </a>
  /// </li>
  /// <li>
  /// Your application uses a programming language that does not yet have SDK
  /// support
  /// </li>
  /// <li>
  /// You require better control over the client-side implementation
  /// </li>
  /// </ul>
  /// For detailed information on how and when to use and implement
  /// DescribeEndpoints, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/Using.API.html#Using-API.endpoint-discovery">The
  /// Endpoint Discovery Pattern</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Provides detailed information about a scheduled query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledQueryArn] :
  /// The ARN of the scheduled query.
  Future<DescribeScheduledQueryResponse> describeScheduledQuery({
    required String scheduledQueryArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DescribeScheduledQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduledQueryArn': scheduledQueryArn,
      },
    );

    return DescribeScheduledQueryResponse.fromJson(jsonResponse.body);
  }

  /// You can use this API to run a scheduled query manually.
  ///
  /// If you enabled <code>QueryInsights</code>, this API also returns insights
  /// and metrics related to the query that you executed as part of an Amazon
  /// SNS notification. <code>QueryInsights</code> helps with performance tuning
  /// of your query. For more information about <code>QueryInsights</code>, see
  /// <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html">Using
  /// query insights to optimize queries in Amazon Timestream</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationTime] :
  /// The timestamp in UTC. Query will be run as if it was invoked at this
  /// timestamp.
  ///
  /// Parameter [scheduledQueryArn] :
  /// ARN of the scheduled query.
  ///
  /// Parameter [clientToken] :
  /// Not used.
  ///
  /// Parameter [queryInsights] :
  /// Encapsulates settings for enabling <code>QueryInsights</code>.
  ///
  /// Enabling <code>QueryInsights</code> returns insights and metrics as a part
  /// of the Amazon SNS notification for the query that you executed. You can
  /// use <code>QueryInsights</code> to tune your query performance and cost.
  Future<void> executeScheduledQuery({
    required DateTime invocationTime,
    required String scheduledQueryArn,
    String? clientToken,
    ScheduledQueryInsights? queryInsights,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.ExecuteScheduledQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvocationTime': unixTimestampToJson(invocationTime),
        'ScheduledQueryArn': scheduledQueryArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (queryInsights != null) 'QueryInsights': queryInsights,
      },
    );
  }

  /// Gets a list of all scheduled queries in the caller's Amazon account and
  /// Region. <code>ListScheduledQueries</code> is eventually consistent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the output. If the total number
  /// of items available is more than the value specified, a
  /// <code>NextToken</code> is provided in the output. To resume pagination,
  /// provide the <code>NextToken</code> value as the argument to the subsequent
  /// call to <code>ListScheduledQueriesRequest</code>.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to resume pagination.
  Future<ListScheduledQueriesResponse> listScheduledQueries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.ListScheduledQueries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListScheduledQueriesResponse.fromJson(jsonResponse.body);
  }

  /// List all tags on a Timestream query resource.
  ///
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Timestream resource with tags to be listed. This value is an Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to resume pagination.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// A synchronous operation that allows you to submit a query with parameters
  /// to be stored by Timestream for later running. Timestream only supports
  /// using this operation with <code>ValidateOnly</code> set to
  /// <code>true</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryString] :
  /// The Timestream query string that you want to use as a prepared statement.
  /// Parameter names can be specified in the query string <code>@</code>
  /// character followed by an identifier.
  ///
  /// Parameter [validateOnly] :
  /// By setting this value to <code>true</code>, Timestream will only validate
  /// that the query string is a valid Timestream query, and not store the
  /// prepared query for later use.
  Future<PrepareQueryResponse> prepareQuery({
    required String queryString,
    bool? validateOnly,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.PrepareQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryString': queryString,
        if (validateOnly != null) 'ValidateOnly': validateOnly,
      },
    );

    return PrepareQueryResponse.fromJson(jsonResponse.body);
  }

  /// <code>Query</code> is a synchronous operation that enables you to run a
  /// query against your Amazon Timestream data.
  ///
  /// If you enabled <code>QueryInsights</code>, this API also returns insights
  /// and metrics related to the query that you executed.
  /// <code>QueryInsights</code> helps with performance tuning of your query.
  /// For more information about <code>QueryInsights</code>, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html">Using
  /// query insights to optimize queries in Amazon Timestream</a>.
  /// <note>
  /// The maximum number of <code>Query</code> API requests you're allowed to
  /// make with <code>QueryInsights</code> enabled is 1 query per second (QPS).
  /// If you exceed this query rate, it might result in throttling.
  /// </note>
  /// <code>Query</code> will time out after 60 seconds. You must update the
  /// default timeout in the SDK to support a timeout of 60 seconds. See the <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.run-query.html">code
  /// sample</a> for details.
  ///
  /// Your query request will fail in the following cases:
  ///
  /// <ul>
  /// <li>
  /// If you submit a <code>Query</code> request with the same client token
  /// outside of the 5-minute idempotency window.
  /// </li>
  /// <li>
  /// If you submit a <code>Query</code> request with the same client token, but
  /// change other parameters, within the 5-minute idempotency window.
  /// </li>
  /// <li>
  /// If the size of the row (including the query metadata) exceeds 1 MB, then
  /// the query will fail with the following error message:
  ///
  /// <code>Query aborted as max page response size has been exceeded by the
  /// output result row</code>
  /// </li>
  /// <li>
  /// If the IAM principal of the query initiator and the result reader are not
  /// the same and/or the query initiator and the result reader do not have the
  /// same query string in the query requests, the query will fail with an
  /// <code>Invalid pagination token</code> error.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [QueryExecutionException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryString] :
  /// The query to be run by Timestream.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive string of up to 64 ASCII characters specified when
  /// a <code>Query</code> request is made. Providing a <code>ClientToken</code>
  /// makes the call to <code>Query</code> <i>idempotent</i>. This means that
  /// running the same query repeatedly will produce the same result. In other
  /// words, making multiple identical <code>Query</code> requests has the same
  /// effect as making a single request. When using <code>ClientToken</code> in
  /// a query, note the following:
  ///
  /// <ul>
  /// <li>
  /// If the Query API is instantiated without a <code>ClientToken</code>, the
  /// Query SDK generates a <code>ClientToken</code> on your behalf.
  /// </li>
  /// <li>
  /// If the <code>Query</code> invocation only contains the
  /// <code>ClientToken</code> but does not include a <code>NextToken</code>,
  /// that invocation of <code>Query</code> is assumed to be a new query run.
  /// </li>
  /// <li>
  /// If the invocation contains <code>NextToken</code>, that particular
  /// invocation is assumed to be a subsequent invocation of a prior call to the
  /// Query API, and a result set is returned.
  /// </li>
  /// <li>
  /// After 4 hours, any request with the same <code>ClientToken</code> is
  /// treated as a new request.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxRows] :
  /// The total number of rows to be returned in the <code>Query</code> output.
  /// The initial run of <code>Query</code> with a <code>MaxRows</code> value
  /// specified will return the result set of the query in two cases:
  ///
  /// <ul>
  /// <li>
  /// The size of the result is less than <code>1MB</code>.
  /// </li>
  /// <li>
  /// The number of rows in the result set is less than the value of
  /// <code>maxRows</code>.
  /// </li>
  /// </ul>
  /// Otherwise, the initial invocation of <code>Query</code> only returns a
  /// <code>NextToken</code>, which can then be used in subsequent calls to
  /// fetch the result set. To resume pagination, provide the
  /// <code>NextToken</code> value in the subsequent command.
  ///
  /// If the row size is large (e.g. a row has many columns), Timestream may
  /// return fewer rows to keep the response size from exceeding the 1 MB limit.
  /// If <code>MaxRows</code> is not provided, Timestream will send the
  /// necessary number of rows to meet the 1 MB limit.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to return a set of results. When the
  /// <code>Query</code> API is invoked using <code>NextToken</code>, that
  /// particular invocation is assumed to be a subsequent invocation of a prior
  /// call to <code>Query</code>, and a result set is returned. However, if the
  /// <code>Query</code> invocation only contains the <code>ClientToken</code>,
  /// that invocation of <code>Query</code> is assumed to be a new query run.
  ///
  /// Note the following when using NextToken in a query:
  ///
  /// <ul>
  /// <li>
  /// A pagination token can be used for up to five <code>Query</code>
  /// invocations, OR for a duration of up to 1 hour – whichever comes first.
  /// </li>
  /// <li>
  /// Using the same <code>NextToken</code> will return the same set of records.
  /// To keep paginating through the result set, you must to use the most recent
  /// <code>nextToken</code>.
  /// </li>
  /// <li>
  /// Suppose a <code>Query</code> invocation returns two <code>NextToken</code>
  /// values, <code>TokenA</code> and <code>TokenB</code>. If
  /// <code>TokenB</code> is used in a subsequent <code>Query</code> invocation,
  /// then <code>TokenA</code> is invalidated and cannot be reused.
  /// </li>
  /// <li>
  /// To request a previous result set from a query after pagination has begun,
  /// you must re-invoke the Query API.
  /// </li>
  /// <li>
  /// The latest <code>NextToken</code> should be used to paginate until
  /// <code>null</code> is returned, at which point a new <code>NextToken</code>
  /// should be used.
  /// </li>
  /// <li>
  /// If the IAM principal of the query initiator and the result reader are not
  /// the same and/or the query initiator and the result reader do not have the
  /// same query string in the query requests, the query will fail with an
  /// <code>Invalid pagination token</code> error.
  /// </li>
  /// </ul>
  ///
  /// Parameter [queryInsights] :
  /// Encapsulates settings for enabling <code>QueryInsights</code>.
  ///
  /// Enabling <code>QueryInsights</code> returns insights and metrics in
  /// addition to query results for the query that you executed. You can use
  /// <code>QueryInsights</code> to tune your query performance.
  Future<QueryResponse> query({
    required String queryString,
    String? clientToken,
    int? maxRows,
    String? nextToken,
    QueryInsights? queryInsights,
  }) async {
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
        if (queryInsights != null) 'QueryInsights': queryInsights,
      },
    );

    return QueryResponse.fromJson(jsonResponse.body);
  }

  /// Associate a set of tags with a Timestream resource. You can then activate
  /// these user-defined tags so that they appear on the Billing and Cost
  /// Management console for cost allocation tracking.
  ///
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Identifies the Timestream resource to which tags should be added. This
  /// value is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Timestream resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes the association of tags from a Timestream query resource.
  ///
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Timestream resource that the tags will be removed from. This value is
  /// an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tags keys. Existing tags of the resource whose keys are members
  /// of this list will be removed from the Timestream resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Transitions your account to use TCUs for query pricing and modifies the
  /// maximum query compute units that you've configured. If you reduce the
  /// value of <code>MaxQueryTCU</code> to a desired configuration, the new
  /// value can take up to 24 hours to be effective.
  /// <note>
  /// After you've transitioned your account to use TCUs for query pricing, you
  /// can't transition to using bytes scanned for query pricing.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxQueryTCU] :
  /// The maximum number of compute units the service will use at any point in
  /// time to serve your queries. To run queries, you must set a minimum
  /// capacity of 4 TCU. You can set the maximum number of TCU in multiples of
  /// 4, for example, 4, 8, 16, 32, and so on. The maximum value supported for
  /// <code>MaxQueryTCU</code> is 1000. To request an increase to this soft
  /// limit, contact Amazon Web Services Support. For information about the
  /// default quota for maxQueryTCU, see Default quotas. This configuration is
  /// applicable only for on-demand usage of Timestream Compute Units (TCUs).
  ///
  /// The maximum value supported for <code>MaxQueryTCU</code> is 1000. To
  /// request an increase to this soft limit, contact Amazon Web Services
  /// Support. For information about the default quota for
  /// <code>maxQueryTCU</code>, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.default">Default
  /// quotas</a>.
  ///
  /// Parameter [queryCompute] :
  /// Modifies the query compute settings configured in your account, including
  /// the query pricing model and provisioned Timestream Compute Units (TCUs) in
  /// your account.
  /// <note>
  /// This API is idempotent, meaning that making the same request multiple
  /// times will have the same effect as making the request once.
  /// </note>
  ///
  /// Parameter [queryPricingModel] :
  /// The pricing model for queries in an account.
  /// <note>
  /// The <code>QueryPricingModel</code> parameter is used by several Timestream
  /// operations; however, the <code>UpdateAccountSettings</code> API operation
  /// doesn't recognize any values other than <code>COMPUTE_UNITS</code>.
  /// </note>
  Future<UpdateAccountSettingsResponse> updateAccountSettings({
    int? maxQueryTCU,
    QueryComputeRequest? queryCompute,
    QueryPricingModel? queryPricingModel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UpdateAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxQueryTCU != null) 'MaxQueryTCU': maxQueryTCU,
        if (queryCompute != null) 'QueryCompute': queryCompute,
        if (queryPricingModel != null)
          'QueryPricingModel': queryPricingModel.value,
      },
    );

    return UpdateAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Update a scheduled query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledQueryArn] :
  /// ARN of the scheuled query.
  ///
  /// Parameter [state] :
  /// State of the scheduled query.
  Future<void> updateScheduledQuery({
    required String scheduledQueryArn,
    required ScheduledQueryState state,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UpdateScheduledQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduledQueryArn': scheduledQueryArn,
        'State': state.value,
      },
    );
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

class CreateScheduledQueryResponse {
  /// ARN for the created scheduled query.
  final String arn;

  CreateScheduledQueryResponse({
    required this.arn,
  });

  factory CreateScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledQueryResponse(
      arn: (json['Arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

class DescribeAccountSettingsResponse {
  /// The maximum number of <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/tcu.html">Timestream
  /// compute units</a> (TCUs) the service will use at any point in time to serve
  /// your queries. To run queries, you must set a minimum capacity of 4 TCU. You
  /// can set the maximum number of TCU in multiples of 4, for example, 4, 8, 16,
  /// 32, and so on. This configuration is applicable only for on-demand usage of
  /// (TCUs).
  final int? maxQueryTCU;

  /// An object that contains the usage settings for Timestream Compute Units
  /// (TCUs) in your account for the query workload.
  final QueryComputeResponse? queryCompute;

  /// The pricing model for queries in your account.
  /// <note>
  /// The <code>QueryPricingModel</code> parameter is used by several Timestream
  /// operations; however, the <code>UpdateAccountSettings</code> API operation
  /// doesn't recognize any values other than <code>COMPUTE_UNITS</code>.
  /// </note>
  final QueryPricingModel? queryPricingModel;

  DescribeAccountSettingsResponse({
    this.maxQueryTCU,
    this.queryCompute,
    this.queryPricingModel,
  });

  factory DescribeAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountSettingsResponse(
      maxQueryTCU: json['MaxQueryTCU'] as int?,
      queryCompute: json['QueryCompute'] != null
          ? QueryComputeResponse.fromJson(
              json['QueryCompute'] as Map<String, dynamic>)
          : null,
      queryPricingModel: (json['QueryPricingModel'] as String?)
          ?.let(QueryPricingModel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final maxQueryTCU = this.maxQueryTCU;
    final queryCompute = this.queryCompute;
    final queryPricingModel = this.queryPricingModel;
    return {
      if (maxQueryTCU != null) 'MaxQueryTCU': maxQueryTCU,
      if (queryCompute != null) 'QueryCompute': queryCompute,
      if (queryPricingModel != null)
        'QueryPricingModel': queryPricingModel.value,
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
      endpoints: ((json['Endpoints'] as List?) ?? const [])
          .nonNulls
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

class DescribeScheduledQueryResponse {
  /// The scheduled query.
  final ScheduledQueryDescription scheduledQuery;

  DescribeScheduledQueryResponse({
    required this.scheduledQuery,
  });

  factory DescribeScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduledQueryResponse(
      scheduledQuery: ScheduledQueryDescription.fromJson(
          (json['ScheduledQuery'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledQuery = this.scheduledQuery;
    return {
      'ScheduledQuery': scheduledQuery,
    };
  }
}

class ListScheduledQueriesResponse {
  /// A list of scheduled queries.
  final List<ScheduledQuery> scheduledQueries;

  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  final String? nextToken;

  ListScheduledQueriesResponse({
    required this.scheduledQueries,
    this.nextToken,
  });

  factory ListScheduledQueriesResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledQueriesResponse(
      scheduledQueries: ((json['ScheduledQueries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScheduledQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledQueries = this.scheduledQueries;
    final nextToken = this.nextToken;
    return {
      'ScheduledQueries': scheduledQueries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags currently associated with the Timestream resource.
  final List<Tag> tags;

  /// A pagination token to resume pagination with a subsequent call to
  /// <code>ListTagsForResourceResponse</code>.
  final String? nextToken;

  ListTagsForResourceResponse({
    required this.tags,
    this.nextToken,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: ((json['Tags'] as List?) ?? const [])
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final nextToken = this.nextToken;
    return {
      'Tags': tags,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class PrepareQueryResponse {
  /// A list of SELECT clause columns of the submitted query string.
  final List<SelectColumn> columns;

  /// A list of parameters used in the submitted query string.
  final List<ParameterMapping> parameters;

  /// The query string that you want prepare.
  final String queryString;

  PrepareQueryResponse({
    required this.columns,
    required this.parameters,
    required this.queryString,
  });

  factory PrepareQueryResponse.fromJson(Map<String, dynamic> json) {
    return PrepareQueryResponse(
      columns: ((json['Columns'] as List?) ?? const [])
          .nonNulls
          .map((e) => SelectColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: ((json['Parameters'] as List?) ?? const [])
          .nonNulls
          .map((e) => ParameterMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryString: (json['QueryString'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    final parameters = this.parameters;
    final queryString = this.queryString;
    return {
      'Columns': columns,
      'Parameters': parameters,
      'QueryString': queryString,
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

  /// Encapsulates <code>QueryInsights</code> containing insights and metrics
  /// related to the query that you executed.
  final QueryInsightsResponse? queryInsightsResponse;

  /// Information about the status of the query, including progress and bytes
  /// scanned.
  final QueryStatus? queryStatus;

  QueryResponse({
    required this.columnInfo,
    required this.queryId,
    required this.rows,
    this.nextToken,
    this.queryInsightsResponse,
    this.queryStatus,
  });

  factory QueryResponse.fromJson(Map<String, dynamic> json) {
    return QueryResponse(
      columnInfo: ((json['ColumnInfo'] as List?) ?? const [])
          .nonNulls
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryId: (json['QueryId'] as String?) ?? '',
      rows: ((json['Rows'] as List?) ?? const [])
          .nonNulls
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      queryInsightsResponse: json['QueryInsightsResponse'] != null
          ? QueryInsightsResponse.fromJson(
              json['QueryInsightsResponse'] as Map<String, dynamic>)
          : null,
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
    final queryInsightsResponse = this.queryInsightsResponse;
    final queryStatus = this.queryStatus;
    return {
      'ColumnInfo': columnInfo,
      'QueryId': queryId,
      'Rows': rows,
      if (nextToken != null) 'NextToken': nextToken,
      if (queryInsightsResponse != null)
        'QueryInsightsResponse': queryInsightsResponse,
      if (queryStatus != null) 'QueryStatus': queryStatus,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAccountSettingsResponse {
  /// The configured maximum number of compute units the service will use at any
  /// point in time to serve your queries.
  final int? maxQueryTCU;

  /// Confirms the updated account settings for querying data in your account.
  final QueryComputeResponse? queryCompute;

  /// The pricing model for an account.
  final QueryPricingModel? queryPricingModel;

  UpdateAccountSettingsResponse({
    this.maxQueryTCU,
    this.queryCompute,
    this.queryPricingModel,
  });

  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccountSettingsResponse(
      maxQueryTCU: json['MaxQueryTCU'] as int?,
      queryCompute: json['QueryCompute'] != null
          ? QueryComputeResponse.fromJson(
              json['QueryCompute'] as Map<String, dynamic>)
          : null,
      queryPricingModel: (json['QueryPricingModel'] as String?)
          ?.let(QueryPricingModel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final maxQueryTCU = this.maxQueryTCU;
    final queryCompute = this.queryCompute;
    final queryPricingModel = this.queryPricingModel;
    return {
      if (maxQueryTCU != null) 'MaxQueryTCU': maxQueryTCU,
      if (queryCompute != null) 'QueryCompute': queryCompute,
      if (queryPricingModel != null)
        'QueryPricingModel': queryPricingModel.value,
    };
  }
}

class ScheduledQueryState {
  static const enabled = ScheduledQueryState._('ENABLED');
  static const disabled = ScheduledQueryState._('DISABLED');

  final String value;

  const ScheduledQueryState._(this.value);

  static const values = [enabled, disabled];

  static ScheduledQueryState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledQueryState._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledQueryState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueryPricingModel {
  static const bytesScanned = QueryPricingModel._('BYTES_SCANNED');
  static const computeUnits = QueryPricingModel._('COMPUTE_UNITS');

  final String value;

  const QueryPricingModel._(this.value);

  static const values = [bytesScanned, computeUnits];

  static QueryPricingModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryPricingModel._(value));

  @override
  bool operator ==(other) => other is QueryPricingModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The response to a request to retrieve or update the compute capacity
/// settings for querying data.
class QueryComputeResponse {
  /// The mode in which Timestream Compute Units (TCUs) are allocated and utilized
  /// within an account. Note that in the Asia Pacific (Mumbai) region, the API
  /// operation only recognizes the value <code>PROVISIONED</code>.
  final ComputeMode? computeMode;

  /// Configuration object that contains settings for provisioned Timestream
  /// Compute Units (TCUs) in your account.
  final ProvisionedCapacityResponse? provisionedCapacity;

  QueryComputeResponse({
    this.computeMode,
    this.provisionedCapacity,
  });

  factory QueryComputeResponse.fromJson(Map<String, dynamic> json) {
    return QueryComputeResponse(
      computeMode:
          (json['ComputeMode'] as String?)?.let(ComputeMode.fromString),
      provisionedCapacity: json['ProvisionedCapacity'] != null
          ? ProvisionedCapacityResponse.fromJson(
              json['ProvisionedCapacity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeMode = this.computeMode;
    final provisionedCapacity = this.provisionedCapacity;
    return {
      if (computeMode != null) 'ComputeMode': computeMode.value,
      if (provisionedCapacity != null)
        'ProvisionedCapacity': provisionedCapacity,
    };
  }
}

class ComputeMode {
  static const onDemand = ComputeMode._('ON_DEMAND');
  static const provisioned = ComputeMode._('PROVISIONED');

  final String value;

  const ComputeMode._(this.value);

  static const values = [onDemand, provisioned];

  static ComputeMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ComputeMode._(value));

  @override
  bool operator ==(other) => other is ComputeMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The response to a request to update the provisioned capacity settings for
/// querying data.
class ProvisionedCapacityResponse {
  /// The number of Timestream Compute Units (TCUs) provisioned in the account.
  /// This field is only visible when the compute mode is
  /// <code>PROVISIONED</code>.
  final int? activeQueryTCU;

  /// Information about the last update to the provisioned capacity settings.
  final LastUpdate? lastUpdate;

  /// An object that contains settings for notifications that are sent whenever
  /// the provisioned capacity settings are modified. This field is only visible
  /// when the compute mode is <code>PROVISIONED</code>.
  final AccountSettingsNotificationConfiguration? notificationConfiguration;

  ProvisionedCapacityResponse({
    this.activeQueryTCU,
    this.lastUpdate,
    this.notificationConfiguration,
  });

  factory ProvisionedCapacityResponse.fromJson(Map<String, dynamic> json) {
    return ProvisionedCapacityResponse(
      activeQueryTCU: json['ActiveQueryTCU'] as int?,
      lastUpdate: json['LastUpdate'] != null
          ? LastUpdate.fromJson(json['LastUpdate'] as Map<String, dynamic>)
          : null,
      notificationConfiguration: json['NotificationConfiguration'] != null
          ? AccountSettingsNotificationConfiguration.fromJson(
              json['NotificationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeQueryTCU = this.activeQueryTCU;
    final lastUpdate = this.lastUpdate;
    final notificationConfiguration = this.notificationConfiguration;
    return {
      if (activeQueryTCU != null) 'ActiveQueryTCU': activeQueryTCU,
      if (lastUpdate != null) 'LastUpdate': lastUpdate,
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
    };
  }
}

/// Configuration settings for notifications related to account settings.
class AccountSettingsNotificationConfiguration {
  /// An Amazon Resource Name (ARN) that grants Timestream permission to publish
  /// notifications. This field is only visible if SNS Topic is provided when
  /// updating the account settings.
  final String roleArn;
  final SnsConfiguration? snsConfiguration;

  AccountSettingsNotificationConfiguration({
    required this.roleArn,
    this.snsConfiguration,
  });

  factory AccountSettingsNotificationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AccountSettingsNotificationConfiguration(
      roleArn: (json['RoleArn'] as String?) ?? '',
      snsConfiguration: json['SnsConfiguration'] != null
          ? SnsConfiguration.fromJson(
              json['SnsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final snsConfiguration = this.snsConfiguration;
    return {
      'RoleArn': roleArn,
      if (snsConfiguration != null) 'SnsConfiguration': snsConfiguration,
    };
  }
}

/// Configuration object that contains the most recent account settings update,
/// visible only if settings have been updated previously.
class LastUpdate {
  /// The status of the last update. Can be either <code>PENDING</code>,
  /// <code>FAILED</code>, or <code>SUCCEEDED</code>.
  final LastUpdateStatus? status;

  /// Error message describing the last account settings update status, visible
  /// only if an error occurred.
  final String? statusMessage;

  /// The number of TimeStream Compute Units (TCUs) requested in the last account
  /// settings update.
  final int? targetQueryTCU;

  LastUpdate({
    this.status,
    this.statusMessage,
    this.targetQueryTCU,
  });

  factory LastUpdate.fromJson(Map<String, dynamic> json) {
    return LastUpdate(
      status: (json['Status'] as String?)?.let(LastUpdateStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      targetQueryTCU: json['TargetQueryTCU'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusMessage = this.statusMessage;
    final targetQueryTCU = this.targetQueryTCU;
    return {
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (targetQueryTCU != null) 'TargetQueryTCU': targetQueryTCU,
    };
  }
}

class LastUpdateStatus {
  static const pending = LastUpdateStatus._('PENDING');
  static const failed = LastUpdateStatus._('FAILED');
  static const succeeded = LastUpdateStatus._('SUCCEEDED');

  final String value;

  const LastUpdateStatus._(this.value);

  static const values = [pending, failed, succeeded];

  static LastUpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LastUpdateStatus._(value));

  @override
  bool operator ==(other) => other is LastUpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details on SNS that are required to send the notification.
class SnsConfiguration {
  /// SNS topic ARN that the scheduled query status notifications will be sent to.
  final String topicArn;

  SnsConfiguration({
    required this.topicArn,
  });

  factory SnsConfiguration.fromJson(Map<String, dynamic> json) {
    return SnsConfiguration(
      topicArn: (json['TopicArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'TopicArn': topicArn,
    };
  }
}

/// A request to retrieve or update the compute capacity settings for querying
/// data.
class QueryComputeRequest {
  /// The mode in which Timestream Compute Units (TCUs) are allocated and utilized
  /// within an account. Note that in the Asia Pacific (Mumbai) region, the API
  /// operation only recognizes the value <code>PROVISIONED</code>.
  final ComputeMode? computeMode;

  /// Configuration object that contains settings for provisioned Timestream
  /// Compute Units (TCUs) in your account.
  final ProvisionedCapacityRequest? provisionedCapacity;

  QueryComputeRequest({
    this.computeMode,
    this.provisionedCapacity,
  });

  Map<String, dynamic> toJson() {
    final computeMode = this.computeMode;
    final provisionedCapacity = this.provisionedCapacity;
    return {
      if (computeMode != null) 'ComputeMode': computeMode.value,
      if (provisionedCapacity != null)
        'ProvisionedCapacity': provisionedCapacity,
    };
  }
}

/// A request to update the provisioned capacity settings for querying data.
class ProvisionedCapacityRequest {
  /// The target compute capacity for querying data, specified in Timestream
  /// Compute Units (TCUs).
  final int targetQueryTCU;

  /// Configuration settings for notifications related to the provisioned capacity
  /// update.
  final AccountSettingsNotificationConfiguration? notificationConfiguration;

  ProvisionedCapacityRequest({
    required this.targetQueryTCU,
    this.notificationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final targetQueryTCU = this.targetQueryTCU;
    final notificationConfiguration = this.notificationConfiguration;
    return {
      'TargetQueryTCU': targetQueryTCU,
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
    };
  }
}

/// A tag is a label that you assign to a Timestream database and/or table. Each
/// tag consists of a key and an optional value, both of which you define. Tags
/// enable you to categorize databases and/or tables, for example, by purpose,
/// owner, or environment.
class Tag {
  /// The key of the tag. Tag keys are case sensitive.
  final String key;

  /// The value of the tag. Tag values are case sensitive and can be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// Information about the status of the query, including progress and bytes
/// scanned.
class QueryStatus {
  /// The amount of data scanned by the query in bytes that you will be charged
  /// for. This is a cumulative sum and represents the total amount of data that
  /// you will be charged for since the query was started. The charge is applied
  /// only once and is either applied when the query completes running or when the
  /// query is cancelled.
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

/// Provides various insights and metrics related to the query that you
/// executed.
class QueryInsightsResponse {
  /// Indicates the size of query result set in bytes. You can use this data to
  /// validate if the result set has changed as part of the query tuning exercise.
  final int? outputBytes;

  /// Indicates the total number of rows returned as part of the query result set.
  /// You can use this data to validate if the number of rows in the result set
  /// have changed as part of the query tuning exercise.
  final int? outputRows;

  /// Provides insights into the spatial coverage of the query, including the
  /// table with sub-optimal (max) spatial pruning. This information can help you
  /// identify areas for improvement in your partitioning strategy to enhance
  /// spatial pruning.
  final QuerySpatialCoverage? querySpatialCoverage;

  /// Indicates the number of tables in the query.
  final int? queryTableCount;

  /// Provides insights into the temporal range of the query, including the table
  /// with the largest (max) time range. Following are some of the potential
  /// options for optimizing time-based pruning:
  ///
  /// <ul>
  /// <li>
  /// Add missing time-predicates.
  /// </li>
  /// <li>
  /// Remove functions around the time predicates.
  /// </li>
  /// <li>
  /// Add time predicates to all the sub-queries.
  /// </li>
  /// </ul>
  final QueryTemporalRange? queryTemporalRange;

  /// Indicates the partitions created by the <code>Unload</code> operation.
  final int? unloadPartitionCount;

  /// Indicates the size, in bytes, written by the <code>Unload</code> operation.
  final int? unloadWrittenBytes;

  /// Indicates the rows written by the <code>Unload</code> query.
  final int? unloadWrittenRows;

  QueryInsightsResponse({
    this.outputBytes,
    this.outputRows,
    this.querySpatialCoverage,
    this.queryTableCount,
    this.queryTemporalRange,
    this.unloadPartitionCount,
    this.unloadWrittenBytes,
    this.unloadWrittenRows,
  });

  factory QueryInsightsResponse.fromJson(Map<String, dynamic> json) {
    return QueryInsightsResponse(
      outputBytes: json['OutputBytes'] as int?,
      outputRows: json['OutputRows'] as int?,
      querySpatialCoverage: json['QuerySpatialCoverage'] != null
          ? QuerySpatialCoverage.fromJson(
              json['QuerySpatialCoverage'] as Map<String, dynamic>)
          : null,
      queryTableCount: json['QueryTableCount'] as int?,
      queryTemporalRange: json['QueryTemporalRange'] != null
          ? QueryTemporalRange.fromJson(
              json['QueryTemporalRange'] as Map<String, dynamic>)
          : null,
      unloadPartitionCount: json['UnloadPartitionCount'] as int?,
      unloadWrittenBytes: json['UnloadWrittenBytes'] as int?,
      unloadWrittenRows: json['UnloadWrittenRows'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputBytes = this.outputBytes;
    final outputRows = this.outputRows;
    final querySpatialCoverage = this.querySpatialCoverage;
    final queryTableCount = this.queryTableCount;
    final queryTemporalRange = this.queryTemporalRange;
    final unloadPartitionCount = this.unloadPartitionCount;
    final unloadWrittenBytes = this.unloadWrittenBytes;
    final unloadWrittenRows = this.unloadWrittenRows;
    return {
      if (outputBytes != null) 'OutputBytes': outputBytes,
      if (outputRows != null) 'OutputRows': outputRows,
      if (querySpatialCoverage != null)
        'QuerySpatialCoverage': querySpatialCoverage,
      if (queryTableCount != null) 'QueryTableCount': queryTableCount,
      if (queryTemporalRange != null) 'QueryTemporalRange': queryTemporalRange,
      if (unloadPartitionCount != null)
        'UnloadPartitionCount': unloadPartitionCount,
      if (unloadWrittenBytes != null) 'UnloadWrittenBytes': unloadWrittenBytes,
      if (unloadWrittenRows != null) 'UnloadWrittenRows': unloadWrittenRows,
    };
  }
}

/// Provides insights into the spatial coverage of the query, including the
/// table with sub-optimal (max) spatial pruning. This information can help you
/// identify areas for improvement in your partitioning strategy to enhance
/// spatial pruning
///
/// For example, you can do the following with the
/// <code>QuerySpatialCoverage</code> information:
///
/// <ul>
/// <li>
/// Add measure_name or use <a
/// href="https://docs.aws.amazon.com/timestream/latest/developerguide/customer-defined-partition-keys.html">customer-defined
/// partition key</a> (CDPK) predicates.
/// </li>
/// <li>
/// If you've already done the preceding action, remove functions around them or
/// clauses, such as <code>LIKE</code>.
/// </li>
/// </ul>
class QuerySpatialCoverage {
  /// Provides insights into the spatial coverage of the executed query and the
  /// table with the most inefficient spatial pruning.
  ///
  /// <ul>
  /// <li>
  /// <code>Value</code> – The maximum ratio of spatial coverage.
  /// </li>
  /// <li>
  /// <code>TableArn</code> – The Amazon Resource Name (ARN) of the table with
  /// sub-optimal spatial pruning.
  /// </li>
  /// <li>
  /// <code>PartitionKey</code> – The partition key used for partitioning, which
  /// can be a default <code>measure_name</code> or a CDPK.
  /// </li>
  /// </ul>
  final QuerySpatialCoverageMax? max;

  QuerySpatialCoverage({
    this.max,
  });

  factory QuerySpatialCoverage.fromJson(Map<String, dynamic> json) {
    return QuerySpatialCoverage(
      max: json['Max'] != null
          ? QuerySpatialCoverageMax.fromJson(
              json['Max'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    return {
      if (max != null) 'Max': max,
    };
  }
}

/// Provides insights into the temporal range of the query, including the table
/// with the largest (max) time range.
class QueryTemporalRange {
  /// Encapsulates the following properties that provide insights into the most
  /// sub-optimal performing table on the temporal axis:
  ///
  /// <ul>
  /// <li>
  /// <code>Value</code> – The maximum duration in nanoseconds between the start
  /// and end of the query.
  /// </li>
  /// <li>
  /// <code>TableArn</code> – The Amazon Resource Name (ARN) of the table which is
  /// queried with the largest time range.
  /// </li>
  /// </ul>
  final QueryTemporalRangeMax? max;

  QueryTemporalRange({
    this.max,
  });

  factory QueryTemporalRange.fromJson(Map<String, dynamic> json) {
    return QueryTemporalRange(
      max: json['Max'] != null
          ? QueryTemporalRangeMax.fromJson(json['Max'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    return {
      if (max != null) 'Max': max,
    };
  }
}

/// Provides insights into the table with the most sub-optimal temporal pruning
/// scanned by your query.
class QueryTemporalRangeMax {
  /// The Amazon Resource Name (ARN) of the table which is queried with the
  /// largest time range.
  final String? tableArn;

  /// The maximum duration in nanoseconds between the start and end of the query.
  final int? value;

  QueryTemporalRangeMax({
    this.tableArn,
    this.value,
  });

  factory QueryTemporalRangeMax.fromJson(Map<String, dynamic> json) {
    return QueryTemporalRangeMax(
      tableArn: json['TableArn'] as String?,
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tableArn = this.tableArn;
    final value = this.value;
    return {
      if (tableArn != null) 'TableArn': tableArn,
      if (value != null) 'Value': value,
    };
  }
}

/// Provides insights into the table with the most sub-optimal spatial range
/// scanned by your query.
class QuerySpatialCoverageMax {
  /// The partition key used for partitioning, which can be a default
  /// <code>measure_name</code> or a <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/customer-defined-partition-keys.html">customer
  /// defined partition key</a>.
  final List<String>? partitionKey;

  /// The Amazon Resource Name (ARN) of the table with the most sub-optimal
  /// spatial pruning.
  final String? tableArn;

  /// The maximum ratio of spatial coverage.
  final double? value;

  QuerySpatialCoverageMax({
    this.partitionKey,
    this.tableArn,
    this.value,
  });

  factory QuerySpatialCoverageMax.fromJson(Map<String, dynamic> json) {
    return QuerySpatialCoverageMax(
      partitionKey: (json['PartitionKey'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tableArn: json['TableArn'] as String?,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final partitionKey = this.partitionKey;
    final tableArn = this.tableArn;
    final value = this.value;
    return {
      if (partitionKey != null) 'PartitionKey': partitionKey,
      if (tableArn != null) 'TableArn': tableArn,
      if (value != null) 'Value': value,
    };
  }
}

/// Contains the metadata for query results such as the column names, data
/// types, and other attributes.
class ColumnInfo {
  /// The data type of the result set column. The data type can be a scalar or
  /// complex. Scalar data types are integers, strings, doubles, Booleans, and
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
      type: Type.fromJson(
          (json['Type'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
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

/// Contains the data type of a column in a query result set. The data type can
/// be scalar or complex. The supported scalar data types are integers, Boolean,
/// string, double, timestamp, date, time, and intervals. The supported complex
/// data types are arrays, rows, and timeseries.
class Type {
  /// Indicates if the column is an array.
  final ColumnInfo? arrayColumnInfo;

  /// Indicates if the column is a row.
  final List<ColumnInfo>? rowColumnInfo;

  /// Indicates if the column is of type string, integer, Boolean, double,
  /// timestamp, date, time. For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/supported-data-types.html">Supported
  /// data types</a>.
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
          ?.nonNulls
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalarType: (json['ScalarType'] as String?)?.let(ScalarType.fromString),
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
      if (scalarType != null) 'ScalarType': scalarType.value,
      if (timeSeriesMeasureValueColumnInfo != null)
        'TimeSeriesMeasureValueColumnInfo': timeSeriesMeasureValueColumnInfo,
    };
  }
}

class ScalarType {
  static const varchar = ScalarType._('VARCHAR');
  static const boolean = ScalarType._('BOOLEAN');
  static const bigint = ScalarType._('BIGINT');
  static const $double = ScalarType._('DOUBLE');
  static const timestamp = ScalarType._('TIMESTAMP');
  static const date = ScalarType._('DATE');
  static const time = ScalarType._('TIME');
  static const intervalDayToSecond = ScalarType._('INTERVAL_DAY_TO_SECOND');
  static const intervalYearToMonth = ScalarType._('INTERVAL_YEAR_TO_MONTH');
  static const unknown = ScalarType._('UNKNOWN');
  static const integer = ScalarType._('INTEGER');

  final String value;

  const ScalarType._(this.value);

  static const values = [
    varchar,
    boolean,
    bigint,
    $double,
    timestamp,
    date,
    time,
    intervalDayToSecond,
    intervalYearToMonth,
    unknown,
    integer
  ];

  static ScalarType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScalarType._(value));

  @override
  bool operator ==(other) => other is ScalarType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      data: ((json['Data'] as List?) ?? const [])
          .nonNulls
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

/// Datum represents a single data point in a query result.
class Datum {
  /// Indicates if the data point is an array.
  final List<Datum>? arrayValue;

  /// Indicates if the data point is null.
  final bool? nullValue;

  /// Indicates if the data point is a row.
  final Row? rowValue;

  /// Indicates if the data point is a scalar value such as integer, string,
  /// double, or Boolean.
  final String? scalarValue;

  /// Indicates if the data point is a timeseries data type.
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
          ?.nonNulls
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nullValue: json['NullValue'] as bool?,
      rowValue: json['RowValue'] != null
          ? Row.fromJson(json['RowValue'] as Map<String, dynamic>)
          : null,
      scalarValue: json['ScalarValue'] as String?,
      timeSeriesValue: (json['TimeSeriesValue'] as List?)
          ?.nonNulls
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

/// The timeseries data type represents the values of a measure over time. A
/// time series is an array of rows of timestamps and measure values, with rows
/// sorted in ascending order of time. A TimeSeriesDataPoint is a single data
/// point in the time series. It represents a tuple of (time, measure value) in
/// a time series.
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
      time: (json['Time'] as String?) ?? '',
      value: Datum.fromJson((json['Value'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
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

/// <code>QueryInsights</code> is a performance tuning feature that helps you
/// optimize your queries, reducing costs and improving performance. With
/// <code>QueryInsights</code>, you can assess the pruning efficiency of your
/// queries and identify areas for improvement to enhance query performance.
/// With <code>QueryInsights</code>, you can also analyze the effectiveness of
/// your queries in terms of temporal and spatial pruning, and identify
/// opportunities to improve performance. Specifically, you can evaluate how
/// well your queries use time-based and partition key-based indexing strategies
/// to optimize data retrieval. To optimize query performance, it's essential
/// that you fine-tune both the temporal and spatial parameters that govern
/// query execution.
///
/// The key metrics provided by <code>QueryInsights</code> are
/// <code>QuerySpatialCoverage</code> and <code>QueryTemporalRange</code>.
/// <code>QuerySpatialCoverage</code> indicates how much of the spatial axis the
/// query scans, with lower values being more efficient.
/// <code>QueryTemporalRange</code> shows the time range scanned, with narrower
/// ranges being more performant.
///
/// <b>Benefits of QueryInsights</b>
///
/// The following are the key benefits of using <code>QueryInsights</code>:
///
/// <ul>
/// <li>
/// <b>Identifying inefficient queries</b> – <code>QueryInsights</code> provides
/// information on the time-based and attribute-based pruning of the tables
/// accessed by the query. This information helps you identify the tables that
/// are sub-optimally accessed.
/// </li>
/// <li>
/// <b>Optimizing your data model and partitioning</b> – You can use the
/// <code>QueryInsights</code> information to access and fine-tune your data
/// model and partitioning strategy.
/// </li>
/// <li>
/// <b>Tuning queries</b> – <code>QueryInsights</code> highlights opportunities
/// to use indexes more effectively.
/// </li>
/// </ul> <note>
/// The maximum number of <code>Query</code> API requests you're allowed to make
/// with <code>QueryInsights</code> enabled is 1 query per second (QPS). If you
/// exceed this query rate, it might result in throttling.
/// </note>
class QueryInsights {
  /// Provides the following modes to enable <code>QueryInsights</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED_WITH_RATE_CONTROL</code> – Enables <code>QueryInsights</code>
  /// for the queries being processed. This mode also includes a rate control
  /// mechanism, which limits the <code>QueryInsights</code> feature to 1 query
  /// per second (QPS).
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Disables <code>QueryInsights</code>.
  /// </li>
  /// </ul>
  final QueryInsightsMode mode;

  QueryInsights({
    required this.mode,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'Mode': mode.value,
    };
  }
}

class QueryInsightsMode {
  static const enabledWithRateControl =
      QueryInsightsMode._('ENABLED_WITH_RATE_CONTROL');
  static const disabled = QueryInsightsMode._('DISABLED');

  final String value;

  const QueryInsightsMode._(this.value);

  static const values = [enabledWithRateControl, disabled];

  static QueryInsightsMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryInsightsMode._(value));

  @override
  bool operator ==(other) => other is QueryInsightsMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Mapping for named parameters.
class ParameterMapping {
  /// Parameter name.
  final String name;
  final Type type;

  ParameterMapping({
    required this.name,
    required this.type,
  });

  factory ParameterMapping.fromJson(Map<String, dynamic> json) {
    return ParameterMapping(
      name: (json['Name'] as String?) ?? '',
      type: Type.fromJson(
          (json['Type'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'Name': name,
      'Type': type,
    };
  }
}

/// Details of the column that is returned by the query.
class SelectColumn {
  /// True, if the column name was aliased by the query. False otherwise.
  final bool? aliased;

  /// Database that has this column.
  final String? databaseName;

  /// Name of the column.
  final String? name;

  /// Table within the database that has this column.
  final String? tableName;
  final Type? type;

  SelectColumn({
    this.aliased,
    this.databaseName,
    this.name,
    this.tableName,
    this.type,
  });

  factory SelectColumn.fromJson(Map<String, dynamic> json) {
    return SelectColumn(
      aliased: json['Aliased'] as bool?,
      databaseName: json['DatabaseName'] as String?,
      name: json['Name'] as String?,
      tableName: json['TableName'] as String?,
      type: json['Type'] != null
          ? Type.fromJson(json['Type'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aliased = this.aliased;
    final databaseName = this.databaseName;
    final name = this.name;
    final tableName = this.tableName;
    final type = this.type;
    return {
      if (aliased != null) 'Aliased': aliased,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (name != null) 'Name': name,
      if (tableName != null) 'TableName': tableName,
      if (type != null) 'Type': type,
    };
  }
}

/// Scheduled Query
class ScheduledQuery {
  /// The Amazon Resource Name.
  final String arn;

  /// The name of the scheduled query.
  final String name;

  /// State of scheduled query.
  final ScheduledQueryState state;

  /// The creation time of the scheduled query.
  final DateTime? creationTime;

  /// Configuration for scheduled query error reporting.
  final ErrorReportConfiguration? errorReportConfiguration;

  /// Status of the last scheduled query run.
  final ScheduledQueryRunStatus? lastRunStatus;

  /// The next time the scheduled query is to be run.
  final DateTime? nextInvocationTime;

  /// The last time the scheduled query was run.
  final DateTime? previousInvocationTime;

  /// Target data source where final scheduled query result will be written.
  final TargetDestination? targetDestination;

  ScheduledQuery({
    required this.arn,
    required this.name,
    required this.state,
    this.creationTime,
    this.errorReportConfiguration,
    this.lastRunStatus,
    this.nextInvocationTime,
    this.previousInvocationTime,
    this.targetDestination,
  });

  factory ScheduledQuery.fromJson(Map<String, dynamic> json) {
    return ScheduledQuery(
      arn: (json['Arn'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      state: ScheduledQueryState.fromString((json['State'] as String?) ?? ''),
      creationTime: timeStampFromJson(json['CreationTime']),
      errorReportConfiguration: json['ErrorReportConfiguration'] != null
          ? ErrorReportConfiguration.fromJson(
              json['ErrorReportConfiguration'] as Map<String, dynamic>)
          : null,
      lastRunStatus: (json['LastRunStatus'] as String?)
          ?.let(ScheduledQueryRunStatus.fromString),
      nextInvocationTime: timeStampFromJson(json['NextInvocationTime']),
      previousInvocationTime: timeStampFromJson(json['PreviousInvocationTime']),
      targetDestination: json['TargetDestination'] != null
          ? TargetDestination.fromJson(
              json['TargetDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    final creationTime = this.creationTime;
    final errorReportConfiguration = this.errorReportConfiguration;
    final lastRunStatus = this.lastRunStatus;
    final nextInvocationTime = this.nextInvocationTime;
    final previousInvocationTime = this.previousInvocationTime;
    final targetDestination = this.targetDestination;
    return {
      'Arn': arn,
      'Name': name,
      'State': state.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (errorReportConfiguration != null)
        'ErrorReportConfiguration': errorReportConfiguration,
      if (lastRunStatus != null) 'LastRunStatus': lastRunStatus.value,
      if (nextInvocationTime != null)
        'NextInvocationTime': unixTimestampToJson(nextInvocationTime),
      if (previousInvocationTime != null)
        'PreviousInvocationTime': unixTimestampToJson(previousInvocationTime),
      if (targetDestination != null) 'TargetDestination': targetDestination,
    };
  }
}

/// Configuration required for error reporting.
class ErrorReportConfiguration {
  /// The S3 configuration for the error reports.
  final S3Configuration s3Configuration;

  ErrorReportConfiguration({
    required this.s3Configuration,
  });

  factory ErrorReportConfiguration.fromJson(Map<String, dynamic> json) {
    return ErrorReportConfiguration(
      s3Configuration: S3Configuration.fromJson(
          (json['S3Configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      'S3Configuration': s3Configuration,
    };
  }
}

/// Destination details to write data for a target data source. Current
/// supported data source is Timestream.
class TargetDestination {
  /// Query result destination details for Timestream data source.
  final TimestreamDestination? timestreamDestination;

  TargetDestination({
    this.timestreamDestination,
  });

  factory TargetDestination.fromJson(Map<String, dynamic> json) {
    return TargetDestination(
      timestreamDestination: json['TimestreamDestination'] != null
          ? TimestreamDestination.fromJson(
              json['TimestreamDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timestreamDestination = this.timestreamDestination;
    return {
      if (timestreamDestination != null)
        'TimestreamDestination': timestreamDestination,
    };
  }
}

class ScheduledQueryRunStatus {
  static const autoTriggerSuccess =
      ScheduledQueryRunStatus._('AUTO_TRIGGER_SUCCESS');
  static const autoTriggerFailure =
      ScheduledQueryRunStatus._('AUTO_TRIGGER_FAILURE');
  static const manualTriggerSuccess =
      ScheduledQueryRunStatus._('MANUAL_TRIGGER_SUCCESS');
  static const manualTriggerFailure =
      ScheduledQueryRunStatus._('MANUAL_TRIGGER_FAILURE');

  final String value;

  const ScheduledQueryRunStatus._(this.value);

  static const values = [
    autoTriggerSuccess,
    autoTriggerFailure,
    manualTriggerSuccess,
    manualTriggerFailure
  ];

  static ScheduledQueryRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledQueryRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledQueryRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Destination for scheduled query.
class TimestreamDestination {
  /// Timestream database name.
  final String? databaseName;

  /// Timestream table name.
  final String? tableName;

  TimestreamDestination({
    this.databaseName,
    this.tableName,
  });

  factory TimestreamDestination.fromJson(Map<String, dynamic> json) {
    return TimestreamDestination(
      databaseName: json['DatabaseName'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    return {
      if (databaseName != null) 'DatabaseName': databaseName,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// Details on S3 location for error reports that result from running a query.
class S3Configuration {
  /// Name of the S3 bucket under which error reports will be created.
  final String bucketName;

  /// Encryption at rest options for the error reports. If no encryption option is
  /// specified, Timestream will choose SSE_S3 as default.
  final S3EncryptionOption? encryptionOption;

  /// Prefix for the error report key. Timestream by default adds the following
  /// prefix to the error report path.
  final String? objectKeyPrefix;

  S3Configuration({
    required this.bucketName,
    this.encryptionOption,
    this.objectKeyPrefix,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      bucketName: (json['BucketName'] as String?) ?? '',
      encryptionOption: (json['EncryptionOption'] as String?)
          ?.let(S3EncryptionOption.fromString),
      objectKeyPrefix: json['ObjectKeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final encryptionOption = this.encryptionOption;
    final objectKeyPrefix = this.objectKeyPrefix;
    return {
      'BucketName': bucketName,
      if (encryptionOption != null) 'EncryptionOption': encryptionOption.value,
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
    };
  }
}

class S3EncryptionOption {
  static const sseS3 = S3EncryptionOption._('SSE_S3');
  static const sseKms = S3EncryptionOption._('SSE_KMS');

  final String value;

  const S3EncryptionOption._(this.value);

  static const values = [sseS3, sseKms];

  static S3EncryptionOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3EncryptionOption._(value));

  @override
  bool operator ==(other) =>
      other is S3EncryptionOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Encapsulates settings for enabling <code>QueryInsights</code> on an
/// <code>ExecuteScheduledQueryRequest</code>.
class ScheduledQueryInsights {
  /// Provides the following modes to enable <code>ScheduledQueryInsights</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED_WITH_RATE_CONTROL</code> – Enables
  /// <code>ScheduledQueryInsights</code> for the queries being processed. This
  /// mode also includes a rate control mechanism, which limits the
  /// <code>QueryInsights</code> feature to 1 query per second (QPS).
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – Disables <code>ScheduledQueryInsights</code>.
  /// </li>
  /// </ul>
  final ScheduledQueryInsightsMode mode;

  ScheduledQueryInsights({
    required this.mode,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'Mode': mode.value,
    };
  }
}

class ScheduledQueryInsightsMode {
  static const enabledWithRateControl =
      ScheduledQueryInsightsMode._('ENABLED_WITH_RATE_CONTROL');
  static const disabled = ScheduledQueryInsightsMode._('DISABLED');

  final String value;

  const ScheduledQueryInsightsMode._(this.value);

  static const values = [enabledWithRateControl, disabled];

  static ScheduledQueryInsightsMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledQueryInsightsMode._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledQueryInsightsMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure that describes scheduled query.
class ScheduledQueryDescription {
  /// Scheduled query ARN.
  final String arn;

  /// Name of the scheduled query.
  final String name;

  /// Notification configuration.
  final NotificationConfiguration notificationConfiguration;

  /// The query to be run.
  final String queryString;

  /// Schedule configuration.
  final ScheduleConfiguration scheduleConfiguration;

  /// State of the scheduled query.
  final ScheduledQueryState state;

  /// Creation time of the scheduled query.
  final DateTime? creationTime;

  /// Error-reporting configuration for the scheduled query.
  final ErrorReportConfiguration? errorReportConfiguration;

  /// A customer provided KMS key used to encrypt the scheduled query resource.
  final String? kmsKeyId;

  /// Runtime summary for the last scheduled query run.
  final ScheduledQueryRunSummary? lastRunSummary;

  /// The next time the scheduled query is scheduled to run.
  final DateTime? nextInvocationTime;

  /// Last time the query was run.
  final DateTime? previousInvocationTime;

  /// Runtime summary for the last five failed scheduled query runs.
  final List<ScheduledQueryRunSummary>? recentlyFailedRuns;

  /// IAM role that Timestream uses to run the schedule query.
  final String? scheduledQueryExecutionRoleArn;

  /// Scheduled query target store configuration.
  final TargetConfiguration? targetConfiguration;

  ScheduledQueryDescription({
    required this.arn,
    required this.name,
    required this.notificationConfiguration,
    required this.queryString,
    required this.scheduleConfiguration,
    required this.state,
    this.creationTime,
    this.errorReportConfiguration,
    this.kmsKeyId,
    this.lastRunSummary,
    this.nextInvocationTime,
    this.previousInvocationTime,
    this.recentlyFailedRuns,
    this.scheduledQueryExecutionRoleArn,
    this.targetConfiguration,
  });

  factory ScheduledQueryDescription.fromJson(Map<String, dynamic> json) {
    return ScheduledQueryDescription(
      arn: (json['Arn'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      notificationConfiguration: NotificationConfiguration.fromJson(
          (json['NotificationConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      queryString: (json['QueryString'] as String?) ?? '',
      scheduleConfiguration: ScheduleConfiguration.fromJson(
          (json['ScheduleConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      state: ScheduledQueryState.fromString((json['State'] as String?) ?? ''),
      creationTime: timeStampFromJson(json['CreationTime']),
      errorReportConfiguration: json['ErrorReportConfiguration'] != null
          ? ErrorReportConfiguration.fromJson(
              json['ErrorReportConfiguration'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      lastRunSummary: json['LastRunSummary'] != null
          ? ScheduledQueryRunSummary.fromJson(
              json['LastRunSummary'] as Map<String, dynamic>)
          : null,
      nextInvocationTime: timeStampFromJson(json['NextInvocationTime']),
      previousInvocationTime: timeStampFromJson(json['PreviousInvocationTime']),
      recentlyFailedRuns: (json['RecentlyFailedRuns'] as List?)
          ?.nonNulls
          .map((e) =>
              ScheduledQueryRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledQueryExecutionRoleArn:
          json['ScheduledQueryExecutionRoleArn'] as String?,
      targetConfiguration: json['TargetConfiguration'] != null
          ? TargetConfiguration.fromJson(
              json['TargetConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final notificationConfiguration = this.notificationConfiguration;
    final queryString = this.queryString;
    final scheduleConfiguration = this.scheduleConfiguration;
    final state = this.state;
    final creationTime = this.creationTime;
    final errorReportConfiguration = this.errorReportConfiguration;
    final kmsKeyId = this.kmsKeyId;
    final lastRunSummary = this.lastRunSummary;
    final nextInvocationTime = this.nextInvocationTime;
    final previousInvocationTime = this.previousInvocationTime;
    final recentlyFailedRuns = this.recentlyFailedRuns;
    final scheduledQueryExecutionRoleArn = this.scheduledQueryExecutionRoleArn;
    final targetConfiguration = this.targetConfiguration;
    return {
      'Arn': arn,
      'Name': name,
      'NotificationConfiguration': notificationConfiguration,
      'QueryString': queryString,
      'ScheduleConfiguration': scheduleConfiguration,
      'State': state.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (errorReportConfiguration != null)
        'ErrorReportConfiguration': errorReportConfiguration,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastRunSummary != null) 'LastRunSummary': lastRunSummary,
      if (nextInvocationTime != null)
        'NextInvocationTime': unixTimestampToJson(nextInvocationTime),
      if (previousInvocationTime != null)
        'PreviousInvocationTime': unixTimestampToJson(previousInvocationTime),
      if (recentlyFailedRuns != null) 'RecentlyFailedRuns': recentlyFailedRuns,
      if (scheduledQueryExecutionRoleArn != null)
        'ScheduledQueryExecutionRoleArn': scheduledQueryExecutionRoleArn,
      if (targetConfiguration != null)
        'TargetConfiguration': targetConfiguration,
    };
  }
}

/// Configuration of the schedule of the query.
class ScheduleConfiguration {
  /// An expression that denotes when to trigger the scheduled query run. This can
  /// be a cron expression or a rate expression.
  final String scheduleExpression;

  ScheduleConfiguration({
    required this.scheduleExpression,
  });

  factory ScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return ScheduleConfiguration(
      scheduleExpression: (json['ScheduleExpression'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    return {
      'ScheduleExpression': scheduleExpression,
    };
  }
}

/// Notification configuration for a scheduled query. A notification is sent by
/// Timestream when a scheduled query is created, its state is updated or when
/// it is deleted.
class NotificationConfiguration {
  /// Details about the Amazon Simple Notification Service (SNS) configuration.
  /// This field is visible only when SNS Topic is provided when updating the
  /// account settings.
  final SnsConfiguration snsConfiguration;

  NotificationConfiguration({
    required this.snsConfiguration,
  });

  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationConfiguration(
      snsConfiguration: SnsConfiguration.fromJson(
          (json['SnsConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final snsConfiguration = this.snsConfiguration;
    return {
      'SnsConfiguration': snsConfiguration,
    };
  }
}

/// Configuration used for writing the output of a query.
class TargetConfiguration {
  /// Configuration needed to write data into the Timestream database and table.
  final TimestreamConfiguration timestreamConfiguration;

  TargetConfiguration({
    required this.timestreamConfiguration,
  });

  factory TargetConfiguration.fromJson(Map<String, dynamic> json) {
    return TargetConfiguration(
      timestreamConfiguration: TimestreamConfiguration.fromJson(
          (json['TimestreamConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final timestreamConfiguration = this.timestreamConfiguration;
    return {
      'TimestreamConfiguration': timestreamConfiguration,
    };
  }
}

/// Run summary for the scheduled query
class ScheduledQueryRunSummary {
  /// S3 location for error report.
  final ErrorReportLocation? errorReportLocation;

  /// Runtime statistics for a scheduled run.
  final ExecutionStats? executionStats;

  /// Error message for the scheduled query in case of failure. You might have to
  /// look at the error report to get more detailed error reasons.
  final String? failureReason;

  /// InvocationTime for this run. This is the time at which the query is
  /// scheduled to run. Parameter <code>@scheduled_runtime</code> can be used in
  /// the query to get the value.
  final DateTime? invocationTime;

  /// Provides various insights and metrics related to the run summary of the
  /// scheduled query.
  final ScheduledQueryInsightsResponse? queryInsightsResponse;

  /// The status of a scheduled query run.
  final ScheduledQueryRunStatus? runStatus;

  /// The actual time when the query was run.
  final DateTime? triggerTime;

  ScheduledQueryRunSummary({
    this.errorReportLocation,
    this.executionStats,
    this.failureReason,
    this.invocationTime,
    this.queryInsightsResponse,
    this.runStatus,
    this.triggerTime,
  });

  factory ScheduledQueryRunSummary.fromJson(Map<String, dynamic> json) {
    return ScheduledQueryRunSummary(
      errorReportLocation: json['ErrorReportLocation'] != null
          ? ErrorReportLocation.fromJson(
              json['ErrorReportLocation'] as Map<String, dynamic>)
          : null,
      executionStats: json['ExecutionStats'] != null
          ? ExecutionStats.fromJson(
              json['ExecutionStats'] as Map<String, dynamic>)
          : null,
      failureReason: json['FailureReason'] as String?,
      invocationTime: timeStampFromJson(json['InvocationTime']),
      queryInsightsResponse: json['QueryInsightsResponse'] != null
          ? ScheduledQueryInsightsResponse.fromJson(
              json['QueryInsightsResponse'] as Map<String, dynamic>)
          : null,
      runStatus: (json['RunStatus'] as String?)
          ?.let(ScheduledQueryRunStatus.fromString),
      triggerTime: timeStampFromJson(json['TriggerTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final errorReportLocation = this.errorReportLocation;
    final executionStats = this.executionStats;
    final failureReason = this.failureReason;
    final invocationTime = this.invocationTime;
    final queryInsightsResponse = this.queryInsightsResponse;
    final runStatus = this.runStatus;
    final triggerTime = this.triggerTime;
    return {
      if (errorReportLocation != null)
        'ErrorReportLocation': errorReportLocation,
      if (executionStats != null) 'ExecutionStats': executionStats,
      if (failureReason != null) 'FailureReason': failureReason,
      if (invocationTime != null)
        'InvocationTime': unixTimestampToJson(invocationTime),
      if (queryInsightsResponse != null)
        'QueryInsightsResponse': queryInsightsResponse,
      if (runStatus != null) 'RunStatus': runStatus.value,
      if (triggerTime != null) 'TriggerTime': unixTimestampToJson(triggerTime),
    };
  }
}

/// Statistics for a single scheduled query run.
class ExecutionStats {
  /// Bytes metered for a single scheduled query run.
  final int? bytesMetered;

  /// Bytes scanned for a single scheduled query run.
  final int? cumulativeBytesScanned;

  /// Data writes metered for records ingested in a single scheduled query run.
  final int? dataWrites;

  /// Total time, measured in milliseconds, that was needed for the scheduled
  /// query run to complete.
  final int? executionTimeInMillis;

  /// Number of rows present in the output from running a query before ingestion
  /// to destination data source.
  final int? queryResultRows;

  /// The number of records ingested for a single scheduled query run.
  final int? recordsIngested;

  ExecutionStats({
    this.bytesMetered,
    this.cumulativeBytesScanned,
    this.dataWrites,
    this.executionTimeInMillis,
    this.queryResultRows,
    this.recordsIngested,
  });

  factory ExecutionStats.fromJson(Map<String, dynamic> json) {
    return ExecutionStats(
      bytesMetered: json['BytesMetered'] as int?,
      cumulativeBytesScanned: json['CumulativeBytesScanned'] as int?,
      dataWrites: json['DataWrites'] as int?,
      executionTimeInMillis: json['ExecutionTimeInMillis'] as int?,
      queryResultRows: json['QueryResultRows'] as int?,
      recordsIngested: json['RecordsIngested'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesMetered = this.bytesMetered;
    final cumulativeBytesScanned = this.cumulativeBytesScanned;
    final dataWrites = this.dataWrites;
    final executionTimeInMillis = this.executionTimeInMillis;
    final queryResultRows = this.queryResultRows;
    final recordsIngested = this.recordsIngested;
    return {
      if (bytesMetered != null) 'BytesMetered': bytesMetered,
      if (cumulativeBytesScanned != null)
        'CumulativeBytesScanned': cumulativeBytesScanned,
      if (dataWrites != null) 'DataWrites': dataWrites,
      if (executionTimeInMillis != null)
        'ExecutionTimeInMillis': executionTimeInMillis,
      if (queryResultRows != null) 'QueryResultRows': queryResultRows,
      if (recordsIngested != null) 'RecordsIngested': recordsIngested,
    };
  }
}

/// Provides various insights and metrics related to the
/// <code>ExecuteScheduledQueryRequest</code> that was executed.
class ScheduledQueryInsightsResponse {
  /// Indicates the size of query result set in bytes. You can use this data to
  /// validate if the result set has changed as part of the query tuning exercise.
  final int? outputBytes;

  /// Indicates the total number of rows returned as part of the query result set.
  /// You can use this data to validate if the number of rows in the result set
  /// have changed as part of the query tuning exercise.
  final int? outputRows;

  /// Provides insights into the spatial coverage of the query, including the
  /// table with sub-optimal (max) spatial pruning. This information can help you
  /// identify areas for improvement in your partitioning strategy to enhance
  /// spatial pruning.
  final QuerySpatialCoverage? querySpatialCoverage;

  /// Indicates the number of tables in the query.
  final int? queryTableCount;

  /// Provides insights into the temporal range of the query, including the table
  /// with the largest (max) time range. Following are some of the potential
  /// options for optimizing time-based pruning:
  ///
  /// <ul>
  /// <li>
  /// Add missing time-predicates.
  /// </li>
  /// <li>
  /// Remove functions around the time predicates.
  /// </li>
  /// <li>
  /// Add time predicates to all the sub-queries.
  /// </li>
  /// </ul>
  final QueryTemporalRange? queryTemporalRange;

  ScheduledQueryInsightsResponse({
    this.outputBytes,
    this.outputRows,
    this.querySpatialCoverage,
    this.queryTableCount,
    this.queryTemporalRange,
  });

  factory ScheduledQueryInsightsResponse.fromJson(Map<String, dynamic> json) {
    return ScheduledQueryInsightsResponse(
      outputBytes: json['OutputBytes'] as int?,
      outputRows: json['OutputRows'] as int?,
      querySpatialCoverage: json['QuerySpatialCoverage'] != null
          ? QuerySpatialCoverage.fromJson(
              json['QuerySpatialCoverage'] as Map<String, dynamic>)
          : null,
      queryTableCount: json['QueryTableCount'] as int?,
      queryTemporalRange: json['QueryTemporalRange'] != null
          ? QueryTemporalRange.fromJson(
              json['QueryTemporalRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outputBytes = this.outputBytes;
    final outputRows = this.outputRows;
    final querySpatialCoverage = this.querySpatialCoverage;
    final queryTableCount = this.queryTableCount;
    final queryTemporalRange = this.queryTemporalRange;
    return {
      if (outputBytes != null) 'OutputBytes': outputBytes,
      if (outputRows != null) 'OutputRows': outputRows,
      if (querySpatialCoverage != null)
        'QuerySpatialCoverage': querySpatialCoverage,
      if (queryTableCount != null) 'QueryTableCount': queryTableCount,
      if (queryTemporalRange != null) 'QueryTemporalRange': queryTemporalRange,
    };
  }
}

/// This contains the location of the error report for a single scheduled query
/// call.
class ErrorReportLocation {
  /// The S3 location where error reports are written.
  final S3ReportLocation? s3ReportLocation;

  ErrorReportLocation({
    this.s3ReportLocation,
  });

  factory ErrorReportLocation.fromJson(Map<String, dynamic> json) {
    return ErrorReportLocation(
      s3ReportLocation: json['S3ReportLocation'] != null
          ? S3ReportLocation.fromJson(
              json['S3ReportLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ReportLocation = this.s3ReportLocation;
    return {
      if (s3ReportLocation != null) 'S3ReportLocation': s3ReportLocation,
    };
  }
}

/// S3 report location for the scheduled query run.
class S3ReportLocation {
  /// S3 bucket name.
  final String? bucketName;

  /// S3 key.
  final String? objectKey;

  S3ReportLocation({
    this.bucketName,
    this.objectKey,
  });

  factory S3ReportLocation.fromJson(Map<String, dynamic> json) {
    return S3ReportLocation(
      bucketName: json['BucketName'] as String?,
      objectKey: json['ObjectKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (objectKey != null) 'ObjectKey': objectKey,
    };
  }
}

/// Configuration to write data into Timestream database and table. This
/// configuration allows the user to map the query result select columns into
/// the destination table columns.
class TimestreamConfiguration {
  /// Name of Timestream database to which the query result will be written.
  final String databaseName;

  /// This is to allow mapping column(s) from the query result to the dimension in
  /// the destination table.
  final List<DimensionMapping> dimensionMappings;

  /// Name of Timestream table that the query result will be written to. The table
  /// should be within the same database that is provided in Timestream
  /// configuration.
  final String tableName;

  /// Column from query result that should be used as the time column in
  /// destination table. Column type for this should be TIMESTAMP.
  final String timeColumn;

  /// Name of the measure column.
  final String? measureNameColumn;

  /// Specifies how to map measures to multi-measure records.
  final List<MixedMeasureMapping>? mixedMeasureMappings;

  /// Multi-measure mappings.
  final MultiMeasureMappings? multiMeasureMappings;

  TimestreamConfiguration({
    required this.databaseName,
    required this.dimensionMappings,
    required this.tableName,
    required this.timeColumn,
    this.measureNameColumn,
    this.mixedMeasureMappings,
    this.multiMeasureMappings,
  });

  factory TimestreamConfiguration.fromJson(Map<String, dynamic> json) {
    return TimestreamConfiguration(
      databaseName: (json['DatabaseName'] as String?) ?? '',
      dimensionMappings: ((json['DimensionMappings'] as List?) ?? const [])
          .nonNulls
          .map((e) => DimensionMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: (json['TableName'] as String?) ?? '',
      timeColumn: (json['TimeColumn'] as String?) ?? '',
      measureNameColumn: json['MeasureNameColumn'] as String?,
      mixedMeasureMappings: (json['MixedMeasureMappings'] as List?)
          ?.nonNulls
          .map((e) => MixedMeasureMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      multiMeasureMappings: json['MultiMeasureMappings'] != null
          ? MultiMeasureMappings.fromJson(
              json['MultiMeasureMappings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final dimensionMappings = this.dimensionMappings;
    final tableName = this.tableName;
    final timeColumn = this.timeColumn;
    final measureNameColumn = this.measureNameColumn;
    final mixedMeasureMappings = this.mixedMeasureMappings;
    final multiMeasureMappings = this.multiMeasureMappings;
    return {
      'DatabaseName': databaseName,
      'DimensionMappings': dimensionMappings,
      'TableName': tableName,
      'TimeColumn': timeColumn,
      if (measureNameColumn != null) 'MeasureNameColumn': measureNameColumn,
      if (mixedMeasureMappings != null)
        'MixedMeasureMappings': mixedMeasureMappings,
      if (multiMeasureMappings != null)
        'MultiMeasureMappings': multiMeasureMappings,
    };
  }
}

/// Only one of MixedMeasureMappings or MultiMeasureMappings is to be provided.
/// MultiMeasureMappings can be used to ingest data as multi measures in the
/// derived table.
class MultiMeasureMappings {
  /// Required. Attribute mappings to be used for mapping query results to ingest
  /// data for multi-measure attributes.
  final List<MultiMeasureAttributeMapping> multiMeasureAttributeMappings;

  /// The name of the target multi-measure name in the derived table. This input
  /// is required when measureNameColumn is not provided. If MeasureNameColumn is
  /// provided, then value from that column will be used as multi-measure name.
  final String? targetMultiMeasureName;

  MultiMeasureMappings({
    required this.multiMeasureAttributeMappings,
    this.targetMultiMeasureName,
  });

  factory MultiMeasureMappings.fromJson(Map<String, dynamic> json) {
    return MultiMeasureMappings(
      multiMeasureAttributeMappings: ((json['MultiMeasureAttributeMappings']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              MultiMeasureAttributeMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetMultiMeasureName: json['TargetMultiMeasureName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiMeasureAttributeMappings = this.multiMeasureAttributeMappings;
    final targetMultiMeasureName = this.targetMultiMeasureName;
    return {
      'MultiMeasureAttributeMappings': multiMeasureAttributeMappings,
      if (targetMultiMeasureName != null)
        'TargetMultiMeasureName': targetMultiMeasureName,
    };
  }
}

/// MixedMeasureMappings are mappings that can be used to ingest data into a
/// mixture of narrow and multi measures in the derived table.
class MixedMeasureMapping {
  /// Type of the value that is to be read from sourceColumn. If the mapping is
  /// for MULTI, use MeasureValueType.MULTI.
  final MeasureValueType measureValueType;

  /// Refers to the value of measure_name in a result row. This field is required
  /// if MeasureNameColumn is provided.
  final String? measureName;

  /// Required when measureValueType is MULTI. Attribute mappings for MULTI value
  /// measures.
  final List<MultiMeasureAttributeMapping>? multiMeasureAttributeMappings;

  /// This field refers to the source column from which measure-value is to be
  /// read for result materialization.
  final String? sourceColumn;

  /// Target measure name to be used. If not provided, the target measure name by
  /// default would be measure-name if provided, or sourceColumn otherwise.
  final String? targetMeasureName;

  MixedMeasureMapping({
    required this.measureValueType,
    this.measureName,
    this.multiMeasureAttributeMappings,
    this.sourceColumn,
    this.targetMeasureName,
  });

  factory MixedMeasureMapping.fromJson(Map<String, dynamic> json) {
    return MixedMeasureMapping(
      measureValueType: MeasureValueType.fromString(
          (json['MeasureValueType'] as String?) ?? ''),
      measureName: json['MeasureName'] as String?,
      multiMeasureAttributeMappings: (json['MultiMeasureAttributeMappings']
              as List?)
          ?.nonNulls
          .map((e) =>
              MultiMeasureAttributeMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceColumn: json['SourceColumn'] as String?,
      targetMeasureName: json['TargetMeasureName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final measureValueType = this.measureValueType;
    final measureName = this.measureName;
    final multiMeasureAttributeMappings = this.multiMeasureAttributeMappings;
    final sourceColumn = this.sourceColumn;
    final targetMeasureName = this.targetMeasureName;
    return {
      'MeasureValueType': measureValueType.value,
      if (measureName != null) 'MeasureName': measureName,
      if (multiMeasureAttributeMappings != null)
        'MultiMeasureAttributeMappings': multiMeasureAttributeMappings,
      if (sourceColumn != null) 'SourceColumn': sourceColumn,
      if (targetMeasureName != null) 'TargetMeasureName': targetMeasureName,
    };
  }
}

class MeasureValueType {
  static const bigint = MeasureValueType._('BIGINT');
  static const boolean = MeasureValueType._('BOOLEAN');
  static const $double = MeasureValueType._('DOUBLE');
  static const varchar = MeasureValueType._('VARCHAR');
  static const multi = MeasureValueType._('MULTI');

  final String value;

  const MeasureValueType._(this.value);

  static const values = [bigint, boolean, $double, varchar, multi];

  static MeasureValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MeasureValueType._(value));

  @override
  bool operator ==(other) => other is MeasureValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Attribute mapping for MULTI value measures.
class MultiMeasureAttributeMapping {
  /// Type of the attribute to be read from the source column.
  final ScalarMeasureValueType measureValueType;

  /// Source column from where the attribute value is to be read.
  final String sourceColumn;

  /// Custom name to be used for attribute name in derived table. If not provided,
  /// source column name would be used.
  final String? targetMultiMeasureAttributeName;

  MultiMeasureAttributeMapping({
    required this.measureValueType,
    required this.sourceColumn,
    this.targetMultiMeasureAttributeName,
  });

  factory MultiMeasureAttributeMapping.fromJson(Map<String, dynamic> json) {
    return MultiMeasureAttributeMapping(
      measureValueType: ScalarMeasureValueType.fromString(
          (json['MeasureValueType'] as String?) ?? ''),
      sourceColumn: (json['SourceColumn'] as String?) ?? '',
      targetMultiMeasureAttributeName:
          json['TargetMultiMeasureAttributeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final measureValueType = this.measureValueType;
    final sourceColumn = this.sourceColumn;
    final targetMultiMeasureAttributeName =
        this.targetMultiMeasureAttributeName;
    return {
      'MeasureValueType': measureValueType.value,
      'SourceColumn': sourceColumn,
      if (targetMultiMeasureAttributeName != null)
        'TargetMultiMeasureAttributeName': targetMultiMeasureAttributeName,
    };
  }
}

class ScalarMeasureValueType {
  static const bigint = ScalarMeasureValueType._('BIGINT');
  static const boolean = ScalarMeasureValueType._('BOOLEAN');
  static const $double = ScalarMeasureValueType._('DOUBLE');
  static const varchar = ScalarMeasureValueType._('VARCHAR');
  static const timestamp = ScalarMeasureValueType._('TIMESTAMP');

  final String value;

  const ScalarMeasureValueType._(this.value);

  static const values = [bigint, boolean, $double, varchar, timestamp];

  static ScalarMeasureValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScalarMeasureValueType._(value));

  @override
  bool operator ==(other) =>
      other is ScalarMeasureValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This type is used to map column(s) from the query result to a dimension in
/// the destination table.
class DimensionMapping {
  /// Type for the dimension.
  final DimensionValueType dimensionValueType;

  /// Column name from query result.
  final String name;

  DimensionMapping({
    required this.dimensionValueType,
    required this.name,
  });

  factory DimensionMapping.fromJson(Map<String, dynamic> json) {
    return DimensionMapping(
      dimensionValueType: DimensionValueType.fromString(
          (json['DimensionValueType'] as String?) ?? ''),
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValueType = this.dimensionValueType;
    final name = this.name;
    return {
      'DimensionValueType': dimensionValueType.value,
      'Name': name,
    };
  }
}

class DimensionValueType {
  static const varchar = DimensionValueType._('VARCHAR');

  final String value;

  const DimensionValueType._(this.value);

  static const values = [varchar];

  static DimensionValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DimensionValueType._(value));

  @override
  bool operator ==(other) =>
      other is DimensionValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an available endpoint against which to make API calls against, as
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
      address: (json['Address'] as String?) ?? '',
      cachePeriodInMinutes: (json['CachePeriodInMinutes'] as int?) ?? 0,
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
