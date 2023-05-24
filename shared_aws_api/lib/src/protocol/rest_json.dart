import 'dart:convert';

import 'package:http/http.dart';

import '../credentials.dart';
import '../protocol/_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class RestJsonProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentialsProvider? _credentialsProvider;
  final RequestSigner _requestSigner;
  final bool _manageHttpClient;
  bool _closed = false;

  RestJsonProtocol._(
    this._client,
    this._endpoint,
    this._credentialsProvider,
    this._requestSigner,
    this._manageHttpClient,
  );

  factory RestJsonProtocol({
    Client? client,
    ServiceMetadata? service,
    String? region,
    String? endpointUrl,
    AwsClientCredentials? credentials,
    AwsClientCredentialsProvider? credentialsProvider,
    RequestSigner requestSigner = signAws4HmacSha256,
  }) {
    final manageHttpClient = client == null;
    client ??= Client();

    final endpoint = Endpoint.forProtocol(
        service: service, region: region, endpointUrl: endpointUrl);

    // If credentials are provided, override credentials provider
    if (credentials != null) {
      credentialsProvider = ({Client? client}) => Future.value(credentials);
    } else {
      credentialsProvider ??=
          ({Client? client}) => Future.value(AwsClientCredentials.resolve());
    }

    return RestJsonProtocol._(
      client,
      endpoint,
      credentialsProvider,
      requestSigner,
      manageHttpClient,
    );
  }

  Future<StreamedResponse> sendRaw({
    required String method,
    required String requestUri,
    required Map<String, AwsExceptionFn> exceptionFnMap,
    bool signed = true,
    Map<String, List<String>>? queryParams,
    Map<String, String>? headers,
    dynamic payload,
  }) async {
    var uri = Uri.parse('${_endpoint.url}$requestUri');
    uri = uri.replace(queryParameters: {
      ...uri.queryParametersAll,
      ...?queryParams,
    });
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
    rq.headers['accept'] = 'application/json';
    if (headers != null) {
      rq.headers.addAll(headers);
    }

    if (signed) {
      final credentials = await _credentialsProvider?.call(client: _client);

      if (credentials == null) {
        throw Exception('credentials for signing request is null');
      }

      _requestSigner(
        rq: rq,
        service: _endpoint.service,
        region: _endpoint.signingRegion,
        credentials: credentials,
      );
    }

    final rs = await _client.send(rq);

    if (rs.statusCode < 200 || rs.statusCode >= 300) {
      throwException(rs, await rs.stream.bytesToString(), exceptionFnMap);
    }

    return rs;
  }

  Future<Map<String, dynamic>> send({
    required String method,
    required String requestUri,
    required Map<String, AwsExceptionFn> exceptionFnMap,
    bool signed = true,
    Map<String, List<String>>? queryParams,
    Map<String, String>? headers,
    dynamic payload,
    bool isRawPayload = false,
  }) async {
    final rs = await sendRaw(
      method: method,
      requestUri: requestUri,
      exceptionFnMap: exceptionFnMap,
      signed: signed,
      queryParams: queryParams,
      headers: headers,
      payload: payload,
    );
    return jsonFromResponse(rs);
  }

  void close() {
    if (_closed) {
      return;
    }

    _closed = true;

    if (_manageHttpClient) {
      _client.close();
    }
  }
}
