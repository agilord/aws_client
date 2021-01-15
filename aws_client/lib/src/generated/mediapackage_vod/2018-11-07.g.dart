// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetShallow _$AssetShallowFromJson(Map<String, dynamic> json) {
  return AssetShallow(
    arn: json['arn'] as String,
    createdAt: json['createdAt'] as String,
    id: json['id'] as String,
    packagingGroupId: json['packagingGroupId'] as String,
    resourceId: json['resourceId'] as String,
    sourceArn: json['sourceArn'] as String,
    sourceRoleArn: json['sourceRoleArn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

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

CmafEncryption _$CmafEncryptionFromJson(Map<String, dynamic> json) {
  return CmafEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
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
  return val;
}

CmafPackage _$CmafPackageFromJson(Map<String, dynamic> json) {
  return CmafPackage(
    hlsManifests: (json['hlsManifests'] as List)
        ?.map((e) =>
            e == null ? null : HlsManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encryption: json['encryption'] == null
        ? null
        : CmafEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
  );
}

Map<String, dynamic> _$CmafPackageToJson(CmafPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'hlsManifests', instance.hlsManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  return val;
}

CreateAssetResponse _$CreateAssetResponseFromJson(Map<String, dynamic> json) {
  return CreateAssetResponse(
    arn: json['arn'] as String,
    createdAt: json['createdAt'] as String,
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : EgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    packagingGroupId: json['packagingGroupId'] as String,
    resourceId: json['resourceId'] as String,
    sourceArn: json['sourceArn'] as String,
    sourceRoleArn: json['sourceRoleArn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreatePackagingConfigurationResponse
    _$CreatePackagingConfigurationResponseFromJson(Map<String, dynamic> json) {
  return CreatePackagingConfigurationResponse(
    arn: json['arn'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    packagingGroupId: json['packagingGroupId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreatePackagingGroupResponse _$CreatePackagingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePackagingGroupResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    domainName: json['domainName'] as String,
    id: json['id'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DashEncryption _$DashEncryptionFromJson(Map<String, dynamic> json) {
  return DashEncryption(
    spekeKeyProvider: json['spekeKeyProvider'] == null
        ? null
        : SpekeKeyProvider.fromJson(
            json['spekeKeyProvider'] as Map<String, dynamic>),
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
  return val;
}

DashManifest _$DashManifestFromJson(Map<String, dynamic> json) {
  return DashManifest(
    manifestLayout:
        _$enumDecodeNullable(_$ManifestLayoutEnumMap, json['manifestLayout']),
    manifestName: json['manifestName'] as String,
    minBufferTimeSeconds: json['minBufferTimeSeconds'] as int,
    profile: _$enumDecodeNullable(_$ProfileEnumMap, json['profile']),
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DashManifestToJson(DashManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'manifestLayout', _$ManifestLayoutEnumMap[instance.manifestLayout]);
  writeNotNull('manifestName', instance.manifestName);
  writeNotNull('minBufferTimeSeconds', instance.minBufferTimeSeconds);
  writeNotNull('profile', _$ProfileEnumMap[instance.profile]);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
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

const _$ManifestLayoutEnumMap = {
  ManifestLayout.full: 'FULL',
  ManifestLayout.compact: 'COMPACT',
};

const _$ProfileEnumMap = {
  Profile.none: 'NONE',
  Profile.hbbtv_1_5: 'HBBTV_1_5',
};

DashPackage _$DashPackageFromJson(Map<String, dynamic> json) {
  return DashPackage(
    dashManifests: (json['dashManifests'] as List)
        ?.map((e) =>
            e == null ? null : DashManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encryption: json['encryption'] == null
        ? null
        : DashEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    periodTriggers: (json['periodTriggers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PeriodTriggersElementEnumMap, e))
        ?.toList(),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
    segmentTemplateFormat: _$enumDecodeNullable(
        _$SegmentTemplateFormatEnumMap, json['segmentTemplateFormat']),
  );
}

Map<String, dynamic> _$DashPackageToJson(DashPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dashManifests',
      instance.dashManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull(
      'periodTriggers',
      instance.periodTriggers
          ?.map((e) => _$PeriodTriggersElementEnumMap[e])
          ?.toList());
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('segmentTemplateFormat',
      _$SegmentTemplateFormatEnumMap[instance.segmentTemplateFormat]);
  return val;
}

const _$PeriodTriggersElementEnumMap = {
  PeriodTriggersElement.ads: 'ADS',
};

const _$SegmentTemplateFormatEnumMap = {
  SegmentTemplateFormat.numberWithTimeline: 'NUMBER_WITH_TIMELINE',
  SegmentTemplateFormat.timeWithTimeline: 'TIME_WITH_TIMELINE',
  SegmentTemplateFormat.numberWithDuration: 'NUMBER_WITH_DURATION',
};

DeleteAssetResponse _$DeleteAssetResponseFromJson(Map<String, dynamic> json) {
  return DeleteAssetResponse();
}

DeletePackagingConfigurationResponse
    _$DeletePackagingConfigurationResponseFromJson(Map<String, dynamic> json) {
  return DeletePackagingConfigurationResponse();
}

DeletePackagingGroupResponse _$DeletePackagingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePackagingGroupResponse();
}

DescribeAssetResponse _$DescribeAssetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssetResponse(
    arn: json['arn'] as String,
    createdAt: json['createdAt'] as String,
    egressEndpoints: (json['egressEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : EgressEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    packagingGroupId: json['packagingGroupId'] as String,
    resourceId: json['resourceId'] as String,
    sourceArn: json['sourceArn'] as String,
    sourceRoleArn: json['sourceRoleArn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribePackagingConfigurationResponse
    _$DescribePackagingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePackagingConfigurationResponse(
    arn: json['arn'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    packagingGroupId: json['packagingGroupId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribePackagingGroupResponse _$DescribePackagingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePackagingGroupResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    domainName: json['domainName'] as String,
    id: json['id'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EgressEndpoint _$EgressEndpointFromJson(Map<String, dynamic> json) {
  return EgressEndpoint(
    packagingConfigurationId: json['packagingConfigurationId'] as String,
    url: json['url'] as String,
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
  return val;
}

const _$EncryptionMethodEnumMap = {
  EncryptionMethod.aes_128: 'AES_128',
  EncryptionMethod.sampleAes: 'SAMPLE_AES',
};

HlsManifest _$HlsManifestFromJson(Map<String, dynamic> json) {
  return HlsManifest(
    adMarkers: _$enumDecodeNullable(_$AdMarkersEnumMap, json['adMarkers']),
    includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool,
    manifestName: json['manifestName'] as String,
    programDateTimeIntervalSeconds:
        json['programDateTimeIntervalSeconds'] as int,
    repeatExtXKey: json['repeatExtXKey'] as bool,
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HlsManifestToJson(HlsManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adMarkers', _$AdMarkersEnumMap[instance.adMarkers]);
  writeNotNull('includeIframeOnlyStream', instance.includeIframeOnlyStream);
  writeNotNull('manifestName', instance.manifestName);
  writeNotNull('programDateTimeIntervalSeconds',
      instance.programDateTimeIntervalSeconds);
  writeNotNull('repeatExtXKey', instance.repeatExtXKey);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  return val;
}

const _$AdMarkersEnumMap = {
  AdMarkers.none: 'NONE',
  AdMarkers.scte35Enhanced: 'SCTE35_ENHANCED',
  AdMarkers.passthrough: 'PASSTHROUGH',
};

HlsPackage _$HlsPackageFromJson(Map<String, dynamic> json) {
  return HlsPackage(
    hlsManifests: (json['hlsManifests'] as List)
        ?.map((e) =>
            e == null ? null : HlsManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encryption: json['encryption'] == null
        ? null
        : HlsEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
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

  writeNotNull(
      'hlsManifests', instance.hlsManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  writeNotNull('useAudioRenditionGroup', instance.useAudioRenditionGroup);
  return val;
}

ListAssetsResponse _$ListAssetsResponseFromJson(Map<String, dynamic> json) {
  return ListAssetsResponse(
    assets: (json['assets'] as List)
        ?.map((e) =>
            e == null ? null : AssetShallow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPackagingConfigurationsResponse
    _$ListPackagingConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return ListPackagingConfigurationsResponse(
    nextToken: json['nextToken'] as String,
    packagingConfigurations: (json['packagingConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : PackagingConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPackagingGroupsResponse _$ListPackagingGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPackagingGroupsResponse(
    nextToken: json['nextToken'] as String,
    packagingGroups: (json['packagingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : PackagingGroup.fromJson(e as Map<String, dynamic>))
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

MssManifest _$MssManifestFromJson(Map<String, dynamic> json) {
  return MssManifest(
    manifestName: json['manifestName'] as String,
    streamSelection: json['streamSelection'] == null
        ? null
        : StreamSelection.fromJson(
            json['streamSelection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MssManifestToJson(MssManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('manifestName', instance.manifestName);
  writeNotNull('streamSelection', instance.streamSelection?.toJson());
  return val;
}

MssPackage _$MssPackageFromJson(Map<String, dynamic> json) {
  return MssPackage(
    mssManifests: (json['mssManifests'] as List)
        ?.map((e) =>
            e == null ? null : MssManifest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encryption: json['encryption'] == null
        ? null
        : MssEncryption.fromJson(json['encryption'] as Map<String, dynamic>),
    segmentDurationSeconds: json['segmentDurationSeconds'] as int,
  );
}

Map<String, dynamic> _$MssPackageToJson(MssPackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'mssManifests', instance.mssManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('segmentDurationSeconds', instance.segmentDurationSeconds);
  return val;
}

PackagingConfiguration _$PackagingConfigurationFromJson(
    Map<String, dynamic> json) {
  return PackagingConfiguration(
    arn: json['arn'] as String,
    cmafPackage: json['cmafPackage'] == null
        ? null
        : CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>),
    dashPackage: json['dashPackage'] == null
        ? null
        : DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>),
    hlsPackage: json['hlsPackage'] == null
        ? null
        : HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>),
    id: json['id'] as String,
    mssPackage: json['mssPackage'] == null
        ? null
        : MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>),
    packagingGroupId: json['packagingGroupId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PackagingGroup _$PackagingGroupFromJson(Map<String, dynamic> json) {
  return PackagingGroup(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    domainName: json['domainName'] as String,
    id: json['id'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

SpekeKeyProvider _$SpekeKeyProviderFromJson(Map<String, dynamic> json) {
  return SpekeKeyProvider(
    roleArn: json['roleArn'] as String,
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

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('systemIds', instance.systemIds);
  writeNotNull('url', instance.url);
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

UpdatePackagingGroupResponse _$UpdatePackagingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePackagingGroupResponse(
    arn: json['arn'] as String,
    authorization: json['authorization'] == null
        ? null
        : Authorization.fromJson(json['authorization'] as Map<String, dynamic>),
    domainName: json['domainName'] as String,
    id: json['id'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}
