// Copyright (c) 2016, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http_client/http_client.dart';

import 'credentials.dart';

/// AWS response object.
class AwsResponse {
  /// HTTP status code.
  final int statusCode;

  /// HTTP status text.
  final String statusText;

  /// HTTP headers.
  final Map<String, String> headers;
  final Stream<List<int>> _body;

  bool _bodyWasUsed = false;

  /// AWS response object.
  AwsResponse(
      this.statusCode, this.statusText, this.headers, Stream<List<int>> body)
      : _body = body;

  /// A very lousy way to validate some of the common status codes.
  /// https://http.cat/
  void validateStatus() {
    if (statusCode >= 200 && statusCode <= 207) return;
    // TODO: check for different type of errors
    // TODO: introduce transient exception for error handling
    throw Exception(
        'Bad response code=$statusCode, statusText=$statusText, headers=$headers.');
  }

  /// Reads the entire response into a byte array.
  Future<List<int>> readAsBytes() async {
    assert(_bodyWasUsed == false);
    _bodyWasUsed = true;
    final builder = BytesBuilder(copy: false);
    await _body.forEach(builder.add);
    return builder.toBytes();
  }

  /// Reads the entire response into a single String.
  Future<String> readAsString({Encoding encoding = utf8}) async {
    return encoding.decode(await readAsBytes());
  }
}

const _aws4HmacSha256 = 'AWS4-HMAC-SHA256';

String _queryComponent(String path) =>
    Uri.encodeQueryComponent(path).replaceAll('+', '%20');

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

/// Builds an AWS request.
class AwsRequestBuilder {
  /// HTTP method.
  String method;

  /// Full URL. If set, [baseUrl] and [queryParameters] mustn't be set.
  Uri uri;

  /// Base URL for easier [uri] construction.
  String baseUrl;

  /// Query parameters for easier [uri] construction.
  Map<String, String> queryParameters;

  /// HTTP Headers
  Map<String, String> headers;

  /// request content
  List<int> body;

  /// Sets the body with the given parameters in a form-url-encoded format.
  Map<String, String> formParameters;

  /// AWS region
  String region;

  /// AWS service
  String service;

  /// AWS credentials
  Credentials credentials;

  /// HTTP client
  Client httpClient;

  /// Builds an AWS request.
  AwsRequestBuilder({
    this.method = 'GET',
    this.uri,
    this.headers,
    this.body,
    this.formParameters,
    this.region,
    this.service,
    this.credentials,
    this.httpClient,
    this.baseUrl,
    this.queryParameters,
  });

  /// Initializes and signs a request.
  Request buildRequest() {
    assert(credentials != null);
    assert(httpClient != null);
    _initDefaults();
    _sign();
    return Request(method, uri, headers: headers, body: body);
  }

  /// Initializes, signs and send the request.
  Future<AwsResponse> sendRequest() async {
    final rq = buildRequest();
    final rs = await httpClient.send(rq);
    return AwsResponse(rs.statusCode, rs.reasonPhrase, rs.headers.toSimpleMap(),
        rs.bodyAsStream);
  }

  void _initDefaults() {
    if (uri != null) {
      assert(baseUrl == null);
      assert(queryParameters == null);
    } else {
      assert(baseUrl != null);
      var url = baseUrl;
      if (queryParameters != null) {
        url = '$url${Uri(queryParameters: queryParameters)}';
      }
      uri = Uri.parse(url);
    }
    headers ??= {};
    headers.putIfAbsent('Host', () => uri.host);
    if (body == null && formParameters != null && formParameters.isNotEmpty) {
      body = utf8.encode(formParameters.keys
          .map((key) => '${Uri.encodeQueryComponent(key)}='
              '${Uri.encodeQueryComponent(formParameters[key])}')
          .join('&'));
      headers['Content-Type'] = 'application/x-www-form-urlencoded';
    }
    body ??= const [];
    headers.putIfAbsent('X-Amz-Date', () {
      final date = DateTime.now()
          .toUtc()
          .toIso8601String()
          .replaceAll('-', '')
          .replaceAll(':', '')
          .split('.')
          .first;
      return '${date}Z';
    });
    region ??= _extractRegion(uri);
    service ??= _extractService(uri);
  }

  void _sign() {
    final queryKeys = uri.queryParameters.keys.toList()..sort();
    final canonicalQuery = queryKeys
        .map((s) =>
            '${_queryComponent(s)}=${_queryComponent(uri.queryParameters[s])}')
        .join('&');
    final canonicalHeaders = headers.keys
        .map((key) => '${key.toLowerCase()}:${headers[key].trim()}')
        .toList()
      ..sort();
    final signedHeaders =
        (headers.keys.toList()..sort()).map((s) => s.toLowerCase()).join(';');

    final payloadHash =
        headers['X-Amz-Content-Sha256'] ?? sha256.convert(body).toString();

    final canonical = [
      method.toUpperCase(),
      Uri.encodeFull(uri.path),
      canonicalQuery,
      ...canonicalHeaders,
      '',
      signedHeaders,
      payloadHash,
    ].join('\n');

    final date = headers['X-Amz-Date'];
    final credentialList = [
      date.substring(0, 8),
      region,
      service,
      'aws4_request',
    ];
    final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();
    final toSign = [
      _aws4HmacSha256,
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
    if (credentials.sessionToken != null) {
      headers['X-Amz-Security-Token'] = credentials.sessionToken;
    }

    final auth = '$_aws4HmacSha256 '
        'Credential=${credentials.accessKey}/${credentialList.join('/')}, '
        'SignedHeaders=$signedHeaders, '
        'Signature=$signature';
    headers['Authorization'] = auth;
  }
}
