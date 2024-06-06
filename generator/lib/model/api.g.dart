// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) => Api(
      Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      (json['operations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Operation.fromJson(e as Map<String, dynamic>)),
      ),
      (json['shapes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Shape.fromJson(e as Map<String, dynamic>)),
      ),
      json['version'] as String?,
      json['documentation'] as String?,
      json['examples'] as Map<String, dynamic>?,
      (json['authorizers'] as Map<String, dynamic>?)?.map(
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
    json['apiVersion'] as String,
    json['endpointPrefix'] as String,
    json['signingName'] as String?,
    json['globalEndpoint'] as String?,
    json['signatureVersion'] as String?,
    json['jsonVersion'] as String?,
    json['targetPrefix'] as String?,
    json['protocol'] as String,
    json['timeStampFormat'] as String?,
    json['xmlNamespaceUri'] as String?,
    json['serviceAbbreviation'] as String?,
    json['serviceFullName'] as String,
    json['serviceId'] as String?,
    json['uid'] as String?,
    json['xmlNamespace'] as String?,
    json['checksumFormat'] as String?,
    (json['protocolSettings'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['protocols'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['auth'],
    json['awsQueryCompatible'],
    json['ripServiceName'] as String?,
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
