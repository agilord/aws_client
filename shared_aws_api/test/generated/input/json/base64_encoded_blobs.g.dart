// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base64_encoded_blobs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$InputShapeToJson(InputShape instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BlobArg', const Uint8ListConverter().toJson(instance.blobArg));
  writeNotNull(
      'BlobMap',
      instance.blobMap
          ?.map((k, e) => MapEntry(k, const Uint8ListConverter().toJson(e))));
  return val;
}
