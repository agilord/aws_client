import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:shared_aws_api/shared.dart';
import 'package:document_client/src/translator.dart';

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
  /// by delegating to `AWS.DynamoDB.getItem()`.
  ///
  /// Supply the same parameters as DynamoDB.getItem with
  /// `AttributeValue`s substituted by native Dart types.
  ///
  /// @see AWS.DynamoDB.getItem
  /// @example Get an item from a table
  ///  var params = {
  ///    TableName : 'Table',
  ///    Key: {
  ///      'HashKey': 'hashkey'
  ///    }
  ///  };
  ///
  ///  var documentClient = DocumentClient();
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
}

class GetResponse {
  final ConsumedCapacity consumedCapacity;
  final dynamic item;

  GetResponse(this.consumedCapacity, this.item);
}
