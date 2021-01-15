// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    listMember: (json['ListMember'] as List)?.map((e) => e as String)?.toList(),
    listMemberMap: (json['ListMemberMap'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    listMemberStruct: (json['ListMemberStruct'] as List)
        ?.map((e) =>
            e == null ? null : StructType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StructType _$StructTypeFromJson(Map<String, dynamic> json) {
  return StructType();
}
