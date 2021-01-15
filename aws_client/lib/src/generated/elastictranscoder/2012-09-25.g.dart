// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-09-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artwork _$ArtworkFromJson(Map<String, dynamic> json) {
  return Artwork(
    albumArtFormat: json['AlbumArtFormat'] as String,
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    inputKey: json['InputKey'] as String,
    maxHeight: json['MaxHeight'] as String,
    maxWidth: json['MaxWidth'] as String,
    paddingPolicy: json['PaddingPolicy'] as String,
    sizingPolicy: json['SizingPolicy'] as String,
  );
}

Map<String, dynamic> _$ArtworkToJson(Artwork instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlbumArtFormat', instance.albumArtFormat);
  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('InputKey', instance.inputKey);
  writeNotNull('MaxHeight', instance.maxHeight);
  writeNotNull('MaxWidth', instance.maxWidth);
  writeNotNull('PaddingPolicy', instance.paddingPolicy);
  writeNotNull('SizingPolicy', instance.sizingPolicy);
  return val;
}

AudioCodecOptions _$AudioCodecOptionsFromJson(Map<String, dynamic> json) {
  return AudioCodecOptions(
    bitDepth: json['BitDepth'] as String,
    bitOrder: json['BitOrder'] as String,
    profile: json['Profile'] as String,
    signed: json['Signed'] as String,
  );
}

Map<String, dynamic> _$AudioCodecOptionsToJson(AudioCodecOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BitDepth', instance.bitDepth);
  writeNotNull('BitOrder', instance.bitOrder);
  writeNotNull('Profile', instance.profile);
  writeNotNull('Signed', instance.signed);
  return val;
}

AudioParameters _$AudioParametersFromJson(Map<String, dynamic> json) {
  return AudioParameters(
    audioPackingMode: json['AudioPackingMode'] as String,
    bitRate: json['BitRate'] as String,
    channels: json['Channels'] as String,
    codec: json['Codec'] as String,
    codecOptions: json['CodecOptions'] == null
        ? null
        : AudioCodecOptions.fromJson(
            json['CodecOptions'] as Map<String, dynamic>),
    sampleRate: json['SampleRate'] as String,
  );
}

Map<String, dynamic> _$AudioParametersToJson(AudioParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AudioPackingMode', instance.audioPackingMode);
  writeNotNull('BitRate', instance.bitRate);
  writeNotNull('Channels', instance.channels);
  writeNotNull('Codec', instance.codec);
  writeNotNull('CodecOptions', instance.codecOptions?.toJson());
  writeNotNull('SampleRate', instance.sampleRate);
  return val;
}

CancelJobResponse _$CancelJobResponseFromJson(Map<String, dynamic> json) {
  return CancelJobResponse();
}

CaptionFormat _$CaptionFormatFromJson(Map<String, dynamic> json) {
  return CaptionFormat(
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    format: json['Format'] as String,
    pattern: json['Pattern'] as String,
  );
}

Map<String, dynamic> _$CaptionFormatToJson(CaptionFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('Format', instance.format);
  writeNotNull('Pattern', instance.pattern);
  return val;
}

CaptionSource _$CaptionSourceFromJson(Map<String, dynamic> json) {
  return CaptionSource(
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    key: json['Key'] as String,
    label: json['Label'] as String,
    language: json['Language'] as String,
    timeOffset: json['TimeOffset'] as String,
  );
}

Map<String, dynamic> _$CaptionSourceToJson(CaptionSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('Key', instance.key);
  writeNotNull('Label', instance.label);
  writeNotNull('Language', instance.language);
  writeNotNull('TimeOffset', instance.timeOffset);
  return val;
}

Captions _$CaptionsFromJson(Map<String, dynamic> json) {
  return Captions(
    captionFormats: (json['CaptionFormats'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionFormat.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    captionSources: (json['CaptionSources'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mergePolicy: json['MergePolicy'] as String,
  );
}

Map<String, dynamic> _$CaptionsToJson(Captions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaptionFormats',
      instance.captionFormats?.map((e) => e?.toJson())?.toList());
  writeNotNull('CaptionSources',
      instance.captionSources?.map((e) => e?.toJson())?.toList());
  writeNotNull('MergePolicy', instance.mergePolicy);
  return val;
}

Clip _$ClipFromJson(Map<String, dynamic> json) {
  return Clip(
    timeSpan: json['TimeSpan'] == null
        ? null
        : TimeSpan.fromJson(json['TimeSpan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClipToJson(Clip instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TimeSpan', instance.timeSpan?.toJson());
  return val;
}

Map<String, dynamic> _$CreateJobOutputToJson(CreateJobOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlbumArt', instance.albumArt?.toJson());
  writeNotNull('Captions', instance.captions?.toJson());
  writeNotNull(
      'Composition', instance.composition?.map((e) => e?.toJson())?.toList());
  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('Key', instance.key);
  writeNotNull('PresetId', instance.presetId);
  writeNotNull('Rotate', instance.rotate);
  writeNotNull('SegmentDuration', instance.segmentDuration);
  writeNotNull('ThumbnailEncryption', instance.thumbnailEncryption?.toJson());
  writeNotNull('ThumbnailPattern', instance.thumbnailPattern);
  writeNotNull(
      'Watermarks', instance.watermarks?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$CreateJobPlaylistToJson(CreateJobPlaylist instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Format', instance.format);
  writeNotNull('HlsContentProtection', instance.hlsContentProtection?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('OutputKeys', instance.outputKeys);
  writeNotNull('PlayReadyDrm', instance.playReadyDrm?.toJson());
  return val;
}

CreateJobResponse _$CreateJobResponseFromJson(Map<String, dynamic> json) {
  return CreateJobResponse(
    job: json['Job'] == null
        ? null
        : Job.fromJson(json['Job'] as Map<String, dynamic>),
  );
}

CreatePipelineResponse _$CreatePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePipelineResponse(
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
    warnings: (json['Warnings'] as List)
        ?.map((e) =>
            e == null ? null : Warning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreatePresetResponse _$CreatePresetResponseFromJson(Map<String, dynamic> json) {
  return CreatePresetResponse(
    preset: json['Preset'] == null
        ? null
        : Preset.fromJson(json['Preset'] as Map<String, dynamic>),
    warning: json['Warning'] as String,
  );
}

DeletePipelineResponse _$DeletePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePipelineResponse();
}

DeletePresetResponse _$DeletePresetResponseFromJson(Map<String, dynamic> json) {
  return DeletePresetResponse();
}

DetectedProperties _$DetectedPropertiesFromJson(Map<String, dynamic> json) {
  return DetectedProperties(
    durationMillis: json['DurationMillis'] as int,
    fileSize: json['FileSize'] as int,
    frameRate: json['FrameRate'] as String,
    height: json['Height'] as int,
    width: json['Width'] as int,
  );
}

Map<String, dynamic> _$DetectedPropertiesToJson(DetectedProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationMillis', instance.durationMillis);
  writeNotNull('FileSize', instance.fileSize);
  writeNotNull('FrameRate', instance.frameRate);
  writeNotNull('Height', instance.height);
  writeNotNull('Width', instance.width);
  return val;
}

Encryption _$EncryptionFromJson(Map<String, dynamic> json) {
  return Encryption(
    initializationVector: json['InitializationVector'] as String,
    key: json['Key'] as String,
    keyMd5: json['KeyMd5'] as String,
    mode: json['Mode'] as String,
  );
}

Map<String, dynamic> _$EncryptionToJson(Encryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InitializationVector', instance.initializationVector);
  writeNotNull('Key', instance.key);
  writeNotNull('KeyMd5', instance.keyMd5);
  writeNotNull('Mode', instance.mode);
  return val;
}

HlsContentProtection _$HlsContentProtectionFromJson(Map<String, dynamic> json) {
  return HlsContentProtection(
    initializationVector: json['InitializationVector'] as String,
    key: json['Key'] as String,
    keyMd5: json['KeyMd5'] as String,
    keyStoragePolicy: json['KeyStoragePolicy'] as String,
    licenseAcquisitionUrl: json['LicenseAcquisitionUrl'] as String,
    method: json['Method'] as String,
  );
}

Map<String, dynamic> _$HlsContentProtectionToJson(
    HlsContentProtection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InitializationVector', instance.initializationVector);
  writeNotNull('Key', instance.key);
  writeNotNull('KeyMd5', instance.keyMd5);
  writeNotNull('KeyStoragePolicy', instance.keyStoragePolicy);
  writeNotNull('LicenseAcquisitionUrl', instance.licenseAcquisitionUrl);
  writeNotNull('Method', instance.method);
  return val;
}

InputCaptions _$InputCaptionsFromJson(Map<String, dynamic> json) {
  return InputCaptions(
    captionSources: (json['CaptionSources'] as List)
        ?.map((e) => e == null
            ? null
            : CaptionSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mergePolicy: json['MergePolicy'] as String,
  );
}

Map<String, dynamic> _$InputCaptionsToJson(InputCaptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaptionSources',
      instance.captionSources?.map((e) => e?.toJson())?.toList());
  writeNotNull('MergePolicy', instance.mergePolicy);
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    input: json['Input'] == null
        ? null
        : JobInput.fromJson(json['Input'] as Map<String, dynamic>),
    inputs: (json['Inputs'] as List)
        ?.map((e) =>
            e == null ? null : JobInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    output: json['Output'] == null
        ? null
        : JobOutput.fromJson(json['Output'] as Map<String, dynamic>),
    outputKeyPrefix: json['OutputKeyPrefix'] as String,
    outputs: (json['Outputs'] as List)
        ?.map((e) =>
            e == null ? null : JobOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelineId: json['PipelineId'] as String,
    playlists: (json['Playlists'] as List)
        ?.map((e) =>
            e == null ? null : Playlist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['Status'] as String,
    timing: json['Timing'] == null
        ? null
        : Timing.fromJson(json['Timing'] as Map<String, dynamic>),
    userMetadata: (json['UserMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

JobAlbumArt _$JobAlbumArtFromJson(Map<String, dynamic> json) {
  return JobAlbumArt(
    artwork: (json['Artwork'] as List)
        ?.map((e) =>
            e == null ? null : Artwork.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mergePolicy: json['MergePolicy'] as String,
  );
}

Map<String, dynamic> _$JobAlbumArtToJson(JobAlbumArt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Artwork', instance.artwork?.map((e) => e?.toJson())?.toList());
  writeNotNull('MergePolicy', instance.mergePolicy);
  return val;
}

JobInput _$JobInputFromJson(Map<String, dynamic> json) {
  return JobInput(
    aspectRatio: json['AspectRatio'] as String,
    container: json['Container'] as String,
    detectedProperties: json['DetectedProperties'] == null
        ? null
        : DetectedProperties.fromJson(
            json['DetectedProperties'] as Map<String, dynamic>),
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    frameRate: json['FrameRate'] as String,
    inputCaptions: json['InputCaptions'] == null
        ? null
        : InputCaptions.fromJson(json['InputCaptions'] as Map<String, dynamic>),
    interlaced: json['Interlaced'] as String,
    key: json['Key'] as String,
    resolution: json['Resolution'] as String,
    timeSpan: json['TimeSpan'] == null
        ? null
        : TimeSpan.fromJson(json['TimeSpan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobInputToJson(JobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AspectRatio', instance.aspectRatio);
  writeNotNull('Container', instance.container);
  writeNotNull('DetectedProperties', instance.detectedProperties?.toJson());
  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('FrameRate', instance.frameRate);
  writeNotNull('InputCaptions', instance.inputCaptions?.toJson());
  writeNotNull('Interlaced', instance.interlaced);
  writeNotNull('Key', instance.key);
  writeNotNull('Resolution', instance.resolution);
  writeNotNull('TimeSpan', instance.timeSpan?.toJson());
  return val;
}

JobOutput _$JobOutputFromJson(Map<String, dynamic> json) {
  return JobOutput(
    albumArt: json['AlbumArt'] == null
        ? null
        : JobAlbumArt.fromJson(json['AlbumArt'] as Map<String, dynamic>),
    appliedColorSpaceConversion: json['AppliedColorSpaceConversion'] as String,
    captions: json['Captions'] == null
        ? null
        : Captions.fromJson(json['Captions'] as Map<String, dynamic>),
    composition: (json['Composition'] as List)
        ?.map(
            (e) => e == null ? null : Clip.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    duration: json['Duration'] as int,
    durationMillis: json['DurationMillis'] as int,
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    fileSize: json['FileSize'] as int,
    frameRate: json['FrameRate'] as String,
    height: json['Height'] as int,
    id: json['Id'] as String,
    key: json['Key'] as String,
    presetId: json['PresetId'] as String,
    rotate: json['Rotate'] as String,
    segmentDuration: json['SegmentDuration'] as String,
    status: json['Status'] as String,
    statusDetail: json['StatusDetail'] as String,
    thumbnailEncryption: json['ThumbnailEncryption'] == null
        ? null
        : Encryption.fromJson(
            json['ThumbnailEncryption'] as Map<String, dynamic>),
    thumbnailPattern: json['ThumbnailPattern'] as String,
    watermarks: (json['Watermarks'] as List)
        ?.map((e) =>
            e == null ? null : JobWatermark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    width: json['Width'] as int,
  );
}

JobWatermark _$JobWatermarkFromJson(Map<String, dynamic> json) {
  return JobWatermark(
    encryption: json['Encryption'] == null
        ? null
        : Encryption.fromJson(json['Encryption'] as Map<String, dynamic>),
    inputKey: json['InputKey'] as String,
    presetWatermarkId: json['PresetWatermarkId'] as String,
  );
}

Map<String, dynamic> _$JobWatermarkToJson(JobWatermark instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Encryption', instance.encryption?.toJson());
  writeNotNull('InputKey', instance.inputKey);
  writeNotNull('PresetWatermarkId', instance.presetWatermarkId);
  return val;
}

ListJobsByPipelineResponse _$ListJobsByPipelineResponseFromJson(
    Map<String, dynamic> json) {
  return ListJobsByPipelineResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

ListJobsByStatusResponse _$ListJobsByStatusResponseFromJson(
    Map<String, dynamic> json) {
  return ListJobsByStatusResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

ListPipelinesResponse _$ListPipelinesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPipelinesResponse(
    nextPageToken: json['NextPageToken'] as String,
    pipelines: (json['Pipelines'] as List)
        ?.map((e) =>
            e == null ? null : Pipeline.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPresetsResponse _$ListPresetsResponseFromJson(Map<String, dynamic> json) {
  return ListPresetsResponse(
    nextPageToken: json['NextPageToken'] as String,
    presets: (json['Presets'] as List)
        ?.map((e) =>
            e == null ? null : Preset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return Notifications(
    completed: json['Completed'] as String,
    error: json['Error'] as String,
    progressing: json['Progressing'] as String,
    warning: json['Warning'] as String,
  );
}

Map<String, dynamic> _$NotificationsToJson(Notifications instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Completed', instance.completed);
  writeNotNull('Error', instance.error);
  writeNotNull('Progressing', instance.progressing);
  writeNotNull('Warning', instance.warning);
  return val;
}

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    access: (json['Access'] as List)?.map((e) => e as String)?.toList(),
    grantee: json['Grantee'] as String,
    granteeType: json['GranteeType'] as String,
  );
}

Map<String, dynamic> _$PermissionToJson(Permission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Access', instance.access);
  writeNotNull('Grantee', instance.grantee);
  writeNotNull('GranteeType', instance.granteeType);
  return val;
}

Pipeline _$PipelineFromJson(Map<String, dynamic> json) {
  return Pipeline(
    arn: json['Arn'] as String,
    awsKmsKeyArn: json['AwsKmsKeyArn'] as String,
    contentConfig: json['ContentConfig'] == null
        ? null
        : PipelineOutputConfig.fromJson(
            json['ContentConfig'] as Map<String, dynamic>),
    id: json['Id'] as String,
    inputBucket: json['InputBucket'] as String,
    name: json['Name'] as String,
    notifications: json['Notifications'] == null
        ? null
        : Notifications.fromJson(json['Notifications'] as Map<String, dynamic>),
    outputBucket: json['OutputBucket'] as String,
    role: json['Role'] as String,
    status: json['Status'] as String,
    thumbnailConfig: json['ThumbnailConfig'] == null
        ? null
        : PipelineOutputConfig.fromJson(
            json['ThumbnailConfig'] as Map<String, dynamic>),
  );
}

PipelineOutputConfig _$PipelineOutputConfigFromJson(Map<String, dynamic> json) {
  return PipelineOutputConfig(
    bucket: json['Bucket'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storageClass: json['StorageClass'] as String,
  );
}

Map<String, dynamic> _$PipelineOutputConfigToJson(
    PipelineOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull(
      'Permissions', instance.permissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('StorageClass', instance.storageClass);
  return val;
}

PlayReadyDrm _$PlayReadyDrmFromJson(Map<String, dynamic> json) {
  return PlayReadyDrm(
    format: json['Format'] as String,
    initializationVector: json['InitializationVector'] as String,
    key: json['Key'] as String,
    keyId: json['KeyId'] as String,
    keyMd5: json['KeyMd5'] as String,
    licenseAcquisitionUrl: json['LicenseAcquisitionUrl'] as String,
  );
}

Map<String, dynamic> _$PlayReadyDrmToJson(PlayReadyDrm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Format', instance.format);
  writeNotNull('InitializationVector', instance.initializationVector);
  writeNotNull('Key', instance.key);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('KeyMd5', instance.keyMd5);
  writeNotNull('LicenseAcquisitionUrl', instance.licenseAcquisitionUrl);
  return val;
}

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
    format: json['Format'] as String,
    hlsContentProtection: json['HlsContentProtection'] == null
        ? null
        : HlsContentProtection.fromJson(
            json['HlsContentProtection'] as Map<String, dynamic>),
    name: json['Name'] as String,
    outputKeys: (json['OutputKeys'] as List)?.map((e) => e as String)?.toList(),
    playReadyDrm: json['PlayReadyDrm'] == null
        ? null
        : PlayReadyDrm.fromJson(json['PlayReadyDrm'] as Map<String, dynamic>),
    status: json['Status'] as String,
    statusDetail: json['StatusDetail'] as String,
  );
}

Preset _$PresetFromJson(Map<String, dynamic> json) {
  return Preset(
    arn: json['Arn'] as String,
    audio: json['Audio'] == null
        ? null
        : AudioParameters.fromJson(json['Audio'] as Map<String, dynamic>),
    container: json['Container'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    thumbnails: json['Thumbnails'] == null
        ? null
        : Thumbnails.fromJson(json['Thumbnails'] as Map<String, dynamic>),
    type: json['Type'] as String,
    video: json['Video'] == null
        ? null
        : VideoParameters.fromJson(json['Video'] as Map<String, dynamic>),
  );
}

PresetWatermark _$PresetWatermarkFromJson(Map<String, dynamic> json) {
  return PresetWatermark(
    horizontalAlign: json['HorizontalAlign'] as String,
    horizontalOffset: json['HorizontalOffset'] as String,
    id: json['Id'] as String,
    maxHeight: json['MaxHeight'] as String,
    maxWidth: json['MaxWidth'] as String,
    opacity: json['Opacity'] as String,
    sizingPolicy: json['SizingPolicy'] as String,
    target: json['Target'] as String,
    verticalAlign: json['VerticalAlign'] as String,
    verticalOffset: json['VerticalOffset'] as String,
  );
}

Map<String, dynamic> _$PresetWatermarkToJson(PresetWatermark instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HorizontalAlign', instance.horizontalAlign);
  writeNotNull('HorizontalOffset', instance.horizontalOffset);
  writeNotNull('Id', instance.id);
  writeNotNull('MaxHeight', instance.maxHeight);
  writeNotNull('MaxWidth', instance.maxWidth);
  writeNotNull('Opacity', instance.opacity);
  writeNotNull('SizingPolicy', instance.sizingPolicy);
  writeNotNull('Target', instance.target);
  writeNotNull('VerticalAlign', instance.verticalAlign);
  writeNotNull('VerticalOffset', instance.verticalOffset);
  return val;
}

ReadJobResponse _$ReadJobResponseFromJson(Map<String, dynamic> json) {
  return ReadJobResponse(
    job: json['Job'] == null
        ? null
        : Job.fromJson(json['Job'] as Map<String, dynamic>),
  );
}

ReadPipelineResponse _$ReadPipelineResponseFromJson(Map<String, dynamic> json) {
  return ReadPipelineResponse(
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
    warnings: (json['Warnings'] as List)
        ?.map((e) =>
            e == null ? null : Warning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ReadPresetResponse _$ReadPresetResponseFromJson(Map<String, dynamic> json) {
  return ReadPresetResponse(
    preset: json['Preset'] == null
        ? null
        : Preset.fromJson(json['Preset'] as Map<String, dynamic>),
  );
}

TestRoleResponse _$TestRoleResponseFromJson(Map<String, dynamic> json) {
  return TestRoleResponse(
    messages: (json['Messages'] as List)?.map((e) => e as String)?.toList(),
    success: json['Success'] as String,
  );
}

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return Thumbnails(
    aspectRatio: json['AspectRatio'] as String,
    format: json['Format'] as String,
    interval: json['Interval'] as String,
    maxHeight: json['MaxHeight'] as String,
    maxWidth: json['MaxWidth'] as String,
    paddingPolicy: json['PaddingPolicy'] as String,
    resolution: json['Resolution'] as String,
    sizingPolicy: json['SizingPolicy'] as String,
  );
}

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AspectRatio', instance.aspectRatio);
  writeNotNull('Format', instance.format);
  writeNotNull('Interval', instance.interval);
  writeNotNull('MaxHeight', instance.maxHeight);
  writeNotNull('MaxWidth', instance.maxWidth);
  writeNotNull('PaddingPolicy', instance.paddingPolicy);
  writeNotNull('Resolution', instance.resolution);
  writeNotNull('SizingPolicy', instance.sizingPolicy);
  return val;
}

TimeSpan _$TimeSpanFromJson(Map<String, dynamic> json) {
  return TimeSpan(
    duration: json['Duration'] as String,
    startTime: json['StartTime'] as String,
  );
}

Map<String, dynamic> _$TimeSpanToJson(TimeSpan instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Duration', instance.duration);
  writeNotNull('StartTime', instance.startTime);
  return val;
}

Timing _$TimingFromJson(Map<String, dynamic> json) {
  return Timing(
    finishTimeMillis: json['FinishTimeMillis'] as int,
    startTimeMillis: json['StartTimeMillis'] as int,
    submitTimeMillis: json['SubmitTimeMillis'] as int,
  );
}

UpdatePipelineNotificationsResponse
    _$UpdatePipelineNotificationsResponseFromJson(Map<String, dynamic> json) {
  return UpdatePipelineNotificationsResponse(
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
  );
}

UpdatePipelineResponse _$UpdatePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePipelineResponse(
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
    warnings: (json['Warnings'] as List)
        ?.map((e) =>
            e == null ? null : Warning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdatePipelineStatusResponse _$UpdatePipelineStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePipelineStatusResponse(
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
  );
}

VideoParameters _$VideoParametersFromJson(Map<String, dynamic> json) {
  return VideoParameters(
    aspectRatio: json['AspectRatio'] as String,
    bitRate: json['BitRate'] as String,
    codec: json['Codec'] as String,
    codecOptions: (json['CodecOptions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    displayAspectRatio: json['DisplayAspectRatio'] as String,
    fixedGOP: json['FixedGOP'] as String,
    frameRate: json['FrameRate'] as String,
    keyframesMaxDist: json['KeyframesMaxDist'] as String,
    maxFrameRate: json['MaxFrameRate'] as String,
    maxHeight: json['MaxHeight'] as String,
    maxWidth: json['MaxWidth'] as String,
    paddingPolicy: json['PaddingPolicy'] as String,
    resolution: json['Resolution'] as String,
    sizingPolicy: json['SizingPolicy'] as String,
    watermarks: (json['Watermarks'] as List)
        ?.map((e) => e == null
            ? null
            : PresetWatermark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VideoParametersToJson(VideoParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AspectRatio', instance.aspectRatio);
  writeNotNull('BitRate', instance.bitRate);
  writeNotNull('Codec', instance.codec);
  writeNotNull('CodecOptions', instance.codecOptions);
  writeNotNull('DisplayAspectRatio', instance.displayAspectRatio);
  writeNotNull('FixedGOP', instance.fixedGOP);
  writeNotNull('FrameRate', instance.frameRate);
  writeNotNull('KeyframesMaxDist', instance.keyframesMaxDist);
  writeNotNull('MaxFrameRate', instance.maxFrameRate);
  writeNotNull('MaxHeight', instance.maxHeight);
  writeNotNull('MaxWidth', instance.maxWidth);
  writeNotNull('PaddingPolicy', instance.paddingPolicy);
  writeNotNull('Resolution', instance.resolution);
  writeNotNull('SizingPolicy', instance.sizingPolicy);
  writeNotNull(
      'Watermarks', instance.watermarks?.map((e) => e?.toJson())?.toList());
  return val;
}

Warning _$WarningFromJson(Map<String, dynamic> json) {
  return Warning(
    code: json['Code'] as String,
    message: json['Message'] as String,
  );
}
