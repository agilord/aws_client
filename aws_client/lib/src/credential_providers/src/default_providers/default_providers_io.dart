import '../../../shared/shared.dart';
import '../../aws_credential_providers.dart';

// Ordered to match the official AWS SDKs: static env, then web identity
// (EKS IRSA / OIDC), then shared config profiles, then the ECS/EKS container
// endpoint, and finally the EC2 instance metadata service.
const List<AwsClientCredentialsProvider> _defaultChain = [
  fromEnvironment,
  fromWebIdentity,
  fromIni,
  fromContainer,
  fromInstanceMetaDataService,
];

Future<AwsClientCredentials?> defaultProvider({Client? client}) async {
  for (final provider in _defaultChain) {
    final credentials = await provider(client: client);
    if (credentials != null) {
      return credentials;
    }
  }

  return null;
}
