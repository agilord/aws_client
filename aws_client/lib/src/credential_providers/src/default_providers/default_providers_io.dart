import '../../../shared/shared.dart';
import '../../aws_credential_providers.dart';

// Ordered to match the official AWS SDKs: static env, then web identity
// (EKS IRSA / OIDC), then the shared config profile (SSO, static or assumed
// role, then its credential_process), then the ECS/EKS container endpoint,
// and finally the EC2 instance metadata service.
const List<AwsClientCredentialsProvider> _defaultChain = [
  fromEnvironment,
  fromWebIdentity,
  fromSso,
  fromIni,
  fromProcess,
  fromContainer,
  fromInstanceMetaDataService,
];

Future<AwsClientCredentials?> _resolveChain({Client? client}) async {
  for (final provider in _defaultChain) {
    final credentials = await provider(client: client);
    if (credentials != null) {
      return credentials;
    }
  }

  return null;
}

final _cached = CachedCredentialProvider(_resolveChain);

/// Resolves credentials from the default provider chain and caches the result,
/// refreshing before temporary credentials expire. Caching the result keeps
/// each request from re-hitting IMDS, the container endpoint or STS.
Future<AwsClientCredentials?> defaultProvider({Client? client}) =>
    _cached.cacheAndRefreshWhenNeeded(client: client);
