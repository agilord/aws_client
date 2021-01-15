// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbpV10x _$AbpV10xFromJson(Map<String, dynamic> json) {
  return AbpV10x(
    devAddr: json['DevAddr'] as String,
    sessionKeys: json['SessionKeys'] == null
        ? null
        : SessionKeysAbpV10x.fromJson(
            json['SessionKeys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AbpV10xToJson(AbpV10x instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DevAddr', instance.devAddr);
  writeNotNull('SessionKeys', instance.sessionKeys?.toJson());
  return val;
}

AbpV11 _$AbpV11FromJson(Map<String, dynamic> json) {
  return AbpV11(
    devAddr: json['DevAddr'] as String,
    sessionKeys: json['SessionKeys'] == null
        ? null
        : SessionKeysAbpV11.fromJson(
            json['SessionKeys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AbpV11ToJson(AbpV11 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DevAddr', instance.devAddr);
  writeNotNull('SessionKeys', instance.sessionKeys?.toJson());
  return val;
}

AssociateAwsAccountWithPartnerAccountResponse
    _$AssociateAwsAccountWithPartnerAccountResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateAwsAccountWithPartnerAccountResponse(
    sidewalk: json['Sidewalk'] == null
        ? null
        : SidewalkAccountInfo.fromJson(
            json['Sidewalk'] as Map<String, dynamic>),
  );
}

AssociateWirelessDeviceWithThingResponse
    _$AssociateWirelessDeviceWithThingResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWirelessDeviceWithThingResponse();
}

AssociateWirelessGatewayWithCertificateResponse
    _$AssociateWirelessGatewayWithCertificateResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWirelessGatewayWithCertificateResponse(
    iotCertificateId: json['IotCertificateId'] as String,
  );
}

AssociateWirelessGatewayWithThingResponse
    _$AssociateWirelessGatewayWithThingResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWirelessGatewayWithThingResponse();
}

CreateDestinationResponse _$CreateDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDestinationResponse(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
  );
}

CreateDeviceProfileResponse _$CreateDeviceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeviceProfileResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

CreateServiceProfileResponse _$CreateServiceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateServiceProfileResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

CreateWirelessDeviceResponse _$CreateWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWirelessDeviceResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

CreateWirelessGatewayResponse _$CreateWirelessGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWirelessGatewayResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
  );
}

CreateWirelessGatewayTaskDefinitionResponse
    _$CreateWirelessGatewayTaskDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateWirelessGatewayTaskDefinitionResponse(
    id: json['Id'] as String,
  );
}

CreateWirelessGatewayTaskResponse _$CreateWirelessGatewayTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWirelessGatewayTaskResponse(
    status: _$enumDecodeNullable(
        _$WirelessGatewayTaskStatusEnumMap, json['Status']),
    wirelessGatewayTaskDefinitionId:
        json['WirelessGatewayTaskDefinitionId'] as String,
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

const _$WirelessGatewayTaskStatusEnumMap = {
  WirelessGatewayTaskStatus.pending: 'PENDING',
  WirelessGatewayTaskStatus.inProgress: 'IN_PROGRESS',
  WirelessGatewayTaskStatus.firstRetry: 'FIRST_RETRY',
  WirelessGatewayTaskStatus.secondRetry: 'SECOND_RETRY',
  WirelessGatewayTaskStatus.completed: 'COMPLETED',
  WirelessGatewayTaskStatus.failed: 'FAILED',
};

DeleteDestinationResponse _$DeleteDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDestinationResponse();
}

DeleteDeviceProfileResponse _$DeleteDeviceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDeviceProfileResponse();
}

DeleteServiceProfileResponse _$DeleteServiceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteServiceProfileResponse();
}

DeleteWirelessDeviceResponse _$DeleteWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWirelessDeviceResponse();
}

DeleteWirelessGatewayResponse _$DeleteWirelessGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWirelessGatewayResponse();
}

DeleteWirelessGatewayTaskDefinitionResponse
    _$DeleteWirelessGatewayTaskDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteWirelessGatewayTaskDefinitionResponse();
}

DeleteWirelessGatewayTaskResponse _$DeleteWirelessGatewayTaskResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWirelessGatewayTaskResponse();
}

Destinations _$DestinationsFromJson(Map<String, dynamic> json) {
  return Destinations(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    expression: json['Expression'] as String,
    expressionType:
        _$enumDecodeNullable(_$ExpressionTypeEnumMap, json['ExpressionType']),
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

const _$ExpressionTypeEnumMap = {
  ExpressionType.ruleName: 'RuleName',
};

DeviceProfile _$DeviceProfileFromJson(Map<String, dynamic> json) {
  return DeviceProfile(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

DisassociateAwsAccountFromPartnerAccountResponse
    _$DisassociateAwsAccountFromPartnerAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateAwsAccountFromPartnerAccountResponse();
}

DisassociateWirelessDeviceFromThingResponse
    _$DisassociateWirelessDeviceFromThingResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWirelessDeviceFromThingResponse();
}

DisassociateWirelessGatewayFromCertificateResponse
    _$DisassociateWirelessGatewayFromCertificateResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWirelessGatewayFromCertificateResponse();
}

DisassociateWirelessGatewayFromThingResponse
    _$DisassociateWirelessGatewayFromThingResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWirelessGatewayFromThingResponse();
}

GetDestinationResponse _$GetDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return GetDestinationResponse(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    expression: json['Expression'] as String,
    expressionType:
        _$enumDecodeNullable(_$ExpressionTypeEnumMap, json['ExpressionType']),
    name: json['Name'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

GetDeviceProfileResponse _$GetDeviceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeviceProfileResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANDeviceProfile.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

GetPartnerAccountResponse _$GetPartnerAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetPartnerAccountResponse(
    accountLinked: json['AccountLinked'] as bool,
    sidewalk: json['Sidewalk'] == null
        ? null
        : SidewalkAccountInfoWithFingerprint.fromJson(
            json['Sidewalk'] as Map<String, dynamic>),
  );
}

GetServiceEndpointResponse _$GetServiceEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return GetServiceEndpointResponse(
    serverTrust: json['ServerTrust'] as String,
    serviceEndpoint: json['ServiceEndpoint'] as String,
    serviceType: _$enumDecodeNullable(
        _$WirelessGatewayServiceTypeEnumMap, json['ServiceType']),
  );
}

const _$WirelessGatewayServiceTypeEnumMap = {
  WirelessGatewayServiceType.cups: 'CUPS',
  WirelessGatewayServiceType.lns: 'LNS',
};

GetServiceProfileResponse _$GetServiceProfileResponseFromJson(
    Map<String, dynamic> json) {
  return GetServiceProfileResponse(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANGetServiceProfileInfo.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

GetWirelessDeviceResponse _$GetWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return GetWirelessDeviceResponse(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    destinationName: json['DestinationName'] as String,
    id: json['Id'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANDevice.fromJson(json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
    thingArn: json['ThingArn'] as String,
    thingName: json['ThingName'] as String,
    type: _$enumDecodeNullable(_$WirelessDeviceTypeEnumMap, json['Type']),
  );
}

const _$WirelessDeviceTypeEnumMap = {
  WirelessDeviceType.sidewalk: 'Sidewalk',
  WirelessDeviceType.loRaWAN: 'LoRaWAN',
};

GetWirelessDeviceStatisticsResponse
    _$GetWirelessDeviceStatisticsResponseFromJson(Map<String, dynamic> json) {
  return GetWirelessDeviceStatisticsResponse(
    lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANDeviceMetadata.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
    wirelessDeviceId: json['WirelessDeviceId'] as String,
  );
}

GetWirelessGatewayCertificateResponse
    _$GetWirelessGatewayCertificateResponseFromJson(Map<String, dynamic> json) {
  return GetWirelessGatewayCertificateResponse(
    iotCertificateId: json['IotCertificateId'] as String,
  );
}

GetWirelessGatewayFirmwareInformationResponse
    _$GetWirelessGatewayFirmwareInformationResponseFromJson(
        Map<String, dynamic> json) {
  return GetWirelessGatewayFirmwareInformationResponse(
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANGatewayCurrentVersion.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
  );
}

GetWirelessGatewayResponse _$GetWirelessGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return GetWirelessGatewayResponse(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANGateway.fromJson(json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
    thingArn: json['ThingArn'] as String,
    thingName: json['ThingName'] as String,
  );
}

GetWirelessGatewayStatisticsResponse
    _$GetWirelessGatewayStatisticsResponseFromJson(Map<String, dynamic> json) {
  return GetWirelessGatewayStatisticsResponse(
    lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String,
    wirelessGatewayId: json['WirelessGatewayId'] as String,
  );
}

GetWirelessGatewayTaskDefinitionResponse
    _$GetWirelessGatewayTaskDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return GetWirelessGatewayTaskDefinitionResponse(
    autoCreateTasks: json['AutoCreateTasks'] as bool,
    name: json['Name'] as String,
    update: json['Update'] == null
        ? null
        : UpdateWirelessGatewayTaskCreate.fromJson(
            json['Update'] as Map<String, dynamic>),
  );
}

GetWirelessGatewayTaskResponse _$GetWirelessGatewayTaskResponseFromJson(
    Map<String, dynamic> json) {
  return GetWirelessGatewayTaskResponse(
    lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String,
    status: _$enumDecodeNullable(
        _$WirelessGatewayTaskStatusEnumMap, json['Status']),
    taskCreatedAt: json['TaskCreatedAt'] as String,
    wirelessGatewayId: json['WirelessGatewayId'] as String,
    wirelessGatewayTaskDefinitionId:
        json['WirelessGatewayTaskDefinitionId'] as String,
  );
}

ListDestinationsResponse _$ListDestinationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDestinationsResponse(
    destinationList: (json['DestinationList'] as List)
        ?.map((e) =>
            e == null ? null : Destinations.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDeviceProfilesResponse _$ListDeviceProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeviceProfilesResponse(
    deviceProfileList: (json['DeviceProfileList'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPartnerAccountsResponse _$ListPartnerAccountsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPartnerAccountsResponse(
    nextToken: json['NextToken'] as String,
    sidewalk: (json['Sidewalk'] as List)
        ?.map((e) => e == null
            ? null
            : SidewalkAccountInfoWithFingerprint.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListServiceProfilesResponse _$ListServiceProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListServiceProfilesResponse(
    nextToken: json['NextToken'] as String,
    serviceProfileList: (json['ServiceProfileList'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWirelessDevicesResponse _$ListWirelessDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return ListWirelessDevicesResponse(
    nextToken: json['NextToken'] as String,
    wirelessDeviceList: (json['WirelessDeviceList'] as List)
        ?.map((e) => e == null
            ? null
            : WirelessDeviceStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWirelessGatewayTaskDefinitionsResponse
    _$ListWirelessGatewayTaskDefinitionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListWirelessGatewayTaskDefinitionsResponse(
    nextToken: json['NextToken'] as String,
    taskDefinitions: (json['TaskDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateWirelessGatewayTaskEntry.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWirelessGatewaysResponse _$ListWirelessGatewaysResponseFromJson(
    Map<String, dynamic> json) {
  return ListWirelessGatewaysResponse(
    nextToken: json['NextToken'] as String,
    wirelessGatewayList: (json['WirelessGatewayList'] as List)
        ?.map((e) => e == null
            ? null
            : WirelessGatewayStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoRaWANDevice _$LoRaWANDeviceFromJson(Map<String, dynamic> json) {
  return LoRaWANDevice(
    abpV1_0X: json['AbpV1_0_x'] == null
        ? null
        : AbpV10x.fromJson(json['AbpV1_0_x'] as Map<String, dynamic>),
    abpV1_1: json['AbpV1_1'] == null
        ? null
        : AbpV11.fromJson(json['AbpV1_1'] as Map<String, dynamic>),
    devEui: json['DevEui'] as String,
    deviceProfileId: json['DeviceProfileId'] as String,
    otaaV1_0X: json['OtaaV1_0_x'] == null
        ? null
        : OtaaV10x.fromJson(json['OtaaV1_0_x'] as Map<String, dynamic>),
    otaaV1_1: json['OtaaV1_1'] == null
        ? null
        : OtaaV11.fromJson(json['OtaaV1_1'] as Map<String, dynamic>),
    serviceProfileId: json['ServiceProfileId'] as String,
  );
}

Map<String, dynamic> _$LoRaWANDeviceToJson(LoRaWANDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AbpV1_0_x', instance.abpV1_0X?.toJson());
  writeNotNull('AbpV1_1', instance.abpV1_1?.toJson());
  writeNotNull('DevEui', instance.devEui);
  writeNotNull('DeviceProfileId', instance.deviceProfileId);
  writeNotNull('OtaaV1_0_x', instance.otaaV1_0X?.toJson());
  writeNotNull('OtaaV1_1', instance.otaaV1_1?.toJson());
  writeNotNull('ServiceProfileId', instance.serviceProfileId);
  return val;
}

LoRaWANDeviceMetadata _$LoRaWANDeviceMetadataFromJson(
    Map<String, dynamic> json) {
  return LoRaWANDeviceMetadata(
    dataRate: json['DataRate'] as int,
    devEui: json['DevEui'] as String,
    fPort: json['FPort'] as int,
    frequency: json['Frequency'] as int,
    gateways: (json['Gateways'] as List)
        ?.map((e) => e == null
            ? null
            : LoRaWANGatewayMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['Timestamp'] as String,
  );
}

LoRaWANDeviceProfile _$LoRaWANDeviceProfileFromJson(Map<String, dynamic> json) {
  return LoRaWANDeviceProfile(
    classBTimeout: json['ClassBTimeout'] as int,
    classCTimeout: json['ClassCTimeout'] as int,
    factoryPresetFreqsList: (json['FactoryPresetFreqsList'] as List)
        ?.map((e) => e as int)
        ?.toList(),
    macVersion: json['MacVersion'] as String,
    maxDutyCycle: json['MaxDutyCycle'] as int,
    maxEirp: json['MaxEirp'] as int,
    pingSlotDr: json['PingSlotDr'] as int,
    pingSlotFreq: json['PingSlotFreq'] as int,
    pingSlotPeriod: json['PingSlotPeriod'] as int,
    regParamsRevision: json['RegParamsRevision'] as String,
    rfRegion: json['RfRegion'] as String,
    rxDataRate2: json['RxDataRate2'] as int,
    rxDelay1: json['RxDelay1'] as int,
    rxDrOffset1: json['RxDrOffset1'] as int,
    rxFreq2: json['RxFreq2'] as int,
    supports32BitFCnt: json['Supports32BitFCnt'] as bool,
    supportsClassB: json['SupportsClassB'] as bool,
    supportsClassC: json['SupportsClassC'] as bool,
    supportsJoin: json['SupportsJoin'] as bool,
  );
}

Map<String, dynamic> _$LoRaWANDeviceProfileToJson(
    LoRaWANDeviceProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClassBTimeout', instance.classBTimeout);
  writeNotNull('ClassCTimeout', instance.classCTimeout);
  writeNotNull('FactoryPresetFreqsList', instance.factoryPresetFreqsList);
  writeNotNull('MacVersion', instance.macVersion);
  writeNotNull('MaxDutyCycle', instance.maxDutyCycle);
  writeNotNull('MaxEirp', instance.maxEirp);
  writeNotNull('PingSlotDr', instance.pingSlotDr);
  writeNotNull('PingSlotFreq', instance.pingSlotFreq);
  writeNotNull('PingSlotPeriod', instance.pingSlotPeriod);
  writeNotNull('RegParamsRevision', instance.regParamsRevision);
  writeNotNull('RfRegion', instance.rfRegion);
  writeNotNull('RxDataRate2', instance.rxDataRate2);
  writeNotNull('RxDelay1', instance.rxDelay1);
  writeNotNull('RxDrOffset1', instance.rxDrOffset1);
  writeNotNull('RxFreq2', instance.rxFreq2);
  writeNotNull('Supports32BitFCnt', instance.supports32BitFCnt);
  writeNotNull('SupportsClassB', instance.supportsClassB);
  writeNotNull('SupportsClassC', instance.supportsClassC);
  writeNotNull('SupportsJoin', instance.supportsJoin);
  return val;
}

LoRaWANGateway _$LoRaWANGatewayFromJson(Map<String, dynamic> json) {
  return LoRaWANGateway(
    gatewayEui: json['GatewayEui'] as String,
    rfRegion: json['RfRegion'] as String,
  );
}

Map<String, dynamic> _$LoRaWANGatewayToJson(LoRaWANGateway instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GatewayEui', instance.gatewayEui);
  writeNotNull('RfRegion', instance.rfRegion);
  return val;
}

LoRaWANGatewayCurrentVersion _$LoRaWANGatewayCurrentVersionFromJson(
    Map<String, dynamic> json) {
  return LoRaWANGatewayCurrentVersion(
    currentVersion: json['CurrentVersion'] == null
        ? null
        : LoRaWANGatewayVersion.fromJson(
            json['CurrentVersion'] as Map<String, dynamic>),
  );
}

LoRaWANGatewayMetadata _$LoRaWANGatewayMetadataFromJson(
    Map<String, dynamic> json) {
  return LoRaWANGatewayMetadata(
    gatewayEui: json['GatewayEui'] as String,
    rssi: (json['Rssi'] as num)?.toDouble(),
    snr: (json['Snr'] as num)?.toDouble(),
  );
}

LoRaWANGatewayVersion _$LoRaWANGatewayVersionFromJson(
    Map<String, dynamic> json) {
  return LoRaWANGatewayVersion(
    model: json['Model'] as String,
    packageVersion: json['PackageVersion'] as String,
    station: json['Station'] as String,
  );
}

Map<String, dynamic> _$LoRaWANGatewayVersionToJson(
    LoRaWANGatewayVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Model', instance.model);
  writeNotNull('PackageVersion', instance.packageVersion);
  writeNotNull('Station', instance.station);
  return val;
}

LoRaWANGetServiceProfileInfo _$LoRaWANGetServiceProfileInfoFromJson(
    Map<String, dynamic> json) {
  return LoRaWANGetServiceProfileInfo(
    addGwMetadata: json['AddGwMetadata'] as bool,
    channelMask: json['ChannelMask'] as String,
    devStatusReqFreq: json['DevStatusReqFreq'] as int,
    dlBucketSize: json['DlBucketSize'] as int,
    dlRate: json['DlRate'] as int,
    dlRatePolicy: json['DlRatePolicy'] as String,
    drMax: json['DrMax'] as int,
    drMin: json['DrMin'] as int,
    hrAllowed: json['HrAllowed'] as bool,
    minGwDiversity: json['MinGwDiversity'] as int,
    nwkGeoLoc: json['NwkGeoLoc'] as bool,
    prAllowed: json['PrAllowed'] as bool,
    raAllowed: json['RaAllowed'] as bool,
    reportDevStatusBattery: json['ReportDevStatusBattery'] as bool,
    reportDevStatusMargin: json['ReportDevStatusMargin'] as bool,
    targetPer: json['TargetPer'] as int,
    ulBucketSize: json['UlBucketSize'] as int,
    ulRate: json['UlRate'] as int,
    ulRatePolicy: json['UlRatePolicy'] as String,
  );
}

LoRaWANListDevice _$LoRaWANListDeviceFromJson(Map<String, dynamic> json) {
  return LoRaWANListDevice(
    devEui: json['DevEui'] as String,
  );
}

Map<String, dynamic> _$LoRaWANSendDataToDeviceToJson(
    LoRaWANSendDataToDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FPort', instance.fPort);
  return val;
}

Map<String, dynamic> _$LoRaWANServiceProfileToJson(
    LoRaWANServiceProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddGwMetadata', instance.addGwMetadata);
  return val;
}

Map<String, dynamic> _$LoRaWANUpdateDeviceToJson(LoRaWANUpdateDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceProfileId', instance.deviceProfileId);
  writeNotNull('ServiceProfileId', instance.serviceProfileId);
  return val;
}

LoRaWANUpdateGatewayTaskCreate _$LoRaWANUpdateGatewayTaskCreateFromJson(
    Map<String, dynamic> json) {
  return LoRaWANUpdateGatewayTaskCreate(
    currentVersion: json['CurrentVersion'] == null
        ? null
        : LoRaWANGatewayVersion.fromJson(
            json['CurrentVersion'] as Map<String, dynamic>),
    sigKeyCrc: json['SigKeyCrc'] as int,
    updateSignature: json['UpdateSignature'] as String,
    updateVersion: json['UpdateVersion'] == null
        ? null
        : LoRaWANGatewayVersion.fromJson(
            json['UpdateVersion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoRaWANUpdateGatewayTaskCreateToJson(
    LoRaWANUpdateGatewayTaskCreate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CurrentVersion', instance.currentVersion?.toJson());
  writeNotNull('SigKeyCrc', instance.sigKeyCrc);
  writeNotNull('UpdateSignature', instance.updateSignature);
  writeNotNull('UpdateVersion', instance.updateVersion?.toJson());
  return val;
}

LoRaWANUpdateGatewayTaskEntry _$LoRaWANUpdateGatewayTaskEntryFromJson(
    Map<String, dynamic> json) {
  return LoRaWANUpdateGatewayTaskEntry(
    currentVersion: json['CurrentVersion'] == null
        ? null
        : LoRaWANGatewayVersion.fromJson(
            json['CurrentVersion'] as Map<String, dynamic>),
    updateVersion: json['UpdateVersion'] == null
        ? null
        : LoRaWANGatewayVersion.fromJson(
            json['UpdateVersion'] as Map<String, dynamic>),
  );
}

OtaaV10x _$OtaaV10xFromJson(Map<String, dynamic> json) {
  return OtaaV10x(
    appEui: json['AppEui'] as String,
    appKey: json['AppKey'] as String,
  );
}

Map<String, dynamic> _$OtaaV10xToJson(OtaaV10x instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppEui', instance.appEui);
  writeNotNull('AppKey', instance.appKey);
  return val;
}

OtaaV11 _$OtaaV11FromJson(Map<String, dynamic> json) {
  return OtaaV11(
    appKey: json['AppKey'] as String,
    joinEui: json['JoinEui'] as String,
    nwkKey: json['NwkKey'] as String,
  );
}

Map<String, dynamic> _$OtaaV11ToJson(OtaaV11 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppKey', instance.appKey);
  writeNotNull('JoinEui', instance.joinEui);
  writeNotNull('NwkKey', instance.nwkKey);
  return val;
}

SendDataToWirelessDeviceResponse _$SendDataToWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return SendDataToWirelessDeviceResponse(
    messageId: json['MessageId'] as String,
  );
}

ServiceProfile _$ServiceProfileFromJson(Map<String, dynamic> json) {
  return ServiceProfile(
    arn: json['Arn'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

SessionKeysAbpV10x _$SessionKeysAbpV10xFromJson(Map<String, dynamic> json) {
  return SessionKeysAbpV10x(
    appSKey: json['AppSKey'] as String,
    nwkSKey: json['NwkSKey'] as String,
  );
}

Map<String, dynamic> _$SessionKeysAbpV10xToJson(SessionKeysAbpV10x instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppSKey', instance.appSKey);
  writeNotNull('NwkSKey', instance.nwkSKey);
  return val;
}

SessionKeysAbpV11 _$SessionKeysAbpV11FromJson(Map<String, dynamic> json) {
  return SessionKeysAbpV11(
    appSKey: json['AppSKey'] as String,
    fNwkSIntKey: json['FNwkSIntKey'] as String,
    nwkSEncKey: json['NwkSEncKey'] as String,
    sNwkSIntKey: json['SNwkSIntKey'] as String,
  );
}

Map<String, dynamic> _$SessionKeysAbpV11ToJson(SessionKeysAbpV11 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppSKey', instance.appSKey);
  writeNotNull('FNwkSIntKey', instance.fNwkSIntKey);
  writeNotNull('NwkSEncKey', instance.nwkSEncKey);
  writeNotNull('SNwkSIntKey', instance.sNwkSIntKey);
  return val;
}

SidewalkAccountInfo _$SidewalkAccountInfoFromJson(Map<String, dynamic> json) {
  return SidewalkAccountInfo(
    amazonId: json['AmazonId'] as String,
    appServerPrivateKey: json['AppServerPrivateKey'] as String,
  );
}

Map<String, dynamic> _$SidewalkAccountInfoToJson(SidewalkAccountInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AmazonId', instance.amazonId);
  writeNotNull('AppServerPrivateKey', instance.appServerPrivateKey);
  return val;
}

SidewalkAccountInfoWithFingerprint _$SidewalkAccountInfoWithFingerprintFromJson(
    Map<String, dynamic> json) {
  return SidewalkAccountInfoWithFingerprint(
    amazonId: json['AmazonId'] as String,
    fingerprint: json['Fingerprint'] as String,
  );
}

SidewalkListDevice _$SidewalkListDeviceFromJson(Map<String, dynamic> json) {
  return SidewalkListDevice(
    amazonId: json['AmazonId'] as String,
  );
}

Map<String, dynamic> _$SidewalkSendDataToDeviceToJson(
    SidewalkSendDataToDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Seq', instance.seq);
  return val;
}

Map<String, dynamic> _$SidewalkUpdateAccountToJson(
    SidewalkUpdateAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppServerPrivateKey', instance.appServerPrivateKey);
  return val;
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TestWirelessDeviceResponse _$TestWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return TestWirelessDeviceResponse(
    result: json['Result'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDestinationResponse _$UpdateDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDestinationResponse();
}

UpdatePartnerAccountResponse _$UpdatePartnerAccountResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePartnerAccountResponse();
}

UpdateWirelessDeviceResponse _$UpdateWirelessDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWirelessDeviceResponse();
}

UpdateWirelessGatewayResponse _$UpdateWirelessGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWirelessGatewayResponse();
}

UpdateWirelessGatewayTaskCreate _$UpdateWirelessGatewayTaskCreateFromJson(
    Map<String, dynamic> json) {
  return UpdateWirelessGatewayTaskCreate(
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANUpdateGatewayTaskCreate.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
    updateDataRole: json['UpdateDataRole'] as String,
    updateDataSource: json['UpdateDataSource'] as String,
  );
}

Map<String, dynamic> _$UpdateWirelessGatewayTaskCreateToJson(
    UpdateWirelessGatewayTaskCreate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LoRaWAN', instance.loRaWAN?.toJson());
  writeNotNull('UpdateDataRole', instance.updateDataRole);
  writeNotNull('UpdateDataSource', instance.updateDataSource);
  return val;
}

UpdateWirelessGatewayTaskEntry _$UpdateWirelessGatewayTaskEntryFromJson(
    Map<String, dynamic> json) {
  return UpdateWirelessGatewayTaskEntry(
    id: json['Id'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANUpdateGatewayTaskEntry.fromJson(
            json['LoRaWAN'] as Map<String, dynamic>),
  );
}

WirelessDeviceStatistics _$WirelessDeviceStatisticsFromJson(
    Map<String, dynamic> json) {
  return WirelessDeviceStatistics(
    arn: json['Arn'] as String,
    destinationName: json['DestinationName'] as String,
    id: json['Id'] as String,
    lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANListDevice.fromJson(json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
    sidewalk: json['Sidewalk'] == null
        ? null
        : SidewalkListDevice.fromJson(json['Sidewalk'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$WirelessDeviceTypeEnumMap, json['Type']),
  );
}

WirelessGatewayStatistics _$WirelessGatewayStatisticsFromJson(
    Map<String, dynamic> json) {
  return WirelessGatewayStatistics(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String,
    loRaWAN: json['LoRaWAN'] == null
        ? null
        : LoRaWANGateway.fromJson(json['LoRaWAN'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$WirelessMetadataToJson(WirelessMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LoRaWAN', instance.loRaWAN?.toJson());
  writeNotNull('Sidewalk', instance.sidewalk?.toJson());
  return val;
}
