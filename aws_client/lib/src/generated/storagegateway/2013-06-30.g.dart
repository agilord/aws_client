// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2013-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivateGatewayOutput _$ActivateGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return ActivateGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

AddCacheOutput _$AddCacheOutputFromJson(Map<String, dynamic> json) {
  return AddCacheOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

AddTagsToResourceOutput _$AddTagsToResourceOutputFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceOutput(
    resourceARN: json['ResourceARN'] as String,
  );
}

AddUploadBufferOutput _$AddUploadBufferOutputFromJson(
    Map<String, dynamic> json) {
  return AddUploadBufferOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

AddWorkingStorageOutput _$AddWorkingStorageOutputFromJson(
    Map<String, dynamic> json) {
  return AddWorkingStorageOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

AssignTapePoolOutput _$AssignTapePoolOutputFromJson(Map<String, dynamic> json) {
  return AssignTapePoolOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

AttachVolumeOutput _$AttachVolumeOutputFromJson(Map<String, dynamic> json) {
  return AttachVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

AutomaticTapeCreationPolicyInfo _$AutomaticTapeCreationPolicyInfoFromJson(
    Map<String, dynamic> json) {
  return AutomaticTapeCreationPolicyInfo(
    automaticTapeCreationRules: (json['AutomaticTapeCreationRules'] as List)
        ?.map((e) => e == null
            ? null
            : AutomaticTapeCreationRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gatewayARN: json['GatewayARN'] as String,
  );
}

AutomaticTapeCreationRule _$AutomaticTapeCreationRuleFromJson(
    Map<String, dynamic> json) {
  return AutomaticTapeCreationRule(
    minimumNumTapes: json['MinimumNumTapes'] as int,
    poolId: json['PoolId'] as String,
    tapeBarcodePrefix: json['TapeBarcodePrefix'] as String,
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    worm: json['Worm'] as bool,
  );
}

Map<String, dynamic> _$AutomaticTapeCreationRuleToJson(
    AutomaticTapeCreationRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MinimumNumTapes', instance.minimumNumTapes);
  writeNotNull('PoolId', instance.poolId);
  writeNotNull('TapeBarcodePrefix', instance.tapeBarcodePrefix);
  writeNotNull('TapeSizeInBytes', instance.tapeSizeInBytes);
  writeNotNull('Worm', instance.worm);
  return val;
}

BandwidthRateLimitInterval _$BandwidthRateLimitIntervalFromJson(
    Map<String, dynamic> json) {
  return BandwidthRateLimitInterval(
    daysOfWeek: (json['DaysOfWeek'] as List)?.map((e) => e as int)?.toList(),
    endHourOfDay: json['EndHourOfDay'] as int,
    endMinuteOfHour: json['EndMinuteOfHour'] as int,
    startHourOfDay: json['StartHourOfDay'] as int,
    startMinuteOfHour: json['StartMinuteOfHour'] as int,
    averageDownloadRateLimitInBitsPerSec:
        json['AverageDownloadRateLimitInBitsPerSec'] as int,
    averageUploadRateLimitInBitsPerSec:
        json['AverageUploadRateLimitInBitsPerSec'] as int,
  );
}

Map<String, dynamic> _$BandwidthRateLimitIntervalToJson(
    BandwidthRateLimitInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DaysOfWeek', instance.daysOfWeek);
  writeNotNull('EndHourOfDay', instance.endHourOfDay);
  writeNotNull('EndMinuteOfHour', instance.endMinuteOfHour);
  writeNotNull('StartHourOfDay', instance.startHourOfDay);
  writeNotNull('StartMinuteOfHour', instance.startMinuteOfHour);
  writeNotNull('AverageDownloadRateLimitInBitsPerSec',
      instance.averageDownloadRateLimitInBitsPerSec);
  writeNotNull('AverageUploadRateLimitInBitsPerSec',
      instance.averageUploadRateLimitInBitsPerSec);
  return val;
}

CacheAttributes _$CacheAttributesFromJson(Map<String, dynamic> json) {
  return CacheAttributes(
    cacheStaleTimeoutInSeconds: json['CacheStaleTimeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$CacheAttributesToJson(CacheAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CacheStaleTimeoutInSeconds', instance.cacheStaleTimeoutInSeconds);
  return val;
}

CachediSCSIVolume _$CachediSCSIVolumeFromJson(Map<String, dynamic> json) {
  return CachediSCSIVolume(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
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

CancelArchivalOutput _$CancelArchivalOutputFromJson(Map<String, dynamic> json) {
  return CancelArchivalOutput(
    tapeARN: json['TapeARN'] as String,
  );
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

CreateCachediSCSIVolumeOutput _$CreateCachediSCSIVolumeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateCachediSCSIVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

CreateNFSFileShareOutput _$CreateNFSFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreateNFSFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

CreateSMBFileShareOutput _$CreateSMBFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreateSMBFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
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

CreateSnapshotOutput _$CreateSnapshotOutputFromJson(Map<String, dynamic> json) {
  return CreateSnapshotOutput(
    snapshotId: json['SnapshotId'] as String,
    volumeARN: json['VolumeARN'] as String,
  );
}

CreateStorediSCSIVolumeOutput _$CreateStorediSCSIVolumeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateStorediSCSIVolumeOutput(
    targetARN: json['TargetARN'] as String,
    volumeARN: json['VolumeARN'] as String,
    volumeSizeInBytes: json['VolumeSizeInBytes'] as int,
  );
}

CreateTapePoolOutput _$CreateTapePoolOutputFromJson(Map<String, dynamic> json) {
  return CreateTapePoolOutput(
    poolARN: json['PoolARN'] as String,
  );
}

CreateTapeWithBarcodeOutput _$CreateTapeWithBarcodeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateTapeWithBarcodeOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

CreateTapesOutput _$CreateTapesOutputFromJson(Map<String, dynamic> json) {
  return CreateTapesOutput(
    tapeARNs: (json['TapeARNs'] as List)?.map((e) => e as String)?.toList(),
  );
}

DeleteAutomaticTapeCreationPolicyOutput
    _$DeleteAutomaticTapeCreationPolicyOutputFromJson(
        Map<String, dynamic> json) {
  return DeleteAutomaticTapeCreationPolicyOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

DeleteBandwidthRateLimitOutput _$DeleteBandwidthRateLimitOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBandwidthRateLimitOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

DeleteChapCredentialsOutput _$DeleteChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteChapCredentialsOutput(
    initiatorName: json['InitiatorName'] as String,
    targetARN: json['TargetARN'] as String,
  );
}

DeleteFileShareOutput _$DeleteFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

DeleteGatewayOutput _$DeleteGatewayOutputFromJson(Map<String, dynamic> json) {
  return DeleteGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

DeleteSnapshotScheduleOutput _$DeleteSnapshotScheduleOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSnapshotScheduleOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

DeleteTapeArchiveOutput _$DeleteTapeArchiveOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteTapeArchiveOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

DeleteTapeOutput _$DeleteTapeOutputFromJson(Map<String, dynamic> json) {
  return DeleteTapeOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

DeleteTapePoolOutput _$DeleteTapePoolOutputFromJson(Map<String, dynamic> json) {
  return DeleteTapePoolOutput(
    poolARN: json['PoolARN'] as String,
  );
}

DeleteVolumeOutput _$DeleteVolumeOutputFromJson(Map<String, dynamic> json) {
  return DeleteVolumeOutput(
    volumeARN: json['VolumeARN'] as String,
  );
}

DescribeAvailabilityMonitorTestOutput
    _$DescribeAvailabilityMonitorTestOutputFromJson(Map<String, dynamic> json) {
  return DescribeAvailabilityMonitorTestOutput(
    gatewayARN: json['GatewayARN'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
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

DescribeBandwidthRateLimitScheduleOutput
    _$DescribeBandwidthRateLimitScheduleOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeBandwidthRateLimitScheduleOutput(
    bandwidthRateLimitIntervals: (json['BandwidthRateLimitIntervals'] as List)
        ?.map((e) => e == null
            ? null
            : BandwidthRateLimitInterval.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gatewayARN: json['GatewayARN'] as String,
  );
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

DescribeChapCredentialsOutput _$DescribeChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeChapCredentialsOutput(
    chapCredentials: (json['ChapCredentials'] as List)
        ?.map((e) =>
            e == null ? null : ChapInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeGatewayInformationOutput _$DescribeGatewayInformationOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGatewayInformationOutput(
    cloudWatchLogGroupARN: json['CloudWatchLogGroupARN'] as String,
    deprecationDate: json['DeprecationDate'] as String,
    ec2InstanceId: json['Ec2InstanceId'] as String,
    ec2InstanceRegion: json['Ec2InstanceRegion'] as String,
    endpointType: json['EndpointType'] as String,
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
    softwareUpdatesEndDate: json['SoftwareUpdatesEndDate'] as String,
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

DescribeSMBSettingsOutput _$DescribeSMBSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSMBSettingsOutput(
    activeDirectoryStatus: _$enumDecodeNullable(
        _$ActiveDirectoryStatusEnumMap, json['ActiveDirectoryStatus']),
    domainName: json['DomainName'] as String,
    fileSharesVisible: json['FileSharesVisible'] as bool,
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

DescribeTapesOutput _$DescribeTapesOutputFromJson(Map<String, dynamic> json) {
  return DescribeTapesOutput(
    marker: json['Marker'] as String,
    tapes: (json['Tapes'] as List)
        ?.map(
            (e) => e == null ? null : Tape.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

JoinDomainOutput _$JoinDomainOutputFromJson(Map<String, dynamic> json) {
  return JoinDomainOutput(
    activeDirectoryStatus: _$enumDecodeNullable(
        _$ActiveDirectoryStatusEnumMap, json['ActiveDirectoryStatus']),
    gatewayARN: json['GatewayARN'] as String,
  );
}

ListAutomaticTapeCreationPoliciesOutput
    _$ListAutomaticTapeCreationPoliciesOutputFromJson(
        Map<String, dynamic> json) {
  return ListAutomaticTapeCreationPoliciesOutput(
    automaticTapeCreationPolicyInfos:
        (json['AutomaticTapeCreationPolicyInfos'] as List)
            ?.map((e) => e == null
                ? null
                : AutomaticTapeCreationPolicyInfo.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
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

ListGatewaysOutput _$ListGatewaysOutputFromJson(Map<String, dynamic> json) {
  return ListGatewaysOutput(
    gateways: (json['Gateways'] as List)
        ?.map((e) =>
            e == null ? null : GatewayInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
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

ListTapePoolsOutput _$ListTapePoolsOutputFromJson(Map<String, dynamic> json) {
  return ListTapePoolsOutput(
    marker: json['Marker'] as String,
    poolInfos: (json['PoolInfos'] as List)
        ?.map((e) =>
            e == null ? null : PoolInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

ListVolumeInitiatorsOutput _$ListVolumeInitiatorsOutputFromJson(
    Map<String, dynamic> json) {
  return ListVolumeInitiatorsOutput(
    initiators: (json['Initiators'] as List)?.map((e) => e as String)?.toList(),
  );
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
    cacheAttributes: json['CacheAttributes'] == null
        ? null
        : CacheAttributes.fromJson(
            json['CacheAttributes'] as Map<String, dynamic>),
    clientList: (json['ClientList'] as List)?.map((e) => e as String)?.toList(),
    defaultStorageClass: json['DefaultStorageClass'] as String,
    fileShareARN: json['FileShareARN'] as String,
    fileShareId: json['FileShareId'] as String,
    fileShareName: json['FileShareName'] as String,
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
    notificationPolicy: json['NotificationPolicy'] as String,
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

const _$ObjectACLEnumMap = {
  ObjectACL.private: 'private',
  ObjectACL.publicRead: 'public-read',
  ObjectACL.publicReadWrite: 'public-read-write',
  ObjectACL.authenticatedRead: 'authenticated-read',
  ObjectACL.bucketOwnerRead: 'bucket-owner-read',
  ObjectACL.bucketOwnerFullControl: 'bucket-owner-full-control',
  ObjectACL.awsExecRead: 'aws-exec-read',
};

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    ipv4Address: json['Ipv4Address'] as String,
    ipv6Address: json['Ipv6Address'] as String,
    macAddress: json['MacAddress'] as String,
  );
}

NotifyWhenUploadedOutput _$NotifyWhenUploadedOutputFromJson(
    Map<String, dynamic> json) {
  return NotifyWhenUploadedOutput(
    fileShareARN: json['FileShareARN'] as String,
    notificationId: json['NotificationId'] as String,
  );
}

PoolInfo _$PoolInfoFromJson(Map<String, dynamic> json) {
  return PoolInfo(
    poolARN: json['PoolARN'] as String,
    poolName: json['PoolName'] as String,
    poolStatus: _$enumDecodeNullable(_$PoolStatusEnumMap, json['PoolStatus']),
    retentionLockTimeInDays: json['RetentionLockTimeInDays'] as int,
    retentionLockType: _$enumDecodeNullable(
        _$RetentionLockTypeEnumMap, json['RetentionLockType']),
    storageClass:
        _$enumDecodeNullable(_$TapeStorageClassEnumMap, json['StorageClass']),
  );
}

const _$PoolStatusEnumMap = {
  PoolStatus.active: 'ACTIVE',
  PoolStatus.deleted: 'DELETED',
};

const _$RetentionLockTypeEnumMap = {
  RetentionLockType.compliance: 'COMPLIANCE',
  RetentionLockType.governance: 'GOVERNANCE',
  RetentionLockType.none: 'NONE',
};

const _$TapeStorageClassEnumMap = {
  TapeStorageClass.deepArchive: 'DEEP_ARCHIVE',
  TapeStorageClass.glacier: 'GLACIER',
};

RefreshCacheOutput _$RefreshCacheOutputFromJson(Map<String, dynamic> json) {
  return RefreshCacheOutput(
    fileShareARN: json['FileShareARN'] as String,
    notificationId: json['NotificationId'] as String,
  );
}

RemoveTagsFromResourceOutput _$RemoveTagsFromResourceOutputFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceOutput(
    resourceARN: json['ResourceARN'] as String,
  );
}

ResetCacheOutput _$ResetCacheOutputFromJson(Map<String, dynamic> json) {
  return ResetCacheOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

RetrieveTapeArchiveOutput _$RetrieveTapeArchiveOutputFromJson(
    Map<String, dynamic> json) {
  return RetrieveTapeArchiveOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

RetrieveTapeRecoveryPointOutput _$RetrieveTapeRecoveryPointOutputFromJson(
    Map<String, dynamic> json) {
  return RetrieveTapeRecoveryPointOutput(
    tapeARN: json['TapeARN'] as String,
  );
}

SMBFileShareInfo _$SMBFileShareInfoFromJson(Map<String, dynamic> json) {
  return SMBFileShareInfo(
    accessBasedEnumeration: json['AccessBasedEnumeration'] as bool,
    adminUserList:
        (json['AdminUserList'] as List)?.map((e) => e as String)?.toList(),
    auditDestinationARN: json['AuditDestinationARN'] as String,
    authentication: json['Authentication'] as String,
    cacheAttributes: json['CacheAttributes'] == null
        ? null
        : CacheAttributes.fromJson(
            json['CacheAttributes'] as Map<String, dynamic>),
    caseSensitivity:
        _$enumDecodeNullable(_$CaseSensitivityEnumMap, json['CaseSensitivity']),
    defaultStorageClass: json['DefaultStorageClass'] as String,
    fileShareARN: json['FileShareARN'] as String,
    fileShareId: json['FileShareId'] as String,
    fileShareName: json['FileShareName'] as String,
    fileShareStatus: json['FileShareStatus'] as String,
    gatewayARN: json['GatewayARN'] as String,
    guessMIMETypeEnabled: json['GuessMIMETypeEnabled'] as bool,
    invalidUserList:
        (json['InvalidUserList'] as List)?.map((e) => e as String)?.toList(),
    kMSEncrypted: json['KMSEncrypted'] as bool,
    kMSKey: json['KMSKey'] as String,
    locationARN: json['LocationARN'] as String,
    notificationPolicy: json['NotificationPolicy'] as String,
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

const _$CaseSensitivityEnumMap = {
  CaseSensitivity.clientSpecified: 'ClientSpecified',
  CaseSensitivity.caseSensitive: 'CaseSensitive',
};

SetLocalConsolePasswordOutput _$SetLocalConsolePasswordOutputFromJson(
    Map<String, dynamic> json) {
  return SetLocalConsolePasswordOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

SetSMBGuestPasswordOutput _$SetSMBGuestPasswordOutputFromJson(
    Map<String, dynamic> json) {
  return SetSMBGuestPasswordOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

ShutdownGatewayOutput _$ShutdownGatewayOutputFromJson(
    Map<String, dynamic> json) {
  return ShutdownGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

StartAvailabilityMonitorTestOutput _$StartAvailabilityMonitorTestOutputFromJson(
    Map<String, dynamic> json) {
  return StartAvailabilityMonitorTestOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

StartGatewayOutput _$StartGatewayOutputFromJson(Map<String, dynamic> json) {
  return StartGatewayOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

StorediSCSIVolume _$StorediSCSIVolumeFromJson(Map<String, dynamic> json) {
  return StorediSCSIVolume(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
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
    poolEntryDate:
        const UnixDateTimeConverter().fromJson(json['PoolEntryDate']),
    poolId: json['PoolId'] as String,
    progress: (json['Progress'] as num)?.toDouble(),
    retentionStartDate:
        const UnixDateTimeConverter().fromJson(json['RetentionStartDate']),
    tapeARN: json['TapeARN'] as String,
    tapeBarcode: json['TapeBarcode'] as String,
    tapeCreatedDate:
        const UnixDateTimeConverter().fromJson(json['TapeCreatedDate']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
    tapeUsedInBytes: json['TapeUsedInBytes'] as int,
    vTLDevice: json['VTLDevice'] as String,
    worm: json['Worm'] as bool,
  );
}

TapeArchive _$TapeArchiveFromJson(Map<String, dynamic> json) {
  return TapeArchive(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['CompletionTime']),
    kMSKey: json['KMSKey'] as String,
    poolEntryDate:
        const UnixDateTimeConverter().fromJson(json['PoolEntryDate']),
    poolId: json['PoolId'] as String,
    retentionStartDate:
        const UnixDateTimeConverter().fromJson(json['RetentionStartDate']),
    retrievedTo: json['RetrievedTo'] as String,
    tapeARN: json['TapeARN'] as String,
    tapeBarcode: json['TapeBarcode'] as String,
    tapeCreatedDate:
        const UnixDateTimeConverter().fromJson(json['TapeCreatedDate']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
    tapeUsedInBytes: json['TapeUsedInBytes'] as int,
    worm: json['Worm'] as bool,
  );
}

TapeInfo _$TapeInfoFromJson(Map<String, dynamic> json) {
  return TapeInfo(
    gatewayARN: json['GatewayARN'] as String,
    poolEntryDate:
        const UnixDateTimeConverter().fromJson(json['PoolEntryDate']),
    poolId: json['PoolId'] as String,
    retentionStartDate:
        const UnixDateTimeConverter().fromJson(json['RetentionStartDate']),
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
    tapeRecoveryPointTime:
        const UnixDateTimeConverter().fromJson(json['TapeRecoveryPointTime']),
    tapeSizeInBytes: json['TapeSizeInBytes'] as int,
    tapeStatus: json['TapeStatus'] as String,
  );
}

UpdateAutomaticTapeCreationPolicyOutput
    _$UpdateAutomaticTapeCreationPolicyOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateAutomaticTapeCreationPolicyOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateBandwidthRateLimitOutput _$UpdateBandwidthRateLimitOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateBandwidthRateLimitOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateBandwidthRateLimitScheduleOutput
    _$UpdateBandwidthRateLimitScheduleOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateBandwidthRateLimitScheduleOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateChapCredentialsOutput _$UpdateChapCredentialsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateChapCredentialsOutput(
    initiatorName: json['InitiatorName'] as String,
    targetARN: json['TargetARN'] as String,
  );
}

UpdateGatewayInformationOutput _$UpdateGatewayInformationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewayInformationOutput(
    gatewayARN: json['GatewayARN'] as String,
    gatewayName: json['GatewayName'] as String,
  );
}

UpdateGatewaySoftwareNowOutput _$UpdateGatewaySoftwareNowOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewaySoftwareNowOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateMaintenanceStartTimeOutput _$UpdateMaintenanceStartTimeOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateMaintenanceStartTimeOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateNFSFileShareOutput _$UpdateNFSFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateNFSFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

UpdateSMBFileShareOutput _$UpdateSMBFileShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSMBFileShareOutput(
    fileShareARN: json['FileShareARN'] as String,
  );
}

UpdateSMBFileShareVisibilityOutput _$UpdateSMBFileShareVisibilityOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSMBFileShareVisibilityOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateSMBSecurityStrategyOutput _$UpdateSMBSecurityStrategyOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSMBSecurityStrategyOutput(
    gatewayARN: json['GatewayARN'] as String,
  );
}

UpdateSnapshotScheduleOutput _$UpdateSnapshotScheduleOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSnapshotScheduleOutput(
    volumeARN: json['VolumeARN'] as String,
  );
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
