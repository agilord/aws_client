import '../../shared/shared.dart';

/// Utility class for caching credentials from a credential provider,
/// with built in support for refreshing when expired.
class CachedCredentialProvider {
  final AwsClientCredentialsProvider credentialsProvider;

  /// How long before a credential's expiry it is refreshed, so requests are
  /// never signed with credentials that are about to expire.
  final Duration refreshBuffer;

  AwsClientCredentials? previousCreds;
  Future<AwsClientCredentials?>? _inFlight;

  CachedCredentialProvider(
    this.credentialsProvider, {
    this.refreshBuffer = const Duration(minutes: 5),
  });

  /// Pass as tearoff to an "aws_xxx_api" constructor.
  /// Example:
  /// ```dart
  /// final ddb = DynamoDB(
  ///  region: 'eu-west-1',
  ///  credentialsProvider: CachedCredentialProvider(fromIni).cacheAndRefreshWhenNeeded,
  /// );
  /// ```
  Future<AwsClientCredentials?> cacheAndRefreshWhenNeeded({
    Client? client,
  }) {
    if (!_needsRefresh()) {
      return Future.value(previousCreds);
    }
    // Share a single fetch between callers that arrive while a refresh is
    // already underway.
    return _inFlight ??= _refresh(client: client);
  }

  bool _needsRefresh() {
    final creds = previousCreds;
    if (creds == null) return true;
    final expiration = creds.expiration;
    if (expiration == null) return false;
    return DateTime.now().isAfter(expiration.subtract(refreshBuffer));
  }

  Future<AwsClientCredentials?> _refresh({Client? client}) async {
    try {
      previousCreds = await credentialsProvider(client: client);
      return previousCreds;
    } finally {
      _inFlight = null;
    }
  }
}
