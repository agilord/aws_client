// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Descriptor _$DescriptorFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const [
    'shape',
    'resultWrapper',
    'locationName',
    'documentation',
    'exception',
    'error',
    'fault',
    'xmlNamespace',
    'jsonvalue',
    'payload',
    'pattern'
  ]);
  return Descriptor(
    json['shape'] as String,
    json['resultWrapper'] as String,
    json['locationName'] as String,
    json['documentation'] as String,
    json['exception'] as bool ?? false,
    json['error'] == null
        ? null
        : HttpError.fromJson(json['error'] as Map<String, dynamic>),
    json['fault'] as bool ?? false,
    json['xmlNamespace'] == null
        ? null
        : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
    json['jsonvalue'] as bool ?? false,
    json['payload'] as String,
    json['pattern'] as String,
  );
}
