import '../model/api.dart';
import '../model/config.dart';

String buildPubspecYaml(
  Api api, {
  required String packageVersion,
  required bool isDevMode,
  required ProtocolConfig protocolConfig,
}) {
  var dependenciesOverride = '';
  if (isDevMode) {
    dependenciesOverride = '''
dependency_overrides:
  shared_aws_api:
    path: ../../shared_aws_api''';
  }

  final publishTo = protocolConfig.publish ? '\n' : 'publish_to: none\n';

  return '''name: ${api.packageName}
description: AWS API client for ${api.metadata.serviceFullName} (generated from SDK API specification).
version: $packageVersion
homepage: https://github.com/agilord/aws_client/tree/master/generated/${api.packageName}
$publishTo
protocol: ${api.metadata.protocol}

environment:
  sdk: '>=2.12.0 <3.0.0'

dependencies:
  shared_aws_api: ${protocolConfig.shared}
  aws_credential_providers: ${protocolConfig.credentialProviders}

$dependenciesOverride
''';
}
