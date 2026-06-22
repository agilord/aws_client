import 'dart:typed_data';

import 'package:aws_client/firehose.dart';
import 'package:aws_client/s3.dart' show S3;
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Firehose firehose;

  setUp(() => firehose = localClient(Firehose.new));
  tearDown(() => firehose.close());

  test('Firehose (json): create an S3 delivery stream and put a record',
      () async {
    final bucket = uniqueName('fh-bucket');
    // LocalStack needs path-style addressing; the default is virtual-host.
    final s3 = S3(
      region: testRegion,
      credentials: testCredentials,
      endpointUrl: testEndpoint,
      forcePathStyle: true,
    );
    await s3.createBucket(bucket: bucket);

    final streamName = uniqueName('stream');
    await firehose.createDeliveryStream(
      deliveryStreamName: streamName,
      deliveryStreamType: DeliveryStreamType.directPut,
      extendedS3DestinationConfiguration: ExtendedS3DestinationConfiguration(
        bucketARN: 'arn:aws:s3:::$bucket',
        roleARN: 'arn:aws:iam::000000000000:role/smoke-firehose',
      ),
    );

    final listed = await firehose.listDeliveryStreams();
    expect(listed.deliveryStreamNames, contains(streamName));

    final put = await firehose.putRecord(
      deliveryStreamName: streamName,
      record: Record(data: Uint8List.fromList('hello-firehose'.codeUnits)),
    );
    expect(put.recordId, isNotEmpty);

    await firehose.deleteDeliveryStream(deliveryStreamName: streamName);
    // The delivery stream writes objects into the bucket asynchronously, so we
    // leave the bucket for the ephemeral LocalStack container to discard.
    s3.close();
  });
}
