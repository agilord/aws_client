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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String databaseName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String databaseName,
    required String tableName,
    RetentionProperties? retentionProperties,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String databaseName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DeleteDatabase'
    };
    await _protocol.send(
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
    required String databaseName,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.DeleteTable'
    };
    await _protocol.send(
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
    required String databaseName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String databaseName,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    int? maxResults,
    String? nextToken,
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
    String? databaseName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String resourceARN,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.TagResource'
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.UntagResource'
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
    required String databaseName,
    required String kmsKeyId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String databaseName,
    required RetentionProperties retentionProperties,
    required String tableName,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    required String databaseName,
    required List<Record> records,
    required String tableName,
    Record? commonAttributes,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      3,
      64,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Timestream_20181101.WriteRecords'
    };
    await _protocol.send(
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

class CreateDatabaseResponse {
  /// The newly created Timestream database.
  final Database? database;

  CreateDatabaseResponse({
    this.database,
  });

  factory CreateDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatabaseResponse(
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

class CreateTableResponse {
  /// The newly created Timestream table.
  final Table? table;

  CreateTableResponse({
    this.table,
  });

  factory CreateTableResponse.fromJson(Map<String, dynamic> json) {
    return CreateTableResponse(
      table: json['Table'] != null
          ? Table.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final table = this.table;
    return {
      if (table != null) 'Table': table,
    };
  }
}

/// A top level container for a table. Databases and tables are the fundamental
/// management concepts in Amazon Timestream. All tables in a database are
/// encrypted with the same KMS key.
class Database {
  /// The Amazon Resource Name that uniquely identifies this database.
  final String? arn;

  /// The time when the database was created, calculated from the Unix epoch time.
  final DateTime? creationTime;

  /// The name of the Timestream database.
  final String? databaseName;

  /// The identifier of the KMS key used to encrypt the data stored in the
  /// database.
  final String? kmsKeyId;

  /// The last time that this database was updated.
  final DateTime? lastUpdatedTime;

  /// The total number of tables found within a Timestream database.
  final int? tableCount;

  Database({
    this.arn,
    this.creationTime,
    this.databaseName,
    this.kmsKeyId,
    this.lastUpdatedTime,
    this.tableCount,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      databaseName: json['DatabaseName'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      tableCount: json['TableCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final databaseName = this.databaseName;
    final kmsKeyId = this.kmsKeyId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final tableCount = this.tableCount;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (tableCount != null) 'TableCount': tableCount,
    };
  }
}

class DescribeDatabaseResponse {
  /// The name of the Timestream table.
  final Database? database;

  DescribeDatabaseResponse({
    this.database,
  });

  factory DescribeDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatabaseResponse(
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

class DescribeEndpointsResponse {
  /// An <code>Endpoints</code> object is returned when a
  /// <code>DescribeEndpoints</code> request is made.
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    required this.endpoints,
  });

  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointsResponse(
      endpoints: (json['Endpoints'] as List)
          .whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      'Endpoints': endpoints,
    };
  }
}

class DescribeTableResponse {
  /// The Timestream table.
  final Table? table;

  DescribeTableResponse({
    this.table,
  });

  factory DescribeTableResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTableResponse(
      table: json['Table'] != null
          ? Table.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final table = this.table;
    return {
      if (table != null) 'Table': table,
    };
  }
}

/// Dimension represents the meta data attributes of the time series. For
/// example, the name and availability zone of an EC2 instance or the name of
/// the manufacturer of a wind turbine are dimensions.
class Dimension {
  /// Dimension represents the meta data attributes of the time series. For
  /// example, the name and availability zone of an EC2 instance or the name of
  /// the manufacturer of a wind turbine are dimensions.
  ///
  /// For constraints on Dimension names, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.naming">Naming
  /// Constraints</a>.
  final String name;

  /// The value of the dimension.
  final String value;

  /// The data type of the dimension for the time series data point.
  final DimensionValueType? dimensionValueType;

  Dimension({
    required this.name,
    required this.value,
    this.dimensionValueType,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      name: json['Name'] as String,
      value: json['Value'] as String,
      dimensionValueType:
          (json['DimensionValueType'] as String?)?.toDimensionValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    final dimensionValueType = this.dimensionValueType;
    return {
      'Name': name,
      'Value': value,
      if (dimensionValueType != null)
        'DimensionValueType': dimensionValueType.toValue(),
    };
  }
}

enum DimensionValueType {
  varchar,
}

extension on DimensionValueType {
  String toValue() {
    switch (this) {
      case DimensionValueType.varchar:
        return 'VARCHAR';
    }
  }
}

extension on String {
  DimensionValueType toDimensionValueType() {
    switch (this) {
      case 'VARCHAR':
        return DimensionValueType.varchar;
    }
    throw Exception('$this is not known in enum DimensionValueType');
  }
}

/// Represents an available endpoint against which to make API calls agaisnt, as
/// well as the TTL for that endpoint.
class Endpoint {
  /// An endpoint address.
  final String address;

  /// The TTL for the endpoint, in minutes.
  final int cachePeriodInMinutes;

  Endpoint({
    required this.address,
    required this.cachePeriodInMinutes,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      address: json['Address'] as String,
      cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final cachePeriodInMinutes = this.cachePeriodInMinutes;
    return {
      'Address': address,
      'CachePeriodInMinutes': cachePeriodInMinutes,
    };
  }
}

class ListDatabasesResponse {
  /// A list of database names.
  final List<Database>? databases;

  /// The pagination token. This parameter is returned when the response is
  /// truncated.
  final String? nextToken;

  ListDatabasesResponse({
    this.databases,
    this.nextToken,
  });

  factory ListDatabasesResponse.fromJson(Map<String, dynamic> json) {
    return ListDatabasesResponse(
      databases: (json['Databases'] as List?)
          ?.whereNotNull()
          .map((e) => Database.fromJson(e as Map<String, dynamic>))
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

class ListTablesResponse {
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  final String? nextToken;

  /// A list of tables.
  final List<Table>? tables;

  ListTablesResponse({
    this.nextToken,
    this.tables,
  });

  factory ListTablesResponse.fromJson(Map<String, dynamic> json) {
    return ListTablesResponse(
      nextToken: json['NextToken'] as String?,
      tables: (json['Tables'] as List?)
          ?.whereNotNull()
          .map((e) => Table.fromJson(e as Map<String, dynamic>))
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

class ListTagsForResourceResponse {
  /// The tags currently associated with the Timestream resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MeasureValueType {
  double,
  bigint,
  varchar,
  boolean,
}

extension on MeasureValueType {
  String toValue() {
    switch (this) {
      case MeasureValueType.double:
        return 'DOUBLE';
      case MeasureValueType.bigint:
        return 'BIGINT';
      case MeasureValueType.varchar:
        return 'VARCHAR';
      case MeasureValueType.boolean:
        return 'BOOLEAN';
    }
  }
}

extension on String {
  MeasureValueType toMeasureValueType() {
    switch (this) {
      case 'DOUBLE':
        return MeasureValueType.double;
      case 'BIGINT':
        return MeasureValueType.bigint;
      case 'VARCHAR':
        return MeasureValueType.varchar;
      case 'BOOLEAN':
        return MeasureValueType.boolean;
    }
    throw Exception('$this is not known in enum MeasureValueType');
  }
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
class Record {
  /// Contains the list of dimensions for time series data points.
  final List<Dimension>? dimensions;

  /// Measure represents the data attribute of the time series. For example, the
  /// CPU utilization of an EC2 instance or the RPM of a wind turbine are
  /// measures.
  final String? measureName;

  /// Contains the measure value for the time series data point.
  final String? measureValue;

  /// Contains the data type of the measure value for the time series data point.
  final MeasureValueType? measureValueType;

  /// Contains the time at which the measure value for the data point was
  /// collected. The time value plus the unit provides the time elapsed since the
  /// epoch. For example, if the time value is <code>12345</code> and the unit is
  /// <code>ms</code>, then <code>12345 ms</code> have elapsed since the epoch.
  final String? time;

  /// The granularity of the timestamp unit. It indicates if the time value is in
  /// seconds, milliseconds, nanoseconds or other supported values.
  final TimeUnit? timeUnit;

  /// 64-bit attribute used for record updates. Write requests for duplicate data
  /// with a higher version number will update the existing measure value and
  /// version. In cases where the measure value is the same, <code>Version</code>
  /// will still be updated . Default value is to 1.
  final int? version;

  Record({
    this.dimensions,
    this.measureName,
    this.measureValue,
    this.measureValueType,
    this.time,
    this.timeUnit,
    this.version,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      measureName: json['MeasureName'] as String?,
      measureValue: json['MeasureValue'] as String?,
      measureValueType:
          (json['MeasureValueType'] as String?)?.toMeasureValueType(),
      time: json['Time'] as String?,
      timeUnit: (json['TimeUnit'] as String?)?.toTimeUnit(),
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final measureName = this.measureName;
    final measureValue = this.measureValue;
    final measureValueType = this.measureValueType;
    final time = this.time;
    final timeUnit = this.timeUnit;
    final version = this.version;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (measureName != null) 'MeasureName': measureName,
      if (measureValue != null) 'MeasureValue': measureValue,
      if (measureValueType != null)
        'MeasureValueType': measureValueType.toValue(),
      if (time != null) 'Time': time,
      if (timeUnit != null) 'TimeUnit': timeUnit.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

/// Retention properties contain the duration for which your time series data
/// must be stored in the magnetic store and the memory store.
class RetentionProperties {
  /// The duration for which data must be stored in the magnetic store.
  final int magneticStoreRetentionPeriodInDays;

  /// The duration for which data must be stored in the memory store.
  final int memoryStoreRetentionPeriodInHours;

  RetentionProperties({
    required this.magneticStoreRetentionPeriodInDays,
    required this.memoryStoreRetentionPeriodInHours,
  });

  factory RetentionProperties.fromJson(Map<String, dynamic> json) {
    return RetentionProperties(
      magneticStoreRetentionPeriodInDays:
          json['MagneticStoreRetentionPeriodInDays'] as int,
      memoryStoreRetentionPeriodInHours:
          json['MemoryStoreRetentionPeriodInHours'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final magneticStoreRetentionPeriodInDays =
        this.magneticStoreRetentionPeriodInDays;
    final memoryStoreRetentionPeriodInHours =
        this.memoryStoreRetentionPeriodInHours;
    return {
      'MagneticStoreRetentionPeriodInDays': magneticStoreRetentionPeriodInDays,
      'MemoryStoreRetentionPeriodInHours': memoryStoreRetentionPeriodInHours,
    };
  }
}

/// Table represents a database table in Timestream. Tables contain one or more
/// related time series. You can modify the retention duration of the memory
/// store and the magnetic store for a table.
class Table {
  /// The Amazon Resource Name that uniquely identifies this table.
  final String? arn;

  /// The time when the Timestream table was created.
  final DateTime? creationTime;

  /// The name of the Timestream database that contains this table.
  final String? databaseName;

  /// The time when the Timestream table was last updated.
  final DateTime? lastUpdatedTime;

  /// The retention duration for the memory store and magnetic store.
  final RetentionProperties? retentionProperties;

  /// The name of the Timestream table.
  final String? tableName;

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
  final TableStatus? tableStatus;

  Table({
    this.arn,
    this.creationTime,
    this.databaseName,
    this.lastUpdatedTime,
    this.retentionProperties,
    this.tableName,
    this.tableStatus,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      databaseName: json['DatabaseName'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      retentionProperties: json['RetentionProperties'] != null
          ? RetentionProperties.fromJson(
              json['RetentionProperties'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
      tableStatus: (json['TableStatus'] as String?)?.toTableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final databaseName = this.databaseName;
    final lastUpdatedTime = this.lastUpdatedTime;
    final retentionProperties = this.retentionProperties;
    final tableName = this.tableName;
    final tableStatus = this.tableStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (retentionProperties != null)
        'RetentionProperties': retentionProperties,
      if (tableName != null) 'TableName': tableName,
      if (tableStatus != null) 'TableStatus': tableStatus.toValue(),
    };
  }
}

enum TableStatus {
  active,
  deleting,
}

extension on TableStatus {
  String toValue() {
    switch (this) {
      case TableStatus.active:
        return 'ACTIVE';
      case TableStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  TableStatus toTableStatus() {
    switch (this) {
      case 'ACTIVE':
        return TableStatus.active;
      case 'DELETING':
        return TableStatus.deleting;
    }
    throw Exception('$this is not known in enum TableStatus');
  }
}

/// A tag is a label that you assign to a Timestream database and/or table. Each
/// tag consists of a key and an optional value, both of which you define. Tags
/// enable you to categorize databases and/or tables, for example, by purpose,
/// owner, or environment.
class Tag {
  /// The key of the tag. Tag keys are case sensitive.
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

enum TimeUnit {
  milliseconds,
  seconds,
  microseconds,
  nanoseconds,
}

extension on TimeUnit {
  String toValue() {
    switch (this) {
      case TimeUnit.milliseconds:
        return 'MILLISECONDS';
      case TimeUnit.seconds:
        return 'SECONDS';
      case TimeUnit.microseconds:
        return 'MICROSECONDS';
      case TimeUnit.nanoseconds:
        return 'NANOSECONDS';
    }
  }
}

extension on String {
  TimeUnit toTimeUnit() {
    switch (this) {
      case 'MILLISECONDS':
        return TimeUnit.milliseconds;
      case 'SECONDS':
        return TimeUnit.seconds;
      case 'MICROSECONDS':
        return TimeUnit.microseconds;
      case 'NANOSECONDS':
        return TimeUnit.nanoseconds;
    }
    throw Exception('$this is not known in enum TimeUnit');
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

class UpdateDatabaseResponse {
  final Database? database;

  UpdateDatabaseResponse({
    this.database,
  });

  factory UpdateDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDatabaseResponse(
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

class UpdateTableResponse {
  /// The updated Timestream table.
  final Table? table;

  UpdateTableResponse({
    this.table,
  });

  factory UpdateTableResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTableResponse(
      table: json['Table'] != null
          ? Table.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final table = this.table;
    return {
      if (table != null) 'Table': table,
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

class InvalidEndpointException extends _s.GenericAwsException {
  InvalidEndpointException({String? type, String? message})
      : super(type: type, code: 'InvalidEndpointException', message: message);
}

class RejectedRecordsException extends _s.GenericAwsException {
  RejectedRecordsException({String? type, String? message})
      : super(type: type, code: 'RejectedRecordsException', message: message);
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
