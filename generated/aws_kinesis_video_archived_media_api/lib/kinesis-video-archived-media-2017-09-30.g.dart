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

Map<String, dynamic> _$GetDASHStreamingSessionURLInputToJson(
    GetDASHStreamingSessionURLInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DASHFragmentSelector', instance.dASHFragmentSelector?.toJson());
  writeNotNull('DisplayFragmentNumber',
      _$DASHDisplayFragmentNumberEnumMap[instance.displayFragmentNumber]);
  writeNotNull('DisplayFragmentTimestamp',
      _$DASHDisplayFragmentTimestampEnumMap[instance.displayFragmentTimestamp]);
  writeNotNull('Expires', instance.expires);
  writeNotNull(
      'MaxManifestFragmentResults', instance.maxManifestFragmentResults);
  writeNotNull(
      'PlaybackMode', _$DASHPlaybackModeEnumMap[instance.playbackMode]);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

const _$DASHDisplayFragmentNumberEnumMap = {
  DASHDisplayFragmentNumber.always: 'ALWAYS',
  DASHDisplayFragmentNumber.never: 'NEVER',
};

const _$DASHDisplayFragmentTimestampEnumMap = {
  DASHDisplayFragmentTimestamp.always: 'ALWAYS',
  DASHDisplayFragmentTimestamp.never: 'NEVER',
};

const _$DASHPlaybackModeEnumMap = {
  DASHPlaybackMode.live: 'LIVE',
  DASHPlaybackMode.liveReplay: 'LIVE_REPLAY',
  DASHPlaybackMode.onDemand: 'ON_DEMAND',
};

GetDASHStreamingSessionURLOutput _$GetDASHStreamingSessionURLOutputFromJson(
    Map<String, dynamic> json) {
  return GetDASHStreamingSessionURLOutput(
    dASHStreamingSessionURL: json['DASHStreamingSessionURL'] as String,
  );
}

Map<String, dynamic> _$GetHLSStreamingSessionURLInputToJson(
    GetHLSStreamingSessionURLInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ContainerFormat', _$ContainerFormatEnumMap[instance.containerFormat]);
  writeNotNull('DiscontinuityMode',
      _$HLSDiscontinuityModeEnumMap[instance.discontinuityMode]);
  writeNotNull('DisplayFragmentTimestamp',
      _$HLSDisplayFragmentTimestampEnumMap[instance.displayFragmentTimestamp]);
  writeNotNull('Expires', instance.expires);
  writeNotNull('HLSFragmentSelector', instance.hLSFragmentSelector?.toJson());
  writeNotNull('MaxMediaPlaylistFragmentResults',
      instance.maxMediaPlaylistFragmentResults);
  writeNotNull('PlaybackMode', _$HLSPlaybackModeEnumMap[instance.playbackMode]);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

const _$ContainerFormatEnumMap = {
  ContainerFormat.fragmentedMp4: 'FRAGMENTED_MP4',
  ContainerFormat.mpegTs: 'MPEG_TS',
};

const _$HLSDiscontinuityModeEnumMap = {
  HLSDiscontinuityMode.always: 'ALWAYS',
  HLSDiscontinuityMode.never: 'NEVER',
  HLSDiscontinuityMode.onDiscontinuity: 'ON_DISCONTINUITY',
};

const _$HLSDisplayFragmentTimestampEnumMap = {
  HLSDisplayFragmentTimestamp.always: 'ALWAYS',
  HLSDisplayFragmentTimestamp.never: 'NEVER',
};

const _$HLSPlaybackModeEnumMap = {
  HLSPlaybackMode.live: 'LIVE',
  HLSPlaybackMode.liveReplay: 'LIVE_REPLAY',
  HLSPlaybackMode.onDemand: 'ON_DEMAND',
};

GetHLSStreamingSessionURLOutput _$GetHLSStreamingSessionURLOutputFromJson(
    Map<String, dynamic> json) {
  return GetHLSStreamingSessionURLOutput(
    hLSStreamingSessionURL: json['HLSStreamingSessionURL'] as String,
  );
}

Map<String, dynamic> _$GetMediaForFragmentListInputToJson(
    GetMediaForFragmentListInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Fragments', instance.fragments);
  writeNotNull('StreamName', instance.streamName);
  return val;
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

Map<String, dynamic> _$ListFragmentsInputToJson(ListFragmentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('FragmentSelector', instance.fragmentSelector?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
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
