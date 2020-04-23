import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../credentials.dart';
import 'shared.dart';

class RestJsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final AwsClientCredentials _credentials;

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
    AwsClientCredentials credentials,
  }) {
    client ??= Client();
    if (service == null || region == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }
    endpointUrl ??= 'https://$service.$region.amazonaws.com';
    service ??= extractService(Uri.parse(endpointUrl));
    region ??= extractRegion(Uri.parse(endpointUrl));
    credentials ??= AwsClientCredentials.resolve();
    ArgumentError.checkNotNull(credentials, 'credentials');
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
    print('$_endpointUrl$_client$_service$_region$_credentials');
    throw UnimplementedError('rest-json not implemented');
  }
}
