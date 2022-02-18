import 'package:shared_aws_api/shared.dart';

/// Utility class for chaining multiple providers in a fallback chain
/// Example usage with default chain:
///
/// ```dart
/// import 'package:aws_credential_providers/aws_credential_providers.dart';
/// import 'package:aws_sts_api/sts-2011-06-15.dart';
///
/// final sts = STS(
///  credentialsProvider: ChainedCredentialProvider([
///     fromEnvironment,
///     fromIni,
///     fromInstanceMetaDataService,
///   ]).chainedFallback,
/// );
/// ```
class ChainedCredentialProvider {
  final List<AwsClientCredentialsProvider> credentialProviders;

  ChainedCredentialProvider(this.credentialProviders);

  Future<AwsClientCredentials?> chainedFallback({Client? client}) async {
    for (final provider in credentialProviders) {
      final credentials = await provider(client: client);
      if (credentials != null) {
        return credentials;
      }
    }

    return null;
  }
}
