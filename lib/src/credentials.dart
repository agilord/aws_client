/// AWS credentials.
class Credentials {
  /// AWS access key
  final String accessKey;

  /// AWS secret key
  final String secretKey;

  /// AWS credentials.
  Credentials({this.accessKey, this.secretKey}) {
    assert(accessKey != null);
    assert(secretKey != null);
  }
}
