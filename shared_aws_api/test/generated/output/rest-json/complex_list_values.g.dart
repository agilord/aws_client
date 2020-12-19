// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_list_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    listMember: (json['ListMember'] as List)
        ?.map(const UnixDateTimeConverter().fromJson)
        ?.toList(),
  );
}
