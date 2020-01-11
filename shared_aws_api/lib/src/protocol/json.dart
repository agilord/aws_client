// ignore_for_file: unused_field
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../credentials.dart';
import 'shared.dart';

class JsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final AwsClientCredentials _credentials;

  JsonProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory JsonProtocol({
    Client client,
    String service,
    String region,
    String endpointUrl,
    AwsClientCredentials credentials,
  }) {
    client ??= Client();
    if (service == null || region == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }
    endpointUrl ??= 'https://$service.$region.amazonaws.com';
    service ??= extractService(Uri.parse(endpointUrl));
    region ??= extractRegion(Uri.parse(endpointUrl));
    return JsonProtocol._(client, service, region, endpointUrl, credentials);
  }

  Future<JsonResponse> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
  }) async {
    final parsedUrl = Uri.parse(
      '$_endpointUrl$requestUri',
    ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);
    final rs = await _client.sendRequest(
        method, payload, headers, parsedUrl.toString());

    if (200 < rs.statusCode || rs.statusCode >= 300) {
      throwException(rs, exceptionFnMap);
    }

    final parsedBody = jsonDecode(rs.body) as Map<String, dynamic>;

    return JsonResponse(rs.headers, parsedBody);
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
