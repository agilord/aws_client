import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';

import 'shared.dart';

class QueryProtocol {
  final Client _client;
  final String _service;
  final String _region;
  final String _endpointUrl;
  final Credentials _credentials;

  QueryProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory QueryProtocol({
    Client client,
    String service,
    String region,
    String endpointUrl,
    Credentials credentials,
  }) {
    client ??= Client();
    if (service == null || region == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }
    endpointUrl ??= 'https://$service.$region.amazonaws.com';
    service ??= _extractService(Uri.parse(endpointUrl));
    region ??= _extractRegion(Uri.parse(endpointUrl));
    return QueryProtocol._(client, service, region, endpointUrl, credentials);
  }

  Future<XmlElement> send(
    Map<String, dynamic> data, {
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    String resultWrapper,
  }) async {
    final rq = _buildRequest(data, method, requestUri);
    final rs = await _client.send(rq);
    final body = await rs.stream.bytesToString();
    final root = parse(body);
    var elem = root.rootElement;
    if (elem.name.local == 'ErrorResponse') {
      final error = elem.findElements('Error').first;
      final type = error.findElements('Type').first.text;
      final code = error.findElements('Code').first.text;
      final message = error.findElements('Message').first.text;
      final fn = exceptionFnMap[code];
      final exception = fn != null
          ? fn(type, message)
          : AwsException(type: type, code: code, message: message);
      throw exception;
    }
    if (resultWrapper != null) {
      elem = elem.findElements(resultWrapper).first;
    }
    return elem;
  }

  Request _buildRequest(
      Map<String, dynamic> data, String method, String requestUri) {
    final rq = Request(method, Uri.parse('$_endpointUrl$requestUri'));
    rq.body = _canonical(flatQueryParams(data));
    rq.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    // TODO: handle if the API is using different signing
    _signAws4HmacSha256(rq);
    return rq;
  }

  void _signAws4HmacSha256(Request rq) {
    final date = _currentDateHeader();
    rq.headers['X-Amz-Date'] = date;
    rq.headers['Host'] = rq.url.host;

    // sorted list of key:value header entries
    final canonicalHeaders = rq.headers.keys
        .map((key) => '${key.toLowerCase()}:${rq.headers[key].trim()}')
        .toList()
          ..sort();
    // sorted list of header keys
    final headerKeys = rq.headers.keys.map((s) => s.toLowerCase()).toList()
      ..sort();

    final payloadHash = sha256.convert(rq.bodyBytes).toString();
    final canonical = [
      rq.method.toUpperCase(),
      Uri.encodeFull(rq.url.path),
      '',
      ...canonicalHeaders,
      '',
      headerKeys.join(';'),
      payloadHash,
    ].join('\n');
    final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();

    final credentialList = [
      date.substring(0, 8),
      _region,
      _service,
      'aws4_request',
    ];
    const _aws4HmacSha256 = 'AWS4-HMAC-SHA256';
    final toSign = [
      _aws4HmacSha256,
      date,
      credentialList.join('/'),
      canonicalHash,
    ].join('\n');

    final signingKey = credentialList
        .fold(utf8.encode('AWS4${_credentials.secretKey}'),
            (List<int> key, String s) {
      final hmac = Hmac(sha256, key);
      return hmac.convert(utf8.encode(s)).bytes;
    });
    final signature =
        Hmac(sha256, signingKey).convert(utf8.encode(toSign)).toString();
    if (_credentials.sessionToken != null) {
      rq.headers['X-Amz-Security-Token'] = _credentials.sessionToken;
    }

    final auth = '$_aws4HmacSha256 '
        'Credential=${_credentials.accessKey}/${credentialList.join('/')}, '
        'SignedHeaders=${headerKeys.join(';')}, '
        'Signature=$signature';
    rq.headers['Authorization'] = auth;
  }
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

@visibleForTesting
Map<String, String> flatQueryParams(dynamic data) {
  return Map.fromEntries(_flatten([], data));
}

Iterable<MapEntry<String, String>> _flatten(
    List<String> prefixes, dynamic data) sync* {
  if (data == null) {
    return;
  }

  if (data is String) {
    final key = prefixes.join('.');
    yield MapEntry(key, data);
    return;
  }
  if (data is int) {
    final key = prefixes.join('.');
    yield MapEntry(key, data.toString());
    return;
  }

  if (data is List) {
    if (data.isEmpty) {
      final key = prefixes.join('.');
      yield MapEntry(key, '');
    } else {
      for (var i = 0; i < data.length; i++) {
        final newPrefixes = [...prefixes, '${i + 1}'];
        yield* _flatten(newPrefixes, data[i]);
      }
    }
    return;
  }

  if (data is Map) {
    var flat = false;
    if (prefixes.isEmpty) flat = true;

    var i = 0;
    for (final e in data.entries) {
      final key = e.key;
      if (flat && key is String) {
        yield* _flatten([...prefixes, key], e.value);
      } else {
        yield* _flatten([...prefixes, 'entry', '${i + 1}', 'key'], key);
        yield* _flatten([...prefixes, 'entry', '${i + 1}', 'value'], e.value);
      }
      i++;
    }
    return;
  }

  throw ArgumentError(
      'Unknown type at "${prefixes.join('.')}": ${data.runtimeType} ($data)');
}

String _canonical(Map<String, String> data) {
  final list = data.entries
      .map((e) =>
          '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
      .toList();
  list.sort();
  return list.join('&');
}

String _extractRegion(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4 && parts[1].contains('-')) return parts[1];
  throw Exception('Unable to detect region in ${uri.host}.');
}

String _extractService(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4) return parts.first;
  throw Exception('Unable to detect service in ${uri.host}.');
}
