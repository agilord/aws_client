// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_with_structure_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    listMember: (json['ListMember'] as List)
        ?.map((e) =>
            e == null ? null : SingleStruct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SingleStruct _$SingleStructFromJson(Map<String, dynamic> json) {
  return SingleStruct(
    foo: json['Foo'] as String,
  );
}
