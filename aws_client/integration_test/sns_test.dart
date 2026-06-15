import 'package:aws_client/sns_2010_03_31.dart';
import 'package:aws_client/sqs_2012_11_05.dart' show Sqs, QueueAttributeName;
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

    await sns.setTopicAttributes(
      topicArn: topicArn,
      attributeName: 'DisplayName',
      attributeValue: 'renamed-display',
    );
    final updated = await sns.getTopicAttributes(topicArn: topicArn);
    expect(updated.attributes?['DisplayName'], equals('renamed-display'));

    await sns.deleteTopic(topicArn: topicArn);
  });

  test('SNS (query): publish to an SQS subscriber end-to-end', () async {
    final topic = await sns.createTopic(name: uniqueName('topic'));
    final topicArn = topic.topicArn!;

    final sqs = localClient(Sqs.new);
    final queue = await sqs.createQueue(queueName: uniqueName('sub'));
    final queueUrl = queue.queueUrl!;
    final queueAttrs = await sqs.getQueueAttributes(
      queueUrl: queueUrl,
      attributeNames: [QueueAttributeName.queueArn],
    );
    final queueArn = queueAttrs.attributes![QueueAttributeName.queueArn]!;

    await sns.subscribe(
      topicArn: topicArn,
      protocol: 'sqs',
      endpoint: queueArn,
      attributes: {'RawMessageDelivery': 'true'},
      returnSubscriptionArn: true,
    );

    await sns.publish(
      topicArn: topicArn,
      message: 'fan-out-payload',
      messageAttributes: {
        'origin': MessageAttributeValue(
          dataType: 'String',
          stringValue: 'sns-test',
        ),
      },
    );

    final received = await sqs.receiveMessage(
      queueUrl: queueUrl,
      maxNumberOfMessages: 1,
      waitTimeSeconds: 10,
    );
    expect(received.messages, isNotEmpty);
    expect(received.messages!.first.body, equals('fan-out-payload'));

    await sqs.deleteQueue(queueUrl: queueUrl);
    await sns.deleteTopic(topicArn: topicArn);
    sqs.close();
  });
}
