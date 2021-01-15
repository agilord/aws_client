// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-05-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AntennaDemodDecodeDetails _$AntennaDemodDecodeDetailsFromJson(
    Map<String, dynamic> json) {
  return AntennaDemodDecodeDetails(
    outputNode: json['outputNode'] as String,
  );
}

AntennaDownlinkConfig _$AntennaDownlinkConfigFromJson(
    Map<String, dynamic> json) {
  return AntennaDownlinkConfig(
    spectrumConfig: json['spectrumConfig'] == null
        ? null
        : SpectrumConfig.fromJson(
            json['spectrumConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AntennaDownlinkConfigToJson(
    AntennaDownlinkConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spectrumConfig', instance.spectrumConfig?.toJson());
  return val;
}

AntennaDownlinkDemodDecodeConfig _$AntennaDownlinkDemodDecodeConfigFromJson(
    Map<String, dynamic> json) {
  return AntennaDownlinkDemodDecodeConfig(
    decodeConfig: json['decodeConfig'] == null
        ? null
        : DecodeConfig.fromJson(json['decodeConfig'] as Map<String, dynamic>),
    demodulationConfig: json['demodulationConfig'] == null
        ? null
        : DemodulationConfig.fromJson(
            json['demodulationConfig'] as Map<String, dynamic>),
    spectrumConfig: json['spectrumConfig'] == null
        ? null
        : SpectrumConfig.fromJson(
            json['spectrumConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AntennaDownlinkDemodDecodeConfigToJson(
    AntennaDownlinkDemodDecodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('decodeConfig', instance.decodeConfig?.toJson());
  writeNotNull('demodulationConfig', instance.demodulationConfig?.toJson());
  writeNotNull('spectrumConfig', instance.spectrumConfig?.toJson());
  return val;
}

AntennaUplinkConfig _$AntennaUplinkConfigFromJson(Map<String, dynamic> json) {
  return AntennaUplinkConfig(
    spectrumConfig: json['spectrumConfig'] == null
        ? null
        : UplinkSpectrumConfig.fromJson(
            json['spectrumConfig'] as Map<String, dynamic>),
    targetEirp: json['targetEirp'] == null
        ? null
        : Eirp.fromJson(json['targetEirp'] as Map<String, dynamic>),
    transmitDisabled: json['transmitDisabled'] as bool,
  );
}

Map<String, dynamic> _$AntennaUplinkConfigToJson(AntennaUplinkConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('spectrumConfig', instance.spectrumConfig?.toJson());
  writeNotNull('targetEirp', instance.targetEirp?.toJson());
  writeNotNull('transmitDisabled', instance.transmitDisabled);
  return val;
}

ConfigDetails _$ConfigDetailsFromJson(Map<String, dynamic> json) {
  return ConfigDetails(
    antennaDemodDecodeDetails: json['antennaDemodDecodeDetails'] == null
        ? null
        : AntennaDemodDecodeDetails.fromJson(
            json['antennaDemodDecodeDetails'] as Map<String, dynamic>),
    endpointDetails: json['endpointDetails'] == null
        ? null
        : EndpointDetails.fromJson(
            json['endpointDetails'] as Map<String, dynamic>),
  );
}

ConfigIdResponse _$ConfigIdResponseFromJson(Map<String, dynamic> json) {
  return ConfigIdResponse(
    configArn: json['configArn'] as String,
    configId: json['configId'] as String,
    configType:
        _$enumDecodeNullable(_$ConfigCapabilityTypeEnumMap, json['configType']),
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

const _$ConfigCapabilityTypeEnumMap = {
  ConfigCapabilityType.antennaDownlink: 'antenna-downlink',
  ConfigCapabilityType.antennaDownlinkDemodDecode:
      'antenna-downlink-demod-decode',
  ConfigCapabilityType.antennaUplink: 'antenna-uplink',
  ConfigCapabilityType.dataflowEndpoint: 'dataflow-endpoint',
  ConfigCapabilityType.tracking: 'tracking',
  ConfigCapabilityType.uplinkEcho: 'uplink-echo',
};

ConfigListItem _$ConfigListItemFromJson(Map<String, dynamic> json) {
  return ConfigListItem(
    configArn: json['configArn'] as String,
    configId: json['configId'] as String,
    configType:
        _$enumDecodeNullable(_$ConfigCapabilityTypeEnumMap, json['configType']),
    name: json['name'] as String,
  );
}

ConfigTypeData _$ConfigTypeDataFromJson(Map<String, dynamic> json) {
  return ConfigTypeData(
    antennaDownlinkConfig: json['antennaDownlinkConfig'] == null
        ? null
        : AntennaDownlinkConfig.fromJson(
            json['antennaDownlinkConfig'] as Map<String, dynamic>),
    antennaDownlinkDemodDecodeConfig:
        json['antennaDownlinkDemodDecodeConfig'] == null
            ? null
            : AntennaDownlinkDemodDecodeConfig.fromJson(
                json['antennaDownlinkDemodDecodeConfig']
                    as Map<String, dynamic>),
    antennaUplinkConfig: json['antennaUplinkConfig'] == null
        ? null
        : AntennaUplinkConfig.fromJson(
            json['antennaUplinkConfig'] as Map<String, dynamic>),
    dataflowEndpointConfig: json['dataflowEndpointConfig'] == null
        ? null
        : DataflowEndpointConfig.fromJson(
            json['dataflowEndpointConfig'] as Map<String, dynamic>),
    trackingConfig: json['trackingConfig'] == null
        ? null
        : TrackingConfig.fromJson(
            json['trackingConfig'] as Map<String, dynamic>),
    uplinkEchoConfig: json['uplinkEchoConfig'] == null
        ? null
        : UplinkEchoConfig.fromJson(
            json['uplinkEchoConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfigTypeDataToJson(ConfigTypeData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'antennaDownlinkConfig', instance.antennaDownlinkConfig?.toJson());
  writeNotNull('antennaDownlinkDemodDecodeConfig',
      instance.antennaDownlinkDemodDecodeConfig?.toJson());
  writeNotNull('antennaUplinkConfig', instance.antennaUplinkConfig?.toJson());
  writeNotNull(
      'dataflowEndpointConfig', instance.dataflowEndpointConfig?.toJson());
  writeNotNull('trackingConfig', instance.trackingConfig?.toJson());
  writeNotNull('uplinkEchoConfig', instance.uplinkEchoConfig?.toJson());
  return val;
}

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return ContactData(
    contactId: json['contactId'] as String,
    contactStatus:
        _$enumDecodeNullable(_$ContactStatusEnumMap, json['contactStatus']),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    errorMessage: json['errorMessage'] as String,
    groundStation: json['groundStation'] as String,
    maximumElevation: json['maximumElevation'] == null
        ? null
        : Elevation.fromJson(json['maximumElevation'] as Map<String, dynamic>),
    missionProfileArn: json['missionProfileArn'] as String,
    postPassEndTime:
        const UnixDateTimeConverter().fromJson(json['postPassEndTime']),
    prePassStartTime:
        const UnixDateTimeConverter().fromJson(json['prePassStartTime']),
    region: json['region'] as String,
    satelliteArn: json['satelliteArn'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$ContactStatusEnumMap = {
  ContactStatus.available: 'AVAILABLE',
  ContactStatus.awsCancelled: 'AWS_CANCELLED',
  ContactStatus.awsFailed: 'AWS_FAILED',
  ContactStatus.cancelled: 'CANCELLED',
  ContactStatus.cancelling: 'CANCELLING',
  ContactStatus.completed: 'COMPLETED',
  ContactStatus.failed: 'FAILED',
  ContactStatus.failedToSchedule: 'FAILED_TO_SCHEDULE',
  ContactStatus.pass: 'PASS',
  ContactStatus.postpass: 'POSTPASS',
  ContactStatus.prepass: 'PREPASS',
  ContactStatus.scheduled: 'SCHEDULED',
  ContactStatus.scheduling: 'SCHEDULING',
};

ContactIdResponse _$ContactIdResponseFromJson(Map<String, dynamic> json) {
  return ContactIdResponse(
    contactId: json['contactId'] as String,
  );
}

DataflowDetail _$DataflowDetailFromJson(Map<String, dynamic> json) {
  return DataflowDetail(
    destination: json['destination'] == null
        ? null
        : Destination.fromJson(json['destination'] as Map<String, dynamic>),
    errorMessage: json['errorMessage'] as String,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

DataflowEndpoint _$DataflowEndpointFromJson(Map<String, dynamic> json) {
  return DataflowEndpoint(
    address: json['address'] == null
        ? null
        : SocketAddress.fromJson(json['address'] as Map<String, dynamic>),
    mtu: json['mtu'] as int,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$EndpointStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$DataflowEndpointToJson(DataflowEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address?.toJson());
  writeNotNull('mtu', instance.mtu);
  writeNotNull('name', instance.name);
  writeNotNull('status', _$EndpointStatusEnumMap[instance.status]);
  return val;
}

const _$EndpointStatusEnumMap = {
  EndpointStatus.created: 'created',
  EndpointStatus.creating: 'creating',
  EndpointStatus.deleted: 'deleted',
  EndpointStatus.deleting: 'deleting',
  EndpointStatus.failed: 'failed',
};

DataflowEndpointConfig _$DataflowEndpointConfigFromJson(
    Map<String, dynamic> json) {
  return DataflowEndpointConfig(
    dataflowEndpointName: json['dataflowEndpointName'] as String,
    dataflowEndpointRegion: json['dataflowEndpointRegion'] as String,
  );
}

Map<String, dynamic> _$DataflowEndpointConfigToJson(
    DataflowEndpointConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataflowEndpointName', instance.dataflowEndpointName);
  writeNotNull('dataflowEndpointRegion', instance.dataflowEndpointRegion);
  return val;
}

DataflowEndpointGroupIdResponse _$DataflowEndpointGroupIdResponseFromJson(
    Map<String, dynamic> json) {
  return DataflowEndpointGroupIdResponse(
    dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String,
  );
}

DataflowEndpointListItem _$DataflowEndpointListItemFromJson(
    Map<String, dynamic> json) {
  return DataflowEndpointListItem(
    dataflowEndpointGroupArn: json['dataflowEndpointGroupArn'] as String,
    dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String,
  );
}

DecodeConfig _$DecodeConfigFromJson(Map<String, dynamic> json) {
  return DecodeConfig(
    unvalidatedJSON: json['unvalidatedJSON'] as String,
  );
}

Map<String, dynamic> _$DecodeConfigToJson(DecodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unvalidatedJSON', instance.unvalidatedJSON);
  return val;
}

DemodulationConfig _$DemodulationConfigFromJson(Map<String, dynamic> json) {
  return DemodulationConfig(
    unvalidatedJSON: json['unvalidatedJSON'] as String,
  );
}

Map<String, dynamic> _$DemodulationConfigToJson(DemodulationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unvalidatedJSON', instance.unvalidatedJSON);
  return val;
}

DescribeContactResponse _$DescribeContactResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeContactResponse(
    contactId: json['contactId'] as String,
    contactStatus:
        _$enumDecodeNullable(_$ContactStatusEnumMap, json['contactStatus']),
    dataflowList: (json['dataflowList'] as List)
        ?.map((e) => e == null
            ? null
            : DataflowDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    errorMessage: json['errorMessage'] as String,
    groundStation: json['groundStation'] as String,
    maximumElevation: json['maximumElevation'] == null
        ? null
        : Elevation.fromJson(json['maximumElevation'] as Map<String, dynamic>),
    missionProfileArn: json['missionProfileArn'] as String,
    postPassEndTime:
        const UnixDateTimeConverter().fromJson(json['postPassEndTime']),
    prePassStartTime:
        const UnixDateTimeConverter().fromJson(json['prePassStartTime']),
    region: json['region'] as String,
    satelliteArn: json['satelliteArn'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return Destination(
    configDetails: json['configDetails'] == null
        ? null
        : ConfigDetails.fromJson(json['configDetails'] as Map<String, dynamic>),
    configId: json['configId'] as String,
    configType:
        _$enumDecodeNullable(_$ConfigCapabilityTypeEnumMap, json['configType']),
    dataflowDestinationRegion: json['dataflowDestinationRegion'] as String,
  );
}

Eirp _$EirpFromJson(Map<String, dynamic> json) {
  return Eirp(
    units: _$enumDecodeNullable(_$EirpUnitsEnumMap, json['units']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EirpToJson(Eirp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('units', _$EirpUnitsEnumMap[instance.units]);
  writeNotNull('value', instance.value);
  return val;
}

const _$EirpUnitsEnumMap = {
  EirpUnits.dbw: 'dBW',
};

Elevation _$ElevationFromJson(Map<String, dynamic> json) {
  return Elevation(
    unit: _$enumDecodeNullable(_$AngleUnitsEnumMap, json['unit']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$AngleUnitsEnumMap = {
  AngleUnits.degreeAngle: 'DEGREE_ANGLE',
  AngleUnits.radian: 'RADIAN',
};

EndpointDetails _$EndpointDetailsFromJson(Map<String, dynamic> json) {
  return EndpointDetails(
    endpoint: json['endpoint'] == null
        ? null
        : DataflowEndpoint.fromJson(json['endpoint'] as Map<String, dynamic>),
    securityDetails: json['securityDetails'] == null
        ? null
        : SecurityDetails.fromJson(
            json['securityDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndpointDetailsToJson(EndpointDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endpoint', instance.endpoint?.toJson());
  writeNotNull('securityDetails', instance.securityDetails?.toJson());
  return val;
}

Frequency _$FrequencyFromJson(Map<String, dynamic> json) {
  return Frequency(
    units: _$enumDecodeNullable(_$FrequencyUnitsEnumMap, json['units']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FrequencyToJson(Frequency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('units', _$FrequencyUnitsEnumMap[instance.units]);
  writeNotNull('value', instance.value);
  return val;
}

const _$FrequencyUnitsEnumMap = {
  FrequencyUnits.gHz: 'GHz',
  FrequencyUnits.mHz: 'MHz',
  FrequencyUnits.kHz: 'kHz',
};

FrequencyBandwidth _$FrequencyBandwidthFromJson(Map<String, dynamic> json) {
  return FrequencyBandwidth(
    units: _$enumDecodeNullable(_$BandwidthUnitsEnumMap, json['units']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FrequencyBandwidthToJson(FrequencyBandwidth instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('units', _$BandwidthUnitsEnumMap[instance.units]);
  writeNotNull('value', instance.value);
  return val;
}

const _$BandwidthUnitsEnumMap = {
  BandwidthUnits.gHz: 'GHz',
  BandwidthUnits.mHz: 'MHz',
  BandwidthUnits.kHz: 'kHz',
};

GetConfigResponse _$GetConfigResponseFromJson(Map<String, dynamic> json) {
  return GetConfigResponse(
    configArn: json['configArn'] as String,
    configData: json['configData'] == null
        ? null
        : ConfigTypeData.fromJson(json['configData'] as Map<String, dynamic>),
    configId: json['configId'] as String,
    name: json['name'] as String,
    configType:
        _$enumDecodeNullable(_$ConfigCapabilityTypeEnumMap, json['configType']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetDataflowEndpointGroupResponse _$GetDataflowEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return GetDataflowEndpointGroupResponse(
    dataflowEndpointGroupArn: json['dataflowEndpointGroupArn'] as String,
    dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String,
    endpointsDetails: (json['endpointsDetails'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetMinuteUsageResponse _$GetMinuteUsageResponseFromJson(
    Map<String, dynamic> json) {
  return GetMinuteUsageResponse(
    estimatedMinutesRemaining: json['estimatedMinutesRemaining'] as int,
    isReservedMinutesCustomer: json['isReservedMinutesCustomer'] as bool,
    totalReservedMinuteAllocation: json['totalReservedMinuteAllocation'] as int,
    totalScheduledMinutes: json['totalScheduledMinutes'] as int,
    upcomingMinutesScheduled: json['upcomingMinutesScheduled'] as int,
  );
}

GetMissionProfileResponse _$GetMissionProfileResponseFromJson(
    Map<String, dynamic> json) {
  return GetMissionProfileResponse(
    contactPostPassDurationSeconds:
        json['contactPostPassDurationSeconds'] as int,
    contactPrePassDurationSeconds: json['contactPrePassDurationSeconds'] as int,
    dataflowEdges: (json['dataflowEdges'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    minimumViableContactDurationSeconds:
        json['minimumViableContactDurationSeconds'] as int,
    missionProfileArn: json['missionProfileArn'] as String,
    missionProfileId: json['missionProfileId'] as String,
    name: json['name'] as String,
    region: json['region'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    trackingConfigArn: json['trackingConfigArn'] as String,
  );
}

GetSatelliteResponse _$GetSatelliteResponseFromJson(Map<String, dynamic> json) {
  return GetSatelliteResponse(
    groundStations:
        (json['groundStations'] as List)?.map((e) => e as String)?.toList(),
    noradSatelliteID: json['noradSatelliteID'] as int,
    satelliteArn: json['satelliteArn'] as String,
    satelliteId: json['satelliteId'] as String,
  );
}

GroundStationData _$GroundStationDataFromJson(Map<String, dynamic> json) {
  return GroundStationData(
    groundStationId: json['groundStationId'] as String,
    groundStationName: json['groundStationName'] as String,
    region: json['region'] as String,
  );
}

ListConfigsResponse _$ListConfigsResponseFromJson(Map<String, dynamic> json) {
  return ListConfigsResponse(
    configList: (json['configList'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListContactsResponse _$ListContactsResponseFromJson(Map<String, dynamic> json) {
  return ListContactsResponse(
    contactList: (json['contactList'] as List)
        ?.map((e) =>
            e == null ? null : ContactData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDataflowEndpointGroupsResponse _$ListDataflowEndpointGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataflowEndpointGroupsResponse(
    dataflowEndpointGroupList: (json['dataflowEndpointGroupList'] as List)
        ?.map((e) => e == null
            ? null
            : DataflowEndpointListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListGroundStationsResponse _$ListGroundStationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGroundStationsResponse(
    groundStationList: (json['groundStationList'] as List)
        ?.map((e) => e == null
            ? null
            : GroundStationData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListMissionProfilesResponse _$ListMissionProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListMissionProfilesResponse(
    missionProfileList: (json['missionProfileList'] as List)
        ?.map((e) => e == null
            ? null
            : MissionProfileListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListSatellitesResponse _$ListSatellitesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSatellitesResponse(
    nextToken: json['nextToken'] as String,
    satellites: (json['satellites'] as List)
        ?.map((e) => e == null
            ? null
            : SatelliteListItem.fromJson(e as Map<String, dynamic>))
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

MissionProfileIdResponse _$MissionProfileIdResponseFromJson(
    Map<String, dynamic> json) {
  return MissionProfileIdResponse(
    missionProfileId: json['missionProfileId'] as String,
  );
}

MissionProfileListItem _$MissionProfileListItemFromJson(
    Map<String, dynamic> json) {
  return MissionProfileListItem(
    missionProfileArn: json['missionProfileArn'] as String,
    missionProfileId: json['missionProfileId'] as String,
    name: json['name'] as String,
    region: json['region'] as String,
  );
}

SatelliteListItem _$SatelliteListItemFromJson(Map<String, dynamic> json) {
  return SatelliteListItem(
    groundStations:
        (json['groundStations'] as List)?.map((e) => e as String)?.toList(),
    noradSatelliteID: json['noradSatelliteID'] as int,
    satelliteArn: json['satelliteArn'] as String,
    satelliteId: json['satelliteId'] as String,
  );
}

SecurityDetails _$SecurityDetailsFromJson(Map<String, dynamic> json) {
  return SecurityDetails(
    roleArn: json['roleArn'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SecurityDetailsToJson(SecurityDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('subnetIds', instance.subnetIds);
  return val;
}

SocketAddress _$SocketAddressFromJson(Map<String, dynamic> json) {
  return SocketAddress(
    name: json['name'] as String,
    port: json['port'] as int,
  );
}

Map<String, dynamic> _$SocketAddressToJson(SocketAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('port', instance.port);
  return val;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    configDetails: json['configDetails'] == null
        ? null
        : ConfigDetails.fromJson(json['configDetails'] as Map<String, dynamic>),
    configId: json['configId'] as String,
    configType:
        _$enumDecodeNullable(_$ConfigCapabilityTypeEnumMap, json['configType']),
    dataflowSourceRegion: json['dataflowSourceRegion'] as String,
  );
}

SpectrumConfig _$SpectrumConfigFromJson(Map<String, dynamic> json) {
  return SpectrumConfig(
    bandwidth: json['bandwidth'] == null
        ? null
        : FrequencyBandwidth.fromJson(
            json['bandwidth'] as Map<String, dynamic>),
    centerFrequency: json['centerFrequency'] == null
        ? null
        : Frequency.fromJson(json['centerFrequency'] as Map<String, dynamic>),
    polarization:
        _$enumDecodeNullable(_$PolarizationEnumMap, json['polarization']),
  );
}

Map<String, dynamic> _$SpectrumConfigToJson(SpectrumConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bandwidth', instance.bandwidth?.toJson());
  writeNotNull('centerFrequency', instance.centerFrequency?.toJson());
  writeNotNull('polarization', _$PolarizationEnumMap[instance.polarization]);
  return val;
}

const _$PolarizationEnumMap = {
  Polarization.leftHand: 'LEFT_HAND',
  Polarization.none: 'NONE',
  Polarization.rightHand: 'RIGHT_HAND',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TrackingConfig _$TrackingConfigFromJson(Map<String, dynamic> json) {
  return TrackingConfig(
    autotrack: _$enumDecodeNullable(_$CriticalityEnumMap, json['autotrack']),
  );
}

Map<String, dynamic> _$TrackingConfigToJson(TrackingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autotrack', _$CriticalityEnumMap[instance.autotrack]);
  return val;
}

const _$CriticalityEnumMap = {
  Criticality.preferred: 'PREFERRED',
  Criticality.removed: 'REMOVED',
  Criticality.required: 'REQUIRED',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UplinkEchoConfig _$UplinkEchoConfigFromJson(Map<String, dynamic> json) {
  return UplinkEchoConfig(
    antennaUplinkConfigArn: json['antennaUplinkConfigArn'] as String,
    enabled: json['enabled'] as bool,
  );
}

Map<String, dynamic> _$UplinkEchoConfigToJson(UplinkEchoConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('antennaUplinkConfigArn', instance.antennaUplinkConfigArn);
  writeNotNull('enabled', instance.enabled);
  return val;
}

UplinkSpectrumConfig _$UplinkSpectrumConfigFromJson(Map<String, dynamic> json) {
  return UplinkSpectrumConfig(
    centerFrequency: json['centerFrequency'] == null
        ? null
        : Frequency.fromJson(json['centerFrequency'] as Map<String, dynamic>),
    polarization:
        _$enumDecodeNullable(_$PolarizationEnumMap, json['polarization']),
  );
}

Map<String, dynamic> _$UplinkSpectrumConfigToJson(
    UplinkSpectrumConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('centerFrequency', instance.centerFrequency?.toJson());
  writeNotNull('polarization', _$PolarizationEnumMap[instance.polarization]);
  return val;
}
