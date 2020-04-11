// ignore_for_file: unused_field
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:sigv4/sigv4.dart';

import '../credentials.dart';
import 'shared.dart';

class JsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final AwsClientCredentials _credentials;
  final Sigv4Client _sigv4client;

  JsonProtocol._(this._client, this._service, this._region, this._endpointUrl,
      this._credentials, this._sigv4client);

  factory JsonProtocol({
    Client client,
    String service,
    String region,
    String endpointUrl,
    AwsClientCredentials credentials,
  }) {
    client ??= Client();
    final sigv4client = Sigv4Client(
      keyId: credentials.accessKey,
      accessKey: credentials.secretKey,
      sessionToken: credentials.sessionToken,
      serviceName: service,
      region: region,
    );
    if (service == null || region == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }
    endpointUrl ??= 'https://$service.$region.amazonaws.com';
    service ??= extractService(Uri.parse(endpointUrl));
    region ??= extractRegion(Uri.parse(endpointUrl));
    return JsonProtocol._(
        client, service, region, endpointUrl, credentials, sigv4client);
  }

  Future<JsonResponse> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
  }) async {
    final rs = await sendRequest(
        method, payload, headers, '$_endpointUrl$requestUri', queryParams);

    if (200 < rs.statusCode || rs.statusCode >= 300) {
      throwException(rs, exceptionFnMap);
    }

    final parsedBody = jsonDecode(rs.body) as Map<String, dynamic>;

    return JsonResponse(rs.headers, parsedBody);
  }

  Future<Response> sendRequest(
      String method,
      dynamic body,
      Map<String, String> headers,
      String url,
      Map<String, String> queryParams) async {
    Response rs;
    switch (method.toUpperCase()) {
      case 'GET':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
        );
        rs = await _client.get(rq.url, headers: rq.headers);
        break;
      case 'POST':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
          body: json.encode(body),
        );
        rs = await _client.post(rq.url, headers: rq.headers, body: rq.body);
        break;
      case 'DELETE':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
        );
        rs = await _client.delete(rq.url, headers: rq.headers);
        break;
      case 'PUT':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
          body: json.encode(body),
        );
        rs = await _client.put(rq.url, headers: rq.headers, body: rq.body);
        break;
      case 'HEAD':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
        );
        rs = await _client.head(rq.url, headers: rq.headers);
        break;
      case 'PATCH':
        final rq = _sigv4client.request(
          url,
          method: method.toUpperCase(),
          query: queryParams,
          headers: headers,
          body: json.encode(body),
        );
        rs = await _client.patch(rq.url, headers: rq.headers, body: rq.body);
        break;
      default:
        throw ArgumentError.value(method, 'method', 'Unknown method');
    }

    return rs;
  }
}

void throwException(Response rs, Map<String, AwsExceptionFn> exceptionFnMap) {
  var type =
      rs.headers['x-amzn-errortype']?.split(':')?.first ?? 'UnknownError';
  String message;

  final statusCode = rs.statusCode.toString();

  if (rs.body?.isNotEmpty == true) {
    try {
      final e = jsonDecode(rs.body);
      if (e['__type'] != null || e['code'] != null) {
        type =
            ((e['__type'] as String) ?? (e['code'] as String)).split('#').last;
      }
      if (type == 'RequestEntityTooLarge') {
        message = 'Request body must be less than 1 MB';
      } else {
        message = e['message'] as String ?? e['Message'] as String;
      }
    } catch (_) {
      message = statusCode;
    }
  } else {
    message = statusCode;
  }

  final fn = exceptionFnMap[type];
  final exception = fn != null
      ? fn(type, message)
      : GenericAwsException(
          type: type,
          code: statusCode,
          message: message,
        );
  throw exception;
}

class JsonResponse {
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  JsonResponse(this.headers, this.body);
}
