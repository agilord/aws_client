// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    fooEnum: _$enumDecodeNullable(_$RESTJSONEnumTypeEnumMap, json['FooEnum']),
    headerEnum:
        _$enumDecodeNullable(_$RESTJSONEnumTypeEnumMap, json['x-amz-enum']),
    listEnums: (json['ListEnums'] as List)
        ?.map((e) => _$enumDecodeNullable(_$RESTJSONEnumTypeEnumMap, e))
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

const _$RESTJSONEnumTypeEnumMap = {
  RESTJSONEnumType.foo: 'foo',
  RESTJSONEnumType.bar: 'bar',
  RESTJSONEnumType.baz: 'baz',
  RESTJSONEnumType.$0: '0',
  RESTJSONEnumType.$1: '1',
};
