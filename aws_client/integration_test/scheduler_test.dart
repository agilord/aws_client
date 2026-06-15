import 'package:aws_client/scheduler_2021_06_30.dart';
import 'package:aws_client/sns_2010_03_31.dart' show Sns;
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late EventBridgeScheduler scheduler;

  setUp(() => scheduler = localClient(EventBridgeScheduler.new));
  tearDown(() => scheduler.close());

  test('Scheduler (rest-json): create, get, list and delete a schedule',
      () async {
    final name = uniqueName('schedule');
    final sns = localClient(Sns.new);
    final topic = await sns.createTopic(name: uniqueName('sched-target'));
    final topicArn = topic.topicArn!;

    await scheduler.createSchedule(
      name: name,
      scheduleExpression: 'rate(1 hour)',
      flexibleTimeWindow: FlexibleTimeWindow(mode: FlexibleTimeWindowMode.off),
      target: Target(
        arn: topicArn,
        roleArn: 'arn:aws:iam::000000000000:role/smoke-scheduler',
      ),
      description: 'smoke-test schedule',
    );

    final got = await scheduler.getSchedule(name: name);
    expect(got.name, equals(name));
    expect(got.scheduleExpression, equals('rate(1 hour)'));
    expect(got.target!.arn, equals(topicArn));

    final listed = await scheduler.listSchedules();
    expect(listed.schedules.map((s) => s.name), contains(name));

    await scheduler.deleteSchedule(name: name);
    await sns.deleteTopic(topicArn: topicArn);
    sns.close();
  });
}
