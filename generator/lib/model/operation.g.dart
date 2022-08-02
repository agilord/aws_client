// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const [
    'name',
    'http',
    'authtype',
    'input',
    'output',
    'errors',
    'documentation',
    'documentationUrl',
    'idempotent',
    'deprecated',
    'deprecatedMessage',
    'endpoint',
    'alias',
    'endpointdiscovery',
    'endpointoperation',
    'internal',
    'internalonly',
    'httpChecksumRequired',
    'methodNameOverride',
    'httpChecksum'
  ]);
  return Operation(
    json['name'] as String,
    json['http'] == null
        ? null
        : Http.fromJson(json['http'] as Map<String, dynamic>),
    json['authtype'] as String ?? '',
    json['input'] == null
        ? null
        : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
    json['output'] == null
        ? null
        : Descriptor.fromJson(json['output'] as Map<String, dynamic>),
    (json['errors'] as List)
        ?.map((e) =>
            e == null ? null : Descriptor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['documentation'] as String,
    json['documentationUrl'] as String,
    json['idempotent'] as bool ?? false,
    json['deprecated'] as bool ?? false,
    json['deprecatedMessage'] as String,
    json['endpoint'] == null
        ? null
        : EndPoint.fromJson(json['endpoint'] as Map<String, dynamic>),
    json['alias'] as String,
    json['endpointdiscovery'] as Map<String, dynamic>,
    json['endpointoperation'] as bool ?? false,
    json['internal'] as bool,
    json['internalonly'] as bool,
    json['httpChecksumRequired'] as bool ?? false,
    json['methodNameOverride'] as String,
    json['httpChecksum'],
  );
}

EndPoint _$EndPointFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['hostPrefix']);
  return EndPoint(
    json['hostPrefix'] as String,
  );
}

Http _$HttpFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['method', 'requestUri', 'responseCode']);
  return Http(
    json['method'] as String ?? 'POST',
    json['requestUri'] as String ?? '/',
    json['responseCode'] as int,
  );
}
