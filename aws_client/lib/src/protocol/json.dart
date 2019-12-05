import 'package:http/http.dart';

class JsonProtocol {
  final String _endpointUrl;
  final Client _client;

  JsonProtocol({String endpointUrl, Client client})
      : _endpointUrl = endpointUrl,
        _client = client ?? Client() {
    print(_endpointUrl);
    print(_client);
  }
}
