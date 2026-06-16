import 'package:aws_client/sqs_2012_11_05.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Sqs sqs;

  setUp(() => sqs = localClient(Sqs.new));
  tearDown(() => sqs.close());

  test('SQS (json): create queue, send and receive a message', () async {
    final created = await sqs.createQueue(queueName: uniqueName());
    final queueUrl = created.queueUrl!;

    await sqs.sendMessage(queueUrl: queueUrl, messageBody: 'hello-world');

    final received = await sqs.receiveMessage(
      queueUrl: queueUrl,
      maxNumberOfMessages: 1,
      waitTimeSeconds: 5,
    );
    expect(received.messages, isNotEmpty);
    expect(received.messages!.first.body, equals('hello-world'));

    await sqs.deleteMessage(
      queueUrl: queueUrl,
      receiptHandle: received.messages!.first.receiptHandle!,
    );
    await sqs.deleteQueue(queueUrl: queueUrl);
  });

  test('SQS (json): message attributes round-trip as a typed map', () async {
    final created = await sqs.createQueue(queueName: uniqueName());
    final queueUrl = created.queueUrl!;

    await sqs.sendMessage(
      queueUrl: queueUrl,
      messageBody: 'with-attributes',
      messageAttributes: {
        'origin': MessageAttributeValue(
          dataType: 'String',
          stringValue: 'smoke-test',
        ),
      },
    );

    final received = await sqs.receiveMessage(
      queueUrl: queueUrl,
      maxNumberOfMessages: 1,
      waitTimeSeconds: 5,
      messageAttributeNames: ['All'],
    );
    final attributes = received.messages!.first.messageAttributes!;
    expect(attributes['origin']?.stringValue, equals('smoke-test'));

    await sqs.deleteQueue(queueUrl: queueUrl);
  });

  test('SQS (json): set and read queue attributes', () async {
    final created = await sqs.createQueue(queueName: uniqueName());
    final queueUrl = created.queueUrl!;

    await sqs.setQueueAttributes(
      queueUrl: queueUrl,
      attributes: {
        QueueAttributeName.visibilityTimeout: '45',
        QueueAttributeName.messageRetentionPeriod: '120',
      },
    );

    final got = await sqs.getQueueAttributes(
      queueUrl: queueUrl,
      attributeNames: [QueueAttributeName.all],
    );
    expect(
      got.attributes![QueueAttributeName.visibilityTimeout],
      equals('45'),
    );
    expect(
      got.attributes![QueueAttributeName.messageRetentionPeriod],
      equals('120'),
    );

    await sqs.deleteQueue(queueUrl: queueUrl);
  });

  test('SQS (json): send a batch, then purge the queue', () async {
    final created = await sqs.createQueue(queueName: uniqueName());
    final queueUrl = created.queueUrl!;

    // Regression: real SQS omits the "Failed" array when nothing failed (see
    // aws/aws-sdk#657); SendMessageBatchResult.fromJson must error-correct the
    // missing required member to an empty list rather than throw.
    final batch = await sqs.sendMessageBatch(
      queueUrl: queueUrl,
      entries: [
        for (var i = 0; i < 3; i++)
          SendMessageBatchRequestEntry(id: 'm$i', messageBody: 'body-$i'),
      ],
    );
    expect(batch.successful, hasLength(3));
    expect(batch.failed, isEmpty);

    await sqs.purgeQueue(queueUrl: queueUrl);

    final attrs = await sqs.getQueueAttributes(
      queueUrl: queueUrl,
      attributeNames: [QueueAttributeName.approximateNumberOfMessages],
    );
    expect(
      attrs.attributes![QueueAttributeName.approximateNumberOfMessages],
      equals('0'),
    );

    await sqs.deleteQueue(queueUrl: queueUrl);
  });

  test('SQS (json): FIFO queue preserves group order and dedup', () async {
    final created = await sqs.createQueue(
      queueName: '${uniqueName()}.fifo',
      attributes: {
        QueueAttributeName.fifoQueue: 'true',
        QueueAttributeName.contentBasedDeduplication: 'true',
      },
    );
    final queueUrl = created.queueUrl!;

    await sqs.sendMessage(
      queueUrl: queueUrl,
      messageBody: 'first',
      messageGroupId: 'g1',
    );
    await sqs.sendMessage(
      queueUrl: queueUrl,
      messageBody: 'second',
      messageGroupId: 'g1',
    );
    // Duplicate body within the dedup window is dropped.
    await sqs.sendMessage(
      queueUrl: queueUrl,
      messageBody: 'first',
      messageGroupId: 'g1',
    );

    final bodies = <String>[];
    for (var i = 0; i < 5 && bodies.length < 2; i++) {
      final received = await sqs.receiveMessage(
        queueUrl: queueUrl,
        maxNumberOfMessages: 10,
        waitTimeSeconds: 2,
      );
      for (final m in received.messages ?? <Message>[]) {
        bodies.add(m.body!);
        await sqs.deleteMessage(
          queueUrl: queueUrl,
          receiptHandle: m.receiptHandle!,
        );
      }
    }
    expect(bodies, equals(['first', 'second']));

    await sqs.deleteQueue(queueUrl: queueUrl);
  });

  test('SQS (json): dead-letter redrive policy round-trips', () async {
    final dlq = await sqs.createQueue(queueName: uniqueName('dlq'));
    final dlqUrl = dlq.queueUrl!;
    final dlqArn = (await sqs.getQueueAttributes(
      queueUrl: dlqUrl,
      attributeNames: [QueueAttributeName.queueArn],
    ))
        .attributes![QueueAttributeName.queueArn]!;

    final redrivePolicy =
        '{"deadLetterTargetArn":"$dlqArn","maxReceiveCount":"3"}';
    final source = await sqs.createQueue(
      queueName: uniqueName('src'),
      attributes: {QueueAttributeName.redrivePolicy: redrivePolicy},
    );
    final sourceUrl = source.queueUrl!;

    final attrs = await sqs.getQueueAttributes(
      queueUrl: sourceUrl,
      attributeNames: [QueueAttributeName.redrivePolicy],
    );
    final policy = attrs.attributes![QueueAttributeName.redrivePolicy]!;
    expect(policy, contains(dlqArn));
    expect(policy, contains('"maxReceiveCount"'));

    await sqs.deleteQueue(queueUrl: sourceUrl);
    await sqs.deleteQueue(queueUrl: dlqUrl);
  });
}
