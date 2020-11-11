// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-video-media-2017-09-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetMediaInputToJson(GetMediaInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartSelector', instance.startSelector?.toJson());
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

GetMediaOutput _$GetMediaOutputFromJson(Map<String, dynamic> json) {
  return GetMediaOutput(
    contentType: json['Content-Type'] as String,
    payload: const Uint8ListConverter().fromJson(json['Payload'] as String),
  );
}

Map<String, dynamic> _$StartSelectorToJson(StartSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartSelectorType',
      _$StartSelectorTypeEnumMap[instance.startSelectorType]);
  writeNotNull('AfterFragmentNumber', instance.afterFragmentNumber);
  writeNotNull('ContinuationToken', instance.continuationToken);
  writeNotNull('StartTimestamp', unixTimestampToJson(instance.startTimestamp));
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
