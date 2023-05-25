import '../../../shared/shared.dart';
import '../../aws_credential_providers.dart';

const _defaultChain = [
  fromEnvironment,
  fromIni,
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
