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
}
