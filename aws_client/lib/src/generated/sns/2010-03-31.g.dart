// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2010-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MessageAttributeValueToJson(
    MessageAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataType', instance.dataType);
  writeNotNull(
      'BinaryValue', const Uint8ListConverter().toJson(instance.binaryValue));
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

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
