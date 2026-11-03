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
    return _expiresWithin(creds, refreshBuffer);
  }

  bool _expiresWithin(AwsClientCredentials creds, Duration buffer) {
    final expiration = creds.expiration;
    if (expiration == null) return false;
    return DateTime.now().isAfter(expiration.subtract(buffer));
  }

  Future<AwsClientCredentials?> _refresh({Client? client}) async {
    try {
      previousCreds = await credentialsProvider(client: client);
      return previousCreds;
    } catch (_) {
      // Refreshing early means a failed attempt still leaves credentials
      // that are valid for the rest of the buffer; keep signing with them.
      final current = previousCreds;
      if (current != null && !_expiresWithin(current, Duration.zero)) {
        return current;
      }
      rethrow;
    } finally {
      _inFlight = null;
    }
  }
}
