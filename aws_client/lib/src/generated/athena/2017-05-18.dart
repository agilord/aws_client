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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'athena',
          ),
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
    required List<String> namedQueryIds,
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
    required List<String> queryExecutionIds,
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

  /// Creates (registers) a data catalog with the specified name and properties.
  /// Catalogs created are visible to all users of the same AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to create. The catalog name must be unique
  /// for the AWS account and can use a maximum of 128 alphanumeric, underscore,
  /// at sign, or hyphen characters.
  ///
  /// Parameter [type] :
  /// The type of data catalog to create: <code>LAMBDA</code> for a federated
  /// catalog or <code>HIVE</code> for an external hive metastore.
  /// <note>
  /// Do not use the <code>GLUE</code> type. This refers to the
  /// <code>AwsDataCatalog</code> that already exists in your account, of which
  /// you can have only one. Specifying the <code>GLUE</code> type will result
  /// in an <code>INVALID_INPUT</code> error.
  /// </note>
  ///
  /// Parameter [description] :
  /// A description of the data catalog to be created.
  ///
  /// Parameter [parameters] :
  /// Specifies the Lambda function or functions to use for creating the data
  /// catalog. This is a mapping whose values depend on the catalog type.
  ///
  /// <ul>
  /// <li>
  /// For the <code>HIVE</code> data catalog type, use the following syntax. The
  /// <code>metadata-function</code> parameter is required. <code>The
  /// sdk-version</code> parameter is optional and defaults to the currently
  /// supported version.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>,
  /// sdk-version=<i>version_number</i> </code>
  /// </li>
  /// <li>
  /// For the <code>LAMBDA</code> data catalog type, use one of the following
  /// sets of required parameters, but not both.
  ///
  /// <ul>
  /// <li>
  /// If you have one Lambda function that processes metadata and another for
  /// reading the actual data, use the following syntax. Both parameters are
  /// required.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>,
  /// record-function=<i>lambda_arn</i> </code>
  /// </li>
  /// <li>
  /// If you have a composite Lambda function that processes both metadata and
  /// data, use the following syntax to specify your Lambda function.
  ///
  /// <code>function=<i>lambda_arn</i> </code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of comma separated tags to add to the data catalog that is created.
  Future<void> createDataCatalog({
    required String name,
    required DataCatalogType type,
    String? description,
    Map<String, String>? parameters,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateDataCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Type': type.toValue(),
        if (description != null) 'Description': description,
        if (parameters != null) 'Parameters': parameters,
        if (tags != null) 'Tags': tags,
      },
    );
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
    required String database,
    required String name,
    required String queryString,
    String? clientRequestToken,
    String? description,
    String? workGroup,
  }) async {
    ArgumentError.checkNotNull(database, 'database');
    _s.validateStringLength(
      'database',
      database,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      262144,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
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
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (workGroup != null) 'WorkGroup': workGroup,
      },
    );

    return CreateNamedQueryOutput.fromJson(jsonResponse.body);
  }

  /// Creates a prepared statement for use with SQL queries in Athena.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryStatement] :
  /// The query string for the prepared statement.
  ///
  /// Parameter [statementName] :
  /// The name of the prepared statement.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup to which the prepared statement belongs.
  ///
  /// Parameter [description] :
  /// The description of the prepared statement.
  Future<void> createPreparedStatement({
    required String queryStatement,
    required String statementName,
    required String workGroup,
    String? description,
  }) async {
    ArgumentError.checkNotNull(queryStatement, 'queryStatement');
    _s.validateStringLength(
      'queryStatement',
      queryStatement,
      1,
      262144,
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementName, 'statementName');
    _s.validateStringLength(
      'statementName',
      statementName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreatePreparedStatement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryStatement': queryStatement,
        'StatementName': statementName,
        'WorkGroup': workGroup,
        if (description != null) 'Description': description,
      },
    );
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
  /// A list of comma separated tags to add to the workgroup that is created.
  Future<void> createWorkGroup({
    required String name,
    WorkGroupConfiguration? configuration,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateWorkGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (configuration != null) 'Configuration': configuration,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Deletes a data catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to delete.
  Future<void> deleteDataCatalog({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteDataCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
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
    String? namedQueryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteNamedQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamedQueryId': namedQueryId ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Deletes the prepared statement with the specified name from the specified
  /// workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [statementName] :
  /// The name of the prepared statement to delete.
  ///
  /// Parameter [workGroup] :
  /// The workgroup to which the statement to be deleted belongs.
  Future<void> deletePreparedStatement({
    required String statementName,
    required String workGroup,
  }) async {
    ArgumentError.checkNotNull(statementName, 'statementName');
    _s.validateStringLength(
      'statementName',
      statementName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeletePreparedStatement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StatementName': statementName,
        'WorkGroup': workGroup,
      },
    );
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
  /// contains any named queries or query executions.
  Future<void> deleteWorkGroup({
    required String workGroup,
    bool? recursiveDeleteOption,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteWorkGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        if (recursiveDeleteOption != null)
          'RecursiveDeleteOption': recursiveDeleteOption,
      },
    );
  }

  /// Returns the specified data catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to return.
  Future<GetDataCatalogOutput> getDataCatalog({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetDataCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return GetDataCatalogOutput.fromJson(jsonResponse.body);
  }

  /// Returns a database object for the specified database and data catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [MetadataException].
  ///
  /// Parameter [catalogName] :
  /// The name of the data catalog that contains the database to return.
  ///
  /// Parameter [databaseName] :
  /// The name of the database to return.
  Future<GetDatabaseOutput> getDatabase({
    required String catalogName,
    required String databaseName,
  }) async {
    ArgumentError.checkNotNull(catalogName, 'catalogName');
    _s.validateStringLength(
      'catalogName',
      catalogName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CatalogName': catalogName,
        'DatabaseName': databaseName,
      },
    );

    return GetDatabaseOutput.fromJson(jsonResponse.body);
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
    required String namedQueryId,
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

  /// Retrieves the prepared statement with the specified name from the
  /// specified workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [statementName] :
  /// The name of the prepared statement to retrieve.
  ///
  /// Parameter [workGroup] :
  /// The workgroup to which the statement to be retrieved belongs.
  Future<GetPreparedStatementOutput> getPreparedStatement({
    required String statementName,
    required String workGroup,
  }) async {
    ArgumentError.checkNotNull(statementName, 'statementName');
    _s.validateStringLength(
      'statementName',
      statementName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetPreparedStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StatementName': statementName,
        'WorkGroup': workGroup,
      },
    );

    return GetPreparedStatementOutput.fromJson(jsonResponse.body);
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
    required String queryExecutionId,
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
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<GetQueryResultsOutput> getQueryResults({
    required String queryExecutionId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(queryExecutionId, 'queryExecutionId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetQueryResultsOutput.fromJson(jsonResponse.body);
  }

  /// Returns table metadata for the specified catalog, database, and table.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [MetadataException].
  ///
  /// Parameter [catalogName] :
  /// The name of the data catalog that contains the database and table metadata
  /// to return.
  ///
  /// Parameter [databaseName] :
  /// The name of the database that contains the table metadata to return.
  ///
  /// Parameter [tableName] :
  /// The name of the table for which metadata is returned.
  Future<GetTableMetadataOutput> getTableMetadata({
    required String catalogName,
    required String databaseName,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(catalogName, 'catalogName');
    _s.validateStringLength(
      'catalogName',
      catalogName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetTableMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CatalogName': catalogName,
        'DatabaseName': databaseName,
        'TableName': tableName,
      },
    );

    return GetTableMetadataOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the workgroup with the specified name.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup.
  Future<GetWorkGroupOutput> getWorkGroup({
    required String workGroup,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
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

  /// Lists the data catalogs in the current AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of data catalogs to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  Future<ListDataCatalogsOutput> listDataCatalogs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      2,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListDataCatalogs'
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

    return ListDataCatalogsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the databases in the specified data catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [MetadataException].
  ///
  /// Parameter [catalogName] :
  /// The name of the data catalog that contains the databases to return.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListDatabasesOutput> listDatabases({
    required String catalogName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(catalogName, 'catalogName');
    _s.validateStringLength(
      'catalogName',
      catalogName,
      1,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListDatabases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CatalogName': catalogName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDatabasesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of engine versions that are available to choose from,
  /// including the Auto option.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of engine versions to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListEngineVersionsOutput> listEngineVersions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListEngineVersions'
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

    return ListEngineVersionsOutput.fromJson(jsonResponse.body);
  }

  /// Provides a list of available query IDs only for queries saved in the
  /// specified workgroup. Requires that you have access to the specified
  /// workgroup. If a workgroup is not specified, lists the saved queries for
  /// the primary workgroup.
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
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup from which the named queries are being returned.
  /// If a workgroup is not specified, the saved queries for the primary
  /// workgroup are returned.
  Future<ListNamedQueriesOutput> listNamedQueries({
    int? maxResults,
    String? nextToken,
    String? workGroup,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (workGroup != null) 'WorkGroup': workGroup,
      },
    );

    return ListNamedQueriesOutput.fromJson(jsonResponse.body);
  }

  /// Lists the prepared statements in the specfied workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The workgroup to list the prepared statements for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListPreparedStatementsOutput> listPreparedStatements({
    required String workGroup,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListPreparedStatements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPreparedStatementsOutput.fromJson(jsonResponse.body);
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
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup from which queries are being returned. If a
  /// workgroup is not specified, a list of available query execution IDs for
  /// the queries in the primary workgroup is returned.
  Future<ListQueryExecutionsOutput> listQueryExecutions({
    int? maxResults,
    String? nextToken,
    String? workGroup,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (workGroup != null) 'WorkGroup': workGroup,
      },
    );

    return ListQueryExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the metadata for the tables in the specified data catalog database.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [MetadataException].
  ///
  /// Parameter [catalogName] :
  /// The name of the data catalog for which table metadata should be returned.
  ///
  /// Parameter [databaseName] :
  /// The name of the database for which table metadata should be returned.
  ///
  /// Parameter [expression] :
  /// A regex filter that pattern-matches table names. If no expression is
  /// supplied, metadata for all tables are listed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  Future<ListTableMetadataOutput> listTableMetadata({
    required String catalogName,
    required String databaseName,
    String? expression,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(catalogName, 'catalogName');
    _s.validateStringLength(
      'catalogName',
      catalogName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListTableMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CatalogName': catalogName,
        'DatabaseName': databaseName,
        if (expression != null) 'Expression': expression,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTableMetadataOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags associated with an Athena workgroup or data catalog
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Lists the tags for the resource with the specified ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request that lists the
  /// tags for the resource.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no additional
  /// results for this request, where the request lists the tags for the
  /// resource with the specified ARN.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      75,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListWorkGroupsOutput> listWorkGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWorkGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Runs the SQL query statements contained in the <code>Query</code>.
  /// Requires you to have access to the workgroup in which the query ran.
  /// Running queries against an external catalog requires <a>GetDataCatalog</a>
  /// permission to the catalog. For code samples using the AWS SDK for Java,
  /// see <a
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
    required String queryString,
    String? clientRequestToken,
    QueryExecutionContext? queryExecutionContext,
    ResultConfiguration? resultConfiguration,
    String? workGroup,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      262144,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      128,
    );
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
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (queryExecutionContext != null)
          'QueryExecutionContext': queryExecutionContext,
        if (resultConfiguration != null)
          'ResultConfiguration': resultConfiguration,
        if (workGroup != null) 'WorkGroup': workGroup,
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
    String? queryExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StopQueryExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryExecutionId': queryExecutionId ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Adds one or more tags to an Athena resource. A tag is a label that you
  /// assign to a resource. In Athena, a resource can be a workgroup or data
  /// catalog. Each tag consists of a key and an optional value, both of which
  /// you define. For example, you can use tags to categorize Athena workgroups
  /// or data catalogs by purpose, owner, or environment. Use a consistent set
  /// of tag keys to make it easier to search and filter workgroups or data
  /// catalogs in your account. For best practices, see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging
  /// Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode
  /// characters, and tag values can be from 0 to 256 UTF-8 Unicode characters.
  /// Tags can use letters and numbers representable in UTF-8, and the following
  /// characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag
  /// keys must be unique per resource. If you specify more than one tag,
  /// separate them by commas.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Specifies the ARN of the Athena resource (workgroup or data catalog) to
  /// which tags are to be added.
  ///
  /// Parameter [tags] :
  /// A collection of one or more tags, separated by commas, to be added to an
  /// Athena workgroup or data catalog resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.TagResource'
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

  /// Removes one or more tags from a data catalog or workgroup resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Specifies the ARN of the resource from which tags are to be removed.
  ///
  /// Parameter [tagKeys] :
  /// A comma-separated list of one or more tag keys whose tags are to be
  /// removed from the specified resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UntagResource'
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

  /// Updates the data catalog that has the specified name.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to update. The catalog name must be unique
  /// for the AWS account and can use a maximum of 128 alphanumeric, underscore,
  /// at sign, or hyphen characters.
  ///
  /// Parameter [type] :
  /// Specifies the type of data catalog to update. Specify <code>LAMBDA</code>
  /// for a federated catalog or <code>HIVE</code> for an external hive
  /// metastore.
  /// <note>
  /// Do not use the <code>GLUE</code> type. This refers to the
  /// <code>AwsDataCatalog</code> that already exists in your account, of which
  /// you can have only one. Specifying the <code>GLUE</code> type will result
  /// in an <code>INVALID_INPUT</code> error.
  /// </note>
  ///
  /// Parameter [description] :
  /// New or modified text that describes the data catalog.
  ///
  /// Parameter [parameters] :
  /// Specifies the Lambda function or functions to use for updating the data
  /// catalog. This is a mapping whose values depend on the catalog type.
  ///
  /// <ul>
  /// <li>
  /// For the <code>HIVE</code> data catalog type, use the following syntax. The
  /// <code>metadata-function</code> parameter is required. <code>The
  /// sdk-version</code> parameter is optional and defaults to the currently
  /// supported version.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>,
  /// sdk-version=<i>version_number</i> </code>
  /// </li>
  /// <li>
  /// For the <code>LAMBDA</code> data catalog type, use one of the following
  /// sets of required parameters, but not both.
  ///
  /// <ul>
  /// <li>
  /// If you have one Lambda function that processes metadata and another for
  /// reading the actual data, use the following syntax. Both parameters are
  /// required.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>,
  /// record-function=<i>lambda_arn</i> </code>
  /// </li>
  /// <li>
  /// If you have a composite Lambda function that processes both metadata and
  /// data, use the following syntax to specify your Lambda function.
  ///
  /// <code>function=<i>lambda_arn</i> </code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  Future<void> updateDataCatalog({
    required String name,
    required DataCatalogType type,
    String? description,
    Map<String, String>? parameters,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateDataCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Type': type.toValue(),
        if (description != null) 'Description': description,
        if (parameters != null) 'Parameters': parameters,
      },
    );
  }

  /// Updates a prepared statement.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [queryStatement] :
  /// The query string for the prepared statement.
  ///
  /// Parameter [statementName] :
  /// The name of the prepared statement.
  ///
  /// Parameter [workGroup] :
  /// The workgroup for the prepared statement.
  ///
  /// Parameter [description] :
  /// The description of the prepared statement.
  Future<void> updatePreparedStatement({
    required String queryStatement,
    required String statementName,
    required String workGroup,
    String? description,
  }) async {
    ArgumentError.checkNotNull(queryStatement, 'queryStatement');
    _s.validateStringLength(
      'queryStatement',
      queryStatement,
      1,
      262144,
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementName, 'statementName');
    _s.validateStringLength(
      'statementName',
      statementName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdatePreparedStatement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryStatement': queryStatement,
        'StatementName': statementName,
        'WorkGroup': workGroup,
        if (description != null) 'Description': description,
      },
    );
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
    required String workGroup,
    WorkGroupConfigurationUpdates? configurationUpdates,
    String? description,
    WorkGroupState? state,
  }) async {
    ArgumentError.checkNotNull(workGroup, 'workGroup');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateWorkGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        if (configurationUpdates != null)
          'ConfigurationUpdates': configurationUpdates,
        if (description != null) 'Description': description,
        if (state != null) 'State': state.toValue(),
      },
    );
  }
}

class BatchGetNamedQueryOutput {
  /// Information about the named query IDs submitted.
  final List<NamedQuery>? namedQueries;

  /// Information about provided query IDs.
  final List<UnprocessedNamedQueryId>? unprocessedNamedQueryIds;

  BatchGetNamedQueryOutput({
    this.namedQueries,
    this.unprocessedNamedQueryIds,
  });

  factory BatchGetNamedQueryOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetNamedQueryOutput(
      namedQueries: (json['NamedQueries'] as List?)
          ?.whereNotNull()
          .map((e) => NamedQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedNamedQueryIds: (json['UnprocessedNamedQueryIds'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UnprocessedNamedQueryId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final namedQueries = this.namedQueries;
    final unprocessedNamedQueryIds = this.unprocessedNamedQueryIds;
    return {
      if (namedQueries != null) 'NamedQueries': namedQueries,
      if (unprocessedNamedQueryIds != null)
        'UnprocessedNamedQueryIds': unprocessedNamedQueryIds,
    };
  }
}

class BatchGetQueryExecutionOutput {
  /// Information about a query execution.
  final List<QueryExecution>? queryExecutions;

  /// Information about the query executions that failed to run.
  final List<UnprocessedQueryExecutionId>? unprocessedQueryExecutionIds;

  BatchGetQueryExecutionOutput({
    this.queryExecutions,
    this.unprocessedQueryExecutionIds,
  });

  factory BatchGetQueryExecutionOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetQueryExecutionOutput(
      queryExecutions: (json['QueryExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => QueryExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedQueryExecutionIds: (json['UnprocessedQueryExecutionIds']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              UnprocessedQueryExecutionId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final queryExecutions = this.queryExecutions;
    final unprocessedQueryExecutionIds = this.unprocessedQueryExecutionIds;
    return {
      if (queryExecutions != null) 'QueryExecutions': queryExecutions,
      if (unprocessedQueryExecutionIds != null)
        'UnprocessedQueryExecutionIds': unprocessedQueryExecutionIds,
    };
  }
}

/// Contains metadata for a column in a table.
class Column {
  /// The name of the column.
  final String name;

  /// Optional information about the column.
  final String? comment;

  /// The data type of the column.
  final String? type;

  Column({
    required this.name,
    this.comment,
    this.type,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      name: json['Name'] as String,
      comment: json['Comment'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final comment = this.comment;
    final type = this.type;
    return {
      'Name': name,
      if (comment != null) 'Comment': comment,
      if (type != null) 'Type': type,
    };
  }
}

/// Information about the columns in a query execution result.
class ColumnInfo {
  /// The name of the column.
  final String name;

  /// The data type of the column.
  final String type;

  /// Indicates whether values in the column are case-sensitive.
  final bool? caseSensitive;

  /// The catalog to which the query results belong.
  final String? catalogName;

  /// A column label.
  final String? label;

  /// Indicates the column's nullable status.
  final ColumnNullable? nullable;

  /// For <code>DECIMAL</code> data types, specifies the total number of digits,
  /// up to 38. For performance reasons, we recommend up to 18 digits.
  final int? precision;

  /// For <code>DECIMAL</code> data types, specifies the total number of digits in
  /// the fractional part of the value. Defaults to 0.
  final int? scale;

  /// The schema name (database name) to which the query results belong.
  final String? schemaName;

  /// The table name for the query results.
  final String? tableName;

  ColumnInfo({
    required this.name,
    required this.type,
    this.caseSensitive,
    this.catalogName,
    this.label,
    this.nullable,
    this.precision,
    this.scale,
    this.schemaName,
    this.tableName,
  });

  factory ColumnInfo.fromJson(Map<String, dynamic> json) {
    return ColumnInfo(
      name: json['Name'] as String,
      type: json['Type'] as String,
      caseSensitive: json['CaseSensitive'] as bool?,
      catalogName: json['CatalogName'] as String?,
      label: json['Label'] as String?,
      nullable: (json['Nullable'] as String?)?.toColumnNullable(),
      precision: json['Precision'] as int?,
      scale: json['Scale'] as int?,
      schemaName: json['SchemaName'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final caseSensitive = this.caseSensitive;
    final catalogName = this.catalogName;
    final label = this.label;
    final nullable = this.nullable;
    final precision = this.precision;
    final scale = this.scale;
    final schemaName = this.schemaName;
    final tableName = this.tableName;
    return {
      'Name': name,
      'Type': type,
      if (caseSensitive != null) 'CaseSensitive': caseSensitive,
      if (catalogName != null) 'CatalogName': catalogName,
      if (label != null) 'Label': label,
      if (nullable != null) 'Nullable': nullable.toValue(),
      if (precision != null) 'Precision': precision,
      if (scale != null) 'Scale': scale,
      if (schemaName != null) 'SchemaName': schemaName,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

enum ColumnNullable {
  notNull,
  nullable,
  unknown,
}

extension on ColumnNullable {
  String toValue() {
    switch (this) {
      case ColumnNullable.notNull:
        return 'NOT_NULL';
      case ColumnNullable.nullable:
        return 'NULLABLE';
      case ColumnNullable.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  ColumnNullable toColumnNullable() {
    switch (this) {
      case 'NOT_NULL':
        return ColumnNullable.notNull;
      case 'NULLABLE':
        return ColumnNullable.nullable;
      case 'UNKNOWN':
        return ColumnNullable.unknown;
    }
    throw Exception('$this is not known in enum ColumnNullable');
  }
}

class CreateDataCatalogOutput {
  CreateDataCatalogOutput();

  factory CreateDataCatalogOutput.fromJson(Map<String, dynamic> _) {
    return CreateDataCatalogOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateNamedQueryOutput {
  /// The unique ID of the query.
  final String? namedQueryId;

  CreateNamedQueryOutput({
    this.namedQueryId,
  });

  factory CreateNamedQueryOutput.fromJson(Map<String, dynamic> json) {
    return CreateNamedQueryOutput(
      namedQueryId: json['NamedQueryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namedQueryId = this.namedQueryId;
    return {
      if (namedQueryId != null) 'NamedQueryId': namedQueryId,
    };
  }
}

class CreatePreparedStatementOutput {
  CreatePreparedStatementOutput();

  factory CreatePreparedStatementOutput.fromJson(Map<String, dynamic> _) {
    return CreatePreparedStatementOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateWorkGroupOutput {
  CreateWorkGroupOutput();

  factory CreateWorkGroupOutput.fromJson(Map<String, dynamic> _) {
    return CreateWorkGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about a data catalog in an AWS account.
class DataCatalog {
  /// The name of the data catalog. The catalog name must be unique for the AWS
  /// account and can use a maximum of 128 alphanumeric, underscore, at sign, or
  /// hyphen characters.
  final String name;

  /// The type of data catalog: <code>LAMBDA</code> for a federated catalog or
  /// <code>HIVE</code> for an external hive metastore. <code>GLUE</code> refers
  /// to the <code>AwsDataCatalog</code> that already exists in your account, of
  /// which you can have only one.
  final DataCatalogType type;

  /// An optional description of the data catalog.
  final String? description;

  /// Specifies the Lambda function or functions to use for the data catalog. This
  /// is a mapping whose values depend on the catalog type.
  ///
  /// <ul>
  /// <li>
  /// For the <code>HIVE</code> data catalog type, use the following syntax. The
  /// <code>metadata-function</code> parameter is required. <code>The
  /// sdk-version</code> parameter is optional and defaults to the currently
  /// supported version.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>, sdk-version=<i>version_number</i>
  /// </code>
  /// </li>
  /// <li>
  /// For the <code>LAMBDA</code> data catalog type, use one of the following sets
  /// of required parameters, but not both.
  ///
  /// <ul>
  /// <li>
  /// If you have one Lambda function that processes metadata and another for
  /// reading the actual data, use the following syntax. Both parameters are
  /// required.
  ///
  /// <code>metadata-function=<i>lambda_arn</i>, record-function=<i>lambda_arn</i>
  /// </code>
  /// </li>
  /// <li>
  /// If you have a composite Lambda function that processes both metadata and
  /// data, use the following syntax to specify your Lambda function.
  ///
  /// <code>function=<i>lambda_arn</i> </code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  final Map<String, String>? parameters;

  DataCatalog({
    required this.name,
    required this.type,
    this.description,
    this.parameters,
  });

  factory DataCatalog.fromJson(Map<String, dynamic> json) {
    return DataCatalog(
      name: json['Name'] as String,
      type: (json['Type'] as String).toDataCatalogType(),
      description: json['Description'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    final parameters = this.parameters;
    return {
      'Name': name,
      'Type': type.toValue(),
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// The summary information for the data catalog, which includes its name and
/// type.
class DataCatalogSummary {
  /// The name of the data catalog.
  final String? catalogName;

  /// The data catalog type.
  final DataCatalogType? type;

  DataCatalogSummary({
    this.catalogName,
    this.type,
  });

  factory DataCatalogSummary.fromJson(Map<String, dynamic> json) {
    return DataCatalogSummary(
      catalogName: json['CatalogName'] as String?,
      type: (json['Type'] as String?)?.toDataCatalogType(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogName = this.catalogName;
    final type = this.type;
    return {
      if (catalogName != null) 'CatalogName': catalogName,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum DataCatalogType {
  lambda,
  glue,
  hive,
}

extension on DataCatalogType {
  String toValue() {
    switch (this) {
      case DataCatalogType.lambda:
        return 'LAMBDA';
      case DataCatalogType.glue:
        return 'GLUE';
      case DataCatalogType.hive:
        return 'HIVE';
    }
  }
}

extension on String {
  DataCatalogType toDataCatalogType() {
    switch (this) {
      case 'LAMBDA':
        return DataCatalogType.lambda;
      case 'GLUE':
        return DataCatalogType.glue;
      case 'HIVE':
        return DataCatalogType.hive;
    }
    throw Exception('$this is not known in enum DataCatalogType');
  }
}

/// Contains metadata information for a database in a data catalog.
class Database {
  /// The name of the database.
  final String name;

  /// An optional description of the database.
  final String? description;

  /// A set of custom key/value pairs.
  final Map<String, String>? parameters;

  Database({
    required this.name,
    this.description,
    this.parameters,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      name: json['Name'] as String,
      description: json['Description'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final parameters = this.parameters;
    return {
      'Name': name,
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// A piece of data (a field in the table).
class Datum {
  /// The value of the datum.
  final String? varCharValue;

  Datum({
    this.varCharValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      varCharValue: json['VarCharValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final varCharValue = this.varCharValue;
    return {
      if (varCharValue != null) 'VarCharValue': varCharValue,
    };
  }
}

class DeleteDataCatalogOutput {
  DeleteDataCatalogOutput();

  factory DeleteDataCatalogOutput.fromJson(Map<String, dynamic> _) {
    return DeleteDataCatalogOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNamedQueryOutput {
  DeleteNamedQueryOutput();

  factory DeleteNamedQueryOutput.fromJson(Map<String, dynamic> _) {
    return DeleteNamedQueryOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePreparedStatementOutput {
  DeletePreparedStatementOutput();

  factory DeletePreparedStatementOutput.fromJson(Map<String, dynamic> _) {
    return DeletePreparedStatementOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkGroupOutput {
  DeleteWorkGroupOutput();

  factory DeleteWorkGroupOutput.fromJson(Map<String, dynamic> _) {
    return DeleteWorkGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If query results are encrypted in Amazon S3, indicates the encryption option
/// used (for example, <code>SSE-KMS</code> or <code>CSE-KMS</code>) and key
/// information.
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
  final EncryptionOption encryptionOption;

  /// For <code>SSE-KMS</code> and <code>CSE-KMS</code>, this is the KMS key ARN
  /// or ID.
  final String? kmsKey;

  EncryptionConfiguration({
    required this.encryptionOption,
    this.kmsKey,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      encryptionOption:
          (json['EncryptionOption'] as String).toEncryptionOption(),
      kmsKey: json['KmsKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionOption = this.encryptionOption;
    final kmsKey = this.kmsKey;
    return {
      'EncryptionOption': encryptionOption.toValue(),
      if (kmsKey != null) 'KmsKey': kmsKey,
    };
  }
}

enum EncryptionOption {
  sseS3,
  sseKms,
  cseKms,
}

extension on EncryptionOption {
  String toValue() {
    switch (this) {
      case EncryptionOption.sseS3:
        return 'SSE_S3';
      case EncryptionOption.sseKms:
        return 'SSE_KMS';
      case EncryptionOption.cseKms:
        return 'CSE_KMS';
    }
  }
}

extension on String {
  EncryptionOption toEncryptionOption() {
    switch (this) {
      case 'SSE_S3':
        return EncryptionOption.sseS3;
      case 'SSE_KMS':
        return EncryptionOption.sseKms;
      case 'CSE_KMS':
        return EncryptionOption.cseKms;
    }
    throw Exception('$this is not known in enum EncryptionOption');
  }
}

/// The Athena engine version for running queries.
class EngineVersion {
  /// Read only. The engine version on which the query runs. If the user requests
  /// a valid engine version other than Auto, the effective engine version is the
  /// same as the engine version that the user requested. If the user requests
  /// Auto, the effective engine version is chosen by Athena. When a request to
  /// update the engine version is made by a <code>CreateWorkGroup</code> or
  /// <code>UpdateWorkGroup</code> operation, the
  /// <code>EffectiveEngineVersion</code> field is ignored.
  final String? effectiveEngineVersion;

  /// The engine version requested by the user. Possible values are determined by
  /// the output of <code>ListEngineVersions</code>, including Auto. The default
  /// is Auto.
  final String? selectedEngineVersion;

  EngineVersion({
    this.effectiveEngineVersion,
    this.selectedEngineVersion,
  });

  factory EngineVersion.fromJson(Map<String, dynamic> json) {
    return EngineVersion(
      effectiveEngineVersion: json['EffectiveEngineVersion'] as String?,
      selectedEngineVersion: json['SelectedEngineVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveEngineVersion = this.effectiveEngineVersion;
    final selectedEngineVersion = this.selectedEngineVersion;
    return {
      if (effectiveEngineVersion != null)
        'EffectiveEngineVersion': effectiveEngineVersion,
      if (selectedEngineVersion != null)
        'SelectedEngineVersion': selectedEngineVersion,
    };
  }
}

class GetDataCatalogOutput {
  /// The data catalog returned.
  final DataCatalog? dataCatalog;

  GetDataCatalogOutput({
    this.dataCatalog,
  });

  factory GetDataCatalogOutput.fromJson(Map<String, dynamic> json) {
    return GetDataCatalogOutput(
      dataCatalog: json['DataCatalog'] != null
          ? DataCatalog.fromJson(json['DataCatalog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCatalog = this.dataCatalog;
    return {
      if (dataCatalog != null) 'DataCatalog': dataCatalog,
    };
  }
}

class GetDatabaseOutput {
  /// The database returned.
  final Database? database;

  GetDatabaseOutput({
    this.database,
  });

  factory GetDatabaseOutput.fromJson(Map<String, dynamic> json) {
    return GetDatabaseOutput(
      database: json['Database'] != null
          ? Database.fromJson(json['Database'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    return {
      if (database != null) 'Database': database,
    };
  }
}

class GetNamedQueryOutput {
  /// Information about the query.
  final NamedQuery? namedQuery;

  GetNamedQueryOutput({
    this.namedQuery,
  });

  factory GetNamedQueryOutput.fromJson(Map<String, dynamic> json) {
    return GetNamedQueryOutput(
      namedQuery: json['NamedQuery'] != null
          ? NamedQuery.fromJson(json['NamedQuery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final namedQuery = this.namedQuery;
    return {
      if (namedQuery != null) 'NamedQuery': namedQuery,
    };
  }
}

class GetPreparedStatementOutput {
  /// The name of the prepared statement that was retrieved.
  final PreparedStatement? preparedStatement;

  GetPreparedStatementOutput({
    this.preparedStatement,
  });

  factory GetPreparedStatementOutput.fromJson(Map<String, dynamic> json) {
    return GetPreparedStatementOutput(
      preparedStatement: json['PreparedStatement'] != null
          ? PreparedStatement.fromJson(
              json['PreparedStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final preparedStatement = this.preparedStatement;
    return {
      if (preparedStatement != null) 'PreparedStatement': preparedStatement,
    };
  }
}

class GetQueryExecutionOutput {
  /// Information about the query execution.
  final QueryExecution? queryExecution;

  GetQueryExecutionOutput({
    this.queryExecution,
  });

  factory GetQueryExecutionOutput.fromJson(Map<String, dynamic> json) {
    return GetQueryExecutionOutput(
      queryExecution: json['QueryExecution'] != null
          ? QueryExecution.fromJson(
              json['QueryExecution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queryExecution = this.queryExecution;
    return {
      if (queryExecution != null) 'QueryExecution': queryExecution,
    };
  }
}

class GetQueryResultsOutput {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  /// The results of the query execution.
  final ResultSet? resultSet;

  /// The number of rows inserted with a CREATE TABLE AS SELECT statement.
  final int? updateCount;

  GetQueryResultsOutput({
    this.nextToken,
    this.resultSet,
    this.updateCount,
  });

  factory GetQueryResultsOutput.fromJson(Map<String, dynamic> json) {
    return GetQueryResultsOutput(
      nextToken: json['NextToken'] as String?,
      resultSet: json['ResultSet'] != null
          ? ResultSet.fromJson(json['ResultSet'] as Map<String, dynamic>)
          : null,
      updateCount: json['UpdateCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resultSet = this.resultSet;
    final updateCount = this.updateCount;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resultSet != null) 'ResultSet': resultSet,
      if (updateCount != null) 'UpdateCount': updateCount,
    };
  }
}

class GetTableMetadataOutput {
  /// An object that contains table metadata.
  final TableMetadata? tableMetadata;

  GetTableMetadataOutput({
    this.tableMetadata,
  });

  factory GetTableMetadataOutput.fromJson(Map<String, dynamic> json) {
    return GetTableMetadataOutput(
      tableMetadata: json['TableMetadata'] != null
          ? TableMetadata.fromJson(
              json['TableMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableMetadata = this.tableMetadata;
    return {
      if (tableMetadata != null) 'TableMetadata': tableMetadata,
    };
  }
}

class GetWorkGroupOutput {
  /// Information about the workgroup.
  final WorkGroup? workGroup;

  GetWorkGroupOutput({
    this.workGroup,
  });

  factory GetWorkGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetWorkGroupOutput(
      workGroup: json['WorkGroup'] != null
          ? WorkGroup.fromJson(json['WorkGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workGroup = this.workGroup;
    return {
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

class ListDataCatalogsOutput {
  /// A summary list of data catalogs.
  final List<DataCatalogSummary>? dataCatalogsSummary;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  final String? nextToken;

  ListDataCatalogsOutput({
    this.dataCatalogsSummary,
    this.nextToken,
  });

  factory ListDataCatalogsOutput.fromJson(Map<String, dynamic> json) {
    return ListDataCatalogsOutput(
      dataCatalogsSummary: (json['DataCatalogsSummary'] as List?)
          ?.whereNotNull()
          .map((e) => DataCatalogSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCatalogsSummary = this.dataCatalogsSummary;
    final nextToken = this.nextToken;
    return {
      if (dataCatalogsSummary != null)
        'DataCatalogsSummary': dataCatalogsSummary,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatabasesOutput {
  /// A list of databases from a data catalog.
  final List<Database>? databaseList;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  final String? nextToken;

  ListDatabasesOutput({
    this.databaseList,
    this.nextToken,
  });

  factory ListDatabasesOutput.fromJson(Map<String, dynamic> json) {
    return ListDatabasesOutput(
      databaseList: (json['DatabaseList'] as List?)
          ?.whereNotNull()
          .map((e) => Database.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseList = this.databaseList;
    final nextToken = this.nextToken;
    return {
      if (databaseList != null) 'DatabaseList': databaseList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEngineVersionsOutput {
  /// A list of engine versions that are available to choose from.
  final List<EngineVersion>? engineVersions;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListEngineVersionsOutput({
    this.engineVersions,
    this.nextToken,
  });

  factory ListEngineVersionsOutput.fromJson(Map<String, dynamic> json) {
    return ListEngineVersionsOutput(
      engineVersions: (json['EngineVersions'] as List?)
          ?.whereNotNull()
          .map((e) => EngineVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersions = this.engineVersions;
    final nextToken = this.nextToken;
    return {
      if (engineVersions != null) 'EngineVersions': engineVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListNamedQueriesOutput {
  /// The list of unique query IDs.
  final List<String>? namedQueryIds;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListNamedQueriesOutput({
    this.namedQueryIds,
    this.nextToken,
  });

  factory ListNamedQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListNamedQueriesOutput(
      namedQueryIds: (json['NamedQueryIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namedQueryIds = this.namedQueryIds;
    final nextToken = this.nextToken;
    return {
      if (namedQueryIds != null) 'NamedQueryIds': namedQueryIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPreparedStatementsOutput {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  /// The list of prepared statements for the workgroup.
  final List<PreparedStatementSummary>? preparedStatements;

  ListPreparedStatementsOutput({
    this.nextToken,
    this.preparedStatements,
  });

  factory ListPreparedStatementsOutput.fromJson(Map<String, dynamic> json) {
    return ListPreparedStatementsOutput(
      nextToken: json['NextToken'] as String?,
      preparedStatements: (json['PreparedStatements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PreparedStatementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final preparedStatements = this.preparedStatements;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (preparedStatements != null) 'PreparedStatements': preparedStatements,
    };
  }
}

class ListQueryExecutionsOutput {
  /// A token to be used by the next request if this request is truncated.
  final String? nextToken;

  /// The unique IDs of each query execution as an array of strings.
  final List<String>? queryExecutionIds;

  ListQueryExecutionsOutput({
    this.nextToken,
    this.queryExecutionIds,
  });

  factory ListQueryExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListQueryExecutionsOutput(
      nextToken: json['NextToken'] as String?,
      queryExecutionIds: (json['QueryExecutionIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryExecutionIds = this.queryExecutionIds;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queryExecutionIds != null) 'QueryExecutionIds': queryExecutionIds,
    };
  }
}

class ListTableMetadataOutput {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  final String? nextToken;

  /// A list of table metadata.
  final List<TableMetadata>? tableMetadataList;

  ListTableMetadataOutput({
    this.nextToken,
    this.tableMetadataList,
  });

  factory ListTableMetadataOutput.fromJson(Map<String, dynamic> json) {
    return ListTableMetadataOutput(
      nextToken: json['NextToken'] as String?,
      tableMetadataList: (json['TableMetadataList'] as List?)
          ?.whereNotNull()
          .map((e) => TableMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableMetadataList = this.tableMetadataList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tableMetadataList != null) 'TableMetadataList': tableMetadataList,
    };
  }
}

class ListTagsForResourceOutput {
  /// A token to be used by the next request if this request is truncated.
  final String? nextToken;

  /// The list of tags associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListWorkGroupsOutput {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  /// A list of <a>WorkGroupSummary</a> objects that include the names,
  /// descriptions, creation times, and states for each workgroup.
  final List<WorkGroupSummary>? workGroups;

  ListWorkGroupsOutput({
    this.nextToken,
    this.workGroups,
  });

  factory ListWorkGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkGroupsOutput(
      nextToken: json['NextToken'] as String?,
      workGroups: (json['WorkGroups'] as List?)
          ?.whereNotNull()
          .map((e) => WorkGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workGroups = this.workGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workGroups != null) 'WorkGroups': workGroups,
    };
  }
}

/// A query, where <code>QueryString</code> is the list of SQL query statements
/// that comprise the query.
class NamedQuery {
  /// The database to which the query belongs.
  final String database;

  /// The query name.
  final String name;

  /// The SQL query statements that comprise the query.
  final String queryString;

  /// The query description.
  final String? description;

  /// The unique identifier of the query.
  final String? namedQueryId;

  /// The name of the workgroup that contains the named query.
  final String? workGroup;

  NamedQuery({
    required this.database,
    required this.name,
    required this.queryString,
    this.description,
    this.namedQueryId,
    this.workGroup,
  });

  factory NamedQuery.fromJson(Map<String, dynamic> json) {
    return NamedQuery(
      database: json['Database'] as String,
      name: json['Name'] as String,
      queryString: json['QueryString'] as String,
      description: json['Description'] as String?,
      namedQueryId: json['NamedQueryId'] as String?,
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final name = this.name;
    final queryString = this.queryString;
    final description = this.description;
    final namedQueryId = this.namedQueryId;
    final workGroup = this.workGroup;
    return {
      'Database': database,
      'Name': name,
      'QueryString': queryString,
      if (description != null) 'Description': description,
      if (namedQueryId != null) 'NamedQueryId': namedQueryId,
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

/// A prepared SQL statement for use with Athena.
class PreparedStatement {
  /// The description of the prepared statement.
  final String? description;

  /// The last modified time of the prepared statement.
  final DateTime? lastModifiedTime;

  /// The query string for the prepared statement.
  final String? queryStatement;

  /// The name of the prepared statement.
  final String? statementName;

  /// The name of the workgroup to which the prepared statement belongs.
  final String? workGroupName;

  PreparedStatement({
    this.description,
    this.lastModifiedTime,
    this.queryStatement,
    this.statementName,
    this.workGroupName,
  });

  factory PreparedStatement.fromJson(Map<String, dynamic> json) {
    return PreparedStatement(
      description: json['Description'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      queryStatement: json['QueryStatement'] as String?,
      statementName: json['StatementName'] as String?,
      workGroupName: json['WorkGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final queryStatement = this.queryStatement;
    final statementName = this.statementName;
    final workGroupName = this.workGroupName;
    return {
      if (description != null) 'Description': description,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (queryStatement != null) 'QueryStatement': queryStatement,
      if (statementName != null) 'StatementName': statementName,
      if (workGroupName != null) 'WorkGroupName': workGroupName,
    };
  }
}

/// The name and last modified time of the prepared statement.
class PreparedStatementSummary {
  /// The last modified time of the prepared statement.
  final DateTime? lastModifiedTime;

  /// The name of the prepared statement.
  final String? statementName;

  PreparedStatementSummary({
    this.lastModifiedTime,
    this.statementName,
  });

  factory PreparedStatementSummary.fromJson(Map<String, dynamic> json) {
    return PreparedStatementSummary(
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      statementName: json['StatementName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTime = this.lastModifiedTime;
    final statementName = this.statementName;
    return {
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (statementName != null) 'StatementName': statementName,
    };
  }
}

/// Information about a single instance of a query execution.
class QueryExecution {
  /// The engine version that executed the query.
  final EngineVersion? engineVersion;

  /// The SQL query statements which the query execution ran.
  final String? query;

  /// The database in which the query execution occurred.
  final QueryExecutionContext? queryExecutionContext;

  /// The unique identifier for each query execution.
  final String? queryExecutionId;

  /// The location in Amazon S3 where query results were stored and the encryption
  /// option, if any, used for query results. These are known as "client-side
  /// settings". If workgroup settings override client-side settings, then the
  /// query uses the location for the query results and the encryption
  /// configuration that are specified for the workgroup.
  final ResultConfiguration? resultConfiguration;

  /// The type of query statement that was run. <code>DDL</code> indicates DDL
  /// query statements. <code>DML</code> indicates DML (Data Manipulation
  /// Language) query statements, such as <code>CREATE TABLE AS SELECT</code>.
  /// <code>UTILITY</code> indicates query statements other than DDL and DML, such
  /// as <code>SHOW CREATE TABLE</code>, or <code>DESCRIBE &lt;table&gt;</code>.
  final StatementType? statementType;

  /// Query execution statistics, such as the amount of data scanned, the amount
  /// of time that the query took to process, and the type of statement that was
  /// run.
  final QueryExecutionStatistics? statistics;

  /// The completion date, current state, submission time, and state change reason
  /// (if applicable) for the query execution.
  final QueryExecutionStatus? status;

  /// The name of the workgroup in which the query ran.
  final String? workGroup;

  QueryExecution({
    this.engineVersion,
    this.query,
    this.queryExecutionContext,
    this.queryExecutionId,
    this.resultConfiguration,
    this.statementType,
    this.statistics,
    this.status,
    this.workGroup,
  });

  factory QueryExecution.fromJson(Map<String, dynamic> json) {
    return QueryExecution(
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      query: json['Query'] as String?,
      queryExecutionContext: json['QueryExecutionContext'] != null
          ? QueryExecutionContext.fromJson(
              json['QueryExecutionContext'] as Map<String, dynamic>)
          : null,
      queryExecutionId: json['QueryExecutionId'] as String?,
      resultConfiguration: json['ResultConfiguration'] != null
          ? ResultConfiguration.fromJson(
              json['ResultConfiguration'] as Map<String, dynamic>)
          : null,
      statementType: (json['StatementType'] as String?)?.toStatementType(),
      statistics: json['Statistics'] != null
          ? QueryExecutionStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? QueryExecutionStatus.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersion = this.engineVersion;
    final query = this.query;
    final queryExecutionContext = this.queryExecutionContext;
    final queryExecutionId = this.queryExecutionId;
    final resultConfiguration = this.resultConfiguration;
    final statementType = this.statementType;
    final statistics = this.statistics;
    final status = this.status;
    final workGroup = this.workGroup;
    return {
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (query != null) 'Query': query,
      if (queryExecutionContext != null)
        'QueryExecutionContext': queryExecutionContext,
      if (queryExecutionId != null) 'QueryExecutionId': queryExecutionId,
      if (resultConfiguration != null)
        'ResultConfiguration': resultConfiguration,
      if (statementType != null) 'StatementType': statementType.toValue(),
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status,
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

/// The database and data catalog context in which the query execution occurs.
class QueryExecutionContext {
  /// The name of the data catalog used in the query execution.
  final String? catalog;

  /// The name of the database used in the query execution.
  final String? database;

  QueryExecutionContext({
    this.catalog,
    this.database,
  });

  factory QueryExecutionContext.fromJson(Map<String, dynamic> json) {
    return QueryExecutionContext(
      catalog: json['Catalog'] as String?,
      database: json['Database'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final database = this.database;
    return {
      if (catalog != null) 'Catalog': catalog,
      if (database != null) 'Database': database,
    };
  }
}

enum QueryExecutionState {
  queued,
  running,
  succeeded,
  failed,
  cancelled,
}

extension on QueryExecutionState {
  String toValue() {
    switch (this) {
      case QueryExecutionState.queued:
        return 'QUEUED';
      case QueryExecutionState.running:
        return 'RUNNING';
      case QueryExecutionState.succeeded:
        return 'SUCCEEDED';
      case QueryExecutionState.failed:
        return 'FAILED';
      case QueryExecutionState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  QueryExecutionState toQueryExecutionState() {
    switch (this) {
      case 'QUEUED':
        return QueryExecutionState.queued;
      case 'RUNNING':
        return QueryExecutionState.running;
      case 'SUCCEEDED':
        return QueryExecutionState.succeeded;
      case 'FAILED':
        return QueryExecutionState.failed;
      case 'CANCELLED':
        return QueryExecutionState.cancelled;
    }
    throw Exception('$this is not known in enum QueryExecutionState');
  }
}

/// The amount of data scanned during the query execution and the amount of time
/// that it took to execute, and the type of statement that was run.
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
  final String? dataManifestLocation;

  /// The number of bytes in the data that was queried.
  final int? dataScannedInBytes;

  /// The number of milliseconds that the query took to execute.
  final int? engineExecutionTimeInMillis;

  /// The number of milliseconds that Athena took to plan the query processing
  /// flow. This includes the time spent retrieving table partitions from the data
  /// source. Note that because the query engine performs the query planning,
  /// query planning time is a subset of engine processing time.
  final int? queryPlanningTimeInMillis;

  /// The number of milliseconds that the query was in your query queue waiting
  /// for resources. Note that if transient errors occur, Athena might
  /// automatically add the query back to the queue.
  final int? queryQueueTimeInMillis;

  /// The number of milliseconds that Athena took to finalize and publish the
  /// query results after the query engine finished running the query.
  final int? serviceProcessingTimeInMillis;

  /// The number of milliseconds that Athena took to run the query.
  final int? totalExecutionTimeInMillis;

  QueryExecutionStatistics({
    this.dataManifestLocation,
    this.dataScannedInBytes,
    this.engineExecutionTimeInMillis,
    this.queryPlanningTimeInMillis,
    this.queryQueueTimeInMillis,
    this.serviceProcessingTimeInMillis,
    this.totalExecutionTimeInMillis,
  });

  factory QueryExecutionStatistics.fromJson(Map<String, dynamic> json) {
    return QueryExecutionStatistics(
      dataManifestLocation: json['DataManifestLocation'] as String?,
      dataScannedInBytes: json['DataScannedInBytes'] as int?,
      engineExecutionTimeInMillis: json['EngineExecutionTimeInMillis'] as int?,
      queryPlanningTimeInMillis: json['QueryPlanningTimeInMillis'] as int?,
      queryQueueTimeInMillis: json['QueryQueueTimeInMillis'] as int?,
      serviceProcessingTimeInMillis:
          json['ServiceProcessingTimeInMillis'] as int?,
      totalExecutionTimeInMillis: json['TotalExecutionTimeInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataManifestLocation = this.dataManifestLocation;
    final dataScannedInBytes = this.dataScannedInBytes;
    final engineExecutionTimeInMillis = this.engineExecutionTimeInMillis;
    final queryPlanningTimeInMillis = this.queryPlanningTimeInMillis;
    final queryQueueTimeInMillis = this.queryQueueTimeInMillis;
    final serviceProcessingTimeInMillis = this.serviceProcessingTimeInMillis;
    final totalExecutionTimeInMillis = this.totalExecutionTimeInMillis;
    return {
      if (dataManifestLocation != null)
        'DataManifestLocation': dataManifestLocation,
      if (dataScannedInBytes != null) 'DataScannedInBytes': dataScannedInBytes,
      if (engineExecutionTimeInMillis != null)
        'EngineExecutionTimeInMillis': engineExecutionTimeInMillis,
      if (queryPlanningTimeInMillis != null)
        'QueryPlanningTimeInMillis': queryPlanningTimeInMillis,
      if (queryQueueTimeInMillis != null)
        'QueryQueueTimeInMillis': queryQueueTimeInMillis,
      if (serviceProcessingTimeInMillis != null)
        'ServiceProcessingTimeInMillis': serviceProcessingTimeInMillis,
      if (totalExecutionTimeInMillis != null)
        'TotalExecutionTimeInMillis': totalExecutionTimeInMillis,
    };
  }
}

/// The completion date, current state, submission time, and state change reason
/// (if applicable) for the query execution.
class QueryExecutionStatus {
  /// The date and time that the query completed.
  final DateTime? completionDateTime;

  /// The state of query execution. <code>QUEUED</code> indicates that the query
  /// has been submitted to the service, and Athena will execute the query as soon
  /// as resources are available. <code>RUNNING</code> indicates that the query is
  /// in execution phase. <code>SUCCEEDED</code> indicates that the query
  /// completed without errors. <code>FAILED</code> indicates that the query
  /// experienced an error and did not complete processing. <code>CANCELLED</code>
  /// indicates that a user input interrupted query execution.
  /// <note>
  /// Athena automatically retries your queries in cases of certain transient
  /// errors. As a result, you may see the query state transition from
  /// <code>RUNNING</code> or <code>FAILED</code> to <code>QUEUED</code>.
  /// </note>
  final QueryExecutionState? state;

  /// Further detail about the status of the query.
  final String? stateChangeReason;

  /// The date and time that the query was submitted.
  final DateTime? submissionDateTime;

  QueryExecutionStatus({
    this.completionDateTime,
    this.state,
    this.stateChangeReason,
    this.submissionDateTime,
  });

  factory QueryExecutionStatus.fromJson(Map<String, dynamic> json) {
    return QueryExecutionStatus(
      completionDateTime: timeStampFromJson(json['CompletionDateTime']),
      state: (json['State'] as String?)?.toQueryExecutionState(),
      stateChangeReason: json['StateChangeReason'] as String?,
      submissionDateTime: timeStampFromJson(json['SubmissionDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionDateTime = this.completionDateTime;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final submissionDateTime = this.submissionDateTime;
    return {
      if (completionDateTime != null)
        'CompletionDateTime': unixTimestampToJson(completionDateTime),
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (submissionDateTime != null)
        'SubmissionDateTime': unixTimestampToJson(submissionDateTime),
    };
  }
}

/// The location in Amazon S3 where query results are stored and the encryption
/// option, if any, used for query results. These are known as "client-side
/// settings". If workgroup settings override client-side settings, then the
/// query uses the workgroup settings.
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
  final EncryptionConfiguration? encryptionConfiguration;

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
  final String? outputLocation;

  ResultConfiguration({
    this.encryptionConfiguration,
    this.outputLocation,
  });

  factory ResultConfiguration.fromJson(Map<String, dynamic> json) {
    return ResultConfiguration(
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      outputLocation: json['OutputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final outputLocation = this.outputLocation;
    return {
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (outputLocation != null) 'OutputLocation': outputLocation,
    };
  }
}

/// The information about the updates in the query results, such as output
/// location and encryption configuration for the query results.
class ResultConfigurationUpdates {
  /// The encryption configuration for the query results.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The location in Amazon S3 where your query results are stored, such as
  /// <code>s3://path/to/query/bucket/</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query
  /// Results</a> If workgroup settings override client-side settings, then the
  /// query uses the location for the query results and the encryption
  /// configuration that are specified for the workgroup. The "workgroup settings
  /// override" is specified in EnforceWorkGroupConfiguration (true/false) in the
  /// WorkGroupConfiguration. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  final String? outputLocation;

  /// If set to "true", indicates that the previously-specified encryption
  /// configuration (also known as the client-side setting) for queries in this
  /// workgroup should be ignored and set to null. If set to "false" or not set,
  /// and a value is present in the EncryptionConfiguration in
  /// ResultConfigurationUpdates (the client-side setting), the
  /// EncryptionConfiguration in the workgroup's ResultConfiguration will be
  /// updated with the new value. For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeEncryptionConfiguration;

  /// If set to "true", indicates that the previously-specified query results
  /// location (also known as a client-side setting) for queries in this workgroup
  /// should be ignored and set to null. If set to "false" or not set, and a value
  /// is present in the OutputLocation in ResultConfigurationUpdates (the
  /// client-side setting), the OutputLocation in the workgroup's
  /// ResultConfiguration will be updated with the new value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeOutputLocation;

  ResultConfigurationUpdates({
    this.encryptionConfiguration,
    this.outputLocation,
    this.removeEncryptionConfiguration,
    this.removeOutputLocation,
  });

  factory ResultConfigurationUpdates.fromJson(Map<String, dynamic> json) {
    return ResultConfigurationUpdates(
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      outputLocation: json['OutputLocation'] as String?,
      removeEncryptionConfiguration:
          json['RemoveEncryptionConfiguration'] as bool?,
      removeOutputLocation: json['RemoveOutputLocation'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final outputLocation = this.outputLocation;
    final removeEncryptionConfiguration = this.removeEncryptionConfiguration;
    final removeOutputLocation = this.removeOutputLocation;
    return {
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (outputLocation != null) 'OutputLocation': outputLocation,
      if (removeEncryptionConfiguration != null)
        'RemoveEncryptionConfiguration': removeEncryptionConfiguration,
      if (removeOutputLocation != null)
        'RemoveOutputLocation': removeOutputLocation,
    };
  }
}

/// The metadata and rows that comprise a query result set. The metadata
/// describes the column structure and data types. To return a
/// <code>ResultSet</code> object, use <a>GetQueryResults</a>.
class ResultSet {
  /// The metadata that describes the column structure and data types of a table
  /// of query results.
  final ResultSetMetadata? resultSetMetadata;

  /// The rows in the table.
  final List<Row>? rows;

  ResultSet({
    this.resultSetMetadata,
    this.rows,
  });

  factory ResultSet.fromJson(Map<String, dynamic> json) {
    return ResultSet(
      resultSetMetadata: json['ResultSetMetadata'] != null
          ? ResultSetMetadata.fromJson(
              json['ResultSetMetadata'] as Map<String, dynamic>)
          : null,
      rows: (json['Rows'] as List?)
          ?.whereNotNull()
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resultSetMetadata = this.resultSetMetadata;
    final rows = this.rows;
    return {
      if (resultSetMetadata != null) 'ResultSetMetadata': resultSetMetadata,
      if (rows != null) 'Rows': rows,
    };
  }
}

/// The metadata that describes the column structure and data types of a table
/// of query results. To return a <code>ResultSetMetadata</code> object, use
/// <a>GetQueryResults</a>.
class ResultSetMetadata {
  /// Information about the columns returned in a query result metadata.
  final List<ColumnInfo>? columnInfo;

  ResultSetMetadata({
    this.columnInfo,
  });

  factory ResultSetMetadata.fromJson(Map<String, dynamic> json) {
    return ResultSetMetadata(
      columnInfo: (json['ColumnInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnInfo = this.columnInfo;
    return {
      if (columnInfo != null) 'ColumnInfo': columnInfo,
    };
  }
}

/// The rows that comprise a query result table.
class Row {
  /// The data that populates a row in a query result table.
  final List<Datum>? data;

  Row({
    this.data,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      data: (json['Data'] as List?)
          ?.whereNotNull()
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'Data': data,
    };
  }
}

class StartQueryExecutionOutput {
  /// The unique ID of the query that ran as a result of this request.
  final String? queryExecutionId;

  StartQueryExecutionOutput({
    this.queryExecutionId,
  });

  factory StartQueryExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StartQueryExecutionOutput(
      queryExecutionId: json['QueryExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryExecutionId = this.queryExecutionId;
    return {
      if (queryExecutionId != null) 'QueryExecutionId': queryExecutionId,
    };
  }
}

enum StatementType {
  ddl,
  dml,
  utility,
}

extension on StatementType {
  String toValue() {
    switch (this) {
      case StatementType.ddl:
        return 'DDL';
      case StatementType.dml:
        return 'DML';
      case StatementType.utility:
        return 'UTILITY';
    }
  }
}

extension on String {
  StatementType toStatementType() {
    switch (this) {
      case 'DDL':
        return StatementType.ddl;
      case 'DML':
        return StatementType.dml;
      case 'UTILITY':
        return StatementType.utility;
    }
    throw Exception('$this is not known in enum StatementType');
  }
}

class StopQueryExecutionOutput {
  StopQueryExecutionOutput();

  factory StopQueryExecutionOutput.fromJson(Map<String, dynamic> _) {
    return StopQueryExecutionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains metadata for a table.
class TableMetadata {
  /// The name of the table.
  final String name;

  /// A list of the columns in the table.
  final List<Column>? columns;

  /// The time that the table was created.
  final DateTime? createTime;

  /// The last time the table was accessed.
  final DateTime? lastAccessTime;

  /// A set of custom key/value pairs for table properties.
  final Map<String, String>? parameters;

  /// A list of the partition keys in the table.
  final List<Column>? partitionKeys;

  /// The type of table. In Athena, only <code>EXTERNAL_TABLE</code> is supported.
  final String? tableType;

  TableMetadata({
    required this.name,
    this.columns,
    this.createTime,
    this.lastAccessTime,
    this.parameters,
    this.partitionKeys,
    this.tableType,
  });

  factory TableMetadata.fromJson(Map<String, dynamic> json) {
    return TableMetadata(
      name: json['Name'] as String,
      columns: (json['Columns'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: timeStampFromJson(json['CreateTime']),
      lastAccessTime: timeStampFromJson(json['LastAccessTime']),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableType: json['TableType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final columns = this.columns;
    final createTime = this.createTime;
    final lastAccessTime = this.lastAccessTime;
    final parameters = this.parameters;
    final partitionKeys = this.partitionKeys;
    final tableType = this.tableType;
    return {
      'Name': name,
      if (columns != null) 'Columns': columns,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (lastAccessTime != null)
        'LastAccessTime': unixTimestampToJson(lastAccessTime),
      if (parameters != null) 'Parameters': parameters,
      if (partitionKeys != null) 'PartitionKeys': partitionKeys,
      if (tableType != null) 'TableType': tableType,
    };
  }
}

/// A label that you assign to a resource. In Athena, a resource can be a
/// workgroup or data catalog. Each tag consists of a key and an optional value,
/// both of which you define. For example, you can use tags to categorize Athena
/// workgroups or data catalogs by purpose, owner, or environment. Use a
/// consistent set of tag keys to make it easier to search and filter workgroups
/// or data catalogs in your account. For best practices, see <a
/// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging
/// Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode characters,
/// and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use
/// letters and numbers representable in UTF-8, and the following characters: +
/// - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be
/// unique per resource. If you specify more than one tag, separate them by
/// commas.
class Tag {
  /// A tag key. The tag key length is from 1 to 128 Unicode characters in UTF-8.
  /// You can use letters and numbers representable in UTF-8, and the following
  /// characters: + - = . _ : / @. Tag keys are case-sensitive and must be unique
  /// per resource.
  final String? key;

  /// A tag value. The tag value length is from 0 to 256 Unicode characters in
  /// UTF-8. You can use letters and numbers representable in UTF-8, and the
  /// following characters: + - = . _ : / @. Tag values are case-sensitive.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a named query ID that could not be processed.
class UnprocessedNamedQueryId {
  /// The error code returned when the processing request for the named query
  /// failed, if applicable.
  final String? errorCode;

  /// The error message returned when the processing request for the named query
  /// failed, if applicable.
  final String? errorMessage;

  /// The unique identifier of the named query.
  final String? namedQueryId;

  UnprocessedNamedQueryId({
    this.errorCode,
    this.errorMessage,
    this.namedQueryId,
  });

  factory UnprocessedNamedQueryId.fromJson(Map<String, dynamic> json) {
    return UnprocessedNamedQueryId(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      namedQueryId: json['NamedQueryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final namedQueryId = this.namedQueryId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (namedQueryId != null) 'NamedQueryId': namedQueryId,
    };
  }
}

/// Describes a query execution that failed to process.
class UnprocessedQueryExecutionId {
  /// The error code returned when the query execution failed to process, if
  /// applicable.
  final String? errorCode;

  /// The error message returned when the query execution failed to process, if
  /// applicable.
  final String? errorMessage;

  /// The unique identifier of the query execution.
  final String? queryExecutionId;

  UnprocessedQueryExecutionId({
    this.errorCode,
    this.errorMessage,
    this.queryExecutionId,
  });

  factory UnprocessedQueryExecutionId.fromJson(Map<String, dynamic> json) {
    return UnprocessedQueryExecutionId(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      queryExecutionId: json['QueryExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final queryExecutionId = this.queryExecutionId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (queryExecutionId != null) 'QueryExecutionId': queryExecutionId,
    };
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDataCatalogOutput {
  UpdateDataCatalogOutput();

  factory UpdateDataCatalogOutput.fromJson(Map<String, dynamic> _) {
    return UpdateDataCatalogOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePreparedStatementOutput {
  UpdatePreparedStatementOutput();

  factory UpdatePreparedStatementOutput.fromJson(Map<String, dynamic> _) {
    return UpdatePreparedStatementOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkGroupOutput {
  UpdateWorkGroupOutput();

  factory UpdateWorkGroupOutput.fromJson(Map<String, dynamic> _) {
    return UpdateWorkGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
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
class WorkGroup {
  /// The workgroup name.
  final String name;

  /// The configuration of the workgroup, which includes the location in Amazon S3
  /// where query results are stored, the encryption configuration, if any, used
  /// for query results; whether the Amazon CloudWatch Metrics are enabled for the
  /// workgroup; whether workgroup settings override client-side settings; and the
  /// data usage limits for the amount of data scanned per query or per workgroup.
  /// The workgroup settings override is specified in
  /// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
  /// See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  final WorkGroupConfiguration? configuration;

  /// The date and time the workgroup was created.
  final DateTime? creationTime;

  /// The workgroup description.
  final String? description;

  /// The state of the workgroup: ENABLED or DISABLED.
  final WorkGroupState? state;

  WorkGroup({
    required this.name,
    this.configuration,
    this.creationTime,
    this.description,
    this.state,
  });

  factory WorkGroup.fromJson(Map<String, dynamic> json) {
    return WorkGroup(
      name: json['Name'] as String,
      configuration: json['Configuration'] != null
          ? WorkGroupConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      state: (json['State'] as String?)?.toWorkGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final configuration = this.configuration;
    final creationTime = this.creationTime;
    final description = this.description;
    final state = this.state;
    return {
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The configuration of the workgroup, which includes the location in Amazon S3
/// where query results are stored, the encryption option, if any, used for
/// query results, whether the Amazon CloudWatch Metrics are enabled for the
/// workgroup and whether workgroup settings override query settings, and the
/// data usage limits for the amount of data scanned per query or per workgroup.
/// The workgroup settings override is specified in
/// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
/// See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
class WorkGroupConfiguration {
  /// The upper data usage limit (cutoff) for the amount of bytes a single query
  /// in a workgroup is allowed to scan.
  final int? bytesScannedCutoffPerQuery;

  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false", client-side settings are used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? enforceWorkGroupConfiguration;

  /// The engine version that all queries running on the workgroup use. Queries on
  /// the <code>AmazonAthenaPreviewFunctionality</code> workgroup run on the
  /// preview engine regardless of this setting.
  final EngineVersion? engineVersion;

  /// Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.
  final bool? publishCloudWatchMetricsEnabled;

  /// If set to <code>true</code>, allows members assigned to a workgroup to
  /// reference Amazon S3 Requester Pays buckets in queries. If set to
  /// <code>false</code>, workgroup members cannot query data from Requester Pays
  /// buckets, and queries that retrieve data from Requester Pays buckets cause an
  /// error. The default is <code>false</code>. For more information about
  /// Requester Pays buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final bool? requesterPaysEnabled;

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
  final ResultConfiguration? resultConfiguration;

  WorkGroupConfiguration({
    this.bytesScannedCutoffPerQuery,
    this.enforceWorkGroupConfiguration,
    this.engineVersion,
    this.publishCloudWatchMetricsEnabled,
    this.requesterPaysEnabled,
    this.resultConfiguration,
  });

  factory WorkGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkGroupConfiguration(
      bytesScannedCutoffPerQuery: json['BytesScannedCutoffPerQuery'] as int?,
      enforceWorkGroupConfiguration:
          json['EnforceWorkGroupConfiguration'] as bool?,
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      publishCloudWatchMetricsEnabled:
          json['PublishCloudWatchMetricsEnabled'] as bool?,
      requesterPaysEnabled: json['RequesterPaysEnabled'] as bool?,
      resultConfiguration: json['ResultConfiguration'] != null
          ? ResultConfiguration.fromJson(
              json['ResultConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScannedCutoffPerQuery = this.bytesScannedCutoffPerQuery;
    final enforceWorkGroupConfiguration = this.enforceWorkGroupConfiguration;
    final engineVersion = this.engineVersion;
    final publishCloudWatchMetricsEnabled =
        this.publishCloudWatchMetricsEnabled;
    final requesterPaysEnabled = this.requesterPaysEnabled;
    final resultConfiguration = this.resultConfiguration;
    return {
      if (bytesScannedCutoffPerQuery != null)
        'BytesScannedCutoffPerQuery': bytesScannedCutoffPerQuery,
      if (enforceWorkGroupConfiguration != null)
        'EnforceWorkGroupConfiguration': enforceWorkGroupConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (publishCloudWatchMetricsEnabled != null)
        'PublishCloudWatchMetricsEnabled': publishCloudWatchMetricsEnabled,
      if (requesterPaysEnabled != null)
        'RequesterPaysEnabled': requesterPaysEnabled,
      if (resultConfiguration != null)
        'ResultConfiguration': resultConfiguration,
    };
  }
}

/// The configuration information that will be updated for this workgroup, which
/// includes the location in Amazon S3 where query results are stored, the
/// encryption option, if any, used for query results, whether the Amazon
/// CloudWatch Metrics are enabled for the workgroup, whether the workgroup
/// settings override the client-side settings, and the data usage limit for the
/// amount of bytes scanned per query, if it is specified.
class WorkGroupConfigurationUpdates {
  /// The upper limit (cutoff) for the amount of bytes a single query in a
  /// workgroup is allowed to scan.
  final int? bytesScannedCutoffPerQuery;

  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false" client-side settings are used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? enforceWorkGroupConfiguration;

  /// The engine version requested when a workgroup is updated. After the update,
  /// all queries on the workgroup run on the requested engine version. If no
  /// value was previously set, the default is Auto. Queries on the
  /// <code>AmazonAthenaPreviewFunctionality</code> workgroup run on the preview
  /// engine regardless of this setting.
  final EngineVersion? engineVersion;

  /// Indicates whether this workgroup enables publishing metrics to Amazon
  /// CloudWatch.
  final bool? publishCloudWatchMetricsEnabled;

  /// Indicates that the data usage control limit per query is removed.
  /// <a>WorkGroupConfiguration$BytesScannedCutoffPerQuery</a>
  final bool? removeBytesScannedCutoffPerQuery;

  /// If set to <code>true</code>, allows members assigned to a workgroup to
  /// specify Amazon S3 Requester Pays buckets in queries. If set to
  /// <code>false</code>, workgroup members cannot query data from Requester Pays
  /// buckets, and queries that retrieve data from Requester Pays buckets cause an
  /// error. The default is <code>false</code>. For more information about
  /// Requester Pays buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final bool? requesterPaysEnabled;

  /// The result configuration information about the queries in this workgroup
  /// that will be updated. Includes the updated results location and an updated
  /// option for encrypting query results.
  final ResultConfigurationUpdates? resultConfigurationUpdates;

  WorkGroupConfigurationUpdates({
    this.bytesScannedCutoffPerQuery,
    this.enforceWorkGroupConfiguration,
    this.engineVersion,
    this.publishCloudWatchMetricsEnabled,
    this.removeBytesScannedCutoffPerQuery,
    this.requesterPaysEnabled,
    this.resultConfigurationUpdates,
  });

  factory WorkGroupConfigurationUpdates.fromJson(Map<String, dynamic> json) {
    return WorkGroupConfigurationUpdates(
      bytesScannedCutoffPerQuery: json['BytesScannedCutoffPerQuery'] as int?,
      enforceWorkGroupConfiguration:
          json['EnforceWorkGroupConfiguration'] as bool?,
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      publishCloudWatchMetricsEnabled:
          json['PublishCloudWatchMetricsEnabled'] as bool?,
      removeBytesScannedCutoffPerQuery:
          json['RemoveBytesScannedCutoffPerQuery'] as bool?,
      requesterPaysEnabled: json['RequesterPaysEnabled'] as bool?,
      resultConfigurationUpdates: json['ResultConfigurationUpdates'] != null
          ? ResultConfigurationUpdates.fromJson(
              json['ResultConfigurationUpdates'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScannedCutoffPerQuery = this.bytesScannedCutoffPerQuery;
    final enforceWorkGroupConfiguration = this.enforceWorkGroupConfiguration;
    final engineVersion = this.engineVersion;
    final publishCloudWatchMetricsEnabled =
        this.publishCloudWatchMetricsEnabled;
    final removeBytesScannedCutoffPerQuery =
        this.removeBytesScannedCutoffPerQuery;
    final requesterPaysEnabled = this.requesterPaysEnabled;
    final resultConfigurationUpdates = this.resultConfigurationUpdates;
    return {
      if (bytesScannedCutoffPerQuery != null)
        'BytesScannedCutoffPerQuery': bytesScannedCutoffPerQuery,
      if (enforceWorkGroupConfiguration != null)
        'EnforceWorkGroupConfiguration': enforceWorkGroupConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (publishCloudWatchMetricsEnabled != null)
        'PublishCloudWatchMetricsEnabled': publishCloudWatchMetricsEnabled,
      if (removeBytesScannedCutoffPerQuery != null)
        'RemoveBytesScannedCutoffPerQuery': removeBytesScannedCutoffPerQuery,
      if (requesterPaysEnabled != null)
        'RequesterPaysEnabled': requesterPaysEnabled,
      if (resultConfigurationUpdates != null)
        'ResultConfigurationUpdates': resultConfigurationUpdates,
    };
  }
}

enum WorkGroupState {
  enabled,
  disabled,
}

extension on WorkGroupState {
  String toValue() {
    switch (this) {
      case WorkGroupState.enabled:
        return 'ENABLED';
      case WorkGroupState.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  WorkGroupState toWorkGroupState() {
    switch (this) {
      case 'ENABLED':
        return WorkGroupState.enabled;
      case 'DISABLED':
        return WorkGroupState.disabled;
    }
    throw Exception('$this is not known in enum WorkGroupState');
  }
}

/// The summary information for the workgroup, which includes its name, state,
/// description, and the date and time it was created.
class WorkGroupSummary {
  /// The workgroup creation date and time.
  final DateTime? creationTime;

  /// The workgroup description.
  final String? description;

  /// The engine version setting for all queries on the workgroup. Queries on the
  /// <code>AmazonAthenaPreviewFunctionality</code> workgroup run on the preview
  /// engine regardless of this setting.
  final EngineVersion? engineVersion;

  /// The name of the workgroup.
  final String? name;

  /// The state of the workgroup.
  final WorkGroupState? state;

  WorkGroupSummary({
    this.creationTime,
    this.description,
    this.engineVersion,
    this.name,
    this.state,
  });

  factory WorkGroupSummary.fromJson(Map<String, dynamic> json) {
    return WorkGroupSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toWorkGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final engineVersion = this.engineVersion;
    final name = this.name;
    final state = this.state;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class MetadataException extends _s.GenericAwsException {
  MetadataException({String? type, String? message})
      : super(type: type, code: 'MetadataException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'MetadataException': (type, message) =>
      MetadataException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
