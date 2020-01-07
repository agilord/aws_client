import 'package:meta/meta.dart';

import '../model/api.dart';
import '../model/config.dart';

String buildPubspecYaml(
  Api api, {
  @required String packageVersion,
  @required bool isDevMode,
  @required ProtocolConfig protocolConfig,
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
  sdk: '>=2.7.0 <3.0.0'

dependencies:
  shared_aws_api: ${protocolConfig.shared}

dev_dependencies:
  build_runner: ^1.7.2
  json_serializable: ^3.2.0
  build_verify: ^1.1.1
  test: ^1.9.4

$dependenciesOverride
''';
}
