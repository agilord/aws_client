import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:document_client/src/translator.dart';
import 'package:shared_aws_api/shared.dart';

export 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';

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
/// |                             Dart Type                                  | DynamoDB AttributeValue |
/// |:----------------------------------------------------------------------:|-------------------------|
/// | String                                                                 | S                       |
/// | int, double                                                            | N                       |
/// | bool                                                                   | BOOL                    |
/// | null                                                                   | NULL                    |
/// | List<num>                                                              | NS                      |
/// | List<Uint8List>                                                        | BS                      |
/// | List                                                                   | L                       |
/// | Map                                                                    | M                       |
/// | Uint8List                                                              | B                       |
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
  final DynamoDB _dynamoDB;

  DocumentClient(
      {@required String region,
      DynamoDB dynamoDB,
      AwsClientCredentials credentials,
      String endpointUrl,
      Client client})
      : _dynamoDB = dynamoDB ??
            DynamoDB(
                region: region,
                credentials: credentials,
                endpointUrl: endpointUrl,
                client: client);

  /// Returns a set of attributes for the item with the given primary key
  /// by delegating to `DynamoDB.getItem()`.
  ///
  /// Supply the same parameters as DynamoDB.getItem with
  /// `AttributeValue`s substituted by native Dart types.
  ///
  /// @see DynamoDB.getItem
  /// @example Get an item from a table
  ///
  ///  final documentClient = DocumentClient();
  ///
  ///  await documentClient.get(
  ///   tableName: 'Table',
  ///   key: {
  ///     'HashKey': 'hashkey'
  ///   }
  ///  );
  ///
  Future<GetResponse> get({
    @required String tableName,
    @required Map<String, dynamic> key,
    List<String> attributesToGet,
    bool consistentRead,
    Map<String, String> expressionAttributeNames,
    String projectionExpression,
    ReturnConsumedCapacity returnConsumedCapacity,
  }) async {
    final getItemOutput = await _dynamoDB.getItem(
        key: key.fromJsonToAttributeValue(),
        tableName: tableName,
        attributesToGet: attributesToGet,
        consistentRead: consistentRead,
        expressionAttributeNames: expressionAttributeNames,
        projectionExpression: projectionExpression,
        returnConsumedCapacity: returnConsumedCapacity);
    return GetResponse(
      getItemOutput.consumedCapacity,
      getItemOutput.item.toJson(),
    );
  }

  /// Returns the attributes of one or more items from one or more tables
  /// by delegating to `DynamoDB.batchGetItem()`.
  ///
  /// Supply the same parameters as {DynamoDB.batchGetItem} with
  /// `AttributeValue`s substituted by native Dart types.
  ///
  /// @see DynamoDB.batchGetItem
  /// @example Get items from multiple tables
  ///
  ///  final documentClient = DocumentClient();
  ///
  ///  final batchGetResponse = await documentClient.batchGet(
  ///    requestItems: {
  ///      'Table-1': KeysAndProjection(
  ///        keys: [
  ///          {
  ///            'HashKey': 'hashkey',
  ///            'NumberRangeKey': 1,
  ///          }
  ///        ],
  ///      ),
  ///      'Table-2': KeysAndProjection(
  ///        keys: [
  ///          {
  ///            'foo': 'bar',
  ///          }
  ///        ],
  ///      ),
  ///    },
  ///  );
  Future<BatchGetResponse> batchGet({
    ReturnConsumedCapacity returnConsumedCapacity,
    @required Map<String, KeysAndProjection> requestItems,
  }) async {
    final ri = requestItems.map((k, v) => MapEntry(
        k,
        KeysAndAttributes(
          keys: v.keys.map((e) => e.fromJsonToAttributeValue()).toList(),
          projectionExpression: v.projectionExpression,
          consistentRead: v.consistentRead,
          expressionAttributeNames: v.expressionAttributeNames,
        )));
    final response = await _dynamoDB.batchGetItem(
      requestItems: ri,
      returnConsumedCapacity: returnConsumedCapacity,
    );

    return BatchGetResponse(
      response.consumedCapacity,
      response.responses?.map(
        (k, v) => MapEntry(
          k,
          v.map((e) => e.toJson()).toList(),
        ),
      ),
      response.unprocessedKeys?.map(
        (k, v) => MapEntry(
          k,
          KeysAndProjection(
              keys: v.keys.map((e) => e.toJson()).toList(),
              expressionAttributeNames: v.expressionAttributeNames,
              consistentRead: v.consistentRead,
              projectionExpression: v.projectionExpression),
        ),
      ),
    );
  }
}

/// Represents a set of primary keys and, for each key, the attributes to
/// retrieve from the table.
///
/// For each primary key, you must provide <i>all</i> of the key attributes. For
/// example, with a simple primary key, you only need to provide the partition
/// key. For a composite primary key, you must provide <i>both</i> the partition
/// key and the sort key.
class KeysAndProjection {
  /// The primary key attribute values that define the items and the attributes
  /// associated with the items.
  final List<Map<String, dynamic>> keys;

  /// The consistency of a read operation. If set to <code>true</code>, then a
  /// strongly consistent read is used; otherwise, an eventually consistent read
  /// is used.
  final bool consistentRead;

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
  final Map<String, String> expressionAttributeNames;

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
  final String projectionExpression;

  KeysAndProjection({
    @required this.keys,
    this.consistentRead,
    this.expressionAttributeNames,
    this.projectionExpression,
  });
}

class BatchGetResponse {
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
  final List<ConsumedCapacity> consumedCapacity;

  /// A map of table name to a list of items. Each object in
  /// <code>Responses</code> consists of a table name, along with a map of
  /// attribute data consisting of the data type and attribute value.
  final Map<String, List<Map<String, dynamic>>> responses;

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
  final Map<String, KeysAndProjection> unprocessedKeys;

  BatchGetResponse(this.consumedCapacity, this.responses, this.unprocessedKeys);
}

class GetResponse {
  final ConsumedCapacity consumedCapacity;
  final Map<String, dynamic> item;

  GetResponse(this.consumedCapacity, this.item);
}
