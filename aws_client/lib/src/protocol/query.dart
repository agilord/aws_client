import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import 'shared.dart';

class QueryProtocol {
  final String _endpointUrl;
  final Client _client;

  QueryProtocol({String endpointUrl, Client client})
      : _endpointUrl = endpointUrl,
        _client = client ?? Client();

  Future<Map<String, dynamic>> send(
    Map<String, dynamic> data, {
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
      final error = elem.findElements('Error').first;
      final type = error.findElements('Type').first.text;
      final code = error.findElements('Code').first.text;
      final message = error.findElements('Message').first.text;
      final fn = exceptionFnMap[code];
      final exception = fn != null
          ? fn(type, message)
          : AwsException(type: type, code: code, message: message);
      throw exception;
    }
    if (resultWrapper != null) {
      elem = elem.findElements(resultWrapper).first;
    }
    return _xmlToMap(elem);
  }

  Request _buildRequest(
      Map<String, dynamic> data, String method, String requestUri) {
    final rq = Request(method, Uri.parse('$_endpointUrl$requestUri'));
    final flatData = _flatQueryParams(data);
    rq.bodyFields = flatData;
    rq.headers['X-Amz-Date'] = _currentDateHeader();
    // TODO: sign request
    return rq;
  }

  Map<String, dynamic> _xmlToMap(XmlElement elem) {
    return Map<String, dynamic>.fromEntries(
      elem.children.whereType<XmlElement>().map((e) {
        if (e.firstChild is XmlElement) {
          return MapEntry<String, dynamic>(
              e.name.local, _xmlToMap(e.firstChild as XmlElement));
        } else {
          return MapEntry<String, dynamic>(e.name.local, e.text);
        }
      }),
    );
  }
}

String _currentDateHeader() {
  final date = DateTime.now()
      .toUtc()
      .toIso8601String()
      .replaceAll('-', '')
      .replaceAll(':', '')
      .split('.')
      .first;
  return '${date}Z';
}

Map<String, String> _flatQueryParams(dynamic data) {
  return Map.fromEntries(_flatten([], data));
}

Iterable<MapEntry<String, String>> _flatten(
    List<String> prefixes, dynamic data) sync* {
  if (data == null) return;

  if (data is String) {
    final key = prefixes.join('.');
    yield MapEntry(key, data);
  }

  if (data is List) {
    for (var i = 0; i < data.length; i++) {
      final newPrefixes = [...prefixes, '${i + 1}'];
      yield* _flatten(newPrefixes, data[i]);
    }
  }

  if (data is Map) {
    var i = 0;
    for (final e in data.entries) {
      yield* _flatten([...prefixes, 'entry', '${i + 1}', 'key'], e.key);
      yield* _flatten([...prefixes, 'entry', '${i + 1}', 'value'], e.value);
      i++;
    }
  }

  throw ArgumentError(
      'Unknown type at "${prefixes.join('.')}": ${data.runtimeType} ($data)');
}
