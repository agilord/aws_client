// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-03-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventType', instance.eventType);
  writeNotNull('sentAt', const UnixDateTimeConverter().toJson(instance.sentAt));
  writeNotNull('eventId', instance.eventId);
  writeNotNull('eventValue', instance.eventValue);
  writeNotNull('impression', instance.impression);
  writeNotNull('itemId', instance.itemId);
  writeNotNull('properties', instance.properties);
  writeNotNull('recommendationId', instance.recommendationId);
  return val;
}

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemId', instance.itemId);
  writeNotNull('properties', instance.properties);
  return val;
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('properties', instance.properties);
  return val;
}
