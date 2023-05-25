import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';

import '../credentials.dart';
import '../utils/query_string.dart';
import 'endpoint.dart' show ServiceMetadata;

void signAws4HmacSha256({
  required Request rq,
  required ServiceMetadata service,
  required String region,
  required AwsClientCredentials credentials,
}) {
  final date = _currentDateHeader();
  rq.headers['X-Amz-Date'] = date;
  rq.headers['Host'] = rq.url.host;
  rq.headers['x-amz-content-sha256'] ??=
      sha256.convert(rq.bodyBytes).toString();
  if (credentials.sessionToken != null) {
    rq.headers['X-Amz-Security-Token'] = credentials.sessionToken!;
  }

  // sorted list of key:value header entries
  final canonicalHeaders = rq.headers.keys
      .map((key) => '${key.toLowerCase()}:${rq.headers[key]!.trim()}')
      .toList()
    ..sort();
  // sorted list of header keys
  final headerKeys = rq.headers.keys.map((s) => s.toLowerCase()).toList()
    ..sort();

  final payloadHash = sha256.convert(rq.bodyBytes).toString();
  final canonical = [
    rq.method.toUpperCase(),
    Uri.encodeFull(rq.url.path),
    canonicalQueryParametersAll(rq.url.queryParametersAll),
    ...canonicalHeaders,
    '',
    headerKeys.join(';'),
    payloadHash,
  ].join('\n');
  final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();

  final credentialList = [
    date.substring(0, 8),
    region,
    service.signingName ?? service.endpointPrefix,
    'aws4_request',
  ];
  const aws4HmacSha256 = 'AWS4-HMAC-SHA256';
  final toSign = [
    aws4HmacSha256,
    date,
    credentialList.join('/'),
    canonicalHash,
  ].join('\n');

  final signingKey = credentialList.fold(
      utf8.encode('AWS4${credentials.secretKey}'), (List<int> key, String s) {
    final hmac = Hmac(sha256, key);
    return hmac.convert(utf8.encode(s)).bytes;
  });
  final signature =
      Hmac(sha256, signingKey).convert(utf8.encode(toSign)).toString();

  final auth = '$aws4HmacSha256 '
      'Credential=${credentials.accessKey}/${credentialList.join('/')}, '
      'SignedHeaders=${headerKeys.join(';')}, '
      'Signature=$signature';
  rq.headers['Authorization'] = auth;
}

String _currentDateHeader() {
  final date = DateTime.now()
      .toUtc()
      .toIso8601String()
      .replaceAll('-', '')
      .replaceAll(':', '')
      .split('.')
      .first;
  return '${date}Z';
}
