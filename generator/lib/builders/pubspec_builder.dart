import '../model/api.dart';
import '../model/config.dart';

String buildPubspecYaml(
  Api api, {
  required String packageVersion,
  required bool isDevMode,
  required ProtocolConfig protocolConfig,
}) {
  /// This si requiredin DevMode becuase if we depend on any generated S3 package
  /// such as aws_s3_api and then that in turn depends on the local copy of aws_shared_api
  /// then the top level app would although pick the locla aws_s3_api package but
  /// for some reason, the aws_shared_api is always picked up from dart packge hub
  var dependencies = '''
dependencies:
  shared_aws_api: ${protocolConfig.shared}''';
  var dependenciesOverride = '';

  if (isDevMode) {
    dependencies = '''
dependencies:
  shared_aws_api:
    path: ../../shared_aws_api''';
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
  sdk: '>=2.17.0 <3.0.0'

$dependencies

$dependenciesOverride
''';
}
