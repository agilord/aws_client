import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/kinesis_2013_12_02.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Kinesis kinesis;

  setUp(() => kinesis = localClient(Kinesis.new));
  tearDown(() => kinesis.close());

  test('Kinesis (json): create stream, wait active, put a record', () async {
    final streamName = uniqueName();
    await kinesis.createStream(streamName: streamName, shardCount: 1);

    var active = false;
    for (var i = 0; i < 10; i++) {
      final summary =
          await kinesis.describeStreamSummary(streamName: streamName);
      if (summary.streamDescriptionSummary.streamStatus ==
          StreamStatus.active) {
        active = true;
        break;
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    expect(active, isTrue, reason: 'stream did not become ACTIVE in time');

    final put = await kinesis.putRecord(
      streamName: streamName,
      partitionKey: 'pk-1',
      data: Uint8List.fromList(utf8.encode('event-payload')),
    );
    expect(put.shardId, isNotEmpty);
    expect(put.sequenceNumber, isNotEmpty);

    await kinesis.deleteStream(streamName: streamName);
  });
}
