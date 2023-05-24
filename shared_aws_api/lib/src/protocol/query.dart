import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';
import '../model/shape.dart';
import '../utils/query_string.dart';
import '_sign.dart';
import 'endpoint.dart';
import 'shared.dart';

class QueryProtocol {
  final Client _client;
  final Endpoint _endpoint;
  final AwsClientCredentialsProvider? _credentialsProvider;
  final RequestSigner _requestSigner;
  final bool _manageHttpClient;
  bool _closed = false;

  QueryProtocol._(
    this._client,
    this._endpoint,
    this._credentialsProvider,
    this._requestSigner,
    this._manageHttpClient,
  );

  factory QueryProtocol({
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

    return QueryProtocol._(
      client,
      endpoint,
      credentialsProvider,
      requestSigner,
      manageHttpClient,
    );
  }

  Future<XmlElement> send(
    Map<String, dynamic> data, {
    required String method,
    required String requestUri,
    required Map<String, AwsExceptionFn> exceptionFnMap,
    bool signed = true,
    Shape? shape,
    required Map<String, Shape> shapes,
    required String version,
    required String action,
    String? resultWrapper,
  }) async {
    final rq = await _buildRequest(
      data,
      method,
      requestUri,
      signed,
      shape,
      shapes,
      version,
      action,
    );

    final rs = await _client.send(rq);
    final body = await rs.stream.bytesToString();
    final root = XmlDocument.parse(body);
    var elem = root.rootElement;

    if (elem.name.local == 'ErrorResponse') {
      final error = elem.findElements('Error').first;
      final type = error.findElements('Type').first.innerText;
      final code = error.findElements('Code').first.innerText;
      final message = error.findElements('Message').first.innerText;
      final fn = exceptionFnMap[code];
      final exception = fn != null
          ? fn(type, message)
          : GenericAwsException(type: type, code: code, message: message);
      throw exception;
    }

    if (resultWrapper != null) {
      elem = elem.findElements(resultWrapper).first;
    }

    return elem;
  }

  Future<Request> _buildRequest(
    Map<String, dynamic> data,
    String method,
    String requestUri,
    bool signed,
    Shape? shape,
    Map<String, Shape> shapes,
    String version,
    String action,
  ) async {
    final rq = Request(method, Uri.parse('${_endpoint.url}$requestUri'));
    rq.body = canonicalQueryParameters(
        flatQueryParams(data, shape, shapes, version, action));
    rq.headers['Content-Type'] = 'application/x-www-form-urlencoded';

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

@visibleForTesting
Map<String, String> flatQueryParams(
  dynamic data,
  Shape? shape,
  Map<String, Shape> shapes,
  String version,
  String action,
) {
  return Map.fromEntries(_flatten([], data, shape, shapes))
    ..addAll({'Action': action, 'Version': version});
}

Iterable<MapEntry<String, String>> _flatten(
  List<String> prefixes,
  dynamic data,
  Shape? shape,
  Map<String, Shape> shapes,
) sync* {
  if (data == null) {
    return;
  }

  if (data is bool) {
    final key = prefixes.join('.');
    yield MapEntry(key, data.toString());
    return;
  }

  if (data is String) {
    final key = prefixes.join('.');
    if (shape!.type == 'blob') {
      yield MapEntry(key, base64.encode(utf8.encode(data)));
    } else {
      yield MapEntry(key, data);
    }
    return;
  }
  if (data is int || data is double) {
    final key = prefixes.join('.');
    yield MapEntry(key, data.toString());
    return;
  }

  if (data is DateTime) {
    final key = prefixes.join('.');
    String? timeStampFormat = 'iso8601';
    if (shape!.timestampFormat != null) {
      timeStampFormat = shape.timestampFormat;
    }

    String? formattedDate;
    switch (timeStampFormat) {
      case 'iso8601':
        formattedDate = iso8601ToJson(data);
        break;
      case 'unixTimestamp':
        formattedDate = unixTimestampToJson(data).toString();
        break;
      case 'rfc822':
        formattedDate = rfc822ToJson(data);
        break;
    }
    yield MapEntry(key, formattedDate!);
    return;
  }

  if (data is Uint8List) {
    yield MapEntry(prefixes.join('.'), base64Encode(data));
    return;
  }

  if (data is List) {
    if (data.isEmpty) {
      final key = prefixes.join('.');
      yield MapEntry(key, '');
    } else {
      final member = shapes[shape!.member?.shape!];
      final name = shape.member?.locationName ?? member?.locationName;

      if (shape.flattened && name != null) {
        prefixes.removeLast();
        prefixes.add(name);
      }

      for (var i = 0; i < data.length; i++) {
        final newPrefixes = [
          ...prefixes,
          if (!shape.flattened) name ?? 'member',
          '${i + 1}',
        ];
        yield* _flatten(newPrefixes, data[i], member, shapes);
      }
    }
    return;
  }

  // TODO: to remove it once we call .toJson at request building time.
  if (data is! Map) {
    data = data.toJson();
  }

  if (data is Map && shape?.type == 'structure') {
    for (final entry in shape!.members!.entries) {
      final member = entry.value;
      final value = data[entry.key];
      final name = shapes[entry.key]?.member?.locationName ?? entry.key;

      if (value != null) {
        yield* _flatten(
          [
            ...prefixes,
            name,
          ],
          value,
          shapes[member.shape!],
          shapes,
        );
      }
    }
    return;
  }

  if (data is Map) {
    var flat = false;
    if (prefixes.isEmpty) flat = true;

    var i = 0;
    for (final e in data.entries) {
      final key = e.key;
      if (flat && key is String) {
        yield* _flatten([...prefixes, key], e.value, shape, shapes);
      } else {
        yield* _flatten(
          [
            ...prefixes,
            if (!shape!.flattened) 'entry',
            '${i + 1}',
            shape.key!.locationName ?? 'key',
          ],
          key,
          shapes[shape.key!.shape!],
          shapes,
        );
        yield* _flatten(
          [
            ...prefixes,
            if (!shape.flattened) 'entry',
            '${i + 1}',
            shape.value!.locationName ?? 'value',
          ],
          e.value,
          shapes[shape.value!.shape!],
          shapes,
        );
      }
      i++;
    }
    return;
  }

  throw ArgumentError(
      'Unknown type at "${prefixes.join('.')}": ${data.runtimeType} ($data)');
}
