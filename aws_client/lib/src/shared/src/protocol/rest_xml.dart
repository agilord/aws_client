import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';
import '_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class RestXmlProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentialsProvider? _credentialsProvider;
  final RequestSigner _requestSigner;
  final bool _manageHttpClient;
  bool _closed = false;

  RestXmlProtocol._(
    this._client,
    this._endpoint,
    this._credentialsProvider,
    this._requestSigner,
    this._manageHttpClient,
  );

  factory RestXmlProtocol({
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

    return RestXmlProtocol._(
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
    String? resultWrapper,
  }) async {
    final rq = await _buildRequest(
      method,
      requestUri,
      signed,
      queryParams,
      payload,
      headers,
    );
    final rs = await _client.send(rq);

    if (rs.statusCode < 200 || rs.statusCode >= 300) {
      final body = await rs.stream.bytesToString();
      XmlDocument? root;
      if (body.isNotEmpty == true) {
        root = XmlDocument.parse(body);
      }
      final elem = root?.rootElement;

      if (elem?.name.local == 'ErrorResponse') {
        final error = elem!.findElements('Error').first;
        final type = error.findElements('Type').first.innerText;
        final code = error.findElements('Code').first.innerText;
        final message = error.findElements('Message').first.innerText;
        final fn = exceptionFnMap[code];
        final exception = fn != null
            ? fn(type, message)
            : GenericAwsException(type: type, code: code, message: message);
        throw exception;
      } else if (elem?.name.local == 'Error') {
        final code = elem!.findElements('Code').first.innerText;
        final message = elem.findElements('Message').first.innerText;
        throw GenericAwsException(code: code, message: message);
      } else {
        throwException(rs, body, exceptionFnMap);
      }
    }
    return rs;
  }

  Future<RestXmlResponse> send({
    required String method,
    required String requestUri,
    required Map<String, AwsExceptionFn> exceptionFnMap,
    bool signed = true,
    Map<String, List<String>>? queryParams,
    Map<String, String>? headers,
    dynamic payload,
    String? resultWrapper,
  }) async {
    final rs = await sendRaw(
      method: method,
      requestUri: requestUri,
      exceptionFnMap: exceptionFnMap,
      signed: signed,
      queryParams: queryParams,
      headers: headers,
      payload: payload,
      resultWrapper: resultWrapper,
    );

    final elem = await xmlFromResponse(rs, resultWrapper: resultWrapper);
    return RestXmlResponse(rs.headers, elem);
  }

  Future<Request> _buildRequest(
    String method,
    String requestUri,
    bool signed,
    Map<String, List<String>>? queryParams,
    dynamic payload,
    Map<String, String>? headers,
  ) async {
    var uri = Uri.parse('${_endpoint.url}$requestUri');
    uri = uri.replace(queryParameters: {
      ...uri.queryParametersAll,
      ...?queryParams,
    });

    final rq = Request(
      method,
      uri,
    );

    rq.headers.addAll(headers ?? {});

    if (payload is XmlElement) {
      rq.body = payload.toXmlString();
      rq.headers['Content-Type'] = 'application/xml';
    } else if (payload is String) {
      rq.body = payload;
    } else if (payload is Uint8List) {
      rq.bodyBytes = payload;
    } else if (payload != null) {
      throw UnimplementedError(
          'Not implemented payload type: ${payload.runtimeType}');
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

    return rq;
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

class RestXmlResponse {
  final Map<String, String> headers;
  final XmlElement body;

  RestXmlResponse(this.headers, this.body);
}
