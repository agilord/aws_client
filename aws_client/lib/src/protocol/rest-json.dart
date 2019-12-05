import 'package:http/http.dart';

class RestJsonProtocol {
  final String _endpointUrl;
  final Client _client;

  RestJsonProtocol({String endpointUrl, Client client})
      : _endpointUrl = endpointUrl,
        _client = client ?? Client() {
    print(_endpointUrl);
    print(_client);
  }
}
