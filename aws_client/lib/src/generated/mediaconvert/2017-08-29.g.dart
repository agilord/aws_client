// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-08-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AacSettings _$AacSettingsFromJson(Map<String, dynamic> json) {
  return AacSettings(
    audioDescriptionBroadcasterMix: _$enumDecodeNullable(
        _$AacAudioDescriptionBroadcasterMixEnumMap,
        json['audioDescriptionBroadcasterMix']),
    bitrate: json['bitrate'] as int,
    codecProfile:
        _$enumDecodeNullable(_$AacCodecProfileEnumMap, json['codecProfile']),
    codingMode:
        _$enumDecodeNullable(_$AacCodingModeEnumMap, json['codingMode']),
    rateControlMode: _$enumDecodeNullable(
        _$AacRateControlModeEnumMap, json['rateControlMode']),
    rawFormat: _$enumDecodeNullable(_$AacRawFormatEnumMap, json['rawFormat']),
    sampleRate: json['sampleRate'] as int,
    specification:
        _$enumDecodeNullable(_$AacSpecificationEnumMap, json['specification']),
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

  writeNotNull(
      'audioDescriptionBroadcasterMix',
      _$AacAudioDescriptionBroadcasterMixEnumMap[
          instance.audioDescriptionBroadcasterMix]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codecProfile', _$AacCodecProfileEnumMap[instance.codecProfile]);
  writeNotNull('codingMode', _$AacCodingModeEnumMap[instance.codingMode]);
  writeNotNull(
      'rateControlMode', _$AacRateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('rawFormat', _$AacRawFormatEnumMap[instance.rawFormat]);
  writeNotNull('sampleRate', instance.sampleRate);
  writeNotNull(
      'specification', _$AacSpecificationEnumMap[instance.specification]);
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

const _$AacAudioDescriptionBroadcasterMixEnumMap = {
  AacAudioDescriptionBroadcasterMix.broadcasterMixedAd: 'BROADCASTER_MIXED_AD',
  AacAudioDescriptionBroadcasterMix.normal: 'NORMAL',
};

const _$AacCodecProfileEnumMap = {
  AacCodecProfile.lc: 'LC',
  AacCodecProfile.hev1: 'HEV1',
  AacCodecProfile.hev2: 'HEV2',
};

const _$AacCodingModeEnumMap = {
  AacCodingMode.adReceiverMix: 'AD_RECEIVER_MIX',
  AacCodingMode.codingMode_1_0: 'CODING_MODE_1_0',
  AacCodingMode.codingMode_1_1: 'CODING_MODE_1_1',
  AacCodingMode.codingMode_2_0: 'CODING_MODE_2_0',
  AacCodingMode.codingMode_5_1: 'CODING_MODE_5_1',
};

const _$AacRateControlModeEnumMap = {
  AacRateControlMode.cbr: 'CBR',
  AacRateControlMode.vbr: 'VBR',
};

const _$AacRawFormatEnumMap = {
  AacRawFormat.latmLoas: 'LATM_LOAS',
  AacRawFormat.none: 'NONE',
};

const _$AacSpecificationEnumMap = {
  AacSpecification.mpeg2: 'MPEG2',
  AacSpecification.mpeg4: 'MPEG4',
};

const _$AacVbrQualityEnumMap = {
  AacVbrQuality.low: 'LOW',
  AacVbrQuality.mediumLow: 'MEDIUM_LOW',
  AacVbrQuality.mediumHigh: 'MEDIUM_HIGH',
  AacVbrQuality.high: 'HIGH',
};

Ac3Settings _$Ac3SettingsFromJson(Map<String, dynamic> json) {
  return Ac3Settings(
    bitrate: json['bitrate'] as int,
    bitstreamMode:
        _$enumDecodeNullable(_$Ac3BitstreamModeEnumMap, json['bitstreamMode']),
    codingMode:
        _$enumDecodeNullable(_$Ac3CodingModeEnumMap, json['codingMode']),
    dialnorm: json['dialnorm'] as int,
    dynamicRangeCompressionProfile: _$enumDecodeNullable(
        _$Ac3DynamicRangeCompressionProfileEnumMap,
        json['dynamicRangeCompressionProfile']),
    lfeFilter: _$enumDecodeNullable(_$Ac3LfeFilterEnumMap, json['lfeFilter']),
    metadataControl: _$enumDecodeNullable(
        _$Ac3MetadataControlEnumMap, json['metadataControl']),
    sampleRate: json['sampleRate'] as int,
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
  writeNotNull(
      'dynamicRangeCompressionProfile',
      _$Ac3DynamicRangeCompressionProfileEnumMap[
          instance.dynamicRangeCompressionProfile]);
  writeNotNull('lfeFilter', _$Ac3LfeFilterEnumMap[instance.lfeFilter]);
  writeNotNull(
      'metadataControl', _$Ac3MetadataControlEnumMap[instance.metadataControl]);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

const _$Ac3BitstreamModeEnumMap = {
  Ac3BitstreamMode.completeMain: 'COMPLETE_MAIN',
  Ac3BitstreamMode.commentary: 'COMMENTARY',
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

const _$Ac3DynamicRangeCompressionProfileEnumMap = {
  Ac3DynamicRangeCompressionProfile.filmStandard: 'FILM_STANDARD',
  Ac3DynamicRangeCompressionProfile.none: 'NONE',
};

const _$Ac3LfeFilterEnumMap = {
  Ac3LfeFilter.enabled: 'ENABLED',
  Ac3LfeFilter.disabled: 'DISABLED',
};

const _$Ac3MetadataControlEnumMap = {
  Ac3MetadataControl.followInput: 'FOLLOW_INPUT',
  Ac3MetadataControl.useConfigured: 'USE_CONFIGURED',
};

AccelerationSettings _$AccelerationSettingsFromJson(Map<String, dynamic> json) {
  return AccelerationSettings(
    mode: _$enumDecodeNullable(_$AccelerationModeEnumMap, json['mode']),
  );
}

Map<String, dynamic> _$AccelerationSettingsToJson(
    AccelerationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mode', _$AccelerationModeEnumMap[instance.mode]);
  return val;
}

const _$AccelerationModeEnumMap = {
  AccelerationMode.disabled: 'DISABLED',
  AccelerationMode.enabled: 'ENABLED',
  AccelerationMode.preferred: 'PREFERRED',
};

AiffSettings _$AiffSettingsFromJson(Map<String, dynamic> json) {
  return AiffSettings(
    bitDepth: json['bitDepth'] as int,
    channels: json['channels'] as int,
    sampleRate: json['sampleRate'] as int,
  );
}

Map<String, dynamic> _$AiffSettingsToJson(AiffSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitDepth', instance.bitDepth);
  writeNotNull('channels', instance.channels);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

AncillarySourceSettings _$AncillarySourceSettingsFromJson(
    Map<String, dynamic> json) {
  return AncillarySourceSettings(
    convert608To708: _$enumDecodeNullable(
        _$AncillaryConvert608To708EnumMap, json['convert608To708']),
    sourceAncillaryChannelNumber: json['sourceAncillaryChannelNumber'] as int,
    terminateCaptions: _$enumDecodeNullable(
        _$AncillaryTerminateCaptionsEnumMap, json['terminateCaptions']),
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

  writeNotNull('convert608To708',
      _$AncillaryConvert608To708EnumMap[instance.convert608To708]);
  writeNotNull(
      'sourceAncillaryChannelNumber', instance.sourceAncillaryChannelNumber);
  writeNotNull('terminateCaptions',
      _$AncillaryTerminateCaptionsEnumMap[instance.terminateCaptions]);
  return val;
}

const _$AncillaryConvert608To708EnumMap = {
  AncillaryConvert608To708.upconvert: 'UPCONVERT',
  AncillaryConvert608To708.disabled: 'DISABLED',
};

const _$AncillaryTerminateCaptionsEnumMap = {
  AncillaryTerminateCaptions.endOfInput: 'END_OF_INPUT',
  AncillaryTerminateCaptions.disabled: 'DISABLED',
};

AssociateCertificateResponse _$AssociateCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateCertificateResponse();
}

AudioChannelTaggingSettings _$AudioChannelTaggingSettingsFromJson(
    Map<String, dynamic> json) {
  return AudioChannelTaggingSettings(
    channelTag:
        _$enumDecodeNullable(_$AudioChannelTagEnumMap, json['channelTag']),
  );
}

Map<String, dynamic> _$AudioChannelTaggingSettingsToJson(
    AudioChannelTaggingSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channelTag', _$AudioChannelTagEnumMap[instance.channelTag]);
  return val;
}

const _$AudioChannelTagEnumMap = {
  AudioChannelTag.l: 'L',
  AudioChannelTag.r: 'R',
  AudioChannelTag.c: 'C',
  AudioChannelTag.lfe: 'LFE',
  AudioChannelTag.ls: 'LS',
  AudioChannelTag.rs: 'RS',
  AudioChannelTag.lc: 'LC',
  AudioChannelTag.rc: 'RC',
  AudioChannelTag.cs: 'CS',
  AudioChannelTag.lsd: 'LSD',
  AudioChannelTag.rsd: 'RSD',
  AudioChannelTag.tcs: 'TCS',
  AudioChannelTag.vhl: 'VHL',
  AudioChannelTag.vhc: 'VHC',
  AudioChannelTag.vhr: 'VHR',
};

AudioCodecSettings _$AudioCodecSettingsFromJson(Map<String, dynamic> json) {
  return AudioCodecSettings(
    aacSettings: json['aacSettings'] == null
        ? null
        : AacSettings.fromJson(json['aacSettings'] as Map<String, dynamic>),
    ac3Settings: json['ac3Settings'] == null
        ? null
        : Ac3Settings.fromJson(json['ac3Settings'] as Map<String, dynamic>),
    aiffSettings: json['aiffSettings'] == null
        ? null
        : AiffSettings.fromJson(json['aiffSettings'] as Map<String, dynamic>),
    codec: _$enumDecodeNullable(_$AudioCodecEnumMap, json['codec']),
    eac3AtmosSettings: json['eac3AtmosSettings'] == null
        ? null
        : Eac3AtmosSettings.fromJson(
            json['eac3AtmosSettings'] as Map<String, dynamic>),
    eac3Settings: json['eac3Settings'] == null
        ? null
        : Eac3Settings.fromJson(json['eac3Settings'] as Map<String, dynamic>),
    mp2Settings: json['mp2Settings'] == null
        ? null
        : Mp2Settings.fromJson(json['mp2Settings'] as Map<String, dynamic>),
    mp3Settings: json['mp3Settings'] == null
        ? null
        : Mp3Settings.fromJson(json['mp3Settings'] as Map<String, dynamic>),
    opusSettings: json['opusSettings'] == null
        ? null
        : OpusSettings.fromJson(json['opusSettings'] as Map<String, dynamic>),
    vorbisSettings: json['vorbisSettings'] == null
        ? null
        : VorbisSettings.fromJson(
            json['vorbisSettings'] as Map<String, dynamic>),
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
  writeNotNull('aiffSettings', instance.aiffSettings?.toJson());
  writeNotNull('codec', _$AudioCodecEnumMap[instance.codec]);
  writeNotNull('eac3AtmosSettings', instance.eac3AtmosSettings?.toJson());
  writeNotNull('eac3Settings', instance.eac3Settings?.toJson());
  writeNotNull('mp2Settings', instance.mp2Settings?.toJson());
  writeNotNull('mp3Settings', instance.mp3Settings?.toJson());
  writeNotNull('opusSettings', instance.opusSettings?.toJson());
  writeNotNull('vorbisSettings', instance.vorbisSettings?.toJson());
  writeNotNull('wavSettings', instance.wavSettings?.toJson());
  return val;
}

const _$AudioCodecEnumMap = {
  AudioCodec.aac: 'AAC',
  AudioCodec.mp2: 'MP2',
  AudioCodec.mp3: 'MP3',
  AudioCodec.wav: 'WAV',
  AudioCodec.aiff: 'AIFF',
  AudioCodec.ac3: 'AC3',
  AudioCodec.eac3: 'EAC3',
  AudioCodec.eac3Atmos: 'EAC3_ATMOS',
  AudioCodec.vorbis: 'VORBIS',
  AudioCodec.opus: 'OPUS',
  AudioCodec.passthrough: 'PASSTHROUGH',
};

AudioDescription _$AudioDescriptionFromJson(Map<String, dynamic> json) {
  return AudioDescription(
    audioChannelTaggingSettings: json['audioChannelTaggingSettings'] == null
        ? null
        : AudioChannelTaggingSettings.fromJson(
            json['audioChannelTaggingSettings'] as Map<String, dynamic>),
    audioNormalizationSettings: json['audioNormalizationSettings'] == null
        ? null
        : AudioNormalizationSettings.fromJson(
            json['audioNormalizationSettings'] as Map<String, dynamic>),
    audioSourceName: json['audioSourceName'] as String,
    audioType: json['audioType'] as int,
    audioTypeControl: _$enumDecodeNullable(
        _$AudioTypeControlEnumMap, json['audioTypeControl']),
    codecSettings: json['codecSettings'] == null
        ? null
        : AudioCodecSettings.fromJson(
            json['codecSettings'] as Map<String, dynamic>),
    customLanguageCode: json['customLanguageCode'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
    languageCodeControl: _$enumDecodeNullable(
        _$AudioLanguageCodeControlEnumMap, json['languageCodeControl']),
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

  writeNotNull('audioChannelTaggingSettings',
      instance.audioChannelTaggingSettings?.toJson());
  writeNotNull('audioNormalizationSettings',
      instance.audioNormalizationSettings?.toJson());
  writeNotNull('audioSourceName', instance.audioSourceName);
  writeNotNull('audioType', instance.audioType);
  writeNotNull(
      'audioTypeControl', _$AudioTypeControlEnumMap[instance.audioTypeControl]);
  writeNotNull('codecSettings', instance.codecSettings?.toJson());
  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('languageCodeControl',
      _$AudioLanguageCodeControlEnumMap[instance.languageCodeControl]);
  writeNotNull('remixSettings', instance.remixSettings?.toJson());
  writeNotNull('streamName', instance.streamName);
  return val;
}

const _$AudioTypeControlEnumMap = {
  AudioTypeControl.followInput: 'FOLLOW_INPUT',
  AudioTypeControl.useConfigured: 'USE_CONFIGURED',
};

const _$LanguageCodeEnumMap = {
  LanguageCode.eng: 'ENG',
  LanguageCode.spa: 'SPA',
  LanguageCode.fra: 'FRA',
  LanguageCode.deu: 'DEU',
  LanguageCode.ger: 'GER',
  LanguageCode.zho: 'ZHO',
  LanguageCode.ara: 'ARA',
  LanguageCode.hin: 'HIN',
  LanguageCode.jpn: 'JPN',
  LanguageCode.rus: 'RUS',
  LanguageCode.por: 'POR',
  LanguageCode.ita: 'ITA',
  LanguageCode.urd: 'URD',
  LanguageCode.vie: 'VIE',
  LanguageCode.kor: 'KOR',
  LanguageCode.pan: 'PAN',
  LanguageCode.abk: 'ABK',
  LanguageCode.aar: 'AAR',
  LanguageCode.afr: 'AFR',
  LanguageCode.aka: 'AKA',
  LanguageCode.sqi: 'SQI',
  LanguageCode.amh: 'AMH',
  LanguageCode.arg: 'ARG',
  LanguageCode.hye: 'HYE',
  LanguageCode.asm: 'ASM',
  LanguageCode.ava: 'AVA',
  LanguageCode.ave: 'AVE',
  LanguageCode.aym: 'AYM',
  LanguageCode.aze: 'AZE',
  LanguageCode.bam: 'BAM',
  LanguageCode.bak: 'BAK',
  LanguageCode.eus: 'EUS',
  LanguageCode.bel: 'BEL',
  LanguageCode.ben: 'BEN',
  LanguageCode.bih: 'BIH',
  LanguageCode.bis: 'BIS',
  LanguageCode.bos: 'BOS',
  LanguageCode.bre: 'BRE',
  LanguageCode.bul: 'BUL',
  LanguageCode.mya: 'MYA',
  LanguageCode.cat: 'CAT',
  LanguageCode.khm: 'KHM',
  LanguageCode.cha: 'CHA',
  LanguageCode.che: 'CHE',
  LanguageCode.nya: 'NYA',
  LanguageCode.chu: 'CHU',
  LanguageCode.chv: 'CHV',
  LanguageCode.cor: 'COR',
  LanguageCode.cos: 'COS',
  LanguageCode.cre: 'CRE',
  LanguageCode.hrv: 'HRV',
  LanguageCode.ces: 'CES',
  LanguageCode.dan: 'DAN',
  LanguageCode.div: 'DIV',
  LanguageCode.nld: 'NLD',
  LanguageCode.dzo: 'DZO',
  LanguageCode.enm: 'ENM',
  LanguageCode.epo: 'EPO',
  LanguageCode.est: 'EST',
  LanguageCode.ewe: 'EWE',
  LanguageCode.fao: 'FAO',
  LanguageCode.fij: 'FIJ',
  LanguageCode.fin: 'FIN',
  LanguageCode.frm: 'FRM',
  LanguageCode.ful: 'FUL',
  LanguageCode.gla: 'GLA',
  LanguageCode.glg: 'GLG',
  LanguageCode.lug: 'LUG',
  LanguageCode.kat: 'KAT',
  LanguageCode.ell: 'ELL',
  LanguageCode.grn: 'GRN',
  LanguageCode.guj: 'GUJ',
  LanguageCode.hat: 'HAT',
  LanguageCode.hau: 'HAU',
  LanguageCode.heb: 'HEB',
  LanguageCode.her: 'HER',
  LanguageCode.hmo: 'HMO',
  LanguageCode.hun: 'HUN',
  LanguageCode.isl: 'ISL',
  LanguageCode.ido: 'IDO',
  LanguageCode.ibo: 'IBO',
  LanguageCode.ind: 'IND',
  LanguageCode.ina: 'INA',
  LanguageCode.ile: 'ILE',
  LanguageCode.iku: 'IKU',
  LanguageCode.ipk: 'IPK',
  LanguageCode.gle: 'GLE',
  LanguageCode.jav: 'JAV',
  LanguageCode.kal: 'KAL',
  LanguageCode.kan: 'KAN',
  LanguageCode.kau: 'KAU',
  LanguageCode.kas: 'KAS',
  LanguageCode.kaz: 'KAZ',
  LanguageCode.kik: 'KIK',
  LanguageCode.kin: 'KIN',
  LanguageCode.kir: 'KIR',
  LanguageCode.kom: 'KOM',
  LanguageCode.kon: 'KON',
  LanguageCode.kua: 'KUA',
  LanguageCode.kur: 'KUR',
  LanguageCode.lao: 'LAO',
  LanguageCode.lat: 'LAT',
  LanguageCode.lav: 'LAV',
  LanguageCode.lim: 'LIM',
  LanguageCode.lin: 'LIN',
  LanguageCode.lit: 'LIT',
  LanguageCode.lub: 'LUB',
  LanguageCode.ltz: 'LTZ',
  LanguageCode.mkd: 'MKD',
  LanguageCode.mlg: 'MLG',
  LanguageCode.msa: 'MSA',
  LanguageCode.mal: 'MAL',
  LanguageCode.mlt: 'MLT',
  LanguageCode.glv: 'GLV',
  LanguageCode.mri: 'MRI',
  LanguageCode.mar: 'MAR',
  LanguageCode.mah: 'MAH',
  LanguageCode.mon: 'MON',
  LanguageCode.nau: 'NAU',
  LanguageCode.nav: 'NAV',
  LanguageCode.nde: 'NDE',
  LanguageCode.nbl: 'NBL',
  LanguageCode.ndo: 'NDO',
  LanguageCode.nep: 'NEP',
  LanguageCode.sme: 'SME',
  LanguageCode.nor: 'NOR',
  LanguageCode.nob: 'NOB',
  LanguageCode.nno: 'NNO',
  LanguageCode.oci: 'OCI',
  LanguageCode.oji: 'OJI',
  LanguageCode.ori: 'ORI',
  LanguageCode.orm: 'ORM',
  LanguageCode.oss: 'OSS',
  LanguageCode.pli: 'PLI',
  LanguageCode.fas: 'FAS',
  LanguageCode.pol: 'POL',
  LanguageCode.pus: 'PUS',
  LanguageCode.que: 'QUE',
  LanguageCode.qaa: 'QAA',
  LanguageCode.ron: 'RON',
  LanguageCode.roh: 'ROH',
  LanguageCode.run: 'RUN',
  LanguageCode.smo: 'SMO',
  LanguageCode.sag: 'SAG',
  LanguageCode.san: 'SAN',
  LanguageCode.srd: 'SRD',
  LanguageCode.srb: 'SRB',
  LanguageCode.sna: 'SNA',
  LanguageCode.iii: 'III',
  LanguageCode.snd: 'SND',
  LanguageCode.sin: 'SIN',
  LanguageCode.slk: 'SLK',
  LanguageCode.slv: 'SLV',
  LanguageCode.som: 'SOM',
  LanguageCode.sot: 'SOT',
  LanguageCode.sun: 'SUN',
  LanguageCode.swa: 'SWA',
  LanguageCode.ssw: 'SSW',
  LanguageCode.swe: 'SWE',
  LanguageCode.tgl: 'TGL',
  LanguageCode.tah: 'TAH',
  LanguageCode.tgk: 'TGK',
  LanguageCode.tam: 'TAM',
  LanguageCode.tat: 'TAT',
  LanguageCode.tel: 'TEL',
  LanguageCode.tha: 'THA',
  LanguageCode.bod: 'BOD',
  LanguageCode.tir: 'TIR',
  LanguageCode.ton: 'TON',
  LanguageCode.tso: 'TSO',
  LanguageCode.tsn: 'TSN',
  LanguageCode.tur: 'TUR',
  LanguageCode.tuk: 'TUK',
  LanguageCode.twi: 'TWI',
  LanguageCode.uig: 'UIG',
  LanguageCode.ukr: 'UKR',
  LanguageCode.uzb: 'UZB',
  LanguageCode.ven: 'VEN',
  LanguageCode.vol: 'VOL',
  LanguageCode.wln: 'WLN',
  LanguageCode.cym: 'CYM',
  LanguageCode.fry: 'FRY',
  LanguageCode.wol: 'WOL',
  LanguageCode.xho: 'XHO',
  LanguageCode.yid: 'YID',
  LanguageCode.yor: 'YOR',
  LanguageCode.zha: 'ZHA',
  LanguageCode.zul: 'ZUL',
  LanguageCode.orj: 'ORJ',
  LanguageCode.qpc: 'QPC',
  LanguageCode.tng: 'TNG',
};

const _$AudioLanguageCodeControlEnumMap = {
  AudioLanguageCodeControl.followInput: 'FOLLOW_INPUT',
  AudioLanguageCodeControl.useConfigured: 'USE_CONFIGURED',
};

AudioNormalizationSettings _$AudioNormalizationSettingsFromJson(
    Map<String, dynamic> json) {
  return AudioNormalizationSettings(
    algorithm: _$enumDecodeNullable(
        _$AudioNormalizationAlgorithmEnumMap, json['algorithm']),
    algorithmControl: _$enumDecodeNullable(
        _$AudioNormalizationAlgorithmControlEnumMap, json['algorithmControl']),
    correctionGateLevel: json['correctionGateLevel'] as int,
    loudnessLogging: _$enumDecodeNullable(
        _$AudioNormalizationLoudnessLoggingEnumMap, json['loudnessLogging']),
    peakCalculation: _$enumDecodeNullable(
        _$AudioNormalizationPeakCalculationEnumMap, json['peakCalculation']),
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
  writeNotNull('correctionGateLevel', instance.correctionGateLevel);
  writeNotNull('loudnessLogging',
      _$AudioNormalizationLoudnessLoggingEnumMap[instance.loudnessLogging]);
  writeNotNull('peakCalculation',
      _$AudioNormalizationPeakCalculationEnumMap[instance.peakCalculation]);
  writeNotNull('targetLkfs', instance.targetLkfs);
  return val;
}

const _$AudioNormalizationAlgorithmEnumMap = {
  AudioNormalizationAlgorithm.ituBs_1770_1: 'ITU_BS_1770_1',
  AudioNormalizationAlgorithm.ituBs_1770_2: 'ITU_BS_1770_2',
  AudioNormalizationAlgorithm.ituBs_1770_3: 'ITU_BS_1770_3',
  AudioNormalizationAlgorithm.ituBs_1770_4: 'ITU_BS_1770_4',
};

const _$AudioNormalizationAlgorithmControlEnumMap = {
  AudioNormalizationAlgorithmControl.correctAudio: 'CORRECT_AUDIO',
  AudioNormalizationAlgorithmControl.measureOnly: 'MEASURE_ONLY',
};

const _$AudioNormalizationLoudnessLoggingEnumMap = {
  AudioNormalizationLoudnessLogging.log: 'LOG',
  AudioNormalizationLoudnessLogging.dontLog: 'DONT_LOG',
};

const _$AudioNormalizationPeakCalculationEnumMap = {
  AudioNormalizationPeakCalculation.truePeak: 'TRUE_PEAK',
  AudioNormalizationPeakCalculation.none: 'NONE',
};

AudioSelector _$AudioSelectorFromJson(Map<String, dynamic> json) {
  return AudioSelector(
    customLanguageCode: json['customLanguageCode'] as String,
    defaultSelection: _$enumDecodeNullable(
        _$AudioDefaultSelectionEnumMap, json['defaultSelection']),
    externalAudioFileInput: json['externalAudioFileInput'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
    offset: json['offset'] as int,
    pids: (json['pids'] as List)?.map((e) => e as int)?.toList(),
    programSelection: json['programSelection'] as int,
    remixSettings: json['remixSettings'] == null
        ? null
        : RemixSettings.fromJson(json['remixSettings'] as Map<String, dynamic>),
    selectorType:
        _$enumDecodeNullable(_$AudioSelectorTypeEnumMap, json['selectorType']),
    tracks: (json['tracks'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$AudioSelectorToJson(AudioSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('defaultSelection',
      _$AudioDefaultSelectionEnumMap[instance.defaultSelection]);
  writeNotNull('externalAudioFileInput', instance.externalAudioFileInput);
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('offset', instance.offset);
  writeNotNull('pids', instance.pids);
  writeNotNull('programSelection', instance.programSelection);
  writeNotNull('remixSettings', instance.remixSettings?.toJson());
  writeNotNull(
      'selectorType', _$AudioSelectorTypeEnumMap[instance.selectorType]);
  writeNotNull('tracks', instance.tracks);
  return val;
}

const _$AudioDefaultSelectionEnumMap = {
  AudioDefaultSelection.$default: 'DEFAULT',
  AudioDefaultSelection.notDefault: 'NOT_DEFAULT',
};

const _$AudioSelectorTypeEnumMap = {
  AudioSelectorType.pid: 'PID',
  AudioSelectorType.track: 'TRACK',
  AudioSelectorType.languageCode: 'LANGUAGE_CODE',
};

AudioSelectorGroup _$AudioSelectorGroupFromJson(Map<String, dynamic> json) {
  return AudioSelectorGroup(
    audioSelectorNames:
        (json['audioSelectorNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AudioSelectorGroupToJson(AudioSelectorGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectorNames', instance.audioSelectorNames);
  return val;
}

AutomatedAbrSettings _$AutomatedAbrSettingsFromJson(Map<String, dynamic> json) {
  return AutomatedAbrSettings(
    maxAbrBitrate: json['maxAbrBitrate'] as int,
    maxRenditions: json['maxRenditions'] as int,
    minAbrBitrate: json['minAbrBitrate'] as int,
  );
}

Map<String, dynamic> _$AutomatedAbrSettingsToJson(
    AutomatedAbrSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxAbrBitrate', instance.maxAbrBitrate);
  writeNotNull('maxRenditions', instance.maxRenditions);
  writeNotNull('minAbrBitrate', instance.minAbrBitrate);
  return val;
}

AutomatedEncodingSettings _$AutomatedEncodingSettingsFromJson(
    Map<String, dynamic> json) {
  return AutomatedEncodingSettings(
    abrSettings: json['abrSettings'] == null
        ? null
        : AutomatedAbrSettings.fromJson(
            json['abrSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutomatedEncodingSettingsToJson(
    AutomatedEncodingSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('abrSettings', instance.abrSettings?.toJson());
  return val;
}

Av1QvbrSettings _$Av1QvbrSettingsFromJson(Map<String, dynamic> json) {
  return Av1QvbrSettings(
    qvbrQualityLevel: json['qvbrQualityLevel'] as int,
    qvbrQualityLevelFineTune:
        (json['qvbrQualityLevelFineTune'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$Av1QvbrSettingsToJson(Av1QvbrSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('qvbrQualityLevel', instance.qvbrQualityLevel);
  writeNotNull('qvbrQualityLevelFineTune', instance.qvbrQualityLevelFineTune);
  return val;
}

Av1Settings _$Av1SettingsFromJson(Map<String, dynamic> json) {
  return Av1Settings(
    adaptiveQuantization: _$enumDecodeNullable(
        _$Av1AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    framerateControl: _$enumDecodeNullable(
        _$Av1FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$Av1FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    maxBitrate: json['maxBitrate'] as int,
    numberBFramesBetweenReferenceFrames:
        json['numberBFramesBetweenReferenceFrames'] as int,
    qvbrSettings: json['qvbrSettings'] == null
        ? null
        : Av1QvbrSettings.fromJson(
            json['qvbrSettings'] as Map<String, dynamic>),
    rateControlMode: _$enumDecodeNullable(
        _$Av1RateControlModeEnumMap, json['rateControlMode']),
    slices: json['slices'] as int,
    spatialAdaptiveQuantization: _$enumDecodeNullable(
        _$Av1SpatialAdaptiveQuantizationEnumMap,
        json['spatialAdaptiveQuantization']),
  );
}

Map<String, dynamic> _$Av1SettingsToJson(Av1Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adaptiveQuantization',
      _$Av1AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull('framerateControl',
      _$Av1FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$Av1FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('numberBFramesBetweenReferenceFrames',
      instance.numberBFramesBetweenReferenceFrames);
  writeNotNull('qvbrSettings', instance.qvbrSettings?.toJson());
  writeNotNull(
      'rateControlMode', _$Av1RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('slices', instance.slices);
  writeNotNull(
      'spatialAdaptiveQuantization',
      _$Av1SpatialAdaptiveQuantizationEnumMap[
          instance.spatialAdaptiveQuantization]);
  return val;
}

const _$Av1AdaptiveQuantizationEnumMap = {
  Av1AdaptiveQuantization.off: 'OFF',
  Av1AdaptiveQuantization.low: 'LOW',
  Av1AdaptiveQuantization.medium: 'MEDIUM',
  Av1AdaptiveQuantization.high: 'HIGH',
  Av1AdaptiveQuantization.higher: 'HIGHER',
  Av1AdaptiveQuantization.max: 'MAX',
};

const _$Av1FramerateControlEnumMap = {
  Av1FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Av1FramerateControl.specified: 'SPECIFIED',
};

const _$Av1FramerateConversionAlgorithmEnumMap = {
  Av1FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  Av1FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  Av1FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$Av1RateControlModeEnumMap = {
  Av1RateControlMode.qvbr: 'QVBR',
};

const _$Av1SpatialAdaptiveQuantizationEnumMap = {
  Av1SpatialAdaptiveQuantization.disabled: 'DISABLED',
  Av1SpatialAdaptiveQuantization.enabled: 'ENABLED',
};

AvailBlanking _$AvailBlankingFromJson(Map<String, dynamic> json) {
  return AvailBlanking(
    availBlankingImage: json['availBlankingImage'] as String,
  );
}

Map<String, dynamic> _$AvailBlankingToJson(AvailBlanking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('availBlankingImage', instance.availBlankingImage);
  return val;
}

AvcIntraSettings _$AvcIntraSettingsFromJson(Map<String, dynamic> json) {
  return AvcIntraSettings(
    avcIntraClass:
        _$enumDecodeNullable(_$AvcIntraClassEnumMap, json['avcIntraClass']),
    framerateControl: _$enumDecodeNullable(
        _$AvcIntraFramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$AvcIntraFramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    interlaceMode: _$enumDecodeNullable(
        _$AvcIntraInterlaceModeEnumMap, json['interlaceMode']),
    slowPal: _$enumDecodeNullable(_$AvcIntraSlowPalEnumMap, json['slowPal']),
    telecine: _$enumDecodeNullable(_$AvcIntraTelecineEnumMap, json['telecine']),
  );
}

Map<String, dynamic> _$AvcIntraSettingsToJson(AvcIntraSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avcIntraClass', _$AvcIntraClassEnumMap[instance.avcIntraClass]);
  writeNotNull('framerateControl',
      _$AvcIntraFramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$AvcIntraFramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'interlaceMode', _$AvcIntraInterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('slowPal', _$AvcIntraSlowPalEnumMap[instance.slowPal]);
  writeNotNull('telecine', _$AvcIntraTelecineEnumMap[instance.telecine]);
  return val;
}

const _$AvcIntraClassEnumMap = {
  AvcIntraClass.class_50: 'CLASS_50',
  AvcIntraClass.class_100: 'CLASS_100',
  AvcIntraClass.class_200: 'CLASS_200',
};

const _$AvcIntraFramerateControlEnumMap = {
  AvcIntraFramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  AvcIntraFramerateControl.specified: 'SPECIFIED',
};

const _$AvcIntraFramerateConversionAlgorithmEnumMap = {
  AvcIntraFramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  AvcIntraFramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  AvcIntraFramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$AvcIntraInterlaceModeEnumMap = {
  AvcIntraInterlaceMode.progressive: 'PROGRESSIVE',
  AvcIntraInterlaceMode.topField: 'TOP_FIELD',
  AvcIntraInterlaceMode.bottomField: 'BOTTOM_FIELD',
  AvcIntraInterlaceMode.followTopField: 'FOLLOW_TOP_FIELD',
  AvcIntraInterlaceMode.followBottomField: 'FOLLOW_BOTTOM_FIELD',
};

const _$AvcIntraSlowPalEnumMap = {
  AvcIntraSlowPal.disabled: 'DISABLED',
  AvcIntraSlowPal.enabled: 'ENABLED',
};

const _$AvcIntraTelecineEnumMap = {
  AvcIntraTelecine.none: 'NONE',
  AvcIntraTelecine.hard: 'HARD',
};

BurninDestinationSettings _$BurninDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return BurninDestinationSettings(
    alignment: _$enumDecodeNullable(
        _$BurninSubtitleAlignmentEnumMap, json['alignment']),
    backgroundColor: _$enumDecodeNullable(
        _$BurninSubtitleBackgroundColorEnumMap, json['backgroundColor']),
    backgroundOpacity: json['backgroundOpacity'] as int,
    fontColor: _$enumDecodeNullable(
        _$BurninSubtitleFontColorEnumMap, json['fontColor']),
    fontOpacity: json['fontOpacity'] as int,
    fontResolution: json['fontResolution'] as int,
    fontScript: _$enumDecodeNullable(_$FontScriptEnumMap, json['fontScript']),
    fontSize: json['fontSize'] as int,
    outlineColor: _$enumDecodeNullable(
        _$BurninSubtitleOutlineColorEnumMap, json['outlineColor']),
    outlineSize: json['outlineSize'] as int,
    shadowColor: _$enumDecodeNullable(
        _$BurninSubtitleShadowColorEnumMap, json['shadowColor']),
    shadowOpacity: json['shadowOpacity'] as int,
    shadowXOffset: json['shadowXOffset'] as int,
    shadowYOffset: json['shadowYOffset'] as int,
    teletextSpacing: _$enumDecodeNullable(
        _$BurninSubtitleTeletextSpacingEnumMap, json['teletextSpacing']),
    xPosition: json['xPosition'] as int,
    yPosition: json['yPosition'] as int,
  );
}

Map<String, dynamic> _$BurninDestinationSettingsToJson(
    BurninDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'alignment', _$BurninSubtitleAlignmentEnumMap[instance.alignment]);
  writeNotNull('backgroundColor',
      _$BurninSubtitleBackgroundColorEnumMap[instance.backgroundColor]);
  writeNotNull('backgroundOpacity', instance.backgroundOpacity);
  writeNotNull(
      'fontColor', _$BurninSubtitleFontColorEnumMap[instance.fontColor]);
  writeNotNull('fontOpacity', instance.fontOpacity);
  writeNotNull('fontResolution', instance.fontResolution);
  writeNotNull('fontScript', _$FontScriptEnumMap[instance.fontScript]);
  writeNotNull('fontSize', instance.fontSize);
  writeNotNull('outlineColor',
      _$BurninSubtitleOutlineColorEnumMap[instance.outlineColor]);
  writeNotNull('outlineSize', instance.outlineSize);
  writeNotNull(
      'shadowColor', _$BurninSubtitleShadowColorEnumMap[instance.shadowColor]);
  writeNotNull('shadowOpacity', instance.shadowOpacity);
  writeNotNull('shadowXOffset', instance.shadowXOffset);
  writeNotNull('shadowYOffset', instance.shadowYOffset);
  writeNotNull('teletextSpacing',
      _$BurninSubtitleTeletextSpacingEnumMap[instance.teletextSpacing]);
  writeNotNull('xPosition', instance.xPosition);
  writeNotNull('yPosition', instance.yPosition);
  return val;
}

const _$BurninSubtitleAlignmentEnumMap = {
  BurninSubtitleAlignment.centered: 'CENTERED',
  BurninSubtitleAlignment.left: 'LEFT',
};

const _$BurninSubtitleBackgroundColorEnumMap = {
  BurninSubtitleBackgroundColor.none: 'NONE',
  BurninSubtitleBackgroundColor.black: 'BLACK',
  BurninSubtitleBackgroundColor.white: 'WHITE',
};

const _$BurninSubtitleFontColorEnumMap = {
  BurninSubtitleFontColor.white: 'WHITE',
  BurninSubtitleFontColor.black: 'BLACK',
  BurninSubtitleFontColor.yellow: 'YELLOW',
  BurninSubtitleFontColor.red: 'RED',
  BurninSubtitleFontColor.green: 'GREEN',
  BurninSubtitleFontColor.blue: 'BLUE',
};

const _$FontScriptEnumMap = {
  FontScript.automatic: 'AUTOMATIC',
  FontScript.hans: 'HANS',
  FontScript.hant: 'HANT',
};

const _$BurninSubtitleOutlineColorEnumMap = {
  BurninSubtitleOutlineColor.black: 'BLACK',
  BurninSubtitleOutlineColor.white: 'WHITE',
  BurninSubtitleOutlineColor.yellow: 'YELLOW',
  BurninSubtitleOutlineColor.red: 'RED',
  BurninSubtitleOutlineColor.green: 'GREEN',
  BurninSubtitleOutlineColor.blue: 'BLUE',
};

const _$BurninSubtitleShadowColorEnumMap = {
  BurninSubtitleShadowColor.none: 'NONE',
  BurninSubtitleShadowColor.black: 'BLACK',
  BurninSubtitleShadowColor.white: 'WHITE',
};

const _$BurninSubtitleTeletextSpacingEnumMap = {
  BurninSubtitleTeletextSpacing.fixedGrid: 'FIXED_GRID',
  BurninSubtitleTeletextSpacing.proportional: 'PROPORTIONAL',
};

CancelJobResponse _$CancelJobResponseFromJson(Map<String, dynamic> json) {
  return CancelJobResponse();
}

CaptionDescription _$CaptionDescriptionFromJson(Map<String, dynamic> json) {
  return CaptionDescription(
    captionSelectorName: json['captionSelectorName'] as String,
    customLanguageCode: json['customLanguageCode'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : CaptionDestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
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
  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('languageDescription', instance.languageDescription);
  return val;
}

CaptionDescriptionPreset _$CaptionDescriptionPresetFromJson(
    Map<String, dynamic> json) {
  return CaptionDescriptionPreset(
    customLanguageCode: json['customLanguageCode'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : CaptionDestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
    languageDescription: json['languageDescription'] as String,
  );
}

Map<String, dynamic> _$CaptionDescriptionPresetToJson(
    CaptionDescriptionPreset instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('languageDescription', instance.languageDescription);
  return val;
}

CaptionDestinationSettings _$CaptionDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return CaptionDestinationSettings(
    burninDestinationSettings: json['burninDestinationSettings'] == null
        ? null
        : BurninDestinationSettings.fromJson(
            json['burninDestinationSettings'] as Map<String, dynamic>),
    destinationType: _$enumDecodeNullable(
        _$CaptionDestinationTypeEnumMap, json['destinationType']),
    dvbSubDestinationSettings: json['dvbSubDestinationSettings'] == null
        ? null
        : DvbSubDestinationSettings.fromJson(
            json['dvbSubDestinationSettings'] as Map<String, dynamic>),
    embeddedDestinationSettings: json['embeddedDestinationSettings'] == null
        ? null
        : EmbeddedDestinationSettings.fromJson(
            json['embeddedDestinationSettings'] as Map<String, dynamic>),
    imscDestinationSettings: json['imscDestinationSettings'] == null
        ? null
        : ImscDestinationSettings.fromJson(
            json['imscDestinationSettings'] as Map<String, dynamic>),
    sccDestinationSettings: json['sccDestinationSettings'] == null
        ? null
        : SccDestinationSettings.fromJson(
            json['sccDestinationSettings'] as Map<String, dynamic>),
    teletextDestinationSettings: json['teletextDestinationSettings'] == null
        ? null
        : TeletextDestinationSettings.fromJson(
            json['teletextDestinationSettings'] as Map<String, dynamic>),
    ttmlDestinationSettings: json['ttmlDestinationSettings'] == null
        ? null
        : TtmlDestinationSettings.fromJson(
            json['ttmlDestinationSettings'] as Map<String, dynamic>),
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

  writeNotNull('burninDestinationSettings',
      instance.burninDestinationSettings?.toJson());
  writeNotNull('destinationType',
      _$CaptionDestinationTypeEnumMap[instance.destinationType]);
  writeNotNull('dvbSubDestinationSettings',
      instance.dvbSubDestinationSettings?.toJson());
  writeNotNull('embeddedDestinationSettings',
      instance.embeddedDestinationSettings?.toJson());
  writeNotNull(
      'imscDestinationSettings', instance.imscDestinationSettings?.toJson());
  writeNotNull(
      'sccDestinationSettings', instance.sccDestinationSettings?.toJson());
  writeNotNull('teletextDestinationSettings',
      instance.teletextDestinationSettings?.toJson());
  writeNotNull(
      'ttmlDestinationSettings', instance.ttmlDestinationSettings?.toJson());
  return val;
}

const _$CaptionDestinationTypeEnumMap = {
  CaptionDestinationType.burnIn: 'BURN_IN',
  CaptionDestinationType.dvbSub: 'DVB_SUB',
  CaptionDestinationType.embedded: 'EMBEDDED',
  CaptionDestinationType.embeddedPlusScte20: 'EMBEDDED_PLUS_SCTE20',
  CaptionDestinationType.imsc: 'IMSC',
  CaptionDestinationType.scte20PlusEmbedded: 'SCTE20_PLUS_EMBEDDED',
  CaptionDestinationType.scc: 'SCC',
  CaptionDestinationType.srt: 'SRT',
  CaptionDestinationType.smi: 'SMI',
  CaptionDestinationType.teletext: 'TELETEXT',
  CaptionDestinationType.ttml: 'TTML',
  CaptionDestinationType.webvtt: 'WEBVTT',
};

CaptionSelector _$CaptionSelectorFromJson(Map<String, dynamic> json) {
  return CaptionSelector(
    customLanguageCode: json['customLanguageCode'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
    sourceSettings: json['sourceSettings'] == null
        ? null
        : CaptionSourceSettings.fromJson(
            json['sourceSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaptionSelectorToJson(CaptionSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('sourceSettings', instance.sourceSettings?.toJson());
  return val;
}

CaptionSourceFramerate _$CaptionSourceFramerateFromJson(
    Map<String, dynamic> json) {
  return CaptionSourceFramerate(
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
  );
}

Map<String, dynamic> _$CaptionSourceFramerateToJson(
    CaptionSourceFramerate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  return val;
}

CaptionSourceSettings _$CaptionSourceSettingsFromJson(
    Map<String, dynamic> json) {
  return CaptionSourceSettings(
    ancillarySourceSettings: json['ancillarySourceSettings'] == null
        ? null
        : AncillarySourceSettings.fromJson(
            json['ancillarySourceSettings'] as Map<String, dynamic>),
    dvbSubSourceSettings: json['dvbSubSourceSettings'] == null
        ? null
        : DvbSubSourceSettings.fromJson(
            json['dvbSubSourceSettings'] as Map<String, dynamic>),
    embeddedSourceSettings: json['embeddedSourceSettings'] == null
        ? null
        : EmbeddedSourceSettings.fromJson(
            json['embeddedSourceSettings'] as Map<String, dynamic>),
    fileSourceSettings: json['fileSourceSettings'] == null
        ? null
        : FileSourceSettings.fromJson(
            json['fileSourceSettings'] as Map<String, dynamic>),
    sourceType:
        _$enumDecodeNullable(_$CaptionSourceTypeEnumMap, json['sourceType']),
    teletextSourceSettings: json['teletextSourceSettings'] == null
        ? null
        : TeletextSourceSettings.fromJson(
            json['teletextSourceSettings'] as Map<String, dynamic>),
    trackSourceSettings: json['trackSourceSettings'] == null
        ? null
        : TrackSourceSettings.fromJson(
            json['trackSourceSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaptionSourceSettingsToJson(
    CaptionSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ancillarySourceSettings', instance.ancillarySourceSettings?.toJson());
  writeNotNull('dvbSubSourceSettings', instance.dvbSubSourceSettings?.toJson());
  writeNotNull(
      'embeddedSourceSettings', instance.embeddedSourceSettings?.toJson());
  writeNotNull('fileSourceSettings', instance.fileSourceSettings?.toJson());
  writeNotNull('sourceType', _$CaptionSourceTypeEnumMap[instance.sourceType]);
  writeNotNull(
      'teletextSourceSettings', instance.teletextSourceSettings?.toJson());
  writeNotNull('trackSourceSettings', instance.trackSourceSettings?.toJson());
  return val;
}

const _$CaptionSourceTypeEnumMap = {
  CaptionSourceType.ancillary: 'ANCILLARY',
  CaptionSourceType.dvbSub: 'DVB_SUB',
  CaptionSourceType.embedded: 'EMBEDDED',
  CaptionSourceType.scte20: 'SCTE20',
  CaptionSourceType.scc: 'SCC',
  CaptionSourceType.ttml: 'TTML',
  CaptionSourceType.stl: 'STL',
  CaptionSourceType.srt: 'SRT',
  CaptionSourceType.smi: 'SMI',
  CaptionSourceType.teletext: 'TELETEXT',
  CaptionSourceType.nullSource: 'NULL_SOURCE',
  CaptionSourceType.imsc: 'IMSC',
};

ChannelMapping _$ChannelMappingFromJson(Map<String, dynamic> json) {
  return ChannelMapping(
    outputChannels: (json['outputChannels'] as List)
        ?.map((e) => e == null
            ? null
            : OutputChannelMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChannelMappingToJson(ChannelMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('outputChannels',
      instance.outputChannels?.map((e) => e?.toJson())?.toList());
  return val;
}

CmafAdditionalManifest _$CmafAdditionalManifestFromJson(
    Map<String, dynamic> json) {
  return CmafAdditionalManifest(
    manifestNameModifier: json['manifestNameModifier'] as String,
    selectedOutputs:
        (json['selectedOutputs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CmafAdditionalManifestToJson(
    CmafAdditionalManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestNameModifier', instance.manifestNameModifier);
  writeNotNull('selectedOutputs', instance.selectedOutputs);
  return val;
}

CmafEncryptionSettings _$CmafEncryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return CmafEncryptionSettings(
    constantInitializationVector:
        json['constantInitializationVector'] as String,
    encryptionMethod: _$enumDecodeNullable(
        _$CmafEncryptionTypeEnumMap, json['encryptionMethod']),
    initializationVectorInManifest: _$enumDecodeNullable(
        _$CmafInitializationVectorInManifestEnumMap,
        json['initializationVectorInManifest']),
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProviderCmaf.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
    staticKeyProvider: json['staticKeyProvider'] == null
        ? null
        : StaticKeyProvider.fromJson(
            json['staticKeyProvider'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$CmafKeyProviderTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$CmafEncryptionSettingsToJson(
    CmafEncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'constantInitializationVector', instance.constantInitializationVector);
  writeNotNull('encryptionMethod',
      _$CmafEncryptionTypeEnumMap[instance.encryptionMethod]);
  writeNotNull(
      'initializationVectorInManifest',
      _$CmafInitializationVectorInManifestEnumMap[
          instance.initializationVectorInManifest]);
  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  writeNotNull('staticKeyProvider', instance.staticKeyProvider?.toJson());
  writeNotNull('type', _$CmafKeyProviderTypeEnumMap[instance.type]);
  return val;
}

const _$CmafEncryptionTypeEnumMap = {
  CmafEncryptionType.sampleAes: 'SAMPLE_AES',
  CmafEncryptionType.aesCtr: 'AES_CTR',
};

const _$CmafInitializationVectorInManifestEnumMap = {
  CmafInitializationVectorInManifest.include: 'INCLUDE',
  CmafInitializationVectorInManifest.exclude: 'EXCLUDE',
};

const _$CmafKeyProviderTypeEnumMap = {
  CmafKeyProviderType.speke: 'SPEKE',
  CmafKeyProviderType.staticKey: 'STATIC_KEY',
};

CmafGroupSettings _$CmafGroupSettingsFromJson(Map<String, dynamic> json) {
  return CmafGroupSettings(
    additionalManifests: (json['additionalManifests'] as List)
        ?.map((e) => e == null
            ? null
            : CmafAdditionalManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    baseUrl: json['baseUrl'] as String,
    clientCache:
        _$enumDecodeNullable(_$CmafClientCacheEnumMap, json['clientCache']),
    codecSpecification: _$enumDecodeNullable(
        _$CmafCodecSpecificationEnumMap, json['codecSpecification']),
    destination: json['destination'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : DestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    encryption: json['encryption'] == null
        ? null
        : CmafEncryptionSettings.fromJson(
            json['encryption'] as Map<String, dynamic>),
    fragmentLength: json['fragmentLength'] as int,
    manifestCompression: _$enumDecodeNullable(
        _$CmafManifestCompressionEnumMap, json['manifestCompression']),
    manifestDurationFormat: _$enumDecodeNullable(
        _$CmafManifestDurationFormatEnumMap, json['manifestDurationFormat']),
    minBufferTime: json['minBufferTime'] as int,
    minFinalSegmentLength: (json['minFinalSegmentLength'] as num)?.toDouble(),
    mpdProfile:
        _$enumDecodeNullable(_$CmafMpdProfileEnumMap, json['mpdProfile']),
    segmentControl: _$enumDecodeNullable(
        _$CmafSegmentControlEnumMap, json['segmentControl']),
    segmentLength: json['segmentLength'] as int,
    streamInfResolution: _$enumDecodeNullable(
        _$CmafStreamInfResolutionEnumMap, json['streamInfResolution']),
    writeDashManifest: _$enumDecodeNullable(
        _$CmafWriteDASHManifestEnumMap, json['writeDashManifest']),
    writeHlsManifest: _$enumDecodeNullable(
        _$CmafWriteHLSManifestEnumMap, json['writeHlsManifest']),
    writeSegmentTimelineInRepresentation: _$enumDecodeNullable(
        _$CmafWriteSegmentTimelineInRepresentationEnumMap,
        json['writeSegmentTimelineInRepresentation']),
  );
}

Map<String, dynamic> _$CmafGroupSettingsToJson(CmafGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalManifests',
      instance.additionalManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('baseUrl', instance.baseUrl);
  writeNotNull('clientCache', _$CmafClientCacheEnumMap[instance.clientCache]);
  writeNotNull('codecSpecification',
      _$CmafCodecSpecificationEnumMap[instance.codecSpecification]);
  writeNotNull('destination', instance.destination);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('fragmentLength', instance.fragmentLength);
  writeNotNull('manifestCompression',
      _$CmafManifestCompressionEnumMap[instance.manifestCompression]);
  writeNotNull('manifestDurationFormat',
      _$CmafManifestDurationFormatEnumMap[instance.manifestDurationFormat]);
  writeNotNull('minBufferTime', instance.minBufferTime);
  writeNotNull('minFinalSegmentLength', instance.minFinalSegmentLength);
  writeNotNull('mpdProfile', _$CmafMpdProfileEnumMap[instance.mpdProfile]);
  writeNotNull(
      'segmentControl', _$CmafSegmentControlEnumMap[instance.segmentControl]);
  writeNotNull('segmentLength', instance.segmentLength);
  writeNotNull('streamInfResolution',
      _$CmafStreamInfResolutionEnumMap[instance.streamInfResolution]);
  writeNotNull('writeDashManifest',
      _$CmafWriteDASHManifestEnumMap[instance.writeDashManifest]);
  writeNotNull('writeHlsManifest',
      _$CmafWriteHLSManifestEnumMap[instance.writeHlsManifest]);
  writeNotNull(
      'writeSegmentTimelineInRepresentation',
      _$CmafWriteSegmentTimelineInRepresentationEnumMap[
          instance.writeSegmentTimelineInRepresentation]);
  return val;
}

const _$CmafClientCacheEnumMap = {
  CmafClientCache.disabled: 'DISABLED',
  CmafClientCache.enabled: 'ENABLED',
};

const _$CmafCodecSpecificationEnumMap = {
  CmafCodecSpecification.rfc_6381: 'RFC_6381',
  CmafCodecSpecification.rfc_4281: 'RFC_4281',
};

const _$CmafManifestCompressionEnumMap = {
  CmafManifestCompression.gzip: 'GZIP',
  CmafManifestCompression.none: 'NONE',
};

const _$CmafManifestDurationFormatEnumMap = {
  CmafManifestDurationFormat.floatingPoint: 'FLOATING_POINT',
  CmafManifestDurationFormat.integer: 'INTEGER',
};

const _$CmafMpdProfileEnumMap = {
  CmafMpdProfile.mainProfile: 'MAIN_PROFILE',
  CmafMpdProfile.onDemandProfile: 'ON_DEMAND_PROFILE',
};

const _$CmafSegmentControlEnumMap = {
  CmafSegmentControl.singleFile: 'SINGLE_FILE',
  CmafSegmentControl.segmentedFiles: 'SEGMENTED_FILES',
};

const _$CmafStreamInfResolutionEnumMap = {
  CmafStreamInfResolution.include: 'INCLUDE',
  CmafStreamInfResolution.exclude: 'EXCLUDE',
};

const _$CmafWriteDASHManifestEnumMap = {
  CmafWriteDASHManifest.disabled: 'DISABLED',
  CmafWriteDASHManifest.enabled: 'ENABLED',
};

const _$CmafWriteHLSManifestEnumMap = {
  CmafWriteHLSManifest.disabled: 'DISABLED',
  CmafWriteHLSManifest.enabled: 'ENABLED',
};

const _$CmafWriteSegmentTimelineInRepresentationEnumMap = {
  CmafWriteSegmentTimelineInRepresentation.enabled: 'ENABLED',
  CmafWriteSegmentTimelineInRepresentation.disabled: 'DISABLED',
};

CmfcSettings _$CmfcSettingsFromJson(Map<String, dynamic> json) {
  return CmfcSettings(
    audioDuration:
        _$enumDecodeNullable(_$CmfcAudioDurationEnumMap, json['audioDuration']),
    scte35Esam:
        _$enumDecodeNullable(_$CmfcScte35EsamEnumMap, json['scte35Esam']),
    scte35Source:
        _$enumDecodeNullable(_$CmfcScte35SourceEnumMap, json['scte35Source']),
  );
}

Map<String, dynamic> _$CmfcSettingsToJson(CmfcSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'audioDuration', _$CmfcAudioDurationEnumMap[instance.audioDuration]);
  writeNotNull('scte35Esam', _$CmfcScte35EsamEnumMap[instance.scte35Esam]);
  writeNotNull(
      'scte35Source', _$CmfcScte35SourceEnumMap[instance.scte35Source]);
  return val;
}

const _$CmfcAudioDurationEnumMap = {
  CmfcAudioDuration.defaultCodecDuration: 'DEFAULT_CODEC_DURATION',
  CmfcAudioDuration.matchVideoDuration: 'MATCH_VIDEO_DURATION',
};

const _$CmfcScte35EsamEnumMap = {
  CmfcScte35Esam.insert: 'INSERT',
  CmfcScte35Esam.none: 'NONE',
};

const _$CmfcScte35SourceEnumMap = {
  CmfcScte35Source.passthrough: 'PASSTHROUGH',
  CmfcScte35Source.none: 'NONE',
};

ColorCorrector _$ColorCorrectorFromJson(Map<String, dynamic> json) {
  return ColorCorrector(
    brightness: json['brightness'] as int,
    colorSpaceConversion: _$enumDecodeNullable(
        _$ColorSpaceConversionEnumMap, json['colorSpaceConversion']),
    contrast: json['contrast'] as int,
    hdr10Metadata: json['hdr10Metadata'] == null
        ? null
        : Hdr10Metadata.fromJson(json['hdr10Metadata'] as Map<String, dynamic>),
    hue: json['hue'] as int,
    saturation: json['saturation'] as int,
  );
}

Map<String, dynamic> _$ColorCorrectorToJson(ColorCorrector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brightness', instance.brightness);
  writeNotNull('colorSpaceConversion',
      _$ColorSpaceConversionEnumMap[instance.colorSpaceConversion]);
  writeNotNull('contrast', instance.contrast);
  writeNotNull('hdr10Metadata', instance.hdr10Metadata?.toJson());
  writeNotNull('hue', instance.hue);
  writeNotNull('saturation', instance.saturation);
  return val;
}

const _$ColorSpaceConversionEnumMap = {
  ColorSpaceConversion.none: 'NONE',
  ColorSpaceConversion.force_601: 'FORCE_601',
  ColorSpaceConversion.force_709: 'FORCE_709',
  ColorSpaceConversion.forceHdr10: 'FORCE_HDR10',
  ColorSpaceConversion.forceHlg_2020: 'FORCE_HLG_2020',
};

ContainerSettings _$ContainerSettingsFromJson(Map<String, dynamic> json) {
  return ContainerSettings(
    cmfcSettings: json['cmfcSettings'] == null
        ? null
        : CmfcSettings.fromJson(json['cmfcSettings'] as Map<String, dynamic>),
    container: _$enumDecodeNullable(_$ContainerTypeEnumMap, json['container']),
    f4vSettings: json['f4vSettings'] == null
        ? null
        : F4vSettings.fromJson(json['f4vSettings'] as Map<String, dynamic>),
    m2tsSettings: json['m2tsSettings'] == null
        ? null
        : M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>),
    m3u8Settings: json['m3u8Settings'] == null
        ? null
        : M3u8Settings.fromJson(json['m3u8Settings'] as Map<String, dynamic>),
    movSettings: json['movSettings'] == null
        ? null
        : MovSettings.fromJson(json['movSettings'] as Map<String, dynamic>),
    mp4Settings: json['mp4Settings'] == null
        ? null
        : Mp4Settings.fromJson(json['mp4Settings'] as Map<String, dynamic>),
    mpdSettings: json['mpdSettings'] == null
        ? null
        : MpdSettings.fromJson(json['mpdSettings'] as Map<String, dynamic>),
    mxfSettings: json['mxfSettings'] == null
        ? null
        : MxfSettings.fromJson(json['mxfSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContainerSettingsToJson(ContainerSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cmfcSettings', instance.cmfcSettings?.toJson());
  writeNotNull('container', _$ContainerTypeEnumMap[instance.container]);
  writeNotNull('f4vSettings', instance.f4vSettings?.toJson());
  writeNotNull('m2tsSettings', instance.m2tsSettings?.toJson());
  writeNotNull('m3u8Settings', instance.m3u8Settings?.toJson());
  writeNotNull('movSettings', instance.movSettings?.toJson());
  writeNotNull('mp4Settings', instance.mp4Settings?.toJson());
  writeNotNull('mpdSettings', instance.mpdSettings?.toJson());
  writeNotNull('mxfSettings', instance.mxfSettings?.toJson());
  return val;
}

const _$ContainerTypeEnumMap = {
  ContainerType.f4v: 'F4V',
  ContainerType.ismv: 'ISMV',
  ContainerType.m2ts: 'M2TS',
  ContainerType.m3u8: 'M3U8',
  ContainerType.cmfc: 'CMFC',
  ContainerType.mov: 'MOV',
  ContainerType.mp4: 'MP4',
  ContainerType.mpd: 'MPD',
  ContainerType.mxf: 'MXF',
  ContainerType.webm: 'WEBM',
  ContainerType.raw: 'RAW',
};

CreateJobResponse _$CreateJobResponseFromJson(Map<String, dynamic> json) {
  return CreateJobResponse(
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

CreateJobTemplateResponse _$CreateJobTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateJobTemplateResponse(
    jobTemplate: json['jobTemplate'] == null
        ? null
        : JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>),
  );
}

CreatePresetResponse _$CreatePresetResponseFromJson(Map<String, dynamic> json) {
  return CreatePresetResponse(
    preset: json['preset'] == null
        ? null
        : Preset.fromJson(json['preset'] as Map<String, dynamic>),
  );
}

CreateQueueResponse _$CreateQueueResponseFromJson(Map<String, dynamic> json) {
  return CreateQueueResponse(
    queue: json['queue'] == null
        ? null
        : Queue.fromJson(json['queue'] as Map<String, dynamic>),
  );
}

DashAdditionalManifest _$DashAdditionalManifestFromJson(
    Map<String, dynamic> json) {
  return DashAdditionalManifest(
    manifestNameModifier: json['manifestNameModifier'] as String,
    selectedOutputs:
        (json['selectedOutputs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DashAdditionalManifestToJson(
    DashAdditionalManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestNameModifier', instance.manifestNameModifier);
  writeNotNull('selectedOutputs', instance.selectedOutputs);
  return val;
}

DashIsoEncryptionSettings _$DashIsoEncryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return DashIsoEncryptionSettings(
    playbackDeviceCompatibility: _$enumDecodeNullable(
        _$DashIsoPlaybackDeviceCompatibilityEnumMap,
        json['playbackDeviceCompatibility']),
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DashIsoEncryptionSettingsToJson(
    DashIsoEncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'playbackDeviceCompatibility',
      _$DashIsoPlaybackDeviceCompatibilityEnumMap[
          instance.playbackDeviceCompatibility]);
  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  return val;
}

const _$DashIsoPlaybackDeviceCompatibilityEnumMap = {
  DashIsoPlaybackDeviceCompatibility.cencV1: 'CENC_V1',
  DashIsoPlaybackDeviceCompatibility.unencryptedSei: 'UNENCRYPTED_SEI',
};

DashIsoGroupSettings _$DashIsoGroupSettingsFromJson(Map<String, dynamic> json) {
  return DashIsoGroupSettings(
    additionalManifests: (json['additionalManifests'] as List)
        ?.map((e) => e == null
            ? null
            : DashAdditionalManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    baseUrl: json['baseUrl'] as String,
    destination: json['destination'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : DestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    encryption: json['encryption'] == null
        ? null
        : DashIsoEncryptionSettings.fromJson(
            json['encryption'] as Map<String, dynamic>),
    fragmentLength: json['fragmentLength'] as int,
    hbbtvCompliance: _$enumDecodeNullable(
        _$DashIsoHbbtvComplianceEnumMap, json['hbbtvCompliance']),
    minBufferTime: json['minBufferTime'] as int,
    minFinalSegmentLength: (json['minFinalSegmentLength'] as num)?.toDouble(),
    mpdProfile:
        _$enumDecodeNullable(_$DashIsoMpdProfileEnumMap, json['mpdProfile']),
    segmentControl: _$enumDecodeNullable(
        _$DashIsoSegmentControlEnumMap, json['segmentControl']),
    segmentLength: json['segmentLength'] as int,
    writeSegmentTimelineInRepresentation: _$enumDecodeNullable(
        _$DashIsoWriteSegmentTimelineInRepresentationEnumMap,
        json['writeSegmentTimelineInRepresentation']),
  );
}

Map<String, dynamic> _$DashIsoGroupSettingsToJson(
    DashIsoGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalManifests',
      instance.additionalManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('baseUrl', instance.baseUrl);
  writeNotNull('destination', instance.destination);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('fragmentLength', instance.fragmentLength);
  writeNotNull('hbbtvCompliance',
      _$DashIsoHbbtvComplianceEnumMap[instance.hbbtvCompliance]);
  writeNotNull('minBufferTime', instance.minBufferTime);
  writeNotNull('minFinalSegmentLength', instance.minFinalSegmentLength);
  writeNotNull('mpdProfile', _$DashIsoMpdProfileEnumMap[instance.mpdProfile]);
  writeNotNull('segmentControl',
      _$DashIsoSegmentControlEnumMap[instance.segmentControl]);
  writeNotNull('segmentLength', instance.segmentLength);
  writeNotNull(
      'writeSegmentTimelineInRepresentation',
      _$DashIsoWriteSegmentTimelineInRepresentationEnumMap[
          instance.writeSegmentTimelineInRepresentation]);
  return val;
}

const _$DashIsoHbbtvComplianceEnumMap = {
  DashIsoHbbtvCompliance.hbbtv_1_5: 'HBBTV_1_5',
  DashIsoHbbtvCompliance.none: 'NONE',
};

const _$DashIsoMpdProfileEnumMap = {
  DashIsoMpdProfile.mainProfile: 'MAIN_PROFILE',
  DashIsoMpdProfile.onDemandProfile: 'ON_DEMAND_PROFILE',
};

const _$DashIsoSegmentControlEnumMap = {
  DashIsoSegmentControl.singleFile: 'SINGLE_FILE',
  DashIsoSegmentControl.segmentedFiles: 'SEGMENTED_FILES',
};

const _$DashIsoWriteSegmentTimelineInRepresentationEnumMap = {
  DashIsoWriteSegmentTimelineInRepresentation.enabled: 'ENABLED',
  DashIsoWriteSegmentTimelineInRepresentation.disabled: 'DISABLED',
};

Deinterlacer _$DeinterlacerFromJson(Map<String, dynamic> json) {
  return Deinterlacer(
    algorithm:
        _$enumDecodeNullable(_$DeinterlaceAlgorithmEnumMap, json['algorithm']),
    control:
        _$enumDecodeNullable(_$DeinterlacerControlEnumMap, json['control']),
    mode: _$enumDecodeNullable(_$DeinterlacerModeEnumMap, json['mode']),
  );
}

Map<String, dynamic> _$DeinterlacerToJson(Deinterlacer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithm', _$DeinterlaceAlgorithmEnumMap[instance.algorithm]);
  writeNotNull('control', _$DeinterlacerControlEnumMap[instance.control]);
  writeNotNull('mode', _$DeinterlacerModeEnumMap[instance.mode]);
  return val;
}

const _$DeinterlaceAlgorithmEnumMap = {
  DeinterlaceAlgorithm.interpolate: 'INTERPOLATE',
  DeinterlaceAlgorithm.interpolateTicker: 'INTERPOLATE_TICKER',
  DeinterlaceAlgorithm.blend: 'BLEND',
  DeinterlaceAlgorithm.blendTicker: 'BLEND_TICKER',
};

const _$DeinterlacerControlEnumMap = {
  DeinterlacerControl.forceAllFrames: 'FORCE_ALL_FRAMES',
  DeinterlacerControl.normal: 'NORMAL',
};

const _$DeinterlacerModeEnumMap = {
  DeinterlacerMode.deinterlace: 'DEINTERLACE',
  DeinterlacerMode.inverseTelecine: 'INVERSE_TELECINE',
  DeinterlacerMode.adaptive: 'ADAPTIVE',
};

DeleteJobTemplateResponse _$DeleteJobTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteJobTemplateResponse();
}

DeletePresetResponse _$DeletePresetResponseFromJson(Map<String, dynamic> json) {
  return DeletePresetResponse();
}

DeleteQueueResponse _$DeleteQueueResponseFromJson(Map<String, dynamic> json) {
  return DeleteQueueResponse();
}

DescribeEndpointsResponse _$DescribeEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointsResponse(
    endpoints: (json['endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DestinationSettings _$DestinationSettingsFromJson(Map<String, dynamic> json) {
  return DestinationSettings(
    s3Settings: json['s3Settings'] == null
        ? null
        : S3DestinationSettings.fromJson(
            json['s3Settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DestinationSettingsToJson(DestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Settings', instance.s3Settings?.toJson());
  return val;
}

DisassociateCertificateResponse _$DisassociateCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateCertificateResponse();
}

DolbyVision _$DolbyVisionFromJson(Map<String, dynamic> json) {
  return DolbyVision(
    l6Metadata: json['l6Metadata'] == null
        ? null
        : DolbyVisionLevel6Metadata.fromJson(
            json['l6Metadata'] as Map<String, dynamic>),
    l6Mode:
        _$enumDecodeNullable(_$DolbyVisionLevel6ModeEnumMap, json['l6Mode']),
    profile: _$enumDecodeNullable(_$DolbyVisionProfileEnumMap, json['profile']),
  );
}

Map<String, dynamic> _$DolbyVisionToJson(DolbyVision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('l6Metadata', instance.l6Metadata?.toJson());
  writeNotNull('l6Mode', _$DolbyVisionLevel6ModeEnumMap[instance.l6Mode]);
  writeNotNull('profile', _$DolbyVisionProfileEnumMap[instance.profile]);
  return val;
}

const _$DolbyVisionLevel6ModeEnumMap = {
  DolbyVisionLevel6Mode.passthrough: 'PASSTHROUGH',
  DolbyVisionLevel6Mode.recalculate: 'RECALCULATE',
  DolbyVisionLevel6Mode.specify: 'SPECIFY',
};

const _$DolbyVisionProfileEnumMap = {
  DolbyVisionProfile.profile_5: 'PROFILE_5',
};

DolbyVisionLevel6Metadata _$DolbyVisionLevel6MetadataFromJson(
    Map<String, dynamic> json) {
  return DolbyVisionLevel6Metadata(
    maxCll: json['maxCll'] as int,
    maxFall: json['maxFall'] as int,
  );
}

Map<String, dynamic> _$DolbyVisionLevel6MetadataToJson(
    DolbyVisionLevel6Metadata instance) {
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

DvbNitSettings _$DvbNitSettingsFromJson(Map<String, dynamic> json) {
  return DvbNitSettings(
    networkId: json['networkId'] as int,
    networkName: json['networkName'] as String,
    nitInterval: json['nitInterval'] as int,
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
  writeNotNull('nitInterval', instance.nitInterval);
  return val;
}

DvbSdtSettings _$DvbSdtSettingsFromJson(Map<String, dynamic> json) {
  return DvbSdtSettings(
    outputSdt: _$enumDecodeNullable(_$OutputSdtEnumMap, json['outputSdt']),
    sdtInterval: json['sdtInterval'] as int,
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

  writeNotNull('outputSdt', _$OutputSdtEnumMap[instance.outputSdt]);
  writeNotNull('sdtInterval', instance.sdtInterval);
  writeNotNull('serviceName', instance.serviceName);
  writeNotNull('serviceProviderName', instance.serviceProviderName);
  return val;
}

const _$OutputSdtEnumMap = {
  OutputSdt.sdtFollow: 'SDT_FOLLOW',
  OutputSdt.sdtFollowIfPresent: 'SDT_FOLLOW_IF_PRESENT',
  OutputSdt.sdtManual: 'SDT_MANUAL',
  OutputSdt.sdtNone: 'SDT_NONE',
};

DvbSubDestinationSettings _$DvbSubDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return DvbSubDestinationSettings(
    alignment:
        _$enumDecodeNullable(_$DvbSubtitleAlignmentEnumMap, json['alignment']),
    backgroundColor: _$enumDecodeNullable(
        _$DvbSubtitleBackgroundColorEnumMap, json['backgroundColor']),
    backgroundOpacity: json['backgroundOpacity'] as int,
    fontColor:
        _$enumDecodeNullable(_$DvbSubtitleFontColorEnumMap, json['fontColor']),
    fontOpacity: json['fontOpacity'] as int,
    fontResolution: json['fontResolution'] as int,
    fontScript: _$enumDecodeNullable(_$FontScriptEnumMap, json['fontScript']),
    fontSize: json['fontSize'] as int,
    outlineColor: _$enumDecodeNullable(
        _$DvbSubtitleOutlineColorEnumMap, json['outlineColor']),
    outlineSize: json['outlineSize'] as int,
    shadowColor: _$enumDecodeNullable(
        _$DvbSubtitleShadowColorEnumMap, json['shadowColor']),
    shadowOpacity: json['shadowOpacity'] as int,
    shadowXOffset: json['shadowXOffset'] as int,
    shadowYOffset: json['shadowYOffset'] as int,
    subtitlingType: _$enumDecodeNullable(
        _$DvbSubtitlingTypeEnumMap, json['subtitlingType']),
    teletextSpacing: _$enumDecodeNullable(
        _$DvbSubtitleTeletextSpacingEnumMap, json['teletextSpacing']),
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

  writeNotNull('alignment', _$DvbSubtitleAlignmentEnumMap[instance.alignment]);
  writeNotNull('backgroundColor',
      _$DvbSubtitleBackgroundColorEnumMap[instance.backgroundColor]);
  writeNotNull('backgroundOpacity', instance.backgroundOpacity);
  writeNotNull('fontColor', _$DvbSubtitleFontColorEnumMap[instance.fontColor]);
  writeNotNull('fontOpacity', instance.fontOpacity);
  writeNotNull('fontResolution', instance.fontResolution);
  writeNotNull('fontScript', _$FontScriptEnumMap[instance.fontScript]);
  writeNotNull('fontSize', instance.fontSize);
  writeNotNull(
      'outlineColor', _$DvbSubtitleOutlineColorEnumMap[instance.outlineColor]);
  writeNotNull('outlineSize', instance.outlineSize);
  writeNotNull(
      'shadowColor', _$DvbSubtitleShadowColorEnumMap[instance.shadowColor]);
  writeNotNull('shadowOpacity', instance.shadowOpacity);
  writeNotNull('shadowXOffset', instance.shadowXOffset);
  writeNotNull('shadowYOffset', instance.shadowYOffset);
  writeNotNull(
      'subtitlingType', _$DvbSubtitlingTypeEnumMap[instance.subtitlingType]);
  writeNotNull('teletextSpacing',
      _$DvbSubtitleTeletextSpacingEnumMap[instance.teletextSpacing]);
  writeNotNull('xPosition', instance.xPosition);
  writeNotNull('yPosition', instance.yPosition);
  return val;
}

const _$DvbSubtitleAlignmentEnumMap = {
  DvbSubtitleAlignment.centered: 'CENTERED',
  DvbSubtitleAlignment.left: 'LEFT',
};

const _$DvbSubtitleBackgroundColorEnumMap = {
  DvbSubtitleBackgroundColor.none: 'NONE',
  DvbSubtitleBackgroundColor.black: 'BLACK',
  DvbSubtitleBackgroundColor.white: 'WHITE',
};

const _$DvbSubtitleFontColorEnumMap = {
  DvbSubtitleFontColor.white: 'WHITE',
  DvbSubtitleFontColor.black: 'BLACK',
  DvbSubtitleFontColor.yellow: 'YELLOW',
  DvbSubtitleFontColor.red: 'RED',
  DvbSubtitleFontColor.green: 'GREEN',
  DvbSubtitleFontColor.blue: 'BLUE',
};

const _$DvbSubtitleOutlineColorEnumMap = {
  DvbSubtitleOutlineColor.black: 'BLACK',
  DvbSubtitleOutlineColor.white: 'WHITE',
  DvbSubtitleOutlineColor.yellow: 'YELLOW',
  DvbSubtitleOutlineColor.red: 'RED',
  DvbSubtitleOutlineColor.green: 'GREEN',
  DvbSubtitleOutlineColor.blue: 'BLUE',
};

const _$DvbSubtitleShadowColorEnumMap = {
  DvbSubtitleShadowColor.none: 'NONE',
  DvbSubtitleShadowColor.black: 'BLACK',
  DvbSubtitleShadowColor.white: 'WHITE',
};

const _$DvbSubtitlingTypeEnumMap = {
  DvbSubtitlingType.hearingImpaired: 'HEARING_IMPAIRED',
  DvbSubtitlingType.standard: 'STANDARD',
};

const _$DvbSubtitleTeletextSpacingEnumMap = {
  DvbSubtitleTeletextSpacing.fixedGrid: 'FIXED_GRID',
  DvbSubtitleTeletextSpacing.proportional: 'PROPORTIONAL',
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
    tdtInterval: json['tdtInterval'] as int,
  );
}

Map<String, dynamic> _$DvbTdtSettingsToJson(DvbTdtSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tdtInterval', instance.tdtInterval);
  return val;
}

Eac3AtmosSettings _$Eac3AtmosSettingsFromJson(Map<String, dynamic> json) {
  return Eac3AtmosSettings(
    bitrate: json['bitrate'] as int,
    bitstreamMode: _$enumDecodeNullable(
        _$Eac3AtmosBitstreamModeEnumMap, json['bitstreamMode']),
    codingMode:
        _$enumDecodeNullable(_$Eac3AtmosCodingModeEnumMap, json['codingMode']),
    dialogueIntelligence: _$enumDecodeNullable(
        _$Eac3AtmosDialogueIntelligenceEnumMap, json['dialogueIntelligence']),
    dynamicRangeCompressionLine: _$enumDecodeNullable(
        _$Eac3AtmosDynamicRangeCompressionLineEnumMap,
        json['dynamicRangeCompressionLine']),
    dynamicRangeCompressionRf: _$enumDecodeNullable(
        _$Eac3AtmosDynamicRangeCompressionRfEnumMap,
        json['dynamicRangeCompressionRf']),
    loRoCenterMixLevel: (json['loRoCenterMixLevel'] as num)?.toDouble(),
    loRoSurroundMixLevel: (json['loRoSurroundMixLevel'] as num)?.toDouble(),
    ltRtCenterMixLevel: (json['ltRtCenterMixLevel'] as num)?.toDouble(),
    ltRtSurroundMixLevel: (json['ltRtSurroundMixLevel'] as num)?.toDouble(),
    meteringMode: _$enumDecodeNullable(
        _$Eac3AtmosMeteringModeEnumMap, json['meteringMode']),
    sampleRate: json['sampleRate'] as int,
    speechThreshold: json['speechThreshold'] as int,
    stereoDownmix: _$enumDecodeNullable(
        _$Eac3AtmosStereoDownmixEnumMap, json['stereoDownmix']),
    surroundExMode: _$enumDecodeNullable(
        _$Eac3AtmosSurroundExModeEnumMap, json['surroundExMode']),
  );
}

Map<String, dynamic> _$Eac3AtmosSettingsToJson(Eac3AtmosSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull(
      'bitstreamMode', _$Eac3AtmosBitstreamModeEnumMap[instance.bitstreamMode]);
  writeNotNull('codingMode', _$Eac3AtmosCodingModeEnumMap[instance.codingMode]);
  writeNotNull('dialogueIntelligence',
      _$Eac3AtmosDialogueIntelligenceEnumMap[instance.dialogueIntelligence]);
  writeNotNull(
      'dynamicRangeCompressionLine',
      _$Eac3AtmosDynamicRangeCompressionLineEnumMap[
          instance.dynamicRangeCompressionLine]);
  writeNotNull(
      'dynamicRangeCompressionRf',
      _$Eac3AtmosDynamicRangeCompressionRfEnumMap[
          instance.dynamicRangeCompressionRf]);
  writeNotNull('loRoCenterMixLevel', instance.loRoCenterMixLevel);
  writeNotNull('loRoSurroundMixLevel', instance.loRoSurroundMixLevel);
  writeNotNull('ltRtCenterMixLevel', instance.ltRtCenterMixLevel);
  writeNotNull('ltRtSurroundMixLevel', instance.ltRtSurroundMixLevel);
  writeNotNull(
      'meteringMode', _$Eac3AtmosMeteringModeEnumMap[instance.meteringMode]);
  writeNotNull('sampleRate', instance.sampleRate);
  writeNotNull('speechThreshold', instance.speechThreshold);
  writeNotNull(
      'stereoDownmix', _$Eac3AtmosStereoDownmixEnumMap[instance.stereoDownmix]);
  writeNotNull('surroundExMode',
      _$Eac3AtmosSurroundExModeEnumMap[instance.surroundExMode]);
  return val;
}

const _$Eac3AtmosBitstreamModeEnumMap = {
  Eac3AtmosBitstreamMode.completeMain: 'COMPLETE_MAIN',
};

const _$Eac3AtmosCodingModeEnumMap = {
  Eac3AtmosCodingMode.codingMode_9_1_6: 'CODING_MODE_9_1_6',
};

const _$Eac3AtmosDialogueIntelligenceEnumMap = {
  Eac3AtmosDialogueIntelligence.enabled: 'ENABLED',
  Eac3AtmosDialogueIntelligence.disabled: 'DISABLED',
};

const _$Eac3AtmosDynamicRangeCompressionLineEnumMap = {
  Eac3AtmosDynamicRangeCompressionLine.none: 'NONE',
  Eac3AtmosDynamicRangeCompressionLine.filmStandard: 'FILM_STANDARD',
  Eac3AtmosDynamicRangeCompressionLine.filmLight: 'FILM_LIGHT',
  Eac3AtmosDynamicRangeCompressionLine.musicStandard: 'MUSIC_STANDARD',
  Eac3AtmosDynamicRangeCompressionLine.musicLight: 'MUSIC_LIGHT',
  Eac3AtmosDynamicRangeCompressionLine.speech: 'SPEECH',
};

const _$Eac3AtmosDynamicRangeCompressionRfEnumMap = {
  Eac3AtmosDynamicRangeCompressionRf.none: 'NONE',
  Eac3AtmosDynamicRangeCompressionRf.filmStandard: 'FILM_STANDARD',
  Eac3AtmosDynamicRangeCompressionRf.filmLight: 'FILM_LIGHT',
  Eac3AtmosDynamicRangeCompressionRf.musicStandard: 'MUSIC_STANDARD',
  Eac3AtmosDynamicRangeCompressionRf.musicLight: 'MUSIC_LIGHT',
  Eac3AtmosDynamicRangeCompressionRf.speech: 'SPEECH',
};

const _$Eac3AtmosMeteringModeEnumMap = {
  Eac3AtmosMeteringMode.leqA: 'LEQ_A',
  Eac3AtmosMeteringMode.ituBs_1770_1: 'ITU_BS_1770_1',
  Eac3AtmosMeteringMode.ituBs_1770_2: 'ITU_BS_1770_2',
  Eac3AtmosMeteringMode.ituBs_1770_3: 'ITU_BS_1770_3',
  Eac3AtmosMeteringMode.ituBs_1770_4: 'ITU_BS_1770_4',
};

const _$Eac3AtmosStereoDownmixEnumMap = {
  Eac3AtmosStereoDownmix.notIndicated: 'NOT_INDICATED',
  Eac3AtmosStereoDownmix.stereo: 'STEREO',
  Eac3AtmosStereoDownmix.surround: 'SURROUND',
  Eac3AtmosStereoDownmix.dpl2: 'DPL2',
};

const _$Eac3AtmosSurroundExModeEnumMap = {
  Eac3AtmosSurroundExMode.notIndicated: 'NOT_INDICATED',
  Eac3AtmosSurroundExMode.enabled: 'ENABLED',
  Eac3AtmosSurroundExMode.disabled: 'DISABLED',
};

Eac3Settings _$Eac3SettingsFromJson(Map<String, dynamic> json) {
  return Eac3Settings(
    attenuationControl: _$enumDecodeNullable(
        _$Eac3AttenuationControlEnumMap, json['attenuationControl']),
    bitrate: json['bitrate'] as int,
    bitstreamMode:
        _$enumDecodeNullable(_$Eac3BitstreamModeEnumMap, json['bitstreamMode']),
    codingMode:
        _$enumDecodeNullable(_$Eac3CodingModeEnumMap, json['codingMode']),
    dcFilter: _$enumDecodeNullable(_$Eac3DcFilterEnumMap, json['dcFilter']),
    dialnorm: json['dialnorm'] as int,
    dynamicRangeCompressionLine: _$enumDecodeNullable(
        _$Eac3DynamicRangeCompressionLineEnumMap,
        json['dynamicRangeCompressionLine']),
    dynamicRangeCompressionRf: _$enumDecodeNullable(
        _$Eac3DynamicRangeCompressionRfEnumMap,
        json['dynamicRangeCompressionRf']),
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
    sampleRate: json['sampleRate'] as int,
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
  writeNotNull(
      'dynamicRangeCompressionLine',
      _$Eac3DynamicRangeCompressionLineEnumMap[
          instance.dynamicRangeCompressionLine]);
  writeNotNull(
      'dynamicRangeCompressionRf',
      _$Eac3DynamicRangeCompressionRfEnumMap[
          instance.dynamicRangeCompressionRf]);
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
  writeNotNull('sampleRate', instance.sampleRate);
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
  Eac3BitstreamMode.completeMain: 'COMPLETE_MAIN',
  Eac3BitstreamMode.commentary: 'COMMENTARY',
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
  Eac3DcFilter.enabled: 'ENABLED',
  Eac3DcFilter.disabled: 'DISABLED',
};

const _$Eac3DynamicRangeCompressionLineEnumMap = {
  Eac3DynamicRangeCompressionLine.none: 'NONE',
  Eac3DynamicRangeCompressionLine.filmStandard: 'FILM_STANDARD',
  Eac3DynamicRangeCompressionLine.filmLight: 'FILM_LIGHT',
  Eac3DynamicRangeCompressionLine.musicStandard: 'MUSIC_STANDARD',
  Eac3DynamicRangeCompressionLine.musicLight: 'MUSIC_LIGHT',
  Eac3DynamicRangeCompressionLine.speech: 'SPEECH',
};

const _$Eac3DynamicRangeCompressionRfEnumMap = {
  Eac3DynamicRangeCompressionRf.none: 'NONE',
  Eac3DynamicRangeCompressionRf.filmStandard: 'FILM_STANDARD',
  Eac3DynamicRangeCompressionRf.filmLight: 'FILM_LIGHT',
  Eac3DynamicRangeCompressionRf.musicStandard: 'MUSIC_STANDARD',
  Eac3DynamicRangeCompressionRf.musicLight: 'MUSIC_LIGHT',
  Eac3DynamicRangeCompressionRf.speech: 'SPEECH',
};

const _$Eac3LfeControlEnumMap = {
  Eac3LfeControl.lfe: 'LFE',
  Eac3LfeControl.noLfe: 'NO_LFE',
};

const _$Eac3LfeFilterEnumMap = {
  Eac3LfeFilter.enabled: 'ENABLED',
  Eac3LfeFilter.disabled: 'DISABLED',
};

const _$Eac3MetadataControlEnumMap = {
  Eac3MetadataControl.followInput: 'FOLLOW_INPUT',
  Eac3MetadataControl.useConfigured: 'USE_CONFIGURED',
};

const _$Eac3PassthroughControlEnumMap = {
  Eac3PassthroughControl.whenPossible: 'WHEN_POSSIBLE',
  Eac3PassthroughControl.noPassthrough: 'NO_PASSTHROUGH',
};

const _$Eac3PhaseControlEnumMap = {
  Eac3PhaseControl.shift_90Degrees: 'SHIFT_90_DEGREES',
  Eac3PhaseControl.noShift: 'NO_SHIFT',
};

const _$Eac3StereoDownmixEnumMap = {
  Eac3StereoDownmix.notIndicated: 'NOT_INDICATED',
  Eac3StereoDownmix.loRo: 'LO_RO',
  Eac3StereoDownmix.ltRt: 'LT_RT',
  Eac3StereoDownmix.dpl2: 'DPL2',
};

const _$Eac3SurroundExModeEnumMap = {
  Eac3SurroundExMode.notIndicated: 'NOT_INDICATED',
  Eac3SurroundExMode.enabled: 'ENABLED',
  Eac3SurroundExMode.disabled: 'DISABLED',
};

const _$Eac3SurroundModeEnumMap = {
  Eac3SurroundMode.notIndicated: 'NOT_INDICATED',
  Eac3SurroundMode.enabled: 'ENABLED',
  Eac3SurroundMode.disabled: 'DISABLED',
};

EmbeddedDestinationSettings _$EmbeddedDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return EmbeddedDestinationSettings(
    destination608ChannelNumber: json['destination608ChannelNumber'] as int,
    destination708ServiceNumber: json['destination708ServiceNumber'] as int,
  );
}

Map<String, dynamic> _$EmbeddedDestinationSettingsToJson(
    EmbeddedDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'destination608ChannelNumber', instance.destination608ChannelNumber);
  writeNotNull(
      'destination708ServiceNumber', instance.destination708ServiceNumber);
  return val;
}

EmbeddedSourceSettings _$EmbeddedSourceSettingsFromJson(
    Map<String, dynamic> json) {
  return EmbeddedSourceSettings(
    convert608To708: _$enumDecodeNullable(
        _$EmbeddedConvert608To708EnumMap, json['convert608To708']),
    source608ChannelNumber: json['source608ChannelNumber'] as int,
    source608TrackNumber: json['source608TrackNumber'] as int,
    terminateCaptions: _$enumDecodeNullable(
        _$EmbeddedTerminateCaptionsEnumMap, json['terminateCaptions']),
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
  writeNotNull('source608ChannelNumber', instance.source608ChannelNumber);
  writeNotNull('source608TrackNumber', instance.source608TrackNumber);
  writeNotNull('terminateCaptions',
      _$EmbeddedTerminateCaptionsEnumMap[instance.terminateCaptions]);
  return val;
}

const _$EmbeddedConvert608To708EnumMap = {
  EmbeddedConvert608To708.upconvert: 'UPCONVERT',
  EmbeddedConvert608To708.disabled: 'DISABLED',
};

const _$EmbeddedTerminateCaptionsEnumMap = {
  EmbeddedTerminateCaptions.endOfInput: 'END_OF_INPUT',
  EmbeddedTerminateCaptions.disabled: 'DISABLED',
};

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    url: json['url'] as String,
  );
}

EsamManifestConfirmConditionNotification
    _$EsamManifestConfirmConditionNotificationFromJson(
        Map<String, dynamic> json) {
  return EsamManifestConfirmConditionNotification(
    mccXml: json['mccXml'] as String,
  );
}

Map<String, dynamic> _$EsamManifestConfirmConditionNotificationToJson(
    EsamManifestConfirmConditionNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mccXml', instance.mccXml);
  return val;
}

EsamSettings _$EsamSettingsFromJson(Map<String, dynamic> json) {
  return EsamSettings(
    manifestConfirmConditionNotification:
        json['manifestConfirmConditionNotification'] == null
            ? null
            : EsamManifestConfirmConditionNotification.fromJson(
                json['manifestConfirmConditionNotification']
                    as Map<String, dynamic>),
    responseSignalPreroll: json['responseSignalPreroll'] as int,
    signalProcessingNotification: json['signalProcessingNotification'] == null
        ? null
        : EsamSignalProcessingNotification.fromJson(
            json['signalProcessingNotification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EsamSettingsToJson(EsamSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestConfirmConditionNotification',
      instance.manifestConfirmConditionNotification?.toJson());
  writeNotNull('responseSignalPreroll', instance.responseSignalPreroll);
  writeNotNull('signalProcessingNotification',
      instance.signalProcessingNotification?.toJson());
  return val;
}

EsamSignalProcessingNotification _$EsamSignalProcessingNotificationFromJson(
    Map<String, dynamic> json) {
  return EsamSignalProcessingNotification(
    sccXml: json['sccXml'] as String,
  );
}

Map<String, dynamic> _$EsamSignalProcessingNotificationToJson(
    EsamSignalProcessingNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sccXml', instance.sccXml);
  return val;
}

F4vSettings _$F4vSettingsFromJson(Map<String, dynamic> json) {
  return F4vSettings(
    moovPlacement:
        _$enumDecodeNullable(_$F4vMoovPlacementEnumMap, json['moovPlacement']),
  );
}

Map<String, dynamic> _$F4vSettingsToJson(F4vSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'moovPlacement', _$F4vMoovPlacementEnumMap[instance.moovPlacement]);
  return val;
}

const _$F4vMoovPlacementEnumMap = {
  F4vMoovPlacement.progressiveDownload: 'PROGRESSIVE_DOWNLOAD',
  F4vMoovPlacement.normal: 'NORMAL',
};

FileGroupSettings _$FileGroupSettingsFromJson(Map<String, dynamic> json) {
  return FileGroupSettings(
    destination: json['destination'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : DestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FileGroupSettingsToJson(FileGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  return val;
}

FileSourceSettings _$FileSourceSettingsFromJson(Map<String, dynamic> json) {
  return FileSourceSettings(
    convert608To708: _$enumDecodeNullable(
        _$FileSourceConvert608To708EnumMap, json['convert608To708']),
    framerate: json['framerate'] == null
        ? null
        : CaptionSourceFramerate.fromJson(
            json['framerate'] as Map<String, dynamic>),
    sourceFile: json['sourceFile'] as String,
    timeDelta: json['timeDelta'] as int,
  );
}

Map<String, dynamic> _$FileSourceSettingsToJson(FileSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('convert608To708',
      _$FileSourceConvert608To708EnumMap[instance.convert608To708]);
  writeNotNull('framerate', instance.framerate?.toJson());
  writeNotNull('sourceFile', instance.sourceFile);
  writeNotNull('timeDelta', instance.timeDelta);
  return val;
}

const _$FileSourceConvert608To708EnumMap = {
  FileSourceConvert608To708.upconvert: 'UPCONVERT',
  FileSourceConvert608To708.disabled: 'DISABLED',
};

FrameCaptureSettings _$FrameCaptureSettingsFromJson(Map<String, dynamic> json) {
  return FrameCaptureSettings(
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    maxCaptures: json['maxCaptures'] as int,
    quality: json['quality'] as int,
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

  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('maxCaptures', instance.maxCaptures);
  writeNotNull('quality', instance.quality);
  return val;
}

GetJobResponse _$GetJobResponseFromJson(Map<String, dynamic> json) {
  return GetJobResponse(
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

GetJobTemplateResponse _$GetJobTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetJobTemplateResponse(
    jobTemplate: json['jobTemplate'] == null
        ? null
        : JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>),
  );
}

GetPresetResponse _$GetPresetResponseFromJson(Map<String, dynamic> json) {
  return GetPresetResponse(
    preset: json['preset'] == null
        ? null
        : Preset.fromJson(json['preset'] as Map<String, dynamic>),
  );
}

GetQueueResponse _$GetQueueResponseFromJson(Map<String, dynamic> json) {
  return GetQueueResponse(
    queue: json['queue'] == null
        ? null
        : Queue.fromJson(json['queue'] as Map<String, dynamic>),
  );
}

H264QvbrSettings _$H264QvbrSettingsFromJson(Map<String, dynamic> json) {
  return H264QvbrSettings(
    maxAverageBitrate: json['maxAverageBitrate'] as int,
    qvbrQualityLevel: json['qvbrQualityLevel'] as int,
    qvbrQualityLevelFineTune:
        (json['qvbrQualityLevelFineTune'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$H264QvbrSettingsToJson(H264QvbrSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxAverageBitrate', instance.maxAverageBitrate);
  writeNotNull('qvbrQualityLevel', instance.qvbrQualityLevel);
  writeNotNull('qvbrQualityLevelFineTune', instance.qvbrQualityLevelFineTune);
  return val;
}

H264Settings _$H264SettingsFromJson(Map<String, dynamic> json) {
  return H264Settings(
    adaptiveQuantization: _$enumDecodeNullable(
        _$H264AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    bitrate: json['bitrate'] as int,
    codecLevel:
        _$enumDecodeNullable(_$H264CodecLevelEnumMap, json['codecLevel']),
    codecProfile:
        _$enumDecodeNullable(_$H264CodecProfileEnumMap, json['codecProfile']),
    dynamicSubGop:
        _$enumDecodeNullable(_$H264DynamicSubGopEnumMap, json['dynamicSubGop']),
    entropyEncoding: _$enumDecodeNullable(
        _$H264EntropyEncodingEnumMap, json['entropyEncoding']),
    fieldEncoding:
        _$enumDecodeNullable(_$H264FieldEncodingEnumMap, json['fieldEncoding']),
    flickerAdaptiveQuantization: _$enumDecodeNullable(
        _$H264FlickerAdaptiveQuantizationEnumMap,
        json['flickerAdaptiveQuantization']),
    framerateControl: _$enumDecodeNullable(
        _$H264FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$H264FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopBReference:
        _$enumDecodeNullable(_$H264GopBReferenceEnumMap, json['gopBReference']),
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$H264GopSizeUnitsEnumMap, json['gopSizeUnits']),
    hrdBufferInitialFillPercentage:
        json['hrdBufferInitialFillPercentage'] as int,
    hrdBufferSize: json['hrdBufferSize'] as int,
    interlaceMode:
        _$enumDecodeNullable(_$H264InterlaceModeEnumMap, json['interlaceMode']),
    maxBitrate: json['maxBitrate'] as int,
    minIInterval: json['minIInterval'] as int,
    numberBFramesBetweenReferenceFrames:
        json['numberBFramesBetweenReferenceFrames'] as int,
    numberReferenceFrames: json['numberReferenceFrames'] as int,
    parControl:
        _$enumDecodeNullable(_$H264ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    qualityTuningLevel: _$enumDecodeNullable(
        _$H264QualityTuningLevelEnumMap, json['qualityTuningLevel']),
    qvbrSettings: json['qvbrSettings'] == null
        ? null
        : H264QvbrSettings.fromJson(
            json['qvbrSettings'] as Map<String, dynamic>),
    rateControlMode: _$enumDecodeNullable(
        _$H264RateControlModeEnumMap, json['rateControlMode']),
    repeatPps: _$enumDecodeNullable(_$H264RepeatPpsEnumMap, json['repeatPps']),
    sceneChangeDetect: _$enumDecodeNullable(
        _$H264SceneChangeDetectEnumMap, json['sceneChangeDetect']),
    slices: json['slices'] as int,
    slowPal: _$enumDecodeNullable(_$H264SlowPalEnumMap, json['slowPal']),
    softness: json['softness'] as int,
    spatialAdaptiveQuantization: _$enumDecodeNullable(
        _$H264SpatialAdaptiveQuantizationEnumMap,
        json['spatialAdaptiveQuantization']),
    syntax: _$enumDecodeNullable(_$H264SyntaxEnumMap, json['syntax']),
    telecine: _$enumDecodeNullable(_$H264TelecineEnumMap, json['telecine']),
    temporalAdaptiveQuantization: _$enumDecodeNullable(
        _$H264TemporalAdaptiveQuantizationEnumMap,
        json['temporalAdaptiveQuantization']),
    unregisteredSeiTimecode: _$enumDecodeNullable(
        _$H264UnregisteredSeiTimecodeEnumMap, json['unregisteredSeiTimecode']),
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
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codecLevel', _$H264CodecLevelEnumMap[instance.codecLevel]);
  writeNotNull(
      'codecProfile', _$H264CodecProfileEnumMap[instance.codecProfile]);
  writeNotNull(
      'dynamicSubGop', _$H264DynamicSubGopEnumMap[instance.dynamicSubGop]);
  writeNotNull('entropyEncoding',
      _$H264EntropyEncodingEnumMap[instance.entropyEncoding]);
  writeNotNull(
      'fieldEncoding', _$H264FieldEncodingEnumMap[instance.fieldEncoding]);
  writeNotNull(
      'flickerAdaptiveQuantization',
      _$H264FlickerAdaptiveQuantizationEnumMap[
          instance.flickerAdaptiveQuantization]);
  writeNotNull('framerateControl',
      _$H264FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$H264FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'gopBReference', _$H264GopBReferenceEnumMap[instance.gopBReference]);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$H264GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('hrdBufferInitialFillPercentage',
      instance.hrdBufferInitialFillPercentage);
  writeNotNull('hrdBufferSize', instance.hrdBufferSize);
  writeNotNull(
      'interlaceMode', _$H264InterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('minIInterval', instance.minIInterval);
  writeNotNull('numberBFramesBetweenReferenceFrames',
      instance.numberBFramesBetweenReferenceFrames);
  writeNotNull('numberReferenceFrames', instance.numberReferenceFrames);
  writeNotNull('parControl', _$H264ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('qualityTuningLevel',
      _$H264QualityTuningLevelEnumMap[instance.qualityTuningLevel]);
  writeNotNull('qvbrSettings', instance.qvbrSettings?.toJson());
  writeNotNull('rateControlMode',
      _$H264RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('repeatPps', _$H264RepeatPpsEnumMap[instance.repeatPps]);
  writeNotNull('sceneChangeDetect',
      _$H264SceneChangeDetectEnumMap[instance.sceneChangeDetect]);
  writeNotNull('slices', instance.slices);
  writeNotNull('slowPal', _$H264SlowPalEnumMap[instance.slowPal]);
  writeNotNull('softness', instance.softness);
  writeNotNull(
      'spatialAdaptiveQuantization',
      _$H264SpatialAdaptiveQuantizationEnumMap[
          instance.spatialAdaptiveQuantization]);
  writeNotNull('syntax', _$H264SyntaxEnumMap[instance.syntax]);
  writeNotNull('telecine', _$H264TelecineEnumMap[instance.telecine]);
  writeNotNull(
      'temporalAdaptiveQuantization',
      _$H264TemporalAdaptiveQuantizationEnumMap[
          instance.temporalAdaptiveQuantization]);
  writeNotNull('unregisteredSeiTimecode',
      _$H264UnregisteredSeiTimecodeEnumMap[instance.unregisteredSeiTimecode]);
  return val;
}

const _$H264AdaptiveQuantizationEnumMap = {
  H264AdaptiveQuantization.off: 'OFF',
  H264AdaptiveQuantization.auto: 'AUTO',
  H264AdaptiveQuantization.low: 'LOW',
  H264AdaptiveQuantization.medium: 'MEDIUM',
  H264AdaptiveQuantization.high: 'HIGH',
  H264AdaptiveQuantization.higher: 'HIGHER',
  H264AdaptiveQuantization.max: 'MAX',
};

const _$H264CodecLevelEnumMap = {
  H264CodecLevel.auto: 'AUTO',
  H264CodecLevel.level_1: 'LEVEL_1',
  H264CodecLevel.level_1_1: 'LEVEL_1_1',
  H264CodecLevel.level_1_2: 'LEVEL_1_2',
  H264CodecLevel.level_1_3: 'LEVEL_1_3',
  H264CodecLevel.level_2: 'LEVEL_2',
  H264CodecLevel.level_2_1: 'LEVEL_2_1',
  H264CodecLevel.level_2_2: 'LEVEL_2_2',
  H264CodecLevel.level_3: 'LEVEL_3',
  H264CodecLevel.level_3_1: 'LEVEL_3_1',
  H264CodecLevel.level_3_2: 'LEVEL_3_2',
  H264CodecLevel.level_4: 'LEVEL_4',
  H264CodecLevel.level_4_1: 'LEVEL_4_1',
  H264CodecLevel.level_4_2: 'LEVEL_4_2',
  H264CodecLevel.level_5: 'LEVEL_5',
  H264CodecLevel.level_5_1: 'LEVEL_5_1',
  H264CodecLevel.level_5_2: 'LEVEL_5_2',
};

const _$H264CodecProfileEnumMap = {
  H264CodecProfile.baseline: 'BASELINE',
  H264CodecProfile.high: 'HIGH',
  H264CodecProfile.high_10bit: 'HIGH_10BIT',
  H264CodecProfile.high_422: 'HIGH_422',
  H264CodecProfile.high_422_10bit: 'HIGH_422_10BIT',
  H264CodecProfile.main: 'MAIN',
};

const _$H264DynamicSubGopEnumMap = {
  H264DynamicSubGop.adaptive: 'ADAPTIVE',
  H264DynamicSubGop.static: 'STATIC',
};

const _$H264EntropyEncodingEnumMap = {
  H264EntropyEncoding.cabac: 'CABAC',
  H264EntropyEncoding.cavlc: 'CAVLC',
};

const _$H264FieldEncodingEnumMap = {
  H264FieldEncoding.paff: 'PAFF',
  H264FieldEncoding.forceField: 'FORCE_FIELD',
};

const _$H264FlickerAdaptiveQuantizationEnumMap = {
  H264FlickerAdaptiveQuantization.disabled: 'DISABLED',
  H264FlickerAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H264FramerateControlEnumMap = {
  H264FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H264FramerateControl.specified: 'SPECIFIED',
};

const _$H264FramerateConversionAlgorithmEnumMap = {
  H264FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  H264FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  H264FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$H264GopBReferenceEnumMap = {
  H264GopBReference.disabled: 'DISABLED',
  H264GopBReference.enabled: 'ENABLED',
};

const _$H264GopSizeUnitsEnumMap = {
  H264GopSizeUnits.frames: 'FRAMES',
  H264GopSizeUnits.seconds: 'SECONDS',
};

const _$H264InterlaceModeEnumMap = {
  H264InterlaceMode.progressive: 'PROGRESSIVE',
  H264InterlaceMode.topField: 'TOP_FIELD',
  H264InterlaceMode.bottomField: 'BOTTOM_FIELD',
  H264InterlaceMode.followTopField: 'FOLLOW_TOP_FIELD',
  H264InterlaceMode.followBottomField: 'FOLLOW_BOTTOM_FIELD',
};

const _$H264ParControlEnumMap = {
  H264ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H264ParControl.specified: 'SPECIFIED',
};

const _$H264QualityTuningLevelEnumMap = {
  H264QualityTuningLevel.singlePass: 'SINGLE_PASS',
  H264QualityTuningLevel.singlePassHq: 'SINGLE_PASS_HQ',
  H264QualityTuningLevel.multiPassHq: 'MULTI_PASS_HQ',
};

const _$H264RateControlModeEnumMap = {
  H264RateControlMode.vbr: 'VBR',
  H264RateControlMode.cbr: 'CBR',
  H264RateControlMode.qvbr: 'QVBR',
};

const _$H264RepeatPpsEnumMap = {
  H264RepeatPps.disabled: 'DISABLED',
  H264RepeatPps.enabled: 'ENABLED',
};

const _$H264SceneChangeDetectEnumMap = {
  H264SceneChangeDetect.disabled: 'DISABLED',
  H264SceneChangeDetect.enabled: 'ENABLED',
  H264SceneChangeDetect.transitionDetection: 'TRANSITION_DETECTION',
};

const _$H264SlowPalEnumMap = {
  H264SlowPal.disabled: 'DISABLED',
  H264SlowPal.enabled: 'ENABLED',
};

const _$H264SpatialAdaptiveQuantizationEnumMap = {
  H264SpatialAdaptiveQuantization.disabled: 'DISABLED',
  H264SpatialAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H264SyntaxEnumMap = {
  H264Syntax.$default: 'DEFAULT',
  H264Syntax.rp2027: 'RP2027',
};

const _$H264TelecineEnumMap = {
  H264Telecine.none: 'NONE',
  H264Telecine.soft: 'SOFT',
  H264Telecine.hard: 'HARD',
};

const _$H264TemporalAdaptiveQuantizationEnumMap = {
  H264TemporalAdaptiveQuantization.disabled: 'DISABLED',
  H264TemporalAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H264UnregisteredSeiTimecodeEnumMap = {
  H264UnregisteredSeiTimecode.disabled: 'DISABLED',
  H264UnregisteredSeiTimecode.enabled: 'ENABLED',
};

H265QvbrSettings _$H265QvbrSettingsFromJson(Map<String, dynamic> json) {
  return H265QvbrSettings(
    maxAverageBitrate: json['maxAverageBitrate'] as int,
    qvbrQualityLevel: json['qvbrQualityLevel'] as int,
    qvbrQualityLevelFineTune:
        (json['qvbrQualityLevelFineTune'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$H265QvbrSettingsToJson(H265QvbrSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxAverageBitrate', instance.maxAverageBitrate);
  writeNotNull('qvbrQualityLevel', instance.qvbrQualityLevel);
  writeNotNull('qvbrQualityLevelFineTune', instance.qvbrQualityLevelFineTune);
  return val;
}

H265Settings _$H265SettingsFromJson(Map<String, dynamic> json) {
  return H265Settings(
    adaptiveQuantization: _$enumDecodeNullable(
        _$H265AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    alternateTransferFunctionSei: _$enumDecodeNullable(
        _$H265AlternateTransferFunctionSeiEnumMap,
        json['alternateTransferFunctionSei']),
    bitrate: json['bitrate'] as int,
    codecLevel:
        _$enumDecodeNullable(_$H265CodecLevelEnumMap, json['codecLevel']),
    codecProfile:
        _$enumDecodeNullable(_$H265CodecProfileEnumMap, json['codecProfile']),
    dynamicSubGop:
        _$enumDecodeNullable(_$H265DynamicSubGopEnumMap, json['dynamicSubGop']),
    flickerAdaptiveQuantization: _$enumDecodeNullable(
        _$H265FlickerAdaptiveQuantizationEnumMap,
        json['flickerAdaptiveQuantization']),
    framerateControl: _$enumDecodeNullable(
        _$H265FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$H265FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopBReference:
        _$enumDecodeNullable(_$H265GopBReferenceEnumMap, json['gopBReference']),
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$H265GopSizeUnitsEnumMap, json['gopSizeUnits']),
    hrdBufferInitialFillPercentage:
        json['hrdBufferInitialFillPercentage'] as int,
    hrdBufferSize: json['hrdBufferSize'] as int,
    interlaceMode:
        _$enumDecodeNullable(_$H265InterlaceModeEnumMap, json['interlaceMode']),
    maxBitrate: json['maxBitrate'] as int,
    minIInterval: json['minIInterval'] as int,
    numberBFramesBetweenReferenceFrames:
        json['numberBFramesBetweenReferenceFrames'] as int,
    numberReferenceFrames: json['numberReferenceFrames'] as int,
    parControl:
        _$enumDecodeNullable(_$H265ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    qualityTuningLevel: _$enumDecodeNullable(
        _$H265QualityTuningLevelEnumMap, json['qualityTuningLevel']),
    qvbrSettings: json['qvbrSettings'] == null
        ? null
        : H265QvbrSettings.fromJson(
            json['qvbrSettings'] as Map<String, dynamic>),
    rateControlMode: _$enumDecodeNullable(
        _$H265RateControlModeEnumMap, json['rateControlMode']),
    sampleAdaptiveOffsetFilterMode: _$enumDecodeNullable(
        _$H265SampleAdaptiveOffsetFilterModeEnumMap,
        json['sampleAdaptiveOffsetFilterMode']),
    sceneChangeDetect: _$enumDecodeNullable(
        _$H265SceneChangeDetectEnumMap, json['sceneChangeDetect']),
    slices: json['slices'] as int,
    slowPal: _$enumDecodeNullable(_$H265SlowPalEnumMap, json['slowPal']),
    spatialAdaptiveQuantization: _$enumDecodeNullable(
        _$H265SpatialAdaptiveQuantizationEnumMap,
        json['spatialAdaptiveQuantization']),
    telecine: _$enumDecodeNullable(_$H265TelecineEnumMap, json['telecine']),
    temporalAdaptiveQuantization: _$enumDecodeNullable(
        _$H265TemporalAdaptiveQuantizationEnumMap,
        json['temporalAdaptiveQuantization']),
    temporalIds:
        _$enumDecodeNullable(_$H265TemporalIdsEnumMap, json['temporalIds']),
    tiles: _$enumDecodeNullable(_$H265TilesEnumMap, json['tiles']),
    unregisteredSeiTimecode: _$enumDecodeNullable(
        _$H265UnregisteredSeiTimecodeEnumMap, json['unregisteredSeiTimecode']),
    writeMp4PackagingType: _$enumDecodeNullable(
        _$H265WriteMp4PackagingTypeEnumMap, json['writeMp4PackagingType']),
  );
}

Map<String, dynamic> _$H265SettingsToJson(H265Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adaptiveQuantization',
      _$H265AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull(
      'alternateTransferFunctionSei',
      _$H265AlternateTransferFunctionSeiEnumMap[
          instance.alternateTransferFunctionSei]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codecLevel', _$H265CodecLevelEnumMap[instance.codecLevel]);
  writeNotNull(
      'codecProfile', _$H265CodecProfileEnumMap[instance.codecProfile]);
  writeNotNull(
      'dynamicSubGop', _$H265DynamicSubGopEnumMap[instance.dynamicSubGop]);
  writeNotNull(
      'flickerAdaptiveQuantization',
      _$H265FlickerAdaptiveQuantizationEnumMap[
          instance.flickerAdaptiveQuantization]);
  writeNotNull('framerateControl',
      _$H265FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$H265FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'gopBReference', _$H265GopBReferenceEnumMap[instance.gopBReference]);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$H265GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('hrdBufferInitialFillPercentage',
      instance.hrdBufferInitialFillPercentage);
  writeNotNull('hrdBufferSize', instance.hrdBufferSize);
  writeNotNull(
      'interlaceMode', _$H265InterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('minIInterval', instance.minIInterval);
  writeNotNull('numberBFramesBetweenReferenceFrames',
      instance.numberBFramesBetweenReferenceFrames);
  writeNotNull('numberReferenceFrames', instance.numberReferenceFrames);
  writeNotNull('parControl', _$H265ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('qualityTuningLevel',
      _$H265QualityTuningLevelEnumMap[instance.qualityTuningLevel]);
  writeNotNull('qvbrSettings', instance.qvbrSettings?.toJson());
  writeNotNull('rateControlMode',
      _$H265RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull(
      'sampleAdaptiveOffsetFilterMode',
      _$H265SampleAdaptiveOffsetFilterModeEnumMap[
          instance.sampleAdaptiveOffsetFilterMode]);
  writeNotNull('sceneChangeDetect',
      _$H265SceneChangeDetectEnumMap[instance.sceneChangeDetect]);
  writeNotNull('slices', instance.slices);
  writeNotNull('slowPal', _$H265SlowPalEnumMap[instance.slowPal]);
  writeNotNull(
      'spatialAdaptiveQuantization',
      _$H265SpatialAdaptiveQuantizationEnumMap[
          instance.spatialAdaptiveQuantization]);
  writeNotNull('telecine', _$H265TelecineEnumMap[instance.telecine]);
  writeNotNull(
      'temporalAdaptiveQuantization',
      _$H265TemporalAdaptiveQuantizationEnumMap[
          instance.temporalAdaptiveQuantization]);
  writeNotNull('temporalIds', _$H265TemporalIdsEnumMap[instance.temporalIds]);
  writeNotNull('tiles', _$H265TilesEnumMap[instance.tiles]);
  writeNotNull('unregisteredSeiTimecode',
      _$H265UnregisteredSeiTimecodeEnumMap[instance.unregisteredSeiTimecode]);
  writeNotNull('writeMp4PackagingType',
      _$H265WriteMp4PackagingTypeEnumMap[instance.writeMp4PackagingType]);
  return val;
}

const _$H265AdaptiveQuantizationEnumMap = {
  H265AdaptiveQuantization.off: 'OFF',
  H265AdaptiveQuantization.low: 'LOW',
  H265AdaptiveQuantization.medium: 'MEDIUM',
  H265AdaptiveQuantization.high: 'HIGH',
  H265AdaptiveQuantization.higher: 'HIGHER',
  H265AdaptiveQuantization.max: 'MAX',
};

const _$H265AlternateTransferFunctionSeiEnumMap = {
  H265AlternateTransferFunctionSei.disabled: 'DISABLED',
  H265AlternateTransferFunctionSei.enabled: 'ENABLED',
};

const _$H265CodecLevelEnumMap = {
  H265CodecLevel.auto: 'AUTO',
  H265CodecLevel.level_1: 'LEVEL_1',
  H265CodecLevel.level_2: 'LEVEL_2',
  H265CodecLevel.level_2_1: 'LEVEL_2_1',
  H265CodecLevel.level_3: 'LEVEL_3',
  H265CodecLevel.level_3_1: 'LEVEL_3_1',
  H265CodecLevel.level_4: 'LEVEL_4',
  H265CodecLevel.level_4_1: 'LEVEL_4_1',
  H265CodecLevel.level_5: 'LEVEL_5',
  H265CodecLevel.level_5_1: 'LEVEL_5_1',
  H265CodecLevel.level_5_2: 'LEVEL_5_2',
  H265CodecLevel.level_6: 'LEVEL_6',
  H265CodecLevel.level_6_1: 'LEVEL_6_1',
  H265CodecLevel.level_6_2: 'LEVEL_6_2',
};

const _$H265CodecProfileEnumMap = {
  H265CodecProfile.mainMain: 'MAIN_MAIN',
  H265CodecProfile.mainHigh: 'MAIN_HIGH',
  H265CodecProfile.main10Main: 'MAIN10_MAIN',
  H265CodecProfile.main10High: 'MAIN10_HIGH',
  H265CodecProfile.main_422_8bitMain: 'MAIN_422_8BIT_MAIN',
  H265CodecProfile.main_422_8bitHigh: 'MAIN_422_8BIT_HIGH',
  H265CodecProfile.main_422_10bitMain: 'MAIN_422_10BIT_MAIN',
  H265CodecProfile.main_422_10bitHigh: 'MAIN_422_10BIT_HIGH',
};

const _$H265DynamicSubGopEnumMap = {
  H265DynamicSubGop.adaptive: 'ADAPTIVE',
  H265DynamicSubGop.static: 'STATIC',
};

const _$H265FlickerAdaptiveQuantizationEnumMap = {
  H265FlickerAdaptiveQuantization.disabled: 'DISABLED',
  H265FlickerAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H265FramerateControlEnumMap = {
  H265FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H265FramerateControl.specified: 'SPECIFIED',
};

const _$H265FramerateConversionAlgorithmEnumMap = {
  H265FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  H265FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  H265FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$H265GopBReferenceEnumMap = {
  H265GopBReference.disabled: 'DISABLED',
  H265GopBReference.enabled: 'ENABLED',
};

const _$H265GopSizeUnitsEnumMap = {
  H265GopSizeUnits.frames: 'FRAMES',
  H265GopSizeUnits.seconds: 'SECONDS',
};

const _$H265InterlaceModeEnumMap = {
  H265InterlaceMode.progressive: 'PROGRESSIVE',
  H265InterlaceMode.topField: 'TOP_FIELD',
  H265InterlaceMode.bottomField: 'BOTTOM_FIELD',
  H265InterlaceMode.followTopField: 'FOLLOW_TOP_FIELD',
  H265InterlaceMode.followBottomField: 'FOLLOW_BOTTOM_FIELD',
};

const _$H265ParControlEnumMap = {
  H265ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  H265ParControl.specified: 'SPECIFIED',
};

const _$H265QualityTuningLevelEnumMap = {
  H265QualityTuningLevel.singlePass: 'SINGLE_PASS',
  H265QualityTuningLevel.singlePassHq: 'SINGLE_PASS_HQ',
  H265QualityTuningLevel.multiPassHq: 'MULTI_PASS_HQ',
};

const _$H265RateControlModeEnumMap = {
  H265RateControlMode.vbr: 'VBR',
  H265RateControlMode.cbr: 'CBR',
  H265RateControlMode.qvbr: 'QVBR',
};

const _$H265SampleAdaptiveOffsetFilterModeEnumMap = {
  H265SampleAdaptiveOffsetFilterMode.$default: 'DEFAULT',
  H265SampleAdaptiveOffsetFilterMode.adaptive: 'ADAPTIVE',
  H265SampleAdaptiveOffsetFilterMode.off: 'OFF',
};

const _$H265SceneChangeDetectEnumMap = {
  H265SceneChangeDetect.disabled: 'DISABLED',
  H265SceneChangeDetect.enabled: 'ENABLED',
  H265SceneChangeDetect.transitionDetection: 'TRANSITION_DETECTION',
};

const _$H265SlowPalEnumMap = {
  H265SlowPal.disabled: 'DISABLED',
  H265SlowPal.enabled: 'ENABLED',
};

const _$H265SpatialAdaptiveQuantizationEnumMap = {
  H265SpatialAdaptiveQuantization.disabled: 'DISABLED',
  H265SpatialAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H265TelecineEnumMap = {
  H265Telecine.none: 'NONE',
  H265Telecine.soft: 'SOFT',
  H265Telecine.hard: 'HARD',
};

const _$H265TemporalAdaptiveQuantizationEnumMap = {
  H265TemporalAdaptiveQuantization.disabled: 'DISABLED',
  H265TemporalAdaptiveQuantization.enabled: 'ENABLED',
};

const _$H265TemporalIdsEnumMap = {
  H265TemporalIds.disabled: 'DISABLED',
  H265TemporalIds.enabled: 'ENABLED',
};

const _$H265TilesEnumMap = {
  H265Tiles.disabled: 'DISABLED',
  H265Tiles.enabled: 'ENABLED',
};

const _$H265UnregisteredSeiTimecodeEnumMap = {
  H265UnregisteredSeiTimecode.disabled: 'DISABLED',
  H265UnregisteredSeiTimecode.enabled: 'ENABLED',
};

const _$H265WriteMp4PackagingTypeEnumMap = {
  H265WriteMp4PackagingType.hvc1: 'HVC1',
  H265WriteMp4PackagingType.hev1: 'HEV1',
};

Hdr10Metadata _$Hdr10MetadataFromJson(Map<String, dynamic> json) {
  return Hdr10Metadata(
    bluePrimaryX: json['bluePrimaryX'] as int,
    bluePrimaryY: json['bluePrimaryY'] as int,
    greenPrimaryX: json['greenPrimaryX'] as int,
    greenPrimaryY: json['greenPrimaryY'] as int,
    maxContentLightLevel: json['maxContentLightLevel'] as int,
    maxFrameAverageLightLevel: json['maxFrameAverageLightLevel'] as int,
    maxLuminance: json['maxLuminance'] as int,
    minLuminance: json['minLuminance'] as int,
    redPrimaryX: json['redPrimaryX'] as int,
    redPrimaryY: json['redPrimaryY'] as int,
    whitePointX: json['whitePointX'] as int,
    whitePointY: json['whitePointY'] as int,
  );
}

Map<String, dynamic> _$Hdr10MetadataToJson(Hdr10Metadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bluePrimaryX', instance.bluePrimaryX);
  writeNotNull('bluePrimaryY', instance.bluePrimaryY);
  writeNotNull('greenPrimaryX', instance.greenPrimaryX);
  writeNotNull('greenPrimaryY', instance.greenPrimaryY);
  writeNotNull('maxContentLightLevel', instance.maxContentLightLevel);
  writeNotNull('maxFrameAverageLightLevel', instance.maxFrameAverageLightLevel);
  writeNotNull('maxLuminance', instance.maxLuminance);
  writeNotNull('minLuminance', instance.minLuminance);
  writeNotNull('redPrimaryX', instance.redPrimaryX);
  writeNotNull('redPrimaryY', instance.redPrimaryY);
  writeNotNull('whitePointX', instance.whitePointX);
  writeNotNull('whitePointY', instance.whitePointY);
  return val;
}

HlsAdditionalManifest _$HlsAdditionalManifestFromJson(
    Map<String, dynamic> json) {
  return HlsAdditionalManifest(
    manifestNameModifier: json['manifestNameModifier'] as String,
    selectedOutputs:
        (json['selectedOutputs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HlsAdditionalManifestToJson(
    HlsAdditionalManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestNameModifier', instance.manifestNameModifier);
  writeNotNull('selectedOutputs', instance.selectedOutputs);
  return val;
}

HlsCaptionLanguageMapping _$HlsCaptionLanguageMappingFromJson(
    Map<String, dynamic> json) {
  return HlsCaptionLanguageMapping(
    captionChannel: json['captionChannel'] as int,
    customLanguageCode: json['customLanguageCode'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['languageCode']),
    languageDescription: json['languageDescription'] as String,
  );
}

Map<String, dynamic> _$HlsCaptionLanguageMappingToJson(
    HlsCaptionLanguageMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('captionChannel', instance.captionChannel);
  writeNotNull('customLanguageCode', instance.customLanguageCode);
  writeNotNull('languageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('languageDescription', instance.languageDescription);
  return val;
}

HlsEncryptionSettings _$HlsEncryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return HlsEncryptionSettings(
    constantInitializationVector:
        json['constantInitializationVector'] as String,
    encryptionMethod: _$enumDecodeNullable(
        _$HlsEncryptionTypeEnumMap, json['encryptionMethod']),
    initializationVectorInManifest: _$enumDecodeNullable(
        _$HlsInitializationVectorInManifestEnumMap,
        json['initializationVectorInManifest']),
    offlineEncrypted: _$enumDecodeNullable(
        _$HlsOfflineEncryptedEnumMap, json['offlineEncrypted']),
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
    staticKeyProvider: json['staticKeyProvider'] == null
        ? null
        : StaticKeyProvider.fromJson(
            json['staticKeyProvider'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$HlsKeyProviderTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$HlsEncryptionSettingsToJson(
    HlsEncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'constantInitializationVector', instance.constantInitializationVector);
  writeNotNull('encryptionMethod',
      _$HlsEncryptionTypeEnumMap[instance.encryptionMethod]);
  writeNotNull(
      'initializationVectorInManifest',
      _$HlsInitializationVectorInManifestEnumMap[
          instance.initializationVectorInManifest]);
  writeNotNull('offlineEncrypted',
      _$HlsOfflineEncryptedEnumMap[instance.offlineEncrypted]);
  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  writeNotNull('staticKeyProvider', instance.staticKeyProvider?.toJson());
  writeNotNull('type', _$HlsKeyProviderTypeEnumMap[instance.type]);
  return val;
}

const _$HlsEncryptionTypeEnumMap = {
  HlsEncryptionType.aes128: 'AES128',
  HlsEncryptionType.sampleAes: 'SAMPLE_AES',
};

const _$HlsInitializationVectorInManifestEnumMap = {
  HlsInitializationVectorInManifest.include: 'INCLUDE',
  HlsInitializationVectorInManifest.exclude: 'EXCLUDE',
};

const _$HlsOfflineEncryptedEnumMap = {
  HlsOfflineEncrypted.enabled: 'ENABLED',
  HlsOfflineEncrypted.disabled: 'DISABLED',
};

const _$HlsKeyProviderTypeEnumMap = {
  HlsKeyProviderType.speke: 'SPEKE',
  HlsKeyProviderType.staticKey: 'STATIC_KEY',
};

HlsGroupSettings _$HlsGroupSettingsFromJson(Map<String, dynamic> json) {
  return HlsGroupSettings(
    adMarkers: (json['adMarkers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$HlsAdMarkersEnumMap, e))
        ?.toList(),
    additionalManifests: (json['additionalManifests'] as List)
        ?.map((e) => e == null
            ? null
            : HlsAdditionalManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    audioOnlyHeader: _$enumDecodeNullable(
        _$HlsAudioOnlyHeaderEnumMap, json['audioOnlyHeader']),
    baseUrl: json['baseUrl'] as String,
    captionLanguageMappings: (json['captionLanguageMappings'] as List)
        ?.map((e) => e == null
            ? null
            : HlsCaptionLanguageMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionLanguageSetting: _$enumDecodeNullable(
        _$HlsCaptionLanguageSettingEnumMap, json['captionLanguageSetting']),
    clientCache:
        _$enumDecodeNullable(_$HlsClientCacheEnumMap, json['clientCache']),
    codecSpecification: _$enumDecodeNullable(
        _$HlsCodecSpecificationEnumMap, json['codecSpecification']),
    destination: json['destination'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : DestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    directoryStructure: _$enumDecodeNullable(
        _$HlsDirectoryStructureEnumMap, json['directoryStructure']),
    encryption: json['encryption'] == null
        ? null
        : HlsEncryptionSettings.fromJson(
            json['encryption'] as Map<String, dynamic>),
    manifestCompression: _$enumDecodeNullable(
        _$HlsManifestCompressionEnumMap, json['manifestCompression']),
    manifestDurationFormat: _$enumDecodeNullable(
        _$HlsManifestDurationFormatEnumMap, json['manifestDurationFormat']),
    minFinalSegmentLength: (json['minFinalSegmentLength'] as num)?.toDouble(),
    minSegmentLength: json['minSegmentLength'] as int,
    outputSelection: _$enumDecodeNullable(
        _$HlsOutputSelectionEnumMap, json['outputSelection']),
    programDateTime: _$enumDecodeNullable(
        _$HlsProgramDateTimeEnumMap, json['programDateTime']),
    programDateTimePeriod: json['programDateTimePeriod'] as int,
    segmentControl: _$enumDecodeNullable(
        _$HlsSegmentControlEnumMap, json['segmentControl']),
    segmentLength: json['segmentLength'] as int,
    segmentsPerSubdirectory: json['segmentsPerSubdirectory'] as int,
    streamInfResolution: _$enumDecodeNullable(
        _$HlsStreamInfResolutionEnumMap, json['streamInfResolution']),
    timedMetadataId3Frame: _$enumDecodeNullable(
        _$HlsTimedMetadataId3FrameEnumMap, json['timedMetadataId3Frame']),
    timedMetadataId3Period: json['timedMetadataId3Period'] as int,
    timestampDeltaMilliseconds: json['timestampDeltaMilliseconds'] as int,
  );
}

Map<String, dynamic> _$HlsGroupSettingsToJson(HlsGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adMarkers',
      instance.adMarkers?.map((e) => _$HlsAdMarkersEnumMap[e])?.toList());
  writeNotNull('additionalManifests',
      instance.additionalManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'audioOnlyHeader', _$HlsAudioOnlyHeaderEnumMap[instance.audioOnlyHeader]);
  writeNotNull('baseUrl', instance.baseUrl);
  writeNotNull('captionLanguageMappings',
      instance.captionLanguageMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('captionLanguageSetting',
      _$HlsCaptionLanguageSettingEnumMap[instance.captionLanguageSetting]);
  writeNotNull('clientCache', _$HlsClientCacheEnumMap[instance.clientCache]);
  writeNotNull('codecSpecification',
      _$HlsCodecSpecificationEnumMap[instance.codecSpecification]);
  writeNotNull('destination', instance.destination);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('directoryStructure',
      _$HlsDirectoryStructureEnumMap[instance.directoryStructure]);
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('manifestCompression',
      _$HlsManifestCompressionEnumMap[instance.manifestCompression]);
  writeNotNull('manifestDurationFormat',
      _$HlsManifestDurationFormatEnumMap[instance.manifestDurationFormat]);
  writeNotNull('minFinalSegmentLength', instance.minFinalSegmentLength);
  writeNotNull('minSegmentLength', instance.minSegmentLength);
  writeNotNull(
      'outputSelection', _$HlsOutputSelectionEnumMap[instance.outputSelection]);
  writeNotNull(
      'programDateTime', _$HlsProgramDateTimeEnumMap[instance.programDateTime]);
  writeNotNull('programDateTimePeriod', instance.programDateTimePeriod);
  writeNotNull(
      'segmentControl', _$HlsSegmentControlEnumMap[instance.segmentControl]);
  writeNotNull('segmentLength', instance.segmentLength);
  writeNotNull('segmentsPerSubdirectory', instance.segmentsPerSubdirectory);
  writeNotNull('streamInfResolution',
      _$HlsStreamInfResolutionEnumMap[instance.streamInfResolution]);
  writeNotNull('timedMetadataId3Frame',
      _$HlsTimedMetadataId3FrameEnumMap[instance.timedMetadataId3Frame]);
  writeNotNull('timedMetadataId3Period', instance.timedMetadataId3Period);
  writeNotNull(
      'timestampDeltaMilliseconds', instance.timestampDeltaMilliseconds);
  return val;
}

const _$HlsAdMarkersEnumMap = {
  HlsAdMarkers.elemental: 'ELEMENTAL',
  HlsAdMarkers.elementalScte35: 'ELEMENTAL_SCTE35',
};

const _$HlsAudioOnlyHeaderEnumMap = {
  HlsAudioOnlyHeader.include: 'INCLUDE',
  HlsAudioOnlyHeader.exclude: 'EXCLUDE',
};

const _$HlsCaptionLanguageSettingEnumMap = {
  HlsCaptionLanguageSetting.insert: 'INSERT',
  HlsCaptionLanguageSetting.omit: 'OMIT',
  HlsCaptionLanguageSetting.none: 'NONE',
};

const _$HlsClientCacheEnumMap = {
  HlsClientCache.disabled: 'DISABLED',
  HlsClientCache.enabled: 'ENABLED',
};

const _$HlsCodecSpecificationEnumMap = {
  HlsCodecSpecification.rfc_6381: 'RFC_6381',
  HlsCodecSpecification.rfc_4281: 'RFC_4281',
};

const _$HlsDirectoryStructureEnumMap = {
  HlsDirectoryStructure.singleDirectory: 'SINGLE_DIRECTORY',
  HlsDirectoryStructure.subdirectoryPerStream: 'SUBDIRECTORY_PER_STREAM',
};

const _$HlsManifestCompressionEnumMap = {
  HlsManifestCompression.gzip: 'GZIP',
  HlsManifestCompression.none: 'NONE',
};

const _$HlsManifestDurationFormatEnumMap = {
  HlsManifestDurationFormat.floatingPoint: 'FLOATING_POINT',
  HlsManifestDurationFormat.integer: 'INTEGER',
};

const _$HlsOutputSelectionEnumMap = {
  HlsOutputSelection.manifestsAndSegments: 'MANIFESTS_AND_SEGMENTS',
  HlsOutputSelection.segmentsOnly: 'SEGMENTS_ONLY',
};

const _$HlsProgramDateTimeEnumMap = {
  HlsProgramDateTime.include: 'INCLUDE',
  HlsProgramDateTime.exclude: 'EXCLUDE',
};

const _$HlsSegmentControlEnumMap = {
  HlsSegmentControl.singleFile: 'SINGLE_FILE',
  HlsSegmentControl.segmentedFiles: 'SEGMENTED_FILES',
};

const _$HlsStreamInfResolutionEnumMap = {
  HlsStreamInfResolution.include: 'INCLUDE',
  HlsStreamInfResolution.exclude: 'EXCLUDE',
};

const _$HlsTimedMetadataId3FrameEnumMap = {
  HlsTimedMetadataId3Frame.none: 'NONE',
  HlsTimedMetadataId3Frame.priv: 'PRIV',
  HlsTimedMetadataId3Frame.tdrl: 'TDRL',
};

HlsSettings _$HlsSettingsFromJson(Map<String, dynamic> json) {
  return HlsSettings(
    audioGroupId: json['audioGroupId'] as String,
    audioOnlyContainer: _$enumDecodeNullable(
        _$HlsAudioOnlyContainerEnumMap, json['audioOnlyContainer']),
    audioRenditionSets: json['audioRenditionSets'] as String,
    audioTrackType: _$enumDecodeNullable(
        _$HlsAudioTrackTypeEnumMap, json['audioTrackType']),
    iFrameOnlyManifest: _$enumDecodeNullable(
        _$HlsIFrameOnlyManifestEnumMap, json['iFrameOnlyManifest']),
    segmentModifier: json['segmentModifier'] as String,
  );
}

Map<String, dynamic> _$HlsSettingsToJson(HlsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioGroupId', instance.audioGroupId);
  writeNotNull('audioOnlyContainer',
      _$HlsAudioOnlyContainerEnumMap[instance.audioOnlyContainer]);
  writeNotNull('audioRenditionSets', instance.audioRenditionSets);
  writeNotNull(
      'audioTrackType', _$HlsAudioTrackTypeEnumMap[instance.audioTrackType]);
  writeNotNull('iFrameOnlyManifest',
      _$HlsIFrameOnlyManifestEnumMap[instance.iFrameOnlyManifest]);
  writeNotNull('segmentModifier', instance.segmentModifier);
  return val;
}

const _$HlsAudioOnlyContainerEnumMap = {
  HlsAudioOnlyContainer.automatic: 'AUTOMATIC',
  HlsAudioOnlyContainer.m2ts: 'M2TS',
};

const _$HlsAudioTrackTypeEnumMap = {
  HlsAudioTrackType.alternateAudioAutoSelectDefault:
      'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT',
  HlsAudioTrackType.alternateAudioAutoSelect: 'ALTERNATE_AUDIO_AUTO_SELECT',
  HlsAudioTrackType.alternateAudioNotAutoSelect:
      'ALTERNATE_AUDIO_NOT_AUTO_SELECT',
  HlsAudioTrackType.audioOnlyVariantStream: 'AUDIO_ONLY_VARIANT_STREAM',
};

const _$HlsIFrameOnlyManifestEnumMap = {
  HlsIFrameOnlyManifest.include: 'INCLUDE',
  HlsIFrameOnlyManifest.exclude: 'EXCLUDE',
};

HopDestination _$HopDestinationFromJson(Map<String, dynamic> json) {
  return HopDestination(
    priority: json['priority'] as int,
    queue: json['queue'] as String,
    waitMinutes: json['waitMinutes'] as int,
  );
}

Map<String, dynamic> _$HopDestinationToJson(HopDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('priority', instance.priority);
  writeNotNull('queue', instance.queue);
  writeNotNull('waitMinutes', instance.waitMinutes);
  return val;
}

Id3Insertion _$Id3InsertionFromJson(Map<String, dynamic> json) {
  return Id3Insertion(
    id3: json['id3'] as String,
    timecode: json['timecode'] as String,
  );
}

Map<String, dynamic> _$Id3InsertionToJson(Id3Insertion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id3', instance.id3);
  writeNotNull('timecode', instance.timecode);
  return val;
}

ImageInserter _$ImageInserterFromJson(Map<String, dynamic> json) {
  return ImageInserter(
    insertableImages: (json['insertableImages'] as List)
        ?.map((e) => e == null
            ? null
            : InsertableImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ImageInserterToJson(ImageInserter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('insertableImages',
      instance.insertableImages?.map((e) => e?.toJson())?.toList());
  return val;
}

ImscDestinationSettings _$ImscDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return ImscDestinationSettings(
    stylePassthrough: _$enumDecodeNullable(
        _$ImscStylePassthroughEnumMap, json['stylePassthrough']),
  );
}

Map<String, dynamic> _$ImscDestinationSettingsToJson(
    ImscDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stylePassthrough',
      _$ImscStylePassthroughEnumMap[instance.stylePassthrough]);
  return val;
}

const _$ImscStylePassthroughEnumMap = {
  ImscStylePassthrough.enabled: 'ENABLED',
  ImscStylePassthrough.disabled: 'DISABLED',
};

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    audioSelectorGroups:
        (json['audioSelectorGroups'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AudioSelectorGroup.fromJson(e as Map<String, dynamic>)),
    ),
    audioSelectors: (json['audioSelectors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : AudioSelector.fromJson(e as Map<String, dynamic>)),
    ),
    captionSelectors: (json['captionSelectors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CaptionSelector.fromJson(e as Map<String, dynamic>)),
    ),
    crop: json['crop'] == null
        ? null
        : Rectangle.fromJson(json['crop'] as Map<String, dynamic>),
    deblockFilter: _$enumDecodeNullable(
        _$InputDeblockFilterEnumMap, json['deblockFilter']),
    decryptionSettings: json['decryptionSettings'] == null
        ? null
        : InputDecryptionSettings.fromJson(
            json['decryptionSettings'] as Map<String, dynamic>),
    denoiseFilter: _$enumDecodeNullable(
        _$InputDenoiseFilterEnumMap, json['denoiseFilter']),
    fileInput: json['fileInput'] as String,
    filterEnable:
        _$enumDecodeNullable(_$InputFilterEnableEnumMap, json['filterEnable']),
    filterStrength: json['filterStrength'] as int,
    imageInserter: json['imageInserter'] == null
        ? null
        : ImageInserter.fromJson(json['imageInserter'] as Map<String, dynamic>),
    inputClippings: (json['inputClippings'] as List)
        ?.map((e) => e == null
            ? null
            : InputClipping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputScanType:
        _$enumDecodeNullable(_$InputScanTypeEnumMap, json['inputScanType']),
    position: json['position'] == null
        ? null
        : Rectangle.fromJson(json['position'] as Map<String, dynamic>),
    programNumber: json['programNumber'] as int,
    psiControl:
        _$enumDecodeNullable(_$InputPsiControlEnumMap, json['psiControl']),
    supplementalImps:
        (json['supplementalImps'] as List)?.map((e) => e as String)?.toList(),
    timecodeSource: _$enumDecodeNullable(
        _$InputTimecodeSourceEnumMap, json['timecodeSource']),
    timecodeStart: json['timecodeStart'] as String,
    videoSelector: json['videoSelector'] == null
        ? null
        : VideoSelector.fromJson(json['videoSelector'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputToJson(Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectorGroups',
      instance.audioSelectorGroups?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('audioSelectors',
      instance.audioSelectors?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('captionSelectors',
      instance.captionSelectors?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('crop', instance.crop?.toJson());
  writeNotNull(
      'deblockFilter', _$InputDeblockFilterEnumMap[instance.deblockFilter]);
  writeNotNull('decryptionSettings', instance.decryptionSettings?.toJson());
  writeNotNull(
      'denoiseFilter', _$InputDenoiseFilterEnumMap[instance.denoiseFilter]);
  writeNotNull('fileInput', instance.fileInput);
  writeNotNull(
      'filterEnable', _$InputFilterEnableEnumMap[instance.filterEnable]);
  writeNotNull('filterStrength', instance.filterStrength);
  writeNotNull('imageInserter', instance.imageInserter?.toJson());
  writeNotNull('inputClippings',
      instance.inputClippings?.map((e) => e?.toJson())?.toList());
  writeNotNull('inputScanType', _$InputScanTypeEnumMap[instance.inputScanType]);
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('psiControl', _$InputPsiControlEnumMap[instance.psiControl]);
  writeNotNull('supplementalImps', instance.supplementalImps);
  writeNotNull(
      'timecodeSource', _$InputTimecodeSourceEnumMap[instance.timecodeSource]);
  writeNotNull('timecodeStart', instance.timecodeStart);
  writeNotNull('videoSelector', instance.videoSelector?.toJson());
  return val;
}

const _$InputDeblockFilterEnumMap = {
  InputDeblockFilter.enabled: 'ENABLED',
  InputDeblockFilter.disabled: 'DISABLED',
};

const _$InputDenoiseFilterEnumMap = {
  InputDenoiseFilter.enabled: 'ENABLED',
  InputDenoiseFilter.disabled: 'DISABLED',
};

const _$InputFilterEnableEnumMap = {
  InputFilterEnable.auto: 'AUTO',
  InputFilterEnable.disable: 'DISABLE',
  InputFilterEnable.force: 'FORCE',
};

const _$InputScanTypeEnumMap = {
  InputScanType.auto: 'AUTO',
  InputScanType.psf: 'PSF',
};

const _$InputPsiControlEnumMap = {
  InputPsiControl.ignorePsi: 'IGNORE_PSI',
  InputPsiControl.usePsi: 'USE_PSI',
};

const _$InputTimecodeSourceEnumMap = {
  InputTimecodeSource.embedded: 'EMBEDDED',
  InputTimecodeSource.zerobased: 'ZEROBASED',
  InputTimecodeSource.specifiedstart: 'SPECIFIEDSTART',
};

InputClipping _$InputClippingFromJson(Map<String, dynamic> json) {
  return InputClipping(
    endTimecode: json['endTimecode'] as String,
    startTimecode: json['startTimecode'] as String,
  );
}

Map<String, dynamic> _$InputClippingToJson(InputClipping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endTimecode', instance.endTimecode);
  writeNotNull('startTimecode', instance.startTimecode);
  return val;
}

InputDecryptionSettings _$InputDecryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return InputDecryptionSettings(
    decryptionMode:
        _$enumDecodeNullable(_$DecryptionModeEnumMap, json['decryptionMode']),
    encryptedDecryptionKey: json['encryptedDecryptionKey'] as String,
    initializationVector: json['initializationVector'] as String,
    kmsKeyRegion: json['kmsKeyRegion'] as String,
  );
}

Map<String, dynamic> _$InputDecryptionSettingsToJson(
    InputDecryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'decryptionMode', _$DecryptionModeEnumMap[instance.decryptionMode]);
  writeNotNull('encryptedDecryptionKey', instance.encryptedDecryptionKey);
  writeNotNull('initializationVector', instance.initializationVector);
  writeNotNull('kmsKeyRegion', instance.kmsKeyRegion);
  return val;
}

const _$DecryptionModeEnumMap = {
  DecryptionMode.aesCtr: 'AES_CTR',
  DecryptionMode.aesCbc: 'AES_CBC',
  DecryptionMode.aesGcm: 'AES_GCM',
};

InputTemplate _$InputTemplateFromJson(Map<String, dynamic> json) {
  return InputTemplate(
    audioSelectorGroups:
        (json['audioSelectorGroups'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AudioSelectorGroup.fromJson(e as Map<String, dynamic>)),
    ),
    audioSelectors: (json['audioSelectors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : AudioSelector.fromJson(e as Map<String, dynamic>)),
    ),
    captionSelectors: (json['captionSelectors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CaptionSelector.fromJson(e as Map<String, dynamic>)),
    ),
    crop: json['crop'] == null
        ? null
        : Rectangle.fromJson(json['crop'] as Map<String, dynamic>),
    deblockFilter: _$enumDecodeNullable(
        _$InputDeblockFilterEnumMap, json['deblockFilter']),
    denoiseFilter: _$enumDecodeNullable(
        _$InputDenoiseFilterEnumMap, json['denoiseFilter']),
    filterEnable:
        _$enumDecodeNullable(_$InputFilterEnableEnumMap, json['filterEnable']),
    filterStrength: json['filterStrength'] as int,
    imageInserter: json['imageInserter'] == null
        ? null
        : ImageInserter.fromJson(json['imageInserter'] as Map<String, dynamic>),
    inputClippings: (json['inputClippings'] as List)
        ?.map((e) => e == null
            ? null
            : InputClipping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inputScanType:
        _$enumDecodeNullable(_$InputScanTypeEnumMap, json['inputScanType']),
    position: json['position'] == null
        ? null
        : Rectangle.fromJson(json['position'] as Map<String, dynamic>),
    programNumber: json['programNumber'] as int,
    psiControl:
        _$enumDecodeNullable(_$InputPsiControlEnumMap, json['psiControl']),
    timecodeSource: _$enumDecodeNullable(
        _$InputTimecodeSourceEnumMap, json['timecodeSource']),
    timecodeStart: json['timecodeStart'] as String,
    videoSelector: json['videoSelector'] == null
        ? null
        : VideoSelector.fromJson(json['videoSelector'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputTemplateToJson(InputTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioSelectorGroups',
      instance.audioSelectorGroups?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('audioSelectors',
      instance.audioSelectors?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('captionSelectors',
      instance.captionSelectors?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('crop', instance.crop?.toJson());
  writeNotNull(
      'deblockFilter', _$InputDeblockFilterEnumMap[instance.deblockFilter]);
  writeNotNull(
      'denoiseFilter', _$InputDenoiseFilterEnumMap[instance.denoiseFilter]);
  writeNotNull(
      'filterEnable', _$InputFilterEnableEnumMap[instance.filterEnable]);
  writeNotNull('filterStrength', instance.filterStrength);
  writeNotNull('imageInserter', instance.imageInserter?.toJson());
  writeNotNull('inputClippings',
      instance.inputClippings?.map((e) => e?.toJson())?.toList());
  writeNotNull('inputScanType', _$InputScanTypeEnumMap[instance.inputScanType]);
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('psiControl', _$InputPsiControlEnumMap[instance.psiControl]);
  writeNotNull(
      'timecodeSource', _$InputTimecodeSourceEnumMap[instance.timecodeSource]);
  writeNotNull('timecodeStart', instance.timecodeStart);
  writeNotNull('videoSelector', instance.videoSelector?.toJson());
  return val;
}

InsertableImage _$InsertableImageFromJson(Map<String, dynamic> json) {
  return InsertableImage(
    duration: json['duration'] as int,
    fadeIn: json['fadeIn'] as int,
    fadeOut: json['fadeOut'] as int,
    height: json['height'] as int,
    imageInserterInput: json['imageInserterInput'] as String,
    imageX: json['imageX'] as int,
    imageY: json['imageY'] as int,
    layer: json['layer'] as int,
    opacity: json['opacity'] as int,
    startTime: json['startTime'] as String,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$InsertableImageToJson(InsertableImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('duration', instance.duration);
  writeNotNull('fadeIn', instance.fadeIn);
  writeNotNull('fadeOut', instance.fadeOut);
  writeNotNull('height', instance.height);
  writeNotNull('imageInserterInput', instance.imageInserterInput);
  writeNotNull('imageX', instance.imageX);
  writeNotNull('imageY', instance.imageY);
  writeNotNull('layer', instance.layer);
  writeNotNull('opacity', instance.opacity);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('width', instance.width);
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    role: json['role'] as String,
    settings: json['settings'] == null
        ? null
        : JobSettings.fromJson(json['settings'] as Map<String, dynamic>),
    accelerationSettings: json['accelerationSettings'] == null
        ? null
        : AccelerationSettings.fromJson(
            json['accelerationSettings'] as Map<String, dynamic>),
    accelerationStatus: _$enumDecodeNullable(
        _$AccelerationStatusEnumMap, json['accelerationStatus']),
    arn: json['arn'] as String,
    billingTagsSource: _$enumDecodeNullable(
        _$BillingTagsSourceEnumMap, json['billingTagsSource']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    currentPhase: _$enumDecodeNullable(_$JobPhaseEnumMap, json['currentPhase']),
    errorCode: json['errorCode'] as int,
    errorMessage: json['errorMessage'] as String,
    hopDestinations: (json['hopDestinations'] as List)
        ?.map((e) => e == null
            ? null
            : HopDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    jobPercentComplete: json['jobPercentComplete'] as int,
    jobTemplate: json['jobTemplate'] as String,
    messages: json['messages'] == null
        ? null
        : JobMessages.fromJson(json['messages'] as Map<String, dynamic>),
    outputGroupDetails: (json['outputGroupDetails'] as List)
        ?.map((e) => e == null
            ? null
            : OutputGroupDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    priority: json['priority'] as int,
    queue: json['queue'] as String,
    queueTransitions: (json['queueTransitions'] as List)
        ?.map((e) => e == null
            ? null
            : QueueTransition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    retryCount: json['retryCount'] as int,
    simulateReservedQueue: _$enumDecodeNullable(
        _$SimulateReservedQueueEnumMap, json['simulateReservedQueue']),
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    statusUpdateInterval: _$enumDecodeNullable(
        _$StatusUpdateIntervalEnumMap, json['statusUpdateInterval']),
    timing: json['timing'] == null
        ? null
        : Timing.fromJson(json['timing'] as Map<String, dynamic>),
    userMetadata: (json['userMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$AccelerationStatusEnumMap = {
  AccelerationStatus.notApplicable: 'NOT_APPLICABLE',
  AccelerationStatus.inProgress: 'IN_PROGRESS',
  AccelerationStatus.accelerated: 'ACCELERATED',
  AccelerationStatus.notAccelerated: 'NOT_ACCELERATED',
};

const _$BillingTagsSourceEnumMap = {
  BillingTagsSource.queue: 'QUEUE',
  BillingTagsSource.preset: 'PRESET',
  BillingTagsSource.jobTemplate: 'JOB_TEMPLATE',
  BillingTagsSource.job: 'JOB',
};

const _$JobPhaseEnumMap = {
  JobPhase.probing: 'PROBING',
  JobPhase.transcoding: 'TRANSCODING',
  JobPhase.uploading: 'UPLOADING',
};

const _$SimulateReservedQueueEnumMap = {
  SimulateReservedQueue.disabled: 'DISABLED',
  SimulateReservedQueue.enabled: 'ENABLED',
};

const _$JobStatusEnumMap = {
  JobStatus.submitted: 'SUBMITTED',
  JobStatus.progressing: 'PROGRESSING',
  JobStatus.complete: 'COMPLETE',
  JobStatus.canceled: 'CANCELED',
  JobStatus.error: 'ERROR',
};

const _$StatusUpdateIntervalEnumMap = {
  StatusUpdateInterval.seconds_10: 'SECONDS_10',
  StatusUpdateInterval.seconds_12: 'SECONDS_12',
  StatusUpdateInterval.seconds_15: 'SECONDS_15',
  StatusUpdateInterval.seconds_20: 'SECONDS_20',
  StatusUpdateInterval.seconds_30: 'SECONDS_30',
  StatusUpdateInterval.seconds_60: 'SECONDS_60',
  StatusUpdateInterval.seconds_120: 'SECONDS_120',
  StatusUpdateInterval.seconds_180: 'SECONDS_180',
  StatusUpdateInterval.seconds_240: 'SECONDS_240',
  StatusUpdateInterval.seconds_300: 'SECONDS_300',
  StatusUpdateInterval.seconds_360: 'SECONDS_360',
  StatusUpdateInterval.seconds_420: 'SECONDS_420',
  StatusUpdateInterval.seconds_480: 'SECONDS_480',
  StatusUpdateInterval.seconds_540: 'SECONDS_540',
  StatusUpdateInterval.seconds_600: 'SECONDS_600',
};

JobMessages _$JobMessagesFromJson(Map<String, dynamic> json) {
  return JobMessages(
    info: (json['info'] as List)?.map((e) => e as String)?.toList(),
    warning: (json['warning'] as List)?.map((e) => e as String)?.toList(),
  );
}

JobSettings _$JobSettingsFromJson(Map<String, dynamic> json) {
  return JobSettings(
    adAvailOffset: json['adAvailOffset'] as int,
    availBlanking: json['availBlanking'] == null
        ? null
        : AvailBlanking.fromJson(json['availBlanking'] as Map<String, dynamic>),
    esam: json['esam'] == null
        ? null
        : EsamSettings.fromJson(json['esam'] as Map<String, dynamic>),
    inputs: (json['inputs'] as List)
        ?.map(
            (e) => e == null ? null : Input.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    motionImageInserter: json['motionImageInserter'] == null
        ? null
        : MotionImageInserter.fromJson(
            json['motionImageInserter'] as Map<String, dynamic>),
    nielsenConfiguration: json['nielsenConfiguration'] == null
        ? null
        : NielsenConfiguration.fromJson(
            json['nielsenConfiguration'] as Map<String, dynamic>),
    nielsenNonLinearWatermark: json['nielsenNonLinearWatermark'] == null
        ? null
        : NielsenNonLinearWatermarkSettings.fromJson(
            json['nielsenNonLinearWatermark'] as Map<String, dynamic>),
    outputGroups: (json['outputGroups'] as List)
        ?.map((e) =>
            e == null ? null : OutputGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timecodeConfig: json['timecodeConfig'] == null
        ? null
        : TimecodeConfig.fromJson(
            json['timecodeConfig'] as Map<String, dynamic>),
    timedMetadataInsertion: json['timedMetadataInsertion'] == null
        ? null
        : TimedMetadataInsertion.fromJson(
            json['timedMetadataInsertion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobSettingsToJson(JobSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adAvailOffset', instance.adAvailOffset);
  writeNotNull('availBlanking', instance.availBlanking?.toJson());
  writeNotNull('esam', instance.esam?.toJson());
  writeNotNull('inputs', instance.inputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('motionImageInserter', instance.motionImageInserter?.toJson());
  writeNotNull('nielsenConfiguration', instance.nielsenConfiguration?.toJson());
  writeNotNull('nielsenNonLinearWatermark',
      instance.nielsenNonLinearWatermark?.toJson());
  writeNotNull(
      'outputGroups', instance.outputGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('timecodeConfig', instance.timecodeConfig?.toJson());
  writeNotNull(
      'timedMetadataInsertion', instance.timedMetadataInsertion?.toJson());
  return val;
}

JobTemplate _$JobTemplateFromJson(Map<String, dynamic> json) {
  return JobTemplate(
    name: json['name'] as String,
    settings: json['settings'] == null
        ? null
        : JobTemplateSettings.fromJson(
            json['settings'] as Map<String, dynamic>),
    accelerationSettings: json['accelerationSettings'] == null
        ? null
        : AccelerationSettings.fromJson(
            json['accelerationSettings'] as Map<String, dynamic>),
    arn: json['arn'] as String,
    category: json['category'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    hopDestinations: (json['hopDestinations'] as List)
        ?.map((e) => e == null
            ? null
            : HopDestination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    priority: json['priority'] as int,
    queue: json['queue'] as String,
    statusUpdateInterval: _$enumDecodeNullable(
        _$StatusUpdateIntervalEnumMap, json['statusUpdateInterval']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['type']),
  );
}

const _$TypeEnumMap = {
  Type.system: 'SYSTEM',
  Type.custom: 'CUSTOM',
};

JobTemplateSettings _$JobTemplateSettingsFromJson(Map<String, dynamic> json) {
  return JobTemplateSettings(
    adAvailOffset: json['adAvailOffset'] as int,
    availBlanking: json['availBlanking'] == null
        ? null
        : AvailBlanking.fromJson(json['availBlanking'] as Map<String, dynamic>),
    esam: json['esam'] == null
        ? null
        : EsamSettings.fromJson(json['esam'] as Map<String, dynamic>),
    inputs: (json['inputs'] as List)
        ?.map((e) => e == null
            ? null
            : InputTemplate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    motionImageInserter: json['motionImageInserter'] == null
        ? null
        : MotionImageInserter.fromJson(
            json['motionImageInserter'] as Map<String, dynamic>),
    nielsenConfiguration: json['nielsenConfiguration'] == null
        ? null
        : NielsenConfiguration.fromJson(
            json['nielsenConfiguration'] as Map<String, dynamic>),
    nielsenNonLinearWatermark: json['nielsenNonLinearWatermark'] == null
        ? null
        : NielsenNonLinearWatermarkSettings.fromJson(
            json['nielsenNonLinearWatermark'] as Map<String, dynamic>),
    outputGroups: (json['outputGroups'] as List)
        ?.map((e) =>
            e == null ? null : OutputGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timecodeConfig: json['timecodeConfig'] == null
        ? null
        : TimecodeConfig.fromJson(
            json['timecodeConfig'] as Map<String, dynamic>),
    timedMetadataInsertion: json['timedMetadataInsertion'] == null
        ? null
        : TimedMetadataInsertion.fromJson(
            json['timedMetadataInsertion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobTemplateSettingsToJson(JobTemplateSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adAvailOffset', instance.adAvailOffset);
  writeNotNull('availBlanking', instance.availBlanking?.toJson());
  writeNotNull('esam', instance.esam?.toJson());
  writeNotNull('inputs', instance.inputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('motionImageInserter', instance.motionImageInserter?.toJson());
  writeNotNull('nielsenConfiguration', instance.nielsenConfiguration?.toJson());
  writeNotNull('nielsenNonLinearWatermark',
      instance.nielsenNonLinearWatermark?.toJson());
  writeNotNull(
      'outputGroups', instance.outputGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('timecodeConfig', instance.timecodeConfig?.toJson());
  writeNotNull(
      'timedMetadataInsertion', instance.timedMetadataInsertion?.toJson());
  return val;
}

ListJobTemplatesResponse _$ListJobTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListJobTemplatesResponse(
    jobTemplates: (json['jobTemplates'] as List)
        ?.map((e) =>
            e == null ? null : JobTemplate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPresetsResponse _$ListPresetsResponseFromJson(Map<String, dynamic> json) {
  return ListPresetsResponse(
    nextToken: json['nextToken'] as String,
    presets: (json['presets'] as List)
        ?.map((e) =>
            e == null ? null : Preset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListQueuesResponse _$ListQueuesResponseFromJson(Map<String, dynamic> json) {
  return ListQueuesResponse(
    nextToken: json['nextToken'] as String,
    queues: (json['queues'] as List)
        ?.map(
            (e) => e == null ? null : Queue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    resourceTags: json['resourceTags'] == null
        ? null
        : ResourceTags.fromJson(json['resourceTags'] as Map<String, dynamic>),
  );
}

M2tsScte35Esam _$M2tsScte35EsamFromJson(Map<String, dynamic> json) {
  return M2tsScte35Esam(
    scte35EsamPid: json['scte35EsamPid'] as int,
  );
}

Map<String, dynamic> _$M2tsScte35EsamToJson(M2tsScte35Esam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scte35EsamPid', instance.scte35EsamPid);
  return val;
}

M2tsSettings _$M2tsSettingsFromJson(Map<String, dynamic> json) {
  return M2tsSettings(
    audioBufferModel: _$enumDecodeNullable(
        _$M2tsAudioBufferModelEnumMap, json['audioBufferModel']),
    audioDuration:
        _$enumDecodeNullable(_$M2tsAudioDurationEnumMap, json['audioDuration']),
    audioFramesPerPes: json['audioFramesPerPes'] as int,
    audioPids: (json['audioPids'] as List)?.map((e) => e as int)?.toList(),
    bitrate: json['bitrate'] as int,
    bufferModel:
        _$enumDecodeNullable(_$M2tsBufferModelEnumMap, json['bufferModel']),
    dvbNitSettings: json['dvbNitSettings'] == null
        ? null
        : DvbNitSettings.fromJson(
            json['dvbNitSettings'] as Map<String, dynamic>),
    dvbSdtSettings: json['dvbSdtSettings'] == null
        ? null
        : DvbSdtSettings.fromJson(
            json['dvbSdtSettings'] as Map<String, dynamic>),
    dvbSubPids: (json['dvbSubPids'] as List)?.map((e) => e as int)?.toList(),
    dvbTdtSettings: json['dvbTdtSettings'] == null
        ? null
        : DvbTdtSettings.fromJson(
            json['dvbTdtSettings'] as Map<String, dynamic>),
    dvbTeletextPid: json['dvbTeletextPid'] as int,
    ebpAudioInterval: _$enumDecodeNullable(
        _$M2tsEbpAudioIntervalEnumMap, json['ebpAudioInterval']),
    ebpPlacement:
        _$enumDecodeNullable(_$M2tsEbpPlacementEnumMap, json['ebpPlacement']),
    esRateInPes:
        _$enumDecodeNullable(_$M2tsEsRateInPesEnumMap, json['esRateInPes']),
    forceTsVideoEbpOrder: _$enumDecodeNullable(
        _$M2tsForceTsVideoEbpOrderEnumMap, json['forceTsVideoEbpOrder']),
    fragmentTime: (json['fragmentTime'] as num)?.toDouble(),
    maxPcrInterval: json['maxPcrInterval'] as int,
    minEbpInterval: json['minEbpInterval'] as int,
    nielsenId3:
        _$enumDecodeNullable(_$M2tsNielsenId3EnumMap, json['nielsenId3']),
    nullPacketBitrate: (json['nullPacketBitrate'] as num)?.toDouble(),
    patInterval: json['patInterval'] as int,
    pcrControl:
        _$enumDecodeNullable(_$M2tsPcrControlEnumMap, json['pcrControl']),
    pcrPid: json['pcrPid'] as int,
    pmtInterval: json['pmtInterval'] as int,
    pmtPid: json['pmtPid'] as int,
    privateMetadataPid: json['privateMetadataPid'] as int,
    programNumber: json['programNumber'] as int,
    rateMode: _$enumDecodeNullable(_$M2tsRateModeEnumMap, json['rateMode']),
    scte35Esam: json['scte35Esam'] == null
        ? null
        : M2tsScte35Esam.fromJson(json['scte35Esam'] as Map<String, dynamic>),
    scte35Pid: json['scte35Pid'] as int,
    scte35Source:
        _$enumDecodeNullable(_$M2tsScte35SourceEnumMap, json['scte35Source']),
    segmentationMarkers: _$enumDecodeNullable(
        _$M2tsSegmentationMarkersEnumMap, json['segmentationMarkers']),
    segmentationStyle: _$enumDecodeNullable(
        _$M2tsSegmentationStyleEnumMap, json['segmentationStyle']),
    segmentationTime: (json['segmentationTime'] as num)?.toDouble(),
    timedMetadataPid: json['timedMetadataPid'] as int,
    transportStreamId: json['transportStreamId'] as int,
    videoPid: json['videoPid'] as int,
  );
}

Map<String, dynamic> _$M2tsSettingsToJson(M2tsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioBufferModel',
      _$M2tsAudioBufferModelEnumMap[instance.audioBufferModel]);
  writeNotNull(
      'audioDuration', _$M2tsAudioDurationEnumMap[instance.audioDuration]);
  writeNotNull('audioFramesPerPes', instance.audioFramesPerPes);
  writeNotNull('audioPids', instance.audioPids);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('bufferModel', _$M2tsBufferModelEnumMap[instance.bufferModel]);
  writeNotNull('dvbNitSettings', instance.dvbNitSettings?.toJson());
  writeNotNull('dvbSdtSettings', instance.dvbSdtSettings?.toJson());
  writeNotNull('dvbSubPids', instance.dvbSubPids);
  writeNotNull('dvbTdtSettings', instance.dvbTdtSettings?.toJson());
  writeNotNull('dvbTeletextPid', instance.dvbTeletextPid);
  writeNotNull('ebpAudioInterval',
      _$M2tsEbpAudioIntervalEnumMap[instance.ebpAudioInterval]);
  writeNotNull(
      'ebpPlacement', _$M2tsEbpPlacementEnumMap[instance.ebpPlacement]);
  writeNotNull('esRateInPes', _$M2tsEsRateInPesEnumMap[instance.esRateInPes]);
  writeNotNull('forceTsVideoEbpOrder',
      _$M2tsForceTsVideoEbpOrderEnumMap[instance.forceTsVideoEbpOrder]);
  writeNotNull('fragmentTime', instance.fragmentTime);
  writeNotNull('maxPcrInterval', instance.maxPcrInterval);
  writeNotNull('minEbpInterval', instance.minEbpInterval);
  writeNotNull('nielsenId3', _$M2tsNielsenId3EnumMap[instance.nielsenId3]);
  writeNotNull('nullPacketBitrate', instance.nullPacketBitrate);
  writeNotNull('patInterval', instance.patInterval);
  writeNotNull('pcrControl', _$M2tsPcrControlEnumMap[instance.pcrControl]);
  writeNotNull('pcrPid', instance.pcrPid);
  writeNotNull('pmtInterval', instance.pmtInterval);
  writeNotNull('pmtPid', instance.pmtPid);
  writeNotNull('privateMetadataPid', instance.privateMetadataPid);
  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('rateMode', _$M2tsRateModeEnumMap[instance.rateMode]);
  writeNotNull('scte35Esam', instance.scte35Esam?.toJson());
  writeNotNull('scte35Pid', instance.scte35Pid);
  writeNotNull(
      'scte35Source', _$M2tsScte35SourceEnumMap[instance.scte35Source]);
  writeNotNull('segmentationMarkers',
      _$M2tsSegmentationMarkersEnumMap[instance.segmentationMarkers]);
  writeNotNull('segmentationStyle',
      _$M2tsSegmentationStyleEnumMap[instance.segmentationStyle]);
  writeNotNull('segmentationTime', instance.segmentationTime);
  writeNotNull('timedMetadataPid', instance.timedMetadataPid);
  writeNotNull('transportStreamId', instance.transportStreamId);
  writeNotNull('videoPid', instance.videoPid);
  return val;
}

const _$M2tsAudioBufferModelEnumMap = {
  M2tsAudioBufferModel.dvb: 'DVB',
  M2tsAudioBufferModel.atsc: 'ATSC',
};

const _$M2tsAudioDurationEnumMap = {
  M2tsAudioDuration.defaultCodecDuration: 'DEFAULT_CODEC_DURATION',
  M2tsAudioDuration.matchVideoDuration: 'MATCH_VIDEO_DURATION',
};

const _$M2tsBufferModelEnumMap = {
  M2tsBufferModel.multiplex: 'MULTIPLEX',
  M2tsBufferModel.none: 'NONE',
};

const _$M2tsEbpAudioIntervalEnumMap = {
  M2tsEbpAudioInterval.videoAndFixedIntervals: 'VIDEO_AND_FIXED_INTERVALS',
  M2tsEbpAudioInterval.videoInterval: 'VIDEO_INTERVAL',
};

const _$M2tsEbpPlacementEnumMap = {
  M2tsEbpPlacement.videoAndAudioPids: 'VIDEO_AND_AUDIO_PIDS',
  M2tsEbpPlacement.videoPid: 'VIDEO_PID',
};

const _$M2tsEsRateInPesEnumMap = {
  M2tsEsRateInPes.include: 'INCLUDE',
  M2tsEsRateInPes.exclude: 'EXCLUDE',
};

const _$M2tsForceTsVideoEbpOrderEnumMap = {
  M2tsForceTsVideoEbpOrder.force: 'FORCE',
  M2tsForceTsVideoEbpOrder.$default: 'DEFAULT',
};

const _$M2tsNielsenId3EnumMap = {
  M2tsNielsenId3.insert: 'INSERT',
  M2tsNielsenId3.none: 'NONE',
};

const _$M2tsPcrControlEnumMap = {
  M2tsPcrControl.pcrEveryPesPacket: 'PCR_EVERY_PES_PACKET',
  M2tsPcrControl.configuredPcrPeriod: 'CONFIGURED_PCR_PERIOD',
};

const _$M2tsRateModeEnumMap = {
  M2tsRateMode.vbr: 'VBR',
  M2tsRateMode.cbr: 'CBR',
};

const _$M2tsScte35SourceEnumMap = {
  M2tsScte35Source.passthrough: 'PASSTHROUGH',
  M2tsScte35Source.none: 'NONE',
};

const _$M2tsSegmentationMarkersEnumMap = {
  M2tsSegmentationMarkers.none: 'NONE',
  M2tsSegmentationMarkers.raiSegstart: 'RAI_SEGSTART',
  M2tsSegmentationMarkers.raiAdapt: 'RAI_ADAPT',
  M2tsSegmentationMarkers.psiSegstart: 'PSI_SEGSTART',
  M2tsSegmentationMarkers.ebp: 'EBP',
  M2tsSegmentationMarkers.ebpLegacy: 'EBP_LEGACY',
};

const _$M2tsSegmentationStyleEnumMap = {
  M2tsSegmentationStyle.maintainCadence: 'MAINTAIN_CADENCE',
  M2tsSegmentationStyle.resetCadence: 'RESET_CADENCE',
};

M3u8Settings _$M3u8SettingsFromJson(Map<String, dynamic> json) {
  return M3u8Settings(
    audioDuration:
        _$enumDecodeNullable(_$M3u8AudioDurationEnumMap, json['audioDuration']),
    audioFramesPerPes: json['audioFramesPerPes'] as int,
    audioPids: (json['audioPids'] as List)?.map((e) => e as int)?.toList(),
    nielsenId3:
        _$enumDecodeNullable(_$M3u8NielsenId3EnumMap, json['nielsenId3']),
    patInterval: json['patInterval'] as int,
    pcrControl:
        _$enumDecodeNullable(_$M3u8PcrControlEnumMap, json['pcrControl']),
    pcrPid: json['pcrPid'] as int,
    pmtInterval: json['pmtInterval'] as int,
    pmtPid: json['pmtPid'] as int,
    privateMetadataPid: json['privateMetadataPid'] as int,
    programNumber: json['programNumber'] as int,
    scte35Pid: json['scte35Pid'] as int,
    scte35Source:
        _$enumDecodeNullable(_$M3u8Scte35SourceEnumMap, json['scte35Source']),
    timedMetadata:
        _$enumDecodeNullable(_$TimedMetadataEnumMap, json['timedMetadata']),
    timedMetadataPid: json['timedMetadataPid'] as int,
    transportStreamId: json['transportStreamId'] as int,
    videoPid: json['videoPid'] as int,
  );
}

Map<String, dynamic> _$M3u8SettingsToJson(M3u8Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'audioDuration', _$M3u8AudioDurationEnumMap[instance.audioDuration]);
  writeNotNull('audioFramesPerPes', instance.audioFramesPerPes);
  writeNotNull('audioPids', instance.audioPids);
  writeNotNull('nielsenId3', _$M3u8NielsenId3EnumMap[instance.nielsenId3]);
  writeNotNull('patInterval', instance.patInterval);
  writeNotNull('pcrControl', _$M3u8PcrControlEnumMap[instance.pcrControl]);
  writeNotNull('pcrPid', instance.pcrPid);
  writeNotNull('pmtInterval', instance.pmtInterval);
  writeNotNull('pmtPid', instance.pmtPid);
  writeNotNull('privateMetadataPid', instance.privateMetadataPid);
  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('scte35Pid', instance.scte35Pid);
  writeNotNull(
      'scte35Source', _$M3u8Scte35SourceEnumMap[instance.scte35Source]);
  writeNotNull('timedMetadata', _$TimedMetadataEnumMap[instance.timedMetadata]);
  writeNotNull('timedMetadataPid', instance.timedMetadataPid);
  writeNotNull('transportStreamId', instance.transportStreamId);
  writeNotNull('videoPid', instance.videoPid);
  return val;
}

const _$M3u8AudioDurationEnumMap = {
  M3u8AudioDuration.defaultCodecDuration: 'DEFAULT_CODEC_DURATION',
  M3u8AudioDuration.matchVideoDuration: 'MATCH_VIDEO_DURATION',
};

const _$M3u8NielsenId3EnumMap = {
  M3u8NielsenId3.insert: 'INSERT',
  M3u8NielsenId3.none: 'NONE',
};

const _$M3u8PcrControlEnumMap = {
  M3u8PcrControl.pcrEveryPesPacket: 'PCR_EVERY_PES_PACKET',
  M3u8PcrControl.configuredPcrPeriod: 'CONFIGURED_PCR_PERIOD',
};

const _$M3u8Scte35SourceEnumMap = {
  M3u8Scte35Source.passthrough: 'PASSTHROUGH',
  M3u8Scte35Source.none: 'NONE',
};

const _$TimedMetadataEnumMap = {
  TimedMetadata.passthrough: 'PASSTHROUGH',
  TimedMetadata.none: 'NONE',
};

MotionImageInserter _$MotionImageInserterFromJson(Map<String, dynamic> json) {
  return MotionImageInserter(
    framerate: json['framerate'] == null
        ? null
        : MotionImageInsertionFramerate.fromJson(
            json['framerate'] as Map<String, dynamic>),
    input: json['input'] as String,
    insertionMode: _$enumDecodeNullable(
        _$MotionImageInsertionModeEnumMap, json['insertionMode']),
    offset: json['offset'] == null
        ? null
        : MotionImageInsertionOffset.fromJson(
            json['offset'] as Map<String, dynamic>),
    playback:
        _$enumDecodeNullable(_$MotionImagePlaybackEnumMap, json['playback']),
    startTime: json['startTime'] as String,
  );
}

Map<String, dynamic> _$MotionImageInserterToJson(MotionImageInserter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerate', instance.framerate?.toJson());
  writeNotNull('input', instance.input);
  writeNotNull('insertionMode',
      _$MotionImageInsertionModeEnumMap[instance.insertionMode]);
  writeNotNull('offset', instance.offset?.toJson());
  writeNotNull('playback', _$MotionImagePlaybackEnumMap[instance.playback]);
  writeNotNull('startTime', instance.startTime);
  return val;
}

const _$MotionImageInsertionModeEnumMap = {
  MotionImageInsertionMode.mov: 'MOV',
  MotionImageInsertionMode.png: 'PNG',
};

const _$MotionImagePlaybackEnumMap = {
  MotionImagePlayback.once: 'ONCE',
  MotionImagePlayback.repeat: 'REPEAT',
};

MotionImageInsertionFramerate _$MotionImageInsertionFramerateFromJson(
    Map<String, dynamic> json) {
  return MotionImageInsertionFramerate(
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
  );
}

Map<String, dynamic> _$MotionImageInsertionFramerateToJson(
    MotionImageInsertionFramerate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  return val;
}

MotionImageInsertionOffset _$MotionImageInsertionOffsetFromJson(
    Map<String, dynamic> json) {
  return MotionImageInsertionOffset(
    imageX: json['imageX'] as int,
    imageY: json['imageY'] as int,
  );
}

Map<String, dynamic> _$MotionImageInsertionOffsetToJson(
    MotionImageInsertionOffset instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageX', instance.imageX);
  writeNotNull('imageY', instance.imageY);
  return val;
}

MovSettings _$MovSettingsFromJson(Map<String, dynamic> json) {
  return MovSettings(
    clapAtom: _$enumDecodeNullable(_$MovClapAtomEnumMap, json['clapAtom']),
    cslgAtom: _$enumDecodeNullable(_$MovCslgAtomEnumMap, json['cslgAtom']),
    mpeg2FourCCControl: _$enumDecodeNullable(
        _$MovMpeg2FourCCControlEnumMap, json['mpeg2FourCCControl']),
    paddingControl: _$enumDecodeNullable(
        _$MovPaddingControlEnumMap, json['paddingControl']),
    reference: _$enumDecodeNullable(_$MovReferenceEnumMap, json['reference']),
  );
}

Map<String, dynamic> _$MovSettingsToJson(MovSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clapAtom', _$MovClapAtomEnumMap[instance.clapAtom]);
  writeNotNull('cslgAtom', _$MovCslgAtomEnumMap[instance.cslgAtom]);
  writeNotNull('mpeg2FourCCControl',
      _$MovMpeg2FourCCControlEnumMap[instance.mpeg2FourCCControl]);
  writeNotNull(
      'paddingControl', _$MovPaddingControlEnumMap[instance.paddingControl]);
  writeNotNull('reference', _$MovReferenceEnumMap[instance.reference]);
  return val;
}

const _$MovClapAtomEnumMap = {
  MovClapAtom.include: 'INCLUDE',
  MovClapAtom.exclude: 'EXCLUDE',
};

const _$MovCslgAtomEnumMap = {
  MovCslgAtom.include: 'INCLUDE',
  MovCslgAtom.exclude: 'EXCLUDE',
};

const _$MovMpeg2FourCCControlEnumMap = {
  MovMpeg2FourCCControl.xdcam: 'XDCAM',
  MovMpeg2FourCCControl.mpeg: 'MPEG',
};

const _$MovPaddingControlEnumMap = {
  MovPaddingControl.omneon: 'OMNEON',
  MovPaddingControl.none: 'NONE',
};

const _$MovReferenceEnumMap = {
  MovReference.selfContained: 'SELF_CONTAINED',
  MovReference.external: 'EXTERNAL',
};

Mp2Settings _$Mp2SettingsFromJson(Map<String, dynamic> json) {
  return Mp2Settings(
    bitrate: json['bitrate'] as int,
    channels: json['channels'] as int,
    sampleRate: json['sampleRate'] as int,
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
  writeNotNull('channels', instance.channels);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

Mp3Settings _$Mp3SettingsFromJson(Map<String, dynamic> json) {
  return Mp3Settings(
    bitrate: json['bitrate'] as int,
    channels: json['channels'] as int,
    rateControlMode: _$enumDecodeNullable(
        _$Mp3RateControlModeEnumMap, json['rateControlMode']),
    sampleRate: json['sampleRate'] as int,
    vbrQuality: json['vbrQuality'] as int,
  );
}

Map<String, dynamic> _$Mp3SettingsToJson(Mp3Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('channels', instance.channels);
  writeNotNull(
      'rateControlMode', _$Mp3RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('sampleRate', instance.sampleRate);
  writeNotNull('vbrQuality', instance.vbrQuality);
  return val;
}

const _$Mp3RateControlModeEnumMap = {
  Mp3RateControlMode.cbr: 'CBR',
  Mp3RateControlMode.vbr: 'VBR',
};

Mp4Settings _$Mp4SettingsFromJson(Map<String, dynamic> json) {
  return Mp4Settings(
    audioDuration:
        _$enumDecodeNullable(_$CmfcAudioDurationEnumMap, json['audioDuration']),
    cslgAtom: _$enumDecodeNullable(_$Mp4CslgAtomEnumMap, json['cslgAtom']),
    cttsVersion: json['cttsVersion'] as int,
    freeSpaceBox:
        _$enumDecodeNullable(_$Mp4FreeSpaceBoxEnumMap, json['freeSpaceBox']),
    moovPlacement:
        _$enumDecodeNullable(_$Mp4MoovPlacementEnumMap, json['moovPlacement']),
    mp4MajorBrand: json['mp4MajorBrand'] as String,
  );
}

Map<String, dynamic> _$Mp4SettingsToJson(Mp4Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'audioDuration', _$CmfcAudioDurationEnumMap[instance.audioDuration]);
  writeNotNull('cslgAtom', _$Mp4CslgAtomEnumMap[instance.cslgAtom]);
  writeNotNull('cttsVersion', instance.cttsVersion);
  writeNotNull('freeSpaceBox', _$Mp4FreeSpaceBoxEnumMap[instance.freeSpaceBox]);
  writeNotNull(
      'moovPlacement', _$Mp4MoovPlacementEnumMap[instance.moovPlacement]);
  writeNotNull('mp4MajorBrand', instance.mp4MajorBrand);
  return val;
}

const _$Mp4CslgAtomEnumMap = {
  Mp4CslgAtom.include: 'INCLUDE',
  Mp4CslgAtom.exclude: 'EXCLUDE',
};

const _$Mp4FreeSpaceBoxEnumMap = {
  Mp4FreeSpaceBox.include: 'INCLUDE',
  Mp4FreeSpaceBox.exclude: 'EXCLUDE',
};

const _$Mp4MoovPlacementEnumMap = {
  Mp4MoovPlacement.progressiveDownload: 'PROGRESSIVE_DOWNLOAD',
  Mp4MoovPlacement.normal: 'NORMAL',
};

MpdSettings _$MpdSettingsFromJson(Map<String, dynamic> json) {
  return MpdSettings(
    accessibilityCaptionHints: _$enumDecodeNullable(
        _$MpdAccessibilityCaptionHintsEnumMap,
        json['accessibilityCaptionHints']),
    audioDuration:
        _$enumDecodeNullable(_$MpdAudioDurationEnumMap, json['audioDuration']),
    captionContainerType: _$enumDecodeNullable(
        _$MpdCaptionContainerTypeEnumMap, json['captionContainerType']),
    scte35Esam:
        _$enumDecodeNullable(_$MpdScte35EsamEnumMap, json['scte35Esam']),
    scte35Source:
        _$enumDecodeNullable(_$MpdScte35SourceEnumMap, json['scte35Source']),
  );
}

Map<String, dynamic> _$MpdSettingsToJson(MpdSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'accessibilityCaptionHints',
      _$MpdAccessibilityCaptionHintsEnumMap[
          instance.accessibilityCaptionHints]);
  writeNotNull(
      'audioDuration', _$MpdAudioDurationEnumMap[instance.audioDuration]);
  writeNotNull('captionContainerType',
      _$MpdCaptionContainerTypeEnumMap[instance.captionContainerType]);
  writeNotNull('scte35Esam', _$MpdScte35EsamEnumMap[instance.scte35Esam]);
  writeNotNull('scte35Source', _$MpdScte35SourceEnumMap[instance.scte35Source]);
  return val;
}

const _$MpdAccessibilityCaptionHintsEnumMap = {
  MpdAccessibilityCaptionHints.include: 'INCLUDE',
  MpdAccessibilityCaptionHints.exclude: 'EXCLUDE',
};

const _$MpdAudioDurationEnumMap = {
  MpdAudioDuration.defaultCodecDuration: 'DEFAULT_CODEC_DURATION',
  MpdAudioDuration.matchVideoDuration: 'MATCH_VIDEO_DURATION',
};

const _$MpdCaptionContainerTypeEnumMap = {
  MpdCaptionContainerType.raw: 'RAW',
  MpdCaptionContainerType.fragmentedMp4: 'FRAGMENTED_MP4',
};

const _$MpdScte35EsamEnumMap = {
  MpdScte35Esam.insert: 'INSERT',
  MpdScte35Esam.none: 'NONE',
};

const _$MpdScte35SourceEnumMap = {
  MpdScte35Source.passthrough: 'PASSTHROUGH',
  MpdScte35Source.none: 'NONE',
};

Mpeg2Settings _$Mpeg2SettingsFromJson(Map<String, dynamic> json) {
  return Mpeg2Settings(
    adaptiveQuantization: _$enumDecodeNullable(
        _$Mpeg2AdaptiveQuantizationEnumMap, json['adaptiveQuantization']),
    bitrate: json['bitrate'] as int,
    codecLevel:
        _$enumDecodeNullable(_$Mpeg2CodecLevelEnumMap, json['codecLevel']),
    codecProfile:
        _$enumDecodeNullable(_$Mpeg2CodecProfileEnumMap, json['codecProfile']),
    dynamicSubGop: _$enumDecodeNullable(
        _$Mpeg2DynamicSubGopEnumMap, json['dynamicSubGop']),
    framerateControl: _$enumDecodeNullable(
        _$Mpeg2FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$Mpeg2FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopClosedCadence: json['gopClosedCadence'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    gopSizeUnits:
        _$enumDecodeNullable(_$Mpeg2GopSizeUnitsEnumMap, json['gopSizeUnits']),
    hrdBufferInitialFillPercentage:
        json['hrdBufferInitialFillPercentage'] as int,
    hrdBufferSize: json['hrdBufferSize'] as int,
    interlaceMode: _$enumDecodeNullable(
        _$Mpeg2InterlaceModeEnumMap, json['interlaceMode']),
    intraDcPrecision: _$enumDecodeNullable(
        _$Mpeg2IntraDcPrecisionEnumMap, json['intraDcPrecision']),
    maxBitrate: json['maxBitrate'] as int,
    minIInterval: json['minIInterval'] as int,
    numberBFramesBetweenReferenceFrames:
        json['numberBFramesBetweenReferenceFrames'] as int,
    parControl:
        _$enumDecodeNullable(_$Mpeg2ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    qualityTuningLevel: _$enumDecodeNullable(
        _$Mpeg2QualityTuningLevelEnumMap, json['qualityTuningLevel']),
    rateControlMode: _$enumDecodeNullable(
        _$Mpeg2RateControlModeEnumMap, json['rateControlMode']),
    sceneChangeDetect: _$enumDecodeNullable(
        _$Mpeg2SceneChangeDetectEnumMap, json['sceneChangeDetect']),
    slowPal: _$enumDecodeNullable(_$Mpeg2SlowPalEnumMap, json['slowPal']),
    softness: json['softness'] as int,
    spatialAdaptiveQuantization: _$enumDecodeNullable(
        _$Mpeg2SpatialAdaptiveQuantizationEnumMap,
        json['spatialAdaptiveQuantization']),
    syntax: _$enumDecodeNullable(_$Mpeg2SyntaxEnumMap, json['syntax']),
    telecine: _$enumDecodeNullable(_$Mpeg2TelecineEnumMap, json['telecine']),
    temporalAdaptiveQuantization: _$enumDecodeNullable(
        _$Mpeg2TemporalAdaptiveQuantizationEnumMap,
        json['temporalAdaptiveQuantization']),
  );
}

Map<String, dynamic> _$Mpeg2SettingsToJson(Mpeg2Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adaptiveQuantization',
      _$Mpeg2AdaptiveQuantizationEnumMap[instance.adaptiveQuantization]);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('codecLevel', _$Mpeg2CodecLevelEnumMap[instance.codecLevel]);
  writeNotNull(
      'codecProfile', _$Mpeg2CodecProfileEnumMap[instance.codecProfile]);
  writeNotNull(
      'dynamicSubGop', _$Mpeg2DynamicSubGopEnumMap[instance.dynamicSubGop]);
  writeNotNull('framerateControl',
      _$Mpeg2FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$Mpeg2FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('gopClosedCadence', instance.gopClosedCadence);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull(
      'gopSizeUnits', _$Mpeg2GopSizeUnitsEnumMap[instance.gopSizeUnits]);
  writeNotNull('hrdBufferInitialFillPercentage',
      instance.hrdBufferInitialFillPercentage);
  writeNotNull('hrdBufferSize', instance.hrdBufferSize);
  writeNotNull(
      'interlaceMode', _$Mpeg2InterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('intraDcPrecision',
      _$Mpeg2IntraDcPrecisionEnumMap[instance.intraDcPrecision]);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('minIInterval', instance.minIInterval);
  writeNotNull('numberBFramesBetweenReferenceFrames',
      instance.numberBFramesBetweenReferenceFrames);
  writeNotNull('parControl', _$Mpeg2ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('qualityTuningLevel',
      _$Mpeg2QualityTuningLevelEnumMap[instance.qualityTuningLevel]);
  writeNotNull('rateControlMode',
      _$Mpeg2RateControlModeEnumMap[instance.rateControlMode]);
  writeNotNull('sceneChangeDetect',
      _$Mpeg2SceneChangeDetectEnumMap[instance.sceneChangeDetect]);
  writeNotNull('slowPal', _$Mpeg2SlowPalEnumMap[instance.slowPal]);
  writeNotNull('softness', instance.softness);
  writeNotNull(
      'spatialAdaptiveQuantization',
      _$Mpeg2SpatialAdaptiveQuantizationEnumMap[
          instance.spatialAdaptiveQuantization]);
  writeNotNull('syntax', _$Mpeg2SyntaxEnumMap[instance.syntax]);
  writeNotNull('telecine', _$Mpeg2TelecineEnumMap[instance.telecine]);
  writeNotNull(
      'temporalAdaptiveQuantization',
      _$Mpeg2TemporalAdaptiveQuantizationEnumMap[
          instance.temporalAdaptiveQuantization]);
  return val;
}

const _$Mpeg2AdaptiveQuantizationEnumMap = {
  Mpeg2AdaptiveQuantization.off: 'OFF',
  Mpeg2AdaptiveQuantization.low: 'LOW',
  Mpeg2AdaptiveQuantization.medium: 'MEDIUM',
  Mpeg2AdaptiveQuantization.high: 'HIGH',
};

const _$Mpeg2CodecLevelEnumMap = {
  Mpeg2CodecLevel.auto: 'AUTO',
  Mpeg2CodecLevel.low: 'LOW',
  Mpeg2CodecLevel.main: 'MAIN',
  Mpeg2CodecLevel.high1440: 'HIGH1440',
  Mpeg2CodecLevel.high: 'HIGH',
};

const _$Mpeg2CodecProfileEnumMap = {
  Mpeg2CodecProfile.main: 'MAIN',
  Mpeg2CodecProfile.profile_422: 'PROFILE_422',
};

const _$Mpeg2DynamicSubGopEnumMap = {
  Mpeg2DynamicSubGop.adaptive: 'ADAPTIVE',
  Mpeg2DynamicSubGop.static: 'STATIC',
};

const _$Mpeg2FramerateControlEnumMap = {
  Mpeg2FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Mpeg2FramerateControl.specified: 'SPECIFIED',
};

const _$Mpeg2FramerateConversionAlgorithmEnumMap = {
  Mpeg2FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  Mpeg2FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  Mpeg2FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$Mpeg2GopSizeUnitsEnumMap = {
  Mpeg2GopSizeUnits.frames: 'FRAMES',
  Mpeg2GopSizeUnits.seconds: 'SECONDS',
};

const _$Mpeg2InterlaceModeEnumMap = {
  Mpeg2InterlaceMode.progressive: 'PROGRESSIVE',
  Mpeg2InterlaceMode.topField: 'TOP_FIELD',
  Mpeg2InterlaceMode.bottomField: 'BOTTOM_FIELD',
  Mpeg2InterlaceMode.followTopField: 'FOLLOW_TOP_FIELD',
  Mpeg2InterlaceMode.followBottomField: 'FOLLOW_BOTTOM_FIELD',
};

const _$Mpeg2IntraDcPrecisionEnumMap = {
  Mpeg2IntraDcPrecision.auto: 'AUTO',
  Mpeg2IntraDcPrecision.intraDcPrecision_8: 'INTRA_DC_PRECISION_8',
  Mpeg2IntraDcPrecision.intraDcPrecision_9: 'INTRA_DC_PRECISION_9',
  Mpeg2IntraDcPrecision.intraDcPrecision_10: 'INTRA_DC_PRECISION_10',
  Mpeg2IntraDcPrecision.intraDcPrecision_11: 'INTRA_DC_PRECISION_11',
};

const _$Mpeg2ParControlEnumMap = {
  Mpeg2ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Mpeg2ParControl.specified: 'SPECIFIED',
};

const _$Mpeg2QualityTuningLevelEnumMap = {
  Mpeg2QualityTuningLevel.singlePass: 'SINGLE_PASS',
  Mpeg2QualityTuningLevel.multiPass: 'MULTI_PASS',
};

const _$Mpeg2RateControlModeEnumMap = {
  Mpeg2RateControlMode.vbr: 'VBR',
  Mpeg2RateControlMode.cbr: 'CBR',
};

const _$Mpeg2SceneChangeDetectEnumMap = {
  Mpeg2SceneChangeDetect.disabled: 'DISABLED',
  Mpeg2SceneChangeDetect.enabled: 'ENABLED',
};

const _$Mpeg2SlowPalEnumMap = {
  Mpeg2SlowPal.disabled: 'DISABLED',
  Mpeg2SlowPal.enabled: 'ENABLED',
};

const _$Mpeg2SpatialAdaptiveQuantizationEnumMap = {
  Mpeg2SpatialAdaptiveQuantization.disabled: 'DISABLED',
  Mpeg2SpatialAdaptiveQuantization.enabled: 'ENABLED',
};

const _$Mpeg2SyntaxEnumMap = {
  Mpeg2Syntax.$default: 'DEFAULT',
  Mpeg2Syntax.d_10: 'D_10',
};

const _$Mpeg2TelecineEnumMap = {
  Mpeg2Telecine.none: 'NONE',
  Mpeg2Telecine.soft: 'SOFT',
  Mpeg2Telecine.hard: 'HARD',
};

const _$Mpeg2TemporalAdaptiveQuantizationEnumMap = {
  Mpeg2TemporalAdaptiveQuantization.disabled: 'DISABLED',
  Mpeg2TemporalAdaptiveQuantization.enabled: 'ENABLED',
};

MsSmoothAdditionalManifest _$MsSmoothAdditionalManifestFromJson(
    Map<String, dynamic> json) {
  return MsSmoothAdditionalManifest(
    manifestNameModifier: json['manifestNameModifier'] as String,
    selectedOutputs:
        (json['selectedOutputs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MsSmoothAdditionalManifestToJson(
    MsSmoothAdditionalManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestNameModifier', instance.manifestNameModifier);
  writeNotNull('selectedOutputs', instance.selectedOutputs);
  return val;
}

MsSmoothEncryptionSettings _$MsSmoothEncryptionSettingsFromJson(
    Map<String, dynamic> json) {
  return MsSmoothEncryptionSettings(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MsSmoothEncryptionSettingsToJson(
    MsSmoothEncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  return val;
}

MsSmoothGroupSettings _$MsSmoothGroupSettingsFromJson(
    Map<String, dynamic> json) {
  return MsSmoothGroupSettings(
    additionalManifests: (json['additionalManifests'] as List)
        ?.map((e) => e == null
            ? null
            : MsSmoothAdditionalManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    audioDeduplication: _$enumDecodeNullable(
        _$MsSmoothAudioDeduplicationEnumMap, json['audioDeduplication']),
    destination: json['destination'] as String,
    destinationSettings: json['destinationSettings'] == null
        ? null
        : DestinationSettings.fromJson(
            json['destinationSettings'] as Map<String, dynamic>),
    encryption: json['encryption'] == null
        ? null
        : MsSmoothEncryptionSettings.fromJson(
            json['encryption'] as Map<String, dynamic>),
    fragmentLength: json['fragmentLength'] as int,
    manifestEncoding: _$enumDecodeNullable(
        _$MsSmoothManifestEncodingEnumMap, json['manifestEncoding']),
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

  writeNotNull('additionalManifests',
      instance.additionalManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('audioDeduplication',
      _$MsSmoothAudioDeduplicationEnumMap[instance.audioDeduplication]);
  writeNotNull('destination', instance.destination);
  writeNotNull('destinationSettings', instance.destinationSettings?.toJson());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('fragmentLength', instance.fragmentLength);
  writeNotNull('manifestEncoding',
      _$MsSmoothManifestEncodingEnumMap[instance.manifestEncoding]);
  return val;
}

const _$MsSmoothAudioDeduplicationEnumMap = {
  MsSmoothAudioDeduplication.combineDuplicateStreams:
      'COMBINE_DUPLICATE_STREAMS',
  MsSmoothAudioDeduplication.none: 'NONE',
};

const _$MsSmoothManifestEncodingEnumMap = {
  MsSmoothManifestEncoding.utf8: 'UTF8',
  MsSmoothManifestEncoding.utf16: 'UTF16',
};

MxfSettings _$MxfSettingsFromJson(Map<String, dynamic> json) {
  return MxfSettings(
    afdSignaling:
        _$enumDecodeNullable(_$MxfAfdSignalingEnumMap, json['afdSignaling']),
    profile: _$enumDecodeNullable(_$MxfProfileEnumMap, json['profile']),
  );
}

Map<String, dynamic> _$MxfSettingsToJson(MxfSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('afdSignaling', _$MxfAfdSignalingEnumMap[instance.afdSignaling]);
  writeNotNull('profile', _$MxfProfileEnumMap[instance.profile]);
  return val;
}

const _$MxfAfdSignalingEnumMap = {
  MxfAfdSignaling.noCopy: 'NO_COPY',
  MxfAfdSignaling.copyFromVideo: 'COPY_FROM_VIDEO',
};

const _$MxfProfileEnumMap = {
  MxfProfile.d_10: 'D_10',
  MxfProfile.xdcam: 'XDCAM',
  MxfProfile.op1a: 'OP1A',
};

NexGuardFileMarkerSettings _$NexGuardFileMarkerSettingsFromJson(
    Map<String, dynamic> json) {
  return NexGuardFileMarkerSettings(
    license: json['license'] as String,
    payload: json['payload'] as int,
    preset: json['preset'] as String,
    strength:
        _$enumDecodeNullable(_$WatermarkingStrengthEnumMap, json['strength']),
  );
}

Map<String, dynamic> _$NexGuardFileMarkerSettingsToJson(
    NexGuardFileMarkerSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('license', instance.license);
  writeNotNull('payload', instance.payload);
  writeNotNull('preset', instance.preset);
  writeNotNull('strength', _$WatermarkingStrengthEnumMap[instance.strength]);
  return val;
}

const _$WatermarkingStrengthEnumMap = {
  WatermarkingStrength.lightest: 'LIGHTEST',
  WatermarkingStrength.lighter: 'LIGHTER',
  WatermarkingStrength.$default: 'DEFAULT',
  WatermarkingStrength.stronger: 'STRONGER',
  WatermarkingStrength.strongest: 'STRONGEST',
};

NielsenConfiguration _$NielsenConfigurationFromJson(Map<String, dynamic> json) {
  return NielsenConfiguration(
    breakoutCode: json['breakoutCode'] as int,
    distributorId: json['distributorId'] as String,
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

  writeNotNull('breakoutCode', instance.breakoutCode);
  writeNotNull('distributorId', instance.distributorId);
  return val;
}

NielsenNonLinearWatermarkSettings _$NielsenNonLinearWatermarkSettingsFromJson(
    Map<String, dynamic> json) {
  return NielsenNonLinearWatermarkSettings(
    activeWatermarkProcess: _$enumDecodeNullable(
        _$NielsenActiveWatermarkProcessTypeEnumMap,
        json['activeWatermarkProcess']),
    adiFilename: json['adiFilename'] as String,
    assetId: json['assetId'] as String,
    assetName: json['assetName'] as String,
    cbetSourceId: json['cbetSourceId'] as String,
    episodeId: json['episodeId'] as String,
    metadataDestination: json['metadataDestination'] as String,
    sourceId: json['sourceId'] as int,
    sourceWatermarkStatus: _$enumDecodeNullable(
        _$NielsenSourceWatermarkStatusTypeEnumMap,
        json['sourceWatermarkStatus']),
    ticServerUrl: json['ticServerUrl'] as String,
    uniqueTicPerAudioTrack: _$enumDecodeNullable(
        _$NielsenUniqueTicPerAudioTrackTypeEnumMap,
        json['uniqueTicPerAudioTrack']),
  );
}

Map<String, dynamic> _$NielsenNonLinearWatermarkSettingsToJson(
    NielsenNonLinearWatermarkSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'activeWatermarkProcess',
      _$NielsenActiveWatermarkProcessTypeEnumMap[
          instance.activeWatermarkProcess]);
  writeNotNull('adiFilename', instance.adiFilename);
  writeNotNull('assetId', instance.assetId);
  writeNotNull('assetName', instance.assetName);
  writeNotNull('cbetSourceId', instance.cbetSourceId);
  writeNotNull('episodeId', instance.episodeId);
  writeNotNull('metadataDestination', instance.metadataDestination);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull(
      'sourceWatermarkStatus',
      _$NielsenSourceWatermarkStatusTypeEnumMap[
          instance.sourceWatermarkStatus]);
  writeNotNull('ticServerUrl', instance.ticServerUrl);
  writeNotNull(
      'uniqueTicPerAudioTrack',
      _$NielsenUniqueTicPerAudioTrackTypeEnumMap[
          instance.uniqueTicPerAudioTrack]);
  return val;
}

const _$NielsenActiveWatermarkProcessTypeEnumMap = {
  NielsenActiveWatermarkProcessType.naes2AndNw: 'NAES2_AND_NW',
  NielsenActiveWatermarkProcessType.cbet: 'CBET',
  NielsenActiveWatermarkProcessType.naes2AndNwAndCbet: 'NAES2_AND_NW_AND_CBET',
};

const _$NielsenSourceWatermarkStatusTypeEnumMap = {
  NielsenSourceWatermarkStatusType.clean: 'CLEAN',
  NielsenSourceWatermarkStatusType.watermarked: 'WATERMARKED',
};

const _$NielsenUniqueTicPerAudioTrackTypeEnumMap = {
  NielsenUniqueTicPerAudioTrackType.reserveUniqueTicsPerTrack:
      'RESERVE_UNIQUE_TICS_PER_TRACK',
  NielsenUniqueTicPerAudioTrackType.sameTicsPerTrack: 'SAME_TICS_PER_TRACK',
};

NoiseReducer _$NoiseReducerFromJson(Map<String, dynamic> json) {
  return NoiseReducer(
    filter: _$enumDecodeNullable(_$NoiseReducerFilterEnumMap, json['filter']),
    filterSettings: json['filterSettings'] == null
        ? null
        : NoiseReducerFilterSettings.fromJson(
            json['filterSettings'] as Map<String, dynamic>),
    spatialFilterSettings: json['spatialFilterSettings'] == null
        ? null
        : NoiseReducerSpatialFilterSettings.fromJson(
            json['spatialFilterSettings'] as Map<String, dynamic>),
    temporalFilterSettings: json['temporalFilterSettings'] == null
        ? null
        : NoiseReducerTemporalFilterSettings.fromJson(
            json['temporalFilterSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NoiseReducerToJson(NoiseReducer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filter', _$NoiseReducerFilterEnumMap[instance.filter]);
  writeNotNull('filterSettings', instance.filterSettings?.toJson());
  writeNotNull(
      'spatialFilterSettings', instance.spatialFilterSettings?.toJson());
  writeNotNull(
      'temporalFilterSettings', instance.temporalFilterSettings?.toJson());
  return val;
}

const _$NoiseReducerFilterEnumMap = {
  NoiseReducerFilter.bilateral: 'BILATERAL',
  NoiseReducerFilter.mean: 'MEAN',
  NoiseReducerFilter.gaussian: 'GAUSSIAN',
  NoiseReducerFilter.lanczos: 'LANCZOS',
  NoiseReducerFilter.sharpen: 'SHARPEN',
  NoiseReducerFilter.conserve: 'CONSERVE',
  NoiseReducerFilter.spatial: 'SPATIAL',
  NoiseReducerFilter.temporal: 'TEMPORAL',
};

NoiseReducerFilterSettings _$NoiseReducerFilterSettingsFromJson(
    Map<String, dynamic> json) {
  return NoiseReducerFilterSettings(
    strength: json['strength'] as int,
  );
}

Map<String, dynamic> _$NoiseReducerFilterSettingsToJson(
    NoiseReducerFilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('strength', instance.strength);
  return val;
}

NoiseReducerSpatialFilterSettings _$NoiseReducerSpatialFilterSettingsFromJson(
    Map<String, dynamic> json) {
  return NoiseReducerSpatialFilterSettings(
    postFilterSharpenStrength: json['postFilterSharpenStrength'] as int,
    speed: json['speed'] as int,
    strength: json['strength'] as int,
  );
}

Map<String, dynamic> _$NoiseReducerSpatialFilterSettingsToJson(
    NoiseReducerSpatialFilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('postFilterSharpenStrength', instance.postFilterSharpenStrength);
  writeNotNull('speed', instance.speed);
  writeNotNull('strength', instance.strength);
  return val;
}

NoiseReducerTemporalFilterSettings _$NoiseReducerTemporalFilterSettingsFromJson(
    Map<String, dynamic> json) {
  return NoiseReducerTemporalFilterSettings(
    aggressiveMode: json['aggressiveMode'] as int,
    postTemporalSharpening: _$enumDecodeNullable(
        _$NoiseFilterPostTemporalSharpeningEnumMap,
        json['postTemporalSharpening']),
    speed: json['speed'] as int,
    strength: json['strength'] as int,
  );
}

Map<String, dynamic> _$NoiseReducerTemporalFilterSettingsToJson(
    NoiseReducerTemporalFilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aggressiveMode', instance.aggressiveMode);
  writeNotNull(
      'postTemporalSharpening',
      _$NoiseFilterPostTemporalSharpeningEnumMap[
          instance.postTemporalSharpening]);
  writeNotNull('speed', instance.speed);
  writeNotNull('strength', instance.strength);
  return val;
}

const _$NoiseFilterPostTemporalSharpeningEnumMap = {
  NoiseFilterPostTemporalSharpening.disabled: 'DISABLED',
  NoiseFilterPostTemporalSharpening.enabled: 'ENABLED',
  NoiseFilterPostTemporalSharpening.auto: 'AUTO',
};

OpusSettings _$OpusSettingsFromJson(Map<String, dynamic> json) {
  return OpusSettings(
    bitrate: json['bitrate'] as int,
    channels: json['channels'] as int,
    sampleRate: json['sampleRate'] as int,
  );
}

Map<String, dynamic> _$OpusSettingsToJson(OpusSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('channels', instance.channels);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

Output _$OutputFromJson(Map<String, dynamic> json) {
  return Output(
    audioDescriptions: (json['audioDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AudioDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionDescriptions: (json['captionDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    containerSettings: json['containerSettings'] == null
        ? null
        : ContainerSettings.fromJson(
            json['containerSettings'] as Map<String, dynamic>),
    extension: json['extension'] as String,
    nameModifier: json['nameModifier'] as String,
    outputSettings: json['outputSettings'] == null
        ? null
        : OutputSettings.fromJson(
            json['outputSettings'] as Map<String, dynamic>),
    preset: json['preset'] as String,
    videoDescription: json['videoDescription'] == null
        ? null
        : VideoDescription.fromJson(
            json['videoDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioDescriptions',
      instance.audioDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('captionDescriptions',
      instance.captionDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('containerSettings', instance.containerSettings?.toJson());
  writeNotNull('extension', instance.extension);
  writeNotNull('nameModifier', instance.nameModifier);
  writeNotNull('outputSettings', instance.outputSettings?.toJson());
  writeNotNull('preset', instance.preset);
  writeNotNull('videoDescription', instance.videoDescription?.toJson());
  return val;
}

OutputChannelMapping _$OutputChannelMappingFromJson(Map<String, dynamic> json) {
  return OutputChannelMapping(
    inputChannels:
        (json['inputChannels'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$OutputChannelMappingToJson(
    OutputChannelMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputChannels', instance.inputChannels);
  return val;
}

OutputDetail _$OutputDetailFromJson(Map<String, dynamic> json) {
  return OutputDetail(
    durationInMs: json['durationInMs'] as int,
    videoDetails: json['videoDetails'] == null
        ? null
        : VideoDetail.fromJson(json['videoDetails'] as Map<String, dynamic>),
  );
}

OutputGroup _$OutputGroupFromJson(Map<String, dynamic> json) {
  return OutputGroup(
    automatedEncodingSettings: json['automatedEncodingSettings'] == null
        ? null
        : AutomatedEncodingSettings.fromJson(
            json['automatedEncodingSettings'] as Map<String, dynamic>),
    customName: json['customName'] as String,
    name: json['name'] as String,
    outputGroupSettings: json['outputGroupSettings'] == null
        ? null
        : OutputGroupSettings.fromJson(
            json['outputGroupSettings'] as Map<String, dynamic>),
    outputs: (json['outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OutputGroupToJson(OutputGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('automatedEncodingSettings',
      instance.automatedEncodingSettings?.toJson());
  writeNotNull('customName', instance.customName);
  writeNotNull('name', instance.name);
  writeNotNull('outputGroupSettings', instance.outputGroupSettings?.toJson());
  writeNotNull('outputs', instance.outputs?.map((e) => e?.toJson())?.toList());
  return val;
}

OutputGroupDetail _$OutputGroupDetailFromJson(Map<String, dynamic> json) {
  return OutputGroupDetail(
    outputDetails: (json['outputDetails'] as List)
        ?.map((e) =>
            e == null ? null : OutputDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OutputGroupSettings _$OutputGroupSettingsFromJson(Map<String, dynamic> json) {
  return OutputGroupSettings(
    cmafGroupSettings: json['cmafGroupSettings'] == null
        ? null
        : CmafGroupSettings.fromJson(
            json['cmafGroupSettings'] as Map<String, dynamic>),
    dashIsoGroupSettings: json['dashIsoGroupSettings'] == null
        ? null
        : DashIsoGroupSettings.fromJson(
            json['dashIsoGroupSettings'] as Map<String, dynamic>),
    fileGroupSettings: json['fileGroupSettings'] == null
        ? null
        : FileGroupSettings.fromJson(
            json['fileGroupSettings'] as Map<String, dynamic>),
    hlsGroupSettings: json['hlsGroupSettings'] == null
        ? null
        : HlsGroupSettings.fromJson(
            json['hlsGroupSettings'] as Map<String, dynamic>),
    msSmoothGroupSettings: json['msSmoothGroupSettings'] == null
        ? null
        : MsSmoothGroupSettings.fromJson(
            json['msSmoothGroupSettings'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$OutputGroupTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$OutputGroupSettingsToJson(OutputGroupSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cmafGroupSettings', instance.cmafGroupSettings?.toJson());
  writeNotNull('dashIsoGroupSettings', instance.dashIsoGroupSettings?.toJson());
  writeNotNull('fileGroupSettings', instance.fileGroupSettings?.toJson());
  writeNotNull('hlsGroupSettings', instance.hlsGroupSettings?.toJson());
  writeNotNull(
      'msSmoothGroupSettings', instance.msSmoothGroupSettings?.toJson());
  writeNotNull('type', _$OutputGroupTypeEnumMap[instance.type]);
  return val;
}

const _$OutputGroupTypeEnumMap = {
  OutputGroupType.hlsGroupSettings: 'HLS_GROUP_SETTINGS',
  OutputGroupType.dashIsoGroupSettings: 'DASH_ISO_GROUP_SETTINGS',
  OutputGroupType.fileGroupSettings: 'FILE_GROUP_SETTINGS',
  OutputGroupType.msSmoothGroupSettings: 'MS_SMOOTH_GROUP_SETTINGS',
  OutputGroupType.cmafGroupSettings: 'CMAF_GROUP_SETTINGS',
};

OutputSettings _$OutputSettingsFromJson(Map<String, dynamic> json) {
  return OutputSettings(
    hlsSettings: json['hlsSettings'] == null
        ? null
        : HlsSettings.fromJson(json['hlsSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputSettingsToJson(OutputSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hlsSettings', instance.hlsSettings?.toJson());
  return val;
}

PartnerWatermarking _$PartnerWatermarkingFromJson(Map<String, dynamic> json) {
  return PartnerWatermarking(
    nexguardFileMarkerSettings: json['nexguardFileMarkerSettings'] == null
        ? null
        : NexGuardFileMarkerSettings.fromJson(
            json['nexguardFileMarkerSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PartnerWatermarkingToJson(PartnerWatermarking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nexguardFileMarkerSettings',
      instance.nexguardFileMarkerSettings?.toJson());
  return val;
}

Preset _$PresetFromJson(Map<String, dynamic> json) {
  return Preset(
    name: json['name'] as String,
    settings: json['settings'] == null
        ? null
        : PresetSettings.fromJson(json['settings'] as Map<String, dynamic>),
    arn: json['arn'] as String,
    category: json['category'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['type']),
  );
}

PresetSettings _$PresetSettingsFromJson(Map<String, dynamic> json) {
  return PresetSettings(
    audioDescriptions: (json['audioDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AudioDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionDescriptions: (json['captionDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionDescriptionPreset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    containerSettings: json['containerSettings'] == null
        ? null
        : ContainerSettings.fromJson(
            json['containerSettings'] as Map<String, dynamic>),
    videoDescription: json['videoDescription'] == null
        ? null
        : VideoDescription.fromJson(
            json['videoDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PresetSettingsToJson(PresetSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audioDescriptions',
      instance.audioDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('captionDescriptions',
      instance.captionDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('containerSettings', instance.containerSettings?.toJson());
  writeNotNull('videoDescription', instance.videoDescription?.toJson());
  return val;
}

ProresSettings _$ProresSettingsFromJson(Map<String, dynamic> json) {
  return ProresSettings(
    codecProfile:
        _$enumDecodeNullable(_$ProresCodecProfileEnumMap, json['codecProfile']),
    framerateControl: _$enumDecodeNullable(
        _$ProresFramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$ProresFramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    interlaceMode: _$enumDecodeNullable(
        _$ProresInterlaceModeEnumMap, json['interlaceMode']),
    parControl:
        _$enumDecodeNullable(_$ProresParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    slowPal: _$enumDecodeNullable(_$ProresSlowPalEnumMap, json['slowPal']),
    telecine: _$enumDecodeNullable(_$ProresTelecineEnumMap, json['telecine']),
  );
}

Map<String, dynamic> _$ProresSettingsToJson(ProresSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'codecProfile', _$ProresCodecProfileEnumMap[instance.codecProfile]);
  writeNotNull('framerateControl',
      _$ProresFramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$ProresFramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'interlaceMode', _$ProresInterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('parControl', _$ProresParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('slowPal', _$ProresSlowPalEnumMap[instance.slowPal]);
  writeNotNull('telecine', _$ProresTelecineEnumMap[instance.telecine]);
  return val;
}

const _$ProresCodecProfileEnumMap = {
  ProresCodecProfile.appleProres_422: 'APPLE_PRORES_422',
  ProresCodecProfile.appleProres_422Hq: 'APPLE_PRORES_422_HQ',
  ProresCodecProfile.appleProres_422Lt: 'APPLE_PRORES_422_LT',
  ProresCodecProfile.appleProres_422Proxy: 'APPLE_PRORES_422_PROXY',
};

const _$ProresFramerateControlEnumMap = {
  ProresFramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  ProresFramerateControl.specified: 'SPECIFIED',
};

const _$ProresFramerateConversionAlgorithmEnumMap = {
  ProresFramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  ProresFramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  ProresFramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$ProresInterlaceModeEnumMap = {
  ProresInterlaceMode.progressive: 'PROGRESSIVE',
  ProresInterlaceMode.topField: 'TOP_FIELD',
  ProresInterlaceMode.bottomField: 'BOTTOM_FIELD',
  ProresInterlaceMode.followTopField: 'FOLLOW_TOP_FIELD',
  ProresInterlaceMode.followBottomField: 'FOLLOW_BOTTOM_FIELD',
};

const _$ProresParControlEnumMap = {
  ProresParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  ProresParControl.specified: 'SPECIFIED',
};

const _$ProresSlowPalEnumMap = {
  ProresSlowPal.disabled: 'DISABLED',
  ProresSlowPal.enabled: 'ENABLED',
};

const _$ProresTelecineEnumMap = {
  ProresTelecine.none: 'NONE',
  ProresTelecine.hard: 'HARD',
};

Queue _$QueueFromJson(Map<String, dynamic> json) {
  return Queue(
    name: json['name'] as String,
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    pricingPlan:
        _$enumDecodeNullable(_$PricingPlanEnumMap, json['pricingPlan']),
    progressingJobsCount: json['progressingJobsCount'] as int,
    reservationPlan: json['reservationPlan'] == null
        ? null
        : ReservationPlan.fromJson(
            json['reservationPlan'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$QueueStatusEnumMap, json['status']),
    submittedJobsCount: json['submittedJobsCount'] as int,
    type: _$enumDecodeNullable(_$TypeEnumMap, json['type']),
  );
}

const _$PricingPlanEnumMap = {
  PricingPlan.onDemand: 'ON_DEMAND',
  PricingPlan.reserved: 'RESERVED',
};

const _$QueueStatusEnumMap = {
  QueueStatus.active: 'ACTIVE',
  QueueStatus.paused: 'PAUSED',
};

QueueTransition _$QueueTransitionFromJson(Map<String, dynamic> json) {
  return QueueTransition(
    destinationQueue: json['destinationQueue'] as String,
    sourceQueue: json['sourceQueue'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['timestamp']),
  );
}

Rectangle _$RectangleFromJson(Map<String, dynamic> json) {
  return Rectangle(
    height: json['height'] as int,
    width: json['width'] as int,
    x: json['x'] as int,
    y: json['y'] as int,
  );
}

Map<String, dynamic> _$RectangleToJson(Rectangle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull('x', instance.x);
  writeNotNull('y', instance.y);
  return val;
}

RemixSettings _$RemixSettingsFromJson(Map<String, dynamic> json) {
  return RemixSettings(
    channelMapping: json['channelMapping'] == null
        ? null
        : ChannelMapping.fromJson(
            json['channelMapping'] as Map<String, dynamic>),
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

  writeNotNull('channelMapping', instance.channelMapping?.toJson());
  writeNotNull('channelsIn', instance.channelsIn);
  writeNotNull('channelsOut', instance.channelsOut);
  return val;
}

ReservationPlan _$ReservationPlanFromJson(Map<String, dynamic> json) {
  return ReservationPlan(
    commitment: _$enumDecodeNullable(_$CommitmentEnumMap, json['commitment']),
    expiresAt: const UnixDateTimeConverter().fromJson(json['expiresAt']),
    purchasedAt: const UnixDateTimeConverter().fromJson(json['purchasedAt']),
    renewalType:
        _$enumDecodeNullable(_$RenewalTypeEnumMap, json['renewalType']),
    reservedSlots: json['reservedSlots'] as int,
    status:
        _$enumDecodeNullable(_$ReservationPlanStatusEnumMap, json['status']),
  );
}

const _$CommitmentEnumMap = {
  Commitment.oneYear: 'ONE_YEAR',
};

const _$RenewalTypeEnumMap = {
  RenewalType.autoRenew: 'AUTO_RENEW',
  RenewalType.expire: 'EXPIRE',
};

const _$ReservationPlanStatusEnumMap = {
  ReservationPlanStatus.active: 'ACTIVE',
  ReservationPlanStatus.expired: 'EXPIRED',
};

Map<String, dynamic> _$ReservationPlanSettingsToJson(
    ReservationPlanSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('commitment', _$CommitmentEnumMap[instance.commitment]);
  writeNotNull('renewalType', _$RenewalTypeEnumMap[instance.renewalType]);
  writeNotNull('reservedSlots', instance.reservedSlots);
  return val;
}

ResourceTags _$ResourceTagsFromJson(Map<String, dynamic> json) {
  return ResourceTags(
    arn: json['arn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

S3DestinationAccessControl _$S3DestinationAccessControlFromJson(
    Map<String, dynamic> json) {
  return S3DestinationAccessControl(
    cannedAcl:
        _$enumDecodeNullable(_$S3ObjectCannedAclEnumMap, json['cannedAcl']),
  );
}

Map<String, dynamic> _$S3DestinationAccessControlToJson(
    S3DestinationAccessControl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cannedAcl', _$S3ObjectCannedAclEnumMap[instance.cannedAcl]);
  return val;
}

const _$S3ObjectCannedAclEnumMap = {
  S3ObjectCannedAcl.publicRead: 'PUBLIC_READ',
  S3ObjectCannedAcl.authenticatedRead: 'AUTHENTICATED_READ',
  S3ObjectCannedAcl.bucketOwnerRead: 'BUCKET_OWNER_READ',
  S3ObjectCannedAcl.bucketOwnerFullControl: 'BUCKET_OWNER_FULL_CONTROL',
};

S3DestinationSettings _$S3DestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return S3DestinationSettings(
    accessControl: json['accessControl'] == null
        ? null
        : S3DestinationAccessControl.fromJson(
            json['accessControl'] as Map<String, dynamic>),
    encryption: json['encryption'] == null
        ? null
        : S3EncryptionSettings.fromJson(
            json['encryption'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3DestinationSettingsToJson(
    S3DestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessControl', instance.accessControl?.toJson());
  writeNotNull('encryption', instance.encryption?.toJson());
  return val;
}

S3EncryptionSettings _$S3EncryptionSettingsFromJson(Map<String, dynamic> json) {
  return S3EncryptionSettings(
    encryptionType: _$enumDecodeNullable(
        _$S3ServerSideEncryptionTypeEnumMap, json['encryptionType']),
    kmsKeyArn: json['kmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$S3EncryptionSettingsToJson(
    S3EncryptionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('encryptionType',
      _$S3ServerSideEncryptionTypeEnumMap[instance.encryptionType]);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  return val;
}

const _$S3ServerSideEncryptionTypeEnumMap = {
  S3ServerSideEncryptionType.serverSideEncryptionS3:
      'SERVER_SIDE_ENCRYPTION_S3',
  S3ServerSideEncryptionType.serverSideEncryptionKms:
      'SERVER_SIDE_ENCRYPTION_KMS',
};

SccDestinationSettings _$SccDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return SccDestinationSettings(
    framerate: _$enumDecodeNullable(
        _$SccDestinationFramerateEnumMap, json['framerate']),
  );
}

Map<String, dynamic> _$SccDestinationSettingsToJson(
    SccDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'framerate', _$SccDestinationFramerateEnumMap[instance.framerate]);
  return val;
}

const _$SccDestinationFramerateEnumMap = {
  SccDestinationFramerate.framerate_23_97: 'FRAMERATE_23_97',
  SccDestinationFramerate.framerate_24: 'FRAMERATE_24',
  SccDestinationFramerate.framerate_25: 'FRAMERATE_25',
  SccDestinationFramerate.framerate_29_97Dropframe: 'FRAMERATE_29_97_DROPFRAME',
  SccDestinationFramerate.framerate_29_97NonDropframe:
      'FRAMERATE_29_97_NON_DROPFRAME',
};

SpekeKeyProvider _$SpekeKeyProviderFromJson(Map<String, dynamic> json) {
  return SpekeKeyProvider(
    certificateArn: json['certificateArn'] as String,
    resourceId: json['resourceId'] as String,
    systemIds: (json['systemIds'] as List)?.map((e) => e as String)?.toList(),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SpekeKeyProviderToJson(SpekeKeyProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('systemIds', instance.systemIds);
  writeNotNull('url', instance.url);
  return val;
}

SpekeKeyProviderCmaf _$SpekeKeyProviderCmafFromJson(Map<String, dynamic> json) {
  return SpekeKeyProviderCmaf(
    certificateArn: json['certificateArn'] as String,
    dashSignaledSystemIds: (json['dashSignaledSystemIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    hlsSignaledSystemIds: (json['hlsSignaledSystemIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    resourceId: json['resourceId'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SpekeKeyProviderCmafToJson(
    SpekeKeyProviderCmaf instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  writeNotNull('dashSignaledSystemIds', instance.dashSignaledSystemIds);
  writeNotNull('hlsSignaledSystemIds', instance.hlsSignaledSystemIds);
  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('url', instance.url);
  return val;
}

StaticKeyProvider _$StaticKeyProviderFromJson(Map<String, dynamic> json) {
  return StaticKeyProvider(
    keyFormat: json['keyFormat'] as String,
    keyFormatVersions: json['keyFormatVersions'] as String,
    staticKeyValue: json['staticKeyValue'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$StaticKeyProviderToJson(StaticKeyProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyFormat', instance.keyFormat);
  writeNotNull('keyFormatVersions', instance.keyFormatVersions);
  writeNotNull('staticKeyValue', instance.staticKeyValue);
  writeNotNull('url', instance.url);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TeletextDestinationSettings _$TeletextDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return TeletextDestinationSettings(
    pageNumber: json['pageNumber'] as String,
    pageTypes: (json['pageTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TeletextPageTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$TeletextDestinationSettingsToJson(
    TeletextDestinationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pageNumber', instance.pageNumber);
  writeNotNull('pageTypes',
      instance.pageTypes?.map((e) => _$TeletextPageTypeEnumMap[e])?.toList());
  return val;
}

const _$TeletextPageTypeEnumMap = {
  TeletextPageType.pageTypeInitial: 'PAGE_TYPE_INITIAL',
  TeletextPageType.pageTypeSubtitle: 'PAGE_TYPE_SUBTITLE',
  TeletextPageType.pageTypeAddlInfo: 'PAGE_TYPE_ADDL_INFO',
  TeletextPageType.pageTypeProgramSchedule: 'PAGE_TYPE_PROGRAM_SCHEDULE',
  TeletextPageType.pageTypeHearingImpairedSubtitle:
      'PAGE_TYPE_HEARING_IMPAIRED_SUBTITLE',
};

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

TimecodeBurnin _$TimecodeBurninFromJson(Map<String, dynamic> json) {
  return TimecodeBurnin(
    fontSize: json['fontSize'] as int,
    position:
        _$enumDecodeNullable(_$TimecodeBurninPositionEnumMap, json['position']),
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$TimecodeBurninToJson(TimecodeBurnin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fontSize', instance.fontSize);
  writeNotNull('position', _$TimecodeBurninPositionEnumMap[instance.position]);
  writeNotNull('prefix', instance.prefix);
  return val;
}

const _$TimecodeBurninPositionEnumMap = {
  TimecodeBurninPosition.topCenter: 'TOP_CENTER',
  TimecodeBurninPosition.topLeft: 'TOP_LEFT',
  TimecodeBurninPosition.topRight: 'TOP_RIGHT',
  TimecodeBurninPosition.middleLeft: 'MIDDLE_LEFT',
  TimecodeBurninPosition.middleCenter: 'MIDDLE_CENTER',
  TimecodeBurninPosition.middleRight: 'MIDDLE_RIGHT',
  TimecodeBurninPosition.bottomLeft: 'BOTTOM_LEFT',
  TimecodeBurninPosition.bottomCenter: 'BOTTOM_CENTER',
  TimecodeBurninPosition.bottomRight: 'BOTTOM_RIGHT',
};

TimecodeConfig _$TimecodeConfigFromJson(Map<String, dynamic> json) {
  return TimecodeConfig(
    anchor: json['anchor'] as String,
    source: _$enumDecodeNullable(_$TimecodeSourceEnumMap, json['source']),
    start: json['start'] as String,
    timestampOffset: json['timestampOffset'] as String,
  );
}

Map<String, dynamic> _$TimecodeConfigToJson(TimecodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('anchor', instance.anchor);
  writeNotNull('source', _$TimecodeSourceEnumMap[instance.source]);
  writeNotNull('start', instance.start);
  writeNotNull('timestampOffset', instance.timestampOffset);
  return val;
}

const _$TimecodeSourceEnumMap = {
  TimecodeSource.embedded: 'EMBEDDED',
  TimecodeSource.zerobased: 'ZEROBASED',
  TimecodeSource.specifiedstart: 'SPECIFIEDSTART',
};

TimedMetadataInsertion _$TimedMetadataInsertionFromJson(
    Map<String, dynamic> json) {
  return TimedMetadataInsertion(
    id3Insertions: (json['id3Insertions'] as List)
        ?.map((e) =>
            e == null ? null : Id3Insertion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TimedMetadataInsertionToJson(
    TimedMetadataInsertion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id3Insertions',
      instance.id3Insertions?.map((e) => e?.toJson())?.toList());
  return val;
}

Timing _$TimingFromJson(Map<String, dynamic> json) {
  return Timing(
    finishTime: const UnixDateTimeConverter().fromJson(json['finishTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    submitTime: const UnixDateTimeConverter().fromJson(json['submitTime']),
  );
}

TrackSourceSettings _$TrackSourceSettingsFromJson(Map<String, dynamic> json) {
  return TrackSourceSettings(
    trackNumber: json['trackNumber'] as int,
  );
}

Map<String, dynamic> _$TrackSourceSettingsToJson(TrackSourceSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('trackNumber', instance.trackNumber);
  return val;
}

TtmlDestinationSettings _$TtmlDestinationSettingsFromJson(
    Map<String, dynamic> json) {
  return TtmlDestinationSettings(
    stylePassthrough: _$enumDecodeNullable(
        _$TtmlStylePassthroughEnumMap, json['stylePassthrough']),
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

  writeNotNull('stylePassthrough',
      _$TtmlStylePassthroughEnumMap[instance.stylePassthrough]);
  return val;
}

const _$TtmlStylePassthroughEnumMap = {
  TtmlStylePassthrough.enabled: 'ENABLED',
  TtmlStylePassthrough.disabled: 'DISABLED',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateJobTemplateResponse _$UpdateJobTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateJobTemplateResponse(
    jobTemplate: json['jobTemplate'] == null
        ? null
        : JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>),
  );
}

UpdatePresetResponse _$UpdatePresetResponseFromJson(Map<String, dynamic> json) {
  return UpdatePresetResponse(
    preset: json['preset'] == null
        ? null
        : Preset.fromJson(json['preset'] as Map<String, dynamic>),
  );
}

UpdateQueueResponse _$UpdateQueueResponseFromJson(Map<String, dynamic> json) {
  return UpdateQueueResponse(
    queue: json['queue'] == null
        ? null
        : Queue.fromJson(json['queue'] as Map<String, dynamic>),
  );
}

Vc3Settings _$Vc3SettingsFromJson(Map<String, dynamic> json) {
  return Vc3Settings(
    framerateControl: _$enumDecodeNullable(
        _$Vc3FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$Vc3FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    interlaceMode:
        _$enumDecodeNullable(_$Vc3InterlaceModeEnumMap, json['interlaceMode']),
    slowPal: _$enumDecodeNullable(_$Vc3SlowPalEnumMap, json['slowPal']),
    telecine: _$enumDecodeNullable(_$Vc3TelecineEnumMap, json['telecine']),
    vc3Class: _$enumDecodeNullable(_$Vc3ClassEnumMap, json['vc3Class']),
  );
}

Map<String, dynamic> _$Vc3SettingsToJson(Vc3Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('framerateControl',
      _$Vc3FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$Vc3FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull(
      'interlaceMode', _$Vc3InterlaceModeEnumMap[instance.interlaceMode]);
  writeNotNull('slowPal', _$Vc3SlowPalEnumMap[instance.slowPal]);
  writeNotNull('telecine', _$Vc3TelecineEnumMap[instance.telecine]);
  writeNotNull('vc3Class', _$Vc3ClassEnumMap[instance.vc3Class]);
  return val;
}

const _$Vc3FramerateControlEnumMap = {
  Vc3FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Vc3FramerateControl.specified: 'SPECIFIED',
};

const _$Vc3FramerateConversionAlgorithmEnumMap = {
  Vc3FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  Vc3FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  Vc3FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$Vc3InterlaceModeEnumMap = {
  Vc3InterlaceMode.interlaced: 'INTERLACED',
  Vc3InterlaceMode.progressive: 'PROGRESSIVE',
};

const _$Vc3SlowPalEnumMap = {
  Vc3SlowPal.disabled: 'DISABLED',
  Vc3SlowPal.enabled: 'ENABLED',
};

const _$Vc3TelecineEnumMap = {
  Vc3Telecine.none: 'NONE',
  Vc3Telecine.hard: 'HARD',
};

const _$Vc3ClassEnumMap = {
  Vc3Class.class_145_8bit: 'CLASS_145_8BIT',
  Vc3Class.class_220_8bit: 'CLASS_220_8BIT',
  Vc3Class.class_220_10bit: 'CLASS_220_10BIT',
};

VideoCodecSettings _$VideoCodecSettingsFromJson(Map<String, dynamic> json) {
  return VideoCodecSettings(
    av1Settings: json['av1Settings'] == null
        ? null
        : Av1Settings.fromJson(json['av1Settings'] as Map<String, dynamic>),
    avcIntraSettings: json['avcIntraSettings'] == null
        ? null
        : AvcIntraSettings.fromJson(
            json['avcIntraSettings'] as Map<String, dynamic>),
    codec: _$enumDecodeNullable(_$VideoCodecEnumMap, json['codec']),
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
    proresSettings: json['proresSettings'] == null
        ? null
        : ProresSettings.fromJson(
            json['proresSettings'] as Map<String, dynamic>),
    vc3Settings: json['vc3Settings'] == null
        ? null
        : Vc3Settings.fromJson(json['vc3Settings'] as Map<String, dynamic>),
    vp8Settings: json['vp8Settings'] == null
        ? null
        : Vp8Settings.fromJson(json['vp8Settings'] as Map<String, dynamic>),
    vp9Settings: json['vp9Settings'] == null
        ? null
        : Vp9Settings.fromJson(json['vp9Settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoCodecSettingsToJson(VideoCodecSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('av1Settings', instance.av1Settings?.toJson());
  writeNotNull('avcIntraSettings', instance.avcIntraSettings?.toJson());
  writeNotNull('codec', _$VideoCodecEnumMap[instance.codec]);
  writeNotNull('frameCaptureSettings', instance.frameCaptureSettings?.toJson());
  writeNotNull('h264Settings', instance.h264Settings?.toJson());
  writeNotNull('h265Settings', instance.h265Settings?.toJson());
  writeNotNull('mpeg2Settings', instance.mpeg2Settings?.toJson());
  writeNotNull('proresSettings', instance.proresSettings?.toJson());
  writeNotNull('vc3Settings', instance.vc3Settings?.toJson());
  writeNotNull('vp8Settings', instance.vp8Settings?.toJson());
  writeNotNull('vp9Settings', instance.vp9Settings?.toJson());
  return val;
}

const _$VideoCodecEnumMap = {
  VideoCodec.av1: 'AV1',
  VideoCodec.avcIntra: 'AVC_INTRA',
  VideoCodec.frameCapture: 'FRAME_CAPTURE',
  VideoCodec.h_264: 'H_264',
  VideoCodec.h_265: 'H_265',
  VideoCodec.mpeg2: 'MPEG2',
  VideoCodec.prores: 'PRORES',
  VideoCodec.vc3: 'VC3',
  VideoCodec.vp8: 'VP8',
  VideoCodec.vp9: 'VP9',
};

VideoDescription _$VideoDescriptionFromJson(Map<String, dynamic> json) {
  return VideoDescription(
    afdSignaling:
        _$enumDecodeNullable(_$AfdSignalingEnumMap, json['afdSignaling']),
    antiAlias: _$enumDecodeNullable(_$AntiAliasEnumMap, json['antiAlias']),
    codecSettings: json['codecSettings'] == null
        ? null
        : VideoCodecSettings.fromJson(
            json['codecSettings'] as Map<String, dynamic>),
    colorMetadata:
        _$enumDecodeNullable(_$ColorMetadataEnumMap, json['colorMetadata']),
    crop: json['crop'] == null
        ? null
        : Rectangle.fromJson(json['crop'] as Map<String, dynamic>),
    dropFrameTimecode: _$enumDecodeNullable(
        _$DropFrameTimecodeEnumMap, json['dropFrameTimecode']),
    fixedAfd: json['fixedAfd'] as int,
    height: json['height'] as int,
    position: json['position'] == null
        ? null
        : Rectangle.fromJson(json['position'] as Map<String, dynamic>),
    respondToAfd:
        _$enumDecodeNullable(_$RespondToAfdEnumMap, json['respondToAfd']),
    scalingBehavior:
        _$enumDecodeNullable(_$ScalingBehaviorEnumMap, json['scalingBehavior']),
    sharpness: json['sharpness'] as int,
    timecodeInsertion: _$enumDecodeNullable(
        _$VideoTimecodeInsertionEnumMap, json['timecodeInsertion']),
    videoPreprocessors: json['videoPreprocessors'] == null
        ? null
        : VideoPreprocessor.fromJson(
            json['videoPreprocessors'] as Map<String, dynamic>),
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

  writeNotNull('afdSignaling', _$AfdSignalingEnumMap[instance.afdSignaling]);
  writeNotNull('antiAlias', _$AntiAliasEnumMap[instance.antiAlias]);
  writeNotNull('codecSettings', instance.codecSettings?.toJson());
  writeNotNull('colorMetadata', _$ColorMetadataEnumMap[instance.colorMetadata]);
  writeNotNull('crop', instance.crop?.toJson());
  writeNotNull('dropFrameTimecode',
      _$DropFrameTimecodeEnumMap[instance.dropFrameTimecode]);
  writeNotNull('fixedAfd', instance.fixedAfd);
  writeNotNull('height', instance.height);
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('respondToAfd', _$RespondToAfdEnumMap[instance.respondToAfd]);
  writeNotNull(
      'scalingBehavior', _$ScalingBehaviorEnumMap[instance.scalingBehavior]);
  writeNotNull('sharpness', instance.sharpness);
  writeNotNull('timecodeInsertion',
      _$VideoTimecodeInsertionEnumMap[instance.timecodeInsertion]);
  writeNotNull('videoPreprocessors', instance.videoPreprocessors?.toJson());
  writeNotNull('width', instance.width);
  return val;
}

const _$AfdSignalingEnumMap = {
  AfdSignaling.none: 'NONE',
  AfdSignaling.auto: 'AUTO',
  AfdSignaling.fixed: 'FIXED',
};

const _$AntiAliasEnumMap = {
  AntiAlias.disabled: 'DISABLED',
  AntiAlias.enabled: 'ENABLED',
};

const _$ColorMetadataEnumMap = {
  ColorMetadata.ignore: 'IGNORE',
  ColorMetadata.insert: 'INSERT',
};

const _$DropFrameTimecodeEnumMap = {
  DropFrameTimecode.disabled: 'DISABLED',
  DropFrameTimecode.enabled: 'ENABLED',
};

const _$RespondToAfdEnumMap = {
  RespondToAfd.none: 'NONE',
  RespondToAfd.respond: 'RESPOND',
  RespondToAfd.passthrough: 'PASSTHROUGH',
};

const _$ScalingBehaviorEnumMap = {
  ScalingBehavior.$default: 'DEFAULT',
  ScalingBehavior.stretchToOutput: 'STRETCH_TO_OUTPUT',
};

const _$VideoTimecodeInsertionEnumMap = {
  VideoTimecodeInsertion.disabled: 'DISABLED',
  VideoTimecodeInsertion.picTimingSei: 'PIC_TIMING_SEI',
};

VideoDetail _$VideoDetailFromJson(Map<String, dynamic> json) {
  return VideoDetail(
    heightInPx: json['heightInPx'] as int,
    widthInPx: json['widthInPx'] as int,
  );
}

VideoPreprocessor _$VideoPreprocessorFromJson(Map<String, dynamic> json) {
  return VideoPreprocessor(
    colorCorrector: json['colorCorrector'] == null
        ? null
        : ColorCorrector.fromJson(
            json['colorCorrector'] as Map<String, dynamic>),
    deinterlacer: json['deinterlacer'] == null
        ? null
        : Deinterlacer.fromJson(json['deinterlacer'] as Map<String, dynamic>),
    dolbyVision: json['dolbyVision'] == null
        ? null
        : DolbyVision.fromJson(json['dolbyVision'] as Map<String, dynamic>),
    imageInserter: json['imageInserter'] == null
        ? null
        : ImageInserter.fromJson(json['imageInserter'] as Map<String, dynamic>),
    noiseReducer: json['noiseReducer'] == null
        ? null
        : NoiseReducer.fromJson(json['noiseReducer'] as Map<String, dynamic>),
    partnerWatermarking: json['partnerWatermarking'] == null
        ? null
        : PartnerWatermarking.fromJson(
            json['partnerWatermarking'] as Map<String, dynamic>),
    timecodeBurnin: json['timecodeBurnin'] == null
        ? null
        : TimecodeBurnin.fromJson(
            json['timecodeBurnin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoPreprocessorToJson(VideoPreprocessor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('colorCorrector', instance.colorCorrector?.toJson());
  writeNotNull('deinterlacer', instance.deinterlacer?.toJson());
  writeNotNull('dolbyVision', instance.dolbyVision?.toJson());
  writeNotNull('imageInserter', instance.imageInserter?.toJson());
  writeNotNull('noiseReducer', instance.noiseReducer?.toJson());
  writeNotNull('partnerWatermarking', instance.partnerWatermarking?.toJson());
  writeNotNull('timecodeBurnin', instance.timecodeBurnin?.toJson());
  return val;
}

VideoSelector _$VideoSelectorFromJson(Map<String, dynamic> json) {
  return VideoSelector(
    alphaBehavior:
        _$enumDecodeNullable(_$AlphaBehaviorEnumMap, json['alphaBehavior']),
    colorSpace: _$enumDecodeNullable(_$ColorSpaceEnumMap, json['colorSpace']),
    colorSpaceUsage:
        _$enumDecodeNullable(_$ColorSpaceUsageEnumMap, json['colorSpaceUsage']),
    hdr10Metadata: json['hdr10Metadata'] == null
        ? null
        : Hdr10Metadata.fromJson(json['hdr10Metadata'] as Map<String, dynamic>),
    pid: json['pid'] as int,
    programNumber: json['programNumber'] as int,
    rotate: _$enumDecodeNullable(_$InputRotateEnumMap, json['rotate']),
  );
}

Map<String, dynamic> _$VideoSelectorToJson(VideoSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alphaBehavior', _$AlphaBehaviorEnumMap[instance.alphaBehavior]);
  writeNotNull('colorSpace', _$ColorSpaceEnumMap[instance.colorSpace]);
  writeNotNull(
      'colorSpaceUsage', _$ColorSpaceUsageEnumMap[instance.colorSpaceUsage]);
  writeNotNull('hdr10Metadata', instance.hdr10Metadata?.toJson());
  writeNotNull('pid', instance.pid);
  writeNotNull('programNumber', instance.programNumber);
  writeNotNull('rotate', _$InputRotateEnumMap[instance.rotate]);
  return val;
}

const _$AlphaBehaviorEnumMap = {
  AlphaBehavior.discard: 'DISCARD',
  AlphaBehavior.remapToLuma: 'REMAP_TO_LUMA',
};

const _$ColorSpaceEnumMap = {
  ColorSpace.follow: 'FOLLOW',
  ColorSpace.rec_601: 'REC_601',
  ColorSpace.rec_709: 'REC_709',
  ColorSpace.hdr10: 'HDR10',
  ColorSpace.hlg_2020: 'HLG_2020',
};

const _$ColorSpaceUsageEnumMap = {
  ColorSpaceUsage.force: 'FORCE',
  ColorSpaceUsage.fallback: 'FALLBACK',
};

const _$InputRotateEnumMap = {
  InputRotate.degree_0: 'DEGREE_0',
  InputRotate.degrees_90: 'DEGREES_90',
  InputRotate.degrees_180: 'DEGREES_180',
  InputRotate.degrees_270: 'DEGREES_270',
  InputRotate.auto: 'AUTO',
};

VorbisSettings _$VorbisSettingsFromJson(Map<String, dynamic> json) {
  return VorbisSettings(
    channels: json['channels'] as int,
    sampleRate: json['sampleRate'] as int,
    vbrQuality: json['vbrQuality'] as int,
  );
}

Map<String, dynamic> _$VorbisSettingsToJson(VorbisSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channels', instance.channels);
  writeNotNull('sampleRate', instance.sampleRate);
  writeNotNull('vbrQuality', instance.vbrQuality);
  return val;
}

Vp8Settings _$Vp8SettingsFromJson(Map<String, dynamic> json) {
  return Vp8Settings(
    bitrate: json['bitrate'] as int,
    framerateControl: _$enumDecodeNullable(
        _$Vp8FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$Vp8FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    hrdBufferSize: json['hrdBufferSize'] as int,
    maxBitrate: json['maxBitrate'] as int,
    parControl:
        _$enumDecodeNullable(_$Vp8ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    qualityTuningLevel: _$enumDecodeNullable(
        _$Vp8QualityTuningLevelEnumMap, json['qualityTuningLevel']),
    rateControlMode: _$enumDecodeNullable(
        _$Vp8RateControlModeEnumMap, json['rateControlMode']),
  );
}

Map<String, dynamic> _$Vp8SettingsToJson(Vp8Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('framerateControl',
      _$Vp8FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$Vp8FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull('hrdBufferSize', instance.hrdBufferSize);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('parControl', _$Vp8ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('qualityTuningLevel',
      _$Vp8QualityTuningLevelEnumMap[instance.qualityTuningLevel]);
  writeNotNull(
      'rateControlMode', _$Vp8RateControlModeEnumMap[instance.rateControlMode]);
  return val;
}

const _$Vp8FramerateControlEnumMap = {
  Vp8FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Vp8FramerateControl.specified: 'SPECIFIED',
};

const _$Vp8FramerateConversionAlgorithmEnumMap = {
  Vp8FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  Vp8FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  Vp8FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$Vp8ParControlEnumMap = {
  Vp8ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Vp8ParControl.specified: 'SPECIFIED',
};

const _$Vp8QualityTuningLevelEnumMap = {
  Vp8QualityTuningLevel.multiPass: 'MULTI_PASS',
  Vp8QualityTuningLevel.multiPassHq: 'MULTI_PASS_HQ',
};

const _$Vp8RateControlModeEnumMap = {
  Vp8RateControlMode.vbr: 'VBR',
};

Vp9Settings _$Vp9SettingsFromJson(Map<String, dynamic> json) {
  return Vp9Settings(
    bitrate: json['bitrate'] as int,
    framerateControl: _$enumDecodeNullable(
        _$Vp9FramerateControlEnumMap, json['framerateControl']),
    framerateConversionAlgorithm: _$enumDecodeNullable(
        _$Vp9FramerateConversionAlgorithmEnumMap,
        json['framerateConversionAlgorithm']),
    framerateDenominator: json['framerateDenominator'] as int,
    framerateNumerator: json['framerateNumerator'] as int,
    gopSize: (json['gopSize'] as num)?.toDouble(),
    hrdBufferSize: json['hrdBufferSize'] as int,
    maxBitrate: json['maxBitrate'] as int,
    parControl:
        _$enumDecodeNullable(_$Vp9ParControlEnumMap, json['parControl']),
    parDenominator: json['parDenominator'] as int,
    parNumerator: json['parNumerator'] as int,
    qualityTuningLevel: _$enumDecodeNullable(
        _$Vp9QualityTuningLevelEnumMap, json['qualityTuningLevel']),
    rateControlMode: _$enumDecodeNullable(
        _$Vp9RateControlModeEnumMap, json['rateControlMode']),
  );
}

Map<String, dynamic> _$Vp9SettingsToJson(Vp9Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('framerateControl',
      _$Vp9FramerateControlEnumMap[instance.framerateControl]);
  writeNotNull(
      'framerateConversionAlgorithm',
      _$Vp9FramerateConversionAlgorithmEnumMap[
          instance.framerateConversionAlgorithm]);
  writeNotNull('framerateDenominator', instance.framerateDenominator);
  writeNotNull('framerateNumerator', instance.framerateNumerator);
  writeNotNull('gopSize', instance.gopSize);
  writeNotNull('hrdBufferSize', instance.hrdBufferSize);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('parControl', _$Vp9ParControlEnumMap[instance.parControl]);
  writeNotNull('parDenominator', instance.parDenominator);
  writeNotNull('parNumerator', instance.parNumerator);
  writeNotNull('qualityTuningLevel',
      _$Vp9QualityTuningLevelEnumMap[instance.qualityTuningLevel]);
  writeNotNull(
      'rateControlMode', _$Vp9RateControlModeEnumMap[instance.rateControlMode]);
  return val;
}

const _$Vp9FramerateControlEnumMap = {
  Vp9FramerateControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Vp9FramerateControl.specified: 'SPECIFIED',
};

const _$Vp9FramerateConversionAlgorithmEnumMap = {
  Vp9FramerateConversionAlgorithm.duplicateDrop: 'DUPLICATE_DROP',
  Vp9FramerateConversionAlgorithm.interpolate: 'INTERPOLATE',
  Vp9FramerateConversionAlgorithm.frameformer: 'FRAMEFORMER',
};

const _$Vp9ParControlEnumMap = {
  Vp9ParControl.initializeFromSource: 'INITIALIZE_FROM_SOURCE',
  Vp9ParControl.specified: 'SPECIFIED',
};

const _$Vp9QualityTuningLevelEnumMap = {
  Vp9QualityTuningLevel.multiPass: 'MULTI_PASS',
  Vp9QualityTuningLevel.multiPassHq: 'MULTI_PASS_HQ',
};

const _$Vp9RateControlModeEnumMap = {
  Vp9RateControlMode.vbr: 'VBR',
};

WavSettings _$WavSettingsFromJson(Map<String, dynamic> json) {
  return WavSettings(
    bitDepth: json['bitDepth'] as int,
    channels: json['channels'] as int,
    format: _$enumDecodeNullable(_$WavFormatEnumMap, json['format']),
    sampleRate: json['sampleRate'] as int,
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
  writeNotNull('channels', instance.channels);
  writeNotNull('format', _$WavFormatEnumMap[instance.format]);
  writeNotNull('sampleRate', instance.sampleRate);
  return val;
}

const _$WavFormatEnumMap = {
  WavFormat.riff: 'RIFF',
  WavFormat.rf64: 'RF64',
};
