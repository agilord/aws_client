import 'package:aws_client/dynamo_document.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late DocumentClient doc;

  setUp(() => doc = localClient(DocumentClient.new));
  tearDown(() => doc.dynamoDB.close());

  Future<void> createTable(String name) => doc.dynamoDB.createTable(
        tableName: name,
        attributeDefinitions: [
          AttributeDefinition(
            attributeName: 'id',
            attributeType: ScalarAttributeType.s,
          ),
        ],
        keySchema: [
          KeySchemaElement(attributeName: 'id', keyType: KeyType.hash),
        ],
        provisionedThroughput: ProvisionedThroughput(
          readCapacityUnits: 1,
          writeCapacityUnits: 1,
        ),
      );

  test('DocumentClient preserves int vs double on number round-trip', () async {
    final tableName = uniqueName('doc');
    await createTable(tableName);

    await doc.put(
      tableName: tableName,
      item: {
        'id': 'numbers',
        'anInt': 42,
        'aDouble': 42.5,
        'numberSet': [1, 2, 3],
      },
    );

    final got = await doc.get(
      tableName: tableName,
      key: {'id': 'numbers'},
      consistentRead: true,
    );
    final item = got.item;

    expect(item['anInt'], isA<int>());
    expect(item['anInt'], equals(42));
    expect(item['aDouble'], isA<double>());
    expect(item['aDouble'], equals(42.5));
    // NS is an unordered set; assert membership, not order.
    expect(item['numberSet'], unorderedEquals([1, 2, 3]));
    expect((item['numberSet'] as List).every((e) => e is int), isTrue);

    await doc.dynamoDB.deleteTable(tableName: tableName);
  });
}
