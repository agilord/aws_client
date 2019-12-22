import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../credentials.dart';
import 'shared.dart';

class RestXmlProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final Credentials _credentials;

  RestXmlProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory RestXmlProtocol({
    Client client,
    String service,
    String region,
    String endpointUrl,
    Credentials credentials,
  }) {
    client ??= Client();
    if (service == null || region == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }
    endpointUrl ??= 'https://$service.$region.amazonaws.com';
    service ??= _extractService(Uri.parse(endpointUrl));
    region ??= _extractRegion(Uri.parse(endpointUrl));
    return RestXmlProtocol._(client, service, region, endpointUrl, credentials);
  }

  Future<RestXmlResponse> send({
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> queryParams,
    Map<String, String> headers,
  }) async {
    print('$_endpointUrl$_client$_service$_region$_credentials');
    throw UnimplementedError('rest-xml not implemented');
  }
}

class RestXmlResponse {
  final Map<String, String> headers;
  final XmlElement body;

  RestXmlResponse(this.headers, this.body);
}

String _extractService(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4) return parts.first;
  throw Exception('Unable to detect service in ${uri.host}.');
}

String _extractRegion(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4 && parts[1].contains('-')) return parts[1];
  throw Exception('Unable to detect region in ${uri.host}.');
}
