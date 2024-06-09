// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon RDS provides an HTTP endpoint to run SQL statements on an Amazon
/// Aurora DB cluster. To run these statements, you use the RDS Data API (Data
/// API).
class RDSDataService {
  final _s.RestJsonProtocol _protocol;
  RDSDataService({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds-data',
            signingName: 'rds-data',
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

  /// Runs a batch SQL statement over an array of data.
  ///
  /// You can run bulk update and insert operations for multiple records using a
  /// DML statement with different parameter sets. Bulk operations can provide a
  /// significant performance improvement over individual insert and update
  /// operations.
  /// <note>
  /// If a call isn't part of a transaction because it doesn't include the
  /// <code>transactionID</code> parameter, changes that result from the call
  /// are committed automatically.
  ///
  /// There isn't a fixed upper limit on the number of parameter sets. However,
  /// the maximum size of the HTTP request submitted through the Data API is 4
  /// MiB. If the request exceeds this limit, the Data API returns an error and
  /// doesn't process the request. This 4-MiB limit includes the size of the
  /// HTTP headers and the JSON notation in the request. Thus, the number of
  /// parameter sets that you can include depends on a combination of factors,
  /// such as the size of the SQL statement and the size of each parameter set.
  ///
  /// The response size limit is 1 MiB. If the call returns more than 1 MiB of
  /// response data, the call is terminated.
  /// </note>
  ///
  /// May throw [SecretsErrorException].
  /// May throw [HttpEndpointNotEnabledException].
  /// May throw [DatabaseErrorException].
  /// May throw [DatabaseUnavailableException].
  /// May throw [TransactionNotFoundException].
  /// May throw [InvalidSecretException].
  /// May throw [ServiceUnavailableError].
  /// May throw [ForbiddenException].
  /// May throw [DatabaseNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The ARN of the secret that enables access to the DB cluster. Enter the
  /// database user name and password for the credentials in the secret.
  ///
  /// For information about creating the secret, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/create_database_secret.html">Create
  /// a database secret</a>.
  ///
  /// Parameter [sql] :
  /// The SQL statement to run. Don't include a semicolon (;) at the end of the
  /// SQL statement.
  ///
  /// Parameter [database] :
  /// The name of the database.
  ///
  /// Parameter [parameterSets] :
  /// The parameter set for the batch operation.
  ///
  /// The SQL statement is executed as many times as the number of parameter
  /// sets provided. To execute a SQL statement with no parameters, use one of
  /// the following options:
  ///
  /// <ul>
  /// <li>
  /// Specify one or more empty parameter sets.
  /// </li>
  /// <li>
  /// Use the <code>ExecuteStatement</code> operation instead of the
  /// <code>BatchExecuteStatement</code> operation.
  /// </li>
  /// </ul> <note>
  /// Array parameters are not supported.
  /// </note>
  ///
  /// Parameter [schema] :
  /// The name of the database schema.
  /// <note>
  /// Currently, the <code>schema</code> parameter isn't supported.
  /// </note>
  ///
  /// Parameter [transactionId] :
  /// The identifier of a transaction that was started by using the
  /// <code>BeginTransaction</code> operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<BatchExecuteStatementResponse> batchExecuteStatement({
    required String resourceArn,
    required String secretArn,
    required String sql,
    String? database,
    List<List<SqlParameter>>? parameterSets,
    String? schema,
    String? transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'sql': sql,
      if (database != null) 'database': database,
      if (parameterSets != null) 'parameterSets': parameterSets,
      if (schema != null) 'schema': schema,
      if (transactionId != null) 'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchExecute',
      exceptionFnMap: _exceptionFns,
    );
    return BatchExecuteStatementResponse.fromJson(response);
  }

  /// Starts a SQL transaction.
  /// <note>
  /// A transaction can run for a maximum of 24 hours. A transaction is
  /// terminated and rolled back automatically after 24 hours.
  ///
  /// A transaction times out if no calls use its transaction ID in three
  /// minutes. If a transaction times out before it's committed, it's rolled
  /// back automatically.
  ///
  /// DDL statements inside a transaction cause an implicit commit. We recommend
  /// that you run each DDL statement in a separate
  /// <code>ExecuteStatement</code> call with <code>continueAfterTimeout</code>
  /// enabled.
  /// </note>
  ///
  /// May throw [SecretsErrorException].
  /// May throw [HttpEndpointNotEnabledException].
  /// May throw [DatabaseErrorException].
  /// May throw [DatabaseUnavailableException].
  /// May throw [TransactionNotFoundException].
  /// May throw [InvalidSecretException].
  /// May throw [ServiceUnavailableError].
  /// May throw [ForbiddenException].
  /// May throw [DatabaseNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the DB cluster.
  ///
  /// Parameter [database] :
  /// The name of the database.
  ///
  /// Parameter [schema] :
  /// The name of the database schema.
  Future<BeginTransactionResponse> beginTransaction({
    required String resourceArn,
    required String secretArn,
    String? database,
    String? schema,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      if (database != null) 'database': database,
      if (schema != null) 'schema': schema,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BeginTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return BeginTransactionResponse.fromJson(response);
  }

  /// Ends a SQL transaction started with the <code>BeginTransaction</code>
  /// operation and commits the changes.
  ///
  /// May throw [SecretsErrorException].
  /// May throw [HttpEndpointNotEnabledException].
  /// May throw [DatabaseErrorException].
  /// May throw [DatabaseUnavailableException].
  /// May throw [TransactionNotFoundException].
  /// May throw [InvalidSecretException].
  /// May throw [ServiceUnavailableError].
  /// May throw [ForbiddenException].
  /// May throw [DatabaseNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the DB cluster.
  ///
  /// Parameter [transactionId] :
  /// The identifier of the transaction to end and commit.
  Future<CommitTransactionResponse> commitTransaction({
    required String resourceArn,
    required String secretArn,
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CommitTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return CommitTransactionResponse.fromJson(response);
  }

  /// Runs one or more SQL statements.
  /// <note>
  /// This operation isn't supported for Aurora PostgreSQL Serverless v2 and
  /// provisioned DB clusters, and for Aurora Serverless v1 DB clusters, the
  /// operation is deprecated. Use the <code>BatchExecuteStatement</code> or
  /// <code>ExecuteStatement</code> operation.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [awsSecretStoreArn] :
  /// The Amazon Resource Name (ARN) of the secret that enables access to the DB
  /// cluster. Enter the database user name and password for the credentials in
  /// the secret.
  ///
  /// For information about creating the secret, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/create_database_secret.html">Create
  /// a database secret</a>.
  ///
  /// Parameter [dbClusterOrInstanceArn] :
  /// The ARN of the Aurora Serverless DB cluster.
  ///
  /// Parameter [sqlStatements] :
  /// One or more SQL statements to run on the DB cluster.
  ///
  /// You can separate SQL statements from each other with a semicolon (;). Any
  /// valid SQL statement is permitted, including data definition, data
  /// manipulation, and commit statements.
  ///
  /// Parameter [database] :
  /// The name of the database.
  ///
  /// Parameter [schema] :
  /// The name of the database schema.
  @Deprecated(
      'The ExecuteSql API is deprecated, please use the ExecuteStatement API.')
  Future<ExecuteSqlResponse> executeSql({
    required String awsSecretStoreArn,
    required String dbClusterOrInstanceArn,
    required String sqlStatements,
    String? database,
    String? schema,
  }) async {
    final $payload = <String, dynamic>{
      'awsSecretStoreArn': awsSecretStoreArn,
      'dbClusterOrInstanceArn': dbClusterOrInstanceArn,
      'sqlStatements': sqlStatements,
      if (database != null) 'database': database,
      if (schema != null) 'schema': schema,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ExecuteSql',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteSqlResponse.fromJson(response);
  }

  /// Runs a SQL statement against a database.
  /// <note>
  /// If a call isn't part of a transaction because it doesn't include the
  /// <code>transactionID</code> parameter, changes that result from the call
  /// are committed automatically.
  ///
  /// If the binary response data from the database is more than 1 MB, the call
  /// is terminated.
  /// </note>
  ///
  /// May throw [SecretsErrorException].
  /// May throw [HttpEndpointNotEnabledException].
  /// May throw [DatabaseErrorException].
  /// May throw [DatabaseUnavailableException].
  /// May throw [TransactionNotFoundException].
  /// May throw [InvalidSecretException].
  /// May throw [ServiceUnavailableError].
  /// May throw [ForbiddenException].
  /// May throw [DatabaseNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnsupportedResultException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The ARN of the secret that enables access to the DB cluster. Enter the
  /// database user name and password for the credentials in the secret.
  ///
  /// For information about creating the secret, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/create_database_secret.html">Create
  /// a database secret</a>.
  ///
  /// Parameter [sql] :
  /// The SQL statement to run.
  ///
  /// Parameter [continueAfterTimeout] :
  /// A value that indicates whether to continue running the statement after the
  /// call times out. By default, the statement stops running when the call
  /// times out.
  /// <note>
  /// For DDL statements, we recommend continuing to run the statement after the
  /// call times out. When a DDL statement terminates before it is finished
  /// running, it can result in errors and possibly corrupted data structures.
  /// </note>
  ///
  /// Parameter [database] :
  /// The name of the database.
  ///
  /// Parameter [formatRecordsAs] :
  /// A value that indicates whether to format the result set as a single JSON
  /// string. This parameter only applies to <code>SELECT</code> statements and
  /// is ignored for other types of statements. Allowed values are
  /// <code>NONE</code> and <code>JSON</code>. The default value is
  /// <code>NONE</code>. The result is returned in the
  /// <code>formattedRecords</code> field.
  ///
  /// For usage information about the JSON format for result sets, see <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using
  /// the Data API</a> in the <i>Amazon Aurora User Guide</i>.
  ///
  /// Parameter [includeResultMetadata] :
  /// A value that indicates whether to include metadata in the results.
  ///
  /// Parameter [parameters] :
  /// The parameters for the SQL statement.
  /// <note>
  /// Array parameters are not supported.
  /// </note>
  ///
  /// Parameter [resultSetOptions] :
  /// Options that control how the result set is returned.
  ///
  /// Parameter [schema] :
  /// The name of the database schema.
  /// <note>
  /// Currently, the <code>schema</code> parameter isn't supported.
  /// </note>
  ///
  /// Parameter [transactionId] :
  /// The identifier of a transaction that was started by using the
  /// <code>BeginTransaction</code> operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<ExecuteStatementResponse> executeStatement({
    required String resourceArn,
    required String secretArn,
    required String sql,
    bool? continueAfterTimeout,
    String? database,
    RecordsFormatType? formatRecordsAs,
    bool? includeResultMetadata,
    List<SqlParameter>? parameters,
    ResultSetOptions? resultSetOptions,
    String? schema,
    String? transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'sql': sql,
      if (continueAfterTimeout != null)
        'continueAfterTimeout': continueAfterTimeout,
      if (database != null) 'database': database,
      if (formatRecordsAs != null) 'formatRecordsAs': formatRecordsAs.value,
      if (includeResultMetadata != null)
        'includeResultMetadata': includeResultMetadata,
      if (parameters != null) 'parameters': parameters,
      if (resultSetOptions != null) 'resultSetOptions': resultSetOptions,
      if (schema != null) 'schema': schema,
      if (transactionId != null) 'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Execute',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteStatementResponse.fromJson(response);
  }

  /// Performs a rollback of a transaction. Rolling back a transaction cancels
  /// its changes.
  ///
  /// May throw [SecretsErrorException].
  /// May throw [HttpEndpointNotEnabledException].
  /// May throw [DatabaseErrorException].
  /// May throw [DatabaseUnavailableException].
  /// May throw [TransactionNotFoundException].
  /// May throw [InvalidSecretException].
  /// May throw [ServiceUnavailableError].
  /// May throw [ForbiddenException].
  /// May throw [DatabaseNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the DB cluster.
  ///
  /// Parameter [transactionId] :
  /// The identifier of the transaction to roll back.
  Future<RollbackTransactionResponse> rollbackTransaction({
    required String resourceArn,
    required String secretArn,
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RollbackTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return RollbackTransactionResponse.fromJson(response);
  }
}

/// Contains an array.
class ArrayValue {
  /// An array of arrays.
  final List<ArrayValue>? arrayValues;

  /// An array of Boolean values.
  final List<bool>? booleanValues;

  /// An array of floating-point numbers.
  final List<double>? doubleValues;

  /// An array of integers.
  final List<int>? longValues;

  /// An array of strings.
  final List<String>? stringValues;

  ArrayValue({
    this.arrayValues,
    this.booleanValues,
    this.doubleValues,
    this.longValues,
    this.stringValues,
  });

  factory ArrayValue.fromJson(Map<String, dynamic> json) {
    return ArrayValue(
      arrayValues: (json['arrayValues'] as List?)
          ?.whereNotNull()
          .map((e) => ArrayValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      booleanValues: (json['booleanValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as bool)
          .toList(),
      doubleValues: (json['doubleValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      longValues: (json['longValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      stringValues: (json['stringValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arrayValues = this.arrayValues;
    final booleanValues = this.booleanValues;
    final doubleValues = this.doubleValues;
    final longValues = this.longValues;
    final stringValues = this.stringValues;
    return {
      if (arrayValues != null) 'arrayValues': arrayValues,
      if (booleanValues != null) 'booleanValues': booleanValues,
      if (doubleValues != null) 'doubleValues': doubleValues,
      if (longValues != null) 'longValues': longValues,
      if (stringValues != null) 'stringValues': stringValues,
    };
  }
}

/// The response elements represent the output of a SQL statement over an array
/// of data.
class BatchExecuteStatementResponse {
  /// The execution results of each batch entry.
  final List<UpdateResult>? updateResults;

  BatchExecuteStatementResponse({
    this.updateResults,
  });

  factory BatchExecuteStatementResponse.fromJson(Map<String, dynamic> json) {
    return BatchExecuteStatementResponse(
      updateResults: (json['updateResults'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The response elements represent the output of a request to start a SQL
/// transaction.
class BeginTransactionResponse {
  /// The transaction ID of the transaction started by the call.
  final String? transactionId;

  BeginTransactionResponse({
    this.transactionId,
  });

  factory BeginTransactionResponse.fromJson(Map<String, dynamic> json) {
    return BeginTransactionResponse(
      transactionId: json['transactionId'] as String?,
    );
  }
}

/// Contains the metadata for a column.
class ColumnMetadata {
  /// The type of the column.
  final int? arrayBaseColumnType;

  /// A value that indicates whether the column increments automatically.
  final bool? isAutoIncrement;

  /// A value that indicates whether the column is case-sensitive.
  final bool? isCaseSensitive;

  /// A value that indicates whether the column contains currency values.
  final bool? isCurrency;

  /// A value that indicates whether an integer column is signed.
  final bool? isSigned;

  /// The label for the column.
  final String? label;

  /// The name of the column.
  final String? name;

  /// A value that indicates whether the column is nullable.
  final int? nullable;

  /// The precision value of a decimal number column.
  final int? precision;

  /// The scale value of a decimal number column.
  final int? scale;

  /// The name of the schema that owns the table that includes the column.
  final String? schemaName;

  /// The name of the table that includes the column.
  final String? tableName;

  /// The type of the column.
  final int? type;

  /// The database-specific data type of the column.
  final String? typeName;

  ColumnMetadata({
    this.arrayBaseColumnType,
    this.isAutoIncrement,
    this.isCaseSensitive,
    this.isCurrency,
    this.isSigned,
    this.label,
    this.name,
    this.nullable,
    this.precision,
    this.scale,
    this.schemaName,
    this.tableName,
    this.type,
    this.typeName,
  });

  factory ColumnMetadata.fromJson(Map<String, dynamic> json) {
    return ColumnMetadata(
      arrayBaseColumnType: json['arrayBaseColumnType'] as int?,
      isAutoIncrement: json['isAutoIncrement'] as bool?,
      isCaseSensitive: json['isCaseSensitive'] as bool?,
      isCurrency: json['isCurrency'] as bool?,
      isSigned: json['isSigned'] as bool?,
      label: json['label'] as String?,
      name: json['name'] as String?,
      nullable: json['nullable'] as int?,
      precision: json['precision'] as int?,
      scale: json['scale'] as int?,
      schemaName: json['schemaName'] as String?,
      tableName: json['tableName'] as String?,
      type: json['type'] as int?,
      typeName: json['typeName'] as String?,
    );
  }
}

/// The response elements represent the output of a commit transaction request.
class CommitTransactionResponse {
  /// The status of the commit operation.
  final String? transactionStatus;

  CommitTransactionResponse({
    this.transactionStatus,
  });

  factory CommitTransactionResponse.fromJson(Map<String, dynamic> json) {
    return CommitTransactionResponse(
      transactionStatus: json['transactionStatus'] as String?,
    );
  }
}

enum DecimalReturnType {
  string('STRING'),
  doubleOrLong('DOUBLE_OR_LONG'),
  ;

  final String value;

  const DecimalReturnType(this.value);

  static DecimalReturnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DecimalReturnType'));
}

/// The response elements represent the output of a request to run one or more
/// SQL statements.
class ExecuteSqlResponse {
  /// The results of the SQL statement or statements.
  final List<SqlStatementResult>? sqlStatementResults;

  ExecuteSqlResponse({
    this.sqlStatementResults,
  });

  factory ExecuteSqlResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteSqlResponse(
      sqlStatementResults: (json['sqlStatementResults'] as List?)
          ?.whereNotNull()
          .map((e) => SqlStatementResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The response elements represent the output of a request to run a SQL
/// statement against a database.
class ExecuteStatementResponse {
  /// Metadata for the columns included in the results. This field is blank if the
  /// <code>formatRecordsAs</code> parameter is set to <code>JSON</code>.
  final List<ColumnMetadata>? columnMetadata;

  /// A string value that represents the result set of a <code>SELECT</code>
  /// statement in JSON format. This value is only present when the
  /// <code>formatRecordsAs</code> parameter is set to <code>JSON</code>.
  ///
  /// The size limit for this field is currently 10 MB. If the JSON-formatted
  /// string representing the result set requires more than 10 MB, the call
  /// returns an error.
  final String? formattedRecords;

  /// Values for fields generated during a DML request.
  /// <note>
  /// The <code>generatedFields</code> data isn't supported by Aurora PostgreSQL.
  /// To get the values of generated fields, use the <code>RETURNING</code>
  /// clause. For more information, see <a
  /// href="https://www.postgresql.org/docs/10/dml-returning.html">Returning Data
  /// From Modified Rows</a> in the PostgreSQL documentation.
  /// </note>
  final List<Field>? generatedFields;

  /// The number of records updated by the request.
  final int? numberOfRecordsUpdated;

  /// The records returned by the SQL statement. This field is blank if the
  /// <code>formatRecordsAs</code> parameter is set to <code>JSON</code>.
  final List<List<Field>>? records;

  ExecuteStatementResponse({
    this.columnMetadata,
    this.formattedRecords,
    this.generatedFields,
    this.numberOfRecordsUpdated,
    this.records,
  });

  factory ExecuteStatementResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteStatementResponse(
      columnMetadata: (json['columnMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedRecords: json['formattedRecords'] as String?,
      generatedFields: (json['generatedFields'] as List?)
          ?.whereNotNull()
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfRecordsUpdated: json['numberOfRecordsUpdated'] as int?,
      records: (json['records'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => Field.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );
  }
}

/// Contains a value.
class Field {
  /// An array of values.
  final ArrayValue? arrayValue;

  /// A value of BLOB data type.
  final Uint8List? blobValue;

  /// A value of Boolean data type.
  final bool? booleanValue;

  /// A value of double data type.
  final double? doubleValue;

  /// A NULL value.
  final bool? isNull;

  /// A value of long data type.
  final int? longValue;

  /// A value of string data type.
  final String? stringValue;

  Field({
    this.arrayValue,
    this.blobValue,
    this.booleanValue,
    this.doubleValue,
    this.isNull,
    this.longValue,
    this.stringValue,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      arrayValue: json['arrayValue'] != null
          ? ArrayValue.fromJson(json['arrayValue'] as Map<String, dynamic>)
          : null,
      blobValue: _s.decodeNullableUint8List(json['blobValue'] as String?),
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      isNull: json['isNull'] as bool?,
      longValue: json['longValue'] as int?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arrayValue = this.arrayValue;
    final blobValue = this.blobValue;
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final isNull = this.isNull;
    final longValue = this.longValue;
    final stringValue = this.stringValue;
    return {
      if (arrayValue != null) 'arrayValue': arrayValue,
      if (blobValue != null) 'blobValue': base64Encode(blobValue),
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (isNull != null) 'isNull': isNull,
      if (longValue != null) 'longValue': longValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

enum LongReturnType {
  string('STRING'),
  long('LONG'),
  ;

  final String value;

  const LongReturnType(this.value);

  static LongReturnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LongReturnType'));
}

/// A record returned by a call.
/// <note>
/// This data structure is only used with the deprecated <code>ExecuteSql</code>
/// operation. Use the <code>BatchExecuteStatement</code> or
/// <code>ExecuteStatement</code> operation instead.
/// </note>
class Record {
  /// The values returned in the record.
  final List<Value>? values;

  Record({
    this.values,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum RecordsFormatType {
  none('NONE'),
  json('JSON'),
  ;

  final String value;

  const RecordsFormatType(this.value);

  static RecordsFormatType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RecordsFormatType'));
}

/// The result set returned by a SQL statement.
/// <note>
/// This data structure is only used with the deprecated <code>ExecuteSql</code>
/// operation. Use the <code>BatchExecuteStatement</code> or
/// <code>ExecuteStatement</code> operation instead.
/// </note>
class ResultFrame {
  /// The records in the result set.
  final List<Record>? records;

  /// The result-set metadata in the result set.
  final ResultSetMetadata? resultSetMetadata;

  ResultFrame({
    this.records,
    this.resultSetMetadata,
  });

  factory ResultFrame.fromJson(Map<String, dynamic> json) {
    return ResultFrame(
      records: (json['records'] as List?)
          ?.whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultSetMetadata: json['resultSetMetadata'] != null
          ? ResultSetMetadata.fromJson(
              json['resultSetMetadata'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The metadata of the result set returned by a SQL statement.
class ResultSetMetadata {
  /// The number of columns in the result set.
  final int? columnCount;

  /// The metadata of the columns in the result set.
  final List<ColumnMetadata>? columnMetadata;

  ResultSetMetadata({
    this.columnCount,
    this.columnMetadata,
  });

  factory ResultSetMetadata.fromJson(Map<String, dynamic> json) {
    return ResultSetMetadata(
      columnCount: json['columnCount'] as int?,
      columnMetadata: (json['columnMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Options that control how the result set is returned.
class ResultSetOptions {
  /// A value that indicates how a field of <code>DECIMAL</code> type is
  /// represented in the response. The value of <code>STRING</code>, the default,
  /// specifies that it is converted to a String value. The value of
  /// <code>DOUBLE_OR_LONG</code> specifies that it is converted to a Long value
  /// if its scale is 0, or to a Double value otherwise.
  /// <note>
  /// Conversion to Double or Long can result in roundoff errors due to precision
  /// loss. We recommend converting to String, especially when working with
  /// currency values.
  /// </note>
  final DecimalReturnType? decimalReturnType;

  /// A value that indicates how a field of <code>LONG</code> type is represented.
  /// Allowed values are <code>LONG</code> and <code>STRING</code>. The default is
  /// <code>LONG</code>. Specify <code>STRING</code> if the length or precision of
  /// numeric values might cause truncation or rounding errors.
  final LongReturnType? longReturnType;

  ResultSetOptions({
    this.decimalReturnType,
    this.longReturnType,
  });

  Map<String, dynamic> toJson() {
    final decimalReturnType = this.decimalReturnType;
    final longReturnType = this.longReturnType;
    return {
      if (decimalReturnType != null)
        'decimalReturnType': decimalReturnType.value,
      if (longReturnType != null) 'longReturnType': longReturnType.value,
    };
  }
}

/// The response elements represent the output of a request to perform a
/// rollback of a transaction.
class RollbackTransactionResponse {
  /// The status of the rollback operation.
  final String? transactionStatus;

  RollbackTransactionResponse({
    this.transactionStatus,
  });

  factory RollbackTransactionResponse.fromJson(Map<String, dynamic> json) {
    return RollbackTransactionResponse(
      transactionStatus: json['transactionStatus'] as String?,
    );
  }
}

/// A parameter used in a SQL statement.
class SqlParameter {
  /// The name of the parameter.
  final String? name;

  /// A hint that specifies the correct object type for data type mapping.
  /// Possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>DATE</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>DATE</code> type to the database. The accepted
  /// format is <code>YYYY-MM-DD</code>.
  /// </li>
  /// <li>
  /// <code>DECIMAL</code> - The corresponding <code>String</code> parameter value
  /// is sent as an object of <code>DECIMAL</code> type to the database.
  /// </li>
  /// <li>
  /// <code>JSON</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>JSON</code> type to the database.
  /// </li>
  /// <li>
  /// <code>TIME</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>TIME</code> type to the database. The accepted
  /// format is <code>HH:MM:SS[.FFF]</code>.
  /// </li>
  /// <li>
  /// <code>TIMESTAMP</code> - The corresponding <code>String</code> parameter
  /// value is sent as an object of <code>TIMESTAMP</code> type to the database.
  /// The accepted format is <code>YYYY-MM-DD HH:MM:SS[.FFF]</code>.
  /// </li>
  /// <li>
  /// <code>UUID</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>UUID</code> type to the database.
  /// </li>
  /// </ul>
  final TypeHint? typeHint;

  /// The value of the parameter.
  final Field? value;

  SqlParameter({
    this.name,
    this.typeHint,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final typeHint = this.typeHint;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (typeHint != null) 'typeHint': typeHint.value,
      if (value != null) 'value': value,
    };
  }
}

/// The result of a SQL statement.
/// <note>
/// This data structure is only used with the deprecated <code>ExecuteSql</code>
/// operation. Use the <code>BatchExecuteStatement</code> or
/// <code>ExecuteStatement</code> operation instead.
/// </note>
class SqlStatementResult {
  /// The number of records updated by a SQL statement.
  final int? numberOfRecordsUpdated;

  /// The result set of the SQL statement.
  final ResultFrame? resultFrame;

  SqlStatementResult({
    this.numberOfRecordsUpdated,
    this.resultFrame,
  });

  factory SqlStatementResult.fromJson(Map<String, dynamic> json) {
    return SqlStatementResult(
      numberOfRecordsUpdated: json['numberOfRecordsUpdated'] as int?,
      resultFrame: json['resultFrame'] != null
          ? ResultFrame.fromJson(json['resultFrame'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// A structure value returned by a call.
/// <note>
/// This data structure is only used with the deprecated <code>ExecuteSql</code>
/// operation. Use the <code>BatchExecuteStatement</code> or
/// <code>ExecuteStatement</code> operation instead.
/// </note>
class StructValue {
  /// The attributes returned in the record.
  final List<Value>? attributes;

  StructValue({
    this.attributes,
  });

  factory StructValue.fromJson(Map<String, dynamic> json) {
    return StructValue(
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum TypeHint {
  json('JSON'),
  uuid('UUID'),
  timestamp('TIMESTAMP'),
  date('DATE'),
  time('TIME'),
  decimal('DECIMAL'),
  ;

  final String value;

  const TypeHint(this.value);

  static TypeHint fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TypeHint'));
}

/// The response elements represent the results of an update.
class UpdateResult {
  /// Values for fields generated during the request.
  final List<Field>? generatedFields;

  UpdateResult({
    this.generatedFields,
  });

  factory UpdateResult.fromJson(Map<String, dynamic> json) {
    return UpdateResult(
      generatedFields: (json['generatedFields'] as List?)
          ?.whereNotNull()
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains the value of a column.
/// <note>
/// This data structure is only used with the deprecated <code>ExecuteSql</code>
/// operation. Use the <code>BatchExecuteStatement</code> or
/// <code>ExecuteStatement</code> operation instead.
/// </note>
class Value {
  /// An array of column values.
  final List<Value>? arrayValues;

  /// A value for a column of big integer data type.
  final int? bigIntValue;

  /// A value for a column of BIT data type.
  final bool? bitValue;

  /// A value for a column of BLOB data type.
  final Uint8List? blobValue;

  /// A value for a column of double data type.
  final double? doubleValue;

  /// A value for a column of integer data type.
  final int? intValue;

  /// A NULL value.
  final bool? isNull;

  /// A value for a column of real data type.
  final double? realValue;

  /// A value for a column of string data type.
  final String? stringValue;

  /// A value for a column of STRUCT data type.
  final StructValue? structValue;

  Value({
    this.arrayValues,
    this.bigIntValue,
    this.bitValue,
    this.blobValue,
    this.doubleValue,
    this.intValue,
    this.isNull,
    this.realValue,
    this.stringValue,
    this.structValue,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      arrayValues: (json['arrayValues'] as List?)
          ?.whereNotNull()
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
      bigIntValue: json['bigIntValue'] as int?,
      bitValue: json['bitValue'] as bool?,
      blobValue: _s.decodeNullableUint8List(json['blobValue'] as String?),
      doubleValue: json['doubleValue'] as double?,
      intValue: json['intValue'] as int?,
      isNull: json['isNull'] as bool?,
      realValue: json['realValue'] as double?,
      stringValue: json['stringValue'] as String?,
      structValue: json['structValue'] != null
          ? StructValue.fromJson(json['structValue'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class DatabaseErrorException extends _s.GenericAwsException {
  DatabaseErrorException({String? type, String? message})
      : super(type: type, code: 'DatabaseErrorException', message: message);
}

class DatabaseNotFoundException extends _s.GenericAwsException {
  DatabaseNotFoundException({String? type, String? message})
      : super(type: type, code: 'DatabaseNotFoundException', message: message);
}

class DatabaseUnavailableException extends _s.GenericAwsException {
  DatabaseUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'DatabaseUnavailableException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class HttpEndpointNotEnabledException extends _s.GenericAwsException {
  HttpEndpointNotEnabledException({String? type, String? message})
      : super(
            type: type,
            code: 'HttpEndpointNotEnabledException',
            message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class InvalidSecretException extends _s.GenericAwsException {
  InvalidSecretException({String? type, String? message})
      : super(type: type, code: 'InvalidSecretException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class SecretsErrorException extends _s.GenericAwsException {
  SecretsErrorException({String? type, String? message})
      : super(type: type, code: 'SecretsErrorException', message: message);
}

class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailableError', message: message);
}

class StatementTimeoutException extends _s.GenericAwsException {
  StatementTimeoutException({String? type, String? message})
      : super(type: type, code: 'StatementTimeoutException', message: message);
}

class TransactionNotFoundException extends _s.GenericAwsException {
  TransactionNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'TransactionNotFoundException', message: message);
}

class UnsupportedResultException extends _s.GenericAwsException {
  UnsupportedResultException({String? type, String? message})
      : super(type: type, code: 'UnsupportedResultException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'DatabaseErrorException': (type, message) =>
      DatabaseErrorException(type: type, message: message),
  'DatabaseNotFoundException': (type, message) =>
      DatabaseNotFoundException(type: type, message: message),
  'DatabaseUnavailableException': (type, message) =>
      DatabaseUnavailableException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'HttpEndpointNotEnabledException': (type, message) =>
      HttpEndpointNotEnabledException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'InvalidSecretException': (type, message) =>
      InvalidSecretException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'SecretsErrorException': (type, message) =>
      SecretsErrorException(type: type, message: message),
  'ServiceUnavailableError': (type, message) =>
      ServiceUnavailableError(type: type, message: message),
  'StatementTimeoutException': (type, message) =>
      StatementTimeoutException(type: type, message: message),
  'TransactionNotFoundException': (type, message) =>
      TransactionNotFoundException(type: type, message: message),
  'UnsupportedResultException': (type, message) =>
      UnsupportedResultException(type: type, message: message),
};
