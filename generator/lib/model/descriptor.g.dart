// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Descriptor _$DescriptorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'shape',
      'resultWrapper',
      'locationName',
      'documentation',
      'exception',
      'error',
      'fault',
      'xmlNamespace',
      'jsonvalue',
      'payload'
    ],
  );
  return Descriptor(
    shape: json['shape'] as String,
    resultWrapper: json['resultWrapper'] as String?,
    locationName: json['locationName'] as String?,
    documentation: json['documentation'] as String?,
    exception: json['exception'] as bool? ?? false,
    error: json['error'] == null
        ? null
        : HttpError.fromJson(json['error'] as Map<String, dynamic>),
    fault: json['fault'] as bool? ?? false,
    xmlNamespace: json['xmlNamespace'] == null
        ? null
        : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
    jsonvalue: json['jsonvalue'] as bool? ?? false,
    payload: json['payload'] as String?,
  );
}
