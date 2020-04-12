import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';

import '_sign.dart';
import 'shared.dart';
import 'shared.dart';

class QueryProtocol {
  final Client _client;
  final String _service;
  final String _region;
  final String _endpointUrl;
  final AwsClientCredentials _credentials;

  QueryProtocol._(this._client,
      this._service,
      this._region,
      this._endpointUrl,
      this._credentials,);

  factory QueryProtocol({
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
    return QueryProtocol._(client, service, region, endpointUrl, credentials);
  }

  Future<XmlElement> send(Map<String, dynamic> data, {
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    String resultWrapper,
  }) async {
    final rq = _buildRequest(data, method, requestUri);
    final rs = await _client.send(rq);
    final body = await rs.stream.bytesToString();
    final root = parse(body);
    var elem = root.rootElement;
    if (elem.name.local == 'ErrorResponse') {
      final error = elem
          .findElements('Error')
          .first;
      final type = error
          .findElements('Type')
          .first
          .text;
      final code = error
          .findElements('Code')
          .first
          .text;
      final message = error
          .findElements('Message')
          .first
          .text;
      final fn = exceptionFnMap[code];
      final exception = fn != null
          ? fn(type, message)
          : GenericAwsException(type: type, code: code, message: message);
      throw exception;
    }
    if (resultWrapper != null) {
      elem = elem
          .findElements(resultWrapper)
          .first;
    }
    return elem;
  }

  Request _buildRequest(Map<String, dynamic> data, String method,
      String requestUri) {
    final rq = Request(method, Uri.parse('$_endpointUrl$requestUri'));
    rq.body = _canonical(flatQueryParams(data));
    rq.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    // TODO: handle if the API is using different signing
    signAws4HmacSha256(
      rq: rq,
      service: _service,
      region: _region,
      credentials: _credentials,
    );
    return rq;
  }
}

@visibleForTesting
Map<String, String> flatQueryParams(dynamic data) {
  return Map.fromEntries(_flatten([], data));
}

Iterable<MapEntry<String, String>> _flatten(List<String> prefixes,
    dynamic data, {int mapIndex}) sync* {
  if (data == null) {
    return;
  }

  if (data is String) {
    final key = prefixes.join('.');
    yield MapEntry(key, data);
    return;
  }
  if (data is int) {
    final key = prefixes.join('.');
    yield MapEntry(key, data.toString());
    return;
  }

  if (data is List) {
    if (data.isEmpty) {
      final key = prefixes.join('.');
      yield MapEntry(key, '');
    } else {
      for (var i = 0; i < data.length; i++) {
        final newPrefixes = [...prefixes, '${i + 1}'];
        yield* _flatten(newPrefixes, data[i]);
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
        yield* _flatten([...prefixes, key], e.value);
      } else {
        if (e.value is MessageAttributeValue) {
          yield* _flatten(['MessageAttribute.${i + 1}.Name'], key, mapIndex: i);
        } else if (e.value is MessageSystemAttributeValue) {
          yield* _flatten(['MessageAttribute.${i + 1}.Name'], key, mapIndex: i);
        } else {
          yield* _flatten(
              [...prefixes, 'entry', '${i + 1}', 'key'], key, mapIndex: i);
        }
        yield* _flatten(
            [...prefixes, 'entry', '${i + 1}', 'value'], e.value, mapIndex: i);
      }
      i++;
    }
    return;
  }

  if (data is MessageAttributeValue) {
    yield* _flatten(
        ['MessageAttribute.${mapIndex + 1}.Value.DataType'], data.dataType);
    if (data.dataType == 'String') {
      yield* _flatten(['MessageAttribute.${mapIndex + 1}.Value.StringValue'],
          data.stringValue);
    } else {
      yield* _flatten(['MessageAttribute.${mapIndex + 1}.Value.BinaryValue'],
          data.binaryValue);
    }
    return;
  }

  if (data is MessageSystemAttributeValue) {
    yield* _flatten(['MessageSystemAttribute.${mapIndex + 1}.Value.DataType'],
        data.dataType);
    if (data.dataType == 'String') {
      yield* _flatten(
          ['MessageSystemAttribute.${mapIndex + 1}.Value.StringValue'],
          data.stringValue);
    } else {
      yield* _flatten(
          ['MessageSystemAttribute.${mapIndex + 1}.Value.BinaryValue'],
          data.binaryValue);
    }
    return;
  }

  throw ArgumentError(
      'Unknown type at "${prefixes.join('.')}": ${data.runtimeType} ($data)');
}

String _canonical(Map<String, String> data) {
  final list = data.entries
      .map((e) =>
  '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
      .toList();
  list.sort();
  return list.join('&');
}
