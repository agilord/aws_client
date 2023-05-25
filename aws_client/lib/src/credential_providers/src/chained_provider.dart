import '../../shared/shared.dart';

/// Utility class for chaining multiple providers in a fallback chain
/// Example usage with default chain:
///
/// ```dart
/// import 'package:aws_credential_providers/aws_credential_providers.dart';
/// import 'package:aws_client/sts_2011_06_15.dart';
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
