import '../../dynamo_db_2012_08_10.dart';
import '../shared/shared.dart';
import 'src/translator.dart';

export '../../dynamo_db_2012_08_10.dart';

/// The document client simplifies working with items in Amazon DynamoDB
/// by abstracting away the notion of attribute values. This abstraction
/// annotates native Dart types supplied as input parameters, as well
/// as converts annotated response data to native Dart types.
///
/// ## Marshalling Input and Unmarshalling Response Data
///
/// The document client affords developers the use of native Dart types
/// instead of `AttributeValue`s to simplify the Dart development
/// experience with Amazon DynamoDB. Dart objects passed in as parameters
/// are marshalled into `AttributeValue` shapes required by Amazon DynamoDB.
/// Responses from DynamoDB are unmarshalled into plain Dart objects
/// by the `DocumentClient`. The `DocumentClient`, does not accept
/// `AttributeValue`s in favor of native Dart types.
///
/// | Dart Type                                    | DynamoDB AttributeValue |
/// |:--------------------------------------------:|-------------------------|
/// | String                                       | S                       |
/// | int, double                                  | N                       |
/// | bool                                         | BOOL                    |
/// | null                                         | NULL                    |
/// | List<num>                                    | NS                      |
/// | List<Uint8List>                              | BS                      |
/// | Set<String>                                  | SS                      |
/// | List                                         | L                       |
/// | Map                                          | M                       |
/// | Uint8List                                    | B                       |
///
/// ## Support for Sets
///
/// The `DocumentClient` offers a convenient way to create sets from
/// Dart Arrays. The type of set is inferred from the first element
/// in the array. DynamoDB supports string, number, and binary sets. To
/// learn more about supported types see the
/// [Amazon DynamoDB Data Model Documentation](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html)
/// For more information see {AWS.DynamoDB.DocumentClient.createSet}
class DocumentClient {
  final DynamoDB dynamoDB;

  DocumentClient(
      {required String region,
      DynamoDB? dynamoDB,
      AwsClientCredentials? credentials,
      String? endpointUrl,
      Client? client})
      : dynamoDB = dynamoDB ??
            DynamoDB(
                region: region,
                credentials: credentials,
                endpointUrl: endpointUrl,
                client: client);

  /// Returns a set of attributes for the item with the given primary key by
  /// delegating to DynamoDB.getItem().
  Future<GetOutput> get({
    required String tableName,
    required Map<String, dynamic> key,
    List<String>? attributesToGet,
    bool? consistentRead,
    Map<String, String>? expressionAttributeNames,
    String? projectionExpression,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final getItemOutput = await dynamoDB.getItem(
        key: key.fromJsonToAttributeValue(),
        tableName: tableName,
        attributesToGet: attributesToGet,
        consistentRead: consistentRead,
        expressionAttributeNames: expressionAttributeNames,
        projectionExpression: projectionExpression,
        returnConsumedCapacity: returnConsumedCapacity);
    return GetOutput(
      getItemOutput.consumedCapacity,
      getItemOutput.item.toJson() ?? {},
    );
  }

  /// Returns the attributes of one or more items from one or more tables by
  /// delegating to DynamoDB.batchGetItem().
  Future<BatchGetOutput> batchGet({
    ReturnConsumedCapacity? returnConsumedCapacity,
    required Map<String, KeysAndProjection> requestItems,
  }) async {
    final ri = requestItems.map((k, v) => MapEntry(
        k,
        KeysAndAttributes(
          keys: v.keys.map((e) => e.fromJsonToAttributeValue()).toList(),
          projectionExpression: v.projectionExpression,
          consistentRead: v.consistentRead,
          expressionAttributeNames: v.expressionAttributeNames,
        )));
    final response = await dynamoDB.batchGetItem(
      requestItems: ri,
      returnConsumedCapacity: returnConsumedCapacity,
    );

    return BatchGetOutput(
      response.consumedCapacity ?? [],
      response.responses?.map(
            (k, v) => MapEntry(
              k,
              v.map((e) => e.toJson()).toList(),
            ),
          ) ??
          {},
      response.unprocessedKeys?.map(
            (k, v) => MapEntry(
              k,
              KeysAndProjection(
                  keys: v.keys.map((e) => e.toJson()).toList(),
                  expressionAttributeNames: v.expressionAttributeNames ?? {},
                  consistentRead: v.consistentRead ?? false,
                  projectionExpression: v.projectionExpression ?? ''),
            ),
          ) ??
          {},
    );
  }

  /// Puts or deletes multiple items in one or more tables by delegating to
  /// DynamoDB.batchWriteItem().
  Future<BatchWriteOutput> batchWrite({
    required Map<String, List<Write>> requestItems,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
  }) async {
    final ri = requestItems.map(
      (k, v) => MapEntry(
        k,
        v
            .map(
              (e) => WriteRequest(
                deleteRequest: e.deleteKey?.let((d) => DeleteRequest(
                      key: d.fromJsonToAttributeValue(),
                    )),
                putRequest: e.putItem?.let((p) => PutRequest(
                      item: p.fromJsonToAttributeValue(),
                    )),
              ),
            )
            .toList(),
      ),
    );
    final wr = await dynamoDB.batchWriteItem(
      requestItems: ri,
      returnConsumedCapacity: returnConsumedCapacity,
      returnItemCollectionMetrics: returnItemCollectionMetrics,
    );

    return BatchWriteOutput(
      consumedCapacity: wr.consumedCapacity ?? [],
      unprocessedItems: wr.unprocessedItems?.map((k, v) => MapEntry(
                k,
                v
                    .map((e) => Write(
                          deleteKey:
                              e.deleteRequest?.let((d) => d.key.toJson()),
                          putItem: e.putRequest?.let((p) => p.item.toJson()),
                        ))
                    .toList(),
              )) ??
          {},
      itemCollectionMetrics: wr.itemCollectionMetrics?.map((k, v) => MapEntry(
                k,
                v
                    .map((e) => ItemCollectionMetricsDC(
                          itemCollectionKey: e.itemCollectionKey.toJson() ?? {},
                          sizeEstimateRangeGB: e.sizeEstimateRangeGB,
                        ))
                    .toList(),
              )) ??
          {},
    );
  }

  /// Deletes a single item in a table by primary key by delegating to DynamoDB.deleteItem().
  Future<OperationOutput> delete({
    required Map<String, dynamic> key,
    required String tableName,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValueDC>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
  }) async {
    final dr = await dynamoDB.deleteItem(
      key: key.fromJsonToAttributeValue(),
      tableName: tableName,
      conditionExpression: conditionExpression,
      conditionalOperator: conditionalOperator,
      expected: expected?.map((key, value) => MapEntry(
          key,
          ExpectedAttributeValue(
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
            comparisonOperator: value.comparisonOperator,
            exists: value.exists,
            value: toAttributeValue(value.value),
          ))),
      expressionAttributeNames: expressionAttributeNames,
      expressionAttributeValues:
          expressionAttributeValues?.fromJsonToAttributeValue(),
      returnConsumedCapacity: returnConsumedCapacity,
      returnItemCollectionMetrics: returnItemCollectionMetrics,
      returnValues: returnValues,
    );

    return OperationOutput(
      attributes: dr.attributes.toJson() ?? {},
      consumedCapacity: dr.consumedCapacity,
      itemCollectionMetrics: ItemCollectionMetricsDC(
        itemCollectionKey:
            dr.itemCollectionMetrics?.itemCollectionKey?.toJson() ?? {},
        sizeEstimateRangeGB: dr.itemCollectionMetrics?.sizeEstimateRangeGB,
      ),
    );
  }

  /// Creates a new item, or replaces an old item with a new item by delegating to AWS.DynamoDB.putItem().
  Future<OperationOutput> put({
    required Map<String, dynamic> item,
    required String tableName,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValueDC>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
  }) async {
    final pr = await dynamoDB.putItem(
      item: item.fromJsonToAttributeValue(),
      tableName: tableName,
      conditionExpression: conditionExpression,
      conditionalOperator: conditionalOperator,
      expected: expected?.map((key, value) => MapEntry(
          key,
          ExpectedAttributeValue(
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
            comparisonOperator: value.comparisonOperator,
            exists: value.exists,
            value: toAttributeValue(value.value),
          ))),
      expressionAttributeNames: expressionAttributeNames,
      expressionAttributeValues:
          expressionAttributeValues?.fromJsonToAttributeValue(),
      returnConsumedCapacity: returnConsumedCapacity,
      returnItemCollectionMetrics: returnItemCollectionMetrics,
      returnValues: returnValues,
    );

    return OperationOutput(
      attributes: pr.attributes?.toJson() ?? {},
      consumedCapacity: pr.consumedCapacity,
      itemCollectionMetrics: ItemCollectionMetricsDC(
        itemCollectionKey:
            pr.itemCollectionMetrics?.itemCollectionKey?.toJson() ?? {},
        sizeEstimateRangeGB: pr.itemCollectionMetrics?.sizeEstimateRangeGB,
      ),
    );
  }

  /// Directly access items from a table by primary key or a secondary index.
  Future<QueryOutputDC> query({
    required String tableName,
    List<String>? attributesToGet,
    ConditionalOperator? conditionalOperator,
    bool? consistentRead,
    Map<String, dynamic>? exclusiveStartKey,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    String? filterExpression,
    String? indexName,
    String? keyConditionExpression,
    Map<String, ConditionDC>? keyConditions,
    int? limit,
    String? projectionExpression,
    Map<String, ConditionDC>? queryFilter,
    ReturnConsumedCapacity? returnConsumedCapacity,
    bool? scanIndexForward,
    Select? select,
  }) async {
    final qr = await dynamoDB.query(
      tableName: tableName,
      attributesToGet: attributesToGet,
      conditionalOperator: conditionalOperator,
      consistentRead: consistentRead,
      exclusiveStartKey: exclusiveStartKey?.fromJsonToAttributeValue(),
      expressionAttributeNames: expressionAttributeNames,
      expressionAttributeValues:
          expressionAttributeValues?.fromJsonToAttributeValue(),
      filterExpression: filterExpression,
      indexName: indexName,
      keyConditionExpression: keyConditionExpression,
      keyConditions: keyConditions?.map((key, value) => MapEntry(
          key,
          Condition(
            comparisonOperator: value.comparisonOperator,
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
          ))),
      limit: limit,
      projectionExpression: projectionExpression,
      queryFilter: queryFilter?.map((key, value) => MapEntry(
          key,
          Condition(
            comparisonOperator: value.comparisonOperator,
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
          ))),
      returnConsumedCapacity: returnConsumedCapacity,
      scanIndexForward: scanIndexForward,
      select: select,
    );

    return QueryOutputDC(
      consumedCapacity: qr.consumedCapacity,
      count: qr.count ?? 0,
      scannedCount: qr.scannedCount ?? 0,
      items: qr.items?.map((e) => e.toJson()).toList() ?? [],
      lastEvaluatedKey: qr.lastEvaluatedKey?.toJson() ?? {},
    );
  }

  /// Returns one or more items and item attributes by accessing every item in a table or a secondary index.
  Future<QueryOutputDC> scan({
    required String tableName,
    List<String>? attributesToGet,
    ConditionalOperator? conditionalOperator,
    bool? consistentRead,
    Map<String, dynamic>? exclusiveStartKey,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    String? filterExpression,
    String? indexName,
    int? limit,
    String? projectionExpression,
    ReturnConsumedCapacity? returnConsumedCapacity,
    Map<String, ConditionDC>? scanFilter,
    int? segment,
    Select? select,
    int? totalSegments,
  }) async {
    final sr = await dynamoDB.scan(
      tableName: tableName,
      attributesToGet: attributesToGet,
      conditionalOperator: conditionalOperator,
      consistentRead: consistentRead,
      exclusiveStartKey: exclusiveStartKey?.fromJsonToAttributeValue(),
      expressionAttributeNames: expressionAttributeNames,
      expressionAttributeValues:
          expressionAttributeValues?.fromJsonToAttributeValue(),
      filterExpression: filterExpression,
      indexName: indexName,
      limit: limit,
      projectionExpression: projectionExpression,
      returnConsumedCapacity: returnConsumedCapacity,
      scanFilter: scanFilter?.map((key, value) => MapEntry(
          key,
          Condition(
            comparisonOperator: value.comparisonOperator,
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
          ))),
      segment: segment,
      select: select,
      totalSegments: totalSegments,
    );

    return QueryOutputDC(
      consumedCapacity: sr.consumedCapacity,
      count: sr.count ?? 0,
      scannedCount: sr.scannedCount ?? 0,
      items: sr.items?.map((e) => e.toJson()).toList() ?? [],
      lastEvaluatedKey: sr.lastEvaluatedKey?.toJson() ?? {},
    );
  }

  /// Edits an existing item's attributes, or adds a new item to the table if it does not already exist by delegating to AWS.DynamoDB.updateItem().
  Future<OperationOutput> update({
    required Map<String, dynamic> key,
    required String tableName,
    Map<String, UpdateDC>? attributeUpdates,
    String? conditionExpression,
    ConditionalOperator? conditionalOperator,
    Map<String, ExpectedAttributeValueDC>? expected,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
    ReturnValue? returnValues,
    String? updateExpression,
  }) async {
    final ur = await dynamoDB.updateItem(
      key: key.fromJsonToAttributeValue(),
      tableName: tableName,
      attributeUpdates: attributeUpdates?.map((key, value) => MapEntry(
          key,
          AttributeValueUpdate(
              action: value.action, value: toAttributeValue(value.value)))),
      conditionExpression: conditionExpression,
      conditionalOperator: conditionalOperator,
      expected: expected?.map((key, value) => MapEntry(
          key,
          ExpectedAttributeValue(
            attributeValueList:
                value.attributeValueList.map(toAttributeValue).toList(),
            comparisonOperator: value.comparisonOperator,
            exists: value.exists,
            value: toAttributeValue(value.value),
          ))),
      expressionAttributeNames: expressionAttributeNames,
      expressionAttributeValues:
          expressionAttributeValues?.fromJsonToAttributeValue(),
      returnConsumedCapacity: returnConsumedCapacity,
      returnItemCollectionMetrics: returnItemCollectionMetrics,
      returnValues: returnValues,
      updateExpression: updateExpression,
    );

    return OperationOutput(
      attributes: ur.attributes?.toJson() ?? {},
      consumedCapacity: ur.consumedCapacity,
      itemCollectionMetrics: ItemCollectionMetricsDC(
        itemCollectionKey:
            ur.itemCollectionMetrics?.itemCollectionKey?.toJson() ?? {},
        sizeEstimateRangeGB: ur.itemCollectionMetrics?.sizeEstimateRangeGB,
      ),
    );
  }

  /// Atomically retrieves multiple items from one or more tables (but not from indexes) in a single account and region.
  Future<TransactGetOutput> transactGet({
    required List<GetDC> transactItems,
    ReturnConsumedCapacity? returnConsumedCapacity,
  }) async {
    final tgr = await dynamoDB.transactGetItems(
      transactItems: transactItems
          .map((e) => TransactGetItem(
                get: Get(
                  key: e.key.fromJsonToAttributeValue(),
                  tableName: e.tableName,
                  expressionAttributeNames: e.expressionAttributeNames,
                  projectionExpression: e.projectionExpression,
                ),
              ))
          .toList(),
      returnConsumedCapacity: returnConsumedCapacity,
    );

    return TransactGetOutput(
      consumedCapacity: tgr.consumedCapacity,
      responses:
          tgr.responses?.map((e) => e.item.toJson() ?? {}).toList() ?? [],
    );
  }

  /// Synchronous write operation that groups up to 10 action requests
  Future<void> transactWrite({
    required List<TransactWrite> transactItems,
    String? clientRequestToken,
    ReturnConsumedCapacity? returnConsumedCapacity,
    ReturnItemCollectionMetrics? returnItemCollectionMetrics,
  }) async {
    await dynamoDB.transactWriteItems(
      transactItems: transactItems
          .map((e) => TransactWriteItem(
                conditionCheck: e.conditionCheck?.let((e) => ConditionCheck(
                    tableName: e.tableName,
                    key: e.value.fromJsonToAttributeValue(),
                    conditionExpression: e.expression,
                    expressionAttributeNames: e.expressionAttributeNames,
                    expressionAttributeValues:
                        e.expressionAttributeValues.fromJsonToAttributeValue(),
                    returnValuesOnConditionCheckFailure:
                        e.returnValuesOnConditionCheckFailure)),
                delete: e.delete?.let((e) => Delete(
                    tableName: e.tableName,
                    key: e.value.fromJsonToAttributeValue(),
                    conditionExpression: e.expression,
                    expressionAttributeNames: e.expressionAttributeNames,
                    expressionAttributeValues:
                        e.expressionAttributeValues.fromJsonToAttributeValue(),
                    returnValuesOnConditionCheckFailure:
                        e.returnValuesOnConditionCheckFailure)),
                put: e.put?.let((e) => Put(
                    tableName: e.tableName,
                    item: e.value.fromJsonToAttributeValue(),
                    conditionExpression: e.expression,
                    expressionAttributeNames: e.expressionAttributeNames,
                    expressionAttributeValues:
                        e.expressionAttributeValues.fromJsonToAttributeValue(),
                    returnValuesOnConditionCheckFailure:
                        e.returnValuesOnConditionCheckFailure)),
                update: e.update?.let((e) => Update(
                    tableName: e.tableName,
                    key: e.value.fromJsonToAttributeValue(),
                    conditionExpression: e.expression,
                    updateExpression: e.updateExpression,
                    expressionAttributeNames: e.expressionAttributeNames,
                    expressionAttributeValues:
                        e.expressionAttributeValues.fromJsonToAttributeValue(),
                    returnValuesOnConditionCheckFailure:
                        e.returnValuesOnConditionCheckFailure)),
              ))
          .toList(),
      clientRequestToken: clientRequestToken,
      returnConsumedCapacity: returnConsumedCapacity,
      returnItemCollectionMetrics: returnItemCollectionMetrics,
    );
  }
}

class Operation {
  final String expression;
  final Map<String, dynamic> value;
  final String tableName;
  final Map<String, String>? expressionAttributeNames;
  final Map<String, dynamic>? expressionAttributeValues;
  final ReturnValuesOnConditionCheckFailure?
      returnValuesOnConditionCheckFailure;

  Operation({
    required this.value,
    required this.tableName,
    required this.expression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
}

class UpdateOperation extends Operation {
  final String updateExpression;

  UpdateOperation({
    required Map<String, dynamic> value,
    required String tableName,
    required String expression,
    required this.updateExpression,
    Map<String, String>? expressionAttributeNames,
    Map<String, dynamic>? expressionAttributeValues,
    ReturnValuesOnConditionCheckFailure? returnValuesOnConditionCheckFailure,
  }) : super(
          tableName: tableName,
          value: value,
          expression: expression,
          expressionAttributeNames: expressionAttributeNames,
          expressionAttributeValues: expressionAttributeValues,
          returnValuesOnConditionCheckFailure:
              returnValuesOnConditionCheckFailure,
        );
}

class TransactWrite {
  final Operation? conditionCheck;
  final Operation? delete;
  final Operation? put;
  final UpdateOperation? update;

  TransactWrite({
    this.conditionCheck,
    this.delete,
    this.put,
    this.update,
  }) {
    final nulls = [conditionCheck, delete, put, update].where((e) => e == null);
    if (nulls.length < 3) {
      throw ArgumentError(
          'Only one of the conditionCheck/delete/put/update fields can be set at the same time');
    }
  }
}

class TransactGetOutput {
  final List<Map<String, dynamic>> responses;
  final List<ConsumedCapacity>? consumedCapacity;

  TransactGetOutput({required this.responses, this.consumedCapacity});
}

class GetDC {
  final Map<String, dynamic> key;
  final String tableName;
  final Map<String, String> expressionAttributeNames;
  final String projectionExpression;

  GetDC({
    required this.key,
    required this.tableName,
    required this.expressionAttributeNames,
    required this.projectionExpression,
  });
}

class UpdateDC {
  final AttributeAction action;
  final dynamic value;

  UpdateDC(this.action, this.value);
}

class QueryOutputDC {
  final ConsumedCapacity? consumedCapacity;
  final int count;
  final List<Map<String, dynamic>> items;
  final Map<String, dynamic> lastEvaluatedKey;
  final int scannedCount;

  QueryOutputDC({
    required this.consumedCapacity,
    required this.count,
    required this.items,
    required this.lastEvaluatedKey,
    required this.scannedCount,
  });
}

class ConditionDC {
  final ComparisonOperator comparisonOperator;
  final List<dynamic> attributeValueList;

  ConditionDC({
    required this.comparisonOperator,
    required this.attributeValueList,
  });
}

class OperationOutput {
  final Map<String, dynamic> attributes;
  final ConsumedCapacity? consumedCapacity;
  final ItemCollectionMetricsDC itemCollectionMetrics;

  OperationOutput({
    required this.attributes,
    this.consumedCapacity,
    required this.itemCollectionMetrics,
  });
}

class ExpectedAttributeValueDC {
  final List<dynamic> attributeValueList;
  final ComparisonOperator comparisonOperator;
  final bool exists;
  final dynamic value;

  ExpectedAttributeValueDC({
    required this.attributeValueList,
    required this.comparisonOperator,
    required this.exists,
    this.value,
  });
}

class Write {
  final Map<String, dynamic>? putItem;
  final Map<String, dynamic>? deleteKey;

  Write({this.putItem, this.deleteKey}) {
    if (!(putItem == null || deleteKey == null)) {
      throw ArgumentError('Either putItem or deleteKey has to be null,'
          " both can't be set in the same Write object");
    }

    if (putItem == null && deleteKey == null) {
      throw ArgumentError('Either putItem or deleteKey has to be non null');
    }
  }
}

class BatchWriteOutput {
  final List<ConsumedCapacity> consumedCapacity;
  final Map<String, List<ItemCollectionMetricsDC>> itemCollectionMetrics;
  final Map<String, List<Write>> unprocessedItems;

  BatchWriteOutput({
    required this.consumedCapacity,
    required this.itemCollectionMetrics,
    required this.unprocessedItems,
  });
}

class ItemCollectionMetricsDC {
  final Map<String, dynamic> itemCollectionKey;
  final List<double>? sizeEstimateRangeGB;

  ItemCollectionMetricsDC(
      {required this.itemCollectionKey, this.sizeEstimateRangeGB});
}

class KeysAndProjection {
  final List<Map<String, dynamic>> keys;
  final bool? consistentRead;
  final Map<String, String>? expressionAttributeNames;
  final String? projectionExpression;

  KeysAndProjection({
    required this.keys,
    this.consistentRead,
    this.expressionAttributeNames,
    this.projectionExpression,
  });
}

class BatchGetOutput {
  final List<ConsumedCapacity> consumedCapacity;
  final Map<String, List<Map<String, dynamic>>> responses;
  final Map<String, KeysAndProjection> unprocessedKeys;

  BatchGetOutput(this.consumedCapacity, this.responses, this.unprocessedKeys);
}

class GetOutput {
  final ConsumedCapacity? consumedCapacity;
  final Map<String, dynamic> item;

  GetOutput(this.consumedCapacity, this.item);
}
