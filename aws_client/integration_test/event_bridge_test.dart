import 'package:aws_client/event_bridge.dart';
import 'package:aws_client/sns.dart' show Sns;
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late EventBridge events;

  setUp(() => events = localClient(EventBridge.new));
  tearDown(() => events.close());

  test('EventBridge (json): put rule, list it back and delete it', () async {
    final ruleName = uniqueName('rule');

    await events.putRule(
      name: ruleName,
      description: 'smoke-test rule',
      eventPattern: '{"source":["smoke.test"]}',
    );

    final listed = await events.listRules(namePrefix: ruleName);
    expect(listed.rules!.map((r) => r.name), contains(ruleName));

    await events.deleteRule(name: ruleName);
  });

  test('EventBridge (json): attach and remove a target', () async {
    final ruleName = uniqueName('rule');
    final sns = localClient(Sns.new);
    final topic = await sns.createTopic(name: uniqueName('eb-target'));
    final topicArn = topic.topicArn!;

    await events.putRule(
      name: ruleName,
      scheduleExpression: 'rate(5 minutes)',
    );

    final put = await events.putTargets(
      rule: ruleName,
      targets: [Target(arn: topicArn, id: 'target-1')],
    );
    expect(put.failedEntryCount, equals(0));

    final removed =
        await events.removeTargets(rule: ruleName, ids: ['target-1']);
    expect(removed.failedEntryCount, equals(0));

    await events.deleteRule(name: ruleName);
    await sns.deleteTopic(topicArn: topicArn);
    sns.close();
  });
}
