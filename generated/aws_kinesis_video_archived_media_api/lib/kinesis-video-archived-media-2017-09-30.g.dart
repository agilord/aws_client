// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesis-video-archived-media-2017-09-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DASHFragmentSelectorToJson(
    DASHFragmentSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FragmentSelectorType',
      _$DASHFragmentSelectorTypeEnumMap[instance.fragmentSelectorType]);
  writeNotNull('TimestampRange', instance.timestampRange?.toJson());
  return val;
}

const _$DASHFragmentSelectorTypeEnumMap = {
  DASHFragmentSelectorType.producerTimestamp: 'PRODUCER_TIMESTAMP',
  DASHFragmentSelectorType.serverTimestamp: 'SERVER_TIMESTAMP',
};

Map<String, dynamic> _$DASHTimestampRangeToJson(DASHTimestampRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTimestamp', unixTimestampToJson(instance.endTimestamp));
  writeNotNull('StartTimestamp', unixTimestampToJson(instance.startTimestamp));
  return val;
}

Fragment _$FragmentFromJson(Map<String, dynamic> json) {
  return Fragment(
    fragmentLengthInMilliseconds: json['FragmentLengthInMilliseconds'] as int,
    fragmentNumber: json['FragmentNumber'] as String,
    fragmentSizeInBytes: json['FragmentSizeInBytes'] as int,
    producerTimestamp: unixTimestampFromJson(json['ProducerTimestamp']),
    serverTimestamp: unixTimestampFromJson(json['ServerTimestamp']),
  );
}

Map<String, dynamic> _$FragmentSelectorToJson(FragmentSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FragmentSelectorType',
      _$FragmentSelectorTypeEnumMap[instance.fragmentSelectorType]);
  writeNotNull('TimestampRange', instance.timestampRange?.toJson());
  return val;
}

const _$FragmentSelectorTypeEnumMap = {
  FragmentSelectorType.producerTimestamp: 'PRODUCER_TIMESTAMP',
  FragmentSelectorType.serverTimestamp: 'SERVER_TIMESTAMP',
};

GetDASHStreamingSessionURLOutput _$GetDASHStreamingSessionURLOutputFromJson(
    Map<String, dynamic> json) {
  return GetDASHStreamingSessionURLOutput(
    dASHStreamingSessionURL: json['DASHStreamingSessionURL'] as String,
  );
}

GetHLSStreamingSessionURLOutput _$GetHLSStreamingSessionURLOutputFromJson(
    Map<String, dynamic> json) {
  return GetHLSStreamingSessionURLOutput(
    hLSStreamingSessionURL: json['HLSStreamingSessionURL'] as String,
  );
}

GetMediaForFragmentListOutput _$GetMediaForFragmentListOutputFromJson(
    Map<String, dynamic> json) {
  return GetMediaForFragmentListOutput(
    contentType: json['Content-Type'] as String,
    payload: const Uint8ListConverter().fromJson(json['Payload'] as String),
  );
}

Map<String, dynamic> _$HLSFragmentSelectorToJson(HLSFragmentSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FragmentSelectorType',
      _$HLSFragmentSelectorTypeEnumMap[instance.fragmentSelectorType]);
  writeNotNull('TimestampRange', instance.timestampRange?.toJson());
  return val;
}

const _$HLSFragmentSelectorTypeEnumMap = {
  HLSFragmentSelectorType.producerTimestamp: 'PRODUCER_TIMESTAMP',
  HLSFragmentSelectorType.serverTimestamp: 'SERVER_TIMESTAMP',
};

Map<String, dynamic> _$HLSTimestampRangeToJson(HLSTimestampRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTimestamp', unixTimestampToJson(instance.endTimestamp));
  writeNotNull('StartTimestamp', unixTimestampToJson(instance.startTimestamp));
  return val;
}

ListFragmentsOutput _$ListFragmentsOutputFromJson(Map<String, dynamic> json) {
  return ListFragmentsOutput(
    fragments: (json['Fragments'] as List)
        ?.map((e) =>
            e == null ? null : Fragment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$TimestampRangeToJson(TimestampRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTimestamp', unixTimestampToJson(instance.endTimestamp));
  writeNotNull('StartTimestamp', unixTimestampToJson(instance.startTimestamp));
  return val;
}
