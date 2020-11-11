// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize-events-2018-03-22.dart';

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
  writeNotNull('properties', instance.properties);
  writeNotNull('sentAt', unixTimestampToJson(instance.sentAt));
  writeNotNull('eventId', instance.eventId);
  return val;
}

Map<String, dynamic> _$PutEventsRequestToJson(PutEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'eventList', instance.eventList?.map((e) => e?.toJson())?.toList());
  writeNotNull('sessionId', instance.sessionId);
  writeNotNull('trackingId', instance.trackingId);
  writeNotNull('userId', instance.userId);
  return val;
}
