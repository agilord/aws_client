import 'package:aws_client/src/json/builder.dart';
import 'package:http_client/http_client.dart';

Request buildRequest(Map<String, dynamic> spec, Map<String, dynamic> data) {
  final Map<String, String> metadata = spec['metadata'] as Map<String, String>;
  final String target = '${metadata['targetPrefix']}.${data['operation']}';
  final String version = metadata['jsonVersion'] ?? '1.0';
  final Map<String, dynamic> input =
      spec['operations'][data['operation']]['input'] as Map<String, dynamic>;
  final builder = JsonBuilder();

  final String body = builder.build(data ?? {}, input);
  final Map<String, String> headers = {
    'Content-Type': 'application/x-amz-json-$version',
    'X-Amz-Target': target
  };

  // TODO: Use body and headers in a request

  throw Exception('Protocol not implemented: "json" ($headers, $body)');
}
