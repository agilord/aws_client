// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_02_10.endpoints.dart' as _endpoints;
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
  factory Keyspaces({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'cassandra',
    );
    return Keyspaces._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Keyspaces._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

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
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/getting-started.keyspaces.html">Create
  /// a keyspace</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// where the keyspace is going to be replicated in.
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
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/getting-started.tables.html">Create
  /// a table</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// Parameter [cdcSpecification] :
  /// The CDC stream settings of the table.
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
  ///
  /// Parameter [warmThroughputSpecification] :
  /// Specifies the warm throughput settings for the table. Pre-warming a table
  /// helps you avoid capacity exceeded exceptions by pre-provisioning read and
  /// write capacity units to reduce cold start latency when your table receives
  /// traffic.
  ///
  /// For more information about pre-warming in Amazon Keyspaces, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/warm-throughput.html">Pre-warm
  /// a table in Amazon Keyspaces</a> in the <i>Amazon Keyspaces Developer
  /// Guide</i>.
  Future<CreateTableResponse> createTable({
    required String keyspaceName,
    required SchemaDefinition schemaDefinition,
    required String tableName,
    AutoScalingSpecification? autoScalingSpecification,
    CapacitySpecification? capacitySpecification,
    CdcSpecification? cdcSpecification,
    ClientSideTimestamps? clientSideTimestamps,
    Comment? comment,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    List<ReplicaSpecification>? replicaSpecifications,
    List<Tag>? tags,
    TimeToLive? ttl,
    WarmThroughputSpecification? warmThroughputSpecification,
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
        if (cdcSpecification != null) 'cdcSpecification': cdcSpecification,
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
        if (warmThroughputSpecification != null)
          'warmThroughputSpecification': warmThroughputSpecification,
      },
    );

    return CreateTableResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateType</code> operation creates a new user-defined type in
  /// the specified keyspace.
  ///
  /// To configure the required permissions, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-create">Permissions
  /// to create a UDT</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/udts.html">User-defined
  /// types (UDTs)</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fieldDefinitions] :
  /// The field definitions, consisting of names and types, that define this
  /// type.
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace.
  ///
  /// Parameter [typeName] :
  /// The name of the user-defined type.
  ///
  /// UDT names must contain 48 characters or less, must begin with an
  /// alphabetic character, and can only contain alpha-numeric characters and
  /// underscores. Amazon Keyspaces converts upper case characters automatically
  /// into lower case characters.
  ///
  /// Alternatively, you can declare a UDT name in double quotes. When declaring
  /// a UDT name inside double quotes, Amazon Keyspaces preserves upper casing
  /// and allows special characters.
  ///
  /// You can also use double quotes as part of the name when you create the
  /// UDT, but you must escape each double quote character with an additional
  /// double quote character.
  Future<CreateTypeResponse> createType({
    required List<FieldDefinition> fieldDefinitions,
    required String keyspaceName,
    required String typeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.CreateType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fieldDefinitions': fieldDefinitions,
        'keyspaceName': keyspaceName,
        'typeName': typeName,
      },
    );

    return CreateTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>DeleteKeyspace</code> operation deletes a keyspace and all of
  /// its tables.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// The <code>DeleteType</code> operation deletes a user-defined type (UDT).
  /// You can only delete a type that is not used in a table or another UDT.
  ///
  /// To configure the required permissions, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-drop">Permissions
  /// to delete a UDT</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace of the to be deleted type.
  ///
  /// Parameter [typeName] :
  /// The name of the type to be deleted.
  Future<DeleteTypeResponse> deleteType({
    required String keyspaceName,
    required String typeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.DeleteType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'typeName': typeName,
      },
    );

    return DeleteTypeResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name of the specified keyspace, the Amazon Resource Name
  /// (ARN), the replication strategy, the Amazon Web Services Regions of a
  /// multi-Region keyspace, and the status of newly added Regions after an
  /// <code>UpdateKeyspace</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// To read table metadata using <code>GetTable</code>, the IAM principal
  /// needs <code>Select</code> action permissions for the table and the system
  /// keyspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// The <code>GetType</code> operation returns information about the type, for
  /// example the field definitions, the timestamp when the type was last
  /// modified, the level of nesting, the status, and details about if the type
  /// is used in other types and tables.
  ///
  /// To read keyspace metadata using <code>GetType</code>, the IAM principal
  /// needs <code>Select</code> action permissions for the system keyspace. To
  /// configure the required permissions, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-view">Permissions
  /// to view a UDT</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace that contains this type.
  ///
  /// Parameter [typeName] :
  /// The formatted name of the type. For example, if the name of the type was
  /// created without double quotes, Amazon Keyspaces saved the name in
  /// lower-case characters. If the name was created in double quotes, you must
  /// use double quotes to specify the type name.
  Future<GetTypeResponse> getType({
    required String keyspaceName,
    required String typeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.GetType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'typeName': typeName,
      },
    );

    return GetTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListKeyspaces</code> operation returns a list of keyspaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// The <code>ListTables</code> operation returns a list of tables for a
  /// specified keyspace.
  ///
  /// To read keyspace metadata using <code>ListTables</code>, the IAM principal
  /// needs <code>Select</code> action permissions for the system keyspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// To read keyspace metadata using <code>ListTagsForResource</code>, the IAM
  /// principal needs <code>Select</code> action permissions for the specified
  /// resource and the system keyspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// The <code>ListTypes</code> operation returns a list of types for a
  /// specified keyspace.
  ///
  /// To read keyspace metadata using <code>ListTypes</code>, the IAM principal
  /// needs <code>Select</code> action permissions for the system keyspace. To
  /// configure the required permissions, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-view">Permissions
  /// to view a UDT</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace that contains the listed types.
  ///
  /// Parameter [maxResults] :
  /// The total number of types to return in the output. If the total number of
  /// types available is more than the value specified, a <code>NextToken</code>
  /// is provided in the output. To resume pagination, provide the
  /// <code>NextToken</code> value as an argument of a subsequent API
  /// invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the
  /// <code>NextToken</code> value as an argument of a subsequent API
  /// invocation.
  Future<ListTypesResponse> listTypes({
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
      'X-Amz-Target': 'KeyspacesService.ListTypes'
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

    return ListTypesResponse.fromJson(jsonResponse.body);
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Adds a new Amazon Web Services Region to the keyspace. You can add a new
  /// Region to a keyspace that is either a single or a multi-Region keyspace.
  /// Amazon Keyspaces is going to replicate all tables in the keyspace to the
  /// new Region. To successfully replicate all tables to the new Region, they
  /// must use client-side timestamps for conflict resolution. To enable
  /// client-side timestamps, specify <code>clientSideTimestamps.status =
  /// enabled</code> when invoking the API. For more information about
  /// client-side timestamps, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps.html">Client-side
  /// timestamps in Amazon Keyspaces</a> in the <i>Amazon Keyspaces Developer
  /// Guide</i>.
  ///
  /// To add a Region to a keyspace using the <code>UpdateKeyspace</code> API,
  /// the IAM principal needs permissions for the following IAM actions:
  ///
  /// <ul>
  /// <li>
  /// <code>cassandra:Alter</code>
  /// </li>
  /// <li>
  /// <code>cassandra:AlterMultiRegionResource</code>
  /// </li>
  /// <li>
  /// <code>cassandra:Create</code>
  /// </li>
  /// <li>
  /// <code>cassandra:CreateMultiRegionResource</code>
  /// </li>
  /// <li>
  /// <code>cassandra:Select</code>
  /// </li>
  /// <li>
  /// <code>cassandra:SelectMultiRegionResource</code>
  /// </li>
  /// <li>
  /// <code>cassandra:Modify</code>
  /// </li>
  /// <li>
  /// <code>cassandra:ModifyMultiRegionResource</code>
  /// </li>
  /// </ul>
  /// If the keyspace contains a table that is configured in provisioned mode
  /// with auto scaling enabled, the following additional IAM actions need to be
  /// allowed.
  ///
  /// <ul>
  /// <li>
  /// <code>application-autoscaling:RegisterScalableTarget</code>
  /// </li>
  /// <li>
  /// <code>application-autoscaling:DeregisterScalableTarget</code>
  /// </li>
  /// <li>
  /// <code>application-autoscaling:DescribeScalableTargets</code>
  /// </li>
  /// <li>
  /// <code>application-autoscaling:PutScalingPolicy</code>
  /// </li>
  /// <li>
  /// <code>application-autoscaling:DescribeScalingPolicies</code>
  /// </li>
  /// </ul>
  /// To use the <code>UpdateKeyspace</code> API, the IAM principal also needs
  /// permissions to create a service-linked role with the following elements:
  ///
  /// <ul>
  /// <li>
  /// <code>iam:CreateServiceLinkedRole</code> - The <b>action</b> the principal
  /// can perform.
  /// </li>
  /// <li>
  /// <code>arn:aws:iam::*:role/aws-service-role/replication.cassandra.amazonaws.com/AWSServiceRoleForKeyspacesReplication</code>
  /// - The <b>resource</b> that the action can be performed on.
  /// </li>
  /// <li>
  /// <code>iam:AWSServiceName: replication.cassandra.amazonaws.com</code> - The
  /// only Amazon Web Services service that this role can be attached to is
  /// Amazon Keyspaces.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/howitworks_replication_permissions_addReplica.html">Configure
  /// the IAM permissions required to add an Amazon Web Services Region to a
  /// keyspace</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace.
  Future<UpdateKeyspaceResponse> updateKeyspace({
    required String keyspaceName,
    required ReplicationSpecification replicationSpecification,
    ClientSideTimestamps? clientSideTimestamps,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesService.UpdateKeyspace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyspaceName': keyspaceName,
        'replicationSpecification': replicationSpecification,
        if (clientSideTimestamps != null)
          'clientSideTimestamps': clientSideTimestamps,
      },
    );

    return UpdateKeyspaceResponse.fromJson(jsonResponse.body);
  }

  /// Adds new columns to the table or updates one of the table's settings, for
  /// example capacity mode, auto scaling, encryption, point-in-time recovery,
  /// or ttl settings. Note that you can only update one specific table setting
  /// per update operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// Parameter [cdcSpecification] :
  /// The CDC stream settings of the table.
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
  ///
  /// Parameter [warmThroughputSpecification] :
  /// Modifies the warm throughput settings for the table. You can update the
  /// read and write capacity units to adjust the pre-provisioned throughput.
  Future<UpdateTableResponse> updateTable({
    required String keyspaceName,
    required String tableName,
    List<ColumnDefinition>? addColumns,
    AutoScalingSpecification? autoScalingSpecification,
    CapacitySpecification? capacitySpecification,
    CdcSpecification? cdcSpecification,
    ClientSideTimestamps? clientSideTimestamps,
    int? defaultTimeToLive,
    EncryptionSpecification? encryptionSpecification,
    PointInTimeRecovery? pointInTimeRecovery,
    List<ReplicaSpecification>? replicaSpecifications,
    TimeToLive? ttl,
    WarmThroughputSpecification? warmThroughputSpecification,
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
        if (cdcSpecification != null) 'cdcSpecification': cdcSpecification,
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
        if (warmThroughputSpecification != null)
          'warmThroughputSpecification': warmThroughputSpecification,
      },
    );

    return UpdateTableResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateKeyspaceResponse {
  /// The unique identifier of the keyspace in the format of an Amazon Resource
  /// Name (ARN).
  final String resourceArn;

  CreateKeyspaceResponse({
    required this.resourceArn,
  });

  factory CreateKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeyspaceResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
    };
  }
}

/// @nodoc
class CreateTableResponse {
  /// The unique identifier of the table in the format of an Amazon Resource Name
  /// (ARN).
  final String resourceArn;

  CreateTableResponse({
    required this.resourceArn,
  });

  factory CreateTableResponse.fromJson(Map<String, dynamic> json) {
    return CreateTableResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
    };
  }
}

/// @nodoc
class CreateTypeResponse {
  /// The unique identifier of the keyspace that contains the new type in the
  /// format of an Amazon Resource Name (ARN).
  final String keyspaceArn;

  /// The formatted name of the user-defined type that was created. Note that
  /// Amazon Keyspaces requires the formatted name of the type for other
  /// operations, for example <code>GetType</code>.
  final String typeName;

  CreateTypeResponse({
    required this.keyspaceArn,
    required this.typeName,
  });

  factory CreateTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateTypeResponse(
      keyspaceArn: (json['keyspaceArn'] as String?) ?? '',
      typeName: (json['typeName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceArn = this.keyspaceArn;
    final typeName = this.typeName;
    return {
      'keyspaceArn': keyspaceArn,
      'typeName': typeName,
    };
  }
}

/// @nodoc
class DeleteKeyspaceResponse {
  DeleteKeyspaceResponse();

  factory DeleteKeyspaceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKeyspaceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteTableResponse {
  DeleteTableResponse();

  factory DeleteTableResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteTypeResponse {
  /// The unique identifier of the keyspace from which the type was deleted in the
  /// format of an Amazon Resource Name (ARN).
  final String keyspaceArn;

  /// The name of the type that was deleted.
  final String typeName;

  DeleteTypeResponse({
    required this.keyspaceArn,
    required this.typeName,
  });

  factory DeleteTypeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTypeResponse(
      keyspaceArn: (json['keyspaceArn'] as String?) ?? '',
      typeName: (json['typeName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceArn = this.keyspaceArn;
    final typeName = this.typeName;
    return {
      'keyspaceArn': keyspaceArn,
      'typeName': typeName,
    };
  }
}

/// @nodoc
class GetKeyspaceResponse {
  /// The name of the keyspace.
  final String keyspaceName;

  /// Returns the replication strategy of the keyspace. The options are
  /// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
  final Rs replicationStrategy;

  /// Returns the ARN of the keyspace.
  final String resourceArn;

  /// A list of all Regions the keyspace is replicated in after the update
  /// keyspace operation and their status.
  final List<ReplicationGroupStatus>? replicationGroupStatuses;

  /// If the <code>replicationStrategy</code> of the keyspace is
  /// <code>MULTI_REGION</code>, a list of replication Regions is returned.
  final List<String>? replicationRegions;

  GetKeyspaceResponse({
    required this.keyspaceName,
    required this.replicationStrategy,
    required this.resourceArn,
    this.replicationGroupStatuses,
    this.replicationRegions,
  });

  factory GetKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyspaceResponse(
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      replicationStrategy:
          Rs.fromString((json['replicationStrategy'] as String?) ?? ''),
      resourceArn: (json['resourceArn'] as String?) ?? '',
      replicationGroupStatuses: (json['replicationGroupStatuses'] as List?)
          ?.nonNulls
          .map(
              (e) => ReplicationGroupStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicationRegions: (json['replicationRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final replicationStrategy = this.replicationStrategy;
    final resourceArn = this.resourceArn;
    final replicationGroupStatuses = this.replicationGroupStatuses;
    final replicationRegions = this.replicationRegions;
    return {
      'keyspaceName': keyspaceName,
      'replicationStrategy': replicationStrategy.value,
      'resourceArn': resourceArn,
      if (replicationGroupStatuses != null)
        'replicationGroupStatuses': replicationGroupStatuses,
      if (replicationRegions != null) 'replicationRegions': replicationRegions,
    };
  }
}

/// @nodoc
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

  /// The CDC stream settings of the table.
  final CdcSpecificationSummary? cdcSpecification;

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

  /// The Amazon Resource Name (ARN) of the stream.
  final String? latestStreamArn;

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

  /// The warm throughput settings for the table, including the current status and
  /// configured read and write capacity units.
  final WarmThroughputSpecificationSummary? warmThroughputSpecification;

  GetTableResponse({
    required this.keyspaceName,
    required this.resourceArn,
    required this.tableName,
    this.capacitySpecification,
    this.cdcSpecification,
    this.clientSideTimestamps,
    this.comment,
    this.creationTimestamp,
    this.defaultTimeToLive,
    this.encryptionSpecification,
    this.latestStreamArn,
    this.pointInTimeRecovery,
    this.replicaSpecifications,
    this.schemaDefinition,
    this.status,
    this.ttl,
    this.warmThroughputSpecification,
  });

  factory GetTableResponse.fromJson(Map<String, dynamic> json) {
    return GetTableResponse(
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
      capacitySpecification: json['capacitySpecification'] != null
          ? CapacitySpecificationSummary.fromJson(
              json['capacitySpecification'] as Map<String, dynamic>)
          : null,
      cdcSpecification: json['cdcSpecification'] != null
          ? CdcSpecificationSummary.fromJson(
              json['cdcSpecification'] as Map<String, dynamic>)
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
      latestStreamArn: json['latestStreamArn'] as String?,
      pointInTimeRecovery: json['pointInTimeRecovery'] != null
          ? PointInTimeRecoverySummary.fromJson(
              json['pointInTimeRecovery'] as Map<String, dynamic>)
          : null,
      replicaSpecifications: (json['replicaSpecifications'] as List?)
          ?.nonNulls
          .map((e) =>
              ReplicaSpecificationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaDefinition: json['schemaDefinition'] != null
          ? SchemaDefinition.fromJson(
              json['schemaDefinition'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(TableStatus.fromString),
      ttl: json['ttl'] != null
          ? TimeToLive.fromJson(json['ttl'] as Map<String, dynamic>)
          : null,
      warmThroughputSpecification: json['warmThroughputSpecification'] != null
          ? WarmThroughputSpecificationSummary.fromJson(
              json['warmThroughputSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final resourceArn = this.resourceArn;
    final tableName = this.tableName;
    final capacitySpecification = this.capacitySpecification;
    final cdcSpecification = this.cdcSpecification;
    final clientSideTimestamps = this.clientSideTimestamps;
    final comment = this.comment;
    final creationTimestamp = this.creationTimestamp;
    final defaultTimeToLive = this.defaultTimeToLive;
    final encryptionSpecification = this.encryptionSpecification;
    final latestStreamArn = this.latestStreamArn;
    final pointInTimeRecovery = this.pointInTimeRecovery;
    final replicaSpecifications = this.replicaSpecifications;
    final schemaDefinition = this.schemaDefinition;
    final status = this.status;
    final ttl = this.ttl;
    final warmThroughputSpecification = this.warmThroughputSpecification;
    return {
      'keyspaceName': keyspaceName,
      'resourceArn': resourceArn,
      'tableName': tableName,
      if (capacitySpecification != null)
        'capacitySpecification': capacitySpecification,
      if (cdcSpecification != null) 'cdcSpecification': cdcSpecification,
      if (clientSideTimestamps != null)
        'clientSideTimestamps': clientSideTimestamps,
      if (comment != null) 'comment': comment,
      if (creationTimestamp != null)
        'creationTimestamp': unixTimestampToJson(creationTimestamp),
      if (defaultTimeToLive != null) 'defaultTimeToLive': defaultTimeToLive,
      if (encryptionSpecification != null)
        'encryptionSpecification': encryptionSpecification,
      if (latestStreamArn != null) 'latestStreamArn': latestStreamArn,
      if (pointInTimeRecovery != null)
        'pointInTimeRecovery': pointInTimeRecovery,
      if (replicaSpecifications != null)
        'replicaSpecifications': replicaSpecifications,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
      if (status != null) 'status': status.value,
      if (ttl != null) 'ttl': ttl,
      if (warmThroughputSpecification != null)
        'warmThroughputSpecification': warmThroughputSpecification,
    };
  }
}

/// @nodoc
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
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
      autoScalingSpecification: json['autoScalingSpecification'] != null
          ? AutoScalingSpecification.fromJson(
              json['autoScalingSpecification'] as Map<String, dynamic>)
          : null,
      replicaSpecifications: (json['replicaSpecifications'] as List?)
          ?.nonNulls
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

/// @nodoc
class GetTypeResponse {
  /// The unique identifier of the keyspace that contains this type in the format
  /// of an Amazon Resource Name (ARN).
  final String keyspaceArn;

  /// The name of the keyspace that contains this type.
  final String keyspaceName;

  /// The name of the type.
  final String typeName;

  /// The types that use this type.
  final List<String>? directParentTypes;

  /// The tables that use this type.
  final List<String>? directReferringTables;

  /// The names and types that define this type.
  final List<FieldDefinition>? fieldDefinitions;

  /// The timestamp that shows when this type was last modified.
  final DateTime? lastModifiedTimestamp;

  /// The level of nesting implemented for this type.
  final int? maxNestingDepth;

  /// The status of this type.
  final TypeStatus? status;

  GetTypeResponse({
    required this.keyspaceArn,
    required this.keyspaceName,
    required this.typeName,
    this.directParentTypes,
    this.directReferringTables,
    this.fieldDefinitions,
    this.lastModifiedTimestamp,
    this.maxNestingDepth,
    this.status,
  });

  factory GetTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetTypeResponse(
      keyspaceArn: (json['keyspaceArn'] as String?) ?? '',
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      typeName: (json['typeName'] as String?) ?? '',
      directParentTypes: (json['directParentTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      directReferringTables: (json['directReferringTables'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      fieldDefinitions: (json['fieldDefinitions'] as List?)
          ?.nonNulls
          .map((e) => FieldDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      maxNestingDepth: json['maxNestingDepth'] as int?,
      status: (json['status'] as String?)?.let(TypeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceArn = this.keyspaceArn;
    final keyspaceName = this.keyspaceName;
    final typeName = this.typeName;
    final directParentTypes = this.directParentTypes;
    final directReferringTables = this.directReferringTables;
    final fieldDefinitions = this.fieldDefinitions;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final maxNestingDepth = this.maxNestingDepth;
    final status = this.status;
    return {
      'keyspaceArn': keyspaceArn,
      'keyspaceName': keyspaceName,
      'typeName': typeName,
      if (directParentTypes != null) 'directParentTypes': directParentTypes,
      if (directReferringTables != null)
        'directReferringTables': directReferringTables,
      if (fieldDefinitions != null) 'fieldDefinitions': fieldDefinitions,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (maxNestingDepth != null) 'maxNestingDepth': maxNestingDepth,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
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
      keyspaces: ((json['keyspaces'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ListTypesResponse {
  /// The list of types contained in the specified keyspace.
  final List<String> types;

  /// The pagination token. To resume pagination, provide the
  /// <code>NextToken</code> value as an argument of a subsequent API invocation.
  final String? nextToken;

  ListTypesResponse({
    required this.types,
    this.nextToken,
  });

  factory ListTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListTypesResponse(
      types: ((json['types'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final types = this.types;
    final nextToken = this.nextToken;
    return {
      'types': types,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RestoreTableResponse {
  /// The Amazon Resource Name (ARN) of the restored table.
  final String restoredTableARN;

  RestoreTableResponse({
    required this.restoredTableARN,
  });

  factory RestoreTableResponse.fromJson(Map<String, dynamic> json) {
    return RestoreTableResponse(
      restoredTableARN: (json['restoredTableARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final restoredTableARN = this.restoredTableARN;
    return {
      'restoredTableARN': restoredTableARN,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateKeyspaceResponse {
  /// The unique identifier of the keyspace in the format of an Amazon Resource
  /// Name (ARN).
  final String resourceArn;

  UpdateKeyspaceResponse({
    required this.resourceArn,
  });

  factory UpdateKeyspaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKeyspaceResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
    };
  }
}

/// @nodoc
class UpdateTableResponse {
  /// The Amazon Resource Name (ARN) of the modified table.
  final String resourceArn;

  UpdateTableResponse({
    required this.resourceArn,
  });

  factory UpdateTableResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTableResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'resourceArn': resourceArn,
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
///
/// @nodoc
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
      'throughputMode': throughputMode.value,
      if (readCapacityUnits != null) 'readCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'writeCapacityUnits': writeCapacityUnits,
    };
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
///
/// @nodoc
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
      type: EncryptionType.fromString((json['type'] as String?) ?? ''),
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    return {
      'type': type.value,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
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
///
/// @nodoc
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
      'status': status.value,
    };
  }
}

/// Enable custom Time to Live (TTL) settings for rows and columns without
/// setting a TTL default for the specified table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_enabling">Enabling
/// TTL on tables</a> in the <i>Amazon Keyspaces Developer Guide</i>.
///
/// @nodoc
class TimeToLive {
  /// Shows how to enable custom Time to Live (TTL) settings for the specified
  /// table.
  final TimeToLiveStatus status;

  TimeToLive({
    required this.status,
  });

  factory TimeToLive.fromJson(Map<String, dynamic> json) {
    return TimeToLive(
      status: TimeToLiveStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// The client-side timestamp setting of the table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps-how-it-works.html">How
/// it works: Amazon Keyspaces client-side timestamps</a> in the <i>Amazon
/// Keyspaces Developer Guide</i>.
///
/// @nodoc
class ClientSideTimestamps {
  /// Shows how to enable client-side timestamps settings for the specified table.
  final ClientSideTimestampsStatus status;

  ClientSideTimestamps({
    required this.status,
  });

  factory ClientSideTimestamps.fromJson(Map<String, dynamic> json) {
    return ClientSideTimestamps(
      status: ClientSideTimestampsStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// The optional auto scaling capacity settings for a table in provisioned
/// capacity mode.
///
/// @nodoc
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

/// The settings for the CDC stream of a table. For more information about CDC
/// streams, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cdc.html">Working
/// with change data capture (CDC) streams in Amazon Keyspaces</a> in the
/// <i>Amazon Keyspaces Developer Guide</i>.
///
/// @nodoc
class CdcSpecification {
  /// The status of the CDC stream. You can enable or disable a stream for a
  /// table.
  final CdcStatus status;

  /// Specifies that the stream inherits the tags from the table.
  final CdcPropagateTags? propagateTags;

  /// The tags (key-value pairs) that you want to apply to the stream.
  final List<Tag>? tags;

  /// The view type specifies the changes Amazon Keyspaces records for each
  /// changed row in the stream. After you create the stream, you can't make
  /// changes to this selection.
  ///
  /// The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - both versions of the row, before and after
  /// the change. This is the default.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - the version of the row after the change.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - the version of the row before the change.
  /// </li>
  /// <li>
  /// <code>KEYS_ONLY</code> - the partition and clustering keys of the row that
  /// was changed.
  /// </li>
  /// </ul>
  final ViewType? viewType;

  CdcSpecification({
    required this.status,
    this.propagateTags,
    this.tags,
    this.viewType,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final propagateTags = this.propagateTags;
    final tags = this.tags;
    final viewType = this.viewType;
    return {
      'status': status.value,
      if (propagateTags != null) 'propagateTags': propagateTags.value,
      if (tags != null) 'tags': tags,
      if (viewType != null) 'viewType': viewType.value,
    };
  }
}

/// Specifies the warm throughput settings for a table. Pre-warming a table by
/// specifying warm throughput pre-provisions read and write capacity units to
/// help avoid capacity exceeded exceptions and reduce latency when your table
/// starts receiving traffic.
///
/// For more information about pre-warming in Amazon Keyspaces, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/warm-throughput.html">Pre-warm
/// a table in Amazon Keyspaces</a> in the <i>Amazon Keyspaces Developer
/// Guide</i>.
///
/// @nodoc
class WarmThroughputSpecification {
  /// The number of read capacity units per second to pre-warm the table for read
  /// capacity throughput. The minimum value is 1.
  final int? readUnitsPerSecond;

  /// The number of write capacity units per second to pre-warm the table for
  /// write capacity throughput. The minimum value is 1.
  final int? writeUnitsPerSecond;

  WarmThroughputSpecification({
    this.readUnitsPerSecond,
    this.writeUnitsPerSecond,
  });

  Map<String, dynamic> toJson() {
    final readUnitsPerSecond = this.readUnitsPerSecond;
    final writeUnitsPerSecond = this.writeUnitsPerSecond;
    return {
      if (readUnitsPerSecond != null) 'readUnitsPerSecond': readUnitsPerSecond,
      if (writeUnitsPerSecond != null)
        'writeUnitsPerSecond': writeUnitsPerSecond,
    };
  }
}

/// @nodoc
class CdcStatus {
  static const enabled = CdcStatus._('ENABLED');
  static const enabling = CdcStatus._('ENABLING');
  static const disabled = CdcStatus._('DISABLED');
  static const disabling = CdcStatus._('DISABLING');

  final String value;

  const CdcStatus._(this.value);

  static const values = [enabled, enabling, disabled, disabling];

  static CdcStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CdcStatus._(value));

  @override
  bool operator ==(other) => other is CdcStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ViewType {
  static const newImage = ViewType._('NEW_IMAGE');
  static const oldImage = ViewType._('OLD_IMAGE');
  static const keysOnly = ViewType._('KEYS_ONLY');
  static const newAndOldImages = ViewType._('NEW_AND_OLD_IMAGES');

  final String value;

  const ViewType._(this.value);

  static const values = [newImage, oldImage, keysOnly, newAndOldImages];

  static ViewType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ViewType._(value));

  @override
  bool operator ==(other) => other is ViewType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CdcPropagateTags {
  static const table = CdcPropagateTags._('TABLE');
  static const none = CdcPropagateTags._('NONE');

  final String value;

  const CdcPropagateTags._(this.value);

  static const values = [table, none];

  static CdcPropagateTags fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CdcPropagateTags._(value));

  @override
  bool operator ==(other) => other is CdcPropagateTags && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
///
/// @nodoc
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
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
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
///
/// @nodoc
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
///
/// @nodoc
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

/// Amazon Keyspaces supports the <code>target tracking</code> auto scaling
/// policy. With this policy, Amazon Keyspaces auto scaling ensures that the
/// table's ratio of consumed to provisioned capacity stays at or near the
/// target value that you specify. You define the target value as a percentage
/// between 20 and 90.
///
/// @nodoc
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

/// The auto scaling policy that scales a table based on the ratio of consumed
/// to provisioned capacity.
///
/// @nodoc
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
      targetValue: (json['targetValue'] as double?) ?? 0,
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

/// @nodoc
class ClientSideTimestampsStatus {
  static const enabled = ClientSideTimestampsStatus._('ENABLED');

  final String value;

  const ClientSideTimestampsStatus._(this.value);

  static const values = [enabled];

  static ClientSideTimestampsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClientSideTimestampsStatus._(value));

  @override
  bool operator ==(other) =>
      other is ClientSideTimestampsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TimeToLiveStatus {
  static const enabled = TimeToLiveStatus._('ENABLED');

  final String value;

  const TimeToLiveStatus._(this.value);

  static const values = [enabled];

  static TimeToLiveStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TimeToLiveStatus._(value));

  @override
  bool operator ==(other) => other is TimeToLiveStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PointInTimeRecoveryStatus {
  static const enabled = PointInTimeRecoveryStatus._('ENABLED');
  static const disabled = PointInTimeRecoveryStatus._('DISABLED');

  final String value;

  const PointInTimeRecoveryStatus._(this.value);

  static const values = [enabled, disabled];

  static PointInTimeRecoveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PointInTimeRecoveryStatus._(value));

  @override
  bool operator ==(other) =>
      other is PointInTimeRecoveryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EncryptionType {
  static const customerManagedKmsKey =
      EncryptionType._('CUSTOMER_MANAGED_KMS_KEY');
  static const awsOwnedKmsKey = EncryptionType._('AWS_OWNED_KMS_KEY');

  final String value;

  const EncryptionType._(this.value);

  static const values = [customerManagedKmsKey, awsOwnedKmsKey];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ThroughputMode {
  static const payPerRequest = ThroughputMode._('PAY_PER_REQUEST');
  static const provisioned = ThroughputMode._('PROVISIONED');

  final String value;

  const ThroughputMode._(this.value);

  static const values = [payPerRequest, provisioned];

  static ThroughputMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThroughputMode._(value));

  @override
  bool operator ==(other) => other is ThroughputMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The names and data types of regular columns.
///
/// @nodoc
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
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
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

/// The replication specification of the keyspace includes:
///
/// <ul>
/// <li>
/// <code>regionList</code> - the Amazon Web Services Regions where the keyspace
/// is replicated in.
/// </li>
/// <li>
/// <code>replicationStrategy</code> - the required value is
/// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
/// </li>
/// </ul>
///
/// @nodoc
class ReplicationSpecification {
  /// The <code>replicationStrategy</code> of a keyspace, the required value is
  /// <code>SINGLE_REGION</code> or <code>MULTI_REGION</code>.
  final Rs replicationStrategy;

  /// The <code>regionList</code> contains the Amazon Web Services Regions where
  /// the keyspace is replicated in.
  final List<String>? regionList;

  ReplicationSpecification({
    required this.replicationStrategy,
    this.regionList,
  });

  Map<String, dynamic> toJson() {
    final replicationStrategy = this.replicationStrategy;
    final regionList = this.regionList;
    return {
      'replicationStrategy': replicationStrategy.value,
      if (regionList != null) 'regionList': regionList,
    };
  }
}

/// @nodoc
class Rs {
  static const singleRegion = Rs._('SINGLE_REGION');
  static const multiRegion = Rs._('MULTI_REGION');

  final String value;

  const Rs._(this.value);

  static const values = [singleRegion, multiRegion];

  static Rs fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Rs._(value));

  @override
  bool operator ==(other) => other is Rs && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns the name of the specified table, the keyspace it is stored in, and
/// the unique identifier in the format of an Amazon Resource Name (ARN).
///
/// @nodoc
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
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
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

/// Represents the properties of a keyspace.
///
/// @nodoc
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
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      replicationStrategy:
          Rs.fromString((json['replicationStrategy'] as String?) ?? ''),
      resourceArn: (json['resourceArn'] as String?) ?? '',
      replicationRegions: (json['replicationRegions'] as List?)
          ?.nonNulls
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
      'replicationStrategy': replicationStrategy.value,
      'resourceArn': resourceArn,
      if (replicationRegions != null) 'replicationRegions': replicationRegions,
    };
  }
}

/// @nodoc
class TypeStatus {
  static const active = TypeStatus._('ACTIVE');
  static const creating = TypeStatus._('CREATING');
  static const deleting = TypeStatus._('DELETING');
  static const restoring = TypeStatus._('RESTORING');

  final String value;

  const TypeStatus._(this.value);

  static const values = [active, creating, deleting, restoring];

  static TypeStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TypeStatus._(value));

  @override
  bool operator ==(other) => other is TypeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A field definition consists out of a name and a type.
///
/// @nodoc
class FieldDefinition {
  /// The identifier.
  final String name;

  /// Any supported Cassandra data type, including collections and other
  /// user-defined types that are contained in the same keyspace.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cassandra-apis.html#cassandra-data-type">Cassandra
  /// data type support</a> in the <i>Amazon Keyspaces Developer Guide</i>.
  final String type;

  FieldDefinition({
    required this.name,
    required this.type,
  });

  factory FieldDefinition.fromJson(Map<String, dynamic> json) {
    return FieldDefinition(
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
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

/// The auto scaling settings of a multi-Region table in the specified Amazon
/// Web Services Region.
///
/// @nodoc
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

/// @nodoc
class TableStatus {
  static const active = TableStatus._('ACTIVE');
  static const creating = TableStatus._('CREATING');
  static const updating = TableStatus._('UPDATING');
  static const deleting = TableStatus._('DELETING');
  static const deleted = TableStatus._('DELETED');
  static const restoring = TableStatus._('RESTORING');
  static const inaccessibleEncryptionCredentials =
      TableStatus._('INACCESSIBLE_ENCRYPTION_CREDENTIALS');

  final String value;

  const TableStatus._(this.value);

  static const values = [
    active,
    creating,
    updating,
    deleting,
    deleted,
    restoring,
    inaccessibleEncryptionCredentials
  ];

  static TableStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TableStatus._(value));

  @override
  bool operator ==(other) => other is TableStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the schema of the table.
///
/// @nodoc
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
      allColumns: ((json['allColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => ColumnDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      partitionKeys: ((json['partitionKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => PartitionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusteringKeys: (json['clusteringKeys'] as List?)
          ?.nonNulls
          .map((e) => ClusteringKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      staticColumns: (json['staticColumns'] as List?)
          ?.nonNulls
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
///
/// @nodoc
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
      throughputMode:
          ThroughputMode.fromString((json['throughputMode'] as String?) ?? ''),
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
      'throughputMode': throughputMode.value,
      if (lastUpdateToPayPerRequestTimestamp != null)
        'lastUpdateToPayPerRequestTimestamp':
            unixTimestampToJson(lastUpdateToPayPerRequestTimestamp),
      if (readCapacityUnits != null) 'readCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'writeCapacityUnits': writeCapacityUnits,
    };
  }
}

/// The point-in-time recovery status of the specified table.
///
/// @nodoc
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
      status: PointInTimeRecoveryStatus.fromString(
          (json['status'] as String?) ?? ''),
      earliestRestorableTimestamp:
          timeStampFromJson(json['earliestRestorableTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final earliestRestorableTimestamp = this.earliestRestorableTimestamp;
    return {
      'status': status.value,
      if (earliestRestorableTimestamp != null)
        'earliestRestorableTimestamp':
            unixTimestampToJson(earliestRestorableTimestamp),
    };
  }
}

/// An optional comment that describes the table.
///
/// @nodoc
class Comment {
  /// An optional description of the table.
  final String message;

  Comment({
    required this.message,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'message': message,
    };
  }
}

/// The settings of the CDC stream of the table. For more information about CDC
/// streams, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cdc.html">Working
/// with change data capture (CDC) streams in Amazon Keyspaces</a> in the
/// <i>Amazon Keyspaces Developer Guide</i>.
///
/// @nodoc
class CdcSpecificationSummary {
  /// The status of the CDC stream. Specifies if the table has a CDC stream.
  final CdcStatus status;

  /// The view type specifies the changes Amazon Keyspaces records for each
  /// changed row in the stream. This setting can't be changed, after the stream
  /// has been created.
  ///
  /// The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - both versions of the row, before and after
  /// the change. This is the default.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - the version of the row after the change.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - the version of the row before the change.
  /// </li>
  /// <li>
  /// <code>KEYS_ONLY</code> - the partition and clustering keys of the row that
  /// was changed.
  /// </li>
  /// </ul>
  final ViewType? viewType;

  CdcSpecificationSummary({
    required this.status,
    this.viewType,
  });

  factory CdcSpecificationSummary.fromJson(Map<String, dynamic> json) {
    return CdcSpecificationSummary(
      status: CdcStatus.fromString((json['status'] as String?) ?? ''),
      viewType: (json['viewType'] as String?)?.let(ViewType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final viewType = this.viewType;
    return {
      'status': status.value,
      if (viewType != null) 'viewType': viewType.value,
    };
  }
}

/// Contains the current warm throughput settings for a table, including the
/// configured capacity units and the current status of the warm throughput
/// configuration.
///
/// @nodoc
class WarmThroughputSpecificationSummary {
  /// The number of read capacity units per second currently configured for warm
  /// throughput.
  final int readUnitsPerSecond;

  /// The current status of the warm throughput configuration. Valid values are
  /// <code>AVAILABLE</code> when the configuration is active, and
  /// <code>UPDATING</code> when changes are being applied.
  final WarmThroughputStatus status;

  /// The number of write capacity units per second currently configured for warm
  /// throughput.
  final int writeUnitsPerSecond;

  WarmThroughputSpecificationSummary({
    required this.readUnitsPerSecond,
    required this.status,
    required this.writeUnitsPerSecond,
  });

  factory WarmThroughputSpecificationSummary.fromJson(
      Map<String, dynamic> json) {
    return WarmThroughputSpecificationSummary(
      readUnitsPerSecond: (json['readUnitsPerSecond'] as int?) ?? 0,
      status:
          WarmThroughputStatus.fromString((json['status'] as String?) ?? ''),
      writeUnitsPerSecond: (json['writeUnitsPerSecond'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final readUnitsPerSecond = this.readUnitsPerSecond;
    final status = this.status;
    final writeUnitsPerSecond = this.writeUnitsPerSecond;
    return {
      'readUnitsPerSecond': readUnitsPerSecond,
      'status': status.value,
      'writeUnitsPerSecond': writeUnitsPerSecond,
    };
  }
}

/// @nodoc
class WarmThroughputStatus {
  static const available = WarmThroughputStatus._('AVAILABLE');
  static const updating = WarmThroughputStatus._('UPDATING');

  final String value;

  const WarmThroughputStatus._(this.value);

  static const values = [available, updating];

  static WarmThroughputStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WarmThroughputStatus._(value));

  @override
  bool operator ==(other) =>
      other is WarmThroughputStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
///
/// @nodoc
class ReplicaSpecificationSummary {
  final CapacitySpecificationSummary? capacitySpecification;

  /// The Amazon Web Services Region.
  final String? region;

  /// The status of the multi-Region table in the specified Amazon Web Services
  /// Region.
  final TableStatus? status;

  /// The warm throughput settings for this replica, including the current status
  /// and configured read and write capacity units.
  final WarmThroughputSpecificationSummary? warmThroughputSpecification;

  ReplicaSpecificationSummary({
    this.capacitySpecification,
    this.region,
    this.status,
    this.warmThroughputSpecification,
  });

  factory ReplicaSpecificationSummary.fromJson(Map<String, dynamic> json) {
    return ReplicaSpecificationSummary(
      capacitySpecification: json['capacitySpecification'] != null
          ? CapacitySpecificationSummary.fromJson(
              json['capacitySpecification'] as Map<String, dynamic>)
          : null,
      region: json['region'] as String?,
      status: (json['status'] as String?)?.let(TableStatus.fromString),
      warmThroughputSpecification: json['warmThroughputSpecification'] != null
          ? WarmThroughputSpecificationSummary.fromJson(
              json['warmThroughputSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacitySpecification = this.capacitySpecification;
    final region = this.region;
    final status = this.status;
    final warmThroughputSpecification = this.warmThroughputSpecification;
    return {
      if (capacitySpecification != null)
        'capacitySpecification': capacitySpecification,
      if (region != null) 'region': region,
      if (status != null) 'status': status.value,
      if (warmThroughputSpecification != null)
        'warmThroughputSpecification': warmThroughputSpecification,
    };
  }
}

/// The static columns of the table. Static columns store values that are shared
/// by all rows in the same partition.
///
/// @nodoc
class StaticColumn {
  /// The name of the static column.
  final String name;

  StaticColumn({
    required this.name,
  });

  factory StaticColumn.fromJson(Map<String, dynamic> json) {
    return StaticColumn(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// The optional clustering column portion of your primary key determines how
/// the data is clustered and sorted within each partition.
///
/// @nodoc
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
      name: (json['name'] as String?) ?? '',
      orderBy: SortOrder.fromString((json['orderBy'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final orderBy = this.orderBy;
    return {
      'name': name,
      'orderBy': orderBy.value,
    };
  }
}

/// @nodoc
class SortOrder {
  static const asc = SortOrder._('ASC');
  static const desc = SortOrder._('DESC');

  final String value;

  const SortOrder._(this.value);

  static const values = [asc, desc];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The partition key portion of the primary key is required and determines how
/// Amazon Keyspaces stores the data. The partition key can be a single column,
/// or it can be a compound value composed of two or more columns.
///
/// @nodoc
class PartitionKey {
  /// The name(s) of the partition key column(s).
  final String name;

  PartitionKey({
    required this.name,
  });

  factory PartitionKey.fromJson(Map<String, dynamic> json) {
    return PartitionKey(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// This shows the summary status of the keyspace after a new Amazon Web
/// Services Region was added.
///
/// @nodoc
class ReplicationGroupStatus {
  /// The status of the keyspace.
  final KeyspaceStatus keyspaceStatus;

  /// The name of the Region that was added to the keyspace.
  final String region;

  /// This shows the replication progress of tables in the keyspace. The value is
  /// expressed as a percentage of the newly replicated tables with status
  /// <code>Active</code> compared to the total number of tables in the keyspace.
  final String? tablesReplicationProgress;

  ReplicationGroupStatus({
    required this.keyspaceStatus,
    required this.region,
    this.tablesReplicationProgress,
  });

  factory ReplicationGroupStatus.fromJson(Map<String, dynamic> json) {
    return ReplicationGroupStatus(
      keyspaceStatus:
          KeyspaceStatus.fromString((json['keyspaceStatus'] as String?) ?? ''),
      region: (json['region'] as String?) ?? '',
      tablesReplicationProgress: json['tablesReplicationProgress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceStatus = this.keyspaceStatus;
    final region = this.region;
    final tablesReplicationProgress = this.tablesReplicationProgress;
    return {
      'keyspaceStatus': keyspaceStatus.value,
      'region': region,
      if (tablesReplicationProgress != null)
        'tablesReplicationProgress': tablesReplicationProgress,
    };
  }
}

/// @nodoc
class KeyspaceStatus {
  static const active = KeyspaceStatus._('ACTIVE');
  static const creating = KeyspaceStatus._('CREATING');
  static const updating = KeyspaceStatus._('UPDATING');
  static const deleting = KeyspaceStatus._('DELETING');

  final String value;

  const KeyspaceStatus._(this.value);

  static const values = [active, creating, updating, deleting];

  static KeyspaceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyspaceStatus._(value));

  @override
  bool operator ==(other) => other is KeyspaceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
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
