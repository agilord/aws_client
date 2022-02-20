import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart';

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
