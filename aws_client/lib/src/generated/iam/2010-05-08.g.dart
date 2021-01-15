// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2010-05-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ContextEntryToJson(ContextEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContextKeyName', instance.contextKeyName);
  writeNotNull(
      'ContextKeyType', _$ContextKeyTypeEnumEnumMap[instance.contextKeyType]);
  writeNotNull('ContextKeyValues', instance.contextKeyValues);
  return val;
}

const _$ContextKeyTypeEnumEnumMap = {
  ContextKeyTypeEnum.string: 'string',
  ContextKeyTypeEnum.stringList: 'stringList',
  ContextKeyTypeEnum.numeric: 'numeric',
  ContextKeyTypeEnum.numericList: 'numericList',
  ContextKeyTypeEnum.boolean: 'boolean',
  ContextKeyTypeEnum.booleanList: 'booleanList',
  ContextKeyTypeEnum.ip: 'ip',
  ContextKeyTypeEnum.ipList: 'ipList',
  ContextKeyTypeEnum.binary: 'binary',
  ContextKeyTypeEnum.binaryList: 'binaryList',
  ContextKeyTypeEnum.date: 'date',
  ContextKeyTypeEnum.dateList: 'dateList',
};

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}
