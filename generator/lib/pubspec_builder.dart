import 'package:meta/meta.dart';

import 'model/api.dart';

String buildPubspecYaml(
  Api api, {
  @required String packageVersion,
  @required String sharedVersion,
  @required bool isDevMode,
}) {
  var dependenciesOverride = '';
  if (isDevMode) {
  dependenciesOverride = '''
dependency_overrides:
  aws_client:
    path: ../../aws_client
''';

  return '''name: ${api.packageName}
version: $packageVersion
publish_to: none

environment:
  sdk: '>=2.6.0 <3.0.0'

dependencies:
  aws_client: $sharedVersion
  http: ^0.12.0
  json_annotation: ^3.0.0

dev_dependencies:
  build_runner: ^1.7.2
  json_serializable: ^3.2.0
$dependenciesOverride
''';
}
