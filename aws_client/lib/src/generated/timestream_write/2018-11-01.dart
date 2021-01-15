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

part '2018-11-01.g.dart';

/// Amazon Timestream is a fast, scalable, fully managed time series database
/// service that makes it easy to store and analyze trillions of time series
/// data points per day. With Timestream, you can easily store and analyze IoT
/// sensor data to derive insights from your IoT applications. You can analyze
/// industrial telemetry to streamline equipment management and maintenance. You
/// can also store and analyze log data and metrics to improve the performance
/// and availability of your applications. Timestream is built from the ground
/// up to effectively ingest, process, and store time series data. It organizes
/// data to optimize query processing. It automatically scales based on the
/// volume of data ingested and on the query volume to ensure you receive
/// optimal performance while inserting and querying data. As your data grows
/// over time, Timestream’s adaptive query processing engine spans across
/// storage tiers to provide fast analysis while reducing costs.
class TimestreamWrite {
  final _s.JsonProtocol _protocol;
  TimestreamWrite({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ingest.timestream',
            signingName: 'timestream',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new Timestream database. If the KMS key is not specified, the
  /// database will be encrypted with a Timestream managed KMS key located in
  /// your account. Refer to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed KMS keys</a> for more info. Service quotas apply. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidEndpointException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key for the database. If the KMS key is not specified, the
  /// database will be encrypted with a Timestream managed KMS key located in
  /// your account. Refer to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed KMS keys</a> for more info.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the table.
  Future<CreateDatabaseResponse> createDatabase({
    @_s.required String databaseName,
    String kmsKeyId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.CreateDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// The CreateTable operation adds a new table to an existing database in your
  /// account. In an AWS account, table names must be at least unique within
  /// each Region if they are in the same database. You may have identical table
  /// names in the same Region if the tables are in seperate databases. While
  /// creating the table, you must specify the table name, database name, and
  /// the retention properties. Service quotas apply. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [tableName] :
  /// The name of the Timestream table.
  ///
  /// Parameter [retentionProperties] :
  /// The duration for which your time series data must be stored in the memory
  /// store and the magnetic store.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the table.
  Future<CreateTableResponse> createTable({
    @_s.required String databaseName,
    @_s.required String tableName,
    RetentionProperties retentionProperties,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (retentionProperties != null)
          'RetentionProperties': retentionProperties,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTableResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a given Timestream database. <i>This is an irreversible operation.
  /// After a database is deleted, the time series data from its tables cannot
  /// be recovered.</i>
  ///
  /// All tables in the database must be deleted first, or a ValidationException
  /// error will be thrown.
  ///
  /// Due to the nature of distributed retries, the operation can return either
  /// success or a ResourceNotFoundException. Clients should consider them
  /// equivalent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database to be deleted.
  Future<void> deleteDatabase({
    @_s.required String databaseName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DeleteDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
      },
    );
  }

  /// Deletes a given Timestream table. This is an irreversible operation. After
  /// a Timestream database table is deleted, the time series data stored in the
  /// table cannot be recovered.
  ///
  /// Due to the nature of distributed retries, the operation can return either
  /// success or a ResourceNotFoundException. Clients should consider them
  /// equivalent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database where the Timestream database is to be deleted.
  ///
  /// Parameter [tableName] :
  /// The name of the Timestream table to be deleted.
  Future<void> deleteTable({
    @_s.required String databaseName,
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DeleteTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
      },
    );
  }

  /// Returns information about the database, including the database name, time
  /// that the database was created, and the total number of tables found within
  /// the database. Service quotas apply. For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  Future<DescribeDatabaseResponse> describeDatabase({
    @_s.required String databaseName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DescribeDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
      },
    );

    return DescribeDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// DescribeEndpoints returns a list of available endpoints to make Timestream
  /// API calls against. This API is available through both Write and Query.
  ///
  /// Because Timestream’s SDKs are designed to transparently work with the
  /// service’s architecture, including the management and mapping of the
  /// service endpoints, <i>it is not recommended that you use this API
  /// unless</i>:
  ///
  /// <ul>
  /// <li>
  /// Your application uses a programming language that does not yet have SDK
  /// support
  /// </li>
  /// <li>
  /// You require better control over the client-side implementation
  /// </li>
  /// </ul>
  /// For detailed information on how to use DescribeEndpoints, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/Using-API.endpoint-discovery.html">The
  /// Endpoint Discovery Pattern and REST APIs</a>.
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

  /// Returns information about the table, including the table name, database
  /// name, retention duration of the memory store and the magnetic store.
  /// Service quotas apply. For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [tableName] :
  /// The name of the Timestream table.
  Future<DescribeTableResponse> describeTable({
    @_s.required String databaseName,
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DescribeTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
      },
    );

    return DescribeTableResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of your Timestream databases. Service quotas apply. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return in the output. If the total number of
  /// items available is more than the value specified, a NextToken is provided
  /// in the output. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  Future<ListDatabasesResponse> listDatabases({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.ListDatabases'
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

    return ListDatabasesResponse.fromJson(jsonResponse.body);
  }

  /// A list of tables, along with the name, status and retention properties of
  /// each table.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return in the output. If the total number of
  /// items available is more than the value specified, a NextToken is provided
  /// in the output. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  Future<ListTablesResponse> listTables({
    String databaseName,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.ListTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (databaseName != null) 'DatabaseName': databaseName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTablesResponse.fromJson(jsonResponse.body);
  }

  /// List all tags on a Timestream resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [resourceARN] :
  /// The Timestream resource with tags to be listed. This value is an Amazon
  /// Resource Name (ARN).
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
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
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.TagResource'
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the association of tags from a Timestream resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UntagResource'
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the KMS key for an existing database. While updating the
  /// database, you must specify the database name and the identifier of the new
  /// KMS key to be used (<code>KmsKeyId</code>). If there are any concurrent
  /// <code>UpdateDatabase</code> requests, first writer wins.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of the new KMS key (<code>KmsKeyId</code>) to be used to
  /// encrypt the data stored in the database. If the <code>KmsKeyId</code>
  /// currently registered with the database is the same as the
  /// <code>KmsKeyId</code> in the request, there will not be any update.
  ///
  /// You can specify the <code>KmsKeyId</code> using any of the following:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-1:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-1:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  Future<UpdateDatabaseResponse> updateDatabase({
    @_s.required String databaseName,
    @_s.required String kmsKeyId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(kmsKeyId, 'kmsKeyId');
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UpdateDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'KmsKeyId': kmsKeyId,
      },
    );

    return UpdateDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the retention duration of the memory store and magnetic store for
  /// your Timestream table. Note that the change in retention duration takes
  /// effect immediately. For example, if the retention period of the memory
  /// store was initially set to 2 hours and then changed to 24 hours, the
  /// memory store will be capable of holding 24 hours of data, but will be
  /// populated with 24 hours of data 22 hours after this change was made.
  /// Timestream does not retrieve data from the magnetic store to populate the
  /// memory store.
  ///
  /// Service quotas apply. For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [retentionProperties] :
  /// The retention duration of the memory store and the magnetic store.
  ///
  /// Parameter [tableName] :
  /// The name of the Timesream table.
  Future<UpdateTableResponse> updateTable({
    @_s.required String databaseName,
    @_s.required RetentionProperties retentionProperties,
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(retentionProperties, 'retentionProperties');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'RetentionProperties': retentionProperties,
        'TableName': tableName,
      },
    );

    return UpdateTableResponse.fromJson(jsonResponse.body);
  }

  /// The WriteRecords operation enables you to write your time series data into
  /// Timestream. You can specify a single data point or a batch of data points
  /// to be inserted into the system. Timestream offers you with a flexible
  /// schema that auto detects the column names and data types for your
  /// Timestream tables based on the dimension names and data types of the data
  /// points you specify when invoking writes into the database. Timestream
  /// support eventual consistency read semantics. This means that when you
  /// query data immediately after writing a batch of data into Timestream, the
  /// query results might not reflect the results of a recently completed write
  /// operation. The results may also include some stale data. If you repeat the
  /// query request after a short time, the results should return the latest
  /// data. Service quotas apply. For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Access
  /// Management</a> in the Timestream Developer Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RejectedRecordsException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [records] :
  /// An array of records containing the unique dimension and measure attributes
  /// for each time series data point.
  ///
  /// Parameter [tableName] :
  /// The name of the Timesream table.
  ///
  /// Parameter [commonAttributes] :
  /// A record containing the common measure and dimension attributes shared
  /// across all the records in the request. The measure and dimension
  /// attributes specified in here will be merged with the measure and dimension
  /// attributes in the records object when the data is written into Timestream.
  Future<void> writeRecords({
    @_s.required String databaseName,
    @_s.required List<Record> records,
    @_s.required String tableName,
    Record commonAttributes,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(records, 'records');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.WriteRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'Records': records,
        'TableName': tableName,
        if (commonAttributes != null) 'CommonAttributes': commonAttributes,
      },
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatabaseResponse {
  /// The newly created Timestream database.
  @_s.JsonKey(name: 'Database')
  final Database database;

  CreateDatabaseResponse({
    this.database,
  });
  factory CreateDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTableResponse {
  /// The newly created Timestream table.
  @_s.JsonKey(name: 'Table')
  final Table table;

  CreateTableResponse({
    this.table,
  });
  factory CreateTableResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTableResponseFromJson(json);
}

/// A top level container for a table. Databases and tables are the fundamental
/// management concepts in Amazon Timestream. All tables in a database are
/// encrypted with the same KMS key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Database {
  /// The Amazon Resource Name that uniquely identifies this database.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time when the database was created, calculated from the Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The name of the Timestream database.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The identifier of the KMS key used to encrypt the data stored in the
  /// database.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The last time that this database was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The total number of tables found within a Timestream database.
  @_s.JsonKey(name: 'TableCount')
  final int tableCount;

  Database({
    this.arn,
    this.creationTime,
    this.databaseName,
    this.kmsKeyId,
    this.lastUpdatedTime,
    this.tableCount,
  });
  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatabaseResponse {
  /// The name of the Timestream table.
  @_s.JsonKey(name: 'Database')
  final Database database;

  DescribeDatabaseResponse({
    this.database,
  });
  factory DescribeDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointsResponse {
  /// An <code>Endpoints</code> object is returned when a
  /// <code>DescribeEndpoints</code> request is made.
  @_s.JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    @_s.required this.endpoints,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTableResponse {
  /// The Timestream table.
  @_s.JsonKey(name: 'Table')
  final Table table;

  DescribeTableResponse({
    this.table,
  });
  factory DescribeTableResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTableResponseFromJson(json);
}

/// Dimension represents the meta data attributes of the time series. For
/// example, the name and availability zone of an EC2 instance or the name of
/// the manufacturer of a wind turbine are dimensions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Dimension {
  /// Dimension represents the meta data attributes of the time series. For
  /// example, the name and availability zone of an EC2 instance or the name of
  /// the manufacturer of a wind turbine are dimensions.
  ///
  /// For constraints on Dimension names, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.naming">Naming
  /// Constraints</a>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// The data type of the dimension for the time series data point.
  @_s.JsonKey(name: 'DimensionValueType')
  final DimensionValueType dimensionValueType;

  Dimension({
    @_s.required this.name,
    @_s.required this.value,
    this.dimensionValueType,
  });
  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}

enum DimensionValueType {
  @_s.JsonValue('VARCHAR')
  varchar,
}

/// Represents an available endpoint against which to make API calls agaisnt, as
/// well as the TTL for that endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// An endpoint address.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The TTL for the endpoint, in minutes.
  @_s.JsonKey(name: 'CachePeriodInMinutes')
  final int cachePeriodInMinutes;

  Endpoint({
    @_s.required this.address,
    @_s.required this.cachePeriodInMinutes,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatabasesResponse {
  /// A list of database names.
  @_s.JsonKey(name: 'Databases')
  final List<Database> databases;

  /// The pagination token. This parameter is returned when the response is
  /// truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDatabasesResponse({
    this.databases,
    this.nextToken,
  });
  factory ListDatabasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatabasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTablesResponse {
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tables.
  @_s.JsonKey(name: 'Tables')
  final List<Table> tables;

  ListTablesResponse({
    this.nextToken,
    this.tables,
  });
  factory ListTablesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTablesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags currently associated with the Timestream resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum MeasureValueType {
  @_s.JsonValue('DOUBLE')
  double,
  @_s.JsonValue('BIGINT')
  bigint,
  @_s.JsonValue('VARCHAR')
  varchar,
  @_s.JsonValue('BOOLEAN')
  boolean,
}

/// Record represents a time series data point being written into Timestream.
/// Each record contains an array of dimensions. Dimensions represent the meta
/// data attributes of a time series data point such as the instance name or
/// availability zone of an EC2 instance. A record also contains the measure
/// name which is the name of the measure being collected for example the CPU
/// utilization of an EC2 instance. A record also contains the measure value and
/// the value type which is the data type of the measure value. In addition, the
/// record contains the timestamp when the measure was collected that the
/// timestamp unit which represents the granularity of the timestamp.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Record {
  /// Contains the list of dimensions for time series data points.
  @_s.JsonKey(name: 'Dimensions')
  final List<Dimension> dimensions;

  /// Measure represents the data attribute of the time series. For example, the
  /// CPU utilization of an EC2 instance or the RPM of a wind turbine are
  /// measures.
  @_s.JsonKey(name: 'MeasureName')
  final String measureName;

  /// Contains the measure value for the time series data point.
  @_s.JsonKey(name: 'MeasureValue')
  final String measureValue;

  /// Contains the data type of the measure value for the time series data point.
  @_s.JsonKey(name: 'MeasureValueType')
  final MeasureValueType measureValueType;

  /// Contains the time at which the measure value for the data point was
  /// collected. The time value plus the unit provides the time elapsed since the
  /// epoch. For example, if the time value is <code>12345</code> and the unit is
  /// <code>ms</code>, then <code>12345 ms</code> have elapsed since the epoch.
  @_s.JsonKey(name: 'Time')
  final String time;

  /// The granularity of the timestamp unit. It indicates if the time value is in
  /// seconds, milliseconds, nanoseconds or other supported values.
  @_s.JsonKey(name: 'TimeUnit')
  final TimeUnit timeUnit;

  /// 64-bit attribute used for record updates. Write requests for duplicate data
  /// with a higher version number will update the existing measure value and
  /// version. In cases where the measure value is the same, <code>Version</code>
  /// will still be updated . Default value is to 1.
  @_s.JsonKey(name: 'Version')
  final int version;

  Record({
    this.dimensions,
    this.measureName,
    this.measureValue,
    this.measureValueType,
    this.time,
    this.timeUnit,
    this.version,
  });
  Map<String, dynamic> toJson() => _$RecordToJson(this);
}

/// Retention properties contain the duration for which your time series data
/// must be stored in the magnetic store and the memory store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RetentionProperties {
  /// The duration for which data must be stored in the magnetic store.
  @_s.JsonKey(name: 'MagneticStoreRetentionPeriodInDays')
  final int magneticStoreRetentionPeriodInDays;

  /// The duration for which data must be stored in the memory store.
  @_s.JsonKey(name: 'MemoryStoreRetentionPeriodInHours')
  final int memoryStoreRetentionPeriodInHours;

  RetentionProperties({
    @_s.required this.magneticStoreRetentionPeriodInDays,
    @_s.required this.memoryStoreRetentionPeriodInHours,
  });
  factory RetentionProperties.fromJson(Map<String, dynamic> json) =>
      _$RetentionPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$RetentionPropertiesToJson(this);
}

/// Table represents a database table in Timestream. Tables contain one or more
/// related time series. You can modify the retention duration of the memory
/// store and the magnetic store for a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Table {
  /// The Amazon Resource Name that uniquely identifies this table.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time when the Timestream table was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The name of the Timestream database that contains this table.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The time when the Timestream table was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The retention duration for the memory store and magnetic store.
  @_s.JsonKey(name: 'RetentionProperties')
  final RetentionProperties retentionProperties;

  /// The name of the Timestream table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The current state of the table:
  ///
  /// <ul>
  /// <li>
  /// <code>DELETING</code> - The table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The table is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TableStatus')
  final TableStatus tableStatus;

  Table({
    this.arn,
    this.creationTime,
    this.databaseName,
    this.lastUpdatedTime,
    this.retentionProperties,
    this.tableName,
    this.tableStatus,
  });
  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);
}

enum TableStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// A tag is a label that you assign to a Timestream database and/or table. Each
/// tag consists of a key and an optional value, both of which you define. Tags
/// enable you to categorize databases and/or tables, for example, by purpose,
/// owner, or environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag. Tag keys are case sensitive.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

enum TimeUnit {
  @_s.JsonValue('MILLISECONDS')
  milliseconds,
  @_s.JsonValue('SECONDS')
  seconds,
  @_s.JsonValue('MICROSECONDS')
  microseconds,
  @_s.JsonValue('NANOSECONDS')
  nanoseconds,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDatabaseResponse {
  @_s.JsonKey(name: 'Database')
  final Database database;

  UpdateDatabaseResponse({
    this.database,
  });
  factory UpdateDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTableResponse {
  /// The updated Timestream table.
  @_s.JsonKey(name: 'Table')
  final Table table;

  UpdateTableResponse({
    this.table,
  });
  factory UpdateTableResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTableResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidEndpointException extends _s.GenericAwsException {
  InvalidEndpointException({String type, String message})
      : super(type: type, code: 'InvalidEndpointException', message: message);
}

class RejectedRecordsException extends _s.GenericAwsException {
  RejectedRecordsException({String type, String message})
      : super(type: type, code: 'RejectedRecordsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
  'RejectedRecordsException': (type, message) =>
      RejectedRecordsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
