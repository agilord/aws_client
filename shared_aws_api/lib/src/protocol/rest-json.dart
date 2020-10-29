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
    String service,
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

  Future<Map<String, dynamic>> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
    dynamic payload,
  }) async {
    final rq = Request(
      method,
      Uri.parse('${_endpoint.url}$requestUri').replace(
        queryParameters: queryParams ?? {},
      ),
    );
    rq.body = (payload == null ? null : json.encode(payload)) ?? '';
    rq.headers.addAll(headers ?? {});

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

    final parsedBody = jsonDecode(body) as Map<String, dynamic>;

    return {
      ...rs.headers,
      ...parsedBody,
    };
  }
}
