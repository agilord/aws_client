// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recursive_shapes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RecursiveStructTypeToJson(RecursiveStructType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NoRecurse', instance.noRecurse);
  writeNotNull('RecursiveList',
      instance.recursiveList?.map((e) => e?.toJson())?.toList());
  writeNotNull('RecursiveMap',
      instance.recursiveMap?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('RecursiveStruct', instance.recursiveStruct?.toJson());
  return val;
}
