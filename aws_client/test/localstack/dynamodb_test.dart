import 'dart:typed_data';

import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late DynamoDB dynamo;

  setUp(() => dynamo = localClient(DynamoDB.new));
  tearDown(() => dynamo.close());

  Future<void> createTable(
    String name, {
    List<AttributeDefinition>? attributes,
    List<KeySchemaElement>? keySchema,
  }) =>
      dynamo.createTable(
        tableName: name,
        attributeDefinitions: attributes ??
            [
              AttributeDefinition(
                attributeName: 'id',
                attributeType: ScalarAttributeType.s,
              ),
            ],
        keySchema: keySchema ??
            [KeySchemaElement(attributeName: 'id', keyType: KeyType.hash)],
        provisionedThroughput: ProvisionedThroughput(
          readCapacityUnits: 1,
          writeCapacityUnits: 1,
        ),
      );

  test('DynamoDB (json): create table, put item, read it back', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    final tables = await dynamo.listTables();
    expect(tables.tableNames, contains(tableName));

    await dynamo.putItem(
      tableName: tableName,
      item: {
        'id': AttributeValue(s: 'item-1'),
        'count': AttributeValue(n: '42'),
      },
    );

    final got = await dynamo.getItem(
      tableName: tableName,
      key: {'id': AttributeValue(s: 'item-1')},
      consistentRead: true,
    );
    expect(got.item, isNotNull);
    expect(got.item!['count']!.n, equals('42'));

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): round-trips nested and typed attribute values',
      () async {
    final tableName = uniqueName();
    await createTable(tableName);

    await dynamo.putItem(
      tableName: tableName,
      item: {
        'id': AttributeValue(s: 'rich'),
        'unicode': AttributeValue(s: 'héllo-🚀'),
        'int': AttributeValue(n: '42'),
        'double': AttributeValue(n: '3.14159'),
        'flag': AttributeValue(boolValue: true),
        'nothing': AttributeValue(nullValue: true),
        'strings': AttributeValue(ss: ['a', 'b']),
        'bytes': AttributeValue(b: Uint8List.fromList([1, 2, 3])),
        'list': AttributeValue(
          l: [AttributeValue(n: '1'), AttributeValue(s: 'two')],
        ),
        'nested': AttributeValue(m: {
          'inner': AttributeValue(s: 'value'),
          'deep': AttributeValue(l: [AttributeValue(boolValue: false)]),
        }),
      },
    );

    final got = await dynamo.getItem(
      tableName: tableName,
      key: {'id': AttributeValue(s: 'rich')},
      consistentRead: true,
    );
    final item = got.item!;
    expect(item['unicode']!.s, equals('héllo-🚀'));
    expect(item['int']!.n, equals('42'));
    expect(item['double']!.n, equals('3.14159'));
    expect(item['flag']!.boolValue, isTrue);
    expect(item['nothing']!.nullValue, isTrue);
    expect(item['strings']!.ss, containsAll(['a', 'b']));
    expect(item['bytes']!.b, equals(Uint8List.fromList([1, 2, 3])));
    expect(item['list']!.l!.map((e) => e.n ?? e.s), equals(['1', 'two']));
    expect(item['nested']!.m!['inner']!.s, equals('value'));
    expect(item['nested']!.m!['deep']!.l!.first.boolValue, isFalse);

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): query with a key expression, paginated', () async {
    final tableName = uniqueName();
    await createTable(
      tableName,
      attributes: [
        AttributeDefinition(
            attributeName: 'pk', attributeType: ScalarAttributeType.s),
        AttributeDefinition(
            attributeName: 'sk', attributeType: ScalarAttributeType.n),
      ],
      keySchema: [
        KeySchemaElement(attributeName: 'pk', keyType: KeyType.hash),
        KeySchemaElement(attributeName: 'sk', keyType: KeyType.range),
      ],
    );

    for (var i = 1; i <= 3; i++) {
      await dynamo.putItem(
        tableName: tableName,
        item: {'pk': AttributeValue(s: 'p'), 'sk': AttributeValue(n: '$i')},
      );
    }

    final firstPage = await dynamo.query(
      tableName: tableName,
      keyConditionExpression: 'pk = :p',
      expressionAttributeValues: {':p': AttributeValue(s: 'p')},
      limit: 2,
    );
    expect(firstPage.items, hasLength(2));
    expect(firstPage.lastEvaluatedKey, isNotNull);

    final secondPage = await dynamo.query(
      tableName: tableName,
      keyConditionExpression: 'pk = :p',
      expressionAttributeValues: {':p': AttributeValue(s: 'p')},
      exclusiveStartKey: firstPage.lastEvaluatedKey,
    );
    expect(secondPage.items, hasLength(1));

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): conditional put throws on an existing item', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    final item = {'id': AttributeValue(s: 'once')};
    await dynamo.putItem(tableName: tableName, item: item);

    await expectLater(
      dynamo.putItem(
        tableName: tableName,
        item: item,
        conditionExpression: 'attribute_not_exists(id)',
      ),
      throwsA(isA<ConditionalCheckFailedException>()),
    );

    await dynamo.deleteTable(tableName: tableName);
  });
}
