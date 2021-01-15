// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization(
    cdnIdentifierSecret: json['cdnIdentifierSecret'] as String,
    secretsRoleArn: json['secretsRoleArn'] as String,
  );
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cdnIdentifierSecret', instance.cdnIdentifierSecret);
  writeNotNull('secretsRoleArn', instance.secretsRoleArn);
  return val;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CmafEncryption _$CmafEncryptionFromJson(Map<String, dynamic> json) {
  return CmafEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
    keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int,
  );
}

Map<String, dynamic> _$CmafEncryptionToJson(CmafEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  writeNotNull(
      'keyRotationIntervalSeconds', instance.keyRotationIntervalSeconds);
  return val;
}

CmafPackage _$CmafPackageFromJson(Map<String, dynamic> json) {
  return CmafPackage(
    encryption: json['encryption'] == null
        ? null
        : CmafEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    hlsManifests: (json['hlsManifests'] as List)
        ?.map((e) =>
            e == null ? null : HlsManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
    segmentPrefix: json['segmentPrefix'] as String,
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CmafPackageCreateOrUpdateParametersToJson(
    CmafPackageCreateOrUpdateParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull(
      'hlsManifests', instance.hlsManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('segmentPrefix', instance.segmentPrefix);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  return val;
}

ConfigureLogsResponse _$ConfigureLogsResponseFromJson(
    Map<String, dynamic> json) {
  return ConfigureLogsResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateChannelResponse _$CreateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateHarvestJobResponse _$CreateHarvestJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHarvestJobResponse(
    arn: json['arn'] as String,
    channelId: json['channelId'] as String,
    createdAt: json['createdAt'] as String,
    endTime: json['endTime'] as String,
    id: json['id'] as String,
    originEndpointId: json['originEndpointId'] as String,
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
    startTime: json['startTime'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
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

const _$StatusEnumMap = {
  Status.inProgress: 'IN_PROGRESS',
  Status.succeeded: 'SUCCEEDED',
  Status.failed: 'FAILED',
};

CreateOriginEndpointResponse _$CreateOriginEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateOriginEndpointResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    channelId: json['channelId'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    description: json['description'] as String,
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    manifestName: json['manifestName'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    origination:
        _$enumDecodeNullable(_$OriginationEnumMap, json['origination']),
    startoverWindowSeconds: json['startoverWindowSeconds'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeDelaySeconds: json['timeDelaySeconds'] as int,
    url: json['url'] as String,
    whitelist: (json['whitelist'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$OriginationEnumMap = {
  Origination.allow: 'ALLOW',
  Origination.deny: 'DENY',
};

DashEncryption _$DashEncryptionFromJson(Map<String, dynamic> json) {
  return DashEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
    keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int,
  );
}

Map<String, dynamic> _$DashEncryptionToJson(DashEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  writeNotNull(
      'keyRotationIntervalSeconds', instance.keyRotationIntervalSeconds);
  return val;
}

DashPackage _$DashPackageFromJson(Map<String, dynamic> json) {
  return DashPackage(
    adTriggers: (json['adTriggers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AdTriggersElementEnumMap, e))
        ?.toList(),
    adsOnDeliveryRestrictions: _$enumDecodeNullable(
        _$AdsOnDeliveryRestrictionsEnumMap, json['adsOnDeliveryRestrictions']),
    encryption: json['encryption'] == null
        ? null
        : DashEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    manifestLayout:
        _$enumDecodeNullable(_$ManifestLayoutEnumMap, json['manifestLayout']),
    manifestWindowSeconds: json['manifestWindowSeconds'] as int,
    minBufferTimeSeconds: json['minBufferTimeSeconds'] as int,
    minUpdatePeriodSeconds: json['minUpdatePeriodSeconds'] as int,
    periodTriggers: (json['periodTriggers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PeriodTriggersElementEnumMap, e))
        ?.toList(),
    profile: _$enumDecodeNullable(_$ProfileEnumMap, json['profile']),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
    segmentTemplateFormat: _$enumDecodeNullable(
        _$SegmentTemplateFormatEnumMap, json['segmentTemplateFormat']),
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
    suggestedPresentationDelaySeconds:
        json['suggestedPresentationDelaySeconds'] as int,
    utcTiming: _$enumDecodeNullable(_$UtcTimingEnumMap, json['utcTiming']),
    utcTimingUri: json['utcTimingUri'] as String,
  );
}

Map<String, dynamic> _$DashPackageToJson(DashPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adTriggers',
      instance.adTriggers?.map((e) => _$AdTriggersElementEnumMap[e])?.toList());
  writeNotNull('adsOnDeliveryRestrictions',
      _$AdsOnDeliveryRestrictionsEnumMap[instance.adsOnDeliveryRestrictions]);
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull(
      'manifestLayout', _$ManifestLayoutEnumMap[instance.manifestLayout]);
  writeNotNull('manifestWindowSeconds', instance.manifestWindowSeconds);
  writeNotNull('minBufferTimeSeconds', instance.minBufferTimeSeconds);
  writeNotNull('minUpdatePeriodSeconds', instance.minUpdatePeriodSeconds);
  writeNotNull(
      'periodTriggers',
      instance.periodTriggers
          ?.map((e) => _$PeriodTriggersElementEnumMap[e])
          ?.toList());
  writeNotNull('profile', _$ProfileEnumMap[instance.profile]);
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('segmentTemplateFormat',
      _$SegmentTemplateFormatEnumMap[instance.segmentTemplateFormat]);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  writeNotNull('suggestedPresentationDelaySeconds',
      instance.suggestedPresentationDelaySeconds);
  writeNotNull('utcTiming', _$UtcTimingEnumMap[instance.utcTiming]);
  writeNotNull('utcTimingUri', instance.utcTimingUri);
  return val;
}

const _$AdTriggersElementEnumMap = {
  AdTriggersElement.spliceInsert: 'SPLICE_INSERT',
  AdTriggersElement.$break: 'BREAK',
  AdTriggersElement.providerAdvertisement: 'PROVIDER_ADVERTISEMENT',
  AdTriggersElement.distributorAdvertisement: 'DISTRIBUTOR_ADVERTISEMENT',
  AdTriggersElement.providerPlacementOpportunity:
      'PROVIDER_PLACEMENT_OPPORTUNITY',
  AdTriggersElement.distributorPlacementOpportunity:
      'DISTRIBUTOR_PLACEMENT_OPPORTUNITY',
  AdTriggersElement.providerOverlayPlacementOpportunity:
      'PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY',
  AdTriggersElement.distributorOverlayPlacementOpportunity:
      'DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY',
};

const _$AdsOnDeliveryRestrictionsEnumMap = {
  AdsOnDeliveryRestrictions.none: 'NONE',
  AdsOnDeliveryRestrictions.restricted: 'RESTRICTED',
  AdsOnDeliveryRestrictions.unrestricted: 'UNRESTRICTED',
  AdsOnDeliveryRestrictions.both: 'BOTH',
};

const _$ManifestLayoutEnumMap = {
  ManifestLayout.full: 'FULL',
  ManifestLayout.compact: 'COMPACT',
};

const _$PeriodTriggersElementEnumMap = {
  PeriodTriggersElement.ads: 'ADS',
};

const _$ProfileEnumMap = {
  Profile.none: 'NONE',
  Profile.hbbtv_1_5: 'HBBTV_1_5',
};

const _$SegmentTemplateFormatEnumMap = {
  SegmentTemplateFormat.numberWithTimeline: 'NUMBER_WITH_TIMELINE',
  SegmentTemplateFormat.timeWithTimeline: 'TIME_WITH_TIMELINE',
  SegmentTemplateFormat.numberWithDuration: 'NUMBER_WITH_DURATION',
};

const _$UtcTimingEnumMap = {
  UtcTiming.none: 'NONE',
  UtcTiming.httpHead: 'HTTP-HEAD',
  UtcTiming.httpIso: 'HTTP-ISO',
};

DeleteChannelResponse _$DeleteChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteChannelResponse();
}

DeleteOriginEndpointResponse _$DeleteOriginEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteOriginEndpointResponse();
}

DescribeChannelResponse _$DescribeChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeHarvestJobResponse _$DescribeHarvestJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeHarvestJobResponse(
    arn: json['arn'] as String,
    channelId: json['channelId'] as String,
    createdAt: json['createdAt'] as String,
    endTime: json['endTime'] as String,
    id: json['id'] as String,
    originEndpointId: json['originEndpointId'] as String,
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
    startTime: json['startTime'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

DescribeOriginEndpointResponse _$DescribeOriginEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOriginEndpointResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    channelId: json['channelId'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    description: json['description'] as String,
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    manifestName: json['manifestName'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    origination:
        _$enumDecodeNullable(_$OriginationEnumMap, json['origination']),
    startoverWindowSeconds: json['startoverWindowSeconds'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeDelaySeconds: json['timeDelaySeconds'] as int,
    url: json['url'] as String,
    whitelist: (json['whitelist'] as List)?.map((e) => e as String)?.toList(),
  );
}

EgressAccessLogs _$EgressAccessLogsFromJson(Map<String, dynamic> json) {
  return EgressAccessLogs(
    logGroupName: json['logGroupName'] as String,
  );
}

Map<String, dynamic> _$EgressAccessLogsToJson(EgressAccessLogs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

HarvestJob _$HarvestJobFromJson(Map<String, dynamic> json) {
  return HarvestJob(
    arn: json['arn'] as String,
    channelId: json['channelId'] as String,
    createdAt: json['createdAt'] as String,
    endTime: json['endTime'] as String,
    id: json['id'] as String,
    originEndpointId: json['originEndpointId'] as String,
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
    startTime: json['startTime'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

HlsEncryption _$HlsEncryptionFromJson(Map<String, dynamic> json) {
  return HlsEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
    constantInitializationVector:
        json['constantInitializationVector'] as String,
    encryptionMethod: _$enumDecodeNullable(
        _$EncryptionMethodEnumMap, json['encryptionMethod']),
    keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int,
    repeatExtXKey: json['repeatExtXKey'] as bool,
  );
}

Map<String, dynamic> _$HlsEncryptionToJson(HlsEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  writeNotNull(
      'constantInitializationVector', instance.constantInitializationVector);
  writeNotNull(
      'encryptionMethod', _$EncryptionMethodEnumMap[instance.encryptionMethod]);
  writeNotNull(
      'keyRotationIntervalSeconds', instance.keyRotationIntervalSeconds);
  writeNotNull('repeatExtXKey', instance.repeatExtXKey);
  return val;
}

const _$EncryptionMethodEnumMap = {
  EncryptionMethod.aes_128: 'AES_128',
  EncryptionMethod.sampleAes: 'SAMPLE_AES',
};

HlsIngest _$HlsIngestFromJson(Map<String, dynamic> json) {
  return HlsIngest(
    ingestEndpoints: (json['ingestEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : IngestEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

HlsManifest _$HlsManifestFromJson(Map<String, dynamic> json) {
  return HlsManifest(
    id: json['id'] as String,
    adMarkers: _$enumDecodeNullable(_$AdMarkersEnumMap, json['adMarkers']),
    includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool,
    manifestName: json['manifestName'] as String,
    playlistType:
        _$enumDecodeNullable(_$PlaylistTypeEnumMap, json['playlistType']),
    playlistWindowSeconds: json['playlistWindowSeconds'] as int,
    programDateTimeIntervalSeconds:
        json['programDateTimeIntervalSeconds'] as int,
    url: json['url'] as String,
  );
}

const _$AdMarkersEnumMap = {
  AdMarkers.none: 'NONE',
  AdMarkers.scte35Enhanced: 'SCTE35_ENHANCED',
  AdMarkers.passthrough: 'PASSTHROUGH',
  AdMarkers.daterange: 'DATERANGE',
};

const _$PlaylistTypeEnumMap = {
  PlaylistType.none: 'NONE',
  PlaylistType.event: 'EVENT',
  PlaylistType.vod: 'VOD',
};

Map<String, dynamic> _$HlsManifestCreateOrUpdateParametersToJson(
    HlsManifestCreateOrUpdateParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('adMarkers', _$AdMarkersEnumMap[instance.adMarkers]);
  writeNotNull('adTriggers',
      instance.adTriggers?.map((e) => _$AdTriggersElementEnumMap[e])?.toList());
  writeNotNull('adsOnDeliveryRestrictions',
      _$AdsOnDeliveryRestrictionsEnumMap[instance.adsOnDeliveryRestrictions]);
  writeNotNull('includeIframeOnlyStream', instance.includeIframeOnlyStream);
  writeNotNull('manifestName', instance.manifestName);
  writeNotNull('playlistType', _$PlaylistTypeEnumMap[instance.playlistType]);
  writeNotNull('playlistWindowSeconds', instance.playlistWindowSeconds);
  writeNotNull('programDateTimeIntervalSeconds',
      instance.programDateTimeIntervalSeconds);
  return val;
}

HlsPackage _$HlsPackageFromJson(Map<String, dynamic> json) {
  return HlsPackage(
    adMarkers: _$enumDecodeNullable(_$AdMarkersEnumMap, json['adMarkers']),
    adTriggers: (json['adTriggers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AdTriggersElementEnumMap, e))
        ?.toList(),
    adsOnDeliveryRestrictions: _$enumDecodeNullable(
        _$AdsOnDeliveryRestrictionsEnumMap, json['adsOnDeliveryRestrictions']),
    encryption: json['encryption'] == null
        ? null
        : HlsEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool,
    playlistType:
        _$enumDecodeNullable(_$PlaylistTypeEnumMap, json['playlistType']),
    playlistWindowSeconds: json['playlistWindowSeconds'] as int,
    programDateTimeIntervalSeconds:
        json['programDateTimeIntervalSeconds'] as int,
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
    useAudioRenditionGroup: json['useAudioRenditionGroup'] as bool,
  );
}

Map<String, dynamic> _$HlsPackageToJson(HlsPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adMarkers', _$AdMarkersEnumMap[instance.adMarkers]);
  writeNotNull('adTriggers',
      instance.adTriggers?.map((e) => _$AdTriggersElementEnumMap[e])?.toList());
  writeNotNull('adsOnDeliveryRestrictions',
      _$AdsOnDeliveryRestrictionsEnumMap[instance.adsOnDeliveryRestrictions]);
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('includeIframeOnlyStream', instance.includeIframeOnlyStream);
  writeNotNull('playlistType', _$PlaylistTypeEnumMap[instance.playlistType]);
  writeNotNull('playlistWindowSeconds', instance.playlistWindowSeconds);
  writeNotNull('programDateTimeIntervalSeconds',
      instance.programDateTimeIntervalSeconds);
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  writeNotNull('useAudioRenditionGroup', instance.useAudioRenditionGroup);
  return val;
}

IngestEndpoint _$IngestEndpointFromJson(Map<String, dynamic> json) {
  return IngestEndpoint(
    id: json['id'] as String,
    password: json['password'] as String,
    url: json['url'] as String,
    username: json['username'] as String,
  );
}

IngressAccessLogs _$IngressAccessLogsFromJson(Map<String, dynamic> json) {
  return IngressAccessLogs(
    logGroupName: json['logGroupName'] as String,
  );
}

Map<String, dynamic> _$IngressAccessLogsToJson(IngressAccessLogs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  return val;
}

ListChannelsResponse _$ListChannelsResponseFromJson(Map<String, dynamic> json) {
  return ListChannelsResponse(
    channels: (json['channels'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListHarvestJobsResponse _$ListHarvestJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListHarvestJobsResponse(
    harvestJobs: (json['harvestJobs'] as List)
        ?.map((e) =>
            e == null ? null : HarvestJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOriginEndpointsResponse _$ListOriginEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOriginEndpointsResponse(
    nextToken: json['nextToken'] as String,
    originEndpoints: (json['originEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : OriginEndpoint.fromJson(e as Map<String, dynamic>))
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

MssEncryption _$MssEncryptionFromJson(Map<String, dynamic> json) {
  return MssEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MssEncryptionToJson(MssEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spekeKeyProvider', instance.spekeKeyProvider?.toJson());
  return val;
}

MssPackage _$MssPackageFromJson(Map<String, dynamic> json) {
  return MssPackage(
    encryption: json['encryption'] == null
        ? null
        : MssEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    manifestWindowSeconds: json['manifestWindowSeconds'] as int,
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MssPackageToJson(MssPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('manifestWindowSeconds', instance.manifestWindowSeconds);
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  return val;
}

OriginEndpoint _$OriginEndpointFromJson(Map<String, dynamic> json) {
  return OriginEndpoint(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    channelId: json['channelId'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    description: json['description'] as String,
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    manifestName: json['manifestName'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    origination:
        _$enumDecodeNullable(_$OriginationEnumMap, json['origination']),
    startoverWindowSeconds: json['startoverWindowSeconds'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeDelaySeconds: json['timeDelaySeconds'] as int,
    url: json['url'] as String,
    whitelist: (json['whitelist'] as List)?.map((e) => e as String)?.toList(),
  );
}

RotateChannelCredentialsResponse _$RotateChannelCredentialsResponseFromJson(
    Map<String, dynamic> json) {
  return RotateChannelCredentialsResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

RotateIngestEndpointCredentialsResponse
    _$RotateIngestEndpointCredentialsResponseFromJson(
        Map<String, dynamic> json) {
  return RotateIngestEndpointCredentialsResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

S3Destination _$S3DestinationFromJson(Map<String, dynamic> json) {
  return S3Destination(
    bucketName: json['bucketName'] as String,
    manifestKey: json['manifestKey'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$S3DestinationToJson(S3Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('manifestKey', instance.manifestKey);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

SpekeKeyProvider _$SpekeKeyProviderFromJson(Map<String, dynamic> json) {
  return SpekeKeyProvider(
    resourceId: json['resourceId'] as String,
    roleArn: json['roleArn'] as String,
    systemIds: (json['systemIds'] as List)?.map((e) => e as String)?.toList(),
    url: json['url'] as String,
    certificateArn: json['certificateArn'] as String,
  );
}

Map<String, dynamic> _$SpekeKeyProviderToJson(SpekeKeyProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('systemIds', instance.systemIds);
  writeNotNull('url', instance.url);
  writeNotNull('certificateArn', instance.certificateArn);
  return val;
}

StreamSelection _$StreamSelectionFromJson(Map<String, dynamic> json) {
  return StreamSelection(
    maxVideoBitsPerSecond: json['maxVideoBitsPerSecond'] as int,
    minVideoBitsPerSecond: json['minVideoBitsPerSecond'] as int,
    streamOrder:
        _$enumDecodeNullable(_$StreamOrderEnumMap, json['streamOrder']),
  );
}

Map<String, dynamic> _$StreamSelectionToJson(StreamSelection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxVideoBitsPerSecond', instance.maxVideoBitsPerSecond);
  writeNotNull('minVideoBitsPerSecond', instance.minVideoBitsPerSecond);
  writeNotNull('streamOrder', _$StreamOrderEnumMap[instance.streamOrder]);
  return val;
}

const _$StreamOrderEnumMap = {
  StreamOrder.original: 'ORIGINAL',
  StreamOrder.videoBitrateAscending: 'VIDEO_BITRATE_ASCENDING',
  StreamOrder.videoBitrateDescending: 'VIDEO_BITRATE_DESCENDING',
};

UpdateChannelResponse _$UpdateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelResponse(
    arn: json['arn'] as String,
    description: json['description'] as String,
    egressAccessLogs: json['egressAccessLogs'] == null
        ? null
        : EgressAccessLogs.fromJson(
            json['egressAccessLogs'] as Map<String, dynamic>),
    hlsIngest: json['hlsIngest'] == null
        ? null
        : HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>),
    id: json['id'] as String,
    ingressAccessLogs: json['ingressAccessLogs'] == null
        ? null
        : IngressAccessLogs.fromJson(
            json['ingressAccessLogs'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

UpdateOriginEndpointResponse _$UpdateOriginEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateOriginEndpointResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    channelId: json['channelId'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    description: json['description'] as String,
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    manifestName: json['manifestName'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    origination:
        _$enumDecodeNullable(_$OriginationEnumMap, json['origination']),
    startoverWindowSeconds: json['startoverWindowSeconds'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeDelaySeconds: json['timeDelaySeconds'] as int,
    url: json['url'] as String,
    whitelist: (json['whitelist'] as List)?.map((e) => e as String)?.toList(),
  );
}
