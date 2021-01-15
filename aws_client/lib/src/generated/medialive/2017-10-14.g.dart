// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AacSettings _$AacSettingsFromJson(Map<String, dynamic> json) {
  return AacSettings(
    bitrate: (json['bitrate'] as num)?.toDouble(),
    codingMode:
        _$enumDecodeNullable(_$AacCodingModeEnumMap, json['codingMode']),
    inputType: _$enumDecodeNullable(_$AacInputTypeEnumMap, json['inputType']),
    profile: _$enumDecodeNullable(_$AacProfileEnumMap, json['profile']),
    rateControlMode: _$enumDecodeNullable(
        _$AacRateControlModeEnumMap, json['rateControlMode']),
    rawFormat: _$enumDecodeNullable(_$AacRawFormatEnumMap, json['rawFormat']),
    sampleRate: (json['sampleRate'] as num)?.toDouble(),
    spec: _$enumDecodeNullable(_$AacSpecEnumMap, json['spec']),
    vbrQuality:
        _$enumDecodeNullable(_$AacVbrQualityEnumMap, json['vbrQuality']),
  );
}

Map<String, dynamic> _$AacSettingsToJson(AacSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codingMode', _$AacCodingModeEnumMap[instance.codingMode]);
  writeNotNull('inputType', _$AacInputTypeEnumMap[instance.inputType]);
  writeNotNull('profile', _$AacProfileEnumMap[instance.profile]);
  writeNotNull(
      'rateControlMode', _$AacRateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('rawFormat', _$AacRawFormatEnumMap[instance.rawFormat]);
  writeNotNull('sampleRate', instance.sampleRate);
  writeNotNull('spec', _$AacSpecEnumMap[instance.spec]);
  writeNotNull('vbrQuality', _$AacVbrQualityEnumMap[instance.vbrQuality]);
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

const _$AacCodingModeEnumMap = {
  AacCodingMode.adReceiverMix: 'AD_RECEIVER_MIX',
  AacCodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  AacCodingMode.codingMode_1_1: 'CODING_MODE_1_1',
  AacCodingMode.codingMode_2_0: 'CODING_MODE_2_0',
  AacCodingMode.codingMode_5_1: 'CODING_MODE_5_1',
};

const _$AacInputTypeEnumMap = {
  AacInputType.broadcasterMixedAd: 'BROADCASTER_MIXED_AD',
  AacInputType.normal: 'NORMAL',
};

const _$AacProfileEnumMap = {
  AacProfile.hev1: 'HEV1',
  AacProfile.hev2: 'HEV2',
  AacProfile.lc: 'LC',
};

const _$AacRateControlModeEnumMap = {
  AacRateControlMode.cbr: 'CBR',
  AacRateControlMode.vbr: 'VBR',
};

const _$AacRawFormatEnumMap = {
  AacRawFormat.latmLoas: 'LATM_LOAS',
  AacRawFormat.none: 'NONE',
};

const _$AacSpecEnumMap = {
  AacSpec.mpeg2: 'MPEG2',
  AacSpec.mpeg4: 'MPEG4',
};

const _$AacVbrQualityEnumMap = {
  AacVbrQuality.high: 'HIGH',
  AacVbrQuality.low: 'LOW',
  AacVbrQuality.mediumHigh: 'MEDIUM_HIGH',
  AacVbrQuality.mediumLow: 'MEDIUM_LOW',
};

Ac3Settings _$Ac3SettingsFromJson(Map<String, dynamic> json) {
  return Ac3Settings(
    bitrate: (json['bitrate'] as num)?.toDouble(),
    bitstreamMode:
        _$enumDecodeNullable(_$Ac3BitstreamModeEnumMap, json['bitstreamMode']),
    codingMode:
        _$enumDecodeNullable(_$Ac3CodingModeEnumMap, json['codingMode']),
    dialnorm: json['dialnorm'] as int,
    drcProfile:
        _$enumDecodeNullable(_$Ac3DrcProfileEnumMap, json['drcProfile']),
    lfeFilter: _$enumDecodeNullable(_$Ac3LfeFilterEnumMap, json['lfeFilter']),
    metadataControl: _$enumDecodeNullable(
        _$Ac3MetadataControlEnumMap, json['metadataControl']),
  );
}

Map<String, dynamic> _$Ac3SettingsToJson(Ac3Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull(
      'bitstreamMode', _$Ac3BitstreamModeEnumMap[instance.bitstreamMode]);
  writeNotNull('codingMode', _$Ac3CodingModeEnumMap[instance.codingMode]);
  writeNotNull('dialnorm', instance.dialnorm);
  writeNotNull('drcProfile', _$Ac3DrcProfileEnumMap[instance.drcProfile]);
  writeNotNull('lfeFilter', _$Ac3LfeFilterEnumMap[instance.lfeFilter]);
  writeNotNull(
      'metadataControl', _$Ac3MetadataControlEnumMap[instance.metadataControl]);
  return val;
}

const _$Ac3BitstreamModeEnumMap = {
  Ac3BitstreamMode.commentary: 'COMMENTARY',
  Ac3BitstreamMode.completeMain: 'COMPLETE_MAIN',
  Ac3BitstreamMode.dialogue: 'DIALOGUE',
  Ac3BitstreamMode.emergency: 'EMERGENCY',
  Ac3BitstreamMode.hearingImpaired: 'HEARING_IMPAIRED',
  Ac3BitstreamMode.musicAndEffects: 'MUSIC_AND_EFFECTS',
  Ac3BitstreamMode.visuallyImpaired: 'VISUALLY_IMPAIRED',
  Ac3BitstreamMode.voiceOver: 'VOICE_OVER',
};

const _$Ac3CodingModeEnumMap = {
  Ac3CodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  Ac3CodingMode.codingMode_1_1: 'CODING_MODE_1_1',
  Ac3CodingMode.codingMode_2_0: 'CODING_MODE_2_0',
  Ac3CodingMode.codingMode_3_2Lfe: 'CODING_MODE_3_2_LFE',
};

const _$Ac3DrcProfileEnumMap = {
  Ac3DrcProfile.filmStandard: 'FILM_STANDARD',
  Ac3DrcProfile.none: 'NONE',
};

const _$Ac3LfeFilterEnumMap = {
  Ac3LfeFilter.disabled: 'DISABLED',
  Ac3LfeFilter.enabled: 'ENABLED',
};

const _$Ac3MetadataControlEnumMap = {
  Ac3MetadataControl.followInput: 'FOLLOW_INPUT',
  Ac3MetadataControl.useConfigured: 'USE_CONFIGURED',
};

AcceptInputDeviceTransferResponse _$AcceptInputDeviceTransferResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptInputDeviceTransferResponse();
}

AncillarySourceSettings _$AncillarySourceSettingsFromJson(
    Map<String, dynamic> json) {
  return AncillarySourceSettings(
    sourceAncillaryChannelNumber: json['sourceAncillaryChannelNumber'] as int,
  );
}

Map<String, dynamic> _$AncillarySourceSettingsToJson(
    AncillarySourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'sourceAncillaryChannelNumber', instance.sourceAncillaryChannelNumber);
  return val;
}

ArchiveContainerSettings _$ArchiveContainerSettingsFromJson(
    Map<String, dynamic> json) {
  return ArchiveContainerSettings(
    m2tsSettings: json['m2tsSettings'] == null
        ? null
        : M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>),
    rawSettings: json['rawSettings'] == null
        ? null
        : RawSettings.fromJson(json['rawSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArchiveContainerSettingsToJson(
    ArchiveContainerSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('m2tsSettings', instance.m2tsSettings?.toJson());
  writeNotNull('rawSettings', instance.rawSettings?.toJson());
  return val;
}

ArchiveGroupSettings _$ArchiveGroupSettingsFromJson(Map<String, dynamic> json) {
  return ArchiveGroupSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
    rolloverInterval: json['rolloverInterval'] as int,
  );
}

Map<String, dynamic> _$ArchiveGroupSettingsToJson(
    ArchiveGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('rolloverInterval', instance.rolloverInterval);
  return val;
}

ArchiveOutputSettings _$ArchiveOutputSettingsFromJson(
    Map<String, dynamic> json) {
  return ArchiveOutputSettings(
    containerSettings: json['containerSettings'] == null
        ? null
        : ArchiveContainerSettings.fromJson(
            json['containerSettings'] as Map<String, dynamic>),
    extension: json['extension'] as String,
    nameModifier: json['nameModifier'] as String,
  );
}

Map<String, dynamic> _$ArchiveOutputSettingsToJson(
    ArchiveOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerSettings', instance.containerSettings?.toJson());
  writeNotNull('extension', instance.extension);
  writeNotNull('nameModifier', instance.nameModifier);
  return val;
}

AribDestinationSettings _$AribDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return AribDestinationSettings();
}

Map<String, dynamic> _$AribDestinationSettingsToJson(
        AribDestinationSettings instance) =>
    <String, dynamic>{};

AribSourceSettings _$AribSourceSettingsFromJson(Map<String, dynamic> json) {
  return AribSourceSettings();
}

Map<String, dynamic> _$AribSourceSettingsToJson(AribSourceSettings instance) =>
    <String, dynamic>{};

AudioChannelMapping _$AudioChannelMappingFromJson(Map<String, dynamic> json) {
  return AudioChannelMapping(
    inputChannelLevels: (json['inputChannelLevels'] as List)
        ?.map((e) => e == null
            ? null
            : InputChannelLevel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputChannel: json['outputChannel'] as int,
  );
}

Map<String, dynamic> _$AudioChannelMappingToJson(AudioChannelMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputChannelLevels',
      instance.inputChannelLevels?.map((e) => e?.toJson())?.toList());
  writeNotNull('outputChannel', instance.outputChannel);
  return val;
}

AudioCodecSettings _$AudioCodecSettingsFromJson(Map<String, dynamic> json) {
  return AudioCodecSettings(
    aacSettings: json['aacSettings'] == null
        ? null
        : AacSettings.fromJson(json['aacSettings'] as Map<String, dynamic>),
    ac3Settings: json['ac3Settings'] == null
        ? null
        : Ac3Settings.fromJson(json['ac3Settings'] as Map<String, dynamic>),
    eac3Settings: json['eac3Settings'] == null
        ? null
        : Eac3Settings.fromJson(json['eac3Settings'] as Map<String, dynamic>),
    mp2Settings: json['mp2Settings'] == null
        ? null
        : Mp2Settings.fromJson(json['mp2Settings'] as Map<String, dynamic>),
    passThroughSettings: json['passThroughSettings'] == null
        ? null
        : PassThroughSettings.fromJson(
            json['passThroughSettings'] as Map<String, dynamic>),
    wavSettings: json['wavSettings'] == null
        ? null
        : WavSettings.fromJson(json['wavSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioCodecSettingsToJson(AudioCodecSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aacSettings', instance.aacSettings?.toJson());
  writeNotNull('ac3Settings', instance.ac3Settings?.toJson());
  writeNotNull('eac3Settings', instance.eac3Settings?.toJson());
  writeNotNull('mp2Settings', instance.mp2Settings?.toJson());
  writeNotNull('passThroughSettings', instance.passThroughSettings?.toJson());
  writeNotNull('wavSettings', instance.wavSettings?.toJson());
  return val;
}

AudioDescription _$AudioDescriptionFromJson(Map<String, dynamic> json) {
  return AudioDescription(
    audioSelectorName: json['audioSelectorName'] as String,
    name: json['name'] as String,
    audioNormalizationSettings: json['audioNormalizationSettings'] == null
        ? null
        : AudioNormalizationSettings.fromJson(
            json['audioNormalizationSettings'] as Map<String, dynamic>),
    audioType: _$enumDecodeNullable(_$AudioTypeEnumMap, json['audioType']),
    audioTypeControl: _$enumDecodeNullable(
        _$AudioDescriptionAudioTypeControlEnumMap, json['audioTypeControl']),
    codecSettings: json['codecSettings'] == null
        ? null
        : AudioCodecSettings.fromJson(
            json['codecSettings'] as Map<String, dynamic>),
    languageCode: json['languageCode'] as String,
    languageCodeControl: _$enumDecodeNullable(
        _$AudioDescriptionLanguageCodeControlEnumMap,
        json['languageCodeControl']),
    remixSettings: json['remixSettings'] == null
        ? null
        : RemixSettings.fromJson(json['remixSettings'] as Map<String, dynamic>),
    streamName: json['streamName'] as String,
  );
}

Map<String, dynamic> _$AudioDescriptionToJson(AudioDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectorName', instance.audioSelectorName);
  writeNotNull('name', instance.name);
  writeNotNull('audioNormalizationSettings',
      instance.audioNormalizationSettings?.toJson());
  writeNotNull('audioType', _$AudioTypeEnumMap[instance.audioType]);
  writeNotNull('audioTypeControl',
      _$AudioDescriptionAudioTypeControlEnumMap[instance.audioTypeControl]);
  writeNotNull('codecSettings', instance.codecSettings?.toJson());
  writeNotNull('languageCode', instance.languageCode);
  writeNotNull(
      'languageCodeControl',
      _$AudioDescriptionLanguageCodeControlEnumMap[
          instance.languageCodeControl]);
  writeNotNull('remixSettings', instance.remixSettings?.toJson());
  writeNotNull('streamName', instance.streamName);
  return val;
}

const _$AudioTypeEnumMap = {
  AudioType.cleanEffects: 'CLEAN_EFFECTS',
  AudioType.hearingImpaired: 'HEARING_IMPAIRED',
  AudioType.undefined: 'UNDEFINED',
  AudioType.visualImpairedCommentary: 'VISUAL_IMPAIRED_COMMENTARY',
};

const _$AudioDescriptionAudioTypeControlEnumMap = {
  AudioDescriptionAudioTypeControl.followInput: 'FOLLOW_INPUT',
  AudioDescriptionAudioTypeControl.useConfigured: 'USE_CONFIGURED',
};

const _$AudioDescriptionLanguageCodeControlEnumMap = {
  AudioDescriptionLanguageCodeControl.followInput: 'FOLLOW_INPUT',
  AudioDescriptionLanguageCodeControl.useConfigured: 'USE_CONFIGURED',
};

AudioLanguageSelection _$AudioLanguageSelectionFromJson(
    Map<String, dynamic> json) {
  return AudioLanguageSelection(
    languageCode: json['languageCode'] as String,
    languageSelectionPolicy: _$enumDecodeNullable(
        _$AudioLanguageSelectionPolicyEnumMap, json['languageSelectionPolicy']),
  );
}

Map<String, dynamic> _$AudioLanguageSelectionToJson(
    AudioLanguageSelection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('languageCode', instance.languageCode);
  writeNotNull('languageSelectionPolicy',
      _$AudioLanguageSelectionPolicyEnumMap[instance.languageSelectionPolicy]);
  return val;
}

const _$AudioLanguageSelectionPolicyEnumMap = {
  AudioLanguageSelectionPolicy.loose: 'LOOSE',
  AudioLanguageSelectionPolicy.strict: 'STRICT',
};

AudioNormalizationSettings _$AudioNormalizationSettingsFromJson(
    Map<String, dynamic> json) {
  return AudioNormalizationSettings(
    algorithm: _$enumDecodeNullable(
        _$AudioNormalizationAlgorithmEnumMap, json['algorithm']),
    algorithmControl: _$enumDecodeNullable(
        _$AudioNormalizationAlgorithmControlEnumMap, json['algorithmControl']),
    targetLkfs: (json['targetLkfs'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AudioNormalizationSettingsToJson(
    AudioNormalizationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'algorithm', _$AudioNormalizationAlgorithmEnumMap[instance.algorithm]);
  writeNotNull('algorithmControl',
      _$AudioNormalizationAlgorithmControlEnumMap[instance.algorithmControl]);
  writeNotNull('targetLkfs', instance.targetLkfs);
  return val;
}

const _$AudioNormalizationAlgorithmEnumMap = {
  AudioNormalizationAlgorithm.itu_1770_1: 'ITU_1770_1',
  AudioNormalizationAlgorithm.itu_1770_2: 'ITU_1770_2',
};

const _$AudioNormalizationAlgorithmControlEnumMap = {
  AudioNormalizationAlgorithmControl.correctAudio: 'CORRECT_AUDIO',
};

AudioOnlyHlsSettings _$AudioOnlyHlsSettingsFromJson(Map<String, dynamic> json) {
  return AudioOnlyHlsSettings(
    audioGroupId: json['audioGroupId'] as String,
    audioOnlyImage: json['audioOnlyImage'] == null
        ? null
        : InputLocation.fromJson(
            json['audioOnlyImage'] as Map<String, dynamic>),
    audioTrackType: _$enumDecodeNullable(
        _$AudioOnlyHlsTrackTypeEnumMap, json['audioTrackType']),
    segmentType: _$enumDecodeNullable(
        _$AudioOnlyHlsSegmentTypeEnumMap, json['segmentType']),
  );
}

Map<String, dynamic> _$AudioOnlyHlsSettingsToJson(
    AudioOnlyHlsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioGroupId', instance.audioGroupId);
  writeNotNull('audioOnlyImage', instance.audioOnlyImage?.toJson());
  writeNotNull('audioTrackType',
      _$AudioOnlyHlsTrackTypeEnumMap[instance.audioTrackType]);
  writeNotNull(
      'segmentType', _$AudioOnlyHlsSegmentTypeEnumMap[instance.segmentType]);
  return val;
}

const _$AudioOnlyHlsTrackTypeEnumMap = {
  AudioOnlyHlsTrackType.alternateAudioAutoSelect: 'ALTERNATE_AUDIO_AUTO_SELECT',
  AudioOnlyHlsTrackType.alternateAudioAutoSelectDefault:
      'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT',
  AudioOnlyHlsTrackType.alternateAudioNotAutoSelect:
      'ALTERNATE_AUDIO_NOT_AUTO_SELECT',
  AudioOnlyHlsTrackType.audioOnlyVariantStream: 'AUDIO_ONLY_VARIANT_STREAM',
};

const _$AudioOnlyHlsSegmentTypeEnumMap = {
  AudioOnlyHlsSegmentType.aac: 'AAC',
  AudioOnlyHlsSegmentType.fmp4: 'FMP4',
};

AudioPidSelection _$AudioPidSelectionFromJson(Map<String, dynamic> json) {
  return AudioPidSelection(
    pid: json['pid'] as int,
  );
}

Map<String, dynamic> _$AudioPidSelectionToJson(AudioPidSelection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pid', instance.pid);
  return val;
}

AudioSelector _$AudioSelectorFromJson(Map<String, dynamic> json) {
  return AudioSelector(
    name: json['name'] as String,
    selectorSettings: json['selectorSettings'] == null
        ? null
        : AudioSelectorSettings.fromJson(
            json['selectorSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioSelectorToJson(AudioSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('selectorSettings', instance.selectorSettings?.toJson());
  return val;
}

AudioSelectorSettings _$AudioSelectorSettingsFromJson(
    Map<String, dynamic> json) {
  return AudioSelectorSettings(
    audioLanguageSelection: json['audioLanguageSelection'] == null
        ? null
        : AudioLanguageSelection.fromJson(
            json['audioLanguageSelection'] as Map<String, dynamic>),
    audioPidSelection: json['audioPidSelection'] == null
        ? null
        : AudioPidSelection.fromJson(
            json['audioPidSelection'] as Map<String, dynamic>),
    audioTrackSelection: json['audioTrackSelection'] == null
        ? null
        : AudioTrackSelection.fromJson(
            json['audioTrackSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioSelectorSettingsToJson(
    AudioSelectorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'audioLanguageSelection', instance.audioLanguageSelection?.toJson());
  writeNotNull('audioPidSelection', instance.audioPidSelection?.toJson());
  writeNotNull('audioTrackSelection', instance.audioTrackSelection?.toJson());
  return val;
}

AudioSilenceFailoverSettings _$AudioSilenceFailoverSettingsFromJson(
    Map<String, dynamic> json) {
  return AudioSilenceFailoverSettings(
    audioSelectorName: json['audioSelectorName'] as String,
    audioSilenceThresholdMsec: json['audioSilenceThresholdMsec'] as int,
  );
}

Map<String, dynamic> _$AudioSilenceFailoverSettingsToJson(
    AudioSilenceFailoverSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectorName', instance.audioSelectorName);
  writeNotNull('audioSilenceThresholdMsec', instance.audioSilenceThresholdMsec);
  return val;
}

AudioTrack _$AudioTrackFromJson(Map<String, dynamic> json) {
  return AudioTrack(
    track: json['track'] as int,
  );
}

Map<String, dynamic> _$AudioTrackToJson(AudioTrack instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('track', instance.track);
  return val;
}

AudioTrackSelection _$AudioTrackSelectionFromJson(Map<String, dynamic> json) {
  return AudioTrackSelection(
    tracks: (json['tracks'] as List)
        ?.map((e) =>
            e == null ? null : AudioTrack.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AudioTrackSelectionToJson(AudioTrackSelection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tracks', instance.tracks?.map((e) => e?.toJson())?.toList());
  return val;
}

AutomaticInputFailoverSettings _$AutomaticInputFailoverSettingsFromJson(
    Map<String, dynamic> json) {
  return AutomaticInputFailoverSettings(
    secondaryInputId: json['secondaryInputId'] as String,
    errorClearTimeMsec: json['errorClearTimeMsec'] as int,
    failoverConditions: (json['failoverConditions'] as List)
        ?.map((e) => e == null
            ? null
            : FailoverCondition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputPreference:
        _$enumDecodeNullable(_$InputPreferenceEnumMap, json['inputPreference']),
  );
}

Map<String, dynamic> _$AutomaticInputFailoverSettingsToJson(
    AutomaticInputFailoverSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('secondaryInputId', instance.secondaryInputId);
  writeNotNull('errorClearTimeMsec', instance.errorClearTimeMsec);
  writeNotNull('failoverConditions',
      instance.failoverConditions?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'inputPreference', _$InputPreferenceEnumMap[instance.inputPreference]);
  return val;
}

const _$InputPreferenceEnumMap = {
  InputPreference.equalInputPreference: 'EQUAL_INPUT_PREFERENCE',
  InputPreference.primaryInputPreferred: 'PRIMARY_INPUT_PREFERRED',
};

AvailBlanking _$AvailBlankingFromJson(Map<String, dynamic> json) {
  return AvailBlanking(
    availBlankingImage: json['availBlankingImage'] == null
        ? null
        : InputLocation.fromJson(
            json['availBlankingImage'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$AvailBlankingStateEnumMap, json['state']),
  );
}

Map<String, dynamic> _$AvailBlankingToJson(AvailBlanking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('availBlankingImage', instance.availBlankingImage?.toJson());
  writeNotNull('state', _$AvailBlankingStateEnumMap[instance.state]);
  return val;
}

const _$AvailBlankingStateEnumMap = {
  AvailBlankingState.disabled: 'DISABLED',
  AvailBlankingState.enabled: 'ENABLED',
};

AvailConfiguration _$AvailConfigurationFromJson(Map<String, dynamic> json) {
  return AvailConfiguration(
    availSettings: json['availSettings'] == null
        ? null
        : AvailSettings.fromJson(json['availSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AvailConfigurationToJson(AvailConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('availSettings', instance.availSettings?.toJson());
  return val;
}

AvailSettings _$AvailSettingsFromJson(Map<String, dynamic> json) {
  return AvailSettings(
    scte35SpliceInsert: json['scte35SpliceInsert'] == null
        ? null
        : Scte35SpliceInsert.fromJson(
            json['scte35SpliceInsert'] as Map<String, dynamic>),
    scte35TimeSignalApos: json['scte35TimeSignalApos'] == null
        ? null
        : Scte35TimeSignalApos.fromJson(
            json['scte35TimeSignalApos'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AvailSettingsToJson(AvailSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scte35SpliceInsert', instance.scte35SpliceInsert?.toJson());
  writeNotNull('scte35TimeSignalApos', instance.scte35TimeSignalApos?.toJson());
  return val;
}

BatchDeleteResponse _$BatchDeleteResponseFromJson(Map<String, dynamic> json) {
  return BatchDeleteResponse(
    failed: (json['failed'] as List)
        ?.map((e) => e == null
            ? null
            : BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successful: (json['successful'] as List)
        ?.map((e) => e == null
            ? null
            : BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchFailedResultModel _$BatchFailedResultModelFromJson(
    Map<String, dynamic> json) {
  return BatchFailedResultModel(
    arn: json['arn'] as String,
    code: json['code'] as String,
    id: json['id'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$BatchScheduleActionCreateRequestToJson(
    BatchScheduleActionCreateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scheduleActions',
      instance.scheduleActions?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchScheduleActionCreateResult _$BatchScheduleActionCreateResultFromJson(
    Map<String, dynamic> json) {
  return BatchScheduleActionCreateResult(
    scheduleActions: (json['scheduleActions'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduleAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchScheduleActionDeleteRequestToJson(
    BatchScheduleActionDeleteRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actionNames', instance.actionNames);
  return val;
}

BatchScheduleActionDeleteResult _$BatchScheduleActionDeleteResultFromJson(
    Map<String, dynamic> json) {
  return BatchScheduleActionDeleteResult(
    scheduleActions: (json['scheduleActions'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduleAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchStartResponse _$BatchStartResponseFromJson(Map<String, dynamic> json) {
  return BatchStartResponse(
    failed: (json['failed'] as List)
        ?.map((e) => e == null
            ? null
            : BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successful: (json['successful'] as List)
        ?.map((e) => e == null
            ? null
            : BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchStopResponse _$BatchStopResponseFromJson(Map<String, dynamic> json) {
  return BatchStopResponse(
    failed: (json['failed'] as List)
        ?.map((e) => e == null
            ? null
            : BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successful: (json['successful'] as List)
        ?.map((e) => e == null
            ? null
            : BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchSuccessfulResultModel _$BatchSuccessfulResultModelFromJson(
    Map<String, dynamic> json) {
  return BatchSuccessfulResultModel(
    arn: json['arn'] as String,
    id: json['id'] as String,
    state: json['state'] as String,
  );
}

BatchUpdateScheduleResponse _$BatchUpdateScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateScheduleResponse(
    creates: json['creates'] == null
        ? null
        : BatchScheduleActionCreateResult.fromJson(
            json['creates'] as Map<String, dynamic>),
    deletes: json['deletes'] == null
        ? null
        : BatchScheduleActionDeleteResult.fromJson(
            json['deletes'] as Map<String, dynamic>),
  );
}

BlackoutSlate _$BlackoutSlateFromJson(Map<String, dynamic> json) {
  return BlackoutSlate(
    blackoutSlateImage: json['blackoutSlateImage'] == null
        ? null
        : InputLocation.fromJson(
            json['blackoutSlateImage'] as Map<String, dynamic>),
    networkEndBlackout: _$enumDecodeNullable(
        _$BlackoutSlateNetworkEndBlackoutEnumMap, json['networkEndBlackout']),
    networkEndBlackoutImage: json['networkEndBlackoutImage'] == null
        ? null
        : InputLocation.fromJson(
            json['networkEndBlackoutImage'] as Map<String, dynamic>),
    networkId: json['networkId'] as String,
    state: _$enumDecodeNullable(_$BlackoutSlateStateEnumMap, json['state']),
  );
}

Map<String, dynamic> _$BlackoutSlateToJson(BlackoutSlate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('blackoutSlateImage', instance.blackoutSlateImage?.toJson());
  writeNotNull('networkEndBlackout',
      _$BlackoutSlateNetworkEndBlackoutEnumMap[instance.networkEndBlackout]);
  writeNotNull(
      'networkEndBlackoutImage', instance.networkEndBlackoutImage?.toJson());
  writeNotNull('networkId', instance.networkId);
  writeNotNull('state', _$BlackoutSlateStateEnumMap[instance.state]);
  return val;
}

const _$BlackoutSlateNetworkEndBlackoutEnumMap = {
  BlackoutSlateNetworkEndBlackout.disabled: 'DISABLED',
  BlackoutSlateNetworkEndBlackout.enabled: 'ENABLED',
};

const _$BlackoutSlateStateEnumMap = {
  BlackoutSlateState.disabled: 'DISABLED',
  BlackoutSlateState.enabled: 'ENABLED',
};

BurnInDestinationSettings _$BurnInDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return BurnInDestinationSettings(
    alignment:
        _$enumDecodeNullable(_$BurnInAlignmentEnumMap, json['alignment']),
    backgroundColor: _$enumDecodeNullable(
        _$BurnInBackgroundColorEnumMap, json['backgroundColor']),
    backgroundOpacity: json['backgroundOpacity'] as int,
    font: json['font'] == null
        ? null
        : InputLocation.fromJson(json['font'] as Map<String, dynamic>),
    fontColor:
        _$enumDecodeNullable(_$BurnInFontColorEnumMap, json['fontColor']),
    fontOpacity: json['fontOpacity'] as int,
    fontResolution: json['fontResolution'] as int,
    fontSize: json['fontSize'] as String,
    outlineColor:
        _$enumDecodeNullable(_$BurnInOutlineColorEnumMap, json['outlineColor']),
    outlineSize: json['outlineSize'] as int,
    shadowColor:
        _$enumDecodeNullable(_$BurnInShadowColorEnumMap, json['shadowColor']),
    shadowOpacity: json['shadowOpacity'] as int,
    shadowXOffset: json['shadowXOffset'] as int,
    shadowYOffset: json['shadowYOffset'] as int,
    teletextGridControl: _$enumDecodeNullable(
        _$BurnInTeletextGridControlEnumMap, json['teletextGridControl']),
    xPosition: json['xPosition'] as int,
    yPosition: json['yPosition'] as int,
  );
}

Map<String, dynamic> _$BurnInDestinationSettingsToJson(
    BurnInDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alignment', _$BurnInAlignmentEnumMap[instance.alignment]);
  writeNotNull('backgroundColor',
      _$BurnInBackgroundColorEnumMap[instance.backgroundColor]);
  writeNotNull('backgroundOpacity', instance.backgroundOpacity);
  writeNotNull('font', instance.font?.toJson());
  writeNotNull('fontColor', _$BurnInFontColorEnumMap[instance.fontColor]);
  writeNotNull('fontOpacity', instance.fontOpacity);
  writeNotNull('fontResolution', instance.fontResolution);
  writeNotNull('fontSize', instance.fontSize);
  writeNotNull(
      'outlineColor', _$BurnInOutlineColorEnumMap[instance.outlineColor]);
  writeNotNull('outlineSize', instance.outlineSize);
  writeNotNull('shadowColor', _$BurnInShadowColorEnumMap[instance.shadowColor]);
  writeNotNull('shadowOpacity', instance.shadowOpacity);
  writeNotNull('shadowXOffset', instance.shadowXOffset);
  writeNotNull('shadowYOffset', instance.shadowYOffset);
  writeNotNull('teletextGridControl',
      _$BurnInTeletextGridControlEnumMap[instance.teletextGridControl]);
  writeNotNull('xPosition', instance.xPosition);
  writeNotNull('yPosition', instance.yPosition);
  return val;
}

const _$BurnInAlignmentEnumMap = {
  BurnInAlignment.centered: 'CENTERED',
  BurnInAlignment.left: 'LEFT',
  BurnInAlignment.smart: 'SMART',
};

const _$BurnInBackgroundColorEnumMap = {
  BurnInBackgroundColor.black: 'BLACK',
  BurnInBackgroundColor.none: 'NONE',
  BurnInBackgroundColor.white: 'WHITE',
};

const _$BurnInFontColorEnumMap = {
  BurnInFontColor.black: 'BLACK',
  BurnInFontColor.blue: 'BLUE',
  BurnInFontColor.green: 'GREEN',
  BurnInFontColor.red: 'RED',
  BurnInFontColor.white: 'WHITE',
  BurnInFontColor.yellow: 'YELLOW',
};

const _$BurnInOutlineColorEnumMap = {
  BurnInOutlineColor.black: 'BLACK',
  BurnInOutlineColor.blue: 'BLUE',
  BurnInOutlineColor.green: 'GREEN',
  BurnInOutlineColor.red: 'RED',
  BurnInOutlineColor.white: 'WHITE',
  BurnInOutlineColor.yellow: 'YELLOW',
};

const _$BurnInShadowColorEnumMap = {
  BurnInShadowColor.black: 'BLACK',
  BurnInShadowColor.none: 'NONE',
  BurnInShadowColor.white: 'WHITE',
};

const _$BurnInTeletextGridControlEnumMap = {
  BurnInTeletextGridControl.fixed: 'FIXED',
  BurnInTeletextGridControl.scaled: 'SCALED',
};

CancelInputDeviceTransferResponse _$CancelInputDeviceTransferResponseFromJson(
    Map<String, dynamic> json) {
  return CancelInputDeviceTransferResponse();
}

CaptionDescription _$CaptionDescriptionFromJson(Map<String, dynamic> json) {
  return CaptionDescription(
    captionSelectorName: json['captionSelectorName'] as String,
    name: json['name'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : CaptionDestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    languageCode: json['languageCode'] as String,
    languageDescription: json['languageDescription'] as String,
  );
}

Map<String, dynamic> _$CaptionDescriptionToJson(CaptionDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('captionSelectorName', instance.captionSelectorName);
  writeNotNull('name', instance.name);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('languageCode', instance.languageCode);
  writeNotNull('languageDescription', instance.languageDescription);
  return val;
}

CaptionDestinationSettings _$CaptionDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return CaptionDestinationSettings(
    aribDestinationSettings: json['aribDestinationSettings'] == null
        ? null
        : AribDestinationSettings.fromJson(
            json['aribDestinationSettings'] as Map<String, dynamic>),
    burnInDestinationSettings: json['burnInDestinationSettings'] == null
        ? null
        : BurnInDestinationSettings.fromJson(
            json['burnInDestinationSettings'] as Map<String, dynamic>),
    dvbSubDestinationSettings: json['dvbSubDestinationSettings'] == null
        ? null
        : DvbSubDestinationSettings.fromJson(
            json['dvbSubDestinationSettings'] as Map<String, dynamic>),
    ebuTtDDestinationSettings: json['ebuTtDDestinationSettings'] == null
        ? null
        : EbuTtDDestinationSettings.fromJson(
            json['ebuTtDDestinationSettings'] as Map<String, dynamic>),
    embeddedDestinationSettings: json['embeddedDestinationSettings'] == null
        ? null
        : EmbeddedDestinationSettings.fromJson(
            json['embeddedDestinationSettings'] as Map<String, dynamic>),
    embeddedPlusScte20DestinationSettings:
        json['embeddedPlusScte20DestinationSettings'] == null
            ? null
            : EmbeddedPlusScte20DestinationSettings.fromJson(
                json['embeddedPlusScte20DestinationSettings']
                    as Map<String, dynamic>),
    rtmpCaptionInfoDestinationSettings:
        json['rtmpCaptionInfoDestinationSettings'] == null
            ? null
            : RtmpCaptionInfoDestinationSettings.fromJson(
                json['rtmpCaptionInfoDestinationSettings']
                    as Map<String, dynamic>),
    scte20PlusEmbeddedDestinationSettings:
        json['scte20PlusEmbeddedDestinationSettings'] == null
            ? null
            : Scte20PlusEmbeddedDestinationSettings.fromJson(
                json['scte20PlusEmbeddedDestinationSettings']
                    as Map<String, dynamic>),
    scte27DestinationSettings: json['scte27DestinationSettings'] == null
        ? null
        : Scte27DestinationSettings.fromJson(
            json['scte27DestinationSettings'] as Map<String, dynamic>),
    smpteTtDestinationSettings: json['smpteTtDestinationSettings'] == null
        ? null
        : SmpteTtDestinationSettings.fromJson(
            json['smpteTtDestinationSettings'] as Map<String, dynamic>),
    teletextDestinationSettings: json['teletextDestinationSettings'] == null
        ? null
        : TeletextDestinationSettings.fromJson(
            json['teletextDestinationSettings'] as Map<String, dynamic>),
    ttmlDestinationSettings: json['ttmlDestinationSettings'] == null
        ? null
        : TtmlDestinationSettings.fromJson(
            json['ttmlDestinationSettings'] as Map<String, dynamic>),
    webvttDestinationSettings: json['webvttDestinationSettings'] == null
        ? null
        : WebvttDestinationSettings.fromJson(
            json['webvttDestinationSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaptionDestinationSettingsToJson(
    CaptionDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'aribDestinationSettings', instance.aribDestinationSettings?.toJson());
  writeNotNull('burnInDestinationSettings',
      instance.burnInDestinationSettings?.toJson());
  writeNotNull('dvbSubDestinationSettings',
      instance.dvbSubDestinationSettings?.toJson());
  writeNotNull('ebuTtDDestinationSettings',
      instance.ebuTtDDestinationSettings?.toJson());
  writeNotNull('embeddedDestinationSettings',
      instance.embeddedDestinationSettings?.toJson());
  writeNotNull('embeddedPlusScte20DestinationSettings',
      instance.embeddedPlusScte20DestinationSettings?.toJson());
  writeNotNull('rtmpCaptionInfoDestinationSettings',
      instance.rtmpCaptionInfoDestinationSettings?.toJson());
  writeNotNull('scte20PlusEmbeddedDestinationSettings',
      instance.scte20PlusEmbeddedDestinationSettings?.toJson());
  writeNotNull('scte27DestinationSettings',
      instance.scte27DestinationSettings?.toJson());
  writeNotNull('smpteTtDestinationSettings',
      instance.smpteTtDestinationSettings?.toJson());
  writeNotNull('teletextDestinationSettings',
      instance.teletextDestinationSettings?.toJson());
  writeNotNull(
      'ttmlDestinationSettings', instance.ttmlDestinationSettings?.toJson());
  writeNotNull('webvttDestinationSettings',
      instance.webvttDestinationSettings?.toJson());
  return val;
}

CaptionLanguageMapping _$CaptionLanguageMappingFromJson(
    Map<String, dynamic> json) {
  return CaptionLanguageMapping(
    captionChannel: json['captionChannel'] as int,
    languageCode: json['languageCode'] as String,
    languageDescription: json['languageDescription'] as String,
  );
}

Map<String, dynamic> _$CaptionLanguageMappingToJson(
    CaptionLanguageMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('captionChannel', instance.captionChannel);
  writeNotNull('languageCode', instance.languageCode);
  writeNotNull('languageDescription', instance.languageDescription);
  return val;
}

CaptionSelector _$CaptionSelectorFromJson(Map<String, dynamic> json) {
  return CaptionSelector(
    name: json['name'] as String,
    languageCode: json['languageCode'] as String,
    selectorSettings: json['selectorSettings'] == null
        ? null
        : CaptionSelectorSettings.fromJson(
            json['selectorSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaptionSelectorToJson(CaptionSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('languageCode', instance.languageCode);
  writeNotNull('selectorSettings', instance.selectorSettings?.toJson());
  return val;
}

CaptionSelectorSettings _$CaptionSelectorSettingsFromJson(
    Map<String, dynamic> json) {
  return CaptionSelectorSettings(
    ancillarySourceSettings: json['ancillarySourceSettings'] == null
        ? null
        : AncillarySourceSettings.fromJson(
            json['ancillarySourceSettings'] as Map<String, dynamic>),
    aribSourceSettings: json['aribSourceSettings'] == null
        ? null
        : AribSourceSettings.fromJson(
            json['aribSourceSettings'] as Map<String, dynamic>),
    dvbSubSourceSettings: json['dvbSubSourceSettings'] == null
        ? null
        : DvbSubSourceSettings.fromJson(
            json['dvbSubSourceSettings'] as Map<String, dynamic>),
    embeddedSourceSettings: json['embeddedSourceSettings'] == null
        ? null
        : EmbeddedSourceSettings.fromJson(
            json['embeddedSourceSettings'] as Map<String, dynamic>),
    scte20SourceSettings: json['scte20SourceSettings'] == null
        ? null
        : Scte20SourceSettings.fromJson(
            json['scte20SourceSettings'] as Map<String, dynamic>),
    scte27SourceSettings: json['scte27SourceSettings'] == null
        ? null
        : Scte27SourceSettings.fromJson(
            json['scte27SourceSettings'] as Map<String, dynamic>),
    teletextSourceSettings: json['teletextSourceSettings'] == null
        ? null
        : TeletextSourceSettings.fromJson(
            json['teletextSourceSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaptionSelectorSettingsToJson(
    CaptionSelectorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ancillarySourceSettings', instance.ancillarySourceSettings?.toJson());
  writeNotNull('aribSourceSettings', instance.aribSourceSettings?.toJson());
  writeNotNull('dvbSubSourceSettings', instance.dvbSubSourceSettings?.toJson());
  writeNotNull(
      'embeddedSourceSettings', instance.embeddedSourceSettings?.toJson());
  writeNotNull('scte20SourceSettings', instance.scte20SourceSettings?.toJson());
  writeNotNull('scte27SourceSettings', instance.scte27SourceSettings?.toJson());
  writeNotNull(
      'teletextSourceSettings', instance.teletextSourceSettings?.toJson());
  return val;
}

CdiInputSpecification _$CdiInputSpecificationFromJson(
    Map<String, dynamic> json) {
  return CdiInputSpecification(
    resolution:
        _$enumDecodeNullable(_$CdiInputResolutionEnumMap, json['resolution']),
  );
}

Map<String, dynamic> _$CdiInputSpecificationToJson(
    CdiInputSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resolution', _$CdiInputResolutionEnumMap[instance.resolution]);
  return val;
}

const _$CdiInputResolutionEnumMap = {
  CdiInputResolution.sd: 'SD',
  CdiInputResolution.hd: 'HD',
  CdiInputResolution.fhd: 'FHD',
  CdiInputResolution.uhd: 'UHD',
};

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encoderSettings: json['encoderSettings'] == null
        ? null
        : EncoderSettings.fromJson(
            json['encoderSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$ChannelClassEnumMap = {
  ChannelClass.standard: 'STANDARD',
  ChannelClass.singlePipeline: 'SINGLE_PIPELINE',
};

const _$LogLevelEnumMap = {
  LogLevel.error: 'ERROR',
  LogLevel.warning: 'WARNING',
  LogLevel.info: 'INFO',
  LogLevel.debug: 'DEBUG',
  LogLevel.disabled: 'DISABLED',
};

const _$ChannelStateEnumMap = {
  ChannelState.creating: 'CREATING',
  ChannelState.createFailed: 'CREATE_FAILED',
  ChannelState.idle: 'IDLE',
  ChannelState.starting: 'STARTING',
  ChannelState.running: 'RUNNING',
  ChannelState.recovering: 'RECOVERING',
  ChannelState.stopping: 'STOPPING',
  ChannelState.deleting: 'DELETING',
  ChannelState.deleted: 'DELETED',
  ChannelState.updating: 'UPDATING',
  ChannelState.updateFailed: 'UPDATE_FAILED',
};

ChannelEgressEndpoint _$ChannelEgressEndpointFromJson(
    Map<String, dynamic> json) {
  return ChannelEgressEndpoint(
    sourceIp: json['sourceIp'] as String,
  );
}

ChannelSummary _$ChannelSummaryFromJson(Map<String, dynamic> json) {
  return ChannelSummary(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ColorSpacePassthroughSettings _$ColorSpacePassthroughSettingsFromJson(
    Map<String, dynamic> json) {
  return ColorSpacePassthroughSettings();
}

Map<String, dynamic> _$ColorSpacePassthroughSettingsToJson(
        ColorSpacePassthroughSettings instance) =>
    <String, dynamic>{};

CreateChannelResponse _$CreateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}

CreateInputResponse _$CreateInputResponseFromJson(Map<String, dynamic> json) {
  return CreateInputResponse(
    input: json['input'] == null
        ? null
        : Input.fromJson(json['input'] as Map<String, dynamic>),
  );
}

CreateInputSecurityGroupResponse _$CreateInputSecurityGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInputSecurityGroupResponse(
    securityGroup: json['securityGroup'] == null
        ? null
        : InputSecurityGroup.fromJson(
            json['securityGroup'] as Map<String, dynamic>),
  );
}

CreateMultiplexProgramResponse _$CreateMultiplexProgramResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMultiplexProgramResponse(
    multiplexProgram: json['multiplexProgram'] == null
        ? null
        : MultiplexProgram.fromJson(
            json['multiplexProgram'] as Map<String, dynamic>),
  );
}

CreateMultiplexResponse _$CreateMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMultiplexResponse(
    multiplex: json['multiplex'] == null
        ? null
        : Multiplex.fromJson(json['multiplex'] as Map<String, dynamic>),
  );
}

DeleteChannelResponse _$DeleteChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteChannelResponse(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encoderSettings: json['encoderSettings'] == null
        ? null
        : EncoderSettings.fromJson(
            json['encoderSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DeleteInputResponse _$DeleteInputResponseFromJson(Map<String, dynamic> json) {
  return DeleteInputResponse();
}

DeleteInputSecurityGroupResponse _$DeleteInputSecurityGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInputSecurityGroupResponse();
}

DeleteMultiplexProgramResponse _$DeleteMultiplexProgramResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMultiplexProgramResponse(
    channelId: json['channelId'] as String,
    multiplexProgramSettings: json['multiplexProgramSettings'] == null
        ? null
        : MultiplexProgramSettings.fromJson(
            json['multiplexProgramSettings'] as Map<String, dynamic>),
    packetIdentifiersMap: json['packetIdentifiersMap'] == null
        ? null
        : MultiplexProgramPacketIdentifiersMap.fromJson(
            json['packetIdentifiersMap'] as Map<String, dynamic>),
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexProgramPipelineDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    programName: json['programName'] as String,
  );
}

DeleteMultiplexResponse _$DeleteMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMultiplexResponse(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$MultiplexStateEnumMap = {
  MultiplexState.creating: 'CREATING',
  MultiplexState.createFailed: 'CREATE_FAILED',
  MultiplexState.idle: 'IDLE',
  MultiplexState.starting: 'STARTING',
  MultiplexState.running: 'RUNNING',
  MultiplexState.recovering: 'RECOVERING',
  MultiplexState.stopping: 'STOPPING',
  MultiplexState.deleting: 'DELETING',
  MultiplexState.deleted: 'DELETED',
};

DeleteReservationResponse _$DeleteReservationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteReservationResponse(
    arn: json['arn'] as String,
    count: json['count'] as int,
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits: _$enumDecodeNullable(
        _$OfferingDurationUnitsEnumMap, json['durationUnits']),
    end: json['end'] as String,
    fixedPrice: (json['fixedPrice'] as num)?.toDouble(),
    name: json['name'] as String,
    offeringDescription: json['offeringDescription'] as String,
    offeringId: json['offeringId'] as String,
    offeringType:
        _$enumDecodeNullable(_$OfferingTypeEnumMap, json['offeringType']),
    region: json['region'] as String,
    reservationId: json['reservationId'] as String,
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ReservationResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    start: json['start'] as String,
    state: _$enumDecodeNullable(_$ReservationStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    usagePrice: (json['usagePrice'] as num)?.toDouble(),
  );
}

const _$OfferingDurationUnitsEnumMap = {
  OfferingDurationUnits.months: 'MONTHS',
};

const _$OfferingTypeEnumMap = {
  OfferingType.noUpfront: 'NO_UPFRONT',
};

const _$ReservationStateEnumMap = {
  ReservationState.active: 'ACTIVE',
  ReservationState.expired: 'EXPIRED',
  ReservationState.canceled: 'CANCELED',
  ReservationState.deleted: 'DELETED',
};

DeleteScheduleResponse _$DeleteScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScheduleResponse();
}

DescribeChannelResponse _$DescribeChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelResponse(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encoderSettings: json['encoderSettings'] == null
        ? null
        : EncoderSettings.fromJson(
            json['encoderSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeInputDeviceResponse _$DescribeInputDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInputDeviceResponse(
    arn: json['arn'] as String,
    connectionState: _$enumDecodeNullable(
        _$InputDeviceConnectionStateEnumMap, json['connectionState']),
    deviceSettingsSyncState: _$enumDecodeNullable(
        _$DeviceSettingsSyncStateEnumMap, json['deviceSettingsSyncState']),
    deviceUpdateStatus: _$enumDecodeNullable(
        _$DeviceUpdateStatusEnumMap, json['deviceUpdateStatus']),
    hdDeviceSettings: json['hdDeviceSettings'] == null
        ? null
        : InputDeviceHdSettings.fromJson(
            json['hdDeviceSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    macAddress: json['macAddress'] as String,
    name: json['name'] as String,
    networkSettings: json['networkSettings'] == null
        ? null
        : InputDeviceNetworkSettings.fromJson(
            json['networkSettings'] as Map<String, dynamic>),
    serialNumber: json['serialNumber'] as String,
    type: _$enumDecodeNullable(_$InputDeviceTypeEnumMap, json['type']),
    uhdDeviceSettings: json['uhdDeviceSettings'] == null
        ? null
        : InputDeviceUhdSettings.fromJson(
            json['uhdDeviceSettings'] as Map<String, dynamic>),
  );
}

const _$InputDeviceConnectionStateEnumMap = {
  InputDeviceConnectionState.disconnected: 'DISCONNECTED',
  InputDeviceConnectionState.connected: 'CONNECTED',
};

const _$DeviceSettingsSyncStateEnumMap = {
  DeviceSettingsSyncState.synced: 'SYNCED',
  DeviceSettingsSyncState.syncing: 'SYNCING',
};

const _$DeviceUpdateStatusEnumMap = {
  DeviceUpdateStatus.upToDate: 'UP_TO_DATE',
  DeviceUpdateStatus.notUpToDate: 'NOT_UP_TO_DATE',
};

const _$InputDeviceTypeEnumMap = {
  InputDeviceType.hd: 'HD',
};

DescribeInputDeviceThumbnailResponse
    _$DescribeInputDeviceThumbnailResponseFromJson(Map<String, dynamic> json) {
  return DescribeInputDeviceThumbnailResponse(
    body: const Uint8ListConverter().fromJson(json['body'] as String),
    contentLength: json['Content-Length'] as int,
    contentType:
        _$enumDecodeNullable(_$ContentTypeEnumMap, json['Content-Type']),
    eTag: json['ETag'] as String,
    lastModified: const RfcDateTimeConverter().fromJson(json['Last-Modified']),
  );
}

const _$ContentTypeEnumMap = {
  ContentType.imageJpeg: 'image/jpeg',
};

DescribeInputResponse _$DescribeInputResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInputResponse(
    arn: json['arn'] as String,
    attachedChannels:
        (json['attachedChannels'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : InputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    inputClass: _$enumDecodeNullable(_$InputClassEnumMap, json['inputClass']),
    inputDevices: (json['inputDevices'] as List)
        ?.map((e) => e == null
            ? null
            : InputDeviceSettings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSourceType:
        _$enumDecodeNullable(_$InputSourceTypeEnumMap, json['inputSourceType']),
    mediaConnectFlows: (json['mediaConnectFlows'] as List)
        ?.map((e) => e == null
            ? null
            : MediaConnectFlow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : InputSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$InputStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$InputTypeEnumMap, json['type']),
  );
}

const _$InputClassEnumMap = {
  InputClass.standard: 'STANDARD',
  InputClass.singlePipeline: 'SINGLE_PIPELINE',
};

const _$InputSourceTypeEnumMap = {
  InputSourceType.static: 'STATIC',
  InputSourceType.dynamic: 'DYNAMIC',
};

const _$InputStateEnumMap = {
  InputState.creating: 'CREATING',
  InputState.detached: 'DETACHED',
  InputState.attached: 'ATTACHED',
  InputState.deleting: 'DELETING',
  InputState.deleted: 'DELETED',
};

const _$InputTypeEnumMap = {
  InputType.udpPush: 'UDP_PUSH',
  InputType.rtpPush: 'RTP_PUSH',
  InputType.rtmpPush: 'RTMP_PUSH',
  InputType.rtmpPull: 'RTMP_PULL',
  InputType.urlPull: 'URL_PULL',
  InputType.mp4File: 'MP4_FILE',
  InputType.mediaconnect: 'MEDIACONNECT',
  InputType.inputDevice: 'INPUT_DEVICE',
  InputType.awsCdi: 'AWS_CDI',
};

DescribeInputSecurityGroupResponse _$DescribeInputSecurityGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInputSecurityGroupResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
    inputs: (json['inputs'] as List)?.map((e) => e as String)?.toList(),
    state:
        _$enumDecodeNullable(_$InputSecurityGroupStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    whitelistRules: (json['whitelistRules'] as List)
        ?.map((e) => e == null
            ? null
            : InputWhitelistRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$InputSecurityGroupStateEnumMap = {
  InputSecurityGroupState.idle: 'IDLE',
  InputSecurityGroupState.inUse: 'IN_USE',
  InputSecurityGroupState.updating: 'UPDATING',
  InputSecurityGroupState.deleted: 'DELETED',
};

DescribeMultiplexProgramResponse _$DescribeMultiplexProgramResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMultiplexProgramResponse(
    channelId: json['channelId'] as String,
    multiplexProgramSettings: json['multiplexProgramSettings'] == null
        ? null
        : MultiplexProgramSettings.fromJson(
            json['multiplexProgramSettings'] as Map<String, dynamic>),
    packetIdentifiersMap: json['packetIdentifiersMap'] == null
        ? null
        : MultiplexProgramPacketIdentifiersMap.fromJson(
            json['packetIdentifiersMap'] as Map<String, dynamic>),
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexProgramPipelineDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    programName: json['programName'] as String,
  );
}

DescribeMultiplexResponse _$DescribeMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMultiplexResponse(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeOfferingResponse _$DescribeOfferingResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOfferingResponse(
    arn: json['arn'] as String,
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits: _$enumDecodeNullable(
        _$OfferingDurationUnitsEnumMap, json['durationUnits']),
    fixedPrice: (json['fixedPrice'] as num)?.toDouble(),
    offeringDescription: json['offeringDescription'] as String,
    offeringId: json['offeringId'] as String,
    offeringType:
        _$enumDecodeNullable(_$OfferingTypeEnumMap, json['offeringType']),
    region: json['region'] as String,
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ReservationResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    usagePrice: (json['usagePrice'] as num)?.toDouble(),
  );
}

DescribeReservationResponse _$DescribeReservationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeReservationResponse(
    arn: json['arn'] as String,
    count: json['count'] as int,
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits: _$enumDecodeNullable(
        _$OfferingDurationUnitsEnumMap, json['durationUnits']),
    end: json['end'] as String,
    fixedPrice: (json['fixedPrice'] as num)?.toDouble(),
    name: json['name'] as String,
    offeringDescription: json['offeringDescription'] as String,
    offeringId: json['offeringId'] as String,
    offeringType:
        _$enumDecodeNullable(_$OfferingTypeEnumMap, json['offeringType']),
    region: json['region'] as String,
    reservationId: json['reservationId'] as String,
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ReservationResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    start: json['start'] as String,
    state: _$enumDecodeNullable(_$ReservationStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    usagePrice: (json['usagePrice'] as num)?.toDouble(),
  );
}

DescribeScheduleResponse _$DescribeScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScheduleResponse(
    nextToken: json['nextToken'] as String,
    scheduleActions: (json['scheduleActions'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduleAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DvbNitSettings _$DvbNitSettingsFromJson(Map<String, dynamic> json) {
  return DvbNitSettings(
    networkId: json['networkId'] as int,
    networkName: json['networkName'] as String,
    repInterval: json['repInterval'] as int,
  );
}

Map<String, dynamic> _$DvbNitSettingsToJson(DvbNitSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('networkId', instance.networkId);
  writeNotNull('networkName', instance.networkName);
  writeNotNull('repInterval', instance.repInterval);
  return val;
}

DvbSdtSettings _$DvbSdtSettingsFromJson(Map<String, dynamic> json) {
  return DvbSdtSettings(
    outputSdt:
        _$enumDecodeNullable(_$DvbSdtOutputSdtEnumMap, json['outputSdt']),
    repInterval: json['repInterval'] as int,
    serviceName: json['serviceName'] as String,
    serviceProviderName: json['serviceProviderName'] as String,
  );
}

Map<String, dynamic> _$DvbSdtSettingsToJson(DvbSdtSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('outputSdt', _$DvbSdtOutputSdtEnumMap[instance.outputSdt]);
  writeNotNull('repInterval', instance.repInterval);
  writeNotNull('serviceName', instance.serviceName);
  writeNotNull('serviceProviderName', instance.serviceProviderName);
  return val;
}

const _$DvbSdtOutputSdtEnumMap = {
  DvbSdtOutputSdt.sdtFollow: 'SDT_FOLLOW',
  DvbSdtOutputSdt.sdtFollowIfPresent: 'SDT_FOLLOW_IF_PRESENT',
  DvbSdtOutputSdt.sdtManual: 'SDT_MANUAL',
  DvbSdtOutputSdt.sdtNone: 'SDT_NONE',
};

DvbSubDestinationSettings _$DvbSubDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return DvbSubDestinationSettings(
    alignment: _$enumDecodeNullable(
        _$DvbSubDestinationAlignmentEnumMap, json['alignment']),
    backgroundColor: _$enumDecodeNullable(
        _$DvbSubDestinationBackgroundColorEnumMap, json['backgroundColor']),
    backgroundOpacity: json['backgroundOpacity'] as int,
    font: json['font'] == null
        ? null
        : InputLocation.fromJson(json['font'] as Map<String, dynamic>),
    fontColor: _$enumDecodeNullable(
        _$DvbSubDestinationFontColorEnumMap, json['fontColor']),
    fontOpacity: json['fontOpacity'] as int,
    fontResolution: json['fontResolution'] as int,
    fontSize: json['fontSize'] as String,
    outlineColor: _$enumDecodeNullable(
        _$DvbSubDestinationOutlineColorEnumMap, json['outlineColor']),
    outlineSize: json['outlineSize'] as int,
    shadowColor: _$enumDecodeNullable(
        _$DvbSubDestinationShadowColorEnumMap, json['shadowColor']),
    shadowOpacity: json['shadowOpacity'] as int,
    shadowXOffset: json['shadowXOffset'] as int,
    shadowYOffset: json['shadowYOffset'] as int,
    teletextGridControl: _$enumDecodeNullable(
        _$DvbSubDestinationTeletextGridControlEnumMap,
        json['teletextGridControl']),
    xPosition: json['xPosition'] as int,
    yPosition: json['yPosition'] as int,
  );
}

Map<String, dynamic> _$DvbSubDestinationSettingsToJson(
    DvbSubDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'alignment', _$DvbSubDestinationAlignmentEnumMap[instance.alignment]);
  writeNotNull('backgroundColor',
      _$DvbSubDestinationBackgroundColorEnumMap[instance.backgroundColor]);
  writeNotNull('backgroundOpacity', instance.backgroundOpacity);
  writeNotNull('font', instance.font?.toJson());
  writeNotNull(
      'fontColor', _$DvbSubDestinationFontColorEnumMap[instance.fontColor]);
  writeNotNull('fontOpacity', instance.fontOpacity);
  writeNotNull('fontResolution', instance.fontResolution);
  writeNotNull('fontSize', instance.fontSize);
  writeNotNull('outlineColor',
      _$DvbSubDestinationOutlineColorEnumMap[instance.outlineColor]);
  writeNotNull('outlineSize', instance.outlineSize);
  writeNotNull('shadowColor',
      _$DvbSubDestinationShadowColorEnumMap[instance.shadowColor]);
  writeNotNull('shadowOpacity', instance.shadowOpacity);
  writeNotNull('shadowXOffset', instance.shadowXOffset);
  writeNotNull('shadowYOffset', instance.shadowYOffset);
  writeNotNull(
      'teletextGridControl',
      _$DvbSubDestinationTeletextGridControlEnumMap[
          instance.teletextGridControl]);
  writeNotNull('xPosition', instance.xPosition);
  writeNotNull('yPosition', instance.yPosition);
  return val;
}

const _$DvbSubDestinationAlignmentEnumMap = {
  DvbSubDestinationAlignment.centered: 'CENTERED',
  DvbSubDestinationAlignment.left: 'LEFT',
  DvbSubDestinationAlignment.smart: 'SMART',
};

const _$DvbSubDestinationBackgroundColorEnumMap = {
  DvbSubDestinationBackgroundColor.black: 'BLACK',
  DvbSubDestinationBackgroundColor.none: 'NONE',
  DvbSubDestinationBackgroundColor.white: 'WHITE',
};

const _$DvbSubDestinationFontColorEnumMap = {
  DvbSubDestinationFontColor.black: 'BLACK',
  DvbSubDestinationFontColor.blue: 'BLUE',
  DvbSubDestinationFontColor.green: 'GREEN',
  DvbSubDestinationFontColor.red: 'RED',
  DvbSubDestinationFontColor.white: 'WHITE',
  DvbSubDestinationFontColor.yellow: 'YELLOW',
};

const _$DvbSubDestinationOutlineColorEnumMap = {
  DvbSubDestinationOutlineColor.black: 'BLACK',
  DvbSubDestinationOutlineColor.blue: 'BLUE',
  DvbSubDestinationOutlineColor.green: 'GREEN',
  DvbSubDestinationOutlineColor.red: 'RED',
  DvbSubDestinationOutlineColor.white: 'WHITE',
  DvbSubDestinationOutlineColor.yellow: 'YELLOW',
};

const _$DvbSubDestinationShadowColorEnumMap = {
  DvbSubDestinationShadowColor.black: 'BLACK',
  DvbSubDestinationShadowColor.none: 'NONE',
  DvbSubDestinationShadowColor.white: 'WHITE',
};

const _$DvbSubDestinationTeletextGridControlEnumMap = {
  DvbSubDestinationTeletextGridControl.fixed: 'FIXED',
  DvbSubDestinationTeletextGridControl.scaled: 'SCALED',
};

DvbSubSourceSettings _$DvbSubSourceSettingsFromJson(Map<String, dynamic> json) {
  return DvbSubSourceSettings(
    pid: json['pid'] as int,
  );
}

Map<String, dynamic> _$DvbSubSourceSettingsToJson(
    DvbSubSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pid', instance.pid);
  return val;
}

DvbTdtSettings _$DvbTdtSettingsFromJson(Map<String, dynamic> json) {
  return DvbTdtSettings(
    repInterval: json['repInterval'] as int,
  );
}

Map<String, dynamic> _$DvbTdtSettingsToJson(DvbTdtSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repInterval', instance.repInterval);
  return val;
}

Eac3Settings _$Eac3SettingsFromJson(Map<String, dynamic> json) {
  return Eac3Settings(
    attenuationControl: _$enumDecodeNullable(
        _$Eac3AttenuationControlEnumMap, json['attenuationControl']),
    bitrate: (json['bitrate'] as num)?.toDouble(),
    bitstreamMode:
        _$enumDecodeNullable(_$Eac3BitstreamModeEnumMap, json['bitstreamMode']),
    codingMode:
        _$enumDecodeNullable(_$Eac3CodingModeEnumMap, json['codingMode']),
    dcFilter: _$enumDecodeNullable(_$Eac3DcFilterEnumMap, json['dcFilter']),
    dialnorm: json['dialnorm'] as int,
    drcLine: _$enumDecodeNullable(_$Eac3DrcLineEnumMap, json['drcLine']),
    drcRf: _$enumDecodeNullable(_$Eac3DrcRfEnumMap, json['drcRf']),
    lfeControl:
        _$enumDecodeNullable(_$Eac3LfeControlEnumMap, json['lfeControl']),
    lfeFilter: _$enumDecodeNullable(_$Eac3LfeFilterEnumMap, json['lfeFilter']),
    loRoCenterMixLevel: (json['loRoCenterMixLevel'] as num)?.toDouble(),
    loRoSurroundMixLevel: (json['loRoSurroundMixLevel'] as num)?.toDouble(),
    ltRtCenterMixLevel: (json['ltRtCenterMixLevel'] as num)?.toDouble(),
    ltRtSurroundMixLevel: (json['ltRtSurroundMixLevel'] as num)?.toDouble(),
    metadataControl: _$enumDecodeNullable(
        _$Eac3MetadataControlEnumMap, json['metadataControl']),
    passthroughControl: _$enumDecodeNullable(
        _$Eac3PassthroughControlEnumMap, json['passthroughControl']),
    phaseControl:
        _$enumDecodeNullable(_$Eac3PhaseControlEnumMap, json['phaseControl']),
    stereoDownmix:
        _$enumDecodeNullable(_$Eac3StereoDownmixEnumMap, json['stereoDownmix']),
    surroundExMode: _$enumDecodeNullable(
        _$Eac3SurroundExModeEnumMap, json['surroundExMode']),
    surroundMode:
        _$enumDecodeNullable(_$Eac3SurroundModeEnumMap, json['surroundMode']),
  );
}

Map<String, dynamic> _$Eac3SettingsToJson(Eac3Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attenuationControl',
      _$Eac3AttenuationControlEnumMap[instance.attenuationControl]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull(
      'bitstreamMode', _$Eac3BitstreamModeEnumMap[instance.bitstreamMode]);
  writeNotNull('codingMode', _$Eac3CodingModeEnumMap[instance.codingMode]);
  writeNotNull('dcFilter', _$Eac3DcFilterEnumMap[instance.dcFilter]);
  writeNotNull('dialnorm', instance.dialnorm);
  writeNotNull('drcLine', _$Eac3DrcLineEnumMap[instance.drcLine]);
  writeNotNull('drcRf', _$Eac3DrcRfEnumMap[instance.drcRf]);
  writeNotNull('lfeControl', _$Eac3LfeControlEnumMap[instance.lfeControl]);
  writeNotNull('lfeFilter', _$Eac3LfeFilterEnumMap[instance.lfeFilter]);
  writeNotNull('loRoCenterMixLevel', instance.loRoCenterMixLevel);
  writeNotNull('loRoSurroundMixLevel', instance.loRoSurroundMixLevel);
  writeNotNull('ltRtCenterMixLevel', instance.ltRtCenterMixLevel);
  writeNotNull('ltRtSurroundMixLevel', instance.ltRtSurroundMixLevel);
  writeNotNull('metadataControl',
      _$Eac3MetadataControlEnumMap[instance.metadataControl]);
  writeNotNull('passthroughControl',
      _$Eac3PassthroughControlEnumMap[instance.passthroughControl]);
  writeNotNull(
      'phaseControl', _$Eac3PhaseControlEnumMap[instance.phaseControl]);
  writeNotNull(
      'stereoDownmix', _$Eac3StereoDownmixEnumMap[instance.stereoDownmix]);
  writeNotNull(
      'surroundExMode', _$Eac3SurroundExModeEnumMap[instance.surroundExMode]);
  writeNotNull(
      'surroundMode', _$Eac3SurroundModeEnumMap[instance.surroundMode]);
  return val;
}

const _$Eac3AttenuationControlEnumMap = {
  Eac3AttenuationControl.attenuate_3Db: 'ATTENUATE_3_DB',
  Eac3AttenuationControl.none: 'NONE',
};

const _$Eac3BitstreamModeEnumMap = {
  Eac3BitstreamMode.commentary: 'COMMENTARY',
  Eac3BitstreamMode.completeMain: 'COMPLETE_MAIN',
  Eac3BitstreamMode.emergency: 'EMERGENCY',
  Eac3BitstreamMode.hearingImpaired: 'HEARING_IMPAIRED',
  Eac3BitstreamMode.visuallyImpaired: 'VISUALLY_IMPAIRED',
};

const _$Eac3CodingModeEnumMap = {
  Eac3CodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  Eac3CodingMode.codingMode_2_0: 'CODING_MODE_2_0',
  Eac3CodingMode.codingMode_3_2: 'CODING_MODE_3_2',
};

const _$Eac3DcFilterEnumMap = {
  Eac3DcFilter.disabled: 'DISABLED',
  Eac3DcFilter.enabled: 'ENABLED',
};

const _$Eac3DrcLineEnumMap = {
  Eac3DrcLine.filmLight: 'FILM_LIGHT',
  Eac3DrcLine.filmStandard: 'FILM_STANDARD',
  Eac3DrcLine.musicLight: 'MUSIC_LIGHT',
  Eac3DrcLine.musicStandard: 'MUSIC_STANDARD',
  Eac3DrcLine.none: 'NONE',
  Eac3DrcLine.speech: 'SPEECH',
};

const _$Eac3DrcRfEnumMap = {
  Eac3DrcRf.filmLight: 'FILM_LIGHT',
  Eac3DrcRf.filmStandard: 'FILM_STANDARD',
  Eac3DrcRf.musicLight: 'MUSIC_LIGHT',
  Eac3DrcRf.musicStandard: 'MUSIC_STANDARD',
  Eac3DrcRf.none: 'NONE',
  Eac3DrcRf.speech: 'SPEECH',
};

const _$Eac3LfeControlEnumMap = {
  Eac3LfeControl.lfe: 'LFE',
  Eac3LfeControl.noLfe: 'NO_LFE',
};

const _$Eac3LfeFilterEnumMap = {
  Eac3LfeFilter.disabled: 'DISABLED',
  Eac3LfeFilter.enabled: 'ENABLED',
};

const _$Eac3MetadataControlEnumMap = {
  Eac3MetadataControl.followInput: 'FOLLOW_INPUT',
  Eac3MetadataControl.useConfigured: 'USE_CONFIGURED',
};

const _$Eac3PassthroughControlEnumMap = {
  Eac3PassthroughControl.noPassthrough: 'NO_PASSTHROUGH',
  Eac3PassthroughControl.whenPossible: 'WHEN_POSSIBLE',
};

const _$Eac3PhaseControlEnumMap = {
  Eac3PhaseControl.noShift: 'NO_SHIFT',
  Eac3PhaseControl.shift_90Degrees: 'SHIFT_90_DEGREES',
};

const _$Eac3StereoDownmixEnumMap = {
  Eac3StereoDownmix.dpl2: 'DPL2',
  Eac3StereoDownmix.loRo: 'LO_RO',
  Eac3StereoDownmix.ltRt: 'LT_RT',
  Eac3StereoDownmix.notIndicated: 'NOT_INDICATED',
};

const _$Eac3SurroundExModeEnumMap = {
  Eac3SurroundExMode.disabled: 'DISABLED',
  Eac3SurroundExMode.enabled: 'ENABLED',
  Eac3SurroundExMode.notIndicated: 'NOT_INDICATED',
};

const _$Eac3SurroundModeEnumMap = {
  Eac3SurroundMode.disabled: 'DISABLED',
  Eac3SurroundMode.enabled: 'ENABLED',
  Eac3SurroundMode.notIndicated: 'NOT_INDICATED',
};

EbuTtDDestinationSettings _$EbuTtDDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return EbuTtDDestinationSettings(
    fillLineGap: _$enumDecodeNullable(
        _$EbuTtDFillLineGapControlEnumMap, json['fillLineGap']),
    fontFamily: json['fontFamily'] as String,
    styleControl: _$enumDecodeNullable(
        _$EbuTtDDestinationStyleControlEnumMap, json['styleControl']),
  );
}

Map<String, dynamic> _$EbuTtDDestinationSettingsToJson(
    EbuTtDDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'fillLineGap', _$EbuTtDFillLineGapControlEnumMap[instance.fillLineGap]);
  writeNotNull('fontFamily', instance.fontFamily);
  writeNotNull('styleControl',
      _$EbuTtDDestinationStyleControlEnumMap[instance.styleControl]);
  return val;
}

const _$EbuTtDFillLineGapControlEnumMap = {
  EbuTtDFillLineGapControl.disabled: 'DISABLED',
  EbuTtDFillLineGapControl.enabled: 'ENABLED',
};

const _$EbuTtDDestinationStyleControlEnumMap = {
  EbuTtDDestinationStyleControl.exclude: 'EXCLUDE',
  EbuTtDDestinationStyleControl.include: 'INCLUDE',
};

EmbeddedDestinationSettings _$EmbeddedDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return EmbeddedDestinationSettings();
}

Map<String, dynamic> _$EmbeddedDestinationSettingsToJson(
        EmbeddedDestinationSettings instance) =>
    <String, dynamic>{};

EmbeddedPlusScte20DestinationSettings
    _$EmbeddedPlusScte20DestinationSettingsFromJson(Map<String, dynamic> json) {
  return EmbeddedPlusScte20DestinationSettings();
}

Map<String, dynamic> _$EmbeddedPlusScte20DestinationSettingsToJson(
        EmbeddedPlusScte20DestinationSettings instance) =>
    <String, dynamic>{};

EmbeddedSourceSettings _$EmbeddedSourceSettingsFromJson(
    Map<String, dynamic> json) {
  return EmbeddedSourceSettings(
    convert608To708: _$enumDecodeNullable(
        _$EmbeddedConvert608To708EnumMap, json['convert608To708']),
    scte20Detection: _$enumDecodeNullable(
        _$EmbeddedScte20DetectionEnumMap, json['scte20Detection']),
    source608ChannelNumber: json['source608ChannelNumber'] as int,
    source608TrackNumber: json['source608TrackNumber'] as int,
  );
}

Map<String, dynamic> _$EmbeddedSourceSettingsToJson(
    EmbeddedSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('convert608To708',
      _$EmbeddedConvert608To708EnumMap[instance.convert608To708]);
  writeNotNull('scte20Detection',
      _$EmbeddedScte20DetectionEnumMap[instance.scte20Detection]);
  writeNotNull('source608ChannelNumber', instance.source608ChannelNumber);
  writeNotNull('source608TrackNumber', instance.source608TrackNumber);
  return val;
}

const _$EmbeddedConvert608To708EnumMap = {
  EmbeddedConvert608To708.disabled: 'DISABLED',
  EmbeddedConvert608To708.upconvert: 'UPCONVERT',
};

const _$EmbeddedScte20DetectionEnumMap = {
  EmbeddedScte20Detection.auto: 'AUTO',
  EmbeddedScte20Detection.off: 'OFF',
};

EncoderSettings _$EncoderSettingsFromJson(Map<String, dynamic> json) {
  return EncoderSettings(
    audioDescriptions: (json['audioDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AudioDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputGroups: (json['outputGroups'] as List)
        ?.map((e) =>
            e == null ? null : OutputGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timecodeConfig: json['timecodeConfig'] == null
        ? null
        : TimecodeConfig.fromJson(
            json['timecodeConfig'] as Map<String, dynamic>),
    videoDescriptions: (json['videoDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : VideoDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availBlanking: json['availBlanking'] == null
        ? null
        : AvailBlanking.fromJson(json['availBlanking'] as Map<String, dynamic>),
    availConfiguration: json['availConfiguration'] == null
        ? null
        : AvailConfiguration.fromJson(
            json['availConfiguration'] as Map<String, dynamic>),
    blackoutSlate: json['blackoutSlate'] == null
        ? null
        : BlackoutSlate.fromJson(json['blackoutSlate'] as Map<String, dynamic>),
    captionDescriptions: (json['captionDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    featureActivations: json['featureActivations'] == null
        ? null
        : FeatureActivations.fromJson(
            json['featureActivations'] as Map<String, dynamic>),
    globalConfiguration: json['globalConfiguration'] == null
        ? null
        : GlobalConfiguration.fromJson(
            json['globalConfiguration'] as Map<String, dynamic>),
    nielsenConfiguration: json['nielsenConfiguration'] == null
        ? null
        : NielsenConfiguration.fromJson(
            json['nielsenConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EncoderSettingsToJson(EncoderSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioDescriptions',
      instance.audioDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'outputGroups', instance.outputGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('timecodeConfig', instance.timecodeConfig?.toJson());
  writeNotNull('videoDescriptions',
      instance.videoDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('availBlanking', instance.availBlanking?.toJson());
  writeNotNull('availConfiguration', instance.availConfiguration?.toJson());
  writeNotNull('blackoutSlate', instance.blackoutSlate?.toJson());
  writeNotNull('captionDescriptions',
      instance.captionDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('featureActivations', instance.featureActivations?.toJson());
  writeNotNull('globalConfiguration', instance.globalConfiguration?.toJson());
  writeNotNull('nielsenConfiguration', instance.nielsenConfiguration?.toJson());
  return val;
}

FailoverCondition _$FailoverConditionFromJson(Map<String, dynamic> json) {
  return FailoverCondition(
    failoverConditionSettings: json['failoverConditionSettings'] == null
        ? null
        : FailoverConditionSettings.fromJson(
            json['failoverConditionSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FailoverConditionToJson(FailoverCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('failoverConditionSettings',
      instance.failoverConditionSettings?.toJson());
  return val;
}

FailoverConditionSettings _$FailoverConditionSettingsFromJson(
    Map<String, dynamic> json) {
  return FailoverConditionSettings(
    audioSilenceSettings: json['audioSilenceSettings'] == null
        ? null
        : AudioSilenceFailoverSettings.fromJson(
            json['audioSilenceSettings'] as Map<String, dynamic>),
    inputLossSettings: json['inputLossSettings'] == null
        ? null
        : InputLossFailoverSettings.fromJson(
            json['inputLossSettings'] as Map<String, dynamic>),
    videoBlackSettings: json['videoBlackSettings'] == null
        ? null
        : VideoBlackFailoverSettings.fromJson(
            json['videoBlackSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FailoverConditionSettingsToJson(
    FailoverConditionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSilenceSettings', instance.audioSilenceSettings?.toJson());
  writeNotNull('inputLossSettings', instance.inputLossSettings?.toJson());
  writeNotNull('videoBlackSettings', instance.videoBlackSettings?.toJson());
  return val;
}

FeatureActivations _$FeatureActivationsFromJson(Map<String, dynamic> json) {
  return FeatureActivations(
    inputPrepareScheduleActions: _$enumDecodeNullable(
        _$FeatureActivationsInputPrepareScheduleActionsEnumMap,
        json['inputPrepareScheduleActions']),
  );
}

Map<String, dynamic> _$FeatureActivationsToJson(FeatureActivations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'inputPrepareScheduleActions',
      _$FeatureActivationsInputPrepareScheduleActionsEnumMap[
          instance.inputPrepareScheduleActions]);
  return val;
}

const _$FeatureActivationsInputPrepareScheduleActionsEnumMap = {
  FeatureActivationsInputPrepareScheduleActions.disabled: 'DISABLED',
  FeatureActivationsInputPrepareScheduleActions.enabled: 'ENABLED',
};

FecOutputSettings _$FecOutputSettingsFromJson(Map<String, dynamic> json) {
  return FecOutputSettings(
    columnDepth: json['columnDepth'] as int,
    includeFec:
        _$enumDecodeNullable(_$FecOutputIncludeFecEnumMap, json['includeFec']),
    rowLength: json['rowLength'] as int,
  );
}

Map<String, dynamic> _$FecOutputSettingsToJson(FecOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('columnDepth', instance.columnDepth);
  writeNotNull('includeFec', _$FecOutputIncludeFecEnumMap[instance.includeFec]);
  writeNotNull('rowLength', instance.rowLength);
  return val;
}

const _$FecOutputIncludeFecEnumMap = {
  FecOutputIncludeFec.column: 'COLUMN',
  FecOutputIncludeFec.columnAndRow: 'COLUMN_AND_ROW',
};

FixedModeScheduleActionStartSettings
    _$FixedModeScheduleActionStartSettingsFromJson(Map<String, dynamic> json) {
  return FixedModeScheduleActionStartSettings(
    time: json['time'] as String,
  );
}

Map<String, dynamic> _$FixedModeScheduleActionStartSettingsToJson(
    FixedModeScheduleActionStartSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time', instance.time);
  return val;
}

Fmp4HlsSettings _$Fmp4HlsSettingsFromJson(Map<String, dynamic> json) {
  return Fmp4HlsSettings(
    audioRenditionSets: json['audioRenditionSets'] as String,
    nielsenId3Behavior: _$enumDecodeNullable(
        _$Fmp4NielsenId3BehaviorEnumMap, json['nielsenId3Behavior']),
    timedMetadataBehavior: _$enumDecodeNullable(
        _$Fmp4TimedMetadataBehaviorEnumMap, json['timedMetadataBehavior']),
  );
}

Map<String, dynamic> _$Fmp4HlsSettingsToJson(Fmp4HlsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioRenditionSets', instance.audioRenditionSets);
  writeNotNull('nielsenId3Behavior',
      _$Fmp4NielsenId3BehaviorEnumMap[instance.nielsenId3Behavior]);
  writeNotNull('timedMetadataBehavior',
      _$Fmp4TimedMetadataBehaviorEnumMap[instance.timedMetadataBehavior]);
  return val;
}

const _$Fmp4NielsenId3BehaviorEnumMap = {
  Fmp4NielsenId3Behavior.noPassthrough: 'NO_PASSTHROUGH',
  Fmp4NielsenId3Behavior.passthrough: 'PASSTHROUGH',
};

const _$Fmp4TimedMetadataBehaviorEnumMap = {
  Fmp4TimedMetadataBehavior.noPassthrough: 'NO_PASSTHROUGH',
  Fmp4TimedMetadataBehavior.passthrough: 'PASSTHROUGH',
};

FollowModeScheduleActionStartSettings
    _$FollowModeScheduleActionStartSettingsFromJson(Map<String, dynamic> json) {
  return FollowModeScheduleActionStartSettings(
    followPoint:
        _$enumDecodeNullable(_$FollowPointEnumMap, json['followPoint']),
    referenceActionName: json['referenceActionName'] as String,
  );
}

Map<String, dynamic> _$FollowModeScheduleActionStartSettingsToJson(
    FollowModeScheduleActionStartSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('followPoint', _$FollowPointEnumMap[instance.followPoint]);
  writeNotNull('referenceActionName', instance.referenceActionName);
  return val;
}

const _$FollowPointEnumMap = {
  FollowPoint.end: 'END',
  FollowPoint.start: 'START',
};

FrameCaptureGroupSettings _$FrameCaptureGroupSettingsFromJson(
    Map<String, dynamic> json) {
  return FrameCaptureGroupSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FrameCaptureGroupSettingsToJson(
    FrameCaptureGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  return val;
}

FrameCaptureOutputSettings _$FrameCaptureOutputSettingsFromJson(
    Map<String, dynamic> json) {
  return FrameCaptureOutputSettings(
    nameModifier: json['nameModifier'] as String,
  );
}

Map<String, dynamic> _$FrameCaptureOutputSettingsToJson(
    FrameCaptureOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nameModifier', instance.nameModifier);
  return val;
}

FrameCaptureSettings _$FrameCaptureSettingsFromJson(Map<String, dynamic> json) {
  return FrameCaptureSettings(
    captureInterval: json['captureInterval'] as int,
    captureIntervalUnits: _$enumDecodeNullable(
        _$FrameCaptureIntervalUnitEnumMap, json['captureIntervalUnits']),
  );
}

Map<String, dynamic> _$FrameCaptureSettingsToJson(
    FrameCaptureSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('captureInterval', instance.captureInterval);
  writeNotNull('captureIntervalUnits',
      _$FrameCaptureIntervalUnitEnumMap[instance.captureIntervalUnits]);
  return val;
}

const _$FrameCaptureIntervalUnitEnumMap = {
  FrameCaptureIntervalUnit.milliseconds: 'MILLISECONDS',
  FrameCaptureIntervalUnit.seconds: 'SECONDS',
};

GlobalConfiguration _$GlobalConfigurationFromJson(Map<String, dynamic> json) {
  return GlobalConfiguration(
    initialAudioGain: json['initialAudioGain'] as int,
    inputEndAction: _$enumDecodeNullable(
        _$GlobalConfigurationInputEndActionEnumMap, json['inputEndAction']),
    inputLossBehavior: json['inputLossBehavior'] == null
        ? null
        : InputLossBehavior.fromJson(
            json['inputLossBehavior'] as Map<String, dynamic>),
    outputLockingMode: _$enumDecodeNullable(
        _$GlobalConfigurationOutputLockingModeEnumMap,
        json['outputLockingMode']),
    outputTimingSource: _$enumDecodeNullable(
        _$GlobalConfigurationOutputTimingSourceEnumMap,
        json['outputTimingSource']),
    supportLowFramerateInputs: _$enumDecodeNullable(
        _$GlobalConfigurationLowFramerateInputsEnumMap,
        json['supportLowFramerateInputs']),
  );
}

Map<String, dynamic> _$GlobalConfigurationToJson(GlobalConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('initialAudioGain', instance.initialAudioGain);
  writeNotNull('inputEndAction',
      _$GlobalConfigurationInputEndActionEnumMap[instance.inputEndAction]);
  writeNotNull('inputLossBehavior', instance.inputLossBehavior?.toJson());
  writeNotNull(
      'outputLockingMode',
      _$GlobalConfigurationOutputLockingModeEnumMap[
          instance.outputLockingMode]);
  writeNotNull(
      'outputTimingSource',
      _$GlobalConfigurationOutputTimingSourceEnumMap[
          instance.outputTimingSource]);
  writeNotNull(
      'supportLowFramerateInputs',
      _$GlobalConfigurationLowFramerateInputsEnumMap[
          instance.supportLowFramerateInputs]);
  return val;
}

const _$GlobalConfigurationInputEndActionEnumMap = {
  GlobalConfigurationInputEndAction.none: 'NONE',
  GlobalConfigurationInputEndAction.switchAndLoopInputs:
      'SWITCH_AND_LOOP_INPUTS',
};

const _$GlobalConfigurationOutputLockingModeEnumMap = {
  GlobalConfigurationOutputLockingMode.epochLocking: 'EPOCH_LOCKING',
  GlobalConfigurationOutputLockingMode.pipelineLocking: 'PIPELINE_LOCKING',
};

const _$GlobalConfigurationOutputTimingSourceEnumMap = {
  GlobalConfigurationOutputTimingSource.inputClock: 'INPUT_CLOCK',
  GlobalConfigurationOutputTimingSource.systemClock: 'SYSTEM_CLOCK',
};

const _$GlobalConfigurationLowFramerateInputsEnumMap = {
  GlobalConfigurationLowFramerateInputs.disabled: 'DISABLED',
  GlobalConfigurationLowFramerateInputs.enabled: 'ENABLED',
};

H264ColorSpaceSettings _$H264ColorSpaceSettingsFromJson(
    Map<String, dynamic> json) {
  return H264ColorSpaceSettings(
    colorSpacePassthroughSettings: json['colorSpacePassthroughSettings'] == null
        ? null
        : ColorSpacePassthroughSettings.fromJson(
            json['colorSpacePassthroughSettings'] as Map<String, dynamic>),
    rec601Settings: json['rec601Settings'] == null
        ? null
        : Rec601Settings.fromJson(
            json['rec601Settings'] as Map<String, dynamic>),
    rec709Settings: json['rec709Settings'] == null
        ? null
        : Rec709Settings.fromJson(
            json['rec709Settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$H264ColorSpaceSettingsToJson(
    H264ColorSpaceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('colorSpacePassthroughSettings',
      instance.colorSpacePassthroughSettings?.toJson());
  writeNotNull('rec601Settings', instance.rec601Settings?.toJson());
  writeNotNull('rec709Settings', instance.rec709Settings?.toJson());
  return val;
}

H264FilterSettings _$H264FilterSettingsFromJson(Map<String, dynamic> json) {
  return H264FilterSettings(
    temporalFilterSettings: json['temporalFilterSettings'] == null
        ? null
        : TemporalFilterSettings.fromJson(
            json['temporalFilterSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$H264FilterSettingsToJson(H264FilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'temporalFilterSettings', instance.temporalFilterSettings?.toJson());
  return val;
}

H264Settings _$H264SettingsFromJson(Map<String, dynamic> json) {
  return H264Settings(
    adaptiveQuantization: _$enumDecodeNullable(
        _$H264AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    afdSignaling:
        _$enumDecodeNullable(_$AfdSignalingEnumMap, json['afdSignaling']),
    bitrate: json['bitrate'] as int,
    bufFillPct: json['bufFillPct'] as int,
    bufSize: json['bufSize'] as int,
    colorMetadata:
        _$enumDecodeNullable(_$H264ColorMetadataEnumMap, json['colorMetadata']),
    colorSpaceSettings: json['colorSpaceSettings'] == null
        ? null
        : H264ColorSpaceSettings.fromJson(
            json['colorSpaceSettings'] as Map<String, dynamic>),
    entropyEncoding: _$enumDecodeNullable(
        _$H264EntropyEncodingEnumMap, json['entropyEncoding']),
    filterSettings: json['filterSettings'] == null
        ? null
        : H264FilterSettings.fromJson(
            json['filterSettings'] as Map<String, dynamic>),
    fixedAfd: _$enumDecodeNullable(_$FixedAfdEnumMap, json['fixedAfd']),
    flickerAq: _$enumDecodeNullable(_$H264FlickerAqEnumMap, json['flickerAq']),
    forceFieldPictures: _$enumDecodeNullable(
        _$H264ForceFieldPicturesEnumMap, json['forceFieldPictures']),
    framerateControl: _$enumDecodeNullable(
        _$H264FramerateControlEnumMap, json['framerateControl']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopBReference:
        _$enumDecodeNullable(_$H264GopBReferenceEnumMap, json['gopBReference']),
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopNumBFrames: json['gopNumBFrames'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$H264GopSizeUnitsEnumMap, json['gopSizeUnits']),
    level: _$enumDecodeNullable(_$H264LevelEnumMap, json['level']),
    lookAheadRateControl: _$enumDecodeNullable(
        _$H264LookAheadRateControlEnumMap, json['lookAheadRateControl']),
    maxBitrate: json['maxBitrate'] as int,
    minIInterval: json['minIInterval'] as int,
    numRefFrames: json['numRefFrames'] as int,
    parControl:
        _$enumDecodeNullable(_$H264ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    profile: _$enumDecodeNullable(_$H264ProfileEnumMap, json['profile']),
    qualityLevel:
        _$enumDecodeNullable(_$H264QualityLevelEnumMap, json['qualityLevel']),
    qvbrQualityLevel: json['qvbrQualityLevel'] as int,
    rateControlMode: _$enumDecodeNullable(
        _$H264RateControlModeEnumMap, json['rateControlMode']),
    scanType: _$enumDecodeNullable(_$H264ScanTypeEnumMap, json['scanType']),
    sceneChangeDetect: _$enumDecodeNullable(
        _$H264SceneChangeDetectEnumMap, json['sceneChangeDetect']),
    slices: json['slices'] as int,
    softness: json['softness'] as int,
    spatialAq: _$enumDecodeNullable(_$H264SpatialAqEnumMap, json['spatialAq']),
    subgopLength:
        _$enumDecodeNullable(_$H264SubGopLengthEnumMap, json['subgopLength']),
    syntax: _$enumDecodeNullable(_$H264SyntaxEnumMap, json['syntax']),
    temporalAq:
        _$enumDecodeNullable(_$H264TemporalAqEnumMap, json['temporalAq']),
    timecodeInsertion: _$enumDecodeNullable(
        _$H264TimecodeInsertionBehaviorEnumMap, json['timecodeInsertion']),
  );
}

Map<String, dynamic> _$H264SettingsToJson(H264Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adaptiveQuantization',
      _$H264AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull('afdSignaling', _$AfdSignalingEnumMap[instance.afdSignaling]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('bufFillPct', instance.bufFillPct);
  writeNotNull('bufSize', instance.bufSize);
  writeNotNull(
      'colorMetadata', _$H264ColorMetadataEnumMap[instance.colorMetadata]);
  writeNotNull('colorSpaceSettings', instance.colorSpaceSettings?.toJson());
  writeNotNull('entropyEncoding',
      _$H264EntropyEncodingEnumMap[instance.entropyEncoding]);
  writeNotNull('filterSettings', instance.filterSettings?.toJson());
  writeNotNull('fixedAfd', _$FixedAfdEnumMap[instance.fixedAfd]);
  writeNotNull('flickerAq', _$H264FlickerAqEnumMap[instance.flickerAq]);
  writeNotNull('forceFieldPictures',
      _$H264ForceFieldPicturesEnumMap[instance.forceFieldPictures]);
  writeNotNull('framerateControl',
      _$H264FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'gopBReference', _$H264GopBReferenceEnumMap[instance.gopBReference]);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopNumBFrames', instance.gopNumBFrames);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$H264GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('level', _$H264LevelEnumMap[instance.level]);
  writeNotNull('lookAheadRateControl',
      _$H264LookAheadRateControlEnumMap[instance.lookAheadRateControl]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('minIInterval', instance.minIInterval);
  writeNotNull('numRefFrames', instance.numRefFrames);
  writeNotNull('parControl', _$H264ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('profile', _$H264ProfileEnumMap[instance.profile]);
  writeNotNull(
      'qualityLevel', _$H264QualityLevelEnumMap[instance.qualityLevel]);
  writeNotNull('qvbrQualityLevel', instance.qvbrQualityLevel);
  writeNotNull('rateControlMode',
      _$H264RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('scanType', _$H264ScanTypeEnumMap[instance.scanType]);
  writeNotNull('sceneChangeDetect',
      _$H264SceneChangeDetectEnumMap[instance.sceneChangeDetect]);
  writeNotNull('slices', instance.slices);
  writeNotNull('softness', instance.softness);
  writeNotNull('spatialAq', _$H264SpatialAqEnumMap[instance.spatialAq]);
  writeNotNull(
      'subgopLength', _$H264SubGopLengthEnumMap[instance.subgopLength]);
  writeNotNull('syntax', _$H264SyntaxEnumMap[instance.syntax]);
  writeNotNull('temporalAq', _$H264TemporalAqEnumMap[instance.temporalAq]);
  writeNotNull('timecodeInsertion',
      _$H264TimecodeInsertionBehaviorEnumMap[instance.timecodeInsertion]);
  return val;
}

const _$H264AdaptiveQuantizationEnumMap = {
  H264AdaptiveQuantization.high: 'HIGH',
  H264AdaptiveQuantization.higher: 'HIGHER',
  H264AdaptiveQuantization.low: 'LOW',
  H264AdaptiveQuantization.max: 'MAX',
  H264AdaptiveQuantization.medium: 'MEDIUM',
  H264AdaptiveQuantization.off: 'OFF',
};

const _$AfdSignalingEnumMap = {
  AfdSignaling.auto: 'AUTO',
  AfdSignaling.fixed: 'FIXED',
  AfdSignaling.none: 'NONE',
};

const _$H264ColorMetadataEnumMap = {
  H264ColorMetadata.ignore: 'IGNORE',
  H264ColorMetadata.insert: 'INSERT',
};

const _$H264EntropyEncodingEnumMap = {
  H264EntropyEncoding.cabac: 'CABAC',
  H264EntropyEncoding.cavlc: 'CAVLC',
};

const _$FixedAfdEnumMap = {
  FixedAfd.afd_0000: 'AFD_0000',
  FixedAfd.afd_0010: 'AFD_0010',
  FixedAfd.afd_0011: 'AFD_0011',
  FixedAfd.afd_0100: 'AFD_0100',
  FixedAfd.afd_1000: 'AFD_1000',
  FixedAfd.afd_1001: 'AFD_1001',
  FixedAfd.afd_1010: 'AFD_1010',
  FixedAfd.afd_1011: 'AFD_1011',
  FixedAfd.afd_1101: 'AFD_1101',
  FixedAfd.afd_1110: 'AFD_1110',
  FixedAfd.afd_1111: 'AFD_1111',
};

const _$H264FlickerAqEnumMap = {
  H264FlickerAq.disabled: 'DISABLED',
  H264FlickerAq.enabled: 'ENABLED',
};

const _$H264ForceFieldPicturesEnumMap = {
  H264ForceFieldPictures.disabled: 'DISABLED',
  H264ForceFieldPictures.enabled: 'ENABLED',
};

const _$H264FramerateControlEnumMap = {
  H264FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H264FramerateControl.specified: 'SPECIFIED',
};

const _$H264GopBReferenceEnumMap = {
  H264GopBReference.disabled: 'DISABLED',
  H264GopBReference.enabled: 'ENABLED',
};

const _$H264GopSizeUnitsEnumMap = {
  H264GopSizeUnits.frames: 'FRAMES',
  H264GopSizeUnits.seconds: 'SECONDS',
};

const _$H264LevelEnumMap = {
  H264Level.h264Level_1: 'H264_LEVEL_1',
  H264Level.h264Level_1_1: 'H264_LEVEL_1_1',
  H264Level.h264Level_1_2: 'H264_LEVEL_1_2',
  H264Level.h264Level_1_3: 'H264_LEVEL_1_3',
  H264Level.h264Level_2: 'H264_LEVEL_2',
  H264Level.h264Level_2_1: 'H264_LEVEL_2_1',
  H264Level.h264Level_2_2: 'H264_LEVEL_2_2',
  H264Level.h264Level_3: 'H264_LEVEL_3',
  H264Level.h264Level_3_1: 'H264_LEVEL_3_1',
  H264Level.h264Level_3_2: 'H264_LEVEL_3_2',
  H264Level.h264Level_4: 'H264_LEVEL_4',
  H264Level.h264Level_4_1: 'H264_LEVEL_4_1',
  H264Level.h264Level_4_2: 'H264_LEVEL_4_2',
  H264Level.h264Level_5: 'H264_LEVEL_5',
  H264Level.h264Level_5_1: 'H264_LEVEL_5_1',
  H264Level.h264Level_5_2: 'H264_LEVEL_5_2',
  H264Level.h264LevelAuto: 'H264_LEVEL_AUTO',
};

const _$H264LookAheadRateControlEnumMap = {
  H264LookAheadRateControl.high: 'HIGH',
  H264LookAheadRateControl.low: 'LOW',
  H264LookAheadRateControl.medium: 'MEDIUM',
};

const _$H264ParControlEnumMap = {
  H264ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H264ParControl.specified: 'SPECIFIED',
};

const _$H264ProfileEnumMap = {
  H264Profile.baseline: 'BASELINE',
  H264Profile.high: 'HIGH',
  H264Profile.high_10bit: 'HIGH_10BIT',
  H264Profile.high_422: 'HIGH_422',
  H264Profile.high_422_10bit: 'HIGH_422_10BIT',
  H264Profile.main: 'MAIN',
};

const _$H264QualityLevelEnumMap = {
  H264QualityLevel.enhancedQuality: 'ENHANCED_QUALITY',
  H264QualityLevel.standardQuality: 'STANDARD_QUALITY',
};

const _$H264RateControlModeEnumMap = {
  H264RateControlMode.cbr: 'CBR',
  H264RateControlMode.multiplex: 'MULTIPLEX',
  H264RateControlMode.qvbr: 'QVBR',
  H264RateControlMode.vbr: 'VBR',
};

const _$H264ScanTypeEnumMap = {
  H264ScanType.interlaced: 'INTERLACED',
  H264ScanType.progressive: 'PROGRESSIVE',
};

const _$H264SceneChangeDetectEnumMap = {
  H264SceneChangeDetect.disabled: 'DISABLED',
  H264SceneChangeDetect.enabled: 'ENABLED',
};

const _$H264SpatialAqEnumMap = {
  H264SpatialAq.disabled: 'DISABLED',
  H264SpatialAq.enabled: 'ENABLED',
};

const _$H264SubGopLengthEnumMap = {
  H264SubGopLength.dynamic: 'DYNAMIC',
  H264SubGopLength.fixed: 'FIXED',
};

const _$H264SyntaxEnumMap = {
  H264Syntax.$default: 'DEFAULT',
  H264Syntax.rp2027: 'RP2027',
};

const _$H264TemporalAqEnumMap = {
  H264TemporalAq.disabled: 'DISABLED',
  H264TemporalAq.enabled: 'ENABLED',
};

const _$H264TimecodeInsertionBehaviorEnumMap = {
  H264TimecodeInsertionBehavior.disabled: 'DISABLED',
  H264TimecodeInsertionBehavior.picTimingSei: 'PIC_TIMING_SEI',
};

H265ColorSpaceSettings _$H265ColorSpaceSettingsFromJson(
    Map<String, dynamic> json) {
  return H265ColorSpaceSettings(
    colorSpacePassthroughSettings: json['colorSpacePassthroughSettings'] == null
        ? null
        : ColorSpacePassthroughSettings.fromJson(
            json['colorSpacePassthroughSettings'] as Map<String, dynamic>),
    hdr10Settings: json['hdr10Settings'] == null
        ? null
        : Hdr10Settings.fromJson(json['hdr10Settings'] as Map<String, dynamic>),
    rec601Settings: json['rec601Settings'] == null
        ? null
        : Rec601Settings.fromJson(
            json['rec601Settings'] as Map<String, dynamic>),
    rec709Settings: json['rec709Settings'] == null
        ? null
        : Rec709Settings.fromJson(
            json['rec709Settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$H265ColorSpaceSettingsToJson(
    H265ColorSpaceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('colorSpacePassthroughSettings',
      instance.colorSpacePassthroughSettings?.toJson());
  writeNotNull('hdr10Settings', instance.hdr10Settings?.toJson());
  writeNotNull('rec601Settings', instance.rec601Settings?.toJson());
  writeNotNull('rec709Settings', instance.rec709Settings?.toJson());
  return val;
}

H265FilterSettings _$H265FilterSettingsFromJson(Map<String, dynamic> json) {
  return H265FilterSettings(
    temporalFilterSettings: json['temporalFilterSettings'] == null
        ? null
        : TemporalFilterSettings.fromJson(
            json['temporalFilterSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$H265FilterSettingsToJson(H265FilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'temporalFilterSettings', instance.temporalFilterSettings?.toJson());
  return val;
}

H265Settings _$H265SettingsFromJson(Map<String, dynamic> json) {
  return H265Settings(
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    adaptiveQuantization: _$enumDecodeNullable(
        _$H265AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    afdSignaling:
        _$enumDecodeNullable(_$AfdSignalingEnumMap, json['afdSignaling']),
    alternativeTransferFunction: _$enumDecodeNullable(
        _$H265AlternativeTransferFunctionEnumMap,
        json['alternativeTransferFunction']),
    bitrate: json['bitrate'] as int,
    bufSize: json['bufSize'] as int,
    colorMetadata:
        _$enumDecodeNullable(_$H265ColorMetadataEnumMap, json['colorMetadata']),
    colorSpaceSettings: json['colorSpaceSettings'] == null
        ? null
        : H265ColorSpaceSettings.fromJson(
            json['colorSpaceSettings'] as Map<String, dynamic>),
    filterSettings: json['filterSettings'] == null
        ? null
        : H265FilterSettings.fromJson(
            json['filterSettings'] as Map<String, dynamic>),
    fixedAfd: _$enumDecodeNullable(_$FixedAfdEnumMap, json['fixedAfd']),
    flickerAq: _$enumDecodeNullable(_$H265FlickerAqEnumMap, json['flickerAq']),
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$H265GopSizeUnitsEnumMap, json['gopSizeUnits']),
    level: _$enumDecodeNullable(_$H265LevelEnumMap, json['level']),
    lookAheadRateControl: _$enumDecodeNullable(
        _$H265LookAheadRateControlEnumMap, json['lookAheadRateControl']),
    maxBitrate: json['maxBitrate'] as int,
    minIInterval: json['minIInterval'] as int,
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    profile: _$enumDecodeNullable(_$H265ProfileEnumMap, json['profile']),
    qvbrQualityLevel: json['qvbrQualityLevel'] as int,
    rateControlMode: _$enumDecodeNullable(
        _$H265RateControlModeEnumMap, json['rateControlMode']),
    scanType: _$enumDecodeNullable(_$H265ScanTypeEnumMap, json['scanType']),
    sceneChangeDetect: _$enumDecodeNullable(
        _$H265SceneChangeDetectEnumMap, json['sceneChangeDetect']),
    slices: json['slices'] as int,
    tier: _$enumDecodeNullable(_$H265TierEnumMap, json['tier']),
    timecodeInsertion: _$enumDecodeNullable(
        _$H265TimecodeInsertionBehaviorEnumMap, json['timecodeInsertion']),
  );
}

Map<String, dynamic> _$H265SettingsToJson(H265Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('adaptiveQuantization',
      _$H265AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull('afdSignaling', _$AfdSignalingEnumMap[instance.afdSignaling]);
  writeNotNull(
      'alternativeTransferFunction',
      _$H265AlternativeTransferFunctionEnumMap[
          instance.alternativeTransferFunction]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('bufSize', instance.bufSize);
  writeNotNull(
      'colorMetadata', _$H265ColorMetadataEnumMap[instance.colorMetadata]);
  writeNotNull('colorSpaceSettings', instance.colorSpaceSettings?.toJson());
  writeNotNull('filterSettings', instance.filterSettings?.toJson());
  writeNotNull('fixedAfd', _$FixedAfdEnumMap[instance.fixedAfd]);
  writeNotNull('flickerAq', _$H265FlickerAqEnumMap[instance.flickerAq]);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$H265GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('level', _$H265LevelEnumMap[instance.level]);
  writeNotNull('lookAheadRateControl',
      _$H265LookAheadRateControlEnumMap[instance.lookAheadRateControl]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('minIInterval', instance.minIInterval);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('profile', _$H265ProfileEnumMap[instance.profile]);
  writeNotNull('qvbrQualityLevel', instance.qvbrQualityLevel);
  writeNotNull('rateControlMode',
      _$H265RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('scanType', _$H265ScanTypeEnumMap[instance.scanType]);
  writeNotNull('sceneChangeDetect',
      _$H265SceneChangeDetectEnumMap[instance.sceneChangeDetect]);
  writeNotNull('slices', instance.slices);
  writeNotNull('tier', _$H265TierEnumMap[instance.tier]);
  writeNotNull('timecodeInsertion',
      _$H265TimecodeInsertionBehaviorEnumMap[instance.timecodeInsertion]);
  return val;
}

const _$H265AdaptiveQuantizationEnumMap = {
  H265AdaptiveQuantization.high: 'HIGH',
  H265AdaptiveQuantization.higher: 'HIGHER',
  H265AdaptiveQuantization.low: 'LOW',
  H265AdaptiveQuantization.max: 'MAX',
  H265AdaptiveQuantization.medium: 'MEDIUM',
  H265AdaptiveQuantization.off: 'OFF',
};

const _$H265AlternativeTransferFunctionEnumMap = {
  H265AlternativeTransferFunction.insert: 'INSERT',
  H265AlternativeTransferFunction.omit: 'OMIT',
};

const _$H265ColorMetadataEnumMap = {
  H265ColorMetadata.ignore: 'IGNORE',
  H265ColorMetadata.insert: 'INSERT',
};

const _$H265FlickerAqEnumMap = {
  H265FlickerAq.disabled: 'DISABLED',
  H265FlickerAq.enabled: 'ENABLED',
};

const _$H265GopSizeUnitsEnumMap = {
  H265GopSizeUnits.frames: 'FRAMES',
  H265GopSizeUnits.seconds: 'SECONDS',
};

const _$H265LevelEnumMap = {
  H265Level.h265Level_1: 'H265_LEVEL_1',
  H265Level.h265Level_2: 'H265_LEVEL_2',
  H265Level.h265Level_2_1: 'H265_LEVEL_2_1',
  H265Level.h265Level_3: 'H265_LEVEL_3',
  H265Level.h265Level_3_1: 'H265_LEVEL_3_1',
  H265Level.h265Level_4: 'H265_LEVEL_4',
  H265Level.h265Level_4_1: 'H265_LEVEL_4_1',
  H265Level.h265Level_5: 'H265_LEVEL_5',
  H265Level.h265Level_5_1: 'H265_LEVEL_5_1',
  H265Level.h265Level_5_2: 'H265_LEVEL_5_2',
  H265Level.h265Level_6: 'H265_LEVEL_6',
  H265Level.h265Level_6_1: 'H265_LEVEL_6_1',
  H265Level.h265Level_6_2: 'H265_LEVEL_6_2',
  H265Level.h265LevelAuto: 'H265_LEVEL_AUTO',
};

const _$H265LookAheadRateControlEnumMap = {
  H265LookAheadRateControl.high: 'HIGH',
  H265LookAheadRateControl.low: 'LOW',
  H265LookAheadRateControl.medium: 'MEDIUM',
};

const _$H265ProfileEnumMap = {
  H265Profile.main: 'MAIN',
  H265Profile.main_10bit: 'MAIN_10BIT',
};

const _$H265RateControlModeEnumMap = {
  H265RateControlMode.cbr: 'CBR',
  H265RateControlMode.multiplex: 'MULTIPLEX',
  H265RateControlMode.qvbr: 'QVBR',
};

const _$H265ScanTypeEnumMap = {
  H265ScanType.interlaced: 'INTERLACED',
  H265ScanType.progressive: 'PROGRESSIVE',
};

const _$H265SceneChangeDetectEnumMap = {
  H265SceneChangeDetect.disabled: 'DISABLED',
  H265SceneChangeDetect.enabled: 'ENABLED',
};

const _$H265TierEnumMap = {
  H265Tier.high: 'HIGH',
  H265Tier.main: 'MAIN',
};

const _$H265TimecodeInsertionBehaviorEnumMap = {
  H265TimecodeInsertionBehavior.disabled: 'DISABLED',
  H265TimecodeInsertionBehavior.picTimingSei: 'PIC_TIMING_SEI',
};

Hdr10Settings _$Hdr10SettingsFromJson(Map<String, dynamic> json) {
  return Hdr10Settings(
    maxCll: json['maxCll'] as int,
    maxFall: json['maxFall'] as int,
  );
}

Map<String, dynamic> _$Hdr10SettingsToJson(Hdr10Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxCll', instance.maxCll);
  writeNotNull('maxFall', instance.maxFall);
  return val;
}

HlsAkamaiSettings _$HlsAkamaiSettingsFromJson(Map<String, dynamic> json) {
  return HlsAkamaiSettings(
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    filecacheDuration: json['filecacheDuration'] as int,
    httpTransferMode: _$enumDecodeNullable(
        _$HlsAkamaiHttpTransferModeEnumMap, json['httpTransferMode']),
    numRetries: json['numRetries'] as int,
    restartDelay: json['restartDelay'] as int,
    salt: json['salt'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$HlsAkamaiSettingsToJson(HlsAkamaiSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('filecacheDuration', instance.filecacheDuration);
  writeNotNull('httpTransferMode',
      _$HlsAkamaiHttpTransferModeEnumMap[instance.httpTransferMode]);
  writeNotNull('numRetries', instance.numRetries);
  writeNotNull('restartDelay', instance.restartDelay);
  writeNotNull('salt', instance.salt);
  writeNotNull('token', instance.token);
  return val;
}

const _$HlsAkamaiHttpTransferModeEnumMap = {
  HlsAkamaiHttpTransferMode.chunked: 'CHUNKED',
  HlsAkamaiHttpTransferMode.nonChunked: 'NON_CHUNKED',
};

HlsBasicPutSettings _$HlsBasicPutSettingsFromJson(Map<String, dynamic> json) {
  return HlsBasicPutSettings(
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    filecacheDuration: json['filecacheDuration'] as int,
    numRetries: json['numRetries'] as int,
    restartDelay: json['restartDelay'] as int,
  );
}

Map<String, dynamic> _$HlsBasicPutSettingsToJson(HlsBasicPutSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('filecacheDuration', instance.filecacheDuration);
  writeNotNull('numRetries', instance.numRetries);
  writeNotNull('restartDelay', instance.restartDelay);
  return val;
}

HlsCdnSettings _$HlsCdnSettingsFromJson(Map<String, dynamic> json) {
  return HlsCdnSettings(
    hlsAkamaiSettings: json['hlsAkamaiSettings'] == null
        ? null
        : HlsAkamaiSettings.fromJson(
            json['hlsAkamaiSettings'] as Map<String, dynamic>),
    hlsBasicPutSettings: json['hlsBasicPutSettings'] == null
        ? null
        : HlsBasicPutSettings.fromJson(
            json['hlsBasicPutSettings'] as Map<String, dynamic>),
    hlsMediaStoreSettings: json['hlsMediaStoreSettings'] == null
        ? null
        : HlsMediaStoreSettings.fromJson(
            json['hlsMediaStoreSettings'] as Map<String, dynamic>),
    hlsWebdavSettings: json['hlsWebdavSettings'] == null
        ? null
        : HlsWebdavSettings.fromJson(
            json['hlsWebdavSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HlsCdnSettingsToJson(HlsCdnSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hlsAkamaiSettings', instance.hlsAkamaiSettings?.toJson());
  writeNotNull('hlsBasicPutSettings', instance.hlsBasicPutSettings?.toJson());
  writeNotNull(
      'hlsMediaStoreSettings', instance.hlsMediaStoreSettings?.toJson());
  writeNotNull('hlsWebdavSettings', instance.hlsWebdavSettings?.toJson());
  return val;
}

HlsGroupSettings _$HlsGroupSettingsFromJson(Map<String, dynamic> json) {
  return HlsGroupSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
    adMarkers: (json['adMarkers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$HlsAdMarkersEnumMap, e))
        ?.toList(),
    baseUrlContent: json['baseUrlContent'] as String,
    baseUrlContent1: json['baseUrlContent1'] as String,
    baseUrlManifest: json['baseUrlManifest'] as String,
    baseUrlManifest1: json['baseUrlManifest1'] as String,
    captionLanguageMappings: (json['captionLanguageMappings'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionLanguageMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionLanguageSetting: _$enumDecodeNullable(
        _$HlsCaptionLanguageSettingEnumMap, json['captionLanguageSetting']),
    clientCache:
        _$enumDecodeNullable(_$HlsClientCacheEnumMap, json['clientCache']),
    codecSpecification: _$enumDecodeNullable(
        _$HlsCodecSpecificationEnumMap, json['codecSpecification']),
    constantIv: json['constantIv'] as String,
    directoryStructure: _$enumDecodeNullable(
        _$HlsDirectoryStructureEnumMap, json['directoryStructure']),
    discontinuityTags: _$enumDecodeNullable(
        _$HlsDiscontinuityTagsEnumMap, json['discontinuityTags']),
    encryptionType: _$enumDecodeNullable(
        _$HlsEncryptionTypeEnumMap, json['encryptionType']),
    hlsCdnSettings: json['hlsCdnSettings'] == null
        ? null
        : HlsCdnSettings.fromJson(
            json['hlsCdnSettings'] as Map<String, dynamic>),
    hlsId3SegmentTagging: _$enumDecodeNullable(
        _$HlsId3SegmentTaggingStateEnumMap, json['hlsId3SegmentTagging']),
    iFrameOnlyPlaylists: _$enumDecodeNullable(
        _$IFrameOnlyPlaylistTypeEnumMap, json['iFrameOnlyPlaylists']),
    incompleteSegmentBehavior: _$enumDecodeNullable(
        _$HlsIncompleteSegmentBehaviorEnumMap,
        json['incompleteSegmentBehavior']),
    indexNSegments: json['indexNSegments'] as int,
    inputLossAction: _$enumDecodeNullable(
        _$InputLossActionForHlsOutEnumMap, json['inputLossAction']),
    ivInManifest:
        _$enumDecodeNullable(_$HlsIvInManifestEnumMap, json['ivInManifest']),
    ivSource: _$enumDecodeNullable(_$HlsIvSourceEnumMap, json['ivSource']),
    keepSegments: json['keepSegments'] as int,
    keyFormat: json['keyFormat'] as String,
    keyFormatVersions: json['keyFormatVersions'] as String,
    keyProviderSettings: json['keyProviderSettings'] == null
        ? null
        : KeyProviderSettings.fromJson(
            json['keyProviderSettings'] as Map<String, dynamic>),
    manifestCompression: _$enumDecodeNullable(
        _$HlsManifestCompressionEnumMap, json['manifestCompression']),
    manifestDurationFormat: _$enumDecodeNullable(
        _$HlsManifestDurationFormatEnumMap, json['manifestDurationFormat']),
    minSegmentLength: json['minSegmentLength'] as int,
    mode: _$enumDecodeNullable(_$HlsModeEnumMap, json['mode']),
    outputSelection: _$enumDecodeNullable(
        _$HlsOutputSelectionEnumMap, json['outputSelection']),
    programDateTime: _$enumDecodeNullable(
        _$HlsProgramDateTimeEnumMap, json['programDateTime']),
    programDateTimePeriod: json['programDateTimePeriod'] as int,
    redundantManifest: _$enumDecodeNullable(
        _$HlsRedundantManifestEnumMap, json['redundantManifest']),
    segmentLength: json['segmentLength'] as int,
    segmentationMode: _$enumDecodeNullable(
        _$HlsSegmentationModeEnumMap, json['segmentationMode']),
    segmentsPerSubdirectory: json['segmentsPerSubdirectory'] as int,
    streamInfResolution: _$enumDecodeNullable(
        _$HlsStreamInfResolutionEnumMap, json['streamInfResolution']),
    timedMetadataId3Frame: _$enumDecodeNullable(
        _$HlsTimedMetadataId3FrameEnumMap, json['timedMetadataId3Frame']),
    timedMetadataId3Period: json['timedMetadataId3Period'] as int,
    timestampDeltaMilliseconds: json['timestampDeltaMilliseconds'] as int,
    tsFileMode:
        _$enumDecodeNullable(_$HlsTsFileModeEnumMap, json['tsFileMode']),
  );
}

Map<String, dynamic> _$HlsGroupSettingsToJson(HlsGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('adMarkers',
      instance.adMarkers?.map((e) => _$HlsAdMarkersEnumMap[e])?.toList());
  writeNotNull('baseUrlContent', instance.baseUrlContent);
  writeNotNull('baseUrlContent1', instance.baseUrlContent1);
  writeNotNull('baseUrlManifest', instance.baseUrlManifest);
  writeNotNull('baseUrlManifest1', instance.baseUrlManifest1);
  writeNotNull('captionLanguageMappings',
      instance.captionLanguageMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('captionLanguageSetting',
      _$HlsCaptionLanguageSettingEnumMap[instance.captionLanguageSetting]);
  writeNotNull('clientCache', _$HlsClientCacheEnumMap[instance.clientCache]);
  writeNotNull('codecSpecification',
      _$HlsCodecSpecificationEnumMap[instance.codecSpecification]);
  writeNotNull('constantIv', instance.constantIv);
  writeNotNull('directoryStructure',
      _$HlsDirectoryStructureEnumMap[instance.directoryStructure]);
  writeNotNull('discontinuityTags',
      _$HlsDiscontinuityTagsEnumMap[instance.discontinuityTags]);
  writeNotNull(
      'encryptionType', _$HlsEncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('hlsCdnSettings', instance.hlsCdnSettings?.toJson());
  writeNotNull('hlsId3SegmentTagging',
      _$HlsId3SegmentTaggingStateEnumMap[instance.hlsId3SegmentTagging]);
  writeNotNull('iFrameOnlyPlaylists',
      _$IFrameOnlyPlaylistTypeEnumMap[instance.iFrameOnlyPlaylists]);
  writeNotNull(
      'incompleteSegmentBehavior',
      _$HlsIncompleteSegmentBehaviorEnumMap[
          instance.incompleteSegmentBehavior]);
  writeNotNull('indexNSegments', instance.indexNSegments);
  writeNotNull('inputLossAction',
      _$InputLossActionForHlsOutEnumMap[instance.inputLossAction]);
  writeNotNull('ivInManifest', _$HlsIvInManifestEnumMap[instance.ivInManifest]);
  writeNotNull('ivSource', _$HlsIvSourceEnumMap[instance.ivSource]);
  writeNotNull('keepSegments', instance.keepSegments);
  writeNotNull('keyFormat', instance.keyFormat);
  writeNotNull('keyFormatVersions', instance.keyFormatVersions);
  writeNotNull('keyProviderSettings', instance.keyProviderSettings?.toJson());
  writeNotNull('manifestCompression',
      _$HlsManifestCompressionEnumMap[instance.manifestCompression]);
  writeNotNull('manifestDurationFormat',
      _$HlsManifestDurationFormatEnumMap[instance.manifestDurationFormat]);
  writeNotNull('minSegmentLength', instance.minSegmentLength);
  writeNotNull('mode', _$HlsModeEnumMap[instance.mode]);
  writeNotNull(
      'outputSelection', _$HlsOutputSelectionEnumMap[instance.outputSelection]);
  writeNotNull(
      'programDateTime', _$HlsProgramDateTimeEnumMap[instance.programDateTime]);
  writeNotNull('programDateTimePeriod', instance.programDateTimePeriod);
  writeNotNull('redundantManifest',
      _$HlsRedundantManifestEnumMap[instance.redundantManifest]);
  writeNotNull('segmentLength', instance.segmentLength);
  writeNotNull('segmentationMode',
      _$HlsSegmentationModeEnumMap[instance.segmentationMode]);
  writeNotNull('segmentsPerSubdirectory', instance.segmentsPerSubdirectory);
  writeNotNull('streamInfResolution',
      _$HlsStreamInfResolutionEnumMap[instance.streamInfResolution]);
  writeNotNull('timedMetadataId3Frame',
      _$HlsTimedMetadataId3FrameEnumMap[instance.timedMetadataId3Frame]);
  writeNotNull('timedMetadataId3Period', instance.timedMetadataId3Period);
  writeNotNull(
      'timestampDeltaMilliseconds', instance.timestampDeltaMilliseconds);
  writeNotNull('tsFileMode', _$HlsTsFileModeEnumMap[instance.tsFileMode]);
  return val;
}

const _$HlsAdMarkersEnumMap = {
  HlsAdMarkers.adobe: 'ADOBE',
  HlsAdMarkers.elemental: 'ELEMENTAL',
  HlsAdMarkers.elementalScte35: 'ELEMENTAL_SCTE35',
};

const _$HlsCaptionLanguageSettingEnumMap = {
  HlsCaptionLanguageSetting.insert: 'INSERT',
  HlsCaptionLanguageSetting.none: 'NONE',
  HlsCaptionLanguageSetting.omit: 'OMIT',
};

const _$HlsClientCacheEnumMap = {
  HlsClientCache.disabled: 'DISABLED',
  HlsClientCache.enabled: 'ENABLED',
};

const _$HlsCodecSpecificationEnumMap = {
  HlsCodecSpecification.rfc_4281: 'RFC_4281',
  HlsCodecSpecification.rfc_6381: 'RFC_6381',
};

const _$HlsDirectoryStructureEnumMap = {
  HlsDirectoryStructure.singleDirectory: 'SINGLE_DIRECTORY',
  HlsDirectoryStructure.subdirectoryPerStream: 'SUBDIRECTORY_PER_STREAM',
};

const _$HlsDiscontinuityTagsEnumMap = {
  HlsDiscontinuityTags.insert: 'INSERT',
  HlsDiscontinuityTags.neverInsert: 'NEVER_INSERT',
};

const _$HlsEncryptionTypeEnumMap = {
  HlsEncryptionType.aes128: 'AES128',
  HlsEncryptionType.sampleAes: 'SAMPLE_AES',
};

const _$HlsId3SegmentTaggingStateEnumMap = {
  HlsId3SegmentTaggingState.disabled: 'DISABLED',
  HlsId3SegmentTaggingState.enabled: 'ENABLED',
};

const _$IFrameOnlyPlaylistTypeEnumMap = {
  IFrameOnlyPlaylistType.disabled: 'DISABLED',
  IFrameOnlyPlaylistType.standard: 'STANDARD',
};

const _$HlsIncompleteSegmentBehaviorEnumMap = {
  HlsIncompleteSegmentBehavior.auto: 'AUTO',
  HlsIncompleteSegmentBehavior.suppress: 'SUPPRESS',
};

const _$InputLossActionForHlsOutEnumMap = {
  InputLossActionForHlsOut.emitOutput: 'EMIT_OUTPUT',
  InputLossActionForHlsOut.pauseOutput: 'PAUSE_OUTPUT',
};

const _$HlsIvInManifestEnumMap = {
  HlsIvInManifest.exclude: 'EXCLUDE',
  HlsIvInManifest.include: 'INCLUDE',
};

const _$HlsIvSourceEnumMap = {
  HlsIvSource.explicit: 'EXPLICIT',
  HlsIvSource.followsSegmentNumber: 'FOLLOWS_SEGMENT_NUMBER',
};

const _$HlsManifestCompressionEnumMap = {
  HlsManifestCompression.gzip: 'GZIP',
  HlsManifestCompression.none: 'NONE',
};

const _$HlsManifestDurationFormatEnumMap = {
  HlsManifestDurationFormat.floatingPoint: 'FLOATING_POINT',
  HlsManifestDurationFormat.integer: 'INTEGER',
};

const _$HlsModeEnumMap = {
  HlsMode.live: 'LIVE',
  HlsMode.vod: 'VOD',
};

const _$HlsOutputSelectionEnumMap = {
  HlsOutputSelection.manifestsAndSegments: 'MANIFESTS_AND_SEGMENTS',
  HlsOutputSelection.segmentsOnly: 'SEGMENTS_ONLY',
  HlsOutputSelection.variantManifestsAndSegments:
      'VARIANT_MANIFESTS_AND_SEGMENTS',
};

const _$HlsProgramDateTimeEnumMap = {
  HlsProgramDateTime.exclude: 'EXCLUDE',
  HlsProgramDateTime.include: 'INCLUDE',
};

const _$HlsRedundantManifestEnumMap = {
  HlsRedundantManifest.disabled: 'DISABLED',
  HlsRedundantManifest.enabled: 'ENABLED',
};

const _$HlsSegmentationModeEnumMap = {
  HlsSegmentationMode.useInputSegmentation: 'USE_INPUT_SEGMENTATION',
  HlsSegmentationMode.useSegmentDuration: 'USE_SEGMENT_DURATION',
};

const _$HlsStreamInfResolutionEnumMap = {
  HlsStreamInfResolution.exclude: 'EXCLUDE',
  HlsStreamInfResolution.include: 'INCLUDE',
};

const _$HlsTimedMetadataId3FrameEnumMap = {
  HlsTimedMetadataId3Frame.none: 'NONE',
  HlsTimedMetadataId3Frame.priv: 'PRIV',
  HlsTimedMetadataId3Frame.tdrl: 'TDRL',
};

const _$HlsTsFileModeEnumMap = {
  HlsTsFileMode.segmentedFiles: 'SEGMENTED_FILES',
  HlsTsFileMode.singleFile: 'SINGLE_FILE',
};

HlsId3SegmentTaggingScheduleActionSettings
    _$HlsId3SegmentTaggingScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return HlsId3SegmentTaggingScheduleActionSettings(
    tag: json['tag'] as String,
  );
}

Map<String, dynamic> _$HlsId3SegmentTaggingScheduleActionSettingsToJson(
    HlsId3SegmentTaggingScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tag', instance.tag);
  return val;
}

HlsInputSettings _$HlsInputSettingsFromJson(Map<String, dynamic> json) {
  return HlsInputSettings(
    bandwidth: json['bandwidth'] as int,
    bufferSegments: json['bufferSegments'] as int,
    retries: json['retries'] as int,
    retryInterval: json['retryInterval'] as int,
  );
}

Map<String, dynamic> _$HlsInputSettingsToJson(HlsInputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bandwidth', instance.bandwidth);
  writeNotNull('bufferSegments', instance.bufferSegments);
  writeNotNull('retries', instance.retries);
  writeNotNull('retryInterval', instance.retryInterval);
  return val;
}

HlsMediaStoreSettings _$HlsMediaStoreSettingsFromJson(
    Map<String, dynamic> json) {
  return HlsMediaStoreSettings(
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    filecacheDuration: json['filecacheDuration'] as int,
    mediaStoreStorageClass: _$enumDecodeNullable(
        _$HlsMediaStoreStorageClassEnumMap, json['mediaStoreStorageClass']),
    numRetries: json['numRetries'] as int,
    restartDelay: json['restartDelay'] as int,
  );
}

Map<String, dynamic> _$HlsMediaStoreSettingsToJson(
    HlsMediaStoreSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('filecacheDuration', instance.filecacheDuration);
  writeNotNull('mediaStoreStorageClass',
      _$HlsMediaStoreStorageClassEnumMap[instance.mediaStoreStorageClass]);
  writeNotNull('numRetries', instance.numRetries);
  writeNotNull('restartDelay', instance.restartDelay);
  return val;
}

const _$HlsMediaStoreStorageClassEnumMap = {
  HlsMediaStoreStorageClass.temporal: 'TEMPORAL',
};

HlsOutputSettings _$HlsOutputSettingsFromJson(Map<String, dynamic> json) {
  return HlsOutputSettings(
    hlsSettings: json['hlsSettings'] == null
        ? null
        : HlsSettings.fromJson(json['hlsSettings'] as Map<String, dynamic>),
    h265PackagingType: _$enumDecodeNullable(
        _$HlsH265PackagingTypeEnumMap, json['h265PackagingType']),
    nameModifier: json['nameModifier'] as String,
    segmentModifier: json['segmentModifier'] as String,
  );
}

Map<String, dynamic> _$HlsOutputSettingsToJson(HlsOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hlsSettings', instance.hlsSettings?.toJson());
  writeNotNull('h265PackagingType',
      _$HlsH265PackagingTypeEnumMap[instance.h265PackagingType]);
  writeNotNull('nameModifier', instance.nameModifier);
  writeNotNull('segmentModifier', instance.segmentModifier);
  return val;
}

const _$HlsH265PackagingTypeEnumMap = {
  HlsH265PackagingType.hev1: 'HEV1',
  HlsH265PackagingType.hvc1: 'HVC1',
};

HlsSettings _$HlsSettingsFromJson(Map<String, dynamic> json) {
  return HlsSettings(
    audioOnlyHlsSettings: json['audioOnlyHlsSettings'] == null
        ? null
        : AudioOnlyHlsSettings.fromJson(
            json['audioOnlyHlsSettings'] as Map<String, dynamic>),
    fmp4HlsSettings: json['fmp4HlsSettings'] == null
        ? null
        : Fmp4HlsSettings.fromJson(
            json['fmp4HlsSettings'] as Map<String, dynamic>),
    standardHlsSettings: json['standardHlsSettings'] == null
        ? null
        : StandardHlsSettings.fromJson(
            json['standardHlsSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HlsSettingsToJson(HlsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioOnlyHlsSettings', instance.audioOnlyHlsSettings?.toJson());
  writeNotNull('fmp4HlsSettings', instance.fmp4HlsSettings?.toJson());
  writeNotNull('standardHlsSettings', instance.standardHlsSettings?.toJson());
  return val;
}

HlsTimedMetadataScheduleActionSettings
    _$HlsTimedMetadataScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return HlsTimedMetadataScheduleActionSettings(
    id3: json['id3'] as String,
  );
}

Map<String, dynamic> _$HlsTimedMetadataScheduleActionSettingsToJson(
    HlsTimedMetadataScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id3', instance.id3);
  return val;
}

HlsWebdavSettings _$HlsWebdavSettingsFromJson(Map<String, dynamic> json) {
  return HlsWebdavSettings(
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    filecacheDuration: json['filecacheDuration'] as int,
    httpTransferMode: _$enumDecodeNullable(
        _$HlsWebdavHttpTransferModeEnumMap, json['httpTransferMode']),
    numRetries: json['numRetries'] as int,
    restartDelay: json['restartDelay'] as int,
  );
}

Map<String, dynamic> _$HlsWebdavSettingsToJson(HlsWebdavSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('filecacheDuration', instance.filecacheDuration);
  writeNotNull('httpTransferMode',
      _$HlsWebdavHttpTransferModeEnumMap[instance.httpTransferMode]);
  writeNotNull('numRetries', instance.numRetries);
  writeNotNull('restartDelay', instance.restartDelay);
  return val;
}

const _$HlsWebdavHttpTransferModeEnumMap = {
  HlsWebdavHttpTransferMode.chunked: 'CHUNKED',
  HlsWebdavHttpTransferMode.nonChunked: 'NON_CHUNKED',
};

ImmediateModeScheduleActionStartSettings
    _$ImmediateModeScheduleActionStartSettingsFromJson(
        Map<String, dynamic> json) {
  return ImmediateModeScheduleActionStartSettings();
}

Map<String, dynamic> _$ImmediateModeScheduleActionStartSettingsToJson(
        ImmediateModeScheduleActionStartSettings instance) =>
    <String, dynamic>{};

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    arn: json['arn'] as String,
    attachedChannels:
        (json['attachedChannels'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : InputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    inputClass: _$enumDecodeNullable(_$InputClassEnumMap, json['inputClass']),
    inputDevices: (json['inputDevices'] as List)
        ?.map((e) => e == null
            ? null
            : InputDeviceSettings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSourceType:
        _$enumDecodeNullable(_$InputSourceTypeEnumMap, json['inputSourceType']),
    mediaConnectFlows: (json['mediaConnectFlows'] as List)
        ?.map((e) => e == null
            ? null
            : MediaConnectFlow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : InputSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$InputStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$InputTypeEnumMap, json['type']),
  );
}

InputAttachment _$InputAttachmentFromJson(Map<String, dynamic> json) {
  return InputAttachment(
    automaticInputFailoverSettings:
        json['automaticInputFailoverSettings'] == null
            ? null
            : AutomaticInputFailoverSettings.fromJson(
                json['automaticInputFailoverSettings'] as Map<String, dynamic>),
    inputAttachmentName: json['inputAttachmentName'] as String,
    inputId: json['inputId'] as String,
    inputSettings: json['inputSettings'] == null
        ? null
        : InputSettings.fromJson(json['inputSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputAttachmentToJson(InputAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('automaticInputFailoverSettings',
      instance.automaticInputFailoverSettings?.toJson());
  writeNotNull('inputAttachmentName', instance.inputAttachmentName);
  writeNotNull('inputId', instance.inputId);
  writeNotNull('inputSettings', instance.inputSettings?.toJson());
  return val;
}

InputChannelLevel _$InputChannelLevelFromJson(Map<String, dynamic> json) {
  return InputChannelLevel(
    gain: json['gain'] as int,
    inputChannel: json['inputChannel'] as int,
  );
}

Map<String, dynamic> _$InputChannelLevelToJson(InputChannelLevel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gain', instance.gain);
  writeNotNull('inputChannel', instance.inputChannel);
  return val;
}

InputClippingSettings _$InputClippingSettingsFromJson(
    Map<String, dynamic> json) {
  return InputClippingSettings(
    inputTimecodeSource: _$enumDecodeNullable(
        _$InputTimecodeSourceEnumMap, json['inputTimecodeSource']),
    startTimecode: json['startTimecode'] == null
        ? null
        : StartTimecode.fromJson(json['startTimecode'] as Map<String, dynamic>),
    stopTimecode: json['stopTimecode'] == null
        ? null
        : StopTimecode.fromJson(json['stopTimecode'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputClippingSettingsToJson(
    InputClippingSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputTimecodeSource',
      _$InputTimecodeSourceEnumMap[instance.inputTimecodeSource]);
  writeNotNull('startTimecode', instance.startTimecode?.toJson());
  writeNotNull('stopTimecode', instance.stopTimecode?.toJson());
  return val;
}

const _$InputTimecodeSourceEnumMap = {
  InputTimecodeSource.zerobased: 'ZEROBASED',
  InputTimecodeSource.embedded: 'EMBEDDED',
};

InputDestination _$InputDestinationFromJson(Map<String, dynamic> json) {
  return InputDestination(
    ip: json['ip'] as String,
    port: json['port'] as String,
    url: json['url'] as String,
    vpc: json['vpc'] == null
        ? null
        : InputDestinationVpc.fromJson(json['vpc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputDestinationRequestToJson(
    InputDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('streamName', instance.streamName);
  return val;
}

InputDestinationVpc _$InputDestinationVpcFromJson(Map<String, dynamic> json) {
  return InputDestinationVpc(
    availabilityZone: json['availabilityZone'] as String,
    networkInterfaceId: json['networkInterfaceId'] as String,
  );
}

Map<String, dynamic> _$InputDeviceConfigurableSettingsToJson(
    InputDeviceConfigurableSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configuredInput',
      _$InputDeviceConfiguredInputEnumMap[instance.configuredInput]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  return val;
}

const _$InputDeviceConfiguredInputEnumMap = {
  InputDeviceConfiguredInput.auto: 'AUTO',
  InputDeviceConfiguredInput.hdmi: 'HDMI',
  InputDeviceConfiguredInput.sdi: 'SDI',
};

InputDeviceHdSettings _$InputDeviceHdSettingsFromJson(
    Map<String, dynamic> json) {
  return InputDeviceHdSettings(
    activeInput: _$enumDecodeNullable(
        _$InputDeviceActiveInputEnumMap, json['activeInput']),
    configuredInput: _$enumDecodeNullable(
        _$InputDeviceConfiguredInputEnumMap, json['configuredInput']),
    deviceState:
        _$enumDecodeNullable(_$InputDeviceStateEnumMap, json['deviceState']),
    framerate: (json['framerate'] as num)?.toDouble(),
    height: json['height'] as int,
    maxBitrate: json['maxBitrate'] as int,
    scanType:
        _$enumDecodeNullable(_$InputDeviceScanTypeEnumMap, json['scanType']),
    width: json['width'] as int,
  );
}

const _$InputDeviceActiveInputEnumMap = {
  InputDeviceActiveInput.hdmi: 'HDMI',
  InputDeviceActiveInput.sdi: 'SDI',
};

const _$InputDeviceStateEnumMap = {
  InputDeviceState.idle: 'IDLE',
  InputDeviceState.streaming: 'STREAMING',
};

const _$InputDeviceScanTypeEnumMap = {
  InputDeviceScanType.interlaced: 'INTERLACED',
  InputDeviceScanType.progressive: 'PROGRESSIVE',
};

InputDeviceNetworkSettings _$InputDeviceNetworkSettingsFromJson(
    Map<String, dynamic> json) {
  return InputDeviceNetworkSettings(
    dnsAddresses:
        (json['dnsAddresses'] as List)?.map((e) => e as String)?.toList(),
    gateway: json['gateway'] as String,
    ipAddress: json['ipAddress'] as String,
    ipScheme:
        _$enumDecodeNullable(_$InputDeviceIpSchemeEnumMap, json['ipScheme']),
    subnetMask: json['subnetMask'] as String,
  );
}

const _$InputDeviceIpSchemeEnumMap = {
  InputDeviceIpScheme.static: 'STATIC',
  InputDeviceIpScheme.dhcp: 'DHCP',
};

Map<String, dynamic> _$InputDeviceRequestToJson(InputDeviceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

InputDeviceSettings _$InputDeviceSettingsFromJson(Map<String, dynamic> json) {
  return InputDeviceSettings(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$InputDeviceSettingsToJson(InputDeviceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

InputDeviceSummary _$InputDeviceSummaryFromJson(Map<String, dynamic> json) {
  return InputDeviceSummary(
    arn: json['arn'] as String,
    connectionState: _$enumDecodeNullable(
        _$InputDeviceConnectionStateEnumMap, json['connectionState']),
    deviceSettingsSyncState: _$enumDecodeNullable(
        _$DeviceSettingsSyncStateEnumMap, json['deviceSettingsSyncState']),
    deviceUpdateStatus: _$enumDecodeNullable(
        _$DeviceUpdateStatusEnumMap, json['deviceUpdateStatus']),
    hdDeviceSettings: json['hdDeviceSettings'] == null
        ? null
        : InputDeviceHdSettings.fromJson(
            json['hdDeviceSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    macAddress: json['macAddress'] as String,
    name: json['name'] as String,
    networkSettings: json['networkSettings'] == null
        ? null
        : InputDeviceNetworkSettings.fromJson(
            json['networkSettings'] as Map<String, dynamic>),
    serialNumber: json['serialNumber'] as String,
    type: _$enumDecodeNullable(_$InputDeviceTypeEnumMap, json['type']),
    uhdDeviceSettings: json['uhdDeviceSettings'] == null
        ? null
        : InputDeviceUhdSettings.fromJson(
            json['uhdDeviceSettings'] as Map<String, dynamic>),
  );
}

InputDeviceUhdSettings _$InputDeviceUhdSettingsFromJson(
    Map<String, dynamic> json) {
  return InputDeviceUhdSettings(
    activeInput: _$enumDecodeNullable(
        _$InputDeviceActiveInputEnumMap, json['activeInput']),
    configuredInput: _$enumDecodeNullable(
        _$InputDeviceConfiguredInputEnumMap, json['configuredInput']),
    deviceState:
        _$enumDecodeNullable(_$InputDeviceStateEnumMap, json['deviceState']),
    framerate: (json['framerate'] as num)?.toDouble(),
    height: json['height'] as int,
    maxBitrate: json['maxBitrate'] as int,
    scanType:
        _$enumDecodeNullable(_$InputDeviceScanTypeEnumMap, json['scanType']),
    width: json['width'] as int,
  );
}

InputLocation _$InputLocationFromJson(Map<String, dynamic> json) {
  return InputLocation(
    uri: json['uri'] as String,
    passwordParam: json['passwordParam'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$InputLocationToJson(InputLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uri', instance.uri);
  writeNotNull('passwordParam', instance.passwordParam);
  writeNotNull('username', instance.username);
  return val;
}

InputLossBehavior _$InputLossBehaviorFromJson(Map<String, dynamic> json) {
  return InputLossBehavior(
    blackFrameMsec: json['blackFrameMsec'] as int,
    inputLossImageColor: json['inputLossImageColor'] as String,
    inputLossImageSlate: json['inputLossImageSlate'] == null
        ? null
        : InputLocation.fromJson(
            json['inputLossImageSlate'] as Map<String, dynamic>),
    inputLossImageType: _$enumDecodeNullable(
        _$InputLossImageTypeEnumMap, json['inputLossImageType']),
    repeatFrameMsec: json['repeatFrameMsec'] as int,
  );
}

Map<String, dynamic> _$InputLossBehaviorToJson(InputLossBehavior instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('blackFrameMsec', instance.blackFrameMsec);
  writeNotNull('inputLossImageColor', instance.inputLossImageColor);
  writeNotNull('inputLossImageSlate', instance.inputLossImageSlate?.toJson());
  writeNotNull('inputLossImageType',
      _$InputLossImageTypeEnumMap[instance.inputLossImageType]);
  writeNotNull('repeatFrameMsec', instance.repeatFrameMsec);
  return val;
}

const _$InputLossImageTypeEnumMap = {
  InputLossImageType.color: 'COLOR',
  InputLossImageType.slate: 'SLATE',
};

InputLossFailoverSettings _$InputLossFailoverSettingsFromJson(
    Map<String, dynamic> json) {
  return InputLossFailoverSettings(
    inputLossThresholdMsec: json['inputLossThresholdMsec'] as int,
  );
}

Map<String, dynamic> _$InputLossFailoverSettingsToJson(
    InputLossFailoverSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputLossThresholdMsec', instance.inputLossThresholdMsec);
  return val;
}

InputPrepareScheduleActionSettings _$InputPrepareScheduleActionSettingsFromJson(
    Map<String, dynamic> json) {
  return InputPrepareScheduleActionSettings(
    inputAttachmentNameReference:
        json['inputAttachmentNameReference'] as String,
    inputClippingSettings: json['inputClippingSettings'] == null
        ? null
        : InputClippingSettings.fromJson(
            json['inputClippingSettings'] as Map<String, dynamic>),
    urlPath: (json['urlPath'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$InputPrepareScheduleActionSettingsToJson(
    InputPrepareScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'inputAttachmentNameReference', instance.inputAttachmentNameReference);
  writeNotNull(
      'inputClippingSettings', instance.inputClippingSettings?.toJson());
  writeNotNull('urlPath', instance.urlPath);
  return val;
}

InputSecurityGroup _$InputSecurityGroupFromJson(Map<String, dynamic> json) {
  return InputSecurityGroup(
    arn: json['arn'] as String,
    id: json['id'] as String,
    inputs: (json['inputs'] as List)?.map((e) => e as String)?.toList(),
    state:
        _$enumDecodeNullable(_$InputSecurityGroupStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    whitelistRules: (json['whitelistRules'] as List)
        ?.map((e) => e == null
            ? null
            : InputWhitelistRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InputSettings _$InputSettingsFromJson(Map<String, dynamic> json) {
  return InputSettings(
    audioSelectors: (json['audioSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : AudioSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionSelectors: (json['captionSelectors'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionSelector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deblockFilter: _$enumDecodeNullable(
        _$InputDeblockFilterEnumMap, json['deblockFilter']),
    denoiseFilter: _$enumDecodeNullable(
        _$InputDenoiseFilterEnumMap, json['denoiseFilter']),
    filterStrength: json['filterStrength'] as int,
    inputFilter:
        _$enumDecodeNullable(_$InputFilterEnumMap, json['inputFilter']),
    networkInputSettings: json['networkInputSettings'] == null
        ? null
        : NetworkInputSettings.fromJson(
            json['networkInputSettings'] as Map<String, dynamic>),
    smpte2038DataPreference: _$enumDecodeNullable(
        _$Smpte2038DataPreferenceEnumMap, json['smpte2038DataPreference']),
    sourceEndBehavior: _$enumDecodeNullable(
        _$InputSourceEndBehaviorEnumMap, json['sourceEndBehavior']),
    videoSelector: json['videoSelector'] == null
        ? null
        : VideoSelector.fromJson(json['videoSelector'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputSettingsToJson(InputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectors',
      instance.audioSelectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('captionSelectors',
      instance.captionSelectors?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'deblockFilter', _$InputDeblockFilterEnumMap[instance.deblockFilter]);
  writeNotNull(
      'denoiseFilter', _$InputDenoiseFilterEnumMap[instance.denoiseFilter]);
  writeNotNull('filterStrength', instance.filterStrength);
  writeNotNull('inputFilter', _$InputFilterEnumMap[instance.inputFilter]);
  writeNotNull('networkInputSettings', instance.networkInputSettings?.toJson());
  writeNotNull('smpte2038DataPreference',
      _$Smpte2038DataPreferenceEnumMap[instance.smpte2038DataPreference]);
  writeNotNull('sourceEndBehavior',
      _$InputSourceEndBehaviorEnumMap[instance.sourceEndBehavior]);
  writeNotNull('videoSelector', instance.videoSelector?.toJson());
  return val;
}

const _$InputDeblockFilterEnumMap = {
  InputDeblockFilter.disabled: 'DISABLED',
  InputDeblockFilter.enabled: 'ENABLED',
};

const _$InputDenoiseFilterEnumMap = {
  InputDenoiseFilter.disabled: 'DISABLED',
  InputDenoiseFilter.enabled: 'ENABLED',
};

const _$InputFilterEnumMap = {
  InputFilter.auto: 'AUTO',
  InputFilter.disabled: 'DISABLED',
  InputFilter.forced: 'FORCED',
};

const _$Smpte2038DataPreferenceEnumMap = {
  Smpte2038DataPreference.ignore: 'IGNORE',
  Smpte2038DataPreference.prefer: 'PREFER',
};

const _$InputSourceEndBehaviorEnumMap = {
  InputSourceEndBehavior.$continue: 'CONTINUE',
  InputSourceEndBehavior.loop: 'LOOP',
};

InputSource _$InputSourceFromJson(Map<String, dynamic> json) {
  return InputSource(
    passwordParam: json['passwordParam'] as String,
    url: json['url'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$InputSourceRequestToJson(InputSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('passwordParam', instance.passwordParam);
  writeNotNull('url', instance.url);
  writeNotNull('username', instance.username);
  return val;
}

InputSpecification _$InputSpecificationFromJson(Map<String, dynamic> json) {
  return InputSpecification(
    codec: _$enumDecodeNullable(_$InputCodecEnumMap, json['codec']),
    maximumBitrate: _$enumDecodeNullable(
        _$InputMaximumBitrateEnumMap, json['maximumBitrate']),
    resolution:
        _$enumDecodeNullable(_$InputResolutionEnumMap, json['resolution']),
  );
}

Map<String, dynamic> _$InputSpecificationToJson(InputSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codec', _$InputCodecEnumMap[instance.codec]);
  writeNotNull(
      'maximumBitrate', _$InputMaximumBitrateEnumMap[instance.maximumBitrate]);
  writeNotNull('resolution', _$InputResolutionEnumMap[instance.resolution]);
  return val;
}

const _$InputCodecEnumMap = {
  InputCodec.mpeg2: 'MPEG2',
  InputCodec.avc: 'AVC',
  InputCodec.hevc: 'HEVC',
};

const _$InputMaximumBitrateEnumMap = {
  InputMaximumBitrate.max_10Mbps: 'MAX_10_MBPS',
  InputMaximumBitrate.max_20Mbps: 'MAX_20_MBPS',
  InputMaximumBitrate.max_50Mbps: 'MAX_50_MBPS',
};

const _$InputResolutionEnumMap = {
  InputResolution.sd: 'SD',
  InputResolution.hd: 'HD',
  InputResolution.uhd: 'UHD',
};

InputSwitchScheduleActionSettings _$InputSwitchScheduleActionSettingsFromJson(
    Map<String, dynamic> json) {
  return InputSwitchScheduleActionSettings(
    inputAttachmentNameReference:
        json['inputAttachmentNameReference'] as String,
    inputClippingSettings: json['inputClippingSettings'] == null
        ? null
        : InputClippingSettings.fromJson(
            json['inputClippingSettings'] as Map<String, dynamic>),
    urlPath: (json['urlPath'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$InputSwitchScheduleActionSettingsToJson(
    InputSwitchScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'inputAttachmentNameReference', instance.inputAttachmentNameReference);
  writeNotNull(
      'inputClippingSettings', instance.inputClippingSettings?.toJson());
  writeNotNull('urlPath', instance.urlPath);
  return val;
}

Map<String, dynamic> _$InputVpcRequestToJson(InputVpcRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subnetIds', instance.subnetIds);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  return val;
}

InputWhitelistRule _$InputWhitelistRuleFromJson(Map<String, dynamic> json) {
  return InputWhitelistRule(
    cidr: json['cidr'] as String,
  );
}

Map<String, dynamic> _$InputWhitelistRuleCidrToJson(
    InputWhitelistRuleCidr instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cidr', instance.cidr);
  return val;
}

KeyProviderSettings _$KeyProviderSettingsFromJson(Map<String, dynamic> json) {
  return KeyProviderSettings(
    staticKeySettings: json['staticKeySettings'] == null
        ? null
        : StaticKeySettings.fromJson(
            json['staticKeySettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KeyProviderSettingsToJson(KeyProviderSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('staticKeySettings', instance.staticKeySettings?.toJson());
  return val;
}

ListChannelsResponse _$ListChannelsResponseFromJson(Map<String, dynamic> json) {
  return ListChannelsResponse(
    channels: (json['channels'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInputDeviceTransfersResponse _$ListInputDeviceTransfersResponseFromJson(
    Map<String, dynamic> json) {
  return ListInputDeviceTransfersResponse(
    inputDeviceTransfers: (json['inputDeviceTransfers'] as List)
        ?.map((e) => e == null
            ? null
            : TransferringInputDeviceSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInputDevicesResponse _$ListInputDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return ListInputDevicesResponse(
    inputDevices: (json['inputDevices'] as List)
        ?.map((e) => e == null
            ? null
            : InputDeviceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInputSecurityGroupsResponse _$ListInputSecurityGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInputSecurityGroupsResponse(
    inputSecurityGroups: (json['inputSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : InputSecurityGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInputsResponse _$ListInputsResponseFromJson(Map<String, dynamic> json) {
  return ListInputsResponse(
    inputs: (json['inputs'] as List)
        ?.map(
            (e) => e == null ? null : Input.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListMultiplexProgramsResponse _$ListMultiplexProgramsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMultiplexProgramsResponse(
    multiplexPrograms: (json['multiplexPrograms'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexProgramSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListMultiplexesResponse _$ListMultiplexesResponseFromJson(
    Map<String, dynamic> json) {
  return ListMultiplexesResponse(
    multiplexes: (json['multiplexes'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOfferingsResponse _$ListOfferingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOfferingsResponse(
    nextToken: json['nextToken'] as String,
    offerings: (json['offerings'] as List)
        ?.map((e) =>
            e == null ? null : Offering.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListReservationsResponse _$ListReservationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListReservationsResponse(
    nextToken: json['nextToken'] as String,
    reservations: (json['reservations'] as List)
        ?.map((e) =>
            e == null ? null : Reservation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

M2tsSettings _$M2tsSettingsFromJson(Map<String, dynamic> json) {
  return M2tsSettings(
    absentInputAudioBehavior: _$enumDecodeNullable(
        _$M2tsAbsentInputAudioBehaviorEnumMap,
        json['absentInputAudioBehavior']),
    arib: _$enumDecodeNullable(_$M2tsAribEnumMap, json['arib']),
    aribCaptionsPid: json['aribCaptionsPid'] as String,
    aribCaptionsPidControl: _$enumDecodeNullable(
        _$M2tsAribCaptionsPidControlEnumMap, json['aribCaptionsPidControl']),
    audioBufferModel: _$enumDecodeNullable(
        _$M2tsAudioBufferModelEnumMap, json['audioBufferModel']),
    audioFramesPerPes: json['audioFramesPerPes'] as int,
    audioPids: json['audioPids'] as String,
    audioStreamType: _$enumDecodeNullable(
        _$M2tsAudioStreamTypeEnumMap, json['audioStreamType']),
    bitrate: json['bitrate'] as int,
    bufferModel:
        _$enumDecodeNullable(_$M2tsBufferModelEnumMap, json['bufferModel']),
    ccDescriptor:
        _$enumDecodeNullable(_$M2tsCcDescriptorEnumMap, json['ccDescriptor']),
    dvbNitSettings: json['dvbNitSettings'] == null
        ? null
        : DvbNitSettings.fromJson(
            json['dvbNitSettings'] as Map<String, dynamic>),
    dvbSdtSettings: json['dvbSdtSettings'] == null
        ? null
        : DvbSdtSettings.fromJson(
            json['dvbSdtSettings'] as Map<String, dynamic>),
    dvbSubPids: json['dvbSubPids'] as String,
    dvbTdtSettings: json['dvbTdtSettings'] == null
        ? null
        : DvbTdtSettings.fromJson(
            json['dvbTdtSettings'] as Map<String, dynamic>),
    dvbTeletextPid: json['dvbTeletextPid'] as String,
    ebif: _$enumDecodeNullable(_$M2tsEbifControlEnumMap, json['ebif']),
    ebpAudioInterval: _$enumDecodeNullable(
        _$M2tsAudioIntervalEnumMap, json['ebpAudioInterval']),
    ebpLookaheadMs: json['ebpLookaheadMs'] as int,
    ebpPlacement:
        _$enumDecodeNullable(_$M2tsEbpPlacementEnumMap, json['ebpPlacement']),
    ecmPid: json['ecmPid'] as String,
    esRateInPes:
        _$enumDecodeNullable(_$M2tsEsRateInPesEnumMap, json['esRateInPes']),
    etvPlatformPid: json['etvPlatformPid'] as String,
    etvSignalPid: json['etvSignalPid'] as String,
    fragmentTime: (json['fragmentTime'] as num)?.toDouble(),
    klv: _$enumDecodeNullable(_$M2tsKlvEnumMap, json['klv']),
    klvDataPids: json['klvDataPids'] as String,
    nielsenId3Behavior: _$enumDecodeNullable(
        _$M2tsNielsenId3BehaviorEnumMap, json['nielsenId3Behavior']),
    nullPacketBitrate: (json['nullPacketBitrate'] as num)?.toDouble(),
    patInterval: json['patInterval'] as int,
    pcrControl:
        _$enumDecodeNullable(_$M2tsPcrControlEnumMap, json['pcrControl']),
    pcrPeriod: json['pcrPeriod'] as int,
    pcrPid: json['pcrPid'] as String,
    pmtInterval: json['pmtInterval'] as int,
    pmtPid: json['pmtPid'] as String,
    programNum: json['programNum'] as int,
    rateMode: _$enumDecodeNullable(_$M2tsRateModeEnumMap, json['rateMode']),
    scte27Pids: json['scte27Pids'] as String,
    scte35Control:
        _$enumDecodeNullable(_$M2tsScte35ControlEnumMap, json['scte35Control']),
    scte35Pid: json['scte35Pid'] as String,
    segmentationMarkers: _$enumDecodeNullable(
        _$M2tsSegmentationMarkersEnumMap, json['segmentationMarkers']),
    segmentationStyle: _$enumDecodeNullable(
        _$M2tsSegmentationStyleEnumMap, json['segmentationStyle']),
    segmentationTime: (json['segmentationTime'] as num)?.toDouble(),
    timedMetadataBehavior: _$enumDecodeNullable(
        _$M2tsTimedMetadataBehaviorEnumMap, json['timedMetadataBehavior']),
    timedMetadataPid: json['timedMetadataPid'] as String,
    transportStreamId: json['transportStreamId'] as int,
    videoPid: json['videoPid'] as String,
  );
}

Map<String, dynamic> _$M2tsSettingsToJson(M2tsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('absentInputAudioBehavior',
      _$M2tsAbsentInputAudioBehaviorEnumMap[instance.absentInputAudioBehavior]);
  writeNotNull('arib', _$M2tsAribEnumMap[instance.arib]);
  writeNotNull('aribCaptionsPid', instance.aribCaptionsPid);
  writeNotNull('aribCaptionsPidControl',
      _$M2tsAribCaptionsPidControlEnumMap[instance.aribCaptionsPidControl]);
  writeNotNull('audioBufferModel',
      _$M2tsAudioBufferModelEnumMap[instance.audioBufferModel]);
  writeNotNull('audioFramesPerPes', instance.audioFramesPerPes);
  writeNotNull('audioPids', instance.audioPids);
  writeNotNull('audioStreamType',
      _$M2tsAudioStreamTypeEnumMap[instance.audioStreamType]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('bufferModel', _$M2tsBufferModelEnumMap[instance.bufferModel]);
  writeNotNull(
      'ccDescriptor', _$M2tsCcDescriptorEnumMap[instance.ccDescriptor]);
  writeNotNull('dvbNitSettings', instance.dvbNitSettings?.toJson());
  writeNotNull('dvbSdtSettings', instance.dvbSdtSettings?.toJson());
  writeNotNull('dvbSubPids', instance.dvbSubPids);
  writeNotNull('dvbTdtSettings', instance.dvbTdtSettings?.toJson());
  writeNotNull('dvbTeletextPid', instance.dvbTeletextPid);
  writeNotNull('ebif', _$M2tsEbifControlEnumMap[instance.ebif]);
  writeNotNull('ebpAudioInterval',
      _$M2tsAudioIntervalEnumMap[instance.ebpAudioInterval]);
  writeNotNull('ebpLookaheadMs', instance.ebpLookaheadMs);
  writeNotNull(
      'ebpPlacement', _$M2tsEbpPlacementEnumMap[instance.ebpPlacement]);
  writeNotNull('ecmPid', instance.ecmPid);
  writeNotNull('esRateInPes', _$M2tsEsRateInPesEnumMap[instance.esRateInPes]);
  writeNotNull('etvPlatformPid', instance.etvPlatformPid);
  writeNotNull('etvSignalPid', instance.etvSignalPid);
  writeNotNull('fragmentTime', instance.fragmentTime);
  writeNotNull('klv', _$M2tsKlvEnumMap[instance.klv]);
  writeNotNull('klvDataPids', instance.klvDataPids);
  writeNotNull('nielsenId3Behavior',
      _$M2tsNielsenId3BehaviorEnumMap[instance.nielsenId3Behavior]);
  writeNotNull('nullPacketBitrate', instance.nullPacketBitrate);
  writeNotNull('patInterval', instance.patInterval);
  writeNotNull('pcrControl', _$M2tsPcrControlEnumMap[instance.pcrControl]);
  writeNotNull('pcrPeriod', instance.pcrPeriod);
  writeNotNull('pcrPid', instance.pcrPid);
  writeNotNull('pmtInterval', instance.pmtInterval);
  writeNotNull('pmtPid', instance.pmtPid);
  writeNotNull('programNum', instance.programNum);
  writeNotNull('rateMode', _$M2tsRateModeEnumMap[instance.rateMode]);
  writeNotNull('scte27Pids', instance.scte27Pids);
  writeNotNull(
      'scte35Control', _$M2tsScte35ControlEnumMap[instance.scte35Control]);
  writeNotNull('scte35Pid', instance.scte35Pid);
  writeNotNull('segmentationMarkers',
      _$M2tsSegmentationMarkersEnumMap[instance.segmentationMarkers]);
  writeNotNull('segmentationStyle',
      _$M2tsSegmentationStyleEnumMap[instance.segmentationStyle]);
  writeNotNull('segmentationTime', instance.segmentationTime);
  writeNotNull('timedMetadataBehavior',
      _$M2tsTimedMetadataBehaviorEnumMap[instance.timedMetadataBehavior]);
  writeNotNull('timedMetadataPid', instance.timedMetadataPid);
  writeNotNull('transportStreamId', instance.transportStreamId);
  writeNotNull('videoPid', instance.videoPid);
  return val;
}

const _$M2tsAbsentInputAudioBehaviorEnumMap = {
  M2tsAbsentInputAudioBehavior.drop: 'DROP',
  M2tsAbsentInputAudioBehavior.encodeSilence: 'ENCODE_SILENCE',
};

const _$M2tsAribEnumMap = {
  M2tsArib.disabled: 'DISABLED',
  M2tsArib.enabled: 'ENABLED',
};

const _$M2tsAribCaptionsPidControlEnumMap = {
  M2tsAribCaptionsPidControl.auto: 'AUTO',
  M2tsAribCaptionsPidControl.useConfigured: 'USE_CONFIGURED',
};

const _$M2tsAudioBufferModelEnumMap = {
  M2tsAudioBufferModel.atsc: 'ATSC',
  M2tsAudioBufferModel.dvb: 'DVB',
};

const _$M2tsAudioStreamTypeEnumMap = {
  M2tsAudioStreamType.atsc: 'ATSC',
  M2tsAudioStreamType.dvb: 'DVB',
};

const _$M2tsBufferModelEnumMap = {
  M2tsBufferModel.multiplex: 'MULTIPLEX',
  M2tsBufferModel.none: 'NONE',
};

const _$M2tsCcDescriptorEnumMap = {
  M2tsCcDescriptor.disabled: 'DISABLED',
  M2tsCcDescriptor.enabled: 'ENABLED',
};

const _$M2tsEbifControlEnumMap = {
  M2tsEbifControl.none: 'NONE',
  M2tsEbifControl.passthrough: 'PASSTHROUGH',
};

const _$M2tsAudioIntervalEnumMap = {
  M2tsAudioInterval.videoAndFixedIntervals: 'VIDEO_AND_FIXED_INTERVALS',
  M2tsAudioInterval.videoInterval: 'VIDEO_INTERVAL',
};

const _$M2tsEbpPlacementEnumMap = {
  M2tsEbpPlacement.videoAndAudioPids: 'VIDEO_AND_AUDIO_PIDS',
  M2tsEbpPlacement.videoPid: 'VIDEO_PID',
};

const _$M2tsEsRateInPesEnumMap = {
  M2tsEsRateInPes.exclude: 'EXCLUDE',
  M2tsEsRateInPes.include: 'INCLUDE',
};

const _$M2tsKlvEnumMap = {
  M2tsKlv.none: 'NONE',
  M2tsKlv.passthrough: 'PASSTHROUGH',
};

const _$M2tsNielsenId3BehaviorEnumMap = {
  M2tsNielsenId3Behavior.noPassthrough: 'NO_PASSTHROUGH',
  M2tsNielsenId3Behavior.passthrough: 'PASSTHROUGH',
};

const _$M2tsPcrControlEnumMap = {
  M2tsPcrControl.configuredPcrPeriod: 'CONFIGURED_PCR_PERIOD',
  M2tsPcrControl.pcrEveryPesPacket: 'PCR_EVERY_PES_PACKET',
};

const _$M2tsRateModeEnumMap = {
  M2tsRateMode.cbr: 'CBR',
  M2tsRateMode.vbr: 'VBR',
};

const _$M2tsScte35ControlEnumMap = {
  M2tsScte35Control.none: 'NONE',
  M2tsScte35Control.passthrough: 'PASSTHROUGH',
};

const _$M2tsSegmentationMarkersEnumMap = {
  M2tsSegmentationMarkers.ebp: 'EBP',
  M2tsSegmentationMarkers.ebpLegacy: 'EBP_LEGACY',
  M2tsSegmentationMarkers.none: 'NONE',
  M2tsSegmentationMarkers.psiSegstart: 'PSI_SEGSTART',
  M2tsSegmentationMarkers.raiAdapt: 'RAI_ADAPT',
  M2tsSegmentationMarkers.raiSegstart: 'RAI_SEGSTART',
};

const _$M2tsSegmentationStyleEnumMap = {
  M2tsSegmentationStyle.maintainCadence: 'MAINTAIN_CADENCE',
  M2tsSegmentationStyle.resetCadence: 'RESET_CADENCE',
};

const _$M2tsTimedMetadataBehaviorEnumMap = {
  M2tsTimedMetadataBehavior.noPassthrough: 'NO_PASSTHROUGH',
  M2tsTimedMetadataBehavior.passthrough: 'PASSTHROUGH',
};

M3u8Settings _$M3u8SettingsFromJson(Map<String, dynamic> json) {
  return M3u8Settings(
    audioFramesPerPes: json['audioFramesPerPes'] as int,
    audioPids: json['audioPids'] as String,
    ecmPid: json['ecmPid'] as String,
    nielsenId3Behavior: _$enumDecodeNullable(
        _$M3u8NielsenId3BehaviorEnumMap, json['nielsenId3Behavior']),
    patInterval: json['patInterval'] as int,
    pcrControl:
        _$enumDecodeNullable(_$M3u8PcrControlEnumMap, json['pcrControl']),
    pcrPeriod: json['pcrPeriod'] as int,
    pcrPid: json['pcrPid'] as String,
    pmtInterval: json['pmtInterval'] as int,
    pmtPid: json['pmtPid'] as String,
    programNum: json['programNum'] as int,
    scte35Behavior: _$enumDecodeNullable(
        _$M3u8Scte35BehaviorEnumMap, json['scte35Behavior']),
    scte35Pid: json['scte35Pid'] as String,
    timedMetadataBehavior: _$enumDecodeNullable(
        _$M3u8TimedMetadataBehaviorEnumMap, json['timedMetadataBehavior']),
    timedMetadataPid: json['timedMetadataPid'] as String,
    transportStreamId: json['transportStreamId'] as int,
    videoPid: json['videoPid'] as String,
  );
}

Map<String, dynamic> _$M3u8SettingsToJson(M3u8Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioFramesPerPes', instance.audioFramesPerPes);
  writeNotNull('audioPids', instance.audioPids);
  writeNotNull('ecmPid', instance.ecmPid);
  writeNotNull('nielsenId3Behavior',
      _$M3u8NielsenId3BehaviorEnumMap[instance.nielsenId3Behavior]);
  writeNotNull('patInterval', instance.patInterval);
  writeNotNull('pcrControl', _$M3u8PcrControlEnumMap[instance.pcrControl]);
  writeNotNull('pcrPeriod', instance.pcrPeriod);
  writeNotNull('pcrPid', instance.pcrPid);
  writeNotNull('pmtInterval', instance.pmtInterval);
  writeNotNull('pmtPid', instance.pmtPid);
  writeNotNull('programNum', instance.programNum);
  writeNotNull(
      'scte35Behavior', _$M3u8Scte35BehaviorEnumMap[instance.scte35Behavior]);
  writeNotNull('scte35Pid', instance.scte35Pid);
  writeNotNull('timedMetadataBehavior',
      _$M3u8TimedMetadataBehaviorEnumMap[instance.timedMetadataBehavior]);
  writeNotNull('timedMetadataPid', instance.timedMetadataPid);
  writeNotNull('transportStreamId', instance.transportStreamId);
  writeNotNull('videoPid', instance.videoPid);
  return val;
}

const _$M3u8NielsenId3BehaviorEnumMap = {
  M3u8NielsenId3Behavior.noPassthrough: 'NO_PASSTHROUGH',
  M3u8NielsenId3Behavior.passthrough: 'PASSTHROUGH',
};

const _$M3u8PcrControlEnumMap = {
  M3u8PcrControl.configuredPcrPeriod: 'CONFIGURED_PCR_PERIOD',
  M3u8PcrControl.pcrEveryPesPacket: 'PCR_EVERY_PES_PACKET',
};

const _$M3u8Scte35BehaviorEnumMap = {
  M3u8Scte35Behavior.noPassthrough: 'NO_PASSTHROUGH',
  M3u8Scte35Behavior.passthrough: 'PASSTHROUGH',
};

const _$M3u8TimedMetadataBehaviorEnumMap = {
  M3u8TimedMetadataBehavior.noPassthrough: 'NO_PASSTHROUGH',
  M3u8TimedMetadataBehavior.passthrough: 'PASSTHROUGH',
};

MediaConnectFlow _$MediaConnectFlowFromJson(Map<String, dynamic> json) {
  return MediaConnectFlow(
    flowArn: json['flowArn'] as String,
  );
}

Map<String, dynamic> _$MediaConnectFlowRequestToJson(
    MediaConnectFlowRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flowArn', instance.flowArn);
  return val;
}

MediaPackageGroupSettings _$MediaPackageGroupSettingsFromJson(
    Map<String, dynamic> json) {
  return MediaPackageGroupSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MediaPackageGroupSettingsToJson(
    MediaPackageGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  return val;
}

MediaPackageOutputDestinationSettings
    _$MediaPackageOutputDestinationSettingsFromJson(Map<String, dynamic> json) {
  return MediaPackageOutputDestinationSettings(
    channelId: json['channelId'] as String,
  );
}

Map<String, dynamic> _$MediaPackageOutputDestinationSettingsToJson(
    MediaPackageOutputDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channelId', instance.channelId);
  return val;
}

MediaPackageOutputSettings _$MediaPackageOutputSettingsFromJson(
    Map<String, dynamic> json) {
  return MediaPackageOutputSettings();
}

Map<String, dynamic> _$MediaPackageOutputSettingsToJson(
        MediaPackageOutputSettings instance) =>
    <String, dynamic>{};

Mp2Settings _$Mp2SettingsFromJson(Map<String, dynamic> json) {
  return Mp2Settings(
    bitrate: (json['bitrate'] as num)?.toDouble(),
    codingMode:
        _$enumDecodeNullable(_$Mp2CodingModeEnumMap, json['codingMode']),
    sampleRate: (json['sampleRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$Mp2SettingsToJson(Mp2Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codingMode', _$Mp2CodingModeEnumMap[instance.codingMode]);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

const _$Mp2CodingModeEnumMap = {
  Mp2CodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  Mp2CodingMode.codingMode_2_0: 'CODING_MODE_2_0',
};

Mpeg2FilterSettings _$Mpeg2FilterSettingsFromJson(Map<String, dynamic> json) {
  return Mpeg2FilterSettings(
    temporalFilterSettings: json['temporalFilterSettings'] == null
        ? null
        : TemporalFilterSettings.fromJson(
            json['temporalFilterSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Mpeg2FilterSettingsToJson(Mpeg2FilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'temporalFilterSettings', instance.temporalFilterSettings?.toJson());
  return val;
}

Mpeg2Settings _$Mpeg2SettingsFromJson(Map<String, dynamic> json) {
  return Mpeg2Settings(
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    adaptiveQuantization: _$enumDecodeNullable(
        _$Mpeg2AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    afdSignaling:
        _$enumDecodeNullable(_$AfdSignalingEnumMap, json['afdSignaling']),
    colorMetadata: _$enumDecodeNullable(
        _$Mpeg2ColorMetadataEnumMap, json['colorMetadata']),
    colorSpace:
        _$enumDecodeNullable(_$Mpeg2ColorSpaceEnumMap, json['colorSpace']),
    displayAspectRatio: _$enumDecodeNullable(
        _$Mpeg2DisplayRatioEnumMap, json['displayAspectRatio']),
    filterSettings: json['filterSettings'] == null
        ? null
        : Mpeg2FilterSettings.fromJson(
            json['filterSettings'] as Map<String, dynamic>),
    fixedAfd: _$enumDecodeNullable(_$FixedAfdEnumMap, json['fixedAfd']),
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopNumBFrames: json['gopNumBFrames'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$Mpeg2GopSizeUnitsEnumMap, json['gopSizeUnits']),
    scanType: _$enumDecodeNullable(_$Mpeg2ScanTypeEnumMap, json['scanType']),
    subgopLength:
        _$enumDecodeNullable(_$Mpeg2SubGopLengthEnumMap, json['subgopLength']),
    timecodeInsertion: _$enumDecodeNullable(
        _$Mpeg2TimecodeInsertionBehaviorEnumMap, json['timecodeInsertion']),
  );
}

Map<String, dynamic> _$Mpeg2SettingsToJson(Mpeg2Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('adaptiveQuantization',
      _$Mpeg2AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull('afdSignaling', _$AfdSignalingEnumMap[instance.afdSignaling]);
  writeNotNull(
      'colorMetadata', _$Mpeg2ColorMetadataEnumMap[instance.colorMetadata]);
  writeNotNull('colorSpace', _$Mpeg2ColorSpaceEnumMap[instance.colorSpace]);
  writeNotNull('displayAspectRatio',
      _$Mpeg2DisplayRatioEnumMap[instance.displayAspectRatio]);
  writeNotNull('filterSettings', instance.filterSettings?.toJson());
  writeNotNull('fixedAfd', _$FixedAfdEnumMap[instance.fixedAfd]);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopNumBFrames', instance.gopNumBFrames);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$Mpeg2GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('scanType', _$Mpeg2ScanTypeEnumMap[instance.scanType]);
  writeNotNull(
      'subgopLength', _$Mpeg2SubGopLengthEnumMap[instance.subgopLength]);
  writeNotNull('timecodeInsertion',
      _$Mpeg2TimecodeInsertionBehaviorEnumMap[instance.timecodeInsertion]);
  return val;
}

const _$Mpeg2AdaptiveQuantizationEnumMap = {
  Mpeg2AdaptiveQuantization.auto: 'AUTO',
  Mpeg2AdaptiveQuantization.high: 'HIGH',
  Mpeg2AdaptiveQuantization.low: 'LOW',
  Mpeg2AdaptiveQuantization.medium: 'MEDIUM',
  Mpeg2AdaptiveQuantization.off: 'OFF',
};

const _$Mpeg2ColorMetadataEnumMap = {
  Mpeg2ColorMetadata.ignore: 'IGNORE',
  Mpeg2ColorMetadata.insert: 'INSERT',
};

const _$Mpeg2ColorSpaceEnumMap = {
  Mpeg2ColorSpace.auto: 'AUTO',
  Mpeg2ColorSpace.passthrough: 'PASSTHROUGH',
};

const _$Mpeg2DisplayRatioEnumMap = {
  Mpeg2DisplayRatio.displayratio16x9: 'DISPLAYRATIO16X9',
  Mpeg2DisplayRatio.displayratio4x3: 'DISPLAYRATIO4X3',
};

const _$Mpeg2GopSizeUnitsEnumMap = {
  Mpeg2GopSizeUnits.frames: 'FRAMES',
  Mpeg2GopSizeUnits.seconds: 'SECONDS',
};

const _$Mpeg2ScanTypeEnumMap = {
  Mpeg2ScanType.interlaced: 'INTERLACED',
  Mpeg2ScanType.progressive: 'PROGRESSIVE',
};

const _$Mpeg2SubGopLengthEnumMap = {
  Mpeg2SubGopLength.dynamic: 'DYNAMIC',
  Mpeg2SubGopLength.fixed: 'FIXED',
};

const _$Mpeg2TimecodeInsertionBehaviorEnumMap = {
  Mpeg2TimecodeInsertionBehavior.disabled: 'DISABLED',
  Mpeg2TimecodeInsertionBehavior.gopTimecode: 'GOP_TIMECODE',
};

MsSmoothGroupSettings _$MsSmoothGroupSettingsFromJson(
    Map<String, dynamic> json) {
  return MsSmoothGroupSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
    acquisitionPointId: json['acquisitionPointId'] as String,
    audioOnlyTimecodeControl: _$enumDecodeNullable(
        _$SmoothGroupAudioOnlyTimecodeControlEnumMap,
        json['audioOnlyTimecodeControl']),
    certificateMode: _$enumDecodeNullable(
        _$SmoothGroupCertificateModeEnumMap, json['certificateMode']),
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    eventId: json['eventId'] as String,
    eventIdMode: _$enumDecodeNullable(
        _$SmoothGroupEventIdModeEnumMap, json['eventIdMode']),
    eventStopBehavior: _$enumDecodeNullable(
        _$SmoothGroupEventStopBehaviorEnumMap, json['eventStopBehavior']),
    filecacheDuration: json['filecacheDuration'] as int,
    fragmentLength: json['fragmentLength'] as int,
    inputLossAction: _$enumDecodeNullable(
        _$InputLossActionForMsSmoothOutEnumMap, json['inputLossAction']),
    numRetries: json['numRetries'] as int,
    restartDelay: json['restartDelay'] as int,
    segmentationMode: _$enumDecodeNullable(
        _$SmoothGroupSegmentationModeEnumMap, json['segmentationMode']),
    sendDelayMs: json['sendDelayMs'] as int,
    sparseTrackType: _$enumDecodeNullable(
        _$SmoothGroupSparseTrackTypeEnumMap, json['sparseTrackType']),
    streamManifestBehavior: _$enumDecodeNullable(
        _$SmoothGroupStreamManifestBehaviorEnumMap,
        json['streamManifestBehavior']),
    timestampOffset: json['timestampOffset'] as String,
    timestampOffsetMode: _$enumDecodeNullable(
        _$SmoothGroupTimestampOffsetModeEnumMap, json['timestampOffsetMode']),
  );
}

Map<String, dynamic> _$MsSmoothGroupSettingsToJson(
    MsSmoothGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('acquisitionPointId', instance.acquisitionPointId);
  writeNotNull(
      'audioOnlyTimecodeControl',
      _$SmoothGroupAudioOnlyTimecodeControlEnumMap[
          instance.audioOnlyTimecodeControl]);
  writeNotNull('certificateMode',
      _$SmoothGroupCertificateModeEnumMap[instance.certificateMode]);
  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('eventId', instance.eventId);
  writeNotNull(
      'eventIdMode', _$SmoothGroupEventIdModeEnumMap[instance.eventIdMode]);
  writeNotNull('eventStopBehavior',
      _$SmoothGroupEventStopBehaviorEnumMap[instance.eventStopBehavior]);
  writeNotNull('filecacheDuration', instance.filecacheDuration);
  writeNotNull('fragmentLength', instance.fragmentLength);
  writeNotNull('inputLossAction',
      _$InputLossActionForMsSmoothOutEnumMap[instance.inputLossAction]);
  writeNotNull('numRetries', instance.numRetries);
  writeNotNull('restartDelay', instance.restartDelay);
  writeNotNull('segmentationMode',
      _$SmoothGroupSegmentationModeEnumMap[instance.segmentationMode]);
  writeNotNull('sendDelayMs', instance.sendDelayMs);
  writeNotNull('sparseTrackType',
      _$SmoothGroupSparseTrackTypeEnumMap[instance.sparseTrackType]);
  writeNotNull(
      'streamManifestBehavior',
      _$SmoothGroupStreamManifestBehaviorEnumMap[
          instance.streamManifestBehavior]);
  writeNotNull('timestampOffset', instance.timestampOffset);
  writeNotNull('timestampOffsetMode',
      _$SmoothGroupTimestampOffsetModeEnumMap[instance.timestampOffsetMode]);
  return val;
}

const _$SmoothGroupAudioOnlyTimecodeControlEnumMap = {
  SmoothGroupAudioOnlyTimecodeControl.passthrough: 'PASSTHROUGH',
  SmoothGroupAudioOnlyTimecodeControl.useConfiguredClock:
      'USE_CONFIGURED_CLOCK',
};

const _$SmoothGroupCertificateModeEnumMap = {
  SmoothGroupCertificateMode.selfSigned: 'SELF_SIGNED',
  SmoothGroupCertificateMode.verifyAuthenticity: 'VERIFY_AUTHENTICITY',
};

const _$SmoothGroupEventIdModeEnumMap = {
  SmoothGroupEventIdMode.noEventId: 'NO_EVENT_ID',
  SmoothGroupEventIdMode.useConfigured: 'USE_CONFIGURED',
  SmoothGroupEventIdMode.useTimestamp: 'USE_TIMESTAMP',
};

const _$SmoothGroupEventStopBehaviorEnumMap = {
  SmoothGroupEventStopBehavior.none: 'NONE',
  SmoothGroupEventStopBehavior.sendEos: 'SEND_EOS',
};

const _$InputLossActionForMsSmoothOutEnumMap = {
  InputLossActionForMsSmoothOut.emitOutput: 'EMIT_OUTPUT',
  InputLossActionForMsSmoothOut.pauseOutput: 'PAUSE_OUTPUT',
};

const _$SmoothGroupSegmentationModeEnumMap = {
  SmoothGroupSegmentationMode.useInputSegmentation: 'USE_INPUT_SEGMENTATION',
  SmoothGroupSegmentationMode.useSegmentDuration: 'USE_SEGMENT_DURATION',
};

const _$SmoothGroupSparseTrackTypeEnumMap = {
  SmoothGroupSparseTrackType.none: 'NONE',
  SmoothGroupSparseTrackType.scte_35: 'SCTE_35',
  SmoothGroupSparseTrackType.scte_35WithoutSegmentation:
      'SCTE_35_WITHOUT_SEGMENTATION',
};

const _$SmoothGroupStreamManifestBehaviorEnumMap = {
  SmoothGroupStreamManifestBehavior.doNotSend: 'DO_NOT_SEND',
  SmoothGroupStreamManifestBehavior.send: 'SEND',
};

const _$SmoothGroupTimestampOffsetModeEnumMap = {
  SmoothGroupTimestampOffsetMode.useConfiguredOffset: 'USE_CONFIGURED_OFFSET',
  SmoothGroupTimestampOffsetMode.useEventStartDate: 'USE_EVENT_START_DATE',
};

MsSmoothOutputSettings _$MsSmoothOutputSettingsFromJson(
    Map<String, dynamic> json) {
  return MsSmoothOutputSettings(
    h265PackagingType: _$enumDecodeNullable(
        _$MsSmoothH265PackagingTypeEnumMap, json['h265PackagingType']),
    nameModifier: json['nameModifier'] as String,
  );
}

Map<String, dynamic> _$MsSmoothOutputSettingsToJson(
    MsSmoothOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('h265PackagingType',
      _$MsSmoothH265PackagingTypeEnumMap[instance.h265PackagingType]);
  writeNotNull('nameModifier', instance.nameModifier);
  return val;
}

const _$MsSmoothH265PackagingTypeEnumMap = {
  MsSmoothH265PackagingType.hev1: 'HEV1',
  MsSmoothH265PackagingType.hvc1: 'HVC1',
};

Multiplex _$MultiplexFromJson(Map<String, dynamic> json) {
  return Multiplex(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

MultiplexGroupSettings _$MultiplexGroupSettingsFromJson(
    Map<String, dynamic> json) {
  return MultiplexGroupSettings();
}

Map<String, dynamic> _$MultiplexGroupSettingsToJson(
        MultiplexGroupSettings instance) =>
    <String, dynamic>{};

MultiplexMediaConnectOutputDestinationSettings
    _$MultiplexMediaConnectOutputDestinationSettingsFromJson(
        Map<String, dynamic> json) {
  return MultiplexMediaConnectOutputDestinationSettings(
    entitlementArn: json['entitlementArn'] as String,
  );
}

MultiplexOutputDestination _$MultiplexOutputDestinationFromJson(
    Map<String, dynamic> json) {
  return MultiplexOutputDestination(
    mediaConnectSettings: json['mediaConnectSettings'] == null
        ? null
        : MultiplexMediaConnectOutputDestinationSettings.fromJson(
            json['mediaConnectSettings'] as Map<String, dynamic>),
  );
}

MultiplexOutputSettings _$MultiplexOutputSettingsFromJson(
    Map<String, dynamic> json) {
  return MultiplexOutputSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MultiplexOutputSettingsToJson(
    MultiplexOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  return val;
}

MultiplexProgram _$MultiplexProgramFromJson(Map<String, dynamic> json) {
  return MultiplexProgram(
    channelId: json['channelId'] as String,
    multiplexProgramSettings: json['multiplexProgramSettings'] == null
        ? null
        : MultiplexProgramSettings.fromJson(
            json['multiplexProgramSettings'] as Map<String, dynamic>),
    packetIdentifiersMap: json['packetIdentifiersMap'] == null
        ? null
        : MultiplexProgramPacketIdentifiersMap.fromJson(
            json['packetIdentifiersMap'] as Map<String, dynamic>),
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexProgramPipelineDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    programName: json['programName'] as String,
  );
}

MultiplexProgramChannelDestinationSettings
    _$MultiplexProgramChannelDestinationSettingsFromJson(
        Map<String, dynamic> json) {
  return MultiplexProgramChannelDestinationSettings(
    multiplexId: json['multiplexId'] as String,
    programName: json['programName'] as String,
  );
}

Map<String, dynamic> _$MultiplexProgramChannelDestinationSettingsToJson(
    MultiplexProgramChannelDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('multiplexId', instance.multiplexId);
  writeNotNull('programName', instance.programName);
  return val;
}

MultiplexProgramPacketIdentifiersMap
    _$MultiplexProgramPacketIdentifiersMapFromJson(Map<String, dynamic> json) {
  return MultiplexProgramPacketIdentifiersMap(
    audioPids: (json['audioPids'] as List)?.map((e) => e as int)?.toList(),
    dvbSubPids: (json['dvbSubPids'] as List)?.map((e) => e as int)?.toList(),
    dvbTeletextPid: json['dvbTeletextPid'] as int,
    etvPlatformPid: json['etvPlatformPid'] as int,
    etvSignalPid: json['etvSignalPid'] as int,
    klvDataPids: (json['klvDataPids'] as List)?.map((e) => e as int)?.toList(),
    pcrPid: json['pcrPid'] as int,
    pmtPid: json['pmtPid'] as int,
    privateMetadataPid: json['privateMetadataPid'] as int,
    scte27Pids: (json['scte27Pids'] as List)?.map((e) => e as int)?.toList(),
    scte35Pid: json['scte35Pid'] as int,
    timedMetadataPid: json['timedMetadataPid'] as int,
    videoPid: json['videoPid'] as int,
  );
}

MultiplexProgramPipelineDetail _$MultiplexProgramPipelineDetailFromJson(
    Map<String, dynamic> json) {
  return MultiplexProgramPipelineDetail(
    activeChannelPipeline: json['activeChannelPipeline'] as String,
    pipelineId: json['pipelineId'] as String,
  );
}

MultiplexProgramServiceDescriptor _$MultiplexProgramServiceDescriptorFromJson(
    Map<String, dynamic> json) {
  return MultiplexProgramServiceDescriptor(
    providerName: json['providerName'] as String,
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$MultiplexProgramServiceDescriptorToJson(
    MultiplexProgramServiceDescriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('providerName', instance.providerName);
  writeNotNull('serviceName', instance.serviceName);
  return val;
}

MultiplexProgramSettings _$MultiplexProgramSettingsFromJson(
    Map<String, dynamic> json) {
  return MultiplexProgramSettings(
    programNumber: json['programNumber'] as int,
    preferredChannelPipeline: _$enumDecodeNullable(
        _$PreferredChannelPipelineEnumMap, json['preferredChannelPipeline']),
    serviceDescriptor: json['serviceDescriptor'] == null
        ? null
        : MultiplexProgramServiceDescriptor.fromJson(
            json['serviceDescriptor'] as Map<String, dynamic>),
    videoSettings: json['videoSettings'] == null
        ? null
        : MultiplexVideoSettings.fromJson(
            json['videoSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MultiplexProgramSettingsToJson(
    MultiplexProgramSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('preferredChannelPipeline',
      _$PreferredChannelPipelineEnumMap[instance.preferredChannelPipeline]);
  writeNotNull('serviceDescriptor', instance.serviceDescriptor?.toJson());
  writeNotNull('videoSettings', instance.videoSettings?.toJson());
  return val;
}

const _$PreferredChannelPipelineEnumMap = {
  PreferredChannelPipeline.currentlyActive: 'CURRENTLY_ACTIVE',
  PreferredChannelPipeline.pipeline_0: 'PIPELINE_0',
  PreferredChannelPipeline.pipeline_1: 'PIPELINE_1',
};

MultiplexProgramSummary _$MultiplexProgramSummaryFromJson(
    Map<String, dynamic> json) {
  return MultiplexProgramSummary(
    channelId: json['channelId'] as String,
    programName: json['programName'] as String,
  );
}

MultiplexSettings _$MultiplexSettingsFromJson(Map<String, dynamic> json) {
  return MultiplexSettings(
    transportStreamBitrate: json['transportStreamBitrate'] as int,
    transportStreamId: json['transportStreamId'] as int,
    maximumVideoBufferDelayMilliseconds:
        json['maximumVideoBufferDelayMilliseconds'] as int,
    transportStreamReservedBitrate:
        json['transportStreamReservedBitrate'] as int,
  );
}

Map<String, dynamic> _$MultiplexSettingsToJson(MultiplexSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transportStreamBitrate', instance.transportStreamBitrate);
  writeNotNull('transportStreamId', instance.transportStreamId);
  writeNotNull('maximumVideoBufferDelayMilliseconds',
      instance.maximumVideoBufferDelayMilliseconds);
  writeNotNull('transportStreamReservedBitrate',
      instance.transportStreamReservedBitrate);
  return val;
}

MultiplexSettingsSummary _$MultiplexSettingsSummaryFromJson(
    Map<String, dynamic> json) {
  return MultiplexSettingsSummary(
    transportStreamBitrate: json['transportStreamBitrate'] as int,
  );
}

MultiplexStatmuxVideoSettings _$MultiplexStatmuxVideoSettingsFromJson(
    Map<String, dynamic> json) {
  return MultiplexStatmuxVideoSettings(
    maximumBitrate: json['maximumBitrate'] as int,
    minimumBitrate: json['minimumBitrate'] as int,
    priority: json['priority'] as int,
  );
}

Map<String, dynamic> _$MultiplexStatmuxVideoSettingsToJson(
    MultiplexStatmuxVideoSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maximumBitrate', instance.maximumBitrate);
  writeNotNull('minimumBitrate', instance.minimumBitrate);
  writeNotNull('priority', instance.priority);
  return val;
}

MultiplexSummary _$MultiplexSummaryFromJson(Map<String, dynamic> json) {
  return MultiplexSummary(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettingsSummary.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

MultiplexVideoSettings _$MultiplexVideoSettingsFromJson(
    Map<String, dynamic> json) {
  return MultiplexVideoSettings(
    constantBitrate: json['constantBitrate'] as int,
    statmuxSettings: json['statmuxSettings'] == null
        ? null
        : MultiplexStatmuxVideoSettings.fromJson(
            json['statmuxSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MultiplexVideoSettingsToJson(
    MultiplexVideoSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('constantBitrate', instance.constantBitrate);
  writeNotNull('statmuxSettings', instance.statmuxSettings?.toJson());
  return val;
}

NetworkInputSettings _$NetworkInputSettingsFromJson(Map<String, dynamic> json) {
  return NetworkInputSettings(
    hlsInputSettings: json['hlsInputSettings'] == null
        ? null
        : HlsInputSettings.fromJson(
            json['hlsInputSettings'] as Map<String, dynamic>),
    serverValidation: _$enumDecodeNullable(
        _$NetworkInputServerValidationEnumMap, json['serverValidation']),
  );
}

Map<String, dynamic> _$NetworkInputSettingsToJson(
    NetworkInputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hlsInputSettings', instance.hlsInputSettings?.toJson());
  writeNotNull('serverValidation',
      _$NetworkInputServerValidationEnumMap[instance.serverValidation]);
  return val;
}

const _$NetworkInputServerValidationEnumMap = {
  NetworkInputServerValidation.checkCryptographyAndValidateName:
      'CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME',
  NetworkInputServerValidation.checkCryptographyOnly: 'CHECK_CRYPTOGRAPHY_ONLY',
};

NielsenConfiguration _$NielsenConfigurationFromJson(Map<String, dynamic> json) {
  return NielsenConfiguration(
    distributorId: json['distributorId'] as String,
    nielsenPcmToId3Tagging: _$enumDecodeNullable(
        _$NielsenPcmToId3TaggingStateEnumMap, json['nielsenPcmToId3Tagging']),
  );
}

Map<String, dynamic> _$NielsenConfigurationToJson(
    NielsenConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('distributorId', instance.distributorId);
  writeNotNull('nielsenPcmToId3Tagging',
      _$NielsenPcmToId3TaggingStateEnumMap[instance.nielsenPcmToId3Tagging]);
  return val;
}

const _$NielsenPcmToId3TaggingStateEnumMap = {
  NielsenPcmToId3TaggingState.disabled: 'DISABLED',
  NielsenPcmToId3TaggingState.enabled: 'ENABLED',
};

Offering _$OfferingFromJson(Map<String, dynamic> json) {
  return Offering(
    arn: json['arn'] as String,
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits: _$enumDecodeNullable(
        _$OfferingDurationUnitsEnumMap, json['durationUnits']),
    fixedPrice: (json['fixedPrice'] as num)?.toDouble(),
    offeringDescription: json['offeringDescription'] as String,
    offeringId: json['offeringId'] as String,
    offeringType:
        _$enumDecodeNullable(_$OfferingTypeEnumMap, json['offeringType']),
    region: json['region'] as String,
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ReservationResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    usagePrice: (json['usagePrice'] as num)?.toDouble(),
  );
}

Output _$OutputFromJson(Map<String, dynamic> json) {
  return Output(
    outputSettings: json['outputSettings'] == null
        ? null
        : OutputSettings.fromJson(
            json['outputSettings'] as Map<String, dynamic>),
    audioDescriptionNames: (json['audioDescriptionNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    captionDescriptionNames: (json['captionDescriptionNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    outputName: json['outputName'] as String,
    videoDescriptionName: json['videoDescriptionName'] as String,
  );
}

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('outputSettings', instance.outputSettings?.toJson());
  writeNotNull('audioDescriptionNames', instance.audioDescriptionNames);
  writeNotNull('captionDescriptionNames', instance.captionDescriptionNames);
  writeNotNull('outputName', instance.outputName);
  writeNotNull('videoDescriptionName', instance.videoDescriptionName);
  return val;
}

OutputDestination _$OutputDestinationFromJson(Map<String, dynamic> json) {
  return OutputDestination(
    id: json['id'] as String,
    mediaPackageSettings: (json['mediaPackageSettings'] as List)
        ?.map((e) => e == null
            ? null
            : MediaPackageOutputDestinationSettings.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexProgramChannelDestinationSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    settings: (json['settings'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestinationSettings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OutputDestinationToJson(OutputDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('mediaPackageSettings',
      instance.mediaPackageSettings?.map((e) => e?.toJson())?.toList());
  writeNotNull('multiplexSettings', instance.multiplexSettings?.toJson());
  writeNotNull(
      'settings', instance.settings?.map((e) => e?.toJson())?.toList());
  return val;
}

OutputDestinationSettings _$OutputDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return OutputDestinationSettings(
    passwordParam: json['passwordParam'] as String,
    streamName: json['streamName'] as String,
    url: json['url'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$OutputDestinationSettingsToJson(
    OutputDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('passwordParam', instance.passwordParam);
  writeNotNull('streamName', instance.streamName);
  writeNotNull('url', instance.url);
  writeNotNull('username', instance.username);
  return val;
}

OutputGroup _$OutputGroupFromJson(Map<String, dynamic> json) {
  return OutputGroup(
    outputGroupSettings: json['outputGroupSettings'] == null
        ? null
        : OutputGroupSettings.fromJson(
            json['outputGroupSettings'] as Map<String, dynamic>),
    outputs: (json['outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OutputGroupToJson(OutputGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('outputGroupSettings', instance.outputGroupSettings?.toJson());
  writeNotNull('outputs', instance.outputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('name', instance.name);
  return val;
}

OutputGroupSettings _$OutputGroupSettingsFromJson(Map<String, dynamic> json) {
  return OutputGroupSettings(
    archiveGroupSettings: json['archiveGroupSettings'] == null
        ? null
        : ArchiveGroupSettings.fromJson(
            json['archiveGroupSettings'] as Map<String, dynamic>),
    frameCaptureGroupSettings: json['frameCaptureGroupSettings'] == null
        ? null
        : FrameCaptureGroupSettings.fromJson(
            json['frameCaptureGroupSettings'] as Map<String, dynamic>),
    hlsGroupSettings: json['hlsGroupSettings'] == null
        ? null
        : HlsGroupSettings.fromJson(
            json['hlsGroupSettings'] as Map<String, dynamic>),
    mediaPackageGroupSettings: json['mediaPackageGroupSettings'] == null
        ? null
        : MediaPackageGroupSettings.fromJson(
            json['mediaPackageGroupSettings'] as Map<String, dynamic>),
    msSmoothGroupSettings: json['msSmoothGroupSettings'] == null
        ? null
        : MsSmoothGroupSettings.fromJson(
            json['msSmoothGroupSettings'] as Map<String, dynamic>),
    multiplexGroupSettings: json['multiplexGroupSettings'] == null
        ? null
        : MultiplexGroupSettings.fromJson(
            json['multiplexGroupSettings'] as Map<String, dynamic>),
    rtmpGroupSettings: json['rtmpGroupSettings'] == null
        ? null
        : RtmpGroupSettings.fromJson(
            json['rtmpGroupSettings'] as Map<String, dynamic>),
    udpGroupSettings: json['udpGroupSettings'] == null
        ? null
        : UdpGroupSettings.fromJson(
            json['udpGroupSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputGroupSettingsToJson(OutputGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('archiveGroupSettings', instance.archiveGroupSettings?.toJson());
  writeNotNull('frameCaptureGroupSettings',
      instance.frameCaptureGroupSettings?.toJson());
  writeNotNull('hlsGroupSettings', instance.hlsGroupSettings?.toJson());
  writeNotNull('mediaPackageGroupSettings',
      instance.mediaPackageGroupSettings?.toJson());
  writeNotNull(
      'msSmoothGroupSettings', instance.msSmoothGroupSettings?.toJson());
  writeNotNull(
      'multiplexGroupSettings', instance.multiplexGroupSettings?.toJson());
  writeNotNull('rtmpGroupSettings', instance.rtmpGroupSettings?.toJson());
  writeNotNull('udpGroupSettings', instance.udpGroupSettings?.toJson());
  return val;
}

OutputLocationRef _$OutputLocationRefFromJson(Map<String, dynamic> json) {
  return OutputLocationRef(
    destinationRefId: json['destinationRefId'] as String,
  );
}

Map<String, dynamic> _$OutputLocationRefToJson(OutputLocationRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationRefId', instance.destinationRefId);
  return val;
}

OutputSettings _$OutputSettingsFromJson(Map<String, dynamic> json) {
  return OutputSettings(
    archiveOutputSettings: json['archiveOutputSettings'] == null
        ? null
        : ArchiveOutputSettings.fromJson(
            json['archiveOutputSettings'] as Map<String, dynamic>),
    frameCaptureOutputSettings: json['frameCaptureOutputSettings'] == null
        ? null
        : FrameCaptureOutputSettings.fromJson(
            json['frameCaptureOutputSettings'] as Map<String, dynamic>),
    hlsOutputSettings: json['hlsOutputSettings'] == null
        ? null
        : HlsOutputSettings.fromJson(
            json['hlsOutputSettings'] as Map<String, dynamic>),
    mediaPackageOutputSettings: json['mediaPackageOutputSettings'] == null
        ? null
        : MediaPackageOutputSettings.fromJson(
            json['mediaPackageOutputSettings'] as Map<String, dynamic>),
    msSmoothOutputSettings: json['msSmoothOutputSettings'] == null
        ? null
        : MsSmoothOutputSettings.fromJson(
            json['msSmoothOutputSettings'] as Map<String, dynamic>),
    multiplexOutputSettings: json['multiplexOutputSettings'] == null
        ? null
        : MultiplexOutputSettings.fromJson(
            json['multiplexOutputSettings'] as Map<String, dynamic>),
    rtmpOutputSettings: json['rtmpOutputSettings'] == null
        ? null
        : RtmpOutputSettings.fromJson(
            json['rtmpOutputSettings'] as Map<String, dynamic>),
    udpOutputSettings: json['udpOutputSettings'] == null
        ? null
        : UdpOutputSettings.fromJson(
            json['udpOutputSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputSettingsToJson(OutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'archiveOutputSettings', instance.archiveOutputSettings?.toJson());
  writeNotNull('frameCaptureOutputSettings',
      instance.frameCaptureOutputSettings?.toJson());
  writeNotNull('hlsOutputSettings', instance.hlsOutputSettings?.toJson());
  writeNotNull('mediaPackageOutputSettings',
      instance.mediaPackageOutputSettings?.toJson());
  writeNotNull(
      'msSmoothOutputSettings', instance.msSmoothOutputSettings?.toJson());
  writeNotNull(
      'multiplexOutputSettings', instance.multiplexOutputSettings?.toJson());
  writeNotNull('rtmpOutputSettings', instance.rtmpOutputSettings?.toJson());
  writeNotNull('udpOutputSettings', instance.udpOutputSettings?.toJson());
  return val;
}

PassThroughSettings _$PassThroughSettingsFromJson(Map<String, dynamic> json) {
  return PassThroughSettings();
}

Map<String, dynamic> _$PassThroughSettingsToJson(
        PassThroughSettings instance) =>
    <String, dynamic>{};

PauseStateScheduleActionSettings _$PauseStateScheduleActionSettingsFromJson(
    Map<String, dynamic> json) {
  return PauseStateScheduleActionSettings(
    pipelines: (json['pipelines'] as List)
        ?.map((e) => e == null
            ? null
            : PipelinePauseStateSettings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PauseStateScheduleActionSettingsToJson(
    PauseStateScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'pipelines', instance.pipelines?.map((e) => e?.toJson())?.toList());
  return val;
}

PipelineDetail _$PipelineDetailFromJson(Map<String, dynamic> json) {
  return PipelineDetail(
    activeInputAttachmentName: json['activeInputAttachmentName'] as String,
    activeInputSwitchActionName: json['activeInputSwitchActionName'] as String,
    pipelineId: json['pipelineId'] as String,
  );
}

PipelinePauseStateSettings _$PipelinePauseStateSettingsFromJson(
    Map<String, dynamic> json) {
  return PipelinePauseStateSettings(
    pipelineId: _$enumDecodeNullable(_$PipelineIdEnumMap, json['pipelineId']),
  );
}

Map<String, dynamic> _$PipelinePauseStateSettingsToJson(
    PipelinePauseStateSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', _$PipelineIdEnumMap[instance.pipelineId]);
  return val;
}

const _$PipelineIdEnumMap = {
  PipelineId.pipeline_0: 'PIPELINE_0',
  PipelineId.pipeline_1: 'PIPELINE_1',
};

PurchaseOfferingResponse _$PurchaseOfferingResponseFromJson(
    Map<String, dynamic> json) {
  return PurchaseOfferingResponse(
    reservation: json['reservation'] == null
        ? null
        : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
  );
}

RawSettings _$RawSettingsFromJson(Map<String, dynamic> json) {
  return RawSettings();
}

Map<String, dynamic> _$RawSettingsToJson(RawSettings instance) =>
    <String, dynamic>{};

Rec601Settings _$Rec601SettingsFromJson(Map<String, dynamic> json) {
  return Rec601Settings();
}

Map<String, dynamic> _$Rec601SettingsToJson(Rec601Settings instance) =>
    <String, dynamic>{};

Rec709Settings _$Rec709SettingsFromJson(Map<String, dynamic> json) {
  return Rec709Settings();
}

Map<String, dynamic> _$Rec709SettingsToJson(Rec709Settings instance) =>
    <String, dynamic>{};

RejectInputDeviceTransferResponse _$RejectInputDeviceTransferResponseFromJson(
    Map<String, dynamic> json) {
  return RejectInputDeviceTransferResponse();
}

RemixSettings _$RemixSettingsFromJson(Map<String, dynamic> json) {
  return RemixSettings(
    channelMappings: (json['channelMappings'] as List)
        ?.map((e) => e == null
            ? null
            : AudioChannelMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    channelsIn: json['channelsIn'] as int,
    channelsOut: json['channelsOut'] as int,
  );
}

Map<String, dynamic> _$RemixSettingsToJson(RemixSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channelMappings',
      instance.channelMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('channelsIn', instance.channelsIn);
  writeNotNull('channelsOut', instance.channelsOut);
  return val;
}

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation(
    arn: json['arn'] as String,
    count: json['count'] as int,
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits: _$enumDecodeNullable(
        _$OfferingDurationUnitsEnumMap, json['durationUnits']),
    end: json['end'] as String,
    fixedPrice: (json['fixedPrice'] as num)?.toDouble(),
    name: json['name'] as String,
    offeringDescription: json['offeringDescription'] as String,
    offeringId: json['offeringId'] as String,
    offeringType:
        _$enumDecodeNullable(_$OfferingTypeEnumMap, json['offeringType']),
    region: json['region'] as String,
    reservationId: json['reservationId'] as String,
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ReservationResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    start: json['start'] as String,
    state: _$enumDecodeNullable(_$ReservationStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    usagePrice: (json['usagePrice'] as num)?.toDouble(),
  );
}

ReservationResourceSpecification _$ReservationResourceSpecificationFromJson(
    Map<String, dynamic> json) {
  return ReservationResourceSpecification(
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    codec: _$enumDecodeNullable(_$ReservationCodecEnumMap, json['codec']),
    maximumBitrate: _$enumDecodeNullable(
        _$ReservationMaximumBitrateEnumMap, json['maximumBitrate']),
    maximumFramerate: _$enumDecodeNullable(
        _$ReservationMaximumFramerateEnumMap, json['maximumFramerate']),
    resolution: _$enumDecodeNullable(
        _$ReservationResolutionEnumMap, json['resolution']),
    resourceType: _$enumDecodeNullable(
        _$ReservationResourceTypeEnumMap, json['resourceType']),
    specialFeature: _$enumDecodeNullable(
        _$ReservationSpecialFeatureEnumMap, json['specialFeature']),
    videoQuality: _$enumDecodeNullable(
        _$ReservationVideoQualityEnumMap, json['videoQuality']),
  );
}

const _$ReservationCodecEnumMap = {
  ReservationCodec.mpeg2: 'MPEG2',
  ReservationCodec.avc: 'AVC',
  ReservationCodec.hevc: 'HEVC',
  ReservationCodec.audio: 'AUDIO',
  ReservationCodec.link: 'LINK',
};

const _$ReservationMaximumBitrateEnumMap = {
  ReservationMaximumBitrate.max_10Mbps: 'MAX_10_MBPS',
  ReservationMaximumBitrate.max_20Mbps: 'MAX_20_MBPS',
  ReservationMaximumBitrate.max_50Mbps: 'MAX_50_MBPS',
};

const _$ReservationMaximumFramerateEnumMap = {
  ReservationMaximumFramerate.max_30Fps: 'MAX_30_FPS',
  ReservationMaximumFramerate.max_60Fps: 'MAX_60_FPS',
};

const _$ReservationResolutionEnumMap = {
  ReservationResolution.sd: 'SD',
  ReservationResolution.hd: 'HD',
  ReservationResolution.fhd: 'FHD',
  ReservationResolution.uhd: 'UHD',
};

const _$ReservationResourceTypeEnumMap = {
  ReservationResourceType.input: 'INPUT',
  ReservationResourceType.output: 'OUTPUT',
  ReservationResourceType.multiplex: 'MULTIPLEX',
  ReservationResourceType.channel: 'CHANNEL',
};

const _$ReservationSpecialFeatureEnumMap = {
  ReservationSpecialFeature.advancedAudio: 'ADVANCED_AUDIO',
  ReservationSpecialFeature.audioNormalization: 'AUDIO_NORMALIZATION',
};

const _$ReservationVideoQualityEnumMap = {
  ReservationVideoQuality.standard: 'STANDARD',
  ReservationVideoQuality.enhanced: 'ENHANCED',
  ReservationVideoQuality.premium: 'PREMIUM',
};

RtmpCaptionInfoDestinationSettings _$RtmpCaptionInfoDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return RtmpCaptionInfoDestinationSettings();
}

Map<String, dynamic> _$RtmpCaptionInfoDestinationSettingsToJson(
        RtmpCaptionInfoDestinationSettings instance) =>
    <String, dynamic>{};

RtmpGroupSettings _$RtmpGroupSettingsFromJson(Map<String, dynamic> json) {
  return RtmpGroupSettings(
    adMarkers: (json['adMarkers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$RtmpAdMarkersEnumMap, e))
        ?.toList(),
    authenticationScheme: _$enumDecodeNullable(
        _$AuthenticationSchemeEnumMap, json['authenticationScheme']),
    cacheFullBehavior: _$enumDecodeNullable(
        _$RtmpCacheFullBehaviorEnumMap, json['cacheFullBehavior']),
    cacheLength: json['cacheLength'] as int,
    captionData:
        _$enumDecodeNullable(_$RtmpCaptionDataEnumMap, json['captionData']),
    inputLossAction: _$enumDecodeNullable(
        _$InputLossActionForRtmpOutEnumMap, json['inputLossAction']),
    restartDelay: json['restartDelay'] as int,
  );
}

Map<String, dynamic> _$RtmpGroupSettingsToJson(RtmpGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adMarkers',
      instance.adMarkers?.map((e) => _$RtmpAdMarkersEnumMap[e])?.toList());
  writeNotNull('authenticationScheme',
      _$AuthenticationSchemeEnumMap[instance.authenticationScheme]);
  writeNotNull('cacheFullBehavior',
      _$RtmpCacheFullBehaviorEnumMap[instance.cacheFullBehavior]);
  writeNotNull('cacheLength', instance.cacheLength);
  writeNotNull('captionData', _$RtmpCaptionDataEnumMap[instance.captionData]);
  writeNotNull('inputLossAction',
      _$InputLossActionForRtmpOutEnumMap[instance.inputLossAction]);
  writeNotNull('restartDelay', instance.restartDelay);
  return val;
}

const _$RtmpAdMarkersEnumMap = {
  RtmpAdMarkers.onCuePointScte35: 'ON_CUE_POINT_SCTE35',
};

const _$AuthenticationSchemeEnumMap = {
  AuthenticationScheme.akamai: 'AKAMAI',
  AuthenticationScheme.common: 'COMMON',
};

const _$RtmpCacheFullBehaviorEnumMap = {
  RtmpCacheFullBehavior.disconnectImmediately: 'DISCONNECT_IMMEDIATELY',
  RtmpCacheFullBehavior.waitForServer: 'WAIT_FOR_SERVER',
};

const _$RtmpCaptionDataEnumMap = {
  RtmpCaptionData.all: 'ALL',
  RtmpCaptionData.field1_608: 'FIELD1_608',
  RtmpCaptionData.field1AndField2_608: 'FIELD1_AND_FIELD2_608',
};

const _$InputLossActionForRtmpOutEnumMap = {
  InputLossActionForRtmpOut.emitOutput: 'EMIT_OUTPUT',
  InputLossActionForRtmpOut.pauseOutput: 'PAUSE_OUTPUT',
};

RtmpOutputSettings _$RtmpOutputSettingsFromJson(Map<String, dynamic> json) {
  return RtmpOutputSettings(
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
    certificateMode: _$enumDecodeNullable(
        _$RtmpOutputCertificateModeEnumMap, json['certificateMode']),
    connectionRetryInterval: json['connectionRetryInterval'] as int,
    numRetries: json['numRetries'] as int,
  );
}

Map<String, dynamic> _$RtmpOutputSettingsToJson(RtmpOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('certificateMode',
      _$RtmpOutputCertificateModeEnumMap[instance.certificateMode]);
  writeNotNull('connectionRetryInterval', instance.connectionRetryInterval);
  writeNotNull('numRetries', instance.numRetries);
  return val;
}

const _$RtmpOutputCertificateModeEnumMap = {
  RtmpOutputCertificateMode.selfSigned: 'SELF_SIGNED',
  RtmpOutputCertificateMode.verifyAuthenticity: 'VERIFY_AUTHENTICITY',
};

ScheduleAction _$ScheduleActionFromJson(Map<String, dynamic> json) {
  return ScheduleAction(
    actionName: json['actionName'] as String,
    scheduleActionSettings: json['scheduleActionSettings'] == null
        ? null
        : ScheduleActionSettings.fromJson(
            json['scheduleActionSettings'] as Map<String, dynamic>),
    scheduleActionStartSettings: json['scheduleActionStartSettings'] == null
        ? null
        : ScheduleActionStartSettings.fromJson(
            json['scheduleActionStartSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScheduleActionToJson(ScheduleAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actionName', instance.actionName);
  writeNotNull(
      'scheduleActionSettings', instance.scheduleActionSettings?.toJson());
  writeNotNull('scheduleActionStartSettings',
      instance.scheduleActionStartSettings?.toJson());
  return val;
}

ScheduleActionSettings _$ScheduleActionSettingsFromJson(
    Map<String, dynamic> json) {
  return ScheduleActionSettings(
    hlsId3SegmentTaggingSettings: json['hlsId3SegmentTaggingSettings'] == null
        ? null
        : HlsId3SegmentTaggingScheduleActionSettings.fromJson(
            json['hlsId3SegmentTaggingSettings'] as Map<String, dynamic>),
    hlsTimedMetadataSettings: json['hlsTimedMetadataSettings'] == null
        ? null
        : HlsTimedMetadataScheduleActionSettings.fromJson(
            json['hlsTimedMetadataSettings'] as Map<String, dynamic>),
    inputPrepareSettings: json['inputPrepareSettings'] == null
        ? null
        : InputPrepareScheduleActionSettings.fromJson(
            json['inputPrepareSettings'] as Map<String, dynamic>),
    inputSwitchSettings: json['inputSwitchSettings'] == null
        ? null
        : InputSwitchScheduleActionSettings.fromJson(
            json['inputSwitchSettings'] as Map<String, dynamic>),
    pauseStateSettings: json['pauseStateSettings'] == null
        ? null
        : PauseStateScheduleActionSettings.fromJson(
            json['pauseStateSettings'] as Map<String, dynamic>),
    scte35ReturnToNetworkSettings: json['scte35ReturnToNetworkSettings'] == null
        ? null
        : Scte35ReturnToNetworkScheduleActionSettings.fromJson(
            json['scte35ReturnToNetworkSettings'] as Map<String, dynamic>),
    scte35SpliceInsertSettings: json['scte35SpliceInsertSettings'] == null
        ? null
        : Scte35SpliceInsertScheduleActionSettings.fromJson(
            json['scte35SpliceInsertSettings'] as Map<String, dynamic>),
    scte35TimeSignalSettings: json['scte35TimeSignalSettings'] == null
        ? null
        : Scte35TimeSignalScheduleActionSettings.fromJson(
            json['scte35TimeSignalSettings'] as Map<String, dynamic>),
    staticImageActivateSettings: json['staticImageActivateSettings'] == null
        ? null
        : StaticImageActivateScheduleActionSettings.fromJson(
            json['staticImageActivateSettings'] as Map<String, dynamic>),
    staticImageDeactivateSettings: json['staticImageDeactivateSettings'] == null
        ? null
        : StaticImageDeactivateScheduleActionSettings.fromJson(
            json['staticImageDeactivateSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScheduleActionSettingsToJson(
    ScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hlsId3SegmentTaggingSettings',
      instance.hlsId3SegmentTaggingSettings?.toJson());
  writeNotNull(
      'hlsTimedMetadataSettings', instance.hlsTimedMetadataSettings?.toJson());
  writeNotNull('inputPrepareSettings', instance.inputPrepareSettings?.toJson());
  writeNotNull('inputSwitchSettings', instance.inputSwitchSettings?.toJson());
  writeNotNull('pauseStateSettings', instance.pauseStateSettings?.toJson());
  writeNotNull('scte35ReturnToNetworkSettings',
      instance.scte35ReturnToNetworkSettings?.toJson());
  writeNotNull('scte35SpliceInsertSettings',
      instance.scte35SpliceInsertSettings?.toJson());
  writeNotNull(
      'scte35TimeSignalSettings', instance.scte35TimeSignalSettings?.toJson());
  writeNotNull('staticImageActivateSettings',
      instance.staticImageActivateSettings?.toJson());
  writeNotNull('staticImageDeactivateSettings',
      instance.staticImageDeactivateSettings?.toJson());
  return val;
}

ScheduleActionStartSettings _$ScheduleActionStartSettingsFromJson(
    Map<String, dynamic> json) {
  return ScheduleActionStartSettings(
    fixedModeScheduleActionStartSettings:
        json['fixedModeScheduleActionStartSettings'] == null
            ? null
            : FixedModeScheduleActionStartSettings.fromJson(
                json['fixedModeScheduleActionStartSettings']
                    as Map<String, dynamic>),
    followModeScheduleActionStartSettings:
        json['followModeScheduleActionStartSettings'] == null
            ? null
            : FollowModeScheduleActionStartSettings.fromJson(
                json['followModeScheduleActionStartSettings']
                    as Map<String, dynamic>),
    immediateModeScheduleActionStartSettings:
        json['immediateModeScheduleActionStartSettings'] == null
            ? null
            : ImmediateModeScheduleActionStartSettings.fromJson(
                json['immediateModeScheduleActionStartSettings']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScheduleActionStartSettingsToJson(
    ScheduleActionStartSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fixedModeScheduleActionStartSettings',
      instance.fixedModeScheduleActionStartSettings?.toJson());
  writeNotNull('followModeScheduleActionStartSettings',
      instance.followModeScheduleActionStartSettings?.toJson());
  writeNotNull('immediateModeScheduleActionStartSettings',
      instance.immediateModeScheduleActionStartSettings?.toJson());
  return val;
}

Scte20PlusEmbeddedDestinationSettings
    _$Scte20PlusEmbeddedDestinationSettingsFromJson(Map<String, dynamic> json) {
  return Scte20PlusEmbeddedDestinationSettings();
}

Map<String, dynamic> _$Scte20PlusEmbeddedDestinationSettingsToJson(
        Scte20PlusEmbeddedDestinationSettings instance) =>
    <String, dynamic>{};

Scte20SourceSettings _$Scte20SourceSettingsFromJson(Map<String, dynamic> json) {
  return Scte20SourceSettings(
    convert608To708: _$enumDecodeNullable(
        _$Scte20Convert608To708EnumMap, json['convert608To708']),
    source608ChannelNumber: json['source608ChannelNumber'] as int,
  );
}

Map<String, dynamic> _$Scte20SourceSettingsToJson(
    Scte20SourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('convert608To708',
      _$Scte20Convert608To708EnumMap[instance.convert608To708]);
  writeNotNull('source608ChannelNumber', instance.source608ChannelNumber);
  return val;
}

const _$Scte20Convert608To708EnumMap = {
  Scte20Convert608To708.disabled: 'DISABLED',
  Scte20Convert608To708.upconvert: 'UPCONVERT',
};

Scte27DestinationSettings _$Scte27DestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return Scte27DestinationSettings();
}

Map<String, dynamic> _$Scte27DestinationSettingsToJson(
        Scte27DestinationSettings instance) =>
    <String, dynamic>{};

Scte27SourceSettings _$Scte27SourceSettingsFromJson(Map<String, dynamic> json) {
  return Scte27SourceSettings(
    pid: json['pid'] as int,
  );
}

Map<String, dynamic> _$Scte27SourceSettingsToJson(
    Scte27SourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pid', instance.pid);
  return val;
}

Scte35DeliveryRestrictions _$Scte35DeliveryRestrictionsFromJson(
    Map<String, dynamic> json) {
  return Scte35DeliveryRestrictions(
    archiveAllowedFlag: _$enumDecodeNullable(
        _$Scte35ArchiveAllowedFlagEnumMap, json['archiveAllowedFlag']),
    deviceRestrictions: _$enumDecodeNullable(
        _$Scte35DeviceRestrictionsEnumMap, json['deviceRestrictions']),
    noRegionalBlackoutFlag: _$enumDecodeNullable(
        _$Scte35NoRegionalBlackoutFlagEnumMap, json['noRegionalBlackoutFlag']),
    webDeliveryAllowedFlag: _$enumDecodeNullable(
        _$Scte35WebDeliveryAllowedFlagEnumMap, json['webDeliveryAllowedFlag']),
  );
}

Map<String, dynamic> _$Scte35DeliveryRestrictionsToJson(
    Scte35DeliveryRestrictions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('archiveAllowedFlag',
      _$Scte35ArchiveAllowedFlagEnumMap[instance.archiveAllowedFlag]);
  writeNotNull('deviceRestrictions',
      _$Scte35DeviceRestrictionsEnumMap[instance.deviceRestrictions]);
  writeNotNull('noRegionalBlackoutFlag',
      _$Scte35NoRegionalBlackoutFlagEnumMap[instance.noRegionalBlackoutFlag]);
  writeNotNull('webDeliveryAllowedFlag',
      _$Scte35WebDeliveryAllowedFlagEnumMap[instance.webDeliveryAllowedFlag]);
  return val;
}

const _$Scte35ArchiveAllowedFlagEnumMap = {
  Scte35ArchiveAllowedFlag.archiveNotAllowed: 'ARCHIVE_NOT_ALLOWED',
  Scte35ArchiveAllowedFlag.archiveAllowed: 'ARCHIVE_ALLOWED',
};

const _$Scte35DeviceRestrictionsEnumMap = {
  Scte35DeviceRestrictions.none: 'NONE',
  Scte35DeviceRestrictions.restrictGroup0: 'RESTRICT_GROUP0',
  Scte35DeviceRestrictions.restrictGroup1: 'RESTRICT_GROUP1',
  Scte35DeviceRestrictions.restrictGroup2: 'RESTRICT_GROUP2',
};

const _$Scte35NoRegionalBlackoutFlagEnumMap = {
  Scte35NoRegionalBlackoutFlag.regionalBlackout: 'REGIONAL_BLACKOUT',
  Scte35NoRegionalBlackoutFlag.noRegionalBlackout: 'NO_REGIONAL_BLACKOUT',
};

const _$Scte35WebDeliveryAllowedFlagEnumMap = {
  Scte35WebDeliveryAllowedFlag.webDeliveryNotAllowed:
      'WEB_DELIVERY_NOT_ALLOWED',
  Scte35WebDeliveryAllowedFlag.webDeliveryAllowed: 'WEB_DELIVERY_ALLOWED',
};

Scte35Descriptor _$Scte35DescriptorFromJson(Map<String, dynamic> json) {
  return Scte35Descriptor(
    scte35DescriptorSettings: json['scte35DescriptorSettings'] == null
        ? null
        : Scte35DescriptorSettings.fromJson(
            json['scte35DescriptorSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Scte35DescriptorToJson(Scte35Descriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'scte35DescriptorSettings', instance.scte35DescriptorSettings?.toJson());
  return val;
}

Scte35DescriptorSettings _$Scte35DescriptorSettingsFromJson(
    Map<String, dynamic> json) {
  return Scte35DescriptorSettings(
    segmentationDescriptorScte35DescriptorSettings:
        json['segmentationDescriptorScte35DescriptorSettings'] == null
            ? null
            : Scte35SegmentationDescriptor.fromJson(
                json['segmentationDescriptorScte35DescriptorSettings']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Scte35DescriptorSettingsToJson(
    Scte35DescriptorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('segmentationDescriptorScte35DescriptorSettings',
      instance.segmentationDescriptorScte35DescriptorSettings?.toJson());
  return val;
}

Scte35ReturnToNetworkScheduleActionSettings
    _$Scte35ReturnToNetworkScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return Scte35ReturnToNetworkScheduleActionSettings(
    spliceEventId: json['spliceEventId'] as int,
  );
}

Map<String, dynamic> _$Scte35ReturnToNetworkScheduleActionSettingsToJson(
    Scte35ReturnToNetworkScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spliceEventId', instance.spliceEventId);
  return val;
}

Scte35SegmentationDescriptor _$Scte35SegmentationDescriptorFromJson(
    Map<String, dynamic> json) {
  return Scte35SegmentationDescriptor(
    segmentationCancelIndicator: _$enumDecodeNullable(
        _$Scte35SegmentationCancelIndicatorEnumMap,
        json['segmentationCancelIndicator']),
    segmentationEventId: json['segmentationEventId'] as int,
    deliveryRestrictions: json['deliveryRestrictions'] == null
        ? null
        : Scte35DeliveryRestrictions.fromJson(
            json['deliveryRestrictions'] as Map<String, dynamic>),
    segmentNum: json['segmentNum'] as int,
    segmentationDuration: json['segmentationDuration'] as int,
    segmentationTypeId: json['segmentationTypeId'] as int,
    segmentationUpid: json['segmentationUpid'] as String,
    segmentationUpidType: json['segmentationUpidType'] as int,
    segmentsExpected: json['segmentsExpected'] as int,
    subSegmentNum: json['subSegmentNum'] as int,
    subSegmentsExpected: json['subSegmentsExpected'] as int,
  );
}

Map<String, dynamic> _$Scte35SegmentationDescriptorToJson(
    Scte35SegmentationDescriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'segmentationCancelIndicator',
      _$Scte35SegmentationCancelIndicatorEnumMap[
          instance.segmentationCancelIndicator]);
  writeNotNull('segmentationEventId', instance.segmentationEventId);
  writeNotNull('deliveryRestrictions', instance.deliveryRestrictions?.toJson());
  writeNotNull('segmentNum', instance.segmentNum);
  writeNotNull('segmentationDuration', instance.segmentationDuration);
  writeNotNull('segmentationTypeId', instance.segmentationTypeId);
  writeNotNull('segmentationUpid', instance.segmentationUpid);
  writeNotNull('segmentationUpidType', instance.segmentationUpidType);
  writeNotNull('segmentsExpected', instance.segmentsExpected);
  writeNotNull('subSegmentNum', instance.subSegmentNum);
  writeNotNull('subSegmentsExpected', instance.subSegmentsExpected);
  return val;
}

const _$Scte35SegmentationCancelIndicatorEnumMap = {
  Scte35SegmentationCancelIndicator.segmentationEventNotCanceled:
      'SEGMENTATION_EVENT_NOT_CANCELED',
  Scte35SegmentationCancelIndicator.segmentationEventCanceled:
      'SEGMENTATION_EVENT_CANCELED',
};

Scte35SpliceInsert _$Scte35SpliceInsertFromJson(Map<String, dynamic> json) {
  return Scte35SpliceInsert(
    adAvailOffset: json['adAvailOffset'] as int,
    noRegionalBlackoutFlag: _$enumDecodeNullable(
        _$Scte35SpliceInsertNoRegionalBlackoutBehaviorEnumMap,
        json['noRegionalBlackoutFlag']),
    webDeliveryAllowedFlag: _$enumDecodeNullable(
        _$Scte35SpliceInsertWebDeliveryAllowedBehaviorEnumMap,
        json['webDeliveryAllowedFlag']),
  );
}

Map<String, dynamic> _$Scte35SpliceInsertToJson(Scte35SpliceInsert instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adAvailOffset', instance.adAvailOffset);
  writeNotNull(
      'noRegionalBlackoutFlag',
      _$Scte35SpliceInsertNoRegionalBlackoutBehaviorEnumMap[
          instance.noRegionalBlackoutFlag]);
  writeNotNull(
      'webDeliveryAllowedFlag',
      _$Scte35SpliceInsertWebDeliveryAllowedBehaviorEnumMap[
          instance.webDeliveryAllowedFlag]);
  return val;
}

const _$Scte35SpliceInsertNoRegionalBlackoutBehaviorEnumMap = {
  Scte35SpliceInsertNoRegionalBlackoutBehavior.follow: 'FOLLOW',
  Scte35SpliceInsertNoRegionalBlackoutBehavior.ignore: 'IGNORE',
};

const _$Scte35SpliceInsertWebDeliveryAllowedBehaviorEnumMap = {
  Scte35SpliceInsertWebDeliveryAllowedBehavior.follow: 'FOLLOW',
  Scte35SpliceInsertWebDeliveryAllowedBehavior.ignore: 'IGNORE',
};

Scte35SpliceInsertScheduleActionSettings
    _$Scte35SpliceInsertScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return Scte35SpliceInsertScheduleActionSettings(
    spliceEventId: json['spliceEventId'] as int,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$Scte35SpliceInsertScheduleActionSettingsToJson(
    Scte35SpliceInsertScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spliceEventId', instance.spliceEventId);
  writeNotNull('duration', instance.duration);
  return val;
}

Scte35TimeSignalApos _$Scte35TimeSignalAposFromJson(Map<String, dynamic> json) {
  return Scte35TimeSignalApos(
    adAvailOffset: json['adAvailOffset'] as int,
    noRegionalBlackoutFlag: _$enumDecodeNullable(
        _$Scte35AposNoRegionalBlackoutBehaviorEnumMap,
        json['noRegionalBlackoutFlag']),
    webDeliveryAllowedFlag: _$enumDecodeNullable(
        _$Scte35AposWebDeliveryAllowedBehaviorEnumMap,
        json['webDeliveryAllowedFlag']),
  );
}

Map<String, dynamic> _$Scte35TimeSignalAposToJson(
    Scte35TimeSignalApos instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adAvailOffset', instance.adAvailOffset);
  writeNotNull(
      'noRegionalBlackoutFlag',
      _$Scte35AposNoRegionalBlackoutBehaviorEnumMap[
          instance.noRegionalBlackoutFlag]);
  writeNotNull(
      'webDeliveryAllowedFlag',
      _$Scte35AposWebDeliveryAllowedBehaviorEnumMap[
          instance.webDeliveryAllowedFlag]);
  return val;
}

const _$Scte35AposNoRegionalBlackoutBehaviorEnumMap = {
  Scte35AposNoRegionalBlackoutBehavior.follow: 'FOLLOW',
  Scte35AposNoRegionalBlackoutBehavior.ignore: 'IGNORE',
};

const _$Scte35AposWebDeliveryAllowedBehaviorEnumMap = {
  Scte35AposWebDeliveryAllowedBehavior.follow: 'FOLLOW',
  Scte35AposWebDeliveryAllowedBehavior.ignore: 'IGNORE',
};

Scte35TimeSignalScheduleActionSettings
    _$Scte35TimeSignalScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return Scte35TimeSignalScheduleActionSettings(
    scte35Descriptors: (json['scte35Descriptors'] as List)
        ?.map((e) => e == null
            ? null
            : Scte35Descriptor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Scte35TimeSignalScheduleActionSettingsToJson(
    Scte35TimeSignalScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scte35Descriptors',
      instance.scte35Descriptors?.map((e) => e?.toJson())?.toList());
  return val;
}

SmpteTtDestinationSettings _$SmpteTtDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return SmpteTtDestinationSettings();
}

Map<String, dynamic> _$SmpteTtDestinationSettingsToJson(
        SmpteTtDestinationSettings instance) =>
    <String, dynamic>{};

StandardHlsSettings _$StandardHlsSettingsFromJson(Map<String, dynamic> json) {
  return StandardHlsSettings(
    m3u8Settings: json['m3u8Settings'] == null
        ? null
        : M3u8Settings.fromJson(json['m3u8Settings'] as Map<String, dynamic>),
    audioRenditionSets: json['audioRenditionSets'] as String,
  );
}

Map<String, dynamic> _$StandardHlsSettingsToJson(StandardHlsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('m3u8Settings', instance.m3u8Settings?.toJson());
  writeNotNull('audioRenditionSets', instance.audioRenditionSets);
  return val;
}

StartChannelResponse _$StartChannelResponseFromJson(Map<String, dynamic> json) {
  return StartChannelResponse(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encoderSettings: json['encoderSettings'] == null
        ? null
        : EncoderSettings.fromJson(
            json['encoderSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StartMultiplexResponse _$StartMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return StartMultiplexResponse(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StartTimecode _$StartTimecodeFromJson(Map<String, dynamic> json) {
  return StartTimecode(
    timecode: json['timecode'] as String,
  );
}

Map<String, dynamic> _$StartTimecodeToJson(StartTimecode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timecode', instance.timecode);
  return val;
}

StaticImageActivateScheduleActionSettings
    _$StaticImageActivateScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return StaticImageActivateScheduleActionSettings(
    image: json['image'] == null
        ? null
        : InputLocation.fromJson(json['image'] as Map<String, dynamic>),
    duration: json['duration'] as int,
    fadeIn: json['fadeIn'] as int,
    fadeOut: json['fadeOut'] as int,
    height: json['height'] as int,
    imageX: json['imageX'] as int,
    imageY: json['imageY'] as int,
    layer: json['layer'] as int,
    opacity: json['opacity'] as int,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$StaticImageActivateScheduleActionSettingsToJson(
    StaticImageActivateScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image?.toJson());
  writeNotNull('duration', instance.duration);
  writeNotNull('fadeIn', instance.fadeIn);
  writeNotNull('fadeOut', instance.fadeOut);
  writeNotNull('height', instance.height);
  writeNotNull('imageX', instance.imageX);
  writeNotNull('imageY', instance.imageY);
  writeNotNull('layer', instance.layer);
  writeNotNull('opacity', instance.opacity);
  writeNotNull('width', instance.width);
  return val;
}

StaticImageDeactivateScheduleActionSettings
    _$StaticImageDeactivateScheduleActionSettingsFromJson(
        Map<String, dynamic> json) {
  return StaticImageDeactivateScheduleActionSettings(
    fadeOut: json['fadeOut'] as int,
    layer: json['layer'] as int,
  );
}

Map<String, dynamic> _$StaticImageDeactivateScheduleActionSettingsToJson(
    StaticImageDeactivateScheduleActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fadeOut', instance.fadeOut);
  writeNotNull('layer', instance.layer);
  return val;
}

StaticKeySettings _$StaticKeySettingsFromJson(Map<String, dynamic> json) {
  return StaticKeySettings(
    staticKeyValue: json['staticKeyValue'] as String,
    keyProviderServer: json['keyProviderServer'] == null
        ? null
        : InputLocation.fromJson(
            json['keyProviderServer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StaticKeySettingsToJson(StaticKeySettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('staticKeyValue', instance.staticKeyValue);
  writeNotNull('keyProviderServer', instance.keyProviderServer?.toJson());
  return val;
}

StopChannelResponse _$StopChannelResponseFromJson(Map<String, dynamic> json) {
  return StopChannelResponse(
    arn: json['arn'] as String,
    cdiInputSpecification: json['cdiInputSpecification'] == null
        ? null
        : CdiInputSpecification.fromJson(
            json['cdiInputSpecification'] as Map<String, dynamic>),
    channelClass:
        _$enumDecodeNullable(_$ChannelClassEnumMap, json['channelClass']),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encoderSettings: json['encoderSettings'] == null
        ? null
        : EncoderSettings.fromJson(
            json['encoderSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    inputAttachments: (json['inputAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : InputAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputSpecification: json['inputSpecification'] == null
        ? null
        : InputSpecification.fromJson(
            json['inputSpecification'] as Map<String, dynamic>),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    name: json['name'] as String,
    pipelineDetails: (json['pipelineDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    roleArn: json['roleArn'] as String,
    state: _$enumDecodeNullable(_$ChannelStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StopMultiplexResponse _$StopMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return StopMultiplexResponse(
    arn: json['arn'] as String,
    availabilityZones:
        (json['availabilityZones'] as List)?.map((e) => e as String)?.toList(),
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    multiplexSettings: json['multiplexSettings'] == null
        ? null
        : MultiplexSettings.fromJson(
            json['multiplexSettings'] as Map<String, dynamic>),
    name: json['name'] as String,
    pipelinesRunningCount: json['pipelinesRunningCount'] as int,
    programCount: json['programCount'] as int,
    state: _$enumDecodeNullable(_$MultiplexStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StopTimecode _$StopTimecodeFromJson(Map<String, dynamic> json) {
  return StopTimecode(
    lastFrameClippingBehavior: _$enumDecodeNullable(
        _$LastFrameClippingBehaviorEnumMap, json['lastFrameClippingBehavior']),
    timecode: json['timecode'] as String,
  );
}

Map<String, dynamic> _$StopTimecodeToJson(StopTimecode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lastFrameClippingBehavior',
      _$LastFrameClippingBehaviorEnumMap[instance.lastFrameClippingBehavior]);
  writeNotNull('timecode', instance.timecode);
  return val;
}

const _$LastFrameClippingBehaviorEnumMap = {
  LastFrameClippingBehavior.excludeLastFrame: 'EXCLUDE_LAST_FRAME',
  LastFrameClippingBehavior.includeLastFrame: 'INCLUDE_LAST_FRAME',
};

TeletextDestinationSettings _$TeletextDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return TeletextDestinationSettings();
}

Map<String, dynamic> _$TeletextDestinationSettingsToJson(
        TeletextDestinationSettings instance) =>
    <String, dynamic>{};

TeletextSourceSettings _$TeletextSourceSettingsFromJson(
    Map<String, dynamic> json) {
  return TeletextSourceSettings(
    pageNumber: json['pageNumber'] as String,
  );
}

Map<String, dynamic> _$TeletextSourceSettingsToJson(
    TeletextSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pageNumber', instance.pageNumber);
  return val;
}

TemporalFilterSettings _$TemporalFilterSettingsFromJson(
    Map<String, dynamic> json) {
  return TemporalFilterSettings(
    postFilterSharpening: _$enumDecodeNullable(
        _$TemporalFilterPostFilterSharpeningEnumMap,
        json['postFilterSharpening']),
    strength:
        _$enumDecodeNullable(_$TemporalFilterStrengthEnumMap, json['strength']),
  );
}

Map<String, dynamic> _$TemporalFilterSettingsToJson(
    TemporalFilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'postFilterSharpening',
      _$TemporalFilterPostFilterSharpeningEnumMap[
          instance.postFilterSharpening]);
  writeNotNull('strength', _$TemporalFilterStrengthEnumMap[instance.strength]);
  return val;
}

const _$TemporalFilterPostFilterSharpeningEnumMap = {
  TemporalFilterPostFilterSharpening.auto: 'AUTO',
  TemporalFilterPostFilterSharpening.disabled: 'DISABLED',
  TemporalFilterPostFilterSharpening.enabled: 'ENABLED',
};

const _$TemporalFilterStrengthEnumMap = {
  TemporalFilterStrength.auto: 'AUTO',
  TemporalFilterStrength.strength_1: 'STRENGTH_1',
  TemporalFilterStrength.strength_2: 'STRENGTH_2',
  TemporalFilterStrength.strength_3: 'STRENGTH_3',
  TemporalFilterStrength.strength_4: 'STRENGTH_4',
  TemporalFilterStrength.strength_5: 'STRENGTH_5',
  TemporalFilterStrength.strength_6: 'STRENGTH_6',
  TemporalFilterStrength.strength_7: 'STRENGTH_7',
  TemporalFilterStrength.strength_8: 'STRENGTH_8',
  TemporalFilterStrength.strength_9: 'STRENGTH_9',
  TemporalFilterStrength.strength_10: 'STRENGTH_10',
  TemporalFilterStrength.strength_11: 'STRENGTH_11',
  TemporalFilterStrength.strength_12: 'STRENGTH_12',
  TemporalFilterStrength.strength_13: 'STRENGTH_13',
  TemporalFilterStrength.strength_14: 'STRENGTH_14',
  TemporalFilterStrength.strength_15: 'STRENGTH_15',
  TemporalFilterStrength.strength_16: 'STRENGTH_16',
};

TimecodeConfig _$TimecodeConfigFromJson(Map<String, dynamic> json) {
  return TimecodeConfig(
    source: _$enumDecodeNullable(_$TimecodeConfigSourceEnumMap, json['source']),
    syncThreshold: json['syncThreshold'] as int,
  );
}

Map<String, dynamic> _$TimecodeConfigToJson(TimecodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', _$TimecodeConfigSourceEnumMap[instance.source]);
  writeNotNull('syncThreshold', instance.syncThreshold);
  return val;
}

const _$TimecodeConfigSourceEnumMap = {
  TimecodeConfigSource.embedded: 'EMBEDDED',
  TimecodeConfigSource.systemclock: 'SYSTEMCLOCK',
  TimecodeConfigSource.zerobased: 'ZEROBASED',
};

TransferInputDeviceResponse _$TransferInputDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return TransferInputDeviceResponse();
}

TransferringInputDeviceSummary _$TransferringInputDeviceSummaryFromJson(
    Map<String, dynamic> json) {
  return TransferringInputDeviceSummary(
    id: json['id'] as String,
    message: json['message'] as String,
    targetCustomerId: json['targetCustomerId'] as String,
    transferType: _$enumDecodeNullable(
        _$InputDeviceTransferTypeEnumMap, json['transferType']),
  );
}

const _$InputDeviceTransferTypeEnumMap = {
  InputDeviceTransferType.outgoing: 'OUTGOING',
  InputDeviceTransferType.incoming: 'INCOMING',
};

TtmlDestinationSettings _$TtmlDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return TtmlDestinationSettings(
    styleControl: _$enumDecodeNullable(
        _$TtmlDestinationStyleControlEnumMap, json['styleControl']),
  );
}

Map<String, dynamic> _$TtmlDestinationSettingsToJson(
    TtmlDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('styleControl',
      _$TtmlDestinationStyleControlEnumMap[instance.styleControl]);
  return val;
}

const _$TtmlDestinationStyleControlEnumMap = {
  TtmlDestinationStyleControl.passthrough: 'PASSTHROUGH',
  TtmlDestinationStyleControl.useConfigured: 'USE_CONFIGURED',
};

UdpContainerSettings _$UdpContainerSettingsFromJson(Map<String, dynamic> json) {
  return UdpContainerSettings(
    m2tsSettings: json['m2tsSettings'] == null
        ? null
        : M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UdpContainerSettingsToJson(
    UdpContainerSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('m2tsSettings', instance.m2tsSettings?.toJson());
  return val;
}

UdpGroupSettings _$UdpGroupSettingsFromJson(Map<String, dynamic> json) {
  return UdpGroupSettings(
    inputLossAction: _$enumDecodeNullable(
        _$InputLossActionForUdpOutEnumMap, json['inputLossAction']),
    timedMetadataId3Frame: _$enumDecodeNullable(
        _$UdpTimedMetadataId3FrameEnumMap, json['timedMetadataId3Frame']),
    timedMetadataId3Period: json['timedMetadataId3Period'] as int,
  );
}

Map<String, dynamic> _$UdpGroupSettingsToJson(UdpGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputLossAction',
      _$InputLossActionForUdpOutEnumMap[instance.inputLossAction]);
  writeNotNull('timedMetadataId3Frame',
      _$UdpTimedMetadataId3FrameEnumMap[instance.timedMetadataId3Frame]);
  writeNotNull('timedMetadataId3Period', instance.timedMetadataId3Period);
  return val;
}

const _$InputLossActionForUdpOutEnumMap = {
  InputLossActionForUdpOut.dropProgram: 'DROP_PROGRAM',
  InputLossActionForUdpOut.dropTs: 'DROP_TS',
  InputLossActionForUdpOut.emitProgram: 'EMIT_PROGRAM',
};

const _$UdpTimedMetadataId3FrameEnumMap = {
  UdpTimedMetadataId3Frame.none: 'NONE',
  UdpTimedMetadataId3Frame.priv: 'PRIV',
  UdpTimedMetadataId3Frame.tdrl: 'TDRL',
};

UdpOutputSettings _$UdpOutputSettingsFromJson(Map<String, dynamic> json) {
  return UdpOutputSettings(
    containerSettings: json['containerSettings'] == null
        ? null
        : UdpContainerSettings.fromJson(
            json['containerSettings'] as Map<String, dynamic>),
    destination: json['destination'] == null
        ? null
        : OutputLocationRef.fromJson(
            json['destination'] as Map<String, dynamic>),
    bufferMsec: json['bufferMsec'] as int,
    fecOutputSettings: json['fecOutputSettings'] == null
        ? null
        : FecOutputSettings.fromJson(
            json['fecOutputSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UdpOutputSettingsToJson(UdpOutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerSettings', instance.containerSettings?.toJson());
  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('bufferMsec', instance.bufferMsec);
  writeNotNull('fecOutputSettings', instance.fecOutputSettings?.toJson());
  return val;
}

UpdateChannelClassResponse _$UpdateChannelClassResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelClassResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}

UpdateChannelResponse _$UpdateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}

UpdateInputDeviceResponse _$UpdateInputDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateInputDeviceResponse(
    arn: json['arn'] as String,
    connectionState: _$enumDecodeNullable(
        _$InputDeviceConnectionStateEnumMap, json['connectionState']),
    deviceSettingsSyncState: _$enumDecodeNullable(
        _$DeviceSettingsSyncStateEnumMap, json['deviceSettingsSyncState']),
    deviceUpdateStatus: _$enumDecodeNullable(
        _$DeviceUpdateStatusEnumMap, json['deviceUpdateStatus']),
    hdDeviceSettings: json['hdDeviceSettings'] == null
        ? null
        : InputDeviceHdSettings.fromJson(
            json['hdDeviceSettings'] as Map<String, dynamic>),
    id: json['id'] as String,
    macAddress: json['macAddress'] as String,
    name: json['name'] as String,
    networkSettings: json['networkSettings'] == null
        ? null
        : InputDeviceNetworkSettings.fromJson(
            json['networkSettings'] as Map<String, dynamic>),
    serialNumber: json['serialNumber'] as String,
    type: _$enumDecodeNullable(_$InputDeviceTypeEnumMap, json['type']),
    uhdDeviceSettings: json['uhdDeviceSettings'] == null
        ? null
        : InputDeviceUhdSettings.fromJson(
            json['uhdDeviceSettings'] as Map<String, dynamic>),
  );
}

UpdateInputResponse _$UpdateInputResponseFromJson(Map<String, dynamic> json) {
  return UpdateInputResponse(
    input: json['input'] == null
        ? null
        : Input.fromJson(json['input'] as Map<String, dynamic>),
  );
}

UpdateInputSecurityGroupResponse _$UpdateInputSecurityGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateInputSecurityGroupResponse(
    securityGroup: json['securityGroup'] == null
        ? null
        : InputSecurityGroup.fromJson(
            json['securityGroup'] as Map<String, dynamic>),
  );
}

UpdateMultiplexProgramResponse _$UpdateMultiplexProgramResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMultiplexProgramResponse(
    multiplexProgram: json['multiplexProgram'] == null
        ? null
        : MultiplexProgram.fromJson(
            json['multiplexProgram'] as Map<String, dynamic>),
  );
}

UpdateMultiplexResponse _$UpdateMultiplexResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMultiplexResponse(
    multiplex: json['multiplex'] == null
        ? null
        : Multiplex.fromJson(json['multiplex'] as Map<String, dynamic>),
  );
}

UpdateReservationResponse _$UpdateReservationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateReservationResponse(
    reservation: json['reservation'] == null
        ? null
        : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
  );
}

VideoBlackFailoverSettings _$VideoBlackFailoverSettingsFromJson(
    Map<String, dynamic> json) {
  return VideoBlackFailoverSettings(
    blackDetectThreshold: (json['blackDetectThreshold'] as num)?.toDouble(),
    videoBlackThresholdMsec: json['videoBlackThresholdMsec'] as int,
  );
}

Map<String, dynamic> _$VideoBlackFailoverSettingsToJson(
    VideoBlackFailoverSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('blackDetectThreshold', instance.blackDetectThreshold);
  writeNotNull('videoBlackThresholdMsec', instance.videoBlackThresholdMsec);
  return val;
}

VideoCodecSettings _$VideoCodecSettingsFromJson(Map<String, dynamic> json) {
  return VideoCodecSettings(
    frameCaptureSettings: json['frameCaptureSettings'] == null
        ? null
        : FrameCaptureSettings.fromJson(
            json['frameCaptureSettings'] as Map<String, dynamic>),
    h264Settings: json['h264Settings'] == null
        ? null
        : H264Settings.fromJson(json['h264Settings'] as Map<String, dynamic>),
    h265Settings: json['h265Settings'] == null
        ? null
        : H265Settings.fromJson(json['h265Settings'] as Map<String, dynamic>),
    mpeg2Settings: json['mpeg2Settings'] == null
        ? null
        : Mpeg2Settings.fromJson(json['mpeg2Settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoCodecSettingsToJson(VideoCodecSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('frameCaptureSettings', instance.frameCaptureSettings?.toJson());
  writeNotNull('h264Settings', instance.h264Settings?.toJson());
  writeNotNull('h265Settings', instance.h265Settings?.toJson());
  writeNotNull('mpeg2Settings', instance.mpeg2Settings?.toJson());
  return val;
}

VideoDescription _$VideoDescriptionFromJson(Map<String, dynamic> json) {
  return VideoDescription(
    name: json['name'] as String,
    codecSettings: json['codecSettings'] == null
        ? null
        : VideoCodecSettings.fromJson(
            json['codecSettings'] as Map<String, dynamic>),
    height: json['height'] as int,
    respondToAfd: _$enumDecodeNullable(
        _$VideoDescriptionRespondToAfdEnumMap, json['respondToAfd']),
    scalingBehavior: _$enumDecodeNullable(
        _$VideoDescriptionScalingBehaviorEnumMap, json['scalingBehavior']),
    sharpness: json['sharpness'] as int,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$VideoDescriptionToJson(VideoDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('codecSettings', instance.codecSettings?.toJson());
  writeNotNull('height', instance.height);
  writeNotNull('respondToAfd',
      _$VideoDescriptionRespondToAfdEnumMap[instance.respondToAfd]);
  writeNotNull('scalingBehavior',
      _$VideoDescriptionScalingBehaviorEnumMap[instance.scalingBehavior]);
  writeNotNull('sharpness', instance.sharpness);
  writeNotNull('width', instance.width);
  return val;
}

const _$VideoDescriptionRespondToAfdEnumMap = {
  VideoDescriptionRespondToAfd.none: 'NONE',
  VideoDescriptionRespondToAfd.passthrough: 'PASSTHROUGH',
  VideoDescriptionRespondToAfd.respond: 'RESPOND',
};

const _$VideoDescriptionScalingBehaviorEnumMap = {
  VideoDescriptionScalingBehavior.$default: 'DEFAULT',
  VideoDescriptionScalingBehavior.stretchToOutput: 'STRETCH_TO_OUTPUT',
};

VideoSelector _$VideoSelectorFromJson(Map<String, dynamic> json) {
  return VideoSelector(
    colorSpace: _$enumDecodeNullable(
        _$VideoSelectorColorSpaceEnumMap, json['colorSpace']),
    colorSpaceUsage: _$enumDecodeNullable(
        _$VideoSelectorColorSpaceUsageEnumMap, json['colorSpaceUsage']),
    selectorSettings: json['selectorSettings'] == null
        ? null
        : VideoSelectorSettings.fromJson(
            json['selectorSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoSelectorToJson(VideoSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'colorSpace', _$VideoSelectorColorSpaceEnumMap[instance.colorSpace]);
  writeNotNull('colorSpaceUsage',
      _$VideoSelectorColorSpaceUsageEnumMap[instance.colorSpaceUsage]);
  writeNotNull('selectorSettings', instance.selectorSettings?.toJson());
  return val;
}

const _$VideoSelectorColorSpaceEnumMap = {
  VideoSelectorColorSpace.follow: 'FOLLOW',
  VideoSelectorColorSpace.rec_601: 'REC_601',
  VideoSelectorColorSpace.rec_709: 'REC_709',
};

const _$VideoSelectorColorSpaceUsageEnumMap = {
  VideoSelectorColorSpaceUsage.fallback: 'FALLBACK',
  VideoSelectorColorSpaceUsage.force: 'FORCE',
};

VideoSelectorPid _$VideoSelectorPidFromJson(Map<String, dynamic> json) {
  return VideoSelectorPid(
    pid: json['pid'] as int,
  );
}

Map<String, dynamic> _$VideoSelectorPidToJson(VideoSelectorPid instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pid', instance.pid);
  return val;
}

VideoSelectorProgramId _$VideoSelectorProgramIdFromJson(
    Map<String, dynamic> json) {
  return VideoSelectorProgramId(
    programId: json['programId'] as int,
  );
}

Map<String, dynamic> _$VideoSelectorProgramIdToJson(
    VideoSelectorProgramId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('programId', instance.programId);
  return val;
}

VideoSelectorSettings _$VideoSelectorSettingsFromJson(
    Map<String, dynamic> json) {
  return VideoSelectorSettings(
    videoSelectorPid: json['videoSelectorPid'] == null
        ? null
        : VideoSelectorPid.fromJson(
            json['videoSelectorPid'] as Map<String, dynamic>),
    videoSelectorProgramId: json['videoSelectorProgramId'] == null
        ? null
        : VideoSelectorProgramId.fromJson(
            json['videoSelectorProgramId'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoSelectorSettingsToJson(
    VideoSelectorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('videoSelectorPid', instance.videoSelectorPid?.toJson());
  writeNotNull(
      'videoSelectorProgramId', instance.videoSelectorProgramId?.toJson());
  return val;
}

WavSettings _$WavSettingsFromJson(Map<String, dynamic> json) {
  return WavSettings(
    bitDepth: (json['bitDepth'] as num)?.toDouble(),
    codingMode:
        _$enumDecodeNullable(_$WavCodingModeEnumMap, json['codingMode']),
    sampleRate: (json['sampleRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WavSettingsToJson(WavSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitDepth', instance.bitDepth);
  writeNotNull('codingMode', _$WavCodingModeEnumMap[instance.codingMode]);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

const _$WavCodingModeEnumMap = {
  WavCodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  WavCodingMode.codingMode_2_0: 'CODING_MODE_2_0',
  WavCodingMode.codingMode_4_0: 'CODING_MODE_4_0',
  WavCodingMode.codingMode_8_0: 'CODING_MODE_8_0',
};

WebvttDestinationSettings _$WebvttDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return WebvttDestinationSettings();
}

Map<String, dynamic> _$WebvttDestinationSettingsToJson(
        WebvttDestinationSettings instance) =>
    <String, dynamic>{};
