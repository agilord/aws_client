import 'dart:convert';
import 'dart:io';

import 'package:aws_client/src/credentials.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:crypto/crypto.dart';

part 'dynamodb-2012-08-10.g.dart';

/// Amazon DynamoDB Amazon DynamoDB is a fully managed NoSQL database service
/// that provides fast and predictable performance with seamless scalability.
/// DynamoDB lets you offload the administrative burdens of operating and scaling
/// a distributed database, so that you don't have to worry about hardware
/// provisioning, setup and configuration, replication, software patching,
/// or cluster scaling. With DynamoDB, you can create database tables that
/// can store and retrieve any amount of data, and serve any level of request
/// traffic. You can scale up or scale down your tables' throughput capacity
/// without downtime or performance degradation, and use the AWS Management
/// Console to monitor resource utilization and performance metrics. DynamoDB
/// automatically spreads the data and traffic for your tables over a sufficient
/// number of servers to handle your throughput and storage requirements, while
/// maintaining consistent and fast performance. All of your data is stored
/// on solid state disks (SSDs) and automatically replicated across multiple
/// Availability Zones in an AWS region, providing built-in high availability
/// and data durability.
class DynamoDB {
  static const String apiVersion = '2012-08-10';
  static const String endpointPrefix = 'dynamodb';
  static const String jsonVersion = '1.0';
  static const String protocol = 'json';
  static const String serviceAbbreviation = 'DynamoDB';
  static const String serviceFullName = 'Amazon DynamoDB';
  static const String serviceId = 'DynamoDB';
  static const String signatureVersion = 'v4';
  static const String targetPrefix = 'DynamoDB_20120810';
  static const String uid = 'dynamodb-2012-08-10';
  static const _aws4HmacSha256 = 'AWS4-HMAC-SHA256';
  final String region;
  Dio dio;
  Credentials credentials;
  final Map<String, String> environment = Platform.environment;

  DynamoDB({this.region = 'eu-west-1', this.credentials}) {
    dio = Dio();

    credentials ??= Credentials(
      accessKey: environment['AWS_ACCESS_KEY_ID'],
      secretKey: environment['AWS_SECRET_ACCESS_KEY'],
      sessionToken: environment['AWS_SESSION_TOKEN'],
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        options.headers.putIfAbsent(
          'X-Amz-Date',
          () => DateTime.now()
              .toUtc()
              .toIso8601String()
              .replaceAll('-', '')
              .replaceAll(':', '')
              .split('.')
              .first,
        );

        _sign(credentials, options);

        return options;
      },
    ));
    dio..options.baseUrl = 'https://$endpointPrefix.$region.amazonaws.com';
  }

  /// The BatchGetItem operation returns the attributes of one or more items
  /// from one or more tables. You identify requested items by primary key. A
  /// single operation can retrieve up to 16 MB of data, which can contain as
  /// many as 100 items. BatchGetItem returns a partial result if the response
  /// size limit is exceeded, the table's provisioned throughput is exceeded,
  /// or an internal processing failure occurs. If a partial result is returned,
  /// the operation returns a value for UnprocessedKeys. You can use this value
  /// to retry the operation starting with the next item to get.  If you request
  /// more than 100 items, BatchGetItem returns a ValidationException with the
  /// message "Too many items requested for the BatchGetItem call."  For example,
  /// if you ask to retrieve 100 items, but each individual item is 300 KB in
  /// size, the system returns 52 items (so as not to exceed the 16 MB limit).
  /// It also returns an appropriate UnprocessedKeys value so you can get the
  /// next page of results. If desired, your application can include its own
  /// logic to assemble the pages of results into one dataset. If none of the
  /// items can be processed due to insufficient provisioned throughput on all
  /// of the tables in the request, then BatchGetItem returns a ProvisionedThroughputExceededException.
  /// If at least one of the items is successfully processed, then BatchGetItem
  /// completes successfully, while returning the keys of the unread items in
  /// UnprocessedKeys.  If DynamoDB returns any unprocessed items, you should
  /// retry the batch operation on those items. However, we strongly recommend
  /// that you use an exponential backoff algorithm. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation using
  /// exponential backoff, the individual requests in the batch are much more
  /// likely to succeed. For more information, see Batch Operations and Error
  /// Handling in the Amazon DynamoDB Developer Guide.  By default, BatchGetItem
  /// performs eventually consistent reads on every table in the request. If
  /// you want strongly consistent reads instead, you can set ConsistentRead
  /// to true for any or all tables. In order to minimize response latency, BatchGetItem
  /// retrieves items in parallel. When designing your application, keep in mind
  /// that DynamoDB does not return items in any particular order. To help parse
  /// the response by item, include the primary key values for the items in your
  /// request in the ProjectionExpression parameter. If a requested item does
  /// not exist, it is not returned in the result. Requests for nonexistent items
  /// consume the minimum read capacity units according to the type of read.
  /// For more information, see Working with Tables in the Amazon DynamoDB Developer
  /// Guide.
  Future<BatchGetItemOutput> batchGetItem(BatchGetItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return BatchGetItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// The BatchWriteItem operation puts or deletes multiple items in one or more
  /// tables. A single call to BatchWriteItem can write up to 16 MB of data,
  /// which can comprise as many as 25 put or delete requests. Individual items
  /// to be written can be as large as 400 KB.   BatchWriteItem cannot update
  /// items. To update items, use the UpdateItem action.  The individual PutItem
  /// and DeleteItem operations specified in BatchWriteItem are atomic; however
  /// BatchWriteItem as a whole is not. If any requested operations fail because
  /// the table's provisioned throughput is exceeded or an internal processing
  /// failure occurs, the failed operations are returned in the UnprocessedItems
  /// response parameter. You can investigate and optionally resend the requests.
  /// Typically, you would call BatchWriteItem in a loop. Each iteration would
  /// check for unprocessed items and submit a new BatchWriteItem request with
  /// those unprocessed items until all items have been processed. If none of
  /// the items can be processed due to insufficient provisioned throughput on
  /// all of the tables in the request, then BatchWriteItem returns a ProvisionedThroughputExceededException.
  ///  If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, we strongly recommend that you use an
  /// exponential backoff algorithm. If you retry the batch operation immediately,
  /// the underlying read or write requests can still fail due to throttling
  /// on the individual tables. If you delay the batch operation using exponential
  /// backoff, the individual requests in the batch are much more likely to succeed.
  /// For more information, see Batch Operations and Error Handling in the Amazon
  /// DynamoDB Developer Guide.  With BatchWriteItem, you can efficiently write
  /// or delete large amounts of data, such as from Amazon EMR, or copy data
  /// from another database into DynamoDB. In order to improve performance with
  /// these large-scale operations, BatchWriteItem does not behave in the same
  /// way as individual PutItem and DeleteItem calls would. For example, you
  /// cannot specify conditions on individual put and delete requests, and BatchWriteItem
  /// does not return deleted items in the response. If you use a programming
  /// language that supports concurrency, you can use threads to write items
  /// in parallel. Your application must include the necessary logic to manage
  /// the threads. With languages that don't support threading, you must update
  /// or delete the specified items one at a time. In both situations, BatchWriteItem
  /// performs the specified put and delete operations in parallel, giving you
  /// the power of the thread pool approach without having to introduce complexity
  /// into your application. Parallel processing reduces latency, but each specified
  /// put and delete request consumes the same number of write capacity units
  /// whether it is processed in parallel or not. Delete operations on nonexistent
  /// items consume one write capacity unit. If one or more of the following
  /// is true, DynamoDB rejects the entire batch write operation:   One or more
  /// tables specified in the BatchWriteItem request does not exist.   Primary
  /// key attributes specified on an item in the request do not match those in
  /// the corresponding table's primary key schema.   You try to perform multiple
  /// operations on the same item in the same BatchWriteItem request. For example,
  /// you cannot put and delete the same item in the same BatchWriteItem request.
  ///     Your request contains at least two items with identical hash and range
  /// keys (which essentially is two put operations).    There are more than
  /// 25 requests in the batch.   Any individual item in a batch exceeds 400
  /// KB.   The total request size exceeds 16 MB.
  Future<BatchWriteItemOutput> batchWriteItem(BatchWriteItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return BatchWriteItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a backup for an existing table.  Each time you create an on-demand
  /// backup, the entire table data is backed up. There is no limit to the number
  /// of on-demand backups that can be taken.   When you create an on-demand
  /// backup, a time marker of the request is cataloged, and the backup is created
  /// asynchronously, by applying all changes until the time of the request to
  /// the last full table snapshot. Backup requests are processed instantaneously
  /// and become available for restore within minutes.  You can call CreateBackup
  /// at a maximum rate of 50 times per second. All backups in DynamoDB work
  /// without consuming any provisioned throughput on the table.  If you submit
  /// a backup request on 2018-12-14 at 14:25:00, the backup is guaranteed to
  /// contain all data committed to the table up to 14:24:00, and data committed
  /// after 14:26:00 will not be. The backup might contain data modifications
  /// made between 14:24:00 and 14:26:00. On-demand backup does not support causal
  /// consistency.   Along with data, the following are also included on the
  /// backups:    Global secondary indexes (GSIs)   Local secondary indexes (LSIs)
  ///   Streams   Provisioned read and write capacity
  Future<CreateBackupOutput> createBackup(CreateBackupInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return CreateBackupOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a global table from an existing table. A global table creates a
  /// replication relationship between two or more DynamoDB tables with the same
  /// table name in the provided Regions.  If you want to add a new replica table
  /// to a global table, each of the following conditions must be true:   The
  /// table must have the same primary key as all of the other replicas.   The
  /// table must have the same name as all of the other replicas.   The table
  /// must have DynamoDB Streams enabled, with the stream containing both the
  /// new and the old images of the item.   None of the replica tables in the
  /// global table can contain any data.    If global secondary indexes are specified,
  /// then the following conditions must also be met:     The global secondary
  /// indexes must have the same name.     The global secondary indexes must
  /// have the same hash key and sort key (if present).      Write capacity settings
  /// should be set consistently across your replica tables and secondary indexes.
  /// DynamoDB strongly recommends enabling auto scaling to manage the write
  /// capacity settings for all of your global tables replicas and indexes.
  ///  If you prefer to manage write capacity settings manually, you should provision
  /// equal replicated write capacity units to your replica tables. You should
  /// also provision equal replicated write capacity units to matching secondary
  /// indexes across your global table.
  Future<CreateGlobalTableOutput> createGlobalTable(
      CreateGlobalTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return CreateGlobalTableOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// The CreateTable operation adds a new table to your account. In an AWS account,
  /// table names must be unique within each Region. That is, you can have two
  /// tables with same name if you create the tables in different Regions.  CreateTable
  /// is an asynchronous operation. Upon receiving a CreateTable request, DynamoDB
  /// immediately returns a response with a TableStatus of CREATING. After the
  /// table is created, DynamoDB sets the TableStatus to ACTIVE. You can perform
  /// read and write operations only on an ACTIVE table.  You can optionally
  /// define secondary indexes on the new table, as part of the CreateTable operation.
  /// If you want to create multiple tables with secondary indexes on them, you
  /// must create the tables sequentially. Only one table with secondary indexes
  /// can be in the CREATING state at any given time. You can use the DescribeTable
  /// action to check the table status.
  Future<CreateTableOutput> createTable(CreateTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return CreateTableOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes an existing backup of a table. You can call DeleteBackup at a maximum
  /// rate of 10 times per second.
  Future<DeleteBackupOutput> deleteBackup(DeleteBackupInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DeleteBackupOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes a single item in a table by primary key. You can perform a conditional
  /// delete operation that deletes the item if it exists, or if it has an expected
  /// attribute value. In addition to deleting an item, you can also return the
  /// item's attribute values in the same operation, using the ReturnValues parameter.
  /// Unless you specify conditions, the DeleteItem is an idempotent operation;
  /// running it multiple times on the same item or attribute does not result
  /// in an error response. Conditional deletes are useful for deleting items
  /// only if specific conditions are met. If those conditions are met, DynamoDB
  /// performs the delete. Otherwise, the item is not deleted.
  Future<DeleteItemOutput> deleteItem(DeleteItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DeleteItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// The DeleteTable operation deletes a table and all of its items. After a
  /// DeleteTable request, the specified table is in the DELETING state until
  /// DynamoDB completes the deletion. If the table is in the ACTIVE state, you
  /// can delete it. If a table is in CREATING or UPDATING states, then DynamoDB
  /// returns a ResourceInUseException. If the specified table does not exist,
  /// DynamoDB returns a ResourceNotFoundException. If table is already in the
  /// DELETING state, no error is returned.   DynamoDB might continue to accept
  /// data read and write operations, such as GetItem and PutItem, on a table
  /// in the DELETING state until the table deletion is complete.  When you delete
  /// a table, any indexes on that table are also deleted. If you have DynamoDB
  /// Streams enabled on the table, then the corresponding stream on that table
  /// goes into the DISABLED state, and the stream is automatically deleted after
  /// 24 hours. Use the DescribeTable action to check the status of the table.
  Future<DeleteTableOutput> deleteTable(DeleteTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DeleteTableOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Describes an existing backup of a table. You can call DescribeBackup at
  /// a maximum rate of 10 times per second.
  Future<DescribeBackupOutput> describeBackup(DescribeBackupInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeBackupOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Checks the status of continuous backups and point in time recovery on the
  /// specified table. Continuous backups are ENABLED on all tables at table
  /// creation. If point in time recovery is enabled, PointInTimeRecoveryStatus
  /// will be set to ENABLED.  After continuous backups and point in time recovery
  /// are enabled, you can restore to any point in time within EarliestRestorableDateTime
  /// and LatestRestorableDateTime.   LatestRestorableDateTime is typically 5
  /// minutes before the current time. You can restore your table to any point
  /// in time during the last 35 days.  You can call DescribeContinuousBackups
  /// at a maximum rate of 10 times per second.
  Future<DescribeContinuousBackupsOutput> describeContinuousBackups(
      DescribeContinuousBackupsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeContinuousBackupsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns the regional endpoint information.
  Future<DescribeEndpointsResponse> describeEndpoints() async {
    final Response response = await dio.post('/', data: null);
    return DescribeEndpointsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns information about the specified global table.
  Future<DescribeGlobalTableOutput> describeGlobalTable(
      DescribeGlobalTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeGlobalTableOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Describes Region-specific settings for a global table.
  Future<DescribeGlobalTableSettingsOutput> describeGlobalTableSettings(
      DescribeGlobalTableSettingsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeGlobalTableSettingsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns the current provisioned-capacity limits for your AWS account in
  /// a Region, both for the Region as a whole and for any one DynamoDB table
  /// that you create there. When you establish an AWS account, the account has
  /// initial limits on the maximum read capacity units and write capacity units
  /// that you can provision across all of your DynamoDB tables in a given Region.
  /// Also, there are per-table limits that apply when you create a table there.
  /// For more information, see Limits page in the Amazon DynamoDB Developer
  /// Guide. Although you can increase these limits by filing a case at AWS Support
  /// Center, obtaining the increase is not instantaneous. The DescribeLimits
  /// action lets you write code to compare the capacity you are currently using
  /// to those limits imposed by your account so that you have enough time to
  /// apply for an increase before you hit a limit. For example, you could use
  /// one of the AWS SDKs to do the following:   Call DescribeLimits for a particular
  /// Region to obtain your current account limits on provisioned capacity there.
  ///   Create a variable to hold the aggregate read capacity units provisioned
  /// for all your tables in that Region, and one to hold the aggregate write
  /// capacity units. Zero them both.   Call ListTables to obtain a list of all
  /// your DynamoDB tables.   For each table name listed by ListTables, do the
  /// following:   Call DescribeTable with the table name.   Use the data returned
  /// by DescribeTable to add the read capacity units and write capacity units
  /// provisioned for the table itself to your variables.   If the table has
  /// one or more global secondary indexes (GSIs), loop over these GSIs and add
  /// their provisioned capacity values to your variables as well.     Report
  /// the account limits for that Region returned by DescribeLimits, along with
  /// the total current provisioned capacity levels you have calculated.   This
  /// will let you see whether you are getting close to your account-level limits.
  /// The per-table limits apply only when you are creating a new table. They
  /// restrict the sum of the provisioned capacity of the new table itself and
  /// all its global secondary indexes. For existing tables and their GSIs, DynamoDB
  /// doesn't let you increase provisioned capacity extremely rapidly. But the
  /// only upper limit that applies is that the aggregate provisioned capacity
  /// over all your tables and GSIs cannot exceed either of the per-account limits.
  ///   DescribeLimits should only be called periodically. You can expect throttling
  /// errors if you call it more than once in a minute.  The DescribeLimits Request
  /// element has no content.
  Future<DescribeLimitsOutput> describeLimits() async {
    final Response response = await dio.post('/', data: null);
    return DescribeLimitsOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns information about the table, including the current status of the
  /// table, when it was created, the primary key schema, and any indexes on
  /// the table.  If you issue a DescribeTable request immediately after a CreateTable
  /// request, DynamoDB might return a ResourceNotFoundException. This is because
  /// DescribeTable uses an eventually consistent query, and the metadata for
  /// your table might not be available at that moment. Wait for a few seconds,
  /// and then try the DescribeTable request again.
  Future<DescribeTableOutput> describeTable(DescribeTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeTableOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Gives a description of the Time to Live (TTL) status on the specified table.
  Future<DescribeTimeToLiveOutput> describeTimeToLive(
      DescribeTimeToLiveInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeTimeToLiveOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// The GetItem operation returns a set of attributes for the item with the
  /// given primary key. If there is no matching item, GetItem does not return
  /// any data and there will be no Item element in the response.  GetItem provides
  /// an eventually consistent read by default. If your application requires
  /// a strongly consistent read, set ConsistentRead to true. Although a strongly
  /// consistent read might take more time than an eventually consistent read,
  /// it always returns the last updated value.
  Future<GetItemOutput> getItem(GetItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return GetItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// List backups associated with an AWS account. To list backups for a given
  /// table, specify TableName. ListBackups returns a paginated list of results
  /// with at most 1 MB worth of items in a page. You can also specify a limit
  /// for the maximum number of entries to be returned in a page.  In the request,
  /// start time is inclusive, but end time is exclusive. Note that these limits
  /// are for the time at which the original backup was requested. You can call
  /// ListBackups a maximum of five times per second.
  Future<ListBackupsOutput> listBackups(ListBackupsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListBackupsOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Lists all global tables that have a replica in the specified Region.
  Future<ListGlobalTablesOutput> listGlobalTables(
      ListGlobalTablesInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListGlobalTablesOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns an array of table names associated with the current account and
  /// endpoint. The output from ListTables is paginated, with each page returning
  /// a maximum of 100 table names.
  Future<ListTablesOutput> listTables(ListTablesInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListTablesOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// List all tags on an Amazon DynamoDB resource. You can call ListTagsOfResource
  /// up to 10 times per second, per account. For an overview on tagging DynamoDB
  /// resources, see Tagging for DynamoDB in the Amazon DynamoDB Developer Guide.
  Future<ListTagsOfResourceOutput> listTagsOfResource(
      ListTagsOfResourceInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListTagsOfResourceOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates a new item, or replaces an old item with a new item. If an item
  /// that has the same primary key as the new item already exists in the specified
  /// table, the new item completely replaces the existing item. You can perform
  /// a conditional put operation (add a new item if one with the specified primary
  /// key doesn't exist), or replace an existing item if it has certain attribute
  /// values. You can return the item's attribute values in the same operation,
  /// using the ReturnValues parameter.  This topic provides general information
  /// about the PutItem API. For information on how to call the PutItem API using
  /// the AWS SDK in specific languages, see the following:     PutItem in the
  /// AWS Command Line Interface      PutItem in the AWS SDK for .NET      PutItem
  /// in the AWS SDK for C++      PutItem in the AWS SDK for Go      PutItem
  /// in the AWS SDK for Java      PutItem in the AWS SDK for JavaScript
  ///  PutItem in the AWS SDK for PHP V3      PutItem in the AWS SDK for Python
  ///      PutItem in the AWS SDK for Ruby V2     When you add an item, the primary
  /// key attributes are the only required attributes. Attribute values cannot
  /// be null. String and Binary type attributes must have lengths greater than
  /// zero. Set type attributes cannot be empty. Requests with empty values will
  /// be rejected with a ValidationException exception.  To prevent a new item
  /// from replacing an existing item, use a conditional expression that contains
  /// the attribute_not_exists function with the name of the attribute being
  /// used as the partition key for the table. Since every record must contain
  /// that attribute, the attribute_not_exists function will only succeed if
  /// no matching item exists.  For more information about PutItem, see Working
  /// with Items in the Amazon DynamoDB Developer Guide.
  Future<PutItemOutput> putItem(PutItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return PutItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// The Query operation finds items based on primary key values. You can query
  /// any table or secondary index that has a composite primary key (a partition
  /// key and a sort key).  Use the KeyConditionExpression parameter to provide
  /// a specific value for the partition key. The Query operation will return
  /// all of the items from the table or index with that partition key value.
  /// You can optionally narrow the scope of the Query operation by specifying
  /// a sort key value and a comparison operator in KeyConditionExpression. To
  /// further refine the Query results, you can optionally provide a FilterExpression.
  /// A FilterExpression determines which items within the results should be
  /// returned to you. All of the other results are discarded.   A Query operation
  /// always returns a result set. If no matching items are found, the result
  /// set will be empty. Queries that do not return results consume the minimum
  /// number of read capacity units for that type of read operation.    DynamoDB
  /// calculates the number of read capacity units consumed based on item size,
  /// not on the amount of data that is returned to an application. The number
  /// of capacity units consumed will be the same whether you request all of
  /// the attributes (the default behavior) or just some of them (using a projection
  /// expression). The number will also be the same whether or not you use a
  /// FilterExpression.    Query results are always sorted by the sort key value.
  /// If the data type of the sort key is Number, the results are returned in
  /// numeric order; otherwise, the results are returned in order of UTF-8 bytes.
  /// By default, the sort order is ascending. To reverse the order, set the
  /// ScanIndexForward parameter to false.   A single Query operation will read
  /// up to the maximum number of items set (if using the Limit parameter) or
  /// a maximum of 1 MB of data and then apply any filtering to the results using
  /// FilterExpression. If LastEvaluatedKey is present in the response, you will
  /// need to paginate the result set. For more information, see Paginating the
  /// Results in the Amazon DynamoDB Developer Guide.   FilterExpression is applied
  /// after a Query finishes, but before the results are returned. A FilterExpression
  /// cannot contain partition key or sort key attributes. You need to specify
  /// those attributes in the KeyConditionExpression.    A Query operation can
  /// return an empty result set and a LastEvaluatedKey if all the items read
  /// for the page of results are filtered out.   You can query a table, a local
  /// secondary index, or a global secondary index. For a query on a table or
  /// on a local secondary index, you can set the ConsistentRead parameter to
  /// true and obtain a strongly consistent result. Global secondary indexes
  /// support eventually consistent reads only, so do not specify ConsistentRead
  /// when querying a global secondary index.
  Future<QueryOutput> query(QueryInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return QueryOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a new table from an existing backup. Any number of users can execute
  /// up to 4 concurrent restores (any type of restore) in a given account.
  /// You can call RestoreTableFromBackup at a maximum rate of 10 times per second.
  /// You must manually set up the following on the restored table:   Auto scaling
  /// policies   IAM policies   Amazon CloudWatch metrics and alarms   Tags
  ///  Stream settings   Time to Live (TTL) settings
  Future<RestoreTableFromBackupOutput> restoreTableFromBackup(
      RestoreTableFromBackupInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return RestoreTableFromBackupOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Restores the specified table to the specified point in time within EarliestRestorableDateTime
  /// and LatestRestorableDateTime. You can restore your table to any point in
  /// time during the last 35 days. Any number of users can execute up to 4 concurrent
  /// restores (any type of restore) in a given account.   When you restore using
  /// point in time recovery, DynamoDB restores your table data to the state
  /// based on the selected date and time (day:hour:minute:second) to a new table.
  ///   Along with data, the following are also included on the new restored
  /// table using point in time recovery:    Global secondary indexes (GSIs)
  ///   Local secondary indexes (LSIs)   Provisioned read and write capacity
  ///   Encryption settings   All these settings come from the current settings
  /// of the source table at the time of restore.     You must manually set up
  /// the following on the restored table:   Auto scaling policies   IAM policies
  ///   Amazon CloudWatch metrics and alarms   Tags   Stream settings   Time
  /// to Live (TTL) settings   Point in time recovery settings
  Future<RestoreTableToPointInTimeOutput> restoreTableToPointInTime(
      RestoreTableToPointInTimeInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return RestoreTableToPointInTimeOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// The Scan operation returns one or more items and item attributes by accessing
  /// every item in a table or a secondary index. To have DynamoDB return fewer
  /// items, you can provide a FilterExpression operation. If the total number
  /// of scanned items exceeds the maximum dataset size limit of 1 MB, the scan
  /// stops and results are returned to the user as a LastEvaluatedKey value
  /// to continue the scan in a subsequent operation. The results also include
  /// the number of items exceeding the limit. A scan can result in no table
  /// data meeting the filter criteria.  A single Scan operation reads up to
  /// the maximum number of items set (if using the Limit parameter) or a maximum
  /// of 1 MB of data and then apply any filtering to the results using FilterExpression.
  /// If LastEvaluatedKey is present in the response, you need to paginate the
  /// result set. For more information, see Paginating the Results in the Amazon
  /// DynamoDB Developer Guide.   Scan operations proceed sequentially; however,
  /// for faster performance on a large table or secondary index, applications
  /// can request a parallel Scan operation by providing the Segment and TotalSegments
  /// parameters. For more information, see Parallel Scan in the Amazon DynamoDB
  /// Developer Guide.  Scan uses eventually consistent reads when accessing
  /// the data in a table; therefore, the result set might not include the changes
  /// to data in the table immediately before the operation began. If you need
  /// a consistent copy of the data, as of the time that the Scan begins, you
  /// can set the ConsistentRead parameter to true.
  Future<ScanOutput> scan(ScanInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ScanOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Associate a set of tags with an Amazon DynamoDB resource. You can then
  /// activate these user-defined tags so that they appear on the Billing and
  /// Cost Management console for cost allocation tracking. You can call TagResource
  /// up to five times per second, per account.  For an overview on tagging DynamoDB
  /// resources, see Tagging for DynamoDB in the Amazon DynamoDB Developer Guide.
  Future<void> tagResource(TagResourceInput param) async {
    await dio.post('/', data: param.toJson());
  }

  /// TransactGetItems is a synchronous operation that atomically retrieves multiple
  /// items from one or more tables (but not from indexes) in a single account
  /// and Region. A TransactGetItems call can contain up to 25 TransactGetItem
  /// objects, each of which contains a Get structure that specifies an item
  /// to retrieve from a table in the account and Region. A call to TransactGetItems
  /// cannot retrieve items from tables in more than one AWS account or Region.
  /// The aggregate size of the items in the transaction cannot exceed 4 MB.
  ///  All AWS Regions and AWS GovCloud (US) support up to 25 items per transaction
  /// with up to 4 MB of data, except the following AWS Regions:    China (Beijing)
  ///   China (Ningxia)   The China (Beijing) and China (Ningxia) Regions support
  /// up to 10 items per transaction with up to 4 MB of data.   DynamoDB rejects
  /// the entire TransactGetItems request if any of the following is true:
  /// A conflicting operation is in the process of updating an item to be read.
  ///   There is insufficient provisioned capacity for the transaction to be
  /// completed.   There is a user error, such as an invalid data format.   The
  /// aggregate size of the items in the transaction cannot exceed 4 MB.
  Future<TransactGetItemsOutput> transactGetItems(
      TransactGetItemsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return TransactGetItemsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// TransactWriteItems is a synchronous write operation that groups up to 25
  /// action requests. These actions can target items in different tables, but
  /// not in different AWS accounts or Regions, and no two actions can target
  /// the same item. For example, you cannot both ConditionCheck and Update the
  /// same item. The aggregate size of the items in the transaction cannot exceed
  /// 4 MB.  All AWS Regions and AWS GovCloud (US) support up to 25 items per
  /// transaction with up to 4 MB of data, except the following AWS Regions:
  ///    China (Beijing)   China (Ningxia)   The China (Beijing) and China (Ningxia)
  /// Regions support up to 10 items per transaction with up to 4 MB of data.
  ///   The actions are completed atomically so that either all of them succeed,
  /// or all of them fail. They are defined by the following objects:    Put
  ///  —   Initiates a PutItem operation to write a new item. This structure
  /// specifies the primary key of the item to be written, the name of the table
  /// to write it in, an optional condition expression that must be satisfied
  /// for the write to succeed, a list of the item's attributes, and a field
  /// indicating whether to retrieve the item's attributes if the condition is
  /// not met.    Update  —   Initiates an UpdateItem operation to update an
  /// existing item. This structure specifies the primary key of the item to
  /// be updated, the name of the table where it resides, an optional condition
  /// expression that must be satisfied for the update to succeed, an expression
  /// that defines one or more attributes to be updated, and a field indicating
  /// whether to retrieve the item's attributes if the condition is not met.
  ///    Delete  —   Initiates a DeleteItem operation to delete an existing item.
  /// This structure specifies the primary key of the item to be deleted, the
  /// name of the table where it resides, an optional condition expression that
  /// must be satisfied for the deletion to succeed, and a field indicating whether
  /// to retrieve the item's attributes if the condition is not met.    ConditionCheck
  ///  —   Applies a condition to an item that is not being modified by the transaction.
  /// This structure specifies the primary key of the item to be checked, the
  /// name of the table where it resides, a condition expression that must be
  /// satisfied for the transaction to succeed, and a field indicating whether
  /// to retrieve the item's attributes if the condition is not met.   DynamoDB
  /// rejects the entire TransactWriteItems request if any of the following is
  /// true:   A condition in one of the condition expressions is not met.   An
  /// ongoing operation is in the process of updating the same item.   There
  /// is insufficient provisioned capacity for the transaction to be completed.
  ///   An item size becomes too large (bigger than 400 KB), a local secondary
  /// index (LSI) becomes too large, or a similar validation error occurs because
  /// of changes made by the transaction.   The aggregate size of the items in
  /// the transaction exceeds 4 MB.   There is a user error, such as an invalid
  /// data format.
  Future<TransactWriteItemsOutput> transactWriteItems(
      TransactWriteItemsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return TransactWriteItemsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Removes the association of tags from an Amazon DynamoDB resource. You can
  /// call UntagResource up to five times per second, per account.  For an overview
  /// on tagging DynamoDB resources, see Tagging for DynamoDB in the Amazon DynamoDB
  /// Developer Guide.
  Future<void> untagResource(UntagResourceInput param) async {
    await dio.post('/', data: param.toJson());
  }

  /// UpdateContinuousBackups enables or disables point in time recovery for
  /// the specified table. A successful UpdateContinuousBackups call returns
  /// the current ContinuousBackupsDescription. Continuous backups are ENABLED
  /// on all tables at table creation. If point in time recovery is enabled,
  /// PointInTimeRecoveryStatus will be set to ENABLED.  Once continuous backups
  /// and point in time recovery are enabled, you can restore to any point in
  /// time within EarliestRestorableDateTime and LatestRestorableDateTime.
  /// LatestRestorableDateTime is typically 5 minutes before the current time.
  /// You can restore your table to any point in time during the last 35 days.
  Future<UpdateContinuousBackupsOutput> updateContinuousBackups(
      UpdateContinuousBackupsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateContinuousBackupsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Adds or removes replicas in the specified global table. The global table
  /// must already exist to be able to use this operation. Any replica to be
  /// added must be empty, have the same name as the global table, have the same
  /// key schema, have DynamoDB Streams enabled, and have the same provisioned
  /// and maximum write capacity units.  Although you can use UpdateGlobalTable
  /// to add replicas and remove replicas in a single request, for simplicity
  /// we recommend that you issue separate requests for adding or removing replicas.
  ///   If global secondary indexes are specified, then the following conditions
  /// must also be met:     The global secondary indexes must have the same name.
  ///     The global secondary indexes must have the same hash key and sort key
  /// (if present).     The global secondary indexes must have the same provisioned
  /// and maximum write capacity units.
  Future<UpdateGlobalTableOutput> updateGlobalTable(
      UpdateGlobalTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateGlobalTableOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Updates settings for a global table.
  Future<UpdateGlobalTableSettingsOutput> updateGlobalTableSettings(
      UpdateGlobalTableSettingsInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateGlobalTableSettingsOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Edits an existing item's attributes, or adds a new item to the table if
  /// it does not already exist. You can put, delete, or add attribute values.
  /// You can also perform a conditional update on an existing item (insert a
  /// new attribute name-value pair if it doesn't exist, or replace an existing
  /// name-value pair if it has certain expected attribute values). You can also
  /// return the item's attribute values in the same UpdateItem operation using
  /// the ReturnValues parameter.
  Future<UpdateItemOutput> updateItem(UpdateItemInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateItemOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// Modifies the provisioned throughput settings, global secondary indexes,
  /// or DynamoDB Streams settings for a given table. You can only perform one
  /// of the following operations at once:   Modify the provisioned throughput
  /// settings of the table.   Enable or disable DynamoDB Streams on the table.
  ///   Remove a global secondary index from the table.   Create a new global
  /// secondary index on the table. After the index begins backfilling, you can
  /// use UpdateTable to perform other operations.    UpdateTable is an asynchronous
  /// operation; while it is executing, the table status changes from ACTIVE
  /// to UPDATING. While it is UPDATING, you cannot issue another UpdateTable
  /// request. When the table returns to the ACTIVE state, the UpdateTable operation
  /// is complete.
  Future<UpdateTableOutput> updateTable(UpdateTableInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateTableOutput.fromJson(response.data as Map<String, dynamic>);
  }

  /// The UpdateTimeToLive method enables or disables Time to Live (TTL) for
  /// the specified table. A successful UpdateTimeToLive call returns the current
  /// TimeToLiveSpecification. It can take up to one hour for the change to fully
  /// process. Any additional UpdateTimeToLive calls for the same table during
  /// this one hour duration result in a ValidationException.  TTL compares the
  /// current time in epoch time format to the time stored in the TTL attribute
  /// of an item. If the epoch time value stored in the attribute is less than
  /// the current time, the item is marked as expired and subsequently deleted.
  ///   The epoch time format is the number of seconds elapsed since 12:00:00
  /// AM January 1, 1970 UTC.   DynamoDB deletes expired items on a best-effort
  /// basis to ensure availability of throughput for other data operations.
  ///  DynamoDB typically deletes expired items within two days of expiration.
  /// The exact duration within which an item gets deleted after expiration is
  /// specific to the nature of the workload. Items that have expired and not
  /// been deleted will still show up in reads, queries, and scans.  As items
  /// are deleted, they are removed from any local secondary index and global
  /// secondary index immediately in the same eventually consistent way as a
  /// standard delete operation. For more information, see Time To Live in the
  /// Amazon DynamoDB Developer Guide.
  Future<UpdateTimeToLiveOutput> updateTimeToLive(
      UpdateTimeToLiveInput param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateTimeToLiveOutput.fromJson(
        response.data as Map<String, dynamic>);
  }

  _sign(Credentials credentials, RequestOptions options) {
    final queryKeys = options.uri.queryParameters.keys.toList()..sort();
    final canonicalQuery = queryKeys
        .map((s) =>
            '${_queryComponent(s)}=${_queryComponent(options.uri.queryParameters[s])}')
        .join('&');
    final canonicalHeaders = options.headers.keys
        .map((key) => '${key.toLowerCase()}:${options.headers[key].trim()}')
        .toList()
          ..sort();
    final signedHeaders = (options.headers.keys.toList()..sort())
        .map((s) => s.toLowerCase())
        .join(';');

    final payloadHash = options.headers['X-Amz-Content-Sha256'] as String ??
        sha256.convert(utf8.encode(jsonEncode(options.data))).toString();

    final canonical = ([
      options.method.toUpperCase(),
      Uri.encodeFull(options.uri.path),
      canonicalQuery,
    ]
          ..addAll(canonicalHeaders)
          ..addAll([
            '',
            signedHeaders,
            payloadHash,
          ]))
        .join('\n');

    final date = options.headers['X-Amz-Date'] as String;
    final List<String> credentialList = [
      date.substring(0, 8),
      region,
      endpointPrefix,
      'aws4_request',
    ];
    final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();
    final toSign = [
      _aws4HmacSha256,
      date,
      credentialList.join('/'),
      canonicalHash,
    ].join('\n');
    final signingKey = credentialList.fold(
        utf8.encode('AWS4${credentials.secretKey}'), (List<int> key, String s) {
      final hmac = Hmac(sha256, key);
      return hmac.convert(utf8.encode(s)).bytes;
    });
    final signature =
        Hmac(sha256, signingKey).convert(utf8.encode(toSign)).toString();
    if (credentials.sessionToken != null) {
      options.headers['X-Amz-Security-Token'] = credentials.sessionToken;
    }

    final auth = '$_aws4HmacSha256 '
        'Credential=${credentials.accessKey}/${credentialList.join('/')}, '
        'SignedHeaders=$signedHeaders, '
        'Signature=$signature';
    options.headers['Authorization'] = auth;
  }

  String _queryComponent(String path) =>
      Uri.encodeQueryComponent(path).replaceAll('+', '%20');
}

/// Represents an attribute for describing the key schema for the table and
/// indexes.
@JsonSerializable()
class AttributeDefinition {
  /// A name for the attribute.
  @JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The data type for the attribute, where:    S - the attribute is of type
  /// String    N - the attribute is of type Number    B - the attribute is of
  /// type Binary
  @JsonKey(name: 'AttributeType')
  final String attributeType;

  AttributeDefinition({
    @required this.attributeName,
    @required this.attributeType,
  });

  factory AttributeDefinition.fromJson(Map<String, dynamic> json) =>
      _$AttributeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeDefinitionToJson(this);
}

/// Represents the data for an attribute. Each attribute value is described
/// as a name-value pair. The name is the data type, and the value is the data
/// itself. For more information, see Data Types in the Amazon DynamoDB Developer
/// Guide.
@JsonSerializable()
class AttributeValue {
  /// An attribute of type String. For example:  "S": "Hello"
  @JsonKey(name: 'S')
  final String s;

  /// An attribute of type Number. For example:  "N": "123.45"  Numbers are sent
  /// across the network to DynamoDB as strings, to maximize compatibility across
  /// languages and libraries. However, DynamoDB treats them as number type attributes
  /// for mathematical operations.
  @JsonKey(name: 'N')
  final String n;

  /// An attribute of type Binary. For example:  "B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"
  @JsonKey(name: 'B')
  @Base64Converter()
  final String b;

  /// An attribute of type String Set. For example:  "SS": ["Giraffe", "Hippo"
  /// ,"Zebra"]
  @JsonKey(name: 'SS')
  final List<String> sS;

  /// An attribute of type Number Set. For example:  "NS": ["42.2", "-19", "7.5",
  /// "3.14"]  Numbers are sent across the network to DynamoDB as strings, to
  /// maximize compatibility across languages and libraries. However, DynamoDB
  /// treats them as number type attributes for mathematical operations.
  @JsonKey(name: 'NS')
  final List<String> nS;

  /// An attribute of type Binary Set. For example:  "BS": ["U3Vubnk=", "UmFpbnk=",
  /// "U25vd3k="]
  @JsonKey(name: 'BS')
  @Base64ListConverter()
  final List<String> bS;

  /// An attribute of type Map. For example:  "M": {"Name": {"S": "Joe"}, "Age":
  /// {"N": "35"}}
  @JsonKey(name: 'M')
  final Map<String, AttributeValue> m;

  /// An attribute of type List. For example:  "L": [ {"S": "Cookies"} , {"S":
  /// "Coffee"}, {"N", "3.14159"}]
  @JsonKey(name: 'L')
  final List<AttributeValue> l;

  /// An attribute of type Null. For example:  "NULL": true
  @JsonKey(name: 'NULL')
  final bool nULL;

  /// An attribute of type Boolean. For example:  "BOOL": true
  @JsonKey(name: 'BOOL')
  final bool bOOL;

  AttributeValue({
    this.s,
    this.n,
    this.b,
    this.sS,
    this.nS,
    this.bS,
    this.m,
    this.l,
    this.nULL,
    this.bOOL,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
}

/// For the UpdateItem operation, represents the attributes to be modified,
/// the action to perform on each, and the new value for each.  You cannot
/// use UpdateItem to update any primary key attributes. Instead, you will
/// need to delete the item, and then use PutItem to create a new item with
/// new attributes.  Attribute values cannot be null; string and binary type
/// attributes must have lengths greater than zero; and set type attributes
/// must not be empty. Requests with empty values will be rejected with a ValidationException
/// exception.
@JsonSerializable()
class AttributeValueUpdate {
  /// Represents the data for an attribute. Each attribute value is described
  /// as a name-value pair. The name is the data type, and the value is the data
  /// itself. For more information, see Data Types in the Amazon DynamoDB Developer
  /// Guide.
  @JsonKey(name: 'Value')
  final AttributeValue value;

  /// Specifies how to perform the update. Valid values are PUT (default), DELETE,
  /// and ADD. The behavior depends on whether the specified primary key already
  /// exists in the table.  If an item with the specified Key is found in the
  /// table:     PUT - Adds the specified attribute to the item. If the attribute
  /// already exists, it is replaced by the new value.     DELETE - If no value
  /// is specified, the attribute and its value are removed from the item. The
  /// data type of the specified value must match the existing value's data type.
  /// If a set of values is specified, then those values are subtracted from
  /// the old set. For example, if the attribute value was the set [a,b,c] and
  /// the DELETE action specified [a,c], then the final attribute value would
  /// be [b]. Specifying an empty set is an error.    ADD - If the attribute
  /// does not already exist, then the attribute and its values are added to
  /// the item. If the attribute does exist, then the behavior of ADD depends
  /// on the data type of the attribute:   If the existing attribute is a number,
  /// and if Value is also a number, then the Value is mathematically added to
  /// the existing attribute. If Value is a negative number, then it is subtracted
  /// from the existing attribute.   If you use ADD to increment or decrement
  /// a number value for an item that doesn't exist before the update, DynamoDB
  /// uses 0 as the initial value. In addition, if you use ADD to update an existing
  /// item, and intend to increment or decrement an attribute value which does
  /// not yet exist, DynamoDB uses 0 as the initial value. For example, suppose
  /// that the item you want to update does not yet have an attribute named itemcount,
  /// but you decide to ADD the number 3 to this attribute anyway, even though
  /// it currently does not exist. DynamoDB will create the itemcount attribute,
  /// set its initial value to 0, and finally add 3 to it. The result will be
  /// a new itemcount attribute in the item, with a value of 3.    If the existing
  /// data type is a set, and if the Value is also a set, then the Value is added
  /// to the existing set. (This is a set operation, not mathematical addition.)
  /// For example, if the attribute value was the set [1,2], and the ADD action
  /// specified [3], then the final attribute value would be [1,2,3]. An error
  /// occurs if an Add action is specified for a set attribute and the attribute
  /// type specified does not match the existing set type.  Both sets must have
  /// the same primitive data type. For example, if the existing data type is
  /// a set of strings, the Value must also be a set of strings. The same holds
  /// true for number sets and binary sets.   This action is only valid for an
  /// existing attribute whose data type is number or is a set. Do not use ADD
  /// for any other data types.    If no item with the specified Key is found:
  ///     PUT - DynamoDB creates a new item with the specified primary key, and
  /// then adds the attribute.     DELETE - Nothing happens; there is no attribute
  /// to delete.    ADD - DynamoDB creates an item with the supplied primary
  /// key and number (or set of numbers) for the attribute value. The only data
  /// types allowed are number and number set; no other data types can be specified.
  ///
  @JsonKey(name: 'Action')
  final String action;

  AttributeValueUpdate({
    this.value,
    this.action,
  });

  factory AttributeValueUpdate.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueUpdateToJson(this);
}

/// Represents the properties of the scaling policy.
@JsonSerializable()
class AutoScalingPolicyDescription {
  /// The name of the scaling policy.
  @JsonKey(name: 'PolicyName')
  final String policyName;

  /// Represents a target tracking scaling policy configuration.
  @JsonKey(name: 'TargetTrackingScalingPolicyConfiguration')
  final AutoScalingTargetTrackingScalingPolicyConfigurationDescription
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicyDescription({
    this.policyName,
    this.targetTrackingScalingPolicyConfiguration,
  });

  factory AutoScalingPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingPolicyDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScalingPolicyDescriptionToJson(this);
}

/// Represents the autoscaling policy to be modified.
@JsonSerializable()
class AutoScalingPolicyUpdate {
  /// Represents a target tracking scaling policy configuration.
  @JsonKey(name: 'TargetTrackingScalingPolicyConfiguration')
  final AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
      targetTrackingScalingPolicyConfiguration;

  /// The name of the scaling policy.
  @JsonKey(name: 'PolicyName')
  final String policyName;

  AutoScalingPolicyUpdate({
    @required this.targetTrackingScalingPolicyConfiguration,
    this.policyName,
  });

  factory AutoScalingPolicyUpdate.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingPolicyUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScalingPolicyUpdateToJson(this);
}

/// Represents the autoscaling settings for a global table or global secondary
/// index.
@JsonSerializable()
class AutoScalingSettingsDescription {
  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  @JsonKey(name: 'MinimumUnits')
  final int minimumUnits;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  @JsonKey(name: 'MaximumUnits')
  final int maximumUnits;

  /// Disabled autoscaling for this global table or global secondary index.
  @JsonKey(name: 'AutoScalingDisabled')
  final bool autoScalingDisabled;

  /// Role ARN used for configuring autoScaling policy.
  @JsonKey(name: 'AutoScalingRoleArn')
  final String autoScalingRoleArn;

  /// Information about the scaling policies.
  @JsonKey(name: 'ScalingPolicies')
  final List<AutoScalingPolicyDescription> scalingPolicies;

  AutoScalingSettingsDescription({
    this.minimumUnits,
    this.maximumUnits,
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.scalingPolicies,
  });

  factory AutoScalingSettingsDescription.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingSettingsDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScalingSettingsDescriptionToJson(this);
}

/// Represents the autoscaling settings to be modified for a global table or
/// global secondary index.
@JsonSerializable()
class AutoScalingSettingsUpdate {
  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  @JsonKey(name: 'MinimumUnits')
  final int minimumUnits;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  @JsonKey(name: 'MaximumUnits')
  final int maximumUnits;

  /// Disabled autoscaling for this global table or global secondary index.
  @JsonKey(name: 'AutoScalingDisabled')
  final bool autoScalingDisabled;

  /// Role ARN used for configuring autoscaling policy.
  @JsonKey(name: 'AutoScalingRoleArn')
  final String autoScalingRoleArn;

  /// The scaling policy to apply for scaling target global table or global secondary
  /// index capacity units.
  @JsonKey(name: 'ScalingPolicyUpdate')
  final AutoScalingPolicyUpdate scalingPolicyUpdate;

  AutoScalingSettingsUpdate({
    this.minimumUnits,
    this.maximumUnits,
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.scalingPolicyUpdate,
  });

  factory AutoScalingSettingsUpdate.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingSettingsUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScalingSettingsUpdateToJson(this);
}

/// Represents the properties of a target tracking scaling policy.
@JsonSerializable()
class AutoScalingTargetTrackingScalingPolicyConfigurationDescription {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @JsonKey(name: 'TargetValue')
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If
  /// the value is true, scale in is disabled and the target tracking policy
  /// won't remove capacity from the scalable resource. Otherwise, scale in is
  /// enabled and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  @JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after
  /// a scale-in, application autoscaling scales out your scalable target immediately.
  @JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in effect,
  /// the capacity that has been added by the previous scale out event that initiated
  /// the cooldown is calculated as part of the desired capacity for the next
  /// scale out. You should continuously (but not excessively) scale out.
  @JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationDescription({
    @required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory AutoScalingTargetTrackingScalingPolicyConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationDescriptionFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationDescriptionToJson(
          this);
}

/// Represents the settings of a target tracking scaling policy that will be
/// modified.
@JsonSerializable()
class AutoScalingTargetTrackingScalingPolicyConfigurationUpdate {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @JsonKey(name: 'TargetValue')
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If
  /// the value is true, scale in is disabled and the target tracking policy
  /// won't remove capacity from the scalable resource. Otherwise, scale in is
  /// enabled and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  @JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after
  /// a scale-in, application autoscaling scales out your scalable target immediately.
  @JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in effect,
  /// the capacity that has been added by the previous scale out event that initiated
  /// the cooldown is calculated as part of the desired capacity for the next
  /// scale out. You should continuously (but not excessively) scale out.
  @JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationUpdate({
    @required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory AutoScalingTargetTrackingScalingPolicyConfigurationUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateToJson(this);
}

/// Contains the description of the backup created for the table.
@JsonSerializable()
class BackupDescription {
  /// Contains the details of the backup created for the table.
  @JsonKey(name: 'BackupDetails')
  final BackupDetails backupDetails;

  /// Contains the details of the table when the backup was created.
  @JsonKey(name: 'SourceTableDetails')
  final SourceTableDetails sourceTableDetails;

  /// Contains the details of the features enabled on the table when the backup
  /// was created. For example, LSIs, GSIs, streams, TTL.
  @JsonKey(name: 'SourceTableFeatureDetails')
  final SourceTableFeatureDetails sourceTableFeatureDetails;

  BackupDescription({
    this.backupDetails,
    this.sourceTableDetails,
    this.sourceTableFeatureDetails,
  });

  factory BackupDescription.fromJson(Map<String, dynamic> json) =>
      _$BackupDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$BackupDescriptionToJson(this);
}

/// Contains the details of the backup created for the table.
@JsonSerializable()
class BackupDetails {
  /// ARN associated with the backup.
  @JsonKey(name: 'BackupArn')
  final String backupArn;

  /// Name of the requested backup.
  @JsonKey(name: 'BackupName')
  final String backupName;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  @JsonKey(name: 'BackupStatus')
  final String backupStatus;

  /// BackupType:    USER - You create and manage these using the on-demand backup
  /// feature.    SYSTEM - If you delete a table with point-in-time recovery
  /// enabled, a SYSTEM backup is automatically created and is retained for 35
  /// days (at no additional cost). System backups allow you to restore the deleted
  /// table to the state it was in just before the point of deletion.     AWS_BACKUP
  /// - On-demand backup created by you from AWS Backup service.
  @JsonKey(name: 'BackupType')
  final String backupType;

  /// Time at which the backup was created. This is the request time of the backup.
  @JsonKey(name: 'BackupCreationDateTime')
  final String backupCreationDateTime;

  /// Size of the backup in bytes.
  @JsonKey(name: 'BackupSizeBytes')
  final int backupSizeBytes;

  /// Time at which the automatic on-demand backup created by DynamoDB will expire.
  /// This SYSTEM on-demand backup expires automatically 35 days after its creation.
  @JsonKey(name: 'BackupExpiryDateTime')
  final String backupExpiryDateTime;

  BackupDetails({
    @required this.backupArn,
    @required this.backupName,
    @required this.backupStatus,
    @required this.backupType,
    @required this.backupCreationDateTime,
    this.backupSizeBytes,
    this.backupExpiryDateTime,
  });

  factory BackupDetails.fromJson(Map<String, dynamic> json) =>
      _$BackupDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BackupDetailsToJson(this);
}

/// Contains details for the backup.
@JsonSerializable()
class BackupSummary {
  /// Name of the table.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Unique identifier for the table.
  @JsonKey(name: 'TableId')
  final String tableId;

  /// ARN associated with the table.
  @JsonKey(name: 'TableArn')
  final String tableArn;

  /// ARN associated with the backup.
  @JsonKey(name: 'BackupArn')
  final String backupArn;

  /// Name of the specified backup.
  @JsonKey(name: 'BackupName')
  final String backupName;

  /// Time at which the backup was created.
  @JsonKey(name: 'BackupCreationDateTime')
  final String backupCreationDateTime;

  /// Time at which the automatic on-demand backup created by DynamoDB will expire.
  /// This SYSTEM on-demand backup expires automatically 35 days after its creation.
  @JsonKey(name: 'BackupExpiryDateTime')
  final String backupExpiryDateTime;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  @JsonKey(name: 'BackupStatus')
  final String backupStatus;

  /// BackupType:    USER - You create and manage these using the on-demand backup
  /// feature.    SYSTEM - If you delete a table with point-in-time recovery
  /// enabled, a SYSTEM backup is automatically created and is retained for 35
  /// days (at no additional cost). System backups allow you to restore the deleted
  /// table to the state it was in just before the point of deletion.     AWS_BACKUP
  /// - On-demand backup created by you from AWS Backup service.
  @JsonKey(name: 'BackupType')
  final String backupType;

  /// Size of the backup in bytes.
  @JsonKey(name: 'BackupSizeBytes')
  final int backupSizeBytes;

  BackupSummary({
    this.tableName,
    this.tableId,
    this.tableArn,
    this.backupArn,
    this.backupName,
    this.backupCreationDateTime,
    this.backupExpiryDateTime,
    this.backupStatus,
    this.backupType,
    this.backupSizeBytes,
  });

  factory BackupSummary.fromJson(Map<String, dynamic> json) =>
      _$BackupSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$BackupSummaryToJson(this);
}

/// Represents the input of a BatchGetItem operation.
@JsonSerializable()
class BatchGetItemInput {
  /// A map of one or more table names and, for each table, a map that describes
  /// one or more items to retrieve from that table. Each table name can be used
  /// only once per BatchGetItem request. Each element in the map of items to
  /// retrieve consists of the following:    ConsistentRead - If true, a strongly
  /// consistent read is used; if false (the default), an eventually consistent
  /// read is used.    ExpressionAttributeNames - One or more substitution tokens
  /// for attribute names in the ProjectionExpression parameter. The following
  /// are some use cases for using ExpressionAttributeNames:   To access an attribute
  /// whose name conflicts with a DynamoDB reserved word.   To create a placeholder
  /// for repeating occurrences of an attribute name in an expression.   To prevent
  /// special characters in an attribute name from being misinterpreted in an
  /// expression.   Use the # character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:    Percentile
  ///    The name of this attribute conflicts with a reserved word, so it cannot
  /// be used directly in an expression. (For the complete list of reserved words,
  /// see Reserved Words in the Amazon DynamoDB Developer Guide). To work around
  /// this, you could specify the following for ExpressionAttributeNames:
  /// {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information about expression attribute names,
  /// see Accessing Item Attributes in the Amazon DynamoDB Developer Guide.
  ///   Keys - An array of primary key attribute values that define specific
  /// items in the table. For each primary key, you must provide all of the key
  /// attributes. For example, with a simple primary key, you only need to provide
  /// the partition key value. For a composite key, you must provide both the
  /// partition key value and the sort key value.    ProjectionExpression - A
  /// string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the expression must be separated by commas. If no attribute
  /// names are specified, then all attributes are returned. If any of the requested
  /// attributes are not found, they do not appear in the result. For more information,
  /// see Accessing Item Attributes in the Amazon DynamoDB Developer Guide.
  ///   AttributesToGet - This is a legacy parameter. Use ProjectionExpression
  /// instead. For more information, see AttributesToGet in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'RequestItems')
  final Map<String, KeysAndAttributes> requestItems;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  BatchGetItemInput({
    @required this.requestItems,
    this.returnConsumedCapacity,
  });

  factory BatchGetItemInput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchGetItemInputToJson(this);
}

/// Represents the output of a BatchGetItem operation.
@JsonSerializable()
class BatchGetItemOutput {
  /// A map of table name to a list of items. Each object in Responses consists
  /// of a table name, along with a map of attribute data consisting of the data
  /// type and attribute value.
  @JsonKey(name: 'Responses')
  final Map<String, List<Map<String, AttributeValue>>> responses;

  /// A map of tables and their respective keys that were not processed with
  /// the current response. The UnprocessedKeys value is in the same form as
  /// RequestItems, so the value can be provided directly to a subsequent BatchGetItem
  /// operation. For more information, see RequestItems in the Request Parameters
  /// section. Each element consists of:    Keys - An array of primary key attribute
  /// values that define specific items in the table.    ProjectionExpression
  /// - One or more attributes to be retrieved from the table or index. By default,
  /// all attributes are returned. If a requested attribute is not found, it
  /// does not appear in the result.    ConsistentRead - The consistency of a
  /// read operation. If set to true, then a strongly consistent read is used;
  /// otherwise, an eventually consistent read is used.   If there are no unprocessed
  /// keys remaining, the response contains an empty UnprocessedKeys map.
  @JsonKey(name: 'UnprocessedKeys')
  final Map<String, KeysAndAttributes> unprocessedKeys;

  /// The read capacity units consumed by the entire BatchGetItem operation.
  /// Each element consists of:    TableName - The table that consumed the provisioned
  /// throughput.    CapacityUnits - The total number of capacity units consumed.
  ///
  @JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  BatchGetItemOutput({
    this.responses,
    this.unprocessedKeys,
    this.consumedCapacity,
  });

  factory BatchGetItemOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchGetItemOutputToJson(this);
}

/// Represents the input of a BatchWriteItem operation.
@JsonSerializable()
class BatchWriteItemInput {
  /// A map of one or more table names and, for each table, a list of operations
  /// to be performed (DeleteRequest or PutRequest). Each element in the map
  /// consists of the following:    DeleteRequest - Perform a DeleteItem operation
  /// on the specified item. The item to be deleted is identified by a Key subelement:
  ///    Key - A map of primary key attribute values that uniquely identify the
  /// item. Each entry in this map consists of an attribute name and an attribute
  /// value. For each primary key, you must provide all of the key attributes.
  /// For example, with a simple primary key, you only need to provide a value
  /// for the partition key. For a composite primary key, you must provide values
  /// for both the partition key and the sort key.      PutRequest - Perform
  /// a PutItem operation on the specified item. The item to be put is identified
  /// by an Item subelement:    Item - A map of attributes and their values.
  /// Each entry in this map consists of an attribute name and an attribute value.
  /// Attribute values must not be null; string and binary type attributes must
  /// have lengths greater than zero; and set type attributes must not be empty.
  /// Requests that contain empty values are rejected with a ValidationException
  /// exception. If you specify any attributes that are part of an index key,
  /// then the data types for those attributes must match those of the schema
  /// in the table's attribute definition.
  @JsonKey(name: 'RequestItems')
  final Map<String, List<WriteRequest>> requestItems;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// Determines whether item collection metrics are returned. If set to SIZE,
  /// the response includes statistics about item collections, if any, that were
  /// modified during the operation are returned in the response. If set to NONE
  /// (the default), no statistics are returned.
  @JsonKey(name: 'ReturnItemCollectionMetrics')
  final String returnItemCollectionMetrics;

  BatchWriteItemInput({
    @required this.requestItems,
    this.returnConsumedCapacity,
    this.returnItemCollectionMetrics,
  });

  factory BatchWriteItemInput.fromJson(Map<String, dynamic> json) =>
      _$BatchWriteItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchWriteItemInputToJson(this);
}

/// Represents the output of a BatchWriteItem operation.
@JsonSerializable()
class BatchWriteItemOutput {
  /// A map of tables and requests against those tables that were not processed.
  /// The UnprocessedItems value is in the same form as RequestItems, so you
  /// can provide this value directly to a subsequent BatchGetItem operation.
  /// For more information, see RequestItems in the Request Parameters section.
  /// Each UnprocessedItems entry consists of a table name and, for that table,
  /// a list of operations to perform (DeleteRequest or PutRequest).    DeleteRequest
  /// - Perform a DeleteItem operation on the specified item. The item to be
  /// deleted is identified by a Key subelement:    Key - A map of primary key
  /// attribute values that uniquely identify the item. Each entry in this map
  /// consists of an attribute name and an attribute value.      PutRequest -
  /// Perform a PutItem operation on the specified item. The item to be put is
  /// identified by an Item subelement:    Item - A map of attributes and their
  /// values. Each entry in this map consists of an attribute name and an attribute
  /// value. Attribute values must not be null; string and binary type attributes
  /// must have lengths greater than zero; and set type attributes must not be
  /// empty. Requests that contain empty values will be rejected with a ValidationException
  /// exception. If you specify any attributes that are part of an index key,
  /// then the data types for those attributes must match those of the schema
  /// in the table's attribute definition.     If there are no unprocessed items
  /// remaining, the response contains an empty UnprocessedItems map.
  @JsonKey(name: 'UnprocessedItems')
  final Map<String, List<WriteRequest>> unprocessedItems;

  /// A list of tables that were processed by BatchWriteItem and, for each table,
  /// information about any item collections that were affected by individual
  /// DeleteItem or PutItem operations. Each entry consists of the following
  /// subelements:    ItemCollectionKey - The partition key value of the item
  /// collection. This is the same as the partition key value of the item.
  ///  SizeEstimateRangeGB - An estimate of item collection size, expressed in
  /// GB. This is a two-element array containing a lower bound and an upper bound
  /// for the estimate. The estimate includes the size of all the items in the
  /// table, plus the size of all attributes projected into all of the local
  /// secondary indexes on the table. Use this estimate to measure whether a
  /// local secondary index is approaching its size limit. The estimate is subject
  /// to change over time; therefore, do not rely on the precision or accuracy
  /// of the estimate.
  @JsonKey(name: 'ItemCollectionMetrics')
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  /// The capacity units consumed by the entire BatchWriteItem operation. Each
  /// element consists of:    TableName - The table that consumed the provisioned
  /// throughput.    CapacityUnits - The total number of capacity units consumed.
  ///
  @JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  BatchWriteItemOutput({
    this.unprocessedItems,
    this.itemCollectionMetrics,
    this.consumedCapacity,
  });

  factory BatchWriteItemOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchWriteItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchWriteItemOutputToJson(this);
}

/// Contains the details for the read/write capacity mode.
@JsonSerializable()
class BillingModeSummary {
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.    PROVISIONED - Sets
  /// the read/write capacity mode to PROVISIONED. We recommend using PROVISIONED
  /// for predictable workloads.    PAY_PER_REQUEST - Sets the read/write capacity
  /// mode to PAY_PER_REQUEST. We recommend using PAY_PER_REQUEST for unpredictable
  /// workloads.
  @JsonKey(name: 'BillingMode')
  final String billingMode;

  /// Represents the time when PAY_PER_REQUEST was last set as the read/write
  /// capacity mode.
  @JsonKey(name: 'LastUpdateToPayPerRequestDateTime')
  final String lastUpdateToPayPerRequestDateTime;

  BillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });

  factory BillingModeSummary.fromJson(Map<String, dynamic> json) =>
      _$BillingModeSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$BillingModeSummaryToJson(this);
}

/// Represents the amount of provisioned throughput capacity consumed on a
/// table or an index.
@JsonSerializable()
class Capacity {
  /// The total number of read capacity units consumed on a table or an index.
  @JsonKey(name: 'ReadCapacityUnits')
  final double readCapacityUnits;

  /// The total number of write capacity units consumed on a table or an index.
  @JsonKey(name: 'WriteCapacityUnits')
  final double writeCapacityUnits;

  /// The total number of capacity units consumed on a table or an index.
  @JsonKey(name: 'CapacityUnits')
  final double capacityUnits;

  Capacity({
    this.readCapacityUnits,
    this.writeCapacityUnits,
    this.capacityUnits,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) =>
      _$CapacityFromJson(json);

  Map<String, dynamic> toJson() => _$CapacityToJson(this);
}

/// Represents the selection criteria for a Query or Scan operation:   For
/// a Query operation, Condition is used for specifying the KeyConditions to
/// use when querying a table or an index. For KeyConditions, only the following
/// comparison operators are supported:  EQ | LE | LT | GE | GT | BEGINS_WITH
/// | BETWEEN   Condition is also used in a QueryFilter, which evaluates the
/// query results and returns only the desired values.   For a Scan operation,
/// Condition is used in a ScanFilter, which evaluates the scan results and
/// returns only the desired values.
@JsonSerializable()
class Condition {
  /// A comparator for evaluating attributes. For example, equals, greater than,
  /// less than, etc. The following comparison operators are available:  EQ |
  /// NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH
  /// | IN | BETWEEN  The following are descriptions of each comparison operator.
  ///    EQ : Equal. EQ is supported for all data types, including lists and
  /// maps.  AttributeValueList can contain only one AttributeValue element of
  /// type String, Number, Binary, String Set, Number Set, or Binary Set. If
  /// an item contains an AttributeValue element of a different type than the
  /// one provided in the request, the value does not match. For example, {"S":"6"}
  /// does not equal {"N":"6"}. Also, {"N":"6"} does not equal {"NS":["6", "2",
  /// "1"]}.     NE : Not equal. NE is supported for all data types, including
  /// lists and maps.  AttributeValueList can contain only one AttributeValue
  /// of type String, Number, Binary, String Set, Number Set, or Binary Set.
  /// If an item contains an AttributeValue of a different type than the one
  /// provided in the request, the value does not match. For example, {"S":"6"}
  /// does not equal {"N":"6"}. Also, {"N":"6"} does not equal {"NS":["6", "2",
  /// "1"]}.     LE : Less than or equal.   AttributeValueList can contain only
  /// one AttributeValue element of type String, Number, or Binary (not a set
  /// type). If an item contains an AttributeValue element of a different type
  /// than the one provided in the request, the value does not match. For example,
  /// {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"} does not compare to
  /// {"NS":["6", "2", "1"]}.     LT : Less than.   AttributeValueList can contain
  /// only one AttributeValue of type String, Number, or Binary (not a set type).
  /// If an item contains an AttributeValue element of a different type than
  /// the one provided in the request, the value does not match. For example,
  /// {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"} does not compare to
  /// {"NS":["6", "2", "1"]}.     GE : Greater than or equal.   AttributeValueList
  /// can contain only one AttributeValue element of type String, Number, or
  /// Binary (not a set type). If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not compare to {"NS":["6", "2", "1"]}.     GT : Greater than.   AttributeValueList
  /// can contain only one AttributeValue element of type String, Number, or
  /// Binary (not a set type). If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not compare to {"NS":["6", "2", "1"]}.     NOT_NULL : The attribute
  /// exists. NOT_NULL is supported for all data types, including lists and maps.
  ///  This operator tests for the existence of an attribute, not its data type.
  /// If the data type of attribute "a" is null, and you evaluate it using NOT_NULL,
  /// the result is a Boolean true. This result is because the attribute "a"
  /// exists; its data type is not relevant to the NOT_NULL comparison operator.
  ///     NULL : The attribute does not exist. NULL is supported for all data
  /// types, including lists and maps.  This operator tests for the nonexistence
  /// of an attribute, not its data type. If the data type of attribute "a" is
  /// null, and you evaluate it using NULL, the result is a Boolean false. This
  /// is because the attribute "a" exists; its data type is not relevant to the
  /// NULL comparison operator.     CONTAINS : Checks for a subsequence, or value
  /// in a set.  AttributeValueList can contain only one AttributeValue element
  /// of type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is of type String, then the operator checks for a substring
  /// match. If the target attribute of the comparison is of type Binary, then
  /// the operator looks for a subsequence of the target that matches the input.
  /// If the target attribute of the comparison is a set ("SS", "NS", or "BS"),
  /// then the operator evaluates to true if it finds an exact match with any
  /// member of the set. CONTAINS is supported for lists: When evaluating "a
  /// CONTAINS b", "a" can be a list; however, "b" cannot be a set, a map, or
  /// a list.    NOT_CONTAINS : Checks for absence of a subsequence, or absence
  /// of a value in a set.  AttributeValueList can contain only one AttributeValue
  /// element of type String, Number, or Binary (not a set type). If the target
  /// attribute of the comparison is a String, then the operator checks for the
  /// absence of a substring match. If the target attribute of the comparison
  /// is Binary, then the operator checks for the absence of a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("SS", "NS", or "BS"), then the operator evaluates to true if
  /// it does not find an exact match with any member of the set. NOT_CONTAINS
  /// is supported for lists: When evaluating "a NOT CONTAINS b", "a" can be
  /// a list; however, "b" cannot be a set, a map, or a list.    BEGINS_WITH
  /// : Checks for a prefix.   AttributeValueList can contain only one AttributeValue
  /// of type String or Binary (not a Number or a set type). The target attribute
  /// of the comparison must be of type String or Binary (not a Number or a set
  /// type).     IN : Checks for matching elements in a list.  AttributeValueList
  /// can contain one or more AttributeValue elements of type String, Number,
  /// or Binary. These attributes are compared against an existing attribute
  /// of an item. If any elements of the input are equal to the item attribute,
  /// the expression evaluates to true.    BETWEEN : Greater than or equal to
  /// the first value, and less than or equal to the second value.   AttributeValueList
  /// must contain two AttributeValue elements of the same type, either String,
  /// Number, or Binary (not a set type). A target attribute matches if the target
  /// value is greater than, or equal to, the first element and less than, or
  /// equal to, the second element. If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not compare to {"N":"6"}. Also,
  /// {"N":"6"} does not compare to {"NS":["6", "2", "1"]}    For usage examples
  /// of AttributeValueList and ComparisonOperator, see Legacy Conditional Parameters
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ComparisonOperator')
  final String comparisonOperator;

  /// One or more values to evaluate against the supplied attribute. The number
  /// of values in the list depends on the ComparisonOperator being used. For
  /// type Number, value comparisons are numeric. String value comparisons for
  /// greater than, equals, or less than are based on ASCII character code values.
  /// For example, a is greater than A, and a is greater than B. For a list of
  /// code values, see http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters.
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when
  /// it compares binary values.
  @JsonKey(name: 'AttributeValueList')
  final List<AttributeValue> attributeValueList;

  Condition({
    @required this.comparisonOperator,
    this.attributeValueList,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

/// Represents a request to perform a check that an item exists or to check
/// the condition of specific attributes of the item..
@JsonSerializable()
class ConditionCheck {
  /// The primary key of the item to be checked. Each element consists of an
  /// attribute name and a value for that attribute.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// Name of the table for the check item request.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use ReturnValuesOnConditionCheckFailure to get the item attributes if the
  /// ConditionCheck condition fails. For ReturnValuesOnConditionCheckFailure,
  /// the valid values are: NONE and ALL_OLD.
  @JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final String returnValuesOnConditionCheckFailure;

  ConditionCheck({
    @required this.key,
    @required this.tableName,
    @required this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  factory ConditionCheck.fromJson(Map<String, dynamic> json) =>
      _$ConditionCheckFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionCheckToJson(this);
}

/// The capacity units consumed by an operation. The data returned includes
/// the total provisioned throughput consumed, along with statistics for the
/// table and any indexes involved in the operation. ConsumedCapacity is only
/// returned if the request asked for it. For more information, see Provisioned
/// Throughput in the Amazon DynamoDB Developer Guide.
@JsonSerializable()
class ConsumedCapacity {
  /// The name of the table that was affected by the operation.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// The total number of capacity units consumed by the operation.
  @JsonKey(name: 'CapacityUnits')
  final double capacityUnits;

  /// The total number of read capacity units consumed by the operation.
  @JsonKey(name: 'ReadCapacityUnits')
  final double readCapacityUnits;

  /// The total number of write capacity units consumed by the operation.
  @JsonKey(name: 'WriteCapacityUnits')
  final double writeCapacityUnits;

  /// The amount of throughput consumed on the table affected by the operation.
  @JsonKey(name: 'Table')
  final Capacity table;

  /// The amount of throughput consumed on each local index affected by the operation.
  @JsonKey(name: 'LocalSecondaryIndexes')
  final Map<String, Capacity> localSecondaryIndexes;

  /// The amount of throughput consumed on each global index affected by the
  /// operation.
  @JsonKey(name: 'GlobalSecondaryIndexes')
  final Map<String, Capacity> globalSecondaryIndexes;

  ConsumedCapacity({
    this.tableName,
    this.capacityUnits,
    this.readCapacityUnits,
    this.writeCapacityUnits,
    this.table,
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
  });

  factory ConsumedCapacity.fromJson(Map<String, dynamic> json) =>
      _$ConsumedCapacityFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumedCapacityToJson(this);
}

/// Represents the continuous backups and point in time recovery settings on
/// the table.
@JsonSerializable()
class ContinuousBackupsDescription {
  /// ContinuousBackupsStatus can be one of the following states: ENABLED, DISABLED
  @JsonKey(name: 'ContinuousBackupsStatus')
  final String continuousBackupsStatus;

  /// The description of the point in time recovery settings applied to the table.
  @JsonKey(name: 'PointInTimeRecoveryDescription')
  final PointInTimeRecoveryDescription pointInTimeRecoveryDescription;

  ContinuousBackupsDescription({
    @required this.continuousBackupsStatus,
    this.pointInTimeRecoveryDescription,
  });

  factory ContinuousBackupsDescription.fromJson(Map<String, dynamic> json) =>
      _$ContinuousBackupsDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuousBackupsDescriptionToJson(this);
}

@JsonSerializable()
class CreateBackupInput {
  /// The name of the table.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Specified name for the backup.
  @JsonKey(name: 'BackupName')
  final String backupName;

  CreateBackupInput({
    @required this.tableName,
    @required this.backupName,
  });

  factory CreateBackupInput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupInputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBackupInputToJson(this);
}

@JsonSerializable()
class CreateBackupOutput {
  /// Contains the details of the backup created for the table.
  @JsonKey(name: 'BackupDetails')
  final BackupDetails backupDetails;

  CreateBackupOutput({
    this.backupDetails,
  });

  factory CreateBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupOutputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBackupOutputToJson(this);
}

/// Represents a new global secondary index to be added to an existing table.
@JsonSerializable()
class CreateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be created.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The key schema for the global secondary index.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into an
  /// index. These are in addition to the primary key attributes and index key
  /// attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index. For current minimum and maximum provisioned throughput
  /// values, see Limits in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  CreateGlobalSecondaryIndexAction({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
    this.provisionedThroughput,
  });

  factory CreateGlobalSecondaryIndexAction.fromJson(
          Map<String, dynamic> json) =>
      _$CreateGlobalSecondaryIndexActionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateGlobalSecondaryIndexActionToJson(this);
}

@JsonSerializable()
class CreateGlobalTableInput {
  /// The global table name.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Regions where the global table needs to be created.
  @JsonKey(name: 'ReplicationGroup')
  final List<Replica> replicationGroup;

  CreateGlobalTableInput({
    @required this.globalTableName,
    @required this.replicationGroup,
  });

  factory CreateGlobalTableInput.fromJson(Map<String, dynamic> json) =>
      _$CreateGlobalTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGlobalTableInputToJson(this);
}

@JsonSerializable()
class CreateGlobalTableOutput {
  /// Contains the details of the global table.
  @JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  CreateGlobalTableOutput({
    this.globalTableDescription,
  });

  factory CreateGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGlobalTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGlobalTableOutputToJson(this);
}

/// Represents a replica to be added.
@JsonSerializable()
class CreateReplicaAction {
  /// The region of the replica to be added.
  @JsonKey(name: 'RegionName')
  final String regionName;

  CreateReplicaAction({
    @required this.regionName,
  });

  factory CreateReplicaAction.fromJson(Map<String, dynamic> json) =>
      _$CreateReplicaActionFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReplicaActionToJson(this);
}

/// Represents the input of a CreateTable operation.
@JsonSerializable()
class CreateTableInput {
  /// An array of attributes that describe the key schema for the table and indexes.
  @JsonKey(name: 'AttributeDefinitions')
  final List<AttributeDefinition> attributeDefinitions;

  /// The name of the table to create.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Specifies the attributes that make up the primary key for a table or an
  /// index. The attributes in KeySchema must also be defined in the AttributeDefinitions
  /// array. For more information, see Data Model in the Amazon DynamoDB Developer
  /// Guide. Each KeySchemaElement in the array is composed of:    AttributeName
  /// - The name of this key attribute.    KeyType - The role that the key attribute
  /// will assume:    HASH - partition key    RANGE - sort key      The partition
  /// key of an item is also known as its hash attribute. The term "hash attribute"
  /// derives from the DynamoDB usage of an internal hash function to evenly
  /// distribute data items across partitions, based on their partition key values.
  /// The sort key of an item is also known as its range attribute. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.  For a simple primary key (partition key), you must provide exactly
  /// one element with a KeyType of HASH. For a composite primary key (partition
  /// key and sort key), you must provide exactly two elements, in this order:
  /// The first element must have a KeyType of HASH, and the second element must
  /// have a KeyType of RANGE. For more information, see Working with Tables
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// One or more local secondary indexes (the maximum is 5) to be created on
  /// the table. Each index is scoped to a given partition key value. There is
  /// a 10 GB size limit per partition key value; otherwise, the size of a local
  /// secondary index is unconstrained. Each local secondary index in the array
  /// includes the following:    IndexName - The name of the local secondary
  /// index. Must be unique only for this table.     KeySchema - Specifies the
  /// key schema for the local secondary index. The key schema must begin with
  /// the same partition key as the table.    Projection - Specifies attributes
  /// that are copied (projected) from the table into the index. These are in
  /// addition to the primary key attributes and index key attributes, which
  /// are automatically projected. Each attribute specification is composed of:
  ///    ProjectionType - One of the following:    KEYS_ONLY - Only the index
  /// and primary keys are projected into the index.    INCLUDE - Only the specified
  /// table attributes are projected into the index. The list of projected attributes
  /// is in NonKeyAttributes.    ALL - All of the table attributes are projected
  /// into the index.      NonKeyAttributes - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of attributes
  /// provided in NonKeyAttributes, summed across all of the secondary indexes,
  /// must not exceed 100. If you project the same attribute into two different
  /// indexes, this counts as two distinct attributes when determining the total.
  ///
  @JsonKey(name: 'LocalSecondaryIndexes')
  final List<LocalSecondaryIndex> localSecondaryIndexes;

  /// One or more global secondary indexes (the maximum is 20) to be created
  /// on the table. Each global secondary index in the array includes the following:
  ///    IndexName - The name of the global secondary index. Must be unique only
  /// for this table.     KeySchema - Specifies the key schema for the global
  /// secondary index.    Projection - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:    ProjectionType - One of
  /// the following:    KEYS_ONLY - Only the index and primary keys are projected
  /// into the index.    INCLUDE - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in NonKeyAttributes.
  ///    ALL - All of the table attributes are projected into the index.
  ///  NonKeyAttributes - A list of one or more non-key attribute names that
  /// are projected into the secondary index. The total count of attributes provided
  /// in NonKeyAttributes, summed across all of the secondary indexes, must not
  /// exceed 100. If you project the same attribute into two different indexes,
  /// this counts as two distinct attributes when determining the total.
  ///  ProvisionedThroughput - The provisioned throughput settings for the global
  /// secondary index, consisting of read and write capacity units.
  @JsonKey(name: 'GlobalSecondaryIndexes')
  final List<GlobalSecondaryIndex> globalSecondaryIndexes;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.    PROVISIONED - Sets
  /// the billing mode to PROVISIONED. We recommend using PROVISIONED for predictable
  /// workloads.    PAY_PER_REQUEST - Sets the billing mode to PAY_PER_REQUEST.
  /// We recommend using PAY_PER_REQUEST for unpredictable workloads.
  @JsonKey(name: 'BillingMode')
  final String billingMode;

  /// Represents the provisioned throughput settings for a specified table or
  /// index. The settings can be modified using the UpdateTable operation.  If
  /// you set BillingMode as PROVISIONED, you must specify this property. If
  /// you set BillingMode as PAY_PER_REQUEST, you cannot specify this property.
  ///  For current minimum and maximum provisioned throughput values, see Limits
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  /// The settings for DynamoDB Streams on the table. These settings consist
  /// of:    StreamEnabled - Indicates whether DynamoDB Streams is to be enabled
  /// (true) or disabled (false).    StreamViewType - When an item in the table
  /// is modified, StreamViewType determines what information is written to the
  /// table's stream. Valid values for StreamViewType are:    KEYS_ONLY - Only
  /// the key attributes of the modified item are written to the stream.    NEW_IMAGE
  /// - The entire item, as it appears after it was modified, is written to the
  /// stream.    OLD_IMAGE - The entire item, as it appeared before it was modified,
  /// is written to the stream.    NEW_AND_OLD_IMAGES - Both the new and the
  /// old item images of the item are written to the stream.
  @JsonKey(name: 'StreamSpecification')
  final StreamSpecification streamSpecification;

  /// Represents the settings used to enable server-side encryption.
  @JsonKey(name: 'SSESpecification')
  final SSESpecification sSESpecification;

  /// A list of key-value pairs to label the table. For more information, see
  /// Tagging for DynamoDB.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateTableInput({
    @required this.attributeDefinitions,
    @required this.tableName,
    @required this.keySchema,
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
    this.billingMode,
    this.provisionedThroughput,
    this.streamSpecification,
    this.sSESpecification,
    this.tags,
  });

  factory CreateTableInput.fromJson(Map<String, dynamic> json) =>
      _$CreateTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTableInputToJson(this);
}

/// Represents the output of a CreateTable operation.
@JsonSerializable()
class CreateTableOutput {
  /// Represents the properties of the table.
  @JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  CreateTableOutput({
    this.tableDescription,
  });

  factory CreateTableOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTableOutputToJson(this);
}

/// Represents a request to perform a DeleteItem operation.
@JsonSerializable()
class Delete {
  /// The primary key of the item to be deleted. Each element consists of an
  /// attribute name and a value for that attribute.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// Name of the table in which the item to be deleted resides.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional delete to
  /// succeed.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use ReturnValuesOnConditionCheckFailure to get the item attributes if the
  /// Delete condition fails. For ReturnValuesOnConditionCheckFailure, the valid
  /// values are: NONE and ALL_OLD.
  @JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final String returnValuesOnConditionCheckFailure;

  Delete({
    @required this.key,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  factory Delete.fromJson(Map<String, dynamic> json) => _$DeleteFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteToJson(this);
}

@JsonSerializable()
class DeleteBackupInput {
  /// The ARN associated with the backup.
  @JsonKey(name: 'BackupArn')
  final String backupArn;

  DeleteBackupInput({
    @required this.backupArn,
  });

  factory DeleteBackupInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupInputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteBackupInputToJson(this);
}

@JsonSerializable()
class DeleteBackupOutput {
  /// Contains the description of the backup created for the table.
  @JsonKey(name: 'BackupDescription')
  final BackupDescription backupDescription;

  DeleteBackupOutput({
    this.backupDescription,
  });

  factory DeleteBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteBackupOutputToJson(this);
}

/// Represents a global secondary index to be deleted from an existing table.
@JsonSerializable()
class DeleteGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be deleted.
  @JsonKey(name: 'IndexName')
  final String indexName;

  DeleteGlobalSecondaryIndexAction({
    @required this.indexName,
  });

  factory DeleteGlobalSecondaryIndexAction.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteGlobalSecondaryIndexActionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteGlobalSecondaryIndexActionToJson(this);
}

/// Represents the input of a DeleteItem operation.
@JsonSerializable()
class DeleteItemInput {
  /// The name of the table from which to delete the item.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A map of attribute names to AttributeValue objects, representing the primary
  /// key of the item to delete. For the primary key, you must provide all of
  /// the attributes. For example, with a simple primary key, you only need to
  /// provide a value for the partition key. For a composite primary key, you
  /// must provide values for both the partition key and the sort key.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see Expected in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'Expected')
  final Map<String, ExpectedAttributeValue> expected;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see ConditionalOperator in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionalOperator')
  final String conditionalOperator;

  /// Use ReturnValues if you want to get the item attributes as they appeared
  /// before they were deleted. For DeleteItem, the valid values are:    NONE
  /// - If ReturnValues is not specified, or if its value is NONE, then nothing
  /// is returned. (This setting is the default for ReturnValues.)    ALL_OLD
  /// - The content of the old item is returned.    The ReturnValues parameter
  /// is used by several DynamoDB operations; however, DeleteItem does not recognize
  /// any values other than NONE or ALL_OLD.
  @JsonKey(name: 'ReturnValues')
  final String returnValues;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// Determines whether item collection metrics are returned. If set to SIZE,
  /// the response includes statistics about item collections, if any, that were
  /// modified during the operation are returned in the response. If set to NONE
  /// (the default), no statistics are returned.
  @JsonKey(name: 'ReturnItemCollectionMetrics')
  final String returnItemCollectionMetrics;

  /// A condition that must be satisfied in order for a conditional DeleteItem
  /// to succeed. An expression can contain any of the following:   Functions:
  /// attribute_exists | attribute_not_exists | attribute_type | contains | begins_with
  /// | size  These function names are case-sensitive.   Comparison operators:
  /// = | <> | < | > | <= | >= | BETWEEN | IN      Logical operators: AND | OR
  /// | NOT    For more information about condition expressions, see Condition
  /// Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression. Use the :
  /// (colon) character in an expression to dereference an attribute value. For
  /// example, suppose that you wanted to check whether the value of the ProductStatus
  /// attribute was one of the following:   Available | Backordered | Discontinued
  ///  You would first need to specify ExpressionAttributeValues as follows:
  ///  { ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"}
  /// }  You could then use these values in an expression, such as this:  ProductStatus
  /// IN (:avail, :back, :disc)  For more information on expression attribute
  /// values, see Condition Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  DeleteItemInput({
    @required this.tableName,
    @required this.key,
    this.expected,
    this.conditionalOperator,
    this.returnValues,
    this.returnConsumedCapacity,
    this.returnItemCollectionMetrics,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
  });

  factory DeleteItemInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItemInputToJson(this);
}

/// Represents the output of a DeleteItem operation.
@JsonSerializable()
class DeleteItemOutput {
  /// A map of attribute names to AttributeValue objects, representing the item
  /// as it appeared before the DeleteItem operation. This map appears in the
  /// response only if ReturnValues was specified as ALL_OLD in the request.
  @JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the DeleteItem operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation. ConsumedCapacity
  /// is only returned if the ReturnConsumedCapacity parameter was specified.
  /// For more information, see Provisioned Mode in the Amazon DynamoDB Developer
  /// Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the DeleteItem
  /// operation. ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics
  /// parameter was specified. If the table does not have any local secondary
  /// indexes, this information is not returned in the response. Each ItemCollectionMetrics
  /// element consists of:    ItemCollectionKey - The partition key value of
  /// the item collection. This is the same as the partition key value of the
  /// item itself.    SizeEstimateRangeGB - An estimate of item collection size,
  /// in gigabytes. This value is a two-element array containing a lower bound
  /// and an upper bound for the estimate. The estimate includes the size of
  /// all the items in the table, plus the size of all attributes projected into
  /// all of the local secondary indexes on that table. Use this estimate to
  /// measure whether a local secondary index is approaching its size limit.
  /// The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  @JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory DeleteItemOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItemOutputToJson(this);
}

/// Represents a replica to be removed.
@JsonSerializable()
class DeleteReplicaAction {
  /// The region of the replica to be removed.
  @JsonKey(name: 'RegionName')
  final String regionName;

  DeleteReplicaAction({
    @required this.regionName,
  });

  factory DeleteReplicaAction.fromJson(Map<String, dynamic> json) =>
      _$DeleteReplicaActionFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteReplicaActionToJson(this);
}

/// Represents a request to perform a DeleteItem operation on an item.
@JsonSerializable()
class DeleteRequest {
  /// A map of attribute name to attribute values, representing the primary key
  /// of the item to delete. All of the table's primary key attributes must be
  /// specified, and their data types must match those of the table's key schema.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  DeleteRequest({
    @required this.key,
  });

  factory DeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRequestToJson(this);
}

/// Represents the input of a DeleteTable operation.
@JsonSerializable()
class DeleteTableInput {
  /// The name of the table to delete.
  @JsonKey(name: 'TableName')
  final String tableName;

  DeleteTableInput({
    @required this.tableName,
  });

  factory DeleteTableInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTableInputToJson(this);
}

/// Represents the output of a DeleteTable operation.
@JsonSerializable()
class DeleteTableOutput {
  /// Represents the properties of a table.
  @JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  DeleteTableOutput({
    this.tableDescription,
  });

  factory DeleteTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTableOutputToJson(this);
}

@JsonSerializable()
class DescribeBackupInput {
  /// The Amazon Resource Name (ARN) associated with the backup.
  @JsonKey(name: 'BackupArn')
  final String backupArn;

  DescribeBackupInput({
    @required this.backupArn,
  });

  factory DescribeBackupInput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupInputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeBackupInputToJson(this);
}

@JsonSerializable()
class DescribeBackupOutput {
  /// Contains the description of the backup created for the table.
  @JsonKey(name: 'BackupDescription')
  final BackupDescription backupDescription;

  DescribeBackupOutput({
    this.backupDescription,
  });

  factory DescribeBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeBackupOutputToJson(this);
}

@JsonSerializable()
class DescribeContinuousBackupsInput {
  /// Name of the table for which the customer wants to check the continuous
  /// backups and point in time recovery settings.
  @JsonKey(name: 'TableName')
  final String tableName;

  DescribeContinuousBackupsInput({
    @required this.tableName,
  });

  factory DescribeContinuousBackupsInput.fromJson(Map<String, dynamic> json) =>
      _$DescribeContinuousBackupsInputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeContinuousBackupsInputToJson(this);
}

@JsonSerializable()
class DescribeContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on
  /// the table.
  @JsonKey(name: 'ContinuousBackupsDescription')
  final ContinuousBackupsDescription continuousBackupsDescription;

  DescribeContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });

  factory DescribeContinuousBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeContinuousBackupsOutputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DescribeContinuousBackupsOutputToJson(this);
}

@JsonSerializable()
class DescribeEndpointsResponse {
  /// List of endpoints.
  @JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    @required this.endpoints,
  });

  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeEndpointsResponseToJson(this);
}

@JsonSerializable()
class DescribeGlobalTableInput {
  /// The name of the global table.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  DescribeGlobalTableInput({
    @required this.globalTableName,
  });

  factory DescribeGlobalTableInput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGlobalTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeGlobalTableInputToJson(this);
}

@JsonSerializable()
class DescribeGlobalTableOutput {
  /// Contains the details of the global table.
  @JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  DescribeGlobalTableOutput({
    this.globalTableDescription,
  });

  factory DescribeGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGlobalTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeGlobalTableOutputToJson(this);
}

@JsonSerializable()
class DescribeGlobalTableSettingsInput {
  /// The name of the global table to describe.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  DescribeGlobalTableSettingsInput({
    @required this.globalTableName,
  });

  factory DescribeGlobalTableSettingsInput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGlobalTableSettingsInputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DescribeGlobalTableSettingsInputToJson(this);
}

@JsonSerializable()
class DescribeGlobalTableSettingsOutput {
  /// The name of the global table.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Region-specific settings for the global table.
  @JsonKey(name: 'ReplicaSettings')
  final List<ReplicaSettingsDescription> replicaSettings;

  DescribeGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });

  factory DescribeGlobalTableSettingsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGlobalTableSettingsOutputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DescribeGlobalTableSettingsOutputToJson(this);
}

/// Represents the output of a DescribeLimits operation.
@JsonSerializable()
class DescribeLimitsOutput {
  /// The maximum total read capacity units that your account allows you to provision
  /// across all of your tables in this Region.
  @JsonKey(name: 'AccountMaxReadCapacityUnits')
  final int accountMaxReadCapacityUnits;

  /// The maximum total write capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  @JsonKey(name: 'AccountMaxWriteCapacityUnits')
  final int accountMaxWriteCapacityUnits;

  /// The maximum read capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the read
  /// capacity units provisioned for its global secondary indexes (GSIs).
  @JsonKey(name: 'TableMaxReadCapacityUnits')
  final int tableMaxReadCapacityUnits;

  /// The maximum write capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the write
  /// capacity units provisioned for its global secondary indexes (GSIs).
  @JsonKey(name: 'TableMaxWriteCapacityUnits')
  final int tableMaxWriteCapacityUnits;

  DescribeLimitsOutput({
    this.accountMaxReadCapacityUnits,
    this.accountMaxWriteCapacityUnits,
    this.tableMaxReadCapacityUnits,
    this.tableMaxWriteCapacityUnits,
  });

  factory DescribeLimitsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeLimitsOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeLimitsOutputToJson(this);
}

/// Represents the input of a DescribeTable operation.
@JsonSerializable()
class DescribeTableInput {
  /// The name of the table to describe.
  @JsonKey(name: 'TableName')
  final String tableName;

  DescribeTableInput({
    @required this.tableName,
  });

  factory DescribeTableInput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeTableInputToJson(this);
}

/// Represents the output of a DescribeTable operation.
@JsonSerializable()
class DescribeTableOutput {
  /// The properties of the table.
  @JsonKey(name: 'Table')
  final TableDescription table;

  DescribeTableOutput({
    this.table,
  });

  factory DescribeTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeTableOutputToJson(this);
}

@JsonSerializable()
class DescribeTimeToLiveInput {
  /// The name of the table to be described.
  @JsonKey(name: 'TableName')
  final String tableName;

  DescribeTimeToLiveInput({
    @required this.tableName,
  });

  factory DescribeTimeToLiveInput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTimeToLiveInputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeTimeToLiveInputToJson(this);
}

@JsonSerializable()
class DescribeTimeToLiveOutput {
  ///
  @JsonKey(name: 'TimeToLiveDescription')
  final TimeToLiveDescription timeToLiveDescription;

  DescribeTimeToLiveOutput({
    this.timeToLiveDescription,
  });

  factory DescribeTimeToLiveOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTimeToLiveOutputFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeTimeToLiveOutputToJson(this);
}

/// An endpoint information details.
@JsonSerializable()
class Endpoint {
  /// IP address of the endpoint.
  @JsonKey(name: 'Address')
  final String address;

  /// Endpoint cache time to live (TTL) value.
  @JsonKey(name: 'CachePeriodInMinutes')
  final int cachePeriodInMinutes;

  Endpoint({
    @required this.address,
    @required this.cachePeriodInMinutes,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointToJson(this);
}

/// Represents a condition to be compared with an attribute value. This condition
/// can be used with DeleteItem, PutItem or UpdateItem operations; if the comparison
/// evaluates to true, the operation succeeds; if not, the operation fails.
/// You can use ExpectedAttributeValue in one of two different ways:   Use
/// AttributeValueList to specify one or more values to compare against an
/// attribute. Use ComparisonOperator to specify how you want to perform the
/// comparison. If the comparison evaluates to true, then the conditional operation
/// succeeds.   Use Value to specify a value that DynamoDB will compare against
/// an attribute. If the values match, then ExpectedAttributeValue evaluates
/// to true and the conditional operation succeeds. Optionally, you can also
/// set Exists to false, indicating that you do not expect to find the attribute
/// value in the table. In this case, the conditional operation succeeds only
/// if the comparison evaluates to false.    Value and Exists are incompatible
/// with AttributeValueList and ComparisonOperator. Note that if you use both
/// sets of parameters at once, DynamoDB will return a ValidationException
/// exception.
@JsonSerializable()
class ExpectedAttributeValue {
  /// Represents the data for the expected attribute. Each attribute value is
  /// described as a name-value pair. The name is the data type, and the value
  /// is the data itself. For more information, see Data Types in the Amazon
  /// DynamoDB Developer Guide.
  @JsonKey(name: 'Value')
  final AttributeValue value;

  /// Causes DynamoDB to evaluate the value before attempting a conditional operation:
  ///   If Exists is true, DynamoDB will check to see if that attribute value
  /// already exists in the table. If it is found, then the operation succeeds.
  /// If it is not found, the operation fails with a ConditionCheckFailedException.
  ///   If Exists is false, DynamoDB assumes that the attribute value does not
  /// exist in the table. If in fact the value does not exist, then the assumption
  /// is valid and the operation succeeds. If the value is found, despite the
  /// assumption that it does not exist, the operation fails with a ConditionCheckFailedException.
  ///   The default setting for Exists is true. If you supply a Value all by
  /// itself, DynamoDB assumes the attribute exists: You don't have to set Exists
  /// to true, because it is implied. DynamoDB returns a ValidationException
  /// if:    Exists is true but there is no Value to check. (You expect a value
  /// to exist, but don't specify what that value is.)    Exists is false but
  /// you also provide a Value. (You cannot expect an attribute to have a value,
  /// while also expecting it not to exist.)
  @JsonKey(name: 'Exists')
  final bool exists;

  /// A comparator for evaluating attributes in the AttributeValueList. For example,
  /// equals, greater than, less than, etc. The following comparison operators
  /// are available:  EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS
  /// | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN  The following are descriptions
  /// of each comparison operator.    EQ : Equal. EQ is supported for all data
  /// types, including lists and maps.  AttributeValueList can contain only one
  /// AttributeValue element of type String, Number, Binary, String Set, Number
  /// Set, or Binary Set. If an item contains an AttributeValue element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not equal {"NS":["6", "2", "1"]}.     NE : Not equal. NE is supported
  /// for all data types, including lists and maps.  AttributeValueList can contain
  /// only one AttributeValue of type String, Number, Binary, String Set, Number
  /// Set, or Binary Set. If an item contains an AttributeValue of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"} does not equal
  /// {"NS":["6", "2", "1"]}.     LE : Less than or equal.   AttributeValueList
  /// can contain only one AttributeValue element of type String, Number, or
  /// Binary (not a set type). If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not compare to {"NS":["6", "2", "1"]}.     LT : Less than.   AttributeValueList
  /// can contain only one AttributeValue of type String, Number, or Binary (not
  /// a set type). If an item contains an AttributeValue element of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"} does not compare
  /// to {"NS":["6", "2", "1"]}.     GE : Greater than or equal.   AttributeValueList
  /// can contain only one AttributeValue element of type String, Number, or
  /// Binary (not a set type). If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not compare to {"NS":["6", "2", "1"]}.     GT : Greater than.   AttributeValueList
  /// can contain only one AttributeValue element of type String, Number, or
  /// Binary (not a set type). If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not equal {"N":"6"}. Also, {"N":"6"}
  /// does not compare to {"NS":["6", "2", "1"]}.     NOT_NULL : The attribute
  /// exists. NOT_NULL is supported for all data types, including lists and maps.
  ///  This operator tests for the existence of an attribute, not its data type.
  /// If the data type of attribute "a" is null, and you evaluate it using NOT_NULL,
  /// the result is a Boolean true. This result is because the attribute "a"
  /// exists; its data type is not relevant to the NOT_NULL comparison operator.
  ///     NULL : The attribute does not exist. NULL is supported for all data
  /// types, including lists and maps.  This operator tests for the nonexistence
  /// of an attribute, not its data type. If the data type of attribute "a" is
  /// null, and you evaluate it using NULL, the result is a Boolean false. This
  /// is because the attribute "a" exists; its data type is not relevant to the
  /// NULL comparison operator.     CONTAINS : Checks for a subsequence, or value
  /// in a set.  AttributeValueList can contain only one AttributeValue element
  /// of type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is of type String, then the operator checks for a substring
  /// match. If the target attribute of the comparison is of type Binary, then
  /// the operator looks for a subsequence of the target that matches the input.
  /// If the target attribute of the comparison is a set ("SS", "NS", or "BS"),
  /// then the operator evaluates to true if it finds an exact match with any
  /// member of the set. CONTAINS is supported for lists: When evaluating "a
  /// CONTAINS b", "a" can be a list; however, "b" cannot be a set, a map, or
  /// a list.    NOT_CONTAINS : Checks for absence of a subsequence, or absence
  /// of a value in a set.  AttributeValueList can contain only one AttributeValue
  /// element of type String, Number, or Binary (not a set type). If the target
  /// attribute of the comparison is a String, then the operator checks for the
  /// absence of a substring match. If the target attribute of the comparison
  /// is Binary, then the operator checks for the absence of a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("SS", "NS", or "BS"), then the operator evaluates to true if
  /// it does not find an exact match with any member of the set. NOT_CONTAINS
  /// is supported for lists: When evaluating "a NOT CONTAINS b", "a" can be
  /// a list; however, "b" cannot be a set, a map, or a list.    BEGINS_WITH
  /// : Checks for a prefix.   AttributeValueList can contain only one AttributeValue
  /// of type String or Binary (not a Number or a set type). The target attribute
  /// of the comparison must be of type String or Binary (not a Number or a set
  /// type).     IN : Checks for matching elements in a list.  AttributeValueList
  /// can contain one or more AttributeValue elements of type String, Number,
  /// or Binary. These attributes are compared against an existing attribute
  /// of an item. If any elements of the input are equal to the item attribute,
  /// the expression evaluates to true.    BETWEEN : Greater than or equal to
  /// the first value, and less than or equal to the second value.   AttributeValueList
  /// must contain two AttributeValue elements of the same type, either String,
  /// Number, or Binary (not a set type). A target attribute matches if the target
  /// value is greater than, or equal to, the first element and less than, or
  /// equal to, the second element. If an item contains an AttributeValue element
  /// of a different type than the one provided in the request, the value does
  /// not match. For example, {"S":"6"} does not compare to {"N":"6"}. Also,
  /// {"N":"6"} does not compare to {"NS":["6", "2", "1"]}
  @JsonKey(name: 'ComparisonOperator')
  final String comparisonOperator;

  /// One or more values to evaluate against the supplied attribute. The number
  /// of values in the list depends on the ComparisonOperator being used. For
  /// type Number, value comparisons are numeric. String value comparisons for
  /// greater than, equals, or less than are based on ASCII character code values.
  /// For example, a is greater than A, and a is greater than B. For a list of
  /// code values, see http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters.
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when
  /// it compares binary values. For information on specifying data types in
  /// JSON, see JSON Data Format in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'AttributeValueList')
  final List<AttributeValue> attributeValueList;

  ExpectedAttributeValue({
    this.value,
    this.exists,
    this.comparisonOperator,
    this.attributeValueList,
  });

  factory ExpectedAttributeValue.fromJson(Map<String, dynamic> json) =>
      _$ExpectedAttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$ExpectedAttributeValueToJson(this);
}

/// Specifies an item and related attribute values to retrieve in a TransactGetItem
/// object.
@JsonSerializable()
class Get {
  /// A map of attribute names to AttributeValue objects that specifies the primary
  /// key of the item to retrieve.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// The name of the table from which to retrieve the specified item.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A string that identifies one or more attributes of the specified item to
  /// retrieve from the table. The attributes in the expression must be separated
  /// by commas. If no attribute names are specified, then all attributes of
  /// the specified item are returned. If any of the requested attributes are
  /// not found, they do not appear in the result.
  @JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  /// One or more substitution tokens for attribute names in the ProjectionExpression
  /// parameter.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  Get({
    @required this.key,
    @required this.tableName,
    this.projectionExpression,
    this.expressionAttributeNames,
  });

  factory Get.fromJson(Map<String, dynamic> json) => _$GetFromJson(json);

  Map<String, dynamic> toJson() => _$GetToJson(this);
}

/// Represents the input of a GetItem operation.
@JsonSerializable()
class GetItemInput {
  /// The name of the table containing the requested item.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A map of attribute names to AttributeValue objects, representing the primary
  /// key of the item to retrieve. For the primary key, you must provide all
  /// of the attributes. For example, with a simple primary key, you only need
  /// to provide a value for the partition key. For a composite primary key,
  /// you must provide values for both the partition key and the sort key.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// This is a legacy parameter. Use ProjectionExpression instead. For more
  /// information, see AttributesToGet in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'AttributesToGet')
  final List<String> attributesToGet;

  /// Determines the read consistency model: If set to true, then the operation
  /// uses strongly consistent reads; otherwise, the operation uses eventually
  /// consistent reads.
  @JsonKey(name: 'ConsistentRead')
  final bool consistentRead;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// A string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the expression must be separated by commas. If no attribute
  /// names are specified, then all attributes are returned. If any of the requested
  /// attributes are not found, they do not appear in the result. For more information,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  GetItemInput({
    @required this.tableName,
    @required this.key,
    this.attributesToGet,
    this.consistentRead,
    this.returnConsumedCapacity,
    this.projectionExpression,
    this.expressionAttributeNames,
  });

  factory GetItemInput.fromJson(Map<String, dynamic> json) =>
      _$GetItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemInputToJson(this);
}

/// Represents the output of a GetItem operation.
@JsonSerializable()
class GetItemOutput {
  /// A map of attribute names to AttributeValue objects, as specified by ProjectionExpression.
  @JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  /// The capacity units consumed by the GetItem operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation. ConsumedCapacity
  /// is only returned if the ReturnConsumedCapacity parameter was specified.
  /// For more information, see Read/Write Capacity Mode in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  GetItemOutput({
    this.item,
    this.consumedCapacity,
  });

  factory GetItemOutput.fromJson(Map<String, dynamic> json) =>
      _$GetItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemOutputToJson(this);
}

/// Represents the properties of a global secondary index.
@JsonSerializable()
class GlobalSecondaryIndex {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:    HASH - partition
  /// key    RANGE - sort key    The partition key of an item is also known as
  /// its hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index. For current minimum and maximum provisioned throughput
  /// values, see Limits in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndex({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
    this.provisionedThroughput,
  });

  factory GlobalSecondaryIndex.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalSecondaryIndexToJson(this);
}

/// Represents the properties of a global secondary index.
@JsonSerializable()
class GlobalSecondaryIndexDescription {
  /// The name of the global secondary index.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:    HASH - partition
  /// key    RANGE - sort key    The partition key of an item is also known as
  /// its hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  /// The current state of the global secondary index:    CREATING - The index
  /// is being created.    UPDATING - The index is being updated.    DELETING
  /// - The index is being deleted.    ACTIVE - The index is ready for use.
  @JsonKey(name: 'IndexStatus')
  final String indexStatus;

  /// Indicates whether the index is currently backfilling. Backfilling is the
  /// process of reading items from the table and determining whether they can
  /// be added to the index. (Not all items will qualify: For example, a partition
  /// key cannot have any duplicate values.) If an item can be added to the index,
  /// DynamoDB will do so. After all items have been processed, the backfilling
  /// operation is complete and Backfilling is false.  For indexes that were
  /// created during a CreateTable operation, the Backfilling attribute does
  /// not appear in the DescribeTable output.
  @JsonKey(name: 'Backfilling')
  final bool backfilling;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index. For current minimum and maximum provisioned throughput
  /// values, see Limits in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughputDescription provisionedThroughput;

  /// The total size of the specified index, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  @JsonKey(name: 'IndexSizeBytes')
  final int indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  @JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  @JsonKey(name: 'IndexArn')
  final String indexArn;

  GlobalSecondaryIndexDescription({
    this.indexName,
    this.keySchema,
    this.projection,
    this.indexStatus,
    this.backfilling,
    this.provisionedThroughput,
    this.indexSizeBytes,
    this.itemCount,
    this.indexArn,
  });

  factory GlobalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexDescriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GlobalSecondaryIndexDescriptionToJson(this);
}

/// Represents the properties of a global secondary index for the table when
/// the backup was created.
@JsonSerializable()
class GlobalSecondaryIndexInfo {
  /// The name of the global secondary index.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:    HASH - partition
  /// key    RANGE - sort key    The partition key of an item is also known as
  /// its hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
    this.provisionedThroughput,
  });

  factory GlobalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalSecondaryIndexInfoToJson(this);
}

/// Represents one of the following:   A new global secondary index to be added
/// to an existing table.   New provisioned throughput parameters for an existing
/// global secondary index.   An existing global secondary index to be removed
/// from an existing table.
@JsonSerializable()
class GlobalSecondaryIndexUpdate {
  /// The name of an existing global secondary index, along with new provisioned
  /// throughput settings to be applied to that index.
  @JsonKey(name: 'Update')
  final UpdateGlobalSecondaryIndexAction update;

  /// The parameters required for creating a global secondary index on an existing
  /// table:    IndexName      KeySchema      AttributeDefinitions      Projection
  ///      ProvisionedThroughput
  @JsonKey(name: 'Create')
  final CreateGlobalSecondaryIndexAction create;

  /// The name of an existing global secondary index to be removed.
  @JsonKey(name: 'Delete')
  final DeleteGlobalSecondaryIndexAction delete;

  GlobalSecondaryIndexUpdate({
    this.update,
    this.create,
    this.delete,
  });

  factory GlobalSecondaryIndexUpdate.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalSecondaryIndexUpdateToJson(this);
}

/// Represents the properties of a global table.
@JsonSerializable()
class GlobalTable {
  /// The global table name.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The regions where the global table has replicas.
  @JsonKey(name: 'ReplicationGroup')
  final List<Replica> replicationGroup;

  GlobalTable({
    this.globalTableName,
    this.replicationGroup,
  });

  factory GlobalTable.fromJson(Map<String, dynamic> json) =>
      _$GlobalTableFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalTableToJson(this);
}

/// Contains details about the global table.
@JsonSerializable()
class GlobalTableDescription {
  /// The regions where the global table has replicas.
  @JsonKey(name: 'ReplicationGroup')
  final List<ReplicaDescription> replicationGroup;

  /// The unique identifier of the global table.
  @JsonKey(name: 'GlobalTableArn')
  final String globalTableArn;

  /// The creation time of the global table.
  @JsonKey(name: 'CreationDateTime')
  final String creationDateTime;

  /// The current state of the global table:    CREATING - The global table is
  /// being created.    UPDATING - The global table is being updated.    DELETING
  /// - The global table is being deleted.    ACTIVE - The global table is ready
  /// for use.
  @JsonKey(name: 'GlobalTableStatus')
  final String globalTableStatus;

  /// The global table name.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  GlobalTableDescription({
    this.replicationGroup,
    this.globalTableArn,
    this.creationDateTime,
    this.globalTableStatus,
    this.globalTableName,
  });

  factory GlobalTableDescription.fromJson(Map<String, dynamic> json) =>
      _$GlobalTableDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalTableDescriptionToJson(this);
}

/// Represents the settings of a global secondary index for a global table
/// that will be modified.
@JsonSerializable()
class GlobalTableGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException.
  @JsonKey(name: 'ProvisionedWriteCapacityUnits')
  final int provisionedWriteCapacityUnits;

  /// AutoScaling settings for managing a global secondary index's write capacity
  /// units.
  @JsonKey(name: 'ProvisionedWriteCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      provisionedWriteCapacityAutoScalingSettingsUpdate;

  GlobalTableGlobalSecondaryIndexSettingsUpdate({
    @required this.indexName,
    this.provisionedWriteCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettingsUpdate,
  });

  factory GlobalTableGlobalSecondaryIndexSettingsUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$GlobalTableGlobalSecondaryIndexSettingsUpdateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GlobalTableGlobalSecondaryIndexSettingsUpdateToJson(this);
}

/// Information about item collections, if any, that were affected by the operation.
/// ItemCollectionMetrics is only returned if the request asked for it. If
/// the table does not have any local secondary indexes, this information is
/// not returned in the response.
@JsonSerializable()
class ItemCollectionMetrics {
  /// The partition key value of the item collection. This value is the same
  /// as the partition key value of the item.
  @JsonKey(name: 'ItemCollectionKey')
  final Map<String, AttributeValue> itemCollectionKey;

  /// An estimate of item collection size, in gigabytes. This value is a two-element
  /// array containing a lower bound and an upper bound for the estimate. The
  /// estimate includes the size of all the items in the table, plus the size
  /// of all attributes projected into all of the local secondary indexes on
  /// that table. Use this estimate to measure whether a local secondary index
  /// is approaching its size limit. The estimate is subject to change over time;
  /// therefore, do not rely on the precision or accuracy of the estimate.
  @JsonKey(name: 'SizeEstimateRangeGB')
  final List<double> sizeEstimateRangeGB;

  ItemCollectionMetrics({
    this.itemCollectionKey,
    this.sizeEstimateRangeGB,
  });

  factory ItemCollectionMetrics.fromJson(Map<String, dynamic> json) =>
      _$ItemCollectionMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCollectionMetricsToJson(this);
}

/// Details for the requested item.
@JsonSerializable()
class ItemResponse {
  /// Map of attribute data consisting of the data type and attribute value.
  @JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  ItemResponse({
    this.item,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

/// Represents a single element of a key schema. A key schema specifies the
/// attributes that make up the primary key of a table, or the key attributes
/// of an index. A KeySchemaElement represents exactly one attribute of the
/// primary key. For example, a simple primary key would be represented by
/// one KeySchemaElement (for the partition key). A composite primary key would
/// require one KeySchemaElement for the partition key, and another KeySchemaElement
/// for the sort key. A KeySchemaElement must be a scalar, top-level attribute
/// (not a nested attribute). The data type must be one of String, Number,
/// or Binary. The attribute cannot be nested within a List or a Map.
@JsonSerializable()
class KeySchemaElement {
  /// The name of a key attribute.
  @JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The role that this key attribute will assume:    HASH - partition key
  ///   RANGE - sort key    The partition key of an item is also known as its
  /// hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeyType')
  final String keyType;

  KeySchemaElement({
    @required this.attributeName,
    @required this.keyType,
  });

  factory KeySchemaElement.fromJson(Map<String, dynamic> json) =>
      _$KeySchemaElementFromJson(json);

  Map<String, dynamic> toJson() => _$KeySchemaElementToJson(this);
}

/// Represents a set of primary keys and, for each key, the attributes to retrieve
/// from the table. For each primary key, you must provide all of the key attributes.
/// For example, with a simple primary key, you only need to provide the partition
/// key. For a composite primary key, you must provide both the partition key
/// and the sort key.
@JsonSerializable()
class KeysAndAttributes {
  /// The primary key attribute values that define the items and the attributes
  /// associated with the items.
  @JsonKey(name: 'Keys')
  final List<Map<String, AttributeValue>> keys;

  /// This is a legacy parameter. Use ProjectionExpression instead. For more
  /// information, see Legacy Conditional Parameters in the Amazon DynamoDB Developer
  /// Guide.
  @JsonKey(name: 'AttributesToGet')
  final List<String> attributesToGet;

  /// The consistency of a read operation. If set to true, then a strongly consistent
  /// read is used; otherwise, an eventually consistent read is used.
  @JsonKey(name: 'ConsistentRead')
  final bool consistentRead;

  /// A string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the ProjectionExpression must be separated by commas.
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear
  /// in the result. For more information, see Accessing Item Attributes in the
  /// Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Accessing Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  KeysAndAttributes({
    @required this.keys,
    this.attributesToGet,
    this.consistentRead,
    this.projectionExpression,
    this.expressionAttributeNames,
  });

  factory KeysAndAttributes.fromJson(Map<String, dynamic> json) =>
      _$KeysAndAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$KeysAndAttributesToJson(this);
}

@JsonSerializable()
class ListBackupsInput {
  /// The backups from the table specified by TableName are listed.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Maximum number of backups to return at once.
  @JsonKey(name: 'Limit')
  final int limit;

  /// Only backups created after this time are listed. TimeRangeLowerBound is
  /// inclusive.
  @JsonKey(name: 'TimeRangeLowerBound')
  final String timeRangeLowerBound;

  /// Only backups created before this time are listed. TimeRangeUpperBound is
  /// exclusive.
  @JsonKey(name: 'TimeRangeUpperBound')
  final String timeRangeUpperBound;

  /// LastEvaluatedBackupArn is the Amazon Resource Name (ARN) of the backup
  /// last evaluated when the current page of results was returned, inclusive
  /// of the current page of results. This value may be specified as the ExclusiveStartBackupArn
  /// of a new ListBackups operation in order to fetch the next page of results.
  @JsonKey(name: 'ExclusiveStartBackupArn')
  final String exclusiveStartBackupArn;

  /// The backups from the table specified by BackupType are listed. Where BackupType
  /// can be:    USER - On-demand backup created by you.    SYSTEM - On-demand
  /// backup automatically created by DynamoDB.    ALL - All types of on-demand
  /// backups (USER and SYSTEM).
  @JsonKey(name: 'BackupType')
  final String backupType;

  ListBackupsInput({
    this.tableName,
    this.limit,
    this.timeRangeLowerBound,
    this.timeRangeUpperBound,
    this.exclusiveStartBackupArn,
    this.backupType,
  });

  factory ListBackupsInput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupsInputFromJson(json);

  Map<String, dynamic> toJson() => _$ListBackupsInputToJson(this);
}

@JsonSerializable()
class ListBackupsOutput {
  /// List of BackupSummary objects.
  @JsonKey(name: 'BackupSummaries')
  final List<BackupSummary> backupSummaries;

  /// The ARN of the backup last evaluated when the current page of results was
  /// returned, inclusive of the current page of results. This value may be specified
  /// as the ExclusiveStartBackupArn of a new ListBackups operation in order
  /// to fetch the next page of results.   If LastEvaluatedBackupArn is empty,
  /// then the last page of results has been processed and there are no more
  /// results to be retrieved.   If LastEvaluatedBackupArn is not empty, this
  /// may or may not indicate that there is more data to be returned. All results
  /// are guaranteed to have been returned if and only if no value for LastEvaluatedBackupArn
  /// is returned.
  @JsonKey(name: 'LastEvaluatedBackupArn')
  final String lastEvaluatedBackupArn;

  ListBackupsOutput({
    this.backupSummaries,
    this.lastEvaluatedBackupArn,
  });

  factory ListBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupsOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ListBackupsOutputToJson(this);
}

@JsonSerializable()
class ListGlobalTablesInput {
  /// The first global table name that this operation will evaluate.
  @JsonKey(name: 'ExclusiveStartGlobalTableName')
  final String exclusiveStartGlobalTableName;

  /// The maximum number of table names to return.
  @JsonKey(name: 'Limit')
  final int limit;

  /// Lists the global tables in a specific Region.
  @JsonKey(name: 'RegionName')
  final String regionName;

  ListGlobalTablesInput({
    this.exclusiveStartGlobalTableName,
    this.limit,
    this.regionName,
  });

  factory ListGlobalTablesInput.fromJson(Map<String, dynamic> json) =>
      _$ListGlobalTablesInputFromJson(json);

  Map<String, dynamic> toJson() => _$ListGlobalTablesInputToJson(this);
}

@JsonSerializable()
class ListGlobalTablesOutput {
  /// List of global table names.
  @JsonKey(name: 'GlobalTables')
  final List<GlobalTable> globalTables;

  /// Last evaluated global table name.
  @JsonKey(name: 'LastEvaluatedGlobalTableName')
  final String lastEvaluatedGlobalTableName;

  ListGlobalTablesOutput({
    this.globalTables,
    this.lastEvaluatedGlobalTableName,
  });

  factory ListGlobalTablesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGlobalTablesOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ListGlobalTablesOutputToJson(this);
}

/// Represents the input of a ListTables operation.
@JsonSerializable()
class ListTablesInput {
  /// The first table name that this operation will evaluate. Use the value that
  /// was returned for LastEvaluatedTableName in a previous operation, so that
  /// you can obtain the next page of results.
  @JsonKey(name: 'ExclusiveStartTableName')
  final String exclusiveStartTableName;

  /// A maximum number of table names to return. If this parameter is not specified,
  /// the limit is 100.
  @JsonKey(name: 'Limit')
  final int limit;

  ListTablesInput({
    this.exclusiveStartTableName,
    this.limit,
  });

  factory ListTablesInput.fromJson(Map<String, dynamic> json) =>
      _$ListTablesInputFromJson(json);

  Map<String, dynamic> toJson() => _$ListTablesInputToJson(this);
}

/// Represents the output of a ListTables operation.
@JsonSerializable()
class ListTablesOutput {
  /// The names of the tables associated with the current account at the current
  /// endpoint. The maximum size of this array is 100. If LastEvaluatedTableName
  /// also appears in the output, you can use this value as the ExclusiveStartTableName
  /// parameter in a subsequent ListTables request and obtain the next page of
  /// results.
  @JsonKey(name: 'TableNames')
  final List<String> tableNames;

  /// The name of the last table in the current page of results. Use this value
  /// as the ExclusiveStartTableName in a new request to obtain the next page
  /// of results, until all the table names are returned. If you do not receive
  /// a LastEvaluatedTableName value in the response, this means that there are
  /// no more table names to be retrieved.
  @JsonKey(name: 'LastEvaluatedTableName')
  final String lastEvaluatedTableName;

  ListTablesOutput({
    this.tableNames,
    this.lastEvaluatedTableName,
  });

  factory ListTablesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTablesOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ListTablesOutputToJson(this);
}

@JsonSerializable()
class ListTagsOfResourceInput {
  /// The Amazon DynamoDB resource with tags to be listed. This value is an Amazon
  /// Resource Name (ARN).
  @JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// An optional string that, if supplied, must be copied from the output of
  /// a previous call to ListTagOfResource. When provided in this manner, this
  /// API fetches the next page of results.
  @JsonKey(name: 'NextToken')
  final String nextToken;

  ListTagsOfResourceInput({
    @required this.resourceArn,
    this.nextToken,
  });

  factory ListTagsOfResourceInput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsOfResourceInputFromJson(json);

  Map<String, dynamic> toJson() => _$ListTagsOfResourceInputToJson(this);
}

@JsonSerializable()
class ListTagsOfResourceOutput {
  /// The tags currently associated with the Amazon DynamoDB resource.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// If this value is returned, there are additional results to be displayed.
  /// To retrieve them, call ListTagsOfResource again, with NextToken set to
  /// this value.
  @JsonKey(name: 'NextToken')
  final String nextToken;

  ListTagsOfResourceOutput({
    this.tags,
    this.nextToken,
  });

  factory ListTagsOfResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsOfResourceOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ListTagsOfResourceOutputToJson(this);
}

/// Represents the properties of a local secondary index.
@JsonSerializable()
class LocalSecondaryIndex {
  /// The name of the local secondary index. The name must be unique among all
  /// other indexes on this table.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one
  /// or more pairs of attribute names and key types:    HASH - partition key
  ///    RANGE - sort key    The partition key of an item is also known as its
  /// hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// local secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  LocalSecondaryIndex({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
  });

  factory LocalSecondaryIndex.fromJson(Map<String, dynamic> json) =>
      _$LocalSecondaryIndexFromJson(json);

  Map<String, dynamic> toJson() => _$LocalSecondaryIndexToJson(this);
}

/// Represents the properties of a local secondary index.
@JsonSerializable()
class LocalSecondaryIndexDescription {
  /// Represents the name of the local secondary index.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one
  /// or more pairs of attribute names and key types:    HASH - partition key
  ///    RANGE - sort key    The partition key of an item is also known as its
  /// hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  /// The total size of the specified index, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  @JsonKey(name: 'IndexSizeBytes')
  final int indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  @JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  @JsonKey(name: 'IndexArn')
  final String indexArn;

  LocalSecondaryIndexDescription({
    this.indexName,
    this.keySchema,
    this.projection,
    this.indexSizeBytes,
    this.itemCount,
    this.indexArn,
  });

  factory LocalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) =>
      _$LocalSecondaryIndexDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$LocalSecondaryIndexDescriptionToJson(this);
}

/// Represents the properties of a local secondary index for the table when
/// the backup was created.
@JsonSerializable()
class LocalSecondaryIndexInfo {
  /// Represents the name of the local secondary index.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a local secondary index, which consists of
  /// one or more pairs of attribute names and key types:    HASH - partition
  /// key    RANGE - sort key    The partition key of an item is also known as
  /// its hash attribute. The term "hash attribute" derives from DynamoDB' usage
  /// of an internal hash function to evenly distribute data items across partitions,
  /// based on their partition key values. The sort key of an item is also known
  /// as its range attribute. The term "range attribute" derives from the way
  /// DynamoDB stores items with the same partition key physically close together,
  /// in sorted order by the sort key value.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @JsonKey(name: 'Projection')
  final Projection projection;

  LocalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
  });

  factory LocalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) =>
      _$LocalSecondaryIndexInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LocalSecondaryIndexInfoToJson(this);
}

/// The description of the point in time settings applied to the table.
@JsonSerializable()
class PointInTimeRecoveryDescription {
  /// The current state of point in time recovery:    ENABLING - Point in time
  /// recovery is being enabled.    ENABLED - Point in time recovery is enabled.
  ///    DISABLED - Point in time recovery is disabled.
  @JsonKey(name: 'PointInTimeRecoveryStatus')
  final String pointInTimeRecoveryStatus;

  /// Specifies the earliest point in time you can restore your table to. It
  /// You can restore your table to any point in time during the last 35 days.
  @JsonKey(name: 'EarliestRestorableDateTime')
  final String earliestRestorableDateTime;

  /// LatestRestorableDateTime is typically 5 minutes before the current time.
  @JsonKey(name: 'LatestRestorableDateTime')
  final String latestRestorableDateTime;

  PointInTimeRecoveryDescription({
    this.pointInTimeRecoveryStatus,
    this.earliestRestorableDateTime,
    this.latestRestorableDateTime,
  });

  factory PointInTimeRecoveryDescription.fromJson(Map<String, dynamic> json) =>
      _$PointInTimeRecoveryDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PointInTimeRecoveryDescriptionToJson(this);
}

/// Represents the settings used to enable point in time recovery.
@JsonSerializable()
class PointInTimeRecoverySpecification {
  /// Indicates whether point in time recovery is enabled (true) or disabled
  /// (false) on the table.
  @JsonKey(name: 'PointInTimeRecoveryEnabled')
  final bool pointInTimeRecoveryEnabled;

  PointInTimeRecoverySpecification({
    @required this.pointInTimeRecoveryEnabled,
  });

  factory PointInTimeRecoverySpecification.fromJson(
          Map<String, dynamic> json) =>
      _$PointInTimeRecoverySpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PointInTimeRecoverySpecificationToJson(this);
}

/// Represents attributes that are copied (projected) from the table into an
/// index. These are in addition to the primary key attributes and index key
/// attributes, which are automatically projected.
@JsonSerializable()
class Projection {
  /// The set of attributes that are projected into the index:    KEYS_ONLY -
  /// Only the index and primary keys are projected into the index.    INCLUDE
  /// - Only the specified table attributes are projected into the index. The
  /// list of projected attributes are in NonKeyAttributes.    ALL - All of the
  /// table attributes are projected into the index.
  @JsonKey(name: 'ProjectionType')
  final String projectionType;

  /// Represents the non-key attribute names which will be projected into the
  /// index. For local secondary indexes, the total count of NonKeyAttributes
  /// summed across all of the local secondary indexes, must not exceed 20. If
  /// you project the same attribute into two different indexes, this counts
  /// as two distinct attributes when determining the total.
  @JsonKey(name: 'NonKeyAttributes')
  final List<String> nonKeyAttributes;

  Projection({
    this.projectionType,
    this.nonKeyAttributes,
  });

  factory Projection.fromJson(Map<String, dynamic> json) =>
      _$ProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectionToJson(this);
}

/// Represents the provisioned throughput settings for a specified table or
/// index. The settings can be modified using the UpdateTable operation. For
/// current minimum and maximum provisioned throughput values, see Limits in
/// the Amazon DynamoDB Developer Guide.
@JsonSerializable()
class ProvisionedThroughput {
  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException. For more information, see Specifying
  /// Read and Write Requirements in the Amazon DynamoDB Developer Guide. If
  /// read/write capacity mode is PAY_PER_REQUEST the value is set to 0.
  @JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException. For more information, see Specifying Read and Write
  /// Requirements in the Amazon DynamoDB Developer Guide. If read/write capacity
  /// mode is PAY_PER_REQUEST the value is set to 0.
  @JsonKey(name: 'WriteCapacityUnits')
  final int writeCapacityUnits;

  ProvisionedThroughput({
    @required this.readCapacityUnits,
    @required this.writeCapacityUnits,
  });

  factory ProvisionedThroughput.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedThroughputFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisionedThroughputToJson(this);
}

/// Represents the provisioned throughput settings for the table, consisting
/// of read and write capacity units, along with data about increases and decreases.
@JsonSerializable()
class ProvisionedThroughputDescription {
  /// The date and time of the last provisioned throughput increase for this
  /// table.
  @JsonKey(name: 'LastIncreaseDateTime')
  final String lastIncreaseDateTime;

  /// The date and time of the last provisioned throughput decrease for this
  /// table.
  @JsonKey(name: 'LastDecreaseDateTime')
  final String lastDecreaseDateTime;

  /// The number of provisioned throughput decreases for this table during this
  /// UTC calendar day. For current maximums on provisioned throughput decreases,
  /// see Limits in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'NumberOfDecreasesToday')
  final int numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException. Eventually consistent reads require
  /// less effort than strongly consistent reads, so a setting of 50 ReadCapacityUnits
  /// per second provides 100 eventually consistent ReadCapacityUnits per second.
  @JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException.
  @JsonKey(name: 'WriteCapacityUnits')
  final int writeCapacityUnits;

  ProvisionedThroughputDescription({
    this.lastIncreaseDateTime,
    this.lastDecreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory ProvisionedThroughputDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ProvisionedThroughputDescriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProvisionedThroughputDescriptionToJson(this);
}

/// Represents a request to perform a PutItem operation.
@JsonSerializable()
class Put {
  /// A map of attribute name to attribute values, representing the primary key
  /// of the item to be written by PutItem. All of the table's primary key attributes
  /// must be specified, and their data types must match those of the table's
  /// key schema. If any attributes are present in the item that are part of
  /// an index key schema for the table, their types must match the index key
  /// schema.
  @JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  /// Name of the table in which to write the item.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use ReturnValuesOnConditionCheckFailure to get the item attributes if the
  /// Put condition fails. For ReturnValuesOnConditionCheckFailure, the valid
  /// values are: NONE and ALL_OLD.
  @JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final String returnValuesOnConditionCheckFailure;

  Put({
    @required this.item,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  factory Put.fromJson(Map<String, dynamic> json) => _$PutFromJson(json);

  Map<String, dynamic> toJson() => _$PutToJson(this);
}

/// Represents the input of a PutItem operation.
@JsonSerializable()
class PutItemInput {
  /// The name of the table to contain the item.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A map of attribute name/value pairs, one for each attribute. Only the primary
  /// key attributes are required; you can optionally provide other attribute
  /// name-value pairs for the item. You must provide all of the attributes for
  /// the primary key. For example, with a simple primary key, you only need
  /// to provide a value for the partition key. For a composite primary key,
  /// you must provide both values for both the partition key and the sort key.
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition. For more information about primary keys, see Primary
  /// Key in the Amazon DynamoDB Developer Guide. Each element in the Item map
  /// is an AttributeValue object.
  @JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see Expected in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'Expected')
  final Map<String, ExpectedAttributeValue> expected;

  /// Use ReturnValues if you want to get the item attributes as they appeared
  /// before they were updated with the PutItem request. For PutItem, the valid
  /// values are:    NONE - If ReturnValues is not specified, or if its value
  /// is NONE, then nothing is returned. (This setting is the default for ReturnValues.)
  ///    ALL_OLD - If PutItem overwrote an attribute name-value pair, then the
  /// content of the old item is returned.    The ReturnValues parameter is used
  /// by several DynamoDB operations; however, PutItem does not recognize any
  /// values other than NONE or ALL_OLD.
  @JsonKey(name: 'ReturnValues')
  final String returnValues;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// Determines whether item collection metrics are returned. If set to SIZE,
  /// the response includes statistics about item collections, if any, that were
  /// modified during the operation are returned in the response. If set to NONE
  /// (the default), no statistics are returned.
  @JsonKey(name: 'ReturnItemCollectionMetrics')
  final String returnItemCollectionMetrics;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see ConditionalOperator in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionalOperator')
  final String conditionalOperator;

  /// A condition that must be satisfied in order for a conditional PutItem operation
  /// to succeed. An expression can contain any of the following:   Functions:
  /// attribute_exists | attribute_not_exists | attribute_type | contains | begins_with
  /// | size  These function names are case-sensitive.   Comparison operators:
  /// = | <> | < | > | <= | >= | BETWEEN | IN      Logical operators: AND | OR
  /// | NOT    For more information on condition expressions, see Condition Expressions
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression. Use the :
  /// (colon) character in an expression to dereference an attribute value. For
  /// example, suppose that you wanted to check whether the value of the ProductStatus
  /// attribute was one of the following:   Available | Backordered | Discontinued
  ///  You would first need to specify ExpressionAttributeValues as follows:
  ///  { ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"}
  /// }  You could then use these values in an expression, such as this:  ProductStatus
  /// IN (:avail, :back, :disc)  For more information on expression attribute
  /// values, see Condition Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  PutItemInput({
    @required this.tableName,
    @required this.item,
    this.expected,
    this.returnValues,
    this.returnConsumedCapacity,
    this.returnItemCollectionMetrics,
    this.conditionalOperator,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
  });

  factory PutItemInput.fromJson(Map<String, dynamic> json) =>
      _$PutItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$PutItemInputToJson(this);
}

/// Represents the output of a PutItem operation.
@JsonSerializable()
class PutItemOutput {
  /// The attribute values as they appeared before the PutItem operation, but
  /// only if ReturnValues is specified as ALL_OLD in the request. Each element
  /// consists of an attribute name and an attribute value.
  @JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the PutItem operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation. ConsumedCapacity
  /// is only returned if the ReturnConsumedCapacity parameter was specified.
  /// For more information, see Read/Write Capacity Mode in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the PutItem
  /// operation. ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics
  /// parameter was specified. If the table does not have any local secondary
  /// indexes, this information is not returned in the response. Each ItemCollectionMetrics
  /// element consists of:    ItemCollectionKey - The partition key value of
  /// the item collection. This is the same as the partition key value of the
  /// item itself.    SizeEstimateRangeGB - An estimate of item collection size,
  /// in gigabytes. This value is a two-element array containing a lower bound
  /// and an upper bound for the estimate. The estimate includes the size of
  /// all the items in the table, plus the size of all attributes projected into
  /// all of the local secondary indexes on that table. Use this estimate to
  /// measure whether a local secondary index is approaching its size limit.
  /// The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  @JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  PutItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory PutItemOutput.fromJson(Map<String, dynamic> json) =>
      _$PutItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$PutItemOutputToJson(this);
}

/// Represents a request to perform a PutItem operation on an item.
@JsonSerializable()
class PutRequest {
  /// A map of attribute name to attribute values, representing the primary key
  /// of an item to be processed by PutItem. All of the table's primary key attributes
  /// must be specified, and their data types must match those of the table's
  /// key schema. If any attributes are present in the item which are part of
  /// an index key schema for the table, their types must match the index key
  /// schema.
  @JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  PutRequest({
    @required this.item,
  });

  factory PutRequest.fromJson(Map<String, dynamic> json) =>
      _$PutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutRequestToJson(this);
}

/// Represents the input of a Query operation.
@JsonSerializable()
class QueryInput {
  /// The name of the table containing the requested items.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// The name of an index to query. This index can be any local secondary index
  /// or global secondary index on the table. Note that if you use the IndexName
  /// parameter, you must also provide TableName.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.    ALL_ATTRIBUTES - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from
  /// the parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.    ALL_PROJECTED_ATTRIBUTES - Allowed only when
  /// querying an index. Retrieves all attributes that have been projected into
  /// the index. If the index is configured to project all attributes, this return
  /// value is equivalent to specifying ALL_ATTRIBUTES.    COUNT - Returns the
  /// number of matching items, rather than the matching items themselves.
  ///  SPECIFIC_ATTRIBUTES - Returns only the attributes listed in AttributesToGet.
  /// This return value is equivalent to specifying AttributesToGet without specifying
  /// any value for Select. If you query or scan a local secondary index and
  /// request only attributes that are projected into that index, the operation
  /// will read only the index and not the table. If any of the requested attributes
  /// are not projected into the local secondary index, DynamoDB fetches each
  /// of these attributes from the parent table. This extra fetching incurs additional
  /// throughput cost and latency. If you query or scan a global secondary index,
  /// you can only request attributes that are projected into the index. Global
  /// secondary index queries cannot fetch attributes from the parent table.
  ///   If neither Select nor AttributesToGet are specified, DynamoDB defaults
  /// to ALL_ATTRIBUTES when accessing a table, and ALL_PROJECTED_ATTRIBUTES
  /// when accessing an index. You cannot use both Select and AttributesToGet
  /// together in a single request, unless the value for Select is SPECIFIC_ATTRIBUTES.
  /// (This usage is equivalent to specifying AttributesToGet without any value
  /// for Select.)  If you use the ProjectionExpression parameter, then the value
  /// for Select can only be SPECIFIC_ATTRIBUTES. Any other value for Select
  /// will return an error.
  @JsonKey(name: 'Select')
  final String select;

  /// This is a legacy parameter. Use ProjectionExpression instead. For more
  /// information, see AttributesToGet in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'AttributesToGet')
  final List<String> attributesToGet;

  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the matching
  /// values up to that point, and a key in LastEvaluatedKey to apply in a subsequent
  /// operation, so that you can pick up where you left off. Also, if the processed
  /// dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops
  /// the operation and returns the matching values up to the limit, and a key
  /// in LastEvaluatedKey to apply in a subsequent operation to continue the
  /// operation. For more information, see Query and Scan in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'Limit')
  final int limit;

  /// Determines the read consistency model: If set to true, then the operation
  /// uses strongly consistent reads; otherwise, the operation uses eventually
  /// consistent reads. Strongly consistent reads are not supported on global
  /// secondary indexes. If you query a global secondary index with ConsistentRead
  /// set to true, you will receive a ValidationException.
  @JsonKey(name: 'ConsistentRead')
  final bool consistentRead;

  /// This is a legacy parameter. Use KeyConditionExpression instead. For more
  /// information, see KeyConditions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'KeyConditions')
  final Map<String, Condition> keyConditions;

  /// This is a legacy parameter. Use FilterExpression instead. For more information,
  /// see QueryFilter in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'QueryFilter')
  final Map<String, Condition> queryFilter;

  /// This is a legacy parameter. Use FilterExpression instead. For more information,
  /// see ConditionalOperator in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionalOperator')
  final String conditionalOperator;

  /// Specifies the order for index traversal: If true (default), the traversal
  /// is performed in ascending order; if false, the traversal is performed in
  /// descending order.  Items with the same partition key value are stored in
  /// sorted order by sort key. If the sort key data type is Number, the results
  /// are stored in numeric order. For type String, the results are stored in
  /// order of UTF-8 bytes. For type Binary, DynamoDB treats each byte of the
  /// binary data as unsigned. If ScanIndexForward is true, DynamoDB returns
  /// the results in the order in which they are stored (by sort key value).
  /// This is the default behavior. If ScanIndexForward is false, DynamoDB reads
  /// the results in reverse order by sort key value, and then returns the results
  /// to the client.
  @JsonKey(name: 'ScanIndexForward')
  final bool scanIndexForward;

  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for LastEvaluatedKey in the previous operation.
  /// The data type for ExclusiveStartKey must be String, Number, or Binary.
  /// No set data types are allowed.
  @JsonKey(name: 'ExclusiveStartKey')
  final Map<String, AttributeValue> exclusiveStartKey;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// A string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the expression must be separated by commas. If no attribute
  /// names are specified, then all attributes will be returned. If any of the
  /// requested attributes are not found, they will not appear in the result.
  /// For more information, see Accessing Item Attributes in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  /// A string that contains conditions that DynamoDB applies after the Query
  /// operation, but before the data is returned to you. Items that do not satisfy
  /// the FilterExpression criteria are not returned. A FilterExpression does
  /// not allow key attributes. You cannot define a filter expression based on
  /// a partition key or a sort key.  A FilterExpression is applied after the
  /// items have already been read; the process of filtering does not consume
  /// any additional read capacity units.  For more information, see Filter Expressions
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'FilterExpression')
  final String filterExpression;

  /// The condition that specifies the key values for items to be retrieved by
  /// the Query action. The condition must perform an equality test on a single
  /// partition key value. The condition can optionally perform one of several
  /// comparison tests on a single sort key value. This allows Query to retrieve
  /// one item with a given partition key value and sort key value, or several
  /// items that have the same partition key value but different sort key values.
  /// The partition key equality test is required, and must be specified in the
  /// following format:  partitionKeyName = :partitionkeyval  If you also want
  /// to provide a condition for the sort key, it must be combined using AND
  /// with the condition for the sort key. Following is an example, using the
  /// = comparison operator for the sort key:  partitionKeyName = :partitionkeyval
  /// AND sortKeyName = :sortkeyval  Valid comparisons for the sort key condition
  /// are as follows:    sortKeyName = :sortkeyval - true if the sort key value
  /// is equal to :sortkeyval.    sortKeyName < :sortkeyval - true if the sort
  /// key value is less than :sortkeyval.    sortKeyName <= :sortkeyval - true
  /// if the sort key value is less than or equal to :sortkeyval.    sortKeyName
  /// > :sortkeyval - true if the sort key value is greater than :sortkeyval.
  ///    sortKeyName >=  :sortkeyval - true if the sort key value is greater
  /// than or equal to :sortkeyval.    sortKeyName BETWEEN :sortkeyval1 AND :sortkeyval2
  /// - true if the sort key value is greater than or equal to :sortkeyval1,
  /// and less than or equal to :sortkeyval2.    begins_with ( sortKeyName, :sortkeyval
  /// ) - true if the sort key value begins with a particular operand. (You cannot
  /// use this function with a sort key that is of type Number.) Note that the
  /// function name begins_with is case-sensitive.   Use the ExpressionAttributeValues
  /// parameter to replace tokens such as :partitionval and :sortval with actual
  /// values at runtime. You can optionally use the ExpressionAttributeNames
  /// parameter to replace the names of the partition key and sort key with placeholder
  /// tokens. This option might be necessary if an attribute name conflicts with
  /// a DynamoDB reserved word. For example, the following KeyConditionExpression
  /// parameter causes an error because Size is a reserved word:    Size = :myval
  ///    To work around this, define a placeholder (such a #S) to represent the
  /// attribute name Size. KeyConditionExpression then is as follows:    #S =
  /// :myval    For a list of reserved words, see Reserved Words in the Amazon
  /// DynamoDB Developer Guide. For more information on ExpressionAttributeNames
  /// and ExpressionAttributeValues, see Using Placeholders for Attribute Names
  /// and Values in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'KeyConditionExpression')
  final String keyConditionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression. Use the :
  /// (colon) character in an expression to dereference an attribute value. For
  /// example, suppose that you wanted to check whether the value of the ProductStatus
  /// attribute was one of the following:   Available | Backordered | Discontinued
  ///  You would first need to specify ExpressionAttributeValues as follows:
  ///  { ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"}
  /// }  You could then use these values in an expression, such as this:  ProductStatus
  /// IN (:avail, :back, :disc)  For more information on expression attribute
  /// values, see Specifying Conditions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  QueryInput({
    @required this.tableName,
    this.indexName,
    this.select,
    this.attributesToGet,
    this.limit,
    this.consistentRead,
    this.keyConditions,
    this.queryFilter,
    this.conditionalOperator,
    this.scanIndexForward,
    this.exclusiveStartKey,
    this.returnConsumedCapacity,
    this.projectionExpression,
    this.filterExpression,
    this.keyConditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
  });

  factory QueryInput.fromJson(Map<String, dynamic> json) =>
      _$QueryInputFromJson(json);

  Map<String, dynamic> toJson() => _$QueryInputToJson(this);
}

/// Represents the output of a Query operation.
@JsonSerializable()
class QueryOutput {
  /// An array of item attributes that match the query criteria. Each element
  /// in this array consists of an attribute name and the value for that attribute.
  @JsonKey(name: 'Items')
  final List<Map<String, AttributeValue>> items;

  /// The number of items in the response. If you used a QueryFilter in the request,
  /// then Count is the number of items returned after the filter was applied,
  /// and ScannedCount is the number of matching items before the filter was
  /// applied. If you did not use a filter in the request, then Count and ScannedCount
  /// are the same.
  @JsonKey(name: 'Count')
  final int count;

  /// The number of items evaluated, before any QueryFilter is applied. A high
  /// ScannedCount value with few, or no, Count results indicates an inefficient
  /// Query operation. For more information, see Count and ScannedCount in the
  /// Amazon DynamoDB Developer Guide. If you did not use a filter in the request,
  /// then ScannedCount is the same as Count.
  @JsonKey(name: 'ScannedCount')
  final int scannedCount;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request. If LastEvaluatedKey is empty, then the "last
  /// page" of results has been processed and there is no more data to be retrieved.
  /// If LastEvaluatedKey is not empty, it does not necessarily mean that there
  /// is more data in the result set. The only way to know when you have reached
  /// the end of the result set is when LastEvaluatedKey is empty.
  @JsonKey(name: 'LastEvaluatedKey')
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The capacity units consumed by the Query operation. The data returned includes
  /// the total provisioned throughput consumed, along with statistics for the
  /// table and any indexes involved in the operation. ConsumedCapacity is only
  /// returned if the ReturnConsumedCapacity parameter was specified. For more
  /// information, see Provisioned Throughput in the Amazon DynamoDB Developer
  /// Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  QueryOutput({
    this.items,
    this.count,
    this.scannedCount,
    this.lastEvaluatedKey,
    this.consumedCapacity,
  });

  factory QueryOutput.fromJson(Map<String, dynamic> json) =>
      _$QueryOutputFromJson(json);

  Map<String, dynamic> toJson() => _$QueryOutputToJson(this);
}

/// Represents the properties of a replica.
@JsonSerializable()
class Replica {
  /// The region where the replica needs to be created.
  @JsonKey(name: 'RegionName')
  final String regionName;

  Replica({
    this.regionName,
  });

  factory Replica.fromJson(Map<String, dynamic> json) =>
      _$ReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaToJson(this);
}

/// Contains the details of the replica.
@JsonSerializable()
class ReplicaDescription {
  /// The name of the region.
  @JsonKey(name: 'RegionName')
  final String regionName;

  ReplicaDescription({
    this.regionName,
  });

  factory ReplicaDescription.fromJson(Map<String, dynamic> json) =>
      _$ReplicaDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaDescriptionToJson(this);
}

/// Represents the properties of a global secondary index.
@JsonSerializable()
class ReplicaGlobalSecondaryIndexSettingsDescription {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The current status of the global secondary index:    CREATING - The global
  /// secondary index is being created.    UPDATING - The global secondary index
  /// is being updated.    DELETING - The global secondary index is being deleted.
  ///    ACTIVE - The global secondary index is ready for use.
  @JsonKey(name: 'IndexStatus')
  final String indexStatus;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException.
  @JsonKey(name: 'ProvisionedReadCapacityUnits')
  final int provisionedReadCapacityUnits;

  /// Autoscaling settings for a global secondary index replica's read capacity
  /// units.
  @JsonKey(name: 'ProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedReadCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException.
  @JsonKey(name: 'ProvisionedWriteCapacityUnits')
  final int provisionedWriteCapacityUnits;

  /// AutoScaling settings for a global secondary index replica's write capacity
  /// units.
  @JsonKey(name: 'ProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedWriteCapacityAutoScalingSettings;

  ReplicaGlobalSecondaryIndexSettingsDescription({
    @required this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityUnits,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedWriteCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettings,
  });

  factory ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicaGlobalSecondaryIndexSettingsDescriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReplicaGlobalSecondaryIndexSettingsDescriptionToJson(this);
}

/// Represents the settings of a global secondary index for a global table
/// that will be modified.
@JsonSerializable()
class ReplicaGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException.
  @JsonKey(name: 'ProvisionedReadCapacityUnits')
  final int provisionedReadCapacityUnits;

  /// Autoscaling settings for managing a global secondary index replica's read
  /// capacity units.
  @JsonKey(name: 'ProvisionedReadCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      provisionedReadCapacityAutoScalingSettingsUpdate;

  ReplicaGlobalSecondaryIndexSettingsUpdate({
    @required this.indexName,
    this.provisionedReadCapacityUnits,
    this.provisionedReadCapacityAutoScalingSettingsUpdate,
  });

  factory ReplicaGlobalSecondaryIndexSettingsUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicaGlobalSecondaryIndexSettingsUpdateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReplicaGlobalSecondaryIndexSettingsUpdateToJson(this);
}

/// Represents the properties of a replica.
@JsonSerializable()
class ReplicaSettingsDescription {
  /// The region name of the replica.
  @JsonKey(name: 'RegionName')
  final String regionName;

  /// The current state of the region:    CREATING - The region is being created.
  ///    UPDATING - The region is being updated.    DELETING - The region is
  /// being deleted.    ACTIVE - The region is ready for use.
  @JsonKey(name: 'ReplicaStatus')
  final String replicaStatus;

  /// The read/write capacity mode of the replica.
  @JsonKey(name: 'ReplicaBillingModeSummary')
  final BillingModeSummary replicaBillingModeSummary;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException. For more information, see Specifying
  /// Read and Write Requirements in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ReplicaProvisionedReadCapacityUnits')
  final int replicaProvisionedReadCapacityUnits;

  /// Autoscaling settings for a global table replica's read capacity units.
  @JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedReadCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException. For more information, see Specifying Read and Write
  /// Requirements in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ReplicaProvisionedWriteCapacityUnits')
  final int replicaProvisionedWriteCapacityUnits;

  /// AutoScaling settings for a global table replica's write capacity units.
  @JsonKey(name: 'ReplicaProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// Replica global secondary index settings for the global table.
  @JsonKey(name: 'ReplicaGlobalSecondaryIndexSettings')
  final List<ReplicaGlobalSecondaryIndexSettingsDescription>
      replicaGlobalSecondaryIndexSettings;

  ReplicaSettingsDescription({
    @required this.regionName,
    this.replicaStatus,
    this.replicaBillingModeSummary,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityUnits,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaGlobalSecondaryIndexSettings,
  });

  factory ReplicaSettingsDescription.fromJson(Map<String, dynamic> json) =>
      _$ReplicaSettingsDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaSettingsDescriptionToJson(this);
}

/// Represents the settings for a global table in a region that will be modified.
@JsonSerializable()
class ReplicaSettingsUpdate {
  /// The region of the replica to be added.
  @JsonKey(name: 'RegionName')
  final String regionName;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a ThrottlingException. For more information, see Specifying
  /// Read and Write Requirements in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ReplicaProvisionedReadCapacityUnits')
  final int replicaProvisionedReadCapacityUnits;

  /// Autoscaling settings for managing a global table replica's read capacity
  /// units.
  @JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      replicaProvisionedReadCapacityAutoScalingSettingsUpdate;

  /// Represents the settings of a global secondary index for a global table
  /// that will be modified.
  @JsonKey(name: 'ReplicaGlobalSecondaryIndexSettingsUpdate')
  final List<ReplicaGlobalSecondaryIndexSettingsUpdate>
      replicaGlobalSecondaryIndexSettingsUpdate;

  ReplicaSettingsUpdate({
    @required this.regionName,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
    this.replicaGlobalSecondaryIndexSettingsUpdate,
  });

  factory ReplicaSettingsUpdate.fromJson(Map<String, dynamic> json) =>
      _$ReplicaSettingsUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaSettingsUpdateToJson(this);
}

/// Represents one of the following:   A new replica to be added to an existing
/// global table.   New parameters for an existing replica.   An existing replica
/// to be removed from an existing global table.
@JsonSerializable()
class ReplicaUpdate {
  /// The parameters required for creating a replica on an existing global table.
  @JsonKey(name: 'Create')
  final CreateReplicaAction create;

  /// The name of the existing replica to be removed.
  @JsonKey(name: 'Delete')
  final DeleteReplicaAction delete;

  ReplicaUpdate({
    this.create,
    this.delete,
  });

  factory ReplicaUpdate.fromJson(Map<String, dynamic> json) =>
      _$ReplicaUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaUpdateToJson(this);
}

/// Contains details for the restore.
@JsonSerializable()
class RestoreSummary {
  /// Point in time or source backup time.
  @JsonKey(name: 'RestoreDateTime')
  final String restoreDateTime;

  /// Indicates if a restore is in progress or not.
  @JsonKey(name: 'RestoreInProgress')
  final bool restoreInProgress;

  /// ARN of the backup from which the table was restored.
  @JsonKey(name: 'SourceBackupArn')
  final String sourceBackupArn;

  /// ARN of the source table of the backup that is being restored.
  @JsonKey(name: 'SourceTableArn')
  final String sourceTableArn;

  RestoreSummary({
    @required this.restoreDateTime,
    @required this.restoreInProgress,
    this.sourceBackupArn,
    this.sourceTableArn,
  });

  factory RestoreSummary.fromJson(Map<String, dynamic> json) =>
      _$RestoreSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreSummaryToJson(this);
}

@JsonSerializable()
class RestoreTableFromBackupInput {
  /// The name of the new table to which the backup must be restored.
  @JsonKey(name: 'TargetTableName')
  final String targetTableName;

  /// The Amazon Resource Name (ARN) associated with the backup.
  @JsonKey(name: 'BackupArn')
  final String backupArn;

  RestoreTableFromBackupInput({
    @required this.targetTableName,
    @required this.backupArn,
  });

  factory RestoreTableFromBackupInput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableFromBackupInputFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreTableFromBackupInputToJson(this);
}

@JsonSerializable()
class RestoreTableFromBackupOutput {
  /// The description of the table created from an existing backup.
  @JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  RestoreTableFromBackupOutput({
    this.tableDescription,
  });

  factory RestoreTableFromBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableFromBackupOutputFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreTableFromBackupOutputToJson(this);
}

@JsonSerializable()
class RestoreTableToPointInTimeInput {
  /// Name of the source table that is being restored.
  @JsonKey(name: 'SourceTableName')
  final String sourceTableName;

  /// The name of the new table to which it must be restored to.
  @JsonKey(name: 'TargetTableName')
  final String targetTableName;

  /// Restore the table to the latest possible time. LatestRestorableDateTime
  /// is typically 5 minutes before the current time.
  @JsonKey(name: 'UseLatestRestorableTime')
  final bool useLatestRestorableTime;

  /// Time in the past to restore the table to.
  @JsonKey(name: 'RestoreDateTime')
  final String restoreDateTime;

  RestoreTableToPointInTimeInput({
    @required this.sourceTableName,
    @required this.targetTableName,
    this.useLatestRestorableTime,
    this.restoreDateTime,
  });

  factory RestoreTableToPointInTimeInput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableToPointInTimeInputFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreTableToPointInTimeInputToJson(this);
}

@JsonSerializable()
class RestoreTableToPointInTimeOutput {
  /// Represents the properties of a table.
  @JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  RestoreTableToPointInTimeOutput({
    this.tableDescription,
  });

  factory RestoreTableToPointInTimeOutput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableToPointInTimeOutputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RestoreTableToPointInTimeOutputToJson(this);
}

/// The description of the server-side encryption status on the specified table.
@JsonSerializable()
class SSEDescription {
  /// Represents the current state of server-side encryption. The only supported
  /// values are:    ENABLED - Server-side encryption is enabled.    UPDATING
  /// - Server-side encryption is being updated.
  @JsonKey(name: 'Status')
  final String status;

  /// Server-side encryption type. The only supported value is:    KMS - Server-side
  /// encryption which uses AWS Key Management Service. Key is stored in your
  /// account and is managed by AWS KMS (KMS charges apply).
  @JsonKey(name: 'SSEType')
  final String sSEType;

  /// The KMS customer master key (CMK) ARN used for the KMS encryption.
  @JsonKey(name: 'KMSMasterKeyArn')
  final String kMSMasterKeyArn;

  SSEDescription({
    this.status,
    this.sSEType,
    this.kMSMasterKeyArn,
  });

  factory SSEDescription.fromJson(Map<String, dynamic> json) =>
      _$SSEDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SSEDescriptionToJson(this);
}

/// Represents the settings used to enable server-side encryption.
@JsonSerializable()
class SSESpecification {
  /// Indicates whether server-side encryption is done using an AWS managed CMK
  /// or an AWS owned CMK. If enabled (true), server-side encryption type is
  /// set to KMS and an AWS managed CMK is used (AWS KMS charges apply). If disabled
  /// (false) or not specified, server-side encryption is set to AWS owned CMK.
  @JsonKey(name: 'Enabled')
  final bool enabled;

  /// Server-side encryption type. The only supported value is:    KMS - Server-side
  /// encryption which uses AWS Key Management Service. Key is stored in your
  /// account and is managed by AWS KMS (KMS charges apply).
  @JsonKey(name: 'SSEType')
  final String sSEType;

  /// The KMS Customer Master Key (CMK) which should be used for the KMS encryption.
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. Note that you should only provide this parameter if the key
  /// is different from the default DynamoDB Customer Master Key alias/aws/dynamodb.
  @JsonKey(name: 'KMSMasterKeyId')
  final String kMSMasterKeyId;

  SSESpecification({
    this.enabled,
    this.sSEType,
    this.kMSMasterKeyId,
  });

  factory SSESpecification.fromJson(Map<String, dynamic> json) =>
      _$SSESpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$SSESpecificationToJson(this);
}

/// Represents the input of a Scan operation.
@JsonSerializable()
class ScanInput {
  /// The name of the table containing the requested items; or, if you provide
  /// IndexName, the name of the table to which that index belongs.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// The name of a secondary index to scan. This index can be any local secondary
  /// index or global secondary index. Note that if you use the IndexName parameter,
  /// you must also provide TableName.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// This is a legacy parameter. Use ProjectionExpression instead. For more
  /// information, see AttributesToGet in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'AttributesToGet')
  final List<String> attributesToGet;

  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the matching
  /// values up to that point, and a key in LastEvaluatedKey to apply in a subsequent
  /// operation, so that you can pick up where you left off. Also, if the processed
  /// dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops
  /// the operation and returns the matching values up to the limit, and a key
  /// in LastEvaluatedKey to apply in a subsequent operation to continue the
  /// operation. For more information, see Working with Queries in the Amazon
  /// DynamoDB Developer Guide.
  @JsonKey(name: 'Limit')
  final int limit;

  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.    ALL_ATTRIBUTES - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from
  /// the parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.    ALL_PROJECTED_ATTRIBUTES - Allowed only when
  /// querying an index. Retrieves all attributes that have been projected into
  /// the index. If the index is configured to project all attributes, this return
  /// value is equivalent to specifying ALL_ATTRIBUTES.    COUNT - Returns the
  /// number of matching items, rather than the matching items themselves.
  ///  SPECIFIC_ATTRIBUTES - Returns only the attributes listed in AttributesToGet.
  /// This return value is equivalent to specifying AttributesToGet without specifying
  /// any value for Select. If you query or scan a local secondary index and
  /// request only attributes that are projected into that index, the operation
  /// reads only the index and not the table. If any of the requested attributes
  /// are not projected into the local secondary index, DynamoDB fetches each
  /// of these attributes from the parent table. This extra fetching incurs additional
  /// throughput cost and latency. If you query or scan a global secondary index,
  /// you can only request attributes that are projected into the index. Global
  /// secondary index queries cannot fetch attributes from the parent table.
  ///   If neither Select nor AttributesToGet are specified, DynamoDB defaults
  /// to ALL_ATTRIBUTES when accessing a table, and ALL_PROJECTED_ATTRIBUTES
  /// when accessing an index. You cannot use both Select and AttributesToGet
  /// together in a single request, unless the value for Select is SPECIFIC_ATTRIBUTES.
  /// (This usage is equivalent to specifying AttributesToGet without any value
  /// for Select.)  If you use the ProjectionExpression parameter, then the value
  /// for Select can only be SPECIFIC_ATTRIBUTES. Any other value for Select
  /// will return an error.
  @JsonKey(name: 'Select')
  final String select;

  /// This is a legacy parameter. Use FilterExpression instead. For more information,
  /// see ScanFilter in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ScanFilter')
  final Map<String, Condition> scanFilter;

  /// This is a legacy parameter. Use FilterExpression instead. For more information,
  /// see ConditionalOperator in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionalOperator')
  final String conditionalOperator;

  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for LastEvaluatedKey in the previous operation.
  /// The data type for ExclusiveStartKey must be String, Number or Binary. No
  /// set data types are allowed. In a parallel scan, a Scan request that includes
  /// ExclusiveStartKey must specify the same segment whose previous Scan returned
  /// the corresponding value of LastEvaluatedKey.
  @JsonKey(name: 'ExclusiveStartKey')
  final Map<String, AttributeValue> exclusiveStartKey;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// For a parallel Scan request, TotalSegments represents the total number
  /// of segments into which the Scan operation will be divided. The value of
  /// TotalSegments corresponds to the number of application workers that will
  /// perform the parallel scan. For example, if you want to use four application
  /// threads to scan a table or an index, specify a TotalSegments value of 4.
  /// The value for TotalSegments must be greater than or equal to 1, and less
  /// than or equal to 1000000. If you specify a TotalSegments value of 1, the
  /// Scan operation will be sequential rather than parallel. If you specify
  /// TotalSegments, you must also specify Segment.
  @JsonKey(name: 'TotalSegments')
  final int totalSegments;

  /// For a parallel Scan request, Segment identifies an individual segment to
  /// be scanned by an application worker. Segment IDs are zero-based, so the
  /// first segment is always 0. For example, if you want to use four application
  /// threads to scan a table or an index, then the first thread specifies a
  /// Segment value of 0, the second thread specifies 1, and so on. The value
  /// of LastEvaluatedKey returned from a parallel Scan request must be used
  /// as ExclusiveStartKey with the same segment ID in a subsequent Scan operation.
  /// The value for Segment must be greater than or equal to 0, and less than
  /// the value provided for TotalSegments. If you provide Segment, you must
  /// also provide TotalSegments.
  @JsonKey(name: 'Segment')
  final int segment;

  /// A string that identifies one or more attributes to retrieve from the specified
  /// table or index. These attributes can include scalars, sets, or elements
  /// of a JSON document. The attributes in the expression must be separated
  /// by commas. If no attribute names are specified, then all attributes will
  /// be returned. If any of the requested attributes are not found, they will
  /// not appear in the result. For more information, see Specifying Item Attributes
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  /// A string that contains conditions that DynamoDB applies after the Scan
  /// operation, but before the data is returned to you. Items that do not satisfy
  /// the FilterExpression criteria are not returned.  A FilterExpression is
  /// applied after the items have already been read; the process of filtering
  /// does not consume any additional read capacity units.  For more information,
  /// see Filter Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'FilterExpression')
  final String filterExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide). To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information on expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression. Use the :
  /// (colon) character in an expression to dereference an attribute value. For
  /// example, suppose that you wanted to check whether the value of the ProductStatus
  /// attribute was one of the following:   Available | Backordered | Discontinued
  ///  You would first need to specify ExpressionAttributeValues as follows:
  ///  { ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"}
  /// }  You could then use these values in an expression, such as this:  ProductStatus
  /// IN (:avail, :back, :disc)  For more information on expression attribute
  /// values, see Condition Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// A Boolean value that determines the read consistency model during the scan:
  ///   If ConsistentRead is false, then the data returned from Scan might not
  /// contain the results from other recently completed write operations (PutItem,
  /// UpdateItem, or DeleteItem).   If ConsistentRead is true, then all of the
  /// write operations that completed before the Scan began are guaranteed to
  /// be contained in the Scan response.   The default setting for ConsistentRead
  /// is false. The ConsistentRead parameter is not supported on global secondary
  /// indexes. If you scan a global secondary index with ConsistentRead set to
  /// true, you will receive a ValidationException.
  @JsonKey(name: 'ConsistentRead')
  final bool consistentRead;

  ScanInput({
    @required this.tableName,
    this.indexName,
    this.attributesToGet,
    this.limit,
    this.select,
    this.scanFilter,
    this.conditionalOperator,
    this.exclusiveStartKey,
    this.returnConsumedCapacity,
    this.totalSegments,
    this.segment,
    this.projectionExpression,
    this.filterExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.consistentRead,
  });

  factory ScanInput.fromJson(Map<String, dynamic> json) =>
      _$ScanInputFromJson(json);

  Map<String, dynamic> toJson() => _$ScanInputToJson(this);
}

/// Represents the output of a Scan operation.
@JsonSerializable()
class ScanOutput {
  /// An array of item attributes that match the scan criteria. Each element
  /// in this array consists of an attribute name and the value for that attribute.
  @JsonKey(name: 'Items')
  final List<Map<String, AttributeValue>> items;

  /// The number of items in the response. If you set ScanFilter in the request,
  /// then Count is the number of items returned after the filter was applied,
  /// and ScannedCount is the number of matching items before the filter was
  /// applied. If you did not use a filter in the request, then Count is the
  /// same as ScannedCount.
  @JsonKey(name: 'Count')
  final int count;

  /// The number of items evaluated, before any ScanFilter is applied. A high
  /// ScannedCount value with few, or no, Count results indicates an inefficient
  /// Scan operation. For more information, see Count and ScannedCount in the
  /// Amazon DynamoDB Developer Guide. If you did not use a filter in the request,
  /// then ScannedCount is the same as Count.
  @JsonKey(name: 'ScannedCount')
  final int scannedCount;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request. If LastEvaluatedKey is empty, then the "last
  /// page" of results has been processed and there is no more data to be retrieved.
  /// If LastEvaluatedKey is not empty, it does not necessarily mean that there
  /// is more data in the result set. The only way to know when you have reached
  /// the end of the result set is when LastEvaluatedKey is empty.
  @JsonKey(name: 'LastEvaluatedKey')
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The capacity units consumed by the Scan operation. The data returned includes
  /// the total provisioned throughput consumed, along with statistics for the
  /// table and any indexes involved in the operation. ConsumedCapacity is only
  /// returned if the ReturnConsumedCapacity parameter was specified. For more
  /// information, see Provisioned Throughput in the Amazon DynamoDB Developer
  /// Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  ScanOutput({
    this.items,
    this.count,
    this.scannedCount,
    this.lastEvaluatedKey,
    this.consumedCapacity,
  });

  factory ScanOutput.fromJson(Map<String, dynamic> json) =>
      _$ScanOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ScanOutputToJson(this);
}

/// Contains the details of the table when the backup was created.
@JsonSerializable()
class SourceTableDetails {
  /// The name of the table for which the backup was created.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Unique identifier for the table for which the backup was created.
  @JsonKey(name: 'TableId')
  final String tableId;

  /// Schema of the table.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Time when the source table was created.
  @JsonKey(name: 'TableCreationDateTime')
  final String tableCreationDateTime;

  /// Read IOPs and Write IOPS on the table when the backup was created.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  /// ARN of the table for which backup was created.
  @JsonKey(name: 'TableArn')
  final String tableArn;

  /// Size of the table in bytes. Please note this is an approximate value.
  @JsonKey(name: 'TableSizeBytes')
  final int tableSizeBytes;

  /// Number of items in the table. Please note this is an approximate value.
  @JsonKey(name: 'ItemCount')
  final int itemCount;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.    PROVISIONED - Sets
  /// the read/write capacity mode to PROVISIONED. We recommend using PROVISIONED
  /// for predictable workloads.    PAY_PER_REQUEST - Sets the read/write capacity
  /// mode to PAY_PER_REQUEST. We recommend using PAY_PER_REQUEST for unpredictable
  /// workloads.
  @JsonKey(name: 'BillingMode')
  final String billingMode;

  SourceTableDetails({
    @required this.tableName,
    @required this.tableId,
    @required this.keySchema,
    @required this.tableCreationDateTime,
    @required this.provisionedThroughput,
    this.tableArn,
    this.tableSizeBytes,
    this.itemCount,
    this.billingMode,
  });

  factory SourceTableDetails.fromJson(Map<String, dynamic> json) =>
      _$SourceTableDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SourceTableDetailsToJson(this);
}

/// Contains the details of the features enabled on the table when the backup
/// was created. For example, LSIs, GSIs, streams, TTL.
@JsonSerializable()
class SourceTableFeatureDetails {
  /// Represents the LSI properties for the table when the backup was created.
  /// It includes the IndexName, KeySchema and Projection for the LSIs on the
  /// table at the time of backup.
  @JsonKey(name: 'LocalSecondaryIndexes')
  final List<LocalSecondaryIndexInfo> localSecondaryIndexes;

  /// Represents the GSI properties for the table when the backup was created.
  /// It includes the IndexName, KeySchema, Projection and ProvisionedThroughput
  /// for the GSIs on the table at the time of backup.
  @JsonKey(name: 'GlobalSecondaryIndexes')
  final List<GlobalSecondaryIndexInfo> globalSecondaryIndexes;

  /// Stream settings on the table when the backup was created.
  @JsonKey(name: 'StreamDescription')
  final StreamSpecification streamDescription;

  /// Time to Live settings on the table when the backup was created.
  @JsonKey(name: 'TimeToLiveDescription')
  final TimeToLiveDescription timeToLiveDescription;

  /// The description of the server-side encryption status on the table when
  /// the backup was created.
  @JsonKey(name: 'SSEDescription')
  final SSEDescription sSEDescription;

  SourceTableFeatureDetails({
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
    this.streamDescription,
    this.timeToLiveDescription,
    this.sSEDescription,
  });

  factory SourceTableFeatureDetails.fromJson(Map<String, dynamic> json) =>
      _$SourceTableFeatureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SourceTableFeatureDetailsToJson(this);
}

/// Represents the DynamoDB Streams configuration for a table in DynamoDB.
@JsonSerializable()
class StreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled (true) or disabled (false)
  /// on the table.
  @JsonKey(name: 'StreamEnabled')
  final bool streamEnabled;

  /// When an item in the table is modified, StreamViewType determines what information
  /// is written to the stream for this table. Valid values for StreamViewType
  /// are:    KEYS_ONLY - Only the key attributes of the modified item are written
  /// to the stream.    NEW_IMAGE - The entire item, as it appears after it was
  /// modified, is written to the stream.    OLD_IMAGE - The entire item, as
  /// it appeared before it was modified, is written to the stream.    NEW_AND_OLD_IMAGES
  /// - Both the new and the old item images of the item are written to the stream.
  ///
  @JsonKey(name: 'StreamViewType')
  final String streamViewType;

  StreamSpecification({
    this.streamEnabled,
    this.streamViewType,
  });

  factory StreamSpecification.fromJson(Map<String, dynamic> json) =>
      _$StreamSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$StreamSpecificationToJson(this);
}

/// Represents the properties of a table.
@JsonSerializable()
class TableDescription {
  /// An array of AttributeDefinition objects. Each of these objects describes
  /// one attribute in the table and index key schema. Each AttributeDefinition
  /// object in this array is composed of:    AttributeName - The name of the
  /// attribute.    AttributeType - The data type for the attribute.
  @JsonKey(name: 'AttributeDefinitions')
  final List<AttributeDefinition> attributeDefinitions;

  /// The name of the table.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// The primary key structure for the table. Each KeySchemaElement consists
  /// of:    AttributeName - The name of the attribute.    KeyType - The role
  /// of the attribute:    HASH - partition key    RANGE - sort key    The partition
  /// key of an item is also known as its hash attribute. The term "hash attribute"
  /// derives from DynamoDB's usage of an internal hash function to evenly distribute
  /// data items across partitions, based on their partition key values. The
  /// sort key of an item is also known as its range attribute. The term "range
  /// attribute" derives from the way DynamoDB stores items with the same partition
  /// key physically close together, in sorted order by the sort key value.
  ///   For more information about primary keys, see Primary Key in the Amazon
  /// DynamoDB Developer Guide.
  @JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// The current state of the table:    CREATING - The table is being created.
  ///    UPDATING - The table is being updated.    DELETING - The table is being
  /// deleted.    ACTIVE - The table is ready for use.
  @JsonKey(name: 'TableStatus')
  final String tableStatus;

  /// The date and time when the table was created, in UNIX epoch time format.
  @JsonKey(name: 'CreationDateTime')
  final String creationDateTime;

  /// The provisioned throughput settings for the table, consisting of read and
  /// write capacity units, along with data about increases and decreases.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughputDescription provisionedThroughput;

  /// The total size of the specified table, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  @JsonKey(name: 'TableSizeBytes')
  final int tableSizeBytes;

  /// The number of items in the specified table. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  @JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the table.
  @JsonKey(name: 'TableArn')
  final String tableArn;

  /// Unique identifier for the table for which the backup was created.
  @JsonKey(name: 'TableId')
  final String tableId;

  /// Contains the details for the read/write capacity mode.
  @JsonKey(name: 'BillingModeSummary')
  final BillingModeSummary billingModeSummary;

  /// Represents one or more local secondary indexes on the table. Each index
  /// is scoped to a given partition key value. Tables with one or more local
  /// secondary indexes are subject to an item collection size limit, where the
  /// amount of data within a given item collection cannot exceed 10 GB. Each
  /// element is composed of:    IndexName - The name of the local secondary
  /// index.    KeySchema - Specifies the complete index key schema. The attribute
  /// names in the key schema must be between 1 and 255 characters (inclusive).
  /// The key schema must begin with the same partition key as the table.
  /// Projection - Specifies attributes that are copied (projected) from the
  /// table into the index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected. Each attribute
  /// specification is composed of:    ProjectionType - One of the following:
  ///    KEYS_ONLY - Only the index and primary keys are projected into the index.
  ///    INCLUDE - Only the specified table attributes are projected into the
  /// index. The list of projected attributes are in NonKeyAttributes.    ALL
  /// - All of the table attributes are projected into the index.      NonKeyAttributes
  /// - A list of one or more non-key attribute names that are projected into
  /// the secondary index. The total count of attributes provided in NonKeyAttributes,
  /// summed across all of the secondary indexes, must not exceed 20. If you
  /// project the same attribute into two different indexes, this counts as two
  /// distinct attributes when determining the total.      IndexSizeBytes - Represents
  /// the total size of the index, in bytes. DynamoDB updates this value approximately
  /// every six hours. Recent changes might not be reflected in this value.
  ///   ItemCount - Represents the number of items in the index. DynamoDB updates
  /// this value approximately every six hours. Recent changes might not be reflected
  /// in this value.   If the table is in the DELETING state, no information
  /// about indexes will be returned.
  @JsonKey(name: 'LocalSecondaryIndexes')
  final List<LocalSecondaryIndexDescription> localSecondaryIndexes;

  /// The global secondary indexes, if any, on the table. Each index is scoped
  /// to a given partition key value. Each element is composed of:    Backfilling
  /// - If true, then the index is currently in the backfilling phase. Backfilling
  /// occurs only when a new global secondary index is added to the table; it
  /// is the process by which DynamoDB populates the new index with data from
  /// the table. (This attribute does not appear for indexes that were created
  /// during a CreateTable operation.)    IndexName - The name of the global
  /// secondary index.    IndexSizeBytes - The total size of the global secondary
  /// index, in bytes. DynamoDB updates this value approximately every six hours.
  /// Recent changes might not be reflected in this value.     IndexStatus -
  /// The current status of the global secondary index:    CREATING - The index
  /// is being created.    UPDATING - The index is being updated.    DELETING
  /// - The index is being deleted.    ACTIVE - The index is ready for use.
  ///     ItemCount - The number of items in the global secondary index. DynamoDB
  /// updates this value approximately every six hours. Recent changes might
  /// not be reflected in this value.     KeySchema - Specifies the complete
  /// index key schema. The attribute names in the key schema must be between
  /// 1 and 255 characters (inclusive). The key schema must begin with the same
  /// partition key as the table.    Projection - Specifies attributes that are
  /// copied (projected) from the table into the index. These are in addition
  /// to the primary key attributes and index key attributes, which are automatically
  /// projected. Each attribute specification is composed of:    ProjectionType
  /// - One of the following:    KEYS_ONLY - Only the index and primary keys
  /// are projected into the index.    INCLUDE - Only the specified table attributes
  /// are projected into the index. The list of projected attributes are in NonKeyAttributes.
  ///    ALL - All of the table attributes are projected into the index.
  ///  NonKeyAttributes - A list of one or more non-key attribute names that
  /// are projected into the secondary index. The total count of attributes provided
  /// in NonKeyAttributes, summed across all of the secondary indexes, must not
  /// exceed 20. If you project the same attribute into two different indexes,
  /// this counts as two distinct attributes when determining the total.
  ///  ProvisionedThroughput - The provisioned throughput settings for the global
  /// secondary index, consisting of read and write capacity units, along with
  /// data about increases and decreases.    If the table is in the DELETING
  /// state, no information about indexes will be returned.
  @JsonKey(name: 'GlobalSecondaryIndexes')
  final List<GlobalSecondaryIndexDescription> globalSecondaryIndexes;

  /// The current DynamoDB Streams configuration for the table.
  @JsonKey(name: 'StreamSpecification')
  final StreamSpecification streamSpecification;

  /// A timestamp, in ISO 8601 format, for this stream. Note that LatestStreamLabel
  /// is not a unique identifier for the stream, because it is possible that
  /// a stream from another table might have the same timestamp. However, the
  /// combination of the following three elements is guaranteed to be unique:
  ///   the AWS customer ID.   the table name.   the StreamLabel.
  @JsonKey(name: 'LatestStreamLabel')
  final String latestStreamLabel;

  /// The Amazon Resource Name (ARN) that uniquely identifies the latest stream
  /// for this table.
  @JsonKey(name: 'LatestStreamArn')
  final String latestStreamArn;

  /// Contains details for the restore.
  @JsonKey(name: 'RestoreSummary')
  final RestoreSummary restoreSummary;

  /// The description of the server-side encryption status on the specified table.
  @JsonKey(name: 'SSEDescription')
  final SSEDescription sSEDescription;

  TableDescription({
    this.attributeDefinitions,
    this.tableName,
    this.keySchema,
    this.tableStatus,
    this.creationDateTime,
    this.provisionedThroughput,
    this.tableSizeBytes,
    this.itemCount,
    this.tableArn,
    this.tableId,
    this.billingModeSummary,
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
    this.streamSpecification,
    this.latestStreamLabel,
    this.latestStreamArn,
    this.restoreSummary,
    this.sSEDescription,
  });

  factory TableDescription.fromJson(Map<String, dynamic> json) =>
      _$TableDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$TableDescriptionToJson(this);
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to
/// a single DynamoDB table.   AWS-assigned tag names and values are automatically
/// assigned the aws: prefix, which the user cannot assign. AWS-assigned tag
/// names do not count towards the tag limit of 50. User-assigned tag names
/// have the prefix user: in the Cost Allocation Report. You cannot backdate
/// the application of a tag.  For an overview on tagging DynamoDB resources,
/// see Tagging for DynamoDB in the Amazon DynamoDB Developer Guide.
@JsonSerializable()
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each DynamoDB table can
  /// only have up to one tag with the same key. If you try to add an existing
  /// tag (same key), the existing tag value will be updated to the new value.
  @JsonKey(name: 'Key')
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  @JsonKey(name: 'Value')
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class TagResourceInput {
  /// Identifies the Amazon DynamoDB resource to which tags should be added.
  /// This value is an Amazon Resource Name (ARN).
  @JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The tags to be assigned to the Amazon DynamoDB resource.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  TagResourceInput({
    @required this.resourceArn,
    @required this.tags,
  });

  factory TagResourceInput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceInputFromJson(json);

  Map<String, dynamic> toJson() => _$TagResourceInputToJson(this);
}

/// The description of the Time to Live (TTL) status on the specified table.
@JsonSerializable()
class TimeToLiveDescription {
  /// The TTL status for the table.
  @JsonKey(name: 'TimeToLiveStatus')
  final String timeToLiveStatus;

  /// The name of the TTL attribute for items in the table.
  @JsonKey(name: 'AttributeName')
  final String attributeName;

  TimeToLiveDescription({
    this.timeToLiveStatus,
    this.attributeName,
  });

  factory TimeToLiveDescription.fromJson(Map<String, dynamic> json) =>
      _$TimeToLiveDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToLiveDescriptionToJson(this);
}

/// Represents the settings used to enable or disable Time to Live (TTL) for
/// the specified table.
@JsonSerializable()
class TimeToLiveSpecification {
  /// Indicates whether TTL is to be enabled (true) or disabled (false) on the
  /// table.
  @JsonKey(name: 'Enabled')
  final bool enabled;

  /// The name of the TTL attribute used to store the expiration time for items
  /// in the table.
  @JsonKey(name: 'AttributeName')
  final String attributeName;

  TimeToLiveSpecification({
    @required this.enabled,
    @required this.attributeName,
  });

  factory TimeToLiveSpecification.fromJson(Map<String, dynamic> json) =>
      _$TimeToLiveSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToLiveSpecificationToJson(this);
}

/// Specifies an item to be retrieved as part of the transaction.
@JsonSerializable()
class TransactGetItem {
  /// Contains the primary key that identifies the item to get, together with
  /// the name of the table that contains the item, and optionally the specific
  /// attributes of the item to retrieve.
  @JsonKey(name: 'Get')
  final Get get;

  TransactGetItem({
    @required this.get,
  });

  factory TransactGetItem.fromJson(Map<String, dynamic> json) =>
      _$TransactGetItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactGetItemToJson(this);
}

@JsonSerializable()
class TransactGetItemsInput {
  /// An ordered array of up to 25 TransactGetItem objects, each of which contains
  /// a Get structure.
  @JsonKey(name: 'TransactItems')
  final List<TransactGetItem> transactItems;

  /// A value of TOTAL causes consumed capacity information to be returned, and
  /// a value of NONE prevents that information from being returned. No other
  /// value is valid.
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  TransactGetItemsInput({
    @required this.transactItems,
    this.returnConsumedCapacity,
  });

  factory TransactGetItemsInput.fromJson(Map<String, dynamic> json) =>
      _$TransactGetItemsInputFromJson(json);

  Map<String, dynamic> toJson() => _$TransactGetItemsInputToJson(this);
}

@JsonSerializable()
class TransactGetItemsOutput {
  /// If the ReturnConsumedCapacity value was TOTAL, this is an array of ConsumedCapacity
  /// objects, one for each table addressed by TransactGetItem objects in the
  /// TransactItems parameter. These ConsumedCapacity objects report the read-capacity
  /// units consumed by the TransactGetItems call in that table.
  @JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// An ordered array of up to 25 ItemResponse objects, each of which corresponds
  /// to the TransactGetItem object in the same position in the TransactItems
  /// array. Each ItemResponse object contains a Map of the name-value pairs
  /// that are the projected attributes of the requested item. If a requested
  /// item could not be retrieved, the corresponding ItemResponse object is Null,
  /// or if the requested item has no projected attributes, the corresponding
  /// ItemResponse object is an empty Map.
  @JsonKey(name: 'Responses')
  final List<ItemResponse> responses;

  TransactGetItemsOutput({
    this.consumedCapacity,
    this.responses,
  });

  factory TransactGetItemsOutput.fromJson(Map<String, dynamic> json) =>
      _$TransactGetItemsOutputFromJson(json);

  Map<String, dynamic> toJson() => _$TransactGetItemsOutputToJson(this);
}

/// A list of requests that can perform update, put, delete, or check operations
/// on multiple items in one or more tables atomically.
@JsonSerializable()
class TransactWriteItem {
  /// A request to perform a check item operation.
  @JsonKey(name: 'ConditionCheck')
  final ConditionCheck conditionCheck;

  /// A request to perform a PutItem operation.
  @JsonKey(name: 'Put')
  final Put put;

  /// A request to perform a DeleteItem operation.
  @JsonKey(name: 'Delete')
  final Delete delete;

  /// A request to perform an UpdateItem operation.
  @JsonKey(name: 'Update')
  final Update update;

  TransactWriteItem({
    this.conditionCheck,
    this.put,
    this.delete,
    this.update,
  });

  factory TransactWriteItem.fromJson(Map<String, dynamic> json) =>
      _$TransactWriteItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactWriteItemToJson(this);
}

@JsonSerializable()
class TransactWriteItemsInput {
  /// An ordered array of up to 25 TransactWriteItem objects, each of which contains
  /// a ConditionCheck, Put, Update, or Delete object. These can operate on items
  /// in different tables, but the tables must reside in the same AWS account
  /// and Region, and no two of them can operate on the same item.
  @JsonKey(name: 'TransactItems')
  final List<TransactWriteItem> transactItems;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// Determines whether item collection metrics are returned. If set to SIZE,
  /// the response includes statistics about item collections (if any), that
  /// were modified during the operation and are returned in the response. If
  /// set to NONE (the default), no statistics are returned.
  @JsonKey(name: 'ReturnItemCollectionMetrics')
  final String returnItemCollectionMetrics;

  /// Providing a ClientRequestToken makes the call to TransactWriteItems idempotent,
  /// meaning that multiple identical calls have the same effect as one single
  /// call. Although multiple identical calls using the same client request token
  /// produce the same result on the server (no side effects), the responses
  /// to the calls might not be the same. If the ReturnConsumedCapacity> parameter
  /// is set, then the initial TransactWriteItems call returns the amount of
  /// write capacity units consumed in making the changes. Subsequent TransactWriteItems
  /// calls with the same client token return the number of read capacity units
  /// consumed in reading the item. A client request token is valid for 10 minutes
  /// after the first request that uses it is completed. After 10 minutes, any
  /// request with the same client token is treated as a new request. Do not
  /// resubmit the same request with the same client token for more than 10 minutes,
  /// or the result might not be idempotent. If you submit a request with the
  /// same client token but a change in other parameters within the 10-minute
  /// idempotency window, DynamoDB returns an IdempotentParameterMismatch exception.
  @JsonKey(name: 'ClientRequestToken')
  final String clientRequestToken;

  TransactWriteItemsInput({
    @required this.transactItems,
    this.returnConsumedCapacity,
    this.returnItemCollectionMetrics,
    this.clientRequestToken,
  });

  factory TransactWriteItemsInput.fromJson(Map<String, dynamic> json) =>
      _$TransactWriteItemsInputFromJson(json);

  Map<String, dynamic> toJson() => _$TransactWriteItemsInputToJson(this);
}

@JsonSerializable()
class TransactWriteItemsOutput {
  /// The capacity units consumed by the entire TransactWriteItems operation.
  /// The values of the list are ordered according to the ordering of the TransactItems
  /// request parameter.
  @JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// A list of tables that were processed by TransactWriteItems and, for each
  /// table, information about any item collections that were affected by individual
  /// UpdateItem, PutItem, or DeleteItem operations.
  @JsonKey(name: 'ItemCollectionMetrics')
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  TransactWriteItemsOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory TransactWriteItemsOutput.fromJson(Map<String, dynamic> json) =>
      _$TransactWriteItemsOutputFromJson(json);

  Map<String, dynamic> toJson() => _$TransactWriteItemsOutputToJson(this);
}

@JsonSerializable()
class UntagResourceInput {
  /// The DynamoDB resource that the tags will be removed from. This value is
  /// an Amazon Resource Name (ARN).
  @JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// A list of tag keys. Existing tags of the resource whose keys are members
  /// of this list will be removed from the DynamoDB resource.
  @JsonKey(name: 'TagKeys')
  final List<String> tagKeys;

  UntagResourceInput({
    @required this.resourceArn,
    @required this.tagKeys,
  });

  factory UntagResourceInput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceInputFromJson(json);

  Map<String, dynamic> toJson() => _$UntagResourceInputToJson(this);
}

/// Represents a request to perform an UpdateItem operation.
@JsonSerializable()
class Update {
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// An expression that defines one or more attributes to be updated, the action
  /// to be performed on them, and new value(s) for them.
  @JsonKey(name: 'UpdateExpression')
  final String updateExpression;

  /// Name of the table for the UpdateItem request.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use ReturnValuesOnConditionCheckFailure to get the item attributes if the
  /// Update condition fails. For ReturnValuesOnConditionCheckFailure, the valid
  /// values are: NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW.
  @JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final String returnValuesOnConditionCheckFailure;

  Update({
    @required this.key,
    @required this.updateExpression,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@JsonSerializable()
class UpdateContinuousBackupsInput {
  /// The name of the table.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Represents the settings used to enable point in time recovery.
  @JsonKey(name: 'PointInTimeRecoverySpecification')
  final PointInTimeRecoverySpecification pointInTimeRecoverySpecification;

  UpdateContinuousBackupsInput({
    @required this.tableName,
    @required this.pointInTimeRecoverySpecification,
  });

  factory UpdateContinuousBackupsInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateContinuousBackupsInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateContinuousBackupsInputToJson(this);
}

@JsonSerializable()
class UpdateContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on
  /// the table.
  @JsonKey(name: 'ContinuousBackupsDescription')
  final ContinuousBackupsDescription continuousBackupsDescription;

  UpdateContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });

  factory UpdateContinuousBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateContinuousBackupsOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateContinuousBackupsOutputToJson(this);
}

/// Represents the new provisioned throughput settings to be applied to a global
/// secondary index.
@JsonSerializable()
class UpdateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be updated.
  @JsonKey(name: 'IndexName')
  final String indexName;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index. For current minimum and maximum provisioned throughput
  /// values, see Limits in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  UpdateGlobalSecondaryIndexAction({
    @required this.indexName,
    @required this.provisionedThroughput,
  });

  factory UpdateGlobalSecondaryIndexAction.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateGlobalSecondaryIndexActionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateGlobalSecondaryIndexActionToJson(this);
}

@JsonSerializable()
class UpdateGlobalTableInput {
  /// The global table name.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// A list of Regions that should be added or removed from the global table.
  @JsonKey(name: 'ReplicaUpdates')
  final List<ReplicaUpdate> replicaUpdates;

  UpdateGlobalTableInput({
    @required this.globalTableName,
    @required this.replicaUpdates,
  });

  factory UpdateGlobalTableInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGlobalTableInputToJson(this);
}

@JsonSerializable()
class UpdateGlobalTableOutput {
  /// Contains the details of the global table.
  @JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  UpdateGlobalTableOutput({
    this.globalTableDescription,
  });

  factory UpdateGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGlobalTableOutputToJson(this);
}

@JsonSerializable()
class UpdateGlobalTableSettingsInput {
  /// The name of the global table
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The billing mode of the global table. If GlobalTableBillingMode is not
  /// specified, the global table defaults to PROVISIONED capacity billing mode.
  @JsonKey(name: 'GlobalTableBillingMode')
  final String globalTableBillingMode;

  /// The maximum number of writes consumed per second before DynamoDB returns
  /// a ThrottlingException.
  @JsonKey(name: 'GlobalTableProvisionedWriteCapacityUnits')
  final int globalTableProvisionedWriteCapacityUnits;

  /// Auto scaling settings for managing provisioned write capacity for the global
  /// table.
  @JsonKey(name: 'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate;

  /// Represents the settings of a global secondary index for a global table
  /// that will be modified.
  @JsonKey(name: 'GlobalTableGlobalSecondaryIndexSettingsUpdate')
  final List<GlobalTableGlobalSecondaryIndexSettingsUpdate>
      globalTableGlobalSecondaryIndexSettingsUpdate;

  /// Represents the settings for a global table in a Region that will be modified.
  @JsonKey(name: 'ReplicaSettingsUpdate')
  final List<ReplicaSettingsUpdate> replicaSettingsUpdate;

  UpdateGlobalTableSettingsInput({
    @required this.globalTableName,
    this.globalTableBillingMode,
    this.globalTableProvisionedWriteCapacityUnits,
    this.globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
    this.globalTableGlobalSecondaryIndexSettingsUpdate,
    this.replicaSettingsUpdate,
  });

  factory UpdateGlobalTableSettingsInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableSettingsInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGlobalTableSettingsInputToJson(this);
}

@JsonSerializable()
class UpdateGlobalTableSettingsOutput {
  /// The name of the global table.
  @JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Region-specific settings for the global table.
  @JsonKey(name: 'ReplicaSettings')
  final List<ReplicaSettingsDescription> replicaSettings;

  UpdateGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });

  factory UpdateGlobalTableSettingsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableSettingsOutputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateGlobalTableSettingsOutputToJson(this);
}

/// Represents the input of an UpdateItem operation.
@JsonSerializable()
class UpdateItemInput {
  /// The name of the table containing the item to update.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute. For the primary key, you
  /// must provide all of the attributes. For example, with a simple primary
  /// key, you only need to provide a value for the partition key. For a composite
  /// primary key, you must provide values for both the partition key and the
  /// sort key.
  @JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// This is a legacy parameter. Use UpdateExpression instead. For more information,
  /// see AttributeUpdates in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'AttributeUpdates')
  final Map<String, AttributeValueUpdate> attributeUpdates;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see Expected in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'Expected')
  final Map<String, ExpectedAttributeValue> expected;

  /// This is a legacy parameter. Use ConditionExpression instead. For more information,
  /// see ConditionalOperator in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionalOperator')
  final String conditionalOperator;

  /// Use ReturnValues if you want to get the item attributes as they appear
  /// before or after they are updated. For UpdateItem, the valid values are:
  ///    NONE - If ReturnValues is not specified, or if its value is NONE, then
  /// nothing is returned. (This setting is the default for ReturnValues.)
  ///  ALL_OLD - Returns all of the attributes of the item, as they appeared
  /// before the UpdateItem operation.    UPDATED_OLD - Returns only the updated
  /// attributes, as they appeared before the UpdateItem operation.    ALL_NEW
  /// - Returns all of the attributes of the item, as they appear after the UpdateItem
  /// operation.    UPDATED_NEW - Returns only the updated attributes, as they
  /// appear after the UpdateItem operation.   There is no additional cost associated
  /// with requesting a return value aside from the small network and processing
  /// overhead of receiving a larger response. No read capacity units are consumed.
  /// The values returned are strongly consistent.
  @JsonKey(name: 'ReturnValues')
  final String returnValues;
  @JsonKey(name: 'ReturnConsumedCapacity')
  final String returnConsumedCapacity;

  /// Determines whether item collection metrics are returned. If set to SIZE,
  /// the response includes statistics about item collections, if any, that were
  /// modified during the operation are returned in the response. If set to NONE
  /// (the default), no statistics are returned.
  @JsonKey(name: 'ReturnItemCollectionMetrics')
  final String returnItemCollectionMetrics;

  /// An expression that defines one or more attributes to be updated, the action
  /// to be performed on them, and new values for them. The following action
  /// values are available for UpdateExpression.    SET - Adds one or more attributes
  /// and values to an item. If any of these attributes already exist, they are
  /// replaced by the new values. You can also use SET to add or subtract from
  /// an attribute that is of type Number. For example: SET myNum = myNum + :val
  ///   SET supports the following functions:    if_not_exists (path, operand)
  /// - if the item does not contain an attribute at the specified path, then
  /// if_not_exists evaluates to operand; otherwise, it evaluates to path. You
  /// can use this function to avoid overwriting an attribute that may already
  /// be present in the item.    list_append (operand, operand) - evaluates to
  /// a list with a new element added to it. You can append the new element to
  /// the start or the end of the list by reversing the order of the operands.
  ///   These function names are case-sensitive.    REMOVE - Removes one or more
  /// attributes from an item.    ADD - Adds the specified value to the item,
  /// if the attribute does not already exist. If the attribute does exist, then
  /// the behavior of ADD depends on the data type of the attribute:   If the
  /// existing attribute is a number, and if Value is also a number, then Value
  /// is mathematically added to the existing attribute. If Value is a negative
  /// number, then it is subtracted from the existing attribute.  If you use
  /// ADD to increment or decrement a number value for an item that doesn't exist
  /// before the update, DynamoDB uses 0 as the initial value. Similarly, if
  /// you use ADD for an existing item to increment or decrement an attribute
  /// value that doesn't exist before the update, DynamoDB uses 0 as the initial
  /// value. For example, suppose that the item you want to update doesn't have
  /// an attribute named itemcount, but you decide to ADD the number 3 to this
  /// attribute anyway. DynamoDB will create the itemcount attribute, set its
  /// initial value to 0, and finally add 3 to it. The result will be a new itemcount
  /// attribute in the item, with a value of 3.    If the existing data type
  /// is a set and if Value is also a set, then Value is added to the existing
  /// set. For example, if the attribute value is the set [1,2], and the ADD
  /// action specified [3], then the final attribute value is [1,2,3]. An error
  /// occurs if an ADD action is specified for a set attribute and the attribute
  /// type specified does not match the existing set type.  Both sets must have
  /// the same primitive data type. For example, if the existing data type is
  /// a set of strings, the Value must also be a set of strings.    The ADD action
  /// only supports Number and set data types. In addition, ADD can only be used
  /// on top-level attributes, not nested attributes.     DELETE - Deletes an
  /// element from a set. If a set of values is specified, then those values
  /// are subtracted from the old set. For example, if the attribute value was
  /// the set [a,b,c] and the DELETE action specifies [a,c], then the final attribute
  /// value is [b]. Specifying an empty set is an error.  The DELETE action only
  /// supports set data types. In addition, DELETE can only be used on top-level
  /// attributes, not nested attributes.    You can have many actions in a single
  /// expression, such as the following: SET a=:value1, b=:value2 DELETE :value3,
  /// :value4, :value5  For more information on update expressions, see Modifying
  /// Items and Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'UpdateExpression')
  final String updateExpression;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed. An expression can contain any of the following:   Functions: attribute_exists
  /// | attribute_not_exists | attribute_type | contains | begins_with | size
  ///  These function names are case-sensitive.   Comparison operators: = | <>
  /// | < | > | <= | >= | BETWEEN | IN      Logical operators: AND | OR | NOT
  ///    For more information about condition expressions, see Specifying Conditions
  /// in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using ExpressionAttributeNames:   To access
  /// an attribute whose name conflicts with a DynamoDB reserved word.   To create
  /// a placeholder for repeating occurrences of an attribute name in an expression.
  ///   To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.   Use the # character in an expression to dereference
  /// an attribute name. For example, consider the following attribute name:
  ///    Percentile    The name of this attribute conflicts with a reserved word,
  /// so it cannot be used directly in an expression. (For the complete list
  /// of reserved words, see Reserved Words in the Amazon DynamoDB Developer
  /// Guide.) To work around this, you could specify the following for ExpressionAttributeNames:
  ///    {"#P":"Percentile"}    You could then use this substitution in an expression,
  /// as in this example:    #P = :val     Tokens that begin with the : character
  /// are expression attribute values, which are placeholders for the actual
  /// value at runtime.  For more information about expression attribute names,
  /// see Specifying Item Attributes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression. Use the :
  /// (colon) character in an expression to dereference an attribute value. For
  /// example, suppose that you wanted to check whether the value of the ProductStatus
  /// attribute was one of the following:   Available | Backordered | Discontinued
  ///  You would first need to specify ExpressionAttributeValues as follows:
  ///  { ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"}
  /// }  You could then use these values in an expression, such as this:  ProductStatus
  /// IN (:avail, :back, :disc)  For more information on expression attribute
  /// values, see Condition Expressions in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  UpdateItemInput({
    @required this.tableName,
    @required this.key,
    this.attributeUpdates,
    this.expected,
    this.conditionalOperator,
    this.returnValues,
    this.returnConsumedCapacity,
    this.returnItemCollectionMetrics,
    this.updateExpression,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
  });

  factory UpdateItemInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateItemInputToJson(this);
}

/// Represents the output of an UpdateItem operation.
@JsonSerializable()
class UpdateItemOutput {
  /// A map of attribute values as they appear before or after the UpdateItem
  /// operation, as determined by the ReturnValues parameter. The Attributes
  /// map is only present if ReturnValues was specified as something other than
  /// NONE in the request. Each element represents one attribute.
  @JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the UpdateItem operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation. ConsumedCapacity
  /// is only returned if the ReturnConsumedCapacity parameter was specified.
  /// For more information, see Provisioned Throughput in the Amazon DynamoDB
  /// Developer Guide.
  @JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the UpdateItem
  /// operation. ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics
  /// parameter was specified. If the table does not have any local secondary
  /// indexes, this information is not returned in the response. Each ItemCollectionMetrics
  /// element consists of:    ItemCollectionKey - The partition key value of
  /// the item collection. This is the same as the partition key value of the
  /// item itself.    SizeEstimateRangeGB - An estimate of item collection size,
  /// in gigabytes. This value is a two-element array containing a lower bound
  /// and an upper bound for the estimate. The estimate includes the size of
  /// all the items in the table, plus the size of all attributes projected into
  /// all of the local secondary indexes on that table. Use this estimate to
  /// measure whether a local secondary index is approaching its size limit.
  /// The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  @JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });

  factory UpdateItemOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateItemOutputToJson(this);
}

/// Represents the input of an UpdateTable operation.
@JsonSerializable()
class UpdateTableInput {
  /// The name of the table to be updated.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// An array of attributes that describe the key schema for the table and indexes.
  /// If you are adding a new global secondary index to the table, AttributeDefinitions
  /// must include the key element(s) of the new index.
  @JsonKey(name: 'AttributeDefinitions')
  final List<AttributeDefinition> attributeDefinitions;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. When switching from pay-per-request to provisioned capacity,
  /// initial provisioned capacity values must be set. The initial provisioned
  /// capacity values are estimated based on the consumed read and write capacity
  /// of your table and global secondary indexes over the past 30 minutes.
  ///  PROVISIONED - Sets the billing mode to PROVISIONED. We recommend using
  /// PROVISIONED for predictable workloads.    PAY_PER_REQUEST - Sets the billing
  /// mode to PAY_PER_REQUEST. We recommend using PAY_PER_REQUEST for unpredictable
  /// workloads.
  @JsonKey(name: 'BillingMode')
  final String billingMode;

  /// The new provisioned throughput settings for the specified table or index.
  @JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  /// An array of one or more global secondary indexes for the table. For each
  /// index in the array, you can request one action:    Create - add a new global
  /// secondary index to the table.    Update - modify the provisioned throughput
  /// settings of an existing global secondary index.    Delete - remove a global
  /// secondary index from the table.   For more information, see Managing Global
  /// Secondary Indexes in the Amazon DynamoDB Developer Guide.
  @JsonKey(name: 'GlobalSecondaryIndexUpdates')
  final List<GlobalSecondaryIndexUpdate> globalSecondaryIndexUpdates;

  /// Represents the DynamoDB Streams configuration for the table.  You receive
  /// a ResourceInUseException if you try to enable a stream on a table that
  /// already has a stream, or if you try to disable a stream on a table that
  /// doesn't have a stream.
  @JsonKey(name: 'StreamSpecification')
  final StreamSpecification streamSpecification;

  /// The new server-side encryption settings for the specified table.
  @JsonKey(name: 'SSESpecification')
  final SSESpecification sSESpecification;

  UpdateTableInput({
    @required this.tableName,
    this.attributeDefinitions,
    this.billingMode,
    this.provisionedThroughput,
    this.globalSecondaryIndexUpdates,
    this.streamSpecification,
    this.sSESpecification,
  });

  factory UpdateTableInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTableInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTableInputToJson(this);
}

/// Represents the output of an UpdateTable operation.
@JsonSerializable()
class UpdateTableOutput {
  /// Represents the properties of the table.
  @JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  UpdateTableOutput({
    this.tableDescription,
  });

  factory UpdateTableOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTableOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTableOutputToJson(this);
}

/// Represents the input of an UpdateTimeToLive operation.
@JsonSerializable()
class UpdateTimeToLiveInput {
  /// The name of the table to be configured.
  @JsonKey(name: 'TableName')
  final String tableName;

  /// Represents the settings used to enable or disable Time to Live for the
  /// specified table.
  @JsonKey(name: 'TimeToLiveSpecification')
  final TimeToLiveSpecification timeToLiveSpecification;

  UpdateTimeToLiveInput({
    @required this.tableName,
    @required this.timeToLiveSpecification,
  });

  factory UpdateTimeToLiveInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeToLiveInputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTimeToLiveInputToJson(this);
}

@JsonSerializable()
class UpdateTimeToLiveOutput {
  /// Represents the output of an UpdateTimeToLive operation.
  @JsonKey(name: 'TimeToLiveSpecification')
  final TimeToLiveSpecification timeToLiveSpecification;

  UpdateTimeToLiveOutput({
    this.timeToLiveSpecification,
  });

  factory UpdateTimeToLiveOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeToLiveOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTimeToLiveOutputToJson(this);
}

/// Represents an operation to perform - either DeleteItem or PutItem. You
/// can only request one of these operations, not both, in a single WriteRequest.
/// If you do need to perform both of these operations, you will need to provide
/// two separate WriteRequest objects.
@JsonSerializable()
class WriteRequest {
  /// A request to perform a PutItem operation.
  @JsonKey(name: 'PutRequest')
  final PutRequest putRequest;

  /// A request to perform a DeleteItem operation.
  @JsonKey(name: 'DeleteRequest')
  final DeleteRequest deleteRequest;

  WriteRequest({
    this.putRequest,
    this.deleteRequest,
  });

  factory WriteRequest.fromJson(Map<String, dynamic> json) =>
      _$WriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WriteRequestToJson(this);
}

class Base64Converter implements JsonConverter<String, String> {
  const Base64Converter();

  @override
  String fromJson(String json) => utf8.decode(base64Decode(json));

  @override
  String toJson(String object) => base64Encode(utf8.encode(object));
}

class Base64ListConverter implements JsonConverter<List<String>, List<String>> {
  const Base64ListConverter();

  @override
  List<String> fromJson(List<String> json) =>
      json.map((x) => utf8.decode(base64Decode(x))).toList(growable: false);

  @override
  List<String> toJson(List<String> object) =>
      object.map((x) => base64Encode(utf8.encode(x))).toList(growable: false);
}
