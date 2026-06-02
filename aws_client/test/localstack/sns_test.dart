import 'package:aws_client/sns_2010_03_31.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Sns sns;

  setUp(() => sns = localClient(Sns.new));
  tearDown(() => sns.close());

  test('SNS (query): create topic, list it, publish a message', () async {
    final created = await sns.createTopic(name: uniqueName());
    final topicArn = created.topicArn!;

    final topics = await sns.listTopics();
    final arns = (topics.topics ?? []).map((t) => t.topicArn);
    expect(arns, contains(topicArn));

    final published =
        await sns.publish(topicArn: topicArn, message: 'hello-world');
    expect(published.messageId, isNotNull);

    await sns.deleteTopic(topicArn: topicArn);
  });

  test('SNS (query): topic attributes round-trip through entry maps', () async {
    final created = await sns.createTopic(
      name: uniqueName(),
      attributes: {'DisplayName': 'smoke-display'},
    );
    final topicArn = created.topicArn!;

    final attributes = await sns.getTopicAttributes(topicArn: topicArn);
    expect(attributes.attributes?['DisplayName'], equals('smoke-display'));

    await sns.deleteTopic(topicArn: topicArn);
  });
}
