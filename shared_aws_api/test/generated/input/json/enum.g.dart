// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

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

  writeNotNull('FooEnum', _$EnumTypeEnumMap[instance.fooEnum]);
  writeNotNull('ListEnums', instance.listEnums);
  return val;
}

const _$EnumTypeEnumMap = {
  EnumType.foo: 'foo',
  EnumType.bar: 'bar',
};
