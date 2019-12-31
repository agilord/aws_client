// ignore_for_file: unused_field
import 'package:http/http.dart';

import '../credentials.dart';
import 'shared.dart';

class JsonProtocol {
  final String _endpointUrl;
  final Client _client;
  final String _service;
  final String _region;
  final Credentials _credentials;

  JsonProtocol._(
    this._client,
    this._service,
    this._region,
    this._endpointUrl,
    this._credentials,
  );

  factory JsonProtocol({
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
    service ??= extractService(Uri.parse(endpointUrl));
    region ??= extractRegion(Uri.parse(endpointUrl));
    return JsonProtocol._(client, service, region, endpointUrl, credentials);
  }
}
