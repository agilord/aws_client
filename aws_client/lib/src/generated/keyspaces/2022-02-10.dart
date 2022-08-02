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

/// Amazon Keyspaces (for Apache Cassandra) is a scalable, highly available, and
/// managed Apache Cassandra-compatible database service. Amazon Keyspaces makes
/// it easy to migrate, run, and scale Cassandra workloads in the Amazon Web
/// Services Cloud. With just a few clicks on the Amazon Web Services Management
/// Console or a few lines of code, you can create keyspaces and tables in
/// Amazon Keyspaces, without deploying any infrastructure or installing
/// software.
///
/// In addition to supporting Cassandra Query Language (CQL) requests via
/// open-source Cassandra drivers, Amazon Keyspaces supports data definition
/// language (DDL) operations to manage keyspaces and tables using the Amazon
/// Web Services SDK and CLI. This API reference describes the supported DDL
/// operations in detail.
///
/// For the list of all supported CQL APIs, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cassandra-apis.html">Supported
/// Cassandra APIs, operations, and data types in Amazon Keyspaces</a> in the
/// <i>Amazon Keyspaces Developer Guide</i>.
///
/// To learn how Amazon Keyspaces API actions are recorded with CloudTrail, see
/// <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/logging-using-cloudtrail.html#service-name-info-in-cloudtrail">Amazon
/// Keyspaces information in CloudTrail</a> in the <i>Amazon Keyspaces Developer
/// Guide</i>.
///
/// For more information about Amazon Web Services APIs, for example how to
/// implement retry logic or how to sign Amazon Web Services API requests, see
/// <a href="https://docs.aws.amazon.com/general/latest/gr/aws-apis.html">Amazon
/// Web Services APIs</a> in the <i>General Reference</i>.
class Keyspaces {
  final _s.JsonProtocol _protocol;
  Keyspaces({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cassandra',
            signingName: 'cassandra',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// The <code>CreateKeyspace</code> operation adds a new keyspace to your
  /// account. In an Amazon Web Services account, keyspace names must be unique
  /// within each Region.
  ///
  /// <code>CreateKeyspace</code> is an asynchronous operation. You can monitor
  /// the creation status of the new keyspace by using the
  /// <code>GetKeyspace</code> operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-keyspaces.html#keyspaces-create">Creating
  /// keyspaces</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace to be created.
  ///
  /// Parameter [tags] :
  /// A list of key-value pair tags to be attached to the keyspace.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html">Adding
  /// tags and labels to Amazon Keyspaces resources</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  Future<CreateKeyspaceResponse> createKeyspace({
    required String keyspaceName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.CreateKeyspace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateKeyspaceResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateTable</code> operation adds a new table to the specified
  /// keyspace. Within a keyspace, table names must be unique.
  ///
  /// <code>CreateTable</code> is an asynchronous operation. When the request is
  /// received, the status of the table is set to <code>CREATING</code>. You can
  /// monitor the creation status of the new table by using the
  /// <code>GetTable</code> operation, which returns the current
  /// <code>status</code> of the table. You can start using a table when the
  /// status is <code>ACTIVE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-tables.html#tables-create">Creating
  /// tables</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace that the table is going to be created in.
  ///
  /// Parameter [schemaDefinition] :
  /// The <code>schemaDefinition</code> consists of the following parameters.
  ///
  /// For each column to be created:
  ///
  /// • <code>name</code> - The name of the column.
  ///
  /// • <code>type</code> - An Amazon Keyspaces data type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types">Data
  /// types</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// The primary key of the table consists of the following columns:
  ///
  /// • <code>partitionKeys</code> - The partition key can be a single column,
  /// or it can be a compound value composed of two or more columns. The
  /// partition key portion of the primary key is required and determines how
  /// Amazon Keyspaces stores your data.
  ///
  /// • <code>name</code> - The name of each partition key column.
  ///
  /// • <code>clusteringKeys</code> - The optional clustering column portion of
  /// your primary key determines how the data is clustered and sorted within
  /// each partition.
  ///
  /// • <code>name</code> - The name of the clustering column.
  ///
  /// • <code>orderBy</code> - Sets the ascendant (<code>ASC</code>) or
  /// descendant (<code>DESC</code>) order modifier.
  ///
  /// To define a column as static use <code>staticColumns</code> - Static
  /// columns store values that are shared by all rows in the same partition:
  ///
  /// • <code>name</code> - The name of the column.
  ///
  /// • <code>type</code> - An Amazon Keyspaces data type.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  ///
  /// Parameter [capacitySpecification] :
  /// Specifies the read/write throughput capacity mode for the table. The
  /// options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code> and
  ///
  /// • <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  ///
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [comment] :
  /// This parameter allows to enter a description of the table.
  ///
  /// Parameter [defaultTimeToLive] :
  /// The default Time to Live setting in seconds for the table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl">Setting
  /// the default TTL value for a table</a> in the <i>Amazon Keyspaces Developer
  /// Guide</i>.
  ///
  /// Parameter [encryptionSpecification] :
  /// Specifies how the encryption key for encryption at rest is managed for the
  /// table. You can choose one of the following KMS key (KMS key):
  ///
  /// • <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  ///
  /// • <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  ///
  /// The default is <code>type:AWS_OWNED_KMS_KEY</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">Encryption
  /// at rest</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [pointInTimeRecovery] :
  /// Specifies if <code>pointInTimeRecovery</code> is enabled or disabled for
  /// the table. The options are:
  ///
  /// • <code>ENABLED</code>
  ///
  /// • <code>DISABLED</code>
  ///
  /// If it's not specified, the default is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pair tags to be attached to the resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html">Adding
  /// tags and labels to Amazon Keyspaces resources</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  ///
  /// Parameter [ttl] :
  /// Enables Time to Live custom settings for the table. The options are:
  ///
  /// • <code>status:enabled</code>
  ///
  /// • <code>status:disabled</code>
  ///
  /// The default is <code>status:disabled</code>. After <code>ttl</code> is
  /// enabled, you can't disable it for the table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html">Expiring
  /// data by using Amazon Keyspaces Time to Live (TTL)</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  Future<CreateTableResponse> createTable({
    required String keyspaceName,
    required SchemaDefinition schemaDefinition,
    required String tableName,
    CapacitySpecification? capacitySpecification,
    Comment? comment,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    List<Tag>? tags,
    TimeToLive? ttl,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    ArgumentError.checkNotNull(schemaDefinition, 'schemaDefinition');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateNumRange(
      'defaultTimeToLive',
      defaultTimeToLive,
      1,
      630720000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'schemaDefinition': schemaDefinition,
        'tableName': tableName,
        if (capacitySpecification != null)
          'capacitySpecification': capacitySpecification,
        if (comment != null) 'comment': comment,
        if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
        if (encryptionSpecification != null)
          'encryptionSpecification': encryptionSpecification,
        if (pointInTimeRecovery != null)
          'pointInTimeRecovery': pointInTimeRecovery,
        if (tags != null) 'tags': tags,
        if (ttl != null) 'ttl': ttl,
      },
    );

    return CreateTableResponse.fromJson(jsonResponse.body);
  }

  /// The <code>DeleteKeyspace</code> operation deletes a keyspace and all of
  /// its tables.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace to be deleted.
  Future<void> deleteKeyspace({
    required String keyspaceName,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.DeleteKeyspace'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
      },
    );
  }

  /// The <code>DeleteTable</code> operation deletes a table and all of its
  /// data. After a <code>DeleteTable</code> request is received, the specified
  /// table is in the <code>DELETING</code> state until Amazon Keyspaces
  /// completes the deletion. If the table is in the <code>ACTIVE</code> state,
  /// you can delete it. If a table is either in the <code>CREATING</code> or
  /// <code>UPDATING</code> states, then Amazon Keyspaces returns a
  /// <code>ResourceInUseException</code>. If the specified table does not
  /// exist, Amazon Keyspaces returns a <code>ResourceNotFoundException</code>.
  /// If the table is already in the <code>DELETING</code> state, no error is
  /// returned.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace of the to be deleted table.
  ///
  /// Parameter [tableName] :
  /// The name of the table to be deleted.
  Future<void> deleteTable({
    required String keyspaceName,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    ArgumentError.checkNotNull(tableName, 'tableName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.DeleteTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'tableName': tableName,
      },
    );
  }

  /// Returns the name and the Amazon Resource Name (ARN) of the specified
  /// table.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace.
  Future<GetKeyspaceResponse> getKeyspace({
    required String keyspaceName,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.GetKeyspace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
      },
    );

    return GetKeyspaceResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the table, including the table's name and
  /// current status, the keyspace name, configuration settings, and metadata.
  ///
  /// To read table metadata using <code>GetTable</code>, <code>Select</code>
  /// action permissions for the table and system tables are required to
  /// complete the operation.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace that the table is stored in.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  Future<GetTableResponse> getTable({
    required String keyspaceName,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    ArgumentError.checkNotNull(tableName, 'tableName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.GetTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'tableName': tableName,
      },
    );

    return GetTableResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of keyspaces.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The total number of keyspaces to return in the output. If the total number
  /// of keyspaces available is more than the value specified, a
  /// <code>NextToken</code> is provided in the output. To resume pagination,
  /// provide the <code>NextToken</code> value as an argument of a subsequent
  /// API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the
  /// <code>NextToken</code> value as argument of a subsequent API invocation.
  Future<ListKeyspacesResponse> listKeyspaces({
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
      'X-Amz-Target': 'KeyspacesService.ListKeyspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListKeyspacesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of tables for a specified keyspace.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace.
  ///
  /// Parameter [maxResults] :
  /// The total number of tables to return in the output. If the total number of
  /// tables available is more than the value specified, a
  /// <code>NextToken</code> is provided in the output. To resume pagination,
  /// provide the <code>NextToken</code> value as an argument of a subsequent
  /// API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the
  /// <code>NextToken</code> value as an argument of a subsequent API
  /// invocation.
  Future<ListTablesResponse> listTables({
    required String keyspaceName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.ListTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTablesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all tags associated with the specified Amazon Keyspaces
  /// resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Keyspaces resource.
  ///
  /// Parameter [maxResults] :
  /// The total number of tags to return in the output. If the total number of
  /// tags available is more than the value specified, a <code>NextToken</code>
  /// is provided in the output. To resume pagination, provide the
  /// <code>NextToken</code> value as an argument of a subsequent API
  /// invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the
  /// <code>NextToken</code> value as argument of a subsequent API invocation.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Restores the specified table to the specified point in time within the
  /// <code>earliest_restorable_timestamp</code> and the current time. For more
  /// information about restore points, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window">
  /// Time window for PITR continuous backups</a> in the <i>Amazon Keyspaces
  /// Developer Guide</i>.
  ///
  /// Any number of users can execute up to 4 concurrent restores (any type of
  /// restore) in a given account.
  ///
  /// When you restore using point in time recovery, Amazon Keyspaces restores
  /// your source table's schema and data to the state based on the selected
  /// timestamp <code>(day:hour:minute:second)</code> to a new table. The Time
  /// to Live (TTL) settings are also restored to the state based on the
  /// selected timestamp.
  ///
  /// In addition to the table's schema, data, and TTL settings,
  /// <code>RestoreTable</code> restores the capacity mode, encryption, and
  /// point-in-time recovery settings from the source table. Unlike the table's
  /// schema data and TTL settings, which are restored based on the selected
  /// timestamp, these settings are always restored based on the table's
  /// settings as of the current time or when the table was deleted.
  ///
  /// You can also overwrite these settings during restore:
  ///
  /// • Read/write capacity mode
  ///
  /// • Provisioned throughput capacity settings
  ///
  /// • Point-in-time (PITR) settings
  ///
  /// • Tags
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings">PITR
  /// restore settings</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Note that the following settings are not restored, and you must configure
  /// them manually for the new table:
  ///
  /// • Automatic scaling policies (for tables that use provisioned capacity
  /// mode)
  ///
  /// • Identity and Access Management (IAM) policies
  ///
  /// • Amazon CloudWatch metrics and alarms
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sourceKeyspaceName] :
  /// The keyspace name of the source table.
  ///
  /// Parameter [sourceTableName] :
  /// The name of the source table.
  ///
  /// Parameter [targetKeyspaceName] :
  /// The name of the target keyspace.
  ///
  /// Parameter [targetTableName] :
  /// The name of the target table.
  ///
  /// Parameter [capacitySpecificationOverride] :
  /// Specifies the read/write throughput capacity mode for the target table.
  /// The options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code>
  ///
  /// • <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  ///
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [encryptionSpecificationOverride] :
  /// Specifies the encryption settings for the target table. You can choose one
  /// of the following KMS key (KMS key):
  ///
  /// • <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  ///
  /// • <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  ///
  /// The default is <code>type:AWS_OWNED_KMS_KEY</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">Encryption
  /// at rest</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [pointInTimeRecoveryOverride] :
  /// Specifies the <code>pointInTimeRecovery</code> settings for the target
  /// table. The options are:
  ///
  /// • <code>ENABLED</code>
  ///
  /// • <code>DISABLED</code>
  ///
  /// If it's not specified, the default is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [restoreTimestamp] :
  /// The restore timestamp in ISO 8601 format.
  ///
  /// Parameter [tagsOverride] :
  /// A list of key-value pair tags to be attached to the restored table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html">Adding
  /// tags and labels to Amazon Keyspaces resources</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  Future<RestoreTableResponse> restoreTable({
    required String sourceKeyspaceName,
    required String sourceTableName,
    required String targetKeyspaceName,
    required String targetTableName,
    CapacitySpecification? capacitySpecificationOverride,
    EncryptionSpecification? encryptionSpecificationOverride,
    PointInTimeRecovery? pointInTimeRecoveryOverride,
    DateTime? restoreTimestamp,
    List<Tag>? tagsOverride,
  }) async {
    ArgumentError.checkNotNull(sourceKeyspaceName, 'sourceKeyspaceName');
    ArgumentError.checkNotNull(sourceTableName, 'sourceTableName');
    ArgumentError.checkNotNull(targetKeyspaceName, 'targetKeyspaceName');
    ArgumentError.checkNotNull(targetTableName, 'targetTableName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.RestoreTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'sourceKeyspaceName': sourceKeyspaceName,
        'sourceTableName': sourceTableName,
        'targetKeyspaceName': targetKeyspaceName,
        'targetTableName': targetTableName,
        if (capacitySpecificationOverride != null)
          'capacitySpecificationOverride': capacitySpecificationOverride,
        if (encryptionSpecificationOverride != null)
          'encryptionSpecificationOverride': encryptionSpecificationOverride,
        if (pointInTimeRecoveryOverride != null)
          'pointInTimeRecoveryOverride': pointInTimeRecoveryOverride,
        if (restoreTimestamp != null)
          'restoreTimestamp': unixTimestampToJson(restoreTimestamp),
        if (tagsOverride != null) 'tagsOverride': tagsOverride,
      },
    );

    return RestoreTableResponse.fromJson(jsonResponse.body);
  }

  /// Associates a set of tags with a Amazon Keyspaces resource. You can then
  /// activate these user-defined tags so that they appear on the Cost
  /// Management Console for cost allocation tracking. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html">Adding
  /// tags and labels to Amazon Keyspaces resources</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  ///
  /// For IAM policy examples that show how to control access to Amazon
  /// Keyspaces resources based on tags, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples-tags">Amazon
  /// Keyspaces resource access based on tags</a> in the <i>Amazon Keyspaces
  /// Developer Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Keyspaces resource to which
  /// to add tags.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon Keyspaces resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes the association of tags from a Amazon Keyspaces resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Keyspaces resource that the tags will be removed from. This
  /// value is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// A list of existing tags to be removed from the Amazon Keyspaces resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Adds new columns to the table or updates one of the table's settings, for
  /// example capacity mode, encryption, point-in-time recovery, or ttl
  /// settings. Note that you can only update one specific table setting per
  /// update operation.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace the specified table is stored in.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  ///
  /// Parameter [addColumns] :
  /// For each column to be added to the specified table:
  ///
  /// • <code>name</code> - The name of the column.
  ///
  /// • <code>type</code> - An Amazon Keyspaces data type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types">Data
  /// types</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [capacitySpecification] :
  /// Modifies the read/write throughput capacity mode for the table. The
  /// options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code> and
  ///
  /// • <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  ///
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [defaultTimeToLive] :
  /// The default Time to Live setting in seconds for the table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl">Setting
  /// the default TTL value for a table</a> in the <i>Amazon Keyspaces Developer
  /// Guide</i>.
  ///
  /// Parameter [encryptionSpecification] :
  /// Modifies the encryption settings of the table. You can choose one of the
  /// following KMS key (KMS key):
  ///
  /// • <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  ///
  /// • <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  ///
  /// The default is <code>AWS_OWNED_KMS_KEY</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">Encryption
  /// at rest</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [pointInTimeRecovery] :
  /// Modifies the <code>pointInTimeRecovery</code> settings of the table. The
  /// options are:
  ///
  /// • <code>ENABLED</code>
  ///
  /// • <code>DISABLED</code>
  ///
  /// If it's not specified, the default is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [ttl] :
  /// Modifies Time to Live custom settings for the table. The options are:
  ///
  /// • <code>status:enabled</code>
  ///
  /// • <code>status:disabled</code>
  ///
  /// The default is <code>status:disabled</code>. After <code>ttl</code> is
  /// enabled, you can't disable it for the table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html">Expiring
  /// data by using Amazon Keyspaces Time to Live (TTL)</a> in the <i>Amazon
  /// Keyspaces Developer Guide</i>.
  Future<UpdateTableResponse> updateTable({
    required String keyspaceName,
    required String tableName,
    List<ColumnDefinition>? addColumns,
    CapacitySpecification? capacitySpecification,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    TimeToLive? ttl,
  }) async {
    ArgumentError.checkNotNull(keyspaceName, 'keyspaceName');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateNumRange(
      'defaultTimeToLive',
      defaultTimeToLive,
      1,
      630720000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'tableName': tableName,
        if (addColumns != null) 'addColumns': addColumns,
        if (capacitySpecification != null)
          'capacitySpecification': capacitySpecification,
        if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
        if (encryptionSpecification != null)
          'encryptionSpecification': encryptionSpecification,
        if (pointInTimeRecovery != null)
          'pointInTimeRecovery': pointInTimeRecovery,
        if (ttl != null) 'ttl': ttl,
      },
    );

    return UpdateTableResponse.fromJson(jsonResponse.body);
  }
}

/// Amazon Keyspaces has two read/write capacity modes for processing reads and
/// writes on your tables:
///
/// • On-demand (default)
///
/// • Provisioned
///
/// The read/write capacity mode that you choose controls how you are charged
/// for read and write throughput and how table throughput capacity is managed.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
/// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class CapacitySpecification {
  /// The read/write throughput capacity mode for a table. The options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code> and
  ///
  /// • <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and <code>writeCapacityUnits</code>
  /// as input.
  ///
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  final ThroughputMode throughputMode;

  /// The throughput capacity specified for <code>read</code> operations defined
  /// in <code>read capacity units</code> <code>(RCUs)</code>.
  final int? readCapacityUnits;

  /// The throughput capacity specified for <code>write</code> operations defined
  /// in <code>write capacity units</code> <code>(WCUs)</code>.
  final int? writeCapacityUnits;

  CapacitySpecification({
    required this.throughputMode,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory CapacitySpecification.fromJson(Map<String, dynamic> json) {
    return CapacitySpecification(
      throughputMode: (json['throughputMode'] as String).toThroughputMode(),
      readCapacityUnits: json['readCapacityUnits'] as int?,
      writeCapacityUnits: json['writeCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final throughputMode = this.throughputMode;
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      'throughputMode': throughputMode.toValue(),
      if (readCapacityUnits != null) 'readCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'writeCapacityUnits': writeCapacityUnits,
    };
  }
}

/// The read/write throughput capacity mode for a table. The options are:
///
/// • <code>throughputMode:PAY_PER_REQUEST</code> and
///
/// • <code>throughputMode:PROVISIONED</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
/// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class CapacitySpecificationSummary {
  /// The read/write throughput capacity mode for a table. The options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code> and
  ///
  /// • <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and <code>writeCapacityUnits</code>
  /// as input.
  ///
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  final ThroughputMode throughputMode;

  /// The timestamp of the last operation that changed the provisioned throughput
  /// capacity of a table.
  final DateTime? lastUpdateToPayPerRequestTimestamp;

  /// The throughput capacity specified for <code>read</code> operations defined
  /// in <code>read capacity units</code> <code>(RCUs)</code>.
  final int? readCapacityUnits;

  /// The throughput capacity specified for <code>write</code> operations defined
  /// in <code>write capacity units</code> <code>(WCUs)</code>.
  final int? writeCapacityUnits;

  CapacitySpecificationSummary({
    required this.throughputMode,
    this.lastUpdateToPayPerRequestTimestamp,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory CapacitySpecificationSummary.fromJson(Map<String, dynamic> json) {
    return CapacitySpecificationSummary(
      throughputMode: (json['throughputMode'] as String).toThroughputMode(),
      lastUpdateToPayPerRequestTimestamp:
          timeStampFromJson(json['lastUpdateToPayPerRequestTimestamp']),
      readCapacityUnits: json['readCapacityUnits'] as int?,
      writeCapacityUnits: json['writeCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final throughputMode = this.throughputMode;
    final lastUpdateToPayPerRequestTimestamp =
        this.lastUpdateToPayPerRequestTimestamp;
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      'throughputMode': throughputMode.toValue(),
      if (lastUpdateToPayPerRequestTimestamp != null)
        'lastUpdateToPayPerRequestTimestamp':
            unixTimestampToJson(lastUpdateToPayPerRequestTimestamp),
      if (readCapacityUnits != null) 'readCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'writeCapacityUnits': writeCapacityUnits,
    };
  }
}

/// The optional clustering column portion of your primary key determines how
/// the data is clustered and sorted within each partition.
class ClusteringKey {
  /// The name(s) of the clustering column(s).
  final String name;

  /// Sets the ascendant (<code>ASC</code>) or descendant (<code>DESC</code>)
  /// order modifier.
  final SortOrder orderBy;

  ClusteringKey({
    required this.name,
    required this.orderBy,
  });

  factory ClusteringKey.fromJson(Map<String, dynamic> json) {
    return ClusteringKey(
      name: json['name'] as String,
      orderBy: (json['orderBy'] as String).toSortOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final orderBy = this.orderBy;
    return {
      'name': name,
      'orderBy': orderBy.toValue(),
    };
  }
}

/// The names and data types of regular columns.
class ColumnDefinition {
  /// The name of the column.
  final String name;

  /// The data type of the column. For a list of available data types, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types">Data
  /// types</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  final String type;

  ColumnDefinition({
    required this.name,
    required this.type,
  });

  factory ColumnDefinition.fromJson(Map<String, dynamic> json) {
    return ColumnDefinition(
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// An optional comment that describes the table.
class Comment {
  /// An optional description of the table.
  final String message;

  Comment({
    required this.message,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'message': message,
    };
  }
}

class CreateKeyspaceResponse {
  /// The unique identifier of the keyspace in the format of an Amazon Resource
  /// Name (ARN).
  final String resourceArn;

  CreateKeyspaceResponse({
    required this.resourceArn,
  });

  factory CreateKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeyspaceResponse(
      resourceArn: json['resourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
    };
  }
}

class CreateTableResponse {
  /// The unique identifier of the table in the format of an Amazon Resource Name
  /// (ARN).
  final String resourceArn;

  CreateTableResponse({
    required this.resourceArn,
  });

  factory CreateTableResponse.fromJson(Map<String, dynamic> json) {
    return CreateTableResponse(
      resourceArn: json['resourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
    };
  }
}

class DeleteKeyspaceResponse {
  DeleteKeyspaceResponse();

  factory DeleteKeyspaceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKeyspaceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTableResponse {
  DeleteTableResponse();

  factory DeleteTableResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Amazon Keyspaces encrypts and decrypts the table data at rest transparently
/// and integrates with Key Management Service for storing and managing the
/// encryption key. You can choose one of the following KMS keys (KMS keys):
///
/// • Amazon Web Services owned key - This is the default encryption type. The
/// key is owned by Amazon Keyspaces (no additional charge).
///
/// • Customer managed key - This key is stored in your account and is created,
/// owned, and managed by you. You have full control over the customer managed
/// key (KMS charges apply).
///
/// For more information about encryption at rest in Amazon Keyspaces, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">Encryption
/// at rest</a> in the <i>Amazon Keyspaces Developer Guide</i>.
///
/// For more information about KMS, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">KMS
/// management service concepts</a> in the <i>Key Management Service Developer
/// Guide</i>.
class EncryptionSpecification {
  /// The encryption option specified for the table. You can choose one of the
  /// following KMS keys (KMS keys):
  ///
  /// • <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  ///
  /// • <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires the
  /// <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name (ARN)
  /// format as input.
  ///
  /// The default is <code>type:AWS_OWNED_KMS_KEY</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html">Encryption
  /// at rest</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  final EncryptionType type;

  /// The Amazon Resource Name (ARN) of the customer managed KMS key, for example
  /// <code>kms_key_identifier:ARN</code>.
  final String? kmsKeyIdentifier;

  EncryptionSpecification({
    required this.type,
    this.kmsKeyIdentifier,
  });

  factory EncryptionSpecification.fromJson(Map<String, dynamic> json) {
    return EncryptionSpecification(
      type: (json['type'] as String).toEncryptionType(),
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    return {
      'type': type.toValue(),
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
    };
  }
}

enum EncryptionType {
  customerManagedKmsKey,
  awsOwnedKmsKey,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.customerManagedKmsKey:
        return 'CUSTOMER_MANAGED_KMS_KEY';
      case EncryptionType.awsOwnedKmsKey:
        return 'AWS_OWNED_KMS_KEY';
    }
  }
}

extension on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'CUSTOMER_MANAGED_KMS_KEY':
        return EncryptionType.customerManagedKmsKey;
      case 'AWS_OWNED_KMS_KEY':
        return EncryptionType.awsOwnedKmsKey;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

class GetKeyspaceResponse {
  /// The name of the keyspace.
  final String keyspaceName;

  /// The ARN of the keyspace.
  final String resourceArn;

  GetKeyspaceResponse({
    required this.keyspaceName,
    required this.resourceArn,
  });

  factory GetKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyspaceResponse(
      keyspaceName: json['keyspaceName'] as String,
      resourceArn: json['resourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
    };
  }
}

class GetTableResponse {
  /// The name of the keyspace that the specified table is stored in.
  final String keyspaceName;

  /// The Amazon Resource Name (ARN) of the specified table.
  final String resourceArn;

  /// The name of the specified table.
  final String tableName;

  /// The read/write throughput capacity mode for a table. The options are:
  ///
  /// • <code>throughputMode:PAY_PER_REQUEST</code>
  ///
  /// • <code>throughputMode:PROVISIONED</code>
  final CapacitySpecificationSummary? capacitySpecification;

  /// The the description of the specified table.
  final Comment? comment;

  /// The creation timestamp of the specified table.
  final DateTime? creationTimestamp;

  /// The default Time to Live settings of the specified table.
  final int? defaultTimeToLive;

  /// The encryption settings of the specified table.
  final EncryptionSpecification? encryptionSpecification;

  /// The point-in-time recovery status of the specified table.
  final PointInTimeRecoverySummary? pointInTimeRecovery;

  /// The schema definition of the specified table.
  final SchemaDefinition? schemaDefinition;

  /// The current status of the specified table.
  final TableStatus? status;

  /// The custom Time to Live settings of the specified table.
  final TimeToLive? ttl;

  GetTableResponse({
    required this.keyspaceName,
    required this.resourceArn,
    required this.tableName,
    this.capacitySpecification,
    this.comment,
    this.creationTimestamp,
    this.defaultTimeToLive,
    this.encryptionSpecification,
    this.pointInTimeRecovery,
    this.schemaDefinition,
    this.status,
    this.ttl,
  });

  factory GetTableResponse.fromJson(Map<String, dynamic> json) {
    return GetTableResponse(
      keyspaceName: json['keyspaceName'] as String,
      resourceArn: json['resourceArn'] as String,
      tableName: json['tableName'] as String,
      capacitySpecification: json['capacitySpecification'] != null
          ? CapacitySpecificationSummary.fromJson(
              json['capacitySpecification'] as Map<String, dynamic>)
          : null,
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      defaultTimeToLive: json['defaultTimeToLive'] as int?,
      encryptionSpecification: json['encryptionSpecification'] != null
          ? EncryptionSpecification.fromJson(
              json['encryptionSpecification'] as Map<String, dynamic>)
          : null,
      pointInTimeRecovery: json['pointInTimeRecovery'] != null
          ? PointInTimeRecoverySummary.fromJson(
              json['pointInTimeRecovery'] as Map<String, dynamic>)
          : null,
      schemaDefinition: json['schemaDefinition'] != null
          ? SchemaDefinition.fromJson(
              json['schemaDefinition'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toTableStatus(),
      ttl: json['ttl'] != null
          ? TimeToLive.fromJson(json['ttl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    final tableName = this.tableName;
    final capacitySpecification = this.capacitySpecification;
    final comment = this.comment;
    final creationTimestamp = this.creationTimestamp;
    final defaultTimeToLive = this.defaultTimeToLive;
    final encryptionSpecification = this.encryptionSpecification;
    final pointInTimeRecovery = this.pointInTimeRecovery;
    final schemaDefinition = this.schemaDefinition;
    final status = this.status;
    final ttl = this.ttl;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
      'tableName': tableName,
      if (capacitySpecification != null)
        'capacitySpecification': capacitySpecification,
      if (comment != null) 'comment': comment,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
      if (encryptionSpecification != null)
        'encryptionSpecification': encryptionSpecification,
      if (pointInTimeRecovery != null)
        'pointInTimeRecovery': pointInTimeRecovery,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
      if (status != null) 'status': status.toValue(),
      if (ttl != null) 'ttl': ttl,
    };
  }
}

/// Represents the properties of a keyspace.
class KeyspaceSummary {
  /// The name of the keyspace.
  final String keyspaceName;

  /// The unique identifier of the keyspace in the format of an Amazon Resource
  /// Name (ARN).
  final String resourceArn;

  KeyspaceSummary({
    required this.keyspaceName,
    required this.resourceArn,
  });

  factory KeyspaceSummary.fromJson(Map<String, dynamic> json) {
    return KeyspaceSummary(
      keyspaceName: json['keyspaceName'] as String,
      resourceArn: json['resourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
    };
  }
}

class ListKeyspacesResponse {
  /// A list of keyspaces.
  final List<KeyspaceSummary> keyspaces;

  /// A token to specify where to start paginating. This is the
  /// <code>NextToken</code> from a previously truncated response.
  final String? nextToken;

  ListKeyspacesResponse({
    required this.keyspaces,
    this.nextToken,
  });

  factory ListKeyspacesResponse.fromJson(Map<String, dynamic> json) {
    return ListKeyspacesResponse(
      keyspaces: (json['keyspaces'] as List)
          .whereNotNull()
          .map((e) => KeyspaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaces = this.keyspaces;
    final nextToken = this.nextToken;
    return {
      'keyspaces': keyspaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTablesResponse {
  /// A token to specify where to start paginating. This is the
  /// <code>NextToken</code> from a previously truncated response.
  final String? nextToken;

  /// A list of tables.
  final List<TableSummary>? tables;

  ListTablesResponse({
    this.nextToken,
    this.tables,
  });

  factory ListTablesResponse.fromJson(Map<String, dynamic> json) {
    return ListTablesResponse(
      nextToken: json['nextToken'] as String?,
      tables: (json['tables'] as List?)
          ?.whereNotNull()
          .map((e) => TableSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tables = this.tables;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tables != null) 'tables': tables,
    };
  }
}

class ListTagsForResourceResponse {
  /// A token to specify where to start paginating. This is the
  /// <code>NextToken</code> from a previously truncated response.
  final String? nextToken;

  /// A list of tags.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The partition key portion of the primary key is required and determines how
/// Amazon Keyspaces stores the data. The partition key can be a single column,
/// or it can be a compound value composed of two or more columns.
class PartitionKey {
  /// The name(s) of the partition key column(s).
  final String name;

  PartitionKey({
    required this.name,
  });

  factory PartitionKey.fromJson(Map<String, dynamic> json) {
    return PartitionKey(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Point-in-time recovery (PITR) helps protect your Amazon Keyspaces tables
/// from accidental write or delete operations by providing you continuous
/// backups of your table data.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
/// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class PointInTimeRecovery {
  /// The options are:
  ///
  /// • <code>ENABLED</code>
  ///
  /// • <code>DISABLED</code>
  final PointInTimeRecoveryStatus status;

  PointInTimeRecovery({
    required this.status,
  });

  factory PointInTimeRecovery.fromJson(Map<String, dynamic> json) {
    return PointInTimeRecovery(
      status: (json['status'] as String).toPointInTimeRecoveryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum PointInTimeRecoveryStatus {
  enabled,
  disabled,
}

extension on PointInTimeRecoveryStatus {
  String toValue() {
    switch (this) {
      case PointInTimeRecoveryStatus.enabled:
        return 'ENABLED';
      case PointInTimeRecoveryStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  PointInTimeRecoveryStatus toPointInTimeRecoveryStatus() {
    switch (this) {
      case 'ENABLED':
        return PointInTimeRecoveryStatus.enabled;
      case 'DISABLED':
        return PointInTimeRecoveryStatus.disabled;
    }
    throw Exception('$this is not known in enum PointInTimeRecoveryStatus');
  }
}

/// The point-in-time recovery status of the specified table.
class PointInTimeRecoverySummary {
  /// Shows if point-in-time recovery is enabled or disabled for the specified
  /// table.
  final PointInTimeRecoveryStatus status;

  /// Specifies the earliest possible restore point of the table in ISO 8601
  /// format.
  final DateTime? earliestRestorableTimestamp;

  PointInTimeRecoverySummary({
    required this.status,
    this.earliestRestorableTimestamp,
  });

  factory PointInTimeRecoverySummary.fromJson(Map<String, dynamic> json) {
    return PointInTimeRecoverySummary(
      status: (json['status'] as String).toPointInTimeRecoveryStatus(),
      earliestRestorableTimestamp:
          timeStampFromJson(json['earliestRestorableTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final earliestRestorableTimestamp = this.earliestRestorableTimestamp;
    return {
      'status': status.toValue(),
      if (earliestRestorableTimestamp != null)
        'earliestRestorableTimestamp':
            unixTimestampToJson(earliestRestorableTimestamp),
    };
  }
}

class RestoreTableResponse {
  /// The Amazon Resource Name (ARN) of the restored table.
  final String restoredTableARN;

  RestoreTableResponse({
    required this.restoredTableARN,
  });

  factory RestoreTableResponse.fromJson(Map<String, dynamic> json) {
    return RestoreTableResponse(
      restoredTableARN: json['restoredTableARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final restoredTableARN = this.restoredTableARN;
    return {
      'restoredTableARN': restoredTableARN,
    };
  }
}

/// Describes the schema of the table.
class SchemaDefinition {
  /// The regular columns of the table.
  final List<ColumnDefinition> allColumns;

  /// The columns that are part of the partition key of the table .
  final List<PartitionKey> partitionKeys;

  /// The columns that are part of the clustering key of the table.
  final List<ClusteringKey>? clusteringKeys;

  /// The columns that have been defined as <code>STATIC</code>. Static columns
  /// store values that are shared by all rows in the same partition.
  final List<StaticColumn>? staticColumns;

  SchemaDefinition({
    required this.allColumns,
    required this.partitionKeys,
    this.clusteringKeys,
    this.staticColumns,
  });

  factory SchemaDefinition.fromJson(Map<String, dynamic> json) {
    return SchemaDefinition(
      allColumns: (json['allColumns'] as List)
          .whereNotNull()
          .map((e) => ColumnDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      partitionKeys: (json['partitionKeys'] as List)
          .whereNotNull()
          .map((e) => PartitionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusteringKeys: (json['clusteringKeys'] as List?)
          ?.whereNotNull()
          .map((e) => ClusteringKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      staticColumns: (json['staticColumns'] as List?)
          ?.whereNotNull()
          .map((e) => StaticColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allColumns = this.allColumns;
    final partitionKeys = this.partitionKeys;
    final clusteringKeys = this.clusteringKeys;
    final staticColumns = this.staticColumns;
    return {
      'allColumns': allColumns,
      'partitionKeys': partitionKeys,
      if (clusteringKeys != null) 'clusteringKeys': clusteringKeys,
      if (staticColumns != null) 'staticColumns': staticColumns,
    };
  }
}

enum SortOrder {
  asc,
  desc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASC':
        return SortOrder.asc;
      case 'DESC':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// The static columns of the table. Static columns store values that are shared
/// by all rows in the same partition.
class StaticColumn {
  /// The name of the static column.
  final String name;

  StaticColumn({
    required this.name,
  });

  factory StaticColumn.fromJson(Map<String, dynamic> json) {
    return StaticColumn(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

enum TableStatus {
  active,
  creating,
  updating,
  deleting,
  deleted,
  restoring,
  inaccessibleEncryptionCredentials,
}

extension on TableStatus {
  String toValue() {
    switch (this) {
      case TableStatus.active:
        return 'ACTIVE';
      case TableStatus.creating:
        return 'CREATING';
      case TableStatus.updating:
        return 'UPDATING';
      case TableStatus.deleting:
        return 'DELETING';
      case TableStatus.deleted:
        return 'DELETED';
      case TableStatus.restoring:
        return 'RESTORING';
      case TableStatus.inaccessibleEncryptionCredentials:
        return 'INACCESSIBLE_ENCRYPTION_CREDENTIALS';
    }
  }
}

extension on String {
  TableStatus toTableStatus() {
    switch (this) {
      case 'ACTIVE':
        return TableStatus.active;
      case 'CREATING':
        return TableStatus.creating;
      case 'UPDATING':
        return TableStatus.updating;
      case 'DELETING':
        return TableStatus.deleting;
      case 'DELETED':
        return TableStatus.deleted;
      case 'RESTORING':
        return TableStatus.restoring;
      case 'INACCESSIBLE_ENCRYPTION_CREDENTIALS':
        return TableStatus.inaccessibleEncryptionCredentials;
    }
    throw Exception('$this is not known in enum TableStatus');
  }
}

/// Returns the name of the specified table, the keyspace it is stored in, and
/// the unique identifier in the format of an Amazon Resource Name (ARN).
class TableSummary {
  /// The name of the keyspace that the table is stored in.
  final String keyspaceName;

  /// The unique identifier of the table in the format of an Amazon Resource Name
  /// (ARN).
  final String resourceArn;

  /// The name of the table.
  final String tableName;

  TableSummary({
    required this.keyspaceName,
    required this.resourceArn,
    required this.tableName,
  });

  factory TableSummary.fromJson(Map<String, dynamic> json) {
    return TableSummary(
      keyspaceName: json['keyspaceName'] as String,
      resourceArn: json['resourceArn'] as String,
      tableName: json['tableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    final tableName = this.tableName;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
      'tableName': tableName,
    };
  }
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// single Amazon Keyspaces resource.
///
/// Amazon Web Services-assigned tag names and values are automatically assigned
/// the <code>aws:</code> prefix, which the user cannot assign. Amazon Web
/// Services-assigned tag names do not count towards the tag limit of 50.
/// User-assigned tag names have the prefix <code>user:</code> in the Cost
/// Allocation Report. You cannot backdate the application of a tag.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html">Adding
/// tags and labels to Amazon Keyspaces resources</a> in the <i>Amazon Keyspaces
/// Developer Guide</i>.
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each Amazon Keyspaces
  /// resource can only have up to one tag with the same key. If you try to add an
  /// existing tag (same key), the existing tag value will be updated to the new
  /// value.
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

enum ThroughputMode {
  payPerRequest,
  provisioned,
}

extension on ThroughputMode {
  String toValue() {
    switch (this) {
      case ThroughputMode.payPerRequest:
        return 'PAY_PER_REQUEST';
      case ThroughputMode.provisioned:
        return 'PROVISIONED';
    }
  }
}

extension on String {
  ThroughputMode toThroughputMode() {
    switch (this) {
      case 'PAY_PER_REQUEST':
        return ThroughputMode.payPerRequest;
      case 'PROVISIONED':
        return ThroughputMode.provisioned;
    }
    throw Exception('$this is not known in enum ThroughputMode');
  }
}

/// Enable custom Time to Live (TTL) settings for rows and columns without
/// setting a TTL default for the specified table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_enabling">Enabling
/// TTL on tables</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class TimeToLive {
  /// Shows how to enable custom Time to Live (TTL) settings for the specified
  /// table.
  final TimeToLiveStatus status;

  TimeToLive({
    required this.status,
  });

  factory TimeToLive.fromJson(Map<String, dynamic> json) {
    return TimeToLive(
      status: (json['status'] as String).toTimeToLiveStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum TimeToLiveStatus {
  enabled,
}

extension on TimeToLiveStatus {
  String toValue() {
    switch (this) {
      case TimeToLiveStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  TimeToLiveStatus toTimeToLiveStatus() {
    switch (this) {
      case 'ENABLED':
        return TimeToLiveStatus.enabled;
    }
    throw Exception('$this is not known in enum TimeToLiveStatus');
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

class UpdateTableResponse {
  /// The Amazon Resource Name (ARN) of the modified table.
  final String resourceArn;

  UpdateTableResponse({
    required this.resourceArn,
  });

  factory UpdateTableResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTableResponse(
      resourceArn: json['resourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
