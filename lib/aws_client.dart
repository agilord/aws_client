import 'package:http_client/http_client.dart';

import 'src/credentials.dart';
import 'sqs.dart';

/// AWS access facade that helps to initialize multiple services with common
/// settings (credentials and HTTP client).
class Aws {
  final Credentials _credentials;
  final BaseClient _httpClient;

  Sqs _sqs;

  ///
  Aws({Credentials credentials, BaseClient httpClient})
      : _credentials = credentials,
        _httpClient = httpClient {
    assert(this._credentials != null);
    assert(this._httpClient != null);
  }

  /// Returns an SQS service, inheriting the properties of this instance.
  Sqs get sqs =>
      _sqs ??= new Sqs(credentials: _credentials, httpClient: _httpClient);
}
