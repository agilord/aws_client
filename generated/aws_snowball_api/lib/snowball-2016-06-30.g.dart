// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snowball-2016-06-30.dart';

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

Map<String, dynamic> _$CancelClusterRequestToJson(
    CancelClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterId', instance.clusterId);
  return val;
}

CancelClusterResult _$CancelClusterResultFromJson(Map<String, dynamic> json) {
  return CancelClusterResult();
}

Map<String, dynamic> _$CancelJobRequestToJson(CancelJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  return val;
}

CancelJobResult _$CancelJobResultFromJson(Map<String, dynamic> json) {
  return CancelJobResult();
}

ClusterListEntry _$ClusterListEntryFromJson(Map<String, dynamic> json) {
  return ClusterListEntry(
    clusterId: json['ClusterId'] as String,
    clusterState:
        _$enumDecodeNullable(_$ClusterStateEnumMap, json['ClusterState']),
    creationDate: unixTimestampFromJson(json['CreationDate']),
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
    creationDate: unixTimestampFromJson(json['CreationDate']),
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
};

CompatibleImage _$CompatibleImageFromJson(Map<String, dynamic> json) {
  return CompatibleImage(
    amiId: json['AmiId'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$CreateAddressRequestToJson(
    CreateAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address?.toJson());
  return val;
}

CreateAddressResult _$CreateAddressResultFromJson(Map<String, dynamic> json) {
  return CreateAddressResult(
    addressId: json['AddressId'] as String,
  );
}

Map<String, dynamic> _$CreateClusterRequestToJson(
    CreateClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressId', instance.addressId);
  writeNotNull('JobType', _$JobTypeEnumMap[instance.jobType]);
  writeNotNull('Resources', instance.resources?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'ShippingOption', _$ShippingOptionEnumMap[instance.shippingOption]);
  writeNotNull('Description', instance.description);
  writeNotNull('ForwardingAddressId', instance.forwardingAddressId);
  writeNotNull('KmsKeyARN', instance.kmsKeyARN);
  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull('SnowballType', _$SnowballTypeEnumMap[instance.snowballType]);
  writeNotNull('TaxDocuments', instance.taxDocuments?.toJson());
  return val;
}

CreateClusterResult _$CreateClusterResultFromJson(Map<String, dynamic> json) {
  return CreateClusterResult(
    clusterId: json['ClusterId'] as String,
  );
}

Map<String, dynamic> _$CreateJobRequestToJson(CreateJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressId', instance.addressId);
  writeNotNull('ClusterId', instance.clusterId);
  writeNotNull('Description', instance.description);
  writeNotNull('ForwardingAddressId', instance.forwardingAddressId);
  writeNotNull('JobType', _$JobTypeEnumMap[instance.jobType]);
  writeNotNull('KmsKeyARN', instance.kmsKeyARN);
  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull('Resources', instance.resources?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'ShippingOption', _$ShippingOptionEnumMap[instance.shippingOption]);
  writeNotNull('SnowballCapacityPreference',
      _$SnowballCapacityEnumMap[instance.snowballCapacityPreference]);
  writeNotNull('SnowballType', _$SnowballTypeEnumMap[instance.snowballType]);
  writeNotNull('TaxDocuments', instance.taxDocuments?.toJson());
  return val;
}

const _$SnowballCapacityEnumMap = {
  SnowballCapacity.t50: 'T50',
  SnowballCapacity.t80: 'T80',
  SnowballCapacity.t100: 'T100',
  SnowballCapacity.t42: 'T42',
  SnowballCapacity.t98: 'T98',
  SnowballCapacity.noPreference: 'NoPreference',
};

CreateJobResult _$CreateJobResultFromJson(Map<String, dynamic> json) {
  return CreateJobResult(
    jobId: json['JobId'] as String,
  );
}

DataTransfer _$DataTransferFromJson(Map<String, dynamic> json) {
  return DataTransfer(
    bytesTransferred: json['BytesTransferred'] as int,
    objectsTransferred: json['ObjectsTransferred'] as int,
    totalBytes: json['TotalBytes'] as int,
    totalObjects: json['TotalObjects'] as int,
  );
}

Map<String, dynamic> _$DescribeAddressRequestToJson(
    DescribeAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressId', instance.addressId);
  return val;
}

DescribeAddressResult _$DescribeAddressResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAddressResult(
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeAddressesRequestToJson(
    DescribeAddressesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$DescribeClusterRequestToJson(
    DescribeClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterId', instance.clusterId);
  return val;
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

Map<String, dynamic> _$DescribeJobRequestToJson(DescribeJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  return val;
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

Map<String, dynamic> _$GetJobManifestRequestToJson(
    GetJobManifestRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  return val;
}

GetJobManifestResult _$GetJobManifestResultFromJson(Map<String, dynamic> json) {
  return GetJobManifestResult(
    manifestURI: json['ManifestURI'] as String,
  );
}

Map<String, dynamic> _$GetJobUnlockCodeRequestToJson(
    GetJobUnlockCodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  return val;
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

Map<String, dynamic> _$GetSoftwareUpdatesRequestToJson(
    GetSoftwareUpdatesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  return val;
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
    creationDate: unixTimestampFromJson(json['CreationDate']),
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
    creationDate: unixTimestampFromJson(json['CreationDate']),
    dataTransferProgress: json['DataTransferProgress'] == null
        ? null
        : DataTransfer.fromJson(
            json['DataTransferProgress'] as Map<String, dynamic>),
    description: json['Description'] as String,
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

Map<String, dynamic> _$ListClusterJobsRequestToJson(
    ListClusterJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterId', instance.clusterId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
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

Map<String, dynamic> _$ListClustersRequestToJson(ListClustersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListCompatibleImagesRequestToJson(
    ListCompatibleImagesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListJobsRequestToJson(ListJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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
    jobStatesToNotify:
        (json['JobStatesToNotify'] as List)?.map((e) => e as String)?.toList(),
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

  writeNotNull('JobStatesToNotify', instance.jobStatesToNotify);
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

Map<String, dynamic> _$UpdateClusterRequestToJson(
    UpdateClusterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterId', instance.clusterId);
  writeNotNull('AddressId', instance.addressId);
  writeNotNull('Description', instance.description);
  writeNotNull('ForwardingAddressId', instance.forwardingAddressId);
  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull('Resources', instance.resources?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'ShippingOption', _$ShippingOptionEnumMap[instance.shippingOption]);
  return val;
}

UpdateClusterResult _$UpdateClusterResultFromJson(Map<String, dynamic> json) {
  return UpdateClusterResult();
}

Map<String, dynamic> _$UpdateJobRequestToJson(UpdateJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobId', instance.jobId);
  writeNotNull('AddressId', instance.addressId);
  writeNotNull('Description', instance.description);
  writeNotNull('ForwardingAddressId', instance.forwardingAddressId);
  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull('Resources', instance.resources?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'ShippingOption', _$ShippingOptionEnumMap[instance.shippingOption]);
  writeNotNull('SnowballCapacityPreference',
      _$SnowballCapacityEnumMap[instance.snowballCapacityPreference]);
  return val;
}

UpdateJobResult _$UpdateJobResultFromJson(Map<String, dynamic> json) {
  return UpdateJobResult();
}
