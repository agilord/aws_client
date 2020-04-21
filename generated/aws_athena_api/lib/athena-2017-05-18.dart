// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'athena-2017-05-18.g.dart';

/// Amazon Athena is an interactive query service that lets you use standard SQL
/// to analyze data directly in Amazon S3. You can point Athena at your data in
/// Amazon S3 and run ad-hoc queries and get results in seconds. Athena is
/// serverless, so there is no infrastructure to set up or manage. You pay only
/// for the queries you run. Athena scales automatically—executing queries in
/// parallel—so results are fast, even with large datasets and complex queries.
/// For more information, see <a
/// href="http://docs.aws.amazon.com/athena/latest/ug/what-is.html">What is
/// Amazon Athena</a> in the <i>Amazon Athena User Guide</i>.
///
/// If you connect to Athena using the JDBC driver, use version 1.1.0 of the
/// driver or later with the Amazon Athena API. Earlier version drivers do not
/// support the API. For more information and to download the driver, see <a
/// href="https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html">Accessing
/// Amazon Athena with JDBC</a>.
///
/// For code samples using the AWS SDK for Java, see <a
/// href="https://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
/// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
class Athena {
  final _s.JsonProtocol _protocol;
  Athena({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'athena',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns the details of a single named query or a list of up to 50 queries,
  /// which you provide as an array of query ID strings. Requires you to have
  /// access to the workgroup in which the queries were saved. Use
  /// <a>ListNamedQueriesInput</a> to get the list of named query IDs in the
  /// specified workgroup. If information could not be retrieved for a submitted
  /// query ID, information about the query ID submitted is listed under
  /// <a>UnprocessedNamedQueryId</a>. Named queries differ from executed
  /// queries. Use <a>BatchGetQueryExecutionInput</a> to get details about each
  /// unique query execution, and <a>ListQueryExecutionsInput</a> to get a list
  /// of query execution IDs.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [namedQueryIds] :
  /// An array of query IDs.
  Future<BatchGetNamedQueryOutput> batchGetNamedQuery({
    @_s.required List<String> namedQueryIds,
  }) async {
    ArgumentError.checkNotNull(namedQueryIds, 'namedQueryIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.BatchGetNamedQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamedQueryIds': namedQueryIds,
      },
    );

    return BatchGetNamedQueryOutput.fromJson(jsonResponse.body);
  }

  /// Returns the details of a single query execution or a list of up to 50
  /// query executions, which you provide as an array of query execution ID
  /// strings. Requires you to have access to the workgroup in which the queries
  /// ran. To get a list of query execution IDs, use
  /// <a>ListQueryExecutionsInput$WorkGroup</a>. Query executions differ from
  /// named (saved) queries. Use <a>BatchGetNamedQueryInput</a> to get details
  /// about named queries.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryExecutionIds] :
  /// An array of query execution IDs.
  Future<BatchGetQueryExecutionOutput> batchGetQueryExecution({
    @_s.required List<String> queryExecutionIds,
  }) async {
    ArgumentError.checkNotNull(queryExecutionIds, 'queryExecutionIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.BatchGetQueryExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryExecutionIds': queryExecutionIds,
      },
    );

    return BatchGetQueryExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a named query in the specified workgroup. Requires that you have
  /// access to the workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [database] :
  /// The database to which the query belongs.
  ///
  /// Parameter [name] :
  /// The query name.
  ///
  /// Parameter [queryString] :
  /// The contents of the query with all query statements.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// query is idempotent (executes only once). If another
  /// <code>CreateNamedQuery</code> request is received, the same response is
  /// returned and another query is not created. If a parameter has changed, for
  /// example, the <code>QueryString</code>, an error is returned.
  /// <important>
  /// This token is listed as not required because AWS SDKs (for example the AWS
  /// SDK for Java) auto-generate the token for users. If you are not using the
  /// AWS SDK or the AWS CLI, you must provide this token or the action will
  /// fail.
  /// </important>
  ///
  /// Parameter [description] :
  /// The query description.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup in which the named query is being created.
  Future<CreateNamedQueryOutput> createNamedQuery({
    @_s.required String database,
    @_s.required String name,
    @_s.required String queryString,
    String clientRequestToken,
    String description,
    String workGroup,
  }) async {
    ArgumentError.checkNotNull(database, 'database');
    _s.validateStringLength(
      'database',
      database,
      1,
      255,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
    );
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      262144,
    );
    if (clientRequestToken != null) {
      _s.validateStringLength(
        'clientRequestToken',
        clientRequestToken,
        32,
        128,
      );
    }
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        1,
        1024,
      );
    }
    if (workGroup != null) {
      _s.validateStringPattern(
        'workGroup',
        workGroup,
        r'''[a-zA-z0-9._-]{1,128}''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateNamedQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        'Name': name,
        'QueryString': queryString,
        'ClientRequestToken': clientRequestToken,
        'Description': description,
        'WorkGroup': workGroup,
      },
    );

    return CreateNamedQueryOutput.fromJson(jsonResponse.body);
  }

  /// Creates a workgroup with the specified name.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The workgroup name.
  ///
  /// Parameter [configuration] :
  /// The configuration for the workgroup, which includes the location in Amazon
  /// S3 where query results are stored, the encryption configuration, if any,
  /// used for encrypting query results, whether the Amazon CloudWatch Metrics
  /// are enabled for the workgroup, the limit for the amount of bytes scanned
  /// (cutoff) per query, if it is specified, and whether workgroup's settings
  /// (specified with EnforceWorkGroupConfiguration) in the
  /// WorkGroupConfiguration override client-side settings. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  ///
  /// Parameter [description] :
  /// The workgroup description.
  ///
  /// Parameter [tags] :
  /// One or more tags, separated by commas, that you want to attach to the
  /// workgroup as you create it.
  Future<void> createWorkGroup({
    @_s.required String name,
    WorkGroupConfiguration configuration,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-z0-9._-]{1,128}''',
    );
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        0,
        1024,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateWorkGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Configuration': configuration,
        'Description': description,
        'Tags': tags,
      },
    );

    return CreateWorkGroupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the named query if you have access to the workgroup in which the
  /// query was saved.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [namedQueryId] :
  /// The unique ID of the query to delete.
  Future<void> deleteNamedQuery({
    @_s.required String namedQueryId,
  }) async {
    ArgumentError.checkNotNull(namedQueryId, 'namedQueryId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteNamedQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamedQueryId': namedQueryId,
      },
    );

    return DeleteNamedQueryOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the workgroup with the specified name. The primary workgroup
  /// cannot be deleted.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The unique name of the workgroup to delete.
  ///
  /// Parameter [recursiveDeleteOption] :
  /// The option to delete the workgroup and its contents even if the workgroup
  /// contains any named queries.
  Future<void> deleteWorkGroup({
    @_s.required String workGroup,
    bool recursiveDeleteOption,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringPattern(
      'workGroup',
      workGroup,
      r'''[a-zA-z0-9._-]{1,128}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteWorkGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        'RecursiveDeleteOption': recursiveDeleteOption,
      },
    );

    return DeleteWorkGroupOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a single query. Requires that you have access to
  /// the workgroup in which the query was saved.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [namedQueryId] :
  /// The unique ID of the query. Use <a>ListNamedQueries</a> to get query IDs.
  Future<GetNamedQueryOutput> getNamedQuery({
    @_s.required String namedQueryId,
  }) async {
    ArgumentError.checkNotNull(namedQueryId, 'namedQueryId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetNamedQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamedQueryId': namedQueryId,
      },
    );

    return GetNamedQueryOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a single execution of a query if you have access
  /// to the workgroup in which the query ran. Each time a query executes,
  /// information about the query execution is saved with a unique ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryExecutionId] :
  /// The unique ID of the query execution.
  Future<GetQueryExecutionOutput> getQueryExecution({
    @_s.required String queryExecutionId,
  }) async {
    ArgumentError.checkNotNull(queryExecutionId, 'queryExecutionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetQueryExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryExecutionId': queryExecutionId,
      },
    );

    return GetQueryExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Streams the results of a single query execution specified by
  /// <code>QueryExecutionId</code> from the Athena query results location in
  /// Amazon S3. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query
  /// Results</a> in the <i>Amazon Athena User Guide</i>. This request does not
  /// execute the query but returns results. Use <a>StartQueryExecution</a> to
  /// run a query.
  ///
  /// To stream query results successfully, the IAM principal with permission to
  /// call <code>GetQueryResults</code> also must have permissions to the Amazon
  /// S3 <code>GetObject</code> action for the Athena query results location.
  /// <important>
  /// IAM principals with permission to the Amazon S3 <code>GetObject</code>
  /// action for the query results location are able to retrieve query results
  /// from Amazon S3 even if permission to the <code>GetQueryResults</code>
  /// action is denied. To restrict user or role access, ensure that Amazon S3
  /// permissions to the Athena query location are denied.
  /// </important>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryExecutionId] :
  /// The unique ID of the query execution.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results (rows) to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies where to start pagination if a previous request
  /// was truncated.
  Future<GetQueryResultsOutput> getQueryResults({
    @_s.required String queryExecutionId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(queryExecutionId, 'queryExecutionId');
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        1000,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        1,
        1024,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetQueryResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryExecutionId': queryExecutionId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return GetQueryResultsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the workgroup with the specified name.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup.
  Future<GetWorkGroupOutput> getWorkGroup({
    @_s.required String workGroup,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringPattern(
      'workGroup',
      workGroup,
      r'''[a-zA-z0-9._-]{1,128}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetWorkGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
      },
    );

    return GetWorkGroupOutput.fromJson(jsonResponse.body);
  }

  /// Provides a list of available query IDs only for queries saved in the
  /// specified workgroup. Requires that you have access to the workgroup. If a
  /// workgroup is not specified, lists the saved queries for the primary
  /// workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of queries to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies where to start pagination if a previous request
  /// was truncated.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup from which the named queries are returned. If a
  /// workgroup is not specified, the saved queries for the primary workgroup
  /// are returned.
  Future<ListNamedQueriesOutput> listNamedQueries({
    int maxResults,
    String nextToken,
    String workGroup,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        0,
        50,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        1,
        1024,
      );
    }
    if (workGroup != null) {
      _s.validateStringPattern(
        'workGroup',
        workGroup,
        r'''[a-zA-z0-9._-]{1,128}''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListNamedQueries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'WorkGroup': workGroup,
      },
    );

    return ListNamedQueriesOutput.fromJson(jsonResponse.body);
  }

  /// Provides a list of available query execution IDs for the queries in the
  /// specified workgroup. If a workgroup is not specified, returns a list of
  /// query execution IDs for the primary workgroup. Requires you to have access
  /// to the workgroup in which the queries ran.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of query executions to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies where to start pagination if a previous request
  /// was truncated.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup from which queries are returned. If a workgroup
  /// is not specified, a list of available query execution IDs for the queries
  /// in the primary workgroup is returned.
  Future<ListQueryExecutionsOutput> listQueryExecutions({
    int maxResults,
    String nextToken,
    String workGroup,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        0,
        50,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        1,
        1024,
      );
    }
    if (workGroup != null) {
      _s.validateStringPattern(
        'workGroup',
        workGroup,
        r'''[a-zA-z0-9._-]{1,128}''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListQueryExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'WorkGroup': workGroup,
      },
    );

    return ListQueryExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags associated with this workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Lists the tags for the workgroup resource with the specified ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request that lists the
  /// tags for the workgroup resource.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no additional
  /// results for this request, where the request lists the tags for the
  /// workgroup resource with the specified ARN.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceARN,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
    );
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        75,
        1152921504606846976,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        1,
        1024,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Lists available workgroups for the account.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workgroups to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token to be used by the next request if this request is truncated.
  Future<ListWorkGroupsOutput> listWorkGroups({
    int maxResults,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        50,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        1,
        1024,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListWorkGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListWorkGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Runs the SQL query statements contained in the <code>Query</code>.
  /// Requires you to have access to the workgroup in which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [queryString] :
  /// The SQL query statements to be executed.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// query is idempotent (executes only once). If another
  /// <code>StartQueryExecution</code> request is received, the same response is
  /// returned and another query is not created. If a parameter has changed, for
  /// example, the <code>QueryString</code>, an error is returned.
  /// <important>
  /// This token is listed as not required because AWS SDKs (for example the AWS
  /// SDK for Java) auto-generate the token for users. If you are not using the
  /// AWS SDK or the AWS CLI, you must provide this token or the action will
  /// fail.
  /// </important>
  ///
  /// Parameter [queryExecutionContext] :
  /// The database within which the query executes.
  ///
  /// Parameter [resultConfiguration] :
  /// Specifies information about where and how to save the results of the query
  /// execution. If the query runs in a workgroup, then workgroup's settings may
  /// override query settings. This affects the query results location. The
  /// workgroup settings override is specified in EnforceWorkGroupConfiguration
  /// (true/false) in the WorkGroupConfiguration. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup in which the query is being started.
  Future<StartQueryExecutionOutput> startQueryExecution({
    @_s.required String queryString,
    String clientRequestToken,
    QueryExecutionContext queryExecutionContext,
    ResultConfiguration resultConfiguration,
    String workGroup,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      262144,
    );
    if (clientRequestToken != null) {
      _s.validateStringLength(
        'clientRequestToken',
        clientRequestToken,
        32,
        128,
      );
    }
    if (workGroup != null) {
      _s.validateStringPattern(
        'workGroup',
        workGroup,
        r'''[a-zA-z0-9._-]{1,128}''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StartQueryExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryString': queryString,
        'ClientRequestToken': clientRequestToken,
        'QueryExecutionContext': queryExecutionContext,
        'ResultConfiguration': resultConfiguration,
        'WorkGroup': workGroup,
      },
    );

    return StartQueryExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Stops a query execution. Requires you to have access to the workgroup in
  /// which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see <a
  /// href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples
  /// and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryExecutionId] :
  /// The unique ID of the query execution to stop.
  Future<void> stopQueryExecution({
    @_s.required String queryExecutionId,
  }) async {
    ArgumentError.checkNotNull(queryExecutionId, 'queryExecutionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StopQueryExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryExecutionId': queryExecutionId,
      },
    );

    return StopQueryExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to the resource, such as a workgroup. A tag is a
  /// label that you assign to an AWS Athena resource (a workgroup). Each tag
  /// consists of a key and an optional value, both of which you define. Tags
  /// enable you to categorize resources (workgroups) in Athena, for example, by
  /// purpose, owner, or environment. Use a consistent set of tag keys to make
  /// it easier to search and filter workgroups in your account. For best
  /// practices, see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>. The key length is from 1 (minimum) to 128
  /// (maximum) Unicode characters in UTF-8. The tag value length is from 0
  /// (minimum) to 256 (maximum) Unicode characters in UTF-8. You can use
  /// letters and numbers representable in UTF-8, and the following characters:
  /// + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be
  /// unique per resource. If you specify more than one, separate them by
  /// commas.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Requests that one or more tags are added to the resource (such as a
  /// workgroup) for the specified ARN.
  ///
  /// Parameter [tags] :
  /// One or more tags, separated by commas, to be added to the resource, such
  /// as a workgroup.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from the workgroup resource. Takes as an input a
  /// list of TagKey Strings separated by commas, and removes their tags at the
  /// same time.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Removes one or more tags from the workgroup resource for the specified
  /// ARN.
  ///
  /// Parameter [tagKeys] :
  /// Removes the tags associated with one or more tag keys from the workgroup
  /// resource.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Updates the workgroup with the specified name. The workgroup's name cannot
  /// be changed.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The specified workgroup that will be updated.
  ///
  /// Parameter [configurationUpdates] :
  /// The workgroup configuration that will be updated for the given workgroup.
  ///
  /// Parameter [description] :
  /// The workgroup description.
  ///
  /// Parameter [state] :
  /// The workgroup state that will be updated for the given workgroup.
  Future<void> updateWorkGroup({
    @_s.required String workGroup,
    WorkGroupConfigurationUpdates configurationUpdates,
    String description,
    WorkGroupState state,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringPattern(
      'workGroup',
      workGroup,
      r'''[a-zA-z0-9._-]{1,128}''',
    );
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        0,
        1024,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateWorkGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        'ConfigurationUpdates': configurationUpdates,
        'Description': description,
        'State': state,
      },
    );

    return UpdateWorkGroupOutput.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetNamedQueryOutput {
  /// Information about the named query IDs submitted.
  @_s.JsonKey(name: 'NamedQueries')
  final List<NamedQuery> namedQueries;

  /// Information about provided query IDs.
  @_s.JsonKey(name: 'UnprocessedNamedQueryIds')
  final List<UnprocessedNamedQueryId> unprocessedNamedQueryIds;

  BatchGetNamedQueryOutput({
    this.namedQueries,
    this.unprocessedNamedQueryIds,
  });
  factory BatchGetNamedQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetNamedQueryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetQueryExecutionOutput {
  /// Information about a query execution.
  @_s.JsonKey(name: 'QueryExecutions')
  final List<QueryExecution> queryExecutions;

  /// Information about the query executions that failed to run.
  @_s.JsonKey(name: 'UnprocessedQueryExecutionIds')
  final List<UnprocessedQueryExecutionId> unprocessedQueryExecutionIds;

  BatchGetQueryExecutionOutput({
    this.queryExecutions,
    this.unprocessedQueryExecutionIds,
  });
  factory BatchGetQueryExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetQueryExecutionOutputFromJson(json);
}

/// Information about the columns in a query execution result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnInfo {
  /// The name of the column.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The data type of the column.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// Indicates whether values in the column are case-sensitive.
  @_s.JsonKey(name: 'CaseSensitive')
  final bool caseSensitive;

  /// The catalog to which the query results belong.
  @_s.JsonKey(name: 'CatalogName')
  final String catalogName;

  /// A column label.
  @_s.JsonKey(name: 'Label')
  final String label;

  /// Indicates the column's nullable status.
  @_s.JsonKey(name: 'Nullable')
  final ColumnNullable nullable;

  /// For <code>DECIMAL</code> data types, specifies the total number of digits,
  /// up to 38. For performance reasons, we recommend up to 18 digits.
  @_s.JsonKey(name: 'Precision')
  final int precision;

  /// For <code>DECIMAL</code> data types, specifies the total number of digits in
  /// the fractional part of the value. Defaults to 0.
  @_s.JsonKey(name: 'Scale')
  final int scale;

  /// The schema name (database name) to which the query results belong.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The table name for the query results.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  ColumnInfo({
    @_s.required this.name,
    @_s.required this.type,
    this.caseSensitive,
    this.catalogName,
    this.label,
    this.nullable,
    this.precision,
    this.scale,
    this.schemaName,
    this.tableName,
  });
  factory ColumnInfo.fromJson(Map<String, dynamic> json) =>
      _$ColumnInfoFromJson(json);
}

enum ColumnNullable {
  @_s.JsonValue('NOT_NULL')
  notNull,
  @_s.JsonValue('NULLABLE')
  nullable,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNamedQueryOutput {
  /// The unique ID of the query.
  @_s.JsonKey(name: 'NamedQueryId')
  final String namedQueryId;

  CreateNamedQueryOutput({
    this.namedQueryId,
  });
  factory CreateNamedQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateNamedQueryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkGroupOutput {
  CreateWorkGroupOutput();
  factory CreateWorkGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkGroupOutputFromJson(json);
}

/// A piece of data (a field in the table).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Datum {
  /// The value of the datum.
  @_s.JsonKey(name: 'VarCharValue')
  final String varCharValue;

  Datum({
    this.varCharValue,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNamedQueryOutput {
  DeleteNamedQueryOutput();
  factory DeleteNamedQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteNamedQueryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWorkGroupOutput {
  DeleteWorkGroupOutput();
  factory DeleteWorkGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorkGroupOutputFromJson(json);
}

/// If query results are encrypted in Amazon S3, indicates the encryption option
/// used (for example, <code>SSE-KMS</code> or <code>CSE-KMS</code>) and key
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfiguration {
  /// Indicates whether Amazon S3 server-side encryption with Amazon S3-managed
  /// keys (<code>SSE-S3</code>), server-side encryption with KMS-managed keys
  /// (<code>SSE-KMS</code>), or client-side encryption with KMS-managed keys
  /// (CSE-KMS) is used.
  ///
  /// If a query runs in a workgroup and the workgroup overrides client-side
  /// settings, then the workgroup's setting for encryption is used. It specifies
  /// whether query results must be encrypted, for all queries that run in this
  /// workgroup.
  @_s.JsonKey(name: 'EncryptionOption')
  final EncryptionOption encryptionOption;

  /// For <code>SSE-KMS</code> and <code>CSE-KMS</code>, this is the KMS key ARN
  /// or ID.
  @_s.JsonKey(name: 'KmsKey')
  final String kmsKey;

  EncryptionConfiguration({
    @_s.required this.encryptionOption,
    this.kmsKey,
  });
  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigurationToJson(this);
}

enum EncryptionOption {
  @_s.JsonValue('SSE_S3')
  sseS3,
  @_s.JsonValue('SSE_KMS')
  sseKms,
  @_s.JsonValue('CSE_KMS')
  cseKms,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNamedQueryOutput {
  /// Information about the query.
  @_s.JsonKey(name: 'NamedQuery')
  final NamedQuery namedQuery;

  GetNamedQueryOutput({
    this.namedQuery,
  });
  factory GetNamedQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$GetNamedQueryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetQueryExecutionOutput {
  /// Information about the query execution.
  @_s.JsonKey(name: 'QueryExecution')
  final QueryExecution queryExecution;

  GetQueryExecutionOutput({
    this.queryExecution,
  });
  factory GetQueryExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetQueryExecutionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetQueryResultsOutput {
  /// A token to be used by the next request if this request is truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The results of the query execution.
  @_s.JsonKey(name: 'ResultSet')
  final ResultSet resultSet;

  /// The number of rows inserted with a CREATE TABLE AS SELECT statement.
  @_s.JsonKey(name: 'UpdateCount')
  final int updateCount;

  GetQueryResultsOutput({
    this.nextToken,
    this.resultSet,
    this.updateCount,
  });
  factory GetQueryResultsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetQueryResultsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkGroupOutput {
  /// Information about the workgroup.
  @_s.JsonKey(name: 'WorkGroup')
  final WorkGroup workGroup;

  GetWorkGroupOutput({
    this.workGroup,
  });
  factory GetWorkGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$GetWorkGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNamedQueriesOutput {
  /// The list of unique query IDs.
  @_s.JsonKey(name: 'NamedQueryIds')
  final List<String> namedQueryIds;

  /// A token to be used by the next request if this request is truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListNamedQueriesOutput({
    this.namedQueryIds,
    this.nextToken,
  });
  factory ListNamedQueriesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNamedQueriesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListQueryExecutionsOutput {
  /// A token to be used by the next request if this request is truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The unique IDs of each query execution as an array of strings.
  @_s.JsonKey(name: 'QueryExecutionIds')
  final List<String> queryExecutionIds;

  ListQueryExecutionsOutput({
    this.nextToken,
    this.queryExecutionIds,
  });
  factory ListQueryExecutionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListQueryExecutionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// A token to be used by the next request if this request is truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of tags associated with this workgroup.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkGroupsOutput {
  /// A token to be used by the next request if this request is truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of workgroups, including their names, descriptions, creation times,
  /// and states.
  @_s.JsonKey(name: 'WorkGroups')
  final List<WorkGroupSummary> workGroups;

  ListWorkGroupsOutput({
    this.nextToken,
    this.workGroups,
  });
  factory ListWorkGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListWorkGroupsOutputFromJson(json);
}

/// A query, where <code>QueryString</code> is the list of SQL query statements
/// that comprise the query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NamedQuery {
  /// The database to which the query belongs.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// The query name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The SQL query statements that comprise the query.
  @_s.JsonKey(name: 'QueryString')
  final String queryString;

  /// The query description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier of the query.
  @_s.JsonKey(name: 'NamedQueryId')
  final String namedQueryId;

  /// The name of the workgroup that contains the named query.
  @_s.JsonKey(name: 'WorkGroup')
  final String workGroup;

  NamedQuery({
    @_s.required this.database,
    @_s.required this.name,
    @_s.required this.queryString,
    this.description,
    this.namedQueryId,
    this.workGroup,
  });
  factory NamedQuery.fromJson(Map<String, dynamic> json) =>
      _$NamedQueryFromJson(json);
}

/// Information about a single instance of a query execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryExecution {
  /// The SQL query statements which the query execution ran.
  @_s.JsonKey(name: 'Query')
  final String query;

  /// The database in which the query execution occurred.
  @_s.JsonKey(name: 'QueryExecutionContext')
  final QueryExecutionContext queryExecutionContext;

  /// The unique identifier for each query execution.
  @_s.JsonKey(name: 'QueryExecutionId')
  final String queryExecutionId;

  /// The location in Amazon S3 where query results were stored and the encryption
  /// option, if any, used for query results. These are known as "client-side
  /// settings". If workgroup settings override client-side settings, then the
  /// query uses the location for the query results and the encryption
  /// configuration that are specified for the workgroup.
  @_s.JsonKey(name: 'ResultConfiguration')
  final ResultConfiguration resultConfiguration;

  /// The type of query statement that was run. <code>DDL</code> indicates DDL
  /// query statements. <code>DML</code> indicates DML (Data Manipulation
  /// Language) query statements, such as <code>CREATE TABLE AS SELECT</code>.
  /// <code>UTILITY</code> indicates query statements other than DDL and DML, such
  /// as <code>SHOW CREATE TABLE</code>, or <code>DESCRIBE &lt;table&gt;</code>.
  @_s.JsonKey(name: 'StatementType')
  final StatementType statementType;

  /// Query execution statistics, such as the amount of data scanned, the amount
  /// of time that the query took to process, and the type of statement that was
  /// run.
  @_s.JsonKey(name: 'Statistics')
  final QueryExecutionStatistics statistics;

  /// The completion date, current state, submission time, and state change reason
  /// (if applicable) for the query execution.
  @_s.JsonKey(name: 'Status')
  final QueryExecutionStatus status;

  /// The name of the workgroup in which the query ran.
  @_s.JsonKey(name: 'WorkGroup')
  final String workGroup;

  QueryExecution({
    this.query,
    this.queryExecutionContext,
    this.queryExecutionId,
    this.resultConfiguration,
    this.statementType,
    this.statistics,
    this.status,
    this.workGroup,
  });
  factory QueryExecution.fromJson(Map<String, dynamic> json) =>
      _$QueryExecutionFromJson(json);
}

/// The database in which the query execution occurs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QueryExecutionContext {
  /// The name of the database.
  @_s.JsonKey(name: 'Database')
  final String database;

  QueryExecutionContext({
    this.database,
  });
  factory QueryExecutionContext.fromJson(Map<String, dynamic> json) =>
      _$QueryExecutionContextFromJson(json);

  Map<String, dynamic> toJson() => _$QueryExecutionContextToJson(this);
}

enum QueryExecutionState {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

/// The amount of data scanned during the query execution and the amount of time
/// that it took to execute, and the type of statement that was run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryExecutionStatistics {
  /// The location and file name of a data manifest file. The manifest file is
  /// saved to the Athena query results location in Amazon S3. The manifest file
  /// tracks files that the query wrote to Amazon S3. If the query fails, the
  /// manifest file also tracks files that the query intended to write. The
  /// manifest is useful for identifying orphaned files resulting from a failed
  /// query. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Working
  /// with Query Results, Output Files, and Query History</a> in the <i>Amazon
  /// Athena User Guide</i>.
  @_s.JsonKey(name: 'DataManifestLocation')
  final String dataManifestLocation;

  /// The number of bytes in the data that was queried.
  @_s.JsonKey(name: 'DataScannedInBytes')
  final int dataScannedInBytes;

  /// The number of milliseconds that the query took to execute.
  @_s.JsonKey(name: 'EngineExecutionTimeInMillis')
  final int engineExecutionTimeInMillis;

  /// The number of milliseconds that Athena took to plan the query processing
  /// flow. This includes the time spent retrieving table partitions from the data
  /// source. Note that because the query engine performs the query planning,
  /// query planning time is a subset of engine processing time.
  @_s.JsonKey(name: 'QueryPlanningTimeInMillis')
  final int queryPlanningTimeInMillis;

  /// The number of milliseconds that the query was in your query queue waiting
  /// for resources. Note that if transient errors occur, Athena might
  /// automatically add the query back to the queue.
  @_s.JsonKey(name: 'QueryQueueTimeInMillis')
  final int queryQueueTimeInMillis;

  /// The number of milliseconds that Athena took to finalize and publish the
  /// query results after the query engine finished running the query.
  @_s.JsonKey(name: 'ServiceProcessingTimeInMillis')
  final int serviceProcessingTimeInMillis;

  /// The number of milliseconds that Athena took to run the query.
  @_s.JsonKey(name: 'TotalExecutionTimeInMillis')
  final int totalExecutionTimeInMillis;

  QueryExecutionStatistics({
    this.dataManifestLocation,
    this.dataScannedInBytes,
    this.engineExecutionTimeInMillis,
    this.queryPlanningTimeInMillis,
    this.queryQueueTimeInMillis,
    this.serviceProcessingTimeInMillis,
    this.totalExecutionTimeInMillis,
  });
  factory QueryExecutionStatistics.fromJson(Map<String, dynamic> json) =>
      _$QueryExecutionStatisticsFromJson(json);
}

/// The completion date, current state, submission time, and state change reason
/// (if applicable) for the query execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryExecutionStatus {
  /// The date and time that the query completed.
  @_s.JsonKey(
      name: 'CompletionDateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime completionDateTime;

  /// The state of query execution. <code>QUEUED</code> indicates that the query
  /// has been submitted to the service, and Athena will execute the query as soon
  /// as resources are available. <code>RUNNING</code> indicates that the query is
  /// in execution phase. <code>SUCCEEDED</code> indicates that the query
  /// completed without errors. <code>FAILED</code> indicates that the query
  /// experienced an error and did not complete processing. <code>CANCELLED</code>
  /// indicates that a user input interrupted query execution.
  @_s.JsonKey(name: 'State')
  final QueryExecutionState state;

  /// Further detail about the status of the query.
  @_s.JsonKey(name: 'StateChangeReason')
  final String stateChangeReason;

  /// The date and time that the query was submitted.
  @_s.JsonKey(
      name: 'SubmissionDateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime submissionDateTime;

  QueryExecutionStatus({
    this.completionDateTime,
    this.state,
    this.stateChangeReason,
    this.submissionDateTime,
  });
  factory QueryExecutionStatus.fromJson(Map<String, dynamic> json) =>
      _$QueryExecutionStatusFromJson(json);
}

/// The location in Amazon S3 where query results are stored and the encryption
/// option, if any, used for query results. These are known as "client-side
/// settings". If workgroup settings override client-side settings, then the
/// query uses the workgroup settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResultConfiguration {
  /// If query results are encrypted in Amazon S3, indicates the encryption option
  /// used (for example, <code>SSE-KMS</code> or <code>CSE-KMS</code>) and key
  /// information. This is a client-side setting. If workgroup settings override
  /// client-side settings, then the query uses the encryption configuration that
  /// is specified for the workgroup, and also uses the location for storing query
  /// results specified in the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a> and <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The location in Amazon S3 where your query results are stored, such as
  /// <code>s3://path/to/query/bucket/</code>. To run the query, you must specify
  /// the query results location using one of the ways: either for individual
  /// queries using either this setting (client-side), or in the workgroup, using
  /// <a>WorkGroupConfiguration</a>. If none of them is set, Athena issues an
  /// error that no output location is provided. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query
  /// Results</a>. If workgroup settings override client-side settings, then the
  /// query uses the settings specified for the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  @_s.JsonKey(name: 'OutputLocation')
  final String outputLocation;

  ResultConfiguration({
    this.encryptionConfiguration,
    this.outputLocation,
  });
  factory ResultConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ResultConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ResultConfigurationToJson(this);
}

/// The information about the updates in the query results, such as output
/// location and encryption configuration for the query results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResultConfigurationUpdates {
  /// The encryption configuration for the query results.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The location in Amazon S3 where your query results are stored, such as
  /// <code>s3://path/to/query/bucket/</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query
  /// Results</a> If workgroup settings override client-side settings, then the
  /// query uses the location for the query results and the encryption
  /// configuration that are specified for the workgroup. The "workgroup settings
  /// override" is specified in EnforceWorkGroupConfiguration (true/false) in the
  /// WorkGroupConfiguration. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  @_s.JsonKey(name: 'OutputLocation')
  final String outputLocation;

  /// If set to "true", indicates that the previously-specified encryption
  /// configuration (also known as the client-side setting) for queries in this
  /// workgroup should be ignored and set to null. If set to "false" or not set,
  /// and a value is present in the EncryptionConfiguration in
  /// ResultConfigurationUpdates (the client-side setting), the
  /// EncryptionConfiguration in the workgroup's ResultConfiguration will be
  /// updated with the new value. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  @_s.JsonKey(name: 'RemoveEncryptionConfiguration')
  final bool removeEncryptionConfiguration;

  /// If set to "true", indicates that the previously-specified query results
  /// location (also known as a client-side setting) for queries in this workgroup
  /// should be ignored and set to null. If set to "false" or not set, and a value
  /// is present in the OutputLocation in ResultConfigurationUpdates (the
  /// client-side setting), the OutputLocation in the workgroup's
  /// ResultConfiguration will be updated with the new value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  @_s.JsonKey(name: 'RemoveOutputLocation')
  final bool removeOutputLocation;

  ResultConfigurationUpdates({
    this.encryptionConfiguration,
    this.outputLocation,
    this.removeEncryptionConfiguration,
    this.removeOutputLocation,
  });
  Map<String, dynamic> toJson() => _$ResultConfigurationUpdatesToJson(this);
}

/// The metadata and rows that comprise a query result set. The metadata
/// describes the column structure and data types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultSet {
  /// The metadata that describes the column structure and data types of a table
  /// of query results.
  @_s.JsonKey(name: 'ResultSetMetadata')
  final ResultSetMetadata resultSetMetadata;

  /// The rows in the table.
  @_s.JsonKey(name: 'Rows')
  final List<Row> rows;

  ResultSet({
    this.resultSetMetadata,
    this.rows,
  });
  factory ResultSet.fromJson(Map<String, dynamic> json) =>
      _$ResultSetFromJson(json);
}

/// The metadata that describes the column structure and data types of a table
/// of query results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultSetMetadata {
  /// Information about the columns returned in a query result metadata.
  @_s.JsonKey(name: 'ColumnInfo')
  final List<ColumnInfo> columnInfo;

  ResultSetMetadata({
    this.columnInfo,
  });
  factory ResultSetMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResultSetMetadataFromJson(json);
}

/// The rows that comprise a query result table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Row {
  /// The data that populates a row in a query result table.
  @_s.JsonKey(name: 'Data')
  final List<Datum> data;

  Row({
    this.data,
  });
  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartQueryExecutionOutput {
  /// The unique ID of the query that ran as a result of this request.
  @_s.JsonKey(name: 'QueryExecutionId')
  final String queryExecutionId;

  StartQueryExecutionOutput({
    this.queryExecutionId,
  });
  factory StartQueryExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$StartQueryExecutionOutputFromJson(json);
}

enum StatementType {
  @_s.JsonValue('DDL')
  ddl,
  @_s.JsonValue('DML')
  dml,
  @_s.JsonValue('UTILITY')
  utility,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopQueryExecutionOutput {
  StopQueryExecutionOutput();
  factory StopQueryExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$StopQueryExecutionOutputFromJson(json);
}

/// A tag that you can add to a resource. A tag is a label that you assign to an
/// AWS Athena resource (a workgroup). Each tag consists of a key and an
/// optional value, both of which you define. Tags enable you to categorize
/// workgroups in Athena, for example, by purpose, owner, or environment. Use a
/// consistent set of tag keys to make it easier to search and filter workgroups
/// in your account. The maximum tag key length is 128 Unicode characters in
/// UTF-8. The maximum tag value length is 256 Unicode characters in UTF-8. You
/// can use letters and numbers representable in UTF-8, and the following
/// characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag
/// keys must be unique per resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A tag key. The tag key length is from 1 to 128 Unicode characters in UTF-8.
  /// You can use letters and numbers representable in UTF-8, and the following
  /// characters: + - = . _ : / @. Tag keys are case-sensitive and must be unique
  /// per resource.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A tag value. The tag value length is from 0 to 256 Unicode characters in
  /// UTF-8. You can use letters and numbers representable in UTF-8, and the
  /// following characters: + - = . _ : / @. Tag values are case-sensitive.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceOutputFromJson(json);
}

/// Information about a named query ID that could not be processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedNamedQueryId {
  /// The error code returned when the processing request for the named query
  /// failed, if applicable.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message returned when the processing request for the named query
  /// failed, if applicable.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The unique identifier of the named query.
  @_s.JsonKey(name: 'NamedQueryId')
  final String namedQueryId;

  UnprocessedNamedQueryId({
    this.errorCode,
    this.errorMessage,
    this.namedQueryId,
  });
  factory UnprocessedNamedQueryId.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedNamedQueryIdFromJson(json);
}

/// Describes a query execution that failed to process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedQueryExecutionId {
  /// The error code returned when the query execution failed to process, if
  /// applicable.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message returned when the query execution failed to process, if
  /// applicable.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The unique identifier of the query execution.
  @_s.JsonKey(name: 'QueryExecutionId')
  final String queryExecutionId;

  UnprocessedQueryExecutionId({
    this.errorCode,
    this.errorMessage,
    this.queryExecutionId,
  });
  factory UnprocessedQueryExecutionId.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedQueryExecutionIdFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkGroupOutput {
  UpdateWorkGroupOutput();
  factory UpdateWorkGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkGroupOutputFromJson(json);
}

/// A workgroup, which contains a name, description, creation time, state, and
/// other configuration, listed under <a>WorkGroup$Configuration</a>. Each
/// workgroup enables you to isolate queries for you or your group of users from
/// other queries in the same account, to configure the query results location
/// and the encryption configuration (known as workgroup settings), to enable
/// sending query metrics to Amazon CloudWatch, and to establish per-query data
/// usage control limits for all queries in a workgroup. The workgroup settings
/// override is specified in EnforceWorkGroupConfiguration (true/false) in the
/// WorkGroupConfiguration. See
/// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkGroup {
  /// The workgroup name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The configuration of the workgroup, which includes the location in Amazon S3
  /// where query results are stored, the encryption configuration, if any, used
  /// for query results; whether the Amazon CloudWatch Metrics are enabled for the
  /// workgroup; whether workgroup settings override client-side settings; and the
  /// data usage limits for the amount of data scanned per query or per workgroup.
  /// The workgroup settings override is specified in
  /// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
  /// See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  @_s.JsonKey(name: 'Configuration')
  final WorkGroupConfiguration configuration;

  /// The date and time the workgroup was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The workgroup description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The state of the workgroup: ENABLED or DISABLED.
  @_s.JsonKey(name: 'State')
  final WorkGroupState state;

  WorkGroup({
    @_s.required this.name,
    this.configuration,
    this.creationTime,
    this.description,
    this.state,
  });
  factory WorkGroup.fromJson(Map<String, dynamic> json) =>
      _$WorkGroupFromJson(json);
}

/// The configuration of the workgroup, which includes the location in Amazon S3
/// where query results are stored, the encryption option, if any, used for
/// query results, whether the Amazon CloudWatch Metrics are enabled for the
/// workgroup and whether workgroup settings override query settings, and the
/// data usage limits for the amount of data scanned per query or per workgroup.
/// The workgroup settings override is specified in
/// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
/// See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkGroupConfiguration {
  /// The upper data usage limit (cutoff) for the amount of bytes a single query
  /// in a workgroup is allowed to scan.
  @_s.JsonKey(name: 'BytesScannedCutoffPerQuery')
  final int bytesScannedCutoffPerQuery;

  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false", client-side settings are used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  @_s.JsonKey(name: 'EnforceWorkGroupConfiguration')
  final bool enforceWorkGroupConfiguration;

  /// Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.
  @_s.JsonKey(name: 'PublishCloudWatchMetricsEnabled')
  final bool publishCloudWatchMetricsEnabled;

  /// If set to <code>true</code>, allows members assigned to a workgroup to
  /// reference Amazon S3 Requester Pays buckets in queries. If set to
  /// <code>false</code>, workgroup members cannot query data from Requester Pays
  /// buckets, and queries that retrieve data from Requester Pays buckets cause an
  /// error. The default is <code>false</code>. For more information about
  /// Requester Pays buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'RequesterPaysEnabled')
  final bool requesterPaysEnabled;

  /// The configuration for the workgroup, which includes the location in Amazon
  /// S3 where query results are stored and the encryption option, if any, used
  /// for query results. To run the query, you must specify the query results
  /// location using one of the ways: either in the workgroup using this setting,
  /// or for individual queries (client-side), using
  /// <a>ResultConfiguration$OutputLocation</a>. If none of them is set, Athena
  /// issues an error that no output location is provided. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query
  /// Results</a>.
  @_s.JsonKey(name: 'ResultConfiguration')
  final ResultConfiguration resultConfiguration;

  WorkGroupConfiguration({
    this.bytesScannedCutoffPerQuery,
    this.enforceWorkGroupConfiguration,
    this.publishCloudWatchMetricsEnabled,
    this.requesterPaysEnabled,
    this.resultConfiguration,
  });
  factory WorkGroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$WorkGroupConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$WorkGroupConfigurationToJson(this);
}

/// The configuration information that will be updated for this workgroup, which
/// includes the location in Amazon S3 where query results are stored, the
/// encryption option, if any, used for query results, whether the Amazon
/// CloudWatch Metrics are enabled for the workgroup, whether the workgroup
/// settings override the client-side settings, and the data usage limit for the
/// amount of bytes scanned per query, if it is specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkGroupConfigurationUpdates {
  /// The upper limit (cutoff) for the amount of bytes a single query in a
  /// workgroup is allowed to scan.
  @_s.JsonKey(name: 'BytesScannedCutoffPerQuery')
  final int bytesScannedCutoffPerQuery;

  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false" client-side settings are used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  @_s.JsonKey(name: 'EnforceWorkGroupConfiguration')
  final bool enforceWorkGroupConfiguration;

  /// Indicates whether this workgroup enables publishing metrics to Amazon
  /// CloudWatch.
  @_s.JsonKey(name: 'PublishCloudWatchMetricsEnabled')
  final bool publishCloudWatchMetricsEnabled;

  /// Indicates that the data usage control limit per query is removed.
  /// <a>WorkGroupConfiguration$BytesScannedCutoffPerQuery</a>
  @_s.JsonKey(name: 'RemoveBytesScannedCutoffPerQuery')
  final bool removeBytesScannedCutoffPerQuery;

  /// If set to <code>true</code>, allows members assigned to a workgroup to
  /// specify Amazon S3 Requester Pays buckets in queries. If set to
  /// <code>false</code>, workgroup members cannot query data from Requester Pays
  /// buckets, and queries that retrieve data from Requester Pays buckets cause an
  /// error. The default is <code>false</code>. For more information about
  /// Requester Pays buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'RequesterPaysEnabled')
  final bool requesterPaysEnabled;

  /// The result configuration information about the queries in this workgroup
  /// that will be updated. Includes the updated results location and an updated
  /// option for encrypting query results.
  @_s.JsonKey(name: 'ResultConfigurationUpdates')
  final ResultConfigurationUpdates resultConfigurationUpdates;

  WorkGroupConfigurationUpdates({
    this.bytesScannedCutoffPerQuery,
    this.enforceWorkGroupConfiguration,
    this.publishCloudWatchMetricsEnabled,
    this.removeBytesScannedCutoffPerQuery,
    this.requesterPaysEnabled,
    this.resultConfigurationUpdates,
  });
  Map<String, dynamic> toJson() => _$WorkGroupConfigurationUpdatesToJson(this);
}

enum WorkGroupState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// The summary information for the workgroup, which includes its name, state,
/// description, and the date and time it was created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkGroupSummary {
  /// The workgroup creation date and time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The workgroup description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the workgroup.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the workgroup.
  @_s.JsonKey(name: 'State')
  final WorkGroupState state;

  WorkGroupSummary({
    this.creationTime,
    this.description,
    this.name,
    this.state,
  });
  factory WorkGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkGroupSummaryFromJson(json);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
