// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdb-2009-04-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeletableAttributeToJson(DeletableAttribute instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$DeletableItemToJson(DeletableItem instance) {
  final val = <String, dynamic>{
    'ItemName': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e.toJson()).toList());
  return val;
}

Map<String, dynamic> _$ReplaceableAttributeToJson(
    ReplaceableAttribute instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
    'Value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Replace', instance.replace);
  return val;
}

Map<String, dynamic> _$ReplaceableItemToJson(ReplaceableItem instance) =>
    <String, dynamic>{
      'Attributes': instance.attributes.map((e) => e.toJson()).toList(),
      'ItemName': instance.name,
    };

Map<String, dynamic> _$UpdateConditionToJson(UpdateCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Exists', instance.exists);
  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}
