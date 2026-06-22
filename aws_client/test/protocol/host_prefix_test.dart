@TestOn('vm')
library;

import 'package:aws_client/cloud_watch_logs.dart';
import 'package:aws_client/neptune_graph.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// Verifies the `@endpoint(hostPrefix)` trait is applied to the request host,
/// including `@hostLabel` substitution, and can be disabled.
void main() {
  test('static host prefix is prepended to the host', () async {
    late Uri url;
    final client = MockClient((rq) async {
      url = rq.url;
      return Response('{}', 200);
    });
    final logs = CloudWatchLogs(
      region: 'us-east-1',
      client: client,
      credentials: AwsClientCredentials(accessKey: 'a', secretKey: 'b'),
    );
    try {
      await logs.getLogObject(logObjectPointer: 'p');
    } catch (_) {}
    expect(url.host, 'stream-logs.us-east-1.amazonaws.com');
  });

  test('templated host prefix substitutes the hostLabel member', () async {
    late Uri url;
    final client = MockClient((rq) async {
      url = rq.url;
      return Response('{}', 200);
    });
    final graph = NeptuneGraph(
      region: 'us-east-1',
      client: client,
      credentials: AwsClientCredentials(accessKey: 'a', secretKey: 'b'),
    );
    try {
      await graph.getGraphSummary(graphIdentifier: 'g-123');
    } catch (_) {}
    expect(url.host, startsWith('g-123.'));
  });

  test('disableHostPrefix skips injection', () async {
    late Uri url;
    final client = MockClient((rq) async {
      url = rq.url;
      return Response('{}', 200);
    });
    final logs = CloudWatchLogs(
      region: 'us-east-1',
      client: client,
      credentials: AwsClientCredentials(accessKey: 'a', secretKey: 'b'),
      disableHostPrefix: true,
    );
    try {
      await logs.getLogObject(logObjectPointer: 'p');
    } catch (_) {}
    expect(url.host, isNot(startsWith('stream-')));
  });
}
