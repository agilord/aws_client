// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    addressId: json['AddressId'] as String,
    city: json['City'] as String,
    company: json['Company'] as String,
    country: json['Country'] as String,
    isRestricted: json['IsRestricted'] as bool,
    landmark: json['Landmark'] as String,
    name: json['Name'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    postalCode: json['PostalCode'] as String,
    prefectureOrDistrict: json['PrefectureOrDistrict'] as String,
    stateOrProvince: json['StateOrProvince'] as String,
    street1: json['Street1'] as String,
    street2: json['Street2'] as String,
    street3: json['Street3'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressId', instance.addressId);
  writeNotNull('City', instance.city);
  writeNotNull('Company', instance.company);
  writeNotNull('Country', instance.country);
  writeNotNull('IsRestricted', instance.isRestricted);
  writeNotNull('Landmark', instance.landmark);
  writeNotNull('Name', instance.name);
  writeNotNull('PhoneNumber', instance.phoneNumber);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('PrefectureOrDistrict', instance.prefectureOrDistrict);
  writeNotNull('StateOrProvince', instance.stateOrProvince);
  writeNotNull('Street1', instance.street1);
  writeNotNull('Street2', instance.street2);
  writeNotNull('Street3', instance.street3);
  return val;
}

CancelClusterResult _$CancelClusterResultFromJson(Map<String, dynamic> json) {
  return CancelClusterResult();
}

CancelJobResult _$CancelJobResultFromJson(Map<String, dynamic> json) {
  return CancelJobResult();
}

ClusterListEntry _$ClusterListEntryFromJson(Map<String, dynamic> json) {
  return ClusterListEntry(
    clusterId: json['ClusterId'] as String,
    clusterState:
        _$enumDecodeNullable(_$ClusterStateEnumMap, json['ClusterState']),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
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

const _$ClusterStateEnumMap = {
  ClusterState.awaitingQuorum: 'AwaitingQuorum',
  ClusterState.pending: 'Pending',
  ClusterState.inUse: 'InUse',
  ClusterState.complete: 'Complete',
  ClusterState.cancelled: 'Cancelled',
};

ClusterMetadata _$ClusterMetadataFromJson(Map<String, dynamic> json) {
  return ClusterMetadata(
    addressId: json['AddressId'] as String,
    clusterId: json['ClusterId'] as String,
    clusterState:
        _$enumDecodeNullable(_$ClusterStateEnumMap, json['ClusterState']),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    forwardingAddressId: json['ForwardingAddressId'] as String,
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['JobType']),
    kmsKeyARN: json['KmsKeyARN'] as String,
    notification: json['Notification'] == null
        ? null
        : Notification.fromJson(json['Notification'] as Map<String, dynamic>),
    resources: json['Resources'] == null
        ? null
        : JobResource.fromJson(json['Resources'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    shippingOption:
        _$enumDecodeNullable(_$ShippingOptionEnumMap, json['ShippingOption']),
    snowballType:
        _$enumDecodeNullable(_$SnowballTypeEnumMap, json['SnowballType']),
    taxDocuments: json['TaxDocuments'] == null
        ? null
        : TaxDocuments.fromJson(json['TaxDocuments'] as Map<String, dynamic>),
  );
}

const _$JobTypeEnumMap = {
  JobType.import: 'IMPORT',
  JobType.export: 'EXPORT',
  JobType.localUse: 'LOCAL_USE',
};

const _$ShippingOptionEnumMap = {
  ShippingOption.secondDay: 'SECOND_DAY',
  ShippingOption.nextDay: 'NEXT_DAY',
  ShippingOption.express: 'EXPRESS',
  ShippingOption.standard: 'STANDARD',
};

const _$SnowballTypeEnumMap = {
  SnowballType.standard: 'STANDARD',
  SnowballType.edge: 'EDGE',
  SnowballType.edgeC: 'EDGE_C',
  SnowballType.edgeCg: 'EDGE_CG',
  SnowballType.edgeS: 'EDGE_S',
  SnowballType.snc1Hdd: 'SNC1_HDD',
};

CompatibleImage _$CompatibleImageFromJson(Map<String, dynamic> json) {
  return CompatibleImage(
    amiId: json['AmiId'] as String,
    name: json['Name'] as String,
  );
}

CreateAddressResult _$CreateAddressResultFromJson(Map<String, dynamic> json) {
  return CreateAddressResult(
    addressId: json['AddressId'] as String,
  );
}

CreateClusterResult _$CreateClusterResultFromJson(Map<String, dynamic> json) {
  return CreateClusterResult(
    clusterId: json['ClusterId'] as String,
  );
}

CreateJobResult _$CreateJobResultFromJson(Map<String, dynamic> json) {
  return CreateJobResult(
    jobId: json['JobId'] as String,
  );
}

CreateReturnShippingLabelResult _$CreateReturnShippingLabelResultFromJson(
    Map<String, dynamic> json) {
  return CreateReturnShippingLabelResult(
    status: _$enumDecodeNullable(_$ShippingLabelStatusEnumMap, json['Status']),
  );
}

const _$ShippingLabelStatusEnumMap = {
  ShippingLabelStatus.inProgress: 'InProgress',
  ShippingLabelStatus.timedOut: 'TimedOut',
  ShippingLabelStatus.succeeded: 'Succeeded',
  ShippingLabelStatus.failed: 'Failed',
};

DataTransfer _$DataTransferFromJson(Map<String, dynamic> json) {
  return DataTransfer(
    bytesTransferred: json['BytesTransferred'] as int,
    objectsTransferred: json['ObjectsTransferred'] as int,
    totalBytes: json['TotalBytes'] as int,
    totalObjects: json['TotalObjects'] as int,
  );
}

DescribeAddressResult _$DescribeAddressResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAddressResult(
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
  );
}

DescribeAddressesResult _$DescribeAddressesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAddressesResult(
    addresses: (json['Addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeClusterResult _$DescribeClusterResultFromJson(
    Map<String, dynamic> json) {
  return DescribeClusterResult(
    clusterMetadata: json['ClusterMetadata'] == null
        ? null
        : ClusterMetadata.fromJson(
            json['ClusterMetadata'] as Map<String, dynamic>),
  );
}

DescribeJobResult _$DescribeJobResultFromJson(Map<String, dynamic> json) {
  return DescribeJobResult(
    jobMetadata: json['JobMetadata'] == null
        ? null
        : JobMetadata.fromJson(json['JobMetadata'] as Map<String, dynamic>),
    subJobMetadata: (json['SubJobMetadata'] as List)
        ?.map((e) =>
            e == null ? null : JobMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeReturnShippingLabelResult _$DescribeReturnShippingLabelResultFromJson(
    Map<String, dynamic> json) {
  return DescribeReturnShippingLabelResult(
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['ExpirationDate']),
    status: _$enumDecodeNullable(_$ShippingLabelStatusEnumMap, json['Status']),
  );
}

DeviceConfiguration _$DeviceConfigurationFromJson(Map<String, dynamic> json) {
  return DeviceConfiguration(
    snowconeDeviceConfiguration: json['SnowconeDeviceConfiguration'] == null
        ? null
        : SnowconeDeviceConfiguration.fromJson(
            json['SnowconeDeviceConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviceConfigurationToJson(DeviceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnowconeDeviceConfiguration',
      instance.snowconeDeviceConfiguration?.toJson());
  return val;
}

Ec2AmiResource _$Ec2AmiResourceFromJson(Map<String, dynamic> json) {
  return Ec2AmiResource(
    amiId: json['AmiId'] as String,
    snowballAmiId: json['SnowballAmiId'] as String,
  );
}

Map<String, dynamic> _$Ec2AmiResourceToJson(Ec2AmiResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AmiId', instance.amiId);
  writeNotNull('SnowballAmiId', instance.snowballAmiId);
  return val;
}

EventTriggerDefinition _$EventTriggerDefinitionFromJson(
    Map<String, dynamic> json) {
  return EventTriggerDefinition(
    eventResourceARN: json['EventResourceARN'] as String,
  );
}

Map<String, dynamic> _$EventTriggerDefinitionToJson(
    EventTriggerDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventResourceARN', instance.eventResourceARN);
  return val;
}

GetJobManifestResult _$GetJobManifestResultFromJson(Map<String, dynamic> json) {
  return GetJobManifestResult(
    manifestURI: json['ManifestURI'] as String,
  );
}

GetJobUnlockCodeResult _$GetJobUnlockCodeResultFromJson(
    Map<String, dynamic> json) {
  return GetJobUnlockCodeResult(
    unlockCode: json['UnlockCode'] as String,
  );
}

GetSnowballUsageResult _$GetSnowballUsageResultFromJson(
    Map<String, dynamic> json) {
  return GetSnowballUsageResult(
    snowballLimit: json['SnowballLimit'] as int,
    snowballsInUse: json['SnowballsInUse'] as int,
  );
}

GetSoftwareUpdatesResult _$GetSoftwareUpdatesResultFromJson(
    Map<String, dynamic> json) {
  return GetSoftwareUpdatesResult(
    updatesURI: json['UpdatesURI'] as String,
  );
}

INDTaxDocuments _$INDTaxDocumentsFromJson(Map<String, dynamic> json) {
  return INDTaxDocuments(
    gstin: json['GSTIN'] as String,
  );
}

Map<String, dynamic> _$INDTaxDocumentsToJson(INDTaxDocuments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GSTIN', instance.gstin);
  return val;
}

JobListEntry _$JobListEntryFromJson(Map<String, dynamic> json) {
  return JobListEntry(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    isMaster: json['IsMaster'] as bool,
    jobId: json['JobId'] as String,
    jobState: _$enumDecodeNullable(_$JobStateEnumMap, json['JobState']),
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['JobType']),
    snowballType:
        _$enumDecodeNullable(_$SnowballTypeEnumMap, json['SnowballType']),
  );
}

const _$JobStateEnumMap = {
  JobState.$new: 'New',
  JobState.preparingAppliance: 'PreparingAppliance',
  JobState.preparingShipment: 'PreparingShipment',
  JobState.inTransitToCustomer: 'InTransitToCustomer',
  JobState.withCustomer: 'WithCustomer',
  JobState.inTransitToAWS: 'InTransitToAWS',
  JobState.withAWSSortingFacility: 'WithAWSSortingFacility',
  JobState.withAWS: 'WithAWS',
  JobState.inProgress: 'InProgress',
  JobState.complete: 'Complete',
  JobState.cancelled: 'Cancelled',
  JobState.listing: 'Listing',
  JobState.pending: 'Pending',
};

JobLogs _$JobLogsFromJson(Map<String, dynamic> json) {
  return JobLogs(
    jobCompletionReportURI: json['JobCompletionReportURI'] as String,
    jobFailureLogURI: json['JobFailureLogURI'] as String,
    jobSuccessLogURI: json['JobSuccessLogURI'] as String,
  );
}

JobMetadata _$JobMetadataFromJson(Map<String, dynamic> json) {
  return JobMetadata(
    addressId: json['AddressId'] as String,
    clusterId: json['ClusterId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    dataTransferProgress: json['DataTransferProgress'] == null
        ? null
        : DataTransfer.fromJson(
            json['DataTransferProgress'] as Map<String, dynamic>),
    description: json['Description'] as String,
    deviceConfiguration: json['DeviceConfiguration'] == null
        ? null
        : DeviceConfiguration.fromJson(
            json['DeviceConfiguration'] as Map<String, dynamic>),
    forwardingAddressId: json['ForwardingAddressId'] as String,
    jobId: json['JobId'] as String,
    jobLogInfo: json['JobLogInfo'] == null
        ? null
        : JobLogs.fromJson(json['JobLogInfo'] as Map<String, dynamic>),
    jobState: _$enumDecodeNullable(_$JobStateEnumMap, json['JobState']),
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['JobType']),
    kmsKeyARN: json['KmsKeyARN'] as String,
    notification: json['Notification'] == null
        ? null
        : Notification.fromJson(json['Notification'] as Map<String, dynamic>),
    resources: json['Resources'] == null
        ? null
        : JobResource.fromJson(json['Resources'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    shippingDetails: json['ShippingDetails'] == null
        ? null
        : ShippingDetails.fromJson(
            json['ShippingDetails'] as Map<String, dynamic>),
    snowballCapacityPreference: _$enumDecodeNullable(
        _$SnowballCapacityEnumMap, json['SnowballCapacityPreference']),
    snowballType:
        _$enumDecodeNullable(_$SnowballTypeEnumMap, json['SnowballType']),
    taxDocuments: json['TaxDocuments'] == null
        ? null
        : TaxDocuments.fromJson(json['TaxDocuments'] as Map<String, dynamic>),
  );
}

const _$SnowballCapacityEnumMap = {
  SnowballCapacity.t50: 'T50',
  SnowballCapacity.t80: 'T80',
  SnowballCapacity.t100: 'T100',
  SnowballCapacity.t42: 'T42',
  SnowballCapacity.t98: 'T98',
  SnowballCapacity.t8: 'T8',
  SnowballCapacity.noPreference: 'NoPreference',
};

JobResource _$JobResourceFromJson(Map<String, dynamic> json) {
  return JobResource(
    ec2AmiResources: (json['Ec2AmiResources'] as List)
        ?.map((e) => e == null
            ? null
            : Ec2AmiResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lambdaResources: (json['LambdaResources'] as List)
        ?.map((e) => e == null
            ? null
            : LambdaResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    s3Resources: (json['S3Resources'] as List)
        ?.map((e) =>
            e == null ? null : S3Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JobResourceToJson(JobResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Ec2AmiResources',
      instance.ec2AmiResources?.map((e) => e?.toJson())?.toList());
  writeNotNull('LambdaResources',
      instance.lambdaResources?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'S3Resources', instance.s3Resources?.map((e) => e?.toJson())?.toList());
  return val;
}

KeyRange _$KeyRangeFromJson(Map<String, dynamic> json) {
  return KeyRange(
    beginMarker: json['BeginMarker'] as String,
    endMarker: json['EndMarker'] as String,
  );
}

Map<String, dynamic> _$KeyRangeToJson(KeyRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BeginMarker', instance.beginMarker);
  writeNotNull('EndMarker', instance.endMarker);
  return val;
}

LambdaResource _$LambdaResourceFromJson(Map<String, dynamic> json) {
  return LambdaResource(
    eventTriggers: (json['EventTriggers'] as List)
        ?.map((e) => e == null
            ? null
            : EventTriggerDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lambdaArn: json['LambdaArn'] as String,
  );
}

Map<String, dynamic> _$LambdaResourceToJson(LambdaResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventTriggers',
      instance.eventTriggers?.map((e) => e?.toJson())?.toList());
  writeNotNull('LambdaArn', instance.lambdaArn);
  return val;
}

ListClusterJobsResult _$ListClusterJobsResultFromJson(
    Map<String, dynamic> json) {
  return ListClusterJobsResult(
    jobListEntries: (json['JobListEntries'] as List)
        ?.map((e) =>
            e == null ? null : JobListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListClustersResult _$ListClustersResultFromJson(Map<String, dynamic> json) {
  return ListClustersResult(
    clusterListEntries: (json['ClusterListEntries'] as List)
        ?.map((e) => e == null
            ? null
            : ClusterListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCompatibleImagesResult _$ListCompatibleImagesResultFromJson(
    Map<String, dynamic> json) {
  return ListCompatibleImagesResult(
    compatibleImages: (json['CompatibleImages'] as List)
        ?.map((e) => e == null
            ? null
            : CompatibleImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJobsResult _$ListJobsResultFromJson(Map<String, dynamic> json) {
  return ListJobsResult(
    jobListEntries: (json['JobListEntries'] as List)
        ?.map((e) =>
            e == null ? null : JobListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    jobStatesToNotify: (json['JobStatesToNotify'] as List)
        ?.map((e) => _$enumDecodeNullable(_$JobStateEnumMap, e))
        ?.toList(),
    notifyAll: json['NotifyAll'] as bool,
    snsTopicARN: json['SnsTopicARN'] as String,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobStatesToNotify',
      instance.jobStatesToNotify?.map((e) => _$JobStateEnumMap[e])?.toList());
  writeNotNull('NotifyAll', instance.notifyAll);
  writeNotNull('SnsTopicARN', instance.snsTopicARN);
  return val;
}

S3Resource _$S3ResourceFromJson(Map<String, dynamic> json) {
  return S3Resource(
    bucketArn: json['BucketArn'] as String,
    keyRange: json['KeyRange'] == null
        ? null
        : KeyRange.fromJson(json['KeyRange'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3ResourceToJson(S3Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketArn', instance.bucketArn);
  writeNotNull('KeyRange', instance.keyRange?.toJson());
  return val;
}

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return Shipment(
    status: json['Status'] as String,
    trackingNumber: json['TrackingNumber'] as String,
  );
}

ShippingDetails _$ShippingDetailsFromJson(Map<String, dynamic> json) {
  return ShippingDetails(
    inboundShipment: json['InboundShipment'] == null
        ? null
        : Shipment.fromJson(json['InboundShipment'] as Map<String, dynamic>),
    outboundShipment: json['OutboundShipment'] == null
        ? null
        : Shipment.fromJson(json['OutboundShipment'] as Map<String, dynamic>),
    shippingOption:
        _$enumDecodeNullable(_$ShippingOptionEnumMap, json['ShippingOption']),
  );
}

SnowconeDeviceConfiguration _$SnowconeDeviceConfigurationFromJson(
    Map<String, dynamic> json) {
  return SnowconeDeviceConfiguration(
    wirelessConnection: json['WirelessConnection'] == null
        ? null
        : WirelessConnection.fromJson(
            json['WirelessConnection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SnowconeDeviceConfigurationToJson(
    SnowconeDeviceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WirelessConnection', instance.wirelessConnection?.toJson());
  return val;
}

TaxDocuments _$TaxDocumentsFromJson(Map<String, dynamic> json) {
  return TaxDocuments(
    ind: json['IND'] == null
        ? null
        : INDTaxDocuments.fromJson(json['IND'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TaxDocumentsToJson(TaxDocuments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IND', instance.ind?.toJson());
  return val;
}

UpdateClusterResult _$UpdateClusterResultFromJson(Map<String, dynamic> json) {
  return UpdateClusterResult();
}

UpdateJobResult _$UpdateJobResultFromJson(Map<String, dynamic> json) {
  return UpdateJobResult();
}

UpdateJobShipmentStateResult _$UpdateJobShipmentStateResultFromJson(
    Map<String, dynamic> json) {
  return UpdateJobShipmentStateResult();
}

WirelessConnection _$WirelessConnectionFromJson(Map<String, dynamic> json) {
  return WirelessConnection(
    isWifiEnabled: json['IsWifiEnabled'] as bool,
  );
}

Map<String, dynamic> _$WirelessConnectionToJson(WirelessConnection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IsWifiEnabled', instance.isWifiEnabled);
  return val;
}
