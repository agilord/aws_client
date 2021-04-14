// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts-2011-06-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PolicyDescriptorTypeToJson(
    PolicyDescriptorType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arn', instance.arn);
  return val;
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };
