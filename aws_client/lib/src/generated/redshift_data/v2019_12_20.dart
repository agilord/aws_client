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

/// You can use the Amazon Redshift Data API to run queries on Amazon Redshift
/// tables. You can run SQL statements, which are committed if the statement
/// succeeds.
///
/// For more information about the Amazon Redshift Data API and CLI usage
/// examples, see <a
/// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
/// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
/// Guide</i>.
class RedshiftDataApi {
  final _s.JsonProtocol _protocol;
  RedshiftDataApi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'redshift-data',
            signingName: 'redshift-data',
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

  /// Runs one or more SQL statements, which can be data manipulation language
  /// (DML) or data definition language (DDL). Depending on the authorization
  /// method, use one of the following combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ActiveStatementsExceededException].
  /// May throw [BatchExecuteStatementException].
  ///
  /// Parameter [database] :
  /// The name of the database. This parameter is required when authenticating
  /// using either Secrets Manager or temporary credentials.
  ///
  /// Parameter [sqls] :
  /// One or more SQL statements to run. <pre><code> The SQL statements are run
  /// as a single transaction. They run serially in the order of the array.
  /// Subsequent SQL statements don't start until the previous statement in the
  /// array completes. If any SQL statement fails, then because they are run as
  /// one transaction, all work is rolled back.&lt;/p&gt; </code></pre>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [statementName] :
  /// The name of the SQL statements. You can name the SQL statements when you
  /// create them to identify the query.
  ///
  /// Parameter [withEvent] :
  /// A value that indicates whether to send an event to the Amazon EventBridge
  /// event bus after the SQL statements run.
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<BatchExecuteStatementOutput> batchExecuteStatement({
    required String database,
    required List<String> sqls,
    String? clientToken,
    String? clusterIdentifier,
    String? dbUser,
    String? secretArn,
    String? statementName,
    bool? withEvent,
    String? workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.BatchExecuteStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        'Sqls': sqls,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (dbUser != null) 'DbUser': dbUser,
        if (secretArn != null) 'SecretArn': secretArn,
        if (statementName != null) 'StatementName': statementName,
        if (withEvent != null) 'WithEvent': withEvent,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return BatchExecuteStatementOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a running query. To be canceled, a query must be running.
  ///
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [DatabaseConnectionException].
  ///
  /// Parameter [id] :
  /// The identifier of the SQL statement to cancel. This value is a universally
  /// unique identifier (UUID) generated by Amazon Redshift Data API. This
  /// identifier is returned by <code>BatchExecuteStatment</code>,
  /// <code>ExecuteStatment</code>, and <code>ListStatements</code>.
  Future<CancelStatementResponse> cancelStatement({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.CancelStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return CancelStatementResponse.fromJson(jsonResponse.body);
  }

  /// Describes the details about a specific instance when a query was run by
  /// the Amazon Redshift Data API. The information includes when the query
  /// started, when it finished, the query status, the number of rows returned,
  /// and the SQL statement.
  ///
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the SQL statement to describe. This value is a
  /// universally unique identifier (UUID) generated by Amazon Redshift Data
  /// API. A suffix indicates the number of the SQL statement. For example,
  /// <code>d9b6c0c9-0747-4bf4-b142-e8883122f766:2</code> has a suffix of
  /// <code>:2</code> that indicates the second SQL statement of a batch query.
  /// This identifier is returned by <code>BatchExecuteStatment</code>,
  /// <code>ExecuteStatement</code>, and <code>ListStatements</code>.
  Future<DescribeStatementResponse> describeStatement({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.DescribeStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DescribeStatementResponse.fromJson(jsonResponse.body);
  }

  /// Describes the detailed information about a table from metadata in the
  /// cluster. The information includes its columns. A token is returned to page
  /// through the column list. Depending on the authorization method, use one of
  /// the following combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DatabaseConnectionException].
  ///
  /// Parameter [database] :
  /// The name of the database that contains the tables to be described. If
  /// <code>ConnectedDatabase</code> is not specified, this is also the database
  /// to connect to with your authentication credentials.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [connectedDatabase] :
  /// A database name. The connected database is specified when you connect with
  /// your authentication credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in the response. If more tables
  /// exist than fit in one response, then <code>NextToken</code> is returned to
  /// page through the results.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  ///
  /// Parameter [schema] :
  /// The schema that contains the table. If no schema is specified, then
  /// matching tables for all schemas are returned.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [table] :
  /// The table name. If no table is specified, then all tables for all matching
  /// schemas are returned. If no table and no schema is specified, then all
  /// tables for all schemas in the database are returned
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<DescribeTableResponse> describeTable({
    required String database,
    String? clusterIdentifier,
    String? connectedDatabase,
    String? dbUser,
    int? maxResults,
    String? nextToken,
    String? schema,
    String? secretArn,
    String? table,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.DescribeTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (connectedDatabase != null) 'ConnectedDatabase': connectedDatabase,
        if (dbUser != null) 'DbUser': dbUser,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (schema != null) 'Schema': schema,
        if (secretArn != null) 'SecretArn': secretArn,
        if (table != null) 'Table': table,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return DescribeTableResponse.fromJson(jsonResponse.body);
  }

  /// Runs an SQL statement, which can be data manipulation language (DML) or
  /// data definition language (DDL). This statement must be a single SQL
  /// statement. Depending on the authorization method, use one of the following
  /// combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ExecuteStatementException].
  /// May throw [ActiveStatementsExceededException].
  ///
  /// Parameter [database] :
  /// The name of the database. This parameter is required when authenticating
  /// using either Secrets Manager or temporary credentials.
  ///
  /// Parameter [sql] :
  /// The SQL statement text to run.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [parameters] :
  /// The parameters for the SQL statement.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [statementName] :
  /// The name of the SQL statement. You can name the SQL statement when you
  /// create it to identify the query.
  ///
  /// Parameter [withEvent] :
  /// A value that indicates whether to send an event to the Amazon EventBridge
  /// event bus after the SQL statement runs.
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<ExecuteStatementOutput> executeStatement({
    required String database,
    required String sql,
    String? clientToken,
    String? clusterIdentifier,
    String? dbUser,
    List<SqlParameter>? parameters,
    String? secretArn,
    String? statementName,
    bool? withEvent,
    String? workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.ExecuteStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        'Sql': sql,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (dbUser != null) 'DbUser': dbUser,
        if (parameters != null) 'Parameters': parameters,
        if (secretArn != null) 'SecretArn': secretArn,
        if (statementName != null) 'StatementName': statementName,
        if (withEvent != null) 'WithEvent': withEvent,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return ExecuteStatementOutput.fromJson(jsonResponse.body);
  }

  /// Fetches the temporarily cached result of an SQL statement. A token is
  /// returned to page through the statement results.
  ///
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the SQL statement whose results are to be fetched. This
  /// value is a universally unique identifier (UUID) generated by Amazon
  /// Redshift Data API. A suffix indicates then number of the SQL statement.
  /// For example, <code>d9b6c0c9-0747-4bf4-b142-e8883122f766:2</code> has a
  /// suffix of <code>:2</code> that indicates the second SQL statement of a
  /// batch query. This identifier is returned by
  /// <code>BatchExecuteStatment</code>, <code>ExecuteStatment</code>, and
  /// <code>ListStatements</code>.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  Future<GetStatementResultResponse> getStatementResult({
    required String id,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.GetStatementResult'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetStatementResultResponse.fromJson(jsonResponse.body);
  }

  /// List the databases in a cluster. A token is returned to page through the
  /// database list. Depending on the authorization method, use one of the
  /// following combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DatabaseConnectionException].
  ///
  /// Parameter [database] :
  /// The name of the database. This parameter is required when authenticating
  /// using either Secrets Manager or temporary credentials.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of databases to return in the response. If more
  /// databases exist than fit in one response, then <code>NextToken</code> is
  /// returned to page through the results.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<ListDatabasesResponse> listDatabases({
    required String database,
    String? clusterIdentifier,
    String? dbUser,
    int? maxResults,
    String? nextToken,
    String? secretArn,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.ListDatabases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (dbUser != null) 'DbUser': dbUser,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (secretArn != null) 'SecretArn': secretArn,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return ListDatabasesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the schemas in a database. A token is returned to page through the
  /// schema list. Depending on the authorization method, use one of the
  /// following combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DatabaseConnectionException].
  ///
  /// Parameter [database] :
  /// The name of the database that contains the schemas to list. If
  /// <code>ConnectedDatabase</code> is not specified, this is also the database
  /// to connect to with your authentication credentials.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [connectedDatabase] :
  /// A database name. The connected database is specified when you connect with
  /// your authentication credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of schemas to return in the response. If more schemas
  /// exist than fit in one response, then <code>NextToken</code> is returned to
  /// page through the results.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  ///
  /// Parameter [schemaPattern] :
  /// A pattern to filter results by schema name. Within a schema pattern, "%"
  /// means match any substring of 0 or more characters and "_" means match any
  /// one character. Only schema name entries matching the search pattern are
  /// returned.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<ListSchemasResponse> listSchemas({
    required String database,
    String? clusterIdentifier,
    String? connectedDatabase,
    String? dbUser,
    int? maxResults,
    String? nextToken,
    String? schemaPattern,
    String? secretArn,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.ListSchemas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (connectedDatabase != null) 'ConnectedDatabase': connectedDatabase,
        if (dbUser != null) 'DbUser': dbUser,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (schemaPattern != null) 'SchemaPattern': schemaPattern,
        if (secretArn != null) 'SecretArn': secretArn,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return ListSchemasResponse.fromJson(jsonResponse.body);
  }

  /// List of SQL statements. By default, only finished statements are shown. A
  /// token is returned to page through the statement list.
  ///
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of SQL statements to return in the response. If more
  /// SQL statements exist than fit in one response, then <code>NextToken</code>
  /// is returned to page through the results.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  ///
  /// Parameter [roleLevel] :
  /// A value that filters which statements to return in the response. If true,
  /// all statements run by the caller's IAM role are returned. If false, only
  /// statements run by the caller's IAM role in the current IAM session are
  /// returned. The default is true.
  ///
  /// Parameter [statementName] :
  /// The name of the SQL statement specified as input to
  /// <code>BatchExecuteStatement</code> or <code>ExecuteStatement</code> to
  /// identify the query. You can list multiple statements by providing a prefix
  /// that matches the beginning of the statement name. For example, to list
  /// myStatement1, myStatement2, myStatement3, and so on, then provide the a
  /// value of <code>myStatement</code>. Data API does a case-sensitive match of
  /// SQL statement names to the prefix value you provide.
  ///
  /// Parameter [status] :
  /// The status of the SQL statement to list. Status values are defined as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// ABORTED - The query run was stopped by the user.
  /// </li>
  /// <li>
  /// ALL - A status value that includes all query statuses. This value can be
  /// used to filter results.
  /// </li>
  /// <li>
  /// FAILED - The query run failed.
  /// </li>
  /// <li>
  /// FINISHED - The query has finished running.
  /// </li>
  /// <li>
  /// PICKED - The query has been chosen to be run.
  /// </li>
  /// <li>
  /// STARTED - The query run has started.
  /// </li>
  /// <li>
  /// SUBMITTED - The query was submitted, but not yet processed.
  /// </li>
  /// </ul>
  Future<ListStatementsResponse> listStatements({
    int? maxResults,
    String? nextToken,
    bool? roleLevel,
    String? statementName,
    StatusString? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.ListStatements'
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
        if (roleLevel != null) 'RoleLevel': roleLevel,
        if (statementName != null) 'StatementName': statementName,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListStatementsResponse.fromJson(jsonResponse.body);
  }

  /// List the tables in a database. If neither <code>SchemaPattern</code> nor
  /// <code>TablePattern</code> are specified, then all tables in the database
  /// are returned. A token is returned to page through the table list.
  /// Depending on the authorization method, use one of the following
  /// combinations of request parameters:
  ///
  /// <ul>
  /// <li>
  /// Secrets Manager - when connecting to a cluster, provide the
  /// <code>secret-arn</code> of a secret stored in Secrets Manager which has
  /// <code>username</code> and <code>password</code>. The specified secret
  /// contains credentials to connect to the <code>database</code> you specify.
  /// When you are connecting to a cluster, you also supply the database name,
  /// If you provide a cluster identifier (<code>dbClusterIdentifier</code>), it
  /// must match the cluster identifier stored in the secret. When you are
  /// connecting to a serverless workgroup, you also supply the database name.
  /// </li>
  /// <li>
  /// Temporary credentials - when connecting to your data warehouse, choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// When connecting to a serverless workgroup, specify the workgroup name and
  /// database name. The database user name is derived from the IAM identity.
  /// For example, <code>arn:iam::123456789012:user:foo</code> has the database
  /// user name <code>IAM:foo</code>. Also, permission to call the
  /// <code>redshift-serverless:GetCredentials</code> operation is required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as an IAM identity, specify the cluster
  /// identifier and the database name. The database user name is derived from
  /// the IAM identity. For example, <code>arn:iam::123456789012:user:foo</code>
  /// has the database user name <code>IAM:foo</code>. Also, permission to call
  /// the <code>redshift:GetClusterCredentialsWithIAM</code> operation is
  /// required.
  /// </li>
  /// <li>
  /// When connecting to a cluster as a database user, specify the cluster
  /// identifier, the database name, and the database user name. Also,
  /// permission to call the <code>redshift:GetClusterCredentials</code>
  /// operation is required.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about the Amazon Redshift Data API and CLI usage
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html">Using
  /// the Amazon Redshift Data API</a> in the <i>Amazon Redshift Management
  /// Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DatabaseConnectionException].
  ///
  /// Parameter [database] :
  /// The name of the database that contains the tables to list. If
  /// <code>ConnectedDatabase</code> is not specified, this is also the database
  /// to connect to with your authentication credentials.
  ///
  /// Parameter [clusterIdentifier] :
  /// The cluster identifier. This parameter is required when connecting to a
  /// cluster and authenticating using either Secrets Manager or temporary
  /// credentials.
  ///
  /// Parameter [connectedDatabase] :
  /// A database name. The connected database is specified when you connect with
  /// your authentication credentials.
  ///
  /// Parameter [dbUser] :
  /// The database user name. This parameter is required when connecting to a
  /// cluster as a database user and authenticating using temporary credentials.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in the response. If more tables
  /// exist than fit in one response, then <code>NextToken</code> is returned to
  /// page through the results.
  ///
  /// Parameter [nextToken] :
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  ///
  /// Parameter [schemaPattern] :
  /// A pattern to filter results by schema name. Within a schema pattern, "%"
  /// means match any substring of 0 or more characters and "_" means match any
  /// one character. Only schema name entries matching the search pattern are
  /// returned. If <code>SchemaPattern</code> is not specified, then all tables
  /// that match <code>TablePattern</code> are returned. If neither
  /// <code>SchemaPattern</code> or <code>TablePattern</code> are specified,
  /// then all tables are returned.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the database. This
  /// parameter is required when authenticating using Secrets Manager.
  ///
  /// Parameter [tablePattern] :
  /// A pattern to filter results by table name. Within a table pattern, "%"
  /// means match any substring of 0 or more characters and "_" means match any
  /// one character. Only table name entries matching the search pattern are
  /// returned. If <code>TablePattern</code> is not specified, then all tables
  /// that match <code>SchemaPattern</code>are returned. If neither
  /// <code>SchemaPattern</code> or <code>TablePattern</code> are specified,
  /// then all tables are returned.
  ///
  /// Parameter [workgroupName] :
  /// The serverless workgroup name or Amazon Resource Name (ARN). This
  /// parameter is required when connecting to a serverless workgroup and
  /// authenticating using either Secrets Manager or temporary credentials.
  Future<ListTablesResponse> listTables({
    required String database,
    String? clusterIdentifier,
    String? connectedDatabase,
    String? dbUser,
    int? maxResults,
    String? nextToken,
    String? schemaPattern,
    String? secretArn,
    String? tablePattern,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftData.ListTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Database': database,
        if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
        if (connectedDatabase != null) 'ConnectedDatabase': connectedDatabase,
        if (dbUser != null) 'DbUser': dbUser,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (schemaPattern != null) 'SchemaPattern': schemaPattern,
        if (secretArn != null) 'SecretArn': secretArn,
        if (tablePattern != null) 'TablePattern': tablePattern,
        if (workgroupName != null) 'WorkgroupName': workgroupName,
      },
    );

    return ListTablesResponse.fromJson(jsonResponse.body);
  }
}

class BatchExecuteStatementOutput {
  /// The cluster identifier. This element is not returned when connecting to a
  /// serverless workgroup.
  final String? clusterIdentifier;

  /// The date and time (UTC) the statement was created.
  final DateTime? createdAt;

  /// The name of the database.
  final String? database;

  /// The database user name.
  final String? dbUser;

  /// The identifier of the SQL statement whose results are to be fetched. This
  /// value is a universally unique identifier (UUID) generated by Amazon Redshift
  /// Data API. This identifier is returned by <code>BatchExecuteStatment</code>.
  final String? id;

  /// The name or ARN of the secret that enables access to the database.
  final String? secretArn;

  /// The serverless workgroup name or Amazon Resource Name (ARN). This element is
  /// not returned when connecting to a provisioned cluster.
  final String? workgroupName;

  BatchExecuteStatementOutput({
    this.clusterIdentifier,
    this.createdAt,
    this.database,
    this.dbUser,
    this.id,
    this.secretArn,
    this.workgroupName,
  });

  factory BatchExecuteStatementOutput.fromJson(Map<String, dynamic> json) {
    return BatchExecuteStatementOutput(
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      database: json['Database'] as String?,
      dbUser: json['DbUser'] as String?,
      id: json['Id'] as String?,
      secretArn: json['SecretArn'] as String?,
      workgroupName: json['WorkgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final createdAt = this.createdAt;
    final database = this.database;
    final dbUser = this.dbUser;
    final id = this.id;
    final secretArn = this.secretArn;
    final workgroupName = this.workgroupName;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (database != null) 'Database': database,
      if (dbUser != null) 'DbUser': dbUser,
      if (id != null) 'Id': id,
      if (secretArn != null) 'SecretArn': secretArn,
      if (workgroupName != null) 'WorkgroupName': workgroupName,
    };
  }
}

class CancelStatementResponse {
  /// A value that indicates whether the cancel statement succeeded (true).
  final bool? status;

  CancelStatementResponse({
    this.status,
  });

  factory CancelStatementResponse.fromJson(Map<String, dynamic> json) {
    return CancelStatementResponse(
      status: json['Status'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status,
    };
  }
}

/// The properties (metadata) of a column.
class ColumnMetadata {
  /// The default value of the column.
  final String? columnDefault;

  /// A value that indicates whether the column is case-sensitive.
  final bool? isCaseSensitive;

  /// A value that indicates whether the column contains currency values.
  final bool? isCurrency;

  /// A value that indicates whether an integer column is signed.
  final bool? isSigned;

  /// The label for the column.
  final String? label;

  /// The length of the column.
  final int? length;

  /// The name of the column.
  final String? name;

  /// A value that indicates whether the column is nullable.
  final int? nullable;

  /// The precision value of a decimal number column.
  final int? precision;

  /// The scale value of a decimal number column.
  final int? scale;

  /// The name of the schema that contains the table that includes the column.
  final String? schemaName;

  /// The name of the table that includes the column.
  final String? tableName;

  /// The database-specific data type of the column.
  final String? typeName;

  ColumnMetadata({
    this.columnDefault,
    this.isCaseSensitive,
    this.isCurrency,
    this.isSigned,
    this.label,
    this.length,
    this.name,
    this.nullable,
    this.precision,
    this.scale,
    this.schemaName,
    this.tableName,
    this.typeName,
  });

  factory ColumnMetadata.fromJson(Map<String, dynamic> json) {
    return ColumnMetadata(
      columnDefault: json['columnDefault'] as String?,
      isCaseSensitive: json['isCaseSensitive'] as bool?,
      isCurrency: json['isCurrency'] as bool?,
      isSigned: json['isSigned'] as bool?,
      label: json['label'] as String?,
      length: json['length'] as int?,
      name: json['name'] as String?,
      nullable: json['nullable'] as int?,
      precision: json['precision'] as int?,
      scale: json['scale'] as int?,
      schemaName: json['schemaName'] as String?,
      tableName: json['tableName'] as String?,
      typeName: json['typeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnDefault = this.columnDefault;
    final isCaseSensitive = this.isCaseSensitive;
    final isCurrency = this.isCurrency;
    final isSigned = this.isSigned;
    final label = this.label;
    final length = this.length;
    final name = this.name;
    final nullable = this.nullable;
    final precision = this.precision;
    final scale = this.scale;
    final schemaName = this.schemaName;
    final tableName = this.tableName;
    final typeName = this.typeName;
    return {
      if (columnDefault != null) 'columnDefault': columnDefault,
      if (isCaseSensitive != null) 'isCaseSensitive': isCaseSensitive,
      if (isCurrency != null) 'isCurrency': isCurrency,
      if (isSigned != null) 'isSigned': isSigned,
      if (label != null) 'label': label,
      if (length != null) 'length': length,
      if (name != null) 'name': name,
      if (nullable != null) 'nullable': nullable,
      if (precision != null) 'precision': precision,
      if (scale != null) 'scale': scale,
      if (schemaName != null) 'schemaName': schemaName,
      if (tableName != null) 'tableName': tableName,
      if (typeName != null) 'typeName': typeName,
    };
  }
}

class DescribeStatementResponse {
  /// The identifier of the SQL statement described. This value is a universally
  /// unique identifier (UUID) generated by Amazon Redshift Data API.
  final String id;

  /// The cluster identifier.
  final String? clusterIdentifier;

  /// The date and time (UTC) when the SQL statement was submitted to run.
  final DateTime? createdAt;

  /// The name of the database.
  final String? database;

  /// The database user name.
  final String? dbUser;

  /// The amount of time in nanoseconds that the statement ran.
  final int? duration;

  /// The error message from the cluster if the SQL statement encountered an error
  /// while running.
  final String? error;

  /// A value that indicates whether the statement has a result set. The result
  /// set can be empty. The value is true for an empty result set. The value is
  /// true if any substatement returns a result set.
  final bool? hasResultSet;

  /// The parameters for the SQL statement.
  final List<SqlParameter>? queryParameters;

  /// The SQL statement text.
  final String? queryString;

  /// The process identifier from Amazon Redshift.
  final int? redshiftPid;

  /// The identifier of the query generated by Amazon Redshift. These identifiers
  /// are also available in the <code>query</code> column of the
  /// <code>STL_QUERY</code> system view.
  final int? redshiftQueryId;

  /// Either the number of rows returned from the SQL statement or the number of
  /// rows affected. If result size is greater than zero, the result rows can be
  /// the number of rows affected by SQL statements such as INSERT, UPDATE,
  /// DELETE, COPY, and others. A <code>-1</code> indicates the value is null.
  final int? resultRows;

  /// The size in bytes of the returned results. A <code>-1</code> indicates the
  /// value is null.
  final int? resultSize;

  /// The name or Amazon Resource Name (ARN) of the secret that enables access to
  /// the database.
  final String? secretArn;

  /// The status of the SQL statement being described. Status values are defined
  /// as follows:
  ///
  /// <ul>
  /// <li>
  /// ABORTED - The query run was stopped by the user.
  /// </li>
  /// <li>
  /// ALL - A status value that includes all query statuses. This value can be
  /// used to filter results.
  /// </li>
  /// <li>
  /// FAILED - The query run failed.
  /// </li>
  /// <li>
  /// FINISHED - The query has finished running.
  /// </li>
  /// <li>
  /// PICKED - The query has been chosen to be run.
  /// </li>
  /// <li>
  /// STARTED - The query run has started.
  /// </li>
  /// <li>
  /// SUBMITTED - The query was submitted, but not yet processed.
  /// </li>
  /// </ul>
  final StatusString? status;

  /// The SQL statements from a multiple statement run.
  final List<SubStatementData>? subStatements;

  /// The date and time (UTC) that the metadata for the SQL statement was last
  /// updated. An example is the time the status last changed.
  final DateTime? updatedAt;

  /// The serverless workgroup name or Amazon Resource Name (ARN).
  final String? workgroupName;

  DescribeStatementResponse({
    required this.id,
    this.clusterIdentifier,
    this.createdAt,
    this.database,
    this.dbUser,
    this.duration,
    this.error,
    this.hasResultSet,
    this.queryParameters,
    this.queryString,
    this.redshiftPid,
    this.redshiftQueryId,
    this.resultRows,
    this.resultSize,
    this.secretArn,
    this.status,
    this.subStatements,
    this.updatedAt,
    this.workgroupName,
  });

  factory DescribeStatementResponse.fromJson(Map<String, dynamic> json) {
    return DescribeStatementResponse(
      id: json['Id'] as String,
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      database: json['Database'] as String?,
      dbUser: json['DbUser'] as String?,
      duration: json['Duration'] as int?,
      error: json['Error'] as String?,
      hasResultSet: json['HasResultSet'] as bool?,
      queryParameters: (json['QueryParameters'] as List?)
          ?.whereNotNull()
          .map((e) => SqlParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryString: json['QueryString'] as String?,
      redshiftPid: json['RedshiftPid'] as int?,
      redshiftQueryId: json['RedshiftQueryId'] as int?,
      resultRows: json['ResultRows'] as int?,
      resultSize: json['ResultSize'] as int?,
      secretArn: json['SecretArn'] as String?,
      status: (json['Status'] as String?)?.toStatusString(),
      subStatements: (json['SubStatements'] as List?)
          ?.whereNotNull()
          .map((e) => SubStatementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workgroupName: json['WorkgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final clusterIdentifier = this.clusterIdentifier;
    final createdAt = this.createdAt;
    final database = this.database;
    final dbUser = this.dbUser;
    final duration = this.duration;
    final error = this.error;
    final hasResultSet = this.hasResultSet;
    final queryParameters = this.queryParameters;
    final queryString = this.queryString;
    final redshiftPid = this.redshiftPid;
    final redshiftQueryId = this.redshiftQueryId;
    final resultRows = this.resultRows;
    final resultSize = this.resultSize;
    final secretArn = this.secretArn;
    final status = this.status;
    final subStatements = this.subStatements;
    final updatedAt = this.updatedAt;
    final workgroupName = this.workgroupName;
    return {
      'Id': id,
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (database != null) 'Database': database,
      if (dbUser != null) 'DbUser': dbUser,
      if (duration != null) 'Duration': duration,
      if (error != null) 'Error': error,
      if (hasResultSet != null) 'HasResultSet': hasResultSet,
      if (queryParameters != null) 'QueryParameters': queryParameters,
      if (queryString != null) 'QueryString': queryString,
      if (redshiftPid != null) 'RedshiftPid': redshiftPid,
      if (redshiftQueryId != null) 'RedshiftQueryId': redshiftQueryId,
      if (resultRows != null) 'ResultRows': resultRows,
      if (resultSize != null) 'ResultSize': resultSize,
      if (secretArn != null) 'SecretArn': secretArn,
      if (status != null) 'Status': status.toValue(),
      if (subStatements != null) 'SubStatements': subStatements,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workgroupName != null) 'WorkgroupName': workgroupName,
    };
  }
}

class DescribeTableResponse {
  /// A list of columns in the table.
  final List<ColumnMetadata>? columnList;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  /// The table name.
  final String? tableName;

  DescribeTableResponse({
    this.columnList,
    this.nextToken,
    this.tableName,
  });

  factory DescribeTableResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTableResponse(
      columnList: (json['ColumnList'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnList = this.columnList;
    final nextToken = this.nextToken;
    final tableName = this.tableName;
    return {
      if (columnList != null) 'ColumnList': columnList,
      if (nextToken != null) 'NextToken': nextToken,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

class ExecuteStatementOutput {
  /// The cluster identifier. This element is not returned when connecting to a
  /// serverless workgroup.
  final String? clusterIdentifier;

  /// The date and time (UTC) the statement was created.
  final DateTime? createdAt;

  /// The name of the database.
  final String? database;

  /// The database user name.
  final String? dbUser;

  /// The identifier of the SQL statement whose results are to be fetched. This
  /// value is a universally unique identifier (UUID) generated by Amazon Redshift
  /// Data API.
  final String? id;

  /// The name or ARN of the secret that enables access to the database.
  final String? secretArn;

  /// The serverless workgroup name or Amazon Resource Name (ARN). This element is
  /// not returned when connecting to a provisioned cluster.
  final String? workgroupName;

  ExecuteStatementOutput({
    this.clusterIdentifier,
    this.createdAt,
    this.database,
    this.dbUser,
    this.id,
    this.secretArn,
    this.workgroupName,
  });

  factory ExecuteStatementOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteStatementOutput(
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      database: json['Database'] as String?,
      dbUser: json['DbUser'] as String?,
      id: json['Id'] as String?,
      secretArn: json['SecretArn'] as String?,
      workgroupName: json['WorkgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final createdAt = this.createdAt;
    final database = this.database;
    final dbUser = this.dbUser;
    final id = this.id;
    final secretArn = this.secretArn;
    final workgroupName = this.workgroupName;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (database != null) 'Database': database,
      if (dbUser != null) 'DbUser': dbUser,
      if (id != null) 'Id': id,
      if (secretArn != null) 'SecretArn': secretArn,
      if (workgroupName != null) 'WorkgroupName': workgroupName,
    };
  }
}

/// A data value in a column.
class Field {
  /// A value of the BLOB data type.
  final Uint8List? blobValue;

  /// A value of the Boolean data type.
  final bool? booleanValue;

  /// A value of the double data type.
  final double? doubleValue;

  /// A value that indicates whether the data is NULL.
  final bool? isNull;

  /// A value of the long data type.
  final int? longValue;

  /// A value of the string data type.
  final String? stringValue;

  Field({
    this.blobValue,
    this.booleanValue,
    this.doubleValue,
    this.isNull,
    this.longValue,
    this.stringValue,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      blobValue: _s.decodeNullableUint8List(json['blobValue'] as String?),
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      isNull: json['isNull'] as bool?,
      longValue: json['longValue'] as int?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blobValue = this.blobValue;
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final isNull = this.isNull;
    final longValue = this.longValue;
    final stringValue = this.stringValue;
    return {
      if (blobValue != null) 'blobValue': base64Encode(blobValue),
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (isNull != null) 'isNull': isNull,
      if (longValue != null) 'longValue': longValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class GetStatementResultResponse {
  /// The results of the SQL statement.
  final List<List<Field>> records;

  /// The properties (metadata) of a column.
  final List<ColumnMetadata>? columnMetadata;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  /// The total number of rows in the result set returned from a query. You can
  /// use this number to estimate the number of calls to the
  /// <code>GetStatementResult</code> operation needed to page through the
  /// results.
  final int? totalNumRows;

  GetStatementResultResponse({
    required this.records,
    this.columnMetadata,
    this.nextToken,
    this.totalNumRows,
  });

  factory GetStatementResultResponse.fromJson(Map<String, dynamic> json) {
    return GetStatementResultResponse(
      records: (json['Records'] as List)
          .whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => Field.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      columnMetadata: (json['ColumnMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      totalNumRows: json['TotalNumRows'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final records = this.records;
    final columnMetadata = this.columnMetadata;
    final nextToken = this.nextToken;
    final totalNumRows = this.totalNumRows;
    return {
      'Records': records,
      if (columnMetadata != null) 'ColumnMetadata': columnMetadata,
      if (nextToken != null) 'NextToken': nextToken,
      if (totalNumRows != null) 'TotalNumRows': totalNumRows,
    };
  }
}

class ListDatabasesResponse {
  /// The names of databases.
  final List<String>? databases;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  ListDatabasesResponse({
    this.databases,
    this.nextToken,
  });

  factory ListDatabasesResponse.fromJson(Map<String, dynamic> json) {
    return ListDatabasesResponse(
      databases: (json['Databases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databases = this.databases;
    final nextToken = this.nextToken;
    return {
      if (databases != null) 'Databases': databases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSchemasResponse {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  /// The schemas that match the request pattern.
  final List<String>? schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });

  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemasResponse(
      nextToken: json['NextToken'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemas = this.schemas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemas != null) 'Schemas': schemas,
    };
  }
}

class ListStatementsResponse {
  /// The SQL statements.
  final List<StatementData> statements;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  ListStatementsResponse({
    required this.statements,
    this.nextToken,
  });

  factory ListStatementsResponse.fromJson(Map<String, dynamic> json) {
    return ListStatementsResponse(
      statements: (json['Statements'] as List)
          .whereNotNull()
          .map((e) => StatementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    final nextToken = this.nextToken;
    return {
      'Statements': statements,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTablesResponse {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned NextToken
  /// value in the next NextToken parameter and retrying the command. If the
  /// NextToken field is empty, all response records have been retrieved for the
  /// request.
  final String? nextToken;

  /// The tables that match the request pattern.
  final List<TableMember>? tables;

  ListTablesResponse({
    this.nextToken,
    this.tables,
  });

  factory ListTablesResponse.fromJson(Map<String, dynamic> json) {
    return ListTablesResponse(
      nextToken: json['NextToken'] as String?,
      tables: (json['Tables'] as List?)
          ?.whereNotNull()
          .map((e) => TableMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tables = this.tables;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tables != null) 'Tables': tables,
    };
  }
}

/// A parameter used in a SQL statement.
class SqlParameter {
  /// The name of the parameter.
  final String name;

  /// The value of the parameter. Amazon Redshift implicitly converts to the
  /// proper data type. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/c_Supported_data_types.html">Data
  /// types</a> in the <i>Amazon Redshift Database Developer Guide</i>.
  final String value;

  SqlParameter({
    required this.name,
    required this.value,
  });

  factory SqlParameter.fromJson(Map<String, dynamic> json) {
    return SqlParameter(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// The SQL statement to run.
class StatementData {
  /// The SQL statement identifier. This value is a universally unique identifier
  /// (UUID) generated by Amazon Redshift Data API.
  final String id;

  /// The date and time (UTC) the statement was created.
  final DateTime? createdAt;

  /// A value that indicates whether the statement is a batch query request.
  final bool? isBatchStatement;

  /// The parameters used in a SQL statement.
  final List<SqlParameter>? queryParameters;

  /// The SQL statement.
  final String? queryString;

  /// One or more SQL statements. Each query string in the array corresponds to
  /// one of the queries in a batch query request.
  final List<String>? queryStrings;

  /// The name or Amazon Resource Name (ARN) of the secret that enables access to
  /// the database.
  final String? secretArn;

  /// The name of the SQL statement.
  final String? statementName;

  /// The status of the SQL statement. An example is the that the SQL statement
  /// finished.
  final StatusString? status;

  /// The date and time (UTC) that the statement metadata was last updated.
  final DateTime? updatedAt;

  StatementData({
    required this.id,
    this.createdAt,
    this.isBatchStatement,
    this.queryParameters,
    this.queryString,
    this.queryStrings,
    this.secretArn,
    this.statementName,
    this.status,
    this.updatedAt,
  });

  factory StatementData.fromJson(Map<String, dynamic> json) {
    return StatementData(
      id: json['Id'] as String,
      createdAt: timeStampFromJson(json['CreatedAt']),
      isBatchStatement: json['IsBatchStatement'] as bool?,
      queryParameters: (json['QueryParameters'] as List?)
          ?.whereNotNull()
          .map((e) => SqlParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryString: json['QueryString'] as String?,
      queryStrings: (json['QueryStrings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      secretArn: json['SecretArn'] as String?,
      statementName: json['StatementName'] as String?,
      status: (json['Status'] as String?)?.toStatusString(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final createdAt = this.createdAt;
    final isBatchStatement = this.isBatchStatement;
    final queryParameters = this.queryParameters;
    final queryString = this.queryString;
    final queryStrings = this.queryStrings;
    final secretArn = this.secretArn;
    final statementName = this.statementName;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'Id': id,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (isBatchStatement != null) 'IsBatchStatement': isBatchStatement,
      if (queryParameters != null) 'QueryParameters': queryParameters,
      if (queryString != null) 'QueryString': queryString,
      if (queryStrings != null) 'QueryStrings': queryStrings,
      if (secretArn != null) 'SecretArn': secretArn,
      if (statementName != null) 'StatementName': statementName,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum StatementStatusString {
  submitted,
  picked,
  started,
  finished,
  aborted,
  failed,
}

extension StatementStatusStringValueExtension on StatementStatusString {
  String toValue() {
    switch (this) {
      case StatementStatusString.submitted:
        return 'SUBMITTED';
      case StatementStatusString.picked:
        return 'PICKED';
      case StatementStatusString.started:
        return 'STARTED';
      case StatementStatusString.finished:
        return 'FINISHED';
      case StatementStatusString.aborted:
        return 'ABORTED';
      case StatementStatusString.failed:
        return 'FAILED';
    }
  }
}

extension StatementStatusStringFromString on String {
  StatementStatusString toStatementStatusString() {
    switch (this) {
      case 'SUBMITTED':
        return StatementStatusString.submitted;
      case 'PICKED':
        return StatementStatusString.picked;
      case 'STARTED':
        return StatementStatusString.started;
      case 'FINISHED':
        return StatementStatusString.finished;
      case 'ABORTED':
        return StatementStatusString.aborted;
      case 'FAILED':
        return StatementStatusString.failed;
    }
    throw Exception('$this is not known in enum StatementStatusString');
  }
}

enum StatusString {
  submitted,
  picked,
  started,
  finished,
  aborted,
  failed,
  all,
}

extension StatusStringValueExtension on StatusString {
  String toValue() {
    switch (this) {
      case StatusString.submitted:
        return 'SUBMITTED';
      case StatusString.picked:
        return 'PICKED';
      case StatusString.started:
        return 'STARTED';
      case StatusString.finished:
        return 'FINISHED';
      case StatusString.aborted:
        return 'ABORTED';
      case StatusString.failed:
        return 'FAILED';
      case StatusString.all:
        return 'ALL';
    }
  }
}

extension StatusStringFromString on String {
  StatusString toStatusString() {
    switch (this) {
      case 'SUBMITTED':
        return StatusString.submitted;
      case 'PICKED':
        return StatusString.picked;
      case 'STARTED':
        return StatusString.started;
      case 'FINISHED':
        return StatusString.finished;
      case 'ABORTED':
        return StatusString.aborted;
      case 'FAILED':
        return StatusString.failed;
      case 'ALL':
        return StatusString.all;
    }
    throw Exception('$this is not known in enum StatusString');
  }
}

/// Information about an SQL statement.
class SubStatementData {
  /// The identifier of the SQL statement. This value is a universally unique
  /// identifier (UUID) generated by Amazon Redshift Data API. A suffix indicates
  /// the number of the SQL statement. For example,
  /// <code>d9b6c0c9-0747-4bf4-b142-e8883122f766:2</code> has a suffix of
  /// <code>:2</code> that indicates the second SQL statement of a batch query.
  final String id;

  /// The date and time (UTC) the statement was created.
  final DateTime? createdAt;

  /// The amount of time in nanoseconds that the statement ran.
  final int? duration;

  /// The error message from the cluster if the SQL statement encountered an error
  /// while running.
  final String? error;

  /// A value that indicates whether the statement has a result set. The result
  /// set can be empty. The value is true for an empty result set.
  final bool? hasResultSet;

  /// The SQL statement text.
  final String? queryString;

  /// The SQL statement identifier. This value is a universally unique identifier
  /// (UUID) generated by Amazon Redshift Data API.
  final int? redshiftQueryId;

  /// Either the number of rows returned from the SQL statement or the number of
  /// rows affected. If result size is greater than zero, the result rows can be
  /// the number of rows affected by SQL statements such as INSERT, UPDATE,
  /// DELETE, COPY, and others. A <code>-1</code> indicates the value is null.
  final int? resultRows;

  /// The size in bytes of the returned results. A <code>-1</code> indicates the
  /// value is null.
  final int? resultSize;

  /// The status of the SQL statement. An example is the that the SQL statement
  /// finished.
  final StatementStatusString? status;

  /// The date and time (UTC) that the statement metadata was last updated.
  final DateTime? updatedAt;

  SubStatementData({
    required this.id,
    this.createdAt,
    this.duration,
    this.error,
    this.hasResultSet,
    this.queryString,
    this.redshiftQueryId,
    this.resultRows,
    this.resultSize,
    this.status,
    this.updatedAt,
  });

  factory SubStatementData.fromJson(Map<String, dynamic> json) {
    return SubStatementData(
      id: json['Id'] as String,
      createdAt: timeStampFromJson(json['CreatedAt']),
      duration: json['Duration'] as int?,
      error: json['Error'] as String?,
      hasResultSet: json['HasResultSet'] as bool?,
      queryString: json['QueryString'] as String?,
      redshiftQueryId: json['RedshiftQueryId'] as int?,
      resultRows: json['ResultRows'] as int?,
      resultSize: json['ResultSize'] as int?,
      status: (json['Status'] as String?)?.toStatementStatusString(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final createdAt = this.createdAt;
    final duration = this.duration;
    final error = this.error;
    final hasResultSet = this.hasResultSet;
    final queryString = this.queryString;
    final redshiftQueryId = this.redshiftQueryId;
    final resultRows = this.resultRows;
    final resultSize = this.resultSize;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'Id': id,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (duration != null) 'Duration': duration,
      if (error != null) 'Error': error,
      if (hasResultSet != null) 'HasResultSet': hasResultSet,
      if (queryString != null) 'QueryString': queryString,
      if (redshiftQueryId != null) 'RedshiftQueryId': redshiftQueryId,
      if (resultRows != null) 'ResultRows': resultRows,
      if (resultSize != null) 'ResultSize': resultSize,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The properties of a table.
class TableMember {
  /// The name of the table.
  final String? name;

  /// The schema containing the table.
  final String? schema;

  /// The type of the table. Possible values include TABLE, VIEW, SYSTEM TABLE,
  /// GLOBAL TEMPORARY, LOCAL TEMPORARY, ALIAS, and SYNONYM.
  final String? type;

  TableMember({
    this.name,
    this.schema,
    this.type,
  });

  factory TableMember.fromJson(Map<String, dynamic> json) {
    return TableMember(
      name: json['name'] as String?,
      schema: json['schema'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final schema = this.schema;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
      if (type != null) 'type': type,
    };
  }
}

class ActiveStatementsExceededException extends _s.GenericAwsException {
  ActiveStatementsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ActiveStatementsExceededException',
            message: message);
}

class BatchExecuteStatementException extends _s.GenericAwsException {
  BatchExecuteStatementException({String? type, String? message})
      : super(
            type: type,
            code: 'BatchExecuteStatementException',
            message: message);
}

class DatabaseConnectionException extends _s.GenericAwsException {
  DatabaseConnectionException({String? type, String? message})
      : super(
            type: type, code: 'DatabaseConnectionException', message: message);
}

class ExecuteStatementException extends _s.GenericAwsException {
  ExecuteStatementException({String? type, String? message})
      : super(type: type, code: 'ExecuteStatementException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActiveStatementsExceededException': (type, message) =>
      ActiveStatementsExceededException(type: type, message: message),
  'BatchExecuteStatementException': (type, message) =>
      BatchExecuteStatementException(type: type, message: message),
  'DatabaseConnectionException': (type, message) =>
      DatabaseConnectionException(type: type, message: message),
  'ExecuteStatementException': (type, message) =>
      ExecuteStatementException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
