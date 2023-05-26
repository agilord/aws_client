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

/// Amazon DynamoDB is a fast, highly scalable, highly available, cost-effective
/// non-relational database service.
///
/// Amazon DynamoDB removes traditional scalability limitations on data storage
/// while maintaining low latency and predictable performance.
class DynamoDB {
  final _s.JsonProtocol _protocol;
  DynamoDB({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dynamodb',
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

  /// Retrieves the attributes for multiple items from multiple tables using
  /// their primary keys.
  ///
  /// The maximum number of item attributes that can be retrieved for a single
  /// operation is 100. Also, the number of items retrieved is constrained by a
  /// 1 MB the size limit. If the response size limit is exceeded or a partial
  /// result is returned due to an internal processing failure, Amazon DynamoDB
  /// returns an <code>UnprocessedKeys</code> value so you can retry the
  /// operation starting with the next item to get.
  ///
  /// Amazon DynamoDB automatically adjusts the number of items returned per
  /// page to enforce this limit. For example, even if you ask to retrieve 100
  /// items, but each individual item is 50k in size, the system returns 20
  /// items and an appropriate <code>UnprocessedKeys</code> value so you can get
  /// the next page of results. If necessary, your application needs its own
  /// logic to assemble the pages of results into one set.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  Future<BatchGetItemOutput> batchGetItem({
    required Map<String, KeysAndAttributes> requestItems,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.BatchGetItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
      },
    );

    return BatchGetItemOutput.fromJson(jsonResponse.body);
  }

  /// Allows to execute a batch of Put and/or Delete Requests for many tables in
  /// a single call. A total of 25 requests are allowed.
  ///
  /// There are no transaction guarantees provided by this API. It does not
  /// allow conditional puts nor does it support return values.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [requestItems] :
  /// A map of table name to list-of-write-requests. Used as input to the
  /// <code>BatchWriteItem</code> API call
  Future<BatchWriteItemOutput> batchWriteItem({
    required Map<String, List<WriteRequest>> requestItems,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.BatchWriteItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
      },
    );

    return BatchWriteItemOutput.fromJson(jsonResponse.body);
  }

  /// Adds a new table to your account.
  ///
  /// The table name must be unique among those associated with the AWS Account
  /// issuing the request, and the AWS Region that receives the request (e.g.
  /// <code>us-east-1</code>).
  ///
  /// The <code>CreateTable</code> operation triggers an asynchronous workflow
  /// to begin creating the table. Amazon DynamoDB immediately returns the state
  /// of the table (<code>CREATING</code>) until the table is in the
  /// <code>ACTIVE</code> state. Once the table is in the <code>ACTIVE</code>
  /// state, you can perform data plane operations.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table you want to create. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<CreateTableOutput> createTable({
    required KeySchema keySchema,
    required ProvisionedThroughput provisionedThroughput,
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeySchema': keySchema,
        'ProvisionedThroughput': provisionedThroughput,
        'TableName': tableName,
      },
    );

    return CreateTableOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a single item in a table by primary key.
  ///
  /// You can perform a conditional delete operation that deletes the item if it
  /// exists, or if it has an expected attribute value.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to delete an item. Allowed
  /// characters are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
  /// <code>_</code> (underscore), <code>-</code> (hyphen) and <code>.</code>
  /// (period).
  Future<DeleteItemOutput> deleteItem({
    required Key key,
    required String tableName,
    Map<String, ExpectedAttributeValue>? expected,
    ReturnValue? returnValues,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.DeleteItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'TableName': tableName,
        if (expected != null) 'Expected': expected,
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
      },
    );

    return DeleteItemOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a table and all of its items.
  ///
  /// If the table is in the <code>ACTIVE</code> state, you can delete it. If a
  /// table is in <code>CREATING</code> or <code>UPDATING</code> states then
  /// Amazon DynamoDB returns a <code>ResourceInUseException</code>. If the
  /// specified table does not exist, Amazon DynamoDB returns a
  /// <code>ResourceNotFoundException</code>.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table you want to delete. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<DeleteTableOutput> deleteTable({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.DeleteTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DeleteTableOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the table, including the current status of the
  /// table, the primary key schema and when the table was created.
  ///
  /// If the table does not exist, Amazon DynamoDB returns a
  /// <code>ResourceNotFoundException</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table you want to describe. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<DescribeTableOutput> describeTable({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.DescribeTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DescribeTableOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a set of Attributes for an item that matches the primary key.
  ///
  /// The <code>GetItem</code> operation provides an eventually-consistent read
  /// by default. If eventually-consistent reads are not acceptable for your
  /// application, use <code>ConsistentRead</code>. Although this operation
  /// might take longer than a standard read, it always returns the last updated
  /// value.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to get an item. Allowed characters
  /// are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<GetItemOutput> getItem({
    required Key key,
    required String tableName,
    List<String>? attributesToGet,
    bool? consistentRead,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.GetItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'TableName': tableName,
        if (attributesToGet != null) 'AttributesToGet': attributesToGet,
        if (consistentRead != null) 'ConsistentRead': consistentRead,
      },
    );

    return GetItemOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a paginated list of table names created by the AWS Account of
  /// the caller in the AWS Region (e.g. <code>us-east-1</code>).
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartTableName] :
  /// The name of the table that starts the list. If you already ran a
  /// <code>ListTables</code> operation and received a
  /// <code>LastEvaluatedTableName</code> value in the response, use that value
  /// here to continue the list.
  Future<ListTablesOutput> listTables({
    String? exclusiveStartTableName,
    int? limit,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.ListTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartTableName != null)
          'ExclusiveStartTableName': exclusiveStartTableName,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListTablesOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new item, or replaces an old item with a new item (including all
  /// the attributes).
  ///
  /// If an item already exists in the specified table with the same primary
  /// key, the new item completely replaces the existing item. You can perform a
  /// conditional put (insert a new item if one with the specified primary key
  /// doesn't exist), or replace an existing item if it has certain attribute
  /// values.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to put an item. Allowed characters
  /// are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<PutItemOutput> putItem({
    required Map<String, AttributeValue> item,
    required String tableName,
    Map<String, ExpectedAttributeValue>? expected,
    ReturnValue? returnValues,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.PutItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Item': item,
        'TableName': tableName,
        if (expected != null) 'Expected': expected,
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
      },
    );

    return PutItemOutput.fromJson(jsonResponse.body);
  }

  /// Gets the values of one or more items and its attributes by primary key
  /// (composite primary key, only).
  ///
  /// Narrow the scope of the query using comparison operators on the
  /// <code>RangeKeyValue</code> of the composite key. Use the
  /// <code>ScanIndexForward</code> parameter to get results in forward or
  /// reverse order by range key.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [hashKeyValue] :
  /// Attribute value of the hash component of the composite primary key.
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to query. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  ///
  /// Parameter [count] :
  /// If set to <code>true</code>, Amazon DynamoDB returns a total number of
  /// items that match the query parameters, instead of a list of the matching
  /// items and their attributes. Do not set <code>Count</code> to
  /// <code>true</code> while providing a list of <code>AttributesToGet</code>,
  /// otherwise Amazon DynamoDB returns a validation error.
  ///
  /// Parameter [exclusiveStartKey] :
  /// Primary key of the item from which to continue an earlier query. An
  /// earlier query might provide this value as the
  /// <code>LastEvaluatedKey</code> if that query operation was interrupted
  /// before completing the query; either because of the result set size or the
  /// <code>Limit</code> parameter. The <code>LastEvaluatedKey</code> can be
  /// passed back in a new query request to continue the operation from that
  /// point.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If Amazon DynamoDB hits this limit
  /// while querying the table, it stops the query and returns the matching
  /// values up to the limit, and a <code>LastEvaluatedKey</code> to apply in a
  /// subsequent operation to continue the query. Also, if the result set size
  /// exceeds 1MB before Amazon DynamoDB hits this limit, it stops the query and
  /// returns the matching values, and a <code>LastEvaluatedKey</code> to apply
  /// in a subsequent operation to continue the query.
  ///
  /// Parameter [rangeKeyCondition] :
  /// A container for the attribute values and comparison operators to use for
  /// the query.
  ///
  /// Parameter [scanIndexForward] :
  /// Specifies forward or backward traversal of the index. Amazon DynamoDB
  /// returns results reflecting the requested order, determined by the range
  /// key. The default value is <code>true</code> (forward).
  Future<QueryOutput> query({
    required AttributeValue hashKeyValue,
    required String tableName,
    List<String>? attributesToGet,
    bool? consistentRead,
    bool? count,
    Key? exclusiveStartKey,
    int? limit,
    Condition? rangeKeyCondition,
    bool? scanIndexForward,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.Query'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HashKeyValue': hashKeyValue,
        'TableName': tableName,
        if (attributesToGet != null) 'AttributesToGet': attributesToGet,
        if (consistentRead != null) 'ConsistentRead': consistentRead,
        if (count != null) 'Count': count,
        if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
        if (limit != null) 'Limit': limit,
        if (rangeKeyCondition != null) 'RangeKeyCondition': rangeKeyCondition,
        if (scanIndexForward != null) 'ScanIndexForward': scanIndexForward,
      },
    );

    return QueryOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves one or more items and its attributes by performing a full scan
  /// of a table.
  ///
  /// Provide a <code>ScanFilter</code> to get more specific results.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to scan. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  ///
  /// Parameter [count] :
  /// If set to <code>true</code>, Amazon DynamoDB returns a total number of
  /// items for the <code>Scan</code> operation, even if the operation has no
  /// matching items for the assigned filter. Do not set <code>Count</code> to
  /// <code>true</code> while providing a list of <code>AttributesToGet</code>,
  /// otherwise Amazon DynamoDB returns a validation error.
  ///
  /// Parameter [exclusiveStartKey] :
  /// Primary key of the item from which to continue an earlier scan. An earlier
  /// scan might provide this value if that scan operation was interrupted
  /// before scanning the entire table; either because of the result set size or
  /// the <code>Limit</code> parameter. The <code>LastEvaluatedKey</code> can be
  /// passed back in a new scan request to continue the operation from that
  /// point.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If Amazon DynamoDB hits this limit
  /// while scanning the table, it stops the scan and returns the matching
  /// values up to the limit, and a <code>LastEvaluatedKey</code> to apply in a
  /// subsequent operation to continue the scan. Also, if the scanned data set
  /// size exceeds 1 MB before Amazon DynamoDB hits this limit, it stops the
  /// scan and returns the matching values up to the limit, and a
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the scan.
  ///
  /// Parameter [scanFilter] :
  /// Evaluates the scan results and returns only the desired values.
  Future<ScanOutput> scan({
    required String tableName,
    List<String>? attributesToGet,
    bool? count,
    Key? exclusiveStartKey,
    int? limit,
    Map<String, Condition>? scanFilter,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.Scan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        if (attributesToGet != null) 'AttributesToGet': attributesToGet,
        if (count != null) 'Count': count,
        if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
        if (limit != null) 'Limit': limit,
        if (scanFilter != null) 'ScanFilter': scanFilter,
      },
    );

    return ScanOutput.fromJson(jsonResponse.body);
  }

  /// Edits an existing item's attributes.
  ///
  /// You can perform a conditional update (insert a new attribute name-value
  /// pair if it doesn't exist, or replace an existing name-value pair if it has
  /// certain expected attribute values).
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table in which you want to update an item. Allowed
  /// characters are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
  /// <code>_</code> (underscore), <code>-</code> (hyphen) and <code>.</code>
  /// (period).
  Future<UpdateItemOutput> updateItem({
    required Map<String, AttributeValueUpdate> attributeUpdates,
    required Key key,
    required String tableName,
    Map<String, ExpectedAttributeValue>? expected,
    ReturnValue? returnValues,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.UpdateItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttributeUpdates': attributeUpdates,
        'Key': key,
        'TableName': tableName,
        if (expected != null) 'Expected': expected,
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
      },
    );

    return UpdateItemOutput.fromJson(jsonResponse.body);
  }

  /// Updates the provisioned throughput for the given table.
  ///
  /// Setting the throughput for a table helps you manage performance and is
  /// part of the Provisioned Throughput feature of Amazon DynamoDB.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table you want to update. Allowed characters are
  /// <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
  /// (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
  Future<UpdateTableOutput> updateTable({
    required ProvisionedThroughput provisionedThroughput,
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20111205.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProvisionedThroughput': provisionedThroughput,
        'TableName': tableName,
      },
    );

    return UpdateTableOutput.fromJson(jsonResponse.body);
  }
}

/// The type of action for an item update operation. Only use the add action for
/// numbers or sets; the specified value is added to the existing value. If a
/// set of values is specified, the values are added to the existing set. Adds
/// the specified attribute. If the attribute exists, it is replaced by the new
/// value. If no value is specified, this removes the attribute and its value.
/// If a set of values is specified, then the values in the specified set are
/// removed from the old set.
enum AttributeAction {
  add,
  put,
  delete,
}

extension AttributeActionValueExtension on AttributeAction {
  String toValue() {
    switch (this) {
      case AttributeAction.add:
        return 'ADD';
      case AttributeAction.put:
        return 'PUT';
      case AttributeAction.delete:
        return 'DELETE';
    }
  }
}

extension AttributeActionFromString on String {
  AttributeAction toAttributeAction() {
    switch (this) {
      case 'ADD':
        return AttributeAction.add;
      case 'PUT':
        return AttributeAction.put;
      case 'DELETE':
        return AttributeAction.delete;
    }
    throw Exception('$this is not known in enum AttributeAction');
  }
}

/// AttributeValue can be <code>String</code>, <code>Number</code>,
/// <code>Binary</code>, <code>StringSet</code>, <code>NumberSet</code>,
/// <code>BinarySet</code>.
class AttributeValue {
  /// Binary attributes are sequences of unsigned bytes.
  final Uint8List? b;

  /// A set of binary attributes.
  final List<Uint8List>? bs;

  /// Numbers are positive or negative exact-value decimals and integers. A number
  /// can have up to 38 digits precision and can be between 10^-128 to 10^+126.
  final String? n;

  /// A set of numbers.
  final List<String>? ns;

  /// Strings are Unicode with UTF-8 binary encoding. The maximum size is limited
  /// by the size of the primary key (1024 bytes as a range part of a key or 2048
  /// bytes as a single part hash key) or the item size (64k).
  final String? s;

  /// A set of strings.
  final List<String>? ss;

  AttributeValue({
    this.b,
    this.bs,
    this.n,
    this.ns,
    this.s,
    this.ss,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      b: _s.decodeNullableUint8List(json['B'] as String?),
      bs: (json['BS'] as List?)
          ?.whereNotNull()
          .map((e) => _s.decodeUint8List(e as String))
          .toList(),
      n: json['N'] as String?,
      ns: (json['NS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      s: json['S'] as String?,
      ss: (json['SS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final b = this.b;
    final bs = this.bs;
    final n = this.n;
    final ns = this.ns;
    final s = this.s;
    final ss = this.ss;
    return {
      if (b != null) 'B': base64Encode(b),
      if (bs != null) 'BS': bs.map(base64Encode).toList(),
      if (n != null) 'N': n,
      if (ns != null) 'NS': ns,
      if (s != null) 'S': s,
      if (ss != null) 'SS': ss,
    };
  }
}

/// Specifies the attribute to update and how to perform the update. Possible
/// values: <code>PUT</code> (default), <code>ADD</code> or <code>DELETE</code>.
class AttributeValueUpdate {
  final AttributeAction? action;
  final AttributeValue? value;

  AttributeValueUpdate({
    this.action,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final value = this.value;
    return {
      if (action != null) 'Action': action.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

class BatchGetItemOutput {
  final Map<String, BatchResponse>? responses;

  /// Contains a map of tables and their respective keys that were not processed
  /// with the current response, possibly due to reaching a limit on the response
  /// size. The <code>UnprocessedKeys</code> value is in the same form as a
  /// <code>RequestItems</code> parameter (so the value can be provided directly
  /// to a subsequent <code>BatchGetItem</code> operation). For more information,
  /// see the above <code>RequestItems</code> parameter.
  final Map<String, KeysAndAttributes>? unprocessedKeys;

  BatchGetItemOutput({
    this.responses,
    this.unprocessedKeys,
  });

  factory BatchGetItemOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetItemOutput(
      responses: (json['Responses'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, BatchResponse.fromJson(e as Map<String, dynamic>))),
      unprocessedKeys: (json['UnprocessedKeys'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, KeysAndAttributes.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final responses = this.responses;
    final unprocessedKeys = this.unprocessedKeys;
    return {
      if (responses != null) 'Responses': responses,
      if (unprocessedKeys != null) 'UnprocessedKeys': unprocessedKeys,
    };
  }
}

/// The item attributes from a response in a specific table, along with the read
/// resources consumed on the table during the request.
class BatchResponse {
  final double? consumedCapacityUnits;
  final List<Map<String, AttributeValue>>? items;

  BatchResponse({
    this.consumedCapacityUnits,
    this.items,
  });

  factory BatchResponse.fromJson(Map<String, dynamic> json) {
    return BatchResponse(
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacityUnits = this.consumedCapacityUnits;
    final items = this.items;
    return {
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
      if (items != null) 'Items': items,
    };
  }
}

/// A container for <code>BatchWriteItem</code> response
class BatchWriteItemOutput {
  /// The response object as a result of <code>BatchWriteItem</code> call. This is
  /// essentially a map of table name to <code>ConsumedCapacityUnits</code>.
  final Map<String, BatchWriteResponse>? responses;

  /// The Items which we could not successfully process in a
  /// <code>BatchWriteItem</code> call is returned as
  /// <code>UnprocessedItems</code>
  final Map<String, List<WriteRequest>>? unprocessedItems;

  BatchWriteItemOutput({
    this.responses,
    this.unprocessedItems,
  });

  factory BatchWriteItemOutput.fromJson(Map<String, dynamic> json) {
    return BatchWriteItemOutput(
      responses: (json['Responses'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, BatchWriteResponse.fromJson(e as Map<String, dynamic>))),
      unprocessedItems: (json['UnprocessedItems'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) => WriteRequest.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final responses = this.responses;
    final unprocessedItems = this.unprocessedItems;
    return {
      if (responses != null) 'Responses': responses,
      if (unprocessedItems != null) 'UnprocessedItems': unprocessedItems,
    };
  }
}

class BatchWriteResponse {
  final double? consumedCapacityUnits;

  BatchWriteResponse({
    this.consumedCapacityUnits,
  });

  factory BatchWriteResponse.fromJson(Map<String, dynamic> json) {
    return BatchWriteResponse(
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacityUnits = this.consumedCapacityUnits;
    return {
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
    };
  }
}

/// A comparison operator is an enumeration of several operations:
///
/// <ul>
/// <li><code>EQ</code> for <em>equal</em>.</li>
/// <li><code>NE</code> for <em>not equal</em>.</li>
/// <li><code>IN</code> checks for exact matches.</li>
/// <li><code>LE</code> for <em>less than or equal to</em>.</li>
/// <li><code>LT</code> for <em>less than</em>.</li>
/// <li><code>GE</code> for <em>greater than or equal to</em>.</li>
/// <li><code>GT</code> for <em>greater than</em>.</li>
/// <li><code>BETWEEN</code> for <em>between</em>.</li>
/// <li><code>NOT_NULL</code> for <em>exists</em>.</li>
/// <li><code>NULL</code> for <em>not exists</em>.</li>
/// <li><code>CONTAINS</code> for substring or value in a set.</li>
/// <li><code>NOT_CONTAINS</code> for absence of a substring or absence of a
/// value in a set.</li>
/// <li><code>BEGINS_WITH</code> for a substring prefix.</li>
/// </ul>
/// Scan operations support all available comparison operators.
///
/// Query operations support a subset of the available comparison operators: EQ,
/// LE, LT, GE, GT, BETWEEN, and BEGINS_WITH.
enum ComparisonOperator {
  eq,
  ne,
  $in,
  le,
  lt,
  ge,
  gt,
  between,
  notNull,
  $null,
  contains,
  notContains,
  beginsWith,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.eq:
        return 'EQ';
      case ComparisonOperator.ne:
        return 'NE';
      case ComparisonOperator.$in:
        return 'IN';
      case ComparisonOperator.le:
        return 'LE';
      case ComparisonOperator.lt:
        return 'LT';
      case ComparisonOperator.ge:
        return 'GE';
      case ComparisonOperator.gt:
        return 'GT';
      case ComparisonOperator.between:
        return 'BETWEEN';
      case ComparisonOperator.notNull:
        return 'NOT_NULL';
      case ComparisonOperator.$null:
        return 'NULL';
      case ComparisonOperator.contains:
        return 'CONTAINS';
      case ComparisonOperator.notContains:
        return 'NOT_CONTAINS';
      case ComparisonOperator.beginsWith:
        return 'BEGINS_WITH';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQ':
        return ComparisonOperator.eq;
      case 'NE':
        return ComparisonOperator.ne;
      case 'IN':
        return ComparisonOperator.$in;
      case 'LE':
        return ComparisonOperator.le;
      case 'LT':
        return ComparisonOperator.lt;
      case 'GE':
        return ComparisonOperator.ge;
      case 'GT':
        return ComparisonOperator.gt;
      case 'BETWEEN':
        return ComparisonOperator.between;
      case 'NOT_NULL':
        return ComparisonOperator.notNull;
      case 'NULL':
        return ComparisonOperator.$null;
      case 'CONTAINS':
        return ComparisonOperator.contains;
      case 'NOT_CONTAINS':
        return ComparisonOperator.notContains;
      case 'BEGINS_WITH':
        return ComparisonOperator.beginsWith;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

class Condition {
  final ComparisonOperator comparisonOperator;
  final List<AttributeValue>? attributeValueList;

  Condition({
    required this.comparisonOperator,
    this.attributeValueList,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final attributeValueList = this.attributeValueList;
    return {
      'ComparisonOperator': comparisonOperator.toValue(),
      if (attributeValueList != null) 'AttributeValueList': attributeValueList,
    };
  }
}

class CreateTableOutput {
  final TableDescription? tableDescription;

  CreateTableOutput({
    this.tableDescription,
  });

  factory CreateTableOutput.fromJson(Map<String, dynamic> json) {
    return CreateTableOutput(
      tableDescription: json['TableDescription'] != null
          ? TableDescription.fromJson(
              json['TableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableDescription = this.tableDescription;
    return {
      if (tableDescription != null) 'TableDescription': tableDescription,
    };
  }
}

class DeleteItemOutput {
  /// If the <code>ReturnValues</code> parameter is provided as
  /// <code>ALL_OLD</code> in the request, Amazon DynamoDB returns an array of
  /// attribute name-value pairs (essentially, the deleted item). Otherwise, the
  /// response contains an empty set.
  final Map<String, AttributeValue>? attributes;
  final double? consumedCapacityUnits;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });

  factory DeleteItemOutput.fromJson(Map<String, dynamic> json) {
    return DeleteItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacityUnits = this.consumedCapacityUnits;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
    };
  }
}

/// A container for a Delete BatchWrite request
class DeleteRequest {
  /// The item's key to be delete
  final Key key;

  DeleteRequest({
    required this.key,
  });

  factory DeleteRequest.fromJson(Map<String, dynamic> json) {
    return DeleteRequest(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

class DeleteTableOutput {
  final TableDescription? tableDescription;

  DeleteTableOutput({
    this.tableDescription,
  });

  factory DeleteTableOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTableOutput(
      tableDescription: json['TableDescription'] != null
          ? TableDescription.fromJson(
              json['TableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableDescription = this.tableDescription;
    return {
      if (tableDescription != null) 'TableDescription': tableDescription,
    };
  }
}

class DescribeTableOutput {
  final TableDescription? table;

  DescribeTableOutput({
    this.table,
  });

  factory DescribeTableOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTableOutput(
      table: json['Table'] != null
          ? TableDescription.fromJson(json['Table'] as Map<String, dynamic>)
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

/// Allows you to provide an attribute name, and whether or not Amazon DynamoDB
/// should check to see if the attribute value already exists; or if the
/// attribute value exists and has a particular value before changing it.
class ExpectedAttributeValue {
  /// Specify whether or not a value already exists for the attribute name-value
  /// pair.
  final bool? exists;

  /// Specify whether or not a value already exists and has a specific content for
  /// the attribute name-value pair.
  final AttributeValue? value;

  ExpectedAttributeValue({
    this.exists,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final exists = this.exists;
    final value = this.value;
    return {
      if (exists != null) 'Exists': exists,
      if (value != null) 'Value': value,
    };
  }
}

class GetItemOutput {
  final double? consumedCapacityUnits;

  /// Contains the requested attributes.
  final Map<String, AttributeValue>? item;

  GetItemOutput({
    this.consumedCapacityUnits,
    this.item,
  });

  factory GetItemOutput.fromJson(Map<String, dynamic> json) {
    return GetItemOutput(
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
      item: (json['Item'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacityUnits = this.consumedCapacityUnits;
    final item = this.item;
    return {
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
      if (item != null) 'Item': item,
    };
  }
}

/// The primary key that uniquely identifies each item in a table. A primary key
/// can be a one attribute (hash) primary key or a two attribute
/// (hash-and-range) primary key.
class Key {
  /// A hash key element is treated as the primary key, and can be a string or a
  /// number. Single attribute primary keys have one index value. The value can be
  /// <code>String</code>, <code>Number</code>, <code>StringSet</code>,
  /// <code>NumberSet</code>.
  final AttributeValue hashKeyElement;

  /// A range key element is treated as a secondary key (used in conjunction with
  /// the primary key), and can be a string or a number, and is only used for
  /// hash-and-range primary keys. The value can be <code>String</code>,
  /// <code>Number</code>, <code>StringSet</code>, <code>NumberSet</code>.
  final AttributeValue? rangeKeyElement;

  Key({
    required this.hashKeyElement,
    this.rangeKeyElement,
  });

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(
      hashKeyElement: AttributeValue.fromJson(
          json['HashKeyElement'] as Map<String, dynamic>),
      rangeKeyElement: json['RangeKeyElement'] != null
          ? AttributeValue.fromJson(
              json['RangeKeyElement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyElement = this.hashKeyElement;
    final rangeKeyElement = this.rangeKeyElement;
    return {
      'HashKeyElement': hashKeyElement,
      if (rangeKeyElement != null) 'RangeKeyElement': rangeKeyElement,
    };
  }
}

/// The KeySchema identifies the primary key as a one attribute primary key
/// (hash) or a composite two attribute (hash-and-range) primary key. Single
/// attribute primary keys have one index value: a <code>HashKeyElement</code>.
/// A composite hash-and-range primary key contains two attribute values: a
/// <code>HashKeyElement</code> and a <code>RangeKeyElement</code>.
class KeySchema {
  /// A hash key element is treated as the primary key, and can be a string or a
  /// number. Single attribute primary keys have one index value. The value can be
  /// <code>String</code>, <code>Number</code>, <code>StringSet</code>,
  /// <code>NumberSet</code>.
  final KeySchemaElement hashKeyElement;

  /// A range key element is treated as a secondary key (used in conjunction with
  /// the primary key), and can be a string or a number, and is only used for
  /// hash-and-range primary keys. The value can be <code>String</code>,
  /// <code>Number</code>, <code>StringSet</code>, <code>NumberSet</code>.
  final KeySchemaElement? rangeKeyElement;

  KeySchema({
    required this.hashKeyElement,
    this.rangeKeyElement,
  });

  factory KeySchema.fromJson(Map<String, dynamic> json) {
    return KeySchema(
      hashKeyElement: KeySchemaElement.fromJson(
          json['HashKeyElement'] as Map<String, dynamic>),
      rangeKeyElement: json['RangeKeyElement'] != null
          ? KeySchemaElement.fromJson(
              json['RangeKeyElement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyElement = this.hashKeyElement;
    final rangeKeyElement = this.rangeKeyElement;
    return {
      'HashKeyElement': hashKeyElement,
      if (rangeKeyElement != null) 'RangeKeyElement': rangeKeyElement,
    };
  }
}

/// <code>KeySchemaElement</code> is the primary key (hash or hash-and-range)
/// structure for the table.
class KeySchemaElement {
  /// The <code>AttributeName</code> of the <code>KeySchemaElement</code>.
  final String attributeName;

  /// The <code>AttributeType</code> of the <code>KeySchemaElement</code> which
  /// can be a <code>String</code> or a <code>Number</code>.
  final ScalarAttributeType attributeType;

  KeySchemaElement({
    required this.attributeName,
    required this.attributeType,
  });

  factory KeySchemaElement.fromJson(Map<String, dynamic> json) {
    return KeySchemaElement(
      attributeName: json['AttributeName'] as String,
      attributeType: (json['AttributeType'] as String).toScalarAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeType = this.attributeType;
    return {
      'AttributeName': attributeName,
      'AttributeType': attributeType.toValue(),
    };
  }
}

class KeysAndAttributes {
  final List<Key> keys;
  final List<String>? attributesToGet;
  final bool? consistentRead;

  KeysAndAttributes({
    required this.keys,
    this.attributesToGet,
    this.consistentRead,
  });

  factory KeysAndAttributes.fromJson(Map<String, dynamic> json) {
    return KeysAndAttributes(
      keys: (json['Keys'] as List)
          .whereNotNull()
          .map((e) => Key.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributesToGet: (json['AttributesToGet'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      consistentRead: json['ConsistentRead'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    final attributesToGet = this.attributesToGet;
    final consistentRead = this.consistentRead;
    return {
      'Keys': keys,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
    };
  }
}

class ListTablesOutput {
  /// The name of the last table in the current list. Use this value as the
  /// <code>ExclusiveStartTableName</code> in a new request to continue the list
  /// until all the table names are returned. If this value is null, all table
  /// names have been returned.
  final String? lastEvaluatedTableName;
  final List<String>? tableNames;

  ListTablesOutput({
    this.lastEvaluatedTableName,
    this.tableNames,
  });

  factory ListTablesOutput.fromJson(Map<String, dynamic> json) {
    return ListTablesOutput(
      lastEvaluatedTableName: json['LastEvaluatedTableName'] as String?,
      tableNames: (json['TableNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastEvaluatedTableName = this.lastEvaluatedTableName;
    final tableNames = this.tableNames;
    return {
      if (lastEvaluatedTableName != null)
        'LastEvaluatedTableName': lastEvaluatedTableName,
      if (tableNames != null) 'TableNames': tableNames,
    };
  }
}

/// Provisioned throughput reserves the required read and write resources for
/// your table in terms of <code>ReadCapacityUnits</code> and
/// <code>WriteCapacityUnits</code>. Values for provisioned throughput depend
/// upon your expected read/write rates, item size, and consistency. Provide the
/// expected number of read and write operations, assuming an item size of 1k
/// and strictly consistent reads. For 2k item size, double the value. For 3k,
/// triple the value, etc. Eventually-consistent reads consume half the
/// resources of strictly consistent reads.
class ProvisionedThroughput {
  /// <code>ReadCapacityUnits</code> are in terms of strictly consistent reads,
  /// assuming items of 1k. 2k items require twice the
  /// <code>ReadCapacityUnits</code>. Eventually-consistent reads only require
  /// half the <code>ReadCapacityUnits</code> of stirctly consistent reads.
  final int readCapacityUnits;

  /// <code>WriteCapacityUnits</code> are in terms of strictly consistent reads,
  /// assuming items of 1k. 2k items require twice the
  /// <code>WriteCapacityUnits</code>.
  final int writeCapacityUnits;

  ProvisionedThroughput({
    required this.readCapacityUnits,
    required this.writeCapacityUnits,
  });

  Map<String, dynamic> toJson() {
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      'ReadCapacityUnits': readCapacityUnits,
      'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

class ProvisionedThroughputDescription {
  final DateTime? lastDecreaseDateTime;
  final DateTime? lastIncreaseDateTime;
  final int? numberOfDecreasesToday;
  final int? readCapacityUnits;
  final int? writeCapacityUnits;

  ProvisionedThroughputDescription({
    this.lastDecreaseDateTime,
    this.lastIncreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory ProvisionedThroughputDescription.fromJson(Map<String, dynamic> json) {
    return ProvisionedThroughputDescription(
      lastDecreaseDateTime: timeStampFromJson(json['LastDecreaseDateTime']),
      lastIncreaseDateTime: timeStampFromJson(json['LastIncreaseDateTime']),
      numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int?,
      readCapacityUnits: json['ReadCapacityUnits'] as int?,
      writeCapacityUnits: json['WriteCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastDecreaseDateTime = this.lastDecreaseDateTime;
    final lastIncreaseDateTime = this.lastIncreaseDateTime;
    final numberOfDecreasesToday = this.numberOfDecreasesToday;
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      if (lastDecreaseDateTime != null)
        'LastDecreaseDateTime': unixTimestampToJson(lastDecreaseDateTime),
      if (lastIncreaseDateTime != null)
        'LastIncreaseDateTime': unixTimestampToJson(lastIncreaseDateTime),
      if (numberOfDecreasesToday != null)
        'NumberOfDecreasesToday': numberOfDecreasesToday,
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

class PutItemOutput {
  /// Attribute values before the put operation, but only if the
  /// <code>ReturnValues</code> parameter is specified as <code>ALL_OLD</code> in
  /// the request.
  final Map<String, AttributeValue>? attributes;
  final double? consumedCapacityUnits;

  PutItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });

  factory PutItemOutput.fromJson(Map<String, dynamic> json) {
    return PutItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacityUnits = this.consumedCapacityUnits;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
    };
  }
}

/// A container for a Put BatchWrite request
class PutRequest {
  /// The item to put
  final Map<String, AttributeValue> item;

  PutRequest({
    required this.item,
  });

  factory PutRequest.fromJson(Map<String, dynamic> json) {
    return PutRequest(
      item: (json['Item'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    return {
      'Item': item,
    };
  }
}

class QueryOutput {
  final double? consumedCapacityUnits;

  /// Number of items in the response.
  final int? count;
  final List<Map<String, AttributeValue>>? items;

  /// Primary key of the item where the query operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation excluding this
  /// value in the new request. The <code>LastEvaluatedKey</code> is null when the
  /// entire query result set is complete (i.e. the operation processed the "last
  /// page").
  final Key? lastEvaluatedKey;

  QueryOutput({
    this.consumedCapacityUnits,
    this.count,
    this.items,
    this.lastEvaluatedKey,
  });

  factory QueryOutput.fromJson(Map<String, dynamic> json) {
    return QueryOutput(
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
      count: json['Count'] as int?,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      lastEvaluatedKey: json['LastEvaluatedKey'] != null
          ? Key.fromJson(json['LastEvaluatedKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacityUnits = this.consumedCapacityUnits;
    final count = this.count;
    final items = this.items;
    final lastEvaluatedKey = this.lastEvaluatedKey;
    return {
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
      if (count != null) 'Count': count,
      if (items != null) 'Items': items,
      if (lastEvaluatedKey != null) 'LastEvaluatedKey': lastEvaluatedKey,
    };
  }
}

/// Use this parameter if you want to get the attribute name-value pairs before
/// or after they are modified. For <code>PUT</code> operations, the possible
/// parameter values are <code>NONE</code> (default) or <code>ALL_OLD</code>.
/// For update operations, the possible parameter values are <code>NONE</code>
/// (default) or <code>ALL_OLD</code>, <code>UPDATED_OLD</code>,
/// <code>ALL_NEW</code> or <code>UPDATED_NEW</code>.
///
/// <ul>
/// <li><code>NONE</code>: Nothing is returned.</li>
/// <li><code>ALL_OLD</code>: Returns the attributes of the item as they were
/// before the operation.</li>
/// <li><code>UPDATED_OLD</code>: Returns the values of the updated attributes,
/// only, as they were before the operation.</li>
/// <li><code>ALL_NEW</code>: Returns all the attributes and their new values
/// after the operation.</li>
/// <li><code>UPDATED_NEW</code>: Returns the values of the updated attributes,
/// only, as they are after the operation.</li>
/// </ul>
enum ReturnValue {
  none,
  allOld,
  updatedOld,
  allNew,
  updatedNew,
}

extension ReturnValueValueExtension on ReturnValue {
  String toValue() {
    switch (this) {
      case ReturnValue.none:
        return 'NONE';
      case ReturnValue.allOld:
        return 'ALL_OLD';
      case ReturnValue.updatedOld:
        return 'UPDATED_OLD';
      case ReturnValue.allNew:
        return 'ALL_NEW';
      case ReturnValue.updatedNew:
        return 'UPDATED_NEW';
    }
  }
}

extension ReturnValueFromString on String {
  ReturnValue toReturnValue() {
    switch (this) {
      case 'NONE':
        return ReturnValue.none;
      case 'ALL_OLD':
        return ReturnValue.allOld;
      case 'UPDATED_OLD':
        return ReturnValue.updatedOld;
      case 'ALL_NEW':
        return ReturnValue.allNew;
      case 'UPDATED_NEW':
        return ReturnValue.updatedNew;
    }
    throw Exception('$this is not known in enum ReturnValue');
  }
}

enum ScalarAttributeType {
  s,
  n,
  b,
}

extension ScalarAttributeTypeValueExtension on ScalarAttributeType {
  String toValue() {
    switch (this) {
      case ScalarAttributeType.s:
        return 'S';
      case ScalarAttributeType.n:
        return 'N';
      case ScalarAttributeType.b:
        return 'B';
    }
  }
}

extension ScalarAttributeTypeFromString on String {
  ScalarAttributeType toScalarAttributeType() {
    switch (this) {
      case 'S':
        return ScalarAttributeType.s;
      case 'N':
        return ScalarAttributeType.n;
      case 'B':
        return ScalarAttributeType.b;
    }
    throw Exception('$this is not known in enum ScalarAttributeType');
  }
}

class ScanOutput {
  final double? consumedCapacityUnits;

  /// Number of items in the response.
  final int? count;
  final List<Map<String, AttributeValue>>? items;

  /// Primary key of the item where the scan operation stopped. Provide this value
  /// in a subsequent scan operation to continue the operation from that point.
  /// The <code>LastEvaluatedKey</code> is null when the entire scan result set is
  /// complete (i.e. the operation processed the "last page").
  final Key? lastEvaluatedKey;

  /// Number of items in the complete scan before any filters are applied. A high
  /// <code>ScannedCount</code> value with few, or no, <code>Count</code> results
  /// indicates an inefficient <code>Scan</code> operation.
  final int? scannedCount;

  ScanOutput({
    this.consumedCapacityUnits,
    this.count,
    this.items,
    this.lastEvaluatedKey,
    this.scannedCount,
  });

  factory ScanOutput.fromJson(Map<String, dynamic> json) {
    return ScanOutput(
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
      count: json['Count'] as int?,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      lastEvaluatedKey: json['LastEvaluatedKey'] != null
          ? Key.fromJson(json['LastEvaluatedKey'] as Map<String, dynamic>)
          : null,
      scannedCount: json['ScannedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacityUnits = this.consumedCapacityUnits;
    final count = this.count;
    final items = this.items;
    final lastEvaluatedKey = this.lastEvaluatedKey;
    final scannedCount = this.scannedCount;
    return {
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
      if (count != null) 'Count': count,
      if (items != null) 'Items': items,
      if (lastEvaluatedKey != null) 'LastEvaluatedKey': lastEvaluatedKey,
      if (scannedCount != null) 'ScannedCount': scannedCount,
    };
  }
}

class TableDescription {
  final DateTime? creationDateTime;
  final int? itemCount;
  final KeySchema? keySchema;
  final ProvisionedThroughputDescription? provisionedThroughput;

  /// The name of the table being described.
  final String? tableName;
  final int? tableSizeBytes;
  final TableStatus? tableStatus;

  TableDescription({
    this.creationDateTime,
    this.itemCount,
    this.keySchema,
    this.provisionedThroughput,
    this.tableName,
    this.tableSizeBytes,
    this.tableStatus,
  });

  factory TableDescription.fromJson(Map<String, dynamic> json) {
    return TableDescription(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      itemCount: json['ItemCount'] as int?,
      keySchema: json['KeySchema'] != null
          ? KeySchema.fromJson(json['KeySchema'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughputDescription.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
      tableSizeBytes: json['TableSizeBytes'] as int?,
      tableStatus: (json['TableStatus'] as String?)?.toTableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final provisionedThroughput = this.provisionedThroughput;
    final tableName = this.tableName;
    final tableSizeBytes = this.tableSizeBytes;
    final tableStatus = this.tableStatus;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (tableName != null) 'TableName': tableName,
      if (tableSizeBytes != null) 'TableSizeBytes': tableSizeBytes,
      if (tableStatus != null) 'TableStatus': tableStatus.toValue(),
    };
  }
}

enum TableStatus {
  creating,
  updating,
  deleting,
  active,
}

extension TableStatusValueExtension on TableStatus {
  String toValue() {
    switch (this) {
      case TableStatus.creating:
        return 'CREATING';
      case TableStatus.updating:
        return 'UPDATING';
      case TableStatus.deleting:
        return 'DELETING';
      case TableStatus.active:
        return 'ACTIVE';
    }
  }
}

extension TableStatusFromString on String {
  TableStatus toTableStatus() {
    switch (this) {
      case 'CREATING':
        return TableStatus.creating;
      case 'UPDATING':
        return TableStatus.updating;
      case 'DELETING':
        return TableStatus.deleting;
      case 'ACTIVE':
        return TableStatus.active;
    }
    throw Exception('$this is not known in enum TableStatus');
  }
}

class UpdateItemOutput {
  /// A map of attribute name-value pairs, but only if the
  /// <code>ReturnValues</code> parameter is specified as something other than
  /// <code>NONE</code> in the request.
  final Map<String, AttributeValue>? attributes;
  final double? consumedCapacityUnits;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });

  factory UpdateItemOutput.fromJson(Map<String, dynamic> json) {
    return UpdateItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacityUnits: json['ConsumedCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacityUnits = this.consumedCapacityUnits;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacityUnits != null)
        'ConsumedCapacityUnits': consumedCapacityUnits,
    };
  }
}

class UpdateTableOutput {
  final TableDescription? tableDescription;

  UpdateTableOutput({
    this.tableDescription,
  });

  factory UpdateTableOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTableOutput(
      tableDescription: json['TableDescription'] != null
          ? TableDescription.fromJson(
              json['TableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableDescription = this.tableDescription;
    return {
      if (tableDescription != null) 'TableDescription': tableDescription,
    };
  }
}

/// This structure is a Union of PutRequest and DeleteRequest. It can contain
/// exactly one of <code>PutRequest</code> or <code>DeleteRequest</code>. Never
/// Both. This is enforced in the code.
class WriteRequest {
  final DeleteRequest? deleteRequest;
  final PutRequest? putRequest;

  WriteRequest({
    this.deleteRequest,
    this.putRequest,
  });

  factory WriteRequest.fromJson(Map<String, dynamic> json) {
    return WriteRequest(
      deleteRequest: json['DeleteRequest'] != null
          ? DeleteRequest.fromJson(
              json['DeleteRequest'] as Map<String, dynamic>)
          : null,
      putRequest: json['PutRequest'] != null
          ? PutRequest.fromJson(json['PutRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteRequest = this.deleteRequest;
    final putRequest = this.putRequest;
    return {
      if (deleteRequest != null) 'DeleteRequest': deleteRequest,
      if (putRequest != null) 'PutRequest': putRequest,
    };
  }
}

class ConditionalCheckFailedException extends _s.GenericAwsException {
  ConditionalCheckFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'ConditionalCheckFailedException',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class RequestLimitExceeded extends _s.GenericAwsException {
  RequestLimitExceeded({String? type, String? message})
      : super(type: type, code: 'RequestLimitExceeded', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConditionalCheckFailedException': (type, message) =>
      ConditionalCheckFailedException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'RequestLimitExceeded': (type, message) =>
      RequestLimitExceeded(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
