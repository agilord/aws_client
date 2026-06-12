// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      name: json['name'] as String,
      http: Http.fromJson(json['http'] as Map<String, dynamic>),
      authtype: json['authtype'] as String? ?? '',
      input: json['input'] == null
          ? null
          : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
      output: json['output'] == null
          ? null
          : Descriptor.fromJson(json['output'] as Map<String, dynamic>),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Descriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentation: json['documentation'] as String?,
      documentationUrl: json['documentationUrl'] as String?,
      idempotent: json['idempotent'] as bool? ?? false,
      deprecated: json['deprecated'] as bool? ?? false,
      deprecatedMessage: json['deprecatedMessage'] as String?,
      endpoint: json['endpoint'] == null
          ? null
          : EndPoint.fromJson(json['endpoint'] as Map<String, dynamic>),
      alias: json['alias'] as String?,
      endpointdiscovery: json['endpointdiscovery'] as Map<String, dynamic>?,
      endpointoperation: json['endpointoperation'] as bool? ?? false,
      internal: json['internal'] as bool?,
      internalonly: json['internalonly'] as bool?,
      httpChecksumRequired: json['httpChecksumRequired'] as bool? ?? false,
      methodNameOverride: json['methodNameOverride'] as String?,
    );

EndPoint _$EndPointFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['hostPrefix'],
  );
  return EndPoint(
    json['hostPrefix'] as String,
  );
}

Http _$HttpFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['method', 'requestUri', 'responseCode'],
  );
  return Http(
    method: json['method'] as String? ?? 'POST',
    requestUri: json['requestUri'] as String? ?? '/',
    responseCode: (json['responseCode'] as num?)?.toInt(),
  );
}
