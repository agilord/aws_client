import 'dart:typed_data';

import 'package:aws_client/dynamo_db.dart';
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

  test('DynamoDB (json): batch write then batch get items', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    await dynamo.batchWriteItem(requestItems: {
      tableName: [
        for (var i = 0; i < 3; i++)
          WriteRequest(
            putRequest: PutRequest(item: {
              'id': AttributeValue(s: 'k$i'),
              'n': AttributeValue(n: '$i'),
            }),
          ),
      ],
    });

    final got = await dynamo.batchGetItem(requestItems: {
      tableName: KeysAndAttributes(
        keys: [
          {'id': AttributeValue(s: 'k0')},
          {'id': AttributeValue(s: 'k2')},
        ],
        consistentRead: true,
      ),
    });
    final returned = got.responses![tableName]!;
    expect(returned, hasLength(2));
    expect(
      returned.map((m) => m['id']!.s).toSet(),
      equals({'k0', 'k2'}),
    );

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): updateItem with an update expression', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    await dynamo.putItem(
      tableName: tableName,
      item: {'id': AttributeValue(s: 'counter'), 'n': AttributeValue(n: '1')},
    );

    final updated = await dynamo.updateItem(
      tableName: tableName,
      key: {'id': AttributeValue(s: 'counter')},
      updateExpression: 'SET #n = #n + :inc',
      expressionAttributeNames: {'#n': 'n'},
      expressionAttributeValues: {':inc': AttributeValue(n: '4')},
      returnValues: ReturnValue.allNew,
    );
    expect(updated.attributes!['n']!.n, equals('5'));

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): scan with a filter expression', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    for (var i = 0; i < 5; i++) {
      await dynamo.putItem(
        tableName: tableName,
        item: {'id': AttributeValue(s: 's$i'), 'n': AttributeValue(n: '$i')},
      );
    }

    final scanned = await dynamo.scan(
      tableName: tableName,
      filterExpression: '#n >= :min',
      expressionAttributeNames: {'#n': 'n'},
      expressionAttributeValues: {':min': AttributeValue(n: '3')},
    );
    expect(scanned.items, hasLength(2));

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): describeTable reports schema and status', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    final described = await dynamo.describeTable(tableName: tableName);
    final table = described.table!;
    expect(table.tableName, equals(tableName));
    expect(
      table.keySchema!.map((k) => k.attributeName),
      contains('id'),
    );

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): transactWriteItems writes atomically', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    await dynamo.transactWriteItems(transactItems: [
      TransactWriteItem(
        put: Put(
          tableName: tableName,
          item: {'id': AttributeValue(s: 'tx-1')},
        ),
      ),
      TransactWriteItem(
        put: Put(
          tableName: tableName,
          item: {'id': AttributeValue(s: 'tx-2')},
        ),
      ),
    ]);

    final a = await dynamo.getItem(
      tableName: tableName,
      key: {'id': AttributeValue(s: 'tx-1')},
      consistentRead: true,
    );
    final b = await dynamo.getItem(
      tableName: tableName,
      key: {'id': AttributeValue(s: 'tx-2')},
      consistentRead: true,
    );
    expect(a.item, isNotNull);
    expect(b.item, isNotNull);

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): time-to-live status round-trips as an enum', () async {
    final tableName = uniqueName();
    await createTable(tableName);

    await dynamo.updateTimeToLive(
      tableName: tableName,
      timeToLiveSpecification:
          TimeToLiveSpecification(attributeName: 'ttl', enabled: true),
    );

    final described = await dynamo.describeTimeToLive(tableName: tableName);
    final status = described.timeToLiveDescription!.timeToLiveStatus;
    expect(
      status,
      anyOf(TimeToLiveStatus.enabled, TimeToLiveStatus.enabling),
    );

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): pay-per-request table reports billing and status',
      () async {
    final tableName = uniqueName();
    await dynamo.createTable(
      tableName: tableName,
      billingMode: BillingMode.payPerRequest,
      attributeDefinitions: [
        AttributeDefinition(
            attributeName: 'id', attributeType: ScalarAttributeType.s),
      ],
      keySchema: [
        KeySchemaElement(attributeName: 'id', keyType: KeyType.hash),
      ],
    );

    final described = await dynamo.describeTable(tableName: tableName);
    final table = described.table!;
    expect(
      table.tableStatus,
      anyOf(TableStatus.active, TableStatus.creating),
    );
    final mode = table.billingModeSummary?.billingMode;
    if (mode != null) {
      expect(mode, equals(BillingMode.payPerRequest));
    }

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): global secondary index reports projection and status',
      () async {
    final tableName = uniqueName();
    await dynamo.createTable(
      tableName: tableName,
      billingMode: BillingMode.payPerRequest,
      attributeDefinitions: [
        AttributeDefinition(
            attributeName: 'id', attributeType: ScalarAttributeType.s),
        AttributeDefinition(
            attributeName: 'gsiKey', attributeType: ScalarAttributeType.s),
      ],
      keySchema: [
        KeySchemaElement(attributeName: 'id', keyType: KeyType.hash),
      ],
      globalSecondaryIndexes: [
        GlobalSecondaryIndex(
          indexName: 'gsi1',
          keySchema: [
            KeySchemaElement(attributeName: 'gsiKey', keyType: KeyType.hash),
          ],
          projection: Projection(projectionType: ProjectionType.all),
        ),
      ],
    );

    final described = await dynamo.describeTable(tableName: tableName);
    final gsi = described.table!.globalSecondaryIndexes!.single;
    expect(gsi.indexName, equals('gsi1'));
    expect(gsi.projection!.projectionType, equals(ProjectionType.all));
    expect(IndexStatus.values, contains(gsi.indexStatus));

    await dynamo.deleteTable(tableName: tableName);
  });

  test('DynamoDB (json): stream specification reports the view-type enum',
      () async {
    final tableName = uniqueName();
    await dynamo.createTable(
      tableName: tableName,
      billingMode: BillingMode.payPerRequest,
      attributeDefinitions: [
        AttributeDefinition(
            attributeName: 'id', attributeType: ScalarAttributeType.s),
      ],
      keySchema: [
        KeySchemaElement(attributeName: 'id', keyType: KeyType.hash),
      ],
      streamSpecification: StreamSpecification(
        streamEnabled: true,
        streamViewType: StreamViewType.newAndOldImages,
      ),
    );

    final described = await dynamo.describeTable(tableName: tableName);
    final spec = described.table!.streamSpecification!;
    expect(spec.streamEnabled, isTrue);
    expect(spec.streamViewType, equals(StreamViewType.newAndOldImages));

    await dynamo.deleteTable(tableName: tableName);
  });
}
