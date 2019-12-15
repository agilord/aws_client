import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../credentials.dart';
import 'shared.dart';

class RestJsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final Credentials _credentials;

  RestJsonProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory RestJsonProtocol({
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
    return RestJsonProtocol._(
        client, service, region, endpointUrl, credentials);
  }

  Future<Map<String, dynamic>> send(
    dynamic data, {
    @required String method,
    @required String requestUri,
    @required Map<String, AwsExceptionFn> exceptionFnMap,
    Map<String, String> headers,
  }) async {
    throw UnimplementedError('rest-json not implemented');
  }
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
