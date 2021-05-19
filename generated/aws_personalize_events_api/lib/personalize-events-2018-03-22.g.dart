// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize-events-2018-03-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{
    'eventType': instance.eventType,
    'sentAt': instance.sentAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull('eventValue', instance.eventValue);
  writeNotNull('impression', instance.impression);
  writeNotNull('itemId', instance.itemId);
  writeNotNull('properties', instance.properties);
  writeNotNull('recommendationId', instance.recommendationId);
  return val;
}

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{
    'itemId': instance.itemId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('properties', instance.properties);
  return val;
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('properties', instance.properties);
  return val;
}
