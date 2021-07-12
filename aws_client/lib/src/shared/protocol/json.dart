// ignore_for_file: unused_field
import 'dart:convert';

import 'package:http/http.dart';

import '../credentials.dart';
import '_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class JsonProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentials _credentials;

  JsonProtocol._(
    this._client,
    this._endpoint,
    this._credentials,
  );

  factory JsonProtocol({
    Client? client,
    ServiceMetadata? service,
    String? region,
    String? endpointUrl,
    AwsClientCredentials? credentials,
  }) {
    client ??= Client();
    final endpoint = Endpoint.forProtocol(
        service: service, region: region, endpointUrl: endpointUrl);
    credentials ??= AwsClientCredentials.resolve();
    ArgumentError.checkNotNull(credentials, 'credentials');
    return JsonProtocol._(client, endpoint, credentials!);
  }

  Future<JsonResponse> send({
    required String method,
    required String requestUri,
    required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, List<String>>? queryParams,
    Map<String, String>? headers,
    dynamic payload,
  }) async {
    var uri = Uri.parse('${_endpoint.url}$requestUri');
    uri = uri.replace(queryParameters: {
      ...uri.queryParameters,
      ...?queryParams,
    });
    final rq = Request(
      method,
      uri,
    );
    rq.headers.addAll(headers ?? {});
    if (payload != null) {
      rq.body = json.encode(payload);
    }

    signAws4HmacSha256(
      rq: rq,
      service: _endpoint.service,
      region: _endpoint.signingRegion,
      credentials: _credentials,
    );

    final rs = await _client.send(rq);

    final body = await rs.stream.bytesToString();

    if (rs.statusCode < 200 || rs.statusCode >= 300) {
      throwException(rs, body, exceptionFnMap);
    }

    final parsedBody = body.isEmpty
        ? <String, dynamic>{}
        : (jsonDecode(body) as Map<String, dynamic>?)!;

    // TODO: replace return type with Map<String, dynamic> and discard the
    // JsonResponse class. The generated code will have to adjust as well.
    return JsonResponse(rs.headers, {
      ...parsedBody,
      ...rs.headers,
    });
  }
}
