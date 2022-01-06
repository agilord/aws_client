import '../model/region_config.dart';
import '../utils/case.dart';

String buildEndpointConfig(RegionConfigData regionConfigData) {
  final code = StringBuffer()..writeln('''
// AUTO-GENERATED: This file is generated by the `generator` package

import 'endpoint.dart';

final rules = <String, RegionConfig>{
''');
  var usedRules = <String>[];
  for (var ruleEntry in regionConfigData.rules.entries) {
    final value = ruleEntry.value;
    String valueCode;
    if (value is String) {
      valueCode = '_${lowerCamel(splitWords(value))}';
      usedRules.add(value);
    } else {
      final regionConfig = RegionConfig.fromJson(value as Map<String, dynamic>);
      valueCode = _regionConfigToCode(regionConfig);
    }

    code.writeln("'${ruleEntry.key}': $valueCode,");
  }

  code.writeln('};');

  for (var pattern in regionConfigData.patterns.entries) {
    if (usedRules.contains(pattern.key)) {
      code.writeln('');
      code.writeln(
          'final _${lowerCamel(splitWords(pattern.key))} = ${_regionConfigToCode(pattern.value)};');
    }
  }

  return '$code';
}

String _regionConfigToCode(RegionConfig config) {
  final properties = {
    'endpoint': config.endpoint,
    'globalEndpoint': config.globalEndpoint,
    'signatureVersion': config.signatureVersion,
    'signingRegion': config.signingRegion,
  };

  final code = StringBuffer('RegionConfig(');
  for (var property in properties.entries.where((e) => e.value != null)) {
    final propertyValue = property.value;
    String valueCode;
    if (propertyValue is bool) {
      valueCode = '$propertyValue';
    } else {
      valueCode = "'$propertyValue'";
    }
    code.writeln('${property.key}: $valueCode,');
  }
  code.writeln(')');
  return '$code';
}
