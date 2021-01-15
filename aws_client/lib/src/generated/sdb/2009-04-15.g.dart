// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2009-04-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeletableAttributeToJson(DeletableAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$DeletableItemToJson(DeletableItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ItemName', instance.name);
  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$ReplaceableAttributeToJson(
    ReplaceableAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  writeNotNull('Replace', instance.replace);
  return val;
}

Map<String, dynamic> _$ReplaceableItemToJson(ReplaceableItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('ItemName', instance.name);
  return val;
}

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
