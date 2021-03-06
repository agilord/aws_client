// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-video-media-2017-09-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMediaOutput _$GetMediaOutputFromJson(Map<String, dynamic> json) {
  return GetMediaOutput(
    contentType: json['Content-Type'] as String?,
    payload:
        const Uint8ListNullableConverter().fromJson(json['Payload'] as String?),
  );
}

Map<String, dynamic> _$StartSelectorToJson(StartSelector instance) {
  final val = <String, dynamic>{
    'StartSelectorType': _$StartSelectorTypeEnumMap[instance.startSelectorType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AfterFragmentNumber', instance.afterFragmentNumber);
  writeNotNull('ContinuationToken', instance.continuationToken);
  writeNotNull('StartTimestamp',
      const UnixDateTimeConverter().toJson(instance.startTimestamp));
  return val;
}

const _$StartSelectorTypeEnumMap = {
  StartSelectorType.fragmentNumber: 'FRAGMENT_NUMBER',
  StartSelectorType.serverTimestamp: 'SERVER_TIMESTAMP',
  StartSelectorType.producerTimestamp: 'PRODUCER_TIMESTAMP',
  StartSelectorType.now: 'NOW',
  StartSelectorType.earliest: 'EARLIEST',
  StartSelectorType.continuationToken: 'CONTINUATION_TOKEN',
};
