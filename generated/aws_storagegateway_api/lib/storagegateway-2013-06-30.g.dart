// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storagegateway-2013-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ActivateGatewayInputToJson(
    ActivateGatewayInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActivationKey', instance.activationKey);
  writeNotNull('GatewayName', instance.gatewayName);
  writeNotNull('GatewayRegion', instance.gatewayRegion);
  writeNotNull('GatewayTimezone', instance.gatewayTimezone);
  writeNotNull('GatewayType', instance.gatewayType);
  writeNotNull('MediumChangerType', instance.mediumChangerType);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('TapeDriveType', instance.tapeDriveType);
  return val;
}

ActivateGatewayOutput _$ActivateGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return ActivateGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$AddCacheInputToJson(AddCacheInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiskIds', instance.diskIds);
  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

AddCacheOutput _$AddCacheOutputFromJson(Map<String, dynamic> json) {
  return AddCacheOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$AddTagsToResourceInputToJson(
    AddTagsToResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

AddTagsToResourceOutput _$AddTagsToResourceOutputFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceOutput(
    resourceARN: json['ResourceARN'] as String,
  );
}

Map<String, dynamic> _$AddUploadBufferInputToJson(
    AddUploadBufferInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiskIds', instance.diskIds);
  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

AddUploadBufferOutput _$AddUploadBufferOutputFromJson(
    Map<String, dynamic> json) {
  return AddUploadBufferOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$AddWorkingStorageInputToJson(
    AddWorkingStorageInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiskIds', instance.diskIds);
  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

AddWorkingStorageOutput _$AddWorkingStorageOutputFromJson(
    Map<String, dynamic> json) {
  return AddWorkingStorageOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$AssignTapePoolInputToJson(AssignTapePoolInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PoolId', instance.poolId);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

AssignTapePoolOutput _$AssignTapePoolOutputFromJson(Map<String, dynamic> json) {
  return AssignTapePoolOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$AttachVolumeInputToJson(AttachVolumeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('VolumeARN', instance.volumeARN);
  writeNotNull('DiskId', instance.diskId);
  writeNotNull('TargetName', instance.targetName);
  return val;
}

AttachVolumeOutput _$AttachVolumeOutputFromJson(Map<String, dynamic> json) {
  return AttachVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

CachediSCSIVolume _$CachediSCSIVolumeFromJson(Map<String, dynamic> json) {
  return CachediSCSIVolume(
    createdDate: unixTimestampFromJson(json['CreatedDate']),
    kMSKey: json['KMSKey'] as String,
    sourceSnapshotId: json['SourceSnapshotId'] as String,
    targetName: json['TargetName'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String,
    volumeId: json['VolumeId'] as String,
    volumeProgress: (json['VolumeProgress'] as num)?.toDouble(),
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
    volumeStatus: json['VolumeStatus'] as String,
    volumeType: json['VolumeType'] as String,
    volumeUsedInBytes: json['VolumeUsedInBytes'] as int,
    volumeiSCSIAttributes: json['VolumeiSCSIAttributes'] == null
        ? null
        : VolumeiSCSIAttributes.fromJson(
            json['VolumeiSCSIAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CancelArchivalInputToJson(CancelArchivalInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

CancelArchivalOutput _$CancelArchivalOutputFromJson(Map<String, dynamic> json) {
  return CancelArchivalOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$CancelRetrievalInputToJson(
    CancelRetrievalInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

CancelRetrievalOutput _$CancelRetrievalOutputFromJson(
    Map<String, dynamic> json) {
  return CancelRetrievalOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

ChapInfo _$ChapInfoFromJson(Map<String, dynamic> json) {
  return ChapInfo(
    initiatorName: json['InitiatorName'] as String,
    secretToAuthenticateInitiator:
        json['SecretToAuthenticateInitiator'] as String,
    secretToAuthenticateTarget: json['SecretToAuthenticateTarget'] as String,
    targetARN: json['TargetARN'] as String,
  );
}

Map<String, dynamic> _$CreateCachediSCSIVolumeInputToJson(
    CreateCachediSCSIVolumeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientToken', instance.clientToken);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('TargetName', instance.targetName);
  writeNotNull('VolumeSizeInBytes', instance.volumeSizeInBytes);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('SnapshotId', instance.snapshotId);
  writeNotNull('SourceVolumeARN', instance.sourceVolumeARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateCachediSCSIVolumeOutput _$CreateCachediSCSIVolumeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateCachediSCSIVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$CreateNFSFileShareInputToJson(
    CreateNFSFileShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientToken', instance.clientToken);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('LocationARN', instance.locationARN);
  writeNotNull('Role', instance.role);
  writeNotNull('ClientList', instance.clientList);
  writeNotNull('DefaultStorageClass', instance.defaultStorageClass);
  writeNotNull('GuessMIMETypeEnabled', instance.guessMIMETypeEnabled);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('NFSFileShareDefaults', instance.nFSFileShareDefaults?.toJson());
  writeNotNull('ObjectACL', _$ObjectACLEnumMap[instance.objectACL]);
  writeNotNull('ReadOnly', instance.readOnly);
  writeNotNull('RequesterPays', instance.requesterPays);
  writeNotNull('Squash', instance.squash);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ObjectACLEnumMap = {
  ObjectACL.private: 'private',
  ObjectACL.publicRead: 'public-read',
  ObjectACL.publicReadWrite: 'public-read-write',
  ObjectACL.authenticatedRead: 'authenticated-read',
  ObjectACL.bucketOwnerRead: 'bucket-owner-read',
  ObjectACL.bucketOwnerFullControl: 'bucket-owner-full-control',
  ObjectACL.awsExecRead: 'aws-exec-read',
};

CreateNFSFileShareOutput _$CreateNFSFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreateNFSFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

Map<String, dynamic> _$CreateSMBFileShareInputToJson(
    CreateSMBFileShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientToken', instance.clientToken);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('LocationARN', instance.locationARN);
  writeNotNull('Role', instance.role);
  writeNotNull('AdminUserList', instance.adminUserList);
  writeNotNull('AuditDestinationARN', instance.auditDestinationARN);
  writeNotNull('Authentication', instance.authentication);
  writeNotNull('DefaultStorageClass', instance.defaultStorageClass);
  writeNotNull('GuessMIMETypeEnabled', instance.guessMIMETypeEnabled);
  writeNotNull('InvalidUserList', instance.invalidUserList);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('ObjectACL', _$ObjectACLEnumMap[instance.objectACL]);
  writeNotNull('ReadOnly', instance.readOnly);
  writeNotNull('RequesterPays', instance.requesterPays);
  writeNotNull('SMBACLEnabled', instance.sMBACLEnabled);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('ValidUserList', instance.validUserList);
  return val;
}

CreateSMBFileShareOutput _$CreateSMBFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreateSMBFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

Map<String, dynamic> _$CreateSnapshotFromVolumeRecoveryPointInputToJson(
    CreateSnapshotFromVolumeRecoveryPointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotDescription', instance.snapshotDescription);
  writeNotNull('VolumeARN', instance.volumeARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateSnapshotFromVolumeRecoveryPointOutput
    _$CreateSnapshotFromVolumeRecoveryPointOutputFromJson(
        Map<String, dynamic> json) {
  return CreateSnapshotFromVolumeRecoveryPointOutput(
    snapshotId: json['SnapshotId'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeRecoveryPointTime: json['VolumeRecoveryPointTime'] as String,
  );
}

Map<String, dynamic> _$CreateSnapshotInputToJson(CreateSnapshotInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotDescription', instance.snapshotDescription);
  writeNotNull('VolumeARN', instance.volumeARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateSnapshotOutput _$CreateSnapshotOutputFromJson(Map<String, dynamic> json) {
  return CreateSnapshotOutput(
    snapshotId: json['SnapshotId'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$CreateStorediSCSIVolumeInputToJson(
    CreateStorediSCSIVolumeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiskId', instance.diskId);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('PreserveExistingData', instance.preserveExistingData);
  writeNotNull('TargetName', instance.targetName);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('SnapshotId', instance.snapshotId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateStorediSCSIVolumeOutput _$CreateStorediSCSIVolumeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateStorediSCSIVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
  );
}

Map<String, dynamic> _$CreateTapeWithBarcodeInputToJson(
    CreateTapeWithBarcodeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeBarcode', instance.tapeBarcode);
  writeNotNull('TapeSizeInBytes', instance.tapeSizeInBytes);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('PoolId', instance.poolId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateTapeWithBarcodeOutput _$CreateTapeWithBarcodeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateTapeWithBarcodeOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$CreateTapesInputToJson(CreateTapesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientToken', instance.clientToken);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('NumTapesToCreate', instance.numTapesToCreate);
  writeNotNull('TapeBarcodePrefix', instance.tapeBarcodePrefix);
  writeNotNull('TapeSizeInBytes', instance.tapeSizeInBytes);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('PoolId', instance.poolId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateTapesOutput _$CreateTapesOutputFromJson(Map<String, dynamic> json) {
  return CreateTapesOutput(
    tapeARNs: (json['TapeARNs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DeleteBandwidthRateLimitInputToJson(
    DeleteBandwidthRateLimitInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BandwidthType', instance.bandwidthType);
  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DeleteBandwidthRateLimitOutput _$DeleteBandwidthRateLimitOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBandwidthRateLimitOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$DeleteChapCredentialsInputToJson(
    DeleteChapCredentialsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InitiatorName', instance.initiatorName);
  writeNotNull('TargetARN', instance.targetARN);
  return val;
}

DeleteChapCredentialsOutput _$DeleteChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteChapCredentialsOutput(
    initiatorName: json['InitiatorName'] as String,
    targetARN: json['TargetARN'] as String,
  );
}

Map<String, dynamic> _$DeleteFileShareInputToJson(
    DeleteFileShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARN', instance.fileShareARN);
  writeNotNull('ForceDelete', instance.forceDelete);
  return val;
}

DeleteFileShareOutput _$DeleteFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

Map<String, dynamic> _$DeleteGatewayInputToJson(DeleteGatewayInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DeleteGatewayOutput _$DeleteGatewayOutputFromJson(Map<String, dynamic> json) {
  return DeleteGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$DeleteSnapshotScheduleInputToJson(
    DeleteSnapshotScheduleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARN', instance.volumeARN);
  return val;
}

DeleteSnapshotScheduleOutput _$DeleteSnapshotScheduleOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSnapshotScheduleOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$DeleteTapeArchiveInputToJson(
    DeleteTapeArchiveInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

DeleteTapeArchiveOutput _$DeleteTapeArchiveOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteTapeArchiveOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$DeleteTapeInputToJson(DeleteTapeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

DeleteTapeOutput _$DeleteTapeOutputFromJson(Map<String, dynamic> json) {
  return DeleteTapeOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$DeleteVolumeInputToJson(DeleteVolumeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARN', instance.volumeARN);
  return val;
}

DeleteVolumeOutput _$DeleteVolumeOutputFromJson(Map<String, dynamic> json) {
  return DeleteVolumeOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$DescribeAvailabilityMonitorTestInputToJson(
    DescribeAvailabilityMonitorTestInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeAvailabilityMonitorTestOutput
    _$DescribeAvailabilityMonitorTestOutputFromJson(Map<String, dynamic> json) {
  return DescribeAvailabilityMonitorTestOutput(
    gatewayARN: json['GatewayARN'] as String,
    startTime: unixTimestampFromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$AvailabilityMonitorTestStatusEnumMap, json['Status']),
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

const _$AvailabilityMonitorTestStatusEnumMap = {
  AvailabilityMonitorTestStatus.complete: 'COMPLETE',
  AvailabilityMonitorTestStatus.failed: 'FAILED',
  AvailabilityMonitorTestStatus.pending: 'PENDING',
};

Map<String, dynamic> _$DescribeBandwidthRateLimitInputToJson(
    DescribeBandwidthRateLimitInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeBandwidthRateLimitOutput _$DescribeBandwidthRateLimitOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeBandwidthRateLimitOutput(
    averageDownloadRateLimitInBitsPerSec:
        json['AverageDownloadRateLimitInBitsPerSec'] as int,
    averageUploadRateLimitInBitsPerSec:
        json['AverageUploadRateLimitInBitsPerSec'] as int,
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$DescribeCacheInputToJson(DescribeCacheInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeCacheOutput _$DescribeCacheOutputFromJson(Map<String, dynamic> json) {
  return DescribeCacheOutput(
    cacheAllocatedInBytes: json['CacheAllocatedInBytes'] as int,
    cacheDirtyPercentage: (json['CacheDirtyPercentage'] as num)?.toDouble(),
    cacheHitPercentage: (json['CacheHitPercentage'] as num)?.toDouble(),
    cacheMissPercentage: (json['CacheMissPercentage'] as num)?.toDouble(),
    cacheUsedPercentage: (json['CacheUsedPercentage'] as num)?.toDouble(),
    diskIds: (json['DiskIds'] as List)?.map((e) => e as String)?.toList(),
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$DescribeCachediSCSIVolumesInputToJson(
    DescribeCachediSCSIVolumesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARNs', instance.volumeARNs);
  return val;
}

DescribeCachediSCSIVolumesOutput _$DescribeCachediSCSIVolumesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeCachediSCSIVolumesOutput(
    cachediSCSIVolumes: (json['CachediSCSIVolumes'] as List)
        ?.map((e) => e == null
            ? null
            : CachediSCSIVolume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeChapCredentialsInputToJson(
    DescribeChapCredentialsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetARN', instance.targetARN);
  return val;
}

DescribeChapCredentialsOutput _$DescribeChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeChapCredentialsOutput(
    chapCredentials: (json['ChapCredentials'] as List)
        ?.map((e) =>
            e == null ? null : ChapInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeGatewayInformationInputToJson(
    DescribeGatewayInformationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeGatewayInformationOutput _$DescribeGatewayInformationOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGatewayInformationOutput(
    cloudWatchLogGroupARN: json['CloudWatchLogGroupARN'] as String,
    ec2InstanceId: json['Ec2InstanceId'] as String,
    ec2InstanceRegion: json['Ec2InstanceRegion'] as String,
    gatewayARN: json['GatewayARN'] as String,
    gatewayId: json['GatewayId'] as String,
    gatewayName: json['GatewayName'] as String,
    gatewayNetworkInterfaces: (json['GatewayNetworkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gatewayState: json['GatewayState'] as String,
    gatewayTimezone: json['GatewayTimezone'] as String,
    gatewayType: json['GatewayType'] as String,
    hostEnvironment:
        _$enumDecodeNullable(_$HostEnvironmentEnumMap, json['HostEnvironment']),
    lastSoftwareUpdate: json['LastSoftwareUpdate'] as String,
    nextUpdateAvailabilityDate: json['NextUpdateAvailabilityDate'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vPCEndpoint: json['VPCEndpoint'] as String,
  );
}

const _$HostEnvironmentEnumMap = {
  HostEnvironment.vmware: 'VMWARE',
  HostEnvironment.hyperV: 'HYPER-V',
  HostEnvironment.ec2: 'EC2',
  HostEnvironment.kvm: 'KVM',
  HostEnvironment.other: 'OTHER',
};

Map<String, dynamic> _$DescribeMaintenanceStartTimeInputToJson(
    DescribeMaintenanceStartTimeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeMaintenanceStartTimeOutput _$DescribeMaintenanceStartTimeOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMaintenanceStartTimeOutput(
    dayOfMonth: json['DayOfMonth'] as int,
    dayOfWeek: json['DayOfWeek'] as int,
    gatewayARN: json['GatewayARN'] as String,
    hourOfDay: json['HourOfDay'] as int,
    minuteOfHour: json['MinuteOfHour'] as int,
    timezone: json['Timezone'] as String,
  );
}

Map<String, dynamic> _$DescribeNFSFileSharesInputToJson(
    DescribeNFSFileSharesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARNList', instance.fileShareARNList);
  return val;
}

DescribeNFSFileSharesOutput _$DescribeNFSFileSharesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeNFSFileSharesOutput(
    nFSFileShareInfoList: (json['NFSFileShareInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : NFSFileShareInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeSMBFileSharesInputToJson(
    DescribeSMBFileSharesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARNList', instance.fileShareARNList);
  return val;
}

DescribeSMBFileSharesOutput _$DescribeSMBFileSharesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSMBFileSharesOutput(
    sMBFileShareInfoList: (json['SMBFileShareInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : SMBFileShareInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeSMBSettingsInputToJson(
    DescribeSMBSettingsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeSMBSettingsOutput _$DescribeSMBSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSMBSettingsOutput(
    activeDirectoryStatus: _$enumDecodeNullable(
        _$ActiveDirectoryStatusEnumMap, json['ActiveDirectoryStatus']),
    domainName: json['DomainName'] as String,
    gatewayARN: json['GatewayARN'] as String,
    sMBGuestPasswordSet: json['SMBGuestPasswordSet'] as bool,
    sMBSecurityStrategy: _$enumDecodeNullable(
        _$SMBSecurityStrategyEnumMap, json['SMBSecurityStrategy']),
  );
}

const _$ActiveDirectoryStatusEnumMap = {
  ActiveDirectoryStatus.accessDenied: 'ACCESS_DENIED',
  ActiveDirectoryStatus.detached: 'DETACHED',
  ActiveDirectoryStatus.joined: 'JOINED',
  ActiveDirectoryStatus.joining: 'JOINING',
  ActiveDirectoryStatus.networkError: 'NETWORK_ERROR',
  ActiveDirectoryStatus.timeout: 'TIMEOUT',
  ActiveDirectoryStatus.unknownError: 'UNKNOWN_ERROR',
};

const _$SMBSecurityStrategyEnumMap = {
  SMBSecurityStrategy.clientSpecified: 'ClientSpecified',
  SMBSecurityStrategy.mandatorySigning: 'MandatorySigning',
  SMBSecurityStrategy.mandatoryEncryption: 'MandatoryEncryption',
};

Map<String, dynamic> _$DescribeSnapshotScheduleInputToJson(
    DescribeSnapshotScheduleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARN', instance.volumeARN);
  return val;
}

DescribeSnapshotScheduleOutput _$DescribeSnapshotScheduleOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSnapshotScheduleOutput(
    description: json['Description'] as String,
    recurrenceInHours: json['RecurrenceInHours'] as int,
    startAt: json['StartAt'] as int,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timezone: json['Timezone'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$DescribeStorediSCSIVolumesInputToJson(
    DescribeStorediSCSIVolumesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARNs', instance.volumeARNs);
  return val;
}

DescribeStorediSCSIVolumesOutput _$DescribeStorediSCSIVolumesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeStorediSCSIVolumesOutput(
    storediSCSIVolumes: (json['StorediSCSIVolumes'] as List)
        ?.map((e) => e == null
            ? null
            : StorediSCSIVolume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTapeArchivesInputToJson(
    DescribeTapeArchivesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  writeNotNull('TapeARNs', instance.tapeARNs);
  return val;
}

DescribeTapeArchivesOutput _$DescribeTapeArchivesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTapeArchivesOutput(
    marker: json['Marker'] as String,
    tapeArchives: (json['TapeArchives'] as List)
        ?.map((e) =>
            e == null ? null : TapeArchive.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTapeRecoveryPointsInputToJson(
    DescribeTapeRecoveryPointsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

DescribeTapeRecoveryPointsOutput _$DescribeTapeRecoveryPointsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTapeRecoveryPointsOutput(
    gatewayARN: json['GatewayARN'] as String,
    marker: json['Marker'] as String,
    tapeRecoveryPointInfos: (json['TapeRecoveryPointInfos'] as List)
        ?.map((e) => e == null
            ? null
            : TapeRecoveryPointInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTapesInputToJson(DescribeTapesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  writeNotNull('TapeARNs', instance.tapeARNs);
  return val;
}

DescribeTapesOutput _$DescribeTapesOutputFromJson(Map<String, dynamic> json) {
  return DescribeTapesOutput(
    marker: json['Marker'] as String,
    tapes: (json['Tapes'] as List)
        ?.map(
            (e) => e == null ? null : Tape.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeUploadBufferInputToJson(
    DescribeUploadBufferInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeUploadBufferOutput _$DescribeUploadBufferOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeUploadBufferOutput(
    diskIds: (json['DiskIds'] as List)?.map((e) => e as String)?.toList(),
    gatewayARN: json['GatewayARN'] as String,
    uploadBufferAllocatedInBytes: json['UploadBufferAllocatedInBytes'] as int,
    uploadBufferUsedInBytes: json['UploadBufferUsedInBytes'] as int,
  );
}

Map<String, dynamic> _$DescribeVTLDevicesInputToJson(
    DescribeVTLDevicesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  writeNotNull('VTLDeviceARNs', instance.vTLDeviceARNs);
  return val;
}

DescribeVTLDevicesOutput _$DescribeVTLDevicesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeVTLDevicesOutput(
    gatewayARN: json['GatewayARN'] as String,
    marker: json['Marker'] as String,
    vTLDevices: (json['VTLDevices'] as List)
        ?.map((e) =>
            e == null ? null : VTLDevice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeWorkingStorageInputToJson(
    DescribeWorkingStorageInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DescribeWorkingStorageOutput _$DescribeWorkingStorageOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkingStorageOutput(
    diskIds: (json['DiskIds'] as List)?.map((e) => e as String)?.toList(),
    gatewayARN: json['GatewayARN'] as String,
    workingStorageAllocatedInBytes:
        json['WorkingStorageAllocatedInBytes'] as int,
    workingStorageUsedInBytes: json['WorkingStorageUsedInBytes'] as int,
  );
}

Map<String, dynamic> _$DetachVolumeInputToJson(DetachVolumeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARN', instance.volumeARN);
  writeNotNull('ForceDetach', instance.forceDetach);
  return val;
}

DetachVolumeOutput _$DetachVolumeOutputFromJson(Map<String, dynamic> json) {
  return DetachVolumeOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

DeviceiSCSIAttributes _$DeviceiSCSIAttributesFromJson(
    Map<String, dynamic> json) {
  return DeviceiSCSIAttributes(
    chapEnabled: json['ChapEnabled'] as bool,
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    networkInterfacePort: json['NetworkInterfacePort'] as int,
    targetARN: json['TargetARN'] as String,
  );
}

Map<String, dynamic> _$DisableGatewayInputToJson(DisableGatewayInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

DisableGatewayOutput _$DisableGatewayOutputFromJson(Map<String, dynamic> json) {
  return DisableGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Disk _$DiskFromJson(Map<String, dynamic> json) {
  return Disk(
    diskAllocationResource: json['DiskAllocationResource'] as String,
    diskAllocationType: json['DiskAllocationType'] as String,
    diskAttributeList:
        (json['DiskAttributeList'] as List)?.map((e) => e as String)?.toList(),
    diskId: json['DiskId'] as String,
    diskNode: json['DiskNode'] as String,
    diskPath: json['DiskPath'] as String,
    diskSizeInBytes: json['DiskSizeInBytes'] as int,
    diskStatus: json['DiskStatus'] as String,
  );
}

FileShareInfo _$FileShareInfoFromJson(Map<String, dynamic> json) {
  return FileShareInfo(
    fileShareARN: json['FileShareARN'] as String,
    fileShareId: json['FileShareId'] as String,
    fileShareStatus: json['FileShareStatus'] as String,
    fileShareType:
        _$enumDecodeNullable(_$FileShareTypeEnumMap, json['FileShareType']),
    gatewayARN: json['GatewayARN'] as String,
  );
}

const _$FileShareTypeEnumMap = {
  FileShareType.nfs: 'NFS',
  FileShareType.smb: 'SMB',
};

GatewayInfo _$GatewayInfoFromJson(Map<String, dynamic> json) {
  return GatewayInfo(
    ec2InstanceId: json['Ec2InstanceId'] as String,
    ec2InstanceRegion: json['Ec2InstanceRegion'] as String,
    gatewayARN: json['GatewayARN'] as String,
    gatewayId: json['GatewayId'] as String,
    gatewayName: json['GatewayName'] as String,
    gatewayOperationalState: json['GatewayOperationalState'] as String,
    gatewayType: json['GatewayType'] as String,
  );
}

Map<String, dynamic> _$JoinDomainInputToJson(JoinDomainInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Password', instance.password);
  writeNotNull('UserName', instance.userName);
  writeNotNull('DomainControllers', instance.domainControllers);
  writeNotNull('OrganizationalUnit', instance.organizationalUnit);
  writeNotNull('TimeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

JoinDomainOutput _$JoinDomainOutputFromJson(Map<String, dynamic> json) {
  return JoinDomainOutput(
    activeDirectoryStatus: _$enumDecodeNullable(
        _$ActiveDirectoryStatusEnumMap, json['ActiveDirectoryStatus']),
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$ListFileSharesInputToJson(ListFileSharesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

ListFileSharesOutput _$ListFileSharesOutputFromJson(Map<String, dynamic> json) {
  return ListFileSharesOutput(
    fileShareInfoList: (json['FileShareInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : FileShareInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
    nextMarker: json['NextMarker'] as String,
  );
}

Map<String, dynamic> _$ListGatewaysInputToJson(ListGatewaysInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

ListGatewaysOutput _$ListGatewaysOutputFromJson(Map<String, dynamic> json) {
  return ListGatewaysOutput(
    gateways: (json['Gateways'] as List)
        ?.map((e) =>
            e == null ? null : GatewayInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

Map<String, dynamic> _$ListLocalDisksInputToJson(ListLocalDisksInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

ListLocalDisksOutput _$ListLocalDisksOutputFromJson(Map<String, dynamic> json) {
  return ListLocalDisksOutput(
    disks: (json['Disks'] as List)
        ?.map(
            (e) => e == null ? null : Disk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceInputToJson(
    ListTagsForResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    marker: json['Marker'] as String,
    resourceARN: json['ResourceARN'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListTapesInputToJson(ListTapesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  writeNotNull('TapeARNs', instance.tapeARNs);
  return val;
}

ListTapesOutput _$ListTapesOutputFromJson(Map<String, dynamic> json) {
  return ListTapesOutput(
    marker: json['Marker'] as String,
    tapeInfos: (json['TapeInfos'] as List)
        ?.map((e) =>
            e == null ? null : TapeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListVolumeInitiatorsInputToJson(
    ListVolumeInitiatorsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeARN', instance.volumeARN);
  return val;
}

ListVolumeInitiatorsOutput _$ListVolumeInitiatorsOutputFromJson(
    Map<String, dynamic> json) {
  return ListVolumeInitiatorsOutput(
    initiators: (json['Initiators'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListVolumeRecoveryPointsInputToJson(
    ListVolumeRecoveryPointsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

ListVolumeRecoveryPointsOutput _$ListVolumeRecoveryPointsOutputFromJson(
    Map<String, dynamic> json) {
  return ListVolumeRecoveryPointsOutput(
    gatewayARN: json['GatewayARN'] as String,
    volumeRecoveryPointInfos: (json['VolumeRecoveryPointInfos'] as List)
        ?.map((e) => e == null
            ? null
            : VolumeRecoveryPointInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListVolumesInputToJson(ListVolumesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

ListVolumesOutput _$ListVolumesOutputFromJson(Map<String, dynamic> json) {
  return ListVolumesOutput(
    gatewayARN: json['GatewayARN'] as String,
    marker: json['Marker'] as String,
    volumeInfos: (json['VolumeInfos'] as List)
        ?.map((e) =>
            e == null ? null : VolumeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NFSFileShareDefaults _$NFSFileShareDefaultsFromJson(Map<String, dynamic> json) {
  return NFSFileShareDefaults(
    directoryMode: json['DirectoryMode'] as String,
    fileMode: json['FileMode'] as String,
    groupId: json['GroupId'] as int,
    ownerId: json['OwnerId'] as int,
  );
}

Map<String, dynamic> _$NFSFileShareDefaultsToJson(
    NFSFileShareDefaults instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryMode', instance.directoryMode);
  writeNotNull('FileMode', instance.fileMode);
  writeNotNull('GroupId', instance.groupId);
  writeNotNull('OwnerId', instance.ownerId);
  return val;
}

NFSFileShareInfo _$NFSFileShareInfoFromJson(Map<String, dynamic> json) {
  return NFSFileShareInfo(
    clientList: (json['ClientList'] as List)?.map((e) => e as String)?.toList(),
    defaultStorageClass: json['DefaultStorageClass'] as String,
    fileShareARN: json['FileShareARN'] as String,
    fileShareId: json['FileShareId'] as String,
    fileShareStatus: json['FileShareStatus'] as String,
    gatewayARN: json['GatewayARN'] as String,
    guessMIMETypeEnabled: json['GuessMIMETypeEnabled'] as bool,
    kMSEncrypted: json['KMSEncrypted'] as bool,
    kMSKey: json['KMSKey'] as String,
    locationARN: json['LocationARN'] as String,
    nFSFileShareDefaults: json['NFSFileShareDefaults'] == null
        ? null
        : NFSFileShareDefaults.fromJson(
            json['NFSFileShareDefaults'] as Map<String, dynamic>),
    objectACL: _$enumDecodeNullable(_$ObjectACLEnumMap, json['ObjectACL']),
    path: json['Path'] as String,
    readOnly: json['ReadOnly'] as bool,
    requesterPays: json['RequesterPays'] as bool,
    role: json['Role'] as String,
    squash: json['Squash'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    ipv4Address: json['Ipv4Address'] as String,
    ipv6Address: json['Ipv6Address'] as String,
    macAddress: json['MacAddress'] as String,
  );
}

Map<String, dynamic> _$NotifyWhenUploadedInputToJson(
    NotifyWhenUploadedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARN', instance.fileShareARN);
  return val;
}

NotifyWhenUploadedOutput _$NotifyWhenUploadedOutputFromJson(
    Map<String, dynamic> json) {
  return NotifyWhenUploadedOutput(
    fileShareARN: json['FileShareARN'] as String,
    notificationId: json['NotificationId'] as String,
  );
}

Map<String, dynamic> _$RefreshCacheInputToJson(RefreshCacheInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARN', instance.fileShareARN);
  writeNotNull('FolderList', instance.folderList);
  writeNotNull('Recursive', instance.recursive);
  return val;
}

RefreshCacheOutput _$RefreshCacheOutputFromJson(Map<String, dynamic> json) {
  return RefreshCacheOutput(
    fileShareARN: json['FileShareARN'] as String,
    notificationId: json['NotificationId'] as String,
  );
}

Map<String, dynamic> _$RemoveTagsFromResourceInputToJson(
    RemoveTagsFromResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

RemoveTagsFromResourceOutput _$RemoveTagsFromResourceOutputFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceOutput(
    resourceARN: json['ResourceARN'] as String,
  );
}

Map<String, dynamic> _$ResetCacheInputToJson(ResetCacheInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

ResetCacheOutput _$ResetCacheOutputFromJson(Map<String, dynamic> json) {
  return ResetCacheOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$RetrieveTapeArchiveInputToJson(
    RetrieveTapeArchiveInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

RetrieveTapeArchiveOutput _$RetrieveTapeArchiveOutputFromJson(
    Map<String, dynamic> json) {
  return RetrieveTapeArchiveOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

Map<String, dynamic> _$RetrieveTapeRecoveryPointInputToJson(
    RetrieveTapeRecoveryPointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('TapeARN', instance.tapeARN);
  return val;
}

RetrieveTapeRecoveryPointOutput _$RetrieveTapeRecoveryPointOutputFromJson(
    Map<String, dynamic> json) {
  return RetrieveTapeRecoveryPointOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

SMBFileShareInfo _$SMBFileShareInfoFromJson(Map<String, dynamic> json) {
  return SMBFileShareInfo(
    adminUserList:
        (json['AdminUserList'] as List)?.map((e) => e as String)?.toList(),
    auditDestinationARN: json['AuditDestinationARN'] as String,
    authentication: json['Authentication'] as String,
    defaultStorageClass: json['DefaultStorageClass'] as String,
    fileShareARN: json['FileShareARN'] as String,
    fileShareId: json['FileShareId'] as String,
    fileShareStatus: json['FileShareStatus'] as String,
    gatewayARN: json['GatewayARN'] as String,
    guessMIMETypeEnabled: json['GuessMIMETypeEnabled'] as bool,
    invalidUserList:
        (json['InvalidUserList'] as List)?.map((e) => e as String)?.toList(),
    kMSEncrypted: json['KMSEncrypted'] as bool,
    kMSKey: json['KMSKey'] as String,
    locationARN: json['LocationARN'] as String,
    objectACL: _$enumDecodeNullable(_$ObjectACLEnumMap, json['ObjectACL']),
    path: json['Path'] as String,
    readOnly: json['ReadOnly'] as bool,
    requesterPays: json['RequesterPays'] as bool,
    role: json['Role'] as String,
    sMBACLEnabled: json['SMBACLEnabled'] as bool,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validUserList:
        (json['ValidUserList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SetLocalConsolePasswordInputToJson(
    SetLocalConsolePasswordInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('LocalConsolePassword', instance.localConsolePassword);
  return val;
}

SetLocalConsolePasswordOutput _$SetLocalConsolePasswordOutputFromJson(
    Map<String, dynamic> json) {
  return SetLocalConsolePasswordOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$SetSMBGuestPasswordInputToJson(
    SetSMBGuestPasswordInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('Password', instance.password);
  return val;
}

SetSMBGuestPasswordOutput _$SetSMBGuestPasswordOutputFromJson(
    Map<String, dynamic> json) {
  return SetSMBGuestPasswordOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$ShutdownGatewayInputToJson(
    ShutdownGatewayInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

ShutdownGatewayOutput _$ShutdownGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return ShutdownGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$StartAvailabilityMonitorTestInputToJson(
    StartAvailabilityMonitorTestInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

StartAvailabilityMonitorTestOutput _$StartAvailabilityMonitorTestOutputFromJson(
    Map<String, dynamic> json) {
  return StartAvailabilityMonitorTestOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$StartGatewayInputToJson(StartGatewayInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

StartGatewayOutput _$StartGatewayOutputFromJson(Map<String, dynamic> json) {
  return StartGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

StorediSCSIVolume _$StorediSCSIVolumeFromJson(Map<String, dynamic> json) {
  return StorediSCSIVolume(
    createdDate: unixTimestampFromJson(json['CreatedDate']),
    kMSKey: json['KMSKey'] as String,
    preservedExistingData: json['PreservedExistingData'] as bool,
    sourceSnapshotId: json['SourceSnapshotId'] as String,
    targetName: json['TargetName'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String,
    volumeDiskId: json['VolumeDiskId'] as String,
    volumeId: json['VolumeId'] as String,
    volumeProgress: (json['VolumeProgress'] as num)?.toDouble(),
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
    volumeStatus: json['VolumeStatus'] as String,
    volumeType: json['VolumeType'] as String,
    volumeUsedInBytes: json['VolumeUsedInBytes'] as int,
    volumeiSCSIAttributes: json['VolumeiSCSIAttributes'] == null
        ? null
        : VolumeiSCSIAttributes.fromJson(
            json['VolumeiSCSIAttributes'] as Map<String, dynamic>),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Tape _$TapeFromJson(Map<String, dynamic> json) {
  return Tape(
    kMSKey: json['KMSKey'] as String,
    poolId: json['PoolId'] as String,
    progress: (json['Progress'] as num)?.toDouble(),
    tapeARN: json['TapeARN'] as String,
    tapeBarcode: json['TapeBarcode'] as String,
    tapeCreatedDate: unixTimestampFromJson(json['TapeCreatedDate']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
    tapeUsedInBytes: json['TapeUsedInBytes'] as int,
    vTLDevice: json['VTLDevice'] as String,
  );
}

TapeArchive _$TapeArchiveFromJson(Map<String, dynamic> json) {
  return TapeArchive(
    completionTime: unixTimestampFromJson(json['CompletionTime']),
    kMSKey: json['KMSKey'] as String,
    poolId: json['PoolId'] as String,
    retrievedTo: json['RetrievedTo'] as String,
    tapeARN: json['TapeARN'] as String,
    tapeBarcode: json['TapeBarcode'] as String,
    tapeCreatedDate: unixTimestampFromJson(json['TapeCreatedDate']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
    tapeUsedInBytes: json['TapeUsedInBytes'] as int,
  );
}

TapeInfo _$TapeInfoFromJson(Map<String, dynamic> json) {
  return TapeInfo(
    gatewayARN: json['GatewayARN'] as String,
    poolId: json['PoolId'] as String,
    tapeARN: json['TapeARN'] as String,
    tapeBarcode: json['TapeBarcode'] as String,
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
  );
}

TapeRecoveryPointInfo _$TapeRecoveryPointInfoFromJson(
    Map<String, dynamic> json) {
  return TapeRecoveryPointInfo(
    tapeARN: json['TapeARN'] as String,
    tapeRecoveryPointTime: unixTimestampFromJson(json['TapeRecoveryPointTime']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
  );
}

Map<String, dynamic> _$UpdateBandwidthRateLimitInputToJson(
    UpdateBandwidthRateLimitInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('AverageDownloadRateLimitInBitsPerSec',
      instance.averageDownloadRateLimitInBitsPerSec);
  writeNotNull('AverageUploadRateLimitInBitsPerSec',
      instance.averageUploadRateLimitInBitsPerSec);
  return val;
}

UpdateBandwidthRateLimitOutput _$UpdateBandwidthRateLimitOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateBandwidthRateLimitOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$UpdateChapCredentialsInputToJson(
    UpdateChapCredentialsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InitiatorName', instance.initiatorName);
  writeNotNull(
      'SecretToAuthenticateInitiator', instance.secretToAuthenticateInitiator);
  writeNotNull('TargetARN', instance.targetARN);
  writeNotNull(
      'SecretToAuthenticateTarget', instance.secretToAuthenticateTarget);
  return val;
}

UpdateChapCredentialsOutput _$UpdateChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateChapCredentialsOutput(
    initiatorName: json['InitiatorName'] as String,
    targetARN: json['TargetARN'] as String,
  );
}

Map<String, dynamic> _$UpdateGatewayInformationInputToJson(
    UpdateGatewayInformationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('CloudWatchLogGroupARN', instance.cloudWatchLogGroupARN);
  writeNotNull('GatewayName', instance.gatewayName);
  writeNotNull('GatewayTimezone', instance.gatewayTimezone);
  return val;
}

UpdateGatewayInformationOutput _$UpdateGatewayInformationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewayInformationOutput(
    gatewayARN: json['GatewayARN'] as String,
    gatewayName: json['GatewayName'] as String,
  );
}

Map<String, dynamic> _$UpdateGatewaySoftwareNowInputToJson(
    UpdateGatewaySoftwareNowInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  return val;
}

UpdateGatewaySoftwareNowOutput _$UpdateGatewaySoftwareNowOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewaySoftwareNowOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$UpdateMaintenanceStartTimeInputToJson(
    UpdateMaintenanceStartTimeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('HourOfDay', instance.hourOfDay);
  writeNotNull('MinuteOfHour', instance.minuteOfHour);
  writeNotNull('DayOfMonth', instance.dayOfMonth);
  writeNotNull('DayOfWeek', instance.dayOfWeek);
  return val;
}

UpdateMaintenanceStartTimeOutput _$UpdateMaintenanceStartTimeOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateMaintenanceStartTimeOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$UpdateNFSFileShareInputToJson(
    UpdateNFSFileShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARN', instance.fileShareARN);
  writeNotNull('ClientList', instance.clientList);
  writeNotNull('DefaultStorageClass', instance.defaultStorageClass);
  writeNotNull('GuessMIMETypeEnabled', instance.guessMIMETypeEnabled);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('NFSFileShareDefaults', instance.nFSFileShareDefaults?.toJson());
  writeNotNull('ObjectACL', _$ObjectACLEnumMap[instance.objectACL]);
  writeNotNull('ReadOnly', instance.readOnly);
  writeNotNull('RequesterPays', instance.requesterPays);
  writeNotNull('Squash', instance.squash);
  return val;
}

UpdateNFSFileShareOutput _$UpdateNFSFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateNFSFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

Map<String, dynamic> _$UpdateSMBFileShareInputToJson(
    UpdateSMBFileShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileShareARN', instance.fileShareARN);
  writeNotNull('AdminUserList', instance.adminUserList);
  writeNotNull('AuditDestinationARN', instance.auditDestinationARN);
  writeNotNull('DefaultStorageClass', instance.defaultStorageClass);
  writeNotNull('GuessMIMETypeEnabled', instance.guessMIMETypeEnabled);
  writeNotNull('InvalidUserList', instance.invalidUserList);
  writeNotNull('KMSEncrypted', instance.kMSEncrypted);
  writeNotNull('KMSKey', instance.kMSKey);
  writeNotNull('ObjectACL', _$ObjectACLEnumMap[instance.objectACL]);
  writeNotNull('ReadOnly', instance.readOnly);
  writeNotNull('RequesterPays', instance.requesterPays);
  writeNotNull('SMBACLEnabled', instance.sMBACLEnabled);
  writeNotNull('ValidUserList', instance.validUserList);
  return val;
}

UpdateSMBFileShareOutput _$UpdateSMBFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSMBFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

Map<String, dynamic> _$UpdateSMBSecurityStrategyInputToJson(
    UpdateSMBSecurityStrategyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayARN', instance.gatewayARN);
  writeNotNull('SMBSecurityStrategy',
      _$SMBSecurityStrategyEnumMap[instance.sMBSecurityStrategy]);
  return val;
}

UpdateSMBSecurityStrategyOutput _$UpdateSMBSecurityStrategyOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSMBSecurityStrategyOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

Map<String, dynamic> _$UpdateSnapshotScheduleInputToJson(
    UpdateSnapshotScheduleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecurrenceInHours', instance.recurrenceInHours);
  writeNotNull('StartAt', instance.startAt);
  writeNotNull('VolumeARN', instance.volumeARN);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateSnapshotScheduleOutput _$UpdateSnapshotScheduleOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSnapshotScheduleOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

Map<String, dynamic> _$UpdateVTLDeviceTypeInputToJson(
    UpdateVTLDeviceTypeInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceType', instance.deviceType);
  writeNotNull('VTLDeviceARN', instance.vTLDeviceARN);
  return val;
}

UpdateVTLDeviceTypeOutput _$UpdateVTLDeviceTypeOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateVTLDeviceTypeOutput(
    vTLDeviceARN: json['VTLDeviceARN'] as String,
  );
}

VTLDevice _$VTLDeviceFromJson(Map<String, dynamic> json) {
  return VTLDevice(
    deviceiSCSIAttributes: json['DeviceiSCSIAttributes'] == null
        ? null
        : DeviceiSCSIAttributes.fromJson(
            json['DeviceiSCSIAttributes'] as Map<String, dynamic>),
    vTLDeviceARN: json['VTLDeviceARN'] as String,
    vTLDeviceProductIdentifier: json['VTLDeviceProductIdentifier'] as String,
    vTLDeviceType: json['VTLDeviceType'] as String,
    vTLDeviceVendor: json['VTLDeviceVendor'] as String,
  );
}

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) {
  return VolumeInfo(
    gatewayARN: json['GatewayARN'] as String,
    gatewayId: json['GatewayId'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeAttachmentStatus: json['VolumeAttachmentStatus'] as String,
    volumeId: json['VolumeId'] as String,
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
    volumeType: json['VolumeType'] as String,
  );
}

VolumeRecoveryPointInfo _$VolumeRecoveryPointInfoFromJson(
    Map<String, dynamic> json) {
  return VolumeRecoveryPointInfo(
    volumeARN: json['VolumeARN'] as String,
    volumeRecoveryPointTime: json['VolumeRecoveryPointTime'] as String,
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
    volumeUsageInBytes: json['VolumeUsageInBytes'] as int,
  );
}

VolumeiSCSIAttributes _$VolumeiSCSIAttributesFromJson(
    Map<String, dynamic> json) {
  return VolumeiSCSIAttributes(
    chapEnabled: json['ChapEnabled'] as bool,
    lunNumber: json['LunNumber'] as int,
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    networkInterfacePort: json['NetworkInterfacePort'] as int,
    targetARN: json['TargetARN'] as String,
  );
}
