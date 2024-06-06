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
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ThrottlingException].
  /// May throw [InvalidEndpointException].
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

  /// Provides detailed information about a scheduled query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  Future<void> executeScheduledQuery({
    required DateTime invocationTime,
    required String scheduledQueryArn,
    String? clientToken,
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
      },
    );
  }

  /// Gets a list of all scheduled queries in the caller's Amazon account and
  /// Region. <code>ListScheduledQueries</code> is eventually consistent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// query against your Amazon Timestream data. <code>Query</code> will time
  /// out after 60 seconds. You must update the default timeout in the SDK to
  /// support a timeout of 60 seconds. See the <a
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
  /// May throw [QueryExecutionException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  Future<QueryResponse> query({
    required String queryString,
    String? clientToken,
    int? maxRows,
    String? nextToken,
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
      },
    );

    return QueryResponse.fromJson(jsonResponse.body);
  }

  /// Associate a set of tags with a Timestream resource. You can then activate
  /// these user-defined tags so that they appear on the Billing and Cost
  /// Management console for cost allocation tracking.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidEndpointException].
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
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [maxQueryTCU] :
  /// The maximum number of compute units the service will use at any point in
  /// time to serve your queries. To run queries, you must set a minimum
  /// capacity of 4 TCU. You can set the maximum number of TCU in multiples of
  /// 4, for example, 4, 8, 16, 32, and so on.
  ///
  /// The maximum value supported for <code>MaxQueryTCU</code> is 1000. To
  /// request an increase to this soft limit, contact Amazon Web Services
  /// Support. For information about the default quota for maxQueryTCU, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.default">Default
  /// quotas</a>.
  ///
  /// Parameter [queryPricingModel] :
  /// The pricing model for queries in an account.
  Future<UpdateAccountSettingsResponse> updateAccountSettings({
    int? maxQueryTCU,
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
        if (queryPricingModel != null)
          'QueryPricingModel': queryPricingModel.toValue(),
      },
    );

    return UpdateAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Update a scheduled query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
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
        'State': state.toValue(),
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

class CreateScheduledQueryResponse {
  /// ARN for the created scheduled query.
  final String arn;

  CreateScheduledQueryResponse({
    required this.arn,
  });

  factory CreateScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledQueryResponse(
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
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

class DescribeAccountSettingsResponse {
  /// The maximum number of <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/tcu.html">Timestream
  /// compute units</a> (TCUs) the service will use at any point in time to serve
  /// your queries.
  final int? maxQueryTCU;

  /// The pricing model for queries in your account.
  final QueryPricingModel? queryPricingModel;

  DescribeAccountSettingsResponse({
    this.maxQueryTCU,
    this.queryPricingModel,
  });

  factory DescribeAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountSettingsResponse(
      maxQueryTCU: json['MaxQueryTCU'] as int?,
      queryPricingModel:
          (json['QueryPricingModel'] as String?)?.toQueryPricingModel(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxQueryTCU = this.maxQueryTCU;
    final queryPricingModel = this.queryPricingModel;
    return {
      if (maxQueryTCU != null) 'MaxQueryTCU': maxQueryTCU,
      if (queryPricingModel != null)
        'QueryPricingModel': queryPricingModel.toValue(),
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

class DescribeScheduledQueryResponse {
  /// The scheduled query.
  final ScheduledQueryDescription scheduledQuery;

  DescribeScheduledQueryResponse({
    required this.scheduledQuery,
  });

  factory DescribeScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduledQueryResponse(
      scheduledQuery: ScheduledQueryDescription.fromJson(
          json['ScheduledQuery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledQuery = this.scheduledQuery;
    return {
      'ScheduledQuery': scheduledQuery,
    };
  }
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
      dimensionValueType:
          (json['DimensionValueType'] as String).toDimensionValueType(),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValueType = this.dimensionValueType;
    final name = this.name;
    return {
      'DimensionValueType': dimensionValueType.toValue(),
      'Name': name,
    };
  }
}

enum DimensionValueType {
  varchar,
}

extension DimensionValueTypeValueExtension on DimensionValueType {
  String toValue() {
    switch (this) {
      case DimensionValueType.varchar:
        return 'VARCHAR';
    }
  }
}

extension DimensionValueTypeFromString on String {
  DimensionValueType toDimensionValueType() {
    switch (this) {
      case 'VARCHAR':
        return DimensionValueType.varchar;
    }
    throw Exception('$this is not known in enum DimensionValueType');
  }
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
          json['S3Configuration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      'S3Configuration': s3Configuration,
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
      scheduledQueries: (json['ScheduledQueries'] as List)
          .whereNotNull()
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
      tags: (json['Tags'] as List)
          .whereNotNull()
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

enum MeasureValueType {
  bigint,
  boolean,
  double,
  varchar,
  multi,
}

extension MeasureValueTypeValueExtension on MeasureValueType {
  String toValue() {
    switch (this) {
      case MeasureValueType.bigint:
        return 'BIGINT';
      case MeasureValueType.boolean:
        return 'BOOLEAN';
      case MeasureValueType.double:
        return 'DOUBLE';
      case MeasureValueType.varchar:
        return 'VARCHAR';
      case MeasureValueType.multi:
        return 'MULTI';
    }
  }
}

extension MeasureValueTypeFromString on String {
  MeasureValueType toMeasureValueType() {
    switch (this) {
      case 'BIGINT':
        return MeasureValueType.bigint;
      case 'BOOLEAN':
        return MeasureValueType.boolean;
      case 'DOUBLE':
        return MeasureValueType.double;
      case 'VARCHAR':
        return MeasureValueType.varchar;
      case 'MULTI':
        return MeasureValueType.multi;
    }
    throw Exception('$this is not known in enum MeasureValueType');
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
      measureValueType:
          (json['MeasureValueType'] as String).toMeasureValueType(),
      measureName: json['MeasureName'] as String?,
      multiMeasureAttributeMappings: (json['MultiMeasureAttributeMappings']
              as List?)
          ?.whereNotNull()
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
      'MeasureValueType': measureValueType.toValue(),
      if (measureName != null) 'MeasureName': measureName,
      if (multiMeasureAttributeMappings != null)
        'MultiMeasureAttributeMappings': multiMeasureAttributeMappings,
      if (sourceColumn != null) 'SourceColumn': sourceColumn,
      if (targetMeasureName != null) 'TargetMeasureName': targetMeasureName,
    };
  }
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
      measureValueType:
          (json['MeasureValueType'] as String).toScalarMeasureValueType(),
      sourceColumn: json['SourceColumn'] as String,
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
      'MeasureValueType': measureValueType.toValue(),
      'SourceColumn': sourceColumn,
      if (targetMultiMeasureAttributeName != null)
        'TargetMultiMeasureAttributeName': targetMultiMeasureAttributeName,
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
      multiMeasureAttributeMappings: (json['MultiMeasureAttributeMappings']
              as List)
          .whereNotNull()
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

/// Notification configuration for a scheduled query. A notification is sent by
/// Timestream when a scheduled query is created, its state is updated or when
/// it is deleted.
class NotificationConfiguration {
  /// Details on SNS configuration.
  final SnsConfiguration snsConfiguration;

  NotificationConfiguration({
    required this.snsConfiguration,
  });

  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationConfiguration(
      snsConfiguration: SnsConfiguration.fromJson(
          json['SnsConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snsConfiguration = this.snsConfiguration;
    return {
      'SnsConfiguration': snsConfiguration,
    };
  }
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
      name: json['Name'] as String,
      type: Type.fromJson(json['Type'] as Map<String, dynamic>),
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
      columns: (json['Columns'] as List)
          .whereNotNull()
          .map((e) => SelectColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['Parameters'] as List)
          .whereNotNull()
          .map((e) => ParameterMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryString: json['QueryString'] as String,
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

enum QueryPricingModel {
  bytesScanned,
  computeUnits,
}

extension QueryPricingModelValueExtension on QueryPricingModel {
  String toValue() {
    switch (this) {
      case QueryPricingModel.bytesScanned:
        return 'BYTES_SCANNED';
      case QueryPricingModel.computeUnits:
        return 'COMPUTE_UNITS';
    }
  }
}

extension QueryPricingModelFromString on String {
  QueryPricingModel toQueryPricingModel() {
    switch (this) {
      case 'BYTES_SCANNED':
        return QueryPricingModel.bytesScanned;
      case 'COMPUTE_UNITS':
        return QueryPricingModel.computeUnits;
    }
    throw Exception('$this is not known in enum QueryPricingModel');
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
  /// scanned.
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
      bucketName: json['BucketName'] as String,
      encryptionOption:
          (json['EncryptionOption'] as String?)?.toS3EncryptionOption(),
      objectKeyPrefix: json['ObjectKeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final encryptionOption = this.encryptionOption;
    final objectKeyPrefix = this.objectKeyPrefix;
    return {
      'BucketName': bucketName,
      if (encryptionOption != null)
        'EncryptionOption': encryptionOption.toValue(),
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
    };
  }
}

enum S3EncryptionOption {
  sseS3,
  sseKms,
}

extension S3EncryptionOptionValueExtension on S3EncryptionOption {
  String toValue() {
    switch (this) {
      case S3EncryptionOption.sseS3:
        return 'SSE_S3';
      case S3EncryptionOption.sseKms:
        return 'SSE_KMS';
    }
  }
}

extension S3EncryptionOptionFromString on String {
  S3EncryptionOption toS3EncryptionOption() {
    switch (this) {
      case 'SSE_S3':
        return S3EncryptionOption.sseS3;
      case 'SSE_KMS':
        return S3EncryptionOption.sseKms;
    }
    throw Exception('$this is not known in enum S3EncryptionOption');
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

enum ScalarMeasureValueType {
  bigint,
  boolean,
  double,
  varchar,
  timestamp,
}

extension ScalarMeasureValueTypeValueExtension on ScalarMeasureValueType {
  String toValue() {
    switch (this) {
      case ScalarMeasureValueType.bigint:
        return 'BIGINT';
      case ScalarMeasureValueType.boolean:
        return 'BOOLEAN';
      case ScalarMeasureValueType.double:
        return 'DOUBLE';
      case ScalarMeasureValueType.varchar:
        return 'VARCHAR';
      case ScalarMeasureValueType.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension ScalarMeasureValueTypeFromString on String {
  ScalarMeasureValueType toScalarMeasureValueType() {
    switch (this) {
      case 'BIGINT':
        return ScalarMeasureValueType.bigint;
      case 'BOOLEAN':
        return ScalarMeasureValueType.boolean;
      case 'DOUBLE':
        return ScalarMeasureValueType.double;
      case 'VARCHAR':
        return ScalarMeasureValueType.varchar;
      case 'TIMESTAMP':
        return ScalarMeasureValueType.timestamp;
    }
    throw Exception('$this is not known in enum ScalarMeasureValueType');
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

extension ScalarTypeValueExtension on ScalarType {
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

extension ScalarTypeFromString on String {
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
      scheduleExpression: json['ScheduleExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    return {
      'ScheduleExpression': scheduleExpression,
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
      arn: json['Arn'] as String,
      name: json['Name'] as String,
      state: (json['State'] as String).toScheduledQueryState(),
      creationTime: timeStampFromJson(json['CreationTime']),
      errorReportConfiguration: json['ErrorReportConfiguration'] != null
          ? ErrorReportConfiguration.fromJson(
              json['ErrorReportConfiguration'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['LastRunStatus'] as String?)?.toScheduledQueryRunStatus(),
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
      'State': state.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (errorReportConfiguration != null)
        'ErrorReportConfiguration': errorReportConfiguration,
      if (lastRunStatus != null) 'LastRunStatus': lastRunStatus.toValue(),
      if (nextInvocationTime != null)
        'NextInvocationTime': unixTimestampToJson(nextInvocationTime),
      if (previousInvocationTime != null)
        'PreviousInvocationTime': unixTimestampToJson(previousInvocationTime),
      if (targetDestination != null) 'TargetDestination': targetDestination,
    };
  }
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
      arn: json['Arn'] as String,
      name: json['Name'] as String,
      notificationConfiguration: NotificationConfiguration.fromJson(
          json['NotificationConfiguration'] as Map<String, dynamic>),
      queryString: json['QueryString'] as String,
      scheduleConfiguration: ScheduleConfiguration.fromJson(
          json['ScheduleConfiguration'] as Map<String, dynamic>),
      state: (json['State'] as String).toScheduledQueryState(),
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
          ?.whereNotNull()
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
      'State': state.toValue(),
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

enum ScheduledQueryRunStatus {
  autoTriggerSuccess,
  autoTriggerFailure,
  manualTriggerSuccess,
  manualTriggerFailure,
}

extension ScheduledQueryRunStatusValueExtension on ScheduledQueryRunStatus {
  String toValue() {
    switch (this) {
      case ScheduledQueryRunStatus.autoTriggerSuccess:
        return 'AUTO_TRIGGER_SUCCESS';
      case ScheduledQueryRunStatus.autoTriggerFailure:
        return 'AUTO_TRIGGER_FAILURE';
      case ScheduledQueryRunStatus.manualTriggerSuccess:
        return 'MANUAL_TRIGGER_SUCCESS';
      case ScheduledQueryRunStatus.manualTriggerFailure:
        return 'MANUAL_TRIGGER_FAILURE';
    }
  }
}

extension ScheduledQueryRunStatusFromString on String {
  ScheduledQueryRunStatus toScheduledQueryRunStatus() {
    switch (this) {
      case 'AUTO_TRIGGER_SUCCESS':
        return ScheduledQueryRunStatus.autoTriggerSuccess;
      case 'AUTO_TRIGGER_FAILURE':
        return ScheduledQueryRunStatus.autoTriggerFailure;
      case 'MANUAL_TRIGGER_SUCCESS':
        return ScheduledQueryRunStatus.manualTriggerSuccess;
      case 'MANUAL_TRIGGER_FAILURE':
        return ScheduledQueryRunStatus.manualTriggerFailure;
    }
    throw Exception('$this is not known in enum ScheduledQueryRunStatus');
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

  /// The status of a scheduled query run.
  final ScheduledQueryRunStatus? runStatus;

  /// The actual time when the query was run.
  final DateTime? triggerTime;

  ScheduledQueryRunSummary({
    this.errorReportLocation,
    this.executionStats,
    this.failureReason,
    this.invocationTime,
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
      runStatus: (json['RunStatus'] as String?)?.toScheduledQueryRunStatus(),
      triggerTime: timeStampFromJson(json['TriggerTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final errorReportLocation = this.errorReportLocation;
    final executionStats = this.executionStats;
    final failureReason = this.failureReason;
    final invocationTime = this.invocationTime;
    final runStatus = this.runStatus;
    final triggerTime = this.triggerTime;
    return {
      if (errorReportLocation != null)
        'ErrorReportLocation': errorReportLocation,
      if (executionStats != null) 'ExecutionStats': executionStats,
      if (failureReason != null) 'FailureReason': failureReason,
      if (invocationTime != null)
        'InvocationTime': unixTimestampToJson(invocationTime),
      if (runStatus != null) 'RunStatus': runStatus.toValue(),
      if (triggerTime != null) 'TriggerTime': unixTimestampToJson(triggerTime),
    };
  }
}

enum ScheduledQueryState {
  enabled,
  disabled,
}

extension ScheduledQueryStateValueExtension on ScheduledQueryState {
  String toValue() {
    switch (this) {
      case ScheduledQueryState.enabled:
        return 'ENABLED';
      case ScheduledQueryState.disabled:
        return 'DISABLED';
    }
  }
}

extension ScheduledQueryStateFromString on String {
  ScheduledQueryState toScheduledQueryState() {
    switch (this) {
      case 'ENABLED':
        return ScheduledQueryState.enabled;
      case 'DISABLED':
        return ScheduledQueryState.disabled;
    }
    throw Exception('$this is not known in enum ScheduledQueryState');
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

/// Details on SNS that are required to send the notification.
class SnsConfiguration {
  /// SNS topic ARN that the scheduled query status notifications will be sent to.
  final String topicArn;

  SnsConfiguration({
    required this.topicArn,
  });

  factory SnsConfiguration.fromJson(Map<String, dynamic> json) {
    return SnsConfiguration(
      topicArn: json['TopicArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'TopicArn': topicArn,
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
          json['TimestreamConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final timestreamConfiguration = this.timestreamConfiguration;
    return {
      'TimestreamConfiguration': timestreamConfiguration,
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
      databaseName: json['DatabaseName'] as String,
      dimensionMappings: (json['DimensionMappings'] as List)
          .whereNotNull()
          .map((e) => DimensionMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: json['TableName'] as String,
      timeColumn: json['TimeColumn'] as String,
      measureNameColumn: json['MeasureNameColumn'] as String?,
      mixedMeasureMappings: (json['MixedMeasureMappings'] as List?)
          ?.whereNotNull()
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

  /// The pricing model for an account.
  final QueryPricingModel? queryPricingModel;

  UpdateAccountSettingsResponse({
    this.maxQueryTCU,
    this.queryPricingModel,
  });

  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccountSettingsResponse(
      maxQueryTCU: json['MaxQueryTCU'] as int?,
      queryPricingModel:
          (json['QueryPricingModel'] as String?)?.toQueryPricingModel(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxQueryTCU = this.maxQueryTCU;
    final queryPricingModel = this.queryPricingModel;
    return {
      if (maxQueryTCU != null) 'MaxQueryTCU': maxQueryTCU,
      if (queryPricingModel != null)
        'QueryPricingModel': queryPricingModel.toValue(),
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
