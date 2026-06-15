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

  test('Kinesis (json): putRecords batch then read them with a shard iterator',
      () async {
    final streamName = uniqueName();
    await kinesis.createStream(streamName: streamName, shardCount: 1);

    for (var i = 0; i < 10; i++) {
      final summary =
          await kinesis.describeStreamSummary(streamName: streamName);
      if (summary.streamDescriptionSummary.streamStatus ==
          StreamStatus.active) {
        break;
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }

    final put = await kinesis.putRecords(
      streamName: streamName,
      records: [
        for (var i = 0; i < 3; i++)
          PutRecordsRequestEntry(
            partitionKey: 'pk-$i',
            data: Uint8List.fromList(utf8.encode('payload-$i')),
          ),
      ],
    );
    expect(put.failedRecordCount, equals(0));
    expect(put.records, hasLength(3));

    final described = await kinesis.describeStream(streamName: streamName);
    final shardId = described.streamDescription.shards.first.shardId;

    final iterator = await kinesis.getShardIterator(
      streamName: streamName,
      shardId: shardId,
      shardIteratorType: ShardIteratorType.trimHorizon,
    );

    final records = await kinesis.getRecords(
      shardIterator: iterator.shardIterator!,
    );
    final payloads =
        records.records.map((r) => utf8.decode(r.data)).toSet();
    expect(payloads, containsAll(['payload-0', 'payload-1', 'payload-2']));

    await kinesis.deleteStream(streamName: streamName);
  });
}
