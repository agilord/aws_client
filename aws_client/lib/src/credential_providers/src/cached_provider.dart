import '../../shared/shared.dart';

/// Utility class for caching credentials from a credential provider,
/// with built in support for refreshing when expired.
class CachedCredentialProvider {
  final AwsClientCredentialsProvider credentialsProvider;
  AwsClientCredentials? previousCreds;

  CachedCredentialProvider(this.credentialsProvider);

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
  }) async {
    final expiration = previousCreds?.expiration;

    if (previousCreds == null ||
        expiration != null && DateTime.now().isAfter(expiration)) {
      previousCreds = await credentialsProvider(client: client);
    }

    return previousCreds;
  }
}
