// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudhsm-2014-05-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddTagsToResourceRequestToJson(
    AddTagsToResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagList', instance.tagList?.map((e) => e?.toJson())?.toList());
  return val;
}

AddTagsToResourceResponse _$AddTagsToResourceResponseFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceResponse(
    status: json['Status'] as String,
  );
}

CloudHsmInternalException _$CloudHsmInternalExceptionFromJson(
    Map<String, dynamic> json) {
  return CloudHsmInternalException();
}

CloudHsmServiceException _$CloudHsmServiceExceptionFromJson(
    Map<String, dynamic> json) {
  return CloudHsmServiceException(
    message: json['message'] as String,
    retryable: json['retryable'] as bool,
  );
}

Map<String, dynamic> _$CreateHapgRequestToJson(CreateHapgRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Label', instance.label);
  return val;
}

CreateHapgResponse _$CreateHapgResponseFromJson(Map<String, dynamic> json) {
  return CreateHapgResponse(
    hapgArn: json['HapgArn'] as String,
  );
}

Map<String, dynamic> _$CreateHsmRequestToJson(CreateHsmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('SshKey', instance.sshKey);
  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull(
      'SubscriptionType', _$SubscriptionTypeEnumMap[instance.subscriptionType]);
  writeNotNull('ClientToken', instance.clientToken);
  writeNotNull('EniIp', instance.eniIp);
  writeNotNull('ExternalId', instance.externalId);
  writeNotNull('SyslogIp', instance.syslogIp);
  return val;
}

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.production: 'PRODUCTION',
};

CreateHsmResponse _$CreateHsmResponseFromJson(Map<String, dynamic> json) {
  return CreateHsmResponse(
    hsmArn: json['HsmArn'] as String,
  );
}

Map<String, dynamic> _$CreateLunaClientRequestToJson(
    CreateLunaClientRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('Label', instance.label);
  return val;
}

CreateLunaClientResponse _$CreateLunaClientResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLunaClientResponse(
    clientArn: json['ClientArn'] as String,
  );
}

Map<String, dynamic> _$DeleteHapgRequestToJson(DeleteHapgRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HapgArn', instance.hapgArn);
  return val;
}

DeleteHapgResponse _$DeleteHapgResponseFromJson(Map<String, dynamic> json) {
  return DeleteHapgResponse(
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$DeleteHsmRequestToJson(DeleteHsmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HsmArn', instance.hsmArn);
  return val;
}

DeleteHsmResponse _$DeleteHsmResponseFromJson(Map<String, dynamic> json) {
  return DeleteHsmResponse(
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$DeleteLunaClientRequestToJson(
    DeleteLunaClientRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientArn', instance.clientArn);
  return val;
}

DeleteLunaClientResponse _$DeleteLunaClientResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLunaClientResponse(
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$DescribeHapgRequestToJson(DescribeHapgRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HapgArn', instance.hapgArn);
  return val;
}

DescribeHapgResponse _$DescribeHapgResponseFromJson(Map<String, dynamic> json) {
  return DescribeHapgResponse(
    hapgArn: json['HapgArn'] as String,
    hapgSerial: json['HapgSerial'] as String,
    hsmsLastActionFailed: (json['HsmsLastActionFailed'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    hsmsPendingDeletion: (json['HsmsPendingDeletion'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    hsmsPendingRegistration: (json['HsmsPendingRegistration'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    label: json['Label'] as String,
    lastModifiedTimestamp: json['LastModifiedTimestamp'] as String,
    partitionSerialList: (json['PartitionSerialList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    state: _$enumDecodeNullable(_$CloudHsmObjectStateEnumMap, json['State']),
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

const _$CloudHsmObjectStateEnumMap = {
  CloudHsmObjectState.ready: 'READY',
  CloudHsmObjectState.updating: 'UPDATING',
  CloudHsmObjectState.degraded: 'DEGRADED',
};

Map<String, dynamic> _$DescribeHsmRequestToJson(DescribeHsmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HsmArn', instance.hsmArn);
  writeNotNull('HsmSerialNumber', instance.hsmSerialNumber);
  return val;
}

DescribeHsmResponse _$DescribeHsmResponseFromJson(Map<String, dynamic> json) {
  return DescribeHsmResponse(
    availabilityZone: json['AvailabilityZone'] as String,
    eniId: json['EniId'] as String,
    eniIp: json['EniIp'] as String,
    hsmArn: json['HsmArn'] as String,
    hsmType: json['HsmType'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    partitions: (json['Partitions'] as List)?.map((e) => e as String)?.toList(),
    serialNumber: json['SerialNumber'] as String,
    serverCertLastUpdated: json['ServerCertLastUpdated'] as String,
    serverCertUri: json['ServerCertUri'] as String,
    softwareVersion: json['SoftwareVersion'] as String,
    sshKeyLastUpdated: json['SshKeyLastUpdated'] as String,
    sshPublicKey: json['SshPublicKey'] as String,
    status: _$enumDecodeNullable(_$HsmStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    subnetId: json['SubnetId'] as String,
    subscriptionEndDate: json['SubscriptionEndDate'] as String,
    subscriptionStartDate: json['SubscriptionStartDate'] as String,
    subscriptionType: _$enumDecodeNullable(
        _$SubscriptionTypeEnumMap, json['SubscriptionType']),
    vendorName: json['VendorName'] as String,
    vpcId: json['VpcId'] as String,
  );
}

const _$HsmStatusEnumMap = {
  HsmStatus.pending: 'PENDING',
  HsmStatus.running: 'RUNNING',
  HsmStatus.updating: 'UPDATING',
  HsmStatus.suspended: 'SUSPENDED',
  HsmStatus.terminating: 'TERMINATING',
  HsmStatus.terminated: 'TERMINATED',
  HsmStatus.degraded: 'DEGRADED',
};

Map<String, dynamic> _$DescribeLunaClientRequestToJson(
    DescribeLunaClientRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateFingerprint', instance.certificateFingerprint);
  writeNotNull('ClientArn', instance.clientArn);
  return val;
}

DescribeLunaClientResponse _$DescribeLunaClientResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLunaClientResponse(
    certificate: json['Certificate'] as String,
    certificateFingerprint: json['CertificateFingerprint'] as String,
    clientArn: json['ClientArn'] as String,
    label: json['Label'] as String,
    lastModifiedTimestamp: json['LastModifiedTimestamp'] as String,
  );
}

Map<String, dynamic> _$GetConfigRequestToJson(GetConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientArn', instance.clientArn);
  writeNotNull('ClientVersion', _$ClientVersionEnumMap[instance.clientVersion]);
  writeNotNull('HapgList', instance.hapgList);
  return val;
}

const _$ClientVersionEnumMap = {
  ClientVersion.$5_1: '5.1',
  ClientVersion.$5_3: '5.3',
};

GetConfigResponse _$GetConfigResponseFromJson(Map<String, dynamic> json) {
  return GetConfigResponse(
    configCred: json['ConfigCred'] as String,
    configFile: json['ConfigFile'] as String,
    configType: json['ConfigType'] as String,
  );
}

InvalidRequestException _$InvalidRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestException();
}

ListAvailableZonesResponse _$ListAvailableZonesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAvailableZonesResponse(
    aZList: (json['AZList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListHapgsRequestToJson(ListHapgsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHapgsResponse _$ListHapgsResponseFromJson(Map<String, dynamic> json) {
  return ListHapgsResponse(
    hapgList: (json['HapgList'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListHsmsRequestToJson(ListHsmsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHsmsResponse _$ListHsmsResponseFromJson(Map<String, dynamic> json) {
  return ListHsmsResponse(
    hsmList: (json['HsmList'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListLunaClientsRequestToJson(
    ListLunaClientsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListLunaClientsResponse _$ListLunaClientsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLunaClientsResponse(
    clientList: (json['ClientList'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModifyHapgRequestToJson(ModifyHapgRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HapgArn', instance.hapgArn);
  writeNotNull('Label', instance.label);
  writeNotNull('PartitionSerialList', instance.partitionSerialList);
  return val;
}

ModifyHapgResponse _$ModifyHapgResponseFromJson(Map<String, dynamic> json) {
  return ModifyHapgResponse(
    hapgArn: json['HapgArn'] as String,
  );
}

Map<String, dynamic> _$ModifyHsmRequestToJson(ModifyHsmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HsmArn', instance.hsmArn);
  writeNotNull('EniIp', instance.eniIp);
  writeNotNull('ExternalId', instance.externalId);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('SyslogIp', instance.syslogIp);
  return val;
}

ModifyHsmResponse _$ModifyHsmResponseFromJson(Map<String, dynamic> json) {
  return ModifyHsmResponse(
    hsmArn: json['HsmArn'] as String,
  );
}

Map<String, dynamic> _$ModifyLunaClientRequestToJson(
    ModifyLunaClientRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('ClientArn', instance.clientArn);
  return val;
}

ModifyLunaClientResponse _$ModifyLunaClientResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyLunaClientResponse(
    clientArn: json['ClientArn'] as String,
  );
}

Map<String, dynamic> _$RemoveTagsFromResourceRequestToJson(
    RemoveTagsFromResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagKeyList', instance.tagKeyList);
  return val;
}

RemoveTagsFromResourceResponse _$RemoveTagsFromResourceResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceResponse(
    status: json['Status'] as String,
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
