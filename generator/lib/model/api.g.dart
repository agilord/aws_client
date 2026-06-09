// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) => Api(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      operations: (json['operations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Operation.fromJson(e as Map<String, dynamic>)),
      ),
      shapes: (json['shapes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Shape.fromJson(e as Map<String, dynamic>)),
      ),
      version: json['version'] as String?,
      documentation: json['documentation'] as String?,
      examples: json['examples'] as Map<String, dynamic>?,
      authorizers: (json['authorizers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Authorizer.fromJson(e as Map<String, dynamic>)),
      ),
    );

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'uid',
      'apiVersion',
      'endpointPrefix',
      'signingName',
      'globalEndpoint',
      'signatureVersion',
      'jsonVersion',
      'targetPrefix',
      'protocol',
      'protocols',
      'timeStampFormat',
      'xmlNamespaceUri',
      'xmlNamespace',
      'serviceAbbreviation',
      'serviceFullName',
      'serviceId',
      'checksumFormat',
      'protocolSettings',
      'auth',
      'awsQueryCompatible',
      'ripServiceName'
    ],
  );
  return Metadata(
    apiVersion: json['apiVersion'] as String,
    endpointPrefix: json['endpointPrefix'] as String,
    protocol: json['protocol'] as String,
    serviceFullName: json['serviceFullName'] as String,
    signingName: json['signingName'] as String?,
    globalEndpoint: json['globalEndpoint'] as String?,
    signatureVersion: json['signatureVersion'] as String?,
    jsonVersion: json['jsonVersion'] as String?,
    targetPrefix: json['targetPrefix'] as String?,
    timeStampFormat: json['timeStampFormat'] as String?,
    xmlNamespaceUri: json['xmlNamespaceUri'] as String?,
    serviceAbbreviation: json['serviceAbbreviation'] as String?,
    serviceId: json['serviceId'] as String?,
    uid: json['uid'] as String?,
    xmlNamespace: json['xmlNamespace'] as String?,
    checksumFormat: json['checksumFormat'] as String?,
    protocolSettings: (json['protocolSettings'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    protocols:
        (json['protocols'] as List<dynamic>?)?.map((e) => e as String).toList(),
    auth: json['auth'],
    awsQueryCompatible: json['awsQueryCompatible'],
    ripServiceName: json['ripServiceName'] as String?,
  );
}

Authorizer _$AuthorizerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'type', 'placement'],
  );
  return Authorizer(
    json['name'] as String,
    json['type'] as String,
    Placement.fromJson(json['placement'] as Map<String, dynamic>),
  );
}

Placement _$PlacementFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['location', 'name'],
  );
  return Placement(
    json['location'] as String,
    json['name'] as String,
  );
}
