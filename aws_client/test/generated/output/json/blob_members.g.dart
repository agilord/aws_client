// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blob_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    blobMember:
        const Uint8ListConverter().fromJson(json['BlobMember'] as String),
    structMember: json['StructMember'] == null
        ? null
        : BlobContainer.fromJson(json['StructMember'] as Map<String, dynamic>),
  );
}

BlobContainer _$BlobContainerFromJson(Map<String, dynamic> json) {
  return BlobContainer(
    foo: const Uint8ListConverter().fromJson(json['foo'] as String),
  );
}
