// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) {
  return Api(
    json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    (json['operations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Operation.fromJson(e as Map<String, dynamic>)),
    ),
    (json['shapes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Shape.fromJson(e as Map<String, dynamic>)),
    ),
    json['version'] as String,
    json['documentation'] as String,
  );
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return Metadata(
    json['apiVersion'] as String,
    json['endpointPrefix'] as String,
    json['signingName'] as String,
    json['globalEndpoint'] as String,
    json['signatureVersion'] as String,
    json['jsonVersion'] as String,
    json['targetPrefix'] as String,
    json['protocol'] as String,
    json['timeStampFormat'] as String,
    json['xmlNamespaceUri'] as String,
    json['serviceAbbreviation'] as String,
    json['serviceFullName'] as String,
    json['serviceId'] as String,
    json['uid'] as String,
  );
}
