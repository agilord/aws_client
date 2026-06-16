import 'package:aws_client/cloud_watch_logs.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late CloudWatchLogs logs;

  setUp(() => logs = localClient(CloudWatchLogs.new));
  tearDown(() => logs.close());

  test('CloudWatchLogs (json): put and read log events round-trip', () async {
    final group = '/smoke/${uniqueName('group')}';
    const stream = 'stream-1';

    await logs.createLogGroup(logGroupName: group);
    await logs.createLogStream(logGroupName: group, logStreamName: stream);

    final now = DateTime.now().millisecondsSinceEpoch;
    await logs.putLogEvents(
      logGroupName: group,
      logStreamName: stream,
      logEvents: [
        InputLogEvent(message: 'first line', timestamp: now),
        InputLogEvent(message: 'second line', timestamp: now + 1),
      ],
    );

    final events = await logs.getLogEvents(
      logGroupName: group,
      logStreamName: stream,
      startFromHead: true,
    );
    final messages = events.events!.map((e) => e.message).toList();
    expect(messages, equals(['first line', 'second line']));

    await logs.deleteLogGroup(logGroupName: group);
  });
}
