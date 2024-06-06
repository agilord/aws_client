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
class Athena {
  final _s.JsonProtocol _protocol;
  Athena({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'athena',
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

  /// Returns the details of a single prepared statement or a list of up to 256
  /// prepared statements for the array of prepared statement names that you
  /// provide. Requires you to have access to the workgroup to which the
  /// prepared statements belong. If a prepared statement cannot be retrieved
  /// for the name specified, the statement is listed in
  /// <code>UnprocessedPreparedStatementNames</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [preparedStatementNames] :
  /// A list of prepared statement names to return.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup to which the prepared statements belong.
  Future<BatchGetPreparedStatementOutput> batchGetPreparedStatement({
    required List<String> preparedStatementNames,
    required String workGroup,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.BatchGetPreparedStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PreparedStatementNames': preparedStatementNames,
        'WorkGroup': workGroup,
      },
    );

    return BatchGetPreparedStatementOutput.fromJson(jsonResponse.body);
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

  /// Cancels the capacity reservation with the specified name. Cancelled
  /// reservations remain in your account and will be deleted 45 days after
  /// cancellation. During the 45 days, you cannot re-purpose or reuse a
  /// reservation that has been cancelled, but you can refer to its tags and
  /// view it for historical reference.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the capacity reservation to cancel.
  Future<void> cancelCapacityReservation({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CancelCapacityReservation'
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

  /// Creates a capacity reservation with the specified name and number of
  /// requested data processing units.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the capacity reservation to create.
  ///
  /// Parameter [targetDpus] :
  /// The number of requested data processing units.
  ///
  /// Parameter [tags] :
  /// The tags for the capacity reservation.
  Future<void> createCapacityReservation({
    required String name,
    required int targetDpus,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'targetDpus',
      targetDpus,
      24,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateCapacityReservation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'TargetDpus': targetDpus,
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Creates (registers) a data catalog with the specified name and properties.
  /// Catalogs created are visible to all users of the same Amazon Web Services
  /// account.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to create. The catalog name must be unique
  /// for the Amazon Web Services account and can use a maximum of 127
  /// alphanumeric, underscore, at sign, or hyphen characters. The remainder of
  /// the length constraint of 256 is reserved for use by Athena.
  ///
  /// Parameter [type] :
  /// The type of data catalog to create: <code>LAMBDA</code> for a federated
  /// catalog, <code>HIVE</code> for an external hive metastore, or
  /// <code>GLUE</code> for an Glue Data Catalog.
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
  /// <li>
  /// The <code>GLUE</code> type takes a catalog ID parameter and is required.
  /// The <code> <i>catalog_id</i> </code> is the account ID of the Amazon Web
  /// Services account to which the Glue Data Catalog belongs.
  ///
  /// <code>catalog-id=<i>catalog_id</i> </code>
  ///
  /// <ul>
  /// <li>
  /// The <code>GLUE</code> data catalog type also applies to the default
  /// <code>AwsDataCatalog</code> that already exists in your account, of which
  /// you can have only one and cannot modify.
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
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// users. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
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

  /// Creates an empty <code>ipynb</code> file in the specified Apache Spark
  /// enabled workgroup. Throws an error if a file in the workgroup with the
  /// same name already exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the <code>ipynb</code> file to be created in the Spark
  /// workgroup, without the <code>.ipynb</code> extension.
  ///
  /// Parameter [workGroup] :
  /// The name of the Spark enabled workgroup in which the notebook will be
  /// created.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// notebook is idempotent (executes only once).
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// you. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  Future<CreateNotebookOutput> createNotebook({
    required String name,
    required String workGroup,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreateNotebook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'WorkGroup': workGroup,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
      },
    );

    return CreateNotebookOutput.fromJson(jsonResponse.body);
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

  /// Gets an authentication token and the URL at which the notebook can be
  /// accessed. During programmatic access,
  /// <code>CreatePresignedNotebookUrl</code> must be called every 10 minutes to
  /// refresh the authentication token. For information about granting
  /// programmatic access, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/setting-up.html#setting-up-grant-programmatic-access">Grant
  /// programmatic access</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<CreatePresignedNotebookUrlResponse> createPresignedNotebookUrl({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.CreatePresignedNotebookUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return CreatePresignedNotebookUrlResponse.fromJson(jsonResponse.body);
  }

  /// Creates a workgroup with the specified name. A workgroup can be an Apache
  /// Spark enabled workgroup or an Athena SQL workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The workgroup name.
  ///
  /// Parameter [configuration] :
  /// Contains configuration information for creating an Athena SQL workgroup or
  /// Spark enabled Athena workgroup. Athena SQL workgroup configuration
  /// includes the location in Amazon S3 where query and calculation results are
  /// stored, the encryption configuration, if any, used for encrypting query
  /// results, whether the Amazon CloudWatch Metrics are enabled for the
  /// workgroup, the limit for the amount of bytes scanned (cutoff) per query,
  /// if it is specified, and whether workgroup's settings (specified with
  /// <code>EnforceWorkGroupConfiguration</code>) in the
  /// <code>WorkGroupConfiguration</code> override client-side settings. See
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

  /// Deletes a cancelled capacity reservation. A reservation must be cancelled
  /// before it can be deleted. A deleted reservation is immediately removed
  /// from your account and can no longer be referenced, including by its ARN. A
  /// deleted reservation cannot be called by
  /// <code>GetCapacityReservation</code>, and deleted reservations do not
  /// appear in the output of <code>ListCapacityReservations</code>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the capacity reservation to delete.
  Future<void> deleteCapacityReservation({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteCapacityReservation'
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

  /// Deletes the specified notebook.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook to delete.
  Future<void> deleteNotebook({
    required String notebookId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.DeleteNotebook'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookId': notebookId,
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
  /// contains any named queries, query executions, or notebooks.
  Future<void> deleteWorkGroup({
    required String workGroup,
    bool? recursiveDeleteOption,
  }) async {
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

  /// Exports the specified notebook and its metadata.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook to export.
  Future<ExportNotebookOutput> exportNotebook({
    required String notebookId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ExportNotebook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookId': notebookId,
      },
    );

    return ExportNotebookOutput.fromJson(jsonResponse.body);
  }

  /// Describes a previously submitted calculation execution.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [calculationExecutionId] :
  /// The calculation execution UUID.
  Future<GetCalculationExecutionResponse> getCalculationExecution({
    required String calculationExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetCalculationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CalculationExecutionId': calculationExecutionId,
      },
    );

    return GetCalculationExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the unencrypted code that was executed for the calculation.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [calculationExecutionId] :
  /// The calculation execution UUID.
  Future<GetCalculationExecutionCodeResponse> getCalculationExecutionCode({
    required String calculationExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetCalculationExecutionCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CalculationExecutionId': calculationExecutionId,
      },
    );

    return GetCalculationExecutionCodeResponse.fromJson(jsonResponse.body);
  }

  /// Gets the status of a current calculation.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [calculationExecutionId] :
  /// The calculation execution UUID.
  Future<GetCalculationExecutionStatusResponse> getCalculationExecutionStatus({
    required String calculationExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetCalculationExecutionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CalculationExecutionId': calculationExecutionId,
      },
    );

    return GetCalculationExecutionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Gets the capacity assignment configuration for a capacity reservation, if
  /// one exists.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [capacityReservationName] :
  /// The name of the capacity reservation to retrieve the capacity assignment
  /// configuration for.
  Future<GetCapacityAssignmentConfigurationOutput>
      getCapacityAssignmentConfiguration({
    required String capacityReservationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetCapacityAssignmentConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CapacityReservationName': capacityReservationName,
      },
    );

    return GetCapacityAssignmentConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the capacity reservation with the specified
  /// name.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the capacity reservation.
  Future<GetCapacityReservationOutput> getCapacityReservation({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetCapacityReservation'
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

    return GetCapacityReservationOutput.fromJson(jsonResponse.body);
  }

  /// Returns the specified data catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the data catalog to return.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup. Required if making an IAM Identity Center
  /// request.
  Future<GetDataCatalogOutput> getDataCatalog({
    required String name,
    String? workGroup,
  }) async {
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
        if (workGroup != null) 'WorkGroup': workGroup,
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
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup for which the metadata is being fetched.
  /// Required if requesting an IAM Identity Center enabled Glue Data Catalog.
  Future<GetDatabaseOutput> getDatabase({
    required String catalogName,
    required String databaseName,
    String? workGroup,
  }) async {
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
        if (workGroup != null) 'WorkGroup': workGroup,
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

  /// Retrieves notebook metadata for the specified notebook ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook whose metadata is to be retrieved.
  Future<GetNotebookMetadataOutput> getNotebookMetadata({
    required String notebookId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetNotebookMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookId': notebookId,
      },
    );

    return GetNotebookMetadataOutput.fromJson(jsonResponse.body);
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
  /// href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Working
  /// with query results, recent queries, and output files</a> in the <i>Amazon
  /// Athena User Guide</i>. This request does not execute the query but returns
  /// results. Use <a>StartQueryExecution</a> to run a query.
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
  /// May throw [TooManyRequestsException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
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

  /// Returns query execution runtime statistics related to a single execution
  /// of a query if you have access to the workgroup in which the query ran.
  /// Statistics from the <code>Timeline</code> section of the response object
  /// are available as soon as <a>QueryExecutionStatus$State</a> is in a
  /// SUCCEEDED or FAILED state. The remaining non-timeline statistics in the
  /// response (like stage-level input and output row count and data size) are
  /// updated asynchronously and may not be available immediately after a query
  /// completes. The non-timeline statistics are also not included when a query
  /// has row-level filters defined in Lake Formation.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [queryExecutionId] :
  /// The unique ID of the query execution.
  Future<GetQueryRuntimeStatisticsOutput> getQueryRuntimeStatistics({
    required String queryExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetQueryRuntimeStatistics'
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

    return GetQueryRuntimeStatisticsOutput.fromJson(jsonResponse.body);
  }

  /// Gets the full details of a previously created session, including the
  /// session status and configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<GetSessionResponse> getSession({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return GetSessionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the current status of a session.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<GetSessionStatusResponse> getSessionStatus({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.GetSessionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return GetSessionStatusResponse.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup for which the metadata is being fetched.
  /// Required if requesting an IAM Identity Center enabled Glue Data Catalog.
  Future<GetTableMetadataOutput> getTableMetadata({
    required String catalogName,
    required String databaseName,
    required String tableName,
    String? workGroup,
  }) async {
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
        if (workGroup != null) 'WorkGroup': workGroup,
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

  /// Imports a single <code>ipynb</code> file to a Spark enabled workgroup. To
  /// import the notebook, the request must specify a value for either
  /// <code>Payload</code> or <code>NoteBookS3LocationUri</code>. If neither is
  /// specified or both are specified, an <code>InvalidRequestException</code>
  /// occurs. The maximum file size that can be imported is 10 megabytes. If an
  /// <code>ipynb</code> file with the same name already exists in the
  /// workgroup, throws an error.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the notebook to import.
  ///
  /// Parameter [type] :
  /// The notebook content type. Currently, the only valid type is
  /// <code>IPYNB</code>.
  ///
  /// Parameter [workGroup] :
  /// The name of the Spark enabled workgroup to import the notebook to.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to import the
  /// notebook is idempotent (executes only once).
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// you. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  ///
  /// Parameter [notebookS3LocationUri] :
  /// A URI that specifies the Amazon S3 location of a notebook file in
  /// <code>ipynb</code> format.
  ///
  /// Parameter [payload] :
  /// The notebook content to be imported. The payload must be in
  /// <code>ipynb</code> format.
  Future<ImportNotebookOutput> importNotebook({
    required String name,
    required NotebookType type,
    required String workGroup,
    String? clientRequestToken,
    String? notebookS3LocationUri,
    String? payload,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ImportNotebook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Type': type.toValue(),
        'WorkGroup': workGroup,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (notebookS3LocationUri != null)
          'NotebookS3LocationUri': notebookS3LocationUri,
        if (payload != null) 'Payload': payload,
      },
    );

    return ImportNotebookOutput.fromJson(jsonResponse.body);
  }

  /// Returns the supported DPU sizes for the supported application runtimes
  /// (for example, <code>Athena notebook version 1</code>).
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated.
  Future<ListApplicationDPUSizesOutput> listApplicationDPUSizes({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListApplicationDPUSizes'
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

    return ListApplicationDPUSizesOutput.fromJson(jsonResponse.body);
  }

  /// Lists the calculations that have been submitted to a session in descending
  /// order. Newer calculations are listed first; older calculations are listed
  /// later.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of calculation executions to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  ///
  /// Parameter [stateFilter] :
  /// A filter for a specific calculation execution state. A description of each
  /// state follows.
  ///
  /// <code>CREATING</code> - The calculation is in the process of being
  /// created.
  ///
  /// <code>CREATED</code> - The calculation has been created and is ready to
  /// run.
  ///
  /// <code>QUEUED</code> - The calculation has been queued for processing.
  ///
  /// <code>RUNNING</code> - The calculation is running.
  ///
  /// <code>CANCELING</code> - A request to cancel the calculation has been
  /// received and the system is working to stop it.
  ///
  /// <code>CANCELED</code> - The calculation is no longer running as the result
  /// of a cancel request.
  ///
  /// <code>COMPLETED</code> - The calculation has completed without error.
  ///
  /// <code>FAILED</code> - The calculation failed and is no longer running.
  Future<ListCalculationExecutionsResponse> listCalculationExecutions({
    required String sessionId,
    int? maxResults,
    String? nextToken,
    CalculationExecutionState? stateFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListCalculationExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (stateFilter != null) 'StateFilter': stateFilter.toValue(),
      },
    );

    return ListCalculationExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the capacity reservations for the current account.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated.
  Future<ListCapacityReservationsOutput> listCapacityReservations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListCapacityReservations'
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

    return ListCapacityReservationsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the data catalogs in the current Amazon Web Services account.
  /// <note>
  /// In the Athena console, data catalogs are listed as "data sources" on the
  /// <b>Data sources</b> page under the <b>Data source name</b> column.
  /// </note>
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
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup. Required if making an IAM Identity Center
  /// request.
  Future<ListDataCatalogsOutput> listDataCatalogs({
    int? maxResults,
    String? nextToken,
    String? workGroup,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      2,
      50,
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
        if (workGroup != null) 'WorkGroup': workGroup,
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
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup for which the metadata is being fetched.
  /// Required if requesting an IAM Identity Center enabled Glue Data Catalog.
  Future<ListDatabasesOutput> listDatabases({
    required String catalogName,
    int? maxResults,
    String? nextToken,
    String? workGroup,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
        if (workGroup != null) 'WorkGroup': workGroup,
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

  /// Lists, in descending order, the executors that joined a session. Newer
  /// executors are listed first; older executors are listed later. The result
  /// can be optionally filtered by state.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  ///
  /// Parameter [executorStateFilter] :
  /// A filter for a specific executor state. A description of each state
  /// follows.
  ///
  /// <code>CREATING</code> - The executor is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The executor has been started.
  ///
  /// <code>REGISTERED</code> - The executor has been registered.
  ///
  /// <code>TERMINATING</code> - The executor is in the process of shutting
  /// down.
  ///
  /// <code>TERMINATED</code> - The executor is no longer running.
  ///
  /// <code>FAILED</code> - Due to a failure, the executor is no longer running.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of executors to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListExecutorsResponse> listExecutors({
    required String sessionId,
    ExecutorState? executorStateFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListExecutors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
        if (executorStateFilter != null)
          'ExecutorStateFilter': executorStateFilter.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExecutorsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of available query IDs only for queries saved in the
  /// specified workgroup. Requires that you have access to the specified
  /// workgroup. If a workgroup is not specified, lists the saved queries for
  /// the primary workgroup.
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

  /// Displays the notebook files for the specified workgroup in paginated
  /// format.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [workGroup] :
  /// The name of the Spark enabled workgroup to retrieve notebook metadata for.
  ///
  /// Parameter [filters] :
  /// Search filter string.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated.
  Future<ListNotebookMetadataOutput> listNotebookMetadata({
    required String workGroup,
    FilterDefinition? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListNotebookMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkGroup': workGroup,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListNotebookMetadataOutput.fromJson(jsonResponse.body);
  }

  /// Lists, in descending order, the sessions that have been created in a
  /// notebook that are in an active state like <code>CREATING</code>,
  /// <code>CREATED</code>, <code>IDLE</code> or <code>BUSY</code>. Newer
  /// sessions are listed first; older sessions are listed later.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook to list sessions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of notebook sessions to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  Future<ListNotebookSessionsResponse> listNotebookSessions({
    required String notebookId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListNotebookSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookId': notebookId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListNotebookSessionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the prepared statements in the specified workgroup.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
  /// specified workgroup. Athena keeps a query history for 45 days. If a
  /// workgroup is not specified, returns a list of query execution IDs for the
  /// primary workgroup. Requires you to have access to the workgroup in which
  /// the queries ran.
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

  /// Lists the sessions in a workgroup that are in an active state like
  /// <code>CREATING</code>, <code>CREATED</code>, <code>IDLE</code>, or
  /// <code>BUSY</code>. Newer sessions are listed first; older sessions are
  /// listed later.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [workGroup] :
  /// The workgroup to which the session belongs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of sessions to return.
  ///
  /// Parameter [nextToken] :
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  ///
  /// Parameter [stateFilter] :
  /// A filter for a specific session state. A description of each state
  /// follows.
  ///
  /// <code>CREATING</code> - The session is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The session has been started.
  ///
  /// <code>IDLE</code> - The session is able to accept a calculation.
  ///
  /// <code>BUSY</code> - The session is processing another task and is unable
  /// to accept a calculation.
  ///
  /// <code>TERMINATING</code> - The session is in the process of shutting down.
  ///
  /// <code>TERMINATED</code> - The session and its resources are no longer
  /// running.
  ///
  /// <code>DEGRADED</code> - The session has no healthy coordinators.
  ///
  /// <code>FAILED</code> - Due to a failure, the session and its resources are
  /// no longer running.
  Future<ListSessionsResponse> listSessions({
    required String workGroup,
    int? maxResults,
    String? nextToken,
    SessionState? stateFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.ListSessions'
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
        if (stateFilter != null) 'StateFilter': stateFilter.toValue(),
      },
    );

    return ListSessionsResponse.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup for which the metadata is being fetched.
  /// Required if requesting an IAM Identity Center enabled Glue Data Catalog.
  Future<ListTableMetadataOutput> listTableMetadata({
    required String catalogName,
    required String databaseName,
    String? expression,
    int? maxResults,
    String? nextToken,
    String? workGroup,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
        if (workGroup != null) 'WorkGroup': workGroup,
      },
    );

    return ListTableMetadataOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags associated with an Athena resource.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      75,
      1152921504606846976,
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

  /// Puts a new capacity assignment configuration for a specified capacity
  /// reservation. If a capacity assignment configuration already exists for the
  /// capacity reservation, replaces the existing capacity assignment
  /// configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [capacityAssignments] :
  /// The list of assignments for the capacity assignment configuration.
  ///
  /// Parameter [capacityReservationName] :
  /// The name of the capacity reservation to put a capacity assignment
  /// configuration for.
  Future<void> putCapacityAssignmentConfiguration({
    required List<CapacityAssignment> capacityAssignments,
    required String capacityReservationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.PutCapacityAssignmentConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CapacityAssignments': capacityAssignments,
        'CapacityReservationName': capacityReservationName,
      },
    );
  }

  /// Submits calculations for execution within a session. You can supply the
  /// code to run as an inline code block within the request.
  /// <note>
  /// The request syntax requires the
  /// <a>StartCalculationExecutionRequest$CodeBlock</a> parameter or the
  /// <a>CalculationConfiguration$CodeBlock</a> parameter, but not both. Because
  /// <a>CalculationConfiguration$CodeBlock</a> is deprecated, use the
  /// <a>StartCalculationExecutionRequest$CodeBlock</a> parameter instead.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  ///
  /// Parameter [calculationConfiguration] :
  /// Contains configuration information for the calculation.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// calculation is idempotent (executes only once). If another
  /// <code>StartCalculationExecutionRequest</code> is received, the same
  /// response is returned and another calculation is not created. If a
  /// parameter has changed, an error is returned.
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// users. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  ///
  /// Parameter [codeBlock] :
  /// A string that contains the code of the calculation. Use this parameter
  /// instead of <a>CalculationConfiguration$CodeBlock</a>, which is deprecated.
  ///
  /// Parameter [description] :
  /// A description of the calculation.
  Future<StartCalculationExecutionResponse> startCalculationExecution({
    required String sessionId,
    CalculationConfiguration? calculationConfiguration,
    String? clientRequestToken,
    String? codeBlock,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StartCalculationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
        if (calculationConfiguration != null)
          'CalculationConfiguration': calculationConfiguration,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (codeBlock != null) 'CodeBlock': codeBlock,
        if (description != null) 'Description': description,
      },
    );

    return StartCalculationExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Runs the SQL query statements contained in the <code>Query</code>.
  /// Requires you to have access to the workgroup in which the query ran.
  /// Running queries against an external catalog requires <a>GetDataCatalog</a>
  /// permission to the catalog. For code samples using the Amazon Web Services
  /// SDK for Java, see <a
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
  /// returned and another query is not created. An error is returned if a
  /// parameter, such as <code>QueryString</code>, has changed. A call to
  /// <code>StartQueryExecution</code> that uses a previous client request token
  /// returns the same <code>QueryExecutionId</code> even if the requester
  /// doesn't have permission on the tables specified in
  /// <code>QueryString</code>.
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// users. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  ///
  /// Parameter [executionParameters] :
  /// A list of values for the parameters in a query. The values are applied
  /// sequentially to the parameters in the query in the order in which the
  /// parameters occur.
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
  /// Parameter [resultReuseConfiguration] :
  /// Specifies the query result reuse behavior for the query.
  ///
  /// Parameter [workGroup] :
  /// The name of the workgroup in which the query is being started.
  Future<StartQueryExecutionOutput> startQueryExecution({
    required String queryString,
    String? clientRequestToken,
    List<String>? executionParameters,
    QueryExecutionContext? queryExecutionContext,
    ResultConfiguration? resultConfiguration,
    ResultReuseConfiguration? resultReuseConfiguration,
    String? workGroup,
  }) async {
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
        if (executionParameters != null)
          'ExecutionParameters': executionParameters,
        if (queryExecutionContext != null)
          'QueryExecutionContext': queryExecutionContext,
        if (resultConfiguration != null)
          'ResultConfiguration': resultConfiguration,
        if (resultReuseConfiguration != null)
          'ResultReuseConfiguration': resultReuseConfiguration,
        if (workGroup != null) 'WorkGroup': workGroup,
      },
    );

    return StartQueryExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a session for running calculations within a workgroup. The session
  /// is ready when it reaches an <code>IDLE</code> state.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [SessionAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [engineConfiguration] :
  /// Contains engine data processing unit (DPU) configuration settings and
  /// parameter mappings.
  ///
  /// Parameter [workGroup] :
  /// The workgroup to which the session belongs.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// session is idempotent (executes only once). If another
  /// <code>StartSessionRequest</code> is received, the same response is
  /// returned and another session is not created. If a parameter has changed,
  /// an error is returned.
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// users. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  ///
  /// Parameter [description] :
  /// The session description.
  ///
  /// Parameter [notebookVersion] :
  /// The notebook version. This value is supplied automatically for notebook
  /// sessions in the Athena console and is not required for programmatic
  /// session access. The only valid notebook version is <code>Athena notebook
  /// version 1</code>. If you specify a value for <code>NotebookVersion</code>,
  /// you must also specify a value for <code>NotebookId</code>. See
  /// <a>EngineConfiguration$AdditionalConfigs</a>.
  ///
  /// Parameter [sessionIdleTimeoutInMinutes] :
  /// The idle timeout in minutes for the session.
  Future<StartSessionResponse> startSession({
    required EngineConfiguration engineConfiguration,
    required String workGroup,
    String? clientRequestToken,
    String? description,
    String? notebookVersion,
    int? sessionIdleTimeoutInMinutes,
  }) async {
    _s.validateNumRange(
      'sessionIdleTimeoutInMinutes',
      sessionIdleTimeoutInMinutes,
      1,
      480,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StartSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngineConfiguration': engineConfiguration,
        'WorkGroup': workGroup,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (description != null) 'Description': description,
        if (notebookVersion != null) 'NotebookVersion': notebookVersion,
        if (sessionIdleTimeoutInMinutes != null)
          'SessionIdleTimeoutInMinutes': sessionIdleTimeoutInMinutes,
      },
    );

    return StartSessionResponse.fromJson(jsonResponse.body);
  }

  /// Requests the cancellation of a calculation. A
  /// <code>StopCalculationExecution</code> call on a calculation that is
  /// already in a terminal state (for example, <code>STOPPED</code>,
  /// <code>FAILED</code>, or <code>COMPLETED</code>) succeeds but has no
  /// effect.
  /// <note>
  /// Cancelling a calculation is done on a best effort basis. If a calculation
  /// cannot be cancelled, you can be charged for its completion. If you are
  /// concerned about being charged for a calculation that cannot be cancelled,
  /// consider terminating the session in which the calculation is running.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [calculationExecutionId] :
  /// The calculation execution UUID.
  Future<StopCalculationExecutionResponse> stopCalculationExecution({
    required String calculationExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.StopCalculationExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CalculationExecutionId': calculationExecutionId,
      },
    );

    return StopCalculationExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Stops a query execution. Requires you to have access to the workgroup in
  /// which the query ran.
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
  /// assign to a resource. Each tag consists of a key and an optional value,
  /// both of which you define. For example, you can use tags to categorize
  /// Athena workgroups, data catalogs, or capacity reservations by purpose,
  /// owner, or environment. Use a consistent set of tag keys to make it easier
  /// to search and filter the resources in your account. For best practices,
  /// see <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
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
  /// Specifies the ARN of the Athena resource to which tags are to be added.
  ///
  /// Parameter [tags] :
  /// A collection of one or more tags, separated by commas, to be added to an
  /// Athena resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
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

  /// Terminates an active session. A <code>TerminateSession</code> call on a
  /// session that is already inactive (for example, in a <code>FAILED</code>,
  /// <code>TERMINATED</code> or <code>TERMINATING</code> state) succeeds but
  /// has no effect. Calculations running in the session when
  /// <code>TerminateSession</code> is called are forcefully stopped, but may
  /// display as <code>FAILED</code> instead of <code>STOPPED</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<TerminateSessionResponse> terminateSession({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.TerminateSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return TerminateSessionResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from an Athena resource.
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

  /// Updates the number of requested data processing units for the capacity
  /// reservation with the specified name.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the capacity reservation.
  ///
  /// Parameter [targetDpus] :
  /// The new number of requested data processing units.
  Future<void> updateCapacityReservation({
    required String name,
    required int targetDpus,
  }) async {
    _s.validateNumRange(
      'targetDpus',
      targetDpus,
      24,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateCapacityReservation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'TargetDpus': targetDpus,
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
  /// for the Amazon Web Services account and can use a maximum of 127
  /// alphanumeric, underscore, at sign, or hyphen characters. The remainder of
  /// the length constraint of 256 is reserved for use by Athena.
  ///
  /// Parameter [type] :
  /// Specifies the type of data catalog to update. Specify <code>LAMBDA</code>
  /// for a federated catalog, <code>HIVE</code> for an external hive metastore,
  /// or <code>GLUE</code> for an Glue Data Catalog.
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

  /// Updates a <a>NamedQuery</a> object. The database or workgroup cannot be
  /// updated.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the query.
  ///
  /// Parameter [namedQueryId] :
  /// The unique identifier (UUID) of the query.
  ///
  /// Parameter [queryString] :
  /// The contents of the query with all query statements.
  ///
  /// Parameter [description] :
  /// The query description.
  Future<void> updateNamedQuery({
    required String name,
    required String namedQueryId,
    required String queryString,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateNamedQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'NamedQueryId': namedQueryId,
        'QueryString': queryString,
        if (description != null) 'Description': description,
      },
    );
  }

  /// Updates the contents of a Spark notebook.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook to update.
  ///
  /// Parameter [payload] :
  /// The updated content for the notebook.
  ///
  /// Parameter [type] :
  /// The notebook content type. Currently, the only valid type is
  /// <code>IPYNB</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// notebook is idempotent (executes only once).
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// you. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  ///
  /// Parameter [sessionId] :
  /// The active notebook session ID. Required if the notebook has an active
  /// session.
  Future<void> updateNotebook({
    required String notebookId,
    required String payload,
    required NotebookType type,
    String? clientRequestToken,
    String? sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateNotebook'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookId': notebookId,
        'Payload': payload,
        'Type': type.toValue(),
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (sessionId != null) 'SessionId': sessionId,
      },
    );
  }

  /// Updates the metadata for a notebook.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name to update the notebook to.
  ///
  /// Parameter [notebookId] :
  /// The ID of the notebook to update the metadata for.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique case-sensitive string used to ensure the request to create the
  /// notebook is idempotent (executes only once).
  /// <important>
  /// This token is listed as not required because Amazon Web Services SDKs (for
  /// example the Amazon Web Services SDK for Java) auto-generate the token for
  /// you. If you are not using the Amazon Web Services SDK or the Amazon Web
  /// Services CLI, you must provide this token or the action will fail.
  /// </important>
  Future<void> updateNotebookMetadata({
    required String name,
    required String notebookId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonAthena.UpdateNotebookMetadata'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'NotebookId': notebookId,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
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
  /// be changed. Only <code>ConfigurationUpdates</code> can be specified.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [workGroup] :
  /// The specified workgroup that will be updated.
  ///
  /// Parameter [configurationUpdates] :
  /// Contains configuration updates for an Athena SQL workgroup.
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

/// Indicates that an Amazon S3 canned ACL should be set to control ownership of
/// stored query results. When Athena stores query results in Amazon S3, the
/// canned ACL is set with the <code>x-amz-acl</code> request header. For more
/// information about S3 Object Ownership, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html#object-ownership-overview">Object
/// Ownership settings</a> in the <i>Amazon S3 User Guide</i>.
class AclConfiguration {
  /// The Amazon S3 canned ACL that Athena should specify when storing query
  /// results. Currently the only supported canned ACL is
  /// <code>BUCKET_OWNER_FULL_CONTROL</code>. If a query runs in a workgroup and
  /// the workgroup overrides client-side settings, then the Amazon S3 canned ACL
  /// specified in the workgroup's settings is used for all queries that run in
  /// the workgroup. For more information about Amazon S3 canned ACLs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl">Canned
  /// ACL</a> in the <i>Amazon S3 User Guide</i>.
  final S3AclOption s3AclOption;

  AclConfiguration({
    required this.s3AclOption,
  });

  factory AclConfiguration.fromJson(Map<String, dynamic> json) {
    return AclConfiguration(
      s3AclOption: (json['S3AclOption'] as String).toS3AclOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3AclOption = this.s3AclOption;
    return {
      'S3AclOption': s3AclOption.toValue(),
    };
  }
}

/// Contains the application runtime IDs and their supported DPU sizes.
class ApplicationDPUSizes {
  /// The name of the supported application runtime (for example, <code>Athena
  /// notebook version 1</code>).
  final String? applicationRuntimeId;

  /// A list of the supported DPU sizes that the application runtime supports.
  final List<int>? supportedDPUSizes;

  ApplicationDPUSizes({
    this.applicationRuntimeId,
    this.supportedDPUSizes,
  });

  factory ApplicationDPUSizes.fromJson(Map<String, dynamic> json) {
    return ApplicationDPUSizes(
      applicationRuntimeId: json['ApplicationRuntimeId'] as String?,
      supportedDPUSizes: (json['SupportedDPUSizes'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationRuntimeId = this.applicationRuntimeId;
    final supportedDPUSizes = this.supportedDPUSizes;
    return {
      if (applicationRuntimeId != null)
        'ApplicationRuntimeId': applicationRuntimeId,
      if (supportedDPUSizes != null) 'SupportedDPUSizes': supportedDPUSizes,
    };
  }
}

/// Provides information about an Athena query error. The
/// <code>AthenaError</code> feature provides standardized error information to
/// help you understand failed queries and take steps after a query failure
/// occurs. <code>AthenaError</code> includes an <code>ErrorCategory</code>
/// field that specifies whether the cause of the failed query is due to system
/// error, user error, or other error.
class AthenaError {
  /// An integer value that specifies the category of a query failure error. The
  /// following list shows the category for each integer value.
  ///
  /// <b>1</b> - System
  ///
  /// <b>2</b> - User
  ///
  /// <b>3</b> - Other
  final int? errorCategory;

  /// Contains a short description of the error that occurred.
  final String? errorMessage;

  /// An integer value that provides specific information about an Athena query
  /// error. For the meaning of specific values, see the <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/error-reference.html#error-reference-error-type-reference">Error
  /// Type Reference</a> in the <i>Amazon Athena User Guide</i>.
  final int? errorType;

  /// True if the query might succeed if resubmitted.
  final bool? retryable;

  AthenaError({
    this.errorCategory,
    this.errorMessage,
    this.errorType,
    this.retryable,
  });

  factory AthenaError.fromJson(Map<String, dynamic> json) {
    return AthenaError(
      errorCategory: json['ErrorCategory'] as int?,
      errorMessage: json['ErrorMessage'] as String?,
      errorType: json['ErrorType'] as int?,
      retryable: json['Retryable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCategory = this.errorCategory;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final retryable = this.retryable;
    return {
      if (errorCategory != null) 'ErrorCategory': errorCategory,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
      if (retryable != null) 'Retryable': retryable,
    };
  }
}

enum AuthenticationType {
  directoryIdentity,
}

extension AuthenticationTypeValueExtension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.directoryIdentity:
        return 'DIRECTORY_IDENTITY';
    }
  }
}

extension AuthenticationTypeFromString on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'DIRECTORY_IDENTITY':
        return AuthenticationType.directoryIdentity;
    }
    throw Exception('$this is not known in enum AuthenticationType');
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

class BatchGetPreparedStatementOutput {
  /// The list of prepared statements returned.
  final List<PreparedStatement>? preparedStatements;

  /// A list of one or more prepared statements that were requested but could not
  /// be returned.
  final List<UnprocessedPreparedStatementName>?
      unprocessedPreparedStatementNames;

  BatchGetPreparedStatementOutput({
    this.preparedStatements,
    this.unprocessedPreparedStatementNames,
  });

  factory BatchGetPreparedStatementOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetPreparedStatementOutput(
      preparedStatements: (json['PreparedStatements'] as List?)
          ?.whereNotNull()
          .map((e) => PreparedStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedPreparedStatementNames:
          (json['UnprocessedPreparedStatementNames'] as List?)
              ?.whereNotNull()
              .map((e) => UnprocessedPreparedStatementName.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final preparedStatements = this.preparedStatements;
    final unprocessedPreparedStatementNames =
        this.unprocessedPreparedStatementNames;
    return {
      if (preparedStatements != null) 'PreparedStatements': preparedStatements,
      if (unprocessedPreparedStatementNames != null)
        'UnprocessedPreparedStatementNames': unprocessedPreparedStatementNames,
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

/// Contains configuration information for the calculation.
class CalculationConfiguration {
  /// A string that contains the code for the calculation.
  final String? codeBlock;

  CalculationConfiguration({
    this.codeBlock,
  });

  Map<String, dynamic> toJson() {
    final codeBlock = this.codeBlock;
    return {
      if (codeBlock != null) 'CodeBlock': codeBlock,
    };
  }
}

enum CalculationExecutionState {
  creating,
  created,
  queued,
  running,
  canceling,
  canceled,
  completed,
  failed,
}

extension CalculationExecutionStateValueExtension on CalculationExecutionState {
  String toValue() {
    switch (this) {
      case CalculationExecutionState.creating:
        return 'CREATING';
      case CalculationExecutionState.created:
        return 'CREATED';
      case CalculationExecutionState.queued:
        return 'QUEUED';
      case CalculationExecutionState.running:
        return 'RUNNING';
      case CalculationExecutionState.canceling:
        return 'CANCELING';
      case CalculationExecutionState.canceled:
        return 'CANCELED';
      case CalculationExecutionState.completed:
        return 'COMPLETED';
      case CalculationExecutionState.failed:
        return 'FAILED';
    }
  }
}

extension CalculationExecutionStateFromString on String {
  CalculationExecutionState toCalculationExecutionState() {
    switch (this) {
      case 'CREATING':
        return CalculationExecutionState.creating;
      case 'CREATED':
        return CalculationExecutionState.created;
      case 'QUEUED':
        return CalculationExecutionState.queued;
      case 'RUNNING':
        return CalculationExecutionState.running;
      case 'CANCELING':
        return CalculationExecutionState.canceling;
      case 'CANCELED':
        return CalculationExecutionState.canceled;
      case 'COMPLETED':
        return CalculationExecutionState.completed;
      case 'FAILED':
        return CalculationExecutionState.failed;
    }
    throw Exception('$this is not known in enum CalculationExecutionState');
  }
}

/// Contains information about an application-specific calculation result.
class CalculationResult {
  /// The Amazon S3 location of the folder for the calculation results.
  final String? resultS3Uri;

  /// The data format of the calculation result.
  final String? resultType;

  /// The Amazon S3 location of the <code>stderr</code> error messages file for
  /// the calculation.
  final String? stdErrorS3Uri;

  /// The Amazon S3 location of the <code>stdout</code> file for the calculation.
  final String? stdOutS3Uri;

  CalculationResult({
    this.resultS3Uri,
    this.resultType,
    this.stdErrorS3Uri,
    this.stdOutS3Uri,
  });

  factory CalculationResult.fromJson(Map<String, dynamic> json) {
    return CalculationResult(
      resultS3Uri: json['ResultS3Uri'] as String?,
      resultType: json['ResultType'] as String?,
      stdErrorS3Uri: json['StdErrorS3Uri'] as String?,
      stdOutS3Uri: json['StdOutS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resultS3Uri = this.resultS3Uri;
    final resultType = this.resultType;
    final stdErrorS3Uri = this.stdErrorS3Uri;
    final stdOutS3Uri = this.stdOutS3Uri;
    return {
      if (resultS3Uri != null) 'ResultS3Uri': resultS3Uri,
      if (resultType != null) 'ResultType': resultType,
      if (stdErrorS3Uri != null) 'StdErrorS3Uri': stdErrorS3Uri,
      if (stdOutS3Uri != null) 'StdOutS3Uri': stdOutS3Uri,
    };
  }
}

/// Contains statistics for a notebook calculation.
class CalculationStatistics {
  /// The data processing unit execution time in milliseconds for the calculation.
  final int? dpuExecutionInMillis;

  /// The progress of the calculation.
  final String? progress;

  CalculationStatistics({
    this.dpuExecutionInMillis,
    this.progress,
  });

  factory CalculationStatistics.fromJson(Map<String, dynamic> json) {
    return CalculationStatistics(
      dpuExecutionInMillis: json['DpuExecutionInMillis'] as int?,
      progress: json['Progress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dpuExecutionInMillis = this.dpuExecutionInMillis;
    final progress = this.progress;
    return {
      if (dpuExecutionInMillis != null)
        'DpuExecutionInMillis': dpuExecutionInMillis,
      if (progress != null) 'Progress': progress,
    };
  }
}

/// Contains information about the status of a notebook calculation.
class CalculationStatus {
  /// The date and time the calculation completed processing.
  final DateTime? completionDateTime;

  /// The state of the calculation execution. A description of each state follows.
  ///
  /// <code>CREATING</code> - The calculation is in the process of being created.
  ///
  /// <code>CREATED</code> - The calculation has been created and is ready to run.
  ///
  /// <code>QUEUED</code> - The calculation has been queued for processing.
  ///
  /// <code>RUNNING</code> - The calculation is running.
  ///
  /// <code>CANCELING</code> - A request to cancel the calculation has been
  /// received and the system is working to stop it.
  ///
  /// <code>CANCELED</code> - The calculation is no longer running as the result
  /// of a cancel request.
  ///
  /// <code>COMPLETED</code> - The calculation has completed without error.
  ///
  /// <code>FAILED</code> - The calculation failed and is no longer running.
  final CalculationExecutionState? state;

  /// The reason for the calculation state change (for example, the calculation
  /// was canceled because the session was terminated).
  final String? stateChangeReason;

  /// The date and time the calculation was submitted for processing.
  final DateTime? submissionDateTime;

  CalculationStatus({
    this.completionDateTime,
    this.state,
    this.stateChangeReason,
    this.submissionDateTime,
  });

  factory CalculationStatus.fromJson(Map<String, dynamic> json) {
    return CalculationStatus(
      completionDateTime: timeStampFromJson(json['CompletionDateTime']),
      state: (json['State'] as String?)?.toCalculationExecutionState(),
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

/// Summary information for a notebook calculation.
class CalculationSummary {
  /// The calculation execution UUID.
  final String? calculationExecutionId;

  /// A description of the calculation.
  final String? description;

  /// Contains information about the status of the calculation.
  final CalculationStatus? status;

  CalculationSummary({
    this.calculationExecutionId,
    this.description,
    this.status,
  });

  factory CalculationSummary.fromJson(Map<String, dynamic> json) {
    return CalculationSummary(
      calculationExecutionId: json['CalculationExecutionId'] as String?,
      description: json['Description'] as String?,
      status: json['Status'] != null
          ? CalculationStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final calculationExecutionId = this.calculationExecutionId;
    final description = this.description;
    final status = this.status;
    return {
      if (calculationExecutionId != null)
        'CalculationExecutionId': calculationExecutionId,
      if (description != null) 'Description': description,
      if (status != null) 'Status': status,
    };
  }
}

class CancelCapacityReservationOutput {
  CancelCapacityReservationOutput();

  factory CancelCapacityReservationOutput.fromJson(Map<String, dynamic> _) {
    return CancelCapacityReservationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the submission time of a single allocation request for a capacity
/// reservation and the most recent status of the attempted allocation.
class CapacityAllocation {
  /// The time when the capacity allocation was requested.
  final DateTime requestTime;

  /// The status of the capacity allocation.
  final CapacityAllocationStatus status;

  /// The time when the capacity allocation request was completed.
  final DateTime? requestCompletionTime;

  /// The status message of the capacity allocation.
  final String? statusMessage;

  CapacityAllocation({
    required this.requestTime,
    required this.status,
    this.requestCompletionTime,
    this.statusMessage,
  });

  factory CapacityAllocation.fromJson(Map<String, dynamic> json) {
    return CapacityAllocation(
      requestTime: nonNullableTimeStampFromJson(json['RequestTime'] as Object),
      status: (json['Status'] as String).toCapacityAllocationStatus(),
      requestCompletionTime: timeStampFromJson(json['RequestCompletionTime']),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestTime = this.requestTime;
    final status = this.status;
    final requestCompletionTime = this.requestCompletionTime;
    final statusMessage = this.statusMessage;
    return {
      'RequestTime': unixTimestampToJson(requestTime),
      'Status': status.toValue(),
      if (requestCompletionTime != null)
        'RequestCompletionTime': unixTimestampToJson(requestCompletionTime),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum CapacityAllocationStatus {
  pending,
  succeeded,
  failed,
}

extension CapacityAllocationStatusValueExtension on CapacityAllocationStatus {
  String toValue() {
    switch (this) {
      case CapacityAllocationStatus.pending:
        return 'PENDING';
      case CapacityAllocationStatus.succeeded:
        return 'SUCCEEDED';
      case CapacityAllocationStatus.failed:
        return 'FAILED';
    }
  }
}

extension CapacityAllocationStatusFromString on String {
  CapacityAllocationStatus toCapacityAllocationStatus() {
    switch (this) {
      case 'PENDING':
        return CapacityAllocationStatus.pending;
      case 'SUCCEEDED':
        return CapacityAllocationStatus.succeeded;
      case 'FAILED':
        return CapacityAllocationStatus.failed;
    }
    throw Exception('$this is not known in enum CapacityAllocationStatus');
  }
}

/// A mapping between one or more workgroups and a capacity reservation.
class CapacityAssignment {
  /// The list of workgroup names for the capacity assignment.
  final List<String>? workGroupNames;

  CapacityAssignment({
    this.workGroupNames,
  });

  factory CapacityAssignment.fromJson(Map<String, dynamic> json) {
    return CapacityAssignment(
      workGroupNames: (json['WorkGroupNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final workGroupNames = this.workGroupNames;
    return {
      if (workGroupNames != null) 'WorkGroupNames': workGroupNames,
    };
  }
}

/// Assigns Athena workgroups (and hence their queries) to capacity
/// reservations. A capacity reservation can have only one capacity assignment
/// configuration, but the capacity assignment configuration can be made up of
/// multiple individual assignments. Each assignment specifies how Athena
/// queries can consume capacity from the capacity reservation that their
/// workgroup is mapped to.
class CapacityAssignmentConfiguration {
  /// The list of assignments that make up the capacity assignment configuration.
  final List<CapacityAssignment>? capacityAssignments;

  /// The name of the reservation that the capacity assignment configuration is
  /// for.
  final String? capacityReservationName;

  CapacityAssignmentConfiguration({
    this.capacityAssignments,
    this.capacityReservationName,
  });

  factory CapacityAssignmentConfiguration.fromJson(Map<String, dynamic> json) {
    return CapacityAssignmentConfiguration(
      capacityAssignments: (json['CapacityAssignments'] as List?)
          ?.whereNotNull()
          .map((e) => CapacityAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityReservationName: json['CapacityReservationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityAssignments = this.capacityAssignments;
    final capacityReservationName = this.capacityReservationName;
    return {
      if (capacityAssignments != null)
        'CapacityAssignments': capacityAssignments,
      if (capacityReservationName != null)
        'CapacityReservationName': capacityReservationName,
    };
  }
}

/// A reservation for a specified number of data processing units (DPUs). When a
/// reservation is initially created, it has no DPUs. Athena allocates DPUs
/// until the allocated amount equals the requested amount.
class CapacityReservation {
  /// The number of data processing units currently allocated.
  final int allocatedDpus;

  /// The time in UTC epoch millis when the capacity reservation was created.
  final DateTime creationTime;

  /// The name of the capacity reservation.
  final String name;

  /// The status of the capacity reservation.
  final CapacityReservationStatus status;

  /// The number of data processing units requested.
  final int targetDpus;
  final CapacityAllocation? lastAllocation;

  /// The time of the most recent capacity allocation that succeeded.
  final DateTime? lastSuccessfulAllocationTime;

  CapacityReservation({
    required this.allocatedDpus,
    required this.creationTime,
    required this.name,
    required this.status,
    required this.targetDpus,
    this.lastAllocation,
    this.lastSuccessfulAllocationTime,
  });

  factory CapacityReservation.fromJson(Map<String, dynamic> json) {
    return CapacityReservation(
      allocatedDpus: json['AllocatedDpus'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      name: json['Name'] as String,
      status: (json['Status'] as String).toCapacityReservationStatus(),
      targetDpus: json['TargetDpus'] as int,
      lastAllocation: json['LastAllocation'] != null
          ? CapacityAllocation.fromJson(
              json['LastAllocation'] as Map<String, dynamic>)
          : null,
      lastSuccessfulAllocationTime:
          timeStampFromJson(json['LastSuccessfulAllocationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedDpus = this.allocatedDpus;
    final creationTime = this.creationTime;
    final name = this.name;
    final status = this.status;
    final targetDpus = this.targetDpus;
    final lastAllocation = this.lastAllocation;
    final lastSuccessfulAllocationTime = this.lastSuccessfulAllocationTime;
    return {
      'AllocatedDpus': allocatedDpus,
      'CreationTime': unixTimestampToJson(creationTime),
      'Name': name,
      'Status': status.toValue(),
      'TargetDpus': targetDpus,
      if (lastAllocation != null) 'LastAllocation': lastAllocation,
      if (lastSuccessfulAllocationTime != null)
        'LastSuccessfulAllocationTime':
            unixTimestampToJson(lastSuccessfulAllocationTime),
    };
  }
}

enum CapacityReservationStatus {
  pending,
  active,
  cancelling,
  cancelled,
  failed,
  updatePending,
}

extension CapacityReservationStatusValueExtension on CapacityReservationStatus {
  String toValue() {
    switch (this) {
      case CapacityReservationStatus.pending:
        return 'PENDING';
      case CapacityReservationStatus.active:
        return 'ACTIVE';
      case CapacityReservationStatus.cancelling:
        return 'CANCELLING';
      case CapacityReservationStatus.cancelled:
        return 'CANCELLED';
      case CapacityReservationStatus.failed:
        return 'FAILED';
      case CapacityReservationStatus.updatePending:
        return 'UPDATE_PENDING';
    }
  }
}

extension CapacityReservationStatusFromString on String {
  CapacityReservationStatus toCapacityReservationStatus() {
    switch (this) {
      case 'PENDING':
        return CapacityReservationStatus.pending;
      case 'ACTIVE':
        return CapacityReservationStatus.active;
      case 'CANCELLING':
        return CapacityReservationStatus.cancelling;
      case 'CANCELLED':
        return CapacityReservationStatus.cancelled;
      case 'FAILED':
        return CapacityReservationStatus.failed;
      case 'UPDATE_PENDING':
        return CapacityReservationStatus.updatePending;
    }
    throw Exception('$this is not known in enum CapacityReservationStatus');
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

  /// Unsupported constraint. This value always shows as <code>UNKNOWN</code>.
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

extension ColumnNullableValueExtension on ColumnNullable {
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

extension ColumnNullableFromString on String {
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

class CreateCapacityReservationOutput {
  CreateCapacityReservationOutput();

  factory CreateCapacityReservationOutput.fromJson(Map<String, dynamic> _) {
    return CreateCapacityReservationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class CreateNotebookOutput {
  /// A unique identifier for the notebook.
  final String? notebookId;

  CreateNotebookOutput({
    this.notebookId,
  });

  factory CreateNotebookOutput.fromJson(Map<String, dynamic> json) {
    return CreateNotebookOutput(
      notebookId: json['NotebookId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookId = this.notebookId;
    return {
      if (notebookId != null) 'NotebookId': notebookId,
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

class CreatePresignedNotebookUrlResponse {
  /// The authentication token for the notebook.
  final String authToken;

  /// The UTC epoch time when the authentication token expires.
  final int authTokenExpirationTime;

  /// The URL of the notebook. The URL includes the authentication token and
  /// notebook file name and points directly to the opened notebook.
  final String notebookUrl;

  CreatePresignedNotebookUrlResponse({
    required this.authToken,
    required this.authTokenExpirationTime,
    required this.notebookUrl,
  });

  factory CreatePresignedNotebookUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePresignedNotebookUrlResponse(
      authToken: json['AuthToken'] as String,
      authTokenExpirationTime: json['AuthTokenExpirationTime'] as int,
      notebookUrl: json['NotebookUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authToken = this.authToken;
    final authTokenExpirationTime = this.authTokenExpirationTime;
    final notebookUrl = this.notebookUrl;
    return {
      'AuthToken': authToken,
      'AuthTokenExpirationTime': authTokenExpirationTime,
      'NotebookUrl': notebookUrl,
    };
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

/// Specifies the customer managed KMS key that is used to encrypt the user's
/// data stores in Athena. When an Amazon Web Services managed key is used, this
/// value is null. This setting does not apply to Athena SQL workgroups.
class CustomerContentEncryptionConfiguration {
  /// The customer managed KMS key that is used to encrypt the user's data stores
  /// in Athena.
  final String kmsKey;

  CustomerContentEncryptionConfiguration({
    required this.kmsKey,
  });

  factory CustomerContentEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomerContentEncryptionConfiguration(
      kmsKey: json['KmsKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKey = this.kmsKey;
    return {
      'KmsKey': kmsKey,
    };
  }
}

/// Contains information about a data catalog in an Amazon Web Services account.
/// <note>
/// In the Athena console, data catalogs are listed as "data sources" on the
/// <b>Data sources</b> page under the <b>Data source name</b> column.
/// </note>
class DataCatalog {
  /// The name of the data catalog. The catalog name must be unique for the Amazon
  /// Web Services account and can use a maximum of 127 alphanumeric, underscore,
  /// at sign, or hyphen characters. The remainder of the length constraint of 256
  /// is reserved for use by Athena.
  final String name;

  /// The type of data catalog to create: <code>LAMBDA</code> for a federated
  /// catalog, <code>HIVE</code> for an external hive metastore, or
  /// <code>GLUE</code> for an Glue Data Catalog.
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
  /// <li>
  /// The <code>GLUE</code> type takes a catalog ID parameter and is required. The
  /// <code> <i>catalog_id</i> </code> is the account ID of the Amazon Web
  /// Services account to which the Glue catalog belongs.
  ///
  /// <code>catalog-id=<i>catalog_id</i> </code>
  ///
  /// <ul>
  /// <li>
  /// The <code>GLUE</code> data catalog type also applies to the default
  /// <code>AwsDataCatalog</code> that already exists in your account, of which
  /// you can have only one and cannot modify.
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
  /// The name of the data catalog. The catalog name is unique for the Amazon Web
  /// Services account and can use a maximum of 127 alphanumeric, underscore, at
  /// sign, or hyphen characters. The remainder of the length constraint of 256 is
  /// reserved for use by Athena.
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

extension DataCatalogTypeValueExtension on DataCatalogType {
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

extension DataCatalogTypeFromString on String {
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

class DeleteCapacityReservationOutput {
  DeleteCapacityReservationOutput();

  factory DeleteCapacityReservationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCapacityReservationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeleteNotebookOutput {
  DeleteNotebookOutput();

  factory DeleteNotebookOutput.fromJson(Map<String, dynamic> _) {
    return DeleteNotebookOutput();
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

/// If query and calculation results are encrypted in Amazon S3, indicates the
/// encryption option used (for example, <code>SSE_KMS</code> or
/// <code>CSE_KMS</code>) and key information.
class EncryptionConfiguration {
  /// Indicates whether Amazon S3 server-side encryption with Amazon S3-managed
  /// keys (<code>SSE_S3</code>), server-side encryption with KMS-managed keys
  /// (<code>SSE_KMS</code>), or client-side encryption with KMS-managed keys
  /// (<code>CSE_KMS</code>) is used.
  ///
  /// If a query runs in a workgroup and the workgroup overrides client-side
  /// settings, then the workgroup's setting for encryption is used. It specifies
  /// whether query results must be encrypted, for all queries that run in this
  /// workgroup.
  final EncryptionOption encryptionOption;

  /// For <code>SSE_KMS</code> and <code>CSE_KMS</code>, this is the KMS key ARN
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

extension EncryptionOptionValueExtension on EncryptionOption {
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

extension EncryptionOptionFromString on String {
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

/// Contains data processing unit (DPU) configuration settings and parameter
/// mappings for a notebook engine.
class EngineConfiguration {
  /// The maximum number of DPUs that can run concurrently.
  final int maxConcurrentDpus;

  /// Contains additional notebook engine <code>MAP&lt;string, string&gt;</code>
  /// parameter mappings in the form of key-value pairs. To specify an Athena
  /// notebook that the Jupyter server will download and serve, specify a value
  /// for the <a>StartSessionRequest$NotebookVersion</a> field, and then add a key
  /// named <code>NotebookId</code> to <code>AdditionalConfigs</code> that has the
  /// value of the Athena notebook ID.
  final Map<String, String>? additionalConfigs;

  /// The number of DPUs to use for the coordinator. A coordinator is a special
  /// executor that orchestrates processing work and manages other executors in a
  /// notebook session. The default is 1.
  final int? coordinatorDpuSize;

  /// The default number of DPUs to use for executors. An executor is the smallest
  /// unit of compute that a notebook session can request from Athena. The default
  /// is 1.
  final int? defaultExecutorDpuSize;

  /// Specifies custom jar files and Spark properties for use cases like cluster
  /// encryption, table formats, and general Spark tuning.
  final Map<String, String>? sparkProperties;

  EngineConfiguration({
    required this.maxConcurrentDpus,
    this.additionalConfigs,
    this.coordinatorDpuSize,
    this.defaultExecutorDpuSize,
    this.sparkProperties,
  });

  factory EngineConfiguration.fromJson(Map<String, dynamic> json) {
    return EngineConfiguration(
      maxConcurrentDpus: json['MaxConcurrentDpus'] as int,
      additionalConfigs: (json['AdditionalConfigs'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      coordinatorDpuSize: json['CoordinatorDpuSize'] as int?,
      defaultExecutorDpuSize: json['DefaultExecutorDpuSize'] as int?,
      sparkProperties: (json['SparkProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final maxConcurrentDpus = this.maxConcurrentDpus;
    final additionalConfigs = this.additionalConfigs;
    final coordinatorDpuSize = this.coordinatorDpuSize;
    final defaultExecutorDpuSize = this.defaultExecutorDpuSize;
    final sparkProperties = this.sparkProperties;
    return {
      'MaxConcurrentDpus': maxConcurrentDpus,
      if (additionalConfigs != null) 'AdditionalConfigs': additionalConfigs,
      if (coordinatorDpuSize != null) 'CoordinatorDpuSize': coordinatorDpuSize,
      if (defaultExecutorDpuSize != null)
        'DefaultExecutorDpuSize': defaultExecutorDpuSize,
      if (sparkProperties != null) 'SparkProperties': sparkProperties,
    };
  }
}

/// The Athena engine version for running queries, or the PySpark engine version
/// for running sessions.
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
  /// the output of <code>ListEngineVersions</code>, including AUTO. The default
  /// is AUTO.
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

enum ExecutorState {
  creating,
  created,
  registered,
  terminating,
  terminated,
  failed,
}

extension ExecutorStateValueExtension on ExecutorState {
  String toValue() {
    switch (this) {
      case ExecutorState.creating:
        return 'CREATING';
      case ExecutorState.created:
        return 'CREATED';
      case ExecutorState.registered:
        return 'REGISTERED';
      case ExecutorState.terminating:
        return 'TERMINATING';
      case ExecutorState.terminated:
        return 'TERMINATED';
      case ExecutorState.failed:
        return 'FAILED';
    }
  }
}

extension ExecutorStateFromString on String {
  ExecutorState toExecutorState() {
    switch (this) {
      case 'CREATING':
        return ExecutorState.creating;
      case 'CREATED':
        return ExecutorState.created;
      case 'REGISTERED':
        return ExecutorState.registered;
      case 'TERMINATING':
        return ExecutorState.terminating;
      case 'TERMINATED':
        return ExecutorState.terminated;
      case 'FAILED':
        return ExecutorState.failed;
    }
    throw Exception('$this is not known in enum ExecutorState');
  }
}

enum ExecutorType {
  coordinator,
  gateway,
  worker,
}

extension ExecutorTypeValueExtension on ExecutorType {
  String toValue() {
    switch (this) {
      case ExecutorType.coordinator:
        return 'COORDINATOR';
      case ExecutorType.gateway:
        return 'GATEWAY';
      case ExecutorType.worker:
        return 'WORKER';
    }
  }
}

extension ExecutorTypeFromString on String {
  ExecutorType toExecutorType() {
    switch (this) {
      case 'COORDINATOR':
        return ExecutorType.coordinator;
      case 'GATEWAY':
        return ExecutorType.gateway;
      case 'WORKER':
        return ExecutorType.worker;
    }
    throw Exception('$this is not known in enum ExecutorType');
  }
}

/// Contains summary information about an executor.
class ExecutorsSummary {
  /// The UUID of the executor.
  final String executorId;

  /// The smallest unit of compute that a session can request from Athena. Size is
  /// measured in data processing unit (DPU) values, a relative measure of
  /// processing power.
  final int? executorSize;

  /// The processing state of the executor. A description of each state follows.
  ///
  /// <code>CREATING</code> - The executor is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The executor has been started.
  ///
  /// <code>REGISTERED</code> - The executor has been registered.
  ///
  /// <code>TERMINATING</code> - The executor is in the process of shutting down.
  ///
  /// <code>TERMINATED</code> - The executor is no longer running.
  ///
  /// <code>FAILED</code> - Due to a failure, the executor is no longer running.
  final ExecutorState? executorState;

  /// The type of executor used for the application (<code>COORDINATOR</code>,
  /// <code>GATEWAY</code>, or <code>WORKER</code>).
  final ExecutorType? executorType;

  /// The date and time that the executor started.
  final int? startDateTime;

  /// The date and time that the executor was terminated.
  final int? terminationDateTime;

  ExecutorsSummary({
    required this.executorId,
    this.executorSize,
    this.executorState,
    this.executorType,
    this.startDateTime,
    this.terminationDateTime,
  });

  factory ExecutorsSummary.fromJson(Map<String, dynamic> json) {
    return ExecutorsSummary(
      executorId: json['ExecutorId'] as String,
      executorSize: json['ExecutorSize'] as int?,
      executorState: (json['ExecutorState'] as String?)?.toExecutorState(),
      executorType: (json['ExecutorType'] as String?)?.toExecutorType(),
      startDateTime: json['StartDateTime'] as int?,
      terminationDateTime: json['TerminationDateTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final executorId = this.executorId;
    final executorSize = this.executorSize;
    final executorState = this.executorState;
    final executorType = this.executorType;
    final startDateTime = this.startDateTime;
    final terminationDateTime = this.terminationDateTime;
    return {
      'ExecutorId': executorId,
      if (executorSize != null) 'ExecutorSize': executorSize,
      if (executorState != null) 'ExecutorState': executorState.toValue(),
      if (executorType != null) 'ExecutorType': executorType.toValue(),
      if (startDateTime != null) 'StartDateTime': startDateTime,
      if (terminationDateTime != null)
        'TerminationDateTime': terminationDateTime,
    };
  }
}

class ExportNotebookOutput {
  /// The notebook metadata, including notebook ID, notebook name, and workgroup
  /// name.
  final NotebookMetadata? notebookMetadata;

  /// The content of the exported notebook.
  final String? payload;

  ExportNotebookOutput({
    this.notebookMetadata,
    this.payload,
  });

  factory ExportNotebookOutput.fromJson(Map<String, dynamic> json) {
    return ExportNotebookOutput(
      notebookMetadata: json['NotebookMetadata'] != null
          ? NotebookMetadata.fromJson(
              json['NotebookMetadata'] as Map<String, dynamic>)
          : null,
      payload: json['Payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookMetadata = this.notebookMetadata;
    final payload = this.payload;
    return {
      if (notebookMetadata != null) 'NotebookMetadata': notebookMetadata,
      if (payload != null) 'Payload': payload,
    };
  }
}

/// A string for searching notebook names.
class FilterDefinition {
  /// The name of the notebook to search for.
  final String? name;

  FilterDefinition({
    this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class GetCalculationExecutionCodeResponse {
  /// The unencrypted code that was executed for the calculation.
  final String? codeBlock;

  GetCalculationExecutionCodeResponse({
    this.codeBlock,
  });

  factory GetCalculationExecutionCodeResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCalculationExecutionCodeResponse(
      codeBlock: json['CodeBlock'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeBlock = this.codeBlock;
    return {
      if (codeBlock != null) 'CodeBlock': codeBlock,
    };
  }
}

class GetCalculationExecutionResponse {
  /// The calculation execution UUID.
  final String? calculationExecutionId;

  /// The description of the calculation execution.
  final String? description;

  /// Contains result information. This field is populated only if the calculation
  /// is completed.
  final CalculationResult? result;

  /// The session ID that the calculation ran in.
  final String? sessionId;

  /// Contains information about the data processing unit (DPU) execution time and
  /// progress. This field is populated only when statistics are available.
  final CalculationStatistics? statistics;

  /// Contains information about the status of the calculation.
  final CalculationStatus? status;

  /// The Amazon S3 location in which calculation results are stored.
  final String? workingDirectory;

  GetCalculationExecutionResponse({
    this.calculationExecutionId,
    this.description,
    this.result,
    this.sessionId,
    this.statistics,
    this.status,
    this.workingDirectory,
  });

  factory GetCalculationExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetCalculationExecutionResponse(
      calculationExecutionId: json['CalculationExecutionId'] as String?,
      description: json['Description'] as String?,
      result: json['Result'] != null
          ? CalculationResult.fromJson(json['Result'] as Map<String, dynamic>)
          : null,
      sessionId: json['SessionId'] as String?,
      statistics: json['Statistics'] != null
          ? CalculationStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? CalculationStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculationExecutionId = this.calculationExecutionId;
    final description = this.description;
    final result = this.result;
    final sessionId = this.sessionId;
    final statistics = this.statistics;
    final status = this.status;
    final workingDirectory = this.workingDirectory;
    return {
      if (calculationExecutionId != null)
        'CalculationExecutionId': calculationExecutionId,
      if (description != null) 'Description': description,
      if (result != null) 'Result': result,
      if (sessionId != null) 'SessionId': sessionId,
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status,
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

class GetCalculationExecutionStatusResponse {
  /// Contains information about the DPU execution time and progress.
  final CalculationStatistics? statistics;

  /// Contains information about the calculation execution status.
  final CalculationStatus? status;

  GetCalculationExecutionStatusResponse({
    this.statistics,
    this.status,
  });

  factory GetCalculationExecutionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCalculationExecutionStatusResponse(
      statistics: json['Statistics'] != null
          ? CalculationStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? CalculationStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final statistics = this.statistics;
    final status = this.status;
    return {
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status,
    };
  }
}

class GetCapacityAssignmentConfigurationOutput {
  /// The requested capacity assignment configuration for the specified capacity
  /// reservation.
  final CapacityAssignmentConfiguration capacityAssignmentConfiguration;

  GetCapacityAssignmentConfigurationOutput({
    required this.capacityAssignmentConfiguration,
  });

  factory GetCapacityAssignmentConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCapacityAssignmentConfigurationOutput(
      capacityAssignmentConfiguration: CapacityAssignmentConfiguration.fromJson(
          json['CapacityAssignmentConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityAssignmentConfiguration =
        this.capacityAssignmentConfiguration;
    return {
      'CapacityAssignmentConfiguration': capacityAssignmentConfiguration,
    };
  }
}

class GetCapacityReservationOutput {
  /// The requested capacity reservation structure.
  final CapacityReservation capacityReservation;

  GetCapacityReservationOutput({
    required this.capacityReservation,
  });

  factory GetCapacityReservationOutput.fromJson(Map<String, dynamic> json) {
    return GetCapacityReservationOutput(
      capacityReservation: CapacityReservation.fromJson(
          json['CapacityReservation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityReservation = this.capacityReservation;
    return {
      'CapacityReservation': capacityReservation,
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

class GetNotebookMetadataOutput {
  /// The metadata that is returned for the specified notebook ID.
  final NotebookMetadata? notebookMetadata;

  GetNotebookMetadataOutput({
    this.notebookMetadata,
  });

  factory GetNotebookMetadataOutput.fromJson(Map<String, dynamic> json) {
    return GetNotebookMetadataOutput(
      notebookMetadata: json['NotebookMetadata'] != null
          ? NotebookMetadata.fromJson(
              json['NotebookMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookMetadata = this.notebookMetadata;
    return {
      if (notebookMetadata != null) 'NotebookMetadata': notebookMetadata,
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

  /// The number of rows inserted with a <code>CREATE TABLE AS SELECT</code>
  /// statement.
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

class GetQueryRuntimeStatisticsOutput {
  /// Runtime statistics about the query execution.
  final QueryRuntimeStatistics? queryRuntimeStatistics;

  GetQueryRuntimeStatisticsOutput({
    this.queryRuntimeStatistics,
  });

  factory GetQueryRuntimeStatisticsOutput.fromJson(Map<String, dynamic> json) {
    return GetQueryRuntimeStatisticsOutput(
      queryRuntimeStatistics: json['QueryRuntimeStatistics'] != null
          ? QueryRuntimeStatistics.fromJson(
              json['QueryRuntimeStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queryRuntimeStatistics = this.queryRuntimeStatistics;
    return {
      if (queryRuntimeStatistics != null)
        'QueryRuntimeStatistics': queryRuntimeStatistics,
    };
  }
}

class GetSessionResponse {
  /// The session description.
  final String? description;

  /// Contains engine configuration information like DPU usage.
  final EngineConfiguration? engineConfiguration;

  /// The engine version used by the session (for example, <code>PySpark engine
  /// version 3</code>). You can get a list of engine versions by calling
  /// <a>ListEngineVersions</a>.
  final String? engineVersion;

  /// The notebook version.
  final String? notebookVersion;

  /// Contains the workgroup configuration information used by the session.
  final SessionConfiguration? sessionConfiguration;

  /// The session ID.
  final String? sessionId;

  /// Contains the DPU execution time.
  final SessionStatistics? statistics;

  /// Contains information about the status of the session.
  final SessionStatus? status;

  /// The workgroup to which the session belongs.
  final String? workGroup;

  GetSessionResponse({
    this.description,
    this.engineConfiguration,
    this.engineVersion,
    this.notebookVersion,
    this.sessionConfiguration,
    this.sessionId,
    this.statistics,
    this.status,
    this.workGroup,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      description: json['Description'] as String?,
      engineConfiguration: json['EngineConfiguration'] != null
          ? EngineConfiguration.fromJson(
              json['EngineConfiguration'] as Map<String, dynamic>)
          : null,
      engineVersion: json['EngineVersion'] as String?,
      notebookVersion: json['NotebookVersion'] as String?,
      sessionConfiguration: json['SessionConfiguration'] != null
          ? SessionConfiguration.fromJson(
              json['SessionConfiguration'] as Map<String, dynamic>)
          : null,
      sessionId: json['SessionId'] as String?,
      statistics: json['Statistics'] != null
          ? SessionStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? SessionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final engineConfiguration = this.engineConfiguration;
    final engineVersion = this.engineVersion;
    final notebookVersion = this.notebookVersion;
    final sessionConfiguration = this.sessionConfiguration;
    final sessionId = this.sessionId;
    final statistics = this.statistics;
    final status = this.status;
    final workGroup = this.workGroup;
    return {
      if (description != null) 'Description': description,
      if (engineConfiguration != null)
        'EngineConfiguration': engineConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (notebookVersion != null) 'NotebookVersion': notebookVersion,
      if (sessionConfiguration != null)
        'SessionConfiguration': sessionConfiguration,
      if (sessionId != null) 'SessionId': sessionId,
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status,
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

class GetSessionStatusResponse {
  /// The session ID.
  final String? sessionId;

  /// Contains information about the status of the session.
  final SessionStatus? status;

  GetSessionStatusResponse({
    this.sessionId,
    this.status,
  });

  factory GetSessionStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionStatusResponse(
      sessionId: json['SessionId'] as String?,
      status: json['Status'] != null
          ? SessionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final status = this.status;
    return {
      if (sessionId != null) 'SessionId': sessionId,
      if (status != null) 'Status': status,
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

/// Specifies whether the workgroup is IAM Identity Center supported.
class IdentityCenterConfiguration {
  /// Specifies whether the workgroup is IAM Identity Center supported.
  final bool? enableIdentityCenter;

  /// The IAM Identity Center instance ARN that the workgroup associates to.
  final String? identityCenterInstanceArn;

  IdentityCenterConfiguration({
    this.enableIdentityCenter,
    this.identityCenterInstanceArn,
  });

  factory IdentityCenterConfiguration.fromJson(Map<String, dynamic> json) {
    return IdentityCenterConfiguration(
      enableIdentityCenter: json['EnableIdentityCenter'] as bool?,
      identityCenterInstanceArn: json['IdentityCenterInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableIdentityCenter = this.enableIdentityCenter;
    final identityCenterInstanceArn = this.identityCenterInstanceArn;
    return {
      if (enableIdentityCenter != null)
        'EnableIdentityCenter': enableIdentityCenter,
      if (identityCenterInstanceArn != null)
        'IdentityCenterInstanceArn': identityCenterInstanceArn,
    };
  }
}

class ImportNotebookOutput {
  /// The ID assigned to the imported notebook.
  final String? notebookId;

  ImportNotebookOutput({
    this.notebookId,
  });

  factory ImportNotebookOutput.fromJson(Map<String, dynamic> json) {
    return ImportNotebookOutput(
      notebookId: json['NotebookId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookId = this.notebookId;
    return {
      if (notebookId != null) 'NotebookId': notebookId,
    };
  }
}

class ListApplicationDPUSizesOutput {
  /// A list of the supported DPU sizes that the application runtime supports.
  final List<ApplicationDPUSizes>? applicationDPUSizes;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListApplicationDPUSizesOutput({
    this.applicationDPUSizes,
    this.nextToken,
  });

  factory ListApplicationDPUSizesOutput.fromJson(Map<String, dynamic> json) {
    return ListApplicationDPUSizesOutput(
      applicationDPUSizes: (json['ApplicationDPUSizes'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationDPUSizes.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationDPUSizes = this.applicationDPUSizes;
    final nextToken = this.nextToken;
    return {
      if (applicationDPUSizes != null)
        'ApplicationDPUSizes': applicationDPUSizes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCalculationExecutionsResponse {
  /// A list of <a>CalculationSummary</a> objects.
  final List<CalculationSummary>? calculations;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListCalculationExecutionsResponse({
    this.calculations,
    this.nextToken,
  });

  factory ListCalculationExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCalculationExecutionsResponse(
      calculations: (json['Calculations'] as List?)
          ?.whereNotNull()
          .map((e) => CalculationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculations = this.calculations;
    final nextToken = this.nextToken;
    return {
      if (calculations != null) 'Calculations': calculations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCapacityReservationsOutput {
  /// The capacity reservations for the current account.
  final List<CapacityReservation> capacityReservations;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the NextToken from the response object of the previous page
  /// call.
  final String? nextToken;

  ListCapacityReservationsOutput({
    required this.capacityReservations,
    this.nextToken,
  });

  factory ListCapacityReservationsOutput.fromJson(Map<String, dynamic> json) {
    return ListCapacityReservationsOutput(
      capacityReservations: (json['CapacityReservations'] as List)
          .whereNotNull()
          .map((e) => CapacityReservation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityReservations = this.capacityReservations;
    final nextToken = this.nextToken;
    return {
      'CapacityReservations': capacityReservations,
      if (nextToken != null) 'NextToken': nextToken,
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

class ListExecutorsResponse {
  /// The session ID.
  final String sessionId;

  /// Contains summary information about the executor.
  final List<ExecutorsSummary>? executorsSummary;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListExecutorsResponse({
    required this.sessionId,
    this.executorsSummary,
    this.nextToken,
  });

  factory ListExecutorsResponse.fromJson(Map<String, dynamic> json) {
    return ListExecutorsResponse(
      sessionId: json['SessionId'] as String,
      executorsSummary: (json['ExecutorsSummary'] as List?)
          ?.whereNotNull()
          .map((e) => ExecutorsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final executorsSummary = this.executorsSummary;
    final nextToken = this.nextToken;
    return {
      'SessionId': sessionId,
      if (executorsSummary != null) 'ExecutorsSummary': executorsSummary,
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

class ListNotebookMetadataOutput {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  /// The list of notebook metadata for the specified workgroup.
  final List<NotebookMetadata>? notebookMetadataList;

  ListNotebookMetadataOutput({
    this.nextToken,
    this.notebookMetadataList,
  });

  factory ListNotebookMetadataOutput.fromJson(Map<String, dynamic> json) {
    return ListNotebookMetadataOutput(
      nextToken: json['NextToken'] as String?,
      notebookMetadataList: (json['NotebookMetadataList'] as List?)
          ?.whereNotNull()
          .map((e) => NotebookMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notebookMetadataList = this.notebookMetadataList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notebookMetadataList != null)
        'NotebookMetadataList': notebookMetadataList,
    };
  }
}

class ListNotebookSessionsResponse {
  /// A list of the sessions belonging to the notebook.
  final List<NotebookSessionSummary> notebookSessionsList;

  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  ListNotebookSessionsResponse({
    required this.notebookSessionsList,
    this.nextToken,
  });

  factory ListNotebookSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListNotebookSessionsResponse(
      notebookSessionsList: (json['NotebookSessionsList'] as List)
          .whereNotNull()
          .map(
              (e) => NotebookSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookSessionsList = this.notebookSessionsList;
    final nextToken = this.nextToken;
    return {
      'NotebookSessionsList': notebookSessionsList,
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

class ListSessionsResponse {
  /// A token generated by the Athena service that specifies where to continue
  /// pagination if a previous request was truncated. To obtain the next set of
  /// pages, pass in the <code>NextToken</code> from the response object of the
  /// previous page call.
  final String? nextToken;

  /// A list of sessions.
  final List<SessionSummary>? sessions;

  ListSessionsResponse({
    this.nextToken,
    this.sessions,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      nextToken: json['NextToken'] as String?,
      sessions: (json['Sessions'] as List?)
          ?.whereNotNull()
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sessions != null) 'Sessions': sessions,
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

/// A query, where <code>QueryString</code> contains the SQL statements that
/// make up the query.
class NamedQuery {
  /// The database to which the query belongs.
  final String database;

  /// The query name.
  final String name;

  /// The SQL statements that make up the query.
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

/// Contains metadata for notebook, including the notebook name, ID, workgroup,
/// and time created.
class NotebookMetadata {
  /// The time when the notebook was created.
  final DateTime? creationTime;

  /// The time when the notebook was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the notebook.
  final String? name;

  /// The notebook ID.
  final String? notebookId;

  /// The type of notebook. Currently, the only valid type is <code>IPYNB</code>.
  final NotebookType? type;

  /// The name of the Spark enabled workgroup to which the notebook belongs.
  final String? workGroup;

  NotebookMetadata({
    this.creationTime,
    this.lastModifiedTime,
    this.name,
    this.notebookId,
    this.type,
    this.workGroup,
  });

  factory NotebookMetadata.fromJson(Map<String, dynamic> json) {
    return NotebookMetadata(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      notebookId: json['NotebookId'] as String?,
      type: (json['Type'] as String?)?.toNotebookType(),
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final notebookId = this.notebookId;
    final type = this.type;
    final workGroup = this.workGroup;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (notebookId != null) 'NotebookId': notebookId,
      if (type != null) 'Type': type.toValue(),
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

/// Contains the notebook session ID and notebook session creation time.
class NotebookSessionSummary {
  /// The time when the notebook session was created.
  final DateTime? creationTime;

  /// The notebook session ID.
  final String? sessionId;

  NotebookSessionSummary({
    this.creationTime,
    this.sessionId,
  });

  factory NotebookSessionSummary.fromJson(Map<String, dynamic> json) {
    return NotebookSessionSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      sessionId: json['SessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final sessionId = this.sessionId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (sessionId != null) 'SessionId': sessionId,
    };
  }
}

enum NotebookType {
  ipynb,
}

extension NotebookTypeValueExtension on NotebookType {
  String toValue() {
    switch (this) {
      case NotebookType.ipynb:
        return 'IPYNB';
    }
  }
}

extension NotebookTypeFromString on String {
  NotebookType toNotebookType() {
    switch (this) {
      case 'IPYNB':
        return NotebookType.ipynb;
    }
    throw Exception('$this is not known in enum NotebookType');
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

class PutCapacityAssignmentConfigurationOutput {
  PutCapacityAssignmentConfigurationOutput();

  factory PutCapacityAssignmentConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return PutCapacityAssignmentConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a single instance of a query execution.
class QueryExecution {
  /// The engine version that executed the query.
  final EngineVersion? engineVersion;

  /// A list of values for the parameters in a query. The values are applied
  /// sequentially to the parameters in the query in the order in which the
  /// parameters occur. The list of parameters is not returned in the response.
  final List<String>? executionParameters;

  /// The SQL query statements which the query execution ran.
  final String? query;

  /// The database in which the query execution occurred.
  final QueryExecutionContext? queryExecutionContext;

  /// The unique identifier for each query execution.
  final String? queryExecutionId;

  /// Specifies whether Amazon S3 access grants are enabled for query results.
  final QueryResultsS3AccessGrantsConfiguration?
      queryResultsS3AccessGrantsConfiguration;

  /// The location in Amazon S3 where query and calculation results are stored and
  /// the encryption option, if any, used for query results. These are known as
  /// "client-side settings". If workgroup settings override client-side settings,
  /// then the query uses the location for the query results and the encryption
  /// configuration that are specified for the workgroup.
  final ResultConfiguration? resultConfiguration;

  /// Specifies the query result reuse behavior that was used for the query.
  final ResultReuseConfiguration? resultReuseConfiguration;

  /// The type of query statement that was run. <code>DDL</code> indicates DDL
  /// query statements. <code>DML</code> indicates DML (Data Manipulation
  /// Language) query statements, such as <code>CREATE TABLE AS SELECT</code>.
  /// <code>UTILITY</code> indicates query statements other than DDL and DML, such
  /// as <code>SHOW CREATE TABLE</code>, or <code>DESCRIBE TABLE</code>.
  final StatementType? statementType;

  /// Query execution statistics, such as the amount of data scanned, the amount
  /// of time that the query took to process, and the type of statement that was
  /// run.
  final QueryExecutionStatistics? statistics;

  /// The completion date, current state, submission time, and state change reason
  /// (if applicable) for the query execution.
  final QueryExecutionStatus? status;

  /// The kind of query statement that was run.
  final String? substatementType;

  /// The name of the workgroup in which the query ran.
  final String? workGroup;

  QueryExecution({
    this.engineVersion,
    this.executionParameters,
    this.query,
    this.queryExecutionContext,
    this.queryExecutionId,
    this.queryResultsS3AccessGrantsConfiguration,
    this.resultConfiguration,
    this.resultReuseConfiguration,
    this.statementType,
    this.statistics,
    this.status,
    this.substatementType,
    this.workGroup,
  });

  factory QueryExecution.fromJson(Map<String, dynamic> json) {
    return QueryExecution(
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      executionParameters: (json['ExecutionParameters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      query: json['Query'] as String?,
      queryExecutionContext: json['QueryExecutionContext'] != null
          ? QueryExecutionContext.fromJson(
              json['QueryExecutionContext'] as Map<String, dynamic>)
          : null,
      queryExecutionId: json['QueryExecutionId'] as String?,
      queryResultsS3AccessGrantsConfiguration:
          json['QueryResultsS3AccessGrantsConfiguration'] != null
              ? QueryResultsS3AccessGrantsConfiguration.fromJson(
                  json['QueryResultsS3AccessGrantsConfiguration']
                      as Map<String, dynamic>)
              : null,
      resultConfiguration: json['ResultConfiguration'] != null
          ? ResultConfiguration.fromJson(
              json['ResultConfiguration'] as Map<String, dynamic>)
          : null,
      resultReuseConfiguration: json['ResultReuseConfiguration'] != null
          ? ResultReuseConfiguration.fromJson(
              json['ResultReuseConfiguration'] as Map<String, dynamic>)
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
      substatementType: json['SubstatementType'] as String?,
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersion = this.engineVersion;
    final executionParameters = this.executionParameters;
    final query = this.query;
    final queryExecutionContext = this.queryExecutionContext;
    final queryExecutionId = this.queryExecutionId;
    final queryResultsS3AccessGrantsConfiguration =
        this.queryResultsS3AccessGrantsConfiguration;
    final resultConfiguration = this.resultConfiguration;
    final resultReuseConfiguration = this.resultReuseConfiguration;
    final statementType = this.statementType;
    final statistics = this.statistics;
    final status = this.status;
    final substatementType = this.substatementType;
    final workGroup = this.workGroup;
    return {
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (executionParameters != null)
        'ExecutionParameters': executionParameters,
      if (query != null) 'Query': query,
      if (queryExecutionContext != null)
        'QueryExecutionContext': queryExecutionContext,
      if (queryExecutionId != null) 'QueryExecutionId': queryExecutionId,
      if (queryResultsS3AccessGrantsConfiguration != null)
        'QueryResultsS3AccessGrantsConfiguration':
            queryResultsS3AccessGrantsConfiguration,
      if (resultConfiguration != null)
        'ResultConfiguration': resultConfiguration,
      if (resultReuseConfiguration != null)
        'ResultReuseConfiguration': resultReuseConfiguration,
      if (statementType != null) 'StatementType': statementType.toValue(),
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status,
      if (substatementType != null) 'SubstatementType': substatementType,
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

/// The database and data catalog context in which the query execution occurs.
class QueryExecutionContext {
  /// The name of the data catalog used in the query execution.
  final String? catalog;

  /// The name of the database used in the query execution. The database must
  /// exist in the catalog.
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

extension QueryExecutionStateValueExtension on QueryExecutionState {
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

extension QueryExecutionStateFromString on String {
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

  /// Contains information about whether previous query results were reused for
  /// the query.
  final ResultReuseInformation? resultReuseInformation;

  /// The number of milliseconds that Athena took to preprocess the query before
  /// submitting the query to the query engine.
  final int? servicePreProcessingTimeInMillis;

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
    this.resultReuseInformation,
    this.servicePreProcessingTimeInMillis,
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
      resultReuseInformation: json['ResultReuseInformation'] != null
          ? ResultReuseInformation.fromJson(
              json['ResultReuseInformation'] as Map<String, dynamic>)
          : null,
      servicePreProcessingTimeInMillis:
          json['ServicePreProcessingTimeInMillis'] as int?,
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
    final resultReuseInformation = this.resultReuseInformation;
    final servicePreProcessingTimeInMillis =
        this.servicePreProcessingTimeInMillis;
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
      if (resultReuseInformation != null)
        'ResultReuseInformation': resultReuseInformation,
      if (servicePreProcessingTimeInMillis != null)
        'ServicePreProcessingTimeInMillis': servicePreProcessingTimeInMillis,
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
  /// Provides information about an Athena query error.
  final AthenaError? athenaError;

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
    this.athenaError,
    this.completionDateTime,
    this.state,
    this.stateChangeReason,
    this.submissionDateTime,
  });

  factory QueryExecutionStatus.fromJson(Map<String, dynamic> json) {
    return QueryExecutionStatus(
      athenaError: json['AthenaError'] != null
          ? AthenaError.fromJson(json['AthenaError'] as Map<String, dynamic>)
          : null,
      completionDateTime: timeStampFromJson(json['CompletionDateTime']),
      state: (json['State'] as String?)?.toQueryExecutionState(),
      stateChangeReason: json['StateChangeReason'] as String?,
      submissionDateTime: timeStampFromJson(json['SubmissionDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final athenaError = this.athenaError;
    final completionDateTime = this.completionDateTime;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final submissionDateTime = this.submissionDateTime;
    return {
      if (athenaError != null) 'AthenaError': athenaError,
      if (completionDateTime != null)
        'CompletionDateTime': unixTimestampToJson(completionDateTime),
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (submissionDateTime != null)
        'SubmissionDateTime': unixTimestampToJson(submissionDateTime),
    };
  }
}

/// Specifies whether Amazon S3 access grants are enabled for query results.
class QueryResultsS3AccessGrantsConfiguration {
  /// The authentication type used for Amazon S3 access grants. Currently, only
  /// <code>DIRECTORY_IDENTITY</code> is supported.
  final AuthenticationType authenticationType;

  /// Specifies whether Amazon S3 access grants are enabled for query results.
  final bool enableS3AccessGrants;

  /// When enabled, appends the user ID as an Amazon S3 path prefix to the query
  /// result output location.
  final bool? createUserLevelPrefix;

  QueryResultsS3AccessGrantsConfiguration({
    required this.authenticationType,
    required this.enableS3AccessGrants,
    this.createUserLevelPrefix,
  });

  factory QueryResultsS3AccessGrantsConfiguration.fromJson(
      Map<String, dynamic> json) {
    return QueryResultsS3AccessGrantsConfiguration(
      authenticationType:
          (json['AuthenticationType'] as String).toAuthenticationType(),
      enableS3AccessGrants: json['EnableS3AccessGrants'] as bool,
      createUserLevelPrefix: json['CreateUserLevelPrefix'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final enableS3AccessGrants = this.enableS3AccessGrants;
    final createUserLevelPrefix = this.createUserLevelPrefix;
    return {
      'AuthenticationType': authenticationType.toValue(),
      'EnableS3AccessGrants': enableS3AccessGrants,
      if (createUserLevelPrefix != null)
        'CreateUserLevelPrefix': createUserLevelPrefix,
    };
  }
}

/// The query execution timeline, statistics on input and output rows and bytes,
/// and the different query stages that form the query execution plan.
class QueryRuntimeStatistics {
  /// Stage statistics such as input and output rows and bytes, execution time,
  /// and stage state. This information also includes substages and the query
  /// stage plan.
  final QueryStage? outputStage;
  final QueryRuntimeStatisticsRows? rows;
  final QueryRuntimeStatisticsTimeline? timeline;

  QueryRuntimeStatistics({
    this.outputStage,
    this.rows,
    this.timeline,
  });

  factory QueryRuntimeStatistics.fromJson(Map<String, dynamic> json) {
    return QueryRuntimeStatistics(
      outputStage: json['OutputStage'] != null
          ? QueryStage.fromJson(json['OutputStage'] as Map<String, dynamic>)
          : null,
      rows: json['Rows'] != null
          ? QueryRuntimeStatisticsRows.fromJson(
              json['Rows'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? QueryRuntimeStatisticsTimeline.fromJson(
              json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outputStage = this.outputStage;
    final rows = this.rows;
    final timeline = this.timeline;
    return {
      if (outputStage != null) 'OutputStage': outputStage,
      if (rows != null) 'Rows': rows,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// Statistics such as input rows and bytes read by the query, rows and bytes
/// output by the query, and the number of rows written by the query.
class QueryRuntimeStatisticsRows {
  /// The number of bytes read to execute the query.
  final int? inputBytes;

  /// The number of rows read to execute the query.
  final int? inputRows;

  /// The number of bytes returned by the query.
  final int? outputBytes;

  /// The number of rows returned by the query.
  final int? outputRows;

  QueryRuntimeStatisticsRows({
    this.inputBytes,
    this.inputRows,
    this.outputBytes,
    this.outputRows,
  });

  factory QueryRuntimeStatisticsRows.fromJson(Map<String, dynamic> json) {
    return QueryRuntimeStatisticsRows(
      inputBytes: json['InputBytes'] as int?,
      inputRows: json['InputRows'] as int?,
      outputBytes: json['OutputBytes'] as int?,
      outputRows: json['OutputRows'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputBytes = this.inputBytes;
    final inputRows = this.inputRows;
    final outputBytes = this.outputBytes;
    final outputRows = this.outputRows;
    return {
      if (inputBytes != null) 'InputBytes': inputBytes,
      if (inputRows != null) 'InputRows': inputRows,
      if (outputBytes != null) 'OutputBytes': outputBytes,
      if (outputRows != null) 'OutputRows': outputRows,
    };
  }
}

/// Timeline statistics such as query queue time, planning time, execution time,
/// service processing time, and total execution time.
class QueryRuntimeStatisticsTimeline {
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

  /// The number of milliseconds that Athena spends on preprocessing before it
  /// submits the query to the engine.
  final int? servicePreProcessingTimeInMillis;

  /// The number of milliseconds that Athena took to finalize and publish the
  /// query results after the query engine finished running the query.
  final int? serviceProcessingTimeInMillis;

  /// The number of milliseconds that Athena took to run the query.
  final int? totalExecutionTimeInMillis;

  QueryRuntimeStatisticsTimeline({
    this.engineExecutionTimeInMillis,
    this.queryPlanningTimeInMillis,
    this.queryQueueTimeInMillis,
    this.servicePreProcessingTimeInMillis,
    this.serviceProcessingTimeInMillis,
    this.totalExecutionTimeInMillis,
  });

  factory QueryRuntimeStatisticsTimeline.fromJson(Map<String, dynamic> json) {
    return QueryRuntimeStatisticsTimeline(
      engineExecutionTimeInMillis: json['EngineExecutionTimeInMillis'] as int?,
      queryPlanningTimeInMillis: json['QueryPlanningTimeInMillis'] as int?,
      queryQueueTimeInMillis: json['QueryQueueTimeInMillis'] as int?,
      servicePreProcessingTimeInMillis:
          json['ServicePreProcessingTimeInMillis'] as int?,
      serviceProcessingTimeInMillis:
          json['ServiceProcessingTimeInMillis'] as int?,
      totalExecutionTimeInMillis: json['TotalExecutionTimeInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineExecutionTimeInMillis = this.engineExecutionTimeInMillis;
    final queryPlanningTimeInMillis = this.queryPlanningTimeInMillis;
    final queryQueueTimeInMillis = this.queryQueueTimeInMillis;
    final servicePreProcessingTimeInMillis =
        this.servicePreProcessingTimeInMillis;
    final serviceProcessingTimeInMillis = this.serviceProcessingTimeInMillis;
    final totalExecutionTimeInMillis = this.totalExecutionTimeInMillis;
    return {
      if (engineExecutionTimeInMillis != null)
        'EngineExecutionTimeInMillis': engineExecutionTimeInMillis,
      if (queryPlanningTimeInMillis != null)
        'QueryPlanningTimeInMillis': queryPlanningTimeInMillis,
      if (queryQueueTimeInMillis != null)
        'QueryQueueTimeInMillis': queryQueueTimeInMillis,
      if (servicePreProcessingTimeInMillis != null)
        'ServicePreProcessingTimeInMillis': servicePreProcessingTimeInMillis,
      if (serviceProcessingTimeInMillis != null)
        'ServiceProcessingTimeInMillis': serviceProcessingTimeInMillis,
      if (totalExecutionTimeInMillis != null)
        'TotalExecutionTimeInMillis': totalExecutionTimeInMillis,
    };
  }
}

/// Stage statistics such as input and output rows and bytes, execution time and
/// stage state. This information also includes substages and the query stage
/// plan.
class QueryStage {
  /// Time taken to execute this stage.
  final int? executionTime;

  /// The number of bytes input into the stage for execution.
  final int? inputBytes;

  /// The number of rows input into the stage for execution.
  final int? inputRows;

  /// The number of bytes output from the stage after execution.
  final int? outputBytes;

  /// The number of rows output from the stage after execution.
  final int? outputRows;

  /// Stage plan information such as name, identifier, sub plans, and source
  /// stages.
  final QueryStagePlanNode? queryStagePlan;

  /// The identifier for a stage.
  final int? stageId;

  /// State of the stage after query execution.
  final String? state;

  /// List of sub query stages that form this stage execution plan.
  final List<QueryStage>? subStages;

  QueryStage({
    this.executionTime,
    this.inputBytes,
    this.inputRows,
    this.outputBytes,
    this.outputRows,
    this.queryStagePlan,
    this.stageId,
    this.state,
    this.subStages,
  });

  factory QueryStage.fromJson(Map<String, dynamic> json) {
    return QueryStage(
      executionTime: json['ExecutionTime'] as int?,
      inputBytes: json['InputBytes'] as int?,
      inputRows: json['InputRows'] as int?,
      outputBytes: json['OutputBytes'] as int?,
      outputRows: json['OutputRows'] as int?,
      queryStagePlan: json['QueryStagePlan'] != null
          ? QueryStagePlanNode.fromJson(
              json['QueryStagePlan'] as Map<String, dynamic>)
          : null,
      stageId: json['StageId'] as int?,
      state: json['State'] as String?,
      subStages: (json['SubStages'] as List?)
          ?.whereNotNull()
          .map((e) => QueryStage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionTime = this.executionTime;
    final inputBytes = this.inputBytes;
    final inputRows = this.inputRows;
    final outputBytes = this.outputBytes;
    final outputRows = this.outputRows;
    final queryStagePlan = this.queryStagePlan;
    final stageId = this.stageId;
    final state = this.state;
    final subStages = this.subStages;
    return {
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (inputBytes != null) 'InputBytes': inputBytes,
      if (inputRows != null) 'InputRows': inputRows,
      if (outputBytes != null) 'OutputBytes': outputBytes,
      if (outputRows != null) 'OutputRows': outputRows,
      if (queryStagePlan != null) 'QueryStagePlan': queryStagePlan,
      if (stageId != null) 'StageId': stageId,
      if (state != null) 'State': state,
      if (subStages != null) 'SubStages': subStages,
    };
  }
}

/// Stage plan information such as name, identifier, sub plans, and remote
/// sources.
class QueryStagePlanNode {
  /// Stage plan information such as name, identifier, sub plans, and remote
  /// sources of child plan nodes/
  final List<QueryStagePlanNode>? children;

  /// Information about the operation this query stage plan node is performing.
  final String? identifier;

  /// Name of the query stage plan that describes the operation this stage is
  /// performing as part of query execution.
  final String? name;

  /// Source plan node IDs.
  final List<String>? remoteSources;

  QueryStagePlanNode({
    this.children,
    this.identifier,
    this.name,
    this.remoteSources,
  });

  factory QueryStagePlanNode.fromJson(Map<String, dynamic> json) {
    return QueryStagePlanNode(
      children: (json['Children'] as List?)
          ?.whereNotNull()
          .map((e) => QueryStagePlanNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      identifier: json['Identifier'] as String?,
      name: json['Name'] as String?,
      remoteSources: (json['RemoteSources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final children = this.children;
    final identifier = this.identifier;
    final name = this.name;
    final remoteSources = this.remoteSources;
    return {
      if (children != null) 'Children': children,
      if (identifier != null) 'Identifier': identifier,
      if (name != null) 'Name': name,
      if (remoteSources != null) 'RemoteSources': remoteSources,
    };
  }
}

/// The location in Amazon S3 where query and calculation results are stored and
/// the encryption option, if any, used for query and calculation results. These
/// are known as "client-side settings". If workgroup settings override
/// client-side settings, then the query uses the workgroup settings.
class ResultConfiguration {
  /// Indicates that an Amazon S3 canned ACL should be set to control ownership of
  /// stored query results. Currently the only supported canned ACL is
  /// <code>BUCKET_OWNER_FULL_CONTROL</code>. This is a client-side setting. If
  /// workgroup settings override client-side settings, then the query uses the
  /// ACL configuration that is specified for the workgroup, and also uses the
  /// location for storing query results specified in the workgroup. For more
  /// information, see <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final AclConfiguration? aclConfiguration;

  /// If query and calculation results are encrypted in Amazon S3, indicates the
  /// encryption option used (for example, <code>SSE_KMS</code> or
  /// <code>CSE_KMS</code>) and key information. This is a client-side setting. If
  /// workgroup settings override client-side settings, then the query uses the
  /// encryption configuration that is specified for the workgroup, and also uses
  /// the location for storing query results specified in the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a> and <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The Amazon Web Services account ID that you expect to be the owner of the
  /// Amazon S3 bucket specified by <a>ResultConfiguration$OutputLocation</a>. If
  /// set, Athena uses the value for <code>ExpectedBucketOwner</code> when it
  /// makes Amazon S3 calls to your specified output location. If the
  /// <code>ExpectedBucketOwner</code> Amazon Web Services account ID does not
  /// match the actual owner of the Amazon S3 bucket, the call fails with a
  /// permissions error.
  ///
  /// This is a client-side setting. If workgroup settings override client-side
  /// settings, then the query uses the <code>ExpectedBucketOwner</code> setting
  /// that is specified for the workgroup, and also uses the location for storing
  /// query results specified in the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a> and <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final String? expectedBucketOwner;

  /// The location in Amazon S3 where your query and calculation results are
  /// stored, such as <code>s3://path/to/query/bucket/</code>. To run the query,
  /// you must specify the query results location using one of the ways: either
  /// for individual queries using either this setting (client-side), or in the
  /// workgroup, using <a>WorkGroupConfiguration</a>. If none of them is set,
  /// Athena issues an error that no output location is provided. If workgroup
  /// settings override client-side settings, then the query uses the settings
  /// specified for the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  final String? outputLocation;

  ResultConfiguration({
    this.aclConfiguration,
    this.encryptionConfiguration,
    this.expectedBucketOwner,
    this.outputLocation,
  });

  factory ResultConfiguration.fromJson(Map<String, dynamic> json) {
    return ResultConfiguration(
      aclConfiguration: json['AclConfiguration'] != null
          ? AclConfiguration.fromJson(
              json['AclConfiguration'] as Map<String, dynamic>)
          : null,
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      expectedBucketOwner: json['ExpectedBucketOwner'] as String?,
      outputLocation: json['OutputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aclConfiguration = this.aclConfiguration;
    final encryptionConfiguration = this.encryptionConfiguration;
    final expectedBucketOwner = this.expectedBucketOwner;
    final outputLocation = this.outputLocation;
    return {
      if (aclConfiguration != null) 'AclConfiguration': aclConfiguration,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (expectedBucketOwner != null)
        'ExpectedBucketOwner': expectedBucketOwner,
      if (outputLocation != null) 'OutputLocation': outputLocation,
    };
  }
}

/// The information about the updates in the query results, such as output
/// location and encryption configuration for the query results.
class ResultConfigurationUpdates {
  /// The ACL configuration for the query results.
  final AclConfiguration? aclConfiguration;

  /// The encryption configuration for query and calculation results.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The Amazon Web Services account ID that you expect to be the owner of the
  /// Amazon S3 bucket specified by <a>ResultConfiguration$OutputLocation</a>. If
  /// set, Athena uses the value for <code>ExpectedBucketOwner</code> when it
  /// makes Amazon S3 calls to your specified output location. If the
  /// <code>ExpectedBucketOwner</code> Amazon Web Services account ID does not
  /// match the actual owner of the Amazon S3 bucket, the call fails with a
  /// permissions error.
  ///
  /// If workgroup settings override client-side settings, then the query uses the
  /// <code>ExpectedBucketOwner</code> setting that is specified for the
  /// workgroup, and also uses the location for storing query results specified in
  /// the workgroup. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a> and <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final String? expectedBucketOwner;

  /// The location in Amazon S3 where your query and calculation results are
  /// stored, such as <code>s3://path/to/query/bucket/</code>. If workgroup
  /// settings override client-side settings, then the query uses the location for
  /// the query results and the encryption configuration that are specified for
  /// the workgroup. The "workgroup settings override" is specified in
  /// <code>EnforceWorkGroupConfiguration</code> (true/false) in the
  /// <code>WorkGroupConfiguration</code>. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  final String? outputLocation;

  /// If set to <code>true</code>, indicates that the previously-specified ACL
  /// configuration for queries in this workgroup should be ignored and set to
  /// null. If set to <code>false</code> or not set, and a value is present in the
  /// <code>AclConfiguration</code> of <code>ResultConfigurationUpdates</code>,
  /// the <code>AclConfiguration</code> in the workgroup's
  /// <code>ResultConfiguration</code> is updated with the new value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeAclConfiguration;

  /// If set to "true", indicates that the previously-specified encryption
  /// configuration (also known as the client-side setting) for queries in this
  /// workgroup should be ignored and set to null. If set to "false" or not set,
  /// and a value is present in the <code>EncryptionConfiguration</code> in
  /// <code>ResultConfigurationUpdates</code> (the client-side setting), the
  /// <code>EncryptionConfiguration</code> in the workgroup's
  /// <code>ResultConfiguration</code> will be updated with the new value. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeEncryptionConfiguration;

  /// If set to "true", removes the Amazon Web Services account ID previously
  /// specified for <a>ResultConfiguration$ExpectedBucketOwner</a>. If set to
  /// "false" or not set, and a value is present in the
  /// <code>ExpectedBucketOwner</code> in <code>ResultConfigurationUpdates</code>
  /// (the client-side setting), the <code>ExpectedBucketOwner</code> in the
  /// workgroup's <code>ResultConfiguration</code> is updated with the new value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeExpectedBucketOwner;

  /// If set to "true", indicates that the previously-specified query results
  /// location (also known as a client-side setting) for queries in this workgroup
  /// should be ignored and set to null. If set to "false" or not set, and a value
  /// is present in the <code>OutputLocation</code> in
  /// <code>ResultConfigurationUpdates</code> (the client-side setting), the
  /// <code>OutputLocation</code> in the workgroup's
  /// <code>ResultConfiguration</code> will be updated with the new value. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup
  /// Settings Override Client-Side Settings</a>.
  final bool? removeOutputLocation;

  ResultConfigurationUpdates({
    this.aclConfiguration,
    this.encryptionConfiguration,
    this.expectedBucketOwner,
    this.outputLocation,
    this.removeAclConfiguration,
    this.removeEncryptionConfiguration,
    this.removeExpectedBucketOwner,
    this.removeOutputLocation,
  });

  Map<String, dynamic> toJson() {
    final aclConfiguration = this.aclConfiguration;
    final encryptionConfiguration = this.encryptionConfiguration;
    final expectedBucketOwner = this.expectedBucketOwner;
    final outputLocation = this.outputLocation;
    final removeAclConfiguration = this.removeAclConfiguration;
    final removeEncryptionConfiguration = this.removeEncryptionConfiguration;
    final removeExpectedBucketOwner = this.removeExpectedBucketOwner;
    final removeOutputLocation = this.removeOutputLocation;
    return {
      if (aclConfiguration != null) 'AclConfiguration': aclConfiguration,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (expectedBucketOwner != null)
        'ExpectedBucketOwner': expectedBucketOwner,
      if (outputLocation != null) 'OutputLocation': outputLocation,
      if (removeAclConfiguration != null)
        'RemoveAclConfiguration': removeAclConfiguration,
      if (removeEncryptionConfiguration != null)
        'RemoveEncryptionConfiguration': removeEncryptionConfiguration,
      if (removeExpectedBucketOwner != null)
        'RemoveExpectedBucketOwner': removeExpectedBucketOwner,
      if (removeOutputLocation != null)
        'RemoveOutputLocation': removeOutputLocation,
    };
  }
}

/// Specifies whether previous query results are reused, and if so, their
/// maximum age.
class ResultReuseByAgeConfiguration {
  /// True if previous query results can be reused when the query is run;
  /// otherwise, false. The default is false.
  final bool enabled;

  /// Specifies, in minutes, the maximum age of a previous query result that
  /// Athena should consider for reuse. The default is 60.
  final int? maxAgeInMinutes;

  ResultReuseByAgeConfiguration({
    required this.enabled,
    this.maxAgeInMinutes,
  });

  factory ResultReuseByAgeConfiguration.fromJson(Map<String, dynamic> json) {
    return ResultReuseByAgeConfiguration(
      enabled: json['Enabled'] as bool,
      maxAgeInMinutes: json['MaxAgeInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final maxAgeInMinutes = this.maxAgeInMinutes;
    return {
      'Enabled': enabled,
      if (maxAgeInMinutes != null) 'MaxAgeInMinutes': maxAgeInMinutes,
    };
  }
}

/// Specifies the query result reuse behavior for the query.
class ResultReuseConfiguration {
  /// Specifies whether previous query results are reused, and if so, their
  /// maximum age.
  final ResultReuseByAgeConfiguration? resultReuseByAgeConfiguration;

  ResultReuseConfiguration({
    this.resultReuseByAgeConfiguration,
  });

  factory ResultReuseConfiguration.fromJson(Map<String, dynamic> json) {
    return ResultReuseConfiguration(
      resultReuseByAgeConfiguration:
          json['ResultReuseByAgeConfiguration'] != null
              ? ResultReuseByAgeConfiguration.fromJson(
                  json['ResultReuseByAgeConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resultReuseByAgeConfiguration = this.resultReuseByAgeConfiguration;
    return {
      if (resultReuseByAgeConfiguration != null)
        'ResultReuseByAgeConfiguration': resultReuseByAgeConfiguration,
    };
  }
}

/// Contains information about whether the result of a previous query was
/// reused.
class ResultReuseInformation {
  /// True if a previous query result was reused; false if the result was
  /// generated from a new run of the query.
  final bool reusedPreviousResult;

  ResultReuseInformation({
    required this.reusedPreviousResult,
  });

  factory ResultReuseInformation.fromJson(Map<String, dynamic> json) {
    return ResultReuseInformation(
      reusedPreviousResult: json['ReusedPreviousResult'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final reusedPreviousResult = this.reusedPreviousResult;
    return {
      'ReusedPreviousResult': reusedPreviousResult,
    };
  }
}

/// The metadata and rows that make up a query result set. The metadata
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

/// The rows that make up a query result table.
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

enum S3AclOption {
  bucketOwnerFullControl,
}

extension S3AclOptionValueExtension on S3AclOption {
  String toValue() {
    switch (this) {
      case S3AclOption.bucketOwnerFullControl:
        return 'BUCKET_OWNER_FULL_CONTROL';
    }
  }
}

extension S3AclOptionFromString on String {
  S3AclOption toS3AclOption() {
    switch (this) {
      case 'BUCKET_OWNER_FULL_CONTROL':
        return S3AclOption.bucketOwnerFullControl;
    }
    throw Exception('$this is not known in enum S3AclOption');
  }
}

/// Contains session configuration information.
class SessionConfiguration {
  final EncryptionConfiguration? encryptionConfiguration;

  /// The ARN of the execution role used to access user resources for Spark
  /// sessions and Identity Center enabled workgroups. This property applies only
  /// to Spark enabled workgroups and Identity Center enabled workgroups.
  final String? executionRole;

  /// The idle timeout in seconds for the session.
  final int? idleTimeoutSeconds;

  /// The Amazon S3 location that stores information for the notebook.
  final String? workingDirectory;

  SessionConfiguration({
    this.encryptionConfiguration,
    this.executionRole,
    this.idleTimeoutSeconds,
    this.workingDirectory,
  });

  factory SessionConfiguration.fromJson(Map<String, dynamic> json) {
    return SessionConfiguration(
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      executionRole: json['ExecutionRole'] as String?,
      idleTimeoutSeconds: json['IdleTimeoutSeconds'] as int?,
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final executionRole = this.executionRole;
    final idleTimeoutSeconds = this.idleTimeoutSeconds;
    final workingDirectory = this.workingDirectory;
    return {
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (executionRole != null) 'ExecutionRole': executionRole,
      if (idleTimeoutSeconds != null) 'IdleTimeoutSeconds': idleTimeoutSeconds,
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

enum SessionState {
  creating,
  created,
  idle,
  busy,
  terminating,
  terminated,
  degraded,
  failed,
}

extension SessionStateValueExtension on SessionState {
  String toValue() {
    switch (this) {
      case SessionState.creating:
        return 'CREATING';
      case SessionState.created:
        return 'CREATED';
      case SessionState.idle:
        return 'IDLE';
      case SessionState.busy:
        return 'BUSY';
      case SessionState.terminating:
        return 'TERMINATING';
      case SessionState.terminated:
        return 'TERMINATED';
      case SessionState.degraded:
        return 'DEGRADED';
      case SessionState.failed:
        return 'FAILED';
    }
  }
}

extension SessionStateFromString on String {
  SessionState toSessionState() {
    switch (this) {
      case 'CREATING':
        return SessionState.creating;
      case 'CREATED':
        return SessionState.created;
      case 'IDLE':
        return SessionState.idle;
      case 'BUSY':
        return SessionState.busy;
      case 'TERMINATING':
        return SessionState.terminating;
      case 'TERMINATED':
        return SessionState.terminated;
      case 'DEGRADED':
        return SessionState.degraded;
      case 'FAILED':
        return SessionState.failed;
    }
    throw Exception('$this is not known in enum SessionState');
  }
}

/// Contains statistics for a session.
class SessionStatistics {
  /// The data processing unit execution time for a session in milliseconds.
  final int? dpuExecutionInMillis;

  SessionStatistics({
    this.dpuExecutionInMillis,
  });

  factory SessionStatistics.fromJson(Map<String, dynamic> json) {
    return SessionStatistics(
      dpuExecutionInMillis: json['DpuExecutionInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dpuExecutionInMillis = this.dpuExecutionInMillis;
    return {
      if (dpuExecutionInMillis != null)
        'DpuExecutionInMillis': dpuExecutionInMillis,
    };
  }
}

/// Contains information about the status of a session.
class SessionStatus {
  /// The date and time that the session ended.
  final DateTime? endDateTime;

  /// The date and time starting at which the session became idle. Can be empty if
  /// the session is not currently idle.
  final DateTime? idleSinceDateTime;

  /// The most recent date and time that the session was modified.
  final DateTime? lastModifiedDateTime;

  /// The date and time that the session started.
  final DateTime? startDateTime;

  /// The state of the session. A description of each state follows.
  ///
  /// <code>CREATING</code> - The session is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The session has been started.
  ///
  /// <code>IDLE</code> - The session is able to accept a calculation.
  ///
  /// <code>BUSY</code> - The session is processing another task and is unable to
  /// accept a calculation.
  ///
  /// <code>TERMINATING</code> - The session is in the process of shutting down.
  ///
  /// <code>TERMINATED</code> - The session and its resources are no longer
  /// running.
  ///
  /// <code>DEGRADED</code> - The session has no healthy coordinators.
  ///
  /// <code>FAILED</code> - Due to a failure, the session and its resources are no
  /// longer running.
  final SessionState? state;

  /// The reason for the session state change (for example, canceled because the
  /// session was terminated).
  final String? stateChangeReason;

  SessionStatus({
    this.endDateTime,
    this.idleSinceDateTime,
    this.lastModifiedDateTime,
    this.startDateTime,
    this.state,
    this.stateChangeReason,
  });

  factory SessionStatus.fromJson(Map<String, dynamic> json) {
    return SessionStatus(
      endDateTime: timeStampFromJson(json['EndDateTime']),
      idleSinceDateTime: timeStampFromJson(json['IdleSinceDateTime']),
      lastModifiedDateTime: timeStampFromJson(json['LastModifiedDateTime']),
      startDateTime: timeStampFromJson(json['StartDateTime']),
      state: (json['State'] as String?)?.toSessionState(),
      stateChangeReason: json['StateChangeReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endDateTime = this.endDateTime;
    final idleSinceDateTime = this.idleSinceDateTime;
    final lastModifiedDateTime = this.lastModifiedDateTime;
    final startDateTime = this.startDateTime;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    return {
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (idleSinceDateTime != null)
        'IdleSinceDateTime': unixTimestampToJson(idleSinceDateTime),
      if (lastModifiedDateTime != null)
        'LastModifiedDateTime': unixTimestampToJson(lastModifiedDateTime),
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
    };
  }
}

/// Contains summary information about a session.
class SessionSummary {
  /// The session description.
  final String? description;

  /// The engine version used by the session (for example, <code>PySpark engine
  /// version 3</code>).
  final EngineVersion? engineVersion;

  /// The notebook version.
  final String? notebookVersion;

  /// The session ID.
  final String? sessionId;

  /// Contains information about the session status.
  final SessionStatus? status;

  SessionSummary({
    this.description,
    this.engineVersion,
    this.notebookVersion,
    this.sessionId,
    this.status,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      description: json['Description'] as String?,
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      notebookVersion: json['NotebookVersion'] as String?,
      sessionId: json['SessionId'] as String?,
      status: json['Status'] != null
          ? SessionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final engineVersion = this.engineVersion;
    final notebookVersion = this.notebookVersion;
    final sessionId = this.sessionId;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (notebookVersion != null) 'NotebookVersion': notebookVersion,
      if (sessionId != null) 'SessionId': sessionId,
      if (status != null) 'Status': status,
    };
  }
}

class StartCalculationExecutionResponse {
  /// The calculation execution UUID.
  final String? calculationExecutionId;

  /// <code>CREATING</code> - The calculation is in the process of being created.
  ///
  /// <code>CREATED</code> - The calculation has been created and is ready to run.
  ///
  /// <code>QUEUED</code> - The calculation has been queued for processing.
  ///
  /// <code>RUNNING</code> - The calculation is running.
  ///
  /// <code>CANCELING</code> - A request to cancel the calculation has been
  /// received and the system is working to stop it.
  ///
  /// <code>CANCELED</code> - The calculation is no longer running as the result
  /// of a cancel request.
  ///
  /// <code>COMPLETED</code> - The calculation has completed without error.
  ///
  /// <code>FAILED</code> - The calculation failed and is no longer running.
  final CalculationExecutionState? state;

  StartCalculationExecutionResponse({
    this.calculationExecutionId,
    this.state,
  });

  factory StartCalculationExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartCalculationExecutionResponse(
      calculationExecutionId: json['CalculationExecutionId'] as String?,
      state: (json['State'] as String?)?.toCalculationExecutionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final calculationExecutionId = this.calculationExecutionId;
    final state = this.state;
    return {
      if (calculationExecutionId != null)
        'CalculationExecutionId': calculationExecutionId,
      if (state != null) 'State': state.toValue(),
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

class StartSessionResponse {
  /// The session ID.
  final String? sessionId;

  /// The state of the session. A description of each state follows.
  ///
  /// <code>CREATING</code> - The session is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The session has been started.
  ///
  /// <code>IDLE</code> - The session is able to accept a calculation.
  ///
  /// <code>BUSY</code> - The session is processing another task and is unable to
  /// accept a calculation.
  ///
  /// <code>TERMINATING</code> - The session is in the process of shutting down.
  ///
  /// <code>TERMINATED</code> - The session and its resources are no longer
  /// running.
  ///
  /// <code>DEGRADED</code> - The session has no healthy coordinators.
  ///
  /// <code>FAILED</code> - Due to a failure, the session and its resources are no
  /// longer running.
  final SessionState? state;

  StartSessionResponse({
    this.sessionId,
    this.state,
  });

  factory StartSessionResponse.fromJson(Map<String, dynamic> json) {
    return StartSessionResponse(
      sessionId: json['SessionId'] as String?,
      state: (json['State'] as String?)?.toSessionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final state = this.state;
    return {
      if (sessionId != null) 'SessionId': sessionId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum StatementType {
  ddl,
  dml,
  utility,
}

extension StatementTypeValueExtension on StatementType {
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

extension StatementTypeFromString on String {
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

class StopCalculationExecutionResponse {
  /// <code>CREATING</code> - The calculation is in the process of being created.
  ///
  /// <code>CREATED</code> - The calculation has been created and is ready to run.
  ///
  /// <code>QUEUED</code> - The calculation has been queued for processing.
  ///
  /// <code>RUNNING</code> - The calculation is running.
  ///
  /// <code>CANCELING</code> - A request to cancel the calculation has been
  /// received and the system is working to stop it.
  ///
  /// <code>CANCELED</code> - The calculation is no longer running as the result
  /// of a cancel request.
  ///
  /// <code>COMPLETED</code> - The calculation has completed without error.
  ///
  /// <code>FAILED</code> - The calculation failed and is no longer running.
  final CalculationExecutionState? state;

  StopCalculationExecutionResponse({
    this.state,
  });

  factory StopCalculationExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StopCalculationExecutionResponse(
      state: (json['State'] as String?)?.toCalculationExecutionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'State': state.toValue(),
    };
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

/// A label that you assign to a resource. Athena resources include workgroups,
/// data catalogs, and capacity reservations. Each tag consists of a key and an
/// optional value, both of which you define. For example, you can use tags to
/// categorize Athena resources by purpose, owner, or environment. Use a
/// consistent set of tag keys to make it easier to search and filter the
/// resources in your account. For best practices, see <a
/// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
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

class TerminateSessionResponse {
  /// The state of the session. A description of each state follows.
  ///
  /// <code>CREATING</code> - The session is being started, including acquiring
  /// resources.
  ///
  /// <code>CREATED</code> - The session has been started.
  ///
  /// <code>IDLE</code> - The session is able to accept a calculation.
  ///
  /// <code>BUSY</code> - The session is processing another task and is unable to
  /// accept a calculation.
  ///
  /// <code>TERMINATING</code> - The session is in the process of shutting down.
  ///
  /// <code>TERMINATED</code> - The session and its resources are no longer
  /// running.
  ///
  /// <code>DEGRADED</code> - The session has no healthy coordinators.
  ///
  /// <code>FAILED</code> - Due to a failure, the session and its resources are no
  /// longer running.
  final SessionState? state;

  TerminateSessionResponse({
    this.state,
  });

  factory TerminateSessionResponse.fromJson(Map<String, dynamic> json) {
    return TerminateSessionResponse(
      state: (json['State'] as String?)?.toSessionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'State': state.toValue(),
    };
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

/// The name of a prepared statement that could not be returned.
class UnprocessedPreparedStatementName {
  /// The error code returned when the request for the prepared statement failed.
  final String? errorCode;

  /// The error message containing the reason why the prepared statement could not
  /// be returned. The following error messages are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>INVALID_INPUT</code> - The name of the prepared statement that was
  /// provided is not valid (for example, the name is too long).
  /// </li>
  /// <li>
  /// <code>STATEMENT_NOT_FOUND</code> - A prepared statement with the name
  /// provided could not be found.
  /// </li>
  /// <li>
  /// <code>UNAUTHORIZED</code> - The requester does not have permission to access
  /// the workgroup that contains the prepared statement.
  /// </li>
  /// </ul>
  final String? errorMessage;

  /// The name of a prepared statement that could not be returned due to an error.
  final String? statementName;

  UnprocessedPreparedStatementName({
    this.errorCode,
    this.errorMessage,
    this.statementName,
  });

  factory UnprocessedPreparedStatementName.fromJson(Map<String, dynamic> json) {
    return UnprocessedPreparedStatementName(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      statementName: json['StatementName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final statementName = this.statementName;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (statementName != null) 'StatementName': statementName,
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

class UpdateCapacityReservationOutput {
  UpdateCapacityReservationOutput();

  factory UpdateCapacityReservationOutput.fromJson(Map<String, dynamic> _) {
    return UpdateCapacityReservationOutput();
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

class UpdateNamedQueryOutput {
  UpdateNamedQueryOutput();

  factory UpdateNamedQueryOutput.fromJson(Map<String, dynamic> _) {
    return UpdateNamedQueryOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNotebookMetadataOutput {
  UpdateNotebookMetadataOutput();

  factory UpdateNotebookMetadataOutput.fromJson(Map<String, dynamic> _) {
    return UpdateNotebookMetadataOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNotebookOutput {
  UpdateNotebookOutput();

  factory UpdateNotebookOutput.fromJson(Map<String, dynamic> _) {
    return UpdateNotebookOutput();
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
/// override is specified in <code>EnforceWorkGroupConfiguration</code>
/// (true/false) in the <code>WorkGroupConfiguration</code>. See
/// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
class WorkGroup {
  /// The workgroup name.
  final String name;

  /// The configuration of the workgroup, which includes the location in Amazon S3
  /// where query and calculation results are stored, the encryption
  /// configuration, if any, used for query and calculation results; whether the
  /// Amazon CloudWatch Metrics are enabled for the workgroup; whether workgroup
  /// settings override client-side settings; and the data usage limits for the
  /// amount of data scanned per query or per workgroup. The workgroup settings
  /// override is specified in <code>EnforceWorkGroupConfiguration</code>
  /// (true/false) in the <code>WorkGroupConfiguration</code>. See
  /// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
  final WorkGroupConfiguration? configuration;

  /// The date and time the workgroup was created.
  final DateTime? creationTime;

  /// The workgroup description.
  final String? description;

  /// The ARN of the IAM Identity Center enabled application associated with the
  /// workgroup.
  final String? identityCenterApplicationArn;

  /// The state of the workgroup: ENABLED or DISABLED.
  final WorkGroupState? state;

  WorkGroup({
    required this.name,
    this.configuration,
    this.creationTime,
    this.description,
    this.identityCenterApplicationArn,
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
      identityCenterApplicationArn:
          json['IdentityCenterApplicationArn'] as String?,
      state: (json['State'] as String?)?.toWorkGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final configuration = this.configuration;
    final creationTime = this.creationTime;
    final description = this.description;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final state = this.state;
    return {
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (identityCenterApplicationArn != null)
        'IdentityCenterApplicationArn': identityCenterApplicationArn,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The configuration of the workgroup, which includes the location in Amazon S3
/// where query and calculation results are stored, the encryption option, if
/// any, used for query and calculation results, whether the Amazon CloudWatch
/// Metrics are enabled for the workgroup and whether workgroup settings
/// override query settings, and the data usage limits for the amount of data
/// scanned per query or per workgroup. The workgroup settings override is
/// specified in <code>EnforceWorkGroupConfiguration</code> (true/false) in the
/// <code>WorkGroupConfiguration</code>. See
/// <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.
class WorkGroupConfiguration {
  /// Specifies a user defined JSON string that is passed to the notebook engine.
  final String? additionalConfiguration;

  /// The upper data usage limit (cutoff) for the amount of bytes a single query
  /// in a workgroup is allowed to scan.
  final int? bytesScannedCutoffPerQuery;

  /// Specifies the KMS key that is used to encrypt the user's data stores in
  /// Athena. This setting does not apply to Athena SQL workgroups.
  final CustomerContentEncryptionConfiguration?
      customerContentEncryptionConfiguration;

  /// Enforces a minimal level of encryption for the workgroup for query and
  /// calculation results that are written to Amazon S3. When enabled, workgroup
  /// users can set encryption only to the minimum level set by the administrator
  /// or higher when they submit queries.
  ///
  /// The <code>EnforceWorkGroupConfiguration</code> setting takes precedence over
  /// the <code>EnableMinimumEncryptionConfiguration</code> flag. This means that
  /// if <code>EnforceWorkGroupConfiguration</code> is true, the
  /// <code>EnableMinimumEncryptionConfiguration</code> flag is ignored, and the
  /// workgroup configuration for encryption is used.
  final bool? enableMinimumEncryptionConfiguration;

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

  /// The ARN of the execution role used to access user resources for Spark
  /// sessions and IAM Identity Center enabled workgroups. This property applies
  /// only to Spark enabled workgroups and IAM Identity Center enabled workgroups.
  /// The property is required for IAM Identity Center enabled workgroups.
  final String? executionRole;

  /// Specifies whether the workgroup is IAM Identity Center supported.
  final IdentityCenterConfiguration? identityCenterConfiguration;

  /// Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.
  final bool? publishCloudWatchMetricsEnabled;

  /// Specifies whether Amazon S3 access grants are enabled for query results.
  final QueryResultsS3AccessGrantsConfiguration?
      queryResultsS3AccessGrantsConfiguration;

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
  /// S3 where query and calculation results are stored and the encryption option,
  /// if any, used for query and calculation results. To run the query, you must
  /// specify the query results location using one of the ways: either in the
  /// workgroup using this setting, or for individual queries (client-side), using
  /// <a>ResultConfiguration$OutputLocation</a>. If none of them is set, Athena
  /// issues an error that no output location is provided.
  final ResultConfiguration? resultConfiguration;

  WorkGroupConfiguration({
    this.additionalConfiguration,
    this.bytesScannedCutoffPerQuery,
    this.customerContentEncryptionConfiguration,
    this.enableMinimumEncryptionConfiguration,
    this.enforceWorkGroupConfiguration,
    this.engineVersion,
    this.executionRole,
    this.identityCenterConfiguration,
    this.publishCloudWatchMetricsEnabled,
    this.queryResultsS3AccessGrantsConfiguration,
    this.requesterPaysEnabled,
    this.resultConfiguration,
  });

  factory WorkGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkGroupConfiguration(
      additionalConfiguration: json['AdditionalConfiguration'] as String?,
      bytesScannedCutoffPerQuery: json['BytesScannedCutoffPerQuery'] as int?,
      customerContentEncryptionConfiguration:
          json['CustomerContentEncryptionConfiguration'] != null
              ? CustomerContentEncryptionConfiguration.fromJson(
                  json['CustomerContentEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      enableMinimumEncryptionConfiguration:
          json['EnableMinimumEncryptionConfiguration'] as bool?,
      enforceWorkGroupConfiguration:
          json['EnforceWorkGroupConfiguration'] as bool?,
      engineVersion: json['EngineVersion'] != null
          ? EngineVersion.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      executionRole: json['ExecutionRole'] as String?,
      identityCenterConfiguration: json['IdentityCenterConfiguration'] != null
          ? IdentityCenterConfiguration.fromJson(
              json['IdentityCenterConfiguration'] as Map<String, dynamic>)
          : null,
      publishCloudWatchMetricsEnabled:
          json['PublishCloudWatchMetricsEnabled'] as bool?,
      queryResultsS3AccessGrantsConfiguration:
          json['QueryResultsS3AccessGrantsConfiguration'] != null
              ? QueryResultsS3AccessGrantsConfiguration.fromJson(
                  json['QueryResultsS3AccessGrantsConfiguration']
                      as Map<String, dynamic>)
              : null,
      requesterPaysEnabled: json['RequesterPaysEnabled'] as bool?,
      resultConfiguration: json['ResultConfiguration'] != null
          ? ResultConfiguration.fromJson(
              json['ResultConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final bytesScannedCutoffPerQuery = this.bytesScannedCutoffPerQuery;
    final customerContentEncryptionConfiguration =
        this.customerContentEncryptionConfiguration;
    final enableMinimumEncryptionConfiguration =
        this.enableMinimumEncryptionConfiguration;
    final enforceWorkGroupConfiguration = this.enforceWorkGroupConfiguration;
    final engineVersion = this.engineVersion;
    final executionRole = this.executionRole;
    final identityCenterConfiguration = this.identityCenterConfiguration;
    final publishCloudWatchMetricsEnabled =
        this.publishCloudWatchMetricsEnabled;
    final queryResultsS3AccessGrantsConfiguration =
        this.queryResultsS3AccessGrantsConfiguration;
    final requesterPaysEnabled = this.requesterPaysEnabled;
    final resultConfiguration = this.resultConfiguration;
    return {
      if (additionalConfiguration != null)
        'AdditionalConfiguration': additionalConfiguration,
      if (bytesScannedCutoffPerQuery != null)
        'BytesScannedCutoffPerQuery': bytesScannedCutoffPerQuery,
      if (customerContentEncryptionConfiguration != null)
        'CustomerContentEncryptionConfiguration':
            customerContentEncryptionConfiguration,
      if (enableMinimumEncryptionConfiguration != null)
        'EnableMinimumEncryptionConfiguration':
            enableMinimumEncryptionConfiguration,
      if (enforceWorkGroupConfiguration != null)
        'EnforceWorkGroupConfiguration': enforceWorkGroupConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (executionRole != null) 'ExecutionRole': executionRole,
      if (identityCenterConfiguration != null)
        'IdentityCenterConfiguration': identityCenterConfiguration,
      if (publishCloudWatchMetricsEnabled != null)
        'PublishCloudWatchMetricsEnabled': publishCloudWatchMetricsEnabled,
      if (queryResultsS3AccessGrantsConfiguration != null)
        'QueryResultsS3AccessGrantsConfiguration':
            queryResultsS3AccessGrantsConfiguration,
      if (requesterPaysEnabled != null)
        'RequesterPaysEnabled': requesterPaysEnabled,
      if (resultConfiguration != null)
        'ResultConfiguration': resultConfiguration,
    };
  }
}

/// The configuration information that will be updated for this workgroup, which
/// includes the location in Amazon S3 where query and calculation results are
/// stored, the encryption option, if any, used for query results, whether the
/// Amazon CloudWatch Metrics are enabled for the workgroup, whether the
/// workgroup settings override the client-side settings, and the data usage
/// limit for the amount of bytes scanned per query, if it is specified.
class WorkGroupConfigurationUpdates {
  /// Contains a user defined string in JSON format for a Spark-enabled workgroup.
  final String? additionalConfiguration;

  /// The upper limit (cutoff) for the amount of bytes a single query in a
  /// workgroup is allowed to scan.
  final int? bytesScannedCutoffPerQuery;
  final CustomerContentEncryptionConfiguration?
      customerContentEncryptionConfiguration;

  /// Enforces a minimal level of encryption for the workgroup for query and
  /// calculation results that are written to Amazon S3. When enabled, workgroup
  /// users can set encryption only to the minimum level set by the administrator
  /// or higher when they submit queries. This setting does not apply to
  /// Spark-enabled workgroups.
  ///
  /// The <code>EnforceWorkGroupConfiguration</code> setting takes precedence over
  /// the <code>EnableMinimumEncryptionConfiguration</code> flag. This means that
  /// if <code>EnforceWorkGroupConfiguration</code> is true, the
  /// <code>EnableMinimumEncryptionConfiguration</code> flag is ignored, and the
  /// workgroup configuration for encryption is used.
  final bool? enableMinimumEncryptionConfiguration;

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

  /// The ARN of the execution role used to access user resources for Spark
  /// sessions and Identity Center enabled workgroups. This property applies only
  /// to Spark enabled workgroups and Identity Center enabled workgroups.
  final String? executionRole;

  /// Indicates whether this workgroup enables publishing metrics to Amazon
  /// CloudWatch.
  final bool? publishCloudWatchMetricsEnabled;

  /// Specifies whether Amazon S3 access grants are enabled for query results.
  final QueryResultsS3AccessGrantsConfiguration?
      queryResultsS3AccessGrantsConfiguration;

  /// Indicates that the data usage control limit per query is removed.
  /// <a>WorkGroupConfiguration$BytesScannedCutoffPerQuery</a>
  final bool? removeBytesScannedCutoffPerQuery;

  /// Removes content encryption configuration from an Apache Spark-enabled Athena
  /// workgroup.
  final bool? removeCustomerContentEncryptionConfiguration;

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
    this.additionalConfiguration,
    this.bytesScannedCutoffPerQuery,
    this.customerContentEncryptionConfiguration,
    this.enableMinimumEncryptionConfiguration,
    this.enforceWorkGroupConfiguration,
    this.engineVersion,
    this.executionRole,
    this.publishCloudWatchMetricsEnabled,
    this.queryResultsS3AccessGrantsConfiguration,
    this.removeBytesScannedCutoffPerQuery,
    this.removeCustomerContentEncryptionConfiguration,
    this.requesterPaysEnabled,
    this.resultConfigurationUpdates,
  });

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final bytesScannedCutoffPerQuery = this.bytesScannedCutoffPerQuery;
    final customerContentEncryptionConfiguration =
        this.customerContentEncryptionConfiguration;
    final enableMinimumEncryptionConfiguration =
        this.enableMinimumEncryptionConfiguration;
    final enforceWorkGroupConfiguration = this.enforceWorkGroupConfiguration;
    final engineVersion = this.engineVersion;
    final executionRole = this.executionRole;
    final publishCloudWatchMetricsEnabled =
        this.publishCloudWatchMetricsEnabled;
    final queryResultsS3AccessGrantsConfiguration =
        this.queryResultsS3AccessGrantsConfiguration;
    final removeBytesScannedCutoffPerQuery =
        this.removeBytesScannedCutoffPerQuery;
    final removeCustomerContentEncryptionConfiguration =
        this.removeCustomerContentEncryptionConfiguration;
    final requesterPaysEnabled = this.requesterPaysEnabled;
    final resultConfigurationUpdates = this.resultConfigurationUpdates;
    return {
      if (additionalConfiguration != null)
        'AdditionalConfiguration': additionalConfiguration,
      if (bytesScannedCutoffPerQuery != null)
        'BytesScannedCutoffPerQuery': bytesScannedCutoffPerQuery,
      if (customerContentEncryptionConfiguration != null)
        'CustomerContentEncryptionConfiguration':
            customerContentEncryptionConfiguration,
      if (enableMinimumEncryptionConfiguration != null)
        'EnableMinimumEncryptionConfiguration':
            enableMinimumEncryptionConfiguration,
      if (enforceWorkGroupConfiguration != null)
        'EnforceWorkGroupConfiguration': enforceWorkGroupConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (executionRole != null) 'ExecutionRole': executionRole,
      if (publishCloudWatchMetricsEnabled != null)
        'PublishCloudWatchMetricsEnabled': publishCloudWatchMetricsEnabled,
      if (queryResultsS3AccessGrantsConfiguration != null)
        'QueryResultsS3AccessGrantsConfiguration':
            queryResultsS3AccessGrantsConfiguration,
      if (removeBytesScannedCutoffPerQuery != null)
        'RemoveBytesScannedCutoffPerQuery': removeBytesScannedCutoffPerQuery,
      if (removeCustomerContentEncryptionConfiguration != null)
        'RemoveCustomerContentEncryptionConfiguration':
            removeCustomerContentEncryptionConfiguration,
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

extension WorkGroupStateValueExtension on WorkGroupState {
  String toValue() {
    switch (this) {
      case WorkGroupState.enabled:
        return 'ENABLED';
      case WorkGroupState.disabled:
        return 'DISABLED';
    }
  }
}

extension WorkGroupStateFromString on String {
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

  /// The ARN of the IAM Identity Center enabled application associated with the
  /// workgroup.
  final String? identityCenterApplicationArn;

  /// The name of the workgroup.
  final String? name;

  /// The state of the workgroup.
  final WorkGroupState? state;

  WorkGroupSummary({
    this.creationTime,
    this.description,
    this.engineVersion,
    this.identityCenterApplicationArn,
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
      identityCenterApplicationArn:
          json['IdentityCenterApplicationArn'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toWorkGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final engineVersion = this.engineVersion;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final name = this.name;
    final state = this.state;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (identityCenterApplicationArn != null)
        'IdentityCenterApplicationArn': identityCenterApplicationArn,
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

class SessionAlreadyExistsException extends _s.GenericAwsException {
  SessionAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'SessionAlreadyExistsException',
            message: message);
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
  'SessionAlreadyExistsException': (type, message) =>
      SessionAlreadyExistsException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
