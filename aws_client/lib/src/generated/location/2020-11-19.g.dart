// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateTrackerConsumerResponse _$AssociateTrackerConsumerResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateTrackerConsumerResponse();
}

BatchDeleteGeofenceError _$BatchDeleteGeofenceErrorFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteGeofenceError(
    error: json['Error'] == null
        ? null
        : BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    geofenceId: json['GeofenceId'] as String,
  );
}

BatchDeleteGeofenceResponse _$BatchDeleteGeofenceResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteGeofenceResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDeleteGeofenceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchEvaluateGeofencesError _$BatchEvaluateGeofencesErrorFromJson(
    Map<String, dynamic> json) {
  return BatchEvaluateGeofencesError(
    deviceId: json['DeviceId'] as String,
    error: json['Error'] == null
        ? null
        : BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    sampleTime: const IsoDateTimeConverter().fromJson(json['SampleTime']),
  );
}

BatchEvaluateGeofencesResponse _$BatchEvaluateGeofencesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchEvaluateGeofencesResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchEvaluateGeofencesError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetDevicePositionError _$BatchGetDevicePositionErrorFromJson(
    Map<String, dynamic> json) {
  return BatchGetDevicePositionError(
    deviceId: json['DeviceId'] as String,
    error: json['Error'] == null
        ? null
        : BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
  );
}

BatchGetDevicePositionResponse _$BatchGetDevicePositionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetDevicePositionResponse(
    devicePositions: (json['DevicePositions'] as List)
        ?.map((e) => e == null
            ? null
            : DevicePosition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchGetDevicePositionError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchItemError _$BatchItemErrorFromJson(Map<String, dynamic> json) {
  return BatchItemError(
    code: _$enumDecodeNullable(_$BatchItemErrorCodeEnumMap, json['Code']),
    message: json['Message'] as String,
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

const _$BatchItemErrorCodeEnumMap = {
  BatchItemErrorCode.accessDeniedError: 'AccessDeniedError',
  BatchItemErrorCode.conflictError: 'ConflictError',
  BatchItemErrorCode.internalServerError: 'InternalServerError',
  BatchItemErrorCode.resourceNotFoundError: 'ResourceNotFoundError',
  BatchItemErrorCode.throttlingError: 'ThrottlingError',
  BatchItemErrorCode.validationError: 'ValidationError',
};

BatchPutGeofenceError _$BatchPutGeofenceErrorFromJson(
    Map<String, dynamic> json) {
  return BatchPutGeofenceError(
    error: json['Error'] == null
        ? null
        : BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    geofenceId: json['GeofenceId'] as String,
  );
}

Map<String, dynamic> _$BatchPutGeofenceRequestEntryToJson(
    BatchPutGeofenceRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GeofenceId', instance.geofenceId);
  writeNotNull('Geometry', instance.geometry?.toJson());
  return val;
}

BatchPutGeofenceResponse _$BatchPutGeofenceResponseFromJson(
    Map<String, dynamic> json) {
  return BatchPutGeofenceResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutGeofenceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successes: (json['Successes'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutGeofenceSuccess.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchPutGeofenceSuccess _$BatchPutGeofenceSuccessFromJson(
    Map<String, dynamic> json) {
  return BatchPutGeofenceSuccess(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    geofenceId: json['GeofenceId'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

BatchUpdateDevicePositionError _$BatchUpdateDevicePositionErrorFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDevicePositionError(
    deviceId: json['DeviceId'] as String,
    error: json['Error'] == null
        ? null
        : BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    sampleTime: const IsoDateTimeConverter().fromJson(json['SampleTime']),
  );
}

BatchUpdateDevicePositionResponse _$BatchUpdateDevicePositionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDevicePositionResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchUpdateDevicePositionError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateGeofenceCollectionResponse _$CreateGeofenceCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGeofenceCollectionResponse(
    collectionArn: json['CollectionArn'] as String,
    collectionName: json['CollectionName'] as String,
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
  );
}

CreateMapResponse _$CreateMapResponseFromJson(Map<String, dynamic> json) {
  return CreateMapResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    mapArn: json['MapArn'] as String,
    mapName: json['MapName'] as String,
  );
}

CreatePlaceIndexResponse _$CreatePlaceIndexResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePlaceIndexResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
  );
}

CreateTrackerResponse _$CreateTrackerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTrackerResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    trackerArn: json['TrackerArn'] as String,
    trackerName: json['TrackerName'] as String,
  );
}

DataSourceConfiguration _$DataSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return DataSourceConfiguration(
    intendedUse:
        _$enumDecodeNullable(_$IntendedUseEnumMap, json['IntendedUse']),
  );
}

Map<String, dynamic> _$DataSourceConfigurationToJson(
    DataSourceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IntendedUse', _$IntendedUseEnumMap[instance.intendedUse]);
  return val;
}

const _$IntendedUseEnumMap = {
  IntendedUse.singleUse: 'SingleUse',
  IntendedUse.storage: 'Storage',
};

DeleteGeofenceCollectionResponse _$DeleteGeofenceCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGeofenceCollectionResponse();
}

DeleteMapResponse _$DeleteMapResponseFromJson(Map<String, dynamic> json) {
  return DeleteMapResponse();
}

DeletePlaceIndexResponse _$DeletePlaceIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePlaceIndexResponse();
}

DeleteTrackerResponse _$DeleteTrackerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTrackerResponse();
}

DescribeGeofenceCollectionResponse _$DescribeGeofenceCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGeofenceCollectionResponse(
    collectionArn: json['CollectionArn'] as String,
    collectionName: json['CollectionName'] as String,
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    description: json['Description'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

DescribeMapResponse _$DescribeMapResponseFromJson(Map<String, dynamic> json) {
  return DescribeMapResponse(
    configuration: json['Configuration'] == null
        ? null
        : MapConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    dataSource: json['DataSource'] as String,
    description: json['Description'] as String,
    mapArn: json['MapArn'] as String,
    mapName: json['MapName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

DescribePlaceIndexResponse _$DescribePlaceIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePlaceIndexResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    dataSource: json['DataSource'] as String,
    dataSourceConfiguration: json['DataSourceConfiguration'] == null
        ? null
        : DataSourceConfiguration.fromJson(
            json['DataSourceConfiguration'] as Map<String, dynamic>),
    description: json['Description'] as String,
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

DescribeTrackerResponse _$DescribeTrackerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrackerResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    description: json['Description'] as String,
    trackerArn: json['TrackerArn'] as String,
    trackerName: json['TrackerName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

DevicePosition _$DevicePositionFromJson(Map<String, dynamic> json) {
  return DevicePosition(
    position: (json['Position'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    receivedTime: const IsoDateTimeConverter().fromJson(json['ReceivedTime']),
    sampleTime: const IsoDateTimeConverter().fromJson(json['SampleTime']),
    deviceId: json['DeviceId'] as String,
  );
}

Map<String, dynamic> _$DevicePositionUpdateToJson(
    DevicePositionUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceId', instance.deviceId);
  writeNotNull('Position', instance.position);
  writeNotNull(
      'SampleTime', const IsoDateTimeConverter().toJson(instance.sampleTime));
  return val;
}

DisassociateTrackerConsumerResponse
    _$DisassociateTrackerConsumerResponseFromJson(Map<String, dynamic> json) {
  return DisassociateTrackerConsumerResponse();
}

GeofenceGeometry _$GeofenceGeometryFromJson(Map<String, dynamic> json) {
  return GeofenceGeometry(
    polygon: (json['Polygon'] as List)
        ?.map((e) => (e as List)
            ?.map((e) =>
                (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$GeofenceGeometryToJson(GeofenceGeometry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Polygon', instance.polygon);
  return val;
}

GetDevicePositionHistoryResponse _$GetDevicePositionHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevicePositionHistoryResponse(
    devicePositions: (json['DevicePositions'] as List)
        ?.map((e) => e == null
            ? null
            : DevicePosition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDevicePositionResponse _$GetDevicePositionResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevicePositionResponse(
    position: (json['Position'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    receivedTime: const IsoDateTimeConverter().fromJson(json['ReceivedTime']),
    sampleTime: const IsoDateTimeConverter().fromJson(json['SampleTime']),
    deviceId: json['DeviceId'] as String,
  );
}

GetGeofenceResponse _$GetGeofenceResponseFromJson(Map<String, dynamic> json) {
  return GetGeofenceResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    geofenceId: json['GeofenceId'] as String,
    geometry: json['Geometry'] == null
        ? null
        : GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    status: json['Status'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

GetMapGlyphsResponse _$GetMapGlyphsResponseFromJson(Map<String, dynamic> json) {
  return GetMapGlyphsResponse(
    blob: const Uint8ListConverter().fromJson(json['Blob'] as String),
    contentType: json['Content-Type'] as String,
  );
}

GetMapSpritesResponse _$GetMapSpritesResponseFromJson(
    Map<String, dynamic> json) {
  return GetMapSpritesResponse(
    blob: const Uint8ListConverter().fromJson(json['Blob'] as String),
    contentType: json['Content-Type'] as String,
  );
}

GetMapStyleDescriptorResponse _$GetMapStyleDescriptorResponseFromJson(
    Map<String, dynamic> json) {
  return GetMapStyleDescriptorResponse(
    blob: const Uint8ListConverter().fromJson(json['Blob'] as String),
    contentType: json['Content-Type'] as String,
  );
}

GetMapTileResponse _$GetMapTileResponseFromJson(Map<String, dynamic> json) {
  return GetMapTileResponse(
    blob: const Uint8ListConverter().fromJson(json['Blob'] as String),
    contentType: json['Content-Type'] as String,
  );
}

ListGeofenceCollectionsResponse _$ListGeofenceCollectionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGeofenceCollectionsResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : ListGeofenceCollectionsResponseEntry.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGeofenceCollectionsResponseEntry
    _$ListGeofenceCollectionsResponseEntryFromJson(Map<String, dynamic> json) {
  return ListGeofenceCollectionsResponseEntry(
    collectionName: json['CollectionName'] as String,
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    description: json['Description'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

ListGeofenceResponseEntry _$ListGeofenceResponseEntryFromJson(
    Map<String, dynamic> json) {
  return ListGeofenceResponseEntry(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    geofenceId: json['GeofenceId'] as String,
    geometry: json['Geometry'] == null
        ? null
        : GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    status: json['Status'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

ListGeofencesResponse _$ListGeofencesResponseFromJson(
    Map<String, dynamic> json) {
  return ListGeofencesResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : ListGeofenceResponseEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMapsResponse _$ListMapsResponseFromJson(Map<String, dynamic> json) {
  return ListMapsResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : ListMapsResponseEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMapsResponseEntry _$ListMapsResponseEntryFromJson(
    Map<String, dynamic> json) {
  return ListMapsResponseEntry(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    dataSource: json['DataSource'] as String,
    description: json['Description'] as String,
    mapName: json['MapName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

ListPlaceIndexesResponse _$ListPlaceIndexesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPlaceIndexesResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : ListPlaceIndexesResponseEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPlaceIndexesResponseEntry _$ListPlaceIndexesResponseEntryFromJson(
    Map<String, dynamic> json) {
  return ListPlaceIndexesResponseEntry(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    dataSource: json['DataSource'] as String,
    description: json['Description'] as String,
    indexName: json['IndexName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

ListTrackerConsumersResponse _$ListTrackerConsumersResponseFromJson(
    Map<String, dynamic> json) {
  return ListTrackerConsumersResponse(
    consumerArns:
        (json['ConsumerArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTrackersResponse _$ListTrackersResponseFromJson(Map<String, dynamic> json) {
  return ListTrackersResponse(
    entries: (json['Entries'] as List)
        ?.map((e) => e == null
            ? null
            : ListTrackersResponseEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTrackersResponseEntry _$ListTrackersResponseEntryFromJson(
    Map<String, dynamic> json) {
  return ListTrackersResponseEntry(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    description: json['Description'] as String,
    trackerName: json['TrackerName'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

MapConfiguration _$MapConfigurationFromJson(Map<String, dynamic> json) {
  return MapConfiguration(
    style: json['Style'] as String,
  );
}

Map<String, dynamic> _$MapConfigurationToJson(MapConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Style', instance.style);
  return val;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    geometry: json['Geometry'] == null
        ? null
        : PlaceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    addressNumber: json['AddressNumber'] as String,
    country: json['Country'] as String,
    label: json['Label'] as String,
    municipality: json['Municipality'] as String,
    neighborhood: json['Neighborhood'] as String,
    postalCode: json['PostalCode'] as String,
    region: json['Region'] as String,
    street: json['Street'] as String,
    subRegion: json['SubRegion'] as String,
  );
}

PlaceGeometry _$PlaceGeometryFromJson(Map<String, dynamic> json) {
  return PlaceGeometry(
    point:
        (json['Point'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
  );
}

PutGeofenceResponse _$PutGeofenceResponseFromJson(Map<String, dynamic> json) {
  return PutGeofenceResponse(
    createTime: const IsoDateTimeConverter().fromJson(json['CreateTime']),
    geofenceId: json['GeofenceId'] as String,
    updateTime: const IsoDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

SearchForPositionResult _$SearchForPositionResultFromJson(
    Map<String, dynamic> json) {
  return SearchForPositionResult(
    place: json['Place'] == null
        ? null
        : Place.fromJson(json['Place'] as Map<String, dynamic>),
  );
}

SearchForTextResult _$SearchForTextResultFromJson(Map<String, dynamic> json) {
  return SearchForTextResult(
    place: json['Place'] == null
        ? null
        : Place.fromJson(json['Place'] as Map<String, dynamic>),
  );
}

SearchPlaceIndexForPositionResponse
    _$SearchPlaceIndexForPositionResponseFromJson(Map<String, dynamic> json) {
  return SearchPlaceIndexForPositionResponse(
    results: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : SearchForPositionResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    summary: json['Summary'] == null
        ? null
        : SearchPlaceIndexForPositionSummary.fromJson(
            json['Summary'] as Map<String, dynamic>),
  );
}

SearchPlaceIndexForPositionSummary _$SearchPlaceIndexForPositionSummaryFromJson(
    Map<String, dynamic> json) {
  return SearchPlaceIndexForPositionSummary(
    dataSource: json['DataSource'] as String,
    position: (json['Position'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    maxResults: json['MaxResults'] as int,
  );
}

SearchPlaceIndexForTextResponse _$SearchPlaceIndexForTextResponseFromJson(
    Map<String, dynamic> json) {
  return SearchPlaceIndexForTextResponse(
    results: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : SearchForTextResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    summary: json['Summary'] == null
        ? null
        : SearchPlaceIndexForTextSummary.fromJson(
            json['Summary'] as Map<String, dynamic>),
  );
}

SearchPlaceIndexForTextSummary _$SearchPlaceIndexForTextSummaryFromJson(
    Map<String, dynamic> json) {
  return SearchPlaceIndexForTextSummary(
    dataSource: json['DataSource'] as String,
    text: json['Text'] as String,
    biasPosition: (json['BiasPosition'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    filterBBox: (json['FilterBBox'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    filterCountries:
        (json['FilterCountries'] as List)?.map((e) => e as String)?.toList(),
    maxResults: json['MaxResults'] as int,
    resultBBox: (json['ResultBBox'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
  );
}
