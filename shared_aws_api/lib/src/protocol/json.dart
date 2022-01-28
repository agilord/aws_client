// ignore_for_file: unused_field
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../credentials.dart';
import '_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class JsonProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentialsProvider? _credentialsProvider;
  final RequestSigner _requestSigner;
  final bool _manageHttpClient;
  bool _closed = false;

  JsonProtocol._(
    this._client,
    this._endpoint,
    this._credentialsProvider,
    this._requestSigner,
    this._manageHttpClient,
  );

  factory JsonProtocol({
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

    return JsonProtocol._(
      client,
      endpoint,
      credentialsProvider,
      requestSigner,
      manageHttpClient,
    );
  }

  Future<JsonResponse> send({
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
