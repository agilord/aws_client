// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2020-11-19.g.dart';

/// Suite of geospatial services including Maps, Places, Tracking, and
/// Geofencing
class Location {
  final _s.RestJsonProtocol _protocol;
  Location({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'geo',
            signingName: 'geo',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an association between a geofence collection and a tracker
  /// resource. This allows the tracker resource to communicate location data to
  /// the linked geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) for the geofence collection to be
  /// associated to tracker resource. Used when you need to specify a resource
  /// across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:partition:service:region:account-id:resource-type:resource-id</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be associated with a geofence
  /// collection.
  Future<void> associateTrackerConsumer({
    @_s.required String consumerArn,
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(consumerArn, 'consumerArn');
    _s.validateStringLength(
      'consumerArn',
      consumerArn,
      0,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'consumerArn',
      consumerArn,
      r'''^arn(:[a-z0-9]+([.-][a-z0-9]+)*){2}(:([a-z0-9]+([.-][a-z0-9]+)*)?){2}:([^/].*)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ConsumerArn': consumerArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/consumers',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateTrackerConsumerResponse.fromJson(response);
  }

  /// Deletes a batch of geofences from a geofence collection.
  /// <note>
  /// This action deletes the resource permanently. You can't undo this action.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the geofences to be deleted.
  ///
  /// Parameter [geofenceIds] :
  /// The batch of geofences to be deleted.
  Future<BatchDeleteGeofenceResponse> batchDeleteGeofence({
    @_s.required String collectionName,
    @_s.required List<String> geofenceIds,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(geofenceIds, 'geofenceIds');
    final $payload = <String, dynamic>{
      'GeofenceIds': geofenceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/delete-geofences',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteGeofenceResponse.fromJson(response);
  }

  /// Used in geofence monitoring. Evaluates device positions against the
  /// position of geofences in a given geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection used in evaluating the position of devices against
  /// its geofences.
  ///
  /// Parameter [devicePositionUpdates] :
  /// Contains device details for each device to be evaluated against the given
  /// geofence collection.
  Future<BatchEvaluateGeofencesResponse> batchEvaluateGeofences({
    @_s.required String collectionName,
    @_s.required List<DevicePositionUpdate> devicePositionUpdates,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(devicePositionUpdates, 'devicePositionUpdates');
    final $payload = <String, dynamic>{
      'DevicePositionUpdates': devicePositionUpdates,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/positions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchEvaluateGeofencesResponse.fromJson(response);
  }

  /// A batch request to retrieve device positions.
  /// <note>
  /// The response will return the device positions from the last 24 hours.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deviceIds] :
  /// Devices whose position you want to retrieve.
  ///
  /// <ul>
  /// <li>
  /// For example, for two devices:
  /// <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The tracker resource retrieving the device position.
  Future<BatchGetDevicePositionResponse> batchGetDevicePosition({
    @_s.required List<String> deviceIds,
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(deviceIds, 'deviceIds');
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DeviceIds': deviceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/get-positions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetDevicePositionResponse.fromJson(response);
  }

  /// A batch request for storing geofences into a given geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the geofences.
  ///
  /// Parameter [entries] :
  /// The batch of geofences to be stored in a geofence collection.
  Future<BatchPutGeofenceResponse> batchPutGeofence({
    @_s.required String collectionName,
    @_s.required List<BatchPutGeofenceRequestEntry> entries,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entries, 'entries');
    final $payload = <String, dynamic>{
      'Entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/put-geofences',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutGeofenceResponse.fromJson(response);
  }

  /// Uploads a position update for one or more devices to a tracker resource.
  /// The data is used for API queries requesting the device position and
  /// position history.
  /// <note>
  /// Limitation — Location data is sampled at a fixed rate of 1 position per 30
  /// second interval, and retained for 1 year before it is deleted.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to update.
  ///
  /// Parameter [updates] :
  /// Contains the position update details for each device.
  Future<BatchUpdateDevicePositionResponse> batchUpdateDevicePosition({
    @_s.required String trackerName,
    @_s.required List<DevicePositionUpdate> updates,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(updates, 'updates');
    final $payload = <String, dynamic>{
      'Updates': updates,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/positions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateDevicePositionResponse.fromJson(response);
  }

  /// Creates a geofence collection, which manages and stores geofences.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// A custom name for the geofence collection.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0-9), hyphens (-), and
  /// underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique geofence collection name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your geofence collection. There's three
  /// pricing plan options:
  ///
  /// <ul>
  /// <li>
  /// <code>RequestBasedUsage</code> — Selects the "Request-Based Usage" pricing
  /// plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetTracking</code> — Selects the "Mobile Asset Tracking"
  /// pricing plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetManagement</code> — Selects the "Mobile Asset Management"
  /// pricing plan.
  /// </li>
  /// </ul>
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [description] :
  /// An optional description for the geofence collection.
  Future<CreateGeofenceCollectionResponse> createGeofenceCollection({
    @_s.required String collectionName,
    @_s.required PricingPlan pricingPlan,
    String description,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'CollectionName': collectionName,
      'PricingPlan': pricingPlan?.toValue() ?? '',
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/geofencing/v0/collections',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGeofenceCollectionResponse.fromJson(response);
  }

  /// Creates a map resource in your AWS account, which provides map tiles of
  /// different styles sourced from global location data providers.
  /// <note>
  /// By using Maps, you agree that AWS may transmit your API queries to your
  /// selected third party provider for processing, which may be outside the AWS
  /// region you are currently using. For more information, see the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
  /// Amazon Location Service.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configuration] :
  /// Specifies the map style selected from an available data provider.
  ///
  /// Parameter [mapName] :
  /// The name for the map resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Must contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-),
  /// and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique map resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleMap</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your map resource. There's three pricing
  /// plan options:
  ///
  /// <ul>
  /// <li>
  /// <code>RequestBasedUsage</code> — Selects the "Request-Based Usage" pricing
  /// plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetTracking</code> — Selects the "Mobile Asset Tracking"
  /// pricing plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetManagement</code> — Selects the "Mobile Asset Management"
  /// pricing plan.
  /// </li>
  /// </ul>
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [description] :
  /// An optional description for the map resource.
  Future<CreateMapResponse> createMap({
    @_s.required MapConfiguration configuration,
    @_s.required String mapName,
    @_s.required PricingPlan pricingPlan,
    String description,
  }) async {
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'MapName': mapName,
      'PricingPlan': pricingPlan?.toValue() ?? '',
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/maps/v0/maps',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMapResponse.fromJson(response);
  }

  /// Creates a Place index resource in your AWS account, which supports Places
  /// functions with geospatial data sourced from your chosen data provider.
  /// <note>
  /// By using Places, you agree that AWS may transmit your API queries to your
  /// selected third party provider for processing, which may be outside the AWS
  /// region you are currently using.
  ///
  /// Because of licensing limitations, you may not use HERE to store results
  /// for locations in Japan. For more information, see the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
  /// Amazon Location Service.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dataSource] :
  /// Specifies the data provider of geospatial data.
  ///
  /// Parameter [indexName] :
  /// The name of the Place index resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-) and
  /// underscores (_) ).
  /// </li>
  /// <li>
  /// Must be a unique Place index resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExamplePlaceIndex</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your Place index resource. There's three
  /// pricing plan options:
  ///
  /// <ul>
  /// <li>
  /// <code>RequestBasedUsage</code> — Selects the "Request-Based Usage" pricing
  /// plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetTracking</code> — Selects the "Mobile Asset Tracking"
  /// pricing plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetManagement</code> — Selects the "Mobile Asset Management"
  /// pricing plan.
  /// </li>
  /// </ul>
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Specifies the data storage option for requesting Places.
  ///
  /// Parameter [description] :
  /// The optional description for the Place index resource.
  Future<CreatePlaceIndexResponse> createPlaceIndex({
    @_s.required String dataSource,
    @_s.required String indexName,
    @_s.required PricingPlan pricingPlan,
    DataSourceConfiguration dataSourceConfiguration,
    String description,
  }) async {
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'DataSource': dataSource,
      'IndexName': indexName,
      'PricingPlan': pricingPlan?.toValue() ?? '',
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/places/v0/indexes',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePlaceIndexResponse.fromJson(response);
  }

  /// Creates a tracker resource in your AWS account, which lets you retrieve
  /// current and historical location of devices.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your tracker resource. There's three
  /// pricing plan options:
  ///
  /// <ul>
  /// <li>
  /// <code>RequestBasedUsage</code> — Selects the "Request-Based Usage" pricing
  /// plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetTracking</code> — Selects the "Mobile Asset Tracking"
  /// pricing plan.
  /// </li>
  /// <li>
  /// <code>MobileAssetManagement</code> — Selects the "Mobile Asset Management"
  /// pricing plan.
  /// </li>
  /// </ul>
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [trackerName] :
  /// The name for the tracker resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-) and
  /// underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique tracker resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleTracker</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description for the tracker resource.
  Future<CreateTrackerResponse> createTracker({
    @_s.required PricingPlan pricingPlan,
    @_s.required String trackerName,
    String description,
  }) async {
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'PricingPlan': pricingPlan?.toValue() ?? '',
      'TrackerName': trackerName,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tracking/v0/trackers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTrackerResponse.fromJson(response);
  }

  /// Deletes a geofence collection from your AWS account.
  /// <note>
  /// This action deletes the resource permanently. You can't undo this action.
  /// If the geofence collection is the target of a tracker resource, the
  /// devices will no longer be monitored.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection to be deleted.
  Future<void> deleteGeofenceCollection({
    @_s.required String collectionName,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGeofenceCollectionResponse.fromJson(response);
  }

  /// Deletes a map resource from your AWS account.
  /// <note>
  /// This action deletes the resource permanently. You cannot undo this action.
  /// If the map is being used in an application, the map may not render.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource to be deleted.
  Future<void> deleteMap({
    @_s.required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMapResponse.fromJson(response);
  }

  /// Deletes a Place index resource from your AWS account.
  /// <note>
  /// This action deletes the resource permanently. You cannot undo this action.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the Place index resource to be deleted.
  Future<void> deletePlaceIndex({
    @_s.required String indexName,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePlaceIndexResponse.fromJson(response);
  }

  /// Deletes a tracker resource from your AWS account.
  /// <note>
  /// This action deletes the resource permanently. You can't undo this action.
  /// If the tracker resource is in use, you may encounter an error. Make sure
  /// that the target resource is not a dependency for your applications.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be deleted.
  Future<void> deleteTracker({
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTrackerResponse.fromJson(response);
  }

  /// Retrieves the geofence collection details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection.
  Future<DescribeGeofenceCollectionResponse> describeGeofenceCollection({
    @_s.required String collectionName,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGeofenceCollectionResponse.fromJson(response);
  }

  /// Retrieves the map resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource.
  Future<DescribeMapResponse> describeMap({
    @_s.required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMapResponse.fromJson(response);
  }

  /// Retrieves the Place index resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the Place index resource.
  Future<DescribePlaceIndexResponse> describePlaceIndex({
    @_s.required String indexName,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePlaceIndexResponse.fromJson(response);
  }

  /// Retrieves the tracker resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource.
  Future<DescribeTrackerResponse> describeTracker({
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTrackerResponse.fromJson(response);
  }

  /// Removes the association bewteen a tracker resource and a geofence
  /// collection.
  /// <note>
  /// Once you unlink a tracker resource from a geofence collection, the tracker
  /// positions will no longer be automatically evaluated against geofences.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) for the geofence collection to be
  /// disassociated from the tracker resource. Used when you need to specify a
  /// resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:partition:service:region:account-id:resource-type:resource-id</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be dissociated from the consumer.
  Future<void> disassociateTrackerConsumer({
    @_s.required String consumerArn,
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(consumerArn, 'consumerArn');
    _s.validateStringLength(
      'consumerArn',
      consumerArn,
      0,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'consumerArn',
      consumerArn,
      r'''^arn(:[a-z0-9]+([.-][a-z0-9]+)*){2}(:([a-z0-9]+([.-][a-z0-9]+)*)?){2}:([^/].*)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/consumers/${Uri.encodeComponent(consumerArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateTrackerConsumerResponse.fromJson(response);
  }

  /// Retrieves the latest device position.
  /// <note>
  /// Limitation — Device positions are deleted after one year.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deviceId] :
  /// The device whose position you want to retreieve.
  ///
  /// Parameter [trackerName] :
  /// The tracker resource receiving the position update.
  Future<GetDevicePositionResponse> getDevicePosition({
    @_s.required String deviceId,
    @_s.required String trackerName,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceId',
      deviceId,
      r'''^[-._\p{L}\p{N}]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/devices/${Uri.encodeComponent(deviceId)}/positions/latest',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicePositionResponse.fromJson(response);
  }

  /// Retrieves the device position history from a tracker resource within a
  /// specified range of time.
  /// <note>
  /// Limitation — Device positions are deleted after one year.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deviceId] :
  /// The device whose position history you want to retrieve.
  ///
  /// Parameter [trackerName] :
  /// The tracker resource receiving the request for the device position
  /// history.
  ///
  /// Parameter [endTimeExclusive] :
  /// Specify the end time for the position history in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// The given time for <code>EndTimeExclusive</code> must be after the time
  /// for <code>StartTimeInclusive</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  ///
  /// Parameter [startTimeInclusive] :
  /// Specify the start time for the position history in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// The given time for <code>EndTimeExclusive</code> must be after the time
  /// for <code>StartTimeInclusive</code>.
  /// </li>
  /// </ul>
  Future<GetDevicePositionHistoryResponse> getDevicePositionHistory({
    @_s.required String deviceId,
    @_s.required String trackerName,
    DateTime endTimeExclusive,
    String nextToken,
    DateTime startTimeInclusive,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceId',
      deviceId,
      r'''^[-._\p{L}\p{N}]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (endTimeExclusive != null)
        'EndTimeExclusive': iso8601ToJson(endTimeExclusive),
      if (nextToken != null) 'NextToken': nextToken,
      if (startTimeInclusive != null)
        'StartTimeInclusive': iso8601ToJson(startTimeInclusive),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/devices/${Uri.encodeComponent(deviceId)}/list-positions',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicePositionHistoryResponse.fromJson(response);
  }

  /// Retrieves the geofence details from a geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the target geofence.
  ///
  /// Parameter [geofenceId] :
  /// The geofence you're retrieving details for.
  Future<GetGeofenceResponse> getGeofence({
    @_s.required String collectionName,
    @_s.required String geofenceId,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(geofenceId, 'geofenceId');
    _s.validateStringLength(
      'geofenceId',
      geofenceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'geofenceId',
      geofenceId,
      r'''^[-._\p{L}\p{N}]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/geofences/${Uri.encodeComponent(geofenceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGeofenceResponse.fromJson(response);
  }

  /// Retrieves glyphs used to display labels on a map.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fontStack] :
  /// A comma-separated list of fonts to load glyphs from in order of
  /// preference.. For example, <code>Noto Sans, Arial Unicode</code>.
  ///
  /// Parameter [fontUnicodeRange] :
  /// A Unicode range of characters to download glyphs for. Each response will
  /// contain 256 characters. For example, 0-255 includes all characters from
  /// range <code>U+0000</code> to <code>00FF</code>. Must be aligned to
  /// multiples of 256.
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the glyph ﬁle.
  Future<GetMapGlyphsResponse> getMapGlyphs({
    @_s.required String fontStack,
    @_s.required String fontUnicodeRange,
    @_s.required String mapName,
  }) async {
    ArgumentError.checkNotNull(fontStack, 'fontStack');
    ArgumentError.checkNotNull(fontUnicodeRange, 'fontUnicodeRange');
    _s.validateStringPattern(
      'fontUnicodeRange',
      fontUnicodeRange,
      r'''^[0-9]+-[0-9]+\.pbf$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/glyphs/${Uri.encodeComponent(fontStack)}/${Uri.encodeComponent(fontUnicodeRange)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapGlyphsResponse(
      blob: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Retrieves the sprite sheet corresponding to a map resource. The sprite
  /// sheet is a PNG image paired with a JSON document describing the offsets of
  /// individual icons that will be displayed on a rendered map.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fileName] :
  /// The name of the sprite ﬁle. Use the following ﬁle names for the sprite
  /// sheet:
  ///
  /// <ul>
  /// <li>
  /// <code>sprites.png</code>
  /// </li>
  /// <li>
  /// <code>sprites@2x.png</code> for high pixel density displays
  /// </li>
  /// </ul>
  /// For the JSON document contain image offsets. Use the following ﬁle names:
  ///
  /// <ul>
  /// <li>
  /// <code>sprites.json</code>
  /// </li>
  /// <li>
  /// <code>sprites@2x.json</code> for high pixel density displays
  /// </li>
  /// </ul>
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the sprite ﬁle.
  Future<GetMapSpritesResponse> getMapSprites({
    @_s.required String fileName,
    @_s.required String mapName,
  }) async {
    ArgumentError.checkNotNull(fileName, 'fileName');
    _s.validateStringPattern(
      'fileName',
      fileName,
      r'''^sprites(@2x)?\.(png|json)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/sprites/${Uri.encodeComponent(fileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapSpritesResponse(
      blob: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Retrieves the map style descriptor from a map resource.
  ///
  /// The style descriptor contains speciﬁcations on how features render on a
  /// map. For example, what data to display, what order to display the data in,
  /// and the style for the data. Style descriptors follow the Mapbox Style
  /// Specification.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [mapName] :
  /// The map resource to retrieve the style descriptor from.
  Future<GetMapStyleDescriptorResponse> getMapStyleDescriptor({
    @_s.required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/style-descriptor',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapStyleDescriptorResponse(
      blob: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Retrieves a vector data tile from the map resource. Map tiles are used by
  /// clients to render a map. They are addressed using a grid arrangement with
  /// an X coordinate, Y coordinate, and Z (zoom) level.
  ///
  /// The origin (0, 0) is the top left of the map. Increasing the zoom level by
  /// 1 doubles both the X and Y dimensions, so a tile containing data for the
  /// entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0,
  /// 1/0/1, 1/1/0, 1/1/1).
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [mapName] :
  /// The map resource to retrieve the map tiles from.
  ///
  /// Parameter [x] :
  /// The X axis value for the map tile.
  ///
  /// Parameter [y] :
  /// The Y axis value for the map tile.
  ///
  /// Parameter [z] :
  /// The zoom value for the map tile.
  Future<GetMapTileResponse> getMapTile({
    @_s.required String mapName,
    @_s.required String x,
    @_s.required String y,
    @_s.required String z,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mapName',
      mapName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(x, 'x');
    _s.validateStringPattern(
      'x',
      x,
      r'''\d+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(y, 'y');
    _s.validateStringPattern(
      'y',
      y,
      r'''\d+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(z, 'z');
    _s.validateStringPattern(
      'z',
      z,
      r'''\d+''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/tiles/${Uri.encodeComponent(z)}/${Uri.encodeComponent(x)}/${Uri.encodeComponent(y)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapTileResponse(
      blob: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Lists geofence collections in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListGeofenceCollectionsResponse> listGeofenceCollections({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/geofencing/v0/list-collections',
      exceptionFnMap: _exceptionFns,
    );
    return ListGeofenceCollectionsResponse.fromJson(response);
  }

  /// Lists geofences stored in a given geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection storing the list of geofences.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListGeofencesResponse> listGeofences({
    @_s.required String collectionName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/list-geofences',
      exceptionFnMap: _exceptionFns,
    );
    return ListGeofencesResponse.fromJson(response);
  }

  /// Lists map resources in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListMapsResponse> listMaps({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/maps/v0/list-maps',
      exceptionFnMap: _exceptionFns,
    );
    return ListMapsResponse.fromJson(response);
  }

  /// Lists Place index resources in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the maximum number of results returned in a single
  /// call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListPlaceIndexesResponse> listPlaceIndexes({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/places/v0/list-indexes',
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaceIndexesResponse.fromJson(response);
  }

  /// Lists geofence collections currently associated to the given tracker
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The tracker resource whose associated geofence collections you want to
  /// list.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListTrackerConsumersResponse> listTrackerConsumers({
    @_s.required String trackerName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trackerName',
      trackerName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/list-consumers',
      exceptionFnMap: _exceptionFns,
    );
    return ListTrackerConsumersResponse.fromJson(response);
  }

  /// Lists tracker resources in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListTrackersResponse> listTrackers({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tracking/v0/list-trackers',
      exceptionFnMap: _exceptionFns,
    );
    return ListTrackersResponse.fromJson(response);
  }

  /// Stores a geofence to a given geofence collection, or updates the geometry
  /// of an existing geofence if a geofence ID is included in the request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection to store the geofence in.
  ///
  /// Parameter [geofenceId] :
  /// An identifier for the geofence. For example,
  /// <code>ExampleGeofence-1</code>.
  ///
  /// Parameter [geometry] :
  /// Contains the polygon details to specify the position of the geofence.
  Future<PutGeofenceResponse> putGeofence({
    @_s.required String collectionName,
    @_s.required String geofenceId,
    @_s.required GeofenceGeometry geometry,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionName',
      collectionName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(geofenceId, 'geofenceId');
    _s.validateStringLength(
      'geofenceId',
      geofenceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'geofenceId',
      geofenceId,
      r'''^[-._\p{L}\p{N}]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(geometry, 'geometry');
    final $payload = <String, dynamic>{
      'Geometry': geometry,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/geofences/${Uri.encodeComponent(geofenceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutGeofenceResponse.fromJson(response);
  }

  /// Reverse geocodes a given coordinate and returns a legible address. Allows
  /// you to search for Places or points of interest near a given position.
  /// <note>
  /// By using Places, you agree that AWS may transmit your API queries to your
  /// selected third party provider for processing, which may be outside the AWS
  /// region you are currently using.
  ///
  /// Because of licensing limitations, you may not use HERE to store results
  /// for locations in Japan. For more information, see the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
  /// Amazon Location Service.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the Place index resource you want to use for the search.
  ///
  /// Parameter [position] :
  /// Specifies a coordinate for the query defined by a longitude, and latitude.
  ///
  /// <ul>
  /// <li>
  /// The first position is the X coordinate, or longitude.
  /// </li>
  /// <li>
  /// The second position is the Y coordinate, or latitude.
  /// </li>
  /// </ul>
  /// For example, <code>position=xLongitude&amp;position=yLatitude</code> .
  ///
  /// Parameter [maxResults] :
  /// An optional paramer. The maximum number of results returned per request.
  ///
  /// Default value: <code>50</code>
  Future<SearchPlaceIndexForPositionResponse> searchPlaceIndexForPosition({
    @_s.required String indexName,
    @_s.required List<double> position,
    int maxResults,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(position, 'position');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'Position': position,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/position',
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForPositionResponse.fromJson(response);
  }

  /// Geocodes free-form text, such as an address, name, city, or region to
  /// allow you to search for Places or points of interest.
  ///
  /// Includes the option to apply additional parameters to narrow your list of
  /// results.
  /// <note>
  /// You can search for places near a given position using
  /// <code>BiasPosition</code>, or filter results within a bounding box using
  /// <code>FilterBBox</code>. Providing both parameters simultaneously returns
  /// an error.
  /// </note> <note>
  /// By using Places, you agree that AWS may transmit your API queries to your
  /// selected third party provider for processing, which may be outside the AWS
  /// region you are currently using.
  ///
  /// Also, when using HERE as your data provider, you may not (a) use HERE
  /// Places for Asset Management, or (b) select the <code>Storage</code> option
  /// for the <code>IntendedUse</code> parameter when requesting Places in
  /// Japan. For more information, see the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
  /// Amazon Location Service.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the Place index resource you want to use for the search.
  ///
  /// Parameter [text] :
  /// The address, name, city, or region to be used in the search. In free-form
  /// text format. For example, <code>123 Any Street</code>.
  ///
  /// Parameter [biasPosition] :
  /// Searches for results closest to the given position. An optional parameter
  /// defined by longitude, and latitude.
  ///
  /// <ul>
  /// <li>
  /// The first <code>bias</code> position is the X coordinate, or longitude.
  /// </li>
  /// <li>
  /// The second <code>bias</code> position is the Y coordinate, or latitude.
  /// </li>
  /// </ul>
  /// For example, <code>bias=xLongitude&amp;bias=yLatitude</code>.
  ///
  /// Parameter [filterBBox] :
  /// Filters the results by returning only Places within the provided bounding
  /// box. An optional parameter.
  ///
  /// The first 2 <code>bbox</code> parameters describe the lower southwest
  /// corner:
  ///
  /// <ul>
  /// <li>
  /// The first <code>bbox</code> position is the X coordinate or longitude of
  /// the lower southwest corner.
  /// </li>
  /// <li>
  /// The second <code>bbox</code> position is the Y coordinate or latitude of
  /// the lower southwest corner.
  /// </li>
  /// </ul>
  /// For example, <code>bbox=xLongitudeSW&amp;bbox=yLatitudeSW</code>.
  ///
  /// The next <code>bbox</code> parameters describe the upper northeast corner:
  ///
  /// <ul>
  /// <li>
  /// The third <code>bbox</code> position is the X coordinate, or longitude of
  /// the upper northeast corner.
  /// </li>
  /// <li>
  /// The fourth <code>bbox</code> position is the Y coordinate, or longitude of
  /// the upper northeast corner.
  /// </li>
  /// </ul>
  /// For example, <code>bbox=xLongitudeNE&amp;bbox=yLatitudeNE</code>
  ///
  /// Parameter [filterCountries] :
  /// Limits the search to the given a list of countries/regions. An optional
  /// parameter.
  ///
  /// <ul>
  /// <li>
  /// Use the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO
  /// 3166</a> 3-digit country code. For example, Australia uses three
  /// upper-case characters: <code>AUS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// The default: <code>50</code>
  Future<SearchPlaceIndexForTextResponse> searchPlaceIndexForText({
    @_s.required String indexName,
    @_s.required String text,
    List<double> biasPosition,
    List<double> filterBBox,
    List<String> filterCountries,
    int maxResults,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''^[-._\w]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      200,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/text',
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForTextResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTrackerConsumerResponse {
  AssociateTrackerConsumerResponse();
  factory AssociateTrackerConsumerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateTrackerConsumerResponseFromJson(json);
}

/// Contains error details for each geofence that failed to delete from the
/// geofence collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteGeofenceError {
  /// Contains details associated to the batch error.
  @_s.JsonKey(name: 'Error')
  final BatchItemError error;

  /// The geofence associated with the error message.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  BatchDeleteGeofenceError({
    @_s.required this.error,
    @_s.required this.geofenceId,
  });
  factory BatchDeleteGeofenceError.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteGeofenceErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteGeofenceResponse {
  /// Contains error details for each geofence that failed to delete.
  @_s.JsonKey(name: 'Errors')
  final List<BatchDeleteGeofenceError> errors;

  BatchDeleteGeofenceResponse({
    @_s.required this.errors,
  });
  factory BatchDeleteGeofenceResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteGeofenceResponseFromJson(json);
}

/// Contains error details for each device that failed to evaluate its position
/// against the geofences in a given geofence collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchEvaluateGeofencesError {
  /// The device associated with the position evaluation error.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// Contains details associated to the batch error.
  @_s.JsonKey(name: 'Error')
  final BatchItemError error;

  /// Specifies a timestamp for when the error occurred in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SampleTime')
  final DateTime sampleTime;

  BatchEvaluateGeofencesError({
    @_s.required this.deviceId,
    @_s.required this.error,
    @_s.required this.sampleTime,
  });
  factory BatchEvaluateGeofencesError.fromJson(Map<String, dynamic> json) =>
      _$BatchEvaluateGeofencesErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchEvaluateGeofencesResponse {
  /// Contains error details for each device that failed to evaluate its position
  /// against the given geofence collection.
  @_s.JsonKey(name: 'Errors')
  final List<BatchEvaluateGeofencesError> errors;

  BatchEvaluateGeofencesResponse({
    @_s.required this.errors,
  });
  factory BatchEvaluateGeofencesResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchEvaluateGeofencesResponseFromJson(json);
}

/// Contains error details for each device that didn't return a position.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDevicePositionError {
  /// The ID of the device that didn't return a position.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// Contains details related to the error code.
  @_s.JsonKey(name: 'Error')
  final BatchItemError error;

  BatchGetDevicePositionError({
    @_s.required this.deviceId,
    @_s.required this.error,
  });
  factory BatchGetDevicePositionError.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDevicePositionErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDevicePositionResponse {
  /// Contains device position details such as the device ID, position, and
  /// timestamps for when the position was received and sampled.
  @_s.JsonKey(name: 'DevicePositions')
  final List<DevicePosition> devicePositions;

  /// Contains error details for each device that failed to send its position to
  /// the tracker resource.
  @_s.JsonKey(name: 'Errors')
  final List<BatchGetDevicePositionError> errors;

  BatchGetDevicePositionResponse({
    @_s.required this.devicePositions,
    @_s.required this.errors,
  });
  factory BatchGetDevicePositionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDevicePositionResponseFromJson(json);
}

/// Contains the batch request error details associated with the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchItemError {
  /// The error code associated with the batch request error.
  @_s.JsonKey(name: 'Code')
  final BatchItemErrorCode code;

  /// A message with the reason for the batch request error.
  @_s.JsonKey(name: 'Message')
  final String message;

  BatchItemError({
    this.code,
    this.message,
  });
  factory BatchItemError.fromJson(Map<String, dynamic> json) =>
      _$BatchItemErrorFromJson(json);
}

enum BatchItemErrorCode {
  @_s.JsonValue('AccessDeniedError')
  accessDeniedError,
  @_s.JsonValue('ConflictError')
  conflictError,
  @_s.JsonValue('InternalServerError')
  internalServerError,
  @_s.JsonValue('ResourceNotFoundError')
  resourceNotFoundError,
  @_s.JsonValue('ThrottlingError')
  throttlingError,
  @_s.JsonValue('ValidationError')
  validationError,
}

/// Contains error details for each geofence that failed to be stored in a given
/// geofence collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutGeofenceError {
  /// Contains details associated to the batch error.
  @_s.JsonKey(name: 'Error')
  final BatchItemError error;

  /// The geofence associated with the error message.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  BatchPutGeofenceError({
    @_s.required this.error,
    @_s.required this.geofenceId,
  });
  factory BatchPutGeofenceError.fromJson(Map<String, dynamic> json) =>
      _$BatchPutGeofenceErrorFromJson(json);
}

/// Contains geofence details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchPutGeofenceRequestEntry {
  /// The identifier for the geofence to be stored in a given geofence collection.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  /// The geometry details for the geofence.
  @_s.JsonKey(name: 'Geometry')
  final GeofenceGeometry geometry;

  BatchPutGeofenceRequestEntry({
    @_s.required this.geofenceId,
    @_s.required this.geometry,
  });
  Map<String, dynamic> toJson() => _$BatchPutGeofenceRequestEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutGeofenceResponse {
  /// Contains additional error details for each geofence that failed to be stored
  /// in a geofence collection.
  @_s.JsonKey(name: 'Errors')
  final List<BatchPutGeofenceError> errors;

  /// Contains each geofence that was successfully stored in a geofence
  /// collection.
  @_s.JsonKey(name: 'Successes')
  final List<BatchPutGeofenceSuccess> successes;

  BatchPutGeofenceResponse({
    @_s.required this.errors,
    @_s.required this.successes,
  });
  factory BatchPutGeofenceResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchPutGeofenceResponseFromJson(json);
}

/// Contains a summary of each geofence that was successfully stored in a given
/// geofence collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutGeofenceSuccess {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The geofence successfully stored in a geofence collection.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  BatchPutGeofenceSuccess({
    @_s.required this.createTime,
    @_s.required this.geofenceId,
    @_s.required this.updateTime,
  });
  factory BatchPutGeofenceSuccess.fromJson(Map<String, dynamic> json) =>
      _$BatchPutGeofenceSuccessFromJson(json);
}

/// Contains error details for each device that failed to update its position.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateDevicePositionError {
  /// The device associated with the failed location update.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// Contains details related to the error code such as the error code and error
  /// message.
  @_s.JsonKey(name: 'Error')
  final BatchItemError error;

  /// The timestamp for when a position sample was attempted in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SampleTime')
  final DateTime sampleTime;

  BatchUpdateDevicePositionError({
    @_s.required this.deviceId,
    @_s.required this.error,
    @_s.required this.sampleTime,
  });
  factory BatchUpdateDevicePositionError.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateDevicePositionErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateDevicePositionResponse {
  /// Contains error details for each device that failed to update its position.
  @_s.JsonKey(name: 'Errors')
  final List<BatchUpdateDevicePositionError> errors;

  BatchUpdateDevicePositionResponse({
    @_s.required this.errors,
  });
  factory BatchUpdateDevicePositionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchUpdateDevicePositionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all AWS.
  @_s.JsonKey(name: 'CollectionArn')
  final String collectionArn;

  /// The name for the geofence collection.
  @_s.JsonKey(name: 'CollectionName')
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  CreateGeofenceCollectionResponse({
    @_s.required this.collectionArn,
    @_s.required this.collectionName,
    @_s.required this.createTime,
  });
  factory CreateGeofenceCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateGeofenceCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMapResponse {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the map resource. Used when you need to
  /// specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:partition:service:region:account-id:resource-type:resource-id</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MapArn')
  final String mapArn;

  /// The name of the map resource.
  @_s.JsonKey(name: 'MapName')
  final String mapName;

  CreateMapResponse({
    @_s.required this.createTime,
    @_s.required this.mapArn,
    @_s.required this.mapName,
  });
  factory CreateMapResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMapResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePlaceIndexResponse {
  /// The timestamp for when the Place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the Place index resource. Used when you
  /// need to specify a resource across all AWS.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// The name for the Place index resource.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  CreatePlaceIndexResponse({
    @_s.required this.createTime,
    @_s.required this.indexArn,
    @_s.required this.indexName,
  });
  factory CreatePlaceIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePlaceIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all AWS.
  @_s.JsonKey(name: 'TrackerArn')
  final String trackerArn;

  /// The name of the tracker resource.
  @_s.JsonKey(name: 'TrackerName')
  final String trackerName;

  CreateTrackerResponse({
    @_s.required this.createTime,
    @_s.required this.trackerArn,
    @_s.required this.trackerName,
  });
  factory CreateTrackerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTrackerResponseFromJson(json);
}

/// Specifies the data storage option chosen for requesting Places.
/// <note>
/// By using Places, you agree that AWS may transmit your API queries to your
/// selected third party provider for processing, which may be outside the AWS
/// region you are currently using.
///
/// Also, when using HERE as your data provider, you may not (a) use HERE Places
/// for Asset Management, or (b) select the <code>Storage</code> option for the
/// <code>IntendedUse</code> parameter when requesting Places in Japan. For more
/// information, see the <a href="https://aws.amazon.com/service-terms/">AWS
/// Service Terms</a> for Amazon Location Service.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceConfiguration {
  /// Specifies how the results of an operation will be stored by the caller.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>SingleUse</code> specifies that the results won't be stored.
  /// </li>
  /// <li>
  /// <code>Storage</code> specifies that the result can be cached or stored in a
  /// database.
  /// </li>
  /// </ul>
  /// Default value: <code>SingleUse</code>
  @_s.JsonKey(name: 'IntendedUse')
  final IntendedUse intendedUse;

  DataSourceConfiguration({
    this.intendedUse,
  });
  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DataSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGeofenceCollectionResponse {
  DeleteGeofenceCollectionResponse();
  factory DeleteGeofenceCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteGeofenceCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMapResponse {
  DeleteMapResponse();
  factory DeleteMapResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMapResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePlaceIndexResponse {
  DeletePlaceIndexResponse();
  factory DeletePlaceIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePlaceIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTrackerResponse {
  DeleteTrackerResponse();
  factory DeleteTrackerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTrackerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all AWS.
  @_s.JsonKey(name: 'CollectionArn')
  final String collectionArn;

  /// The name of the geofence collection.
  @_s.JsonKey(name: 'CollectionName')
  final String collectionName;

  /// The timestamp for when the geofence resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The optional description for the geofence collection.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  DescribeGeofenceCollectionResponse({
    @_s.required this.collectionArn,
    @_s.required this.collectionName,
    @_s.required this.createTime,
    @_s.required this.description,
    @_s.required this.updateTime,
  });
  factory DescribeGeofenceCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGeofenceCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMapResponse {
  /// Specifies the map tile style selected from a partner data provider.
  @_s.JsonKey(name: 'Configuration')
  final MapConfiguration configuration;

  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The optional description for the map resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) for the map resource. Used when you need to
  /// specify a resource across all AWS.
  @_s.JsonKey(name: 'MapArn')
  final String mapArn;

  /// The map style selected from an available provider.
  @_s.JsonKey(name: 'MapName')
  final String mapName;

  /// The timestamp for when the map resource was last update in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  DescribeMapResponse({
    @_s.required this.configuration,
    @_s.required this.createTime,
    @_s.required this.dataSource,
    @_s.required this.description,
    @_s.required this.mapArn,
    @_s.required this.mapName,
    @_s.required this.updateTime,
  });
  factory DescribeMapResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeMapResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePlaceIndexResponse {
  /// The timestamp for when the Place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The data provider of geospatial data.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The specified data storage option for requesting Places.
  @_s.JsonKey(name: 'DataSourceConfiguration')
  final DataSourceConfiguration dataSourceConfiguration;

  /// The optional description for the Place index resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) for the Place index resource. Used when you
  /// need to specify a resource across all AWS.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// The name of the Place index resource being described.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The timestamp for when the Place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  DescribePlaceIndexResponse({
    @_s.required this.createTime,
    @_s.required this.dataSource,
    @_s.required this.dataSourceConfiguration,
    @_s.required this.description,
    @_s.required this.indexArn,
    @_s.required this.indexName,
    @_s.required this.updateTime,
  });
  factory DescribePlaceIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePlaceIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The optional description for the tracker resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all AWS.
  @_s.JsonKey(name: 'TrackerArn')
  final String trackerArn;

  /// The name of the tracker resource.
  @_s.JsonKey(name: 'TrackerName')
  final String trackerName;

  /// The timestamp for when the tracker resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  DescribeTrackerResponse({
    @_s.required this.createTime,
    @_s.required this.description,
    @_s.required this.trackerArn,
    @_s.required this.trackerName,
    @_s.required this.updateTime,
  });
  factory DescribeTrackerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTrackerResponseFromJson(json);
}

/// Contains the device position details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DevicePosition {
  /// The last known device position.
  @_s.JsonKey(name: 'Position')
  final List<double> position;

  /// The timestamp for when the tracker resource recieved the position in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ReceivedTime')
  final DateTime receivedTime;

  /// The timestamp for when the position was detected and sampled in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SampleTime')
  final DateTime sampleTime;

  /// The device whose position you retrieved.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  DevicePosition({
    @_s.required this.position,
    @_s.required this.receivedTime,
    @_s.required this.sampleTime,
    this.deviceId,
  });
  factory DevicePosition.fromJson(Map<String, dynamic> json) =>
      _$DevicePositionFromJson(json);
}

/// Contains the position update details for a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DevicePositionUpdate {
  /// The device associated to the position update.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The latest device position defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format:
  /// <code>[Xlongitude, Ylatitude]</code>.
  @_s.JsonKey(name: 'Position')
  final List<double> position;

  /// The timestamp for when the position update was received in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SampleTime')
  final DateTime sampleTime;

  DevicePositionUpdate({
    @_s.required this.deviceId,
    @_s.required this.position,
    @_s.required this.sampleTime,
  });
  Map<String, dynamic> toJson() => _$DevicePositionUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateTrackerConsumerResponse {
  DisassociateTrackerConsumerResponse();
  factory DisassociateTrackerConsumerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateTrackerConsumerResponseFromJson(json);
}

/// Contains the geofence geometry details.
/// <note>
/// Limitation — Amazon Location does not currently support polygons with holes,
/// multipolygons, polygons that are wound clockwise, or that cross the
/// antimeridian.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GeofenceGeometry {
  /// An array of 1 or more linear rings. A linear ring is an array of 4 or more
  /// vertices, where the first and last vertex are the same to form a closed
  /// boundary. Each vertex is a 2-dimensional point of the form:
  /// <code>[longitude, latitude]</code>.
  ///
  /// The first linear ring is an outer ring, describing the polygon's boundary.
  /// Subsequent linear rings may be inner or outer rings to describe holes and
  /// islands. Outer rings must list their vertices in counter-clockwise order
  /// around the ring's center, where the left side is the polygon's exterior.
  /// Inner rings must list their vertices in clockwise order, where the left side
  /// is the polygon's interior.
  @_s.JsonKey(name: 'Polygon')
  final List<List<List<double>>> polygon;

  GeofenceGeometry({
    this.polygon,
  });
  factory GeofenceGeometry.fromJson(Map<String, dynamic> json) =>
      _$GeofenceGeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeofenceGeometryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicePositionHistoryResponse {
  /// Contains the position history details for the requested device.
  @_s.JsonKey(name: 'DevicePositions')
  final List<DevicePosition> devicePositions;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDevicePositionHistoryResponse({
    @_s.required this.devicePositions,
    this.nextToken,
  });
  factory GetDevicePositionHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDevicePositionHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicePositionResponse {
  /// The last known device position.
  @_s.JsonKey(name: 'Position')
  final List<double> position;

  /// The timestamp for when the tracker resource recieved the position in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ReceivedTime')
  final DateTime receivedTime;

  /// The timestamp for when the position was detected and sampled in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SampleTime')
  final DateTime sampleTime;

  /// The device whose position you retrieved.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  GetDevicePositionResponse({
    @_s.required this.position,
    @_s.required this.receivedTime,
    @_s.required this.sampleTime,
    this.deviceId,
  });
  factory GetDevicePositionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevicePositionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGeofenceResponse {
  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The geofence identifier.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  /// Contains the geofence geometry details describing a polygon.
  @_s.JsonKey(name: 'Geometry')
  final GeofenceGeometry geometry;

  /// Identifies the state of the geofence. A geofence will hold one of the
  /// following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> — The geofence has been indexed by the system.
  /// </li>
  /// <li>
  /// <code>PENDING</code> — The geofence is being processed by the system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> — The geofence failed to be indexed by the system.
  /// </li>
  /// <li>
  /// <code>DELETED</code> — The geofence has been deleted from the system index.
  /// </li>
  /// <li>
  /// <code>DELETING</code> — The geofence is being deleted from the system index.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  GetGeofenceResponse({
    @_s.required this.createTime,
    @_s.required this.geofenceId,
    @_s.required this.geometry,
    @_s.required this.status,
    @_s.required this.updateTime,
  });
  factory GetGeofenceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGeofenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMapGlyphsResponse {
  /// The blob's content type.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Blob')
  final Uint8List blob;

  /// The map glyph content type. For example,
  /// <code>application/octet-stream</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  GetMapGlyphsResponse({
    this.blob,
    this.contentType,
  });
  factory GetMapGlyphsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMapGlyphsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMapSpritesResponse {
  /// Contains the body of the sprite sheet or JSON offset ﬁle.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Blob')
  final Uint8List blob;

  /// The content type of the sprite sheet and offsets. For example, the sprite
  /// sheet content type is <code>image/png</code>, and the sprite offset JSON
  /// document is <code>application/json</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  GetMapSpritesResponse({
    this.blob,
    this.contentType,
  });
  factory GetMapSpritesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMapSpritesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMapStyleDescriptorResponse {
  /// Contains the body of the style descriptor.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Blob')
  final Uint8List blob;

  /// The style descriptor's content type. For example,
  /// <code>application/json</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  GetMapStyleDescriptorResponse({
    this.blob,
    this.contentType,
  });
  factory GetMapStyleDescriptorResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMapStyleDescriptorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMapTileResponse {
  /// Contains Mapbox Vector Tile (MVT) data.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Blob')
  final Uint8List blob;

  /// The map tile's content type. For example,
  /// <code>application/vnd.mapbox-vector-tile</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  GetMapTileResponse({
    this.blob,
    this.contentType,
  });
  factory GetMapTileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMapTileResponseFromJson(json);
}

enum IntendedUse {
  @_s.JsonValue('SingleUse')
  singleUse,
  @_s.JsonValue('Storage')
  storage,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGeofenceCollectionsResponse {
  /// Lists the geofence collections that exist in your AWS account.
  @_s.JsonKey(name: 'Entries')
  final List<ListGeofenceCollectionsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGeofenceCollectionsResponse({
    @_s.required this.entries,
    this.nextToken,
  });
  factory ListGeofenceCollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGeofenceCollectionsResponseFromJson(json);
}

/// Contains the geofence collection details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGeofenceCollectionsResponseEntry {
  /// The name of the geofence collection.
  @_s.JsonKey(name: 'CollectionName')
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The description for the geofence collection
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Specifies a timestamp for when the resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ListGeofenceCollectionsResponseEntry({
    @_s.required this.collectionName,
    @_s.required this.createTime,
    @_s.required this.description,
    @_s.required this.updateTime,
  });
  factory ListGeofenceCollectionsResponseEntry.fromJson(
          Map<String, dynamic> json) =>
      _$ListGeofenceCollectionsResponseEntryFromJson(json);
}

/// Contains a list of geofences stored in a given geofence collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGeofenceResponseEntry {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The geofence identifier.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  /// Contains the geofence geometry details describing a polygon.
  @_s.JsonKey(name: 'Geometry')
  final GeofenceGeometry geometry;

  /// Identifies the state of the geofence. A geofence will hold one of the
  /// following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> — The geofence has been indexed by the system.
  /// </li>
  /// <li>
  /// <code>PENDING</code> — The geofence is being processed by the system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> — The geofence failed to be indexed by the system.
  /// </li>
  /// <li>
  /// <code>DELETED</code> — The geofence has been deleted from the system index.
  /// </li>
  /// <li>
  /// <code>DELETING</code> — The geofence is being deleted from the system index.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ListGeofenceResponseEntry({
    @_s.required this.createTime,
    @_s.required this.geofenceId,
    @_s.required this.geometry,
    @_s.required this.status,
    @_s.required this.updateTime,
  });
  factory ListGeofenceResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$ListGeofenceResponseEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGeofencesResponse {
  /// Contains a list of geofences stored in the geofence collection.
  @_s.JsonKey(name: 'Entries')
  final List<ListGeofenceResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGeofencesResponse({
    @_s.required this.entries,
    this.nextToken,
  });
  factory ListGeofencesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGeofencesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMapsResponse {
  /// Contains a list of maps in your AWS account
  @_s.JsonKey(name: 'Entries')
  final List<ListMapsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMapsResponse({
    @_s.required this.entries,
    this.nextToken,
  });
  factory ListMapsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMapsResponseFromJson(json);
}

/// Contains details of an existing map resource in your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMapsResponseEntry {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The description for the map resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the associated map resource.
  @_s.JsonKey(name: 'MapName')
  final String mapName;

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ListMapsResponseEntry({
    @_s.required this.createTime,
    @_s.required this.dataSource,
    @_s.required this.description,
    @_s.required this.mapName,
    @_s.required this.updateTime,
  });
  factory ListMapsResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$ListMapsResponseEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPlaceIndexesResponse {
  /// Lists the Place index resources that exist in your AWS account
  @_s.JsonKey(name: 'Entries')
  final List<ListPlaceIndexesResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListPlaceIndexesResponse({
    @_s.required this.entries,
    this.nextToken,
  });
  factory ListPlaceIndexesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPlaceIndexesResponseFromJson(json);
}

/// A Place index resource listed in your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPlaceIndexesResponseEntry {
  /// The timestamp for when the Place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The data provider of geospatial data.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The optional description for the Place index resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the Place index resource.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The timestamp for when the Place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ListPlaceIndexesResponseEntry({
    @_s.required this.createTime,
    @_s.required this.dataSource,
    @_s.required this.description,
    @_s.required this.indexName,
    @_s.required this.updateTime,
  });
  factory ListPlaceIndexesResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$ListPlaceIndexesResponseEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrackerConsumersResponse {
  /// Contains the list of geofence collection ARNs associated to the tracker
  /// resource.
  @_s.JsonKey(name: 'ConsumerArns')
  final List<String> consumerArns;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTrackerConsumersResponse({
    @_s.required this.consumerArns,
    this.nextToken,
  });
  factory ListTrackerConsumersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTrackerConsumersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrackersResponse {
  /// Contains tracker resources in your AWS account. Details include tracker
  /// name, description and timestamps for when the tracker was created and last
  /// updated.
  @_s.JsonKey(name: 'Entries')
  final List<ListTrackersResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTrackersResponse({
    @_s.required this.entries,
    this.nextToken,
  });
  factory ListTrackersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTrackersResponseFromJson(json);
}

/// Contains the tracker resource details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrackersResponseEntry {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The description for the tracker resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the tracker resource.
  @_s.JsonKey(name: 'TrackerName')
  final String trackerName;

  /// The timestamp for when the position was detected and sampled in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ListTrackersResponseEntry({
    @_s.required this.createTime,
    @_s.required this.description,
    @_s.required this.trackerName,
    @_s.required this.updateTime,
  });
  factory ListTrackersResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$ListTrackersResponseEntryFromJson(json);
}

/// Specifies the map tile style selected from an available provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MapConfiguration {
  /// Specifies the map style selected from an available data provider.
  ///
  /// Valid styles: <code>VectorEsriLightGrayCanvas</code>,
  /// <code>VectorEsriLight</code>, <code>VectorEsriStreets</code>,
  /// <code>VectorEsriNavigation</code>, <code>VectorEsriDarkGrayCanvas</code>,
  /// <code>VectorEsriLightGrayCanvas</code>, <code>VectorHereBerlin</code>
  /// <note>
  /// When using HERE as your data provider, and selecting the Style
  /// <code>VectorHereBerlin</code>, you may not use HERE Maps for Asset
  /// Management. See the <a href="https://aws.amazon.com/service-terms/">AWS
  /// Service Terms</a> for Amazon Location Service.
  /// </note>
  @_s.JsonKey(name: 'Style')
  final String style;

  MapConfiguration({
    @_s.required this.style,
  });
  factory MapConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MapConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MapConfigurationToJson(this);
}

/// Contains details about addresses or points of interest that match the search
/// criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Place {
  @_s.JsonKey(name: 'Geometry')
  final PlaceGeometry geometry;

  /// The numerical portion of an address, such as a building number.
  @_s.JsonKey(name: 'AddressNumber')
  final String addressNumber;

  /// A country/region specified using <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit
  /// country/region code. For example, <code>CAN</code>.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The full name and address of the point of interest such as a city, region,
  /// or country. For example, <code>123 Any Street, Any Town, USA</code>.
  @_s.JsonKey(name: 'Label')
  final String label;

  /// A name for a local area, such as a city or town name. For example,
  /// <code>Toronto</code>.
  @_s.JsonKey(name: 'Municipality')
  final String municipality;

  /// The name of a community district. For example, <code>Downtown</code>.
  @_s.JsonKey(name: 'Neighborhood')
  final String neighborhood;

  /// A group of numbers and letters in a country-specific format, which
  /// accompanies the address for the purpose of identifying a location.
  @_s.JsonKey(name: 'PostalCode')
  final String postalCode;

  /// A name for an area or geographical division, such as a province or state
  /// name. For example, <code>British Columbia</code>.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The name for a street or a road to identify a location. For example,
  /// <code>Main Street</code>.
  @_s.JsonKey(name: 'Street')
  final String street;

  /// A country, or an area that's part of a larger region . For example,
  /// <code>Metro Vancouver</code>.
  @_s.JsonKey(name: 'SubRegion')
  final String subRegion;

  Place({
    @_s.required this.geometry,
    this.addressNumber,
    this.country,
    this.label,
    this.municipality,
    this.neighborhood,
    this.postalCode,
    this.region,
    this.street,
    this.subRegion,
  });
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

/// Places uses a point geometry to specify a location or a Place.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlaceGeometry {
  /// A single point geometry specifies a location for a Place using <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a>
  /// coordinates:
  ///
  /// <ul>
  /// <li>
  /// <i>x</i> — Specifies the x coordinate or longitude.
  /// </li>
  /// <li>
  /// <i>y</i> — Specifies the y coordinate or latitude.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Point')
  final List<double> point;

  PlaceGeometry({
    this.point,
  });
  factory PlaceGeometry.fromJson(Map<String, dynamic> json) =>
      _$PlaceGeometryFromJson(json);
}

enum PricingPlan {
  @_s.JsonValue('RequestBasedUsage')
  requestBasedUsage,
  @_s.JsonValue('MobileAssetTracking')
  mobileAssetTracking,
  @_s.JsonValue('MobileAssetManagement')
  mobileAssetManagement,
}

extension on PricingPlan {
  String toValue() {
    switch (this) {
      case PricingPlan.requestBasedUsage:
        return 'RequestBasedUsage';
      case PricingPlan.mobileAssetTracking:
        return 'MobileAssetTracking';
      case PricingPlan.mobileAssetManagement:
        return 'MobileAssetManagement';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutGeofenceResponse {
  /// The timestamp for when the geofence was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The geofence identifier entered in the request.
  @_s.JsonKey(name: 'GeofenceId')
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  PutGeofenceResponse({
    @_s.required this.createTime,
    @_s.required this.geofenceId,
    @_s.required this.updateTime,
  });
  factory PutGeofenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PutGeofenceResponseFromJson(json);
}

/// Specifies a single point of interest, or Place as a result of a search query
/// obtained from a dataset configured in the Place index Resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchForPositionResult {
  /// Contains details about the relevant point of interest.
  @_s.JsonKey(name: 'Place')
  final Place place;

  SearchForPositionResult({
    @_s.required this.place,
  });
  factory SearchForPositionResult.fromJson(Map<String, dynamic> json) =>
      _$SearchForPositionResultFromJson(json);
}

/// Contains relevant Places returned by calling
/// <code>SearchPlaceIndexForText</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchForTextResult {
  /// Contains details about the relevant point of interest.
  @_s.JsonKey(name: 'Place')
  final Place place;

  SearchForTextResult({
    @_s.required this.place,
  });
  factory SearchForTextResult.fromJson(Map<String, dynamic> json) =>
      _$SearchForTextResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchPlaceIndexForPositionResponse {
  /// Returns a list of Places closest to the specified position. Each result
  /// contains additional information about the Places returned.
  @_s.JsonKey(name: 'Results')
  final List<SearchForPositionResult> results;

  /// Contains a summary of the request.
  @_s.JsonKey(name: 'Summary')
  final SearchPlaceIndexForPositionSummary summary;

  SearchPlaceIndexForPositionResponse({
    @_s.required this.results,
    @_s.required this.summary,
  });
  factory SearchPlaceIndexForPositionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SearchPlaceIndexForPositionResponseFromJson(json);
}

/// A summary of the reverse geocoding request sent using
/// <code>SearchPlaceIndexForPosition</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchPlaceIndexForPositionSummary {
  /// The data provider of geospatial data for the Place index resource.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The position given in the reverse geocoding request.
  @_s.JsonKey(name: 'Position')
  final List<double> position;

  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// Default value: <code>50</code>
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  SearchPlaceIndexForPositionSummary({
    @_s.required this.dataSource,
    @_s.required this.position,
    this.maxResults,
  });
  factory SearchPlaceIndexForPositionSummary.fromJson(
          Map<String, dynamic> json) =>
      _$SearchPlaceIndexForPositionSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchPlaceIndexForTextResponse {
  /// A list of Places closest to the specified position. Each result contains
  /// additional information about the specific point of interest.
  @_s.JsonKey(name: 'Results')
  final List<SearchForTextResult> results;

  /// Contains a summary of the request. Contains the <code>BiasPosition</code>,
  /// <code>DataSource</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>MaxResults</code>,
  /// <code>ResultBBox</code>, and <code>Text</code>.
  @_s.JsonKey(name: 'Summary')
  final SearchPlaceIndexForTextSummary summary;

  SearchPlaceIndexForTextResponse({
    @_s.required this.results,
    @_s.required this.summary,
  });
  factory SearchPlaceIndexForTextResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaceIndexForTextResponseFromJson(json);
}

/// A summary of the geocoding request sent using
/// <code>SearchPlaceIndexForText</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchPlaceIndexForTextSummary {
  /// The data provider of geospatial data for the Place index resource.
  @_s.JsonKey(name: 'DataSource')
  final String dataSource;

  /// The address, name, city or region to be used in the geocoding request. In
  /// free-form text format. For example, <code>Vancouver</code>.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Contains the coordinates for the bias position entered in the geocoding
  /// request.
  @_s.JsonKey(name: 'BiasPosition')
  final List<double> biasPosition;

  /// Contains the coordinates for the optional bounding box coordinated entered
  /// in the geocoding request.
  @_s.JsonKey(name: 'FilterBBox')
  final List<double> filterBBox;

  /// Contains the country filter entered in the geocoding request.
  @_s.JsonKey(name: 'FilterCountries')
  final List<String> filterCountries;

  /// Contains the maximum number of results indicated for the request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A bounding box that contains the search results within the specified area
  /// indicated by <code>FilterBBox</code>. A subset of bounding box specified
  /// using <code>FilterBBox</code>.
  @_s.JsonKey(name: 'ResultBBox')
  final List<double> resultBBox;

  SearchPlaceIndexForTextSummary({
    @_s.required this.dataSource,
    @_s.required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCountries,
    this.maxResults,
    this.resultBBox,
  });
  factory SearchPlaceIndexForTextSummary.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaceIndexForTextSummaryFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
