@TestOn('vm')
library;

import 'package:aws_client/s3.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// End-to-end checks that S3 resolves the endpoint per request from the client
/// config and the operation's bound inputs (the `contextParam` bucket).
S3 _s3(void Function(Uri url) capture,
    {bool forcePathStyle = false, bool useFips = false}) {
  final client = MockClient((rq) async {
    capture(rq.url);
    return Response('', 200);
  });
  return S3(
    region: 'us-east-1',
    client: client,
    credentials: AwsClientCredentials(accessKey: 'a', secretKey: 'b'),
    forcePathStyle: forcePathStyle,
    useFipsEndpoint: useFips,
  );
}

void main() {
  // The bucket must appear exactly once — in the host (virtual) or the path
  // (path-style) — never both. Asserting the full URL guards the double-bucket
  // regression.
  test('virtual-host addressing puts the bucket only in the host', () async {
    late Uri url;
    final s3 = _s3((u) => url = u);
    try {
      await s3.headBucket(bucket: 'my-bucket');
    } catch (_) {}
    expect(url.host, 'my-bucket.s3.us-east-1.amazonaws.com');
    expect(url.path, isEmpty);
  });

  test('forcePathStyle puts the bucket only in the path', () async {
    late Uri url;
    final s3 = _s3((u) => url = u, forcePathStyle: true);
    try {
      await s3.headBucket(bucket: 'my-bucket');
    } catch (_) {}
    expect(url.host, 's3.us-east-1.amazonaws.com');
    expect(url.path, '/my-bucket');
  });

  test('getObject keeps the key in the path, bucket in the host', () async {
    late Uri url;
    final s3 = _s3((u) => url = u);
    try {
      await s3.getObject(bucket: 'my-bucket', key: 'a/b.txt');
    } catch (_) {}
    expect(url.host, 'my-bucket.s3.us-east-1.amazonaws.com');
    expect(url.path, '/a/b.txt');
  });

  test('useFipsEndpoint routes to the FIPS host', () async {
    late Uri url;
    final s3 = _s3((u) => url = u, useFips: true);
    try {
      await s3.headBucket(bucket: 'my-bucket');
    } catch (_) {}
    expect(url.host, 'my-bucket.s3-fips.us-east-1.amazonaws.com');
    expect(url.path, isEmpty);
  });
}
