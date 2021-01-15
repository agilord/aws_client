// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-04-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdMarkerPassthrough _$AdMarkerPassthroughFromJson(Map<String, dynamic> json) {
  return AdMarkerPassthrough(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$AdMarkerPassthroughToJson(AdMarkerPassthrough instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

AvailSuppression _$AvailSuppressionFromJson(Map<String, dynamic> json) {
  return AvailSuppression(
    mode: _$enumDecodeNullable(_$ModeEnumMap, json['Mode']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$AvailSuppressionToJson(AvailSuppression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Mode', _$ModeEnumMap[instance.mode]);
  writeNotNull('Value', instance.value);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ModeEnumMap = {
  Mode.off: 'OFF',
  Mode.behindLiveEdge: 'BEHIND_LIVE_EDGE',
};

Bumper _$BumperFromJson(Map<String, dynamic> json) {
  return Bumper(
    endUrl: json['EndUrl'] as String,
    startUrl: json['StartUrl'] as String,
  );
}

Map<String, dynamic> _$BumperToJson(Bumper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndUrl', instance.endUrl);
  writeNotNull('StartUrl', instance.startUrl);
  return val;
}

CdnConfiguration _$CdnConfigurationFromJson(Map<String, dynamic> json) {
  return CdnConfiguration(
    adSegmentUrlPrefix: json['AdSegmentUrlPrefix'] as String,
    contentSegmentUrlPrefix: json['ContentSegmentUrlPrefix'] as String,
  );
}

Map<String, dynamic> _$CdnConfigurationToJson(CdnConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdSegmentUrlPrefix', instance.adSegmentUrlPrefix);
  writeNotNull('ContentSegmentUrlPrefix', instance.contentSegmentUrlPrefix);
  return val;
}

DashConfiguration _$DashConfigurationFromJson(Map<String, dynamic> json) {
  return DashConfiguration(
    manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String,
    mpdLocation: json['MpdLocation'] as String,
    originManifestType: _$enumDecodeNullable(
        _$OriginManifestTypeEnumMap, json['OriginManifestType']),
  );
}

const _$OriginManifestTypeEnumMap = {
  OriginManifestType.singlePeriod: 'SINGLE_PERIOD',
  OriginManifestType.multiPeriod: 'MULTI_PERIOD',
};

Map<String, dynamic> _$DashConfigurationForPutToJson(
    DashConfigurationForPut instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MpdLocation', instance.mpdLocation);
  writeNotNull('OriginManifestType',
      _$OriginManifestTypeEnumMap[instance.originManifestType]);
  return val;
}

DeletePlaybackConfigurationResponse
    _$DeletePlaybackConfigurationResponseFromJson(Map<String, dynamic> json) {
  return DeletePlaybackConfigurationResponse();
}

GetPlaybackConfigurationResponse _$GetPlaybackConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetPlaybackConfigurationResponse(
    adDecisionServerUrl: json['AdDecisionServerUrl'] as String,
    availSuppression: json['AvailSuppression'] == null
        ? null
        : AvailSuppression.fromJson(
            json['AvailSuppression'] as Map<String, dynamic>),
    bumper: json['Bumper'] == null
        ? null
        : Bumper.fromJson(json['Bumper'] as Map<String, dynamic>),
    cdnConfiguration: json['CdnConfiguration'] == null
        ? null
        : CdnConfiguration.fromJson(
            json['CdnConfiguration'] as Map<String, dynamic>),
    dashConfiguration: json['DashConfiguration'] == null
        ? null
        : DashConfiguration.fromJson(
            json['DashConfiguration'] as Map<String, dynamic>),
    hlsConfiguration: json['HlsConfiguration'] == null
        ? null
        : HlsConfiguration.fromJson(
            json['HlsConfiguration'] as Map<String, dynamic>),
    livePreRollConfiguration: json['LivePreRollConfiguration'] == null
        ? null
        : LivePreRollConfiguration.fromJson(
            json['LivePreRollConfiguration'] as Map<String, dynamic>),
    manifestProcessingRules: json['ManifestProcessingRules'] == null
        ? null
        : ManifestProcessingRules.fromJson(
            json['ManifestProcessingRules'] as Map<String, dynamic>),
    name: json['Name'] as String,
    personalizationThresholdSeconds:
        json['PersonalizationThresholdSeconds'] as int,
    playbackConfigurationArn: json['PlaybackConfigurationArn'] as String,
    playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String,
    sessionInitializationEndpointPrefix:
        json['SessionInitializationEndpointPrefix'] as String,
    slateAdUrl: json['SlateAdUrl'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    transcodeProfileName: json['TranscodeProfileName'] as String,
    videoContentSourceUrl: json['VideoContentSourceUrl'] as String,
  );
}

HlsConfiguration _$HlsConfigurationFromJson(Map<String, dynamic> json) {
  return HlsConfiguration(
    manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String,
  );
}

ListPlaybackConfigurationsResponse _$ListPlaybackConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPlaybackConfigurationsResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : PlaybackConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ManifestProcessingRules _$ManifestProcessingRulesFromJson(
    Map<String, dynamic> json) {
  return ManifestProcessingRules(
    adMarkerPassthrough: json['AdMarkerPassthrough'] == null
        ? null
        : AdMarkerPassthrough.fromJson(
            json['AdMarkerPassthrough'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ManifestProcessingRulesToJson(
    ManifestProcessingRules instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdMarkerPassthrough', instance.adMarkerPassthrough?.toJson());
  return val;
}

PlaybackConfiguration _$PlaybackConfigurationFromJson(
    Map<String, dynamic> json) {
  return PlaybackConfiguration(
    adDecisionServerUrl: json['AdDecisionServerUrl'] as String,
    availSuppression: json['AvailSuppression'] == null
        ? null
        : AvailSuppression.fromJson(
            json['AvailSuppression'] as Map<String, dynamic>),
    bumper: json['Bumper'] == null
        ? null
        : Bumper.fromJson(json['Bumper'] as Map<String, dynamic>),
    cdnConfiguration: json['CdnConfiguration'] == null
        ? null
        : CdnConfiguration.fromJson(
            json['CdnConfiguration'] as Map<String, dynamic>),
    dashConfiguration: json['DashConfiguration'] == null
        ? null
        : DashConfiguration.fromJson(
            json['DashConfiguration'] as Map<String, dynamic>),
    hlsConfiguration: json['HlsConfiguration'] == null
        ? null
        : HlsConfiguration.fromJson(
            json['HlsConfiguration'] as Map<String, dynamic>),
    manifestProcessingRules: json['ManifestProcessingRules'] == null
        ? null
        : ManifestProcessingRules.fromJson(
            json['ManifestProcessingRules'] as Map<String, dynamic>),
    name: json['Name'] as String,
    personalizationThresholdSeconds:
        json['PersonalizationThresholdSeconds'] as int,
    playbackConfigurationArn: json['PlaybackConfigurationArn'] as String,
    playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String,
    sessionInitializationEndpointPrefix:
        json['SessionInitializationEndpointPrefix'] as String,
    slateAdUrl: json['SlateAdUrl'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    transcodeProfileName: json['TranscodeProfileName'] as String,
    videoContentSourceUrl: json['VideoContentSourceUrl'] as String,
  );
}

LivePreRollConfiguration _$LivePreRollConfigurationFromJson(
    Map<String, dynamic> json) {
  return LivePreRollConfiguration(
    adDecisionServerUrl: json['AdDecisionServerUrl'] as String,
    maxDurationSeconds: json['MaxDurationSeconds'] as int,
  );
}

Map<String, dynamic> _$LivePreRollConfigurationToJson(
    LivePreRollConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdDecisionServerUrl', instance.adDecisionServerUrl);
  writeNotNull('MaxDurationSeconds', instance.maxDurationSeconds);
  return val;
}

PutPlaybackConfigurationResponse _$PutPlaybackConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutPlaybackConfigurationResponse(
    adDecisionServerUrl: json['AdDecisionServerUrl'] as String,
    availSuppression: json['AvailSuppression'] == null
        ? null
        : AvailSuppression.fromJson(
            json['AvailSuppression'] as Map<String, dynamic>),
    bumper: json['Bumper'] == null
        ? null
        : Bumper.fromJson(json['Bumper'] as Map<String, dynamic>),
    cdnConfiguration: json['CdnConfiguration'] == null
        ? null
        : CdnConfiguration.fromJson(
            json['CdnConfiguration'] as Map<String, dynamic>),
    dashConfiguration: json['DashConfiguration'] == null
        ? null
        : DashConfiguration.fromJson(
            json['DashConfiguration'] as Map<String, dynamic>),
    hlsConfiguration: json['HlsConfiguration'] == null
        ? null
        : HlsConfiguration.fromJson(
            json['HlsConfiguration'] as Map<String, dynamic>),
    livePreRollConfiguration: json['LivePreRollConfiguration'] == null
        ? null
        : LivePreRollConfiguration.fromJson(
            json['LivePreRollConfiguration'] as Map<String, dynamic>),
    manifestProcessingRules: json['ManifestProcessingRules'] == null
        ? null
        : ManifestProcessingRules.fromJson(
            json['ManifestProcessingRules'] as Map<String, dynamic>),
    name: json['Name'] as String,
    personalizationThresholdSeconds:
        json['PersonalizationThresholdSeconds'] as int,
    playbackConfigurationArn: json['PlaybackConfigurationArn'] as String,
    playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String,
    sessionInitializationEndpointPrefix:
        json['SessionInitializationEndpointPrefix'] as String,
    slateAdUrl: json['SlateAdUrl'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    transcodeProfileName: json['TranscodeProfileName'] as String,
    videoContentSourceUrl: json['VideoContentSourceUrl'] as String,
  );
}
