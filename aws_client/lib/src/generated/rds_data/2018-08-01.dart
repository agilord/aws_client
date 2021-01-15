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

part '2018-08-01.g.dart';

/// Amazon RDS provides an HTTP endpoint to run SQL statements on an Amazon
/// Aurora Serverless DB cluster. To run these statements, you work with the
/// Data Service API.
class RdsData {
  final _s.RestJsonProtocol _protocol;
  RdsData({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds-data',
            signingName: 'rds-data',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Runs a batch SQL statement over an array of data.
  ///
  /// You can run bulk update and insert operations for multiple records using a
  /// DML statement with different parameter sets. Bulk operations can provide a
  /// significant performance improvement over individual insert and update
  /// operations.
  /// <important>
  /// If a call isn't part of a transaction because it doesn't include the
  /// <code>transactionID</code> parameter, changes that result from the call
  /// are committed automatically.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the DB cluster.
  ///
  /// Parameter [sql] :
  /// The SQL statement to run.
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
  ///
  /// Parameter [transactionId] :
  /// The identifier of a transaction that was started by using the
  /// <code>BeginTransaction</code> operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<BatchExecuteStatementResponse> batchExecuteStatement({
    @_s.required String resourceArn,
    @_s.required String secretArn,
    @_s.required String sql,
    String database,
    List<List<SqlParameter>> parameterSets,
    String schema,
    String transactionId,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretArn, 'secretArn');
    _s.validateStringLength(
      'secretArn',
      secretArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sql, 'sql');
    _s.validateStringLength(
      'sql',
      sql,
      0,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'database',
      database,
      0,
      64,
    );
    _s.validateStringLength(
      'schema',
      schema,
      0,
      64,
    );
    _s.validateStringLength(
      'transactionId',
      transactionId,
      0,
      192,
    );
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
  /// <pre><code> &lt;important&gt; &lt;p&gt;A transaction can run for a maximum
  /// of 24 hours. A transaction is terminated and rolled back automatically
  /// after 24 hours.&lt;/p&gt; &lt;p&gt;A transaction times out if no calls use
  /// its transaction ID in three minutes. If a transaction times out before
  /// it's committed, it's rolled back automatically.&lt;/p&gt; &lt;p&gt;DDL
  /// statements inside a transaction cause an implicit commit. We recommend
  /// that you run each DDL statement in a separate
  /// &lt;code&gt;ExecuteStatement&lt;/code&gt; call with
  /// &lt;code&gt;continueAfterTimeout&lt;/code&gt; enabled.&lt;/p&gt;
  /// &lt;/important&gt; </code></pre>
  ///
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
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
    @_s.required String resourceArn,
    @_s.required String secretArn,
    String database,
    String schema,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretArn, 'secretArn');
    _s.validateStringLength(
      'secretArn',
      secretArn,
      11,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'database',
      database,
      0,
      64,
    );
    _s.validateStringLength(
      'schema',
      schema,
      0,
      64,
    );
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
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
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
    @_s.required String resourceArn,
    @_s.required String secretArn,
    @_s.required String transactionId,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretArn, 'secretArn');
    _s.validateStringLength(
      'secretArn',
      secretArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(transactionId, 'transactionId');
    _s.validateStringLength(
      'transactionId',
      transactionId,
      0,
      192,
      isRequired: true,
    );
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
  /// <important>
  /// This operation is deprecated. Use the <code>BatchExecuteStatement</code>
  /// or <code>ExecuteStatement</code> operation.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [awsSecretStoreArn] :
  /// The Amazon Resource Name (ARN) of the secret that enables access to the DB
  /// cluster.
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
  @Deprecated('Deprecated')
  Future<ExecuteSqlResponse> executeSql({
    @_s.required String awsSecretStoreArn,
    @_s.required String dbClusterOrInstanceArn,
    @_s.required String sqlStatements,
    String database,
    String schema,
  }) async {
    ArgumentError.checkNotNull(awsSecretStoreArn, 'awsSecretStoreArn');
    _s.validateStringLength(
      'awsSecretStoreArn',
      awsSecretStoreArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        dbClusterOrInstanceArn, 'dbClusterOrInstanceArn');
    _s.validateStringLength(
      'dbClusterOrInstanceArn',
      dbClusterOrInstanceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sqlStatements, 'sqlStatements');
    _s.validateStringLength(
      'sqlStatements',
      sqlStatements,
      0,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'database',
      database,
      0,
      64,
    );
    _s.validateStringLength(
      'schema',
      schema,
      0,
      64,
    );
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
  /// <important>
  /// If a call isn't part of a transaction because it doesn't include the
  /// <code>transactionID</code> parameter, changes that result from the call
  /// are committed automatically.
  /// </important>
  /// The response size limit is 1 MB. If the call returns more than 1 MB of
  /// response data, the call is terminated.
  ///
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.
  ///
  /// Parameter [secretArn] :
  /// The name or ARN of the secret that enables access to the DB cluster.
  ///
  /// Parameter [sql] :
  /// The SQL statement to run.
  ///
  /// Parameter [continueAfterTimeout] :
  /// A value that indicates whether to continue running the statement after the
  /// call times out. By default, the statement stops running when the call
  /// times out.
  /// <important>
  /// For DDL statements, we recommend continuing to run the statement after the
  /// call times out. When a DDL statement terminates before it is finished
  /// running, it can result in errors and possibly corrupted data structures.
  /// </important>
  ///
  /// Parameter [database] :
  /// The name of the database.
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
  ///
  /// Parameter [transactionId] :
  /// The identifier of a transaction that was started by using the
  /// <code>BeginTransaction</code> operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<ExecuteStatementResponse> executeStatement({
    @_s.required String resourceArn,
    @_s.required String secretArn,
    @_s.required String sql,
    bool continueAfterTimeout,
    String database,
    bool includeResultMetadata,
    List<SqlParameter> parameters,
    ResultSetOptions resultSetOptions,
    String schema,
    String transactionId,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretArn, 'secretArn');
    _s.validateStringLength(
      'secretArn',
      secretArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sql, 'sql');
    _s.validateStringLength(
      'sql',
      sql,
      0,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'database',
      database,
      0,
      64,
    );
    _s.validateStringLength(
      'schema',
      schema,
      0,
      64,
    );
    _s.validateStringLength(
      'transactionId',
      transactionId,
      0,
      192,
    );
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'sql': sql,
      if (continueAfterTimeout != null)
        'continueAfterTimeout': continueAfterTimeout,
      if (database != null) 'database': database,
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
  /// May throw [BadRequestException].
  /// May throw [StatementTimeoutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableError].
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
    @_s.required String resourceArn,
    @_s.required String secretArn,
    @_s.required String transactionId,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretArn, 'secretArn');
    _s.validateStringLength(
      'secretArn',
      secretArn,
      11,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(transactionId, 'transactionId');
    _s.validateStringLength(
      'transactionId',
      transactionId,
      0,
      192,
      isRequired: true,
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ArrayValue {
  /// An array of arrays.
  @_s.JsonKey(name: 'arrayValues')
  final List<ArrayValue> arrayValues;

  /// An array of Boolean values.
  @_s.JsonKey(name: 'booleanValues')
  final List<bool> booleanValues;

  /// An array of integers.
  @_s.JsonKey(name: 'doubleValues')
  final List<double> doubleValues;

  /// An array of floating point numbers.
  @_s.JsonKey(name: 'longValues')
  final List<int> longValues;

  /// An array of strings.
  @_s.JsonKey(name: 'stringValues')
  final List<String> stringValues;

  ArrayValue({
    this.arrayValues,
    this.booleanValues,
    this.doubleValues,
    this.longValues,
    this.stringValues,
  });
  factory ArrayValue.fromJson(Map<String, dynamic> json) =>
      _$ArrayValueFromJson(json);

  Map<String, dynamic> toJson() => _$ArrayValueToJson(this);
}

/// The response elements represent the output of a SQL statement over an array
/// of data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchExecuteStatementResponse {
  /// The execution results of each batch entry.
  @_s.JsonKey(name: 'updateResults')
  final List<UpdateResult> updateResults;

  BatchExecuteStatementResponse({
    this.updateResults,
  });
  factory BatchExecuteStatementResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchExecuteStatementResponseFromJson(json);
}

/// The response elements represent the output of a request to start a SQL
/// transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BeginTransactionResponse {
  /// The transaction ID of the transaction started by the call.
  @_s.JsonKey(name: 'transactionId')
  final String transactionId;

  BeginTransactionResponse({
    this.transactionId,
  });
  factory BeginTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$BeginTransactionResponseFromJson(json);
}

/// Contains the metadata for a column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnMetadata {
  /// The type of the column.
  @_s.JsonKey(name: 'arrayBaseColumnType')
  final int arrayBaseColumnType;

  /// A value that indicates whether the column increments automatically.
  @_s.JsonKey(name: 'isAutoIncrement')
  final bool isAutoIncrement;

  /// A value that indicates whether the column is case-sensitive.
  @_s.JsonKey(name: 'isCaseSensitive')
  final bool isCaseSensitive;

  /// A value that indicates whether the column contains currency values.
  @_s.JsonKey(name: 'isCurrency')
  final bool isCurrency;

  /// A value that indicates whether an integer column is signed.
  @_s.JsonKey(name: 'isSigned')
  final bool isSigned;

  /// The label for the column.
  @_s.JsonKey(name: 'label')
  final String label;

  /// The name of the column.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A value that indicates whether the column is nullable.
  @_s.JsonKey(name: 'nullable')
  final int nullable;

  /// The precision value of a decimal number column.
  @_s.JsonKey(name: 'precision')
  final int precision;

  /// The scale value of a decimal number column.
  @_s.JsonKey(name: 'scale')
  final int scale;

  /// The name of the schema that owns the table that includes the column.
  @_s.JsonKey(name: 'schemaName')
  final String schemaName;

  /// The name of the table that includes the column.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  /// The type of the column.
  @_s.JsonKey(name: 'type')
  final int type;

  /// The database-specific data type of the column.
  @_s.JsonKey(name: 'typeName')
  final String typeName;

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
  factory ColumnMetadata.fromJson(Map<String, dynamic> json) =>
      _$ColumnMetadataFromJson(json);
}

/// The response elements represent the output of a commit transaction request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommitTransactionResponse {
  /// The status of the commit operation.
  @_s.JsonKey(name: 'transactionStatus')
  final String transactionStatus;

  CommitTransactionResponse({
    this.transactionStatus,
  });
  factory CommitTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$CommitTransactionResponseFromJson(json);
}

enum DecimalReturnType {
  @_s.JsonValue('DOUBLE_OR_LONG')
  doubleOrLong,
  @_s.JsonValue('STRING')
  string,
}

/// The response elements represent the output of a request to run one or more
/// SQL statements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteSqlResponse {
  /// The results of the SQL statement or statements.
  @_s.JsonKey(name: 'sqlStatementResults')
  final List<SqlStatementResult> sqlStatementResults;

  ExecuteSqlResponse({
    this.sqlStatementResults,
  });
  factory ExecuteSqlResponse.fromJson(Map<String, dynamic> json) =>
      _$ExecuteSqlResponseFromJson(json);
}

/// The response elements represent the output of a request to run a SQL
/// statement against a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteStatementResponse {
  /// Metadata for the columns included in the results.
  @_s.JsonKey(name: 'columnMetadata')
  final List<ColumnMetadata> columnMetadata;

  /// Values for fields generated during the request.
  /// <pre><code> &lt;note&gt; &lt;p&gt;The
  /// &lt;code&gt;generatedFields&lt;/code&gt; data isn't supported by Aurora
  /// PostgreSQL. To get the values of generated fields, use the
  /// &lt;code&gt;RETURNING&lt;/code&gt; clause. For more information, see &lt;a
  /// href=&quot;https://www.postgresql.org/docs/10/dml-returning.html&quot;&gt;Returning
  /// Data From Modified Rows&lt;/a&gt; in the PostgreSQL documentation.&lt;/p&gt;
  /// &lt;/note&gt; </code></pre>
  @_s.JsonKey(name: 'generatedFields')
  final List<Field> generatedFields;

  /// The number of records updated by the request.
  @_s.JsonKey(name: 'numberOfRecordsUpdated')
  final int numberOfRecordsUpdated;

  /// The records returned by the SQL statement.
  @_s.JsonKey(name: 'records')
  final List<List<Field>> records;

  ExecuteStatementResponse({
    this.columnMetadata,
    this.generatedFields,
    this.numberOfRecordsUpdated,
    this.records,
  });
  factory ExecuteStatementResponse.fromJson(Map<String, dynamic> json) =>
      _$ExecuteStatementResponseFromJson(json);
}

/// Contains a value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Field {
  /// An array of values.
  @_s.JsonKey(name: 'arrayValue')
  final ArrayValue arrayValue;

  /// A value of BLOB data type.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'blobValue')
  final Uint8List blobValue;

  /// A value of Boolean data type.
  @_s.JsonKey(name: 'booleanValue')
  final bool booleanValue;

  /// A value of double data type.
  @_s.JsonKey(name: 'doubleValue')
  final double doubleValue;

  /// A NULL value.
  @_s.JsonKey(name: 'isNull')
  final bool isNull;

  /// A value of long data type.
  @_s.JsonKey(name: 'longValue')
  final int longValue;

  /// A value of string data type.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  Field({
    this.arrayValue,
    this.blobValue,
    this.booleanValue,
    this.doubleValue,
    this.isNull,
    this.longValue,
    this.stringValue,
  });
  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

/// A record returned by a call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Record {
  /// The values returned in the record.
  @_s.JsonKey(name: 'values')
  final List<Value> values;

  Record({
    this.values,
  });
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

/// The result set returned by a SQL statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultFrame {
  /// The records in the result set.
  @_s.JsonKey(name: 'records')
  final List<Record> records;

  /// The result-set metadata in the result set.
  @_s.JsonKey(name: 'resultSetMetadata')
  final ResultSetMetadata resultSetMetadata;

  ResultFrame({
    this.records,
    this.resultSetMetadata,
  });
  factory ResultFrame.fromJson(Map<String, dynamic> json) =>
      _$ResultFrameFromJson(json);
}

/// The metadata of the result set returned by a SQL statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultSetMetadata {
  /// The number of columns in the result set.
  @_s.JsonKey(name: 'columnCount')
  final int columnCount;

  /// The metadata of the columns in the result set.
  @_s.JsonKey(name: 'columnMetadata')
  final List<ColumnMetadata> columnMetadata;

  ResultSetMetadata({
    this.columnCount,
    this.columnMetadata,
  });
  factory ResultSetMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResultSetMetadataFromJson(json);
}

/// Options that control how the result set is returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResultSetOptions {
  /// A value that indicates how a field of <code>DECIMAL</code> type is
  /// represented in the response. The value of <code>STRING</code>, the default,
  /// specifies that it is converted to a String value. The value of
  /// <code>DOUBLE_OR_LONG</code> specifies that it is converted to a Long value
  /// if its scale is 0, or to a Double value otherwise.
  /// <important>
  /// Conversion to Double or Long can result in roundoff errors due to precision
  /// loss. We recommend converting to String, especially when working with
  /// currency values.
  /// </important>
  @_s.JsonKey(name: 'decimalReturnType')
  final DecimalReturnType decimalReturnType;

  ResultSetOptions({
    this.decimalReturnType,
  });
  Map<String, dynamic> toJson() => _$ResultSetOptionsToJson(this);
}

/// The response elements represent the output of a request to perform a
/// rollback of a transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RollbackTransactionResponse {
  /// The status of the rollback operation.
  @_s.JsonKey(name: 'transactionStatus')
  final String transactionStatus;

  RollbackTransactionResponse({
    this.transactionStatus,
  });
  factory RollbackTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$RollbackTransactionResponseFromJson(json);
}

/// A parameter used in a SQL statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SqlParameter {
  /// The name of the parameter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A hint that specifies the correct object type for data type mapping.
  ///
  /// <b>Values:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>DECIMAL</code> - The corresponding <code>String</code> parameter value
  /// is sent as an object of <code>DECIMAL</code> type to the database.
  /// </li>
  /// <li>
  /// <code>TIMESTAMP</code> - The corresponding <code>String</code> parameter
  /// value is sent as an object of <code>TIMESTAMP</code> type to the database.
  /// The accepted format is <code>YYYY-MM-DD HH:MM:SS[.FFF]</code>.
  /// </li>
  /// <li>
  /// <code>TIME</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>TIME</code> type to the database. The accepted
  /// format is <code>HH:MM:SS[.FFF]</code>.
  /// </li>
  /// <li>
  /// <code>DATE</code> - The corresponding <code>String</code> parameter value is
  /// sent as an object of <code>DATE</code> type to the database. The accepted
  /// format is <code>YYYY-MM-DD</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'typeHint')
  final TypeHint typeHint;

  /// The value of the parameter.
  @_s.JsonKey(name: 'value')
  final Field value;

  SqlParameter({
    this.name,
    this.typeHint,
    this.value,
  });
  Map<String, dynamic> toJson() => _$SqlParameterToJson(this);
}

/// The result of a SQL statement.
/// <pre><code> &lt;important&gt; &lt;p&gt;This data type is
/// deprecated.&lt;/p&gt; &lt;/important&gt; </code></pre>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SqlStatementResult {
  /// The number of records updated by a SQL statement.
  @_s.JsonKey(name: 'numberOfRecordsUpdated')
  final int numberOfRecordsUpdated;

  /// The result set of the SQL statement.
  @_s.JsonKey(name: 'resultFrame')
  final ResultFrame resultFrame;

  SqlStatementResult({
    this.numberOfRecordsUpdated,
    this.resultFrame,
  });
  factory SqlStatementResult.fromJson(Map<String, dynamic> json) =>
      _$SqlStatementResultFromJson(json);
}

/// A structure value returned by a call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StructValue {
  /// The attributes returned in the record.
  @_s.JsonKey(name: 'attributes')
  final List<Value> attributes;

  StructValue({
    this.attributes,
  });
  factory StructValue.fromJson(Map<String, dynamic> json) =>
      _$StructValueFromJson(json);
}

enum TypeHint {
  @_s.JsonValue('DATE')
  date,
  @_s.JsonValue('DECIMAL')
  decimal,
  @_s.JsonValue('TIME')
  time,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

/// The response elements represent the results of an update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResult {
  /// Values for fields generated during the request.
  @_s.JsonKey(name: 'generatedFields')
  final List<Field> generatedFields;

  UpdateResult({
    this.generatedFields,
  });
  factory UpdateResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateResultFromJson(json);
}

/// Contains the value of a column.
/// <pre><code> &lt;important&gt; &lt;p&gt;This data type is
/// deprecated.&lt;/p&gt; &lt;/important&gt; </code></pre>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Value {
  /// An array of column values.
  @_s.JsonKey(name: 'arrayValues')
  final List<Value> arrayValues;

  /// A value for a column of big integer data type.
  @_s.JsonKey(name: 'bigIntValue')
  final int bigIntValue;

  /// A value for a column of BIT data type.
  @_s.JsonKey(name: 'bitValue')
  final bool bitValue;

  /// A value for a column of BLOB data type.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'blobValue')
  final Uint8List blobValue;

  /// A value for a column of double data type.
  @_s.JsonKey(name: 'doubleValue')
  final double doubleValue;

  /// A value for a column of integer data type.
  @_s.JsonKey(name: 'intValue')
  final int intValue;

  /// A NULL value.
  @_s.JsonKey(name: 'isNull')
  final bool isNull;

  /// A value for a column of real data type.
  @_s.JsonKey(name: 'realValue')
  final double realValue;

  /// A value for a column of string data type.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  /// A value for a column of STRUCT data type.
  @_s.JsonKey(name: 'structValue')
  final StructValue structValue;

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
  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String type, String message})
      : super(type: type, code: 'ServiceUnavailableError', message: message);
}

class StatementTimeoutException extends _s.GenericAwsException {
  StatementTimeoutException({String type, String message})
      : super(type: type, code: 'StatementTimeoutException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableError': (type, message) =>
      ServiceUnavailableError(type: type, message: message),
  'StatementTimeoutException': (type, message) =>
      StatementTimeoutException(type: type, message: message),
};
