import 'package:shared_aws_api/shared.dart';

import 'env/env.dart';
import 'ini/ini.dart';

/// Utility class for chaining multiple providers in a fallback chain
/// Example usage with default chain:
///
/// ```dart
/// final sts = STS(credentialsProvider: ChainedCredentialProvider.defaultProviderChain);
/// ```
class ChainedCredentialProvider {
  final List<AwsClientCredentialsProvider> credentialProviders;
  static const defaultChain = [
    fromEnvironment,
    fromIni,
    // TODO: AWS IDMS
  ];

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

  static Future<AwsClientCredentials?> defaultProviderChain(
      {Client? client}) async {
    for (final provider in defaultChain) {
      final credentials = await provider(client: client);
      if (credentials != null) {
        return credentials;
      }
    }

    return null;
  }
}
