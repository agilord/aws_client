import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/s3_2006_03_01.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late S3 s3;
  late String bucket;

  setUp(() async {
    s3 = localClient(S3.new);
    bucket = uniqueName();
    await s3.createBucket(bucket: bucket);
  });
  tearDown(() => s3.close());

  Future<void> putText(String key, String body, {String? contentType}) =>
      s3.putObject(
        bucket: bucket,
        key: key,
        body: Uint8List.fromList(utf8.encode(body)),
        contentType: contentType,
      );

  test('put then get object, with content-type and list round-trip', () async {
    await putText('folder/object.txt', 'rest-xml-payload',
        contentType: 'text/plain');

    final got = await s3.getObject(bucket: bucket, key: 'folder/object.txt');
    expect(utf8.decode(got.body!), equals('rest-xml-payload'));
    expect(got.contentType, contains('text/plain'));

    expectRecent(got.lastModified);

    final listed = await s3.listObjectsV2(bucket: bucket);
    final keys = (listed.contents ?? []).map((o) => o.key);
    expect(keys, contains('folder/object.txt'));
  });

  test('copy an object, then head the copy', () async {
    await putText('source.txt', 'original');

    final copied = await s3.copyObject(
      bucket: bucket,
      key: 'copy.txt',
      copySource: '$bucket/source.txt',
    );
    expect(copied.copyObjectResult?.eTag, isNotNull);

    final head = await s3.headObject(bucket: bucket, key: 'copy.txt');
    expect(head.contentLength, equals('original'.length));
    expect(head.eTag, isNotNull);
  });

  test('custom object metadata round-trips through headers', () async {
    await s3.putObject(
      bucket: bucket,
      key: 'tagged.txt',
      body: Uint8List.fromList(utf8.encode('payload')),
      metadata: {'project': 'aws-client'},
    );

    final head = await s3.headObject(bucket: bucket, key: 'tagged.txt');
    expect(head.metadata?['project'], equals('aws-client'));
  });

  test('batch delete removes multiple objects', () async {
    await putText('a.txt', 'a');
    await putText('b.txt', 'b');

    final deleted = await s3.deleteObjects(
      bucket: bucket,
      delete: Delete(
        objects: [
          ObjectIdentifier(key: 'a.txt'),
          ObjectIdentifier(key: 'b.txt'),
        ],
      ),
    );
    final deletedKeys = (deleted.deleted ?? []).map((o) => o.key);
    expect(deletedKeys, containsAll(['a.txt', 'b.txt']));

    final remaining = await s3.listObjectsV2(bucket: bucket);
    expect(remaining.contents ?? [], isEmpty);
  });

  test('multipart upload then download reassembles the object', () async {
    const key = 'multipart.bin';
    // S3 requires every part except the last to be at least 5 MiB.
    final part1 = Uint8List(5 * 1024 * 1024)
      ..fillRange(0, 5 * 1024 * 1024, 0x61);
    final part2 = Uint8List.fromList(utf8.encode('tail'));

    final upload = await s3.createMultipartUpload(bucket: bucket, key: key);
    final uploadId = upload.uploadId!;

    final partOne = await s3.uploadPart(
      bucket: bucket,
      key: key,
      uploadId: uploadId,
      partNumber: 1,
      body: part1,
    );
    final partTwo = await s3.uploadPart(
      bucket: bucket,
      key: key,
      uploadId: uploadId,
      partNumber: 2,
      body: part2,
    );

    await s3.completeMultipartUpload(
      bucket: bucket,
      key: key,
      uploadId: uploadId,
      multipartUpload: CompletedMultipartUpload(
        parts: [
          CompletedPart(partNumber: 1, eTag: partOne.eTag),
          CompletedPart(partNumber: 2, eTag: partTwo.eTag),
        ],
      ),
    );

    final got = await s3.getObject(bucket: bucket, key: key);
    expect(got.body!.length, equals(part1.length + part2.length));
    expect(utf8.decode(got.body!.sublist(part1.length)), equals('tail'));
  });

  test('object keys with XML-special characters survive batch delete',
      () async {
    const key = 'a & b < c > d.txt';
    await putText(key, 'data');

    final got = await s3.getObject(bucket: bucket, key: key);
    expect(utf8.decode(got.body!), equals('data'));

    final deleted = await s3.deleteObjects(
      bucket: bucket,
      delete: Delete(objects: [ObjectIdentifier(key: key)]),
    );
    expect((deleted.deleted ?? []).map((o) => o.key), contains(key));
  });

  test('list objects paginates with a continuation token', () async {
    await putText('k1', '1');
    await putText('k2', '2');
    await putText('k3', '3');

    final firstPage = await s3.listObjectsV2(bucket: bucket, maxKeys: 2);
    expect(firstPage.contents, hasLength(2));
    expect(firstPage.isTruncated, isTrue);
    expect(firstPage.nextContinuationToken, isNotNull);

    final secondPage = await s3.listObjectsV2(
      bucket: bucket,
      continuationToken: firstPage.nextContinuationToken,
    );
    expect(secondPage.contents, hasLength(1));
    expect(secondPage.isTruncated, isFalse);
  });

  test('list buckets includes the created bucket', () async {
    final listed = await s3.listBuckets();
    final names = (listed.buckets ?? []).map((b) => b.name);
    expect(names, contains(bucket));
  });
}
