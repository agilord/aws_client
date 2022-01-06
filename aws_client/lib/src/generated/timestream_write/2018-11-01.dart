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
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed KMS keys</a> for more info. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.create-db.html">code
  /// sample</a> for details.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidEndpointException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key for the database. If the KMS key is not specified, the
  /// database will be encrypted with a Timestream managed KMS key located in
  /// your account. Refer to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed KMS keys</a> for more info.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the table.
  Future<CreateDatabaseResponse> createDatabase({
    required String databaseName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
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
  /// account. In an Amazon Web Services account, table names must be at least
  /// unique within each Region if they are in the same database. You may have
  /// identical table names in the same Region if the tables are in separate
  /// databases. While creating the table, you must specify the table name,
  /// database name, and the retention properties. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.create-table.html">code
  /// sample</a> for details.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidEndpointException].
  /// May throw [InternalServerException].
  /// May throw [InvalidEndpointException].
  ///
  /// Parameter [databaseName] :
  /// The name of the Timestream database.
  ///
  /// Parameter [tableName] :
  /// The name of the Timestream table.
  ///
  /// Parameter [magneticStoreWriteProperties] :
  /// Contains properties to set on the table when enabling magnetic store
  /// writes.
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
    MagneticStoreWriteProperties? magneticStoreWriteProperties,
    RetentionProperties? retentionProperties,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    ArgumentError.checkNotNull(tableName, 'tableName');
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
        if (magneticStoreWriteProperties != null)
          'MagneticStoreWriteProperties': magneticStoreWriteProperties,
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
  /// <note>
  /// All tables in the database must be deleted first, or a ValidationException
  /// error will be thrown.
  ///
  /// Due to the nature of distributed retries, the operation can return either
  /// success or a ResourceNotFoundException. Clients should consider them
  /// equivalent.
  /// </note>
  /// See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.delete-db.html">code
  /// sample</a> for details.
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
  /// <note>
  /// Due to the nature of distributed retries, the operation can return either
  /// success or a ResourceNotFoundException. Clients should consider them
  /// equivalent.
  /// </note>
  /// See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.delete-table.html">code
  /// sample</a> for details.
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
    ArgumentError.checkNotNull(tableName, 'tableName');
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
  /// the database. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.describe-db.html">code
  /// sample</a> for details.
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
  /// Because the Timestream SDKs are designed to transparently work with the
  /// service’s architecture, including the management and mapping of the
  /// service endpoints, <i>it is not recommended that you use this API
  /// unless</i>:
  ///
  /// <ul>
  /// <li>
  /// You are using <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/VPCEndpoints">VPC
  /// endpoints (Amazon Web Services PrivateLink) with Timestream</a>
  /// </li>
  /// <li>
  /// Your application uses a programming language that does not yet have SDK
  /// support
  /// </li>
  /// <li>
  /// You require better control over the client-side implementation
  /// </li>
  /// </ul>
  /// For detailed information on how and when to use and implement
  /// DescribeEndpoints, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/Using.API.html#Using-API.endpoint-discovery">The
  /// Endpoint Discovery Pattern</a>.
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
  /// name, retention duration of the memory store and the magnetic store. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.describe-table.html">code
  /// sample</a> for details.
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
    ArgumentError.checkNotNull(tableName, 'tableName');
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

  /// Returns a list of your Timestream databases. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.list-db.html">code
  /// sample</a> for details.
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
  /// each table. See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.list-table.html">code
  /// sample</a> for details.
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
  /// See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.update-db.html">code
  /// sample</a> for details.
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
    ArgumentError.checkNotNull(kmsKeyId, 'kmsKeyId');
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
  /// See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.update-table.html">code
  /// sample</a> for details.
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
  /// Parameter [tableName] :
  /// The name of the Timestream table.
  ///
  /// Parameter [magneticStoreWriteProperties] :
  /// Contains properties to set on the table when enabling magnetic store
  /// writes.
  ///
  /// Parameter [retentionProperties] :
  /// The retention duration of the memory store and the magnetic store.
  Future<UpdateTableResponse> updateTable({
    required String databaseName,
    required String tableName,
    MagneticStoreWriteProperties? magneticStoreWriteProperties,
    RetentionProperties? retentionProperties,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    ArgumentError.checkNotNull(tableName, 'tableName');
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
        'TableName': tableName,
        if (magneticStoreWriteProperties != null)
          'MagneticStoreWriteProperties': magneticStoreWriteProperties,
        if (retentionProperties != null)
          'RetentionProperties': retentionProperties,
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
  /// data. <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html">Service
  /// quotas apply</a>.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.write.html">code
  /// sample</a> for details.
  ///
  /// <b>Upserts</b>
  ///
  /// You can use the <code>Version</code> parameter in a
  /// <code>WriteRecords</code> request to update data points. Timestream tracks
  /// a version number with each record. <code>Version</code> defaults to
  /// <code>1</code> when not specified for the record in the request.
  /// Timestream will update an existing record’s measure value along with its
  /// <code>Version</code> upon receiving a write request with a higher
  /// <code>Version</code> number for that record. Upon receiving an update
  /// request where the measure value is the same as that of the existing
  /// record, Timestream still updates <code>Version</code>, if it is greater
  /// than the existing value of <code>Version</code>. You can update a data
  /// point as many times as desired, as long as the value of
  /// <code>Version</code> continuously increases.
  ///
  /// For example, suppose you write a new record without indicating
  /// <code>Version</code> in the request. Timestream will store this record,
  /// and set <code>Version</code> to <code>1</code>. Now, suppose you try to
  /// update this record with a <code>WriteRecords</code> request of the same
  /// record with a different measure value but, like before, do not provide
  /// <code>Version</code>. In this case, Timestream will reject this update
  /// with a <code>RejectedRecordsException</code> since the updated record’s
  /// version is not greater than the existing value of Version. However, if you
  /// were to resend the update request with <code>Version</code> set to
  /// <code>2</code>, Timestream would then succeed in updating the record’s
  /// value, and the <code>Version</code> would be set to <code>2</code>. Next,
  /// suppose you sent a <code>WriteRecords</code> request with this same record
  /// and an identical measure value, but with <code>Version</code> set to
  /// <code>3</code>. In this case, Timestream would only update
  /// <code>Version</code> to <code>3</code>. Any further updates would need to
  /// send a version number greater than <code>3</code>, or the update requests
  /// would receive a <code>RejectedRecordsException</code>.
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
  /// An array of records containing the unique measure, dimension, time, and
  /// version attributes for each time series data point.
  ///
  /// Parameter [tableName] :
  /// The name of the Timestream table.
  ///
  /// Parameter [commonAttributes] :
  /// A record containing the common measure, dimension, time, and version
  /// attributes shared across all the records in the request. The measure and
  /// dimension attributes specified will be merged with the measure and
  /// dimension attributes in the records object when the data is written into
  /// Timestream. Dimensions may not overlap, or a
  /// <code>ValidationException</code> will be thrown. In other words, a record
  /// must contain dimensions with unique names.
  Future<WriteRecordsResponse> writeRecords({
    required String databaseName,
    required List<Record> records,
    required String tableName,
    Record? commonAttributes,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    ArgumentError.checkNotNull(records, 'records');
    ArgumentError.checkNotNull(tableName, 'tableName');
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

    return WriteRecordsResponse.fromJson(jsonResponse.body);
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

/// The location to write error reports for records rejected, asynchronously,
/// during magnetic store writes.
class MagneticStoreRejectedDataLocation {
  /// Configuration of an S3 location to write error reports for records rejected,
  /// asynchronously, during magnetic store writes.
  final S3Configuration? s3Configuration;

  MagneticStoreRejectedDataLocation({
    this.s3Configuration,
  });

  factory MagneticStoreRejectedDataLocation.fromJson(
      Map<String, dynamic> json) {
    return MagneticStoreRejectedDataLocation(
      s3Configuration: json['S3Configuration'] != null
          ? S3Configuration.fromJson(
              json['S3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      if (s3Configuration != null) 'S3Configuration': s3Configuration,
    };
  }
}

/// The set of properties on a table for configuring magnetic store writes.
class MagneticStoreWriteProperties {
  /// A flag to enable magnetic store writes.
  final bool enableMagneticStoreWrites;

  /// The location to write error reports for records rejected asynchronously
  /// during magnetic store writes.
  final MagneticStoreRejectedDataLocation? magneticStoreRejectedDataLocation;

  MagneticStoreWriteProperties({
    required this.enableMagneticStoreWrites,
    this.magneticStoreRejectedDataLocation,
  });

  factory MagneticStoreWriteProperties.fromJson(Map<String, dynamic> json) {
    return MagneticStoreWriteProperties(
      enableMagneticStoreWrites: json['EnableMagneticStoreWrites'] as bool,
      magneticStoreRejectedDataLocation:
          json['MagneticStoreRejectedDataLocation'] != null
              ? MagneticStoreRejectedDataLocation.fromJson(
                  json['MagneticStoreRejectedDataLocation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enableMagneticStoreWrites = this.enableMagneticStoreWrites;
    final magneticStoreRejectedDataLocation =
        this.magneticStoreRejectedDataLocation;
    return {
      'EnableMagneticStoreWrites': enableMagneticStoreWrites,
      if (magneticStoreRejectedDataLocation != null)
        'MagneticStoreRejectedDataLocation': magneticStoreRejectedDataLocation,
    };
  }
}

/// MeasureValue represents the data attribute of the time series. For example,
/// the CPU utilization of an EC2 instance or the RPM of a wind turbine are
/// measures. MeasureValue has both name and value.
///
/// MeasureValue is only allowed for type <code>MULTI</code>. Using
/// <code>MULTI</code> type, you can pass multiple data attributes associated
/// with the same time series in a single record
class MeasureValue {
  /// Name of the MeasureValue.
  ///
  /// For constraints on MeasureValue names, refer to <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html#limits.naming">
  /// Naming Constraints</a> in the Timestream developer guide.
  final String name;

  /// Contains the data type of the MeasureValue for the time series data point.
  final MeasureValueType type;

  /// Value for the MeasureValue.
  final String value;

  MeasureValue({
    required this.name,
    required this.type,
    required this.value,
  });

  factory MeasureValue.fromJson(Map<String, dynamic> json) {
    return MeasureValue(
      name: json['Name'] as String,
      type: (json['Type'] as String).toMeasureValueType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      'Name': name,
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum MeasureValueType {
  double,
  bigint,
  varchar,
  boolean,
  timestamp,
  multi,
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
      case MeasureValueType.timestamp:
        return 'TIMESTAMP';
      case MeasureValueType.multi:
        return 'MULTI';
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
      case 'TIMESTAMP':
        return MeasureValueType.timestamp;
      case 'MULTI':
        return MeasureValueType.multi;
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
///
/// Records have a <code>Version</code> field, which is a 64-bit
/// <code>long</code> that you can use for updating data points. Writes of a
/// duplicate record with the same dimension, timestamp, and measure name but
/// different measure value will only succeed if the <code>Version</code>
/// attribute of the record in the write request is higher than that of the
/// existing record. Timestream defaults to a <code>Version</code> of
/// <code>1</code> for records without the <code>Version</code> field.
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
  /// Default type is <code>DOUBLE</code>.
  final MeasureValueType? measureValueType;

  /// Contains the list of MeasureValue for time series data points.
  ///
  /// This is only allowed for type <code>MULTI</code>. For scalar values, use
  /// <code>MeasureValue</code> attribute of the Record directly.
  final List<MeasureValue>? measureValues;

  /// Contains the time at which the measure value for the data point was
  /// collected. The time value plus the unit provides the time elapsed since the
  /// epoch. For example, if the time value is <code>12345</code> and the unit is
  /// <code>ms</code>, then <code>12345 ms</code> have elapsed since the epoch.
  final String? time;

  /// The granularity of the timestamp unit. It indicates if the time value is in
  /// seconds, milliseconds, nanoseconds or other supported values. Default is
  /// <code>MILLISECONDS</code>.
  final TimeUnit? timeUnit;

  /// 64-bit attribute used for record updates. Write requests for duplicate data
  /// with a higher version number will update the existing measure value and
  /// version. In cases where the measure value is the same, <code>Version</code>
  /// will still be updated . Default value is <code>1</code>.
  /// <note>
  /// <code>Version</code> must be <code>1</code> or greater, or you will receive
  /// a <code>ValidationException</code> error.
  /// </note>
  final int? version;

  Record({
    this.dimensions,
    this.measureName,
    this.measureValue,
    this.measureValueType,
    this.measureValues,
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
      measureValues: (json['MeasureValues'] as List?)
          ?.whereNotNull()
          .map((e) => MeasureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final measureValues = this.measureValues;
    final time = this.time;
    final timeUnit = this.timeUnit;
    final version = this.version;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (measureName != null) 'MeasureName': measureName,
      if (measureValue != null) 'MeasureValue': measureValue,
      if (measureValueType != null)
        'MeasureValueType': measureValueType.toValue(),
      if (measureValues != null) 'MeasureValues': measureValues,
      if (time != null) 'Time': time,
      if (timeUnit != null) 'TimeUnit': timeUnit.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

/// Information on the records ingested by this request.
class RecordsIngested {
  /// Count of records ingested into the magnetic store.
  final int? magneticStore;

  /// Count of records ingested into the memory store.
  final int? memoryStore;

  /// Total count of successfully ingested records.
  final int? total;

  RecordsIngested({
    this.magneticStore,
    this.memoryStore,
    this.total,
  });

  factory RecordsIngested.fromJson(Map<String, dynamic> json) {
    return RecordsIngested(
      magneticStore: json['MagneticStore'] as int?,
      memoryStore: json['MemoryStore'] as int?,
      total: json['Total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final magneticStore = this.magneticStore;
    final memoryStore = this.memoryStore;
    final total = this.total;
    return {
      if (magneticStore != null) 'MagneticStore': magneticStore,
      if (memoryStore != null) 'MemoryStore': memoryStore,
      if (total != null) 'Total': total,
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

/// Configuration specifing an S3 location.
class S3Configuration {
  /// &gt;Bucket name of the customer S3 bucket.
  final String? bucketName;

  /// Encryption option for the customer s3 location. Options are S3 server side
  /// encryption with an S3-managed key or KMS managed key.
  final S3EncryptionOption? encryptionOption;

  /// KMS key id for the customer s3 location when encrypting with a KMS managed
  /// key.
  final String? kmsKeyId;

  /// Object key preview for the customer S3 location.
  final String? objectKeyPrefix;

  S3Configuration({
    this.bucketName,
    this.encryptionOption,
    this.kmsKeyId,
    this.objectKeyPrefix,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      bucketName: json['BucketName'] as String?,
      encryptionOption:
          (json['EncryptionOption'] as String?)?.toS3EncryptionOption(),
      kmsKeyId: json['KmsKeyId'] as String?,
      objectKeyPrefix: json['ObjectKeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final encryptionOption = this.encryptionOption;
    final kmsKeyId = this.kmsKeyId;
    final objectKeyPrefix = this.objectKeyPrefix;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (encryptionOption != null)
        'EncryptionOption': encryptionOption.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
    };
  }
}

enum S3EncryptionOption {
  sseS3,
  sseKms,
}

extension on S3EncryptionOption {
  String toValue() {
    switch (this) {
      case S3EncryptionOption.sseS3:
        return 'SSE_S3';
      case S3EncryptionOption.sseKms:
        return 'SSE_KMS';
    }
  }
}

extension on String {
  S3EncryptionOption toS3EncryptionOption() {
    switch (this) {
      case 'SSE_S3':
        return S3EncryptionOption.sseS3;
      case 'SSE_KMS':
        return S3EncryptionOption.sseKms;
    }
    throw Exception('$this is not known in enum S3EncryptionOption');
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

  /// Contains properties to set on the table when enabling magnetic store writes.
  final MagneticStoreWriteProperties? magneticStoreWriteProperties;

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
    this.magneticStoreWriteProperties,
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
      magneticStoreWriteProperties: json['MagneticStoreWriteProperties'] != null
          ? MagneticStoreWriteProperties.fromJson(
              json['MagneticStoreWriteProperties'] as Map<String, dynamic>)
          : null,
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
    final magneticStoreWriteProperties = this.magneticStoreWriteProperties;
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
      if (magneticStoreWriteProperties != null)
        'MagneticStoreWriteProperties': magneticStoreWriteProperties,
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

class WriteRecordsResponse {
  /// Information on the records ingested by this request.
  final RecordsIngested? recordsIngested;

  WriteRecordsResponse({
    this.recordsIngested,
  });

  factory WriteRecordsResponse.fromJson(Map<String, dynamic> json) {
    return WriteRecordsResponse(
      recordsIngested: json['RecordsIngested'] != null
          ? RecordsIngested.fromJson(
              json['RecordsIngested'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordsIngested = this.recordsIngested;
    return {
      if (recordsIngested != null) 'RecordsIngested': recordsIngested,
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
