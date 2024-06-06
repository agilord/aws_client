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

/// Amazon DynamoDB is a fully managed NoSQL database service that provides fast
/// and predictable performance with seamless scalability. DynamoDB lets you
/// offload the administrative burdens of operating and scaling a distributed
/// database, so that you don't have to worry about hardware provisioning, setup
/// and configuration, replication, software patching, or cluster scaling.
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

  /// This operation allows you to perform batch reads or writes on data stored
  /// in DynamoDB, using PartiQL. Each read statement in a
  /// <code>BatchExecuteStatement</code> must specify an equality condition on
  /// all key attributes. This enforces that each <code>SELECT</code> statement
  /// in a batch returns at most a single item.
  /// <note>
  /// The entire batch must consist of either read statements or write
  /// statements, you cannot mix both in one batch.
  /// </note> <important>
  /// A HTTP 200 response does not mean that all statements in the
  /// BatchExecuteStatement succeeded. Error details for individual statements
  /// can be found under the <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BatchStatementResponse.html#DDB-Type-BatchStatementResponse-Error">Error</a>
  /// field of the <code>BatchStatementResponse</code> for each statement.
  /// </important>
  ///
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [statements] :
  /// The list of PartiQL statements representing the batch to run.
  Future<BatchExecuteStatementOutput> batchExecuteStatement({
    required List<BatchStatementRequest> statements,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.BatchExecuteStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Statements': statements,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
      },
    );

    return BatchExecuteStatementOutput.fromJson(jsonResponse.body);
  }

  /// The <code>BatchGetItem</code> operation returns the attributes of one or
  /// more items from one or more tables. You identify requested items by
  /// primary key.
  ///
  /// A single operation can retrieve up to 16 MB of data, which can contain as
  /// many as 100 items. <code>BatchGetItem</code> returns a partial result if
  /// the response size limit is exceeded, the table's provisioned throughput is
  /// exceeded, more than 1MB per partition is requested, or an internal
  /// processing failure occurs. If a partial result is returned, the operation
  /// returns a value for <code>UnprocessedKeys</code>. You can use this value
  /// to retry the operation starting with the next item to get.
  /// <important>
  /// If you request more than 100 items, <code>BatchGetItem</code> returns a
  /// <code>ValidationException</code> with the message "Too many items
  /// requested for the BatchGetItem call."
  /// </important>
  /// For example, if you ask to retrieve 100 items, but each individual item is
  /// 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB
  /// limit). It also returns an appropriate <code>UnprocessedKeys</code> value
  /// so you can get the next page of results. If desired, your application can
  /// include its own logic to assemble the pages of results into one dataset.
  ///
  /// If <i>none</i> of the items can be processed due to insufficient
  /// provisioned throughput on all of the tables in the request, then
  /// <code>BatchGetItem</code> returns a
  /// <code>ProvisionedThroughputExceededException</code>. If <i>at least
  /// one</i> of the items is successfully processed, then
  /// <code>BatchGetItem</code> completes successfully, while returning the keys
  /// of the unread items in <code>UnprocessedKeys</code>.
  /// <important>
  /// If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, <i>we strongly recommend that you use
  /// an exponential backoff algorithm</i>. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations">Batch
  /// Operations and Error Handling</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  /// </important>
  /// By default, <code>BatchGetItem</code> performs eventually consistent reads
  /// on every table in the request. If you want strongly consistent reads
  /// instead, you can set <code>ConsistentRead</code> to <code>true</code> for
  /// any or all tables.
  ///
  /// In order to minimize response latency, <code>BatchGetItem</code> may
  /// retrieve items in parallel.
  ///
  /// When designing your application, keep in mind that DynamoDB does not
  /// return items in any particular order. To help parse the response by item,
  /// include the primary key values for the items in your request in the
  /// <code>ProjectionExpression</code> parameter.
  ///
  /// If a requested item does not exist, it is not returned in the result.
  /// Requests for nonexistent items consume the minimum read capacity units
  /// according to the type of read. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#CapacityUnitCalculations">Working
  /// with Tables</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [requestItems] :
  /// A map of one or more table names or table ARNs and, for each table, a map
  /// that describes one or more items to retrieve from that table. Each table
  /// name or ARN can be used only once per <code>BatchGetItem</code> request.
  ///
  /// Each element in the map of items to retrieve consists of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ConsistentRead</code> - If <code>true</code>, a strongly consistent
  /// read is used; if <code>false</code> (the default), an eventually
  /// consistent read is used.
  /// </li>
  /// <li>
  /// <code>ExpressionAttributeNames</code> - One or more substitution tokens
  /// for attribute names in the <code>ProjectionExpression</code> parameter.
  /// The following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information about expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Keys</code> - An array of primary key attribute values that define
  /// specific items in the table. For each primary key, you must provide
  /// <i>all</i> of the key attributes. For example, with a simple primary key,
  /// you only need to provide the partition key value. For a composite key, you
  /// must provide <i>both</i> the partition key value and the sort key value.
  /// </li>
  /// <li>
  /// <code>ProjectionExpression</code> - A string that identifies one or more
  /// attributes to retrieve from the table. These attributes can include
  /// scalars, sets, or elements of a JSON document. The attributes in the
  /// expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes are returned. If
  /// any of the requested attributes are not found, they do not appear in the
  /// result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>AttributesToGet</code> - This is a legacy parameter. Use
  /// <code>ProjectionExpression</code> instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// </ul>
  Future<BatchGetItemOutput> batchGetItem({
    required Map<String, KeysAndAttributes> requestItems,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.BatchGetItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
      },
    );

    return BatchGetItemOutput.fromJson(jsonResponse.body);
  }

  /// The <code>BatchWriteItem</code> operation puts or deletes multiple items
  /// in one or more tables. A single call to <code>BatchWriteItem</code> can
  /// transmit up to 16MB of data over the network, consisting of up to 25 item
  /// put or delete operations. While individual items can be up to 400 KB once
  /// stored, it's important to note that an item's representation might be
  /// greater than 400KB while being sent in DynamoDB's JSON format for the API
  /// call. For more details on this distinction, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html">Naming
  /// Rules and Data Types</a>.
  /// <note>
  /// <code>BatchWriteItem</code> cannot update items. If you perform a
  /// <code>BatchWriteItem</code> operation on an existing item, that item's
  /// values will be overwritten by the operation and it will appear like it was
  /// updated. To update items, we recommend you use the <code>UpdateItem</code>
  /// action.
  /// </note>
  /// The individual <code>PutItem</code> and <code>DeleteItem</code> operations
  /// specified in <code>BatchWriteItem</code> are atomic; however
  /// <code>BatchWriteItem</code> as a whole is not. If any requested operations
  /// fail because the table's provisioned throughput is exceeded or an internal
  /// processing failure occurs, the failed operations are returned in the
  /// <code>UnprocessedItems</code> response parameter. You can investigate and
  /// optionally resend the requests. Typically, you would call
  /// <code>BatchWriteItem</code> in a loop. Each iteration would check for
  /// unprocessed items and submit a new <code>BatchWriteItem</code> request
  /// with those unprocessed items until all items have been processed.
  ///
  /// If <i>none</i> of the items can be processed due to insufficient
  /// provisioned throughput on all of the tables in the request, then
  /// <code>BatchWriteItem</code> returns a
  /// <code>ProvisionedThroughputExceededException</code>.
  /// <important>
  /// If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, <i>we strongly recommend that you use
  /// an exponential backoff algorithm</i>. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#Programming.Errors.BatchOperations">Batch
  /// Operations and Error Handling</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  /// </important>
  /// With <code>BatchWriteItem</code>, you can efficiently write or delete
  /// large amounts of data, such as from Amazon EMR, or copy data from another
  /// database into DynamoDB. In order to improve performance with these
  /// large-scale operations, <code>BatchWriteItem</code> does not behave in the
  /// same way as individual <code>PutItem</code> and <code>DeleteItem</code>
  /// calls would. For example, you cannot specify conditions on individual put
  /// and delete requests, and <code>BatchWriteItem</code> does not return
  /// deleted items in the response.
  ///
  /// If you use a programming language that supports concurrency, you can use
  /// threads to write items in parallel. Your application must include the
  /// necessary logic to manage the threads. With languages that don't support
  /// threading, you must update or delete the specified items one at a time. In
  /// both situations, <code>BatchWriteItem</code> performs the specified put
  /// and delete operations in parallel, giving you the power of the thread pool
  /// approach without having to introduce complexity into your application.
  ///
  /// Parallel processing reduces latency, but each specified put and delete
  /// request consumes the same number of write capacity units whether it is
  /// processed in parallel or not. Delete operations on nonexistent items
  /// consume one write capacity unit.
  ///
  /// If one or more of the following is true, DynamoDB rejects the entire batch
  /// write operation:
  ///
  /// <ul>
  /// <li>
  /// One or more tables specified in the <code>BatchWriteItem</code> request
  /// does not exist.
  /// </li>
  /// <li>
  /// Primary key attributes specified on an item in the request do not match
  /// those in the corresponding table's primary key schema.
  /// </li>
  /// <li>
  /// You try to perform multiple operations on the same item in the same
  /// <code>BatchWriteItem</code> request. For example, you cannot put and
  /// delete the same item in the same <code>BatchWriteItem</code> request.
  /// </li>
  /// <li>
  /// Your request contains at least two items with identical hash and range
  /// keys (which essentially is two put operations).
  /// </li>
  /// <li>
  /// There are more than 25 requests in the batch.
  /// </li>
  /// <li>
  /// Any individual item in a batch exceeds 400 KB.
  /// </li>
  /// <li>
  /// The total request size exceeds 16 MB.
  /// </li>
  /// <li>
  /// Any individual items with keys exceeding the key length limits. For a
  /// partition key, the limit is 2048 bytes and for a sort key, the limit is
  /// 1024 bytes.
  /// </li>
  /// </ul>
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [requestItems] :
  /// A map of one or more table names or table ARNs and, for each table, a list
  /// of operations to be performed (<code>DeleteRequest</code> or
  /// <code>PutRequest</code>). Each element in the map consists of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation
  /// on the specified item. The item to be deleted is identified by a
  /// <code>Key</code> subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Key</code> - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name
  /// and an attribute value. For each primary key, you must provide <i>all</i>
  /// of the key attributes. For example, with a simple primary key, you only
  /// need to provide a value for the partition key. For a composite primary
  /// key, you must provide values for <i>both</i> the partition key and the
  /// sort key.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PutRequest</code> - Perform a <code>PutItem</code> operation on the
  /// specified item. The item to be put is identified by an <code>Item</code>
  /// subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Item</code> - A map of attributes and their values. Each entry in
  /// this map consists of an attribute name and an attribute value. Attribute
  /// values must not be null; string and binary type attributes must have
  /// lengths greater than zero; and set type attributes must not be empty.
  /// Requests that contain empty values are rejected with a
  /// <code>ValidationException</code> exception.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  Future<BatchWriteItemOutput> batchWriteItem({
    required Map<String, List<WriteRequest>> requestItems,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.BatchWriteItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnItemCollectionMetrics != null)
          'ReturnItemCollectionMetrics': returnItemCollectionMetrics.toValue(),
      },
    );

    return BatchWriteItemOutput.fromJson(jsonResponse.body);
  }

  /// Creates a backup for an existing table.
  ///
  /// Each time you create an on-demand backup, the entire table data is backed
  /// up. There is no limit to the number of on-demand backups that can be
  /// taken.
  ///
  /// When you create an on-demand backup, a time marker of the request is
  /// cataloged, and the backup is created asynchronously, by applying all
  /// changes until the time of the request to the last full table snapshot.
  /// Backup requests are processed instantaneously and become available for
  /// restore within minutes.
  ///
  /// You can call <code>CreateBackup</code> at a maximum rate of 50 times per
  /// second.
  ///
  /// All backups in DynamoDB work without consuming any provisioned throughput
  /// on the table.
  ///
  /// If you submit a backup request on 2018-12-14 at 14:25:00, the backup is
  /// guaranteed to contain all data committed to the table up to 14:24:00, and
  /// data committed after 14:26:00 will not be. The backup might contain data
  /// modifications made between 14:24:00 and 14:26:00. On-demand backup does
  /// not support causal consistency.
  ///
  /// Along with data, the following are also included on the backups:
  ///
  /// <ul>
  /// <li>
  /// Global secondary indexes (GSIs)
  /// </li>
  /// <li>
  /// Local secondary indexes (LSIs)
  /// </li>
  /// <li>
  /// Streams
  /// </li>
  /// <li>
  /// Provisioned read and write capacity
  /// </li>
  /// </ul>
  ///
  /// May throw [TableNotFoundException].
  /// May throw [TableInUseException].
  /// May throw [ContinuousBackupsUnavailableException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupName] :
  /// Specified name for the backup.
  ///
  /// Parameter [tableName] :
  /// The name of the table. You can also provide the Amazon Resource Name (ARN)
  /// of the table in this parameter.
  Future<CreateBackupOutput> createBackup({
    required String backupName,
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupName': backupName,
        'TableName': tableName,
      },
    );

    return CreateBackupOutput.fromJson(jsonResponse.body);
  }

  /// Creates a global table from an existing table. A global table creates a
  /// replication relationship between two or more DynamoDB tables with the same
  /// table name in the provided Regions.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important>
  /// If you want to add a new replica table to a global table, each of the
  /// following conditions must be true:
  ///
  /// <ul>
  /// <li>
  /// The table must have the same primary key as all of the other replicas.
  /// </li>
  /// <li>
  /// The table must have the same name as all of the other replicas.
  /// </li>
  /// <li>
  /// The table must have DynamoDB Streams enabled, with the stream containing
  /// both the new and the old images of the item.
  /// </li>
  /// <li>
  /// None of the replica tables in the global table can contain any data.
  /// </li>
  /// </ul>
  /// If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// <ul>
  /// <li>
  /// The global secondary indexes must have the same name.
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same hash key and sort key (if
  /// present).
  /// </li>
  /// </ul>
  /// If local secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// <ul>
  /// <li>
  /// The local secondary indexes must have the same name.
  /// </li>
  /// <li>
  /// The local secondary indexes must have the same hash key and sort key (if
  /// present).
  /// </li>
  /// </ul> <important>
  /// Write capacity settings should be set consistently across your replica
  /// tables and secondary indexes. DynamoDB strongly recommends enabling auto
  /// scaling to manage the write capacity settings for all of your global
  /// tables replicas and indexes.
  ///
  /// If you prefer to manage write capacity settings manually, you should
  /// provision equal replicated write capacity units to your replica tables.
  /// You should also provision equal replicated write capacity units to
  /// matching secondary indexes across your global table.
  /// </important>
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  /// May throw [GlobalTableAlreadyExistsException].
  /// May throw [TableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The global table name.
  ///
  /// Parameter [replicationGroup] :
  /// The Regions where the global table needs to be created.
  Future<CreateGlobalTableOutput> createGlobalTable({
    required String globalTableName,
    required List<Replica> replicationGroup,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        'ReplicationGroup': replicationGroup,
      },
    );

    return CreateGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// The <code>CreateTable</code> operation adds a new table to your account.
  /// In an Amazon Web Services account, table names must be unique within each
  /// Region. That is, you can have two tables with same name if you create the
  /// tables in different Regions.
  ///
  /// <code>CreateTable</code> is an asynchronous operation. Upon receiving a
  /// <code>CreateTable</code> request, DynamoDB immediately returns a response
  /// with a <code>TableStatus</code> of <code>CREATING</code>. After the table
  /// is created, DynamoDB sets the <code>TableStatus</code> to
  /// <code>ACTIVE</code>. You can perform read and write operations only on an
  /// <code>ACTIVE</code> table.
  ///
  /// You can optionally define secondary indexes on the new table, as part of
  /// the <code>CreateTable</code> operation. If you want to create multiple
  /// tables with secondary indexes on them, you must create the tables
  /// sequentially. Only one table with secondary indexes can be in the
  /// <code>CREATING</code> state at any given time.
  ///
  /// You can use the <code>DescribeTable</code> action to check the table
  /// status.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [attributeDefinitions] :
  /// An array of attributes that describe the key schema for the table and
  /// indexes.
  ///
  /// Parameter [keySchema] :
  /// Specifies the attributes that make up the primary key for a table or an
  /// index. The attributes in <code>KeySchema</code> must also be defined in
  /// the <code>AttributeDefinitions</code> array. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data
  /// Model</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Each <code>KeySchemaElement</code> in the array is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of this key attribute.
  /// </li>
  /// <li>
  /// <code>KeyType</code> - The role that the key attribute will assume:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>.
  /// The term "hash attribute" derives from the DynamoDB usage of an internal
  /// hash function to evenly distribute data items across partitions, based on
  /// their partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  /// For a simple primary key (partition key), you must provide exactly one
  /// element with a <code>KeyType</code> of <code>HASH</code>.
  ///
  /// For a composite primary key (partition key and sort key), you must provide
  /// exactly two elements, in this order: The first element must have a
  /// <code>KeyType</code> of <code>HASH</code>, and the second element must
  /// have a <code>KeyType</code> of <code>RANGE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key">Working
  /// with Tables</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [tableName] :
  /// The name of the table to create. You can also provide the Amazon Resource
  /// Name (ARN) of the table in this parameter.
  ///
  /// Parameter [billingMode] :
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html">Provisioned
  /// capacity mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html">On-demand
  /// capacity mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// Indicates whether deletion protection is to be enabled (true) or disabled
  /// (false) on the table.
  ///
  /// Parameter [globalSecondaryIndexes] :
  /// One or more global secondary indexes (the maximum is 20) to be created on
  /// the table. Each global secondary index in the array includes the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the global secondary index. Must be
  /// unique only for this table.
  /// <p/> </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the key schema for the global secondary
  /// index.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected
  /// into the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the
  /// index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct
  /// attributes when determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ProvisionedThroughput</code> - The provisioned throughput settings
  /// for the global secondary index, consisting of read and write capacity
  /// units.
  /// </li>
  /// </ul>
  ///
  /// Parameter [localSecondaryIndexes] :
  /// One or more local secondary indexes (the maximum is 5) to be created on
  /// the table. Each index is scoped to a given partition key value. There is a
  /// 10 GB size limit per partition key value; otherwise, the size of a local
  /// secondary index is unconstrained.
  ///
  /// Each local secondary index in the array includes the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the local secondary index. Must be
  /// unique only for this table.
  /// <p/> </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the key schema for the local secondary
  /// index. The key schema must begin with the same partition key as the table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected
  /// into the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the
  /// index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct
  /// attributes when determining the total.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [onDemandThroughput] :
  /// Sets the maximum number of read and write units for the specified table in
  /// on-demand capacity mode. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  ///
  /// Parameter [provisionedThroughput] :
  /// Represents the provisioned throughput settings for a specified table or
  /// index. The settings can be modified using the <code>UpdateTable</code>
  /// operation.
  ///
  /// If you set BillingMode as <code>PROVISIONED</code>, you must specify this
  /// property. If you set BillingMode as <code>PAY_PER_REQUEST</code>, you
  /// cannot specify this property.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// Parameter [resourcePolicy] :
  /// An Amazon Web Services resource-based policy document in JSON format that
  /// will be attached to the table.
  ///
  /// When you attach a resource-based policy while creating a table, the policy
  /// application is <i>strongly consistent</i>.
  ///
  /// The maximum size supported for a resource-based policy document is 20 KB.
  /// DynamoDB counts whitespaces when calculating the size of a policy against
  /// this limit. For a full list of all considerations that apply for
  /// resource-based policies, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html">Resource-based
  /// policy considerations</a>.
  /// <note>
  /// You need to specify the <code>CreateTable</code> and
  /// <code>PutResourcePolicy</code> IAM actions for authorizing a user to
  /// create a table with a resource-based policy.
  /// </note>
  ///
  /// Parameter [sSESpecification] :
  /// Represents the settings used to enable server-side encryption.
  ///
  /// Parameter [streamSpecification] :
  /// The settings for DynamoDB Streams on the table. These settings consist of:
  ///
  /// <ul>
  /// <li>
  /// <code>StreamEnabled</code> - Indicates whether DynamoDB Streams is to be
  /// enabled (true) or disabled (false).
  /// </li>
  /// <li>
  /// <code>StreamViewType</code> - When an item in the table is modified,
  /// <code>StreamViewType</code> determines what information is written to the
  /// table's stream. Valid values for <code>StreamViewType</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the key attributes of the modified item are
  /// written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - The entire item, as it appears after it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - The entire item, as it appeared before it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of
  /// the item are written to the stream.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tableClass] :
  /// The table class of the new table. Valid values are <code>STANDARD</code>
  /// and <code>STANDARD_INFREQUENT_ACCESS</code>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the table. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a>.
  Future<CreateTableOutput> createTable({
    required List<AttributeDefinition> attributeDefinitions,
    required List<KeySchemaElement> keySchema,
    required String tableName,
    BillingMode? billingMode,
    bool? deletionProtectionEnabled,
    List<GlobalSecondaryIndex>? globalSecondaryIndexes,
    List<LocalSecondaryIndex>? localSecondaryIndexes,
    OnDemandThroughput? onDemandThroughput,
    ProvisionedThroughput? provisionedThroughput,
    String? resourcePolicy,
    SSESpecification? sSESpecification,
    StreamSpecification? streamSpecification,
    TableClass? tableClass,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttributeDefinitions': attributeDefinitions,
        'KeySchema': keySchema,
        'TableName': tableName,
        if (billingMode != null) 'BillingMode': billingMode.toValue(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (globalSecondaryIndexes != null)
          'GlobalSecondaryIndexes': globalSecondaryIndexes,
        if (localSecondaryIndexes != null)
          'LocalSecondaryIndexes': localSecondaryIndexes,
        if (onDemandThroughput != null)
          'OnDemandThroughput': onDemandThroughput,
        if (provisionedThroughput != null)
          'ProvisionedThroughput': provisionedThroughput,
        if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
        if (sSESpecification != null) 'SSESpecification': sSESpecification,
        if (streamSpecification != null)
          'StreamSpecification': streamSpecification,
        if (tableClass != null) 'TableClass': tableClass.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTableOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an existing backup of a table.
  ///
  /// You can call <code>DeleteBackup</code> at a maximum rate of 10 times per
  /// second.
  ///
  /// May throw [BackupNotFoundException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The ARN associated with the backup.
  Future<DeleteBackupOutput> deleteBackup({
    required String backupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
      },
    );

    return DeleteBackupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a single item in a table by primary key. You can perform a
  /// conditional delete operation that deletes the item if it exists, or if it
  /// has an expected attribute value.
  ///
  /// In addition to deleting an item, you can also return the item's attribute
  /// values in the same operation, using the <code>ReturnValues</code>
  /// parameter.
  ///
  /// Unless you specify conditions, the <code>DeleteItem</code> is an
  /// idempotent operation; running it multiple times on the same item or
  /// attribute does <i>not</i> result in an error response.
  ///
  /// Conditional deletes are useful for deleting items only if specific
  /// conditions are met. If those conditions are met, DynamoDB performs the
  /// delete. Otherwise, the item is not deleted.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the primary key of the item to delete.
  ///
  /// For the primary key, you must provide all of the key attributes. For
  /// example, with a simple primary key, you only need to provide a value for
  /// the partition key. For a composite primary key, you must provide values
  /// for both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table from which to delete the item. You can also provide
  /// the Amazon Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional
  /// <code>DeleteItem</code> to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information about condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appeared before they were deleted. For <code>DeleteItem</code>, the
  /// valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - The content of the old item is returned.
  /// </li>
  /// </ul>
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  /// <note>
  /// The <code>ReturnValues</code> parameter is used by several DynamoDB
  /// operations; however, <code>DeleteItem</code> does not recognize any values
  /// other than <code>NONE</code> or <code>ALL_OLD</code>.
  /// </note>
  ///
  /// Parameter [returnValuesOnConditionCheckFailure] :
  /// An optional parameter that returns the item attributes for a
  /// <code>DeleteItem</code> operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  Future<DeleteItemOutput> deleteItem({
    required Map<String, AttributeValue> key,
    required String tableName,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValue>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, AttributeValue>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
    ReturnValuesOnConditionCheckFailure? returnValuesOnConditionCheckFailure,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteItem'
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
        if (conditionExpression != null)
          'ConditionExpression': conditionExpression,
        if (conditionalOperator != null)
          'ConditionalOperator': conditionalOperator.toValue(),
        if (expected != null) 'Expected': expected,
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (expressionAttributeValues != null)
          'ExpressionAttributeValues': expressionAttributeValues,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnItemCollectionMetrics != null)
          'ReturnItemCollectionMetrics': returnItemCollectionMetrics.toValue(),
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
        if (returnValuesOnConditionCheckFailure != null)
          'ReturnValuesOnConditionCheckFailure':
              returnValuesOnConditionCheckFailure.toValue(),
      },
    );

    return DeleteItemOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the resource-based policy attached to the resource, which can be a
  /// table or stream.
  ///
  /// <code>DeleteResourcePolicy</code> is an idempotent operation; running it
  /// multiple times on the same resource <i>doesn't</i> result in an error
  /// response, unless you specify an <code>ExpectedRevisionId</code>, which
  /// will then return a <code>PolicyNotFoundException</code>.
  /// <important>
  /// To make sure that you don't inadvertently lock yourself out of your own
  /// resources, the root principal in your Amazon Web Services account can
  /// perform <code>DeleteResourcePolicy</code> requests, even if your
  /// resource-based policy explicitly denies the root principal's access.
  /// </important> <note>
  /// <code>DeleteResourcePolicy</code> is an asynchronous operation. If you
  /// issue a <code>GetResourcePolicy</code> request immediately after running
  /// the <code>DeleteResourcePolicy</code> request, DynamoDB might still return
  /// the deleted policy. This is because the policy for your resource might not
  /// have been deleted yet. Wait for a few seconds, and then try the
  /// <code>GetResourcePolicy</code> request again.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [PolicyNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the DynamoDB resource from which the
  /// policy will be removed. The resources you can specify include tables and
  /// streams. If you remove the policy of a table, it will also remove the
  /// permissions for the table's indexes defined in that policy document. This
  /// is because index permissions are defined in the table's policy.
  ///
  /// Parameter [expectedRevisionId] :
  /// A string value that you can use to conditionally delete your policy. When
  /// you provide an expected revision ID, if the revision ID of the existing
  /// policy on the resource doesn't match or if there's no policy attached to
  /// the resource, the request will fail and return a
  /// <code>PolicyNotFoundException</code>.
  Future<DeleteResourcePolicyOutput> deleteResourcePolicy({
    required String resourceArn,
    String? expectedRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (expectedRevisionId != null)
          'ExpectedRevisionId': expectedRevisionId,
      },
    );

    return DeleteResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// The <code>DeleteTable</code> operation deletes a table and all of its
  /// items. After a <code>DeleteTable</code> request, the specified table is in
  /// the <code>DELETING</code> state until DynamoDB completes the deletion. If
  /// the table is in the <code>ACTIVE</code> state, you can delete it. If a
  /// table is in <code>CREATING</code> or <code>UPDATING</code> states, then
  /// DynamoDB returns a <code>ResourceInUseException</code>. If the specified
  /// table does not exist, DynamoDB returns a
  /// <code>ResourceNotFoundException</code>. If table is already in the
  /// <code>DELETING</code> state, no error is returned.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </important> <note>
  /// DynamoDB might continue to accept data read and write operations, such as
  /// <code>GetItem</code> and <code>PutItem</code>, on a table in the
  /// <code>DELETING</code> state until the table deletion is complete.
  /// </note>
  /// When you delete a table, any indexes on that table are also deleted.
  ///
  /// If you have DynamoDB Streams enabled on the table, then the corresponding
  /// stream on that table goes into the <code>DISABLED</code> state, and the
  /// stream is automatically deleted after 24 hours.
  ///
  /// Use the <code>DescribeTable</code> action to check the status of the
  /// table.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to delete. You can also provide the Amazon Resource
  /// Name (ARN) of the table in this parameter.
  Future<DeleteTableOutput> deleteTable({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteTable'
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

  /// Describes an existing backup of a table.
  ///
  /// You can call <code>DescribeBackup</code> at a maximum rate of 10 times per
  /// second.
  ///
  /// May throw [BackupNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The Amazon Resource Name (ARN) associated with the backup.
  Future<DescribeBackupOutput> describeBackup({
    required String backupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
      },
    );

    return DescribeBackupOutput.fromJson(jsonResponse.body);
  }

  /// Checks the status of continuous backups and point in time recovery on the
  /// specified table. Continuous backups are <code>ENABLED</code> on all tables
  /// at table creation. If point in time recovery is enabled,
  /// <code>PointInTimeRecoveryStatus</code> will be set to ENABLED.
  ///
  /// After continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>.
  ///
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time. You can restore your table to any point in time during the
  /// last 35 days.
  ///
  /// You can call <code>DescribeContinuousBackups</code> at a maximum rate of
  /// 10 times per second.
  ///
  /// May throw [TableNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// Name of the table for which the customer wants to check the continuous
  /// backups and point in time recovery settings.
  ///
  /// You can also provide the Amazon Resource Name (ARN) of the table in this
  /// parameter.
  Future<DescribeContinuousBackupsOutput> describeContinuousBackups({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeContinuousBackups'
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

    return DescribeContinuousBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about contributor insights for a given table or global
  /// secondary index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to describe. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [indexName] :
  /// The name of the global secondary index to describe, if applicable.
  Future<DescribeContributorInsightsOutput> describeContributorInsights({
    required String tableName,
    String? indexName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeContributorInsights'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        if (indexName != null) 'IndexName': indexName,
      },
    );

    return DescribeContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Returns the regional endpoint information. For more information on policy
  /// permissions, please see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/inter-network-traffic-privacy.html#inter-network-traffic-DescribeEndpoints">Internetwork
  /// traffic privacy</a>.
  Future<DescribeEndpointsResponse> describeEndpoints() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeEndpoints'
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

  /// Describes an existing table export.
  ///
  /// May throw [ExportNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) associated with the export.
  Future<DescribeExportOutput> describeExport({
    required String exportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportArn': exportArn,
      },
    );

    return DescribeExportOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified global table.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important>
  ///
  /// May throw [InternalServerError].
  /// May throw [GlobalTableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table.
  Future<DescribeGlobalTableOutput> describeGlobalTable({
    required String globalTableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
      },
    );

    return DescribeGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// Describes Region-specific settings for a global table.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important>
  ///
  /// May throw [GlobalTableNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table to describe.
  Future<DescribeGlobalTableSettingsOutput> describeGlobalTableSettings({
    required String globalTableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeGlobalTableSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
      },
    );

    return DescribeGlobalTableSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Represents the properties of the import.
  ///
  /// May throw [ImportNotFoundException].
  ///
  /// Parameter [importArn] :
  /// The Amazon Resource Name (ARN) associated with the table you're importing
  /// to.
  Future<DescribeImportOutput> describeImport({
    required String importArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImportArn': importArn,
      },
    );

    return DescribeImportOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the status of Kinesis streaming.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table being described. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  Future<DescribeKinesisStreamingDestinationOutput>
      describeKinesisStreamingDestination({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeKinesisStreamingDestination'
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

    return DescribeKinesisStreamingDestinationOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns the current provisioned-capacity quotas for your Amazon Web
  /// Services account in a Region, both for the Region as a whole and for any
  /// one DynamoDB table that you create there.
  ///
  /// When you establish an Amazon Web Services account, the account has initial
  /// quotas on the maximum read capacity units and write capacity units that
  /// you can provision across all of your DynamoDB tables in a given Region.
  /// Also, there are per-table quotas that apply when you create a table there.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> page in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// Although you can increase these quotas by filing a case at <a
  /// href="https://console.aws.amazon.com/support/home#/">Amazon Web Services
  /// Support Center</a>, obtaining the increase is not instantaneous. The
  /// <code>DescribeLimits</code> action lets you write code to compare the
  /// capacity you are currently using to those quotas imposed by your account
  /// so that you have enough time to apply for an increase before you hit a
  /// quota.
  ///
  /// For example, you could use one of the Amazon Web Services SDKs to do the
  /// following:
  /// <ol>
  /// <li>
  /// Call <code>DescribeLimits</code> for a particular Region to obtain your
  /// current account quotas on provisioned capacity there.
  /// </li>
  /// <li>
  /// Create a variable to hold the aggregate read capacity units provisioned
  /// for all your tables in that Region, and one to hold the aggregate write
  /// capacity units. Zero them both.
  /// </li>
  /// <li>
  /// Call <code>ListTables</code> to obtain a list of all your DynamoDB tables.
  /// </li>
  /// <li>
  /// For each table name listed by <code>ListTables</code>, do the following:
  ///
  /// <ul>
  /// <li>
  /// Call <code>DescribeTable</code> with the table name.
  /// </li>
  /// <li>
  /// Use the data returned by <code>DescribeTable</code> to add the read
  /// capacity units and write capacity units provisioned for the table itself
  /// to your variables.
  /// </li>
  /// <li>
  /// If the table has one or more global secondary indexes (GSIs), loop over
  /// these GSIs and add their provisioned capacity values to your variables as
  /// well.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Report the account quotas for that Region returned by
  /// <code>DescribeLimits</code>, along with the total current provisioned
  /// capacity levels you have calculated.
  /// </li> </ol>
  /// This will let you see whether you are getting close to your account-level
  /// quotas.
  ///
  /// The per-table quotas apply only when you are creating a new table. They
  /// restrict the sum of the provisioned capacity of the new table itself and
  /// all its global secondary indexes.
  ///
  /// For existing tables and their GSIs, DynamoDB doesn't let you increase
  /// provisioned capacity extremely rapidly, but the only quota that applies is
  /// that the aggregate provisioned capacity over all your tables and GSIs
  /// cannot exceed either of the per-account quotas.
  /// <note>
  /// <code>DescribeLimits</code> should only be called periodically. You can
  /// expect throttling errors if you call it more than once in a minute.
  /// </note>
  /// The <code>DescribeLimits</code> Request element has no content.
  ///
  /// May throw [InternalServerError].
  Future<DescribeLimitsOutput> describeLimits() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeLimitsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the table, including the current status of the
  /// table, when it was created, the primary key schema, and any indexes on the
  /// table.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </important> <note>
  /// If you issue a <code>DescribeTable</code> request immediately after a
  /// <code>CreateTable</code> request, DynamoDB might return a
  /// <code>ResourceNotFoundException</code>. This is because
  /// <code>DescribeTable</code> uses an eventually consistent query, and the
  /// metadata for your table might not be available at that moment. Wait for a
  /// few seconds, and then try the <code>DescribeTable</code> request again.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to describe. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  Future<DescribeTableOutput> describeTable({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTable'
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

  /// Describes auto scaling settings across replicas of the global table at
  /// once.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table. You can also provide the Amazon Resource Name (ARN)
  /// of the table in this parameter.
  Future<DescribeTableReplicaAutoScalingOutput>
      describeTableReplicaAutoScaling({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTableReplicaAutoScaling'
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

    return DescribeTableReplicaAutoScalingOutput.fromJson(jsonResponse.body);
  }

  /// Gives a description of the Time to Live (TTL) status on the specified
  /// table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be described. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  Future<DescribeTimeToLiveOutput> describeTimeToLive({
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTimeToLive'
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

    return DescribeTimeToLiveOutput.fromJson(jsonResponse.body);
  }

  /// Stops replication from the DynamoDB table to the Kinesis data stream. This
  /// is done without deleting either of the resources.
  ///
  /// May throw [InternalServerError].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [streamArn] :
  /// The ARN for a Kinesis data stream.
  ///
  /// Parameter [tableName] :
  /// The name of the DynamoDB table. You can also provide the Amazon Resource
  /// Name (ARN) of the table in this parameter.
  ///
  /// Parameter [enableKinesisStreamingConfiguration] :
  /// The source for the Kinesis streaming information that is being enabled.
  Future<KinesisStreamingDestinationOutput> disableKinesisStreamingDestination({
    required String streamArn,
    required String tableName,
    EnableKinesisStreamingConfiguration? enableKinesisStreamingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DisableKinesisStreamingDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamArn': streamArn,
        'TableName': tableName,
        if (enableKinesisStreamingConfiguration != null)
          'EnableKinesisStreamingConfiguration':
              enableKinesisStreamingConfiguration,
      },
    );

    return KinesisStreamingDestinationOutput.fromJson(jsonResponse.body);
  }

  /// Starts table data replication to the specified Kinesis data stream at a
  /// timestamp chosen during the enable workflow. If this operation doesn't
  /// return results immediately, use DescribeKinesisStreamingDestination to
  /// check if streaming to the Kinesis data stream is ACTIVE.
  ///
  /// May throw [InternalServerError].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [streamArn] :
  /// The ARN for a Kinesis data stream.
  ///
  /// Parameter [tableName] :
  /// The name of the DynamoDB table. You can also provide the Amazon Resource
  /// Name (ARN) of the table in this parameter.
  ///
  /// Parameter [enableKinesisStreamingConfiguration] :
  /// The source for the Kinesis streaming information that is being enabled.
  Future<KinesisStreamingDestinationOutput> enableKinesisStreamingDestination({
    required String streamArn,
    required String tableName,
    EnableKinesisStreamingConfiguration? enableKinesisStreamingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.EnableKinesisStreamingDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamArn': streamArn,
        'TableName': tableName,
        if (enableKinesisStreamingConfiguration != null)
          'EnableKinesisStreamingConfiguration':
              enableKinesisStreamingConfiguration,
      },
    );

    return KinesisStreamingDestinationOutput.fromJson(jsonResponse.body);
  }

  /// This operation allows you to perform reads and singleton writes on data
  /// stored in DynamoDB, using PartiQL.
  ///
  /// For PartiQL reads (<code>SELECT</code> statement), if the total number of
  /// processed items exceeds the maximum dataset size limit of 1 MB, the read
  /// stops and results are returned to the user as a
  /// <code>LastEvaluatedKey</code> value to continue the read in a subsequent
  /// operation. If the filter criteria in <code>WHERE</code> clause does not
  /// match any data, the read will return an empty result set.
  ///
  /// A single <code>SELECT</code> statement response can return up to the
  /// maximum number of items (if using the Limit parameter) or a maximum of 1
  /// MB of data (and then apply any filtering to the results using
  /// <code>WHERE</code> clause). If <code>LastEvaluatedKey</code> is present in
  /// the response, you need to paginate the result set. If
  /// <code>NextToken</code> is present, you need to paginate the result set and
  /// include <code>NextToken</code>.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [DuplicateItemException].
  ///
  /// Parameter [statement] :
  /// The PartiQL statement representing the operation to run.
  ///
  /// Parameter [consistentRead] :
  /// The consistency of a read operation. If set to <code>true</code>, then a
  /// strongly consistent read is used; otherwise, an eventually consistent read
  /// is used.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the
  /// matching values up to that point, along with a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation so you
  /// can pick up where you left off. Also, if the processed dataset size
  /// exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
  /// and returns the matching values up to the limit, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the operation.
  ///
  /// Parameter [nextToken] :
  /// Set this value to get remaining results, if <code>NextToken</code> was
  /// returned in the statement response.
  ///
  /// Parameter [parameters] :
  /// The parameters for the PartiQL statement, if any.
  ///
  /// Parameter [returnValuesOnConditionCheckFailure] :
  /// An optional parameter that returns the item attributes for an
  /// <code>ExecuteStatement</code> operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  Future<ExecuteStatementOutput> executeStatement({
    required String statement,
    bool? consistentRead,
    int? limit,
    String? nextToken,
    List<AttributeValue>? parameters,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnValuesOnConditionCheckFailure? returnValuesOnConditionCheckFailure,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ExecuteStatement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Statement': statement,
        if (consistentRead != null) 'ConsistentRead': consistentRead,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (parameters != null) 'Parameters': parameters,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnValuesOnConditionCheckFailure != null)
          'ReturnValuesOnConditionCheckFailure':
              returnValuesOnConditionCheckFailure.toValue(),
      },
    );

    return ExecuteStatementOutput.fromJson(jsonResponse.body);
  }

  /// This operation allows you to perform transactional reads or writes on data
  /// stored in DynamoDB, using PartiQL.
  /// <note>
  /// The entire transaction must consist of either read statements or write
  /// statements, you cannot mix both in one transaction. The EXISTS function is
  /// an exception and can be used to check the condition of specific attributes
  /// of the item in a similar manner to <code>ConditionCheck</code> in the <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/transaction-apis.html#transaction-apis-txwriteitems">TransactWriteItems</a>
  /// API.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransactionCanceledException].
  /// May throw [TransactionInProgressException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [transactStatements] :
  /// The list of PartiQL statements representing the transaction to run.
  ///
  /// Parameter [clientRequestToken] :
  /// Set this value to get remaining results, if <code>NextToken</code> was
  /// returned in the statement response.
  ///
  /// Parameter [returnConsumedCapacity] :
  /// Determines the level of detail about either provisioned or on-demand
  /// throughput consumption that is returned in the response. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactGetItems.html">TransactGetItems</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactWriteItems.html">TransactWriteItems</a>.
  Future<ExecuteTransactionOutput> executeTransaction({
    required List<ParameterizedStatement> transactStatements,
    String? clientRequestToken,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ExecuteTransaction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransactStatements': transactStatements,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
      },
    );

    return ExecuteTransactionOutput.fromJson(jsonResponse.body);
  }

  /// Exports table data to an S3 bucket. The table must have point in time
  /// recovery enabled, and you can export data from any time within the point
  /// in time recovery window.
  ///
  /// May throw [TableNotFoundException].
  /// May throw [PointInTimeRecoveryUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidExportTimeException].
  /// May throw [ExportConflictException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [s3Bucket] :
  /// The name of the Amazon S3 bucket to export the snapshot to.
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) associated with the table to export.
  ///
  /// Parameter [clientToken] :
  /// Providing a <code>ClientToken</code> makes the call to
  /// <code>ExportTableToPointInTimeInput</code> idempotent, meaning that
  /// multiple identical calls have the same effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// is completed. After 8 hours, any request with the same client token is
  /// treated as a new request. Do not resubmit the same request with the same
  /// client token for more than 8 hours, or the result might not be idempotent.
  ///
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 8-hour idempotency window, DynamoDB returns an
  /// <code>ImportConflictException</code>.
  ///
  /// Parameter [exportFormat] :
  /// The format for the exported data. Valid values for
  /// <code>ExportFormat</code> are <code>DYNAMODB_JSON</code> or
  /// <code>ION</code>.
  ///
  /// Parameter [exportTime] :
  /// Time in the past from which to export table data, counted in seconds from
  /// the start of the Unix epoch. The table export will be a snapshot of the
  /// table's state at this point in time.
  ///
  /// Parameter [exportType] :
  /// Choice of whether to execute as a full export or incremental export. Valid
  /// values are FULL_EXPORT or INCREMENTAL_EXPORT. The default value is
  /// FULL_EXPORT. If INCREMENTAL_EXPORT is provided, the
  /// IncrementalExportSpecification must also be used.
  ///
  /// Parameter [incrementalExportSpecification] :
  /// Optional object containing the parameters specific to an incremental
  /// export.
  ///
  /// Parameter [s3BucketOwner] :
  /// The ID of the Amazon Web Services account that owns the bucket the export
  /// will be stored in.
  /// <note>
  /// S3BucketOwner is a required parameter when exporting to a S3 bucket in
  /// another account.
  /// </note>
  ///
  /// Parameter [s3Prefix] :
  /// The Amazon S3 bucket prefix to use as the file name and path of the
  /// exported snapshot.
  ///
  /// Parameter [s3SseAlgorithm] :
  /// Type of encryption used on the bucket where export data will be stored.
  /// Valid values for <code>S3SseAlgorithm</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>AES256</code> - server-side encryption with Amazon S3 managed keys
  /// </li>
  /// <li>
  /// <code>KMS</code> - server-side encryption with KMS managed keys
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3SseKmsKeyId] :
  /// The ID of the KMS managed key used to encrypt the S3 bucket where export
  /// data will be stored (if applicable).
  Future<ExportTableToPointInTimeOutput> exportTableToPointInTime({
    required String s3Bucket,
    required String tableArn,
    String? clientToken,
    ExportFormat? exportFormat,
    DateTime? exportTime,
    ExportType? exportType,
    IncrementalExportSpecification? incrementalExportSpecification,
    String? s3BucketOwner,
    String? s3Prefix,
    S3SseAlgorithm? s3SseAlgorithm,
    String? s3SseKmsKeyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ExportTableToPointInTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'S3Bucket': s3Bucket,
        'TableArn': tableArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (exportFormat != null) 'ExportFormat': exportFormat.toValue(),
        if (exportTime != null) 'ExportTime': unixTimestampToJson(exportTime),
        if (exportType != null) 'ExportType': exportType.toValue(),
        if (incrementalExportSpecification != null)
          'IncrementalExportSpecification': incrementalExportSpecification,
        if (s3BucketOwner != null) 'S3BucketOwner': s3BucketOwner,
        if (s3Prefix != null) 'S3Prefix': s3Prefix,
        if (s3SseAlgorithm != null) 'S3SseAlgorithm': s3SseAlgorithm.toValue(),
        if (s3SseKmsKeyId != null) 'S3SseKmsKeyId': s3SseKmsKeyId,
      },
    );

    return ExportTableToPointInTimeOutput.fromJson(jsonResponse.body);
  }

  /// The <code>GetItem</code> operation returns a set of attributes for the
  /// item with the given primary key. If there is no matching item,
  /// <code>GetItem</code> does not return any data and there will be no
  /// <code>Item</code> element in the response.
  ///
  /// <code>GetItem</code> provides an eventually consistent read by default. If
  /// your application requires a strongly consistent read, set
  /// <code>ConsistentRead</code> to <code>true</code>. Although a strongly
  /// consistent read might take more time than an eventually consistent read,
  /// it always returns the last updated value.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the primary key of the item to retrieve.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested item. You can also provide
  /// the Amazon Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// Determines the read consistency model: If set to <code>true</code>, then
  /// the operation uses strongly consistent reads; otherwise, the operation
  /// uses eventually consistent reads.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// table. These attributes can include scalars, sets, or elements of a JSON
  /// document. The attributes in the expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes are returned. If
  /// any of the requested attributes are not found, they do not appear in the
  /// result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  Future<GetItemOutput> getItem({
    required Map<String, AttributeValue> key,
    required String tableName,
    List<String>? attributesToGet,
    bool? consistentRead,
    Map<String, String>? expressionAttributeNames,
    String? projectionExpression,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.GetItem'
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
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (projectionExpression != null)
          'ProjectionExpression': projectionExpression,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
      },
    );

    return GetItemOutput.fromJson(jsonResponse.body);
  }

  /// Returns the resource-based policy document attached to the resource, which
  /// can be a table or stream, in JSON format.
  ///
  /// <code>GetResourcePolicy</code> follows an <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html">
  /// <i>eventually consistent</i> </a> model. The following list describes the
  /// outcomes when you issue the <code>GetResourcePolicy</code> request
  /// immediately after issuing another request:
  ///
  /// <ul>
  /// <li>
  /// If you issue a <code>GetResourcePolicy</code> request immediately after a
  /// <code>PutResourcePolicy</code> request, DynamoDB might return a
  /// <code>PolicyNotFoundException</code>.
  /// </li>
  /// <li>
  /// If you issue a <code>GetResourcePolicy</code>request immediately after a
  /// <code>DeleteResourcePolicy</code> request, DynamoDB might return the
  /// policy that was present before the deletion request.
  /// </li>
  /// <li>
  /// If you issue a <code>GetResourcePolicy</code> request immediately after a
  /// <code>CreateTable</code> request, which includes a resource-based policy,
  /// DynamoDB might return a <code>ResourceNotFoundException</code> or a
  /// <code>PolicyNotFoundException</code>.
  /// </li>
  /// </ul>
  /// Because <code>GetResourcePolicy</code> uses an <i>eventually
  /// consistent</i> query, the metadata for your policy or table might not be
  /// available at that moment. Wait for a few seconds, and then retry the
  /// <code>GetResourcePolicy</code> request.
  ///
  /// After a <code>GetResourcePolicy</code> request returns a policy created
  /// using the <code>PutResourcePolicy</code> request, the policy will be
  /// applied in the authorization of requests to the resource. Because this
  /// process is eventually consistent, it will take some time to apply the
  /// policy to all requests to a resource. Policies that you attach while
  /// creating a table using the <code>CreateTable</code> request will always be
  /// applied to all requests for that table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [PolicyNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the DynamoDB resource to which the
  /// policy is attached. The resources you can specify include tables and
  /// streams.
  Future<GetResourcePolicyOutput> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return GetResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Imports table data from an S3 bucket.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [ImportConflictException].
  ///
  /// Parameter [inputFormat] :
  /// The format of the source data. Valid values for <code>ImportFormat</code>
  /// are <code>CSV</code>, <code>DYNAMODB_JSON</code> or <code>ION</code>.
  ///
  /// Parameter [s3BucketSource] :
  /// The S3 bucket that provides the source for the import.
  ///
  /// Parameter [tableCreationParameters] :
  /// Parameters for the table to import the data into.
  ///
  /// Parameter [clientToken] :
  /// Providing a <code>ClientToken</code> makes the call to
  /// <code>ImportTableInput</code> idempotent, meaning that multiple identical
  /// calls have the same effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// is completed. After 8 hours, any request with the same client token is
  /// treated as a new request. Do not resubmit the same request with the same
  /// client token for more than 8 hours, or the result might not be idempotent.
  ///
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 8-hour idempotency window, DynamoDB returns an
  /// <code>IdempotentParameterMismatch</code> exception.
  ///
  /// Parameter [inputCompressionType] :
  /// Type of compression to be used on the input coming from the imported
  /// table.
  ///
  /// Parameter [inputFormatOptions] :
  /// Additional properties that specify how the input is formatted,
  Future<ImportTableOutput> importTable({
    required InputFormat inputFormat,
    required S3BucketSource s3BucketSource,
    required TableCreationParameters tableCreationParameters,
    String? clientToken,
    InputCompressionType? inputCompressionType,
    InputFormatOptions? inputFormatOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ImportTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InputFormat': inputFormat.toValue(),
        'S3BucketSource': s3BucketSource,
        'TableCreationParameters': tableCreationParameters,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (inputCompressionType != null)
          'InputCompressionType': inputCompressionType.toValue(),
        if (inputFormatOptions != null)
          'InputFormatOptions': inputFormatOptions,
      },
    );

    return ImportTableOutput.fromJson(jsonResponse.body);
  }

  /// List DynamoDB backups that are associated with an Amazon Web Services
  /// account and weren't made with Amazon Web Services Backup. To list these
  /// backups for a given table, specify <code>TableName</code>.
  /// <code>ListBackups</code> returns a paginated list of results with at most
  /// 1 MB worth of items in a page. You can also specify a maximum number of
  /// entries to be returned in a page.
  ///
  /// In the request, start time is inclusive, but end time is exclusive. Note
  /// that these boundaries are for the time at which the original backup was
  /// requested.
  ///
  /// You can call <code>ListBackups</code> a maximum of five times per second.
  ///
  /// If you want to retrieve the complete list of backups made with Amazon Web
  /// Services Backup, use the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_ListBackupJobs.html">Amazon
  /// Web Services Backup list API.</a>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupType] :
  /// The backups from the table specified by <code>BackupType</code> are
  /// listed.
  ///
  /// Where <code>BackupType</code> can be:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - On-demand backup created by you. (The default setting
  /// if no other backup types are specified.)
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - On-demand backup automatically created by DynamoDB.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All types of on-demand backups (USER and SYSTEM).
  /// </li>
  /// </ul>
  ///
  /// Parameter [exclusiveStartBackupArn] :
  /// <code>LastEvaluatedBackupArn</code> is the Amazon Resource Name (ARN) of
  /// the backup last evaluated when the current page of results was returned,
  /// inclusive of the current page of results. This value may be specified as
  /// the <code>ExclusiveStartBackupArn</code> of a new <code>ListBackups</code>
  /// operation in order to fetch the next page of results.
  ///
  /// Parameter [limit] :
  /// Maximum number of backups to return at once.
  ///
  /// Parameter [tableName] :
  /// Lists the backups from the table specified in <code>TableName</code>. You
  /// can also provide the Amazon Resource Name (ARN) of the table in this
  /// parameter.
  ///
  /// Parameter [timeRangeLowerBound] :
  /// Only backups created after this time are listed.
  /// <code>TimeRangeLowerBound</code> is inclusive.
  ///
  /// Parameter [timeRangeUpperBound] :
  /// Only backups created before this time are listed.
  /// <code>TimeRangeUpperBound</code> is exclusive.
  Future<ListBackupsOutput> listBackups({
    BackupTypeFilter? backupType,
    String? exclusiveStartBackupArn,
    int? limit,
    String? tableName,
    DateTime? timeRangeLowerBound,
    DateTime? timeRangeUpperBound,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (backupType != null) 'BackupType': backupType.toValue(),
        if (exclusiveStartBackupArn != null)
          'ExclusiveStartBackupArn': exclusiveStartBackupArn,
        if (limit != null) 'Limit': limit,
        if (tableName != null) 'TableName': tableName,
        if (timeRangeLowerBound != null)
          'TimeRangeLowerBound': unixTimestampToJson(timeRangeLowerBound),
        if (timeRangeUpperBound != null)
          'TimeRangeUpperBound': unixTimestampToJson(timeRangeUpperBound),
      },
    );

    return ListBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of ContributorInsightsSummary for a table and all its
  /// global secondary indexes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to for the desired page, if there is one.
  ///
  /// Parameter [tableName] :
  /// The name of the table. You can also provide the Amazon Resource Name (ARN)
  /// of the table in this parameter.
  Future<ListContributorInsightsOutput> listContributorInsights({
    int? maxResults,
    String? nextToken,
    String? tableName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListContributorInsights'
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
        if (tableName != null) 'TableName': tableName,
      },
    );

    return ListContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Lists completed exports within the past 90 days.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to <code>ListExports</code>. When provided in this manner,
  /// the API fetches the next page of results.
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) associated with the exported table.
  Future<ListExportsOutput> listExports({
    int? maxResults,
    String? nextToken,
    String? tableArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListExports'
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
        if (tableArn != null) 'TableArn': tableArn,
      },
    );

    return ListExportsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all global tables that have a replica in the specified Region.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartGlobalTableName] :
  /// The first global table name that this operation will evaluate.
  ///
  /// Parameter [limit] :
  /// The maximum number of table names to return, if the parameter is not
  /// specified DynamoDB defaults to 100.
  ///
  /// If the number of global tables DynamoDB finds reaches this limit, it stops
  /// the operation and returns the table names collected up to that point, with
  /// a table name in the <code>LastEvaluatedGlobalTableName</code> to apply in
  /// a subsequent operation to the <code>ExclusiveStartGlobalTableName</code>
  /// parameter.
  ///
  /// Parameter [regionName] :
  /// Lists the global tables in a specific Region.
  Future<ListGlobalTablesOutput> listGlobalTables({
    String? exclusiveStartGlobalTableName,
    int? limit,
    String? regionName,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListGlobalTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartGlobalTableName != null)
          'ExclusiveStartGlobalTableName': exclusiveStartGlobalTableName,
        if (limit != null) 'Limit': limit,
        if (regionName != null) 'RegionName': regionName,
      },
    );

    return ListGlobalTablesOutput.fromJson(jsonResponse.body);
  }

  /// Lists completed imports within the past 90 days.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to <code>ListImports</code>. When provided in this manner,
  /// the API fetches the next page of results.
  ///
  /// Parameter [pageSize] :
  /// The number of <code>ImportSummary </code>objects returned in a single
  /// page.
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) associated with the table that was imported
  /// to.
  Future<ListImportsOutput> listImports({
    String? nextToken,
    int? pageSize,
    String? tableArn,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListImports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
        if (tableArn != null) 'TableArn': tableArn,
      },
    );

    return ListImportsOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of table names associated with the current account and
  /// endpoint. The output from <code>ListTables</code> is paginated, with each
  /// page returning a maximum of 100 table names.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartTableName] :
  /// The first table name that this operation will evaluate. Use the value that
  /// was returned for <code>LastEvaluatedTableName</code> in a previous
  /// operation, so that you can obtain the next page of results.
  ///
  /// Parameter [limit] :
  /// A maximum number of table names to return. If this parameter is not
  /// specified, the limit is 100.
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
      'X-Amz-Target': 'DynamoDB_20120810.ListTables'
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

  /// List all tags on an Amazon DynamoDB resource. You can call
  /// ListTagsOfResource up to 10 times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon DynamoDB resource with tags to be listed. This value is an
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListTagOfResource. When provided in this manner, this API
  /// fetches the next page of results.
  Future<ListTagsOfResourceOutput> listTagsOfResource({
    required String resourceArn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListTagsOfResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsOfResourceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new item, or replaces an old item with a new item. If an item
  /// that has the same primary key as the new item already exists in the
  /// specified table, the new item completely replaces the existing item. You
  /// can perform a conditional put operation (add a new item if one with the
  /// specified primary key doesn't exist), or replace an existing item if it
  /// has certain attribute values. You can return the item's attribute values
  /// in the same operation, using the <code>ReturnValues</code> parameter.
  ///
  /// When you add an item, the primary key attributes are the only required
  /// attributes.
  ///
  /// Empty String and Binary attribute values are allowed. Attribute values of
  /// type String and Binary must have a length greater than zero if the
  /// attribute is used as a key attribute for a table or index. Set type
  /// attributes cannot be empty.
  ///
  /// Invalid Requests with empty values will be rejected with a
  /// <code>ValidationException</code> exception.
  /// <note>
  /// To prevent a new item from replacing an existing item, use a conditional
  /// expression that contains the <code>attribute_not_exists</code> function
  /// with the name of the attribute being used as the partition key for the
  /// table. Since every record must contain that attribute, the
  /// <code>attribute_not_exists</code> function will only succeed if no
  /// matching item exists.
  /// </note>
  /// For more information about <code>PutItem</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html">Working
  /// with Items</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [item] :
  /// A map of attribute name/value pairs, one for each attribute. Only the
  /// primary key attributes are required; you can optionally provide other
  /// attribute name-value pairs for the item.
  ///
  /// You must provide all of the attributes for the primary key. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide both values
  /// for both the partition key and the sort key.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  ///
  /// Empty String and Binary attribute values are allowed. Attribute values of
  /// type String and Binary must have a length greater than zero if the
  /// attribute is used as a key attribute for a table or index.
  ///
  /// For more information about primary keys, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey">Primary
  /// Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Each element in the <code>Item</code> map is an
  /// <code>AttributeValue</code> object.
  ///
  /// Parameter [tableName] :
  /// The name of the table to contain the item. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional
  /// <code>PutItem</code> operation to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information on condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appeared before they were updated with the <code>PutItem</code>
  /// request. For <code>PutItem</code>, the valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - If <code>PutItem</code> overwrote an attribute
  /// name-value pair, then the content of the old item is returned.
  /// </li>
  /// </ul>
  /// The values returned are strongly consistent.
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  /// <note>
  /// The <code>ReturnValues</code> parameter is used by several DynamoDB
  /// operations; however, <code>PutItem</code> does not recognize any values
  /// other than <code>NONE</code> or <code>ALL_OLD</code>.
  /// </note>
  ///
  /// Parameter [returnValuesOnConditionCheckFailure] :
  /// An optional parameter that returns the item attributes for a
  /// <code>PutItem</code> operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  Future<PutItemOutput> putItem({
    required Map<String, AttributeValue> item,
    required String tableName,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValue>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, AttributeValue>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
    ReturnValuesOnConditionCheckFailure? returnValuesOnConditionCheckFailure,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.PutItem'
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
        if (conditionExpression != null)
          'ConditionExpression': conditionExpression,
        if (conditionalOperator != null)
          'ConditionalOperator': conditionalOperator.toValue(),
        if (expected != null) 'Expected': expected,
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (expressionAttributeValues != null)
          'ExpressionAttributeValues': expressionAttributeValues,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnItemCollectionMetrics != null)
          'ReturnItemCollectionMetrics': returnItemCollectionMetrics.toValue(),
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
        if (returnValuesOnConditionCheckFailure != null)
          'ReturnValuesOnConditionCheckFailure':
              returnValuesOnConditionCheckFailure.toValue(),
      },
    );

    return PutItemOutput.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based policy document to the resource, which can be a
  /// table or stream. When you attach a resource-based policy using this API,
  /// the policy application is <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html">
  /// <i>eventually consistent</i> </a>.
  ///
  /// <code>PutResourcePolicy</code> is an idempotent operation; running it
  /// multiple times on the same resource using the same policy document will
  /// return the same revision ID. If you specify an
  /// <code>ExpectedRevisionId</code> that doesn't match the current policy's
  /// <code>RevisionId</code>, the <code>PolicyNotFoundException</code> will be
  /// returned.
  /// <note>
  /// <code>PutResourcePolicy</code> is an asynchronous operation. If you issue
  /// a <code>GetResourcePolicy</code> request immediately after a
  /// <code>PutResourcePolicy</code> request, DynamoDB might return your
  /// previous policy, if there was one, or return the
  /// <code>PolicyNotFoundException</code>. This is because
  /// <code>GetResourcePolicy</code> uses an eventually consistent query, and
  /// the metadata for your policy or table might not be available at that
  /// moment. Wait for a few seconds, and then try the
  /// <code>GetResourcePolicy</code> request again.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [LimitExceededException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [policy] :
  /// An Amazon Web Services resource-based policy document in JSON format.
  ///
  /// <ul>
  /// <li>
  /// The maximum size supported for a resource-based policy document is 20 KB.
  /// DynamoDB counts whitespaces when calculating the size of a policy against
  /// this limit.
  /// </li>
  /// <li>
  /// Within a resource-based policy, if the action for a DynamoDB
  /// service-linked role (SLR) to replicate data for a global table is denied,
  /// adding or deleting a replica will fail with an error.
  /// </li>
  /// </ul>
  /// For a full list of all considerations that apply while attaching a
  /// resource-based policy, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html">Resource-based
  /// policy considerations</a>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the DynamoDB resource to which the
  /// policy will be attached. The resources you can specify include tables and
  /// streams.
  ///
  /// You can control index permissions using the base table's policy. To
  /// specify the same permission level for your table and its indexes, you can
  /// provide both the table and index Amazon Resource Name (ARN)s in the
  /// <code>Resource</code> field of a given <code>Statement</code> in your
  /// policy document. Alternatively, to specify different permissions for your
  /// table, indexes, or both, you can define multiple <code>Statement</code>
  /// fields in your policy document.
  ///
  /// Parameter [confirmRemoveSelfResourceAccess] :
  /// Set this parameter to <code>true</code> to confirm that you want to remove
  /// your permissions to change the policy of this resource in the future.
  ///
  /// Parameter [expectedRevisionId] :
  /// A string value that you can use to conditionally update your policy. You
  /// can provide the revision ID of your existing policy to make mutating
  /// requests against that policy.
  /// <note>
  /// When you provide an expected revision ID, if the revision ID of the
  /// existing policy on the resource doesn't match or if there's no policy
  /// attached to the resource, your request will be rejected with a
  /// <code>PolicyNotFoundException</code>.
  /// </note>
  /// To conditionally attach a policy when no policy exists for the resource,
  /// specify <code>NO_POLICY</code> for the revision ID.
  Future<PutResourcePolicyOutput> putResourcePolicy({
    required String policy,
    required String resourceArn,
    bool? confirmRemoveSelfResourceAccess,
    String? expectedRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        'ResourceArn': resourceArn,
        if (confirmRemoveSelfResourceAccess != null)
          'ConfirmRemoveSelfResourceAccess': confirmRemoveSelfResourceAccess,
        if (expectedRevisionId != null)
          'ExpectedRevisionId': expectedRevisionId,
      },
    );

    return PutResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// You must provide the name of the partition key attribute and a single
  /// value for that attribute. <code>Query</code> returns all items with that
  /// partition key value. Optionally, you can provide a sort key attribute and
  /// use a comparison operator to refine the search results.
  ///
  /// Use the <code>KeyConditionExpression</code> parameter to provide a
  /// specific value for the partition key. The <code>Query</code> operation
  /// will return all of the items from the table or index with that partition
  /// key value. You can optionally narrow the scope of the <code>Query</code>
  /// operation by specifying a sort key value and a comparison operator in
  /// <code>KeyConditionExpression</code>. To further refine the
  /// <code>Query</code> results, you can optionally provide a
  /// <code>FilterExpression</code>. A <code>FilterExpression</code> determines
  /// which items within the results should be returned to you. All of the other
  /// results are discarded.
  ///
  /// A <code>Query</code> operation always returns a result set. If no matching
  /// items are found, the result set will be empty. Queries that do not return
  /// results consume the minimum number of read capacity units for that type of
  /// read operation.
  /// <note>
  /// DynamoDB calculates the number of read capacity units consumed based on
  /// item size, not on the amount of data that is returned to an application.
  /// The number of capacity units consumed will be the same whether you request
  /// all of the attributes (the default behavior) or just some of them (using a
  /// projection expression). The number will also be the same whether or not
  /// you use a <code>FilterExpression</code>.
  /// </note>
  /// <code>Query</code> results are always sorted by the sort key value. If the
  /// data type of the sort key is Number, the results are returned in numeric
  /// order; otherwise, the results are returned in order of UTF-8 bytes. By
  /// default, the sort order is ascending. To reverse the order, set the
  /// <code>ScanIndexForward</code> parameter to false.
  ///
  /// A single <code>Query</code> operation will read up to the maximum number
  /// of items set (if using the <code>Limit</code> parameter) or a maximum of 1
  /// MB of data and then apply any filtering to the results using
  /// <code>FilterExpression</code>. If <code>LastEvaluatedKey</code> is present
  /// in the response, you will need to paginate the result set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.html#Query.Pagination">Paginating
  /// the Results</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// <code>FilterExpression</code> is applied after a <code>Query</code>
  /// finishes, but before the results are returned. A
  /// <code>FilterExpression</code> cannot contain partition key or sort key
  /// attributes. You need to specify those attributes in the
  /// <code>KeyConditionExpression</code>.
  /// <note>
  /// A <code>Query</code> operation can return an empty result set and a
  /// <code>LastEvaluatedKey</code> if all the items read for the page of
  /// results are filtered out.
  /// </note>
  /// You can query a table, a local secondary index, or a global secondary
  /// index. For a query on a table or on a local secondary index, you can set
  /// the <code>ConsistentRead</code> parameter to <code>true</code> and obtain
  /// a strongly consistent result. Global secondary indexes support eventually
  /// consistent reads only, so do not specify <code>ConsistentRead</code> when
  /// querying a global secondary index.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested items. You can also provide
  /// the Amazon Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// Determines the read consistency model: If set to <code>true</code>, then
  /// the operation uses strongly consistent reads; otherwise, the operation
  /// uses eventually consistent reads.
  ///
  /// Strongly consistent reads are not supported on global secondary indexes.
  /// If you query a global secondary index with <code>ConsistentRead</code> set
  /// to <code>true</code>, you will receive a <code>ValidationException</code>.
  ///
  /// Parameter [exclusiveStartKey] :
  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for <code>LastEvaluatedKey</code> in the
  /// previous operation.
  ///
  /// The data type for <code>ExclusiveStartKey</code> must be String, Number,
  /// or Binary. No set data types are allowed.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying
  /// Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [filterExpression] :
  /// A string that contains conditions that DynamoDB applies after the
  /// <code>Query</code> operation, but before the data is returned to you.
  /// Items that do not satisfy the <code>FilterExpression</code> criteria are
  /// not returned.
  ///
  /// A <code>FilterExpression</code> does not allow key attributes. You cannot
  /// define a filter expression based on a partition key or a sort key.
  /// <note>
  /// A <code>FilterExpression</code> is applied after the items have already
  /// been read; the process of filtering does not consume any additional read
  /// capacity units.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.FilterExpression.html">Filter
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [indexName] :
  /// The name of an index to query. This index can be any local secondary index
  /// or global secondary index on the table. Note that if you use the
  /// <code>IndexName</code> parameter, you must also provide
  /// <code>TableName.</code>
  ///
  /// Parameter [keyConditionExpression] :
  /// The condition that specifies the key values for items to be retrieved by
  /// the <code>Query</code> action.
  ///
  /// The condition must perform an equality test on a single partition key
  /// value.
  ///
  /// The condition can optionally perform one of several comparison tests on a
  /// single sort key value. This allows <code>Query</code> to retrieve one item
  /// with a given partition key value and sort key value, or several items that
  /// have the same partition key value but different sort key values.
  ///
  /// The partition key equality test is required, and must be specified in the
  /// following format:
  ///
  /// <code>partitionKeyName</code> <i>=</i> <code>:partitionkeyval</code>
  ///
  /// If you also want to provide a condition for the sort key, it must be
  /// combined using <code>AND</code> with the condition for the sort key.
  /// Following is an example, using the <b>=</b> comparison operator for the
  /// sort key:
  ///
  /// <code>partitionKeyName</code> <code>=</code> <code>:partitionkeyval</code>
  /// <code>AND</code> <code>sortKeyName</code> <code>=</code>
  /// <code>:sortkeyval</code>
  ///
  /// Valid comparisons for the sort key condition are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>sortKeyName</code> <code>=</code> <code>:sortkeyval</code> - true if
  /// the sort key value is equal to <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&lt;</code> <code>:sortkeyval</code> - true
  /// if the sort key value is less than <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&lt;=</code> <code>:sortkeyval</code> -
  /// true if the sort key value is less than or equal to
  /// <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&gt;</code> <code>:sortkeyval</code> - true
  /// if the sort key value is greater than <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&gt;= </code> <code>:sortkeyval</code> -
  /// true if the sort key value is greater than or equal to
  /// <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>BETWEEN</code> <code>:sortkeyval1</code>
  /// <code>AND</code> <code>:sortkeyval2</code> - true if the sort key value is
  /// greater than or equal to <code>:sortkeyval1</code>, and less than or equal
  /// to <code>:sortkeyval2</code>.
  /// </li>
  /// <li>
  /// <code>begins_with (</code> <code>sortKeyName</code>,
  /// <code>:sortkeyval</code> <code>)</code> - true if the sort key value
  /// begins with a particular operand. (You cannot use this function with a
  /// sort key that is of type Number.) Note that the function name
  /// <code>begins_with</code> is case-sensitive.
  /// </li>
  /// </ul>
  /// Use the <code>ExpressionAttributeValues</code> parameter to replace tokens
  /// such as <code>:partitionval</code> and <code>:sortval</code> with actual
  /// values at runtime.
  ///
  /// You can optionally use the <code>ExpressionAttributeNames</code> parameter
  /// to replace the names of the partition key and sort key with placeholder
  /// tokens. This option might be necessary if an attribute name conflicts with
  /// a DynamoDB reserved word. For example, the following
  /// <code>KeyConditionExpression</code> parameter causes an error because
  /// <i>Size</i> is a reserved word:
  ///
  /// <ul>
  /// <li>
  /// <code>Size = :myval</code>
  /// </li>
  /// </ul>
  /// To work around this, define a placeholder (such a <code>#S</code>) to
  /// represent the attribute name <i>Size</i>.
  /// <code>KeyConditionExpression</code> then is as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>#S = :myval</code>
  /// </li>
  /// </ul>
  /// For a list of reserved words, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// For more information on <code>ExpressionAttributeNames</code> and
  /// <code>ExpressionAttributeValues</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using
  /// Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB
  /// Developer Guide</i>.
  ///
  /// Parameter [keyConditions] :
  /// This is a legacy parameter. Use <code>KeyConditionExpression</code>
  /// instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html">KeyConditions</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the
  /// matching values up to that point, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that
  /// you can pick up where you left off. Also, if the processed dataset size
  /// exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
  /// and returns the matching values up to the limit, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Query
  /// and Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// table. These attributes can include scalars, sets, or elements of a JSON
  /// document. The attributes in the expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [queryFilter] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html">QueryFilter</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [scanIndexForward] :
  /// Specifies the order for index traversal: If <code>true</code> (default),
  /// the traversal is performed in ascending order; if <code>false</code>, the
  /// traversal is performed in descending order.
  ///
  /// Items with the same partition key value are stored in sorted order by sort
  /// key. If the sort key data type is Number, the results are stored in
  /// numeric order. For type String, the results are stored in order of UTF-8
  /// bytes. For type Binary, DynamoDB treats each byte of the binary data as
  /// unsigned.
  ///
  /// If <code>ScanIndexForward</code> is <code>true</code>, DynamoDB returns
  /// the results in the order in which they are stored (by sort key value).
  /// This is the default behavior. If <code>ScanIndexForward</code> is
  /// <code>false</code>, DynamoDB reads the results in reverse order by sort
  /// key value, and then returns the results to the client.
  ///
  /// Parameter [select] :
  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  /// </li>
  /// <li>
  /// <code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an
  /// index. Retrieves all attributes that have been projected into the index.
  /// If the index is configured to project all attributes, this return value is
  /// equivalent to specifying <code>ALL_ATTRIBUTES</code>.
  /// </li>
  /// <li>
  /// <code>COUNT</code> - Returns the number of matching items, rather than the
  /// matching items themselves. Note that this uses the same quantity of read
  /// capacity units as getting the items, and is subject to the same item size
  /// calculations.
  /// </li>
  /// <li>
  /// <code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in
  /// <code>ProjectionExpression</code>. This return value is equivalent to
  /// specifying <code>ProjectionExpression</code> without specifying any value
  /// for <code>Select</code>.
  ///
  /// If you query or scan a local secondary index and request only attributes
  /// that are projected into that index, the operation will read only the index
  /// and not the table. If any of the requested attributes are not projected
  /// into the local secondary index, DynamoDB fetches each of these attributes
  /// from the parent table. This extra fetching incurs additional throughput
  /// cost and latency.
  ///
  /// If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  /// </li>
  /// </ul>
  /// If neither <code>Select</code> nor <code>ProjectionExpression</code> are
  /// specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing
  /// a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an
  /// index. You cannot use both <code>Select</code> and
  /// <code>ProjectionExpression</code> together in a single request, unless the
  /// value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This
  /// usage is equivalent to specifying <code>ProjectionExpression</code>
  /// without any value for <code>Select</code>.)
  /// <note>
  /// If you use the <code>ProjectionExpression</code> parameter, then the value
  /// for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any
  /// other value for <code>Select</code> will return an error.
  /// </note>
  Future<QueryOutput> query({
    required String tableName,
    List<String>? attributesToGet,
    ConditionalOperator? conditionalOperator,
    bool? consistentRead,
    Map<String, AttributeValue>? exclusiveStartKey,
    Map<String, String>? expressionAttributeNames,
    Map<String, AttributeValue>? expressionAttributeValues,
    String? filterExpression,
    String? indexName,
    String? keyConditionExpression,
    Map<String, Condition>? keyConditions,
    int? limit,
    String? projectionExpression,
    Map<String, Condition>? queryFilter,
    ReturnConsumedCapacity? returnConsumedCapacity,
    bool? scanIndexForward,
    Select? select,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.Query'
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
        if (conditionalOperator != null)
          'ConditionalOperator': conditionalOperator.toValue(),
        if (consistentRead != null) 'ConsistentRead': consistentRead,
        if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (expressionAttributeValues != null)
          'ExpressionAttributeValues': expressionAttributeValues,
        if (filterExpression != null) 'FilterExpression': filterExpression,
        if (indexName != null) 'IndexName': indexName,
        if (keyConditionExpression != null)
          'KeyConditionExpression': keyConditionExpression,
        if (keyConditions != null) 'KeyConditions': keyConditions,
        if (limit != null) 'Limit': limit,
        if (projectionExpression != null)
          'ProjectionExpression': projectionExpression,
        if (queryFilter != null) 'QueryFilter': queryFilter,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (scanIndexForward != null) 'ScanIndexForward': scanIndexForward,
        if (select != null) 'Select': select.toValue(),
      },
    );

    return QueryOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new table from an existing backup. Any number of users can
  /// execute up to 50 concurrent restores (any type of restore) in a given
  /// account.
  ///
  /// You can call <code>RestoreTableFromBackup</code> at a maximum rate of 10
  /// times per second.
  ///
  /// You must manually set up the following on the restored table:
  ///
  /// <ul>
  /// <li>
  /// Auto scaling policies
  /// </li>
  /// <li>
  /// IAM policies
  /// </li>
  /// <li>
  /// Amazon CloudWatch metrics and alarms
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// <li>
  /// Stream settings
  /// </li>
  /// <li>
  /// Time to Live (TTL) settings
  /// </li>
  /// </ul>
  ///
  /// May throw [TableAlreadyExistsException].
  /// May throw [TableInUseException].
  /// May throw [BackupNotFoundException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The Amazon Resource Name (ARN) associated with the backup.
  ///
  /// Parameter [targetTableName] :
  /// The name of the new table to which the backup must be restored.
  ///
  /// Parameter [billingModeOverride] :
  /// The billing mode of the restored table.
  ///
  /// Parameter [globalSecondaryIndexOverride] :
  /// List of global secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [localSecondaryIndexOverride] :
  /// List of local secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [provisionedThroughputOverride] :
  /// Provisioned throughput settings for the restored table.
  ///
  /// Parameter [sSESpecificationOverride] :
  /// The new server-side encryption settings for the restored table.
  Future<RestoreTableFromBackupOutput> restoreTableFromBackup({
    required String backupArn,
    required String targetTableName,
    BillingMode? billingModeOverride,
    List<GlobalSecondaryIndex>? globalSecondaryIndexOverride,
    List<LocalSecondaryIndex>? localSecondaryIndexOverride,
    OnDemandThroughput? onDemandThroughputOverride,
    ProvisionedThroughput? provisionedThroughputOverride,
    SSESpecification? sSESpecificationOverride,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.RestoreTableFromBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
        'TargetTableName': targetTableName,
        if (billingModeOverride != null)
          'BillingModeOverride': billingModeOverride.toValue(),
        if (globalSecondaryIndexOverride != null)
          'GlobalSecondaryIndexOverride': globalSecondaryIndexOverride,
        if (localSecondaryIndexOverride != null)
          'LocalSecondaryIndexOverride': localSecondaryIndexOverride,
        if (onDemandThroughputOverride != null)
          'OnDemandThroughputOverride': onDemandThroughputOverride,
        if (provisionedThroughputOverride != null)
          'ProvisionedThroughputOverride': provisionedThroughputOverride,
        if (sSESpecificationOverride != null)
          'SSESpecificationOverride': sSESpecificationOverride,
      },
    );

    return RestoreTableFromBackupOutput.fromJson(jsonResponse.body);
  }

  /// Restores the specified table to the specified point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>. You can restore your table to any
  /// point in time during the last 35 days. Any number of users can execute up
  /// to 50 concurrent restores (any type of restore) in a given account.
  ///
  /// When you restore using point in time recovery, DynamoDB restores your
  /// table data to the state based on the selected date and time
  /// (day:hour:minute:second) to a new table.
  ///
  /// Along with data, the following are also included on the new restored table
  /// using point in time recovery:
  ///
  /// <ul>
  /// <li>
  /// Global secondary indexes (GSIs)
  /// </li>
  /// <li>
  /// Local secondary indexes (LSIs)
  /// </li>
  /// <li>
  /// Provisioned read and write capacity
  /// </li>
  /// <li>
  /// Encryption settings
  /// <important>
  /// All these settings come from the current settings of the source table at
  /// the time of restore.
  /// </important> </li>
  /// </ul>
  /// You must manually set up the following on the restored table:
  ///
  /// <ul>
  /// <li>
  /// Auto scaling policies
  /// </li>
  /// <li>
  /// IAM policies
  /// </li>
  /// <li>
  /// Amazon CloudWatch metrics and alarms
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// <li>
  /// Stream settings
  /// </li>
  /// <li>
  /// Time to Live (TTL) settings
  /// </li>
  /// <li>
  /// Point in time recovery settings
  /// </li>
  /// </ul>
  ///
  /// May throw [TableAlreadyExistsException].
  /// May throw [TableNotFoundException].
  /// May throw [TableInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRestoreTimeException].
  /// May throw [PointInTimeRecoveryUnavailableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [targetTableName] :
  /// The name of the new table to which it must be restored to.
  ///
  /// Parameter [billingModeOverride] :
  /// The billing mode of the restored table.
  ///
  /// Parameter [globalSecondaryIndexOverride] :
  /// List of global secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [localSecondaryIndexOverride] :
  /// List of local secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [provisionedThroughputOverride] :
  /// Provisioned throughput settings for the restored table.
  ///
  /// Parameter [restoreDateTime] :
  /// Time in the past to restore the table to.
  ///
  /// Parameter [sSESpecificationOverride] :
  /// The new server-side encryption settings for the restored table.
  ///
  /// Parameter [sourceTableArn] :
  /// The DynamoDB table that will be restored. This value is an Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [sourceTableName] :
  /// Name of the source table that is being restored.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// Restore the table to the latest possible time.
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time.
  Future<RestoreTableToPointInTimeOutput> restoreTableToPointInTime({
    required String targetTableName,
    BillingMode? billingModeOverride,
    List<GlobalSecondaryIndex>? globalSecondaryIndexOverride,
    List<LocalSecondaryIndex>? localSecondaryIndexOverride,
    OnDemandThroughput? onDemandThroughputOverride,
    ProvisionedThroughput? provisionedThroughputOverride,
    DateTime? restoreDateTime,
    SSESpecification? sSESpecificationOverride,
    String? sourceTableArn,
    String? sourceTableName,
    bool? useLatestRestorableTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.RestoreTableToPointInTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetTableName': targetTableName,
        if (billingModeOverride != null)
          'BillingModeOverride': billingModeOverride.toValue(),
        if (globalSecondaryIndexOverride != null)
          'GlobalSecondaryIndexOverride': globalSecondaryIndexOverride,
        if (localSecondaryIndexOverride != null)
          'LocalSecondaryIndexOverride': localSecondaryIndexOverride,
        if (onDemandThroughputOverride != null)
          'OnDemandThroughputOverride': onDemandThroughputOverride,
        if (provisionedThroughputOverride != null)
          'ProvisionedThroughputOverride': provisionedThroughputOverride,
        if (restoreDateTime != null)
          'RestoreDateTime': unixTimestampToJson(restoreDateTime),
        if (sSESpecificationOverride != null)
          'SSESpecificationOverride': sSESpecificationOverride,
        if (sourceTableArn != null) 'SourceTableArn': sourceTableArn,
        if (sourceTableName != null) 'SourceTableName': sourceTableName,
        if (useLatestRestorableTime != null)
          'UseLatestRestorableTime': useLatestRestorableTime,
      },
    );

    return RestoreTableToPointInTimeOutput.fromJson(jsonResponse.body);
  }

  /// The <code>Scan</code> operation returns one or more items and item
  /// attributes by accessing every item in a table or a secondary index. To
  /// have DynamoDB return fewer items, you can provide a
  /// <code>FilterExpression</code> operation.
  ///
  /// If the total size of scanned items exceeds the maximum dataset size limit
  /// of 1 MB, the scan completes and results are returned to the user. The
  /// <code>LastEvaluatedKey</code> value is also returned and the requestor can
  /// use the <code>LastEvaluatedKey</code> to continue the scan in a subsequent
  /// operation. Each scan response also includes number of items that were
  /// scanned (ScannedCount) as part of the request. If using a
  /// <code>FilterExpression</code>, a scan result can result in no items
  /// meeting the criteria and the <code>Count</code> will result in zero. If
  /// you did not use a <code>FilterExpression</code> in the scan request, then
  /// <code>Count</code> is the same as <code>ScannedCount</code>.
  /// <note>
  /// <code>Count</code> and <code>ScannedCount</code> only return the count of
  /// items specific to a single scan request and, unless the table is less than
  /// 1MB, do not represent the total number of items in the table.
  /// </note>
  /// A single <code>Scan</code> operation first reads up to the maximum number
  /// of items set (if using the <code>Limit</code> parameter) or a maximum of 1
  /// MB of data and then applies any filtering to the results if a
  /// <code>FilterExpression</code> is provided. If
  /// <code>LastEvaluatedKey</code> is present in the response, pagination is
  /// required to complete the full table scan. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination">Paginating
  /// the Results</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// <code>Scan</code> operations proceed sequentially; however, for faster
  /// performance on a large table or secondary index, applications can request
  /// a parallel <code>Scan</code> operation by providing the
  /// <code>Segment</code> and <code>TotalSegments</code> parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.ParallelScan">Parallel
  /// Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// By default, a <code>Scan</code> uses eventually consistent reads when
  /// accessing the items in a table. Therefore, the results from an eventually
  /// consistent <code>Scan</code> may not include the latest item changes at
  /// the time the scan iterates through each item in the table. If you require
  /// a strongly consistent read of each item as the scan iterates through the
  /// items in the table, you can set the <code>ConsistentRead</code> parameter
  /// to true. Strong consistency only relates to the consistency of the read at
  /// the item level.
  /// <note>
  /// DynamoDB does not provide snapshot isolation for a scan operation when the
  /// <code>ConsistentRead</code> parameter is set to true. Thus, a DynamoDB
  /// scan operation does not guarantee that all reads in a scan see a
  /// consistent snapshot of the table when the scan operation was requested.
  /// </note>
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested items or if you provide
  /// <code>IndexName</code>, the name of the table to which that index belongs.
  ///
  /// You can also provide the Amazon Resource Name (ARN) of the table in this
  /// parameter.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// A Boolean value that determines the read consistency model during the
  /// scan:
  ///
  /// <ul>
  /// <li>
  /// If <code>ConsistentRead</code> is <code>false</code>, then the data
  /// returned from <code>Scan</code> might not contain the results from other
  /// recently completed write operations (<code>PutItem</code>,
  /// <code>UpdateItem</code>, or <code>DeleteItem</code>).
  /// </li>
  /// <li>
  /// If <code>ConsistentRead</code> is <code>true</code>, then all of the write
  /// operations that completed before the <code>Scan</code> began are
  /// guaranteed to be contained in the <code>Scan</code> response.
  /// </li>
  /// </ul>
  /// The default setting for <code>ConsistentRead</code> is <code>false</code>.
  ///
  /// The <code>ConsistentRead</code> parameter is not supported on global
  /// secondary indexes. If you scan a global secondary index with
  /// <code>ConsistentRead</code> set to true, you will receive a
  /// <code>ValidationException</code>.
  ///
  /// Parameter [exclusiveStartKey] :
  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for <code>LastEvaluatedKey</code> in the
  /// previous operation.
  ///
  /// The data type for <code>ExclusiveStartKey</code> must be String, Number or
  /// Binary. No set data types are allowed.
  ///
  /// In a parallel scan, a <code>Scan</code> request that includes
  /// <code>ExclusiveStartKey</code> must specify the same segment whose
  /// previous <code>Scan</code> returned the corresponding value of
  /// <code>LastEvaluatedKey</code>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <code>ProductStatus</code> attribute was one of the
  /// following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [filterExpression] :
  /// A string that contains conditions that DynamoDB applies after the
  /// <code>Scan</code> operation, but before the data is returned to you. Items
  /// that do not satisfy the <code>FilterExpression</code> criteria are not
  /// returned.
  /// <note>
  /// A <code>FilterExpression</code> is applied after the items have already
  /// been read; the process of filtering does not consume any additional read
  /// capacity units.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.FilterExpression">Filter
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [indexName] :
  /// The name of a secondary index to scan. This index can be any local
  /// secondary index or global secondary index. Note that if you use the
  /// <code>IndexName</code> parameter, you must also provide
  /// <code>TableName</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the
  /// matching values up to that point, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that
  /// you can pick up where you left off. Also, if the processed dataset size
  /// exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
  /// and returns the matching values up to the limit, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Working
  /// with Queries</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// specified table or index. These attributes can include scalars, sets, or
  /// elements of a JSON document. The attributes in the expression must be
  /// separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [scanFilter] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html">ScanFilter</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [segment] :
  /// For a parallel <code>Scan</code> request, <code>Segment</code> identifies
  /// an individual segment to be scanned by an application worker.
  ///
  /// Segment IDs are zero-based, so the first segment is always 0. For example,
  /// if you want to use four application threads to scan a table or an index,
  /// then the first thread specifies a <code>Segment</code> value of 0, the
  /// second thread specifies 1, and so on.
  ///
  /// The value of <code>LastEvaluatedKey</code> returned from a parallel
  /// <code>Scan</code> request must be used as <code>ExclusiveStartKey</code>
  /// with the same segment ID in a subsequent <code>Scan</code> operation.
  ///
  /// The value for <code>Segment</code> must be greater than or equal to 0, and
  /// less than the value provided for <code>TotalSegments</code>.
  ///
  /// If you provide <code>Segment</code>, you must also provide
  /// <code>TotalSegments</code>.
  ///
  /// Parameter [select] :
  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  /// </li>
  /// <li>
  /// <code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an
  /// index. Retrieves all attributes that have been projected into the index.
  /// If the index is configured to project all attributes, this return value is
  /// equivalent to specifying <code>ALL_ATTRIBUTES</code>.
  /// </li>
  /// <li>
  /// <code>COUNT</code> - Returns the number of matching items, rather than the
  /// matching items themselves. Note that this uses the same quantity of read
  /// capacity units as getting the items, and is subject to the same item size
  /// calculations.
  /// </li>
  /// <li>
  /// <code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in
  /// <code>ProjectionExpression</code>. This return value is equivalent to
  /// specifying <code>ProjectionExpression</code> without specifying any value
  /// for <code>Select</code>.
  ///
  /// If you query or scan a local secondary index and request only attributes
  /// that are projected into that index, the operation reads only the index and
  /// not the table. If any of the requested attributes are not projected into
  /// the local secondary index, DynamoDB fetches each of these attributes from
  /// the parent table. This extra fetching incurs additional throughput cost
  /// and latency.
  ///
  /// If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  /// </li>
  /// </ul>
  /// If neither <code>Select</code> nor <code>ProjectionExpression</code> are
  /// specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing
  /// a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an
  /// index. You cannot use both <code>Select</code> and
  /// <code>ProjectionExpression</code> together in a single request, unless the
  /// value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This
  /// usage is equivalent to specifying <code>ProjectionExpression</code>
  /// without any value for <code>Select</code>.)
  /// <note>
  /// If you use the <code>ProjectionExpression</code> parameter, then the value
  /// for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any
  /// other value for <code>Select</code> will return an error.
  /// </note>
  ///
  /// Parameter [totalSegments] :
  /// For a parallel <code>Scan</code> request, <code>TotalSegments</code>
  /// represents the total number of segments into which the <code>Scan</code>
  /// operation will be divided. The value of <code>TotalSegments</code>
  /// corresponds to the number of application workers that will perform the
  /// parallel scan. For example, if you want to use four application threads to
  /// scan a table or an index, specify a <code>TotalSegments</code> value of 4.
  ///
  /// The value for <code>TotalSegments</code> must be greater than or equal to
  /// 1, and less than or equal to 1000000. If you specify a
  /// <code>TotalSegments</code> value of 1, the <code>Scan</code> operation
  /// will be sequential rather than parallel.
  ///
  /// If you specify <code>TotalSegments</code>, you must also specify
  /// <code>Segment</code>.
  Future<ScanOutput> scan({
    required String tableName,
    List<String>? attributesToGet,
    ConditionalOperator? conditionalOperator,
    bool? consistentRead,
    Map<String, AttributeValue>? exclusiveStartKey,
    Map<String, String>? expressionAttributeNames,
    Map<String, AttributeValue>? expressionAttributeValues,
    String? filterExpression,
    String? indexName,
    int? limit,
    String? projectionExpression,
    ReturnConsumedCapacity? returnConsumedCapacity,
    Map<String, Condition>? scanFilter,
    int? segment,
    Select? select,
    int? totalSegments,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'segment',
      segment,
      0,
      999999,
    );
    _s.validateNumRange(
      'totalSegments',
      totalSegments,
      1,
      1000000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.Scan'
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
        if (conditionalOperator != null)
          'ConditionalOperator': conditionalOperator.toValue(),
        if (consistentRead != null) 'ConsistentRead': consistentRead,
        if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (expressionAttributeValues != null)
          'ExpressionAttributeValues': expressionAttributeValues,
        if (filterExpression != null) 'FilterExpression': filterExpression,
        if (indexName != null) 'IndexName': indexName,
        if (limit != null) 'Limit': limit,
        if (projectionExpression != null)
          'ProjectionExpression': projectionExpression,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (scanFilter != null) 'ScanFilter': scanFilter,
        if (segment != null) 'Segment': segment,
        if (select != null) 'Select': select.toValue(),
        if (totalSegments != null) 'TotalSegments': totalSegments,
      },
    );

    return ScanOutput.fromJson(jsonResponse.body);
  }

  /// Associate a set of tags with an Amazon DynamoDB resource. You can then
  /// activate these user-defined tags so that they appear on the Billing and
  /// Cost Management console for cost allocation tracking. You can call
  /// TagResource up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// Identifies the Amazon DynamoDB resource to which tags should be added.
  /// This value is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon DynamoDB resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// <code>TransactGetItems</code> is a synchronous operation that atomically
  /// retrieves multiple items from one or more tables (but not from indexes) in
  /// a single account and Region. A <code>TransactGetItems</code> call can
  /// contain up to 100 <code>TransactGetItem</code> objects, each of which
  /// contains a <code>Get</code> structure that specifies an item to retrieve
  /// from a table in the account and Region. A call to
  /// <code>TransactGetItems</code> cannot retrieve items from tables in more
  /// than one Amazon Web Services account or Region. The aggregate size of the
  /// items in the transaction cannot exceed 4 MB.
  ///
  /// DynamoDB rejects the entire <code>TransactGetItems</code> request if any
  /// of the following is true:
  ///
  /// <ul>
  /// <li>
  /// A conflicting operation is in the process of updating an item to be read.
  /// </li>
  /// <li>
  /// There is insufficient provisioned capacity for the transaction to be
  /// completed.
  /// </li>
  /// <li>
  /// There is a user error, such as an invalid data format.
  /// </li>
  /// <li>
  /// The aggregate size of the items in the transaction exceeded 4 MB.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransactionCanceledException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [transactItems] :
  /// An ordered array of up to 100 <code>TransactGetItem</code> objects, each
  /// of which contains a <code>Get</code> structure.
  ///
  /// Parameter [returnConsumedCapacity] :
  /// A value of <code>TOTAL</code> causes consumed capacity information to be
  /// returned, and a value of <code>NONE</code> prevents that information from
  /// being returned. No other value is valid.
  Future<TransactGetItemsOutput> transactGetItems({
    required List<TransactGetItem> transactItems,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TransactGetItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransactItems': transactItems,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
      },
    );

    return TransactGetItemsOutput.fromJson(jsonResponse.body);
  }

  /// <code>TransactWriteItems</code> is a synchronous write operation that
  /// groups up to 100 action requests. These actions can target items in
  /// different tables, but not in different Amazon Web Services accounts or
  /// Regions, and no two actions can target the same item. For example, you
  /// cannot both <code>ConditionCheck</code> and <code>Update</code> the same
  /// item. The aggregate size of the items in the transaction cannot exceed 4
  /// MB.
  ///
  /// The actions are completed atomically so that either all of them succeed,
  /// or all of them fail. They are defined by the following objects:
  ///
  /// <ul>
  /// <li>
  /// <code>Put</code>  —   Initiates a <code>PutItem</code> operation to write
  /// a new item. This structure specifies the primary key of the item to be
  /// written, the name of the table to write it in, an optional condition
  /// expression that must be satisfied for the write to succeed, a list of the
  /// item's attributes, and a field indicating whether to retrieve the item's
  /// attributes if the condition is not met.
  /// </li>
  /// <li>
  /// <code>Update</code>  —   Initiates an <code>UpdateItem</code> operation to
  /// update an existing item. This structure specifies the primary key of the
  /// item to be updated, the name of the table where it resides, an optional
  /// condition expression that must be satisfied for the update to succeed, an
  /// expression that defines one or more attributes to be updated, and a field
  /// indicating whether to retrieve the item's attributes if the condition is
  /// not met.
  /// </li>
  /// <li>
  /// <code>Delete</code>  —   Initiates a <code>DeleteItem</code> operation to
  /// delete an existing item. This structure specifies the primary key of the
  /// item to be deleted, the name of the table where it resides, an optional
  /// condition expression that must be satisfied for the deletion to succeed,
  /// and a field indicating whether to retrieve the item's attributes if the
  /// condition is not met.
  /// </li>
  /// <li>
  /// <code>ConditionCheck</code>  —   Applies a condition to an item that is
  /// not being modified by the transaction. This structure specifies the
  /// primary key of the item to be checked, the name of the table where it
  /// resides, a condition expression that must be satisfied for the transaction
  /// to succeed, and a field indicating whether to retrieve the item's
  /// attributes if the condition is not met.
  /// </li>
  /// </ul>
  /// DynamoDB rejects the entire <code>TransactWriteItems</code> request if any
  /// of the following is true:
  ///
  /// <ul>
  /// <li>
  /// A condition in one of the condition expressions is not met.
  /// </li>
  /// <li>
  /// An ongoing operation is in the process of updating the same item.
  /// </li>
  /// <li>
  /// There is insufficient provisioned capacity for the transaction to be
  /// completed.
  /// </li>
  /// <li>
  /// An item size becomes too large (bigger than 400 KB), a local secondary
  /// index (LSI) becomes too large, or a similar validation error occurs
  /// because of changes made by the transaction.
  /// </li>
  /// <li>
  /// The aggregate size of the items in the transaction exceeds 4 MB.
  /// </li>
  /// <li>
  /// There is a user error, such as an invalid data format.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransactionCanceledException].
  /// May throw [TransactionInProgressException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [transactItems] :
  /// An ordered array of up to 100 <code>TransactWriteItem</code> objects, each
  /// of which contains a <code>ConditionCheck</code>, <code>Put</code>,
  /// <code>Update</code>, or <code>Delete</code> object. These can operate on
  /// items in different tables, but the tables must reside in the same Amazon
  /// Web Services account and Region, and no two of them can operate on the
  /// same item.
  ///
  /// Parameter [clientRequestToken] :
  /// Providing a <code>ClientRequestToken</code> makes the call to
  /// <code>TransactWriteItems</code> idempotent, meaning that multiple
  /// identical calls have the same effect as one single call.
  ///
  /// Although multiple identical calls using the same client request token
  /// produce the same result on the server (no side effects), the responses to
  /// the calls might not be the same. If the
  /// <code>ReturnConsumedCapacity</code> parameter is set, then the initial
  /// <code>TransactWriteItems</code> call returns the amount of write capacity
  /// units consumed in making the changes. Subsequent
  /// <code>TransactWriteItems</code> calls with the same client token return
  /// the number of read capacity units consumed in reading the item.
  ///
  /// A client request token is valid for 10 minutes after the first request
  /// that uses it is completed. After 10 minutes, any request with the same
  /// client token is treated as a new request. Do not resubmit the same request
  /// with the same client token for more than 10 minutes, or the result might
  /// not be idempotent.
  ///
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 10-minute idempotency window, DynamoDB returns an
  /// <code>IdempotentParameterMismatch</code> exception.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item collections
  /// (if any), that were modified during the operation and are returned in the
  /// response. If set to <code>NONE</code> (the default), no statistics are
  /// returned.
  Future<TransactWriteItemsOutput> transactWriteItems({
    required List<TransactWriteItem> transactItems,
    String? clientRequestToken,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TransactWriteItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransactItems': transactItems,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnItemCollectionMetrics != null)
          'ReturnItemCollectionMetrics': returnItemCollectionMetrics.toValue(),
      },
    );

    return TransactWriteItemsOutput.fromJson(jsonResponse.body);
  }

  /// Removes the association of tags from an Amazon DynamoDB resource. You can
  /// call <code>UntagResource</code> up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The DynamoDB resource that the tags will be removed from. This value is an
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Existing tags of the resource whose keys are members
  /// of this list will be removed from the DynamoDB resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// <code>UpdateContinuousBackups</code> enables or disables point in time
  /// recovery for the specified table. A successful
  /// <code>UpdateContinuousBackups</code> call returns the current
  /// <code>ContinuousBackupsDescription</code>. Continuous backups are
  /// <code>ENABLED</code> on all tables at table creation. If point in time
  /// recovery is enabled, <code>PointInTimeRecoveryStatus</code> will be set to
  /// ENABLED.
  ///
  /// Once continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>.
  ///
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time. You can restore your table to any point in time during the
  /// last 35 days.
  ///
  /// May throw [TableNotFoundException].
  /// May throw [ContinuousBackupsUnavailableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [pointInTimeRecoverySpecification] :
  /// Represents the settings used to enable point in time recovery.
  ///
  /// Parameter [tableName] :
  /// The name of the table. You can also provide the Amazon Resource Name (ARN)
  /// of the table in this parameter.
  Future<UpdateContinuousBackupsOutput> updateContinuousBackups({
    required PointInTimeRecoverySpecification pointInTimeRecoverySpecification,
    required String tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateContinuousBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PointInTimeRecoverySpecification': pointInTimeRecoverySpecification,
        'TableName': tableName,
      },
    );

    return UpdateContinuousBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Updates the status for contributor insights for a specific table or index.
  /// CloudWatch Contributor Insights for DynamoDB graphs display the partition
  /// key and (if applicable) sort key of frequently accessed items and
  /// frequently throttled items in plaintext. If you require the use of Amazon
  /// Web Services Key Management Service (KMS) to encrypt this table’s
  /// partition key and sort key data with an Amazon Web Services managed key or
  /// customer managed key, you should not enable CloudWatch Contributor
  /// Insights for DynamoDB for this table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [contributorInsightsAction] :
  /// Represents the contributor insights action.
  ///
  /// Parameter [tableName] :
  /// The name of the table. You can also provide the Amazon Resource Name (ARN)
  /// of the table in this parameter.
  ///
  /// Parameter [indexName] :
  /// The global secondary index name, if applicable.
  Future<UpdateContributorInsightsOutput> updateContributorInsights({
    required ContributorInsightsAction contributorInsightsAction,
    required String tableName,
    String? indexName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateContributorInsights'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContributorInsightsAction': contributorInsightsAction.toValue(),
        'TableName': tableName,
        if (indexName != null) 'IndexName': indexName,
      },
    );

    return UpdateContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Adds or removes replicas in the specified global table. The global table
  /// must already exist to be able to use this operation. Any replica to be
  /// added must be empty, have the same name as the global table, have the same
  /// key schema, have DynamoDB Streams enabled, and have the same provisioned
  /// and maximum write capacity units.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important> <note>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version). If you are using global tables <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html">Version
  /// 2019.11.21</a> you can use <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateTable.html">UpdateTable</a>
  /// instead.
  ///
  /// Although you can use <code>UpdateGlobalTable</code> to add replicas and
  /// remove replicas in a single request, for simplicity we recommend that you
  /// issue separate requests for adding or removing replicas.
  /// </note>
  /// If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// <ul>
  /// <li>
  /// The global secondary indexes must have the same name.
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same hash key and sort key (if
  /// present).
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same provisioned and maximum
  /// write capacity units.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerError].
  /// May throw [GlobalTableNotFoundException].
  /// May throw [ReplicaAlreadyExistsException].
  /// May throw [ReplicaNotFoundException].
  /// May throw [TableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The global table name.
  ///
  /// Parameter [replicaUpdates] :
  /// A list of Regions that should be added or removed from the global table.
  Future<UpdateGlobalTableOutput> updateGlobalTable({
    required String globalTableName,
    required List<ReplicaUpdate> replicaUpdates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        'ReplicaUpdates': replicaUpdates,
      },
    );

    return UpdateGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// Updates settings for a global table.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version), as it provides greater flexibility,
  /// higher efficiency and consumes less write capacity than 2017.11.29
  /// (Legacy). To determine which version you are using, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html">Determining
  /// the version</a>. To update existing global tables from version 2017.11.29
  /// (Legacy) to version 2019.11.21 (Current), see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html">
  /// Updating global tables</a>.
  /// </important>
  ///
  /// May throw [GlobalTableNotFoundException].
  /// May throw [ReplicaNotFoundException].
  /// May throw [IndexNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table
  ///
  /// Parameter [globalTableBillingMode] :
  /// The billing mode of the global table. If
  /// <code>GlobalTableBillingMode</code> is not specified, the global table
  /// defaults to <code>PROVISIONED</code> capacity billing mode.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html">Provisioned
  /// capacity mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html">On-demand
  /// capacity mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [globalTableGlobalSecondaryIndexSettingsUpdate] :
  /// Represents the settings of a global secondary index for a global table
  /// that will be modified.
  ///
  /// Parameter [globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate] :
  /// Auto scaling settings for managing provisioned write capacity for the
  /// global table.
  ///
  /// Parameter [globalTableProvisionedWriteCapacityUnits] :
  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException.</code>
  ///
  /// Parameter [replicaSettingsUpdate] :
  /// Represents the settings for a global table in a Region that will be
  /// modified.
  Future<UpdateGlobalTableSettingsOutput> updateGlobalTableSettings({
    required String globalTableName,
    BillingMode? globalTableBillingMode,
    List<GlobalTableGlobalSecondaryIndexSettingsUpdate>?
        globalTableGlobalSecondaryIndexSettingsUpdate,
    AutoScalingSettingsUpdate?
        globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
    int? globalTableProvisionedWriteCapacityUnits,
    List<ReplicaSettingsUpdate>? replicaSettingsUpdate,
  }) async {
    _s.validateNumRange(
      'globalTableProvisionedWriteCapacityUnits',
      globalTableProvisionedWriteCapacityUnits,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateGlobalTableSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        if (globalTableBillingMode != null)
          'GlobalTableBillingMode': globalTableBillingMode.toValue(),
        if (globalTableGlobalSecondaryIndexSettingsUpdate != null)
          'GlobalTableGlobalSecondaryIndexSettingsUpdate':
              globalTableGlobalSecondaryIndexSettingsUpdate,
        if (globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate !=
            null)
          'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate':
              globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
        if (globalTableProvisionedWriteCapacityUnits != null)
          'GlobalTableProvisionedWriteCapacityUnits':
              globalTableProvisionedWriteCapacityUnits,
        if (replicaSettingsUpdate != null)
          'ReplicaSettingsUpdate': replicaSettingsUpdate,
      },
    );

    return UpdateGlobalTableSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Edits an existing item's attributes, or adds a new item to the table if it
  /// does not already exist. You can put, delete, or add attribute values. You
  /// can also perform a conditional update on an existing item (insert a new
  /// attribute name-value pair if it doesn't exist, or replace an existing
  /// name-value pair if it has certain expected attribute values).
  ///
  /// You can also return the item's attribute values in the same
  /// <code>UpdateItem</code> operation using the <code>ReturnValues</code>
  /// parameter.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the item to update. You can also provide
  /// the Amazon Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [attributeUpdates] :
  /// This is a legacy parameter. Use <code>UpdateExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html">AttributeUpdates</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information about condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying
  /// Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.) To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information about expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <code>ProductStatus</code> attribute was one of the
  /// following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appear before or after they are successfully updated. For
  /// <code>UpdateItem</code>, the valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - Returns all of the attributes of the item, as they
  /// appeared before the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>UPDATED_OLD</code> - Returns only the updated attributes, as they
  /// appeared before the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>ALL_NEW</code> - Returns all of the attributes of the item, as they
  /// appear after the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>UPDATED_NEW</code> - Returns only the updated attributes, as they
  /// appear after the UpdateItem operation.
  /// </li>
  /// </ul>
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  ///
  /// The values returned are strongly consistent.
  ///
  /// Parameter [returnValuesOnConditionCheckFailure] :
  /// An optional parameter that returns the item attributes for an
  /// <code>UpdateItem</code> operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  ///
  /// Parameter [updateExpression] :
  /// An expression that defines one or more attributes to be updated, the
  /// action to be performed on them, and new values for them.
  ///
  /// The following action values are available for
  /// <code>UpdateExpression</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>SET</code> - Adds one or more attributes and values to an item. If
  /// any of these attributes already exist, they are replaced by the new
  /// values. You can also use <code>SET</code> to add or subtract from an
  /// attribute that is of type Number. For example: <code>SET myNum = myNum +
  /// :val</code>
  ///
  /// <code>SET</code> supports the following functions:
  ///
  /// <ul>
  /// <li>
  /// <code>if_not_exists (path, operand)</code> - if the item does not contain
  /// an attribute at the specified path, then <code>if_not_exists</code>
  /// evaluates to operand; otherwise, it evaluates to path. You can use this
  /// function to avoid overwriting an attribute that may already be present in
  /// the item.
  /// </li>
  /// <li>
  /// <code>list_append (operand, operand)</code> - evaluates to a list with a
  /// new element added to it. You can append the new element to the start or
  /// the end of the list by reversing the order of the operands.
  /// </li>
  /// </ul>
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// <code>REMOVE</code> - Removes one or more attributes from an item.
  /// </li>
  /// <li>
  /// <code>ADD</code> - Adds the specified value to the item, if the attribute
  /// does not already exist. If the attribute does exist, then the behavior of
  /// <code>ADD</code> depends on the data type of the attribute:
  ///
  /// <ul>
  /// <li>
  /// If the existing attribute is a number, and if <code>Value</code> is also a
  /// number, then <code>Value</code> is mathematically added to the existing
  /// attribute. If <code>Value</code> is a negative number, then it is
  /// subtracted from the existing attribute.
  /// <note>
  /// If you use <code>ADD</code> to increment or decrement a number value for
  /// an item that doesn't exist before the update, DynamoDB uses <code>0</code>
  /// as the initial value.
  ///
  /// Similarly, if you use <code>ADD</code> for an existing item to increment
  /// or decrement an attribute value that doesn't exist before the update,
  /// DynamoDB uses <code>0</code> as the initial value. For example, suppose
  /// that the item you want to update doesn't have an attribute named
  /// <code>itemcount</code>, but you decide to <code>ADD</code> the number
  /// <code>3</code> to this attribute anyway. DynamoDB will create the
  /// <code>itemcount</code> attribute, set its initial value to <code>0</code>,
  /// and finally add <code>3</code> to it. The result will be a new
  /// <code>itemcount</code> attribute in the item, with a value of
  /// <code>3</code>.
  /// </note> </li>
  /// <li>
  /// If the existing data type is a set and if <code>Value</code> is also a
  /// set, then <code>Value</code> is added to the existing set. For example, if
  /// the attribute value is the set <code>[1,2]</code>, and the
  /// <code>ADD</code> action specified <code>[3]</code>, then the final
  /// attribute value is <code>[1,2,3]</code>. An error occurs if an
  /// <code>ADD</code> action is specified for a set attribute and the attribute
  /// type specified does not match the existing set type.
  ///
  /// Both sets must have the same primitive data type. For example, if the
  /// existing data type is a set of strings, the <code>Value</code> must also
  /// be a set of strings.
  /// </li>
  /// </ul> <important>
  /// The <code>ADD</code> action only supports Number and set data types. In
  /// addition, <code>ADD</code> can only be used on top-level attributes, not
  /// nested attributes.
  /// </important> </li>
  /// <li>
  /// <code>DELETE</code> - Deletes an element from a set.
  ///
  /// If a set of values is specified, then those values are subtracted from the
  /// old set. For example, if the attribute value was the set
  /// <code>[a,b,c]</code> and the <code>DELETE</code> action specifies
  /// <code>[a,c]</code>, then the final attribute value is <code>[b]</code>.
  /// Specifying an empty set is an error.
  /// <important>
  /// The <code>DELETE</code> action only supports set data types. In addition,
  /// <code>DELETE</code> can only be used on top-level attributes, not nested
  /// attributes.
  /// </important> </li>
  /// </ul>
  /// You can have many actions in a single expression, such as the following:
  /// <code>SET a=:value1, b=:value2 DELETE :value3, :value4, :value5</code>
  ///
  /// For more information on update expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html">Modifying
  /// Items and Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  Future<UpdateItemOutput> updateItem({
    required Map<String, AttributeValue> key,
    required String tableName,
    Map<String, AttributeValueUpdate>? attributeUpdates,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValue>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, AttributeValue>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
    ReturnValuesOnConditionCheckFailure? returnValuesOnConditionCheckFailure,
    String? updateExpression,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateItem'
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
        if (attributeUpdates != null) 'AttributeUpdates': attributeUpdates,
        if (conditionExpression != null)
          'ConditionExpression': conditionExpression,
        if (conditionalOperator != null)
          'ConditionalOperator': conditionalOperator.toValue(),
        if (expected != null) 'Expected': expected,
        if (expressionAttributeNames != null)
          'ExpressionAttributeNames': expressionAttributeNames,
        if (expressionAttributeValues != null)
          'ExpressionAttributeValues': expressionAttributeValues,
        if (returnConsumedCapacity != null)
          'ReturnConsumedCapacity': returnConsumedCapacity.toValue(),
        if (returnItemCollectionMetrics != null)
          'ReturnItemCollectionMetrics': returnItemCollectionMetrics.toValue(),
        if (returnValues != null) 'ReturnValues': returnValues.toValue(),
        if (returnValuesOnConditionCheckFailure != null)
          'ReturnValuesOnConditionCheckFailure':
              returnValuesOnConditionCheckFailure.toValue(),
        if (updateExpression != null) 'UpdateExpression': updateExpression,
      },
    );

    return UpdateItemOutput.fromJson(jsonResponse.body);
  }

  /// The command to update the Kinesis stream destination.
  ///
  /// May throw [InternalServerError].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [streamArn] :
  /// The Amazon Resource Name (ARN) for the Kinesis stream input.
  ///
  /// Parameter [tableName] :
  /// The table name for the Kinesis streaming destination input. You can also
  /// provide the ARN of the table in this parameter.
  ///
  /// Parameter [updateKinesisStreamingConfiguration] :
  /// The command to update the Kinesis stream configuration.
  Future<UpdateKinesisStreamingDestinationOutput>
      updateKinesisStreamingDestination({
    required String streamArn,
    required String tableName,
    UpdateKinesisStreamingConfiguration? updateKinesisStreamingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateKinesisStreamingDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamArn': streamArn,
        'TableName': tableName,
        if (updateKinesisStreamingConfiguration != null)
          'UpdateKinesisStreamingConfiguration':
              updateKinesisStreamingConfiguration,
      },
    );

    return UpdateKinesisStreamingDestinationOutput.fromJson(jsonResponse.body);
  }

  /// Modifies the provisioned throughput settings, global secondary indexes, or
  /// DynamoDB Streams settings for a given table.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </important>
  /// You can only perform one of the following operations at once:
  ///
  /// <ul>
  /// <li>
  /// Modify the provisioned throughput settings of the table.
  /// </li>
  /// <li>
  /// Remove a global secondary index from the table.
  /// </li>
  /// <li>
  /// Create a new global secondary index on the table. After the index begins
  /// backfilling, you can use <code>UpdateTable</code> to perform other
  /// operations.
  /// </li>
  /// </ul>
  /// <code>UpdateTable</code> is an asynchronous operation; while it's
  /// executing, the table status changes from <code>ACTIVE</code> to
  /// <code>UPDATING</code>. While it's <code>UPDATING</code>, you can't issue
  /// another <code>UpdateTable</code> request. When the table returns to the
  /// <code>ACTIVE</code> state, the <code>UpdateTable</code> operation is
  /// complete.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be updated. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [attributeDefinitions] :
  /// An array of attributes that describe the key schema for the table and
  /// indexes. If you are adding a new global secondary index to the table,
  /// <code>AttributeDefinitions</code> must include the key element(s) of the
  /// new index.
  ///
  /// Parameter [billingMode] :
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. When switching from pay-per-request to provisioned
  /// capacity, initial provisioned capacity values must be set. The initial
  /// provisioned capacity values are estimated based on the consumed read and
  /// write capacity of your table and global secondary indexes over the past 30
  /// minutes.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html">Provisioned
  /// capacity mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html">On-demand
  /// capacity mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// Indicates whether deletion protection is to be enabled (true) or disabled
  /// (false) on the table.
  ///
  /// Parameter [globalSecondaryIndexUpdates] :
  /// An array of one or more global secondary indexes for the table. For each
  /// index in the array, you can request one action:
  ///
  /// <ul>
  /// <li>
  /// <code>Create</code> - add a new global secondary index to the table.
  /// </li>
  /// <li>
  /// <code>Update</code> - modify the provisioned throughput settings of an
  /// existing global secondary index.
  /// </li>
  /// <li>
  /// <code>Delete</code> - remove a global secondary index from the table.
  /// </li>
  /// </ul>
  /// You can create or delete only one global secondary index per
  /// <code>UpdateTable</code> operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html">Managing
  /// Global Secondary Indexes</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// Parameter [onDemandThroughput] :
  /// Updates the maximum number of read and write units for the specified table
  /// in on-demand capacity mode. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  ///
  /// Parameter [provisionedThroughput] :
  /// The new provisioned throughput settings for the specified table or index.
  ///
  /// Parameter [replicaUpdates] :
  /// A list of replica update actions (create, delete, or update) for the
  /// table.
  /// <note>
  /// For global tables, this property only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </note>
  ///
  /// Parameter [sSESpecification] :
  /// The new server-side encryption settings for the specified table.
  ///
  /// Parameter [streamSpecification] :
  /// Represents the DynamoDB Streams configuration for the table.
  /// <note>
  /// You receive a <code>ValidationException</code> if you try to enable a
  /// stream on a table that already has a stream, or if you try to disable a
  /// stream on a table that doesn't have a stream.
  /// </note>
  ///
  /// Parameter [tableClass] :
  /// The table class of the table to be updated. Valid values are
  /// <code>STANDARD</code> and <code>STANDARD_INFREQUENT_ACCESS</code>.
  Future<UpdateTableOutput> updateTable({
    required String tableName,
    List<AttributeDefinition>? attributeDefinitions,
    BillingMode? billingMode,
    bool? deletionProtectionEnabled,
    List<GlobalSecondaryIndexUpdate>? globalSecondaryIndexUpdates,
    OnDemandThroughput? onDemandThroughput,
    ProvisionedThroughput? provisionedThroughput,
    List<ReplicationGroupUpdate>? replicaUpdates,
    SSESpecification? sSESpecification,
    StreamSpecification? streamSpecification,
    TableClass? tableClass,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        if (attributeDefinitions != null)
          'AttributeDefinitions': attributeDefinitions,
        if (billingMode != null) 'BillingMode': billingMode.toValue(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (globalSecondaryIndexUpdates != null)
          'GlobalSecondaryIndexUpdates': globalSecondaryIndexUpdates,
        if (onDemandThroughput != null)
          'OnDemandThroughput': onDemandThroughput,
        if (provisionedThroughput != null)
          'ProvisionedThroughput': provisionedThroughput,
        if (replicaUpdates != null) 'ReplicaUpdates': replicaUpdates,
        if (sSESpecification != null) 'SSESpecification': sSESpecification,
        if (streamSpecification != null)
          'StreamSpecification': streamSpecification,
        if (tableClass != null) 'TableClass': tableClass.toValue(),
      },
    );

    return UpdateTableOutput.fromJson(jsonResponse.body);
  }

  /// Updates auto scaling settings on your global tables at once.
  /// <important>
  /// For global tables, this operation only applies to global tables using
  /// Version 2019.11.21 (Current version).
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the global table to be updated. You can also provide the
  /// Amazon Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [globalSecondaryIndexUpdates] :
  /// Represents the auto scaling settings of the global secondary indexes of
  /// the replica to be updated.
  ///
  /// Parameter [replicaUpdates] :
  /// Represents the auto scaling settings of replicas of the table that will be
  /// modified.
  Future<UpdateTableReplicaAutoScalingOutput> updateTableReplicaAutoScaling({
    required String tableName,
    List<GlobalSecondaryIndexAutoScalingUpdate>? globalSecondaryIndexUpdates,
    AutoScalingSettingsUpdate? provisionedWriteCapacityAutoScalingUpdate,
    List<ReplicaAutoScalingUpdate>? replicaUpdates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTableReplicaAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        if (globalSecondaryIndexUpdates != null)
          'GlobalSecondaryIndexUpdates': globalSecondaryIndexUpdates,
        if (provisionedWriteCapacityAutoScalingUpdate != null)
          'ProvisionedWriteCapacityAutoScalingUpdate':
              provisionedWriteCapacityAutoScalingUpdate,
        if (replicaUpdates != null) 'ReplicaUpdates': replicaUpdates,
      },
    );

    return UpdateTableReplicaAutoScalingOutput.fromJson(jsonResponse.body);
  }

  /// The <code>UpdateTimeToLive</code> method enables or disables Time to Live
  /// (TTL) for the specified table. A successful <code>UpdateTimeToLive</code>
  /// call returns the current <code>TimeToLiveSpecification</code>. It can take
  /// up to one hour for the change to fully process. Any additional
  /// <code>UpdateTimeToLive</code> calls for the same table during this one
  /// hour duration result in a <code>ValidationException</code>.
  ///
  /// TTL compares the current time in epoch time format to the time stored in
  /// the TTL attribute of an item. If the epoch time value stored in the
  /// attribute is less than the current time, the item is marked as expired and
  /// subsequently deleted.
  /// <note>
  /// The epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.
  /// </note>
  /// DynamoDB deletes expired items on a best-effort basis to ensure
  /// availability of throughput for other data operations.
  /// <important>
  /// DynamoDB typically deletes expired items within two days of expiration.
  /// The exact duration within which an item gets deleted after expiration is
  /// specific to the nature of the workload. Items that have expired and not
  /// been deleted will still show up in reads, queries, and scans.
  /// </important>
  /// As items are deleted, they are removed from any local secondary index and
  /// global secondary index immediately in the same eventually consistent way
  /// as a standard delete operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html">Time
  /// To Live</a> in the Amazon DynamoDB Developer Guide.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be configured. You can also provide the Amazon
  /// Resource Name (ARN) of the table in this parameter.
  ///
  /// Parameter [timeToLiveSpecification] :
  /// Represents the settings used to enable or disable Time to Live for the
  /// specified table.
  Future<UpdateTimeToLiveOutput> updateTimeToLive({
    required String tableName,
    required TimeToLiveSpecification timeToLiveSpecification,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTimeToLive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'TimeToLiveSpecification': timeToLiveSpecification,
      },
    );

    return UpdateTimeToLiveOutput.fromJson(jsonResponse.body);
  }
}

enum ApproximateCreationDateTimePrecision {
  millisecond,
  microsecond,
}

extension ApproximateCreationDateTimePrecisionValueExtension
    on ApproximateCreationDateTimePrecision {
  String toValue() {
    switch (this) {
      case ApproximateCreationDateTimePrecision.millisecond:
        return 'MILLISECOND';
      case ApproximateCreationDateTimePrecision.microsecond:
        return 'MICROSECOND';
    }
  }
}

extension ApproximateCreationDateTimePrecisionFromString on String {
  ApproximateCreationDateTimePrecision
      toApproximateCreationDateTimePrecision() {
    switch (this) {
      case 'MILLISECOND':
        return ApproximateCreationDateTimePrecision.millisecond;
      case 'MICROSECOND':
        return ApproximateCreationDateTimePrecision.microsecond;
    }
    throw Exception(
        '$this is not known in enum ApproximateCreationDateTimePrecision');
  }
}

/// Contains details of a table archival operation.
class ArchivalSummary {
  /// The Amazon Resource Name (ARN) of the backup the table was archived to, when
  /// applicable in the archival reason. If you wish to restore this backup to the
  /// same table name, you will need to delete the original table.
  final String? archivalBackupArn;

  /// The date and time when table archival was initiated by DynamoDB, in UNIX
  /// epoch time format.
  final DateTime? archivalDateTime;

  /// The reason DynamoDB archived the table. Currently, the only possible value
  /// is:
  ///
  /// <ul>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_CREDENTIALS</code> - The table was archived
  /// due to the table's KMS key being inaccessible for more than seven days. An
  /// On-Demand backup was created at the archival time.
  /// </li>
  /// </ul>
  final String? archivalReason;

  ArchivalSummary({
    this.archivalBackupArn,
    this.archivalDateTime,
    this.archivalReason,
  });

  factory ArchivalSummary.fromJson(Map<String, dynamic> json) {
    return ArchivalSummary(
      archivalBackupArn: json['ArchivalBackupArn'] as String?,
      archivalDateTime: timeStampFromJson(json['ArchivalDateTime']),
      archivalReason: json['ArchivalReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archivalBackupArn = this.archivalBackupArn;
    final archivalDateTime = this.archivalDateTime;
    final archivalReason = this.archivalReason;
    return {
      if (archivalBackupArn != null) 'ArchivalBackupArn': archivalBackupArn,
      if (archivalDateTime != null)
        'ArchivalDateTime': unixTimestampToJson(archivalDateTime),
      if (archivalReason != null) 'ArchivalReason': archivalReason,
    };
  }
}

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

/// Represents an attribute for describing the schema for the table and indexes.
class AttributeDefinition {
  /// A name for the attribute.
  final String attributeName;

  /// The data type for the attribute, where:
  ///
  /// <ul>
  /// <li>
  /// <code>S</code> - the attribute is of type String
  /// </li>
  /// <li>
  /// <code>N</code> - the attribute is of type Number
  /// </li>
  /// <li>
  /// <code>B</code> - the attribute is of type Binary
  /// </li>
  /// </ul>
  final ScalarAttributeType attributeType;

  AttributeDefinition({
    required this.attributeName,
    required this.attributeType,
  });

  factory AttributeDefinition.fromJson(Map<String, dynamic> json) {
    return AttributeDefinition(
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

/// Represents the data for an attribute.
///
/// Each attribute value is described as a name-value pair. The name is the data
/// type, and the value is the data itself.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
/// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
class AttributeValue {
  /// An attribute of type Binary. For example:
  ///
  /// <code>"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"</code>
  final Uint8List? b;

  /// An attribute of type Boolean. For example:
  ///
  /// <code>"BOOL": true</code>
  final bool? boolValue;

  /// An attribute of type Binary Set. For example:
  ///
  /// <code>"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]</code>
  final List<Uint8List>? bs;

  /// An attribute of type List. For example:
  ///
  /// <code>"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N": "3.14159"}]</code>
  final List<AttributeValue>? l;

  /// An attribute of type Map. For example:
  ///
  /// <code>"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}</code>
  final Map<String, AttributeValue>? m;

  /// An attribute of type Number. For example:
  ///
  /// <code>"N": "123.45"</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  final String? n;

  /// An attribute of type Number Set. For example:
  ///
  /// <code>"NS": ["42.2", "-19", "7.5", "3.14"]</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  final List<String>? ns;

  /// An attribute of type Null. For example:
  ///
  /// <code>"NULL": true</code>
  final bool? nullValue;

  /// An attribute of type String. For example:
  ///
  /// <code>"S": "Hello"</code>
  final String? s;

  /// An attribute of type String Set. For example:
  ///
  /// <code>"SS": ["Giraffe", "Hippo" ,"Zebra"]</code>
  final List<String>? ss;

  AttributeValue({
    this.b,
    this.boolValue,
    this.bs,
    this.l,
    this.m,
    this.n,
    this.ns,
    this.nullValue,
    this.s,
    this.ss,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      b: _s.decodeNullableUint8List(json['B'] as String?),
      boolValue: json['BOOL'] as bool?,
      bs: (json['BS'] as List?)
          ?.whereNotNull()
          .map((e) => _s.decodeUint8List(e as String))
          .toList(),
      l: (json['L'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      m: (json['M'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      n: json['N'] as String?,
      ns: (json['NS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nullValue: json['NULL'] as bool?,
      s: json['S'] as String?,
      ss: (json['SS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final b = this.b;
    final boolValue = this.boolValue;
    final bs = this.bs;
    final l = this.l;
    final m = this.m;
    final n = this.n;
    final ns = this.ns;
    final nullValue = this.nullValue;
    final s = this.s;
    final ss = this.ss;
    return {
      if (b != null) 'B': base64Encode(b),
      if (boolValue != null) 'BOOL': boolValue,
      if (bs != null) 'BS': bs.map(base64Encode).toList(),
      if (l != null) 'L': l,
      if (m != null) 'M': m,
      if (n != null) 'N': n,
      if (ns != null) 'NS': ns,
      if (nullValue != null) 'NULL': nullValue,
      if (s != null) 'S': s,
      if (ss != null) 'SS': ss,
    };
  }
}

/// For the <code>UpdateItem</code> operation, represents the attributes to be
/// modified, the action to perform on each, and the new value for each.
/// <note>
/// You cannot use <code>UpdateItem</code> to update any primary key attributes.
/// Instead, you will need to delete the item, and then use <code>PutItem</code>
/// to create a new item with new attributes.
/// </note>
/// Attribute values cannot be null; string and binary type attributes must have
/// lengths greater than zero; and set type attributes must not be empty.
/// Requests with empty values will be rejected with a
/// <code>ValidationException</code> exception.
class AttributeValueUpdate {
  /// Specifies how to perform the update. Valid values are <code>PUT</code>
  /// (default), <code>DELETE</code>, and <code>ADD</code>. The behavior depends
  /// on whether the specified primary key already exists in the table.
  ///
  /// <b>If an item with the specified <i>Key</i> is found in the table:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUT</code> - Adds the specified attribute to the item. If the
  /// attribute already exists, it is replaced by the new value.
  /// </li>
  /// <li>
  /// <code>DELETE</code> - If no value is specified, the attribute and its value
  /// are removed from the item. The data type of the specified value must match
  /// the existing value's data type.
  ///
  /// If a <i>set</i> of values is specified, then those values are subtracted
  /// from the old set. For example, if the attribute value was the set
  /// <code>[a,b,c]</code> and the <code>DELETE</code> action specified
  /// <code>[a,c]</code>, then the final attribute value would be
  /// <code>[b]</code>. Specifying an empty set is an error.
  /// </li>
  /// <li>
  /// <code>ADD</code> - If the attribute does not already exist, then the
  /// attribute and its values are added to the item. If the attribute does exist,
  /// then the behavior of <code>ADD</code> depends on the data type of the
  /// attribute:
  ///
  /// <ul>
  /// <li>
  /// If the existing attribute is a number, and if <code>Value</code> is also a
  /// number, then the <code>Value</code> is mathematically added to the existing
  /// attribute. If <code>Value</code> is a negative number, then it is subtracted
  /// from the existing attribute.
  /// <note>
  /// If you use <code>ADD</code> to increment or decrement a number value for an
  /// item that doesn't exist before the update, DynamoDB uses 0 as the initial
  /// value.
  ///
  /// In addition, if you use <code>ADD</code> to update an existing item, and
  /// intend to increment or decrement an attribute value which does not yet
  /// exist, DynamoDB uses <code>0</code> as the initial value. For example,
  /// suppose that the item you want to update does not yet have an attribute
  /// named <i>itemcount</i>, but you decide to <code>ADD</code> the number
  /// <code>3</code> to this attribute anyway, even though it currently does not
  /// exist. DynamoDB will create the <i>itemcount</i> attribute, set its initial
  /// value to <code>0</code>, and finally add <code>3</code> to it. The result
  /// will be a new <i>itemcount</i> attribute in the item, with a value of
  /// <code>3</code>.
  /// </note> </li>
  /// <li>
  /// If the existing data type is a set, and if the <code>Value</code> is also a
  /// set, then the <code>Value</code> is added to the existing set. (This is a
  /// <i>set</i> operation, not mathematical addition.) For example, if the
  /// attribute value was the set <code>[1,2]</code>, and the <code>ADD</code>
  /// action specified <code>[3]</code>, then the final attribute value would be
  /// <code>[1,2,3]</code>. An error occurs if an Add action is specified for a
  /// set attribute and the attribute type specified does not match the existing
  /// set type.
  ///
  /// Both sets must have the same primitive data type. For example, if the
  /// existing data type is a set of strings, the <code>Value</code> must also be
  /// a set of strings. The same holds true for number sets and binary sets.
  /// </li>
  /// </ul>
  /// This action is only valid for an existing attribute whose data type is
  /// number or is a set. Do not use <code>ADD</code> for any other data types.
  /// </li>
  /// </ul>
  /// <b>If no item with the specified <i>Key</i> is found:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUT</code> - DynamoDB creates a new item with the specified primary
  /// key, and then adds the attribute.
  /// </li>
  /// <li>
  /// <code>DELETE</code> - Nothing happens; there is no attribute to delete.
  /// </li>
  /// <li>
  /// <code>ADD</code> - DynamoDB creates a new item with the supplied primary key
  /// and number (or set) for the attribute value. The only data types allowed are
  /// number, number set, string set or binary set.
  /// </li>
  /// </ul>
  final AttributeAction? action;

  /// Represents the data for an attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the data
  /// type, and the value is the data itself.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
  /// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
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

/// Represents the properties of the scaling policy.
class AutoScalingPolicyDescription {
  /// The name of the scaling policy.
  final String? policyName;

  /// Represents a target tracking scaling policy configuration.
  final AutoScalingTargetTrackingScalingPolicyConfigurationDescription?
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicyDescription({
    this.policyName,
    this.targetTrackingScalingPolicyConfiguration,
  });

  factory AutoScalingPolicyDescription.fromJson(Map<String, dynamic> json) {
    return AutoScalingPolicyDescription(
      policyName: json['PolicyName'] as String?,
      targetTrackingScalingPolicyConfiguration:
          json['TargetTrackingScalingPolicyConfiguration'] != null
              ? AutoScalingTargetTrackingScalingPolicyConfigurationDescription
                  .fromJson(json['TargetTrackingScalingPolicyConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final targetTrackingScalingPolicyConfiguration =
        this.targetTrackingScalingPolicyConfiguration;
    return {
      if (policyName != null) 'PolicyName': policyName,
      if (targetTrackingScalingPolicyConfiguration != null)
        'TargetTrackingScalingPolicyConfiguration':
            targetTrackingScalingPolicyConfiguration,
    };
  }
}

/// Represents the auto scaling policy to be modified.
class AutoScalingPolicyUpdate {
  /// Represents a target tracking scaling policy configuration.
  final AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
      targetTrackingScalingPolicyConfiguration;

  /// The name of the scaling policy.
  final String? policyName;

  AutoScalingPolicyUpdate({
    required this.targetTrackingScalingPolicyConfiguration,
    this.policyName,
  });

  Map<String, dynamic> toJson() {
    final targetTrackingScalingPolicyConfiguration =
        this.targetTrackingScalingPolicyConfiguration;
    final policyName = this.policyName;
    return {
      'TargetTrackingScalingPolicyConfiguration':
          targetTrackingScalingPolicyConfiguration,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Represents the auto scaling settings for a global table or global secondary
/// index.
class AutoScalingSettingsDescription {
  /// Disabled auto scaling for this global table or global secondary index.
  final bool? autoScalingDisabled;

  /// Role ARN used for configuring the auto scaling policy.
  final String? autoScalingRoleArn;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  final int? maximumUnits;

  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  final int? minimumUnits;

  /// Information about the scaling policies.
  final List<AutoScalingPolicyDescription>? scalingPolicies;

  AutoScalingSettingsDescription({
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.maximumUnits,
    this.minimumUnits,
    this.scalingPolicies,
  });

  factory AutoScalingSettingsDescription.fromJson(Map<String, dynamic> json) {
    return AutoScalingSettingsDescription(
      autoScalingDisabled: json['AutoScalingDisabled'] as bool?,
      autoScalingRoleArn: json['AutoScalingRoleArn'] as String?,
      maximumUnits: json['MaximumUnits'] as int?,
      minimumUnits: json['MinimumUnits'] as int?,
      scalingPolicies: (json['ScalingPolicies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AutoScalingPolicyDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingDisabled = this.autoScalingDisabled;
    final autoScalingRoleArn = this.autoScalingRoleArn;
    final maximumUnits = this.maximumUnits;
    final minimumUnits = this.minimumUnits;
    final scalingPolicies = this.scalingPolicies;
    return {
      if (autoScalingDisabled != null)
        'AutoScalingDisabled': autoScalingDisabled,
      if (autoScalingRoleArn != null) 'AutoScalingRoleArn': autoScalingRoleArn,
      if (maximumUnits != null) 'MaximumUnits': maximumUnits,
      if (minimumUnits != null) 'MinimumUnits': minimumUnits,
      if (scalingPolicies != null) 'ScalingPolicies': scalingPolicies,
    };
  }
}

/// Represents the auto scaling settings to be modified for a global table or
/// global secondary index.
class AutoScalingSettingsUpdate {
  /// Disabled auto scaling for this global table or global secondary index.
  final bool? autoScalingDisabled;

  /// Role ARN used for configuring auto scaling policy.
  final String? autoScalingRoleArn;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  final int? maximumUnits;

  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  final int? minimumUnits;

  /// The scaling policy to apply for scaling target global table or global
  /// secondary index capacity units.
  final AutoScalingPolicyUpdate? scalingPolicyUpdate;

  AutoScalingSettingsUpdate({
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.maximumUnits,
    this.minimumUnits,
    this.scalingPolicyUpdate,
  });

  Map<String, dynamic> toJson() {
    final autoScalingDisabled = this.autoScalingDisabled;
    final autoScalingRoleArn = this.autoScalingRoleArn;
    final maximumUnits = this.maximumUnits;
    final minimumUnits = this.minimumUnits;
    final scalingPolicyUpdate = this.scalingPolicyUpdate;
    return {
      if (autoScalingDisabled != null)
        'AutoScalingDisabled': autoScalingDisabled,
      if (autoScalingRoleArn != null) 'AutoScalingRoleArn': autoScalingRoleArn,
      if (maximumUnits != null) 'MaximumUnits': maximumUnits,
      if (minimumUnits != null) 'MinimumUnits': minimumUnits,
      if (scalingPolicyUpdate != null)
        'ScalingPolicyUpdate': scalingPolicyUpdate,
    };
  }
}

/// Represents the properties of a target tracking scaling policy.
class AutoScalingTargetTrackingScalingPolicyConfigurationDescription {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If the
  /// value is true, scale in is disabled and the target tracking policy won't
  /// remove capacity from the scalable resource. Otherwise, scale in is enabled
  /// and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  final bool? disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after a
  /// scale-in, application auto scaling scales out your scalable target
  /// immediately.
  final int? scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in
  /// effect, the capacity that has been added by the previous scale out event
  /// that initiated the cooldown is calculated as part of the desired capacity
  /// for the next scale out. You should continuously (but not excessively) scale
  /// out.
  final int? scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationDescription({
    required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory AutoScalingTargetTrackingScalingPolicyConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return AutoScalingTargetTrackingScalingPolicyConfigurationDescription(
      targetValue: json['TargetValue'] as double,
      disableScaleIn: json['DisableScaleIn'] as bool?,
      scaleInCooldown: json['ScaleInCooldown'] as int?,
      scaleOutCooldown: json['ScaleOutCooldown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    final disableScaleIn = this.disableScaleIn;
    final scaleInCooldown = this.scaleInCooldown;
    final scaleOutCooldown = this.scaleOutCooldown;
    return {
      'TargetValue': targetValue,
      if (disableScaleIn != null) 'DisableScaleIn': disableScaleIn,
      if (scaleInCooldown != null) 'ScaleInCooldown': scaleInCooldown,
      if (scaleOutCooldown != null) 'ScaleOutCooldown': scaleOutCooldown,
    };
  }
}

/// Represents the settings of a target tracking scaling policy that will be
/// modified.
class AutoScalingTargetTrackingScalingPolicyConfigurationUpdate {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If the
  /// value is true, scale in is disabled and the target tracking policy won't
  /// remove capacity from the scalable resource. Otherwise, scale in is enabled
  /// and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  final bool? disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after a
  /// scale-in, application auto scaling scales out your scalable target
  /// immediately.
  final int? scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in
  /// effect, the capacity that has been added by the previous scale out event
  /// that initiated the cooldown is calculated as part of the desired capacity
  /// for the next scale out. You should continuously (but not excessively) scale
  /// out.
  final int? scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationUpdate({
    required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    final disableScaleIn = this.disableScaleIn;
    final scaleInCooldown = this.scaleInCooldown;
    final scaleOutCooldown = this.scaleOutCooldown;
    return {
      'TargetValue': targetValue,
      if (disableScaleIn != null) 'DisableScaleIn': disableScaleIn,
      if (scaleInCooldown != null) 'ScaleInCooldown': scaleInCooldown,
      if (scaleOutCooldown != null) 'ScaleOutCooldown': scaleOutCooldown,
    };
  }
}

/// Contains the description of the backup created for the table.
class BackupDescription {
  /// Contains the details of the backup created for the table.
  final BackupDetails? backupDetails;

  /// Contains the details of the table when the backup was created.
  final SourceTableDetails? sourceTableDetails;

  /// Contains the details of the features enabled on the table when the backup
  /// was created. For example, LSIs, GSIs, streams, TTL.
  final SourceTableFeatureDetails? sourceTableFeatureDetails;

  BackupDescription({
    this.backupDetails,
    this.sourceTableDetails,
    this.sourceTableFeatureDetails,
  });

  factory BackupDescription.fromJson(Map<String, dynamic> json) {
    return BackupDescription(
      backupDetails: json['BackupDetails'] != null
          ? BackupDetails.fromJson(
              json['BackupDetails'] as Map<String, dynamic>)
          : null,
      sourceTableDetails: json['SourceTableDetails'] != null
          ? SourceTableDetails.fromJson(
              json['SourceTableDetails'] as Map<String, dynamic>)
          : null,
      sourceTableFeatureDetails: json['SourceTableFeatureDetails'] != null
          ? SourceTableFeatureDetails.fromJson(
              json['SourceTableFeatureDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupDetails = this.backupDetails;
    final sourceTableDetails = this.sourceTableDetails;
    final sourceTableFeatureDetails = this.sourceTableFeatureDetails;
    return {
      if (backupDetails != null) 'BackupDetails': backupDetails,
      if (sourceTableDetails != null) 'SourceTableDetails': sourceTableDetails,
      if (sourceTableFeatureDetails != null)
        'SourceTableFeatureDetails': sourceTableFeatureDetails,
    };
  }
}

/// Contains the details of the backup created for the table.
class BackupDetails {
  /// ARN associated with the backup.
  final String backupArn;

  /// Time at which the backup was created. This is the request time of the
  /// backup.
  final DateTime backupCreationDateTime;

  /// Name of the requested backup.
  final String backupName;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  final BackupStatus backupStatus;

  /// BackupType:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - You create and manage these using the on-demand backup
  /// feature.
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - If you delete a table with point-in-time recovery
  /// enabled, a <code>SYSTEM</code> backup is automatically created and is
  /// retained for 35 days (at no additional cost). System backups allow you to
  /// restore the deleted table to the state it was in just before the point of
  /// deletion.
  /// </li>
  /// <li>
  /// <code>AWS_BACKUP</code> - On-demand backup created by you from Backup
  /// service.
  /// </li>
  /// </ul>
  final BackupType backupType;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This <code>SYSTEM</code> on-demand backup expires automatically 35
  /// days after its creation.
  final DateTime? backupExpiryDateTime;

  /// Size of the backup in bytes. DynamoDB updates this value approximately every
  /// six hours. Recent changes might not be reflected in this value.
  final int? backupSizeBytes;

  BackupDetails({
    required this.backupArn,
    required this.backupCreationDateTime,
    required this.backupName,
    required this.backupStatus,
    required this.backupType,
    this.backupExpiryDateTime,
    this.backupSizeBytes,
  });

  factory BackupDetails.fromJson(Map<String, dynamic> json) {
    return BackupDetails(
      backupArn: json['BackupArn'] as String,
      backupCreationDateTime: nonNullableTimeStampFromJson(
          json['BackupCreationDateTime'] as Object),
      backupName: json['BackupName'] as String,
      backupStatus: (json['BackupStatus'] as String).toBackupStatus(),
      backupType: (json['BackupType'] as String).toBackupType(),
      backupExpiryDateTime: timeStampFromJson(json['BackupExpiryDateTime']),
      backupSizeBytes: json['BackupSizeBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupArn = this.backupArn;
    final backupCreationDateTime = this.backupCreationDateTime;
    final backupName = this.backupName;
    final backupStatus = this.backupStatus;
    final backupType = this.backupType;
    final backupExpiryDateTime = this.backupExpiryDateTime;
    final backupSizeBytes = this.backupSizeBytes;
    return {
      'BackupArn': backupArn,
      'BackupCreationDateTime': unixTimestampToJson(backupCreationDateTime),
      'BackupName': backupName,
      'BackupStatus': backupStatus.toValue(),
      'BackupType': backupType.toValue(),
      if (backupExpiryDateTime != null)
        'BackupExpiryDateTime': unixTimestampToJson(backupExpiryDateTime),
      if (backupSizeBytes != null) 'BackupSizeBytes': backupSizeBytes,
    };
  }
}

enum BackupStatus {
  creating,
  deleted,
  available,
}

extension BackupStatusValueExtension on BackupStatus {
  String toValue() {
    switch (this) {
      case BackupStatus.creating:
        return 'CREATING';
      case BackupStatus.deleted:
        return 'DELETED';
      case BackupStatus.available:
        return 'AVAILABLE';
    }
  }
}

extension BackupStatusFromString on String {
  BackupStatus toBackupStatus() {
    switch (this) {
      case 'CREATING':
        return BackupStatus.creating;
      case 'DELETED':
        return BackupStatus.deleted;
      case 'AVAILABLE':
        return BackupStatus.available;
    }
    throw Exception('$this is not known in enum BackupStatus');
  }
}

/// Contains details for the backup.
class BackupSummary {
  /// ARN associated with the backup.
  final String? backupArn;

  /// Time at which the backup was created.
  final DateTime? backupCreationDateTime;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This <code>SYSTEM</code> on-demand backup expires automatically 35
  /// days after its creation.
  final DateTime? backupExpiryDateTime;

  /// Name of the specified backup.
  final String? backupName;

  /// Size of the backup in bytes.
  final int? backupSizeBytes;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  final BackupStatus? backupStatus;

  /// BackupType:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - You create and manage these using the on-demand backup
  /// feature.
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - If you delete a table with point-in-time recovery
  /// enabled, a <code>SYSTEM</code> backup is automatically created and is
  /// retained for 35 days (at no additional cost). System backups allow you to
  /// restore the deleted table to the state it was in just before the point of
  /// deletion.
  /// </li>
  /// <li>
  /// <code>AWS_BACKUP</code> - On-demand backup created by you from Backup
  /// service.
  /// </li>
  /// </ul>
  final BackupType? backupType;

  /// ARN associated with the table.
  final String? tableArn;

  /// Unique identifier for the table.
  final String? tableId;

  /// Name of the table.
  final String? tableName;

  BackupSummary({
    this.backupArn,
    this.backupCreationDateTime,
    this.backupExpiryDateTime,
    this.backupName,
    this.backupSizeBytes,
    this.backupStatus,
    this.backupType,
    this.tableArn,
    this.tableId,
    this.tableName,
  });

  factory BackupSummary.fromJson(Map<String, dynamic> json) {
    return BackupSummary(
      backupArn: json['BackupArn'] as String?,
      backupCreationDateTime: timeStampFromJson(json['BackupCreationDateTime']),
      backupExpiryDateTime: timeStampFromJson(json['BackupExpiryDateTime']),
      backupName: json['BackupName'] as String?,
      backupSizeBytes: json['BackupSizeBytes'] as int?,
      backupStatus: (json['BackupStatus'] as String?)?.toBackupStatus(),
      backupType: (json['BackupType'] as String?)?.toBackupType(),
      tableArn: json['TableArn'] as String?,
      tableId: json['TableId'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupArn = this.backupArn;
    final backupCreationDateTime = this.backupCreationDateTime;
    final backupExpiryDateTime = this.backupExpiryDateTime;
    final backupName = this.backupName;
    final backupSizeBytes = this.backupSizeBytes;
    final backupStatus = this.backupStatus;
    final backupType = this.backupType;
    final tableArn = this.tableArn;
    final tableId = this.tableId;
    final tableName = this.tableName;
    return {
      if (backupArn != null) 'BackupArn': backupArn,
      if (backupCreationDateTime != null)
        'BackupCreationDateTime': unixTimestampToJson(backupCreationDateTime),
      if (backupExpiryDateTime != null)
        'BackupExpiryDateTime': unixTimestampToJson(backupExpiryDateTime),
      if (backupName != null) 'BackupName': backupName,
      if (backupSizeBytes != null) 'BackupSizeBytes': backupSizeBytes,
      if (backupStatus != null) 'BackupStatus': backupStatus.toValue(),
      if (backupType != null) 'BackupType': backupType.toValue(),
      if (tableArn != null) 'TableArn': tableArn,
      if (tableId != null) 'TableId': tableId,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

enum BackupType {
  user,
  system,
  awsBackup,
}

extension BackupTypeValueExtension on BackupType {
  String toValue() {
    switch (this) {
      case BackupType.user:
        return 'USER';
      case BackupType.system:
        return 'SYSTEM';
      case BackupType.awsBackup:
        return 'AWS_BACKUP';
    }
  }
}

extension BackupTypeFromString on String {
  BackupType toBackupType() {
    switch (this) {
      case 'USER':
        return BackupType.user;
      case 'SYSTEM':
        return BackupType.system;
      case 'AWS_BACKUP':
        return BackupType.awsBackup;
    }
    throw Exception('$this is not known in enum BackupType');
  }
}

enum BackupTypeFilter {
  user,
  system,
  awsBackup,
  all,
}

extension BackupTypeFilterValueExtension on BackupTypeFilter {
  String toValue() {
    switch (this) {
      case BackupTypeFilter.user:
        return 'USER';
      case BackupTypeFilter.system:
        return 'SYSTEM';
      case BackupTypeFilter.awsBackup:
        return 'AWS_BACKUP';
      case BackupTypeFilter.all:
        return 'ALL';
    }
  }
}

extension BackupTypeFilterFromString on String {
  BackupTypeFilter toBackupTypeFilter() {
    switch (this) {
      case 'USER':
        return BackupTypeFilter.user;
      case 'SYSTEM':
        return BackupTypeFilter.system;
      case 'AWS_BACKUP':
        return BackupTypeFilter.awsBackup;
      case 'ALL':
        return BackupTypeFilter.all;
    }
    throw Exception('$this is not known in enum BackupTypeFilter');
  }
}

class BatchExecuteStatementOutput {
  /// The capacity units consumed by the entire operation. The values of the list
  /// are ordered according to the ordering of the statements.
  final List<ConsumedCapacity>? consumedCapacity;

  /// The response to each PartiQL statement in the batch. The values of the list
  /// are ordered according to the ordering of the request statements.
  final List<BatchStatementResponse>? responses;

  BatchExecuteStatementOutput({
    this.consumedCapacity,
    this.responses,
  });

  factory BatchExecuteStatementOutput.fromJson(Map<String, dynamic> json) {
    return BatchExecuteStatementOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      responses: (json['Responses'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BatchStatementResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final responses = this.responses;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (responses != null) 'Responses': responses,
    };
  }
}

/// Represents the output of a <code>BatchGetItem</code> operation.
class BatchGetItemOutput {
  /// The read capacity units consumed by the entire <code>BatchGetItem</code>
  /// operation.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>TableName</code> - The table that consumed the provisioned throughput.
  /// </li>
  /// <li>
  /// <code>CapacityUnits</code> - The total number of capacity units consumed.
  /// </li>
  /// </ul>
  final List<ConsumedCapacity>? consumedCapacity;

  /// A map of table name or table ARN to a list of items. Each object in
  /// <code>Responses</code> consists of a table name or ARN, along with a map of
  /// attribute data consisting of the data type and attribute value.
  final Map<String, List<Map<String, AttributeValue>>>? responses;

  /// A map of tables and their respective keys that were not processed with the
  /// current response. The <code>UnprocessedKeys</code> value is in the same form
  /// as <code>RequestItems</code>, so the value can be provided directly to a
  /// subsequent <code>BatchGetItem</code> operation. For more information, see
  /// <code>RequestItems</code> in the Request Parameters section.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>Keys</code> - An array of primary key attribute values that define
  /// specific items in the table.
  /// </li>
  /// <li>
  /// <code>ProjectionExpression</code> - One or more attributes to be retrieved
  /// from the table or index. By default, all attributes are returned. If a
  /// requested attribute is not found, it does not appear in the result.
  /// </li>
  /// <li>
  /// <code>ConsistentRead</code> - The consistency of a read operation. If set to
  /// <code>true</code>, then a strongly consistent read is used; otherwise, an
  /// eventually consistent read is used.
  /// </li>
  /// </ul>
  /// If there are no unprocessed keys remaining, the response contains an empty
  /// <code>UnprocessedKeys</code> map.
  final Map<String, KeysAndAttributes>? unprocessedKeys;

  BatchGetItemOutput({
    this.consumedCapacity,
    this.responses,
    this.unprocessedKeys,
  });

  factory BatchGetItemOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetItemOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      responses: (json['Responses'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) => (e as Map<String, dynamic>).map((k, e) =>
                      MapEntry(k,
                          AttributeValue.fromJson(e as Map<String, dynamic>))))
                  .toList())),
      unprocessedKeys: (json['UnprocessedKeys'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, KeysAndAttributes.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final responses = this.responses;
    final unprocessedKeys = this.unprocessedKeys;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (responses != null) 'Responses': responses,
      if (unprocessedKeys != null) 'UnprocessedKeys': unprocessedKeys,
    };
  }
}

/// An error associated with a statement in a PartiQL batch that was run.
class BatchStatementError {
  /// The error code associated with the failed PartiQL batch statement.
  final BatchStatementErrorCodeEnum? code;

  /// The item which caused the condition check to fail. This will be set if
  /// ReturnValuesOnConditionCheckFailure is specified as <code>ALL_OLD</code>.
  final Map<String, AttributeValue>? item;

  /// The error message associated with the PartiQL batch response.
  final String? message;

  BatchStatementError({
    this.code,
    this.item,
    this.message,
  });

  factory BatchStatementError.fromJson(Map<String, dynamic> json) {
    return BatchStatementError(
      code: (json['Code'] as String?)?.toBatchStatementErrorCodeEnum(),
      item: (json['Item'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final item = this.item;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (item != null) 'Item': item,
      if (message != null) 'Message': message,
    };
  }
}

enum BatchStatementErrorCodeEnum {
  conditionalCheckFailed,
  itemCollectionSizeLimitExceeded,
  requestLimitExceeded,
  validationError,
  provisionedThroughputExceeded,
  transactionConflict,
  throttlingError,
  internalServerError,
  resourceNotFound,
  accessDenied,
  duplicateItem,
}

extension BatchStatementErrorCodeEnumValueExtension
    on BatchStatementErrorCodeEnum {
  String toValue() {
    switch (this) {
      case BatchStatementErrorCodeEnum.conditionalCheckFailed:
        return 'ConditionalCheckFailed';
      case BatchStatementErrorCodeEnum.itemCollectionSizeLimitExceeded:
        return 'ItemCollectionSizeLimitExceeded';
      case BatchStatementErrorCodeEnum.requestLimitExceeded:
        return 'RequestLimitExceeded';
      case BatchStatementErrorCodeEnum.validationError:
        return 'ValidationError';
      case BatchStatementErrorCodeEnum.provisionedThroughputExceeded:
        return 'ProvisionedThroughputExceeded';
      case BatchStatementErrorCodeEnum.transactionConflict:
        return 'TransactionConflict';
      case BatchStatementErrorCodeEnum.throttlingError:
        return 'ThrottlingError';
      case BatchStatementErrorCodeEnum.internalServerError:
        return 'InternalServerError';
      case BatchStatementErrorCodeEnum.resourceNotFound:
        return 'ResourceNotFound';
      case BatchStatementErrorCodeEnum.accessDenied:
        return 'AccessDenied';
      case BatchStatementErrorCodeEnum.duplicateItem:
        return 'DuplicateItem';
    }
  }
}

extension BatchStatementErrorCodeEnumFromString on String {
  BatchStatementErrorCodeEnum toBatchStatementErrorCodeEnum() {
    switch (this) {
      case 'ConditionalCheckFailed':
        return BatchStatementErrorCodeEnum.conditionalCheckFailed;
      case 'ItemCollectionSizeLimitExceeded':
        return BatchStatementErrorCodeEnum.itemCollectionSizeLimitExceeded;
      case 'RequestLimitExceeded':
        return BatchStatementErrorCodeEnum.requestLimitExceeded;
      case 'ValidationError':
        return BatchStatementErrorCodeEnum.validationError;
      case 'ProvisionedThroughputExceeded':
        return BatchStatementErrorCodeEnum.provisionedThroughputExceeded;
      case 'TransactionConflict':
        return BatchStatementErrorCodeEnum.transactionConflict;
      case 'ThrottlingError':
        return BatchStatementErrorCodeEnum.throttlingError;
      case 'InternalServerError':
        return BatchStatementErrorCodeEnum.internalServerError;
      case 'ResourceNotFound':
        return BatchStatementErrorCodeEnum.resourceNotFound;
      case 'AccessDenied':
        return BatchStatementErrorCodeEnum.accessDenied;
      case 'DuplicateItem':
        return BatchStatementErrorCodeEnum.duplicateItem;
    }
    throw Exception('$this is not known in enum BatchStatementErrorCodeEnum');
  }
}

/// A PartiQL batch statement request.
class BatchStatementRequest {
  /// A valid PartiQL statement.
  final String statement;

  /// The read consistency of the PartiQL batch request.
  final bool? consistentRead;

  /// The parameters associated with a PartiQL statement in the batch request.
  final List<AttributeValue>? parameters;

  /// An optional parameter that returns the item attributes for a PartiQL batch
  /// request operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value aside
  /// from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  BatchStatementRequest({
    required this.statement,
    this.consistentRead,
    this.parameters,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final consistentRead = this.consistentRead;
    final parameters = this.parameters;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'Statement': statement,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
      if (parameters != null) 'Parameters': parameters,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

/// A PartiQL batch statement response..
class BatchStatementResponse {
  /// The error associated with a failed PartiQL batch statement.
  final BatchStatementError? error;

  /// A DynamoDB item associated with a BatchStatementResponse
  final Map<String, AttributeValue>? item;

  /// The table name associated with a failed PartiQL batch statement.
  final String? tableName;

  BatchStatementResponse({
    this.error,
    this.item,
    this.tableName,
  });

  factory BatchStatementResponse.fromJson(Map<String, dynamic> json) {
    return BatchStatementResponse(
      error: json['Error'] != null
          ? BatchStatementError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      item: (json['Item'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final item = this.item;
    final tableName = this.tableName;
    return {
      if (error != null) 'Error': error,
      if (item != null) 'Item': item,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// Represents the output of a <code>BatchWriteItem</code> operation.
class BatchWriteItemOutput {
  /// The capacity units consumed by the entire <code>BatchWriteItem</code>
  /// operation.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>TableName</code> - The table that consumed the provisioned throughput.
  /// </li>
  /// <li>
  /// <code>CapacityUnits</code> - The total number of capacity units consumed.
  /// </li>
  /// </ul>
  final List<ConsumedCapacity>? consumedCapacity;

  /// A list of tables that were processed by <code>BatchWriteItem</code> and, for
  /// each table, information about any item collections that were affected by
  /// individual <code>DeleteItem</code> or <code>PutItem</code> operations.
  ///
  /// Each entry consists of the following subelements:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size,
  /// expressed in GB. This is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on the table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  final Map<String, List<ItemCollectionMetrics>>? itemCollectionMetrics;

  /// A map of tables and requests against those tables that were not processed.
  /// The <code>UnprocessedItems</code> value is in the same form as
  /// <code>RequestItems</code>, so you can provide this value directly to a
  /// subsequent <code>BatchWriteItem</code> operation. For more information, see
  /// <code>RequestItems</code> in the Request Parameters section.
  ///
  /// Each <code>UnprocessedItems</code> entry consists of a table name or table
  /// ARN and, for that table, a list of operations to perform
  /// (<code>DeleteRequest</code> or <code>PutRequest</code>).
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation on
  /// the specified item. The item to be deleted is identified by a
  /// <code>Key</code> subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Key</code> - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name and
  /// an attribute value.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PutRequest</code> - Perform a <code>PutItem</code> operation on the
  /// specified item. The item to be put is identified by an <code>Item</code>
  /// subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Item</code> - A map of attributes and their values. Each entry in this
  /// map consists of an attribute name and an attribute value. Attribute values
  /// must not be null; string and binary type attributes must have lengths
  /// greater than zero; and set type attributes must not be empty. Requests that
  /// contain empty values will be rejected with a
  /// <code>ValidationException</code> exception.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If there are no unprocessed items remaining, the response contains an empty
  /// <code>UnprocessedItems</code> map.
  final Map<String, List<WriteRequest>>? unprocessedItems;

  BatchWriteItemOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
    this.unprocessedItems,
  });

  factory BatchWriteItemOutput.fromJson(Map<String, dynamic> json) {
    return BatchWriteItemOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCollectionMetrics: (json['ItemCollectionMetrics']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      ItemCollectionMetrics.fromJson(e as Map<String, dynamic>))
                  .toList())),
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
    final consumedCapacity = this.consumedCapacity;
    final itemCollectionMetrics = this.itemCollectionMetrics;
    final unprocessedItems = this.unprocessedItems;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (itemCollectionMetrics != null)
        'ItemCollectionMetrics': itemCollectionMetrics,
      if (unprocessedItems != null) 'UnprocessedItems': unprocessedItems,
    };
  }
}

enum BillingMode {
  provisioned,
  payPerRequest,
}

extension BillingModeValueExtension on BillingMode {
  String toValue() {
    switch (this) {
      case BillingMode.provisioned:
        return 'PROVISIONED';
      case BillingMode.payPerRequest:
        return 'PAY_PER_REQUEST';
    }
  }
}

extension BillingModeFromString on String {
  BillingMode toBillingMode() {
    switch (this) {
      case 'PROVISIONED':
        return BillingMode.provisioned;
      case 'PAY_PER_REQUEST':
        return BillingMode.payPerRequest;
    }
    throw Exception('$this is not known in enum BillingMode');
  }
}

/// Contains the details for the read/write capacity mode. This page talks about
/// <code>PROVISIONED</code> and <code>PAY_PER_REQUEST</code> billing modes. For
/// more information about these modes, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html">Read/write
/// capacity mode</a>.
/// <note>
/// You may need to switch to on-demand mode at least once in order to return a
/// <code>BillingModeSummary</code> response.
/// </note>
class BillingModeSummary {
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - Sets the read/write capacity mode to
  /// <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for
  /// predictable workloads.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to
  /// <code>PAY_PER_REQUEST</code>. We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// </li>
  /// </ul>
  final BillingMode? billingMode;

  /// Represents the time when <code>PAY_PER_REQUEST</code> was last set as the
  /// read/write capacity mode.
  final DateTime? lastUpdateToPayPerRequestDateTime;

  BillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });

  factory BillingModeSummary.fromJson(Map<String, dynamic> json) {
    return BillingModeSummary(
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      lastUpdateToPayPerRequestDateTime:
          timeStampFromJson(json['LastUpdateToPayPerRequestDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final billingMode = this.billingMode;
    final lastUpdateToPayPerRequestDateTime =
        this.lastUpdateToPayPerRequestDateTime;
    return {
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (lastUpdateToPayPerRequestDateTime != null)
        'LastUpdateToPayPerRequestDateTime':
            unixTimestampToJson(lastUpdateToPayPerRequestDateTime),
    };
  }
}

/// Represents the amount of provisioned throughput capacity consumed on a table
/// or an index.
class Capacity {
  /// The total number of capacity units consumed on a table or an index.
  final double? capacityUnits;

  /// The total number of read capacity units consumed on a table or an index.
  final double? readCapacityUnits;

  /// The total number of write capacity units consumed on a table or an index.
  final double? writeCapacityUnits;

  Capacity({
    this.capacityUnits,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) {
    return Capacity(
      capacityUnits: json['CapacityUnits'] as double?,
      readCapacityUnits: json['ReadCapacityUnits'] as double?,
      writeCapacityUnits: json['WriteCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityUnits = this.capacityUnits;
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      if (capacityUnits != null) 'CapacityUnits': capacityUnits,
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

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

/// Represents the selection criteria for a <code>Query</code> or
/// <code>Scan</code> operation:
///
/// <ul>
/// <li>
/// For a <code>Query</code> operation, <code>Condition</code> is used for
/// specifying the <code>KeyConditions</code> to use when querying a table or an
/// index. For <code>KeyConditions</code>, only the following comparison
/// operators are supported:
///
/// <code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code>
///
/// <code>Condition</code> is also used in a <code>QueryFilter</code>, which
/// evaluates the query results and returns only the desired values.
/// </li>
/// <li>
/// For a <code>Scan</code> operation, <code>Condition</code> is used in a
/// <code>ScanFilter</code>, which evaluates the scan results and returns only
/// the desired values.
/// </li>
/// </ul>
class Condition {
  /// A comparator for evaluating attributes. For example, equals, greater than,
  /// less than, etc.
  ///
  /// The following comparison operators are available:
  ///
  /// <code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
  /// NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code>
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code> : Equal. <code>EQ</code> is supported for all data types,
  /// including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, Binary, String
  /// Set, Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also,
  /// <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NE</code> : Not equal. <code>NE</code> is supported for all data
  /// types, including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, Binary, String Set,
  /// Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> of a different type than the one provided in the
  /// request, the value does not match. For example, <code>{"S":"6"}</code> does
  /// not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not
  /// equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LE</code> : Less than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LT</code> : Less than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, or Binary (not a set
  /// type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GE</code> : Greater than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GT</code> : Greater than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the existence of an attribute, not its data type. If
  /// the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This
  /// result is because the attribute "<code>a</code>" exists; its data type is
  /// not relevant to the <code>NOT_NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>NULL</code> : The attribute does not exist. <code>NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the nonexistence of an attribute, not its data type.
  /// If the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NULL</code>, the result is a Boolean <code>false</code>. This is
  /// because the attribute "<code>a</code>" exists; its data type is not relevant
  /// to the <code>NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>CONTAINS</code> : Checks for a subsequence, or value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is of type String, then
  /// the operator checks for a substring match. If the target attribute of the
  /// comparison is of type Binary, then the operator looks for a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then
  /// the operator evaluates to true if it finds an exact match with any member of
  /// the set.
  ///
  /// CONTAINS is supported for lists: When evaluating "<code>a CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence
  /// of a value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is a String, then the
  /// operator checks for the absence of a substring match. If the target
  /// attribute of the comparison is Binary, then the operator checks for the
  /// absence of a subsequence of the target that matches the input. If the target
  /// attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>",
  /// or "<code>BS</code>"), then the operator evaluates to true if it <i>does
  /// not</i> find an exact match with any member of the set.
  ///
  /// NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code> : Checks for a prefix.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String or Binary (not a Number or a set
  /// type). The target attribute of the comparison must be of type String or
  /// Binary (not a Number or a set type).
  /// <p/> </li>
  /// <li>
  /// <code>IN</code> : Checks for matching elements in a list.
  ///
  /// <code>AttributeValueList</code> can contain one or more
  /// <code>AttributeValue</code> elements of type String, Number, or Binary.
  /// These attributes are compared against an existing attribute of an item. If
  /// any elements of the input are equal to the item attribute, the expression
  /// evaluates to true.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code> : Greater than or equal to the first value, and less
  /// than or equal to the second value.
  ///
  /// <code>AttributeValueList</code> must contain two <code>AttributeValue</code>
  /// elements of the same type, either String, Number, or Binary (not a set
  /// type). A target attribute matches if the target value is greater than, or
  /// equal to, the first element and less than, or equal to, the second element.
  /// If an item contains an <code>AttributeValue</code> element of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>.
  /// Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2",
  /// "1"]}</code>
  /// </li>
  /// </ul>
  /// For usage examples of <code>AttributeValueList</code> and
  /// <code>ComparisonOperator</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy
  /// Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ComparisonOperator comparisonOperator;

  /// One or more values to evaluate against the supplied attribute. The number of
  /// values in the list depends on the <code>ComparisonOperator</code> being
  /// used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based on
  /// ASCII character code values. For example, <code>a</code> is greater than
  /// <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a
  /// list of code values, see <a
  /// href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when it
  /// compares binary values.
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

/// Represents a request to perform a check that an item exists or to check the
/// condition of specific attributes of the item.
class ConditionCheck {
  /// A condition that must be satisfied in order for a conditional update to
  /// succeed. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html">Condition
  /// expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final String conditionExpression;

  /// The primary key of the item to be checked. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// Name of the table for the check item request. You can also provide the
  /// Amazon Resource Name (ARN) of the table in this parameter.
  final String tableName;

  /// One or more substitution tokens for attribute names in an expression. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeNames.html">Expression
  /// attribute names</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final Map<String, String>? expressionAttributeNames;

  /// One or more values that can be substituted in an expression. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html">Condition
  /// expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final Map<String, AttributeValue>? expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>ConditionCheck</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  ConditionCheck({
    required this.conditionExpression,
    required this.key,
    required this.tableName,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final conditionExpression = this.conditionExpression;
    final key = this.key;
    final tableName = this.tableName;
    final expressionAttributeNames = this.expressionAttributeNames;
    final expressionAttributeValues = this.expressionAttributeValues;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'ConditionExpression': conditionExpression,
      'Key': key,
      'TableName': tableName,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

enum ConditionalOperator {
  and,
  or,
}

extension ConditionalOperatorValueExtension on ConditionalOperator {
  String toValue() {
    switch (this) {
      case ConditionalOperator.and:
        return 'AND';
      case ConditionalOperator.or:
        return 'OR';
    }
  }
}

extension ConditionalOperatorFromString on String {
  ConditionalOperator toConditionalOperator() {
    switch (this) {
      case 'AND':
        return ConditionalOperator.and;
      case 'OR':
        return ConditionalOperator.or;
    }
    throw Exception('$this is not known in enum ConditionalOperator');
  }
}

/// The capacity units consumed by an operation. The data returned includes the
/// total provisioned throughput consumed, along with statistics for the table
/// and any indexes involved in the operation. <code>ConsumedCapacity</code> is
/// only returned if the request asked for it. For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html">Provisioned
/// capacity mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.
class ConsumedCapacity {
  /// The total number of capacity units consumed by the operation.
  final double? capacityUnits;

  /// The amount of throughput consumed on each global index affected by the
  /// operation.
  final Map<String, Capacity>? globalSecondaryIndexes;

  /// The amount of throughput consumed on each local index affected by the
  /// operation.
  final Map<String, Capacity>? localSecondaryIndexes;

  /// The total number of read capacity units consumed by the operation.
  final double? readCapacityUnits;

  /// The amount of throughput consumed on the table affected by the operation.
  final Capacity? table;

  /// The name of the table that was affected by the operation. If you had
  /// specified the Amazon Resource Name (ARN) of a table in the input, you'll see
  /// the table ARN in the response.
  final String? tableName;

  /// The total number of write capacity units consumed by the operation.
  final double? writeCapacityUnits;

  ConsumedCapacity({
    this.capacityUnits,
    this.globalSecondaryIndexes,
    this.localSecondaryIndexes,
    this.readCapacityUnits,
    this.table,
    this.tableName,
    this.writeCapacityUnits,
  });

  factory ConsumedCapacity.fromJson(Map<String, dynamic> json) {
    return ConsumedCapacity(
      capacityUnits: json['CapacityUnits'] as double?,
      globalSecondaryIndexes:
          (json['GlobalSecondaryIndexes'] as Map<String, dynamic>?)?.map(
              (k, e) =>
                  MapEntry(k, Capacity.fromJson(e as Map<String, dynamic>))),
      localSecondaryIndexes:
          (json['LocalSecondaryIndexes'] as Map<String, dynamic>?)?.map(
              (k, e) =>
                  MapEntry(k, Capacity.fromJson(e as Map<String, dynamic>))),
      readCapacityUnits: json['ReadCapacityUnits'] as double?,
      table: json['Table'] != null
          ? Capacity.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
      writeCapacityUnits: json['WriteCapacityUnits'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityUnits = this.capacityUnits;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final localSecondaryIndexes = this.localSecondaryIndexes;
    final readCapacityUnits = this.readCapacityUnits;
    final table = this.table;
    final tableName = this.tableName;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      if (capacityUnits != null) 'CapacityUnits': capacityUnits,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (localSecondaryIndexes != null)
        'LocalSecondaryIndexes': localSecondaryIndexes,
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
      if (table != null) 'Table': table,
      if (tableName != null) 'TableName': tableName,
      if (writeCapacityUnits != null) 'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

/// Represents the continuous backups and point in time recovery settings on the
/// table.
class ContinuousBackupsDescription {
  /// <code>ContinuousBackupsStatus</code> can be one of the following states:
  /// ENABLED, DISABLED
  final ContinuousBackupsStatus continuousBackupsStatus;

  /// The description of the point in time recovery settings applied to the table.
  final PointInTimeRecoveryDescription? pointInTimeRecoveryDescription;

  ContinuousBackupsDescription({
    required this.continuousBackupsStatus,
    this.pointInTimeRecoveryDescription,
  });

  factory ContinuousBackupsDescription.fromJson(Map<String, dynamic> json) {
    return ContinuousBackupsDescription(
      continuousBackupsStatus: (json['ContinuousBackupsStatus'] as String)
          .toContinuousBackupsStatus(),
      pointInTimeRecoveryDescription: json['PointInTimeRecoveryDescription'] !=
              null
          ? PointInTimeRecoveryDescription.fromJson(
              json['PointInTimeRecoveryDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final continuousBackupsStatus = this.continuousBackupsStatus;
    final pointInTimeRecoveryDescription = this.pointInTimeRecoveryDescription;
    return {
      'ContinuousBackupsStatus': continuousBackupsStatus.toValue(),
      if (pointInTimeRecoveryDescription != null)
        'PointInTimeRecoveryDescription': pointInTimeRecoveryDescription,
    };
  }
}

enum ContinuousBackupsStatus {
  enabled,
  disabled,
}

extension ContinuousBackupsStatusValueExtension on ContinuousBackupsStatus {
  String toValue() {
    switch (this) {
      case ContinuousBackupsStatus.enabled:
        return 'ENABLED';
      case ContinuousBackupsStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ContinuousBackupsStatusFromString on String {
  ContinuousBackupsStatus toContinuousBackupsStatus() {
    switch (this) {
      case 'ENABLED':
        return ContinuousBackupsStatus.enabled;
      case 'DISABLED':
        return ContinuousBackupsStatus.disabled;
    }
    throw Exception('$this is not known in enum ContinuousBackupsStatus');
  }
}

enum ContributorInsightsAction {
  enable,
  disable,
}

extension ContributorInsightsActionValueExtension on ContributorInsightsAction {
  String toValue() {
    switch (this) {
      case ContributorInsightsAction.enable:
        return 'ENABLE';
      case ContributorInsightsAction.disable:
        return 'DISABLE';
    }
  }
}

extension ContributorInsightsActionFromString on String {
  ContributorInsightsAction toContributorInsightsAction() {
    switch (this) {
      case 'ENABLE':
        return ContributorInsightsAction.enable;
      case 'DISABLE':
        return ContributorInsightsAction.disable;
    }
    throw Exception('$this is not known in enum ContributorInsightsAction');
  }
}

enum ContributorInsightsStatus {
  enabling,
  enabled,
  disabling,
  disabled,
  failed,
}

extension ContributorInsightsStatusValueExtension on ContributorInsightsStatus {
  String toValue() {
    switch (this) {
      case ContributorInsightsStatus.enabling:
        return 'ENABLING';
      case ContributorInsightsStatus.enabled:
        return 'ENABLED';
      case ContributorInsightsStatus.disabling:
        return 'DISABLING';
      case ContributorInsightsStatus.disabled:
        return 'DISABLED';
      case ContributorInsightsStatus.failed:
        return 'FAILED';
    }
  }
}

extension ContributorInsightsStatusFromString on String {
  ContributorInsightsStatus toContributorInsightsStatus() {
    switch (this) {
      case 'ENABLING':
        return ContributorInsightsStatus.enabling;
      case 'ENABLED':
        return ContributorInsightsStatus.enabled;
      case 'DISABLING':
        return ContributorInsightsStatus.disabling;
      case 'DISABLED':
        return ContributorInsightsStatus.disabled;
      case 'FAILED':
        return ContributorInsightsStatus.failed;
    }
    throw Exception('$this is not known in enum ContributorInsightsStatus');
  }
}

/// Represents a Contributor Insights summary entry.
class ContributorInsightsSummary {
  /// Describes the current status for contributor insights for the given table
  /// and index, if applicable.
  final ContributorInsightsStatus? contributorInsightsStatus;

  /// Name of the index associated with the summary, if any.
  final String? indexName;

  /// Name of the table associated with the summary.
  final String? tableName;

  ContributorInsightsSummary({
    this.contributorInsightsStatus,
    this.indexName,
    this.tableName,
  });

  factory ContributorInsightsSummary.fromJson(Map<String, dynamic> json) {
    return ContributorInsightsSummary(
      contributorInsightsStatus: (json['ContributorInsightsStatus'] as String?)
          ?.toContributorInsightsStatus(),
      indexName: json['IndexName'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributorInsightsStatus = this.contributorInsightsStatus;
    final indexName = this.indexName;
    final tableName = this.tableName;
    return {
      if (contributorInsightsStatus != null)
        'ContributorInsightsStatus': contributorInsightsStatus.toValue(),
      if (indexName != null) 'IndexName': indexName,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

class CreateBackupOutput {
  /// Contains the details of the backup created for the table.
  final BackupDetails? backupDetails;

  CreateBackupOutput({
    this.backupDetails,
  });

  factory CreateBackupOutput.fromJson(Map<String, dynamic> json) {
    return CreateBackupOutput(
      backupDetails: json['BackupDetails'] != null
          ? BackupDetails.fromJson(
              json['BackupDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupDetails = this.backupDetails;
    return {
      if (backupDetails != null) 'BackupDetails': backupDetails,
    };
  }
}

/// Represents a new global secondary index to be added to an existing table.
class CreateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be created.
  final String indexName;

  /// The key schema for the global secondary index.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into an
  /// index. These are in addition to the primary key attributes and index key
  /// attributes, which are automatically projected.
  final Projection projection;

  /// The maximum number of read and write units for the global secondary index
  /// being created. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  final OnDemandThroughput? onDemandThroughput;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ProvisionedThroughput? provisionedThroughput;

  CreateGlobalSecondaryIndexAction({
    required this.indexName,
    required this.keySchema,
    required this.projection,
    this.onDemandThroughput,
    this.provisionedThroughput,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final projection = this.projection;
    final onDemandThroughput = this.onDemandThroughput;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      'IndexName': indexName,
      'KeySchema': keySchema,
      'Projection': projection,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

class CreateGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription? globalTableDescription;

  CreateGlobalTableOutput({
    this.globalTableDescription,
  });

  factory CreateGlobalTableOutput.fromJson(Map<String, dynamic> json) {
    return CreateGlobalTableOutput(
      globalTableDescription: json['GlobalTableDescription'] != null
          ? GlobalTableDescription.fromJson(
              json['GlobalTableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableDescription = this.globalTableDescription;
    return {
      if (globalTableDescription != null)
        'GlobalTableDescription': globalTableDescription,
    };
  }
}

/// Represents a replica to be added.
class CreateReplicaAction {
  /// The Region of the replica to be added.
  final String regionName;

  CreateReplicaAction({
    required this.regionName,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      'RegionName': regionName,
    };
  }
}

/// Represents a replica to be created.
class CreateReplicationGroupMemberAction {
  /// The Region where the new replica will be created.
  final String regionName;

  /// Replica-specific global secondary index settings.
  final List<ReplicaGlobalSecondaryIndex>? globalSecondaryIndexes;

  /// The KMS key that should be used for KMS encryption in the new replica. To
  /// specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or
  /// alias ARN. Note that you should only provide this parameter if the key is
  /// different from the default DynamoDB KMS key <code>alias/aws/dynamodb</code>.
  final String? kMSMasterKeyId;

  /// The maximum on-demand throughput settings for the specified replica table
  /// being created. You can only modify <code>MaxReadRequestUnits</code>, because
  /// you can't modify <code>MaxWriteRequestUnits</code> for individual replica
  /// tables.
  final OnDemandThroughputOverride? onDemandThroughputOverride;

  /// Replica-specific provisioned throughput. If not specified, uses the source
  /// table's provisioned throughput settings.
  final ProvisionedThroughputOverride? provisionedThroughputOverride;

  /// Replica-specific table class. If not specified, uses the source table's
  /// table class.
  final TableClass? tableClassOverride;

  CreateReplicationGroupMemberAction({
    required this.regionName,
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.onDemandThroughputOverride,
    this.provisionedThroughputOverride,
    this.tableClassOverride,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final kMSMasterKeyId = this.kMSMasterKeyId;
    final onDemandThroughputOverride = this.onDemandThroughputOverride;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    final tableClassOverride = this.tableClassOverride;
    return {
      'RegionName': regionName,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (kMSMasterKeyId != null) 'KMSMasterKeyId': kMSMasterKeyId,
      if (onDemandThroughputOverride != null)
        'OnDemandThroughputOverride': onDemandThroughputOverride,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
      if (tableClassOverride != null)
        'TableClassOverride': tableClassOverride.toValue(),
    };
  }
}

/// Represents the output of a <code>CreateTable</code> operation.
class CreateTableOutput {
  /// Represents the properties of the table.
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

/// Processing options for the CSV file being imported.
class CsvOptions {
  /// The delimiter used for separating items in the CSV file being imported.
  final String? delimiter;

  /// List of the headers used to specify a common header for all source CSV files
  /// being imported. If this field is specified then the first line of each CSV
  /// file is treated as data instead of the header. If this field is not
  /// specified the the first line of each CSV file is treated as the header.
  final List<String>? headerList;

  CsvOptions({
    this.delimiter,
    this.headerList,
  });

  factory CsvOptions.fromJson(Map<String, dynamic> json) {
    return CsvOptions(
      delimiter: json['Delimiter'] as String?,
      headerList: (json['HeaderList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    final headerList = this.headerList;
    return {
      if (delimiter != null) 'Delimiter': delimiter,
      if (headerList != null) 'HeaderList': headerList,
    };
  }
}

/// Represents a request to perform a <code>DeleteItem</code> operation.
class Delete {
  /// The primary key of the item to be deleted. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// Name of the table in which the item to be deleted resides. You can also
  /// provide the Amazon Resource Name (ARN) of the table in this parameter.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional delete to
  /// succeed.
  final String? conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String>? expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue>? expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Delete</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  Delete({
    required this.key,
    required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final tableName = this.tableName;
    final conditionExpression = this.conditionExpression;
    final expressionAttributeNames = this.expressionAttributeNames;
    final expressionAttributeValues = this.expressionAttributeValues;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'Key': key,
      'TableName': tableName,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

class DeleteBackupOutput {
  /// Contains the description of the backup created for the table.
  final BackupDescription? backupDescription;

  DeleteBackupOutput({
    this.backupDescription,
  });

  factory DeleteBackupOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBackupOutput(
      backupDescription: json['BackupDescription'] != null
          ? BackupDescription.fromJson(
              json['BackupDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupDescription = this.backupDescription;
    return {
      if (backupDescription != null) 'BackupDescription': backupDescription,
    };
  }
}

/// Represents a global secondary index to be deleted from an existing table.
class DeleteGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be deleted.
  final String indexName;

  DeleteGlobalSecondaryIndexAction({
    required this.indexName,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    return {
      'IndexName': indexName,
    };
  }
}

/// Represents the output of a <code>DeleteItem</code> operation.
class DeleteItemOutput {
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the item as it appeared before the <code>DeleteItem</code>
  /// operation. This map appears in the response only if
  /// <code>ReturnValues</code> was specified as <code>ALL_OLD</code> in the
  /// request.
  final Map<String, AttributeValue>? attributes;

  /// The capacity units consumed by the <code>DeleteItem</code> operation. The
  /// data returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html">Provisioned
  /// capacity mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>DeleteItem</code> operation. <code>ItemCollectionMetrics</code> is
  /// only returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  final ItemCollectionMetrics? itemCollectionMetrics;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory DeleteItemOutput.fromJson(Map<String, dynamic> json) {
    return DeleteItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      itemCollectionMetrics: json['ItemCollectionMetrics'] != null
          ? ItemCollectionMetrics.fromJson(
              json['ItemCollectionMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacity = this.consumedCapacity;
    final itemCollectionMetrics = this.itemCollectionMetrics;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (itemCollectionMetrics != null)
        'ItemCollectionMetrics': itemCollectionMetrics,
    };
  }
}

/// Represents a replica to be removed.
class DeleteReplicaAction {
  /// The Region of the replica to be removed.
  final String regionName;

  DeleteReplicaAction({
    required this.regionName,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      'RegionName': regionName,
    };
  }
}

/// Represents a replica to be deleted.
class DeleteReplicationGroupMemberAction {
  /// The Region where the replica exists.
  final String regionName;

  DeleteReplicationGroupMemberAction({
    required this.regionName,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      'RegionName': regionName,
    };
  }
}

/// Represents a request to perform a <code>DeleteItem</code> operation on an
/// item.
class DeleteRequest {
  /// A map of attribute name to attribute values, representing the primary key of
  /// the item to delete. All of the table's primary key attributes must be
  /// specified, and their data types must match those of the table's key schema.
  final Map<String, AttributeValue> key;

  DeleteRequest({
    required this.key,
  });

  factory DeleteRequest.fromJson(Map<String, dynamic> json) {
    return DeleteRequest(
      key: (json['Key'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

class DeleteResourcePolicyOutput {
  /// A unique string that represents the revision ID of the policy. If you're
  /// comparing revision IDs, make sure to always use string comparison logic.
  ///
  /// This value will be empty if you make a request against a resource without a
  /// policy.
  final String? revisionId;

  DeleteResourcePolicyOutput({
    this.revisionId,
  });

  factory DeleteResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyOutput(
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    return {
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

/// Represents the output of a <code>DeleteTable</code> operation.
class DeleteTableOutput {
  /// Represents the properties of a table.
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

class DescribeBackupOutput {
  /// Contains the description of the backup created for the table.
  final BackupDescription? backupDescription;

  DescribeBackupOutput({
    this.backupDescription,
  });

  factory DescribeBackupOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBackupOutput(
      backupDescription: json['BackupDescription'] != null
          ? BackupDescription.fromJson(
              json['BackupDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupDescription = this.backupDescription;
    return {
      if (backupDescription != null) 'BackupDescription': backupDescription,
    };
  }
}

class DescribeContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on the
  /// table.
  final ContinuousBackupsDescription? continuousBackupsDescription;

  DescribeContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });

  factory DescribeContinuousBackupsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeContinuousBackupsOutput(
      continuousBackupsDescription: json['ContinuousBackupsDescription'] != null
          ? ContinuousBackupsDescription.fromJson(
              json['ContinuousBackupsDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final continuousBackupsDescription = this.continuousBackupsDescription;
    return {
      if (continuousBackupsDescription != null)
        'ContinuousBackupsDescription': continuousBackupsDescription,
    };
  }
}

class DescribeContributorInsightsOutput {
  /// List of names of the associated contributor insights rules.
  final List<String>? contributorInsightsRuleList;

  /// Current status of contributor insights.
  final ContributorInsightsStatus? contributorInsightsStatus;

  /// Returns information about the last failure that was encountered.
  ///
  /// The most common exceptions for a FAILED status are:
  ///
  /// <ul>
  /// <li>
  /// LimitExceededException - Per-account Amazon CloudWatch Contributor Insights
  /// rule limit reached. Please disable Contributor Insights for other
  /// tables/indexes OR disable Contributor Insights rules before retrying.
  /// </li>
  /// <li>
  /// AccessDeniedException - Amazon CloudWatch Contributor Insights rules cannot
  /// be modified due to insufficient permissions.
  /// </li>
  /// <li>
  /// AccessDeniedException - Failed to create service-linked role for Contributor
  /// Insights due to insufficient permissions.
  /// </li>
  /// <li>
  /// InternalServerError - Failed to create Amazon CloudWatch Contributor
  /// Insights rules. Please retry request.
  /// </li>
  /// </ul>
  final FailureException? failureException;

  /// The name of the global secondary index being described.
  final String? indexName;

  /// Timestamp of the last time the status was changed.
  final DateTime? lastUpdateDateTime;

  /// The name of the table being described.
  final String? tableName;

  DescribeContributorInsightsOutput({
    this.contributorInsightsRuleList,
    this.contributorInsightsStatus,
    this.failureException,
    this.indexName,
    this.lastUpdateDateTime,
    this.tableName,
  });

  factory DescribeContributorInsightsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeContributorInsightsOutput(
      contributorInsightsRuleList:
          (json['ContributorInsightsRuleList'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      contributorInsightsStatus: (json['ContributorInsightsStatus'] as String?)
          ?.toContributorInsightsStatus(),
      failureException: json['FailureException'] != null
          ? FailureException.fromJson(
              json['FailureException'] as Map<String, dynamic>)
          : null,
      indexName: json['IndexName'] as String?,
      lastUpdateDateTime: timeStampFromJson(json['LastUpdateDateTime']),
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributorInsightsRuleList = this.contributorInsightsRuleList;
    final contributorInsightsStatus = this.contributorInsightsStatus;
    final failureException = this.failureException;
    final indexName = this.indexName;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final tableName = this.tableName;
    return {
      if (contributorInsightsRuleList != null)
        'ContributorInsightsRuleList': contributorInsightsRuleList,
      if (contributorInsightsStatus != null)
        'ContributorInsightsStatus': contributorInsightsStatus.toValue(),
      if (failureException != null) 'FailureException': failureException,
      if (indexName != null) 'IndexName': indexName,
      if (lastUpdateDateTime != null)
        'LastUpdateDateTime': unixTimestampToJson(lastUpdateDateTime),
      if (tableName != null) 'TableName': tableName,
    };
  }
}

class DescribeEndpointsResponse {
  /// List of endpoints.
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

class DescribeExportOutput {
  /// Represents the properties of the export.
  final ExportDescription? exportDescription;

  DescribeExportOutput({
    this.exportDescription,
  });

  factory DescribeExportOutput.fromJson(Map<String, dynamic> json) {
    return DescribeExportOutput(
      exportDescription: json['ExportDescription'] != null
          ? ExportDescription.fromJson(
              json['ExportDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportDescription = this.exportDescription;
    return {
      if (exportDescription != null) 'ExportDescription': exportDescription,
    };
  }
}

class DescribeGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription? globalTableDescription;

  DescribeGlobalTableOutput({
    this.globalTableDescription,
  });

  factory DescribeGlobalTableOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGlobalTableOutput(
      globalTableDescription: json['GlobalTableDescription'] != null
          ? GlobalTableDescription.fromJson(
              json['GlobalTableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableDescription = this.globalTableDescription;
    return {
      if (globalTableDescription != null)
        'GlobalTableDescription': globalTableDescription,
    };
  }
}

class DescribeGlobalTableSettingsOutput {
  /// The name of the global table.
  final String? globalTableName;

  /// The Region-specific settings for the global table.
  final List<ReplicaSettingsDescription>? replicaSettings;

  DescribeGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });

  factory DescribeGlobalTableSettingsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeGlobalTableSettingsOutput(
      globalTableName: json['GlobalTableName'] as String?,
      replicaSettings: (json['ReplicaSettings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicaSettingsDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableName = this.globalTableName;
    final replicaSettings = this.replicaSettings;
    return {
      if (globalTableName != null) 'GlobalTableName': globalTableName,
      if (replicaSettings != null) 'ReplicaSettings': replicaSettings,
    };
  }
}

class DescribeImportOutput {
  /// Represents the properties of the table created for the import, and
  /// parameters of the import. The import parameters include import status, how
  /// many items were processed, and how many errors were encountered.
  final ImportTableDescription importTableDescription;

  DescribeImportOutput({
    required this.importTableDescription,
  });

  factory DescribeImportOutput.fromJson(Map<String, dynamic> json) {
    return DescribeImportOutput(
      importTableDescription: ImportTableDescription.fromJson(
          json['ImportTableDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final importTableDescription = this.importTableDescription;
    return {
      'ImportTableDescription': importTableDescription,
    };
  }
}

class DescribeKinesisStreamingDestinationOutput {
  /// The list of replica structures for the table being described.
  final List<KinesisDataStreamDestination>? kinesisDataStreamDestinations;

  /// The name of the table being described.
  final String? tableName;

  DescribeKinesisStreamingDestinationOutput({
    this.kinesisDataStreamDestinations,
    this.tableName,
  });

  factory DescribeKinesisStreamingDestinationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeKinesisStreamingDestinationOutput(
      kinesisDataStreamDestinations: (json['KinesisDataStreamDestinations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              KinesisDataStreamDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisDataStreamDestinations = this.kinesisDataStreamDestinations;
    final tableName = this.tableName;
    return {
      if (kinesisDataStreamDestinations != null)
        'KinesisDataStreamDestinations': kinesisDataStreamDestinations,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// Represents the output of a <code>DescribeLimits</code> operation.
class DescribeLimitsOutput {
  /// The maximum total read capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  final int? accountMaxReadCapacityUnits;

  /// The maximum total write capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  final int? accountMaxWriteCapacityUnits;

  /// The maximum read capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the read
  /// capacity units provisioned for its global secondary indexes (GSIs).
  final int? tableMaxReadCapacityUnits;

  /// The maximum write capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the write
  /// capacity units provisioned for its global secondary indexes (GSIs).
  final int? tableMaxWriteCapacityUnits;

  DescribeLimitsOutput({
    this.accountMaxReadCapacityUnits,
    this.accountMaxWriteCapacityUnits,
    this.tableMaxReadCapacityUnits,
    this.tableMaxWriteCapacityUnits,
  });

  factory DescribeLimitsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeLimitsOutput(
      accountMaxReadCapacityUnits: json['AccountMaxReadCapacityUnits'] as int?,
      accountMaxWriteCapacityUnits:
          json['AccountMaxWriteCapacityUnits'] as int?,
      tableMaxReadCapacityUnits: json['TableMaxReadCapacityUnits'] as int?,
      tableMaxWriteCapacityUnits: json['TableMaxWriteCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountMaxReadCapacityUnits = this.accountMaxReadCapacityUnits;
    final accountMaxWriteCapacityUnits = this.accountMaxWriteCapacityUnits;
    final tableMaxReadCapacityUnits = this.tableMaxReadCapacityUnits;
    final tableMaxWriteCapacityUnits = this.tableMaxWriteCapacityUnits;
    return {
      if (accountMaxReadCapacityUnits != null)
        'AccountMaxReadCapacityUnits': accountMaxReadCapacityUnits,
      if (accountMaxWriteCapacityUnits != null)
        'AccountMaxWriteCapacityUnits': accountMaxWriteCapacityUnits,
      if (tableMaxReadCapacityUnits != null)
        'TableMaxReadCapacityUnits': tableMaxReadCapacityUnits,
      if (tableMaxWriteCapacityUnits != null)
        'TableMaxWriteCapacityUnits': tableMaxWriteCapacityUnits,
    };
  }
}

/// Represents the output of a <code>DescribeTable</code> operation.
class DescribeTableOutput {
  /// The properties of the table.
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

class DescribeTableReplicaAutoScalingOutput {
  /// Represents the auto scaling properties of the table.
  final TableAutoScalingDescription? tableAutoScalingDescription;

  DescribeTableReplicaAutoScalingOutput({
    this.tableAutoScalingDescription,
  });

  factory DescribeTableReplicaAutoScalingOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeTableReplicaAutoScalingOutput(
      tableAutoScalingDescription: json['TableAutoScalingDescription'] != null
          ? TableAutoScalingDescription.fromJson(
              json['TableAutoScalingDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableAutoScalingDescription = this.tableAutoScalingDescription;
    return {
      if (tableAutoScalingDescription != null)
        'TableAutoScalingDescription': tableAutoScalingDescription,
    };
  }
}

class DescribeTimeToLiveOutput {
  /// <p/>
  final TimeToLiveDescription? timeToLiveDescription;

  DescribeTimeToLiveOutput({
    this.timeToLiveDescription,
  });

  factory DescribeTimeToLiveOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTimeToLiveOutput(
      timeToLiveDescription: json['TimeToLiveDescription'] != null
          ? TimeToLiveDescription.fromJson(
              json['TimeToLiveDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timeToLiveDescription = this.timeToLiveDescription;
    return {
      if (timeToLiveDescription != null)
        'TimeToLiveDescription': timeToLiveDescription,
    };
  }
}

enum DestinationStatus {
  enabling,
  active,
  disabling,
  disabled,
  enableFailed,
  updating,
}

extension DestinationStatusValueExtension on DestinationStatus {
  String toValue() {
    switch (this) {
      case DestinationStatus.enabling:
        return 'ENABLING';
      case DestinationStatus.active:
        return 'ACTIVE';
      case DestinationStatus.disabling:
        return 'DISABLING';
      case DestinationStatus.disabled:
        return 'DISABLED';
      case DestinationStatus.enableFailed:
        return 'ENABLE_FAILED';
      case DestinationStatus.updating:
        return 'UPDATING';
    }
  }
}

extension DestinationStatusFromString on String {
  DestinationStatus toDestinationStatus() {
    switch (this) {
      case 'ENABLING':
        return DestinationStatus.enabling;
      case 'ACTIVE':
        return DestinationStatus.active;
      case 'DISABLING':
        return DestinationStatus.disabling;
      case 'DISABLED':
        return DestinationStatus.disabled;
      case 'ENABLE_FAILED':
        return DestinationStatus.enableFailed;
      case 'UPDATING':
        return DestinationStatus.updating;
    }
    throw Exception('$this is not known in enum DestinationStatus');
  }
}

/// Enables setting the configuration for Kinesis Streaming.
class EnableKinesisStreamingConfiguration {
  /// Toggle for the precision of Kinesis data stream timestamp. The values are
  /// either <code>MILLISECOND</code> or <code>MICROSECOND</code>.
  final ApproximateCreationDateTimePrecision?
      approximateCreationDateTimePrecision;

  EnableKinesisStreamingConfiguration({
    this.approximateCreationDateTimePrecision,
  });

  factory EnableKinesisStreamingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return EnableKinesisStreamingConfiguration(
      approximateCreationDateTimePrecision:
          (json['ApproximateCreationDateTimePrecision'] as String?)
              ?.toApproximateCreationDateTimePrecision(),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateCreationDateTimePrecision =
        this.approximateCreationDateTimePrecision;
    return {
      if (approximateCreationDateTimePrecision != null)
        'ApproximateCreationDateTimePrecision':
            approximateCreationDateTimePrecision.toValue(),
    };
  }
}

/// An endpoint information details.
class Endpoint {
  /// IP address of the endpoint.
  final String address;

  /// Endpoint cache time to live (TTL) value.
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

class ExecuteStatementOutput {
  final ConsumedCapacity? consumedCapacity;

  /// If a read operation was used, this property will contain the result of the
  /// read operation; a map of attribute names and their values. For the write
  /// operations this value will be empty.
  final List<Map<String, AttributeValue>>? items;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request. If <code>LastEvaluatedKey</code> is empty, then
  /// the "last page" of results has been processed and there is no more data to
  /// be retrieved. If <code>LastEvaluatedKey</code> is not empty, it does not
  /// necessarily mean that there is more data in the result set. The only way to
  /// know when you have reached the end of the result set is when
  /// <code>LastEvaluatedKey</code> is empty.
  final Map<String, AttributeValue>? lastEvaluatedKey;

  /// If the response of a read request exceeds the response payload limit
  /// DynamoDB will set this value in the response. If set, you can use that this
  /// value in the subsequent request to get the remaining results.
  final String? nextToken;

  ExecuteStatementOutput({
    this.consumedCapacity,
    this.items,
    this.lastEvaluatedKey,
    this.nextToken,
  });

  factory ExecuteStatementOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteStatementOutput(
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final items = this.items;
    final lastEvaluatedKey = this.lastEvaluatedKey;
    final nextToken = this.nextToken;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (items != null) 'Items': items,
      if (lastEvaluatedKey != null) 'LastEvaluatedKey': lastEvaluatedKey,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ExecuteTransactionOutput {
  /// The capacity units consumed by the entire operation. The values of the list
  /// are ordered according to the ordering of the statements.
  final List<ConsumedCapacity>? consumedCapacity;

  /// The response to a PartiQL transaction.
  final List<ItemResponse>? responses;

  ExecuteTransactionOutput({
    this.consumedCapacity,
    this.responses,
  });

  factory ExecuteTransactionOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteTransactionOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      responses: (json['Responses'] as List?)
          ?.whereNotNull()
          .map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final responses = this.responses;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (responses != null) 'Responses': responses,
    };
  }
}

/// Represents a condition to be compared with an attribute value. This
/// condition can be used with <code>DeleteItem</code>, <code>PutItem</code>, or
/// <code>UpdateItem</code> operations; if the comparison evaluates to true, the
/// operation succeeds; if not, the operation fails. You can use
/// <code>ExpectedAttributeValue</code> in one of two different ways:
///
/// <ul>
/// <li>
/// Use <code>AttributeValueList</code> to specify one or more values to compare
/// against an attribute. Use <code>ComparisonOperator</code> to specify how you
/// want to perform the comparison. If the comparison evaluates to true, then
/// the conditional operation succeeds.
/// </li>
/// <li>
/// Use <code>Value</code> to specify a value that DynamoDB will compare against
/// an attribute. If the values match, then <code>ExpectedAttributeValue</code>
/// evaluates to true and the conditional operation succeeds. Optionally, you
/// can also set <code>Exists</code> to false, indicating that you <i>do not</i>
/// expect to find the attribute value in the table. In this case, the
/// conditional operation succeeds only if the comparison evaluates to false.
/// </li>
/// </ul>
/// <code>Value</code> and <code>Exists</code> are incompatible with
/// <code>AttributeValueList</code> and <code>ComparisonOperator</code>. Note
/// that if you use both sets of parameters at once, DynamoDB will return a
/// <code>ValidationException</code> exception.
class ExpectedAttributeValue {
  /// One or more values to evaluate against the supplied attribute. The number of
  /// values in the list depends on the <code>ComparisonOperator</code> being
  /// used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based on
  /// ASCII character code values. For example, <code>a</code> is greater than
  /// <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a
  /// list of code values, see <a
  /// href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when it
  /// compares binary values.
  ///
  /// For information on specifying data types in JSON, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON
  /// Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final List<AttributeValue>? attributeValueList;

  /// A comparator for evaluating attributes in the
  /// <code>AttributeValueList</code>. For example, equals, greater than, less
  /// than, etc.
  ///
  /// The following comparison operators are available:
  ///
  /// <code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
  /// NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code>
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code> : Equal. <code>EQ</code> is supported for all data types,
  /// including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, Binary, String
  /// Set, Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also,
  /// <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NE</code> : Not equal. <code>NE</code> is supported for all data
  /// types, including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, Binary, String Set,
  /// Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> of a different type than the one provided in the
  /// request, the value does not match. For example, <code>{"S":"6"}</code> does
  /// not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not
  /// equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LE</code> : Less than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LT</code> : Less than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, or Binary (not a set
  /// type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GE</code> : Greater than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GT</code> : Greater than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the existence of an attribute, not its data type. If
  /// the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This
  /// result is because the attribute "<code>a</code>" exists; its data type is
  /// not relevant to the <code>NOT_NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>NULL</code> : The attribute does not exist. <code>NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the nonexistence of an attribute, not its data type.
  /// If the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NULL</code>, the result is a Boolean <code>false</code>. This is
  /// because the attribute "<code>a</code>" exists; its data type is not relevant
  /// to the <code>NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>CONTAINS</code> : Checks for a subsequence, or value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is of type String, then
  /// the operator checks for a substring match. If the target attribute of the
  /// comparison is of type Binary, then the operator looks for a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then
  /// the operator evaluates to true if it finds an exact match with any member of
  /// the set.
  ///
  /// CONTAINS is supported for lists: When evaluating "<code>a CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence
  /// of a value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is a String, then the
  /// operator checks for the absence of a substring match. If the target
  /// attribute of the comparison is Binary, then the operator checks for the
  /// absence of a subsequence of the target that matches the input. If the target
  /// attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>",
  /// or "<code>BS</code>"), then the operator evaluates to true if it <i>does
  /// not</i> find an exact match with any member of the set.
  ///
  /// NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code> : Checks for a prefix.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String or Binary (not a Number or a set
  /// type). The target attribute of the comparison must be of type String or
  /// Binary (not a Number or a set type).
  /// <p/> </li>
  /// <li>
  /// <code>IN</code> : Checks for matching elements in a list.
  ///
  /// <code>AttributeValueList</code> can contain one or more
  /// <code>AttributeValue</code> elements of type String, Number, or Binary.
  /// These attributes are compared against an existing attribute of an item. If
  /// any elements of the input are equal to the item attribute, the expression
  /// evaluates to true.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code> : Greater than or equal to the first value, and less
  /// than or equal to the second value.
  ///
  /// <code>AttributeValueList</code> must contain two <code>AttributeValue</code>
  /// elements of the same type, either String, Number, or Binary (not a set
  /// type). A target attribute matches if the target value is greater than, or
  /// equal to, the first element and less than, or equal to, the second element.
  /// If an item contains an <code>AttributeValue</code> element of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>.
  /// Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2",
  /// "1"]}</code>
  /// </li>
  /// </ul>
  final ComparisonOperator? comparisonOperator;

  /// Causes DynamoDB to evaluate the value before attempting a conditional
  /// operation:
  ///
  /// <ul>
  /// <li>
  /// If <code>Exists</code> is <code>true</code>, DynamoDB will check to see if
  /// that attribute value already exists in the table. If it is found, then the
  /// operation succeeds. If it is not found, the operation fails with a
  /// <code>ConditionCheckFailedException</code>.
  /// </li>
  /// <li>
  /// If <code>Exists</code> is <code>false</code>, DynamoDB assumes that the
  /// attribute value does not exist in the table. If in fact the value does not
  /// exist, then the assumption is valid and the operation succeeds. If the value
  /// is found, despite the assumption that it does not exist, the operation fails
  /// with a <code>ConditionCheckFailedException</code>.
  /// </li>
  /// </ul>
  /// The default setting for <code>Exists</code> is <code>true</code>. If you
  /// supply a <code>Value</code> all by itself, DynamoDB assumes the attribute
  /// exists: You don't have to set <code>Exists</code> to <code>true</code>,
  /// because it is implied.
  ///
  /// DynamoDB returns a <code>ValidationException</code> if:
  ///
  /// <ul>
  /// <li>
  /// <code>Exists</code> is <code>true</code> but there is no <code>Value</code>
  /// to check. (You expect a value to exist, but don't specify what that value
  /// is.)
  /// </li>
  /// <li>
  /// <code>Exists</code> is <code>false</code> but you also provide a
  /// <code>Value</code>. (You cannot expect an attribute to have a value, while
  /// also expecting it not to exist.)
  /// </li>
  /// </ul>
  final bool? exists;

  /// Represents the data for the expected attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the data
  /// type, and the value is the data itself.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
  /// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final AttributeValue? value;

  ExpectedAttributeValue({
    this.attributeValueList,
    this.comparisonOperator,
    this.exists,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final attributeValueList = this.attributeValueList;
    final comparisonOperator = this.comparisonOperator;
    final exists = this.exists;
    final value = this.value;
    return {
      if (attributeValueList != null) 'AttributeValueList': attributeValueList,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (exists != null) 'Exists': exists,
      if (value != null) 'Value': value,
    };
  }
}

/// Represents the properties of the exported table.
class ExportDescription {
  /// The billable size of the table export.
  final int? billedSizeBytes;

  /// The client token that was provided for the export task. A client token makes
  /// calls to <code>ExportTableToPointInTimeInput</code> idempotent, meaning that
  /// multiple identical calls have the same effect as one single call.
  final String? clientToken;

  /// The time at which the export task completed.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) of the table export.
  final String? exportArn;

  /// The format of the exported data. Valid values for <code>ExportFormat</code>
  /// are <code>DYNAMODB_JSON</code> or <code>ION</code>.
  final ExportFormat? exportFormat;

  /// The name of the manifest file for the export task.
  final String? exportManifest;

  /// Export can be in one of the following states: IN_PROGRESS, COMPLETED, or
  /// FAILED.
  final ExportStatus? exportStatus;

  /// Point in time from which table data was exported.
  final DateTime? exportTime;

  /// The type of export that was performed. Valid values are
  /// <code>FULL_EXPORT</code> or <code>INCREMENTAL_EXPORT</code>.
  final ExportType? exportType;

  /// Status code for the result of the failed export.
  final String? failureCode;

  /// Export failure reason description.
  final String? failureMessage;

  /// Optional object containing the parameters specific to an incremental export.
  final IncrementalExportSpecification? incrementalExportSpecification;

  /// The number of items exported.
  final int? itemCount;

  /// The name of the Amazon S3 bucket containing the export.
  final String? s3Bucket;

  /// The ID of the Amazon Web Services account that owns the bucket containing
  /// the export.
  final String? s3BucketOwner;

  /// The Amazon S3 bucket prefix used as the file name and path of the exported
  /// snapshot.
  final String? s3Prefix;

  /// Type of encryption used on the bucket where export data is stored. Valid
  /// values for <code>S3SseAlgorithm</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>AES256</code> - server-side encryption with Amazon S3 managed keys
  /// </li>
  /// <li>
  /// <code>KMS</code> - server-side encryption with KMS managed keys
  /// </li>
  /// </ul>
  final S3SseAlgorithm? s3SseAlgorithm;

  /// The ID of the KMS managed key used to encrypt the S3 bucket where export
  /// data is stored (if applicable).
  final String? s3SseKmsKeyId;

  /// The time at which the export task began.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) of the table that was exported.
  final String? tableArn;

  /// Unique ID of the table that was exported.
  final String? tableId;

  ExportDescription({
    this.billedSizeBytes,
    this.clientToken,
    this.endTime,
    this.exportArn,
    this.exportFormat,
    this.exportManifest,
    this.exportStatus,
    this.exportTime,
    this.exportType,
    this.failureCode,
    this.failureMessage,
    this.incrementalExportSpecification,
    this.itemCount,
    this.s3Bucket,
    this.s3BucketOwner,
    this.s3Prefix,
    this.s3SseAlgorithm,
    this.s3SseKmsKeyId,
    this.startTime,
    this.tableArn,
    this.tableId,
  });

  factory ExportDescription.fromJson(Map<String, dynamic> json) {
    return ExportDescription(
      billedSizeBytes: json['BilledSizeBytes'] as int?,
      clientToken: json['ClientToken'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      exportArn: json['ExportArn'] as String?,
      exportFormat: (json['ExportFormat'] as String?)?.toExportFormat(),
      exportManifest: json['ExportManifest'] as String?,
      exportStatus: (json['ExportStatus'] as String?)?.toExportStatus(),
      exportTime: timeStampFromJson(json['ExportTime']),
      exportType: (json['ExportType'] as String?)?.toExportType(),
      failureCode: json['FailureCode'] as String?,
      failureMessage: json['FailureMessage'] as String?,
      incrementalExportSpecification: json['IncrementalExportSpecification'] !=
              null
          ? IncrementalExportSpecification.fromJson(
              json['IncrementalExportSpecification'] as Map<String, dynamic>)
          : null,
      itemCount: json['ItemCount'] as int?,
      s3Bucket: json['S3Bucket'] as String?,
      s3BucketOwner: json['S3BucketOwner'] as String?,
      s3Prefix: json['S3Prefix'] as String?,
      s3SseAlgorithm: (json['S3SseAlgorithm'] as String?)?.toS3SseAlgorithm(),
      s3SseKmsKeyId: json['S3SseKmsKeyId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      tableArn: json['TableArn'] as String?,
      tableId: json['TableId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billedSizeBytes = this.billedSizeBytes;
    final clientToken = this.clientToken;
    final endTime = this.endTime;
    final exportArn = this.exportArn;
    final exportFormat = this.exportFormat;
    final exportManifest = this.exportManifest;
    final exportStatus = this.exportStatus;
    final exportTime = this.exportTime;
    final exportType = this.exportType;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final incrementalExportSpecification = this.incrementalExportSpecification;
    final itemCount = this.itemCount;
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Prefix = this.s3Prefix;
    final s3SseAlgorithm = this.s3SseAlgorithm;
    final s3SseKmsKeyId = this.s3SseKmsKeyId;
    final startTime = this.startTime;
    final tableArn = this.tableArn;
    final tableId = this.tableId;
    return {
      if (billedSizeBytes != null) 'BilledSizeBytes': billedSizeBytes,
      if (clientToken != null) 'ClientToken': clientToken,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (exportArn != null) 'ExportArn': exportArn,
      if (exportFormat != null) 'ExportFormat': exportFormat.toValue(),
      if (exportManifest != null) 'ExportManifest': exportManifest,
      if (exportStatus != null) 'ExportStatus': exportStatus.toValue(),
      if (exportTime != null) 'ExportTime': unixTimestampToJson(exportTime),
      if (exportType != null) 'ExportType': exportType.toValue(),
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureMessage != null) 'FailureMessage': failureMessage,
      if (incrementalExportSpecification != null)
        'IncrementalExportSpecification': incrementalExportSpecification,
      if (itemCount != null) 'ItemCount': itemCount,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3BucketOwner != null) 'S3BucketOwner': s3BucketOwner,
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
      if (s3SseAlgorithm != null) 'S3SseAlgorithm': s3SseAlgorithm.toValue(),
      if (s3SseKmsKeyId != null) 'S3SseKmsKeyId': s3SseKmsKeyId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (tableArn != null) 'TableArn': tableArn,
      if (tableId != null) 'TableId': tableId,
    };
  }
}

enum ExportFormat {
  dynamodbJson,
  ion,
}

extension ExportFormatValueExtension on ExportFormat {
  String toValue() {
    switch (this) {
      case ExportFormat.dynamodbJson:
        return 'DYNAMODB_JSON';
      case ExportFormat.ion:
        return 'ION';
    }
  }
}

extension ExportFormatFromString on String {
  ExportFormat toExportFormat() {
    switch (this) {
      case 'DYNAMODB_JSON':
        return ExportFormat.dynamodbJson;
      case 'ION':
        return ExportFormat.ion;
    }
    throw Exception('$this is not known in enum ExportFormat');
  }
}

enum ExportStatus {
  inProgress,
  completed,
  failed,
}

extension ExportStatusValueExtension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.inProgress:
        return 'IN_PROGRESS';
      case ExportStatus.completed:
        return 'COMPLETED';
      case ExportStatus.failed:
        return 'FAILED';
    }
  }
}

extension ExportStatusFromString on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ExportStatus.inProgress;
      case 'COMPLETED':
        return ExportStatus.completed;
      case 'FAILED':
        return ExportStatus.failed;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

/// Summary information about an export task.
class ExportSummary {
  /// The Amazon Resource Name (ARN) of the export.
  final String? exportArn;

  /// Export can be in one of the following states: IN_PROGRESS, COMPLETED, or
  /// FAILED.
  final ExportStatus? exportStatus;

  /// The type of export that was performed. Valid values are
  /// <code>FULL_EXPORT</code> or <code>INCREMENTAL_EXPORT</code>.
  final ExportType? exportType;

  ExportSummary({
    this.exportArn,
    this.exportStatus,
    this.exportType,
  });

  factory ExportSummary.fromJson(Map<String, dynamic> json) {
    return ExportSummary(
      exportArn: json['ExportArn'] as String?,
      exportStatus: (json['ExportStatus'] as String?)?.toExportStatus(),
      exportType: (json['ExportType'] as String?)?.toExportType(),
    );
  }

  Map<String, dynamic> toJson() {
    final exportArn = this.exportArn;
    final exportStatus = this.exportStatus;
    final exportType = this.exportType;
    return {
      if (exportArn != null) 'ExportArn': exportArn,
      if (exportStatus != null) 'ExportStatus': exportStatus.toValue(),
      if (exportType != null) 'ExportType': exportType.toValue(),
    };
  }
}

class ExportTableToPointInTimeOutput {
  /// Contains a description of the table export.
  final ExportDescription? exportDescription;

  ExportTableToPointInTimeOutput({
    this.exportDescription,
  });

  factory ExportTableToPointInTimeOutput.fromJson(Map<String, dynamic> json) {
    return ExportTableToPointInTimeOutput(
      exportDescription: json['ExportDescription'] != null
          ? ExportDescription.fromJson(
              json['ExportDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportDescription = this.exportDescription;
    return {
      if (exportDescription != null) 'ExportDescription': exportDescription,
    };
  }
}

enum ExportType {
  fullExport,
  incrementalExport,
}

extension ExportTypeValueExtension on ExportType {
  String toValue() {
    switch (this) {
      case ExportType.fullExport:
        return 'FULL_EXPORT';
      case ExportType.incrementalExport:
        return 'INCREMENTAL_EXPORT';
    }
  }
}

extension ExportTypeFromString on String {
  ExportType toExportType() {
    switch (this) {
      case 'FULL_EXPORT':
        return ExportType.fullExport;
      case 'INCREMENTAL_EXPORT':
        return ExportType.incrementalExport;
    }
    throw Exception('$this is not known in enum ExportType');
  }
}

enum ExportViewType {
  newImage,
  newAndOldImages,
}

extension ExportViewTypeValueExtension on ExportViewType {
  String toValue() {
    switch (this) {
      case ExportViewType.newImage:
        return 'NEW_IMAGE';
      case ExportViewType.newAndOldImages:
        return 'NEW_AND_OLD_IMAGES';
    }
  }
}

extension ExportViewTypeFromString on String {
  ExportViewType toExportViewType() {
    switch (this) {
      case 'NEW_IMAGE':
        return ExportViewType.newImage;
      case 'NEW_AND_OLD_IMAGES':
        return ExportViewType.newAndOldImages;
    }
    throw Exception('$this is not known in enum ExportViewType');
  }
}

/// Represents a failure a contributor insights operation.
class FailureException {
  /// Description of the failure.
  final String? exceptionDescription;

  /// Exception name.
  final String? exceptionName;

  FailureException({
    this.exceptionDescription,
    this.exceptionName,
  });

  factory FailureException.fromJson(Map<String, dynamic> json) {
    return FailureException(
      exceptionDescription: json['ExceptionDescription'] as String?,
      exceptionName: json['ExceptionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionDescription = this.exceptionDescription;
    final exceptionName = this.exceptionName;
    return {
      if (exceptionDescription != null)
        'ExceptionDescription': exceptionDescription,
      if (exceptionName != null) 'ExceptionName': exceptionName,
    };
  }
}

/// Specifies an item and related attribute values to retrieve in a
/// <code>TransactGetItem</code> object.
class Get {
  /// A map of attribute names to <code>AttributeValue</code> objects that
  /// specifies the primary key of the item to retrieve.
  final Map<String, AttributeValue> key;

  /// The name of the table from which to retrieve the specified item. You can
  /// also provide the Amazon Resource Name (ARN) of the table in this parameter.
  final String tableName;

  /// One or more substitution tokens for attribute names in the
  /// ProjectionExpression parameter.
  final Map<String, String>? expressionAttributeNames;

  /// A string that identifies one or more attributes of the specified item to
  /// retrieve from the table. The attributes in the expression must be separated
  /// by commas. If no attribute names are specified, then all attributes of the
  /// specified item are returned. If any of the requested attributes are not
  /// found, they do not appear in the result.
  final String? projectionExpression;

  Get({
    required this.key,
    required this.tableName,
    this.expressionAttributeNames,
    this.projectionExpression,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final tableName = this.tableName;
    final expressionAttributeNames = this.expressionAttributeNames;
    final projectionExpression = this.projectionExpression;
    return {
      'Key': key,
      'TableName': tableName,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (projectionExpression != null)
        'ProjectionExpression': projectionExpression,
    };
  }
}

/// Represents the output of a <code>GetItem</code> operation.
class GetItemOutput {
  /// The capacity units consumed by the <code>GetItem</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption">Capacity
  /// unit consumption for read operations</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// A map of attribute names to <code>AttributeValue</code> objects, as
  /// specified by <code>ProjectionExpression</code>.
  final Map<String, AttributeValue>? item;

  GetItemOutput({
    this.consumedCapacity,
    this.item,
  });

  factory GetItemOutput.fromJson(Map<String, dynamic> json) {
    return GetItemOutput(
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      item: (json['Item'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final item = this.item;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (item != null) 'Item': item,
    };
  }
}

class GetResourcePolicyOutput {
  /// The resource-based policy document attached to the resource, which can be a
  /// table or stream, in JSON format.
  final String? policy;

  /// A unique string that represents the revision ID of the policy. If you're
  /// comparing revision IDs, make sure to always use string comparison logic.
  final String? revisionId;

  GetResourcePolicyOutput({
    this.policy,
    this.revisionId,
  });

  factory GetResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyOutput(
      policy: json['Policy'] as String?,
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'Policy': policy,
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

/// Represents the properties of a global secondary index.
class GlobalSecondaryIndex {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection projection;

  /// The maximum number of read and write units for the specified global
  /// secondary index. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  final OnDemandThroughput? onDemandThroughput;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ProvisionedThroughput? provisionedThroughput;

  GlobalSecondaryIndex({
    required this.indexName,
    required this.keySchema,
    required this.projection,
    this.onDemandThroughput,
    this.provisionedThroughput,
  });

  factory GlobalSecondaryIndex.fromJson(Map<String, dynamic> json) {
    return GlobalSecondaryIndex(
      indexName: json['IndexName'] as String,
      keySchema: (json['KeySchema'] as List)
          .whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      projection:
          Projection.fromJson(json['Projection'] as Map<String, dynamic>),
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final projection = this.projection;
    final onDemandThroughput = this.onDemandThroughput;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      'IndexName': indexName,
      'KeySchema': keySchema,
      'Projection': projection,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

/// Represents the auto scaling settings of a global secondary index for a
/// global table that will be modified.
class GlobalSecondaryIndexAutoScalingUpdate {
  /// The name of the global secondary index.
  final String? indexName;
  final AutoScalingSettingsUpdate? provisionedWriteCapacityAutoScalingUpdate;

  GlobalSecondaryIndexAutoScalingUpdate({
    this.indexName,
    this.provisionedWriteCapacityAutoScalingUpdate,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final provisionedWriteCapacityAutoScalingUpdate =
        this.provisionedWriteCapacityAutoScalingUpdate;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (provisionedWriteCapacityAutoScalingUpdate != null)
        'ProvisionedWriteCapacityAutoScalingUpdate':
            provisionedWriteCapacityAutoScalingUpdate,
    };
  }
}

/// Represents the properties of a global secondary index.
class GlobalSecondaryIndexDescription {
  /// Indicates whether the index is currently backfilling. <i>Backfilling</i> is
  /// the process of reading items from the table and determining whether they can
  /// be added to the index. (Not all items will qualify: For example, a partition
  /// key cannot have any duplicate values.) If an item can be added to the index,
  /// DynamoDB will do so. After all items have been processed, the backfilling
  /// operation is complete and <code>Backfilling</code> is false.
  ///
  /// You can delete an index that is being created during the
  /// <code>Backfilling</code> phase when <code>IndexStatus</code> is set to
  /// CREATING and <code>Backfilling</code> is true. You can't delete the index
  /// that is being created when <code>IndexStatus</code> is set to CREATING and
  /// <code>Backfilling</code> is false.
  /// <note>
  /// For indexes that were created during a <code>CreateTable</code> operation,
  /// the <code>Backfilling</code> attribute does not appear in the
  /// <code>DescribeTable</code> output.
  /// </note>
  final bool? backfilling;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  final String? indexArn;

  /// The name of the global secondary index.
  final String? indexName;

  /// The total size of the specified index, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? indexSizeBytes;

  /// The current state of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul>
  final IndexStatus? indexStatus;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? itemCount;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement>? keySchema;

  /// The maximum number of read and write units for the specified global
  /// secondary index. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  final OnDemandThroughput? onDemandThroughput;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection? projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ProvisionedThroughputDescription? provisionedThroughput;

  GlobalSecondaryIndexDescription({
    this.backfilling,
    this.indexArn,
    this.indexName,
    this.indexSizeBytes,
    this.indexStatus,
    this.itemCount,
    this.keySchema,
    this.onDemandThroughput,
    this.projection,
    this.provisionedThroughput,
  });

  factory GlobalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) {
    return GlobalSecondaryIndexDescription(
      backfilling: json['Backfilling'] as bool?,
      indexArn: json['IndexArn'] as String?,
      indexName: json['IndexName'] as String?,
      indexSizeBytes: json['IndexSizeBytes'] as int?,
      indexStatus: (json['IndexStatus'] as String?)?.toIndexStatus(),
      itemCount: json['ItemCount'] as int?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      projection: json['Projection'] != null
          ? Projection.fromJson(json['Projection'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughputDescription.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backfilling = this.backfilling;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final indexSizeBytes = this.indexSizeBytes;
    final indexStatus = this.indexStatus;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final onDemandThroughput = this.onDemandThroughput;
    final projection = this.projection;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      if (backfilling != null) 'Backfilling': backfilling,
      if (indexArn != null) 'IndexArn': indexArn,
      if (indexName != null) 'IndexName': indexName,
      if (indexSizeBytes != null) 'IndexSizeBytes': indexSizeBytes,
      if (indexStatus != null) 'IndexStatus': indexStatus.toValue(),
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (projection != null) 'Projection': projection,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

/// Represents the properties of a global secondary index for the table when the
/// backup was created.
class GlobalSecondaryIndexInfo {
  /// The name of the global secondary index.
  final String? indexName;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement>? keySchema;
  final OnDemandThroughput? onDemandThroughput;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection? projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  final ProvisionedThroughput? provisionedThroughput;

  GlobalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.onDemandThroughput,
    this.projection,
    this.provisionedThroughput,
  });

  factory GlobalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) {
    return GlobalSecondaryIndexInfo(
      indexName: json['IndexName'] as String?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      projection: json['Projection'] != null
          ? Projection.fromJson(json['Projection'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final onDemandThroughput = this.onDemandThroughput;
    final projection = this.projection;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (keySchema != null) 'KeySchema': keySchema,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (projection != null) 'Projection': projection,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new global secondary index to be added to an existing table.
/// </li>
/// <li>
/// New provisioned throughput parameters for an existing global secondary
/// index.
/// </li>
/// <li>
/// An existing global secondary index to be removed from an existing table.
/// </li>
/// </ul>
class GlobalSecondaryIndexUpdate {
  /// The parameters required for creating a global secondary index on an existing
  /// table:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName </code>
  /// </li>
  /// <li>
  /// <code>KeySchema </code>
  /// </li>
  /// <li>
  /// <code>AttributeDefinitions </code>
  /// </li>
  /// <li>
  /// <code>Projection </code>
  /// </li>
  /// <li>
  /// <code>ProvisionedThroughput </code>
  /// </li>
  /// </ul>
  final CreateGlobalSecondaryIndexAction? create;

  /// The name of an existing global secondary index to be removed.
  final DeleteGlobalSecondaryIndexAction? delete;

  /// The name of an existing global secondary index, along with new provisioned
  /// throughput settings to be applied to that index.
  final UpdateGlobalSecondaryIndexAction? update;

  GlobalSecondaryIndexUpdate({
    this.create,
    this.delete,
    this.update,
  });

  Map<String, dynamic> toJson() {
    final create = this.create;
    final delete = this.delete;
    final update = this.update;
    return {
      if (create != null) 'Create': create,
      if (delete != null) 'Delete': delete,
      if (update != null) 'Update': update,
    };
  }
}

/// Represents the properties of a global table.
class GlobalTable {
  /// The global table name.
  final String? globalTableName;

  /// The Regions where the global table has replicas.
  final List<Replica>? replicationGroup;

  GlobalTable({
    this.globalTableName,
    this.replicationGroup,
  });

  factory GlobalTable.fromJson(Map<String, dynamic> json) {
    return GlobalTable(
      globalTableName: json['GlobalTableName'] as String?,
      replicationGroup: (json['ReplicationGroup'] as List?)
          ?.whereNotNull()
          .map((e) => Replica.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableName = this.globalTableName;
    final replicationGroup = this.replicationGroup;
    return {
      if (globalTableName != null) 'GlobalTableName': globalTableName,
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

/// Contains details about the global table.
class GlobalTableDescription {
  /// The creation time of the global table.
  final DateTime? creationDateTime;

  /// The unique identifier of the global table.
  final String? globalTableArn;

  /// The global table name.
  final String? globalTableName;

  /// The current state of the global table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The global table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The global table is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The global table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The global table is ready for use.
  /// </li>
  /// </ul>
  final GlobalTableStatus? globalTableStatus;

  /// The Regions where the global table has replicas.
  final List<ReplicaDescription>? replicationGroup;

  GlobalTableDescription({
    this.creationDateTime,
    this.globalTableArn,
    this.globalTableName,
    this.globalTableStatus,
    this.replicationGroup,
  });

  factory GlobalTableDescription.fromJson(Map<String, dynamic> json) {
    return GlobalTableDescription(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      globalTableArn: json['GlobalTableArn'] as String?,
      globalTableName: json['GlobalTableName'] as String?,
      globalTableStatus:
          (json['GlobalTableStatus'] as String?)?.toGlobalTableStatus(),
      replicationGroup: (json['ReplicationGroup'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicaDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final globalTableArn = this.globalTableArn;
    final globalTableName = this.globalTableName;
    final globalTableStatus = this.globalTableStatus;
    final replicationGroup = this.replicationGroup;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (globalTableArn != null) 'GlobalTableArn': globalTableArn,
      if (globalTableName != null) 'GlobalTableName': globalTableName,
      if (globalTableStatus != null)
        'GlobalTableStatus': globalTableStatus.toValue(),
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
class GlobalTableGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// Auto scaling settings for managing a global secondary index's write capacity
  /// units.
  final AutoScalingSettingsUpdate?
      provisionedWriteCapacityAutoScalingSettingsUpdate;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException.</code>
  final int? provisionedWriteCapacityUnits;

  GlobalTableGlobalSecondaryIndexSettingsUpdate({
    required this.indexName,
    this.provisionedWriteCapacityAutoScalingSettingsUpdate,
    this.provisionedWriteCapacityUnits,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final provisionedWriteCapacityAutoScalingSettingsUpdate =
        this.provisionedWriteCapacityAutoScalingSettingsUpdate;
    final provisionedWriteCapacityUnits = this.provisionedWriteCapacityUnits;
    return {
      'IndexName': indexName,
      if (provisionedWriteCapacityAutoScalingSettingsUpdate != null)
        'ProvisionedWriteCapacityAutoScalingSettingsUpdate':
            provisionedWriteCapacityAutoScalingSettingsUpdate,
      if (provisionedWriteCapacityUnits != null)
        'ProvisionedWriteCapacityUnits': provisionedWriteCapacityUnits,
    };
  }
}

enum GlobalTableStatus {
  creating,
  active,
  deleting,
  updating,
}

extension GlobalTableStatusValueExtension on GlobalTableStatus {
  String toValue() {
    switch (this) {
      case GlobalTableStatus.creating:
        return 'CREATING';
      case GlobalTableStatus.active:
        return 'ACTIVE';
      case GlobalTableStatus.deleting:
        return 'DELETING';
      case GlobalTableStatus.updating:
        return 'UPDATING';
    }
  }
}

extension GlobalTableStatusFromString on String {
  GlobalTableStatus toGlobalTableStatus() {
    switch (this) {
      case 'CREATING':
        return GlobalTableStatus.creating;
      case 'ACTIVE':
        return GlobalTableStatus.active;
      case 'DELETING':
        return GlobalTableStatus.deleting;
      case 'UPDATING':
        return GlobalTableStatus.updating;
    }
    throw Exception('$this is not known in enum GlobalTableStatus');
  }
}

enum ImportStatus {
  inProgress,
  completed,
  cancelling,
  cancelled,
  failed,
}

extension ImportStatusValueExtension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.inProgress:
        return 'IN_PROGRESS';
      case ImportStatus.completed:
        return 'COMPLETED';
      case ImportStatus.cancelling:
        return 'CANCELLING';
      case ImportStatus.cancelled:
        return 'CANCELLED';
      case ImportStatus.failed:
        return 'FAILED';
    }
  }
}

extension ImportStatusFromString on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ImportStatus.inProgress;
      case 'COMPLETED':
        return ImportStatus.completed;
      case 'CANCELLING':
        return ImportStatus.cancelling;
      case 'CANCELLED':
        return ImportStatus.cancelled;
      case 'FAILED':
        return ImportStatus.failed;
    }
    throw Exception('$this is not known in enum ImportStatus');
  }
}

/// Summary information about the source file for the import.
class ImportSummary {
  /// The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with
  /// this import task.
  final String? cloudWatchLogGroupArn;

  /// The time at which this import task ended. (Does this include the successful
  /// complete creation of the table it was imported to?)
  final DateTime? endTime;

  /// The Amazon Resource Number (ARN) corresponding to the import request.
  final String? importArn;

  /// The status of the import operation.
  final ImportStatus? importStatus;

  /// The format of the source data. Valid values are <code>CSV</code>,
  /// <code>DYNAMODB_JSON</code> or <code>ION</code>.
  final InputFormat? inputFormat;

  /// The path and S3 bucket of the source file that is being imported. This
  /// includes the S3Bucket (required), S3KeyPrefix (optional) and S3BucketOwner
  /// (optional if the bucket is owned by the requester).
  final S3BucketSource? s3BucketSource;

  /// The time at which this import task began.
  final DateTime? startTime;

  /// The Amazon Resource Number (ARN) of the table being imported into.
  final String? tableArn;

  ImportSummary({
    this.cloudWatchLogGroupArn,
    this.endTime,
    this.importArn,
    this.importStatus,
    this.inputFormat,
    this.s3BucketSource,
    this.startTime,
    this.tableArn,
  });

  factory ImportSummary.fromJson(Map<String, dynamic> json) {
    return ImportSummary(
      cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      importArn: json['ImportArn'] as String?,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      inputFormat: (json['InputFormat'] as String?)?.toInputFormat(),
      s3BucketSource: json['S3BucketSource'] != null
          ? S3BucketSource.fromJson(
              json['S3BucketSource'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      tableArn: json['TableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final endTime = this.endTime;
    final importArn = this.importArn;
    final importStatus = this.importStatus;
    final inputFormat = this.inputFormat;
    final s3BucketSource = this.s3BucketSource;
    final startTime = this.startTime;
    final tableArn = this.tableArn;
    return {
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (importArn != null) 'ImportArn': importArn,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
      if (s3BucketSource != null) 'S3BucketSource': s3BucketSource,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (tableArn != null) 'TableArn': tableArn,
    };
  }
}

/// Represents the properties of the table being imported into.
class ImportTableDescription {
  /// The client token that was provided for the import task. Reusing the client
  /// token on retry makes a call to <code>ImportTable</code> idempotent.
  final String? clientToken;

  /// The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with
  /// the target table.
  final String? cloudWatchLogGroupArn;

  /// The time at which the creation of the table associated with this import task
  /// completed.
  final DateTime? endTime;

  /// The number of errors occurred on importing the source file into the target
  /// table.
  final int? errorCount;

  /// The error code corresponding to the failure that the import job ran into
  /// during execution.
  final String? failureCode;

  /// The error message corresponding to the failure that the import job ran into
  /// during execution.
  final String? failureMessage;

  /// The Amazon Resource Number (ARN) corresponding to the import request.
  final String? importArn;

  /// The status of the import.
  final ImportStatus? importStatus;

  /// The number of items successfully imported into the new table.
  final int? importedItemCount;

  /// The compression options for the data that has been imported into the target
  /// table. The values are NONE, GZIP, or ZSTD.
  final InputCompressionType? inputCompressionType;

  /// The format of the source data going into the target table.
  final InputFormat? inputFormat;

  /// The format options for the data that was imported into the target table.
  /// There is one value, CsvOption.
  final InputFormatOptions? inputFormatOptions;

  /// The total number of items processed from the source file.
  final int? processedItemCount;

  /// The total size of data processed from the source file, in Bytes.
  final int? processedSizeBytes;

  /// Values for the S3 bucket the source file is imported from. Includes bucket
  /// name (required), key prefix (optional) and bucket account owner ID
  /// (optional).
  final S3BucketSource? s3BucketSource;

  /// The time when this import task started.
  final DateTime? startTime;

  /// The Amazon Resource Number (ARN) of the table being imported into.
  final String? tableArn;

  /// The parameters for the new table that is being imported into.
  final TableCreationParameters? tableCreationParameters;

  /// The table id corresponding to the table created by import table process.
  final String? tableId;

  ImportTableDescription({
    this.clientToken,
    this.cloudWatchLogGroupArn,
    this.endTime,
    this.errorCount,
    this.failureCode,
    this.failureMessage,
    this.importArn,
    this.importStatus,
    this.importedItemCount,
    this.inputCompressionType,
    this.inputFormat,
    this.inputFormatOptions,
    this.processedItemCount,
    this.processedSizeBytes,
    this.s3BucketSource,
    this.startTime,
    this.tableArn,
    this.tableCreationParameters,
    this.tableId,
  });

  factory ImportTableDescription.fromJson(Map<String, dynamic> json) {
    return ImportTableDescription(
      clientToken: json['ClientToken'] as String?,
      cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      errorCount: json['ErrorCount'] as int?,
      failureCode: json['FailureCode'] as String?,
      failureMessage: json['FailureMessage'] as String?,
      importArn: json['ImportArn'] as String?,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      importedItemCount: json['ImportedItemCount'] as int?,
      inputCompressionType:
          (json['InputCompressionType'] as String?)?.toInputCompressionType(),
      inputFormat: (json['InputFormat'] as String?)?.toInputFormat(),
      inputFormatOptions: json['InputFormatOptions'] != null
          ? InputFormatOptions.fromJson(
              json['InputFormatOptions'] as Map<String, dynamic>)
          : null,
      processedItemCount: json['ProcessedItemCount'] as int?,
      processedSizeBytes: json['ProcessedSizeBytes'] as int?,
      s3BucketSource: json['S3BucketSource'] != null
          ? S3BucketSource.fromJson(
              json['S3BucketSource'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      tableArn: json['TableArn'] as String?,
      tableCreationParameters: json['TableCreationParameters'] != null
          ? TableCreationParameters.fromJson(
              json['TableCreationParameters'] as Map<String, dynamic>)
          : null,
      tableId: json['TableId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final endTime = this.endTime;
    final errorCount = this.errorCount;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final importArn = this.importArn;
    final importStatus = this.importStatus;
    final importedItemCount = this.importedItemCount;
    final inputCompressionType = this.inputCompressionType;
    final inputFormat = this.inputFormat;
    final inputFormatOptions = this.inputFormatOptions;
    final processedItemCount = this.processedItemCount;
    final processedSizeBytes = this.processedSizeBytes;
    final s3BucketSource = this.s3BucketSource;
    final startTime = this.startTime;
    final tableArn = this.tableArn;
    final tableCreationParameters = this.tableCreationParameters;
    final tableId = this.tableId;
    return {
      if (clientToken != null) 'ClientToken': clientToken,
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (errorCount != null) 'ErrorCount': errorCount,
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureMessage != null) 'FailureMessage': failureMessage,
      if (importArn != null) 'ImportArn': importArn,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (importedItemCount != null) 'ImportedItemCount': importedItemCount,
      if (inputCompressionType != null)
        'InputCompressionType': inputCompressionType.toValue(),
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
      if (inputFormatOptions != null) 'InputFormatOptions': inputFormatOptions,
      if (processedItemCount != null) 'ProcessedItemCount': processedItemCount,
      if (processedSizeBytes != null) 'ProcessedSizeBytes': processedSizeBytes,
      if (s3BucketSource != null) 'S3BucketSource': s3BucketSource,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (tableArn != null) 'TableArn': tableArn,
      if (tableCreationParameters != null)
        'TableCreationParameters': tableCreationParameters,
      if (tableId != null) 'TableId': tableId,
    };
  }
}

class ImportTableOutput {
  /// Represents the properties of the table created for the import, and
  /// parameters of the import. The import parameters include import status, how
  /// many items were processed, and how many errors were encountered.
  final ImportTableDescription importTableDescription;

  ImportTableOutput({
    required this.importTableDescription,
  });

  factory ImportTableOutput.fromJson(Map<String, dynamic> json) {
    return ImportTableOutput(
      importTableDescription: ImportTableDescription.fromJson(
          json['ImportTableDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final importTableDescription = this.importTableDescription;
    return {
      'ImportTableDescription': importTableDescription,
    };
  }
}

/// Optional object containing the parameters specific to an incremental export.
class IncrementalExportSpecification {
  /// Time in the past which provides the inclusive start range for the export
  /// table's data, counted in seconds from the start of the Unix epoch. The
  /// incremental export will reflect the table's state including and after this
  /// point in time.
  final DateTime? exportFromTime;

  /// Time in the past which provides the exclusive end range for the export
  /// table's data, counted in seconds from the start of the Unix epoch. The
  /// incremental export will reflect the table's state just prior to this point
  /// in time. If this is not provided, the latest time with data available will
  /// be used.
  final DateTime? exportToTime;

  /// The view type that was chosen for the export. Valid values are
  /// <code>NEW_AND_OLD_IMAGES</code> and <code>NEW_IMAGES</code>. The default
  /// value is <code>NEW_AND_OLD_IMAGES</code>.
  final ExportViewType? exportViewType;

  IncrementalExportSpecification({
    this.exportFromTime,
    this.exportToTime,
    this.exportViewType,
  });

  factory IncrementalExportSpecification.fromJson(Map<String, dynamic> json) {
    return IncrementalExportSpecification(
      exportFromTime: timeStampFromJson(json['ExportFromTime']),
      exportToTime: timeStampFromJson(json['ExportToTime']),
      exportViewType: (json['ExportViewType'] as String?)?.toExportViewType(),
    );
  }

  Map<String, dynamic> toJson() {
    final exportFromTime = this.exportFromTime;
    final exportToTime = this.exportToTime;
    final exportViewType = this.exportViewType;
    return {
      if (exportFromTime != null)
        'ExportFromTime': unixTimestampToJson(exportFromTime),
      if (exportToTime != null)
        'ExportToTime': unixTimestampToJson(exportToTime),
      if (exportViewType != null) 'ExportViewType': exportViewType.toValue(),
    };
  }
}

enum IndexStatus {
  creating,
  updating,
  deleting,
  active,
}

extension IndexStatusValueExtension on IndexStatus {
  String toValue() {
    switch (this) {
      case IndexStatus.creating:
        return 'CREATING';
      case IndexStatus.updating:
        return 'UPDATING';
      case IndexStatus.deleting:
        return 'DELETING';
      case IndexStatus.active:
        return 'ACTIVE';
    }
  }
}

extension IndexStatusFromString on String {
  IndexStatus toIndexStatus() {
    switch (this) {
      case 'CREATING':
        return IndexStatus.creating;
      case 'UPDATING':
        return IndexStatus.updating;
      case 'DELETING':
        return IndexStatus.deleting;
      case 'ACTIVE':
        return IndexStatus.active;
    }
    throw Exception('$this is not known in enum IndexStatus');
  }
}

enum InputCompressionType {
  gzip,
  zstd,
  none,
}

extension InputCompressionTypeValueExtension on InputCompressionType {
  String toValue() {
    switch (this) {
      case InputCompressionType.gzip:
        return 'GZIP';
      case InputCompressionType.zstd:
        return 'ZSTD';
      case InputCompressionType.none:
        return 'NONE';
    }
  }
}

extension InputCompressionTypeFromString on String {
  InputCompressionType toInputCompressionType() {
    switch (this) {
      case 'GZIP':
        return InputCompressionType.gzip;
      case 'ZSTD':
        return InputCompressionType.zstd;
      case 'NONE':
        return InputCompressionType.none;
    }
    throw Exception('$this is not known in enum InputCompressionType');
  }
}

enum InputFormat {
  dynamodbJson,
  ion,
  csv,
}

extension InputFormatValueExtension on InputFormat {
  String toValue() {
    switch (this) {
      case InputFormat.dynamodbJson:
        return 'DYNAMODB_JSON';
      case InputFormat.ion:
        return 'ION';
      case InputFormat.csv:
        return 'CSV';
    }
  }
}

extension InputFormatFromString on String {
  InputFormat toInputFormat() {
    switch (this) {
      case 'DYNAMODB_JSON':
        return InputFormat.dynamodbJson;
      case 'ION':
        return InputFormat.ion;
      case 'CSV':
        return InputFormat.csv;
    }
    throw Exception('$this is not known in enum InputFormat');
  }
}

/// The format options for the data that was imported into the target table.
/// There is one value, CsvOption.
class InputFormatOptions {
  /// The options for imported source files in CSV format. The values are
  /// Delimiter and HeaderList.
  final CsvOptions? csv;

  InputFormatOptions({
    this.csv,
  });

  factory InputFormatOptions.fromJson(Map<String, dynamic> json) {
    return InputFormatOptions(
      csv: json['Csv'] != null
          ? CsvOptions.fromJson(json['Csv'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csv = this.csv;
    return {
      if (csv != null) 'Csv': csv,
    };
  }
}

/// Information about item collections, if any, that were affected by the
/// operation. <code>ItemCollectionMetrics</code> is only returned if the
/// request asked for it. If the table does not have any local secondary
/// indexes, this information is not returned in the response.
class ItemCollectionMetrics {
  /// The partition key value of the item collection. This value is the same as
  /// the partition key value of the item.
  final Map<String, AttributeValue>? itemCollectionKey;

  /// An estimate of item collection size, in gigabytes. This value is a
  /// two-element array containing a lower bound and an upper bound for the
  /// estimate. The estimate includes the size of all the items in the table, plus
  /// the size of all attributes projected into all of the local secondary indexes
  /// on that table. Use this estimate to measure whether a local secondary index
  /// is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  final List<double>? sizeEstimateRangeGB;

  ItemCollectionMetrics({
    this.itemCollectionKey,
    this.sizeEstimateRangeGB,
  });

  factory ItemCollectionMetrics.fromJson(Map<String, dynamic> json) {
    return ItemCollectionMetrics(
      itemCollectionKey: (json['ItemCollectionKey'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      sizeEstimateRangeGB: (json['SizeEstimateRangeGB'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final itemCollectionKey = this.itemCollectionKey;
    final sizeEstimateRangeGB = this.sizeEstimateRangeGB;
    return {
      if (itemCollectionKey != null) 'ItemCollectionKey': itemCollectionKey,
      if (sizeEstimateRangeGB != null)
        'SizeEstimateRangeGB': sizeEstimateRangeGB,
    };
  }
}

/// Details for the requested item.
class ItemResponse {
  /// Map of attribute data consisting of the data type and attribute value.
  final Map<String, AttributeValue>? item;

  ItemResponse({
    this.item,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) {
    return ItemResponse(
      item: (json['Item'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    return {
      if (item != null) 'Item': item,
    };
  }
}

/// Represents <i>a single element</i> of a key schema. A key schema specifies
/// the attributes that make up the primary key of a table, or the key
/// attributes of an index.
///
/// A <code>KeySchemaElement</code> represents exactly one attribute of the
/// primary key. For example, a simple primary key would be represented by one
/// <code>KeySchemaElement</code> (for the partition key). A composite primary
/// key would require one <code>KeySchemaElement</code> for the partition key,
/// and another <code>KeySchemaElement</code> for the sort key.
///
/// A <code>KeySchemaElement</code> must be a scalar, top-level attribute (not a
/// nested attribute). The data type must be one of String, Number, or Binary.
/// The attribute cannot be nested within a List or a Map.
class KeySchemaElement {
  /// The name of a key attribute.
  final String attributeName;

  /// The role that this key attribute will assume:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final KeyType keyType;

  KeySchemaElement({
    required this.attributeName,
    required this.keyType,
  });

  factory KeySchemaElement.fromJson(Map<String, dynamic> json) {
    return KeySchemaElement(
      attributeName: json['AttributeName'] as String,
      keyType: (json['KeyType'] as String).toKeyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final keyType = this.keyType;
    return {
      'AttributeName': attributeName,
      'KeyType': keyType.toValue(),
    };
  }
}

enum KeyType {
  hash,
  range,
}

extension KeyTypeValueExtension on KeyType {
  String toValue() {
    switch (this) {
      case KeyType.hash:
        return 'HASH';
      case KeyType.range:
        return 'RANGE';
    }
  }
}

extension KeyTypeFromString on String {
  KeyType toKeyType() {
    switch (this) {
      case 'HASH':
        return KeyType.hash;
      case 'RANGE':
        return KeyType.range;
    }
    throw Exception('$this is not known in enum KeyType');
  }
}

/// Represents a set of primary keys and, for each key, the attributes to
/// retrieve from the table.
///
/// For each primary key, you must provide <i>all</i> of the key attributes. For
/// example, with a simple primary key, you only need to provide the partition
/// key. For a composite primary key, you must provide <i>both</i> the partition
/// key and the sort key.
class KeysAndAttributes {
  /// The primary key attribute values that define the items and the attributes
  /// associated with the items.
  final List<Map<String, AttributeValue>> keys;

  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy
  /// Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final List<String>? attributesToGet;

  /// The consistency of a read operation. If set to <code>true</code>, then a
  /// strongly consistent read is used; otherwise, an eventually consistent read
  /// is used.
  final bool? consistentRead;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in an
  /// expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final Map<String, String>? expressionAttributeNames;

  /// A string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the <code>ProjectionExpression</code> must be separated by
  /// commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final String? projectionExpression;

  KeysAndAttributes({
    required this.keys,
    this.attributesToGet,
    this.consistentRead,
    this.expressionAttributeNames,
    this.projectionExpression,
  });

  factory KeysAndAttributes.fromJson(Map<String, dynamic> json) {
    return KeysAndAttributes(
      keys: (json['Keys'] as List)
          .whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      attributesToGet: (json['AttributesToGet'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      consistentRead: json['ConsistentRead'] as bool?,
      expressionAttributeNames:
          (json['ExpressionAttributeNames'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      projectionExpression: json['ProjectionExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    final attributesToGet = this.attributesToGet;
    final consistentRead = this.consistentRead;
    final expressionAttributeNames = this.expressionAttributeNames;
    final projectionExpression = this.projectionExpression;
    return {
      'Keys': keys,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (projectionExpression != null)
        'ProjectionExpression': projectionExpression,
    };
  }
}

/// Describes a Kinesis data stream destination.
class KinesisDataStreamDestination {
  /// The precision of the Kinesis data stream timestamp. The values are either
  /// <code>MILLISECOND</code> or <code>MICROSECOND</code>.
  final ApproximateCreationDateTimePrecision?
      approximateCreationDateTimePrecision;

  /// The current status of replication.
  final DestinationStatus? destinationStatus;

  /// The human-readable string that corresponds to the replica status.
  final String? destinationStatusDescription;

  /// The ARN for a specific Kinesis data stream.
  final String? streamArn;

  KinesisDataStreamDestination({
    this.approximateCreationDateTimePrecision,
    this.destinationStatus,
    this.destinationStatusDescription,
    this.streamArn,
  });

  factory KinesisDataStreamDestination.fromJson(Map<String, dynamic> json) {
    return KinesisDataStreamDestination(
      approximateCreationDateTimePrecision:
          (json['ApproximateCreationDateTimePrecision'] as String?)
              ?.toApproximateCreationDateTimePrecision(),
      destinationStatus:
          (json['DestinationStatus'] as String?)?.toDestinationStatus(),
      destinationStatusDescription:
          json['DestinationStatusDescription'] as String?,
      streamArn: json['StreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateCreationDateTimePrecision =
        this.approximateCreationDateTimePrecision;
    final destinationStatus = this.destinationStatus;
    final destinationStatusDescription = this.destinationStatusDescription;
    final streamArn = this.streamArn;
    return {
      if (approximateCreationDateTimePrecision != null)
        'ApproximateCreationDateTimePrecision':
            approximateCreationDateTimePrecision.toValue(),
      if (destinationStatus != null)
        'DestinationStatus': destinationStatus.toValue(),
      if (destinationStatusDescription != null)
        'DestinationStatusDescription': destinationStatusDescription,
      if (streamArn != null) 'StreamArn': streamArn,
    };
  }
}

class KinesisStreamingDestinationOutput {
  /// The current status of the replication.
  final DestinationStatus? destinationStatus;

  /// The destination for the Kinesis streaming information that is being enabled.
  final EnableKinesisStreamingConfiguration?
      enableKinesisStreamingConfiguration;

  /// The ARN for the specific Kinesis data stream.
  final String? streamArn;

  /// The name of the table being modified.
  final String? tableName;

  KinesisStreamingDestinationOutput({
    this.destinationStatus,
    this.enableKinesisStreamingConfiguration,
    this.streamArn,
    this.tableName,
  });

  factory KinesisStreamingDestinationOutput.fromJson(
      Map<String, dynamic> json) {
    return KinesisStreamingDestinationOutput(
      destinationStatus:
          (json['DestinationStatus'] as String?)?.toDestinationStatus(),
      enableKinesisStreamingConfiguration:
          json['EnableKinesisStreamingConfiguration'] != null
              ? EnableKinesisStreamingConfiguration.fromJson(
                  json['EnableKinesisStreamingConfiguration']
                      as Map<String, dynamic>)
              : null,
      streamArn: json['StreamArn'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationStatus = this.destinationStatus;
    final enableKinesisStreamingConfiguration =
        this.enableKinesisStreamingConfiguration;
    final streamArn = this.streamArn;
    final tableName = this.tableName;
    return {
      if (destinationStatus != null)
        'DestinationStatus': destinationStatus.toValue(),
      if (enableKinesisStreamingConfiguration != null)
        'EnableKinesisStreamingConfiguration':
            enableKinesisStreamingConfiguration,
      if (streamArn != null) 'StreamArn': streamArn,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

class ListBackupsOutput {
  /// List of <code>BackupSummary</code> objects.
  final List<BackupSummary>? backupSummaries;

  /// The ARN of the backup last evaluated when the current page of results was
  /// returned, inclusive of the current page of results. This value may be
  /// specified as the <code>ExclusiveStartBackupArn</code> of a new
  /// <code>ListBackups</code> operation in order to fetch the next page of
  /// results.
  ///
  /// If <code>LastEvaluatedBackupArn</code> is empty, then the last page of
  /// results has been processed and there are no more results to be retrieved.
  ///
  /// If <code>LastEvaluatedBackupArn</code> is not empty, this may or may not
  /// indicate that there is more data to be returned. All results are guaranteed
  /// to have been returned if and only if no value for
  /// <code>LastEvaluatedBackupArn</code> is returned.
  final String? lastEvaluatedBackupArn;

  ListBackupsOutput({
    this.backupSummaries,
    this.lastEvaluatedBackupArn,
  });

  factory ListBackupsOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupsOutput(
      backupSummaries: (json['BackupSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BackupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEvaluatedBackupArn: json['LastEvaluatedBackupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupSummaries = this.backupSummaries;
    final lastEvaluatedBackupArn = this.lastEvaluatedBackupArn;
    return {
      if (backupSummaries != null) 'BackupSummaries': backupSummaries,
      if (lastEvaluatedBackupArn != null)
        'LastEvaluatedBackupArn': lastEvaluatedBackupArn,
    };
  }
}

class ListContributorInsightsOutput {
  /// A list of ContributorInsightsSummary.
  final List<ContributorInsightsSummary>? contributorInsightsSummaries;

  /// A token to go to the next page if there is one.
  final String? nextToken;

  ListContributorInsightsOutput({
    this.contributorInsightsSummaries,
    this.nextToken,
  });

  factory ListContributorInsightsOutput.fromJson(Map<String, dynamic> json) {
    return ListContributorInsightsOutput(
      contributorInsightsSummaries: (json['ContributorInsightsSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ContributorInsightsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributorInsightsSummaries = this.contributorInsightsSummaries;
    final nextToken = this.nextToken;
    return {
      if (contributorInsightsSummaries != null)
        'ContributorInsightsSummaries': contributorInsightsSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListExportsOutput {
  /// A list of <code>ExportSummary</code> objects.
  final List<ExportSummary>? exportSummaries;

  /// If this value is returned, there are additional results to be displayed. To
  /// retrieve them, call <code>ListExports</code> again, with
  /// <code>NextToken</code> set to this value.
  final String? nextToken;

  ListExportsOutput({
    this.exportSummaries,
    this.nextToken,
  });

  factory ListExportsOutput.fromJson(Map<String, dynamic> json) {
    return ListExportsOutput(
      exportSummaries: (json['ExportSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportSummaries = this.exportSummaries;
    final nextToken = this.nextToken;
    return {
      if (exportSummaries != null) 'ExportSummaries': exportSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGlobalTablesOutput {
  /// List of global table names.
  final List<GlobalTable>? globalTables;

  /// Last evaluated global table name.
  final String? lastEvaluatedGlobalTableName;

  ListGlobalTablesOutput({
    this.globalTables,
    this.lastEvaluatedGlobalTableName,
  });

  factory ListGlobalTablesOutput.fromJson(Map<String, dynamic> json) {
    return ListGlobalTablesOutput(
      globalTables: (json['GlobalTables'] as List?)
          ?.whereNotNull()
          .map((e) => GlobalTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEvaluatedGlobalTableName:
          json['LastEvaluatedGlobalTableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalTables = this.globalTables;
    final lastEvaluatedGlobalTableName = this.lastEvaluatedGlobalTableName;
    return {
      if (globalTables != null) 'GlobalTables': globalTables,
      if (lastEvaluatedGlobalTableName != null)
        'LastEvaluatedGlobalTableName': lastEvaluatedGlobalTableName,
    };
  }
}

class ListImportsOutput {
  /// A list of <code>ImportSummary</code> objects.
  final List<ImportSummary>? importSummaryList;

  /// If this value is returned, there are additional results to be displayed. To
  /// retrieve them, call <code>ListImports</code> again, with
  /// <code>NextToken</code> set to this value.
  final String? nextToken;

  ListImportsOutput({
    this.importSummaryList,
    this.nextToken,
  });

  factory ListImportsOutput.fromJson(Map<String, dynamic> json) {
    return ListImportsOutput(
      importSummaryList: (json['ImportSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ImportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importSummaryList = this.importSummaryList;
    final nextToken = this.nextToken;
    return {
      if (importSummaryList != null) 'ImportSummaryList': importSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListTables</code> operation.
class ListTablesOutput {
  /// The name of the last table in the current page of results. Use this value as
  /// the <code>ExclusiveStartTableName</code> in a new request to obtain the next
  /// page of results, until all the table names are returned.
  ///
  /// If you do not receive a <code>LastEvaluatedTableName</code> value in the
  /// response, this means that there are no more table names to be retrieved.
  final String? lastEvaluatedTableName;

  /// The names of the tables associated with the current account at the current
  /// endpoint. The maximum size of this array is 100.
  ///
  /// If <code>LastEvaluatedTableName</code> also appears in the output, you can
  /// use this value as the <code>ExclusiveStartTableName</code> parameter in a
  /// subsequent <code>ListTables</code> request and obtain the next page of
  /// results.
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

class ListTagsOfResourceOutput {
  /// If this value is returned, there are additional results to be displayed. To
  /// retrieve them, call ListTagsOfResource again, with NextToken set to this
  /// value.
  final String? nextToken;

  /// The tags currently associated with the Amazon DynamoDB resource.
  final List<Tag>? tags;

  ListTagsOfResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsOfResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsOfResourceOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents the properties of a local secondary index.
class LocalSecondaryIndex {
  /// The name of the local secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one or
  /// more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// local secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection projection;

  LocalSecondaryIndex({
    required this.indexName,
    required this.keySchema,
    required this.projection,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final projection = this.projection;
    return {
      'IndexName': indexName,
      'KeySchema': keySchema,
      'Projection': projection,
    };
  }
}

/// Represents the properties of a local secondary index.
class LocalSecondaryIndexDescription {
  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  final String? indexArn;

  /// Represents the name of the local secondary index.
  final String? indexName;

  /// The total size of the specified index, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? itemCount;

  /// The complete key schema for the local secondary index, consisting of one or
  /// more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement>? keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection? projection;

  LocalSecondaryIndexDescription({
    this.indexArn,
    this.indexName,
    this.indexSizeBytes,
    this.itemCount,
    this.keySchema,
    this.projection,
  });

  factory LocalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) {
    return LocalSecondaryIndexDescription(
      indexArn: json['IndexArn'] as String?,
      indexName: json['IndexName'] as String?,
      indexSizeBytes: json['IndexSizeBytes'] as int?,
      itemCount: json['ItemCount'] as int?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      projection: json['Projection'] != null
          ? Projection.fromJson(json['Projection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final indexSizeBytes = this.indexSizeBytes;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final projection = this.projection;
    return {
      if (indexArn != null) 'IndexArn': indexArn,
      if (indexName != null) 'IndexName': indexName,
      if (indexSizeBytes != null) 'IndexSizeBytes': indexSizeBytes,
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (projection != null) 'Projection': projection,
    };
  }
}

/// Represents the properties of a local secondary index for the table when the
/// backup was created.
class LocalSecondaryIndexInfo {
  /// Represents the name of the local secondary index.
  final String? indexName;

  /// The complete key schema for a local secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  final List<KeySchemaElement>? keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection? projection;

  LocalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
  });

  factory LocalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) {
    return LocalSecondaryIndexInfo(
      indexName: json['IndexName'] as String?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      projection: json['Projection'] != null
          ? Projection.fromJson(json['Projection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final projection = this.projection;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (keySchema != null) 'KeySchema': keySchema,
      if (projection != null) 'Projection': projection,
    };
  }
}

/// Sets the maximum number of read and write units for the specified on-demand
/// table. If you use this parameter, you must specify
/// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
/// both.
class OnDemandThroughput {
  /// Maximum number of read request units for the specified table.
  ///
  /// To specify a maximum <code>OnDemandThroughput</code> on your table, set the
  /// value of <code>MaxReadRequestUnits</code> as greater than or equal to 1. To
  /// remove the maximum <code>OnDemandThroughput</code> that is currently set on
  /// your table, set the value of <code>MaxReadRequestUnits</code> to -1.
  final int? maxReadRequestUnits;

  /// Maximum number of write request units for the specified table.
  ///
  /// To specify a maximum <code>OnDemandThroughput</code> on your table, set the
  /// value of <code>MaxWriteRequestUnits</code> as greater than or equal to 1. To
  /// remove the maximum <code>OnDemandThroughput</code> that is currently set on
  /// your table, set the value of <code>MaxWriteRequestUnits</code> to -1.
  final int? maxWriteRequestUnits;

  OnDemandThroughput({
    this.maxReadRequestUnits,
    this.maxWriteRequestUnits,
  });

  factory OnDemandThroughput.fromJson(Map<String, dynamic> json) {
    return OnDemandThroughput(
      maxReadRequestUnits: json['MaxReadRequestUnits'] as int?,
      maxWriteRequestUnits: json['MaxWriteRequestUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxReadRequestUnits = this.maxReadRequestUnits;
    final maxWriteRequestUnits = this.maxWriteRequestUnits;
    return {
      if (maxReadRequestUnits != null)
        'MaxReadRequestUnits': maxReadRequestUnits,
      if (maxWriteRequestUnits != null)
        'MaxWriteRequestUnits': maxWriteRequestUnits,
    };
  }
}

/// Overrides the on-demand throughput settings for this replica table. If you
/// don't specify a value for this parameter, it uses the source table's
/// on-demand throughput settings.
class OnDemandThroughputOverride {
  /// Maximum number of read request units for the specified replica table.
  final int? maxReadRequestUnits;

  OnDemandThroughputOverride({
    this.maxReadRequestUnits,
  });

  factory OnDemandThroughputOverride.fromJson(Map<String, dynamic> json) {
    return OnDemandThroughputOverride(
      maxReadRequestUnits: json['MaxReadRequestUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxReadRequestUnits = this.maxReadRequestUnits;
    return {
      if (maxReadRequestUnits != null)
        'MaxReadRequestUnits': maxReadRequestUnits,
    };
  }
}

/// Represents a PartiQL statement that uses parameters.
class ParameterizedStatement {
  /// A PartiQL statement that uses parameters.
  final String statement;

  /// The parameter values.
  final List<AttributeValue>? parameters;

  /// An optional parameter that returns the item attributes for a PartiQL
  /// <code>ParameterizedStatement</code> operation that failed a condition check.
  ///
  /// There is no additional cost associated with requesting a return value aside
  /// from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  ParameterizedStatement({
    required this.statement,
    this.parameters,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final parameters = this.parameters;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'Statement': statement,
      if (parameters != null) 'Parameters': parameters,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

/// The description of the point in time settings applied to the table.
class PointInTimeRecoveryDescription {
  /// Specifies the earliest point in time you can restore your table to. You can
  /// restore your table to any point in time during the last 35 days.
  final DateTime? earliestRestorableDateTime;

  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time.
  final DateTime? latestRestorableDateTime;

  /// The current state of point in time recovery:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Point in time recovery is enabled.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - Point in time recovery is disabled.
  /// </li>
  /// </ul>
  final PointInTimeRecoveryStatus? pointInTimeRecoveryStatus;

  PointInTimeRecoveryDescription({
    this.earliestRestorableDateTime,
    this.latestRestorableDateTime,
    this.pointInTimeRecoveryStatus,
  });

  factory PointInTimeRecoveryDescription.fromJson(Map<String, dynamic> json) {
    return PointInTimeRecoveryDescription(
      earliestRestorableDateTime:
          timeStampFromJson(json['EarliestRestorableDateTime']),
      latestRestorableDateTime:
          timeStampFromJson(json['LatestRestorableDateTime']),
      pointInTimeRecoveryStatus: (json['PointInTimeRecoveryStatus'] as String?)
          ?.toPointInTimeRecoveryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final earliestRestorableDateTime = this.earliestRestorableDateTime;
    final latestRestorableDateTime = this.latestRestorableDateTime;
    final pointInTimeRecoveryStatus = this.pointInTimeRecoveryStatus;
    return {
      if (earliestRestorableDateTime != null)
        'EarliestRestorableDateTime':
            unixTimestampToJson(earliestRestorableDateTime),
      if (latestRestorableDateTime != null)
        'LatestRestorableDateTime':
            unixTimestampToJson(latestRestorableDateTime),
      if (pointInTimeRecoveryStatus != null)
        'PointInTimeRecoveryStatus': pointInTimeRecoveryStatus.toValue(),
    };
  }
}

/// Represents the settings used to enable point in time recovery.
class PointInTimeRecoverySpecification {
  /// Indicates whether point in time recovery is enabled (true) or disabled
  /// (false) on the table.
  final bool pointInTimeRecoveryEnabled;

  PointInTimeRecoverySpecification({
    required this.pointInTimeRecoveryEnabled,
  });

  Map<String, dynamic> toJson() {
    final pointInTimeRecoveryEnabled = this.pointInTimeRecoveryEnabled;
    return {
      'PointInTimeRecoveryEnabled': pointInTimeRecoveryEnabled,
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

/// Represents attributes that are copied (projected) from the table into an
/// index. These are in addition to the primary key attributes and index key
/// attributes, which are automatically projected.
class Projection {
  /// Represents the non-key attribute names which will be projected into the
  /// index.
  ///
  /// For local secondary indexes, the total count of
  /// <code>NonKeyAttributes</code> summed across all of the local secondary
  /// indexes, must not exceed 100. If you project the same attribute into two
  /// different indexes, this counts as two distinct attributes when determining
  /// the total.
  final List<String>? nonKeyAttributes;

  /// The set of attributes that are projected into the index:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - In addition to the attributes described in
  /// <code>KEYS_ONLY</code>, the secondary index will include other non-key
  /// attributes that you specify.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul>
  /// When using the DynamoDB console, <code>ALL</code> is selected by default.
  final ProjectionType? projectionType;

  Projection({
    this.nonKeyAttributes,
    this.projectionType,
  });

  factory Projection.fromJson(Map<String, dynamic> json) {
    return Projection(
      nonKeyAttributes: (json['NonKeyAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      projectionType: (json['ProjectionType'] as String?)?.toProjectionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final nonKeyAttributes = this.nonKeyAttributes;
    final projectionType = this.projectionType;
    return {
      if (nonKeyAttributes != null) 'NonKeyAttributes': nonKeyAttributes,
      if (projectionType != null) 'ProjectionType': projectionType.toValue(),
    };
  }
}

enum ProjectionType {
  all,
  keysOnly,
  include,
}

extension ProjectionTypeValueExtension on ProjectionType {
  String toValue() {
    switch (this) {
      case ProjectionType.all:
        return 'ALL';
      case ProjectionType.keysOnly:
        return 'KEYS_ONLY';
      case ProjectionType.include:
        return 'INCLUDE';
    }
  }
}

extension ProjectionTypeFromString on String {
  ProjectionType toProjectionType() {
    switch (this) {
      case 'ALL':
        return ProjectionType.all;
      case 'KEYS_ONLY':
        return ProjectionType.keysOnly;
      case 'INCLUDE':
        return ProjectionType.include;
    }
    throw Exception('$this is not known in enum ProjectionType');
  }
}

/// Represents the provisioned throughput settings for a specified table or
/// index. The settings can be modified using the <code>UpdateTable</code>
/// operation.
///
/// For current minimum and maximum provisioned throughput values, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
/// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
class ProvisionedThroughput {
  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set
  /// to 0.
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set
  /// to 0.
  final int writeCapacityUnits;

  ProvisionedThroughput({
    required this.readCapacityUnits,
    required this.writeCapacityUnits,
  });

  factory ProvisionedThroughput.fromJson(Map<String, dynamic> json) {
    return ProvisionedThroughput(
      readCapacityUnits: json['ReadCapacityUnits'] as int,
      writeCapacityUnits: json['WriteCapacityUnits'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      'ReadCapacityUnits': readCapacityUnits,
      'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

/// Represents the provisioned throughput settings for the table, consisting of
/// read and write capacity units, along with data about increases and
/// decreases.
class ProvisionedThroughputDescription {
  /// The date and time of the last provisioned throughput decrease for this
  /// table.
  final DateTime? lastDecreaseDateTime;

  /// The date and time of the last provisioned throughput increase for this
  /// table.
  final DateTime? lastIncreaseDateTime;

  /// The number of provisioned throughput decreases for this table during this
  /// UTC calendar day. For current maximums on provisioned throughput decreases,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final int? numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. Eventually consistent
  /// reads require less effort than strongly consistent reads, so a setting of 50
  /// <code>ReadCapacityUnits</code> per second provides 100 eventually consistent
  /// <code>ReadCapacityUnits</code> per second.
  final int? readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
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

/// Replica-specific provisioned throughput settings. If not specified, uses the
/// source table's provisioned throughput settings.
class ProvisionedThroughputOverride {
  /// Replica-specific read capacity units. If not specified, uses the source
  /// table's read capacity settings.
  final int? readCapacityUnits;

  ProvisionedThroughputOverride({
    this.readCapacityUnits,
  });

  factory ProvisionedThroughputOverride.fromJson(Map<String, dynamic> json) {
    return ProvisionedThroughputOverride(
      readCapacityUnits: json['ReadCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final readCapacityUnits = this.readCapacityUnits;
    return {
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
    };
  }
}

/// Represents a request to perform a <code>PutItem</code> operation.
class Put {
  /// A map of attribute name to attribute values, representing the primary key of
  /// the item to be written by <code>PutItem</code>. All of the table's primary
  /// key attributes must be specified, and their data types must match those of
  /// the table's key schema. If any attributes are present in the item that are
  /// part of an index key schema for the table, their types must match the index
  /// key schema.
  final Map<String, AttributeValue> item;

  /// Name of the table in which to write the item. You can also provide the
  /// Amazon Resource Name (ARN) of the table in this parameter.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  final String? conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String>? expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue>? expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Put</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  Put({
    required this.item,
    required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final item = this.item;
    final tableName = this.tableName;
    final conditionExpression = this.conditionExpression;
    final expressionAttributeNames = this.expressionAttributeNames;
    final expressionAttributeValues = this.expressionAttributeValues;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'Item': item,
      'TableName': tableName,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

/// Represents the output of a <code>PutItem</code> operation.
class PutItemOutput {
  /// The attribute values as they appeared before the <code>PutItem</code>
  /// operation, but only if <code>ReturnValues</code> is specified as
  /// <code>ALL_OLD</code> in the request. Each element consists of an attribute
  /// name and an attribute value.
  final Map<String, AttributeValue>? attributes;

  /// The capacity units consumed by the <code>PutItem</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption">Capacity
  /// unity consumption for write operations</a> in the <i>Amazon DynamoDB
  /// Developer Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>PutItem</code> operation. <code>ItemCollectionMetrics</code> is only
  /// returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  final ItemCollectionMetrics? itemCollectionMetrics;

  PutItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory PutItemOutput.fromJson(Map<String, dynamic> json) {
    return PutItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      itemCollectionMetrics: json['ItemCollectionMetrics'] != null
          ? ItemCollectionMetrics.fromJson(
              json['ItemCollectionMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacity = this.consumedCapacity;
    final itemCollectionMetrics = this.itemCollectionMetrics;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (itemCollectionMetrics != null)
        'ItemCollectionMetrics': itemCollectionMetrics,
    };
  }
}

/// Represents a request to perform a <code>PutItem</code> operation on an item.
class PutRequest {
  /// A map of attribute name to attribute values, representing the primary key of
  /// an item to be processed by <code>PutItem</code>. All of the table's primary
  /// key attributes must be specified, and their data types must match those of
  /// the table's key schema. If any attributes are present in the item that are
  /// part of an index key schema for the table, their types must match the index
  /// key schema.
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

class PutResourcePolicyOutput {
  /// A unique string that represents the revision ID of the policy. If you're
  /// comparing revision IDs, make sure to always use string comparison logic.
  final String? revisionId;

  PutResourcePolicyOutput({
    this.revisionId,
  });

  factory PutResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyOutput(
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    return {
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

/// Represents the output of a <code>Query</code> operation.
class QueryOutput {
  /// The capacity units consumed by the <code>Query</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption">Capacity
  /// unit consumption for read operations</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// The number of items in the response.
  ///
  /// If you used a <code>QueryFilter</code> in the request, then
  /// <code>Count</code> is the number of items returned after the filter was
  /// applied, and <code>ScannedCount</code> is the number of matching items
  /// before the filter was applied.
  ///
  /// If you did not use a filter in the request, then <code>Count</code> and
  /// <code>ScannedCount</code> are the same.
  final int? count;

  /// An array of item attributes that match the query criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  final List<Map<String, AttributeValue>>? items;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedKey</code> is empty, then the "last page" of results
  /// has been processed and there is no more data to be retrieved.
  ///
  /// If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean
  /// that there is more data in the result set. The only way to know when you
  /// have reached the end of the result set is when <code>LastEvaluatedKey</code>
  /// is empty.
  final Map<String, AttributeValue>? lastEvaluatedKey;

  /// The number of items evaluated, before any <code>QueryFilter</code> is
  /// applied. A high <code>ScannedCount</code> value with few, or no,
  /// <code>Count</code> results indicates an inefficient <code>Query</code>
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count
  /// and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// If you did not use a filter in the request, then <code>ScannedCount</code>
  /// is the same as <code>Count</code>.
  final int? scannedCount;

  QueryOutput({
    this.consumedCapacity,
    this.count,
    this.items,
    this.lastEvaluatedKey,
    this.scannedCount,
  });

  factory QueryOutput.fromJson(Map<String, dynamic> json) {
    return QueryOutput(
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      count: json['Count'] as int?,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      scannedCount: json['ScannedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final count = this.count;
    final items = this.items;
    final lastEvaluatedKey = this.lastEvaluatedKey;
    final scannedCount = this.scannedCount;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (count != null) 'Count': count,
      if (items != null) 'Items': items,
      if (lastEvaluatedKey != null) 'LastEvaluatedKey': lastEvaluatedKey,
      if (scannedCount != null) 'ScannedCount': scannedCount,
    };
  }
}

/// Represents the properties of a replica.
class Replica {
  /// The Region where the replica needs to be created.
  final String? regionName;

  Replica({
    this.regionName,
  });

  factory Replica.fromJson(Map<String, dynamic> json) {
    return Replica(
      regionName: json['RegionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      if (regionName != null) 'RegionName': regionName,
    };
  }
}

/// Represents the auto scaling settings of the replica.
class ReplicaAutoScalingDescription {
  /// Replica-specific global secondary index auto scaling settings.
  final List<ReplicaGlobalSecondaryIndexAutoScalingDescription>?
      globalSecondaryIndexes;

  /// The Region where the replica exists.
  final String? regionName;
  final AutoScalingSettingsDescription?
      replicaProvisionedReadCapacityAutoScalingSettings;
  final AutoScalingSettingsDescription?
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// The current state of the replica:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The replica is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The replica is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The replica is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The replica is ready for use.
  /// </li>
  /// </ul>
  final ReplicaStatus? replicaStatus;

  ReplicaAutoScalingDescription({
    this.globalSecondaryIndexes,
    this.regionName,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaStatus,
  });

  factory ReplicaAutoScalingDescription.fromJson(Map<String, dynamic> json) {
    return ReplicaAutoScalingDescription(
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicaGlobalSecondaryIndexAutoScalingDescription.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      regionName: json['RegionName'] as String?,
      replicaProvisionedReadCapacityAutoScalingSettings:
          json['ReplicaProvisionedReadCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ReplicaProvisionedReadCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      replicaProvisionedWriteCapacityAutoScalingSettings:
          json['ReplicaProvisionedWriteCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ReplicaProvisionedWriteCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      replicaStatus: (json['ReplicaStatus'] as String?)?.toReplicaStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final regionName = this.regionName;
    final replicaProvisionedReadCapacityAutoScalingSettings =
        this.replicaProvisionedReadCapacityAutoScalingSettings;
    final replicaProvisionedWriteCapacityAutoScalingSettings =
        this.replicaProvisionedWriteCapacityAutoScalingSettings;
    final replicaStatus = this.replicaStatus;
    return {
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (regionName != null) 'RegionName': regionName,
      if (replicaProvisionedReadCapacityAutoScalingSettings != null)
        'ReplicaProvisionedReadCapacityAutoScalingSettings':
            replicaProvisionedReadCapacityAutoScalingSettings,
      if (replicaProvisionedWriteCapacityAutoScalingSettings != null)
        'ReplicaProvisionedWriteCapacityAutoScalingSettings':
            replicaProvisionedWriteCapacityAutoScalingSettings,
      if (replicaStatus != null) 'ReplicaStatus': replicaStatus.toValue(),
    };
  }
}

/// Represents the auto scaling settings of a replica that will be modified.
class ReplicaAutoScalingUpdate {
  /// The Region where the replica exists.
  final String regionName;

  /// Represents the auto scaling settings of global secondary indexes that will
  /// be modified.
  final List<ReplicaGlobalSecondaryIndexAutoScalingUpdate>?
      replicaGlobalSecondaryIndexUpdates;
  final AutoScalingSettingsUpdate?
      replicaProvisionedReadCapacityAutoScalingUpdate;

  ReplicaAutoScalingUpdate({
    required this.regionName,
    this.replicaGlobalSecondaryIndexUpdates,
    this.replicaProvisionedReadCapacityAutoScalingUpdate,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final replicaGlobalSecondaryIndexUpdates =
        this.replicaGlobalSecondaryIndexUpdates;
    final replicaProvisionedReadCapacityAutoScalingUpdate =
        this.replicaProvisionedReadCapacityAutoScalingUpdate;
    return {
      'RegionName': regionName,
      if (replicaGlobalSecondaryIndexUpdates != null)
        'ReplicaGlobalSecondaryIndexUpdates':
            replicaGlobalSecondaryIndexUpdates,
      if (replicaProvisionedReadCapacityAutoScalingUpdate != null)
        'ReplicaProvisionedReadCapacityAutoScalingUpdate':
            replicaProvisionedReadCapacityAutoScalingUpdate,
    };
  }
}

/// Contains the details of the replica.
class ReplicaDescription {
  /// Replica-specific global secondary index settings.
  final List<ReplicaGlobalSecondaryIndexDescription>? globalSecondaryIndexes;

  /// The KMS key of the replica that will be used for KMS encryption.
  final String? kMSMasterKeyId;

  /// Overrides the maximum on-demand throughput settings for the specified
  /// replica table.
  final OnDemandThroughputOverride? onDemandThroughputOverride;

  /// Replica-specific provisioned throughput. If not described, uses the source
  /// table's provisioned throughput settings.
  final ProvisionedThroughputOverride? provisionedThroughputOverride;

  /// The name of the Region.
  final String? regionName;

  /// The time at which the replica was first detected as inaccessible. To
  /// determine cause of inaccessibility check the <code>ReplicaStatus</code>
  /// property.
  final DateTime? replicaInaccessibleDateTime;

  /// The current state of the replica:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The replica is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The replica is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The replica is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The replica is ready for use.
  /// </li>
  /// <li>
  /// <code>REGION_DISABLED</code> - The replica is inaccessible because the
  /// Amazon Web Services Region has been disabled.
  /// <note>
  /// If the Amazon Web Services Region remains inaccessible for more than 20
  /// hours, DynamoDB will remove this replica from the replication group. The
  /// replica will not be deleted and replication will stop from and to this
  /// region.
  /// </note> </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_CREDENTIALS </code> - The KMS key used to
  /// encrypt the table is inaccessible.
  /// <note>
  /// If the KMS key remains inaccessible for more than 20 hours, DynamoDB will
  /// remove this replica from the replication group. The replica will not be
  /// deleted and replication will stop from and to this region.
  /// </note> </li>
  /// </ul>
  final ReplicaStatus? replicaStatus;

  /// Detailed information about the replica status.
  final String? replicaStatusDescription;

  /// Specifies the progress of a Create, Update, or Delete action on the replica
  /// as a percentage.
  final String? replicaStatusPercentProgress;
  final TableClassSummary? replicaTableClassSummary;

  ReplicaDescription({
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.onDemandThroughputOverride,
    this.provisionedThroughputOverride,
    this.regionName,
    this.replicaInaccessibleDateTime,
    this.replicaStatus,
    this.replicaStatusDescription,
    this.replicaStatusPercentProgress,
    this.replicaTableClassSummary,
  });

  factory ReplicaDescription.fromJson(Map<String, dynamic> json) {
    return ReplicaDescription(
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicaGlobalSecondaryIndexDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      kMSMasterKeyId: json['KMSMasterKeyId'] as String?,
      onDemandThroughputOverride: json['OnDemandThroughputOverride'] != null
          ? OnDemandThroughputOverride.fromJson(
              json['OnDemandThroughputOverride'] as Map<String, dynamic>)
          : null,
      provisionedThroughputOverride:
          json['ProvisionedThroughputOverride'] != null
              ? ProvisionedThroughputOverride.fromJson(
                  json['ProvisionedThroughputOverride'] as Map<String, dynamic>)
              : null,
      regionName: json['RegionName'] as String?,
      replicaInaccessibleDateTime:
          timeStampFromJson(json['ReplicaInaccessibleDateTime']),
      replicaStatus: (json['ReplicaStatus'] as String?)?.toReplicaStatus(),
      replicaStatusDescription: json['ReplicaStatusDescription'] as String?,
      replicaStatusPercentProgress:
          json['ReplicaStatusPercentProgress'] as String?,
      replicaTableClassSummary: json['ReplicaTableClassSummary'] != null
          ? TableClassSummary.fromJson(
              json['ReplicaTableClassSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final kMSMasterKeyId = this.kMSMasterKeyId;
    final onDemandThroughputOverride = this.onDemandThroughputOverride;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    final regionName = this.regionName;
    final replicaInaccessibleDateTime = this.replicaInaccessibleDateTime;
    final replicaStatus = this.replicaStatus;
    final replicaStatusDescription = this.replicaStatusDescription;
    final replicaStatusPercentProgress = this.replicaStatusPercentProgress;
    final replicaTableClassSummary = this.replicaTableClassSummary;
    return {
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (kMSMasterKeyId != null) 'KMSMasterKeyId': kMSMasterKeyId,
      if (onDemandThroughputOverride != null)
        'OnDemandThroughputOverride': onDemandThroughputOverride,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
      if (regionName != null) 'RegionName': regionName,
      if (replicaInaccessibleDateTime != null)
        'ReplicaInaccessibleDateTime':
            unixTimestampToJson(replicaInaccessibleDateTime),
      if (replicaStatus != null) 'ReplicaStatus': replicaStatus.toValue(),
      if (replicaStatusDescription != null)
        'ReplicaStatusDescription': replicaStatusDescription,
      if (replicaStatusPercentProgress != null)
        'ReplicaStatusPercentProgress': replicaStatusPercentProgress,
      if (replicaTableClassSummary != null)
        'ReplicaTableClassSummary': replicaTableClassSummary,
    };
  }
}

/// Represents the properties of a replica global secondary index.
class ReplicaGlobalSecondaryIndex {
  /// The name of the global secondary index.
  final String indexName;

  /// Overrides the maximum on-demand throughput settings for the specified global
  /// secondary index in the specified replica table.
  final OnDemandThroughputOverride? onDemandThroughputOverride;

  /// Replica table GSI-specific provisioned throughput. If not specified, uses
  /// the source table GSI's read capacity settings.
  final ProvisionedThroughputOverride? provisionedThroughputOverride;

  ReplicaGlobalSecondaryIndex({
    required this.indexName,
    this.onDemandThroughputOverride,
    this.provisionedThroughputOverride,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final onDemandThroughputOverride = this.onDemandThroughputOverride;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    return {
      'IndexName': indexName,
      if (onDemandThroughputOverride != null)
        'OnDemandThroughputOverride': onDemandThroughputOverride,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
    };
  }
}

/// Represents the auto scaling configuration for a replica global secondary
/// index.
class ReplicaGlobalSecondaryIndexAutoScalingDescription {
  /// The name of the global secondary index.
  final String? indexName;

  /// The current state of the replica global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The table/index configuration is being updated. The
  /// table/index remains available for data operations when <code>UPDATING</code>
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul>
  final IndexStatus? indexStatus;
  final AutoScalingSettingsDescription?
      provisionedReadCapacityAutoScalingSettings;
  final AutoScalingSettingsDescription?
      provisionedWriteCapacityAutoScalingSettings;

  ReplicaGlobalSecondaryIndexAutoScalingDescription({
    this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedWriteCapacityAutoScalingSettings,
  });

  factory ReplicaGlobalSecondaryIndexAutoScalingDescription.fromJson(
      Map<String, dynamic> json) {
    return ReplicaGlobalSecondaryIndexAutoScalingDescription(
      indexName: json['IndexName'] as String?,
      indexStatus: (json['IndexStatus'] as String?)?.toIndexStatus(),
      provisionedReadCapacityAutoScalingSettings:
          json['ProvisionedReadCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ProvisionedReadCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      provisionedWriteCapacityAutoScalingSettings:
          json['ProvisionedWriteCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ProvisionedWriteCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final indexStatus = this.indexStatus;
    final provisionedReadCapacityAutoScalingSettings =
        this.provisionedReadCapacityAutoScalingSettings;
    final provisionedWriteCapacityAutoScalingSettings =
        this.provisionedWriteCapacityAutoScalingSettings;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (indexStatus != null) 'IndexStatus': indexStatus.toValue(),
      if (provisionedReadCapacityAutoScalingSettings != null)
        'ProvisionedReadCapacityAutoScalingSettings':
            provisionedReadCapacityAutoScalingSettings,
      if (provisionedWriteCapacityAutoScalingSettings != null)
        'ProvisionedWriteCapacityAutoScalingSettings':
            provisionedWriteCapacityAutoScalingSettings,
    };
  }
}

/// Represents the auto scaling settings of a global secondary index for a
/// replica that will be modified.
class ReplicaGlobalSecondaryIndexAutoScalingUpdate {
  /// The name of the global secondary index.
  final String? indexName;
  final AutoScalingSettingsUpdate? provisionedReadCapacityAutoScalingUpdate;

  ReplicaGlobalSecondaryIndexAutoScalingUpdate({
    this.indexName,
    this.provisionedReadCapacityAutoScalingUpdate,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final provisionedReadCapacityAutoScalingUpdate =
        this.provisionedReadCapacityAutoScalingUpdate;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (provisionedReadCapacityAutoScalingUpdate != null)
        'ProvisionedReadCapacityAutoScalingUpdate':
            provisionedReadCapacityAutoScalingUpdate,
    };
  }
}

/// Represents the properties of a replica global secondary index.
class ReplicaGlobalSecondaryIndexDescription {
  /// The name of the global secondary index.
  final String? indexName;

  /// Overrides the maximum on-demand throughput for the specified global
  /// secondary index in the specified replica table.
  final OnDemandThroughputOverride? onDemandThroughputOverride;

  /// If not described, uses the source table GSI's read capacity settings.
  final ProvisionedThroughputOverride? provisionedThroughputOverride;

  ReplicaGlobalSecondaryIndexDescription({
    this.indexName,
    this.onDemandThroughputOverride,
    this.provisionedThroughputOverride,
  });

  factory ReplicaGlobalSecondaryIndexDescription.fromJson(
      Map<String, dynamic> json) {
    return ReplicaGlobalSecondaryIndexDescription(
      indexName: json['IndexName'] as String?,
      onDemandThroughputOverride: json['OnDemandThroughputOverride'] != null
          ? OnDemandThroughputOverride.fromJson(
              json['OnDemandThroughputOverride'] as Map<String, dynamic>)
          : null,
      provisionedThroughputOverride:
          json['ProvisionedThroughputOverride'] != null
              ? ProvisionedThroughputOverride.fromJson(
                  json['ProvisionedThroughputOverride'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final onDemandThroughputOverride = this.onDemandThroughputOverride;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (onDemandThroughputOverride != null)
        'OnDemandThroughputOverride': onDemandThroughputOverride,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
    };
  }
}

/// Represents the properties of a global secondary index.
class ReplicaGlobalSecondaryIndexSettingsDescription {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The current status of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The global secondary index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The global secondary index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The global secondary index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The global secondary index is ready for use.
  /// </li>
  /// </ul>
  final IndexStatus? indexStatus;

  /// Auto scaling settings for a global secondary index replica's read capacity
  /// units.
  final AutoScalingSettingsDescription?
      provisionedReadCapacityAutoScalingSettings;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  final int? provisionedReadCapacityUnits;

  /// Auto scaling settings for a global secondary index replica's write capacity
  /// units.
  final AutoScalingSettingsDescription?
      provisionedWriteCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
  final int? provisionedWriteCapacityUnits;

  ReplicaGlobalSecondaryIndexSettingsDescription({
    required this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedReadCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettings,
    this.provisionedWriteCapacityUnits,
  });

  factory ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
      Map<String, dynamic> json) {
    return ReplicaGlobalSecondaryIndexSettingsDescription(
      indexName: json['IndexName'] as String,
      indexStatus: (json['IndexStatus'] as String?)?.toIndexStatus(),
      provisionedReadCapacityAutoScalingSettings:
          json['ProvisionedReadCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ProvisionedReadCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      provisionedReadCapacityUnits:
          json['ProvisionedReadCapacityUnits'] as int?,
      provisionedWriteCapacityAutoScalingSettings:
          json['ProvisionedWriteCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ProvisionedWriteCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      provisionedWriteCapacityUnits:
          json['ProvisionedWriteCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final indexStatus = this.indexStatus;
    final provisionedReadCapacityAutoScalingSettings =
        this.provisionedReadCapacityAutoScalingSettings;
    final provisionedReadCapacityUnits = this.provisionedReadCapacityUnits;
    final provisionedWriteCapacityAutoScalingSettings =
        this.provisionedWriteCapacityAutoScalingSettings;
    final provisionedWriteCapacityUnits = this.provisionedWriteCapacityUnits;
    return {
      'IndexName': indexName,
      if (indexStatus != null) 'IndexStatus': indexStatus.toValue(),
      if (provisionedReadCapacityAutoScalingSettings != null)
        'ProvisionedReadCapacityAutoScalingSettings':
            provisionedReadCapacityAutoScalingSettings,
      if (provisionedReadCapacityUnits != null)
        'ProvisionedReadCapacityUnits': provisionedReadCapacityUnits,
      if (provisionedWriteCapacityAutoScalingSettings != null)
        'ProvisionedWriteCapacityAutoScalingSettings':
            provisionedWriteCapacityAutoScalingSettings,
      if (provisionedWriteCapacityUnits != null)
        'ProvisionedWriteCapacityUnits': provisionedWriteCapacityUnits,
    };
  }
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
class ReplicaGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// Auto scaling settings for managing a global secondary index replica's read
  /// capacity units.
  final AutoScalingSettingsUpdate?
      provisionedReadCapacityAutoScalingSettingsUpdate;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  final int? provisionedReadCapacityUnits;

  ReplicaGlobalSecondaryIndexSettingsUpdate({
    required this.indexName,
    this.provisionedReadCapacityAutoScalingSettingsUpdate,
    this.provisionedReadCapacityUnits,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final provisionedReadCapacityAutoScalingSettingsUpdate =
        this.provisionedReadCapacityAutoScalingSettingsUpdate;
    final provisionedReadCapacityUnits = this.provisionedReadCapacityUnits;
    return {
      'IndexName': indexName,
      if (provisionedReadCapacityAutoScalingSettingsUpdate != null)
        'ProvisionedReadCapacityAutoScalingSettingsUpdate':
            provisionedReadCapacityAutoScalingSettingsUpdate,
      if (provisionedReadCapacityUnits != null)
        'ProvisionedReadCapacityUnits': provisionedReadCapacityUnits,
    };
  }
}

/// Represents the properties of a replica.
class ReplicaSettingsDescription {
  /// The Region name of the replica.
  final String regionName;

  /// The read/write capacity mode of the replica.
  final BillingModeSummary? replicaBillingModeSummary;

  /// Replica global secondary index settings for the global table.
  final List<ReplicaGlobalSecondaryIndexSettingsDescription>?
      replicaGlobalSecondaryIndexSettings;

  /// Auto scaling settings for a global table replica's read capacity units.
  final AutoScalingSettingsDescription?
      replicaProvisionedReadCapacityAutoScalingSettings;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final int? replicaProvisionedReadCapacityUnits;

  /// Auto scaling settings for a global table replica's write capacity units.
  final AutoScalingSettingsDescription?
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final int? replicaProvisionedWriteCapacityUnits;

  /// The current state of the Region:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The Region is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The Region is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The Region is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The Region is ready for use.
  /// </li>
  /// </ul>
  final ReplicaStatus? replicaStatus;
  final TableClassSummary? replicaTableClassSummary;

  ReplicaSettingsDescription({
    required this.regionName,
    this.replicaBillingModeSummary,
    this.replicaGlobalSecondaryIndexSettings,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityUnits,
    this.replicaStatus,
    this.replicaTableClassSummary,
  });

  factory ReplicaSettingsDescription.fromJson(Map<String, dynamic> json) {
    return ReplicaSettingsDescription(
      regionName: json['RegionName'] as String,
      replicaBillingModeSummary: json['ReplicaBillingModeSummary'] != null
          ? BillingModeSummary.fromJson(
              json['ReplicaBillingModeSummary'] as Map<String, dynamic>)
          : null,
      replicaGlobalSecondaryIndexSettings:
          (json['ReplicaGlobalSecondaryIndexSettings'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
      replicaProvisionedReadCapacityAutoScalingSettings:
          json['ReplicaProvisionedReadCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ReplicaProvisionedReadCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      replicaProvisionedReadCapacityUnits:
          json['ReplicaProvisionedReadCapacityUnits'] as int?,
      replicaProvisionedWriteCapacityAutoScalingSettings:
          json['ReplicaProvisionedWriteCapacityAutoScalingSettings'] != null
              ? AutoScalingSettingsDescription.fromJson(
                  json['ReplicaProvisionedWriteCapacityAutoScalingSettings']
                      as Map<String, dynamic>)
              : null,
      replicaProvisionedWriteCapacityUnits:
          json['ReplicaProvisionedWriteCapacityUnits'] as int?,
      replicaStatus: (json['ReplicaStatus'] as String?)?.toReplicaStatus(),
      replicaTableClassSummary: json['ReplicaTableClassSummary'] != null
          ? TableClassSummary.fromJson(
              json['ReplicaTableClassSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final replicaBillingModeSummary = this.replicaBillingModeSummary;
    final replicaGlobalSecondaryIndexSettings =
        this.replicaGlobalSecondaryIndexSettings;
    final replicaProvisionedReadCapacityAutoScalingSettings =
        this.replicaProvisionedReadCapacityAutoScalingSettings;
    final replicaProvisionedReadCapacityUnits =
        this.replicaProvisionedReadCapacityUnits;
    final replicaProvisionedWriteCapacityAutoScalingSettings =
        this.replicaProvisionedWriteCapacityAutoScalingSettings;
    final replicaProvisionedWriteCapacityUnits =
        this.replicaProvisionedWriteCapacityUnits;
    final replicaStatus = this.replicaStatus;
    final replicaTableClassSummary = this.replicaTableClassSummary;
    return {
      'RegionName': regionName,
      if (replicaBillingModeSummary != null)
        'ReplicaBillingModeSummary': replicaBillingModeSummary,
      if (replicaGlobalSecondaryIndexSettings != null)
        'ReplicaGlobalSecondaryIndexSettings':
            replicaGlobalSecondaryIndexSettings,
      if (replicaProvisionedReadCapacityAutoScalingSettings != null)
        'ReplicaProvisionedReadCapacityAutoScalingSettings':
            replicaProvisionedReadCapacityAutoScalingSettings,
      if (replicaProvisionedReadCapacityUnits != null)
        'ReplicaProvisionedReadCapacityUnits':
            replicaProvisionedReadCapacityUnits,
      if (replicaProvisionedWriteCapacityAutoScalingSettings != null)
        'ReplicaProvisionedWriteCapacityAutoScalingSettings':
            replicaProvisionedWriteCapacityAutoScalingSettings,
      if (replicaProvisionedWriteCapacityUnits != null)
        'ReplicaProvisionedWriteCapacityUnits':
            replicaProvisionedWriteCapacityUnits,
      if (replicaStatus != null) 'ReplicaStatus': replicaStatus.toValue(),
      if (replicaTableClassSummary != null)
        'ReplicaTableClassSummary': replicaTableClassSummary,
    };
  }
}

/// Represents the settings for a global table in a Region that will be
/// modified.
class ReplicaSettingsUpdate {
  /// The Region of the replica to be added.
  final String regionName;

  /// Represents the settings of a global secondary index for a global table that
  /// will be modified.
  final List<ReplicaGlobalSecondaryIndexSettingsUpdate>?
      replicaGlobalSecondaryIndexSettingsUpdate;

  /// Auto scaling settings for managing a global table replica's read capacity
  /// units.
  final AutoScalingSettingsUpdate?
      replicaProvisionedReadCapacityAutoScalingSettingsUpdate;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final int? replicaProvisionedReadCapacityUnits;

  /// Replica-specific table class. If not specified, uses the source table's
  /// table class.
  final TableClass? replicaTableClass;

  ReplicaSettingsUpdate({
    required this.regionName,
    this.replicaGlobalSecondaryIndexSettingsUpdate,
    this.replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaTableClass,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final replicaGlobalSecondaryIndexSettingsUpdate =
        this.replicaGlobalSecondaryIndexSettingsUpdate;
    final replicaProvisionedReadCapacityAutoScalingSettingsUpdate =
        this.replicaProvisionedReadCapacityAutoScalingSettingsUpdate;
    final replicaProvisionedReadCapacityUnits =
        this.replicaProvisionedReadCapacityUnits;
    final replicaTableClass = this.replicaTableClass;
    return {
      'RegionName': regionName,
      if (replicaGlobalSecondaryIndexSettingsUpdate != null)
        'ReplicaGlobalSecondaryIndexSettingsUpdate':
            replicaGlobalSecondaryIndexSettingsUpdate,
      if (replicaProvisionedReadCapacityAutoScalingSettingsUpdate != null)
        'ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate':
            replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
      if (replicaProvisionedReadCapacityUnits != null)
        'ReplicaProvisionedReadCapacityUnits':
            replicaProvisionedReadCapacityUnits,
      if (replicaTableClass != null)
        'ReplicaTableClass': replicaTableClass.toValue(),
    };
  }
}

enum ReplicaStatus {
  creating,
  creationFailed,
  updating,
  deleting,
  active,
  regionDisabled,
  inaccessibleEncryptionCredentials,
}

extension ReplicaStatusValueExtension on ReplicaStatus {
  String toValue() {
    switch (this) {
      case ReplicaStatus.creating:
        return 'CREATING';
      case ReplicaStatus.creationFailed:
        return 'CREATION_FAILED';
      case ReplicaStatus.updating:
        return 'UPDATING';
      case ReplicaStatus.deleting:
        return 'DELETING';
      case ReplicaStatus.active:
        return 'ACTIVE';
      case ReplicaStatus.regionDisabled:
        return 'REGION_DISABLED';
      case ReplicaStatus.inaccessibleEncryptionCredentials:
        return 'INACCESSIBLE_ENCRYPTION_CREDENTIALS';
    }
  }
}

extension ReplicaStatusFromString on String {
  ReplicaStatus toReplicaStatus() {
    switch (this) {
      case 'CREATING':
        return ReplicaStatus.creating;
      case 'CREATION_FAILED':
        return ReplicaStatus.creationFailed;
      case 'UPDATING':
        return ReplicaStatus.updating;
      case 'DELETING':
        return ReplicaStatus.deleting;
      case 'ACTIVE':
        return ReplicaStatus.active;
      case 'REGION_DISABLED':
        return ReplicaStatus.regionDisabled;
      case 'INACCESSIBLE_ENCRYPTION_CREDENTIALS':
        return ReplicaStatus.inaccessibleEncryptionCredentials;
    }
    throw Exception('$this is not known in enum ReplicaStatus');
  }
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new replica to be added to an existing global table.
/// </li>
/// <li>
/// New parameters for an existing replica.
/// </li>
/// <li>
/// An existing replica to be removed from an existing global table.
/// </li>
/// </ul>
class ReplicaUpdate {
  /// The parameters required for creating a replica on an existing global table.
  final CreateReplicaAction? create;

  /// The name of the existing replica to be removed.
  final DeleteReplicaAction? delete;

  ReplicaUpdate({
    this.create,
    this.delete,
  });

  Map<String, dynamic> toJson() {
    final create = this.create;
    final delete = this.delete;
    return {
      if (create != null) 'Create': create,
      if (delete != null) 'Delete': delete,
    };
  }
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new replica to be added to an existing regional table or global table.
/// This request invokes the <code>CreateTableReplica</code> action in the
/// destination Region.
/// </li>
/// <li>
/// New parameters for an existing replica. This request invokes the
/// <code>UpdateTable</code> action in the destination Region.
/// </li>
/// <li>
/// An existing replica to be deleted. The request invokes the
/// <code>DeleteTableReplica</code> action in the destination Region, deleting
/// the replica and all if its items in the destination Region.
/// </li>
/// </ul> <note>
/// When you manually remove a table or global table replica, you do not
/// automatically remove any associated scalable targets, scaling policies, or
/// CloudWatch alarms.
/// </note>
class ReplicationGroupUpdate {
  /// The parameters required for creating a replica for the table.
  final CreateReplicationGroupMemberAction? create;

  /// The parameters required for deleting a replica for the table.
  final DeleteReplicationGroupMemberAction? delete;

  /// The parameters required for updating a replica for the table.
  final UpdateReplicationGroupMemberAction? update;

  ReplicationGroupUpdate({
    this.create,
    this.delete,
    this.update,
  });

  Map<String, dynamic> toJson() {
    final create = this.create;
    final delete = this.delete;
    final update = this.update;
    return {
      if (create != null) 'Create': create,
      if (delete != null) 'Delete': delete,
      if (update != null) 'Update': update,
    };
  }
}

/// Contains details for the restore.
class RestoreSummary {
  /// Point in time or source backup time.
  final DateTime restoreDateTime;

  /// Indicates if a restore is in progress or not.
  final bool restoreInProgress;

  /// The Amazon Resource Name (ARN) of the backup from which the table was
  /// restored.
  final String? sourceBackupArn;

  /// The ARN of the source table of the backup that is being restored.
  final String? sourceTableArn;

  RestoreSummary({
    required this.restoreDateTime,
    required this.restoreInProgress,
    this.sourceBackupArn,
    this.sourceTableArn,
  });

  factory RestoreSummary.fromJson(Map<String, dynamic> json) {
    return RestoreSummary(
      restoreDateTime:
          nonNullableTimeStampFromJson(json['RestoreDateTime'] as Object),
      restoreInProgress: json['RestoreInProgress'] as bool,
      sourceBackupArn: json['SourceBackupArn'] as String?,
      sourceTableArn: json['SourceTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreDateTime = this.restoreDateTime;
    final restoreInProgress = this.restoreInProgress;
    final sourceBackupArn = this.sourceBackupArn;
    final sourceTableArn = this.sourceTableArn;
    return {
      'RestoreDateTime': unixTimestampToJson(restoreDateTime),
      'RestoreInProgress': restoreInProgress,
      if (sourceBackupArn != null) 'SourceBackupArn': sourceBackupArn,
      if (sourceTableArn != null) 'SourceTableArn': sourceTableArn,
    };
  }
}

class RestoreTableFromBackupOutput {
  /// The description of the table created from an existing backup.
  final TableDescription? tableDescription;

  RestoreTableFromBackupOutput({
    this.tableDescription,
  });

  factory RestoreTableFromBackupOutput.fromJson(Map<String, dynamic> json) {
    return RestoreTableFromBackupOutput(
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

class RestoreTableToPointInTimeOutput {
  /// Represents the properties of a table.
  final TableDescription? tableDescription;

  RestoreTableToPointInTimeOutput({
    this.tableDescription,
  });

  factory RestoreTableToPointInTimeOutput.fromJson(Map<String, dynamic> json) {
    return RestoreTableToPointInTimeOutput(
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

/// Determines the level of detail about either provisioned or on-demand
/// throughput consumption that is returned in the response:
///
/// <ul>
/// <li>
/// <code>INDEXES</code> - The response includes the aggregate
/// <code>ConsumedCapacity</code> for the operation, together with
/// <code>ConsumedCapacity</code> for each table and secondary index that was
/// accessed.
///
/// Note that some operations, such as <code>GetItem</code> and
/// <code>BatchGetItem</code>, do not access any indexes at all. In these cases,
/// specifying <code>INDEXES</code> will only return
/// <code>ConsumedCapacity</code> information for table(s).
/// </li>
/// <li>
/// <code>TOTAL</code> - The response includes only the aggregate
/// <code>ConsumedCapacity</code> for the operation.
/// </li>
/// <li>
/// <code>NONE</code> - No <code>ConsumedCapacity</code> details are included in
/// the response.
/// </li>
/// </ul>
enum ReturnConsumedCapacity {
  indexes,
  total,
  none,
}

extension ReturnConsumedCapacityValueExtension on ReturnConsumedCapacity {
  String toValue() {
    switch (this) {
      case ReturnConsumedCapacity.indexes:
        return 'INDEXES';
      case ReturnConsumedCapacity.total:
        return 'TOTAL';
      case ReturnConsumedCapacity.none:
        return 'NONE';
    }
  }
}

extension ReturnConsumedCapacityFromString on String {
  ReturnConsumedCapacity toReturnConsumedCapacity() {
    switch (this) {
      case 'INDEXES':
        return ReturnConsumedCapacity.indexes;
      case 'TOTAL':
        return ReturnConsumedCapacity.total;
      case 'NONE':
        return ReturnConsumedCapacity.none;
    }
    throw Exception('$this is not known in enum ReturnConsumedCapacity');
  }
}

enum ReturnItemCollectionMetrics {
  size,
  none,
}

extension ReturnItemCollectionMetricsValueExtension
    on ReturnItemCollectionMetrics {
  String toValue() {
    switch (this) {
      case ReturnItemCollectionMetrics.size:
        return 'SIZE';
      case ReturnItemCollectionMetrics.none:
        return 'NONE';
    }
  }
}

extension ReturnItemCollectionMetricsFromString on String {
  ReturnItemCollectionMetrics toReturnItemCollectionMetrics() {
    switch (this) {
      case 'SIZE':
        return ReturnItemCollectionMetrics.size;
      case 'NONE':
        return ReturnItemCollectionMetrics.none;
    }
    throw Exception('$this is not known in enum ReturnItemCollectionMetrics');
  }
}

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

enum ReturnValuesOnConditionCheckFailure {
  allOld,
  none,
}

extension ReturnValuesOnConditionCheckFailureValueExtension
    on ReturnValuesOnConditionCheckFailure {
  String toValue() {
    switch (this) {
      case ReturnValuesOnConditionCheckFailure.allOld:
        return 'ALL_OLD';
      case ReturnValuesOnConditionCheckFailure.none:
        return 'NONE';
    }
  }
}

extension ReturnValuesOnConditionCheckFailureFromString on String {
  ReturnValuesOnConditionCheckFailure toReturnValuesOnConditionCheckFailure() {
    switch (this) {
      case 'ALL_OLD':
        return ReturnValuesOnConditionCheckFailure.allOld;
      case 'NONE':
        return ReturnValuesOnConditionCheckFailure.none;
    }
    throw Exception(
        '$this is not known in enum ReturnValuesOnConditionCheckFailure');
  }
}

/// The S3 bucket that is being imported from.
class S3BucketSource {
  /// The S3 bucket that is being imported from.
  final String s3Bucket;

  /// The account number of the S3 bucket that is being imported from. If the
  /// bucket is owned by the requester this is optional.
  final String? s3BucketOwner;

  /// The key prefix shared by all S3 Objects that are being imported.
  final String? s3KeyPrefix;

  S3BucketSource({
    required this.s3Bucket,
    this.s3BucketOwner,
    this.s3KeyPrefix,
  });

  factory S3BucketSource.fromJson(Map<String, dynamic> json) {
    return S3BucketSource(
      s3Bucket: json['S3Bucket'] as String,
      s3BucketOwner: json['S3BucketOwner'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      'S3Bucket': s3Bucket,
      if (s3BucketOwner != null) 'S3BucketOwner': s3BucketOwner,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

enum S3SseAlgorithm {
  aes256,
  kms,
}

extension S3SseAlgorithmValueExtension on S3SseAlgorithm {
  String toValue() {
    switch (this) {
      case S3SseAlgorithm.aes256:
        return 'AES256';
      case S3SseAlgorithm.kms:
        return 'KMS';
    }
  }
}

extension S3SseAlgorithmFromString on String {
  S3SseAlgorithm toS3SseAlgorithm() {
    switch (this) {
      case 'AES256':
        return S3SseAlgorithm.aes256;
      case 'KMS':
        return S3SseAlgorithm.kms;
    }
    throw Exception('$this is not known in enum S3SseAlgorithm');
  }
}

/// The description of the server-side encryption status on the specified table.
class SSEDescription {
  /// Indicates the time, in UNIX epoch date format, when DynamoDB detected that
  /// the table's KMS key was inaccessible. This attribute will automatically be
  /// cleared when DynamoDB detects that the table's KMS key is accessible again.
  /// DynamoDB will initiate the table archival process when table's KMS key
  /// remains inaccessible for more than seven days from this date.
  final DateTime? inaccessibleEncryptionDateTime;

  /// The KMS key ARN used for the KMS encryption.
  final String? kMSMasterKeyArn;

  /// Server-side encryption type. The only supported value is:
  ///
  /// <ul>
  /// <li>
  /// <code>KMS</code> - Server-side encryption that uses Key Management Service.
  /// The key is stored in your account and is managed by KMS (KMS charges apply).
  /// </li>
  /// </ul>
  final SSEType? sSEType;

  /// Represents the current state of server-side encryption. The only supported
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Server-side encryption is enabled.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Server-side encryption is being updated.
  /// </li>
  /// </ul>
  final SSEStatus? status;

  SSEDescription({
    this.inaccessibleEncryptionDateTime,
    this.kMSMasterKeyArn,
    this.sSEType,
    this.status,
  });

  factory SSEDescription.fromJson(Map<String, dynamic> json) {
    return SSEDescription(
      inaccessibleEncryptionDateTime:
          timeStampFromJson(json['InaccessibleEncryptionDateTime']),
      kMSMasterKeyArn: json['KMSMasterKeyArn'] as String?,
      sSEType: (json['SSEType'] as String?)?.toSSEType(),
      status: (json['Status'] as String?)?.toSSEStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final inaccessibleEncryptionDateTime = this.inaccessibleEncryptionDateTime;
    final kMSMasterKeyArn = this.kMSMasterKeyArn;
    final sSEType = this.sSEType;
    final status = this.status;
    return {
      if (inaccessibleEncryptionDateTime != null)
        'InaccessibleEncryptionDateTime':
            unixTimestampToJson(inaccessibleEncryptionDateTime),
      if (kMSMasterKeyArn != null) 'KMSMasterKeyArn': kMSMasterKeyArn,
      if (sSEType != null) 'SSEType': sSEType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Represents the settings used to enable server-side encryption.
class SSESpecification {
  /// Indicates whether server-side encryption is done using an Amazon Web
  /// Services managed key or an Amazon Web Services owned key. If enabled (true),
  /// server-side encryption type is set to <code>KMS</code> and an Amazon Web
  /// Services managed key is used (KMS charges apply). If disabled (false) or not
  /// specified, server-side encryption is set to Amazon Web Services owned key.
  final bool? enabled;

  /// The KMS key that should be used for the KMS encryption. To specify a key,
  /// use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note
  /// that you should only provide this parameter if the key is different from the
  /// default DynamoDB key <code>alias/aws/dynamodb</code>.
  final String? kMSMasterKeyId;

  /// Server-side encryption type. The only supported value is:
  ///
  /// <ul>
  /// <li>
  /// <code>KMS</code> - Server-side encryption that uses Key Management Service.
  /// The key is stored in your account and is managed by KMS (KMS charges apply).
  /// </li>
  /// </ul>
  final SSEType? sSEType;

  SSESpecification({
    this.enabled,
    this.kMSMasterKeyId,
    this.sSEType,
  });

  factory SSESpecification.fromJson(Map<String, dynamic> json) {
    return SSESpecification(
      enabled: json['Enabled'] as bool?,
      kMSMasterKeyId: json['KMSMasterKeyId'] as String?,
      sSEType: (json['SSEType'] as String?)?.toSSEType(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final kMSMasterKeyId = this.kMSMasterKeyId;
    final sSEType = this.sSEType;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (kMSMasterKeyId != null) 'KMSMasterKeyId': kMSMasterKeyId,
      if (sSEType != null) 'SSEType': sSEType.toValue(),
    };
  }
}

enum SSEStatus {
  enabling,
  enabled,
  disabling,
  disabled,
  updating,
}

extension SSEStatusValueExtension on SSEStatus {
  String toValue() {
    switch (this) {
      case SSEStatus.enabling:
        return 'ENABLING';
      case SSEStatus.enabled:
        return 'ENABLED';
      case SSEStatus.disabling:
        return 'DISABLING';
      case SSEStatus.disabled:
        return 'DISABLED';
      case SSEStatus.updating:
        return 'UPDATING';
    }
  }
}

extension SSEStatusFromString on String {
  SSEStatus toSSEStatus() {
    switch (this) {
      case 'ENABLING':
        return SSEStatus.enabling;
      case 'ENABLED':
        return SSEStatus.enabled;
      case 'DISABLING':
        return SSEStatus.disabling;
      case 'DISABLED':
        return SSEStatus.disabled;
      case 'UPDATING':
        return SSEStatus.updating;
    }
    throw Exception('$this is not known in enum SSEStatus');
  }
}

enum SSEType {
  aes256,
  kms,
}

extension SSETypeValueExtension on SSEType {
  String toValue() {
    switch (this) {
      case SSEType.aes256:
        return 'AES256';
      case SSEType.kms:
        return 'KMS';
    }
  }
}

extension SSETypeFromString on String {
  SSEType toSSEType() {
    switch (this) {
      case 'AES256':
        return SSEType.aes256;
      case 'KMS':
        return SSEType.kms;
    }
    throw Exception('$this is not known in enum SSEType');
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

/// Represents the output of a <code>Scan</code> operation.
class ScanOutput {
  /// The capacity units consumed by the <code>Scan</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption">Capacity
  /// unit consumption for read operations</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// The number of items in the response.
  ///
  /// If you set <code>ScanFilter</code> in the request, then <code>Count</code>
  /// is the number of items returned after the filter was applied, and
  /// <code>ScannedCount</code> is the number of matching items before the filter
  /// was applied.
  ///
  /// If you did not use a filter in the request, then <code>Count</code> is the
  /// same as <code>ScannedCount</code>.
  final int? count;

  /// An array of item attributes that match the scan criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  final List<Map<String, AttributeValue>>? items;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedKey</code> is empty, then the "last page" of results
  /// has been processed and there is no more data to be retrieved.
  ///
  /// If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean
  /// that there is more data in the result set. The only way to know when you
  /// have reached the end of the result set is when <code>LastEvaluatedKey</code>
  /// is empty.
  final Map<String, AttributeValue>? lastEvaluatedKey;

  /// The number of items evaluated, before any <code>ScanFilter</code> is
  /// applied. A high <code>ScannedCount</code> value with few, or no,
  /// <code>Count</code> results indicates an inefficient <code>Scan</code>
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count
  /// and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// If you did not use a filter in the request, then <code>ScannedCount</code>
  /// is the same as <code>Count</code>.
  final int? scannedCount;

  ScanOutput({
    this.consumedCapacity,
    this.count,
    this.items,
    this.lastEvaluatedKey,
    this.scannedCount,
  });

  factory ScanOutput.fromJson(Map<String, dynamic> json) {
    return ScanOutput(
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      count: json['Count'] as int?,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>).map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))))
          .toList(),
      lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      scannedCount: json['ScannedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final count = this.count;
    final items = this.items;
    final lastEvaluatedKey = this.lastEvaluatedKey;
    final scannedCount = this.scannedCount;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (count != null) 'Count': count,
      if (items != null) 'Items': items,
      if (lastEvaluatedKey != null) 'LastEvaluatedKey': lastEvaluatedKey,
      if (scannedCount != null) 'ScannedCount': scannedCount,
    };
  }
}

enum Select {
  allAttributes,
  allProjectedAttributes,
  specificAttributes,
  count,
}

extension SelectValueExtension on Select {
  String toValue() {
    switch (this) {
      case Select.allAttributes:
        return 'ALL_ATTRIBUTES';
      case Select.allProjectedAttributes:
        return 'ALL_PROJECTED_ATTRIBUTES';
      case Select.specificAttributes:
        return 'SPECIFIC_ATTRIBUTES';
      case Select.count:
        return 'COUNT';
    }
  }
}

extension SelectFromString on String {
  Select toSelect() {
    switch (this) {
      case 'ALL_ATTRIBUTES':
        return Select.allAttributes;
      case 'ALL_PROJECTED_ATTRIBUTES':
        return Select.allProjectedAttributes;
      case 'SPECIFIC_ATTRIBUTES':
        return Select.specificAttributes;
      case 'COUNT':
        return Select.count;
    }
    throw Exception('$this is not known in enum Select');
  }
}

/// Contains the details of the table when the backup was created.
class SourceTableDetails {
  /// Schema of the table.
  final List<KeySchemaElement> keySchema;

  /// Read IOPs and Write IOPS on the table when the backup was created.
  final ProvisionedThroughput provisionedThroughput;

  /// Time when the source table was created.
  final DateTime tableCreationDateTime;

  /// Unique identifier for the table for which the backup was created.
  final String tableId;

  /// The name of the table for which the backup was created.
  final String tableName;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - Sets the read/write capacity mode to
  /// <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for
  /// predictable workloads.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to
  /// <code>PAY_PER_REQUEST</code>. We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// </li>
  /// </ul>
  final BillingMode? billingMode;

  /// Number of items in the table. Note that this is an approximate value.
  final int? itemCount;
  final OnDemandThroughput? onDemandThroughput;

  /// ARN of the table for which backup was created.
  final String? tableArn;

  /// Size of the table in bytes. Note that this is an approximate value.
  final int? tableSizeBytes;

  SourceTableDetails({
    required this.keySchema,
    required this.provisionedThroughput,
    required this.tableCreationDateTime,
    required this.tableId,
    required this.tableName,
    this.billingMode,
    this.itemCount,
    this.onDemandThroughput,
    this.tableArn,
    this.tableSizeBytes,
  });

  factory SourceTableDetails.fromJson(Map<String, dynamic> json) {
    return SourceTableDetails(
      keySchema: (json['KeySchema'] as List)
          .whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisionedThroughput: ProvisionedThroughput.fromJson(
          json['ProvisionedThroughput'] as Map<String, dynamic>),
      tableCreationDateTime:
          nonNullableTimeStampFromJson(json['TableCreationDateTime'] as Object),
      tableId: json['TableId'] as String,
      tableName: json['TableName'] as String,
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      itemCount: json['ItemCount'] as int?,
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      tableArn: json['TableArn'] as String?,
      tableSizeBytes: json['TableSizeBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final keySchema = this.keySchema;
    final provisionedThroughput = this.provisionedThroughput;
    final tableCreationDateTime = this.tableCreationDateTime;
    final tableId = this.tableId;
    final tableName = this.tableName;
    final billingMode = this.billingMode;
    final itemCount = this.itemCount;
    final onDemandThroughput = this.onDemandThroughput;
    final tableArn = this.tableArn;
    final tableSizeBytes = this.tableSizeBytes;
    return {
      'KeySchema': keySchema,
      'ProvisionedThroughput': provisionedThroughput,
      'TableCreationDateTime': unixTimestampToJson(tableCreationDateTime),
      'TableId': tableId,
      'TableName': tableName,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (itemCount != null) 'ItemCount': itemCount,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (tableArn != null) 'TableArn': tableArn,
      if (tableSizeBytes != null) 'TableSizeBytes': tableSizeBytes,
    };
  }
}

/// Contains the details of the features enabled on the table when the backup
/// was created. For example, LSIs, GSIs, streams, TTL.
class SourceTableFeatureDetails {
  /// Represents the GSI properties for the table when the backup was created. It
  /// includes the IndexName, KeySchema, Projection, and ProvisionedThroughput for
  /// the GSIs on the table at the time of backup.
  final List<GlobalSecondaryIndexInfo>? globalSecondaryIndexes;

  /// Represents the LSI properties for the table when the backup was created. It
  /// includes the IndexName, KeySchema and Projection for the LSIs on the table
  /// at the time of backup.
  final List<LocalSecondaryIndexInfo>? localSecondaryIndexes;

  /// The description of the server-side encryption status on the table when the
  /// backup was created.
  final SSEDescription? sSEDescription;

  /// Stream settings on the table when the backup was created.
  final StreamSpecification? streamDescription;

  /// Time to Live settings on the table when the backup was created.
  final TimeToLiveDescription? timeToLiveDescription;

  SourceTableFeatureDetails({
    this.globalSecondaryIndexes,
    this.localSecondaryIndexes,
    this.sSEDescription,
    this.streamDescription,
    this.timeToLiveDescription,
  });

  factory SourceTableFeatureDetails.fromJson(Map<String, dynamic> json) {
    return SourceTableFeatureDetails(
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GlobalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LocalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      sSEDescription: json['SSEDescription'] != null
          ? SSEDescription.fromJson(
              json['SSEDescription'] as Map<String, dynamic>)
          : null,
      streamDescription: json['StreamDescription'] != null
          ? StreamSpecification.fromJson(
              json['StreamDescription'] as Map<String, dynamic>)
          : null,
      timeToLiveDescription: json['TimeToLiveDescription'] != null
          ? TimeToLiveDescription.fromJson(
              json['TimeToLiveDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final localSecondaryIndexes = this.localSecondaryIndexes;
    final sSEDescription = this.sSEDescription;
    final streamDescription = this.streamDescription;
    final timeToLiveDescription = this.timeToLiveDescription;
    return {
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (localSecondaryIndexes != null)
        'LocalSecondaryIndexes': localSecondaryIndexes,
      if (sSEDescription != null) 'SSEDescription': sSEDescription,
      if (streamDescription != null) 'StreamDescription': streamDescription,
      if (timeToLiveDescription != null)
        'TimeToLiveDescription': timeToLiveDescription,
    };
  }
}

/// Represents the DynamoDB Streams configuration for a table in DynamoDB.
class StreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on
  /// the table.
  final bool streamEnabled;

  /// When an item in the table is modified, <code>StreamViewType</code>
  /// determines what information is written to the stream for this table. Valid
  /// values for <code>StreamViewType</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the key attributes of the modified item are
  /// written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - The entire item, as it appears after it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - The entire item, as it appeared before it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of
  /// the item are written to the stream.
  /// </li>
  /// </ul>
  final StreamViewType? streamViewType;

  StreamSpecification({
    required this.streamEnabled,
    this.streamViewType,
  });

  factory StreamSpecification.fromJson(Map<String, dynamic> json) {
    return StreamSpecification(
      streamEnabled: json['StreamEnabled'] as bool,
      streamViewType: (json['StreamViewType'] as String?)?.toStreamViewType(),
    );
  }

  Map<String, dynamic> toJson() {
    final streamEnabled = this.streamEnabled;
    final streamViewType = this.streamViewType;
    return {
      'StreamEnabled': streamEnabled,
      if (streamViewType != null) 'StreamViewType': streamViewType.toValue(),
    };
  }
}

enum StreamViewType {
  newImage,
  oldImage,
  newAndOldImages,
  keysOnly,
}

extension StreamViewTypeValueExtension on StreamViewType {
  String toValue() {
    switch (this) {
      case StreamViewType.newImage:
        return 'NEW_IMAGE';
      case StreamViewType.oldImage:
        return 'OLD_IMAGE';
      case StreamViewType.newAndOldImages:
        return 'NEW_AND_OLD_IMAGES';
      case StreamViewType.keysOnly:
        return 'KEYS_ONLY';
    }
  }
}

extension StreamViewTypeFromString on String {
  StreamViewType toStreamViewType() {
    switch (this) {
      case 'NEW_IMAGE':
        return StreamViewType.newImage;
      case 'OLD_IMAGE':
        return StreamViewType.oldImage;
      case 'NEW_AND_OLD_IMAGES':
        return StreamViewType.newAndOldImages;
      case 'KEYS_ONLY':
        return StreamViewType.keysOnly;
    }
    throw Exception('$this is not known in enum StreamViewType');
  }
}

/// Represents the auto scaling configuration for a global table.
class TableAutoScalingDescription {
  /// Represents replicas of the global table.
  final List<ReplicaAutoScalingDescription>? replicas;

  /// The name of the table.
  final String? tableName;

  /// The current state of the table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The table is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The table is ready for use.
  /// </li>
  /// </ul>
  final TableStatus? tableStatus;

  TableAutoScalingDescription({
    this.replicas,
    this.tableName,
    this.tableStatus,
  });

  factory TableAutoScalingDescription.fromJson(Map<String, dynamic> json) {
    return TableAutoScalingDescription(
      replicas: (json['Replicas'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicaAutoScalingDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: json['TableName'] as String?,
      tableStatus: (json['TableStatus'] as String?)?.toTableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final replicas = this.replicas;
    final tableName = this.tableName;
    final tableStatus = this.tableStatus;
    return {
      if (replicas != null) 'Replicas': replicas,
      if (tableName != null) 'TableName': tableName,
      if (tableStatus != null) 'TableStatus': tableStatus.toValue(),
    };
  }
}

enum TableClass {
  standard,
  standardInfrequentAccess,
}

extension TableClassValueExtension on TableClass {
  String toValue() {
    switch (this) {
      case TableClass.standard:
        return 'STANDARD';
      case TableClass.standardInfrequentAccess:
        return 'STANDARD_INFREQUENT_ACCESS';
    }
  }
}

extension TableClassFromString on String {
  TableClass toTableClass() {
    switch (this) {
      case 'STANDARD':
        return TableClass.standard;
      case 'STANDARD_INFREQUENT_ACCESS':
        return TableClass.standardInfrequentAccess;
    }
    throw Exception('$this is not known in enum TableClass');
  }
}

/// Contains details of the table class.
class TableClassSummary {
  /// The date and time at which the table class was last updated.
  final DateTime? lastUpdateDateTime;

  /// The table class of the specified table. Valid values are
  /// <code>STANDARD</code> and <code>STANDARD_INFREQUENT_ACCESS</code>.
  final TableClass? tableClass;

  TableClassSummary({
    this.lastUpdateDateTime,
    this.tableClass,
  });

  factory TableClassSummary.fromJson(Map<String, dynamic> json) {
    return TableClassSummary(
      lastUpdateDateTime: timeStampFromJson(json['LastUpdateDateTime']),
      tableClass: (json['TableClass'] as String?)?.toTableClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final tableClass = this.tableClass;
    return {
      if (lastUpdateDateTime != null)
        'LastUpdateDateTime': unixTimestampToJson(lastUpdateDateTime),
      if (tableClass != null) 'TableClass': tableClass.toValue(),
    };
  }
}

/// The parameters for the table created as part of the import operation.
class TableCreationParameters {
  /// The attributes of the table created as part of the import operation.
  final List<AttributeDefinition> attributeDefinitions;

  /// The primary key and option sort key of the table created as part of the
  /// import operation.
  final List<KeySchemaElement> keySchema;

  /// The name of the table created as part of the import operation.
  final String tableName;

  /// The billing mode for provisioning the table created as part of the import
  /// operation.
  final BillingMode? billingMode;

  /// The Global Secondary Indexes (GSI) of the table to be created as part of the
  /// import operation.
  final List<GlobalSecondaryIndex>? globalSecondaryIndexes;
  final OnDemandThroughput? onDemandThroughput;
  final ProvisionedThroughput? provisionedThroughput;
  final SSESpecification? sSESpecification;

  TableCreationParameters({
    required this.attributeDefinitions,
    required this.keySchema,
    required this.tableName,
    this.billingMode,
    this.globalSecondaryIndexes,
    this.onDemandThroughput,
    this.provisionedThroughput,
    this.sSESpecification,
  });

  factory TableCreationParameters.fromJson(Map<String, dynamic> json) {
    return TableCreationParameters(
      attributeDefinitions: (json['AttributeDefinitions'] as List)
          .whereNotNull()
          .map((e) => AttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      keySchema: (json['KeySchema'] as List)
          .whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: json['TableName'] as String,
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => GlobalSecondaryIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
      sSESpecification: json['SSESpecification'] != null
          ? SSESpecification.fromJson(
              json['SSESpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeDefinitions = this.attributeDefinitions;
    final keySchema = this.keySchema;
    final tableName = this.tableName;
    final billingMode = this.billingMode;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final onDemandThroughput = this.onDemandThroughput;
    final provisionedThroughput = this.provisionedThroughput;
    final sSESpecification = this.sSESpecification;
    return {
      'AttributeDefinitions': attributeDefinitions,
      'KeySchema': keySchema,
      'TableName': tableName,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (sSESpecification != null) 'SSESpecification': sSESpecification,
    };
  }
}

/// Represents the properties of a table.
class TableDescription {
  /// Contains information about the table archive.
  final ArchivalSummary? archivalSummary;

  /// An array of <code>AttributeDefinition</code> objects. Each of these objects
  /// describes one attribute in the table and index key schema.
  ///
  /// Each <code>AttributeDefinition</code> object in this array is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of the attribute.
  /// </li>
  /// <li>
  /// <code>AttributeType</code> - The data type for the attribute.
  /// </li>
  /// </ul>
  final List<AttributeDefinition>? attributeDefinitions;

  /// Contains the details for the read/write capacity mode.
  final BillingModeSummary? billingModeSummary;

  /// The date and time when the table was created, in <a
  /// href="http://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? creationDateTime;

  /// Indicates whether deletion protection is enabled (true) or disabled (false)
  /// on the table.
  final bool? deletionProtectionEnabled;

  /// The global secondary indexes, if any, on the table. Each index is scoped to
  /// a given partition key value. Each element is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>Backfilling</code> - If true, then the index is currently in the
  /// backfilling phase. Backfilling occurs only when a new global secondary index
  /// is added to the table. It is the process by which DynamoDB populates the new
  /// index with data from the table. (This attribute does not appear for indexes
  /// that were created during a <code>CreateTable</code> operation.)
  ///
  /// You can delete an index that is being created during the
  /// <code>Backfilling</code> phase when <code>IndexStatus</code> is set to
  /// CREATING and <code>Backfilling</code> is true. You can't delete the index
  /// that is being created when <code>IndexStatus</code> is set to CREATING and
  /// <code>Backfilling</code> is false. (This attribute does not appear for
  /// indexes that were created during a <code>CreateTable</code> operation.)
  /// </li>
  /// <li>
  /// <code>IndexName</code> - The name of the global secondary index.
  /// </li>
  /// <li>
  /// <code>IndexSizeBytes</code> - The total size of the global secondary index,
  /// in bytes. DynamoDB updates this value approximately every six hours. Recent
  /// changes might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>IndexStatus</code> - The current status of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ItemCount</code> - The number of items in the global secondary index.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the complete index key schema. The
  /// attribute names in the key schema must be between 1 and 255 characters
  /// (inclusive). The key schema must begin with the same partition key as the
  /// table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected. Each
  /// attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - In addition to the attributes described in
  /// <code>KEYS_ONLY</code>, the secondary index will include other non-key
  /// attributes that you specify.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct attributes
  /// when determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ProvisionedThroughput</code> - The provisioned throughput settings for
  /// the global secondary index, consisting of read and write capacity units,
  /// along with data about increases and decreases.
  /// </li>
  /// </ul>
  /// If the table is in the <code>DELETING</code> state, no information about
  /// indexes will be returned.
  final List<GlobalSecondaryIndexDescription>? globalSecondaryIndexes;

  /// Represents the version of <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html">global
  /// tables</a> in use, if the table is replicated across Amazon Web Services
  /// Regions.
  final String? globalTableVersion;

  /// The number of items in the specified table. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? itemCount;

  /// The primary key structure for the table. Each <code>KeySchemaElement</code>
  /// consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of the attribute.
  /// </li>
  /// <li>
  /// <code>KeyType</code> - The role of the attribute:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note> </li>
  /// </ul>
  /// For more information about primary keys, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary
  /// Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final List<KeySchemaElement>? keySchema;

  /// The Amazon Resource Name (ARN) that uniquely identifies the latest stream
  /// for this table.
  final String? latestStreamArn;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that <code>LatestStreamLabel</code> is not a unique identifier for the
  /// stream, because it is possible that a stream from another table might have
  /// the same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services customer ID
  /// </li>
  /// <li>
  /// Table name
  /// </li>
  /// <li>
  /// <code>StreamLabel</code>
  /// </li>
  /// </ul>
  final String? latestStreamLabel;

  /// Represents one or more local secondary indexes on the table. Each index is
  /// scoped to a given partition key value. Tables with one or more local
  /// secondary indexes are subject to an item collection size limit, where the
  /// amount of data within a given item collection cannot exceed 10 GB. Each
  /// element is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the local secondary index.
  /// </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the complete index key schema. The
  /// attribute names in the key schema must be between 1 and 255 characters
  /// (inclusive). The key schema must begin with the same partition key as the
  /// table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected. Each
  /// attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct attributes
  /// when determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>IndexSizeBytes</code> - Represents the total size of the index, in
  /// bytes. DynamoDB updates this value approximately every six hours. Recent
  /// changes might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>ItemCount</code> - Represents the number of items in the index.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  /// </li>
  /// </ul>
  /// If the table is in the <code>DELETING</code> state, no information about
  /// indexes will be returned.
  final List<LocalSecondaryIndexDescription>? localSecondaryIndexes;

  /// The maximum number of read and write units for the specified on-demand
  /// table. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  final OnDemandThroughput? onDemandThroughput;

  /// The provisioned throughput settings for the table, consisting of read and
  /// write capacity units, along with data about increases and decreases.
  final ProvisionedThroughputDescription? provisionedThroughput;

  /// Represents replicas of the table.
  final List<ReplicaDescription>? replicas;

  /// Contains details for the restore.
  final RestoreSummary? restoreSummary;

  /// The description of the server-side encryption status on the specified table.
  final SSEDescription? sSEDescription;

  /// The current DynamoDB Streams configuration for the table.
  final StreamSpecification? streamSpecification;

  /// The Amazon Resource Name (ARN) that uniquely identifies the table.
  final String? tableArn;

  /// Contains details of the table class.
  final TableClassSummary? tableClassSummary;

  /// Unique identifier for the table for which the backup was created.
  final String? tableId;

  /// The name of the table.
  final String? tableName;

  /// The total size of the specified table, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  final int? tableSizeBytes;

  /// The current state of the table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The table/index configuration is being updated. The
  /// table/index remains available for data operations when
  /// <code>UPDATING</code>.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The table is ready for use.
  /// </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_CREDENTIALS</code> - The KMS key used to
  /// encrypt the table in inaccessible. Table operations may fail due to failure
  /// to use the KMS key. DynamoDB will initiate the table archival process when a
  /// table's KMS key remains inaccessible for more than seven days.
  /// </li>
  /// <li>
  /// <code>ARCHIVING</code> - The table is being archived. Operations are not
  /// allowed until archival is complete.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code> - The table has been archived. See the ArchivalReason
  /// for more information.
  /// </li>
  /// </ul>
  final TableStatus? tableStatus;

  TableDescription({
    this.archivalSummary,
    this.attributeDefinitions,
    this.billingModeSummary,
    this.creationDateTime,
    this.deletionProtectionEnabled,
    this.globalSecondaryIndexes,
    this.globalTableVersion,
    this.itemCount,
    this.keySchema,
    this.latestStreamArn,
    this.latestStreamLabel,
    this.localSecondaryIndexes,
    this.onDemandThroughput,
    this.provisionedThroughput,
    this.replicas,
    this.restoreSummary,
    this.sSEDescription,
    this.streamSpecification,
    this.tableArn,
    this.tableClassSummary,
    this.tableId,
    this.tableName,
    this.tableSizeBytes,
    this.tableStatus,
  });

  factory TableDescription.fromJson(Map<String, dynamic> json) {
    return TableDescription(
      archivalSummary: json['ArchivalSummary'] != null
          ? ArchivalSummary.fromJson(
              json['ArchivalSummary'] as Map<String, dynamic>)
          : null,
      attributeDefinitions: (json['AttributeDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingModeSummary: json['BillingModeSummary'] != null
          ? BillingModeSummary.fromJson(
              json['BillingModeSummary'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => GlobalSecondaryIndexDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      globalTableVersion: json['GlobalTableVersion'] as String?,
      itemCount: json['ItemCount'] as int?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestStreamArn: json['LatestStreamArn'] as String?,
      latestStreamLabel: json['LatestStreamLabel'] as String?,
      localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => LocalSecondaryIndexDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      onDemandThroughput: json['OnDemandThroughput'] != null
          ? OnDemandThroughput.fromJson(
              json['OnDemandThroughput'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? ProvisionedThroughputDescription.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
      replicas: (json['Replicas'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicaDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      restoreSummary: json['RestoreSummary'] != null
          ? RestoreSummary.fromJson(
              json['RestoreSummary'] as Map<String, dynamic>)
          : null,
      sSEDescription: json['SSEDescription'] != null
          ? SSEDescription.fromJson(
              json['SSEDescription'] as Map<String, dynamic>)
          : null,
      streamSpecification: json['StreamSpecification'] != null
          ? StreamSpecification.fromJson(
              json['StreamSpecification'] as Map<String, dynamic>)
          : null,
      tableArn: json['TableArn'] as String?,
      tableClassSummary: json['TableClassSummary'] != null
          ? TableClassSummary.fromJson(
              json['TableClassSummary'] as Map<String, dynamic>)
          : null,
      tableId: json['TableId'] as String?,
      tableName: json['TableName'] as String?,
      tableSizeBytes: json['TableSizeBytes'] as int?,
      tableStatus: (json['TableStatus'] as String?)?.toTableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final archivalSummary = this.archivalSummary;
    final attributeDefinitions = this.attributeDefinitions;
    final billingModeSummary = this.billingModeSummary;
    final creationDateTime = this.creationDateTime;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final globalTableVersion = this.globalTableVersion;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final latestStreamArn = this.latestStreamArn;
    final latestStreamLabel = this.latestStreamLabel;
    final localSecondaryIndexes = this.localSecondaryIndexes;
    final onDemandThroughput = this.onDemandThroughput;
    final provisionedThroughput = this.provisionedThroughput;
    final replicas = this.replicas;
    final restoreSummary = this.restoreSummary;
    final sSEDescription = this.sSEDescription;
    final streamSpecification = this.streamSpecification;
    final tableArn = this.tableArn;
    final tableClassSummary = this.tableClassSummary;
    final tableId = this.tableId;
    final tableName = this.tableName;
    final tableSizeBytes = this.tableSizeBytes;
    final tableStatus = this.tableStatus;
    return {
      if (archivalSummary != null) 'ArchivalSummary': archivalSummary,
      if (attributeDefinitions != null)
        'AttributeDefinitions': attributeDefinitions,
      if (billingModeSummary != null) 'BillingModeSummary': billingModeSummary,
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (globalTableVersion != null) 'GlobalTableVersion': globalTableVersion,
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (latestStreamArn != null) 'LatestStreamArn': latestStreamArn,
      if (latestStreamLabel != null) 'LatestStreamLabel': latestStreamLabel,
      if (localSecondaryIndexes != null)
        'LocalSecondaryIndexes': localSecondaryIndexes,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (replicas != null) 'Replicas': replicas,
      if (restoreSummary != null) 'RestoreSummary': restoreSummary,
      if (sSEDescription != null) 'SSEDescription': sSEDescription,
      if (streamSpecification != null)
        'StreamSpecification': streamSpecification,
      if (tableArn != null) 'TableArn': tableArn,
      if (tableClassSummary != null) 'TableClassSummary': tableClassSummary,
      if (tableId != null) 'TableId': tableId,
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
  inaccessibleEncryptionCredentials,
  archiving,
  archived,
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
      case TableStatus.inaccessibleEncryptionCredentials:
        return 'INACCESSIBLE_ENCRYPTION_CREDENTIALS';
      case TableStatus.archiving:
        return 'ARCHIVING';
      case TableStatus.archived:
        return 'ARCHIVED';
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
      case 'INACCESSIBLE_ENCRYPTION_CREDENTIALS':
        return TableStatus.inaccessibleEncryptionCredentials;
      case 'ARCHIVING':
        return TableStatus.archiving;
      case 'ARCHIVED':
        return TableStatus.archived;
    }
    throw Exception('$this is not known in enum TableStatus');
  }
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// single DynamoDB table.
///
/// Amazon Web Services-assigned tag names and values are automatically assigned
/// the <code>aws:</code> prefix, which the user cannot assign. Amazon Web
/// Services-assigned tag names do not count towards the tag limit of 50.
/// User-assigned tag names have the prefix <code>user:</code> in the Cost
/// Allocation Report. You cannot backdate the application of a tag.
///
/// For an overview on tagging DynamoDB resources, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
/// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each DynamoDB table can
  /// only have up to one tag with the same key. If you try to add an existing tag
  /// (same key), the existing tag value will be updated to the new value.
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

/// The description of the Time to Live (TTL) status on the specified table.
class TimeToLiveDescription {
  /// The name of the TTL attribute for items in the table.
  final String? attributeName;

  /// The TTL status for the table.
  final TimeToLiveStatus? timeToLiveStatus;

  TimeToLiveDescription({
    this.attributeName,
    this.timeToLiveStatus,
  });

  factory TimeToLiveDescription.fromJson(Map<String, dynamic> json) {
    return TimeToLiveDescription(
      attributeName: json['AttributeName'] as String?,
      timeToLiveStatus:
          (json['TimeToLiveStatus'] as String?)?.toTimeToLiveStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final timeToLiveStatus = this.timeToLiveStatus;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (timeToLiveStatus != null)
        'TimeToLiveStatus': timeToLiveStatus.toValue(),
    };
  }
}

/// Represents the settings used to enable or disable Time to Live (TTL) for the
/// specified table.
class TimeToLiveSpecification {
  /// The name of the TTL attribute used to store the expiration time for items in
  /// the table.
  final String attributeName;

  /// Indicates whether TTL is to be enabled (true) or disabled (false) on the
  /// table.
  final bool enabled;

  TimeToLiveSpecification({
    required this.attributeName,
    required this.enabled,
  });

  factory TimeToLiveSpecification.fromJson(Map<String, dynamic> json) {
    return TimeToLiveSpecification(
      attributeName: json['AttributeName'] as String,
      enabled: json['Enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final enabled = this.enabled;
    return {
      'AttributeName': attributeName,
      'Enabled': enabled,
    };
  }
}

enum TimeToLiveStatus {
  enabling,
  disabling,
  enabled,
  disabled,
}

extension TimeToLiveStatusValueExtension on TimeToLiveStatus {
  String toValue() {
    switch (this) {
      case TimeToLiveStatus.enabling:
        return 'ENABLING';
      case TimeToLiveStatus.disabling:
        return 'DISABLING';
      case TimeToLiveStatus.enabled:
        return 'ENABLED';
      case TimeToLiveStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension TimeToLiveStatusFromString on String {
  TimeToLiveStatus toTimeToLiveStatus() {
    switch (this) {
      case 'ENABLING':
        return TimeToLiveStatus.enabling;
      case 'DISABLING':
        return TimeToLiveStatus.disabling;
      case 'ENABLED':
        return TimeToLiveStatus.enabled;
      case 'DISABLED':
        return TimeToLiveStatus.disabled;
    }
    throw Exception('$this is not known in enum TimeToLiveStatus');
  }
}

/// Specifies an item to be retrieved as part of the transaction.
class TransactGetItem {
  /// Contains the primary key that identifies the item to get, together with the
  /// name of the table that contains the item, and optionally the specific
  /// attributes of the item to retrieve.
  final Get get;

  TransactGetItem({
    required this.get,
  });

  Map<String, dynamic> toJson() {
    final get = this.get;
    return {
      'Get': get,
    };
  }
}

class TransactGetItemsOutput {
  /// If the <i>ReturnConsumedCapacity</i> value was <code>TOTAL</code>, this is
  /// an array of <code>ConsumedCapacity</code> objects, one for each table
  /// addressed by <code>TransactGetItem</code> objects in the
  /// <i>TransactItems</i> parameter. These <code>ConsumedCapacity</code> objects
  /// report the read-capacity units consumed by the <code>TransactGetItems</code>
  /// call in that table.
  final List<ConsumedCapacity>? consumedCapacity;

  /// An ordered array of up to 100 <code>ItemResponse</code> objects, each of
  /// which corresponds to the <code>TransactGetItem</code> object in the same
  /// position in the <i>TransactItems</i> array. Each <code>ItemResponse</code>
  /// object contains a Map of the name-value pairs that are the projected
  /// attributes of the requested item.
  ///
  /// If a requested item could not be retrieved, the corresponding
  /// <code>ItemResponse</code> object is Null, or if the requested item has no
  /// projected attributes, the corresponding <code>ItemResponse</code> object is
  /// an empty Map.
  final List<ItemResponse>? responses;

  TransactGetItemsOutput({
    this.consumedCapacity,
    this.responses,
  });

  factory TransactGetItemsOutput.fromJson(Map<String, dynamic> json) {
    return TransactGetItemsOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      responses: (json['Responses'] as List?)
          ?.whereNotNull()
          .map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final responses = this.responses;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (responses != null) 'Responses': responses,
    };
  }
}

/// A list of requests that can perform update, put, delete, or check operations
/// on multiple items in one or more tables atomically.
class TransactWriteItem {
  /// A request to perform a check item operation.
  final ConditionCheck? conditionCheck;

  /// A request to perform a <code>DeleteItem</code> operation.
  final Delete? delete;

  /// A request to perform a <code>PutItem</code> operation.
  final Put? put;

  /// A request to perform an <code>UpdateItem</code> operation.
  final Update? update;

  TransactWriteItem({
    this.conditionCheck,
    this.delete,
    this.put,
    this.update,
  });

  Map<String, dynamic> toJson() {
    final conditionCheck = this.conditionCheck;
    final delete = this.delete;
    final put = this.put;
    final update = this.update;
    return {
      if (conditionCheck != null) 'ConditionCheck': conditionCheck,
      if (delete != null) 'Delete': delete,
      if (put != null) 'Put': put,
      if (update != null) 'Update': update,
    };
  }
}

class TransactWriteItemsOutput {
  /// The capacity units consumed by the entire <code>TransactWriteItems</code>
  /// operation. The values of the list are ordered according to the ordering of
  /// the <code>TransactItems</code> request parameter.
  final List<ConsumedCapacity>? consumedCapacity;

  /// A list of tables that were processed by <code>TransactWriteItems</code> and,
  /// for each table, information about any item collections that were affected by
  /// individual <code>UpdateItem</code>, <code>PutItem</code>, or
  /// <code>DeleteItem</code> operations.
  final Map<String, List<ItemCollectionMetrics>>? itemCollectionMetrics;

  TransactWriteItemsOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory TransactWriteItemsOutput.fromJson(Map<String, dynamic> json) {
    return TransactWriteItemsOutput(
      consumedCapacity: (json['ConsumedCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => ConsumedCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCollectionMetrics: (json['ItemCollectionMetrics']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      ItemCollectionMetrics.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedCapacity = this.consumedCapacity;
    final itemCollectionMetrics = this.itemCollectionMetrics;
    return {
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (itemCollectionMetrics != null)
        'ItemCollectionMetrics': itemCollectionMetrics,
    };
  }
}

/// Represents a request to perform an <code>UpdateItem</code> operation.
class Update {
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// Name of the table for the <code>UpdateItem</code> request. You can also
  /// provide the Amazon Resource Name (ARN) of the table in this parameter.
  final String tableName;

  /// An expression that defines one or more attributes to be updated, the action
  /// to be performed on them, and new value(s) for them.
  final String updateExpression;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  final String? conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String>? expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue>? expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Update</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  Update({
    required this.key,
    required this.tableName,
    required this.updateExpression,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final tableName = this.tableName;
    final updateExpression = this.updateExpression;
    final conditionExpression = this.conditionExpression;
    final expressionAttributeNames = this.expressionAttributeNames;
    final expressionAttributeValues = this.expressionAttributeValues;
    final returnValuesOnConditionCheckFailure =
        this.returnValuesOnConditionCheckFailure;
    return {
      'Key': key,
      'TableName': tableName,
      'UpdateExpression': updateExpression,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
      if (returnValuesOnConditionCheckFailure != null)
        'ReturnValuesOnConditionCheckFailure':
            returnValuesOnConditionCheckFailure.toValue(),
    };
  }
}

class UpdateContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on the
  /// table.
  final ContinuousBackupsDescription? continuousBackupsDescription;

  UpdateContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });

  factory UpdateContinuousBackupsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateContinuousBackupsOutput(
      continuousBackupsDescription: json['ContinuousBackupsDescription'] != null
          ? ContinuousBackupsDescription.fromJson(
              json['ContinuousBackupsDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final continuousBackupsDescription = this.continuousBackupsDescription;
    return {
      if (continuousBackupsDescription != null)
        'ContinuousBackupsDescription': continuousBackupsDescription,
    };
  }
}

class UpdateContributorInsightsOutput {
  /// The status of contributor insights
  final ContributorInsightsStatus? contributorInsightsStatus;

  /// The name of the global secondary index, if applicable.
  final String? indexName;

  /// The name of the table.
  final String? tableName;

  UpdateContributorInsightsOutput({
    this.contributorInsightsStatus,
    this.indexName,
    this.tableName,
  });

  factory UpdateContributorInsightsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateContributorInsightsOutput(
      contributorInsightsStatus: (json['ContributorInsightsStatus'] as String?)
          ?.toContributorInsightsStatus(),
      indexName: json['IndexName'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributorInsightsStatus = this.contributorInsightsStatus;
    final indexName = this.indexName;
    final tableName = this.tableName;
    return {
      if (contributorInsightsStatus != null)
        'ContributorInsightsStatus': contributorInsightsStatus.toValue(),
      if (indexName != null) 'IndexName': indexName,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// Represents the new provisioned throughput settings to be applied to a global
/// secondary index.
class UpdateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be updated.
  final String indexName;

  /// Updates the maximum number of read and write units for the specified global
  /// secondary index. If you use this parameter, you must specify
  /// <code>MaxReadRequestUnits</code>, <code>MaxWriteRequestUnits</code>, or
  /// both.
  final OnDemandThroughput? onDemandThroughput;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Service,
  /// Account, and Table Quotas</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  final ProvisionedThroughput? provisionedThroughput;

  UpdateGlobalSecondaryIndexAction({
    required this.indexName,
    this.onDemandThroughput,
    this.provisionedThroughput,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final onDemandThroughput = this.onDemandThroughput;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      'IndexName': indexName,
      if (onDemandThroughput != null) 'OnDemandThroughput': onDemandThroughput,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

class UpdateGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription? globalTableDescription;

  UpdateGlobalTableOutput({
    this.globalTableDescription,
  });

  factory UpdateGlobalTableOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGlobalTableOutput(
      globalTableDescription: json['GlobalTableDescription'] != null
          ? GlobalTableDescription.fromJson(
              json['GlobalTableDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableDescription = this.globalTableDescription;
    return {
      if (globalTableDescription != null)
        'GlobalTableDescription': globalTableDescription,
    };
  }
}

class UpdateGlobalTableSettingsOutput {
  /// The name of the global table.
  final String? globalTableName;

  /// The Region-specific settings for the global table.
  final List<ReplicaSettingsDescription>? replicaSettings;

  UpdateGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });

  factory UpdateGlobalTableSettingsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGlobalTableSettingsOutput(
      globalTableName: json['GlobalTableName'] as String?,
      replicaSettings: (json['ReplicaSettings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicaSettingsDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final globalTableName = this.globalTableName;
    final replicaSettings = this.replicaSettings;
    return {
      if (globalTableName != null) 'GlobalTableName': globalTableName,
      if (replicaSettings != null) 'ReplicaSettings': replicaSettings,
    };
  }
}

/// Represents the output of an <code>UpdateItem</code> operation.
class UpdateItemOutput {
  /// A map of attribute values as they appear before or after the
  /// <code>UpdateItem</code> operation, as determined by the
  /// <code>ReturnValues</code> parameter.
  ///
  /// The <code>Attributes</code> map is only present if the update was successful
  /// and <code>ReturnValues</code> was specified as something other than
  /// <code>NONE</code> in the request. Each element represents one attribute.
  final Map<String, AttributeValue>? attributes;

  /// The capacity units consumed by the <code>UpdateItem</code> operation. The
  /// data returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption">Capacity
  /// unity consumption for write operations</a> in the <i>Amazon DynamoDB
  /// Developer Guide</i>.
  final ConsumedCapacity? consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>UpdateItem</code> operation. <code>ItemCollectionMetrics</code> is
  /// only returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  final ItemCollectionMetrics? itemCollectionMetrics;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory UpdateItemOutput.fromJson(Map<String, dynamic> json) {
    return UpdateItemOutput(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      consumedCapacity: json['ConsumedCapacity'] != null
          ? ConsumedCapacity.fromJson(
              json['ConsumedCapacity'] as Map<String, dynamic>)
          : null,
      itemCollectionMetrics: json['ItemCollectionMetrics'] != null
          ? ItemCollectionMetrics.fromJson(
              json['ItemCollectionMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final consumedCapacity = this.consumedCapacity;
    final itemCollectionMetrics = this.itemCollectionMetrics;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (itemCollectionMetrics != null)
        'ItemCollectionMetrics': itemCollectionMetrics,
    };
  }
}

/// Enables updating the configuration for Kinesis Streaming.
class UpdateKinesisStreamingConfiguration {
  /// Enables updating the precision of Kinesis data stream timestamp.
  final ApproximateCreationDateTimePrecision?
      approximateCreationDateTimePrecision;

  UpdateKinesisStreamingConfiguration({
    this.approximateCreationDateTimePrecision,
  });

  factory UpdateKinesisStreamingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return UpdateKinesisStreamingConfiguration(
      approximateCreationDateTimePrecision:
          (json['ApproximateCreationDateTimePrecision'] as String?)
              ?.toApproximateCreationDateTimePrecision(),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateCreationDateTimePrecision =
        this.approximateCreationDateTimePrecision;
    return {
      if (approximateCreationDateTimePrecision != null)
        'ApproximateCreationDateTimePrecision':
            approximateCreationDateTimePrecision.toValue(),
    };
  }
}

class UpdateKinesisStreamingDestinationOutput {
  /// The status of the attempt to update the Kinesis streaming destination
  /// output.
  final DestinationStatus? destinationStatus;

  /// The ARN for the Kinesis stream input.
  final String? streamArn;

  /// The table name for the Kinesis streaming destination output.
  final String? tableName;

  /// The command to update the Kinesis streaming destination configuration.
  final UpdateKinesisStreamingConfiguration?
      updateKinesisStreamingConfiguration;

  UpdateKinesisStreamingDestinationOutput({
    this.destinationStatus,
    this.streamArn,
    this.tableName,
    this.updateKinesisStreamingConfiguration,
  });

  factory UpdateKinesisStreamingDestinationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateKinesisStreamingDestinationOutput(
      destinationStatus:
          (json['DestinationStatus'] as String?)?.toDestinationStatus(),
      streamArn: json['StreamArn'] as String?,
      tableName: json['TableName'] as String?,
      updateKinesisStreamingConfiguration:
          json['UpdateKinesisStreamingConfiguration'] != null
              ? UpdateKinesisStreamingConfiguration.fromJson(
                  json['UpdateKinesisStreamingConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationStatus = this.destinationStatus;
    final streamArn = this.streamArn;
    final tableName = this.tableName;
    final updateKinesisStreamingConfiguration =
        this.updateKinesisStreamingConfiguration;
    return {
      if (destinationStatus != null)
        'DestinationStatus': destinationStatus.toValue(),
      if (streamArn != null) 'StreamArn': streamArn,
      if (tableName != null) 'TableName': tableName,
      if (updateKinesisStreamingConfiguration != null)
        'UpdateKinesisStreamingConfiguration':
            updateKinesisStreamingConfiguration,
    };
  }
}

/// Represents a replica to be modified.
class UpdateReplicationGroupMemberAction {
  /// The Region where the replica exists.
  final String regionName;

  /// Replica-specific global secondary index settings.
  final List<ReplicaGlobalSecondaryIndex>? globalSecondaryIndexes;

  /// The KMS key of the replica that should be used for KMS encryption. To
  /// specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or
  /// alias ARN. Note that you should only provide this parameter if the key is
  /// different from the default DynamoDB KMS key <code>alias/aws/dynamodb</code>.
  final String? kMSMasterKeyId;

  /// Overrides the maximum on-demand throughput for the replica table.
  final OnDemandThroughputOverride? onDemandThroughputOverride;

  /// Replica-specific provisioned throughput. If not specified, uses the source
  /// table's provisioned throughput settings.
  final ProvisionedThroughputOverride? provisionedThroughputOverride;

  /// Replica-specific table class. If not specified, uses the source table's
  /// table class.
  final TableClass? tableClassOverride;

  UpdateReplicationGroupMemberAction({
    required this.regionName,
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.onDemandThroughputOverride,
    this.provisionedThroughputOverride,
    this.tableClassOverride,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final kMSMasterKeyId = this.kMSMasterKeyId;
    final onDemandThroughputOverride = this.onDemandThroughputOverride;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    final tableClassOverride = this.tableClassOverride;
    return {
      'RegionName': regionName,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (kMSMasterKeyId != null) 'KMSMasterKeyId': kMSMasterKeyId,
      if (onDemandThroughputOverride != null)
        'OnDemandThroughputOverride': onDemandThroughputOverride,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
      if (tableClassOverride != null)
        'TableClassOverride': tableClassOverride.toValue(),
    };
  }
}

/// Represents the output of an <code>UpdateTable</code> operation.
class UpdateTableOutput {
  /// Represents the properties of the table.
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

class UpdateTableReplicaAutoScalingOutput {
  /// Returns information about the auto scaling settings of a table with
  /// replicas.
  final TableAutoScalingDescription? tableAutoScalingDescription;

  UpdateTableReplicaAutoScalingOutput({
    this.tableAutoScalingDescription,
  });

  factory UpdateTableReplicaAutoScalingOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateTableReplicaAutoScalingOutput(
      tableAutoScalingDescription: json['TableAutoScalingDescription'] != null
          ? TableAutoScalingDescription.fromJson(
              json['TableAutoScalingDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableAutoScalingDescription = this.tableAutoScalingDescription;
    return {
      if (tableAutoScalingDescription != null)
        'TableAutoScalingDescription': tableAutoScalingDescription,
    };
  }
}

class UpdateTimeToLiveOutput {
  /// Represents the output of an <code>UpdateTimeToLive</code> operation.
  final TimeToLiveSpecification? timeToLiveSpecification;

  UpdateTimeToLiveOutput({
    this.timeToLiveSpecification,
  });

  factory UpdateTimeToLiveOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTimeToLiveOutput(
      timeToLiveSpecification: json['TimeToLiveSpecification'] != null
          ? TimeToLiveSpecification.fromJson(
              json['TimeToLiveSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timeToLiveSpecification = this.timeToLiveSpecification;
    return {
      if (timeToLiveSpecification != null)
        'TimeToLiveSpecification': timeToLiveSpecification,
    };
  }
}

/// Represents an operation to perform - either <code>DeleteItem</code> or
/// <code>PutItem</code>. You can only request one of these operations, not
/// both, in a single <code>WriteRequest</code>. If you do need to perform both
/// of these operations, you need to provide two separate
/// <code>WriteRequest</code> objects.
class WriteRequest {
  /// A request to perform a <code>DeleteItem</code> operation.
  final DeleteRequest? deleteRequest;

  /// A request to perform a <code>PutItem</code> operation.
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

class BackupInUseException extends _s.GenericAwsException {
  BackupInUseException({String? type, String? message})
      : super(type: type, code: 'BackupInUseException', message: message);
}

class BackupNotFoundException extends _s.GenericAwsException {
  BackupNotFoundException({String? type, String? message})
      : super(type: type, code: 'BackupNotFoundException', message: message);
}

class ConditionalCheckFailedException extends _s.GenericAwsException {
  ConditionalCheckFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'ConditionalCheckFailedException',
            message: message);
}

class ContinuousBackupsUnavailableException extends _s.GenericAwsException {
  ContinuousBackupsUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'ContinuousBackupsUnavailableException',
            message: message);
}

class DuplicateItemException extends _s.GenericAwsException {
  DuplicateItemException({String? type, String? message})
      : super(type: type, code: 'DuplicateItemException', message: message);
}

class ExportConflictException extends _s.GenericAwsException {
  ExportConflictException({String? type, String? message})
      : super(type: type, code: 'ExportConflictException', message: message);
}

class ExportNotFoundException extends _s.GenericAwsException {
  ExportNotFoundException({String? type, String? message})
      : super(type: type, code: 'ExportNotFoundException', message: message);
}

class GlobalTableAlreadyExistsException extends _s.GenericAwsException {
  GlobalTableAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalTableAlreadyExistsException',
            message: message);
}

class GlobalTableNotFoundException extends _s.GenericAwsException {
  GlobalTableNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'GlobalTableNotFoundException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class ImportConflictException extends _s.GenericAwsException {
  ImportConflictException({String? type, String? message})
      : super(type: type, code: 'ImportConflictException', message: message);
}

class ImportNotFoundException extends _s.GenericAwsException {
  ImportNotFoundException({String? type, String? message})
      : super(type: type, code: 'ImportNotFoundException', message: message);
}

class IndexNotFoundException extends _s.GenericAwsException {
  IndexNotFoundException({String? type, String? message})
      : super(type: type, code: 'IndexNotFoundException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidExportTimeException extends _s.GenericAwsException {
  InvalidExportTimeException({String? type, String? message})
      : super(type: type, code: 'InvalidExportTimeException', message: message);
}

class InvalidRestoreTimeException extends _s.GenericAwsException {
  InvalidRestoreTimeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidRestoreTimeException', message: message);
}

class ItemCollectionSizeLimitExceededException extends _s.GenericAwsException {
  ItemCollectionSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ItemCollectionSizeLimitExceededException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PointInTimeRecoveryUnavailableException extends _s.GenericAwsException {
  PointInTimeRecoveryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'PointInTimeRecoveryUnavailableException',
            message: message);
}

class PolicyNotFoundException extends _s.GenericAwsException {
  PolicyNotFoundException({String? type, String? message})
      : super(type: type, code: 'PolicyNotFoundException', message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ReplicaAlreadyExistsException extends _s.GenericAwsException {
  ReplicaAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicaAlreadyExistsException',
            message: message);
}

class ReplicaNotFoundException extends _s.GenericAwsException {
  ReplicaNotFoundException({String? type, String? message})
      : super(type: type, code: 'ReplicaNotFoundException', message: message);
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

class TableAlreadyExistsException extends _s.GenericAwsException {
  TableAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'TableAlreadyExistsException', message: message);
}

class TableInUseException extends _s.GenericAwsException {
  TableInUseException({String? type, String? message})
      : super(type: type, code: 'TableInUseException', message: message);
}

class TableNotFoundException extends _s.GenericAwsException {
  TableNotFoundException({String? type, String? message})
      : super(type: type, code: 'TableNotFoundException', message: message);
}

class TransactionCanceledException extends _s.GenericAwsException {
  TransactionCanceledException({String? type, String? message})
      : super(
            type: type, code: 'TransactionCanceledException', message: message);
}

class TransactionConflictException extends _s.GenericAwsException {
  TransactionConflictException({String? type, String? message})
      : super(
            type: type, code: 'TransactionConflictException', message: message);
}

class TransactionInProgressException extends _s.GenericAwsException {
  TransactionInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'TransactionInProgressException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BackupInUseException': (type, message) =>
      BackupInUseException(type: type, message: message),
  'BackupNotFoundException': (type, message) =>
      BackupNotFoundException(type: type, message: message),
  'ConditionalCheckFailedException': (type, message) =>
      ConditionalCheckFailedException(type: type, message: message),
  'ContinuousBackupsUnavailableException': (type, message) =>
      ContinuousBackupsUnavailableException(type: type, message: message),
  'DuplicateItemException': (type, message) =>
      DuplicateItemException(type: type, message: message),
  'ExportConflictException': (type, message) =>
      ExportConflictException(type: type, message: message),
  'ExportNotFoundException': (type, message) =>
      ExportNotFoundException(type: type, message: message),
  'GlobalTableAlreadyExistsException': (type, message) =>
      GlobalTableAlreadyExistsException(type: type, message: message),
  'GlobalTableNotFoundException': (type, message) =>
      GlobalTableNotFoundException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'ImportConflictException': (type, message) =>
      ImportConflictException(type: type, message: message),
  'ImportNotFoundException': (type, message) =>
      ImportNotFoundException(type: type, message: message),
  'IndexNotFoundException': (type, message) =>
      IndexNotFoundException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidExportTimeException': (type, message) =>
      InvalidExportTimeException(type: type, message: message),
  'InvalidRestoreTimeException': (type, message) =>
      InvalidRestoreTimeException(type: type, message: message),
  'ItemCollectionSizeLimitExceededException': (type, message) =>
      ItemCollectionSizeLimitExceededException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PointInTimeRecoveryUnavailableException': (type, message) =>
      PointInTimeRecoveryUnavailableException(type: type, message: message),
  'PolicyNotFoundException': (type, message) =>
      PolicyNotFoundException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'ReplicaAlreadyExistsException': (type, message) =>
      ReplicaAlreadyExistsException(type: type, message: message),
  'ReplicaNotFoundException': (type, message) =>
      ReplicaNotFoundException(type: type, message: message),
  'RequestLimitExceeded': (type, message) =>
      RequestLimitExceeded(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TableAlreadyExistsException': (type, message) =>
      TableAlreadyExistsException(type: type, message: message),
  'TableInUseException': (type, message) =>
      TableInUseException(type: type, message: message),
  'TableNotFoundException': (type, message) =>
      TableNotFoundException(type: type, message: message),
  'TransactionCanceledException': (type, message) =>
      TransactionCanceledException(type: type, message: message),
  'TransactionConflictException': (type, message) =>
      TransactionConflictException(type: type, message: message),
  'TransactionInProgressException': (type, message) =>
      TransactionInProgressException(type: type, message: message),
};
