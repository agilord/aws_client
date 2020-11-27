import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_aws_api/src/protocol/_sign.dart';

import '../credentials.dart';
import 'endpoint.dart';
import 'shared.dart';

class RestJsonProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentials _credentials;

  RestJsonProtocol._(
    this._client,
    this._endpoint,
    this._credentials,
  );

  factory RestJsonProtocol({
    Client client,
    ServiceMetadata service,
    String region,
    String endpointUrl,
    AwsClientCredentials credentials,
  }) {
    client ??= Client();
    final endpoint = Endpoint.forProtocol(
        service: service, region: region, endpointUrl: endpointUrl);
    credentials ??= AwsClientCredentials.resolve();
    ArgumentError.checkNotNull(credentials, 'credentials');
    return RestJsonProtocol._(client, endpoint, credentials);
  }

  Future<StreamedResponse> sendRaw({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
  }) async {
    var uri = Uri.parse('${_endpoint.url}$requestUri');
    uri = uri.replace(
        query: [
      uri.query,
      if (queryParams != null) Uri(queryParameters: queryParams).query,
    ].where((e) => e != null).join('&'));
    final rq = Request(
      method,
      uri,
    );
    if (payload != null) {
      if (payload is List<int>) {
        rq.bodyBytes = payload;
      } else if (payload is String) {
        rq.body = payload;
      } else {
        rq.body = json.encode(payload);
      }
    }
    if (headers != null) {
      rq.headers.addAll(headers);
    }

    signAws4HmacSha256(
      rq: rq,
      service: _endpoint.service,
      region: _endpoint.signingRegion,
      credentials: _credentials,
    );

    final rs = await _client.send(rq);

    if (rs.statusCode < 200 || rs.statusCode >= 300) {
      throwException(rs, await rs.stream.bytesToString(), exceptionFnMap);
    }

    return rs;
  }

  Future<Map<String, dynamic>> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
    bool isRawPayload = false,
  }) async {
    final rs = await sendRaw(
      method: method,
      requestUri: requestUri,
      exceptionFnMap: exceptionFnMap,
      queryParams: queryParams,
      headers: headers,
      payload: payload,
    );
    return jsonFromResponse(rs);
  }
}
