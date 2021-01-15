// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    fooEnum: _$enumDecodeNullable(_$JSONEnumTypeEnumMap, json['FooEnum']),
    listEnums: (json['ListEnums'] as List)
        ?.map((e) => _$enumDecodeNullable(_$JSONEnumTypeEnumMap, e))
        ?.toList(),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$JSONEnumTypeEnumMap = {
  JSONEnumType.foo: 'foo',
  JSONEnumType.bar: 'bar',
};
