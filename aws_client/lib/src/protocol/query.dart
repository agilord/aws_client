import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

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
    String resultWrapper,
  }) async {
    final rq = _buildRequest(data, method, requestUri);
    final rs = await _client.send(rq);
    _verifyStatusCode(rs);
    // TODO: throw exception on error codes
    final body = await rs.stream.bytesToString();
    final root = parse(body);
    XmlElement elem = root.rootElement;
    if (resultWrapper != null) {
      elem = elem.findElements(resultWrapper).first;
    }
    return _xmlToMap(elem);
  }

  Request _buildRequest(
      Map<String, dynamic> data, String method, String requestUri) {
    final rq = Request(method, Uri.parse('$_endpointUrl$requestUri'));
    // TODO: handle data that does not conform <String, String>.
    rq.bodyFields = data.cast<String, String>();
    rq.headers['X-Amz-Date'] = _currentDateHeader();
    // TODO: sign request
    return rq;
  }

  void _verifyStatusCode(BaseResponse rs) {
    if (rs.statusCode >= 200 && rs.statusCode <= 207) return;
    throw Exception('Bad response code=${rs.statusCode}.');
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
