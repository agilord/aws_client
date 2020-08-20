import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_aws_api/src/protocol/_sign.dart';

import '../credentials.dart';
import 'shared.dart';

class RestJsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final AwsClientCredentials _credentials;

  RestJsonProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory RestJsonProtocol({
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
    credentials ??= AwsClientCredentials.resolve();
    ArgumentError.checkNotNull(credentials, 'credentials');
    return RestJsonProtocol._(
        client, service, region, endpointUrl, credentials);
  }

  Future<Map<String, dynamic>> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
  }) async {
    final rq = Request(method, Uri.parse('$_endpointUrl$requestUri'));
    rq.body = (payload == null ? null : json.encode(payload)) ?? '';
    rq.headers.addAll(headers);

    signAws4HmacSha256(
      rq: rq,
      service: _service,
      region: _region,
      credentials: _credentials,
    );

    final rs = await _client.send(rq);

    final body = await rs.stream.bytesToString();

    if (200 < rs.statusCode || rs.statusCode >= 300) {
      throwException(rs, body, exceptionFnMap);
    }

    final parsedBody = jsonDecode(body) as Map<String, dynamic>;

    return {
      ...rs.headers,
      ...parsedBody,
    };
  }
}
