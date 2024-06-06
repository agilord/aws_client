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
/// Web Services SDK and CLI, as well as infrastructure as code (IaC) services
/// and tools such as CloudFormation and Terraform. This API reference describes
/// the supported DDL operations in detail.
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// Parameter [replicationSpecification] :
  /// The replication specification of the keyspace includes:
  ///
  /// <ul>
  /// <li>
  /// <code>replicationStrategy</code> - the required value is
  /// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
  /// </li>
  /// <li>
  /// <code>regionList</code> - if the <code>replicationStrategy</code> is
  /// <code>MULTI_REGION</code>, the <code>regionList</code> requires the
  /// current Region and at least one additional Amazon Web Services Region
  /// where the keyspace is going to be replicated in. The maximum number of
  /// supported replication Regions including the current Region is six.
  /// </li>
  /// </ul>
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
    ReplicationSpecification? replicationSpecification,
    List<Tag>? tags,
  }) async {
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
        if (replicationSpecification != null)
          'replicationSpecification': replicationSpecification,
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
  /// <ul>
  /// <li>
  /// <code>name</code> - The name of the column.
  /// </li>
  /// <li>
  /// <code>type</code> - An Amazon Keyspaces data type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types">Data
  /// types</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  /// </li>
  /// </ul>
  /// The primary key of the table consists of the following columns:
  ///
  /// <ul>
  /// <li>
  /// <code>partitionKeys</code> - The partition key can be a single column, or
  /// it can be a compound value composed of two or more columns. The partition
  /// key portion of the primary key is required and determines how Amazon
  /// Keyspaces stores your data.
  /// </li>
  /// <li>
  /// <code>name</code> - The name of each partition key column.
  /// </li>
  /// <li>
  /// <code>clusteringKeys</code> - The optional clustering column portion of
  /// your primary key determines how the data is clustered and sorted within
  /// each partition.
  /// </li>
  /// <li>
  /// <code>name</code> - The name of the clustering column.
  /// </li>
  /// <li>
  /// <code>orderBy</code> - Sets the ascendant (<code>ASC</code>) or descendant
  /// (<code>DESC</code>) order modifier.
  ///
  /// To define a column as static use <code>staticColumns</code> - Static
  /// columns store values that are shared by all rows in the same partition:
  /// </li>
  /// <li>
  /// <code>name</code> - The name of the column.
  /// </li>
  /// <li>
  /// <code>type</code> - An Amazon Keyspaces data type.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  ///
  /// Parameter [autoScalingSpecification] :
  /// The optional auto scaling settings for a table in provisioned capacity
  /// mode. Specifies if the service can manage throughput capacity
  /// automatically on your behalf.
  ///
  /// Auto scaling helps you provision throughput capacity for variable
  /// workloads efficiently by increasing and decreasing your table's read and
  /// write capacity automatically in response to application traffic. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html">Managing
  /// throughput capacity automatically with Amazon Keyspaces auto scaling</a>
  /// in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// By default, auto scaling is disabled for a table.
  ///
  /// Parameter [capacitySpecification] :
  /// Specifies the read/write throughput capacity mode for the table. The
  /// options are:
  ///
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code> and
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  /// </li>
  /// </ul>
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [clientSideTimestamps] :
  /// Enables client-side timestamps for the table. By default, the setting is
  /// disabled. You can enable client-side timestamps with the following option:
  ///
  /// <ul>
  /// <li>
  /// <code>status: "enabled"</code>
  /// </li>
  /// </ul>
  /// Once client-side timestamps are enabled for a table, this setting cannot
  /// be disabled.
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
  /// <ul>
  /// <li>
  /// <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  /// </li>
  /// <li>
  /// <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>status=ENABLED</code>
  /// </li>
  /// <li>
  /// <code>status=DISABLED</code>
  /// </li>
  /// </ul>
  /// If it's not specified, the default is <code>status=DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [replicaSpecifications] :
  /// The optional Amazon Web Services Region specific settings of a
  /// multi-Region table. These settings overwrite the general settings of the
  /// table for the specified Region.
  ///
  /// For a multi-Region table in provisioned capacity mode, you can configure
  /// the table's read capacity differently for each Region's replica. The write
  /// capacity, however, remains synchronized between all replicas to ensure
  /// that there's enough capacity to replicate writes across all Regions. To
  /// define the read capacity for a table replica in a specific Region, you can
  /// do so by configuring the following parameters.
  ///
  /// <ul>
  /// <li>
  /// <code>region</code>: The Region where these settings are applied.
  /// (Required)
  /// </li>
  /// <li>
  /// <code>readCapacityUnits</code>: The provisioned read capacity units.
  /// (Optional)
  /// </li>
  /// <li>
  /// <code>readCapacityAutoScaling</code>: The read capacity auto scaling
  /// settings for the table. (Optional)
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>status:enabled</code>
  /// </li>
  /// <li>
  /// <code>status:disabled</code>
  /// </li>
  /// </ul>
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
    AutoScalingSpecification? autoScalingSpecification,
    CapacitySpecification? capacitySpecification,
    ClientSideTimestamps? clientSideTimestamps,
    Comment? comment,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    List<ReplicaSpecification>? replicaSpecifications,
    List<Tag>? tags,
    TimeToLive? ttl,
  }) async {
    _s.validateNumRange(
      'defaultTimeToLive',
      defaultTimeToLive,
      0,
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
        if (autoScalingSpecification != null)
          'autoScalingSpecification': autoScalingSpecification,
        if (capacitySpecification != null)
          'capacitySpecification': capacitySpecification,
        if (clientSideTimestamps != null)
          'clientSideTimestamps': clientSideTimestamps,
        if (comment != null) 'comment': comment,
        if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
        if (encryptionSpecification != null)
          'encryptionSpecification': encryptionSpecification,
        if (pointInTimeRecovery != null)
          'pointInTimeRecovery': pointInTimeRecovery,
        if (replicaSpecifications != null)
          'replicaSpecifications': replicaSpecifications,
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

  /// Returns auto scaling related settings of the specified table in JSON
  /// format. If the table is a multi-Region table, the Amazon Web Services
  /// Region specific auto scaling settings of the table are included.
  ///
  /// Amazon Keyspaces auto scaling helps you provision throughput capacity for
  /// variable workloads efficiently by increasing and decreasing your table's
  /// read and write capacity automatically in response to application traffic.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html">Managing
  /// throughput capacity automatically with Amazon Keyspaces auto scaling</a>
  /// in the <i>Amazon Keyspaces Developer Guide</i>.
  /// <important>
  /// <code>GetTableAutoScalingSettings</code> can't be used as an action in an
  /// IAM policy.
  /// </important>
  /// To define permissions for <code>GetTableAutoScalingSettings</code>, you
  /// must allow the following two actions in the IAM policy statement's
  /// <code>Action</code> element:
  ///
  /// <ul>
  /// <li>
  /// <code>application-autoscaling:DescribeScalableTargets</code>
  /// </li>
  /// <li>
  /// <code>application-autoscaling:DescribeScalingPolicies</code>
  /// </li>
  /// </ul>
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
  /// Parameter [tableName] :
  /// The name of the table.
  Future<GetTableAutoScalingSettingsResponse> getTableAutoScalingSettings({
    required String keyspaceName,
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.GetTableAutoScalingSettings'
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

    return GetTableAutoScalingSettingsResponse.fromJson(jsonResponse.body);
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

  /// Restores the table to the specified point in time within the
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
  /// <code>RestoreTable</code> restores the capacity mode, auto scaling
  /// settings, encryption settings, and point-in-time recovery settings from
  /// the source table. Unlike the table's schema data and TTL settings, which
  /// are restored based on the selected timestamp, these settings are always
  /// restored based on the table's settings as of the current time or when the
  /// table was deleted.
  ///
  /// You can also overwrite these settings during restore:
  ///
  /// <ul>
  /// <li>
  /// Read/write capacity mode
  /// </li>
  /// <li>
  /// Provisioned throughput capacity units
  /// </li>
  /// <li>
  /// Auto scaling settings
  /// </li>
  /// <li>
  /// Point-in-time (PITR) settings
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings">PITR
  /// restore settings</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Note that the following settings are not restored, and you must configure
  /// them manually for the new table:
  ///
  /// <ul>
  /// <li>
  /// Identity and Access Management (IAM) policies
  /// </li>
  /// <li>
  /// Amazon CloudWatch metrics and alarms
  /// </li>
  /// </ul>
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
  /// Parameter [autoScalingSpecification] :
  /// The optional auto scaling settings for the restored table in provisioned
  /// capacity mode. Specifies if the service can manage throughput capacity of
  /// a provisioned table automatically on your behalf. Amazon Keyspaces auto
  /// scaling helps you provision throughput capacity for variable workloads
  /// efficiently by increasing and decreasing your table's read and write
  /// capacity automatically in response to application traffic.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html">Managing
  /// throughput capacity automatically with Amazon Keyspaces auto scaling</a>
  /// in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [capacitySpecificationOverride] :
  /// Specifies the read/write throughput capacity mode for the target table.
  /// The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code>
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  /// </li>
  /// <li>
  /// <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>status=ENABLED</code>
  /// </li>
  /// <li>
  /// <code>status=DISABLED</code>
  /// </li>
  /// </ul>
  /// If it's not specified, the default is <code>status=DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [replicaSpecifications] :
  /// The optional Region specific settings of a multi-Regional table.
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
    AutoScalingSpecification? autoScalingSpecification,
    CapacitySpecification? capacitySpecificationOverride,
    EncryptionSpecification? encryptionSpecificationOverride,
    PointInTimeRecovery? pointInTimeRecoveryOverride,
    List<ReplicaSpecification>? replicaSpecifications,
    DateTime? restoreTimestamp,
    List<Tag>? tagsOverride,
  }) async {
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
        if (autoScalingSpecification != null)
          'autoScalingSpecification': autoScalingSpecification,
        if (capacitySpecificationOverride != null)
          'capacitySpecificationOverride': capacitySpecificationOverride,
        if (encryptionSpecificationOverride != null)
          'encryptionSpecificationOverride': encryptionSpecificationOverride,
        if (pointInTimeRecoveryOverride != null)
          'pointInTimeRecoveryOverride': pointInTimeRecoveryOverride,
        if (replicaSpecifications != null)
          'replicaSpecifications': replicaSpecifications,
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
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-tags">Amazon
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
  /// example capacity mode, auto scaling, encryption, point-in-time recovery,
  /// or ttl settings. Note that you can only update one specific table setting
  /// per update operation.
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
  /// <ul>
  /// <li>
  /// <code>name</code> - The name of the column.
  /// </li>
  /// <li>
  /// <code>type</code> - An Amazon Keyspaces data type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types">Data
  /// types</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [autoScalingSpecification] :
  /// The optional auto scaling settings to update for a table in provisioned
  /// capacity mode. Specifies if the service can manage throughput capacity of
  /// a provisioned table automatically on your behalf. Amazon Keyspaces auto
  /// scaling helps you provision throughput capacity for variable workloads
  /// efficiently by increasing and decreasing your table's read and write
  /// capacity automatically in response to application traffic.
  ///
  /// If auto scaling is already enabled for the table, you can use
  /// <code>UpdateTable</code> to update the minimum and maximum values or the
  /// auto scaling policy settings independently.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html">Managing
  /// throughput capacity automatically with Amazon Keyspaces auto scaling</a>
  /// in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [capacitySpecification] :
  /// Modifies the read/write throughput capacity mode for the table. The
  /// options are:
  ///
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code> and
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode
  /// requires <code>readCapacityUnits</code> and
  /// <code>writeCapacityUnits</code> as input.
  /// </li>
  /// </ul>
  /// The default is <code>throughput_mode:PAY_PER_REQUEST</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
  /// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [clientSideTimestamps] :
  /// Enables client-side timestamps for the table. By default, the setting is
  /// disabled. You can enable client-side timestamps with the following option:
  ///
  /// <ul>
  /// <li>
  /// <code>status: "enabled"</code>
  /// </li>
  /// </ul>
  /// Once client-side timestamps are enabled for a table, this setting cannot
  /// be disabled.
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
  /// <ul>
  /// <li>
  /// <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon
  /// Keyspaces.
  /// </li>
  /// <li>
  /// <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires
  /// the <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name
  /// (ARN) format as input.
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>status=ENABLED</code>
  /// </li>
  /// <li>
  /// <code>status=DISABLED</code>
  /// </li>
  /// </ul>
  /// If it's not specified, the default is <code>status=DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html">Point-in-time
  /// recovery</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// Parameter [replicaSpecifications] :
  /// The Region specific settings of a multi-Regional table.
  ///
  /// Parameter [ttl] :
  /// Modifies Time to Live custom settings for the table. The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>status:enabled</code>
  /// </li>
  /// <li>
  /// <code>status:disabled</code>
  /// </li>
  /// </ul>
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
    AutoScalingSpecification? autoScalingSpecification,
    CapacitySpecification? capacitySpecification,
    ClientSideTimestamps? clientSideTimestamps,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    List<ReplicaSpecification>? replicaSpecifications,
    TimeToLive? ttl,
  }) async {
    _s.validateNumRange(
      'defaultTimeToLive',
      defaultTimeToLive,
      0,
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
        if (autoScalingSpecification != null)
          'autoScalingSpecification': autoScalingSpecification,
        if (capacitySpecification != null)
          'capacitySpecification': capacitySpecification,
        if (clientSideTimestamps != null)
          'clientSideTimestamps': clientSideTimestamps,
        if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
        if (encryptionSpecification != null)
          'encryptionSpecification': encryptionSpecification,
        if (pointInTimeRecovery != null)
          'pointInTimeRecovery': pointInTimeRecovery,
        if (replicaSpecifications != null)
          'replicaSpecifications': replicaSpecifications,
        if (ttl != null) 'ttl': ttl,
      },
    );

    return UpdateTableResponse.fromJson(jsonResponse.body);
  }
}

/// Amazon Keyspaces supports the <code>target tracking</code> auto scaling
/// policy. With this policy, Amazon Keyspaces auto scaling ensures that the
/// table's ratio of consumed to provisioned capacity stays at or near the
/// target value that you specify. You define the target value as a percentage
/// between 20 and 90.
class AutoScalingPolicy {
  /// Auto scaling scales up capacity automatically when traffic exceeds this
  /// target utilization rate, and then back down when it falls below the target.
  /// A <code>double</code> between 20 and 90.
  final TargetTrackingScalingPolicyConfiguration?
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicy({
    this.targetTrackingScalingPolicyConfiguration,
  });

  factory AutoScalingPolicy.fromJson(Map<String, dynamic> json) {
    return AutoScalingPolicy(
      targetTrackingScalingPolicyConfiguration:
          json['targetTrackingScalingPolicyConfiguration'] != null
              ? TargetTrackingScalingPolicyConfiguration.fromJson(
                  json['targetTrackingScalingPolicyConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetTrackingScalingPolicyConfiguration =
        this.targetTrackingScalingPolicyConfiguration;
    return {
      if (targetTrackingScalingPolicyConfiguration != null)
        'targetTrackingScalingPolicyConfiguration':
            targetTrackingScalingPolicyConfiguration,
    };
  }
}

/// The optional auto scaling settings for a table with provisioned throughput
/// capacity.
///
/// To turn on auto scaling for a table in
/// <code>throughputMode:PROVISIONED</code>, you must specify the following
/// parameters.
///
/// Configure the minimum and maximum capacity units. The auto scaling policy
/// ensures that capacity never goes below the minimum or above the maximum
/// range.
///
/// <ul>
/// <li>
/// <code>minimumUnits</code>: The minimum level of throughput the table should
/// always be ready to support. The value must be between 1 and the max
/// throughput per second quota for your account (40,000 by default).
/// </li>
/// <li>
/// <code>maximumUnits</code>: The maximum level of throughput the table should
/// always be ready to support. The value must be between 1 and the max
/// throughput per second quota for your account (40,000 by default).
/// </li>
/// <li>
/// <code>scalingPolicy</code>: Amazon Keyspaces supports the <code>target
/// tracking</code> scaling policy. The auto scaling target is the provisioned
/// capacity of the table.
///
/// <ul>
/// <li>
/// <code>targetTrackingScalingPolicyConfiguration</code>: To define the target
/// tracking policy, you must define the target value.
///
/// <ul>
/// <li>
/// <code>targetValue</code>: The target utilization rate of the table. Amazon
/// Keyspaces auto scaling ensures that the ratio of consumed capacity to
/// provisioned capacity stays at or near this value. You define
/// <code>targetValue</code> as a percentage. A <code>double</code> between 20
/// and 90. (Required)
/// </li>
/// <li>
/// <code>disableScaleIn</code>: A <code>boolean</code> that specifies if
/// <code>scale-in</code> is disabled or enabled for the table. This parameter
/// is disabled by default. To turn on <code>scale-in</code>, set the
/// <code>boolean</code> value to <code>FALSE</code>. This means that capacity
/// for a table can be automatically scaled down on your behalf. (Optional)
/// </li>
/// <li>
/// <code>scaleInCooldown</code>: A cooldown period in seconds between scaling
/// activities that lets the table stabilize before another scale in activity
/// starts. If no value is provided, the default is 0. (Optional)
/// </li>
/// <li>
/// <code>scaleOutCooldown</code>: A cooldown period in seconds between scaling
/// activities that lets the table stabilize before another scale out activity
/// starts. If no value is provided, the default is 0. (Optional)
/// </li>
/// </ul> </li>
/// </ul> </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html">Managing
/// throughput capacity automatically with Amazon Keyspaces auto scaling</a> in
/// the <i>Amazon Keyspaces Developer Guide</i>.
class AutoScalingSettings {
  /// This optional parameter enables auto scaling for the table if set to
  /// <code>false</code>.
  final bool? autoScalingDisabled;

  /// Manage costs by specifying the maximum amount of throughput to provision.
  /// The value must be between 1 and the max throughput per second quota for your
  /// account (40,000 by default).
  final int? maximumUnits;

  /// The minimum level of throughput the table should always be ready to support.
  /// The value must be between 1 and the max throughput per second quota for your
  /// account (40,000 by default).
  final int? minimumUnits;

  /// Amazon Keyspaces supports the <code>target tracking</code> auto scaling
  /// policy. With this policy, Amazon Keyspaces auto scaling ensures that the
  /// table's ratio of consumed to provisioned capacity stays at or near the
  /// target value that you specify. You define the target value as a percentage
  /// between 20 and 90.
  final AutoScalingPolicy? scalingPolicy;

  AutoScalingSettings({
    this.autoScalingDisabled,
    this.maximumUnits,
    this.minimumUnits,
    this.scalingPolicy,
  });

  factory AutoScalingSettings.fromJson(Map<String, dynamic> json) {
    return AutoScalingSettings(
      autoScalingDisabled: json['autoScalingDisabled'] as bool?,
      maximumUnits: json['maximumUnits'] as int?,
      minimumUnits: json['minimumUnits'] as int?,
      scalingPolicy: json['scalingPolicy'] != null
          ? AutoScalingPolicy.fromJson(
              json['scalingPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingDisabled = this.autoScalingDisabled;
    final maximumUnits = this.maximumUnits;
    final minimumUnits = this.minimumUnits;
    final scalingPolicy = this.scalingPolicy;
    return {
      if (autoScalingDisabled != null)
        'autoScalingDisabled': autoScalingDisabled,
      if (maximumUnits != null) 'maximumUnits': maximumUnits,
      if (minimumUnits != null) 'minimumUnits': minimumUnits,
      if (scalingPolicy != null) 'scalingPolicy': scalingPolicy,
    };
  }
}

/// The optional auto scaling capacity settings for a table in provisioned
/// capacity mode.
class AutoScalingSpecification {
  /// The auto scaling settings for the table's read capacity.
  final AutoScalingSettings? readCapacityAutoScaling;

  /// The auto scaling settings for the table's write capacity.
  final AutoScalingSettings? writeCapacityAutoScaling;

  AutoScalingSpecification({
    this.readCapacityAutoScaling,
    this.writeCapacityAutoScaling,
  });

  factory AutoScalingSpecification.fromJson(Map<String, dynamic> json) {
    return AutoScalingSpecification(
      readCapacityAutoScaling: json['readCapacityAutoScaling'] != null
          ? AutoScalingSettings.fromJson(
              json['readCapacityAutoScaling'] as Map<String, dynamic>)
          : null,
      writeCapacityAutoScaling: json['writeCapacityAutoScaling'] != null
          ? AutoScalingSettings.fromJson(
              json['writeCapacityAutoScaling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final readCapacityAutoScaling = this.readCapacityAutoScaling;
    final writeCapacityAutoScaling = this.writeCapacityAutoScaling;
    return {
      if (readCapacityAutoScaling != null)
        'readCapacityAutoScaling': readCapacityAutoScaling,
      if (writeCapacityAutoScaling != null)
        'writeCapacityAutoScaling': writeCapacityAutoScaling,
    };
  }
}

/// Amazon Keyspaces has two read/write capacity modes for processing reads and
/// writes on your tables:
///
/// <ul>
/// <li>
/// On-demand (default)
/// </li>
/// <li>
/// Provisioned
/// </li>
/// </ul>
/// The read/write capacity mode that you choose controls how you are charged
/// for read and write throughput and how table throughput capacity is managed.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
/// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class CapacitySpecification {
  /// The read/write throughput capacity mode for a table. The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code> and
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode requires
  /// <code>readCapacityUnits</code> and <code>writeCapacityUnits</code> as input.
  /// </li>
  /// </ul>
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
/// <ul>
/// <li>
/// <code>throughputMode:PAY_PER_REQUEST</code> and
/// </li>
/// <li>
/// <code>throughputMode:PROVISIONED</code>.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html">Read/write
/// capacity modes</a> in the <i>Amazon Keyspaces Developer Guide</i>.
class CapacitySpecificationSummary {
  /// The read/write throughput capacity mode for a table. The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code> and
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code> - Provisioned capacity mode requires
  /// <code>readCapacityUnits</code> and <code>writeCapacityUnits</code> as input.
  /// </li>
  /// </ul>
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

/// The client-side timestamp setting of the table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps-how-it-works.html">How
/// it works: Amazon Keyspaces client-side timestamps</a> in the <i>Amazon
/// Keyspaces Developer Guide</i>.
class ClientSideTimestamps {
  /// Shows how to enable client-side timestamps settings for the specified table.
  final ClientSideTimestampsStatus status;

  ClientSideTimestamps({
    required this.status,
  });

  factory ClientSideTimestamps.fromJson(Map<String, dynamic> json) {
    return ClientSideTimestamps(
      status: (json['status'] as String).toClientSideTimestampsStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum ClientSideTimestampsStatus {
  enabled,
}

extension ClientSideTimestampsStatusValueExtension
    on ClientSideTimestampsStatus {
  String toValue() {
    switch (this) {
      case ClientSideTimestampsStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension ClientSideTimestampsStatusFromString on String {
  ClientSideTimestampsStatus toClientSideTimestampsStatus() {
    switch (this) {
      case 'ENABLED':
        return ClientSideTimestampsStatus.enabled;
    }
    throw Exception('$this is not known in enum ClientSideTimestampsStatus');
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
/// <ul>
/// <li>
/// Amazon Web Services owned key - This is the default encryption type. The key
/// is owned by Amazon Keyspaces (no additional charge).
/// </li>
/// <li>
/// Customer managed key - This key is stored in your account and is created,
/// owned, and managed by you. You have full control over the customer managed
/// key (KMS charges apply).
/// </li>
/// </ul>
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
  /// <ul>
  /// <li>
  /// <code>type:AWS_OWNED_KMS_KEY</code> - This key is owned by Amazon Keyspaces.
  /// </li>
  /// <li>
  /// <code>type:CUSTOMER_MANAGED_KMS_KEY</code> - This key is stored in your
  /// account and is created, owned, and managed by you. This option requires the
  /// <code>kms_key_identifier</code> of the KMS key in Amazon Resource Name (ARN)
  /// format as input.
  /// </li>
  /// </ul>
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

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.customerManagedKmsKey:
        return 'CUSTOMER_MANAGED_KMS_KEY';
      case EncryptionType.awsOwnedKmsKey:
        return 'AWS_OWNED_KMS_KEY';
    }
  }
}

extension EncryptionTypeFromString on String {
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

  /// Returns the replication strategy of the keyspace. The options are
  /// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
  final Rs replicationStrategy;

  /// Returns the ARN of the keyspace.
  final String resourceArn;

  /// If the <code>replicationStrategy</code> of the keyspace is
  /// <code>MULTI_REGION</code>, a list of replication Regions is returned.
  final List<String>? replicationRegions;

  GetKeyspaceResponse({
    required this.keyspaceName,
    required this.replicationStrategy,
    required this.resourceArn,
    this.replicationRegions,
  });

  factory GetKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyspaceResponse(
      keyspaceName: json['keyspaceName'] as String,
      replicationStrategy: (json['replicationStrategy'] as String).toRs(),
      resourceArn: json['resourceArn'] as String,
      replicationRegions: (json['replicationRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final replicationStrategy = this.replicationStrategy;
    final resourceArn = this.resourceArn;
    final replicationRegions = this.replicationRegions;
    return {
      'keyspaceName': keyspaceName,
      'replicationStrategy': replicationStrategy.toValue(),
      'resourceArn': resourceArn,
      if (replicationRegions != null) 'replicationRegions': replicationRegions,
    };
  }
}

class GetTableAutoScalingSettingsResponse {
  /// The name of the keyspace.
  final String keyspaceName;

  /// The Amazon Resource Name (ARN) of the table.
  final String resourceArn;

  /// The name of the table.
  final String tableName;

  /// The auto scaling settings of the table.
  final AutoScalingSpecification? autoScalingSpecification;

  /// The Amazon Web Services Region specific settings of a multi-Region table.
  /// Returns the settings for all Regions the table is replicated in.
  final List<ReplicaAutoScalingSpecification>? replicaSpecifications;

  GetTableAutoScalingSettingsResponse({
    required this.keyspaceName,
    required this.resourceArn,
    required this.tableName,
    this.autoScalingSpecification,
    this.replicaSpecifications,
  });

  factory GetTableAutoScalingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableAutoScalingSettingsResponse(
      keyspaceName: json['keyspaceName'] as String,
      resourceArn: json['resourceArn'] as String,
      tableName: json['tableName'] as String,
      autoScalingSpecification: json['autoScalingSpecification'] != null
          ? AutoScalingSpecification.fromJson(
              json['autoScalingSpecification'] as Map<String, dynamic>)
          : null,
      replicaSpecifications: (json['replicaSpecifications'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicaAutoScalingSpecification.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    final tableName = this.tableName;
    final autoScalingSpecification = this.autoScalingSpecification;
    final replicaSpecifications = this.replicaSpecifications;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
      'tableName': tableName,
      if (autoScalingSpecification != null)
        'autoScalingSpecification': autoScalingSpecification,
      if (replicaSpecifications != null)
        'replicaSpecifications': replicaSpecifications,
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
  /// <ul>
  /// <li>
  /// <code>throughputMode:PAY_PER_REQUEST</code>
  /// </li>
  /// <li>
  /// <code>throughputMode:PROVISIONED</code>
  /// </li>
  /// </ul>
  final CapacitySpecificationSummary? capacitySpecification;

  /// The client-side timestamps setting of the table.
  final ClientSideTimestamps? clientSideTimestamps;

  /// The the description of the specified table.
  final Comment? comment;

  /// The creation timestamp of the specified table.
  final DateTime? creationTimestamp;

  /// The default Time to Live settings in seconds of the specified table.
  final int? defaultTimeToLive;

  /// The encryption settings of the specified table.
  final EncryptionSpecification? encryptionSpecification;

  /// The point-in-time recovery status of the specified table.
  final PointInTimeRecoverySummary? pointInTimeRecovery;

  /// Returns the Amazon Web Services Region specific settings of all Regions a
  /// multi-Region table is replicated in.
  final List<ReplicaSpecificationSummary>? replicaSpecifications;

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
    this.clientSideTimestamps,
    this.comment,
    this.creationTimestamp,
    this.defaultTimeToLive,
    this.encryptionSpecification,
    this.pointInTimeRecovery,
    this.replicaSpecifications,
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
      clientSideTimestamps: json['clientSideTimestamps'] != null
          ? ClientSideTimestamps.fromJson(
              json['clientSideTimestamps'] as Map<String, dynamic>)
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
      replicaSpecifications: (json['replicaSpecifications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicaSpecificationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final clientSideTimestamps = this.clientSideTimestamps;
    final comment = this.comment;
    final creationTimestamp = this.creationTimestamp;
    final defaultTimeToLive = this.defaultTimeToLive;
    final encryptionSpecification = this.encryptionSpecification;
    final pointInTimeRecovery = this.pointInTimeRecovery;
    final replicaSpecifications = this.replicaSpecifications;
    final schemaDefinition = this.schemaDefinition;
    final status = this.status;
    final ttl = this.ttl;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
      'tableName': tableName,
      if (capacitySpecification != null)
        'capacitySpecification': capacitySpecification,
      if (clientSideTimestamps != null)
        'clientSideTimestamps': clientSideTimestamps,
      if (comment != null) 'comment': comment,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
      if (encryptionSpecification != null)
        'encryptionSpecification': encryptionSpecification,
      if (pointInTimeRecovery != null)
        'pointInTimeRecovery': pointInTimeRecovery,
      if (replicaSpecifications != null)
        'replicaSpecifications': replicaSpecifications,
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

  /// This property specifies if a keyspace is a single Region keyspace or a
  /// multi-Region keyspace. The available values are <code>SINGLE_REGION</code>
  /// or <code>MULTI_REGION</code>.
  final Rs replicationStrategy;

  /// The unique identifier of the keyspace in the format of an Amazon Resource
  /// Name (ARN).
  final String resourceArn;

  /// If the <code>replicationStrategy</code> of the keyspace is
  /// <code>MULTI_REGION</code>, a list of replication Regions is returned.
  final List<String>? replicationRegions;

  KeyspaceSummary({
    required this.keyspaceName,
    required this.replicationStrategy,
    required this.resourceArn,
    this.replicationRegions,
  });

  factory KeyspaceSummary.fromJson(Map<String, dynamic> json) {
    return KeyspaceSummary(
      keyspaceName: json['keyspaceName'] as String,
      replicationStrategy: (json['replicationStrategy'] as String).toRs(),
      resourceArn: json['resourceArn'] as String,
      replicationRegions: (json['replicationRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final replicationStrategy = this.replicationStrategy;
    final resourceArn = this.resourceArn;
    final replicationRegions = this.replicationRegions;
    return {
      'keyspaceName': keyspaceName,
      'replicationStrategy': replicationStrategy.toValue(),
      'resourceArn': resourceArn,
      if (replicationRegions != null) 'replicationRegions': replicationRegions,
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
  /// <ul>
  /// <li>
  /// <code>status=ENABLED</code>
  /// </li>
  /// <li>
  /// <code>status=DISABLED</code>
  /// </li>
  /// </ul>
  final PointInTimeRecoveryStatus status;

  PointInTimeRecovery({
    required this.status,
  });

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

extension PointInTimeRecoveryStatusValueExtension on PointInTimeRecoveryStatus {
  String toValue() {
    switch (this) {
      case PointInTimeRecoveryStatus.enabled:
        return 'ENABLED';
      case PointInTimeRecoveryStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension PointInTimeRecoveryStatusFromString on String {
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

/// The auto scaling settings of a multi-Region table in the specified Amazon
/// Web Services Region.
class ReplicaAutoScalingSpecification {
  /// The auto scaling settings for a multi-Region table in the specified Amazon
  /// Web Services Region.
  final AutoScalingSpecification? autoScalingSpecification;

  /// The Amazon Web Services Region.
  final String? region;

  ReplicaAutoScalingSpecification({
    this.autoScalingSpecification,
    this.region,
  });

  factory ReplicaAutoScalingSpecification.fromJson(Map<String, dynamic> json) {
    return ReplicaAutoScalingSpecification(
      autoScalingSpecification: json['autoScalingSpecification'] != null
          ? AutoScalingSpecification.fromJson(
              json['autoScalingSpecification'] as Map<String, dynamic>)
          : null,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingSpecification = this.autoScalingSpecification;
    final region = this.region;
    return {
      if (autoScalingSpecification != null)
        'autoScalingSpecification': autoScalingSpecification,
      if (region != null) 'region': region,
    };
  }
}

/// The Amazon Web Services Region specific settings of a multi-Region table.
///
/// For a multi-Region table, you can configure the table's read capacity
/// differently per Amazon Web Services Region. You can do this by configuring
/// the following parameters.
///
/// <ul>
/// <li>
/// <code>region</code>: The Region where these settings are applied. (Required)
/// </li>
/// <li>
/// <code>readCapacityUnits</code>: The provisioned read capacity units.
/// (Optional)
/// </li>
/// <li>
/// <code>readCapacityAutoScaling</code>: The read capacity auto scaling
/// settings for the table. (Optional)
/// </li>
/// </ul>
class ReplicaSpecification {
  /// The Amazon Web Services Region.
  final String region;

  /// The read capacity auto scaling settings for the multi-Region table in the
  /// specified Amazon Web Services Region.
  final AutoScalingSettings? readCapacityAutoScaling;

  /// The provisioned read capacity units for the multi-Region table in the
  /// specified Amazon Web Services Region.
  final int? readCapacityUnits;

  ReplicaSpecification({
    required this.region,
    this.readCapacityAutoScaling,
    this.readCapacityUnits,
  });

  Map<String, dynamic> toJson() {
    final region = this.region;
    final readCapacityAutoScaling = this.readCapacityAutoScaling;
    final readCapacityUnits = this.readCapacityUnits;
    return {
      'region': region,
      if (readCapacityAutoScaling != null)
        'readCapacityAutoScaling': readCapacityAutoScaling,
      if (readCapacityUnits != null) 'readCapacityUnits': readCapacityUnits,
    };
  }
}

/// The Region-specific settings of a multi-Region table in the specified Amazon
/// Web Services Region.
///
/// If the multi-Region table is using provisioned capacity and has optional
/// auto scaling policies configured, note that the Region specific summary
/// returns both read and write capacity settings. But only Region specific read
/// capacity settings can be configured for a multi-Region table. In a
/// multi-Region table, your write capacity units will be synced across all
/// Amazon Web Services Regions to ensure that there is enough capacity to
/// replicate write events across Regions.
class ReplicaSpecificationSummary {
  final CapacitySpecificationSummary? capacitySpecification;

  /// The Amazon Web Services Region.
  final String? region;

  /// The status of the multi-Region table in the specified Amazon Web Services
  /// Region.
  final TableStatus? status;

  ReplicaSpecificationSummary({
    this.capacitySpecification,
    this.region,
    this.status,
  });

  factory ReplicaSpecificationSummary.fromJson(Map<String, dynamic> json) {
    return ReplicaSpecificationSummary(
      capacitySpecification: json['capacitySpecification'] != null
          ? CapacitySpecificationSummary.fromJson(
              json['capacitySpecification'] as Map<String, dynamic>)
          : null,
      region: json['region'] as String?,
      status: (json['status'] as String?)?.toTableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacitySpecification = this.capacitySpecification;
    final region = this.region;
    final status = this.status;
    return {
      if (capacitySpecification != null)
        'capacitySpecification': capacitySpecification,
      if (region != null) 'region': region,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The replication specification of the keyspace includes:
///
/// <ul>
/// <li>
/// <code>regionList</code> - up to six Amazon Web Services Regions where the
/// keyspace is replicated in.
/// </li>
/// <li>
/// <code>replicationStrategy</code> - the required value is
/// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
/// </li>
/// </ul>
class ReplicationSpecification {
  /// The <code>replicationStrategy</code> of a keyspace, the required value is
  /// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
  final Rs replicationStrategy;

  /// The <code>regionList</code> can contain up to six Amazon Web Services
  /// Regions where the keyspace is replicated in.
  final List<String>? regionList;

  ReplicationSpecification({
    required this.replicationStrategy,
    this.regionList,
  });

  Map<String, dynamic> toJson() {
    final replicationStrategy = this.replicationStrategy;
    final regionList = this.regionList;
    return {
      'replicationStrategy': replicationStrategy.toValue(),
      if (regionList != null) 'regionList': regionList,
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

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension SortOrderFromString on String {
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

extension TableStatusValueExtension on TableStatus {
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

extension TableStatusFromString on String {
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

/// The auto scaling policy that scales a table based on the ratio of consumed
/// to provisioned capacity.
class TargetTrackingScalingPolicyConfiguration {
  /// Specifies the target value for the target tracking auto scaling policy.
  ///
  /// Amazon Keyspaces auto scaling scales up capacity automatically when traffic
  /// exceeds this target utilization rate, and then back down when it falls below
  /// the target. This ensures that the ratio of consumed capacity to provisioned
  /// capacity stays at or near this value. You define <code>targetValue</code> as
  /// a percentage. A <code>double</code> between 20 and 90.
  final double targetValue;

  /// Specifies if <code>scale-in</code> is enabled.
  ///
  /// When auto scaling automatically decreases capacity for a table, the table
  /// <i>scales in</i>. When scaling policies are set, they can't scale in the
  /// table lower than its minimum capacity.
  final bool? disableScaleIn;

  /// Specifies a <code>scale-in</code> cool down period.
  ///
  /// A cooldown period in seconds between scaling activities that lets the table
  /// stabilize before another scaling activity starts.
  final int? scaleInCooldown;

  /// Specifies a scale out cool down period.
  ///
  /// A cooldown period in seconds between scaling activities that lets the table
  /// stabilize before another scaling activity starts.
  final int? scaleOutCooldown;

  TargetTrackingScalingPolicyConfiguration({
    required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory TargetTrackingScalingPolicyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TargetTrackingScalingPolicyConfiguration(
      targetValue: json['targetValue'] as double,
      disableScaleIn: json['disableScaleIn'] as bool?,
      scaleInCooldown: json['scaleInCooldown'] as int?,
      scaleOutCooldown: json['scaleOutCooldown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    final disableScaleIn = this.disableScaleIn;
    final scaleInCooldown = this.scaleInCooldown;
    final scaleOutCooldown = this.scaleOutCooldown;
    return {
      'targetValue': targetValue,
      if (disableScaleIn != null) 'disableScaleIn': disableScaleIn,
      if (scaleInCooldown != null) 'scaleInCooldown': scaleInCooldown,
      if (scaleOutCooldown != null) 'scaleOutCooldown': scaleOutCooldown,
    };
  }
}

enum ThroughputMode {
  payPerRequest,
  provisioned,
}

extension ThroughputModeValueExtension on ThroughputMode {
  String toValue() {
    switch (this) {
      case ThroughputMode.payPerRequest:
        return 'PAY_PER_REQUEST';
      case ThroughputMode.provisioned:
        return 'PROVISIONED';
    }
  }
}

extension ThroughputModeFromString on String {
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

extension TimeToLiveStatusValueExtension on TimeToLiveStatus {
  String toValue() {
    switch (this) {
      case TimeToLiveStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension TimeToLiveStatusFromString on String {
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

enum Rs {
  singleRegion,
  multiRegion,
}

extension RsValueExtension on Rs {
  String toValue() {
    switch (this) {
      case Rs.singleRegion:
        return 'SINGLE_REGION';
      case Rs.multiRegion:
        return 'MULTI_REGION';
    }
  }
}

extension RsFromString on String {
  Rs toRs() {
    switch (this) {
      case 'SINGLE_REGION':
        return Rs.singleRegion;
      case 'MULTI_REGION':
        return Rs.multiRegion;
    }
    throw Exception('$this is not known in enum Rs');
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
