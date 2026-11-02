import 'dart:convert';

import 'package:http/http.dart';

import '../credentials.dart';
import 'endpoint.dart';
import 'retry.dart';
import 'shared.dart';
import 'sign.dart';

class RestJsonProtocol {
  final Client _client;
  // Resolved lazily; some services only have a usable endpoint per-operation.
  final Endpoint Function() _endpointBuilder;
  Endpoint? _cachedEndpoint;
  Endpoint get _endpoint => _cachedEndpoint ??= _endpointBuilder();
  final AwsClientCredentialsProvider? _credentialsProvider;
  final RequestSigner _requestSigner;
  final bool _manageHttpClient;
  final bool _disableHostPrefix;
  final RetryOptions _retryOptions;
  bool _closed = false;

  RestJsonProtocol._(
    this._client,
    this._endpointBuilder,
    this._credentialsProvider,
    this._requestSigner,
    this._manageHttpClient,
    this._disableHostPrefix,
    this._retryOptions,
  );

  factory RestJsonProtocol({
    Client? client,
    Endpoint Function()? endpointBuilder,
    ServiceMetadata? service,
    String? region,
    String? endpointUrl,
    AwsClientCredentials? credentials,
    AwsClientCredentialsProvider? credentialsProvider,
    RequestSigner requestSigner = signAws4HmacSha256,
    bool disableHostPrefix = false,
    RetryOptions? retryOptions,
  }) {
    final manageHttpClient = client == null;
    client ??= Client();
    endpointBuilder ??= () => Endpoint.forProtocol(
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
      endpointBuilder,
      credentialsProvider,
      requestSigner,
      manageHttpClient,
      disableHostPrefix,
      retryOptions ?? RetryOptions(),
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
    Endpoint? endpoint,
    String? hostPrefix,
  }) async {
    final ep = endpoint ?? _endpoint;
    var uri = Uri.parse('${ep.url}$requestUri');
    uri = applyHostPrefix(uri, hostPrefix, disabled: _disableHostPrefix);
    uri = uri.replace(queryParameters: {
      ...uri.queryParametersAll,
      ...?queryParams,
    });

    // Rebuilt and re-signed on every attempt so retries carry a fresh
    // timestamp and signature.
    Future<Request> buildRequest() async {
      final rq = Request(
        method,
        uri,
      );
      if (payload != null) {
        if (payload is List<int>) {
          rq.bodyBytes = payload;
          rq.headers['content-type'] = 'application/octet-stream';
        } else if (payload is String) {
          rq.body = payload;
          rq.headers['content-type'] = 'text/plain';
        } else {
          rq.body = json.encode(payload);
          rq.headers['content-type'] = 'application/json';
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
          service: ep.service,
          region: ep.signingRegion,
          credentials: credentials,
        );
      }
      return rq;
    }

    final rs = await sendWithRetry(
      client: _client,
      options: _retryOptions,
      buildRequest: buildRequest,
    );

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
    Endpoint? endpoint,
    String? hostPrefix,
  }) async {
    final rs = await sendRaw(
      method: method,
      requestUri: requestUri,
      exceptionFnMap: exceptionFnMap,
      signed: signed,
      queryParams: queryParams,
      headers: headers,
      payload: payload,
      endpoint: endpoint,
      hostPrefix: hostPrefix,
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
